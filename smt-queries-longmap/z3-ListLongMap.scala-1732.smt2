; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31830 () Bool)

(assert start!31830)

(declare-fun b!318027 () Bool)

(declare-fun res!172760 () Bool)

(declare-fun e!197624 () Bool)

(assert (=> b!318027 (=> (not res!172760) (not e!197624))))

(declare-datatypes ((array!16205 0))(
  ( (array!16206 (arr!7668 (Array (_ BitVec 32) (_ BitVec 64))) (size!8021 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16205)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318027 (= res!172760 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318028 () Bool)

(declare-fun res!172754 () Bool)

(assert (=> b!318028 (=> (not res!172754) (not e!197624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318028 (= res!172754 (validKeyInArray!0 k0!2441))))

(declare-fun b!318029 () Bool)

(declare-fun res!172755 () Bool)

(assert (=> b!318029 (=> (not res!172755) (not e!197624))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16205 (_ BitVec 32)) Bool)

(assert (=> b!318029 (= res!172755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!172759 () Bool)

(assert (=> start!31830 (=> (not res!172759) (not e!197624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31830 (= res!172759 (validMask!0 mask!3709))))

(assert (=> start!31830 e!197624))

(declare-fun array_inv!5640 (array!16205) Bool)

(assert (=> start!31830 (array_inv!5640 a!3293)))

(assert (=> start!31830 true))

(declare-fun b!318030 () Bool)

(declare-fun e!197621 () Bool)

(assert (=> b!318030 (= e!197621 (not true))))

(declare-fun e!197620 () Bool)

(assert (=> b!318030 e!197620))

(declare-fun res!172753 () Bool)

(assert (=> b!318030 (=> (not res!172753) (not e!197620))))

(declare-fun lt!155061 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2807 0))(
  ( (MissingZero!2807 (index!13404 (_ BitVec 32))) (Found!2807 (index!13405 (_ BitVec 32))) (Intermediate!2807 (undefined!3619 Bool) (index!13406 (_ BitVec 32)) (x!31675 (_ BitVec 32))) (Undefined!2807) (MissingVacant!2807 (index!13407 (_ BitVec 32))) )
))
(declare-fun lt!155062 () SeekEntryResult!2807)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16205 (_ BitVec 32)) SeekEntryResult!2807)

(assert (=> b!318030 (= res!172753 (= lt!155062 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155061 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318030 (= lt!155061 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318031 () Bool)

(declare-fun e!197623 () Bool)

(assert (=> b!318031 (= e!197624 e!197623)))

(declare-fun res!172758 () Bool)

(assert (=> b!318031 (=> (not res!172758) (not e!197623))))

(declare-fun lt!155063 () SeekEntryResult!2807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318031 (= res!172758 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155063))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318031 (= lt!155063 (Intermediate!2807 false resIndex!52 resX!52))))

(declare-fun b!318032 () Bool)

(declare-fun res!172757 () Bool)

(assert (=> b!318032 (=> (not res!172757) (not e!197623))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318032 (= res!172757 (and (= (select (arr!7668 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8021 a!3293))))))

(declare-fun b!318033 () Bool)

(declare-fun res!172756 () Bool)

(assert (=> b!318033 (=> (not res!172756) (not e!197624))))

(assert (=> b!318033 (= res!172756 (and (= (size!8021 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8021 a!3293))))))

(declare-fun b!318034 () Bool)

(declare-fun res!172752 () Bool)

(assert (=> b!318034 (=> (not res!172752) (not e!197624))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16205 (_ BitVec 32)) SeekEntryResult!2807)

(assert (=> b!318034 (= res!172752 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2807 i!1240)))))

(declare-fun b!318035 () Bool)

(assert (=> b!318035 (= e!197623 e!197621)))

(declare-fun res!172761 () Bool)

(assert (=> b!318035 (=> (not res!172761) (not e!197621))))

(assert (=> b!318035 (= res!172761 (and (= lt!155062 lt!155063) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7668 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318035 (= lt!155062 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318036 () Bool)

(declare-fun lt!155060 () array!16205)

(assert (=> b!318036 (= e!197620 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155060 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155061 k0!2441 lt!155060 mask!3709)))))

(assert (=> b!318036 (= lt!155060 (array!16206 (store (arr!7668 a!3293) i!1240 k0!2441) (size!8021 a!3293)))))

(assert (= (and start!31830 res!172759) b!318033))

(assert (= (and b!318033 res!172756) b!318028))

(assert (= (and b!318028 res!172754) b!318027))

(assert (= (and b!318027 res!172760) b!318034))

(assert (= (and b!318034 res!172752) b!318029))

(assert (= (and b!318029 res!172755) b!318031))

(assert (= (and b!318031 res!172758) b!318032))

(assert (= (and b!318032 res!172757) b!318035))

(assert (= (and b!318035 res!172761) b!318030))

(assert (= (and b!318030 res!172753) b!318036))

(declare-fun m!326263 () Bool)

(assert (=> b!318029 m!326263))

(declare-fun m!326265 () Bool)

(assert (=> b!318036 m!326265))

(declare-fun m!326267 () Bool)

(assert (=> b!318036 m!326267))

(declare-fun m!326269 () Bool)

(assert (=> b!318036 m!326269))

(declare-fun m!326271 () Bool)

(assert (=> start!31830 m!326271))

(declare-fun m!326273 () Bool)

(assert (=> start!31830 m!326273))

(declare-fun m!326275 () Bool)

(assert (=> b!318027 m!326275))

(declare-fun m!326277 () Bool)

(assert (=> b!318034 m!326277))

(declare-fun m!326279 () Bool)

(assert (=> b!318032 m!326279))

(declare-fun m!326281 () Bool)

(assert (=> b!318030 m!326281))

(declare-fun m!326283 () Bool)

(assert (=> b!318030 m!326283))

(declare-fun m!326285 () Bool)

(assert (=> b!318035 m!326285))

(declare-fun m!326287 () Bool)

(assert (=> b!318035 m!326287))

(declare-fun m!326289 () Bool)

(assert (=> b!318031 m!326289))

(assert (=> b!318031 m!326289))

(declare-fun m!326291 () Bool)

(assert (=> b!318031 m!326291))

(declare-fun m!326293 () Bool)

(assert (=> b!318028 m!326293))

(check-sat (not b!318030) (not b!318036) (not b!318029) (not b!318028) (not b!318031) (not start!31830) (not b!318027) (not b!318034) (not b!318035))
(check-sat)
