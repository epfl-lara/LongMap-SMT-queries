; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127458 () Bool)

(assert start!127458)

(declare-fun b!1497901 () Bool)

(declare-fun res!1019000 () Bool)

(declare-fun e!838785 () Bool)

(assert (=> b!1497901 (=> (not res!1019000) (not e!838785))))

(declare-datatypes ((array!99872 0))(
  ( (array!99873 (arr!48197 (Array (_ BitVec 32) (_ BitVec 64))) (size!48747 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99872)

(assert (=> b!1497901 (= res!1019000 (and (bvsle #b00000000000000000000000000000000 (size!48747 a!2850)) (bvslt (size!48747 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1497902 () Bool)

(declare-fun res!1018997 () Bool)

(assert (=> b!1497902 (=> (not res!1018997) (not e!838785))))

(declare-datatypes ((List!34689 0))(
  ( (Nil!34686) (Cons!34685 (h!36082 (_ BitVec 64)) (t!49383 List!34689)) )
))
(declare-fun noDuplicate!2621 (List!34689) Bool)

(assert (=> b!1497902 (= res!1018997 (noDuplicate!2621 Nil!34686))))

(declare-fun res!1018999 () Bool)

(assert (=> start!127458 (=> (not res!1018999) (not e!838785))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127458 (= res!1018999 (validMask!0 mask!2661))))

(assert (=> start!127458 e!838785))

(assert (=> start!127458 true))

(declare-fun array_inv!37225 (array!99872) Bool)

(assert (=> start!127458 (array_inv!37225 a!2850)))

(declare-fun b!1497903 () Bool)

(declare-fun res!1018996 () Bool)

(assert (=> b!1497903 (=> (not res!1018996) (not e!838785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99872 (_ BitVec 32)) Bool)

(assert (=> b!1497903 (= res!1018996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497904 () Bool)

(declare-fun e!838784 () Bool)

(declare-fun contains!9938 (List!34689 (_ BitVec 64)) Bool)

(assert (=> b!1497904 (= e!838784 (contains!9938 Nil!34686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497905 () Bool)

(assert (=> b!1497905 (= e!838785 e!838784)))

(declare-fun res!1019002 () Bool)

(assert (=> b!1497905 (=> res!1019002 e!838784)))

(assert (=> b!1497905 (= res!1019002 (contains!9938 Nil!34686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497906 () Bool)

(declare-fun res!1018998 () Bool)

(assert (=> b!1497906 (=> (not res!1018998) (not e!838785))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497906 (= res!1018998 (and (= (size!48747 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48747 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48747 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497907 () Bool)

(declare-fun res!1019001 () Bool)

(assert (=> b!1497907 (=> (not res!1019001) (not e!838785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497907 (= res!1019001 (validKeyInArray!0 (select (arr!48197 a!2850) i!996)))))

(declare-fun b!1497908 () Bool)

(declare-fun res!1018995 () Bool)

(assert (=> b!1497908 (=> (not res!1018995) (not e!838785))))

(assert (=> b!1497908 (= res!1018995 (validKeyInArray!0 (select (arr!48197 a!2850) j!87)))))

(assert (= (and start!127458 res!1018999) b!1497906))

(assert (= (and b!1497906 res!1018998) b!1497907))

(assert (= (and b!1497907 res!1019001) b!1497908))

(assert (= (and b!1497908 res!1018995) b!1497903))

(assert (= (and b!1497903 res!1018996) b!1497901))

(assert (= (and b!1497901 res!1019000) b!1497902))

(assert (= (and b!1497902 res!1018997) b!1497905))

(assert (= (and b!1497905 (not res!1019002)) b!1497904))

(declare-fun m!1380967 () Bool)

(assert (=> b!1497905 m!1380967))

(declare-fun m!1380969 () Bool)

(assert (=> start!127458 m!1380969))

(declare-fun m!1380971 () Bool)

(assert (=> start!127458 m!1380971))

(declare-fun m!1380973 () Bool)

(assert (=> b!1497908 m!1380973))

(assert (=> b!1497908 m!1380973))

(declare-fun m!1380975 () Bool)

(assert (=> b!1497908 m!1380975))

(declare-fun m!1380977 () Bool)

(assert (=> b!1497907 m!1380977))

(assert (=> b!1497907 m!1380977))

(declare-fun m!1380979 () Bool)

(assert (=> b!1497907 m!1380979))

(declare-fun m!1380981 () Bool)

(assert (=> b!1497904 m!1380981))

(declare-fun m!1380983 () Bool)

(assert (=> b!1497903 m!1380983))

(declare-fun m!1380985 () Bool)

(assert (=> b!1497902 m!1380985))

(push 1)

(assert (not b!1497903))

(assert (not b!1497905))

(assert (not b!1497907))

(assert (not b!1497902))

(assert (not b!1497908))

(assert (not b!1497904))

(assert (not start!127458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157501 () Bool)

(assert (=> d!157501 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127458 d!157501))

(declare-fun d!157515 () Bool)

(assert (=> d!157515 (= (array_inv!37225 a!2850) (bvsge (size!48747 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127458 d!157515))

(declare-fun d!157523 () Bool)

(declare-fun lt!652568 () Bool)

(declare-fun content!783 (List!34689) (Set (_ BitVec 64)))

(assert (=> d!157523 (= lt!652568 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!783 Nil!34686)))))

(declare-fun e!838824 () Bool)

(assert (=> d!157523 (= lt!652568 e!838824)))

(declare-fun res!1019070 () Bool)

(assert (=> d!157523 (=> (not res!1019070) (not e!838824))))

(assert (=> d!157523 (= res!1019070 (is-Cons!34685 Nil!34686))))

(assert (=> d!157523 (= (contains!9938 Nil!34686 #b1000000000000000000000000000000000000000000000000000000000000000) lt!652568)))

(declare-fun b!1497975 () Bool)

(declare-fun e!838823 () Bool)

(assert (=> b!1497975 (= e!838824 e!838823)))

(declare-fun res!1019069 () Bool)

(assert (=> b!1497975 (=> res!1019069 e!838823)))

(assert (=> b!1497975 (= res!1019069 (= (h!36082 Nil!34686) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497976 () Bool)

(assert (=> b!1497976 (= e!838823 (contains!9938 (t!49383 Nil!34686) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157523 res!1019070) b!1497975))

(assert (= (and b!1497975 (not res!1019069)) b!1497976))

(declare-fun m!1381043 () Bool)

(assert (=> d!157523 m!1381043))

(declare-fun m!1381045 () Bool)

(assert (=> d!157523 m!1381045))

(declare-fun m!1381047 () Bool)

(assert (=> b!1497976 m!1381047))

(assert (=> b!1497904 d!157523))

(declare-fun d!157525 () Bool)

(declare-fun lt!652575 () Bool)

(assert (=> d!157525 (= lt!652575 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!783 Nil!34686)))))

(declare-fun e!838832 () Bool)

(assert (=> d!157525 (= lt!652575 e!838832)))

(declare-fun res!1019076 () Bool)

(assert (=> d!157525 (=> (not res!1019076) (not e!838832))))

(assert (=> d!157525 (= res!1019076 (is-Cons!34685 Nil!34686))))

(assert (=> d!157525 (= (contains!9938 Nil!34686 #b0000000000000000000000000000000000000000000000000000000000000000) lt!652575)))

(declare-fun b!1497983 () Bool)

(declare-fun e!838831 () Bool)

(assert (=> b!1497983 (= e!838832 e!838831)))

(declare-fun res!1019075 () Bool)

(assert (=> b!1497983 (=> res!1019075 e!838831)))

(assert (=> b!1497983 (= res!1019075 (= (h!36082 Nil!34686) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497984 () Bool)

(assert (=> b!1497984 (= e!838831 (contains!9938 (t!49383 Nil!34686) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157525 res!1019076) b!1497983))

(assert (= (and b!1497983 (not res!1019075)) b!1497984))

(assert (=> d!157525 m!1381043))

(declare-fun m!1381049 () Bool)

(assert (=> d!157525 m!1381049))

(declare-fun m!1381051 () Bool)

(assert (=> b!1497984 m!1381051))

(assert (=> b!1497905 d!157525))

(declare-fun d!157527 () Bool)

(assert (=> d!157527 (= (validKeyInArray!0 (select (arr!48197 a!2850) i!996)) (and (not (= (select (arr!48197 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48197 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497907 d!157527))

(declare-fun d!157529 () Bool)

(declare-fun res!1019091 () Bool)

(declare-fun e!838850 () Bool)

(assert (=> d!157529 (=> res!1019091 e!838850)))

(assert (=> d!157529 (= res!1019091 (is-Nil!34686 Nil!34686))))

(assert (=> d!157529 (= (noDuplicate!2621 Nil!34686) e!838850)))

(declare-fun b!1498007 () Bool)

(declare-fun e!838851 () Bool)

(assert (=> b!1498007 (= e!838850 e!838851)))

(declare-fun res!1019092 () Bool)

(assert (=> b!1498007 (=> (not res!1019092) (not e!838851))))

(assert (=> b!1498007 (= res!1019092 (not (contains!9938 (t!49383 Nil!34686) (h!36082 Nil!34686))))))

(declare-fun b!1498008 () Bool)

(assert (=> b!1498008 (= e!838851 (noDuplicate!2621 (t!49383 Nil!34686)))))

(assert (= (and d!157529 (not res!1019091)) b!1498007))

(assert (= (and b!1498007 res!1019092) b!1498008))

(declare-fun m!1381065 () Bool)

(assert (=> b!1498007 m!1381065))

(declare-fun m!1381067 () Bool)

(assert (=> b!1498008 m!1381067))

(assert (=> b!1497902 d!157529))

(declare-fun b!1498031 () Bool)

(declare-fun e!838873 () Bool)

(declare-fun e!838871 () Bool)

(assert (=> b!1498031 (= e!838873 e!838871)))

(declare-fun lt!652596 () (_ BitVec 64))

(assert (=> b!1498031 (= lt!652596 (select (arr!48197 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50206 0))(
  ( (Unit!50207) )
))
(declare-fun lt!652595 () Unit!50206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99872 (_ BitVec 64) (_ BitVec 32)) Unit!50206)

(assert (=> b!1498031 (= lt!652595 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652596 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1498031 (arrayContainsKey!0 a!2850 lt!652596 #b00000000000000000000000000000000)))

(declare-fun lt!652597 () Unit!50206)

(assert (=> b!1498031 (= lt!652597 lt!652595)))

(declare-fun res!1019109 () Bool)

(declare-datatypes ((SeekEntryResult!12433 0))(
  ( (MissingZero!12433 (index!52124 (_ BitVec 32))) (Found!12433 (index!52125 (_ BitVec 32))) (Intermediate!12433 (undefined!13245 Bool) (index!52126 (_ BitVec 32)) (x!133755 (_ BitVec 32))) (Undefined!12433) (MissingVacant!12433 (index!52127 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99872 (_ BitVec 32)) SeekEntryResult!12433)

(assert (=> b!1498031 (= res!1019109 (= (seekEntryOrOpen!0 (select (arr!48197 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12433 #b00000000000000000000000000000000)))))

(assert (=> b!1498031 (=> (not res!1019109) (not e!838871))))

(declare-fun d!157535 () Bool)

(declare-fun res!1019110 () Bool)

(declare-fun e!838872 () Bool)

(assert (=> d!157535 (=> res!1019110 e!838872)))

(assert (=> d!157535 (= res!1019110 (bvsge #b00000000000000000000000000000000 (size!48747 a!2850)))))

(assert (=> d!157535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838872)))

(declare-fun b!1498032 () Bool)

(assert (=> b!1498032 (= e!838872 e!838873)))

(declare-fun c!138995 () Bool)

(assert (=> b!1498032 (= c!138995 (validKeyInArray!0 (select (arr!48197 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1498033 () Bool)

(declare-fun call!68067 () Bool)

(assert (=> b!1498033 (= e!838871 call!68067)))

(declare-fun b!1498034 () Bool)

(assert (=> b!1498034 (= e!838873 call!68067)))

(declare-fun bm!68064 () Bool)

(assert (=> bm!68064 (= call!68067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157535 (not res!1019110)) b!1498032))

(assert (= (and b!1498032 c!138995) b!1498031))

(assert (= (and b!1498032 (not c!138995)) b!1498034))

