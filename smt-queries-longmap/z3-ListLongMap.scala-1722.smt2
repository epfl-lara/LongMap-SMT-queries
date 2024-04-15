; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31770 () Bool)

(assert start!31770)

(declare-fun b!317127 () Bool)

(declare-fun e!197170 () Bool)

(assert (=> b!317127 (= e!197170 (not true))))

(declare-fun e!197173 () Bool)

(assert (=> b!317127 e!197173))

(declare-fun res!171858 () Bool)

(assert (=> b!317127 (=> (not res!171858) (not e!197173))))

(declare-fun lt!154701 () (_ BitVec 32))

(declare-datatypes ((array!16145 0))(
  ( (array!16146 (arr!7638 (Array (_ BitVec 32) (_ BitVec 64))) (size!7991 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16145)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2777 0))(
  ( (MissingZero!2777 (index!13284 (_ BitVec 32))) (Found!2777 (index!13285 (_ BitVec 32))) (Intermediate!2777 (undefined!3589 Bool) (index!13286 (_ BitVec 32)) (x!31565 (_ BitVec 32))) (Undefined!2777) (MissingVacant!2777 (index!13287 (_ BitVec 32))) )
))
(declare-fun lt!154702 () SeekEntryResult!2777)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16145 (_ BitVec 32)) SeekEntryResult!2777)

(assert (=> b!317127 (= res!171858 (= lt!154702 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154701 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317127 (= lt!154701 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!171859 () Bool)

(declare-fun e!197172 () Bool)

(assert (=> start!31770 (=> (not res!171859) (not e!197172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31770 (= res!171859 (validMask!0 mask!3709))))

(assert (=> start!31770 e!197172))

(declare-fun array_inv!5610 (array!16145) Bool)

(assert (=> start!31770 (array_inv!5610 a!3293)))

(assert (=> start!31770 true))

(declare-fun b!317128 () Bool)

(declare-fun lt!154703 () array!16145)

(assert (=> b!317128 (= e!197173 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154703 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154701 k0!2441 lt!154703 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317128 (= lt!154703 (array!16146 (store (arr!7638 a!3293) i!1240 k0!2441) (size!7991 a!3293)))))

(declare-fun b!317129 () Bool)

(declare-fun res!171860 () Bool)

(assert (=> b!317129 (=> (not res!171860) (not e!197172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317129 (= res!171860 (validKeyInArray!0 k0!2441))))

(declare-fun b!317130 () Bool)

(declare-fun res!171856 () Bool)

(assert (=> b!317130 (=> (not res!171856) (not e!197172))))

(assert (=> b!317130 (= res!171856 (and (= (size!7991 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7991 a!3293))))))

(declare-fun b!317131 () Bool)

(declare-fun res!171852 () Bool)

(declare-fun e!197174 () Bool)

(assert (=> b!317131 (=> (not res!171852) (not e!197174))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317131 (= res!171852 (and (= (select (arr!7638 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7991 a!3293))))))

(declare-fun b!317132 () Bool)

(declare-fun res!171855 () Bool)

(assert (=> b!317132 (=> (not res!171855) (not e!197172))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16145 (_ BitVec 32)) SeekEntryResult!2777)

(assert (=> b!317132 (= res!171855 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2777 i!1240)))))

(declare-fun b!317133 () Bool)

(declare-fun res!171853 () Bool)

(assert (=> b!317133 (=> (not res!171853) (not e!197172))))

(declare-fun arrayContainsKey!0 (array!16145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317133 (= res!171853 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317134 () Bool)

(assert (=> b!317134 (= e!197172 e!197174)))

(declare-fun res!171857 () Bool)

(assert (=> b!317134 (=> (not res!171857) (not e!197174))))

(declare-fun lt!154700 () SeekEntryResult!2777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317134 (= res!171857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154700))))

(assert (=> b!317134 (= lt!154700 (Intermediate!2777 false resIndex!52 resX!52))))

(declare-fun b!317135 () Bool)

(declare-fun res!171854 () Bool)

(assert (=> b!317135 (=> (not res!171854) (not e!197172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16145 (_ BitVec 32)) Bool)

(assert (=> b!317135 (= res!171854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317136 () Bool)

(assert (=> b!317136 (= e!197174 e!197170)))

(declare-fun res!171861 () Bool)

(assert (=> b!317136 (=> (not res!171861) (not e!197170))))

(assert (=> b!317136 (= res!171861 (and (= lt!154702 lt!154700) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7638 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317136 (= lt!154702 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31770 res!171859) b!317130))

(assert (= (and b!317130 res!171856) b!317129))

(assert (= (and b!317129 res!171860) b!317133))

(assert (= (and b!317133 res!171853) b!317132))

(assert (= (and b!317132 res!171855) b!317135))

(assert (= (and b!317135 res!171854) b!317134))

(assert (= (and b!317134 res!171857) b!317131))

(assert (= (and b!317131 res!171852) b!317136))

(assert (= (and b!317136 res!171861) b!317127))

(assert (= (and b!317127 res!171858) b!317128))

(declare-fun m!325303 () Bool)

(assert (=> b!317129 m!325303))

(declare-fun m!325305 () Bool)

(assert (=> b!317131 m!325305))

(declare-fun m!325307 () Bool)

(assert (=> b!317132 m!325307))

(declare-fun m!325309 () Bool)

(assert (=> b!317127 m!325309))

(declare-fun m!325311 () Bool)

(assert (=> b!317127 m!325311))

(declare-fun m!325313 () Bool)

(assert (=> b!317128 m!325313))

(declare-fun m!325315 () Bool)

(assert (=> b!317128 m!325315))

(declare-fun m!325317 () Bool)

(assert (=> b!317128 m!325317))

(declare-fun m!325319 () Bool)

(assert (=> b!317133 m!325319))

(declare-fun m!325321 () Bool)

(assert (=> b!317134 m!325321))

(assert (=> b!317134 m!325321))

(declare-fun m!325323 () Bool)

(assert (=> b!317134 m!325323))

(declare-fun m!325325 () Bool)

(assert (=> start!31770 m!325325))

(declare-fun m!325327 () Bool)

(assert (=> start!31770 m!325327))

(declare-fun m!325329 () Bool)

(assert (=> b!317135 m!325329))

(declare-fun m!325331 () Bool)

(assert (=> b!317136 m!325331))

(declare-fun m!325333 () Bool)

(assert (=> b!317136 m!325333))

(check-sat (not start!31770) (not b!317135) (not b!317136) (not b!317127) (not b!317129) (not b!317134) (not b!317132) (not b!317133) (not b!317128))
(check-sat)
