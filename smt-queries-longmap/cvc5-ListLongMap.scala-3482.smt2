; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48234 () Bool)

(assert start!48234)

(declare-fun b!530975 () Bool)

(declare-fun res!326681 () Bool)

(declare-fun e!309278 () Bool)

(assert (=> b!530975 (=> (not res!326681) (not e!309278))))

(declare-datatypes ((array!33659 0))(
  ( (array!33660 (arr!16176 (Array (_ BitVec 32) (_ BitVec 64))) (size!16540 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33659)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530975 (= res!326681 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530976 () Bool)

(declare-fun e!309279 () Bool)

(assert (=> b!530976 (= e!309279 (and (bvsle #b00000000000000000000000000000000 (size!16540 a!3154)) (bvsge (size!16540 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530977 () Bool)

(declare-fun res!326682 () Bool)

(assert (=> b!530977 (=> (not res!326682) (not e!309278))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530977 (= res!326682 (and (= (size!16540 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16540 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16540 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530978 () Bool)

(assert (=> b!530978 (= e!309278 e!309279)))

(declare-fun res!326684 () Bool)

(assert (=> b!530978 (=> (not res!326684) (not e!309279))))

(declare-datatypes ((SeekEntryResult!4634 0))(
  ( (MissingZero!4634 (index!20760 (_ BitVec 32))) (Found!4634 (index!20761 (_ BitVec 32))) (Intermediate!4634 (undefined!5446 Bool) (index!20762 (_ BitVec 32)) (x!49744 (_ BitVec 32))) (Undefined!4634) (MissingVacant!4634 (index!20763 (_ BitVec 32))) )
))
(declare-fun lt!244831 () SeekEntryResult!4634)

(assert (=> b!530978 (= res!326684 (or (= lt!244831 (MissingZero!4634 i!1153)) (= lt!244831 (MissingVacant!4634 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4634)

(assert (=> b!530978 (= lt!244831 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530979 () Bool)

(declare-fun res!326686 () Bool)

(assert (=> b!530979 (=> (not res!326686) (not e!309278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530979 (= res!326686 (validKeyInArray!0 k!1998))))

(declare-fun b!530980 () Bool)

(declare-fun res!326685 () Bool)

(assert (=> b!530980 (=> (not res!326685) (not e!309279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33659 (_ BitVec 32)) Bool)

(assert (=> b!530980 (= res!326685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530981 () Bool)

(declare-fun res!326683 () Bool)

(assert (=> b!530981 (=> (not res!326683) (not e!309278))))

(assert (=> b!530981 (= res!326683 (validKeyInArray!0 (select (arr!16176 a!3154) j!147)))))

(declare-fun res!326687 () Bool)

(assert (=> start!48234 (=> (not res!326687) (not e!309278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48234 (= res!326687 (validMask!0 mask!3216))))

(assert (=> start!48234 e!309278))

(assert (=> start!48234 true))

(declare-fun array_inv!11972 (array!33659) Bool)

(assert (=> start!48234 (array_inv!11972 a!3154)))

(assert (= (and start!48234 res!326687) b!530977))

(assert (= (and b!530977 res!326682) b!530981))

(assert (= (and b!530981 res!326683) b!530979))

(assert (= (and b!530979 res!326686) b!530975))

(assert (= (and b!530975 res!326681) b!530978))

(assert (= (and b!530978 res!326684) b!530980))

(assert (= (and b!530980 res!326685) b!530976))

(declare-fun m!511497 () Bool)

(assert (=> start!48234 m!511497))

(declare-fun m!511499 () Bool)

(assert (=> start!48234 m!511499))

(declare-fun m!511501 () Bool)

(assert (=> b!530975 m!511501))

(declare-fun m!511503 () Bool)

(assert (=> b!530978 m!511503))

(declare-fun m!511505 () Bool)

(assert (=> b!530981 m!511505))

(assert (=> b!530981 m!511505))

(declare-fun m!511507 () Bool)

(assert (=> b!530981 m!511507))

(declare-fun m!511509 () Bool)

(assert (=> b!530980 m!511509))

(declare-fun m!511511 () Bool)

(assert (=> b!530979 m!511511))

(push 1)

(assert (not b!530980))

(assert (not b!530978))

(assert (not start!48234))

(assert (not b!530979))

(assert (not b!530981))

(assert (not b!530975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!531044 () Bool)

(declare-fun e!309315 () Bool)

(declare-fun e!309313 () Bool)

(assert (=> b!531044 (= e!309315 e!309313)))

(declare-fun c!62462 () Bool)

(assert (=> b!531044 (= c!62462 (validKeyInArray!0 (select (arr!16176 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531045 () Bool)

(declare-fun call!31940 () Bool)

(assert (=> b!531045 (= e!309313 call!31940)))

(declare-fun b!531046 () Bool)

(declare-fun e!309314 () Bool)

(assert (=> b!531046 (= e!309313 e!309314)))

(declare-fun lt!244855 () (_ BitVec 64))

(assert (=> b!531046 (= lt!244855 (select (arr!16176 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16828 0))(
  ( (Unit!16829) )
))
(declare-fun lt!244854 () Unit!16828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33659 (_ BitVec 64) (_ BitVec 32)) Unit!16828)

(assert (=> b!531046 (= lt!244854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244855 #b00000000000000000000000000000000))))

(assert (=> b!531046 (arrayContainsKey!0 a!3154 lt!244855 #b00000000000000000000000000000000)))

(declare-fun lt!244853 () Unit!16828)

(assert (=> b!531046 (= lt!244853 lt!244854)))

(declare-fun res!326740 () Bool)

(assert (=> b!531046 (= res!326740 (= (seekEntryOrOpen!0 (select (arr!16176 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4634 #b00000000000000000000000000000000)))))

(assert (=> b!531046 (=> (not res!326740) (not e!309314))))

(declare-fun bm!31937 () Bool)

(assert (=> bm!31937 (= call!31940 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81167 () Bool)

(declare-fun res!326741 () Bool)

(assert (=> d!81167 (=> res!326741 e!309315)))

(assert (=> d!81167 (= res!326741 (bvsge #b00000000000000000000000000000000 (size!16540 a!3154)))))

(assert (=> d!81167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309315)))

(declare-fun b!531047 () Bool)

(assert (=> b!531047 (= e!309314 call!31940)))

(assert (= (and d!81167 (not res!326741)) b!531044))

(assert (= (and b!531044 c!62462) b!531046))

(assert (= (and b!531044 (not c!62462)) b!531045))

(assert (= (and b!531046 res!326740) b!531047))

(assert (= (or b!531047 b!531045) bm!31937))

(declare-fun m!511557 () Bool)

(assert (=> b!531044 m!511557))

(assert (=> b!531044 m!511557))

(declare-fun m!511559 () Bool)

(assert (=> b!531044 m!511559))

(assert (=> b!531046 m!511557))

(declare-fun m!511561 () Bool)

(assert (=> b!531046 m!511561))

(declare-fun m!511563 () Bool)

(assert (=> b!531046 m!511563))

(assert (=> b!531046 m!511557))

(declare-fun m!511565 () Bool)

(assert (=> b!531046 m!511565))

(declare-fun m!511567 () Bool)

(assert (=> bm!31937 m!511567))

(assert (=> b!530980 d!81167))

(declare-fun d!81179 () Bool)

(declare-fun res!326746 () Bool)

(declare-fun e!309320 () Bool)

(assert (=> d!81179 (=> res!326746 e!309320)))

(assert (=> d!81179 (= res!326746 (= (select (arr!16176 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81179 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!309320)))

(declare-fun b!531052 () Bool)

(declare-fun e!309321 () Bool)

(assert (=> b!531052 (= e!309320 e!309321)))

(declare-fun res!326747 () Bool)

(assert (=> b!531052 (=> (not res!326747) (not e!309321))))

(assert (=> b!531052 (= res!326747 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16540 a!3154)))))

(declare-fun b!531053 () Bool)

(assert (=> b!531053 (= e!309321 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81179 (not res!326746)) b!531052))

(assert (= (and b!531052 res!326747) b!531053))

(assert (=> d!81179 m!511557))

(declare-fun m!511569 () Bool)

(assert (=> b!531053 m!511569))

(assert (=> b!530975 d!81179))

(declare-fun d!81181 () Bool)

(assert (=> d!81181 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48234 d!81181))

(declare-fun d!81183 () Bool)

(assert (=> d!81183 (= (array_inv!11972 a!3154) (bvsge (size!16540 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48234 d!81183))

(declare-fun d!81185 () Bool)

(assert (=> d!81185 (= (validKeyInArray!0 (select (arr!16176 a!3154) j!147)) (and (not (= (select (arr!16176 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16176 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530981 d!81185))

(declare-fun b!531120 () Bool)

(declare-fun e!309364 () SeekEntryResult!4634)

(declare-fun lt!244887 () SeekEntryResult!4634)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4634)

(assert (=> b!531120 (= e!309364 (seekKeyOrZeroReturnVacant!0 (x!49744 lt!244887) (index!20762 lt!244887) (index!20762 lt!244887) k!1998 a!3154 mask!3216))))

(declare-fun b!531121 () Bool)

(declare-fun e!309363 () SeekEntryResult!4634)

(assert (=> b!531121 (= e!309363 (Found!4634 (index!20762 lt!244887)))))

(declare-fun b!531122 () Bool)

(declare-fun e!309362 () SeekEntryResult!4634)

(assert (=> b!531122 (= e!309362 e!309363)))

(declare-fun lt!244888 () (_ BitVec 64))

(assert (=> b!531122 (= lt!244888 (select (arr!16176 a!3154) (index!20762 lt!244887)))))

(declare-fun c!62491 () Bool)

(assert (=> b!531122 (= c!62491 (= lt!244888 k!1998))))

(declare-fun b!531124 () Bool)

(assert (=> b!531124 (= e!309364 (MissingZero!4634 (index!20762 lt!244887)))))

(declare-fun b!531125 () Bool)

(assert (=> b!531125 (= e!309362 Undefined!4634)))

(declare-fun d!81187 () Bool)

(declare-fun lt!244886 () SeekEntryResult!4634)

(assert (=> d!81187 (and (or (is-Undefined!4634 lt!244886) (not (is-Found!4634 lt!244886)) (and (bvsge (index!20761 lt!244886) #b00000000000000000000000000000000) (bvslt (index!20761 lt!244886) (size!16540 a!3154)))) (or (is-Undefined!4634 lt!244886) (is-Found!4634 lt!244886) (not (is-MissingZero!4634 lt!244886)) (and (bvsge (index!20760 lt!244886) #b00000000000000000000000000000000) (bvslt (index!20760 lt!244886) (size!16540 a!3154)))) (or (is-Undefined!4634 lt!244886) (is-Found!4634 lt!244886) (is-MissingZero!4634 lt!244886) (not (is-MissingVacant!4634 lt!244886)) (and (bvsge (index!20763 lt!244886) #b00000000000000000000000000000000) (bvslt (index!20763 lt!244886) (size!16540 a!3154)))) (or (is-Undefined!4634 lt!244886) (ite (is-Found!4634 lt!244886) (= (select (arr!16176 a!3154) (index!20761 lt!244886)) k!1998) (ite (is-MissingZero!4634 lt!244886) (= (select (arr!16176 a!3154) (index!20760 lt!244886)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4634 lt!244886) (= (select (arr!16176 a!3154) (index!20763 lt!244886)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81187 (= lt!244886 e!309362)))

(declare-fun c!62489 () Bool)

(assert (=> d!81187 (= c!62489 (and (is-Intermediate!4634 lt!244887) (undefined!5446 lt!244887)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81187 (= lt!244887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81187 (validMask!0 mask!3216)))

(assert (=> d!81187 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244886)))

(declare-fun b!531123 () Bool)

(declare-fun c!62490 () Bool)

(assert (=> b!531123 (= c!62490 (= lt!244888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!531123 (= e!309363 e!309364)))

(assert (= (and d!81187 c!62489) b!531125))

(assert (= (and d!81187 (not c!62489)) b!531122))

(assert (= (and b!531122 c!62491) b!531121))

(assert (= (and b!531122 (not c!62491)) b!531123))

(assert (= (and b!531123 c!62490) b!531124))

(assert (= (and b!531123 (not c!62490)) b!531120))

(declare-fun m!511605 () Bool)

(assert (=> b!531120 m!511605))

(declare-fun m!511607 () Bool)

(assert (=> b!531122 m!511607))

(declare-fun m!511609 () Bool)

(assert (=> d!81187 m!511609))

(declare-fun m!511611 () Bool)

(assert (=> d!81187 m!511611))

(assert (=> d!81187 m!511497))

(declare-fun m!511613 () Bool)

(assert (=> d!81187 m!511613))

(declare-fun m!511615 () Bool)

(assert (=> d!81187 m!511615))

(declare-fun m!511617 () Bool)

(assert (=> d!81187 m!511617))

(assert (=> d!81187 m!511613))

(assert (=> b!530978 d!81187))

(declare-fun d!81205 () Bool)

(assert (=> d!81205 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530979 d!81205))

(push 1)

