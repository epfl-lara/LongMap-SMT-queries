; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63656 () Bool)

(assert start!63656)

(declare-fun b!716806 () Bool)

(declare-fun res!479592 () Bool)

(declare-fun e!402515 () Bool)

(assert (=> b!716806 (=> (not res!479592) (not e!402515))))

(declare-datatypes ((array!40566 0))(
  ( (array!40567 (arr!19417 (Array (_ BitVec 32) (_ BitVec 64))) (size!19838 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40566)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716806 (= res!479592 (validKeyInArray!0 (select (arr!19417 a!3186) j!159)))))

(declare-fun b!716807 () Bool)

(declare-fun res!479593 () Bool)

(assert (=> b!716807 (=> (not res!479593) (not e!402515))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!716807 (= res!479593 (validKeyInArray!0 k0!2102))))

(declare-fun b!716805 () Bool)

(declare-fun res!479591 () Bool)

(assert (=> b!716805 (=> (not res!479591) (not e!402515))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716805 (= res!479591 (and (= (size!19838 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19838 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19838 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716808 () Bool)

(assert (=> b!716808 (= e!402515 (and (bvslt #b00000000000000000000000000000000 (size!19838 a!3186)) (bvsge (size!19838 a!3186) #b01111111111111111111111111111111)))))

(declare-fun res!479594 () Bool)

(assert (=> start!63656 (=> (not res!479594) (not e!402515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63656 (= res!479594 (validMask!0 mask!3328))))

(assert (=> start!63656 e!402515))

(declare-fun array_inv!15213 (array!40566) Bool)

(assert (=> start!63656 (array_inv!15213 a!3186)))

(assert (=> start!63656 true))

(assert (= (and start!63656 res!479594) b!716805))

(assert (= (and b!716805 res!479591) b!716806))

(assert (= (and b!716806 res!479592) b!716807))

(assert (= (and b!716807 res!479593) b!716808))

(declare-fun m!672803 () Bool)

(assert (=> b!716806 m!672803))

(assert (=> b!716806 m!672803))

(declare-fun m!672805 () Bool)

(assert (=> b!716806 m!672805))

(declare-fun m!672807 () Bool)

(assert (=> b!716807 m!672807))

(declare-fun m!672809 () Bool)

(assert (=> start!63656 m!672809))

(declare-fun m!672811 () Bool)

(assert (=> start!63656 m!672811))

(check-sat (not b!716807) (not start!63656) (not b!716806))
(check-sat)
(get-model)

(declare-fun d!98755 () Bool)

(assert (=> d!98755 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716807 d!98755))

(declare-fun d!98757 () Bool)

(assert (=> d!98757 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63656 d!98757))

(declare-fun d!98767 () Bool)

(assert (=> d!98767 (= (array_inv!15213 a!3186) (bvsge (size!19838 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63656 d!98767))

(declare-fun d!98769 () Bool)

(assert (=> d!98769 (= (validKeyInArray!0 (select (arr!19417 a!3186) j!159)) (and (not (= (select (arr!19417 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19417 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716806 d!98769))

(check-sat)
