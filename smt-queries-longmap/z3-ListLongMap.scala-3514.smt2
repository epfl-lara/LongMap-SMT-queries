; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48642 () Bool)

(assert start!48642)

(declare-fun b!534235 () Bool)

(declare-fun res!329590 () Bool)

(declare-fun e!310558 () Bool)

(assert (=> b!534235 (=> (not res!329590) (not e!310558))))

(declare-datatypes ((array!33864 0))(
  ( (array!33865 (arr!16271 (Array (_ BitVec 32) (_ BitVec 64))) (size!16636 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33864)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33864 (_ BitVec 32)) Bool)

(assert (=> b!534235 (= res!329590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534236 () Bool)

(declare-fun res!329584 () Bool)

(assert (=> b!534236 (=> (not res!329584) (not e!310558))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534236 (= res!329584 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16636 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16636 a!3154)) (= (select (arr!16271 a!3154) resIndex!32) (select (arr!16271 a!3154) j!147))))))

(declare-fun b!534237 () Bool)

(declare-fun res!329585 () Bool)

(declare-fun e!310559 () Bool)

(assert (=> b!534237 (=> (not res!329585) (not e!310559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534237 (= res!329585 (validKeyInArray!0 (select (arr!16271 a!3154) j!147)))))

(declare-fun b!534238 () Bool)

(assert (=> b!534238 (= e!310559 e!310558)))

(declare-fun res!329586 () Bool)

(assert (=> b!534238 (=> (not res!329586) (not e!310558))))

(declare-datatypes ((SeekEntryResult!4726 0))(
  ( (MissingZero!4726 (index!21128 (_ BitVec 32))) (Found!4726 (index!21129 (_ BitVec 32))) (Intermediate!4726 (undefined!5538 Bool) (index!21130 (_ BitVec 32)) (x!50096 (_ BitVec 32))) (Undefined!4726) (MissingVacant!4726 (index!21131 (_ BitVec 32))) )
))
(declare-fun lt!245413 () SeekEntryResult!4726)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534238 (= res!329586 (or (= lt!245413 (MissingZero!4726 i!1153)) (= lt!245413 (MissingVacant!4726 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33864 (_ BitVec 32)) SeekEntryResult!4726)

(assert (=> b!534238 (= lt!245413 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!329588 () Bool)

(assert (=> start!48642 (=> (not res!329588) (not e!310559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48642 (= res!329588 (validMask!0 mask!3216))))

(assert (=> start!48642 e!310559))

(assert (=> start!48642 true))

(declare-fun array_inv!12154 (array!33864) Bool)

(assert (=> start!48642 (array_inv!12154 a!3154)))

(declare-fun b!534239 () Bool)

(assert (=> b!534239 (= e!310558 false)))

(declare-fun lt!245412 () SeekEntryResult!4726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33864 (_ BitVec 32)) SeekEntryResult!4726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534239 (= lt!245412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16271 a!3154) j!147) mask!3216) (select (arr!16271 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534240 () Bool)

(declare-fun res!329583 () Bool)

(assert (=> b!534240 (=> (not res!329583) (not e!310558))))

(assert (=> b!534240 (= res!329583 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16271 a!3154) j!147) a!3154 mask!3216) (Intermediate!4726 false resIndex!32 resX!32)))))

(declare-fun b!534241 () Bool)

(declare-fun res!329587 () Bool)

(assert (=> b!534241 (=> (not res!329587) (not e!310559))))

(assert (=> b!534241 (= res!329587 (and (= (size!16636 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16636 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16636 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534242 () Bool)

(declare-fun res!329589 () Bool)

(assert (=> b!534242 (=> (not res!329589) (not e!310559))))

(assert (=> b!534242 (= res!329589 (validKeyInArray!0 k0!1998))))

(declare-fun b!534243 () Bool)

(declare-fun res!329582 () Bool)

(assert (=> b!534243 (=> (not res!329582) (not e!310559))))

(declare-fun arrayContainsKey!0 (array!33864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534243 (= res!329582 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534244 () Bool)

(declare-fun res!329591 () Bool)

(assert (=> b!534244 (=> (not res!329591) (not e!310558))))

(declare-datatypes ((List!10429 0))(
  ( (Nil!10426) (Cons!10425 (h!11368 (_ BitVec 64)) (t!16648 List!10429)) )
))
(declare-fun arrayNoDuplicates!0 (array!33864 (_ BitVec 32) List!10429) Bool)

(assert (=> b!534244 (= res!329591 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10426))))

(assert (= (and start!48642 res!329588) b!534241))

(assert (= (and b!534241 res!329587) b!534237))

(assert (= (and b!534237 res!329585) b!534242))

(assert (= (and b!534242 res!329589) b!534243))

(assert (= (and b!534243 res!329582) b!534238))

(assert (= (and b!534238 res!329586) b!534235))

(assert (= (and b!534235 res!329590) b!534244))

(assert (= (and b!534244 res!329591) b!534236))

(assert (= (and b!534236 res!329584) b!534240))

(assert (= (and b!534240 res!329583) b!534239))

(declare-fun m!513463 () Bool)

(assert (=> b!534240 m!513463))

(assert (=> b!534240 m!513463))

(declare-fun m!513465 () Bool)

(assert (=> b!534240 m!513465))

(assert (=> b!534239 m!513463))

(assert (=> b!534239 m!513463))

(declare-fun m!513467 () Bool)

(assert (=> b!534239 m!513467))

(assert (=> b!534239 m!513467))

(assert (=> b!534239 m!513463))

(declare-fun m!513469 () Bool)

(assert (=> b!534239 m!513469))

(declare-fun m!513471 () Bool)

(assert (=> b!534244 m!513471))

(declare-fun m!513473 () Bool)

(assert (=> b!534243 m!513473))

(declare-fun m!513475 () Bool)

(assert (=> start!48642 m!513475))

(declare-fun m!513477 () Bool)

(assert (=> start!48642 m!513477))

(declare-fun m!513479 () Bool)

(assert (=> b!534235 m!513479))

(declare-fun m!513481 () Bool)

(assert (=> b!534242 m!513481))

(assert (=> b!534237 m!513463))

(assert (=> b!534237 m!513463))

(declare-fun m!513483 () Bool)

(assert (=> b!534237 m!513483))

(declare-fun m!513485 () Bool)

(assert (=> b!534238 m!513485))

(declare-fun m!513487 () Bool)

(assert (=> b!534236 m!513487))

(assert (=> b!534236 m!513463))

(check-sat (not b!534238) (not b!534243) (not b!534244) (not b!534239) (not b!534240) (not b!534242) (not b!534235) (not b!534237) (not start!48642))
(check-sat)
