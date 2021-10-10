*** Variables ***
#Login page
${txt_login_hp}                             id:sign-in-phonenumber
${txt_login_email}                          id:sign-in-email
${txt_login_password}                       id:password
${tab_email}                                xpath://div[@class='text-block-22']
${btn_login_masuk}                          id:submit-btn-signin
${qasir_beranda}                            id:DashboardInstance
${warning_hp}                               id:sign-in-phonenumber-error
${warning_password}                         id:password-error
${invalid_login}                            xpath://div[@id='modal-information-body']

#Outlet page
${outlet_qasir_name}                         id:searchinput
${outlet_qasir_telepon}                      id:searchinput2
${outlet_qasir_lokasi}                       id:searchinput3
${outlet_menu}                               xpath=//a[@href='https://usahaku-585620.qasir.id/outlets']//p[contains(text(),'Outlet')]

#Profile page
${btn_profile}                               xpath=//div[@class='user-image new-user-image']/img[@alt='Firda Automation']
${profile_pengguna}                          xpath=//a[@href='https://usahaku-585620.qasir.id/account/profile']
${profile_first_name}                        xpath=//input[@name='first_name']
${profile_last_name}                         xpath=//input[@name='last_name']
${profile_phone_number}                      xpath=//input[@name='mobile']
${profile_email}                             xpath=//input[@name='email']
${profile_refferal_code}                     xpath=//input[@name='referral_code']
${profile_old_pin}                           id:old-pin
${profile_new_pin}                           id:new-pin
${profile_confirm_pin}                       id:confirm-pin
${profile_terapkan_foto}                     xpath=//button[@class='button button-small button-secondary btn-block']
${btn_profile_save}                          xpath=//button[@class='button button-small button-secondary'][contains(text(),'Simpan')]
${btn_logout}                                xpath=//a[@href='https://usahaku-585620.qasir.id/logout']
${message_success}                           xpath=//p[contains(text(),'Data berhasil disimpan. ')]
${btn_ganti_pin}                             xpath=//button[@class='button button-small button-secondary'][contains(text(),'Ganti PIN')]
${profile_warning_first_name}                xpath=//p[contains(text(),'Nama Depan wajib diisi.')]
${profile_warning_hp_0}                      xpath=//p[contains(text(),'Nomor harus minimal 10 digit dan maksimal 15 digit')]
${profile_warning_hp_alphabet}               xpath=//p[contains(text(),'Nomor Telepon harus berupa angka.')]
${profile_warning_refferal_code}             xpath=//p[contains(text(),'Referral Code Yang Anda Masukkan Salah / Tidak Tersedia')]
${profile_warning_invalid_old_pin}           xpath=//p[contains(text(),'PIN Lama yang dimasukkan salah')]
${profile_warning_invalid_old_pin_1}         xpath=//p[contains(text(),'PIN Lama harus berupa angka.')]
${profile_warning_wrong_combination}         xpath=//p[contains(text(),'Konfirmasi PIN Baru tidak cocok.')]
${profile_warning_invalid_new_pin}           xpath=//p[contains(text(),'PIN Baru yang dimasukkan salah')]