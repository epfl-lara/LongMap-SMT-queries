; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31042 () Bool)

(assert start!31042)

(declare-fun b!312167 () Bool)

(declare-fun res!168629 () Bool)

(declare-fun e!194683 () Bool)

(assert (=> b!312167 (=> (not res!168629) (not e!194683))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312167 (= res!168629 (validKeyInArray!0 k0!2441))))

(declare-fun b!312168 () Bool)

(declare-fun res!168626 () Bool)

(declare-fun e!194684 () Bool)

(assert (=> b!312168 (=> (not res!168626) (not e!194684))))

(declare-datatypes ((array!15944 0))(
  ( (array!15945 (arr!7554 (Array (_ BitVec 32) (_ BitVec 64))) (size!7906 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15944)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312168 (= res!168626 (and (= (select (arr!7554 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7906 a!3293))))))

(declare-fun b!312170 () Bool)

(assert (=> b!312170 (= e!194683 e!194684)))

(declare-fun res!168622 () Bool)

(assert (=> b!312170 (=> (not res!168622) (not e!194684))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2694 0))(
  ( (MissingZero!2694 (index!12952 (_ BitVec 32))) (Found!2694 (index!12953 (_ BitVec 32))) (Intermediate!2694 (undefined!3506 Bool) (index!12954 (_ BitVec 32)) (x!31163 (_ BitVec 32))) (Undefined!2694) (MissingVacant!2694 (index!12955 (_ BitVec 32))) )
))
(declare-fun lt!152813 () SeekEntryResult!2694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15944 (_ BitVec 32)) SeekEntryResult!2694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312170 (= res!168622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152813))))

(assert (=> b!312170 (= lt!152813 (Intermediate!2694 false resIndex!52 resX!52))))

(declare-fun e!194685 () Bool)

(declare-fun b!312171 () Bool)

(assert (=> b!312171 (= e!194685 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(declare-fun lt!152814 () SeekEntryResult!2694)

(declare-fun lt!152816 () SeekEntryResult!2694)

(assert (=> b!312171 (= lt!152814 lt!152816)))

(declare-fun lt!152811 () (_ BitVec 32))

(declare-datatypes ((Unit!9619 0))(
  ( (Unit!9620) )
))
(declare-fun lt!152815 () Unit!9619)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15944 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9619)

(assert (=> b!312171 (= lt!152815 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152811 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312172 () Bool)

(declare-fun e!194682 () Bool)

(assert (=> b!312172 (= e!194682 (not e!194685))))

(declare-fun res!168621 () Bool)

(assert (=> b!312172 (=> res!168621 e!194685)))

(assert (=> b!312172 (= res!168621 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152811 #b00000000000000000000000000000000) (bvsge lt!152811 (size!7906 a!3293)) (not (= lt!152816 lt!152813))))))

(declare-fun lt!152817 () SeekEntryResult!2694)

(assert (=> b!312172 (= lt!152817 lt!152814)))

(declare-fun lt!152812 () array!15944)

(assert (=> b!312172 (= lt!152814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152811 k0!2441 lt!152812 mask!3709))))

(assert (=> b!312172 (= lt!152817 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152812 mask!3709))))

(assert (=> b!312172 (= lt!152812 (array!15945 (store (arr!7554 a!3293) i!1240 k0!2441) (size!7906 a!3293)))))

(declare-fun lt!152810 () SeekEntryResult!2694)

(assert (=> b!312172 (= lt!152810 lt!152816)))

(assert (=> b!312172 (= lt!152816 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152811 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312172 (= lt!152811 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312173 () Bool)

(declare-fun res!168625 () Bool)

(assert (=> b!312173 (=> (not res!168625) (not e!194683))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15944 (_ BitVec 32)) SeekEntryResult!2694)

(assert (=> b!312173 (= res!168625 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2694 i!1240)))))

(declare-fun b!312174 () Bool)

(assert (=> b!312174 (= e!194684 e!194682)))

(declare-fun res!168623 () Bool)

(assert (=> b!312174 (=> (not res!168623) (not e!194682))))

(assert (=> b!312174 (= res!168623 (and (= lt!152810 lt!152813) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7554 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312174 (= lt!152810 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312175 () Bool)

(declare-fun res!168624 () Bool)

(assert (=> b!312175 (=> (not res!168624) (not e!194683))))

(assert (=> b!312175 (= res!168624 (and (= (size!7906 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7906 a!3293))))))

(declare-fun b!312176 () Bool)

(declare-fun res!168627 () Bool)

(assert (=> b!312176 (=> (not res!168627) (not e!194683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15944 (_ BitVec 32)) Bool)

(assert (=> b!312176 (= res!168627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!168628 () Bool)

(assert (=> start!31042 (=> (not res!168628) (not e!194683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31042 (= res!168628 (validMask!0 mask!3709))))

(assert (=> start!31042 e!194683))

(declare-fun array_inv!5517 (array!15944) Bool)

(assert (=> start!31042 (array_inv!5517 a!3293)))

(assert (=> start!31042 true))

(declare-fun b!312169 () Bool)

(declare-fun res!168630 () Bool)

(assert (=> b!312169 (=> (not res!168630) (not e!194683))))

(declare-fun arrayContainsKey!0 (array!15944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312169 (= res!168630 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31042 res!168628) b!312175))

(assert (= (and b!312175 res!168624) b!312167))

(assert (= (and b!312167 res!168629) b!312169))

(assert (= (and b!312169 res!168630) b!312173))

(assert (= (and b!312173 res!168625) b!312176))

(assert (= (and b!312176 res!168627) b!312170))

(assert (= (and b!312170 res!168622) b!312168))

(assert (= (and b!312168 res!168626) b!312174))

(assert (= (and b!312174 res!168623) b!312172))

(assert (= (and b!312172 (not res!168621)) b!312171))

(declare-fun m!322215 () Bool)

(assert (=> b!312169 m!322215))

(declare-fun m!322217 () Bool)

(assert (=> b!312173 m!322217))

(declare-fun m!322219 () Bool)

(assert (=> b!312167 m!322219))

(declare-fun m!322221 () Bool)

(assert (=> b!312171 m!322221))

(declare-fun m!322223 () Bool)

(assert (=> b!312174 m!322223))

(declare-fun m!322225 () Bool)

(assert (=> b!312174 m!322225))

(declare-fun m!322227 () Bool)

(assert (=> b!312176 m!322227))

(declare-fun m!322229 () Bool)

(assert (=> b!312168 m!322229))

(declare-fun m!322231 () Bool)

(assert (=> b!312170 m!322231))

(assert (=> b!312170 m!322231))

(declare-fun m!322233 () Bool)

(assert (=> b!312170 m!322233))

(declare-fun m!322235 () Bool)

(assert (=> start!31042 m!322235))

(declare-fun m!322237 () Bool)

(assert (=> start!31042 m!322237))

(declare-fun m!322239 () Bool)

(assert (=> b!312172 m!322239))

(declare-fun m!322241 () Bool)

(assert (=> b!312172 m!322241))

(declare-fun m!322243 () Bool)

(assert (=> b!312172 m!322243))

(declare-fun m!322245 () Bool)

(assert (=> b!312172 m!322245))

(declare-fun m!322247 () Bool)

(assert (=> b!312172 m!322247))

(check-sat (not b!312173) (not b!312167) (not b!312172) (not b!312174) (not b!312169) (not b!312170) (not b!312176) (not start!31042) (not b!312171))
(check-sat)
