; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127412 () Bool)

(assert start!127412)

(declare-fun b!1497587 () Bool)

(declare-fun res!1018876 () Bool)

(declare-fun e!838587 () Bool)

(assert (=> b!1497587 (=> (not res!1018876) (not e!838587))))

(declare-datatypes ((array!99820 0))(
  ( (array!99821 (arr!48172 (Array (_ BitVec 32) (_ BitVec 64))) (size!48724 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99820)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1497587 (= res!1018876 (and (= (size!48724 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48724 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48724 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497588 () Bool)

(declare-fun res!1018871 () Bool)

(assert (=> b!1497588 (=> (not res!1018871) (not e!838587))))

(assert (=> b!1497588 (= res!1018871 (and (bvsle #b00000000000000000000000000000000 (size!48724 a!2850)) (bvslt (size!48724 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1497589 () Bool)

(declare-fun res!1018870 () Bool)

(assert (=> b!1497589 (=> (not res!1018870) (not e!838587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497589 (= res!1018870 (validKeyInArray!0 (select (arr!48172 a!2850) j!87)))))

(declare-fun b!1497590 () Bool)

(declare-fun res!1018869 () Bool)

(assert (=> b!1497590 (=> (not res!1018869) (not e!838587))))

(assert (=> b!1497590 (= res!1018869 (validKeyInArray!0 (select (arr!48172 a!2850) i!996)))))

(declare-fun res!1018873 () Bool)

(assert (=> start!127412 (=> (not res!1018873) (not e!838587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127412 (= res!1018873 (validMask!0 mask!2661))))

(assert (=> start!127412 e!838587))

(assert (=> start!127412 true))

(declare-fun array_inv!37405 (array!99820) Bool)

(assert (=> start!127412 (array_inv!37405 a!2850)))

(declare-fun b!1497591 () Bool)

(declare-fun res!1018872 () Bool)

(assert (=> b!1497591 (=> (not res!1018872) (not e!838587))))

(declare-datatypes ((List!34742 0))(
  ( (Nil!34739) (Cons!34738 (h!36136 (_ BitVec 64)) (t!49428 List!34742)) )
))
(declare-fun noDuplicate!2643 (List!34742) Bool)

(assert (=> b!1497591 (= res!1018872 (noDuplicate!2643 Nil!34739))))

(declare-fun b!1497592 () Bool)

(declare-fun res!1018875 () Bool)

(assert (=> b!1497592 (=> (not res!1018875) (not e!838587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99820 (_ BitVec 32)) Bool)

(assert (=> b!1497592 (= res!1018875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497593 () Bool)

(declare-fun e!838588 () Bool)

(assert (=> b!1497593 (= e!838587 e!838588)))

(declare-fun res!1018874 () Bool)

(assert (=> b!1497593 (=> res!1018874 e!838588)))

(declare-fun contains!9906 (List!34742 (_ BitVec 64)) Bool)

(assert (=> b!1497593 (= res!1018874 (contains!9906 Nil!34739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497594 () Bool)

(assert (=> b!1497594 (= e!838588 (contains!9906 Nil!34739 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!127412 res!1018873) b!1497587))

(assert (= (and b!1497587 res!1018876) b!1497590))

(assert (= (and b!1497590 res!1018869) b!1497589))

(assert (= (and b!1497589 res!1018870) b!1497592))

(assert (= (and b!1497592 res!1018875) b!1497588))

(assert (= (and b!1497588 res!1018871) b!1497591))

(assert (= (and b!1497591 res!1018872) b!1497593))

(assert (= (and b!1497593 (not res!1018874)) b!1497594))

(declare-fun m!1380117 () Bool)

(assert (=> start!127412 m!1380117))

(declare-fun m!1380119 () Bool)

(assert (=> start!127412 m!1380119))

(declare-fun m!1380121 () Bool)

(assert (=> b!1497593 m!1380121))

(declare-fun m!1380123 () Bool)

(assert (=> b!1497590 m!1380123))

(assert (=> b!1497590 m!1380123))

(declare-fun m!1380125 () Bool)

(assert (=> b!1497590 m!1380125))

(declare-fun m!1380127 () Bool)

(assert (=> b!1497592 m!1380127))

(declare-fun m!1380129 () Bool)

(assert (=> b!1497591 m!1380129))

(declare-fun m!1380131 () Bool)

(assert (=> b!1497589 m!1380131))

(assert (=> b!1497589 m!1380131))

(declare-fun m!1380133 () Bool)

(assert (=> b!1497589 m!1380133))

(declare-fun m!1380135 () Bool)

(assert (=> b!1497594 m!1380135))

(check-sat (not b!1497594) (not b!1497589) (not b!1497593) (not b!1497592) (not b!1497590) (not start!127412) (not b!1497591))
(check-sat)
(get-model)

(declare-fun d!157255 () Bool)

(assert (=> d!157255 (= (validKeyInArray!0 (select (arr!48172 a!2850) j!87)) (and (not (= (select (arr!48172 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48172 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497589 d!157255))

(declare-fun d!157257 () Bool)

(declare-fun lt!652283 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!773 (List!34742) (InoxSet (_ BitVec 64)))

(assert (=> d!157257 (= lt!652283 (select (content!773 Nil!34739) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838613 () Bool)

(assert (=> d!157257 (= lt!652283 e!838613)))

(declare-fun res!1018929 () Bool)

(assert (=> d!157257 (=> (not res!1018929) (not e!838613))))

(get-info :version)

(assert (=> d!157257 (= res!1018929 ((_ is Cons!34738) Nil!34739))))

(assert (=> d!157257 (= (contains!9906 Nil!34739 #b1000000000000000000000000000000000000000000000000000000000000000) lt!652283)))

(declare-fun b!1497647 () Bool)

(declare-fun e!838612 () Bool)

(assert (=> b!1497647 (= e!838613 e!838612)))

(declare-fun res!1018930 () Bool)

(assert (=> b!1497647 (=> res!1018930 e!838612)))

(assert (=> b!1497647 (= res!1018930 (= (h!36136 Nil!34739) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497648 () Bool)

(assert (=> b!1497648 (= e!838612 (contains!9906 (t!49428 Nil!34739) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157257 res!1018929) b!1497647))

(assert (= (and b!1497647 (not res!1018930)) b!1497648))

(declare-fun m!1380177 () Bool)

(assert (=> d!157257 m!1380177))

(declare-fun m!1380179 () Bool)

(assert (=> d!157257 m!1380179))

(declare-fun m!1380181 () Bool)

(assert (=> b!1497648 m!1380181))

(assert (=> b!1497594 d!157257))

(declare-fun d!157259 () Bool)

(assert (=> d!157259 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127412 d!157259))

(declare-fun d!157267 () Bool)

(assert (=> d!157267 (= (array_inv!37405 a!2850) (bvsge (size!48724 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127412 d!157267))

(declare-fun d!157269 () Bool)

(assert (=> d!157269 (= (validKeyInArray!0 (select (arr!48172 a!2850) i!996)) (and (not (= (select (arr!48172 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48172 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497590 d!157269))

(declare-fun d!157271 () Bool)

(declare-fun res!1018952 () Bool)

(declare-fun e!838639 () Bool)

(assert (=> d!157271 (=> res!1018952 e!838639)))

(assert (=> d!157271 (= res!1018952 (bvsge #b00000000000000000000000000000000 (size!48724 a!2850)))))

(assert (=> d!157271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838639)))

(declare-fun bm!68026 () Bool)

(declare-fun call!68029 () Bool)

(assert (=> bm!68026 (= call!68029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497677 () Bool)

(declare-fun e!838638 () Bool)

(declare-fun e!838640 () Bool)

(assert (=> b!1497677 (= e!838638 e!838640)))

(declare-fun lt!652300 () (_ BitVec 64))

(assert (=> b!1497677 (= lt!652300 (select (arr!48172 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50039 0))(
  ( (Unit!50040) )
))
(declare-fun lt!652299 () Unit!50039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99820 (_ BitVec 64) (_ BitVec 32)) Unit!50039)

(assert (=> b!1497677 (= lt!652299 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652300 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497677 (arrayContainsKey!0 a!2850 lt!652300 #b00000000000000000000000000000000)))

(declare-fun lt!652301 () Unit!50039)

(assert (=> b!1497677 (= lt!652301 lt!652299)))

(declare-fun res!1018951 () Bool)

(declare-datatypes ((SeekEntryResult!12429 0))(
  ( (MissingZero!12429 (index!52108 (_ BitVec 32))) (Found!12429 (index!52109 (_ BitVec 32))) (Intermediate!12429 (undefined!13241 Bool) (index!52110 (_ BitVec 32)) (x!133746 (_ BitVec 32))) (Undefined!12429) (MissingVacant!12429 (index!52111 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99820 (_ BitVec 32)) SeekEntryResult!12429)

(assert (=> b!1497677 (= res!1018951 (= (seekEntryOrOpen!0 (select (arr!48172 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12429 #b00000000000000000000000000000000)))))

(assert (=> b!1497677 (=> (not res!1018951) (not e!838640))))

(declare-fun b!1497678 () Bool)

(assert (=> b!1497678 (= e!838640 call!68029)))

(declare-fun b!1497679 () Bool)

(assert (=> b!1497679 (= e!838639 e!838638)))

(declare-fun c!138900 () Bool)

(assert (=> b!1497679 (= c!138900 (validKeyInArray!0 (select (arr!48172 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1497680 () Bool)

(assert (=> b!1497680 (= e!838638 call!68029)))

(assert (= (and d!157271 (not res!1018952)) b!1497679))

(assert (= (and b!1497679 c!138900) b!1497677))

(assert (= (and b!1497679 (not c!138900)) b!1497680))

(assert (= (and b!1497677 res!1018951) b!1497678))

(assert (= (or b!1497678 b!1497680) bm!68026))

(declare-fun m!1380193 () Bool)

(assert (=> bm!68026 m!1380193))

(declare-fun m!1380195 () Bool)

(assert (=> b!1497677 m!1380195))

(declare-fun m!1380197 () Bool)

(assert (=> b!1497677 m!1380197))

(declare-fun m!1380199 () Bool)

(assert (=> b!1497677 m!1380199))

(assert (=> b!1497677 m!1380195))

(declare-fun m!1380201 () Bool)

(assert (=> b!1497677 m!1380201))

(assert (=> b!1497679 m!1380195))

(assert (=> b!1497679 m!1380195))

(declare-fun m!1380203 () Bool)

(assert (=> b!1497679 m!1380203))

(assert (=> b!1497592 d!157271))

(declare-fun d!157277 () Bool)

(declare-fun res!1018959 () Bool)

(declare-fun e!838648 () Bool)

(assert (=> d!157277 (=> res!1018959 e!838648)))

(assert (=> d!157277 (= res!1018959 ((_ is Nil!34739) Nil!34739))))

(assert (=> d!157277 (= (noDuplicate!2643 Nil!34739) e!838648)))

(declare-fun b!1497689 () Bool)

(declare-fun e!838649 () Bool)

(assert (=> b!1497689 (= e!838648 e!838649)))

(declare-fun res!1018960 () Bool)

(assert (=> b!1497689 (=> (not res!1018960) (not e!838649))))

(assert (=> b!1497689 (= res!1018960 (not (contains!9906 (t!49428 Nil!34739) (h!36136 Nil!34739))))))

(declare-fun b!1497690 () Bool)

(assert (=> b!1497690 (= e!838649 (noDuplicate!2643 (t!49428 Nil!34739)))))

(assert (= (and d!157277 (not res!1018959)) b!1497689))

(assert (= (and b!1497689 res!1018960) b!1497690))

(declare-fun m!1380217 () Bool)

(assert (=> b!1497689 m!1380217))

(declare-fun m!1380219 () Bool)

(assert (=> b!1497690 m!1380219))

(assert (=> b!1497591 d!157277))

(declare-fun d!157283 () Bool)

(declare-fun lt!652305 () Bool)

(assert (=> d!157283 (= lt!652305 (select (content!773 Nil!34739) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838651 () Bool)

(assert (=> d!157283 (= lt!652305 e!838651)))

(declare-fun res!1018961 () Bool)

(assert (=> d!157283 (=> (not res!1018961) (not e!838651))))

(assert (=> d!157283 (= res!1018961 ((_ is Cons!34738) Nil!34739))))

(assert (=> d!157283 (= (contains!9906 Nil!34739 #b0000000000000000000000000000000000000000000000000000000000000000) lt!652305)))

(declare-fun b!1497691 () Bool)

(declare-fun e!838650 () Bool)

(assert (=> b!1497691 (= e!838651 e!838650)))

(declare-fun res!1018962 () Bool)

(assert (=> b!1497691 (=> res!1018962 e!838650)))

(assert (=> b!1497691 (= res!1018962 (= (h!36136 Nil!34739) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497692 () Bool)

(assert (=> b!1497692 (= e!838650 (contains!9906 (t!49428 Nil!34739) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157283 res!1018961) b!1497691))

(assert (= (and b!1497691 (not res!1018962)) b!1497692))

(assert (=> d!157283 m!1380177))

(declare-fun m!1380221 () Bool)

(assert (=> d!157283 m!1380221))

(declare-fun m!1380223 () Bool)

(assert (=> b!1497692 m!1380223))

(assert (=> b!1497593 d!157283))

(check-sat (not b!1497689) (not bm!68026) (not d!157283) (not b!1497648) (not b!1497690) (not b!1497677) (not d!157257) (not b!1497692) (not b!1497679))
(check-sat)
