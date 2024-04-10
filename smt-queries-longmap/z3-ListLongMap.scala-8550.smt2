; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104388 () Bool)

(assert start!104388)

(declare-fun b!1246196 () Bool)

(declare-fun res!831586 () Bool)

(declare-fun e!706731 () Bool)

(assert (=> b!1246196 (=> (not res!831586) (not e!706731))))

(declare-datatypes ((List!27491 0))(
  ( (Nil!27488) (Cons!27487 (h!28696 (_ BitVec 64)) (t!40960 List!27491)) )
))
(declare-fun lt!563030 () List!27491)

(declare-fun contains!7457 (List!27491 (_ BitVec 64)) Bool)

(assert (=> b!1246196 (= res!831586 (not (contains!7457 lt!563030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246197 () Bool)

(declare-fun res!831594 () Bool)

(assert (=> b!1246197 (=> (not res!831594) (not e!706731))))

(declare-fun subseq!657 (List!27491 List!27491) Bool)

(assert (=> b!1246197 (= res!831594 (subseq!657 Nil!27488 lt!563030))))

(declare-fun b!1246198 () Bool)

(declare-fun e!706732 () Bool)

(assert (=> b!1246198 (= e!706732 e!706731)))

(declare-fun res!831589 () Bool)

(assert (=> b!1246198 (=> (not res!831589) (not e!706731))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246198 (= res!831589 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!80219 0))(
  ( (array!80220 (arr!38688 (Array (_ BitVec 32) (_ BitVec 64))) (size!39224 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80219)

(assert (=> b!1246198 (= lt!563030 (Cons!27487 (select (arr!38688 a!3892) from!3270) Nil!27488))))

(declare-fun b!1246199 () Bool)

(declare-fun res!831588 () Bool)

(assert (=> b!1246199 (=> (not res!831588) (not e!706732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246199 (= res!831588 (validKeyInArray!0 (select (arr!38688 a!3892) from!3270)))))

(declare-fun b!1246200 () Bool)

(declare-fun res!831593 () Bool)

(assert (=> b!1246200 (=> (not res!831593) (not e!706731))))

(declare-fun noDuplicate!2036 (List!27491) Bool)

(assert (=> b!1246200 (= res!831593 (noDuplicate!2036 lt!563030))))

(declare-fun res!831585 () Bool)

(assert (=> start!104388 (=> (not res!831585) (not e!706732))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104388 (= res!831585 (and (bvslt (size!39224 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39224 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39224 a!3892))))))

(assert (=> start!104388 e!706732))

(declare-fun array_inv!29536 (array!80219) Bool)

(assert (=> start!104388 (array_inv!29536 a!3892)))

(assert (=> start!104388 true))

(declare-fun b!1246201 () Bool)

(declare-fun res!831590 () Bool)

(assert (=> b!1246201 (=> (not res!831590) (not e!706731))))

(assert (=> b!1246201 (= res!831590 (not (contains!7457 Nil!27488 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246202 () Bool)

(declare-fun res!831595 () Bool)

(assert (=> b!1246202 (=> (not res!831595) (not e!706732))))

(assert (=> b!1246202 (= res!831595 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39224 a!3892)) (not (= newFrom!287 (size!39224 a!3892)))))))

(declare-fun b!1246203 () Bool)

(declare-fun res!831587 () Bool)

(assert (=> b!1246203 (=> (not res!831587) (not e!706731))))

(assert (=> b!1246203 (= res!831587 (not (contains!7457 lt!563030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246204 () Bool)

(declare-fun res!831592 () Bool)

(assert (=> b!1246204 (=> (not res!831592) (not e!706731))))

(assert (=> b!1246204 (= res!831592 (not (contains!7457 Nil!27488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246205 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80219 (_ BitVec 32) List!27491) Bool)

(assert (=> b!1246205 (= e!706731 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563030)))))

(declare-datatypes ((Unit!41398 0))(
  ( (Unit!41399) )
))
(declare-fun lt!563031 () Unit!41398)

(declare-fun noDuplicateSubseq!108 (List!27491 List!27491) Unit!41398)

(assert (=> b!1246205 (= lt!563031 (noDuplicateSubseq!108 Nil!27488 lt!563030))))

(declare-fun b!1246206 () Bool)

(declare-fun res!831591 () Bool)

(assert (=> b!1246206 (=> (not res!831591) (not e!706732))))

(assert (=> b!1246206 (= res!831591 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27488))))

(assert (= (and start!104388 res!831585) b!1246206))

(assert (= (and b!1246206 res!831591) b!1246202))

(assert (= (and b!1246202 res!831595) b!1246199))

(assert (= (and b!1246199 res!831588) b!1246198))

(assert (= (and b!1246198 res!831589) b!1246200))

(assert (= (and b!1246200 res!831593) b!1246203))

(assert (= (and b!1246203 res!831587) b!1246196))

(assert (= (and b!1246196 res!831586) b!1246204))

(assert (= (and b!1246204 res!831592) b!1246201))

(assert (= (and b!1246201 res!831590) b!1246197))

(assert (= (and b!1246197 res!831594) b!1246205))

(declare-fun m!1148069 () Bool)

(assert (=> start!104388 m!1148069))

(declare-fun m!1148071 () Bool)

(assert (=> b!1246204 m!1148071))

(declare-fun m!1148073 () Bool)

(assert (=> b!1246203 m!1148073))

(declare-fun m!1148075 () Bool)

(assert (=> b!1246201 m!1148075))

(declare-fun m!1148077 () Bool)

(assert (=> b!1246205 m!1148077))

(declare-fun m!1148079 () Bool)

(assert (=> b!1246205 m!1148079))

(declare-fun m!1148081 () Bool)

(assert (=> b!1246200 m!1148081))

(declare-fun m!1148083 () Bool)

(assert (=> b!1246206 m!1148083))

(declare-fun m!1148085 () Bool)

(assert (=> b!1246198 m!1148085))

(declare-fun m!1148087 () Bool)

(assert (=> b!1246197 m!1148087))

(declare-fun m!1148089 () Bool)

(assert (=> b!1246196 m!1148089))

(assert (=> b!1246199 m!1148085))

(assert (=> b!1246199 m!1148085))

(declare-fun m!1148091 () Bool)

(assert (=> b!1246199 m!1148091))

(check-sat (not b!1246205) (not b!1246200) (not b!1246201) (not b!1246203) (not start!104388) (not b!1246204) (not b!1246197) (not b!1246196) (not b!1246206) (not b!1246199))
(check-sat)
(get-model)

(declare-fun d!137579 () Bool)

(declare-fun lt!563043 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!631 (List!27491) (InoxSet (_ BitVec 64)))

(assert (=> d!137579 (= lt!563043 (select (content!631 Nil!27488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706753 () Bool)

(assert (=> d!137579 (= lt!563043 e!706753)))

(declare-fun res!831639 () Bool)

(assert (=> d!137579 (=> (not res!831639) (not e!706753))))

(get-info :version)

(assert (=> d!137579 (= res!831639 ((_ is Cons!27487) Nil!27488))))

(assert (=> d!137579 (= (contains!7457 Nil!27488 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563043)))

(declare-fun b!1246250 () Bool)

(declare-fun e!706754 () Bool)

(assert (=> b!1246250 (= e!706753 e!706754)))

(declare-fun res!831640 () Bool)

(assert (=> b!1246250 (=> res!831640 e!706754)))

(assert (=> b!1246250 (= res!831640 (= (h!28696 Nil!27488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246251 () Bool)

(assert (=> b!1246251 (= e!706754 (contains!7457 (t!40960 Nil!27488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137579 res!831639) b!1246250))

(assert (= (and b!1246250 (not res!831640)) b!1246251))

(declare-fun m!1148123 () Bool)

(assert (=> d!137579 m!1148123))

(declare-fun m!1148125 () Bool)

(assert (=> d!137579 m!1148125))

(declare-fun m!1148127 () Bool)

(assert (=> b!1246251 m!1148127))

(assert (=> b!1246204 d!137579))

(declare-fun d!137585 () Bool)

(declare-fun lt!563044 () Bool)

(assert (=> d!137585 (= lt!563044 (select (content!631 lt!563030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706755 () Bool)

(assert (=> d!137585 (= lt!563044 e!706755)))

(declare-fun res!831641 () Bool)

(assert (=> d!137585 (=> (not res!831641) (not e!706755))))

(assert (=> d!137585 (= res!831641 ((_ is Cons!27487) lt!563030))))

(assert (=> d!137585 (= (contains!7457 lt!563030 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563044)))

(declare-fun b!1246252 () Bool)

(declare-fun e!706756 () Bool)

(assert (=> b!1246252 (= e!706755 e!706756)))

(declare-fun res!831642 () Bool)

(assert (=> b!1246252 (=> res!831642 e!706756)))

(assert (=> b!1246252 (= res!831642 (= (h!28696 lt!563030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246253 () Bool)

(assert (=> b!1246253 (= e!706756 (contains!7457 (t!40960 lt!563030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137585 res!831641) b!1246252))

(assert (= (and b!1246252 (not res!831642)) b!1246253))

(declare-fun m!1148129 () Bool)

(assert (=> d!137585 m!1148129))

(declare-fun m!1148131 () Bool)

(assert (=> d!137585 m!1148131))

(declare-fun m!1148133 () Bool)

(assert (=> b!1246253 m!1148133))

(assert (=> b!1246203 d!137585))

(declare-fun d!137587 () Bool)

(assert (=> d!137587 (= (array_inv!29536 a!3892) (bvsge (size!39224 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104388 d!137587))

(declare-fun b!1246305 () Bool)

(declare-fun e!706806 () Bool)

(declare-fun e!706803 () Bool)

(assert (=> b!1246305 (= e!706806 e!706803)))

(declare-fun c!121995 () Bool)

(assert (=> b!1246305 (= c!121995 (validKeyInArray!0 (select (arr!38688 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137589 () Bool)

(declare-fun res!831686 () Bool)

(declare-fun e!706805 () Bool)

(assert (=> d!137589 (=> res!831686 e!706805)))

(assert (=> d!137589 (= res!831686 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39224 a!3892)))))

(assert (=> d!137589 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563030) e!706805)))

(declare-fun b!1246306 () Bool)

(declare-fun call!61521 () Bool)

(assert (=> b!1246306 (= e!706803 call!61521)))

(declare-fun b!1246307 () Bool)

(assert (=> b!1246307 (= e!706805 e!706806)))

(declare-fun res!831685 () Bool)

(assert (=> b!1246307 (=> (not res!831685) (not e!706806))))

(declare-fun e!706804 () Bool)

(assert (=> b!1246307 (= res!831685 (not e!706804))))

(declare-fun res!831684 () Bool)

(assert (=> b!1246307 (=> (not res!831684) (not e!706804))))

(assert (=> b!1246307 (= res!831684 (validKeyInArray!0 (select (arr!38688 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246308 () Bool)

(assert (=> b!1246308 (= e!706804 (contains!7457 lt!563030 (select (arr!38688 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun bm!61518 () Bool)

(assert (=> bm!61518 (= call!61521 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121995 (Cons!27487 (select (arr!38688 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) lt!563030) lt!563030)))))

(declare-fun b!1246309 () Bool)

(assert (=> b!1246309 (= e!706803 call!61521)))

(assert (= (and d!137589 (not res!831686)) b!1246307))

(assert (= (and b!1246307 res!831684) b!1246308))

(assert (= (and b!1246307 res!831685) b!1246305))

(assert (= (and b!1246305 c!121995) b!1246309))

(assert (= (and b!1246305 (not c!121995)) b!1246306))

(assert (= (or b!1246309 b!1246306) bm!61518))

(declare-fun m!1148157 () Bool)

(assert (=> b!1246305 m!1148157))

(assert (=> b!1246305 m!1148157))

(declare-fun m!1148159 () Bool)

(assert (=> b!1246305 m!1148159))

(assert (=> b!1246307 m!1148157))

(assert (=> b!1246307 m!1148157))

(assert (=> b!1246307 m!1148159))

(assert (=> b!1246308 m!1148157))

(assert (=> b!1246308 m!1148157))

(declare-fun m!1148161 () Bool)

(assert (=> b!1246308 m!1148161))

(assert (=> bm!61518 m!1148157))

(declare-fun m!1148163 () Bool)

(assert (=> bm!61518 m!1148163))

(assert (=> b!1246205 d!137589))

(declare-fun d!137609 () Bool)

(assert (=> d!137609 (noDuplicate!2036 Nil!27488)))

(declare-fun lt!563053 () Unit!41398)

(declare-fun choose!1843 (List!27491 List!27491) Unit!41398)

(assert (=> d!137609 (= lt!563053 (choose!1843 Nil!27488 lt!563030))))

(declare-fun e!706833 () Bool)

(assert (=> d!137609 e!706833))

(declare-fun res!831711 () Bool)

(assert (=> d!137609 (=> (not res!831711) (not e!706833))))

(assert (=> d!137609 (= res!831711 (subseq!657 Nil!27488 lt!563030))))

(assert (=> d!137609 (= (noDuplicateSubseq!108 Nil!27488 lt!563030) lt!563053)))

(declare-fun b!1246338 () Bool)

(assert (=> b!1246338 (= e!706833 (noDuplicate!2036 lt!563030))))

(assert (= (and d!137609 res!831711) b!1246338))

(declare-fun m!1148179 () Bool)

(assert (=> d!137609 m!1148179))

(declare-fun m!1148181 () Bool)

(assert (=> d!137609 m!1148181))

(assert (=> d!137609 m!1148087))

(assert (=> b!1246338 m!1148081))

(assert (=> b!1246205 d!137609))

(declare-fun d!137617 () Bool)

(declare-fun res!831724 () Bool)

(declare-fun e!706848 () Bool)

(assert (=> d!137617 (=> res!831724 e!706848)))

(assert (=> d!137617 (= res!831724 ((_ is Nil!27488) lt!563030))))

(assert (=> d!137617 (= (noDuplicate!2036 lt!563030) e!706848)))

(declare-fun b!1246355 () Bool)

(declare-fun e!706849 () Bool)

(assert (=> b!1246355 (= e!706848 e!706849)))

(declare-fun res!831725 () Bool)

(assert (=> b!1246355 (=> (not res!831725) (not e!706849))))

(assert (=> b!1246355 (= res!831725 (not (contains!7457 (t!40960 lt!563030) (h!28696 lt!563030))))))

(declare-fun b!1246356 () Bool)

(assert (=> b!1246356 (= e!706849 (noDuplicate!2036 (t!40960 lt!563030)))))

(assert (= (and d!137617 (not res!831724)) b!1246355))

(assert (= (and b!1246355 res!831725) b!1246356))

(declare-fun m!1148203 () Bool)

(assert (=> b!1246355 m!1148203))

(declare-fun m!1148205 () Bool)

(assert (=> b!1246356 m!1148205))

(assert (=> b!1246200 d!137617))

(declare-fun d!137625 () Bool)

(assert (=> d!137625 (= (validKeyInArray!0 (select (arr!38688 a!3892) from!3270)) (and (not (= (select (arr!38688 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38688 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246199 d!137625))

(declare-fun d!137627 () Bool)

(declare-fun lt!563057 () Bool)

(assert (=> d!137627 (= lt!563057 (select (content!631 Nil!27488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706852 () Bool)

(assert (=> d!137627 (= lt!563057 e!706852)))

(declare-fun res!831728 () Bool)

(assert (=> d!137627 (=> (not res!831728) (not e!706852))))

(assert (=> d!137627 (= res!831728 ((_ is Cons!27487) Nil!27488))))

(assert (=> d!137627 (= (contains!7457 Nil!27488 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563057)))

(declare-fun b!1246359 () Bool)

(declare-fun e!706853 () Bool)

(assert (=> b!1246359 (= e!706852 e!706853)))

(declare-fun res!831729 () Bool)

(assert (=> b!1246359 (=> res!831729 e!706853)))

(assert (=> b!1246359 (= res!831729 (= (h!28696 Nil!27488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246360 () Bool)

(assert (=> b!1246360 (= e!706853 (contains!7457 (t!40960 Nil!27488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137627 res!831728) b!1246359))

(assert (= (and b!1246359 (not res!831729)) b!1246360))

(assert (=> d!137627 m!1148123))

(declare-fun m!1148207 () Bool)

(assert (=> d!137627 m!1148207))

(declare-fun m!1148209 () Bool)

(assert (=> b!1246360 m!1148209))

(assert (=> b!1246201 d!137627))

(declare-fun d!137629 () Bool)

(declare-fun lt!563061 () Bool)

(assert (=> d!137629 (= lt!563061 (select (content!631 lt!563030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706857 () Bool)

(assert (=> d!137629 (= lt!563061 e!706857)))

(declare-fun res!831733 () Bool)

(assert (=> d!137629 (=> (not res!831733) (not e!706857))))

(assert (=> d!137629 (= res!831733 ((_ is Cons!27487) lt!563030))))

(assert (=> d!137629 (= (contains!7457 lt!563030 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563061)))

(declare-fun b!1246364 () Bool)

(declare-fun e!706858 () Bool)

(assert (=> b!1246364 (= e!706857 e!706858)))

(declare-fun res!831734 () Bool)

(assert (=> b!1246364 (=> res!831734 e!706858)))

(assert (=> b!1246364 (= res!831734 (= (h!28696 lt!563030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246365 () Bool)

(assert (=> b!1246365 (= e!706858 (contains!7457 (t!40960 lt!563030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137629 res!831733) b!1246364))

(assert (= (and b!1246364 (not res!831734)) b!1246365))

(assert (=> d!137629 m!1148129))

(declare-fun m!1148215 () Bool)

(assert (=> d!137629 m!1148215))

(declare-fun m!1148217 () Bool)

(assert (=> b!1246365 m!1148217))

(assert (=> b!1246196 d!137629))

(declare-fun b!1246366 () Bool)

(declare-fun e!706862 () Bool)

(declare-fun e!706859 () Bool)

(assert (=> b!1246366 (= e!706862 e!706859)))

(declare-fun c!122000 () Bool)

(assert (=> b!1246366 (= c!122000 (validKeyInArray!0 (select (arr!38688 a!3892) from!3270)))))

(declare-fun d!137631 () Bool)

(declare-fun res!831737 () Bool)

(declare-fun e!706861 () Bool)

(assert (=> d!137631 (=> res!831737 e!706861)))

(assert (=> d!137631 (= res!831737 (bvsge from!3270 (size!39224 a!3892)))))

(assert (=> d!137631 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27488) e!706861)))

(declare-fun b!1246367 () Bool)

(declare-fun call!61526 () Bool)

(assert (=> b!1246367 (= e!706859 call!61526)))

(declare-fun b!1246368 () Bool)

(assert (=> b!1246368 (= e!706861 e!706862)))

(declare-fun res!831736 () Bool)

(assert (=> b!1246368 (=> (not res!831736) (not e!706862))))

(declare-fun e!706860 () Bool)

(assert (=> b!1246368 (= res!831736 (not e!706860))))

(declare-fun res!831735 () Bool)

(assert (=> b!1246368 (=> (not res!831735) (not e!706860))))

(assert (=> b!1246368 (= res!831735 (validKeyInArray!0 (select (arr!38688 a!3892) from!3270)))))

(declare-fun b!1246369 () Bool)

(assert (=> b!1246369 (= e!706860 (contains!7457 Nil!27488 (select (arr!38688 a!3892) from!3270)))))

(declare-fun bm!61523 () Bool)

(assert (=> bm!61523 (= call!61526 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122000 (Cons!27487 (select (arr!38688 a!3892) from!3270) Nil!27488) Nil!27488)))))

(declare-fun b!1246370 () Bool)

(assert (=> b!1246370 (= e!706859 call!61526)))

(assert (= (and d!137631 (not res!831737)) b!1246368))

(assert (= (and b!1246368 res!831735) b!1246369))

(assert (= (and b!1246368 res!831736) b!1246366))

(assert (= (and b!1246366 c!122000) b!1246370))

(assert (= (and b!1246366 (not c!122000)) b!1246367))

(assert (= (or b!1246370 b!1246367) bm!61523))

(assert (=> b!1246366 m!1148085))

(assert (=> b!1246366 m!1148085))

(assert (=> b!1246366 m!1148091))

(assert (=> b!1246368 m!1148085))

(assert (=> b!1246368 m!1148085))

(assert (=> b!1246368 m!1148091))

(assert (=> b!1246369 m!1148085))

(assert (=> b!1246369 m!1148085))

(declare-fun m!1148221 () Bool)

(assert (=> b!1246369 m!1148221))

(assert (=> bm!61523 m!1148085))

(declare-fun m!1148225 () Bool)

(assert (=> bm!61523 m!1148225))

(assert (=> b!1246206 d!137631))

(declare-fun b!1246398 () Bool)

(declare-fun e!706882 () Bool)

(assert (=> b!1246398 (= e!706882 (subseq!657 Nil!27488 (t!40960 lt!563030)))))

(declare-fun b!1246394 () Bool)

(declare-fun e!706884 () Bool)

(declare-fun e!706886 () Bool)

(assert (=> b!1246394 (= e!706884 e!706886)))

(declare-fun res!831762 () Bool)

(assert (=> b!1246394 (=> (not res!831762) (not e!706886))))

(assert (=> b!1246394 (= res!831762 ((_ is Cons!27487) lt!563030))))

(declare-fun b!1246397 () Bool)

(declare-fun e!706888 () Bool)

(assert (=> b!1246397 (= e!706888 (subseq!657 (t!40960 Nil!27488) (t!40960 lt!563030)))))

(declare-fun d!137635 () Bool)

(declare-fun res!831763 () Bool)

(assert (=> d!137635 (=> res!831763 e!706884)))

(assert (=> d!137635 (= res!831763 ((_ is Nil!27488) Nil!27488))))

(assert (=> d!137635 (= (subseq!657 Nil!27488 lt!563030) e!706884)))

(declare-fun b!1246396 () Bool)

(assert (=> b!1246396 (= e!706886 e!706882)))

(declare-fun res!831759 () Bool)

(assert (=> b!1246396 (=> res!831759 e!706882)))

(assert (=> b!1246396 (= res!831759 e!706888)))

(declare-fun res!831760 () Bool)

(assert (=> b!1246396 (=> (not res!831760) (not e!706888))))

(assert (=> b!1246396 (= res!831760 (= (h!28696 Nil!27488) (h!28696 lt!563030)))))

(assert (= (and d!137635 (not res!831763)) b!1246394))

(assert (= (and b!1246394 res!831762) b!1246396))

(assert (= (and b!1246396 res!831760) b!1246397))

(assert (= (and b!1246396 (not res!831759)) b!1246398))

(declare-fun m!1148241 () Bool)

(assert (=> b!1246398 m!1148241))

(declare-fun m!1148243 () Bool)

(assert (=> b!1246397 m!1148243))

(assert (=> b!1246197 d!137635))

(check-sat (not d!137627) (not b!1246307) (not b!1246369) (not b!1246253) (not bm!61523) (not b!1246355) (not d!137579) (not b!1246356) (not b!1246338) (not b!1246368) (not b!1246398) (not b!1246365) (not b!1246397) (not b!1246251) (not d!137585) (not d!137629) (not b!1246305) (not bm!61518) (not b!1246366) (not b!1246308) (not b!1246360) (not d!137609))
(check-sat)
