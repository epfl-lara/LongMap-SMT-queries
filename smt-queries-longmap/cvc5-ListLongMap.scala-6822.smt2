; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85790 () Bool)

(assert start!85790)

(declare-fun b!995102 () Bool)

(declare-fun e!561517 () Bool)

(declare-datatypes ((List!20995 0))(
  ( (Nil!20992) (Cons!20991 (h!22153 (_ BitVec 64)) (t!29996 List!20995)) )
))
(declare-fun noDuplicate!1454 (List!20995) Bool)

(assert (=> b!995102 (= e!561517 (not (noDuplicate!1454 Nil!20992)))))

(declare-fun b!995103 () Bool)

(declare-fun res!665539 () Bool)

(declare-fun e!561515 () Bool)

(assert (=> b!995103 (=> (not res!665539) (not e!561515))))

(declare-datatypes ((array!62963 0))(
  ( (array!62964 (arr!30319 (Array (_ BitVec 32) (_ BitVec 64))) (size!30821 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62963)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995103 (= res!665539 (validKeyInArray!0 (select (arr!30319 a!3219) j!170)))))

(declare-fun b!995105 () Bool)

(declare-fun res!665538 () Bool)

(assert (=> b!995105 (=> (not res!665538) (not e!561515))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995105 (= res!665538 (and (= (size!30821 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30821 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30821 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995106 () Bool)

(declare-fun res!665540 () Bool)

(assert (=> b!995106 (=> (not res!665540) (not e!561515))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995106 (= res!665540 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995107 () Bool)

(declare-fun res!665537 () Bool)

(assert (=> b!995107 (=> (not res!665537) (not e!561515))))

(assert (=> b!995107 (= res!665537 (validKeyInArray!0 k!2224))))

(declare-fun b!995108 () Bool)

(declare-fun res!665541 () Bool)

(assert (=> b!995108 (=> (not res!665541) (not e!561517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62963 (_ BitVec 32)) Bool)

(assert (=> b!995108 (= res!665541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995109 () Bool)

(declare-fun res!665543 () Bool)

(assert (=> b!995109 (=> (not res!665543) (not e!561517))))

(assert (=> b!995109 (= res!665543 (and (bvsle #b00000000000000000000000000000000 (size!30821 a!3219)) (bvslt (size!30821 a!3219) #b01111111111111111111111111111111)))))

(declare-fun res!665544 () Bool)

(assert (=> start!85790 (=> (not res!665544) (not e!561515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85790 (= res!665544 (validMask!0 mask!3464))))

(assert (=> start!85790 e!561515))

(declare-fun array_inv!23443 (array!62963) Bool)

(assert (=> start!85790 (array_inv!23443 a!3219)))

(assert (=> start!85790 true))

(declare-fun b!995104 () Bool)

(assert (=> b!995104 (= e!561515 e!561517)))

(declare-fun res!665542 () Bool)

(assert (=> b!995104 (=> (not res!665542) (not e!561517))))

(declare-datatypes ((SeekEntryResult!9251 0))(
  ( (MissingZero!9251 (index!39375 (_ BitVec 32))) (Found!9251 (index!39376 (_ BitVec 32))) (Intermediate!9251 (undefined!10063 Bool) (index!39377 (_ BitVec 32)) (x!86820 (_ BitVec 32))) (Undefined!9251) (MissingVacant!9251 (index!39378 (_ BitVec 32))) )
))
(declare-fun lt!440852 () SeekEntryResult!9251)

(assert (=> b!995104 (= res!665542 (or (= lt!440852 (MissingVacant!9251 i!1194)) (= lt!440852 (MissingZero!9251 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62963 (_ BitVec 32)) SeekEntryResult!9251)

(assert (=> b!995104 (= lt!440852 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85790 res!665544) b!995105))

(assert (= (and b!995105 res!665538) b!995103))

(assert (= (and b!995103 res!665539) b!995107))

(assert (= (and b!995107 res!665537) b!995106))

(assert (= (and b!995106 res!665540) b!995104))

(assert (= (and b!995104 res!665542) b!995108))

(assert (= (and b!995108 res!665541) b!995109))

(assert (= (and b!995109 res!665543) b!995102))

(declare-fun m!922583 () Bool)

(assert (=> b!995106 m!922583))

(declare-fun m!922585 () Bool)

(assert (=> b!995108 m!922585))

(declare-fun m!922587 () Bool)

(assert (=> b!995104 m!922587))

(declare-fun m!922589 () Bool)

(assert (=> start!85790 m!922589))

(declare-fun m!922591 () Bool)

(assert (=> start!85790 m!922591))

(declare-fun m!922593 () Bool)

(assert (=> b!995102 m!922593))

(declare-fun m!922595 () Bool)

(assert (=> b!995103 m!922595))

(assert (=> b!995103 m!922595))

(declare-fun m!922597 () Bool)

(assert (=> b!995103 m!922597))

(declare-fun m!922599 () Bool)

(assert (=> b!995107 m!922599))

(push 1)

(assert (not start!85790))

(assert (not b!995103))

(assert (not b!995108))

(assert (not b!995102))

(assert (not b!995104))

(assert (not b!995107))

(assert (not b!995106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118795 () Bool)

(declare-fun res!665603 () Bool)

(declare-fun e!561546 () Bool)

(assert (=> d!118795 (=> res!665603 e!561546)))

(assert (=> d!118795 (= res!665603 (= (select (arr!30319 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118795 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561546)))

(declare-fun b!995168 () Bool)

(declare-fun e!561547 () Bool)

(assert (=> b!995168 (= e!561546 e!561547)))

(declare-fun res!665604 () Bool)

(assert (=> b!995168 (=> (not res!665604) (not e!561547))))

(assert (=> b!995168 (= res!665604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30821 a!3219)))))

(declare-fun b!995169 () Bool)

(assert (=> b!995169 (= e!561547 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118795 (not res!665603)) b!995168))

(assert (= (and b!995168 res!665604) b!995169))

(declare-fun m!922641 () Bool)

(assert (=> d!118795 m!922641))

(declare-fun m!922643 () Bool)

(assert (=> b!995169 m!922643))

(assert (=> b!995106 d!118795))

(declare-fun d!118797 () Bool)

(assert (=> d!118797 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995107 d!118797))

(declare-fun d!118799 () Bool)

(declare-fun res!665609 () Bool)

(declare-fun e!561552 () Bool)

(assert (=> d!118799 (=> res!665609 e!561552)))

(assert (=> d!118799 (= res!665609 (is-Nil!20992 Nil!20992))))

(assert (=> d!118799 (= (noDuplicate!1454 Nil!20992) e!561552)))

(declare-fun b!995174 () Bool)

(declare-fun e!561553 () Bool)

(assert (=> b!995174 (= e!561552 e!561553)))

(declare-fun res!665610 () Bool)

(assert (=> b!995174 (=> (not res!665610) (not e!561553))))

(declare-fun contains!5857 (List!20995 (_ BitVec 64)) Bool)

(assert (=> b!995174 (= res!665610 (not (contains!5857 (t!29996 Nil!20992) (h!22153 Nil!20992))))))

(declare-fun b!995175 () Bool)

(assert (=> b!995175 (= e!561553 (noDuplicate!1454 (t!29996 Nil!20992)))))

(assert (= (and d!118799 (not res!665609)) b!995174))

(assert (= (and b!995174 res!665610) b!995175))

(declare-fun m!922645 () Bool)

(assert (=> b!995174 m!922645))

(declare-fun m!922647 () Bool)

(assert (=> b!995175 m!922647))

(assert (=> b!995102 d!118799))

(declare-fun d!118801 () Bool)

(assert (=> d!118801 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85790 d!118801))

(declare-fun d!118811 () Bool)

(assert (=> d!118811 (= (array_inv!23443 a!3219) (bvsge (size!30821 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85790 d!118811))

(declare-fun b!995209 () Bool)

(declare-fun e!561582 () Bool)

(declare-fun call!42191 () Bool)

(assert (=> b!995209 (= e!561582 call!42191)))

(declare-fun bm!42188 () Bool)

(assert (=> bm!42188 (= call!42191 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995210 () Bool)

(declare-fun e!561583 () Bool)

(assert (=> b!995210 (= e!561583 call!42191)))

(declare-fun b!995211 () Bool)

(assert (=> b!995211 (= e!561583 e!561582)))

(declare-fun lt!440875 () (_ BitVec 64))

(assert (=> b!995211 (= lt!440875 (select (arr!30319 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32952 0))(
  ( (Unit!32953) )
))
(declare-fun lt!440876 () Unit!32952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62963 (_ BitVec 64) (_ BitVec 32)) Unit!32952)

(assert (=> b!995211 (= lt!440876 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440875 #b00000000000000000000000000000000))))

(assert (=> b!995211 (arrayContainsKey!0 a!3219 lt!440875 #b00000000000000000000000000000000)))

(declare-fun lt!440874 () Unit!32952)

(assert (=> b!995211 (= lt!440874 lt!440876)))

(declare-fun res!665633 () Bool)

(assert (=> b!995211 (= res!665633 (= (seekEntryOrOpen!0 (select (arr!30319 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9251 #b00000000000000000000000000000000)))))

(assert (=> b!995211 (=> (not res!665633) (not e!561582))))

(declare-fun b!995208 () Bool)

(declare-fun e!561581 () Bool)

(assert (=> b!995208 (= e!561581 e!561583)))

(declare-fun c!100928 () Bool)

(assert (=> b!995208 (= c!100928 (validKeyInArray!0 (select (arr!30319 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118813 () Bool)

(declare-fun res!665634 () Bool)

(assert (=> d!118813 (=> res!665634 e!561581)))

(assert (=> d!118813 (= res!665634 (bvsge #b00000000000000000000000000000000 (size!30821 a!3219)))))

(assert (=> d!118813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561581)))

(assert (= (and d!118813 (not res!665634)) b!995208))

(assert (= (and b!995208 c!100928) b!995211))

(assert (= (and b!995208 (not c!100928)) b!995210))

(assert (= (and b!995211 res!665633) b!995209))

(assert (= (or b!995209 b!995210) bm!42188))

(declare-fun m!922667 () Bool)

(assert (=> bm!42188 m!922667))

(assert (=> b!995211 m!922641))

(declare-fun m!922669 () Bool)

(assert (=> b!995211 m!922669))

(declare-fun m!922671 () Bool)

(assert (=> b!995211 m!922671))

(assert (=> b!995211 m!922641))

(declare-fun m!922673 () Bool)

(assert (=> b!995211 m!922673))

(assert (=> b!995208 m!922641))

(assert (=> b!995208 m!922641))

(declare-fun m!922675 () Bool)

(assert (=> b!995208 m!922675))

(assert (=> b!995108 d!118813))

(declare-fun d!118823 () Bool)

(assert (=> d!118823 (= (validKeyInArray!0 (select (arr!30319 a!3219) j!170)) (and (not (= (select (arr!30319 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30319 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995103 d!118823))

(declare-fun b!995260 () Bool)

(declare-fun e!561616 () SeekEntryResult!9251)

(declare-fun lt!440903 () SeekEntryResult!9251)

(assert (=> b!995260 (= e!561616 (MissingZero!9251 (index!39377 lt!440903)))))

(declare-fun b!995261 () Bool)

(declare-fun c!100948 () Bool)

(declare-fun lt!440902 () (_ BitVec 64))

(assert (=> b!995261 (= c!100948 (= lt!440902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561614 () SeekEntryResult!9251)

(assert (=> b!995261 (= e!561614 e!561616)))

(declare-fun b!995262 () Bool)

(assert (=> b!995262 (= e!561614 (Found!9251 (index!39377 lt!440903)))))

(declare-fun d!118825 () Bool)

(declare-fun lt!440901 () SeekEntryResult!9251)

(assert (=> d!118825 (and (or (is-Undefined!9251 lt!440901) (not (is-Found!9251 lt!440901)) (and (bvsge (index!39376 lt!440901) #b00000000000000000000000000000000) (bvslt (index!39376 lt!440901) (size!30821 a!3219)))) (or (is-Undefined!9251 lt!440901) (is-Found!9251 lt!440901) (not (is-MissingZero!9251 lt!440901)) (and (bvsge (index!39375 lt!440901) #b00000000000000000000000000000000) (bvslt (index!39375 lt!440901) (size!30821 a!3219)))) (or (is-Undefined!9251 lt!440901) (is-Found!9251 lt!440901) (is-MissingZero!9251 lt!440901) (not (is-MissingVacant!9251 lt!440901)) (and (bvsge (index!39378 lt!440901) #b00000000000000000000000000000000) (bvslt (index!39378 lt!440901) (size!30821 a!3219)))) (or (is-Undefined!9251 lt!440901) (ite (is-Found!9251 lt!440901) (= (select (arr!30319 a!3219) (index!39376 lt!440901)) k!2224) (ite (is-MissingZero!9251 lt!440901) (= (select (arr!30319 a!3219) (index!39375 lt!440901)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9251 lt!440901) (= (select (arr!30319 a!3219) (index!39378 lt!440901)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!561615 () SeekEntryResult!9251)

(assert (=> d!118825 (= lt!440901 e!561615)))

(declare-fun c!100947 () Bool)

(assert (=> d!118825 (= c!100947 (and (is-Intermediate!9251 lt!440903) (undefined!10063 lt!440903)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62963 (_ BitVec 32)) SeekEntryResult!9251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118825 (= lt!440903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118825 (validMask!0 mask!3464)))

(assert (=> d!118825 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!440901)))

(declare-fun b!995263 () Bool)

(assert (=> b!995263 (= e!561615 Undefined!9251)))

(declare-fun b!995264 () Bool)

(assert (=> b!995264 (= e!561615 e!561614)))

(assert (=> b!995264 (= lt!440902 (select (arr!30319 a!3219) (index!39377 lt!440903)))))

(declare-fun c!100949 () Bool)

(assert (=> b!995264 (= c!100949 (= lt!440902 k!2224))))

(declare-fun b!995265 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62963 (_ BitVec 32)) SeekEntryResult!9251)

(assert (=> b!995265 (= e!561616 (seekKeyOrZeroReturnVacant!0 (x!86820 lt!440903) (index!39377 lt!440903) (index!39377 lt!440903) k!2224 a!3219 mask!3464))))

(assert (= (and d!118825 c!100947) b!995263))

(assert (= (and d!118825 (not c!100947)) b!995264))

(assert (= (and b!995264 c!100949) b!995262))

(assert (= (and b!995264 (not c!100949)) b!995261))

(assert (= (and b!995261 c!100948) b!995260))

(assert (= (and b!995261 (not c!100948)) b!995265))

(declare-fun m!922705 () Bool)

(assert (=> d!118825 m!922705))

(declare-fun m!922707 () Bool)

(assert (=> d!118825 m!922707))

(declare-fun m!922709 () Bool)

(assert (=> d!118825 m!922709))

(declare-fun m!922711 () Bool)

(assert (=> d!118825 m!922711))

(declare-fun m!922713 () Bool)

(assert (=> d!118825 m!922713))

(assert (=> d!118825 m!922589))

(assert (=> d!118825 m!922705))

(declare-fun m!922715 () Bool)

(assert (=> b!995264 m!922715))

(declare-fun m!922717 () Bool)

(assert (=> b!995265 m!922717))

(assert (=> b!995104 d!118825))

(push 1)

