; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32688 () Bool)

(assert start!32688)

(declare-fun b!326621 () Bool)

(declare-fun res!179659 () Bool)

(declare-fun e!201080 () Bool)

(assert (=> b!326621 (=> (not res!179659) (not e!201080))))

(declare-datatypes ((array!16725 0))(
  ( (array!16726 (arr!7917 (Array (_ BitVec 32) (_ BitVec 64))) (size!8269 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16725)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326621 (= res!179659 (and (= (select (arr!7917 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8269 a!3305))))))

(declare-fun b!326622 () Bool)

(declare-fun res!179652 () Bool)

(declare-fun e!201082 () Bool)

(assert (=> b!326622 (=> (not res!179652) (not e!201082))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326622 (= res!179652 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179656 () Bool)

(assert (=> start!32688 (=> (not res!179656) (not e!201082))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32688 (= res!179656 (validMask!0 mask!3777))))

(assert (=> start!32688 e!201082))

(declare-fun array_inv!5880 (array!16725) Bool)

(assert (=> start!32688 (array_inv!5880 a!3305)))

(assert (=> start!32688 true))

(declare-fun b!326623 () Bool)

(declare-fun res!179657 () Bool)

(assert (=> b!326623 (=> (not res!179657) (not e!201082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16725 (_ BitVec 32)) Bool)

(assert (=> b!326623 (= res!179657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326624 () Bool)

(declare-fun res!179653 () Bool)

(assert (=> b!326624 (=> (not res!179653) (not e!201082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326624 (= res!179653 (validKeyInArray!0 k0!2497))))

(declare-fun b!326625 () Bool)

(declare-fun res!179658 () Bool)

(assert (=> b!326625 (=> (not res!179658) (not e!201082))))

(declare-datatypes ((SeekEntryResult!3048 0))(
  ( (MissingZero!3048 (index!14368 (_ BitVec 32))) (Found!3048 (index!14369 (_ BitVec 32))) (Intermediate!3048 (undefined!3860 Bool) (index!14370 (_ BitVec 32)) (x!32614 (_ BitVec 32))) (Undefined!3048) (MissingVacant!3048 (index!14371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16725 (_ BitVec 32)) SeekEntryResult!3048)

(assert (=> b!326625 (= res!179658 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3048 i!1250)))))

(declare-fun b!326626 () Bool)

(declare-fun res!179660 () Bool)

(assert (=> b!326626 (=> (not res!179660) (not e!201082))))

(assert (=> b!326626 (= res!179660 (and (= (size!8269 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8269 a!3305))))))

(declare-fun b!326627 () Bool)

(assert (=> b!326627 (= e!201080 false)))

(declare-datatypes ((Unit!10130 0))(
  ( (Unit!10131) )
))
(declare-fun lt!157362 () Unit!10130)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10130)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326627 (= lt!157362 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326628 () Bool)

(assert (=> b!326628 (= e!201082 e!201080)))

(declare-fun res!179654 () Bool)

(assert (=> b!326628 (=> (not res!179654) (not e!201080))))

(declare-fun lt!157361 () SeekEntryResult!3048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16725 (_ BitVec 32)) SeekEntryResult!3048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326628 (= res!179654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157361))))

(assert (=> b!326628 (= lt!157361 (Intermediate!3048 false resIndex!58 resX!58))))

(declare-fun b!326629 () Bool)

(declare-fun res!179661 () Bool)

(assert (=> b!326629 (=> (not res!179661) (not e!201080))))

(assert (=> b!326629 (= res!179661 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157361))))

(declare-fun b!326630 () Bool)

(declare-fun res!179655 () Bool)

(assert (=> b!326630 (=> (not res!179655) (not e!201080))))

(assert (=> b!326630 (= res!179655 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7917 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32688 res!179656) b!326626))

(assert (= (and b!326626 res!179660) b!326624))

(assert (= (and b!326624 res!179653) b!326622))

(assert (= (and b!326622 res!179652) b!326625))

(assert (= (and b!326625 res!179658) b!326623))

(assert (= (and b!326623 res!179657) b!326628))

(assert (= (and b!326628 res!179654) b!326621))

(assert (= (and b!326621 res!179659) b!326629))

(assert (= (and b!326629 res!179661) b!326630))

(assert (= (and b!326630 res!179655) b!326627))

(declare-fun m!333145 () Bool)

(assert (=> b!326624 m!333145))

(declare-fun m!333147 () Bool)

(assert (=> b!326622 m!333147))

(declare-fun m!333149 () Bool)

(assert (=> b!326621 m!333149))

(declare-fun m!333151 () Bool)

(assert (=> b!326629 m!333151))

(declare-fun m!333153 () Bool)

(assert (=> start!32688 m!333153))

(declare-fun m!333155 () Bool)

(assert (=> start!32688 m!333155))

(declare-fun m!333157 () Bool)

(assert (=> b!326623 m!333157))

(declare-fun m!333159 () Bool)

(assert (=> b!326628 m!333159))

(assert (=> b!326628 m!333159))

(declare-fun m!333161 () Bool)

(assert (=> b!326628 m!333161))

(declare-fun m!333163 () Bool)

(assert (=> b!326627 m!333163))

(assert (=> b!326627 m!333163))

(declare-fun m!333165 () Bool)

(assert (=> b!326627 m!333165))

(declare-fun m!333167 () Bool)

(assert (=> b!326625 m!333167))

(declare-fun m!333169 () Bool)

(assert (=> b!326630 m!333169))

(check-sat (not start!32688) (not b!326622) (not b!326628) (not b!326625) (not b!326627) (not b!326624) (not b!326629) (not b!326623))
(check-sat)
