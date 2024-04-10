; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128324 () Bool)

(assert start!128324)

(declare-fun b!1505734 () Bool)

(declare-fun res!1026148 () Bool)

(declare-fun e!841572 () Bool)

(assert (=> b!1505734 (=> (not res!1026148) (not e!841572))))

(declare-datatypes ((List!34945 0))(
  ( (Nil!34942) (Cons!34941 (h!36338 (_ BitVec 64)) (t!49639 List!34945)) )
))
(declare-fun noDuplicate!2628 (List!34945) Bool)

(assert (=> b!1505734 (= res!1026148 (noDuplicate!2628 Nil!34942))))

(declare-fun b!1505735 () Bool)

(declare-fun res!1026150 () Bool)

(assert (=> b!1505735 (=> (not res!1026150) (not e!841572))))

(declare-datatypes ((array!100429 0))(
  ( (array!100430 (arr!48462 (Array (_ BitVec 32) (_ BitVec 64))) (size!49012 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100429)

(assert (=> b!1505735 (= res!1026150 (and (bvsle #b00000000000000000000000000000000 (size!49012 a!2804)) (bvslt (size!49012 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505736 () Bool)

(declare-fun res!1026145 () Bool)

(assert (=> b!1505736 (=> (not res!1026145) (not e!841572))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505736 (= res!1026145 (validKeyInArray!0 (select (arr!48462 a!2804) i!961)))))

(declare-fun b!1505737 () Bool)

(declare-fun e!841573 () Bool)

(assert (=> b!1505737 (= e!841572 e!841573)))

(declare-fun res!1026151 () Bool)

(assert (=> b!1505737 (=> res!1026151 e!841573)))

(declare-fun contains!9959 (List!34945 (_ BitVec 64)) Bool)

(assert (=> b!1505737 (= res!1026151 (contains!9959 Nil!34942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505738 () Bool)

(assert (=> b!1505738 (= e!841573 (contains!9959 Nil!34942 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505739 () Bool)

(declare-fun res!1026147 () Bool)

(assert (=> b!1505739 (=> (not res!1026147) (not e!841572))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100429 (_ BitVec 32)) Bool)

(assert (=> b!1505739 (= res!1026147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026146 () Bool)

(assert (=> start!128324 (=> (not res!1026146) (not e!841572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128324 (= res!1026146 (validMask!0 mask!2512))))

(assert (=> start!128324 e!841572))

(assert (=> start!128324 true))

(declare-fun array_inv!37490 (array!100429) Bool)

(assert (=> start!128324 (array_inv!37490 a!2804)))

(declare-fun b!1505740 () Bool)

(declare-fun res!1026149 () Bool)

(assert (=> b!1505740 (=> (not res!1026149) (not e!841572))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505740 (= res!1026149 (and (= (size!49012 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49012 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49012 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505741 () Bool)

(declare-fun res!1026144 () Bool)

(assert (=> b!1505741 (=> (not res!1026144) (not e!841572))))

(assert (=> b!1505741 (= res!1026144 (validKeyInArray!0 (select (arr!48462 a!2804) j!70)))))

(assert (= (and start!128324 res!1026146) b!1505740))

(assert (= (and b!1505740 res!1026149) b!1505736))

(assert (= (and b!1505736 res!1026145) b!1505741))

(assert (= (and b!1505741 res!1026144) b!1505739))

(assert (= (and b!1505739 res!1026147) b!1505735))

(assert (= (and b!1505735 res!1026150) b!1505734))

(assert (= (and b!1505734 res!1026148) b!1505737))

(assert (= (and b!1505737 (not res!1026151)) b!1505738))

(declare-fun m!1388805 () Bool)

(assert (=> b!1505734 m!1388805))

(declare-fun m!1388807 () Bool)

(assert (=> b!1505737 m!1388807))

(declare-fun m!1388809 () Bool)

(assert (=> start!128324 m!1388809))

(declare-fun m!1388811 () Bool)

(assert (=> start!128324 m!1388811))

(declare-fun m!1388813 () Bool)

(assert (=> b!1505738 m!1388813))

(declare-fun m!1388815 () Bool)

(assert (=> b!1505736 m!1388815))

(assert (=> b!1505736 m!1388815))

(declare-fun m!1388817 () Bool)

(assert (=> b!1505736 m!1388817))

(declare-fun m!1388819 () Bool)

(assert (=> b!1505739 m!1388819))

(declare-fun m!1388821 () Bool)

(assert (=> b!1505741 m!1388821))

(assert (=> b!1505741 m!1388821))

(declare-fun m!1388823 () Bool)

(assert (=> b!1505741 m!1388823))

(check-sat (not b!1505734) (not b!1505738) (not b!1505741) (not b!1505736) (not b!1505739) (not b!1505737) (not start!128324))
(check-sat)
(get-model)

(declare-fun d!158101 () Bool)

(assert (=> d!158101 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128324 d!158101))

(declare-fun d!158115 () Bool)

(assert (=> d!158115 (= (array_inv!37490 a!2804) (bvsge (size!49012 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128324 d!158115))

(declare-fun d!158117 () Bool)

(declare-fun lt!654083 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!784 (List!34945) (InoxSet (_ BitVec 64)))

(assert (=> d!158117 (= lt!654083 (select (content!784 Nil!34942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841602 () Bool)

(assert (=> d!158117 (= lt!654083 e!841602)))

(declare-fun res!1026194 () Bool)

(assert (=> d!158117 (=> (not res!1026194) (not e!841602))))

(get-info :version)

(assert (=> d!158117 (= res!1026194 ((_ is Cons!34941) Nil!34942))))

(assert (=> d!158117 (= (contains!9959 Nil!34942 #b0000000000000000000000000000000000000000000000000000000000000000) lt!654083)))

(declare-fun b!1505784 () Bool)

(declare-fun e!841601 () Bool)

(assert (=> b!1505784 (= e!841602 e!841601)))

(declare-fun res!1026195 () Bool)

(assert (=> b!1505784 (=> res!1026195 e!841601)))

(assert (=> b!1505784 (= res!1026195 (= (h!36338 Nil!34942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505785 () Bool)

(assert (=> b!1505785 (= e!841601 (contains!9959 (t!49639 Nil!34942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158117 res!1026194) b!1505784))

(assert (= (and b!1505784 (not res!1026195)) b!1505785))

(declare-fun m!1388859 () Bool)

(assert (=> d!158117 m!1388859))

(declare-fun m!1388861 () Bool)

(assert (=> d!158117 m!1388861))

(declare-fun m!1388863 () Bool)

(assert (=> b!1505785 m!1388863))

(assert (=> b!1505737 d!158117))

(declare-fun d!158129 () Bool)

(assert (=> d!158129 (= (validKeyInArray!0 (select (arr!48462 a!2804) i!961)) (and (not (= (select (arr!48462 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48462 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505736 d!158129))

(declare-fun d!158131 () Bool)

(assert (=> d!158131 (= (validKeyInArray!0 (select (arr!48462 a!2804) j!70)) (and (not (= (select (arr!48462 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48462 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505741 d!158131))

(declare-fun d!158133 () Bool)

(declare-fun res!1026210 () Bool)

(declare-fun e!841619 () Bool)

(assert (=> d!158133 (=> res!1026210 e!841619)))

(assert (=> d!158133 (= res!1026210 ((_ is Nil!34942) Nil!34942))))

(assert (=> d!158133 (= (noDuplicate!2628 Nil!34942) e!841619)))

(declare-fun b!1505804 () Bool)

(declare-fun e!841620 () Bool)

(assert (=> b!1505804 (= e!841619 e!841620)))

(declare-fun res!1026211 () Bool)

(assert (=> b!1505804 (=> (not res!1026211) (not e!841620))))

(assert (=> b!1505804 (= res!1026211 (not (contains!9959 (t!49639 Nil!34942) (h!36338 Nil!34942))))))

(declare-fun b!1505805 () Bool)

(assert (=> b!1505805 (= e!841620 (noDuplicate!2628 (t!49639 Nil!34942)))))

(assert (= (and d!158133 (not res!1026210)) b!1505804))

(assert (= (and b!1505804 res!1026211) b!1505805))

(declare-fun m!1388869 () Bool)

(assert (=> b!1505804 m!1388869))

(declare-fun m!1388871 () Bool)

(assert (=> b!1505805 m!1388871))

(assert (=> b!1505734 d!158133))

(declare-fun d!158137 () Bool)

(declare-fun res!1026228 () Bool)

(declare-fun e!841644 () Bool)

(assert (=> d!158137 (=> res!1026228 e!841644)))

(assert (=> d!158137 (= res!1026228 (bvsge #b00000000000000000000000000000000 (size!49012 a!2804)))))

(assert (=> d!158137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841644)))

(declare-fun b!1505832 () Bool)

(declare-fun e!841643 () Bool)

(declare-fun e!841642 () Bool)

(assert (=> b!1505832 (= e!841643 e!841642)))

(declare-fun lt!654109 () (_ BitVec 64))

(assert (=> b!1505832 (= lt!654109 (select (arr!48462 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50308 0))(
  ( (Unit!50309) )
))
(declare-fun lt!654110 () Unit!50308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100429 (_ BitVec 64) (_ BitVec 32)) Unit!50308)

(assert (=> b!1505832 (= lt!654110 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654109 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505832 (arrayContainsKey!0 a!2804 lt!654109 #b00000000000000000000000000000000)))

(declare-fun lt!654108 () Unit!50308)

(assert (=> b!1505832 (= lt!654108 lt!654110)))

(declare-fun res!1026229 () Bool)

(declare-datatypes ((SeekEntryResult!12651 0))(
  ( (MissingZero!12651 (index!52999 (_ BitVec 32))) (Found!12651 (index!53000 (_ BitVec 32))) (Intermediate!12651 (undefined!13463 Bool) (index!53001 (_ BitVec 32)) (x!134710 (_ BitVec 32))) (Undefined!12651) (MissingVacant!12651 (index!53002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100429 (_ BitVec 32)) SeekEntryResult!12651)

(assert (=> b!1505832 (= res!1026229 (= (seekEntryOrOpen!0 (select (arr!48462 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12651 #b00000000000000000000000000000000)))))

(assert (=> b!1505832 (=> (not res!1026229) (not e!841642))))

(declare-fun bm!68198 () Bool)

(declare-fun call!68201 () Bool)

(assert (=> bm!68198 (= call!68201 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505833 () Bool)

(assert (=> b!1505833 (= e!841642 call!68201)))

(declare-fun b!1505834 () Bool)

(assert (=> b!1505834 (= e!841644 e!841643)))

(declare-fun c!139336 () Bool)

(assert (=> b!1505834 (= c!139336 (validKeyInArray!0 (select (arr!48462 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505835 () Bool)

(assert (=> b!1505835 (= e!841643 call!68201)))

(assert (= (and d!158137 (not res!1026228)) b!1505834))

(assert (= (and b!1505834 c!139336) b!1505832))

(assert (= (and b!1505834 (not c!139336)) b!1505835))

(assert (= (and b!1505832 res!1026229) b!1505833))

(assert (= (or b!1505833 b!1505835) bm!68198))

(declare-fun m!1388891 () Bool)

(assert (=> b!1505832 m!1388891))

(declare-fun m!1388893 () Bool)

(assert (=> b!1505832 m!1388893))

(declare-fun m!1388895 () Bool)

(assert (=> b!1505832 m!1388895))

(assert (=> b!1505832 m!1388891))

(declare-fun m!1388897 () Bool)

(assert (=> b!1505832 m!1388897))

(declare-fun m!1388899 () Bool)

(assert (=> bm!68198 m!1388899))

(assert (=> b!1505834 m!1388891))

(assert (=> b!1505834 m!1388891))

(declare-fun m!1388901 () Bool)

(assert (=> b!1505834 m!1388901))

(assert (=> b!1505739 d!158137))

(declare-fun d!158143 () Bool)

(declare-fun lt!654111 () Bool)

(assert (=> d!158143 (= lt!654111 (select (content!784 Nil!34942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841646 () Bool)

(assert (=> d!158143 (= lt!654111 e!841646)))

(declare-fun res!1026230 () Bool)

(assert (=> d!158143 (=> (not res!1026230) (not e!841646))))

(assert (=> d!158143 (= res!1026230 ((_ is Cons!34941) Nil!34942))))

(assert (=> d!158143 (= (contains!9959 Nil!34942 #b1000000000000000000000000000000000000000000000000000000000000000) lt!654111)))

(declare-fun b!1505836 () Bool)

(declare-fun e!841645 () Bool)

(assert (=> b!1505836 (= e!841646 e!841645)))

(declare-fun res!1026231 () Bool)

(assert (=> b!1505836 (=> res!1026231 e!841645)))

(assert (=> b!1505836 (= res!1026231 (= (h!36338 Nil!34942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505837 () Bool)

(assert (=> b!1505837 (= e!841645 (contains!9959 (t!49639 Nil!34942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158143 res!1026230) b!1505836))

(assert (= (and b!1505836 (not res!1026231)) b!1505837))

(assert (=> d!158143 m!1388859))

(declare-fun m!1388903 () Bool)

(assert (=> d!158143 m!1388903))

(declare-fun m!1388905 () Bool)

(assert (=> b!1505837 m!1388905))

(assert (=> b!1505738 d!158143))

(check-sat (not b!1505805) (not d!158117) (not b!1505832) (not d!158143) (not b!1505785) (not b!1505837) (not b!1505804) (not b!1505834) (not bm!68198))
(check-sat)
