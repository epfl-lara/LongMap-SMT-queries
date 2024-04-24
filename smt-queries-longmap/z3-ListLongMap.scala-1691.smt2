; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31020 () Bool)

(assert start!31020)

(declare-fun b!311994 () Bool)

(declare-fun e!194590 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311994 (= e!194590 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-datatypes ((SeekEntryResult!2654 0))(
  ( (MissingZero!2654 (index!12792 (_ BitVec 32))) (Found!2654 (index!12793 (_ BitVec 32))) (Intermediate!2654 (undefined!3466 Bool) (index!12794 (_ BitVec 32)) (x!31112 (_ BitVec 32))) (Undefined!2654) (MissingVacant!2654 (index!12795 (_ BitVec 32))) )
))
(declare-fun lt!152738 () SeekEntryResult!2654)

(declare-fun lt!152734 () SeekEntryResult!2654)

(assert (=> b!311994 (= lt!152738 lt!152734)))

(declare-datatypes ((array!15935 0))(
  ( (array!15936 (arr!7549 (Array (_ BitVec 32) (_ BitVec 64))) (size!7901 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15935)

(declare-fun lt!152735 () (_ BitVec 32))

(declare-datatypes ((Unit!9569 0))(
  ( (Unit!9570) )
))
(declare-fun lt!152732 () Unit!9569)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15935 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9569)

(assert (=> b!311994 (= lt!152732 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152735 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311995 () Bool)

(declare-fun res!168500 () Bool)

(declare-fun e!194591 () Bool)

(assert (=> b!311995 (=> (not res!168500) (not e!194591))))

(assert (=> b!311995 (= res!168500 (and (= (size!7901 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7901 a!3293))))))

(declare-fun b!311996 () Bool)

(declare-fun res!168503 () Bool)

(assert (=> b!311996 (=> (not res!168503) (not e!194591))))

(declare-fun arrayContainsKey!0 (array!15935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311996 (= res!168503 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311997 () Bool)

(declare-fun e!194589 () Bool)

(assert (=> b!311997 (= e!194589 (not e!194590))))

(declare-fun res!168507 () Bool)

(assert (=> b!311997 (=> res!168507 e!194590)))

(declare-fun lt!152739 () SeekEntryResult!2654)

(assert (=> b!311997 (= res!168507 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152735 #b00000000000000000000000000000000) (bvsge lt!152735 (size!7901 a!3293)) (not (= lt!152734 lt!152739))))))

(declare-fun lt!152733 () SeekEntryResult!2654)

(assert (=> b!311997 (= lt!152733 lt!152738)))

(declare-fun lt!152737 () array!15935)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15935 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!311997 (= lt!152738 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152735 k0!2441 lt!152737 mask!3709))))

(assert (=> b!311997 (= lt!152733 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152737 mask!3709))))

(assert (=> b!311997 (= lt!152737 (array!15936 (store (arr!7549 a!3293) i!1240 k0!2441) (size!7901 a!3293)))))

(declare-fun lt!152736 () SeekEntryResult!2654)

(assert (=> b!311997 (= lt!152736 lt!152734)))

(assert (=> b!311997 (= lt!152734 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152735 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311997 (= lt!152735 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!168505 () Bool)

(assert (=> start!31020 (=> (not res!168505) (not e!194591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31020 (= res!168505 (validMask!0 mask!3709))))

(assert (=> start!31020 e!194591))

(declare-fun array_inv!5499 (array!15935) Bool)

(assert (=> start!31020 (array_inv!5499 a!3293)))

(assert (=> start!31020 true))

(declare-fun b!311998 () Bool)

(declare-fun e!194592 () Bool)

(assert (=> b!311998 (= e!194592 e!194589)))

(declare-fun res!168502 () Bool)

(assert (=> b!311998 (=> (not res!168502) (not e!194589))))

(assert (=> b!311998 (= res!168502 (and (= lt!152736 lt!152739) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7549 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311998 (= lt!152736 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311999 () Bool)

(declare-fun res!168498 () Bool)

(assert (=> b!311999 (=> (not res!168498) (not e!194592))))

(assert (=> b!311999 (= res!168498 (and (= (select (arr!7549 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7901 a!3293))))))

(declare-fun b!312000 () Bool)

(declare-fun res!168501 () Bool)

(assert (=> b!312000 (=> (not res!168501) (not e!194591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312000 (= res!168501 (validKeyInArray!0 k0!2441))))

(declare-fun b!312001 () Bool)

(declare-fun res!168504 () Bool)

(assert (=> b!312001 (=> (not res!168504) (not e!194591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15935 (_ BitVec 32)) Bool)

(assert (=> b!312001 (= res!168504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312002 () Bool)

(declare-fun res!168499 () Bool)

(assert (=> b!312002 (=> (not res!168499) (not e!194591))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15935 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!312002 (= res!168499 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2654 i!1240)))))

(declare-fun b!312003 () Bool)

(assert (=> b!312003 (= e!194591 e!194592)))

(declare-fun res!168506 () Bool)

(assert (=> b!312003 (=> (not res!168506) (not e!194592))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312003 (= res!168506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152739))))

(assert (=> b!312003 (= lt!152739 (Intermediate!2654 false resIndex!52 resX!52))))

(assert (= (and start!31020 res!168505) b!311995))

(assert (= (and b!311995 res!168500) b!312000))

(assert (= (and b!312000 res!168501) b!311996))

(assert (= (and b!311996 res!168503) b!312002))

(assert (= (and b!312002 res!168499) b!312001))

(assert (= (and b!312001 res!168504) b!312003))

(assert (= (and b!312003 res!168506) b!311999))

(assert (= (and b!311999 res!168498) b!311998))

(assert (= (and b!311998 res!168502) b!311997))

(assert (= (and b!311997 (not res!168507)) b!311994))

(declare-fun m!322213 () Bool)

(assert (=> b!311998 m!322213))

(declare-fun m!322215 () Bool)

(assert (=> b!311998 m!322215))

(declare-fun m!322217 () Bool)

(assert (=> b!311996 m!322217))

(declare-fun m!322219 () Bool)

(assert (=> b!311994 m!322219))

(declare-fun m!322221 () Bool)

(assert (=> b!312001 m!322221))

(declare-fun m!322223 () Bool)

(assert (=> start!31020 m!322223))

(declare-fun m!322225 () Bool)

(assert (=> start!31020 m!322225))

(declare-fun m!322227 () Bool)

(assert (=> b!311999 m!322227))

(declare-fun m!322229 () Bool)

(assert (=> b!312003 m!322229))

(assert (=> b!312003 m!322229))

(declare-fun m!322231 () Bool)

(assert (=> b!312003 m!322231))

(declare-fun m!322233 () Bool)

(assert (=> b!312002 m!322233))

(declare-fun m!322235 () Bool)

(assert (=> b!311997 m!322235))

(declare-fun m!322237 () Bool)

(assert (=> b!311997 m!322237))

(declare-fun m!322239 () Bool)

(assert (=> b!311997 m!322239))

(declare-fun m!322241 () Bool)

(assert (=> b!311997 m!322241))

(declare-fun m!322243 () Bool)

(assert (=> b!311997 m!322243))

(declare-fun m!322245 () Bool)

(assert (=> b!312000 m!322245))

(check-sat (not start!31020) (not b!311997) (not b!312002) (not b!311998) (not b!311994) (not b!312000) (not b!312001) (not b!311996) (not b!312003))
(check-sat)
