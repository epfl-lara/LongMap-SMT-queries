; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31842 () Bool)

(assert start!31842)

(declare-fun b!318207 () Bool)

(declare-fun res!172938 () Bool)

(declare-fun e!197713 () Bool)

(assert (=> b!318207 (=> (not res!172938) (not e!197713))))

(declare-datatypes ((array!16217 0))(
  ( (array!16218 (arr!7674 (Array (_ BitVec 32) (_ BitVec 64))) (size!8027 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16217)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2813 0))(
  ( (MissingZero!2813 (index!13428 (_ BitVec 32))) (Found!2813 (index!13429 (_ BitVec 32))) (Intermediate!2813 (undefined!3625 Bool) (index!13430 (_ BitVec 32)) (x!31697 (_ BitVec 32))) (Undefined!2813) (MissingVacant!2813 (index!13431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16217 (_ BitVec 32)) SeekEntryResult!2813)

(assert (=> b!318207 (= res!172938 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2813 i!1240)))))

(declare-fun b!318208 () Bool)

(declare-fun res!172932 () Bool)

(assert (=> b!318208 (=> (not res!172932) (not e!197713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16217 (_ BitVec 32)) Bool)

(assert (=> b!318208 (= res!172932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155134 () array!16217)

(declare-fun lt!155135 () (_ BitVec 32))

(declare-fun e!197711 () Bool)

(declare-fun b!318209 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16217 (_ BitVec 32)) SeekEntryResult!2813)

(assert (=> b!318209 (= e!197711 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155134 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155135 k0!2441 lt!155134 mask!3709)))))

(assert (=> b!318209 (= lt!155134 (array!16218 (store (arr!7674 a!3293) i!1240 k0!2441) (size!8027 a!3293)))))

(declare-fun b!318210 () Bool)

(declare-fun res!172939 () Bool)

(assert (=> b!318210 (=> (not res!172939) (not e!197713))))

(assert (=> b!318210 (= res!172939 (and (= (size!8027 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8027 a!3293))))))

(declare-fun res!172934 () Bool)

(assert (=> start!31842 (=> (not res!172934) (not e!197713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31842 (= res!172934 (validMask!0 mask!3709))))

(assert (=> start!31842 e!197713))

(declare-fun array_inv!5646 (array!16217) Bool)

(assert (=> start!31842 (array_inv!5646 a!3293)))

(assert (=> start!31842 true))

(declare-fun b!318211 () Bool)

(declare-fun e!197712 () Bool)

(assert (=> b!318211 (= e!197713 e!197712)))

(declare-fun res!172936 () Bool)

(assert (=> b!318211 (=> (not res!172936) (not e!197712))))

(declare-fun lt!155132 () SeekEntryResult!2813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318211 (= res!172936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155132))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318211 (= lt!155132 (Intermediate!2813 false resIndex!52 resX!52))))

(declare-fun b!318212 () Bool)

(declare-fun res!172937 () Bool)

(assert (=> b!318212 (=> (not res!172937) (not e!197713))))

(declare-fun arrayContainsKey!0 (array!16217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318212 (= res!172937 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318213 () Bool)

(declare-fun res!172940 () Bool)

(assert (=> b!318213 (=> (not res!172940) (not e!197713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318213 (= res!172940 (validKeyInArray!0 k0!2441))))

(declare-fun b!318214 () Bool)

(declare-fun e!197714 () Bool)

(assert (=> b!318214 (= e!197712 e!197714)))

(declare-fun res!172941 () Bool)

(assert (=> b!318214 (=> (not res!172941) (not e!197714))))

(declare-fun lt!155133 () SeekEntryResult!2813)

(assert (=> b!318214 (= res!172941 (and (= lt!155133 lt!155132) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7674 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318214 (= lt!155133 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318215 () Bool)

(assert (=> b!318215 (= e!197714 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(assert (=> b!318215 e!197711))

(declare-fun res!172933 () Bool)

(assert (=> b!318215 (=> (not res!172933) (not e!197711))))

(assert (=> b!318215 (= res!172933 (= lt!155133 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155135 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318215 (= lt!155135 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318216 () Bool)

(declare-fun res!172935 () Bool)

(assert (=> b!318216 (=> (not res!172935) (not e!197712))))

(assert (=> b!318216 (= res!172935 (and (= (select (arr!7674 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8027 a!3293))))))

(assert (= (and start!31842 res!172934) b!318210))

(assert (= (and b!318210 res!172939) b!318213))

(assert (= (and b!318213 res!172940) b!318212))

(assert (= (and b!318212 res!172937) b!318207))

(assert (= (and b!318207 res!172938) b!318208))

(assert (= (and b!318208 res!172932) b!318211))

(assert (= (and b!318211 res!172936) b!318216))

(assert (= (and b!318216 res!172935) b!318214))

(assert (= (and b!318214 res!172941) b!318215))

(assert (= (and b!318215 res!172933) b!318209))

(declare-fun m!326455 () Bool)

(assert (=> b!318208 m!326455))

(declare-fun m!326457 () Bool)

(assert (=> b!318214 m!326457))

(declare-fun m!326459 () Bool)

(assert (=> b!318214 m!326459))

(declare-fun m!326461 () Bool)

(assert (=> start!31842 m!326461))

(declare-fun m!326463 () Bool)

(assert (=> start!31842 m!326463))

(declare-fun m!326465 () Bool)

(assert (=> b!318213 m!326465))

(declare-fun m!326467 () Bool)

(assert (=> b!318211 m!326467))

(assert (=> b!318211 m!326467))

(declare-fun m!326469 () Bool)

(assert (=> b!318211 m!326469))

(declare-fun m!326471 () Bool)

(assert (=> b!318207 m!326471))

(declare-fun m!326473 () Bool)

(assert (=> b!318216 m!326473))

(declare-fun m!326475 () Bool)

(assert (=> b!318209 m!326475))

(declare-fun m!326477 () Bool)

(assert (=> b!318209 m!326477))

(declare-fun m!326479 () Bool)

(assert (=> b!318209 m!326479))

(declare-fun m!326481 () Bool)

(assert (=> b!318215 m!326481))

(declare-fun m!326483 () Bool)

(assert (=> b!318215 m!326483))

(declare-fun m!326485 () Bool)

(assert (=> b!318212 m!326485))

(check-sat (not b!318213) (not start!31842) (not b!318211) (not b!318214) (not b!318212) (not b!318207) (not b!318208) (not b!318209) (not b!318215))
(check-sat)
