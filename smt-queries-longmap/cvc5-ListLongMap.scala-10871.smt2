; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127422 () Bool)

(assert start!127422)

(declare-fun b!1497789 () Bool)

(declare-fun res!1018901 () Bool)

(declare-fun e!838720 () Bool)

(assert (=> b!1497789 (=> (not res!1018901) (not e!838720))))

(declare-datatypes ((array!99863 0))(
  ( (array!99864 (arr!48194 (Array (_ BitVec 32) (_ BitVec 64))) (size!48744 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99863)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497789 (= res!1018901 (validKeyInArray!0 (select (arr!48194 a!2850) j!87)))))

(declare-fun b!1497790 () Bool)

(declare-datatypes ((List!34686 0))(
  ( (Nil!34683) (Cons!34682 (h!36079 (_ BitVec 64)) (t!49380 List!34686)) )
))
(declare-fun noDuplicate!2618 (List!34686) Bool)

(assert (=> b!1497790 (= e!838720 (not (noDuplicate!2618 Nil!34683)))))

(declare-fun b!1497791 () Bool)

(declare-fun res!1018906 () Bool)

(assert (=> b!1497791 (=> (not res!1018906) (not e!838720))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497791 (= res!1018906 (validKeyInArray!0 (select (arr!48194 a!2850) i!996)))))

(declare-fun b!1497792 () Bool)

(declare-fun res!1018905 () Bool)

(assert (=> b!1497792 (=> (not res!1018905) (not e!838720))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1497792 (= res!1018905 (and (= (size!48744 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48744 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48744 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1018902 () Bool)

(assert (=> start!127422 (=> (not res!1018902) (not e!838720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127422 (= res!1018902 (validMask!0 mask!2661))))

(assert (=> start!127422 e!838720))

(assert (=> start!127422 true))

(declare-fun array_inv!37222 (array!99863) Bool)

(assert (=> start!127422 (array_inv!37222 a!2850)))

(declare-fun b!1497793 () Bool)

(declare-fun res!1018904 () Bool)

(assert (=> b!1497793 (=> (not res!1018904) (not e!838720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99863 (_ BitVec 32)) Bool)

(assert (=> b!1497793 (= res!1018904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497794 () Bool)

(declare-fun res!1018903 () Bool)

(assert (=> b!1497794 (=> (not res!1018903) (not e!838720))))

(assert (=> b!1497794 (= res!1018903 (and (bvsle #b00000000000000000000000000000000 (size!48744 a!2850)) (bvslt (size!48744 a!2850) #b01111111111111111111111111111111)))))

(assert (= (and start!127422 res!1018902) b!1497792))

(assert (= (and b!1497792 res!1018905) b!1497791))

(assert (= (and b!1497791 res!1018906) b!1497789))

(assert (= (and b!1497789 res!1018901) b!1497793))

(assert (= (and b!1497793 res!1018904) b!1497794))

(assert (= (and b!1497794 res!1018903) b!1497790))

(declare-fun m!1380871 () Bool)

(assert (=> b!1497791 m!1380871))

(assert (=> b!1497791 m!1380871))

(declare-fun m!1380873 () Bool)

(assert (=> b!1497791 m!1380873))

(declare-fun m!1380875 () Bool)

(assert (=> b!1497790 m!1380875))

(declare-fun m!1380877 () Bool)

(assert (=> b!1497793 m!1380877))

(declare-fun m!1380879 () Bool)

(assert (=> b!1497789 m!1380879))

(assert (=> b!1497789 m!1380879))

(declare-fun m!1380881 () Bool)

(assert (=> b!1497789 m!1380881))

(declare-fun m!1380883 () Bool)

(assert (=> start!127422 m!1380883))

(declare-fun m!1380885 () Bool)

(assert (=> start!127422 m!1380885))

(push 1)

(assert (not b!1497793))

(assert (not b!1497791))

(assert (not b!1497789))

(assert (not b!1497790))

(assert (not start!127422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157465 () Bool)

(declare-fun res!1018959 () Bool)

(declare-fun e!838756 () Bool)

(assert (=> d!157465 (=> res!1018959 e!838756)))

(assert (=> d!157465 (= res!1018959 (bvsge #b00000000000000000000000000000000 (size!48744 a!2850)))))

(assert (=> d!157465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838756)))

(declare-fun b!1497857 () Bool)

(declare-fun e!838755 () Bool)

(declare-fun e!838754 () Bool)

(assert (=> b!1497857 (= e!838755 e!838754)))

(declare-fun lt!652548 () (_ BitVec 64))

(assert (=> b!1497857 (= lt!652548 (select (arr!48194 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50198 0))(
  ( (Unit!50199) )
))
(declare-fun lt!652547 () Unit!50198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99863 (_ BitVec 64) (_ BitVec 32)) Unit!50198)

(assert (=> b!1497857 (= lt!652547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497857 (arrayContainsKey!0 a!2850 lt!652548 #b00000000000000000000000000000000)))

(declare-fun lt!652549 () Unit!50198)

(assert (=> b!1497857 (= lt!652549 lt!652547)))

(declare-fun res!1018960 () Bool)

(declare-datatypes ((SeekEntryResult!12429 0))(
  ( (MissingZero!12429 (index!52108 (_ BitVec 32))) (Found!12429 (index!52109 (_ BitVec 32))) (Intermediate!12429 (undefined!13241 Bool) (index!52110 (_ BitVec 32)) (x!133743 (_ BitVec 32))) (Undefined!12429) (MissingVacant!12429 (index!52111 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99863 (_ BitVec 32)) SeekEntryResult!12429)

(assert (=> b!1497857 (= res!1018960 (= (seekEntryOrOpen!0 (select (arr!48194 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12429 #b00000000000000000000000000000000)))))

(assert (=> b!1497857 (=> (not res!1018960) (not e!838754))))

(declare-fun bm!68052 () Bool)

(declare-fun call!68055 () Bool)

(assert (=> bm!68052 (= call!68055 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497858 () Bool)

(assert (=> b!1497858 (= e!838755 call!68055)))

(declare-fun b!1497859 () Bool)

(assert (=> b!1497859 (= e!838756 e!838755)))

(declare-fun c!138983 () Bool)

(assert (=> b!1497859 (= c!138983 (validKeyInArray!0 (select (arr!48194 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1497860 () Bool)

(assert (=> b!1497860 (= e!838754 call!68055)))

(assert (= (and d!157465 (not res!1018959)) b!1497859))

(assert (= (and b!1497859 c!138983) b!1497857))

(assert (= (and b!1497859 (not c!138983)) b!1497858))

(assert (= (and b!1497857 res!1018960) b!1497860))

(assert (= (or b!1497860 b!1497858) bm!68052))

(declare-fun m!1380935 () Bool)

(assert (=> b!1497857 m!1380935))

(declare-fun m!1380937 () Bool)

(assert (=> b!1497857 m!1380937))

(declare-fun m!1380939 () Bool)

(assert (=> b!1497857 m!1380939))

(assert (=> b!1497857 m!1380935))

(declare-fun m!1380941 () Bool)

(assert (=> b!1497857 m!1380941))

(declare-fun m!1380943 () Bool)

(assert (=> bm!68052 m!1380943))

(assert (=> b!1497859 m!1380935))

(assert (=> b!1497859 m!1380935))

