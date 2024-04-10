; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118944 () Bool)

(assert start!118944)

(declare-fun b!1388765 () Bool)

(declare-fun e!786699 () Bool)

(declare-datatypes ((List!32376 0))(
  ( (Nil!32373) (Cons!32372 (h!33587 (_ BitVec 64)) (t!47070 List!32376)) )
))
(declare-fun contains!9753 (List!32376 (_ BitVec 64)) Bool)

(assert (=> b!1388765 (= e!786699 (contains!9753 Nil!32373 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388766 () Bool)

(declare-fun res!929019 () Bool)

(declare-fun e!786701 () Bool)

(assert (=> b!1388766 (=> (not res!929019) (not e!786701))))

(declare-datatypes ((array!94974 0))(
  ( (array!94975 (arr!45857 (Array (_ BitVec 32) (_ BitVec 64))) (size!46407 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94974)

(assert (=> b!1388766 (= res!929019 (and (bvsle #b00000000000000000000000000000000 (size!46407 a!2901)) (bvslt (size!46407 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388767 () Bool)

(declare-fun res!929016 () Bool)

(assert (=> b!1388767 (=> (not res!929016) (not e!786701))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1388767 (= res!929016 (and (= (size!46407 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46407 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46407 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929013 () Bool)

(assert (=> start!118944 (=> (not res!929013) (not e!786701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118944 (= res!929013 (validMask!0 mask!2840))))

(assert (=> start!118944 e!786701))

(assert (=> start!118944 true))

(declare-fun array_inv!34885 (array!94974) Bool)

(assert (=> start!118944 (array_inv!34885 a!2901)))

(declare-fun b!1388768 () Bool)

(assert (=> b!1388768 (= e!786701 e!786699)))

(declare-fun res!929018 () Bool)

(assert (=> b!1388768 (=> res!929018 e!786699)))

(assert (=> b!1388768 (= res!929018 (contains!9753 Nil!32373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388769 () Bool)

(declare-fun res!929020 () Bool)

(assert (=> b!1388769 (=> (not res!929020) (not e!786701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94974 (_ BitVec 32)) Bool)

(assert (=> b!1388769 (= res!929020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388770 () Bool)

(declare-fun res!929015 () Bool)

(assert (=> b!1388770 (=> (not res!929015) (not e!786701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388770 (= res!929015 (validKeyInArray!0 (select (arr!45857 a!2901) j!112)))))

(declare-fun b!1388771 () Bool)

(declare-fun res!929014 () Bool)

(assert (=> b!1388771 (=> (not res!929014) (not e!786701))))

(declare-fun noDuplicate!2603 (List!32376) Bool)

(assert (=> b!1388771 (= res!929014 (noDuplicate!2603 Nil!32373))))

(declare-fun b!1388772 () Bool)

(declare-fun res!929017 () Bool)

(assert (=> b!1388772 (=> (not res!929017) (not e!786701))))

(assert (=> b!1388772 (= res!929017 (validKeyInArray!0 (select (arr!45857 a!2901) i!1037)))))

(assert (= (and start!118944 res!929013) b!1388767))

(assert (= (and b!1388767 res!929016) b!1388772))

(assert (= (and b!1388772 res!929017) b!1388770))

(assert (= (and b!1388770 res!929015) b!1388769))

(assert (= (and b!1388769 res!929020) b!1388766))

(assert (= (and b!1388766 res!929019) b!1388771))

(assert (= (and b!1388771 res!929014) b!1388768))

(assert (= (and b!1388768 (not res!929018)) b!1388765))

(declare-fun m!1274493 () Bool)

(assert (=> b!1388771 m!1274493))

(declare-fun m!1274495 () Bool)

(assert (=> start!118944 m!1274495))

(declare-fun m!1274497 () Bool)

(assert (=> start!118944 m!1274497))

(declare-fun m!1274499 () Bool)

(assert (=> b!1388768 m!1274499))

(declare-fun m!1274501 () Bool)

(assert (=> b!1388772 m!1274501))

(assert (=> b!1388772 m!1274501))

(declare-fun m!1274503 () Bool)

(assert (=> b!1388772 m!1274503))

(declare-fun m!1274505 () Bool)

(assert (=> b!1388769 m!1274505))

(declare-fun m!1274507 () Bool)

(assert (=> b!1388765 m!1274507))

(declare-fun m!1274509 () Bool)

(assert (=> b!1388770 m!1274509))

(assert (=> b!1388770 m!1274509))

(declare-fun m!1274511 () Bool)

(assert (=> b!1388770 m!1274511))

(push 1)

(assert (not b!1388769))

(assert (not b!1388768))

(assert (not b!1388771))

(assert (not b!1388770))

(assert (not b!1388765))

(assert (not start!118944))

(assert (not b!1388772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150023 () Bool)

(assert (=> d!150023 (= (validKeyInArray!0 (select (arr!45857 a!2901) j!112)) (and (not (= (select (arr!45857 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45857 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388770 d!150023))

(declare-fun b!1388829 () Bool)

(declare-fun e!786726 () Bool)

(declare-fun e!786727 () Bool)

(assert (=> b!1388829 (= e!786726 e!786727)))

(declare-fun c!129321 () Bool)

(assert (=> b!1388829 (= c!129321 (validKeyInArray!0 (select (arr!45857 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388830 () Bool)

(declare-fun call!66655 () Bool)

(assert (=> b!1388830 (= e!786727 call!66655)))

(declare-fun b!1388831 () Bool)

(declare-fun e!786728 () Bool)

(assert (=> b!1388831 (= e!786727 e!786728)))

(declare-fun lt!610419 () (_ BitVec 64))

(assert (=> b!1388831 (= lt!610419 (select (arr!45857 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46418 0))(
  ( (Unit!46419) )
))
(declare-fun lt!610417 () Unit!46418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94974 (_ BitVec 64) (_ BitVec 32)) Unit!46418)

(assert (=> b!1388831 (= lt!610417 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610419 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388831 (arrayContainsKey!0 a!2901 lt!610419 #b00000000000000000000000000000000)))

(declare-fun lt!610418 () Unit!46418)

(assert (=> b!1388831 (= lt!610418 lt!610417)))

(declare-fun res!929073 () Bool)

(declare-datatypes ((SeekEntryResult!10192 0))(
  ( (MissingZero!10192 (index!43139 (_ BitVec 32))) (Found!10192 (index!43140 (_ BitVec 32))) (Intermediate!10192 (undefined!11004 Bool) (index!43141 (_ BitVec 32)) (x!124787 (_ BitVec 32))) (Undefined!10192) (MissingVacant!10192 (index!43142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94974 (_ BitVec 32)) SeekEntryResult!10192)

(assert (=> b!1388831 (= res!929073 (= (seekEntryOrOpen!0 (select (arr!45857 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10192 #b00000000000000000000000000000000)))))

(assert (=> b!1388831 (=> (not res!929073) (not e!786728))))

(declare-fun bm!66652 () Bool)

(assert (=> bm!66652 (= call!66655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388832 () Bool)

(assert (=> b!1388832 (= e!786728 call!66655)))

(declare-fun d!150025 () Bool)

(declare-fun res!929074 () Bool)

(assert (=> d!150025 (=> res!929074 e!786726)))

(assert (=> d!150025 (= res!929074 (bvsge #b00000000000000000000000000000000 (size!46407 a!2901)))))

(assert (=> d!150025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786726)))

(assert (= (and d!150025 (not res!929074)) b!1388829))

(assert (= (and b!1388829 c!129321) b!1388831))

(assert (= (and b!1388829 (not c!129321)) b!1388830))

(assert (= (and b!1388831 res!929073) b!1388832))

(assert (= (or b!1388832 b!1388830) bm!66652))

(declare-fun m!1274553 () Bool)

(assert (=> b!1388829 m!1274553))

(assert (=> b!1388829 m!1274553))

(declare-fun m!1274555 () Bool)

(assert (=> b!1388829 m!1274555))

(assert (=> b!1388831 m!1274553))

(declare-fun m!1274557 () Bool)

(assert (=> b!1388831 m!1274557))

(declare-fun m!1274559 () Bool)

(assert (=> b!1388831 m!1274559))

(assert (=> b!1388831 m!1274553))

(declare-fun m!1274561 () Bool)

(assert (=> b!1388831 m!1274561))

(declare-fun m!1274563 () Bool)

(assert (=> bm!66652 m!1274563))

(assert (=> b!1388769 d!150025))

(declare-fun d!150033 () Bool)

(assert (=> d!150033 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118944 d!150033))

(declare-fun d!150041 () Bool)

(assert (=> d!150041 (= (array_inv!34885 a!2901) (bvsge (size!46407 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118944 d!150041))

(declare-fun d!150045 () Bool)

(declare-fun lt!610437 () Bool)

(declare-fun content!767 (List!32376) (Set (_ BitVec 64)))

(assert (=> d!150045 (= lt!610437 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!767 Nil!32373)))))

(declare-fun e!786755 () Bool)

(assert (=> d!150045 (= lt!610437 e!786755)))

(declare-fun res!929095 () Bool)

(assert (=> d!150045 (=> (not res!929095) (not e!786755))))

(assert (=> d!150045 (= res!929095 (is-Cons!32372 Nil!32373))))

(assert (=> d!150045 (= (contains!9753 Nil!32373 #b0000000000000000000000000000000000000000000000000000000000000000) lt!610437)))

(declare-fun b!1388863 () Bool)

(declare-fun e!786754 () Bool)

(assert (=> b!1388863 (= e!786755 e!786754)))

(declare-fun res!929096 () Bool)

(assert (=> b!1388863 (=> res!929096 e!786754)))

(assert (=> b!1388863 (= res!929096 (= (h!33587 Nil!32373) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388864 () Bool)

(assert (=> b!1388864 (= e!786754 (contains!9753 (t!47070 Nil!32373) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150045 res!929095) b!1388863))

(assert (= (and b!1388863 (not res!929096)) b!1388864))

(declare-fun m!1274581 () Bool)

(assert (=> d!150045 m!1274581))

(declare-fun m!1274583 () Bool)

(assert (=> d!150045 m!1274583))

(declare-fun m!1274585 () Bool)

(assert (=> b!1388864 m!1274585))

(assert (=> b!1388768 d!150045))

(declare-fun d!150049 () Bool)

(assert (=> d!150049 (= (validKeyInArray!0 (select (arr!45857 a!2901) i!1037)) (and (not (= (select (arr!45857 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45857 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388772 d!150049))

(declare-fun d!150051 () Bool)

(declare-fun res!929111 () Bool)

(declare-fun e!786771 () Bool)

(assert (=> d!150051 (=> res!929111 e!786771)))

(assert (=> d!150051 (= res!929111 (is-Nil!32373 Nil!32373))))

(assert (=> d!150051 (= (noDuplicate!2603 Nil!32373) e!786771)))

(declare-fun b!1388881 () Bool)

(declare-fun e!786772 () Bool)

(assert (=> b!1388881 (= e!786771 e!786772)))

(declare-fun res!929112 () Bool)

(assert (=> b!1388881 (=> (not res!929112) (not e!786772))))

(assert (=> b!1388881 (= res!929112 (not (contains!9753 (t!47070 Nil!32373) (h!33587 Nil!32373))))))

(declare-fun b!1388882 () Bool)

(assert (=> b!1388882 (= e!786772 (noDuplicate!2603 (t!47070 Nil!32373)))))

(assert (= (and d!150051 (not res!929111)) b!1388881))

(assert (= (and b!1388881 res!929112) b!1388882))

(declare-fun m!1274607 () Bool)

(assert (=> b!1388881 m!1274607))

(declare-fun m!1274611 () Bool)

(assert (=> b!1388882 m!1274611))

(assert (=> b!1388771 d!150051))

(declare-fun d!150057 () Bool)

(declare-fun lt!610447 () Bool)

(assert (=> d!150057 (= lt!610447 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!767 Nil!32373)))))

(declare-fun e!786778 () Bool)

(assert (=> d!150057 (= lt!610447 e!786778)))

(declare-fun res!929117 () Bool)

(assert (=> d!150057 (=> (not res!929117) (not e!786778))))

(assert (=> d!150057 (= res!929117 (is-Cons!32372 Nil!32373))))

(assert (=> d!150057 (= (contains!9753 Nil!32373 #b1000000000000000000000000000000000000000000000000000000000000000) lt!610447)))

(declare-fun b!1388887 () Bool)

(declare-fun e!786777 () Bool)

(assert (=> b!1388887 (= e!786778 e!786777)))

(declare-fun res!929118 () Bool)

(assert (=> b!1388887 (=> res!929118 e!786777)))

(assert (=> b!1388887 (= res!929118 (= (h!33587 Nil!32373) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388888 () Bool)

(assert (=> b!1388888 (= e!786777 (contains!9753 (t!47070 Nil!32373) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150057 res!929117) b!1388887))

(assert (= (and b!1388887 (not res!929118)) b!1388888))

(assert (=> d!150057 m!1274581))

(declare-fun m!1274613 () Bool)

(assert (=> d!150057 m!1274613))

(declare-fun m!1274615 () Bool)

(assert (=> b!1388888 m!1274615))

(assert (=> b!1388765 d!150057))

(push 1)

