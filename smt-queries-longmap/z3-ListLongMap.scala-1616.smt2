; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30408 () Bool)

(assert start!30408)

(declare-fun b!304237 () Bool)

(declare-fun res!161733 () Bool)

(declare-fun e!191192 () Bool)

(assert (=> b!304237 (=> (not res!161733) (not e!191192))))

(declare-datatypes ((array!15467 0))(
  ( (array!15468 (arr!7320 (Array (_ BitVec 32) (_ BitVec 64))) (size!7673 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15467)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304237 (= res!161733 (and (= (size!7673 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7673 a!3293))))))

(declare-fun b!304238 () Bool)

(declare-fun res!161732 () Bool)

(assert (=> b!304238 (=> (not res!161732) (not e!191192))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304238 (= res!161732 (validKeyInArray!0 k0!2441))))

(declare-fun b!304239 () Bool)

(declare-fun res!161728 () Bool)

(assert (=> b!304239 (=> (not res!161728) (not e!191192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15467 (_ BitVec 32)) Bool)

(assert (=> b!304239 (= res!161728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304240 () Bool)

(declare-fun res!161736 () Bool)

(declare-fun e!191194 () Bool)

(assert (=> b!304240 (=> (not res!161736) (not e!191194))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304240 (= res!161736 (and (= (select (arr!7320 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7673 a!3293))))))

(declare-fun b!304241 () Bool)

(assert (=> b!304241 (= e!191192 e!191194)))

(declare-fun res!161734 () Bool)

(assert (=> b!304241 (=> (not res!161734) (not e!191194))))

(declare-datatypes ((SeekEntryResult!2459 0))(
  ( (MissingZero!2459 (index!12012 (_ BitVec 32))) (Found!2459 (index!12013 (_ BitVec 32))) (Intermediate!2459 (undefined!3271 Bool) (index!12014 (_ BitVec 32)) (x!30288 (_ BitVec 32))) (Undefined!2459) (MissingVacant!2459 (index!12015 (_ BitVec 32))) )
))
(declare-fun lt!150232 () SeekEntryResult!2459)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15467 (_ BitVec 32)) SeekEntryResult!2459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304241 (= res!161734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150232))))

(assert (=> b!304241 (= lt!150232 (Intermediate!2459 false resIndex!52 resX!52))))

(declare-fun res!161731 () Bool)

(assert (=> start!30408 (=> (not res!161731) (not e!191192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30408 (= res!161731 (validMask!0 mask!3709))))

(assert (=> start!30408 e!191192))

(declare-fun array_inv!5292 (array!15467) Bool)

(assert (=> start!30408 (array_inv!5292 a!3293)))

(assert (=> start!30408 true))

(declare-fun b!304242 () Bool)

(declare-fun res!161730 () Bool)

(assert (=> b!304242 (=> (not res!161730) (not e!191192))))

(declare-fun arrayContainsKey!0 (array!15467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304242 (= res!161730 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304243 () Bool)

(declare-fun e!191193 () Bool)

(assert (=> b!304243 (= e!191193 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!150233 () SeekEntryResult!2459)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304243 (= lt!150233 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304244 () Bool)

(declare-fun res!161729 () Bool)

(assert (=> b!304244 (=> (not res!161729) (not e!191192))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15467 (_ BitVec 32)) SeekEntryResult!2459)

(assert (=> b!304244 (= res!161729 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2459 i!1240)))))

(declare-fun b!304245 () Bool)

(assert (=> b!304245 (= e!191194 e!191193)))

(declare-fun res!161735 () Bool)

(assert (=> b!304245 (=> (not res!161735) (not e!191193))))

(assert (=> b!304245 (= res!161735 (and (= lt!150233 lt!150232) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7320 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7320 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7320 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304245 (= lt!150233 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30408 res!161731) b!304237))

(assert (= (and b!304237 res!161733) b!304238))

(assert (= (and b!304238 res!161732) b!304242))

(assert (= (and b!304242 res!161730) b!304244))

(assert (= (and b!304244 res!161729) b!304239))

(assert (= (and b!304239 res!161728) b!304241))

(assert (= (and b!304241 res!161734) b!304240))

(assert (= (and b!304240 res!161736) b!304245))

(assert (= (and b!304245 res!161735) b!304243))

(declare-fun m!314875 () Bool)

(assert (=> b!304240 m!314875))

(declare-fun m!314877 () Bool)

(assert (=> b!304241 m!314877))

(assert (=> b!304241 m!314877))

(declare-fun m!314879 () Bool)

(assert (=> b!304241 m!314879))

(declare-fun m!314881 () Bool)

(assert (=> b!304239 m!314881))

(declare-fun m!314883 () Bool)

(assert (=> b!304243 m!314883))

(assert (=> b!304243 m!314883))

(declare-fun m!314885 () Bool)

(assert (=> b!304243 m!314885))

(declare-fun m!314887 () Bool)

(assert (=> b!304238 m!314887))

(declare-fun m!314889 () Bool)

(assert (=> start!30408 m!314889))

(declare-fun m!314891 () Bool)

(assert (=> start!30408 m!314891))

(declare-fun m!314893 () Bool)

(assert (=> b!304244 m!314893))

(declare-fun m!314895 () Bool)

(assert (=> b!304245 m!314895))

(declare-fun m!314897 () Bool)

(assert (=> b!304245 m!314897))

(declare-fun m!314899 () Bool)

(assert (=> b!304242 m!314899))

(check-sat (not b!304238) (not b!304243) (not b!304241) (not b!304239) (not b!304244) (not b!304245) (not start!30408) (not b!304242))
(check-sat)
