; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118948 () Bool)

(assert start!118948)

(declare-fun b!1388813 () Bool)

(declare-fun res!929063 () Bool)

(declare-fun e!786718 () Bool)

(assert (=> b!1388813 (=> (not res!929063) (not e!786718))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94978 0))(
  ( (array!94979 (arr!45859 (Array (_ BitVec 32) (_ BitVec 64))) (size!46409 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94978)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388813 (= res!929063 (and (= (size!46409 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46409 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46409 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388814 () Bool)

(declare-fun e!786719 () Bool)

(declare-datatypes ((List!32378 0))(
  ( (Nil!32375) (Cons!32374 (h!33589 (_ BitVec 64)) (t!47072 List!32378)) )
))
(declare-fun contains!9755 (List!32378 (_ BitVec 64)) Bool)

(assert (=> b!1388814 (= e!786719 (contains!9755 Nil!32375 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388815 () Bool)

(assert (=> b!1388815 (= e!786718 e!786719)))

(declare-fun res!929068 () Bool)

(assert (=> b!1388815 (=> res!929068 e!786719)))

(assert (=> b!1388815 (= res!929068 (contains!9755 Nil!32375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388816 () Bool)

(declare-fun res!929062 () Bool)

(assert (=> b!1388816 (=> (not res!929062) (not e!786718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94978 (_ BitVec 32)) Bool)

(assert (=> b!1388816 (= res!929062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388817 () Bool)

(declare-fun res!929065 () Bool)

(assert (=> b!1388817 (=> (not res!929065) (not e!786718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388817 (= res!929065 (validKeyInArray!0 (select (arr!45859 a!2901) i!1037)))))

(declare-fun b!1388818 () Bool)

(declare-fun res!929066 () Bool)

(assert (=> b!1388818 (=> (not res!929066) (not e!786718))))

(assert (=> b!1388818 (= res!929066 (and (bvsle #b00000000000000000000000000000000 (size!46409 a!2901)) (bvslt (size!46409 a!2901) #b01111111111111111111111111111111)))))

(declare-fun res!929064 () Bool)

(assert (=> start!118948 (=> (not res!929064) (not e!786718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118948 (= res!929064 (validMask!0 mask!2840))))

(assert (=> start!118948 e!786718))

(assert (=> start!118948 true))

(declare-fun array_inv!34887 (array!94978) Bool)

(assert (=> start!118948 (array_inv!34887 a!2901)))

(declare-fun b!1388819 () Bool)

(declare-fun res!929061 () Bool)

(assert (=> b!1388819 (=> (not res!929061) (not e!786718))))

(assert (=> b!1388819 (= res!929061 (validKeyInArray!0 (select (arr!45859 a!2901) j!112)))))

(declare-fun b!1388820 () Bool)

(declare-fun res!929067 () Bool)

(assert (=> b!1388820 (=> (not res!929067) (not e!786718))))

(declare-fun noDuplicate!2605 (List!32378) Bool)

(assert (=> b!1388820 (= res!929067 (noDuplicate!2605 Nil!32375))))

(assert (= (and start!118948 res!929064) b!1388813))

(assert (= (and b!1388813 res!929063) b!1388817))

(assert (= (and b!1388817 res!929065) b!1388819))

(assert (= (and b!1388819 res!929061) b!1388816))

(assert (= (and b!1388816 res!929062) b!1388818))

(assert (= (and b!1388818 res!929066) b!1388820))

(assert (= (and b!1388820 res!929067) b!1388815))

(assert (= (and b!1388815 (not res!929068)) b!1388814))

(declare-fun m!1274533 () Bool)

(assert (=> b!1388819 m!1274533))

(assert (=> b!1388819 m!1274533))

(declare-fun m!1274535 () Bool)

(assert (=> b!1388819 m!1274535))

(declare-fun m!1274537 () Bool)

(assert (=> b!1388814 m!1274537))

(declare-fun m!1274539 () Bool)

(assert (=> b!1388820 m!1274539))

(declare-fun m!1274541 () Bool)

(assert (=> b!1388815 m!1274541))

(declare-fun m!1274543 () Bool)

(assert (=> b!1388816 m!1274543))

(declare-fun m!1274545 () Bool)

(assert (=> b!1388817 m!1274545))

(assert (=> b!1388817 m!1274545))

(declare-fun m!1274547 () Bool)

(assert (=> b!1388817 m!1274547))

(declare-fun m!1274549 () Bool)

(assert (=> start!118948 m!1274549))

(declare-fun m!1274551 () Bool)

(assert (=> start!118948 m!1274551))

(push 1)

(assert (not b!1388820))

(assert (not b!1388816))

(assert (not b!1388815))

(assert (not b!1388814))

(assert (not b!1388817))

(assert (not b!1388819))

(assert (not start!118948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150027 () Bool)

(assert (=> d!150027 (= (validKeyInArray!0 (select (arr!45859 a!2901) i!1037)) (and (not (= (select (arr!45859 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45859 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388817 d!150027))

(declare-fun d!150029 () Bool)

(assert (=> d!150029 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118948 d!150029))

(declare-fun d!150037 () Bool)

(assert (=> d!150037 (= (array_inv!34887 a!2901) (bvsge (size!46409 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118948 d!150037))

(declare-fun bm!66658 () Bool)

(declare-fun call!66661 () Bool)

(assert (=> bm!66658 (= call!66661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150039 () Bool)

(declare-fun res!929098 () Bool)

(declare-fun e!786756 () Bool)

(assert (=> d!150039 (=> res!929098 e!786756)))

(assert (=> d!150039 (= res!929098 (bvsge #b00000000000000000000000000000000 (size!46409 a!2901)))))

(assert (=> d!150039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786756)))

(declare-fun b!1388865 () Bool)

(declare-fun e!786757 () Bool)

(assert (=> b!1388865 (= e!786757 call!66661)))

(declare-fun b!1388866 () Bool)

(assert (=> b!1388866 (= e!786756 e!786757)))

(declare-fun c!129327 () Bool)

(assert (=> b!1388866 (= c!129327 (validKeyInArray!0 (select (arr!45859 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388867 () Bool)

(declare-fun e!786758 () Bool)

(assert (=> b!1388867 (= e!786757 e!786758)))

(declare-fun lt!610440 () (_ BitVec 64))

(assert (=> b!1388867 (= lt!610440 (select (arr!45859 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46422 0))(
  ( (Unit!46423) )
))
(declare-fun lt!610438 () Unit!46422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94978 (_ BitVec 64) (_ BitVec 32)) Unit!46422)

(assert (=> b!1388867 (= lt!610438 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610440 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388867 (arrayContainsKey!0 a!2901 lt!610440 #b00000000000000000000000000000000)))

(declare-fun lt!610439 () Unit!46422)

(assert (=> b!1388867 (= lt!610439 lt!610438)))

(declare-fun res!929097 () Bool)

(declare-datatypes ((SeekEntryResult!10194 0))(
  ( (MissingZero!10194 (index!43147 (_ BitVec 32))) (Found!10194 (index!43148 (_ BitVec 32))) (Intermediate!10194 (undefined!11006 Bool) (index!43149 (_ BitVec 32)) (x!124789 (_ BitVec 32))) (Undefined!10194) (MissingVacant!10194 (index!43150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94978 (_ BitVec 32)) SeekEntryResult!10194)

(assert (=> b!1388867 (= res!929097 (= (seekEntryOrOpen!0 (select (arr!45859 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10194 #b00000000000000000000000000000000)))))

(assert (=> b!1388867 (=> (not res!929097) (not e!786758))))

(declare-fun b!1388868 () Bool)

(assert (=> b!1388868 (= e!786758 call!66661)))

(assert (= (and d!150039 (not res!929098)) b!1388866))

(assert (= (and b!1388866 c!129327) b!1388867))

(assert (= (and b!1388866 (not c!129327)) b!1388865))

(assert (= (and b!1388867 res!929097) b!1388868))

(assert (= (or b!1388868 b!1388865) bm!66658))

(declare-fun m!1274587 () Bool)

(assert (=> bm!66658 m!1274587))

(declare-fun m!1274589 () Bool)

(assert (=> b!1388866 m!1274589))

(assert (=> b!1388866 m!1274589))

(declare-fun m!1274591 () Bool)

(assert (=> b!1388866 m!1274591))

(assert (=> b!1388867 m!1274589))

(declare-fun m!1274593 () Bool)

(assert (=> b!1388867 m!1274593))

(declare-fun m!1274595 () Bool)

(assert (=> b!1388867 m!1274595))

