; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118946 () Bool)

(assert start!118946)

(declare-fun res!929041 () Bool)

(declare-fun e!786708 () Bool)

(assert (=> start!118946 (=> (not res!929041) (not e!786708))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118946 (= res!929041 (validMask!0 mask!2840))))

(assert (=> start!118946 e!786708))

(assert (=> start!118946 true))

(declare-datatypes ((array!94976 0))(
  ( (array!94977 (arr!45858 (Array (_ BitVec 32) (_ BitVec 64))) (size!46408 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94976)

(declare-fun array_inv!34886 (array!94976) Bool)

(assert (=> start!118946 (array_inv!34886 a!2901)))

(declare-fun b!1388789 () Bool)

(declare-fun res!929039 () Bool)

(assert (=> b!1388789 (=> (not res!929039) (not e!786708))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388789 (= res!929039 (validKeyInArray!0 (select (arr!45858 a!2901) i!1037)))))

(declare-fun b!1388790 () Bool)

(declare-fun e!786710 () Bool)

(assert (=> b!1388790 (= e!786708 e!786710)))

(declare-fun res!929040 () Bool)

(assert (=> b!1388790 (=> res!929040 e!786710)))

(declare-datatypes ((List!32377 0))(
  ( (Nil!32374) (Cons!32373 (h!33588 (_ BitVec 64)) (t!47071 List!32377)) )
))
(declare-fun contains!9754 (List!32377 (_ BitVec 64)) Bool)

(assert (=> b!1388790 (= res!929040 (contains!9754 Nil!32374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388791 () Bool)

(declare-fun res!929042 () Bool)

(assert (=> b!1388791 (=> (not res!929042) (not e!786708))))

(declare-fun noDuplicate!2604 (List!32377) Bool)

(assert (=> b!1388791 (= res!929042 (noDuplicate!2604 Nil!32374))))

(declare-fun b!1388792 () Bool)

(declare-fun res!929043 () Bool)

(assert (=> b!1388792 (=> (not res!929043) (not e!786708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94976 (_ BitVec 32)) Bool)

(assert (=> b!1388792 (= res!929043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388793 () Bool)

(declare-fun res!929038 () Bool)

(assert (=> b!1388793 (=> (not res!929038) (not e!786708))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388793 (= res!929038 (validKeyInArray!0 (select (arr!45858 a!2901) j!112)))))

(declare-fun b!1388794 () Bool)

(declare-fun res!929044 () Bool)

(assert (=> b!1388794 (=> (not res!929044) (not e!786708))))

(assert (=> b!1388794 (= res!929044 (and (= (size!46408 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46408 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46408 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388795 () Bool)

(declare-fun res!929037 () Bool)

(assert (=> b!1388795 (=> (not res!929037) (not e!786708))))

(assert (=> b!1388795 (= res!929037 (and (bvsle #b00000000000000000000000000000000 (size!46408 a!2901)) (bvslt (size!46408 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388796 () Bool)

(assert (=> b!1388796 (= e!786710 (contains!9754 Nil!32374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!118946 res!929041) b!1388794))

(assert (= (and b!1388794 res!929044) b!1388789))

(assert (= (and b!1388789 res!929039) b!1388793))

(assert (= (and b!1388793 res!929038) b!1388792))

(assert (= (and b!1388792 res!929043) b!1388795))

(assert (= (and b!1388795 res!929037) b!1388791))

(assert (= (and b!1388791 res!929042) b!1388790))

(assert (= (and b!1388790 (not res!929040)) b!1388796))

(declare-fun m!1274513 () Bool)

(assert (=> b!1388791 m!1274513))

(declare-fun m!1274515 () Bool)

(assert (=> b!1388793 m!1274515))

(assert (=> b!1388793 m!1274515))

(declare-fun m!1274517 () Bool)

(assert (=> b!1388793 m!1274517))

(declare-fun m!1274519 () Bool)

(assert (=> b!1388790 m!1274519))

(declare-fun m!1274521 () Bool)

(assert (=> b!1388796 m!1274521))

(declare-fun m!1274523 () Bool)

(assert (=> b!1388789 m!1274523))

(assert (=> b!1388789 m!1274523))

(declare-fun m!1274525 () Bool)

(assert (=> b!1388789 m!1274525))

(declare-fun m!1274527 () Bool)

(assert (=> b!1388792 m!1274527))

(declare-fun m!1274529 () Bool)

(assert (=> start!118946 m!1274529))

(declare-fun m!1274531 () Bool)

(assert (=> start!118946 m!1274531))

(check-sat (not b!1388796) (not b!1388791) (not b!1388793) (not b!1388792) (not start!118946) (not b!1388790) (not b!1388789))
(check-sat)
(get-model)

(declare-fun d!150019 () Bool)

(assert (=> d!150019 (= (validKeyInArray!0 (select (arr!45858 a!2901) j!112)) (and (not (= (select (arr!45858 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45858 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388793 d!150019))

(declare-fun d!150021 () Bool)

(assert (=> d!150021 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118946 d!150021))

(declare-fun d!150031 () Bool)

(assert (=> d!150031 (= (array_inv!34886 a!2901) (bvsge (size!46408 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118946 d!150031))

(declare-fun d!150035 () Bool)

(declare-fun res!929079 () Bool)

(declare-fun e!786737 () Bool)

(assert (=> d!150035 (=> res!929079 e!786737)))

(assert (=> d!150035 (= res!929079 (bvsge #b00000000000000000000000000000000 (size!46408 a!2901)))))

(assert (=> d!150035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786737)))

(declare-fun b!1388841 () Bool)

(declare-fun e!786736 () Bool)

(declare-fun call!66658 () Bool)

(assert (=> b!1388841 (= e!786736 call!66658)))

(declare-fun b!1388842 () Bool)

(declare-fun e!786735 () Bool)

(assert (=> b!1388842 (= e!786735 call!66658)))

(declare-fun bm!66655 () Bool)

(assert (=> bm!66655 (= call!66658 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388843 () Bool)

(assert (=> b!1388843 (= e!786735 e!786736)))

(declare-fun lt!610427 () (_ BitVec 64))

(assert (=> b!1388843 (= lt!610427 (select (arr!45858 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46420 0))(
  ( (Unit!46421) )
))
(declare-fun lt!610428 () Unit!46420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94976 (_ BitVec 64) (_ BitVec 32)) Unit!46420)

(assert (=> b!1388843 (= lt!610428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610427 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388843 (arrayContainsKey!0 a!2901 lt!610427 #b00000000000000000000000000000000)))

(declare-fun lt!610426 () Unit!46420)

(assert (=> b!1388843 (= lt!610426 lt!610428)))

(declare-fun res!929080 () Bool)

(declare-datatypes ((SeekEntryResult!10193 0))(
  ( (MissingZero!10193 (index!43143 (_ BitVec 32))) (Found!10193 (index!43144 (_ BitVec 32))) (Intermediate!10193 (undefined!11005 Bool) (index!43145 (_ BitVec 32)) (x!124788 (_ BitVec 32))) (Undefined!10193) (MissingVacant!10193 (index!43146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94976 (_ BitVec 32)) SeekEntryResult!10193)

(assert (=> b!1388843 (= res!929080 (= (seekEntryOrOpen!0 (select (arr!45858 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10193 #b00000000000000000000000000000000)))))

(assert (=> b!1388843 (=> (not res!929080) (not e!786736))))

(declare-fun b!1388844 () Bool)

(assert (=> b!1388844 (= e!786737 e!786735)))

(declare-fun c!129324 () Bool)

(assert (=> b!1388844 (= c!129324 (validKeyInArray!0 (select (arr!45858 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150035 (not res!929079)) b!1388844))

(assert (= (and b!1388844 c!129324) b!1388843))

(assert (= (and b!1388844 (not c!129324)) b!1388842))

(assert (= (and b!1388843 res!929080) b!1388841))

(assert (= (or b!1388841 b!1388842) bm!66655))

(declare-fun m!1274565 () Bool)

(assert (=> bm!66655 m!1274565))

(declare-fun m!1274567 () Bool)

(assert (=> b!1388843 m!1274567))

(declare-fun m!1274569 () Bool)

(assert (=> b!1388843 m!1274569))

(declare-fun m!1274571 () Bool)

(assert (=> b!1388843 m!1274571))

(assert (=> b!1388843 m!1274567))

(declare-fun m!1274573 () Bool)

(assert (=> b!1388843 m!1274573))

(assert (=> b!1388844 m!1274567))

(assert (=> b!1388844 m!1274567))

(declare-fun m!1274575 () Bool)

(assert (=> b!1388844 m!1274575))

(assert (=> b!1388792 d!150035))

(declare-fun d!150043 () Bool)

(declare-fun res!929089 () Bool)

(declare-fun e!786748 () Bool)

(assert (=> d!150043 (=> res!929089 e!786748)))

(get-info :version)

(assert (=> d!150043 (= res!929089 ((_ is Nil!32374) Nil!32374))))

(assert (=> d!150043 (= (noDuplicate!2604 Nil!32374) e!786748)))

(declare-fun b!1388857 () Bool)

(declare-fun e!786749 () Bool)

(assert (=> b!1388857 (= e!786748 e!786749)))

(declare-fun res!929090 () Bool)

(assert (=> b!1388857 (=> (not res!929090) (not e!786749))))

(assert (=> b!1388857 (= res!929090 (not (contains!9754 (t!47071 Nil!32374) (h!33588 Nil!32374))))))

(declare-fun b!1388858 () Bool)

(assert (=> b!1388858 (= e!786749 (noDuplicate!2604 (t!47071 Nil!32374)))))

(assert (= (and d!150043 (not res!929089)) b!1388857))

(assert (= (and b!1388857 res!929090) b!1388858))

(declare-fun m!1274577 () Bool)

(assert (=> b!1388857 m!1274577))

(declare-fun m!1274579 () Bool)

(assert (=> b!1388858 m!1274579))

(assert (=> b!1388791 d!150043))

(declare-fun d!150047 () Bool)

(declare-fun lt!610443 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!768 (List!32377) (InoxSet (_ BitVec 64)))

(assert (=> d!150047 (= lt!610443 (select (content!768 Nil!32374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786767 () Bool)

(assert (=> d!150047 (= lt!610443 e!786767)))

(declare-fun res!929107 () Bool)

(assert (=> d!150047 (=> (not res!929107) (not e!786767))))

(assert (=> d!150047 (= res!929107 ((_ is Cons!32373) Nil!32374))))

(assert (=> d!150047 (= (contains!9754 Nil!32374 #b1000000000000000000000000000000000000000000000000000000000000000) lt!610443)))

(declare-fun b!1388877 () Bool)

(declare-fun e!786768 () Bool)

(assert (=> b!1388877 (= e!786767 e!786768)))

(declare-fun res!929108 () Bool)

(assert (=> b!1388877 (=> res!929108 e!786768)))

(assert (=> b!1388877 (= res!929108 (= (h!33588 Nil!32374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388878 () Bool)

(assert (=> b!1388878 (= e!786768 (contains!9754 (t!47071 Nil!32374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150047 res!929107) b!1388877))

(assert (= (and b!1388877 (not res!929108)) b!1388878))

(declare-fun m!1274599 () Bool)

(assert (=> d!150047 m!1274599))

(declare-fun m!1274601 () Bool)

(assert (=> d!150047 m!1274601))

(declare-fun m!1274603 () Bool)

(assert (=> b!1388878 m!1274603))

(assert (=> b!1388796 d!150047))

(declare-fun d!150055 () Bool)

(declare-fun lt!610444 () Bool)

(assert (=> d!150055 (= lt!610444 (select (content!768 Nil!32374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786769 () Bool)

(assert (=> d!150055 (= lt!610444 e!786769)))

(declare-fun res!929109 () Bool)

(assert (=> d!150055 (=> (not res!929109) (not e!786769))))

(assert (=> d!150055 (= res!929109 ((_ is Cons!32373) Nil!32374))))

(assert (=> d!150055 (= (contains!9754 Nil!32374 #b0000000000000000000000000000000000000000000000000000000000000000) lt!610444)))

(declare-fun b!1388879 () Bool)

(declare-fun e!786770 () Bool)

(assert (=> b!1388879 (= e!786769 e!786770)))

(declare-fun res!929110 () Bool)

(assert (=> b!1388879 (=> res!929110 e!786770)))

(assert (=> b!1388879 (= res!929110 (= (h!33588 Nil!32374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388880 () Bool)

(assert (=> b!1388880 (= e!786770 (contains!9754 (t!47071 Nil!32374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150055 res!929109) b!1388879))

(assert (= (and b!1388879 (not res!929110)) b!1388880))

(assert (=> d!150055 m!1274599))

(declare-fun m!1274605 () Bool)

(assert (=> d!150055 m!1274605))

(declare-fun m!1274609 () Bool)

(assert (=> b!1388880 m!1274609))

(assert (=> b!1388790 d!150055))

(declare-fun d!150059 () Bool)

(assert (=> d!150059 (= (validKeyInArray!0 (select (arr!45858 a!2901) i!1037)) (and (not (= (select (arr!45858 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45858 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388789 d!150059))

(check-sat (not b!1388880) (not d!150047) (not b!1388858) (not bm!66655) (not b!1388844) (not b!1388857) (not d!150055) (not b!1388878) (not b!1388843))
(check-sat)
