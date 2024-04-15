; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63646 () Bool)

(assert start!63646)

(declare-fun b!716558 () Bool)

(declare-fun e!402366 () Bool)

(declare-datatypes ((array!40563 0))(
  ( (array!40564 (arr!19415 (Array (_ BitVec 32) (_ BitVec 64))) (size!19836 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40563)

(assert (=> b!716558 (= e!402366 (and (bvslt #b00000000000000000000000000000000 (size!19836 a!3186)) (bvsge (size!19836 a!3186) #b01111111111111111111111111111111)))))

(declare-fun res!479483 () Bool)

(assert (=> start!63646 (=> (not res!479483) (not e!402366))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63646 (= res!479483 (validMask!0 mask!3328))))

(assert (=> start!63646 e!402366))

(declare-fun array_inv!15298 (array!40563) Bool)

(assert (=> start!63646 (array_inv!15298 a!3186)))

(assert (=> start!63646 true))

(declare-fun b!716555 () Bool)

(declare-fun res!479484 () Bool)

(assert (=> b!716555 (=> (not res!479484) (not e!402366))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716555 (= res!479484 (and (= (size!19836 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19836 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19836 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716557 () Bool)

(declare-fun res!479481 () Bool)

(assert (=> b!716557 (=> (not res!479481) (not e!402366))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716557 (= res!479481 (validKeyInArray!0 k0!2102))))

(declare-fun b!716556 () Bool)

(declare-fun res!479482 () Bool)

(assert (=> b!716556 (=> (not res!479482) (not e!402366))))

(assert (=> b!716556 (= res!479482 (validKeyInArray!0 (select (arr!19415 a!3186) j!159)))))

(assert (= (and start!63646 res!479483) b!716555))

(assert (= (and b!716555 res!479484) b!716556))

(assert (= (and b!716556 res!479482) b!716557))

(assert (= (and b!716557 res!479481) b!716558))

(declare-fun m!672093 () Bool)

(assert (=> start!63646 m!672093))

(declare-fun m!672095 () Bool)

(assert (=> start!63646 m!672095))

(declare-fun m!672097 () Bool)

(assert (=> b!716557 m!672097))

(declare-fun m!672099 () Bool)

(assert (=> b!716556 m!672099))

(assert (=> b!716556 m!672099))

(declare-fun m!672101 () Bool)

(assert (=> b!716556 m!672101))

(check-sat (not start!63646) (not b!716556) (not b!716557))
(check-sat)
(get-model)

(declare-fun d!98581 () Bool)

(assert (=> d!98581 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63646 d!98581))

(declare-fun d!98591 () Bool)

(assert (=> d!98591 (= (array_inv!15298 a!3186) (bvsge (size!19836 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63646 d!98591))

(declare-fun d!98593 () Bool)

(assert (=> d!98593 (= (validKeyInArray!0 (select (arr!19415 a!3186) j!159)) (and (not (= (select (arr!19415 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19415 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716556 d!98593))

(declare-fun d!98595 () Bool)

(assert (=> d!98595 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716557 d!98595))

(check-sat)
