; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119046 () Bool)

(assert start!119046)

(declare-fun b!1389262 () Bool)

(declare-fun res!929459 () Bool)

(declare-fun e!786946 () Bool)

(assert (=> b!1389262 (=> (not res!929459) (not e!786946))))

(declare-datatypes ((array!95016 0))(
  ( (array!95017 (arr!45875 (Array (_ BitVec 32) (_ BitVec 64))) (size!46425 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95016)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389262 (= res!929459 (validKeyInArray!0 (select (arr!45875 a!2901) i!1037)))))

(declare-fun b!1389263 () Bool)

(declare-fun res!929461 () Bool)

(assert (=> b!1389263 (=> (not res!929461) (not e!786946))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389263 (= res!929461 (and (= (size!46425 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46425 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46425 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389265 () Bool)

(declare-fun lt!610506 () (_ BitVec 32))

(assert (=> b!1389265 (= e!786946 (and (bvsge mask!2840 #b00000000000000000000000000000000) (or (bvslt lt!610506 #b00000000000000000000000000000000) (bvsge lt!610506 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389265 (= lt!610506 (toIndex!0 (select (arr!45875 a!2901) j!112) mask!2840))))

(declare-fun b!1389266 () Bool)

(declare-fun res!929458 () Bool)

(assert (=> b!1389266 (=> (not res!929458) (not e!786946))))

(assert (=> b!1389266 (= res!929458 (validKeyInArray!0 (select (arr!45875 a!2901) j!112)))))

(declare-fun b!1389267 () Bool)

(declare-fun res!929460 () Bool)

(assert (=> b!1389267 (=> (not res!929460) (not e!786946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95016 (_ BitVec 32)) Bool)

(assert (=> b!1389267 (= res!929460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389264 () Bool)

(declare-fun res!929457 () Bool)

(assert (=> b!1389264 (=> (not res!929457) (not e!786946))))

(declare-datatypes ((List!32394 0))(
  ( (Nil!32391) (Cons!32390 (h!33605 (_ BitVec 64)) (t!47088 List!32394)) )
))
(declare-fun arrayNoDuplicates!0 (array!95016 (_ BitVec 32) List!32394) Bool)

(assert (=> b!1389264 (= res!929457 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32391))))

(declare-fun res!929456 () Bool)

(assert (=> start!119046 (=> (not res!929456) (not e!786946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119046 (= res!929456 (validMask!0 mask!2840))))

(assert (=> start!119046 e!786946))

(assert (=> start!119046 true))

(declare-fun array_inv!34903 (array!95016) Bool)

(assert (=> start!119046 (array_inv!34903 a!2901)))

(assert (= (and start!119046 res!929456) b!1389263))

(assert (= (and b!1389263 res!929461) b!1389262))

(assert (= (and b!1389262 res!929459) b!1389266))

(assert (= (and b!1389266 res!929458) b!1389267))

(assert (= (and b!1389267 res!929460) b!1389264))

(assert (= (and b!1389264 res!929457) b!1389265))

(declare-fun m!1274937 () Bool)

(assert (=> b!1389264 m!1274937))

(declare-fun m!1274939 () Bool)

(assert (=> b!1389262 m!1274939))

(assert (=> b!1389262 m!1274939))

(declare-fun m!1274941 () Bool)

(assert (=> b!1389262 m!1274941))

(declare-fun m!1274943 () Bool)

(assert (=> b!1389266 m!1274943))

(assert (=> b!1389266 m!1274943))

(declare-fun m!1274945 () Bool)

(assert (=> b!1389266 m!1274945))

(assert (=> b!1389265 m!1274943))

(assert (=> b!1389265 m!1274943))

(declare-fun m!1274947 () Bool)

(assert (=> b!1389265 m!1274947))

(declare-fun m!1274949 () Bool)

(assert (=> b!1389267 m!1274949))

(declare-fun m!1274951 () Bool)

(assert (=> start!119046 m!1274951))

(declare-fun m!1274953 () Bool)

(assert (=> start!119046 m!1274953))

(push 1)

(assert (not b!1389266))

(assert (not b!1389262))

(assert (not b!1389265))

(assert (not start!119046))

(assert (not b!1389264))

(assert (not b!1389267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150119 () Bool)

(assert (=> d!150119 (= (validKeyInArray!0 (select (arr!45875 a!2901) j!112)) (and (not (= (select (arr!45875 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45875 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389266 d!150119))

(declare-fun b!1389327 () Bool)

(declare-fun e!786979 () Bool)

(declare-fun e!786978 () Bool)

(assert (=> b!1389327 (= e!786979 e!786978)))

(declare-fun lt!610525 () (_ BitVec 64))

(assert (=> b!1389327 (= lt!610525 (select (arr!45875 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46432 0))(
  ( (Unit!46433) )
))
(declare-fun lt!610527 () Unit!46432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95016 (_ BitVec 64) (_ BitVec 32)) Unit!46432)

(assert (=> b!1389327 (= lt!610527 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389327 (arrayContainsKey!0 a!2901 lt!610525 #b00000000000000000000000000000000)))

(declare-fun lt!610526 () Unit!46432)

(assert (=> b!1389327 (= lt!610526 lt!610527)))

(declare-fun res!929512 () Bool)

(declare-datatypes ((SeekEntryResult!10199 0))(
  ( (MissingZero!10199 (index!43167 (_ BitVec 32))) (Found!10199 (index!43168 (_ BitVec 32))) (Intermediate!10199 (undefined!11011 Bool) (index!43169 (_ BitVec 32)) (x!124845 (_ BitVec 32))) (Undefined!10199) (MissingVacant!10199 (index!43170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95016 (_ BitVec 32)) SeekEntryResult!10199)

(assert (=> b!1389327 (= res!929512 (= (seekEntryOrOpen!0 (select (arr!45875 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10199 #b00000000000000000000000000000000)))))

(assert (=> b!1389327 (=> (not res!929512) (not e!786978))))

(declare-fun b!1389328 () Bool)

(declare-fun call!66685 () Bool)

(assert (=> b!1389328 (= e!786979 call!66685)))

(declare-fun b!1389329 () Bool)

(declare-fun e!786980 () Bool)

(assert (=> b!1389329 (= e!786980 e!786979)))

(declare-fun c!129351 () Bool)

(assert (=> b!1389329 (= c!129351 (validKeyInArray!0 (select (arr!45875 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389330 () Bool)

(assert (=> b!1389330 (= e!786978 call!66685)))

(declare-fun bm!66682 () Bool)

(assert (=> bm!66682 (= call!66685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150121 () Bool)

(declare-fun res!929513 () Bool)

(assert (=> d!150121 (=> res!929513 e!786980)))

(assert (=> d!150121 (= res!929513 (bvsge #b00000000000000000000000000000000 (size!46425 a!2901)))))

(assert (=> d!150121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786980)))

(assert (= (and d!150121 (not res!929513)) b!1389329))

(assert (= (and b!1389329 c!129351) b!1389327))

(assert (= (and b!1389329 (not c!129351)) b!1389328))

(assert (= (and b!1389327 res!929512) b!1389330))

(assert (= (or b!1389330 b!1389328) bm!66682))

(declare-fun m!1274999 () Bool)

(assert (=> b!1389327 m!1274999))

(declare-fun m!1275001 () Bool)

(assert (=> b!1389327 m!1275001))

(declare-fun m!1275003 () Bool)

(assert (=> b!1389327 m!1275003))

(assert (=> b!1389327 m!1274999))

(declare-fun m!1275005 () Bool)

(assert (=> b!1389327 m!1275005))

(assert (=> b!1389329 m!1274999))

(assert (=> b!1389329 m!1274999))

(declare-fun m!1275007 () Bool)

(assert (=> b!1389329 m!1275007))

(declare-fun m!1275009 () Bool)

(assert (=> bm!66682 m!1275009))

(assert (=> b!1389267 d!150121))

(declare-fun d!150135 () Bool)

(assert (=> d!150135 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119046 d!150135))

(declare-fun d!150143 () Bool)

(assert (=> d!150143 (= (array_inv!34903 a!2901) (bvsge (size!46425 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119046 d!150143))

(declare-fun d!150145 () Bool)

(declare-fun lt!610542 () (_ BitVec 32))

(declare-fun lt!610541 () (_ BitVec 32))

(assert (=> d!150145 (= lt!610542 (bvmul (bvxor lt!610541 (bvlshr lt!610541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150145 (= lt!610541 ((_ extract 31 0) (bvand (bvxor (select (arr!45875 a!2901) j!112) (bvlshr (select (arr!45875 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150145 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!929526 (let ((h!33609 ((_ extract 31 0) (bvand (bvxor (select (arr!45875 a!2901) j!112) (bvlshr (select (arr!45875 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124842 (bvmul (bvxor h!33609 (bvlshr h!33609 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124842 (bvlshr x!124842 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!929526 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!929526 #b00000000000000000000000000000000))))))

(assert (=> d!150145 (= (toIndex!0 (select (arr!45875 a!2901) j!112) mask!2840) (bvand (bvxor lt!610542 (bvlshr lt!610542 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1389265 d!150145))

(declare-fun b!1389380 () Bool)

(declare-fun e!787021 () Bool)

(declare-fun call!66697 () Bool)

(assert (=> b!1389380 (= e!787021 call!66697)))

(declare-fun b!1389381 () Bool)

(assert (=> b!1389381 (= e!787021 call!66697)))

(declare-fun b!1389382 () Bool)

(declare-fun e!787020 () Bool)

(declare-fun e!787022 () Bool)

(assert (=> b!1389382 (= e!787020 e!787022)))

(declare-fun res!929543 () Bool)

(assert (=> b!1389382 (=> (not res!929543) (not e!787022))))

(declare-fun e!787019 () Bool)

(assert (=> b!1389382 (= res!929543 (not e!787019))))

(declare-fun res!929545 () Bool)

(assert (=> b!1389382 (=> (not res!929545) (not e!787019))))

(assert (=> b!1389382 (= res!929545 (validKeyInArray!0 (select (arr!45875 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389383 () Bool)

(assert (=> b!1389383 (= e!787022 e!787021)))

(declare-fun c!129363 () Bool)

(assert (=> b!1389383 (= c!129363 (validKeyInArray!0 (select (arr!45875 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150147 () Bool)

(declare-fun res!929544 () Bool)

(assert (=> d!150147 (=> res!929544 e!787020)))

(assert (=> d!150147 (= res!929544 (bvsge #b00000000000000000000000000000000 (size!46425 a!2901)))))

(assert (=> d!150147 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32391) e!787020)))

(declare-fun b!1389384 () Bool)

(declare-fun contains!9761 (List!32394 (_ BitVec 64)) Bool)

(assert (=> b!1389384 (= e!787019 (contains!9761 Nil!32391 (select (arr!45875 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66694 () Bool)

(assert (=> bm!66694 (= call!66697 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129363 (Cons!32390 (select (arr!45875 a!2901) #b00000000000000000000000000000000) Nil!32391) Nil!32391)))))

(assert (= (and d!150147 (not res!929544)) b!1389382))

(assert (= (and b!1389382 res!929545) b!1389384))

(assert (= (and b!1389382 res!929543) b!1389383))

(assert (= (and b!1389383 c!129363) b!1389381))

(assert (= (and b!1389383 (not c!129363)) b!1389380))

(assert (= (or b!1389381 b!1389380) bm!66694))

(assert (=> b!1389382 m!1274999))

(assert (=> b!1389382 m!1274999))

(assert (=> b!1389382 m!1275007))

(assert (=> b!1389383 m!1274999))

(assert (=> b!1389383 m!1274999))

(assert (=> b!1389383 m!1275007))

(assert (=> b!1389384 m!1274999))

(assert (=> b!1389384 m!1274999))

(declare-fun m!1275035 () Bool)

(assert (=> b!1389384 m!1275035))

(assert (=> bm!66694 m!1274999))

(declare-fun m!1275037 () Bool)

(assert (=> bm!66694 m!1275037))

(assert (=> b!1389264 d!150147))

(declare-fun d!150151 () Bool)

(assert (=> d!150151 (= (validKeyInArray!0 (select (arr!45875 a!2901) i!1037)) (and (not (= (select (arr!45875 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45875 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389262 d!150151))

(push 1)

(assert (not bm!66682))

(assert (not b!1389327))

(assert (not b!1389384))

(assert (not bm!66694))

(assert (not b!1389329))

(assert (not b!1389382))

(assert (not b!1389383))

(check-sat)

