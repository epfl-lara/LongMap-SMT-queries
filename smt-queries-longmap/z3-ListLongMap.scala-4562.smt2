; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63718 () Bool)

(assert start!63718)

(declare-fun b!717124 () Bool)

(declare-fun e!402735 () Bool)

(declare-datatypes ((array!40560 0))(
  ( (array!40561 (arr!19411 (Array (_ BitVec 32) (_ BitVec 64))) (size!19831 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40560)

(assert (=> b!717124 (= e!402735 (and (bvslt #b00000000000000000000000000000000 (size!19831 a!3186)) (bvsge (size!19831 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717123 () Bool)

(declare-fun res!479761 () Bool)

(assert (=> b!717123 (=> (not res!479761) (not e!402735))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717123 (= res!479761 (validKeyInArray!0 k0!2102))))

(declare-fun b!717122 () Bool)

(declare-fun res!479759 () Bool)

(assert (=> b!717122 (=> (not res!479759) (not e!402735))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717122 (= res!479759 (validKeyInArray!0 (select (arr!19411 a!3186) j!159)))))

(declare-fun b!717121 () Bool)

(declare-fun res!479760 () Bool)

(assert (=> b!717121 (=> (not res!479760) (not e!402735))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717121 (= res!479760 (and (= (size!19831 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19831 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19831 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479758 () Bool)

(assert (=> start!63718 (=> (not res!479758) (not e!402735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63718 (= res!479758 (validMask!0 mask!3328))))

(assert (=> start!63718 e!402735))

(declare-fun array_inv!15270 (array!40560) Bool)

(assert (=> start!63718 (array_inv!15270 a!3186)))

(assert (=> start!63718 true))

(assert (= (and start!63718 res!479758) b!717121))

(assert (= (and b!717121 res!479760) b!717122))

(assert (= (and b!717122 res!479759) b!717123))

(assert (= (and b!717123 res!479761) b!717124))

(declare-fun m!673641 () Bool)

(assert (=> b!717123 m!673641))

(declare-fun m!673643 () Bool)

(assert (=> b!717122 m!673643))

(assert (=> b!717122 m!673643))

(declare-fun m!673645 () Bool)

(assert (=> b!717122 m!673645))

(declare-fun m!673647 () Bool)

(assert (=> start!63718 m!673647))

(declare-fun m!673649 () Bool)

(assert (=> start!63718 m!673649))

(check-sat (not start!63718) (not b!717123) (not b!717122))
(check-sat)
(get-model)

(declare-fun d!98951 () Bool)

(assert (=> d!98951 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63718 d!98951))

(declare-fun d!98963 () Bool)

(assert (=> d!98963 (= (array_inv!15270 a!3186) (bvsge (size!19831 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63718 d!98963))

(declare-fun d!98965 () Bool)

(assert (=> d!98965 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717123 d!98965))

(declare-fun d!98967 () Bool)

(assert (=> d!98967 (= (validKeyInArray!0 (select (arr!19411 a!3186) j!159)) (and (not (= (select (arr!19411 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19411 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717122 d!98967))

(check-sat)
