; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30968 () Bool)

(assert start!30968)

(declare-fun res!167517 () Bool)

(declare-fun e!194127 () Bool)

(assert (=> start!30968 (=> (not res!167517) (not e!194127))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30968 (= res!167517 (validMask!0 mask!3709))))

(assert (=> start!30968 e!194127))

(declare-datatypes ((array!15870 0))(
  ( (array!15871 (arr!7517 (Array (_ BitVec 32) (_ BitVec 64))) (size!7869 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15870)

(declare-fun array_inv!5480 (array!15870) Bool)

(assert (=> start!30968 (array_inv!5480 a!3293)))

(assert (=> start!30968 true))

(declare-fun b!311057 () Bool)

(declare-fun res!167516 () Bool)

(assert (=> b!311057 (=> (not res!167516) (not e!194127))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311057 (= res!167516 (validKeyInArray!0 k!2441))))

(declare-fun b!311058 () Bool)

(declare-fun res!167514 () Bool)

(assert (=> b!311058 (=> (not res!167514) (not e!194127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15870 (_ BitVec 32)) Bool)

(assert (=> b!311058 (= res!167514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311059 () Bool)

(declare-fun res!167518 () Bool)

(assert (=> b!311059 (=> (not res!167518) (not e!194127))))

(declare-fun arrayContainsKey!0 (array!15870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311059 (= res!167518 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311060 () Bool)

(declare-fun res!167511 () Bool)

(declare-fun e!194129 () Bool)

(assert (=> b!311060 (=> (not res!167511) (not e!194129))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311060 (= res!167511 (and (= (select (arr!7517 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7869 a!3293))))))

(declare-fun lt!152204 () (_ BitVec 32))

(declare-fun e!194130 () Bool)

(declare-fun b!311061 () Bool)

(declare-fun lt!152202 () array!15870)

(declare-datatypes ((SeekEntryResult!2657 0))(
  ( (MissingZero!2657 (index!12804 (_ BitVec 32))) (Found!2657 (index!12805 (_ BitVec 32))) (Intermediate!2657 (undefined!3469 Bool) (index!12806 (_ BitVec 32)) (x!31030 (_ BitVec 32))) (Undefined!2657) (MissingVacant!2657 (index!12807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15870 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!311061 (= e!194130 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152202 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152204 k!2441 lt!152202 mask!3709)))))

(assert (=> b!311061 (= lt!152202 (array!15871 (store (arr!7517 a!3293) i!1240 k!2441) (size!7869 a!3293)))))

(declare-fun b!311062 () Bool)

(assert (=> b!311062 (= e!194127 e!194129)))

(declare-fun res!167515 () Bool)

(assert (=> b!311062 (=> (not res!167515) (not e!194129))))

(declare-fun lt!152203 () SeekEntryResult!2657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311062 (= res!167515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152203))))

(assert (=> b!311062 (= lt!152203 (Intermediate!2657 false resIndex!52 resX!52))))

(declare-fun b!311063 () Bool)

(declare-fun res!167520 () Bool)

(assert (=> b!311063 (=> (not res!167520) (not e!194127))))

(assert (=> b!311063 (= res!167520 (and (= (size!7869 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7869 a!3293))))))

(declare-fun b!311064 () Bool)

(declare-fun e!194128 () Bool)

(assert (=> b!311064 (= e!194129 e!194128)))

(declare-fun res!167512 () Bool)

(assert (=> b!311064 (=> (not res!167512) (not e!194128))))

(declare-fun lt!152205 () SeekEntryResult!2657)

(assert (=> b!311064 (= res!167512 (and (= lt!152205 lt!152203) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7517 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311064 (= lt!152205 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311065 () Bool)

(assert (=> b!311065 (= e!194128 (not true))))

(assert (=> b!311065 e!194130))

(declare-fun res!167519 () Bool)

(assert (=> b!311065 (=> (not res!167519) (not e!194130))))

(assert (=> b!311065 (= res!167519 (= lt!152205 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152204 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311065 (= lt!152204 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311066 () Bool)

(declare-fun res!167513 () Bool)

(assert (=> b!311066 (=> (not res!167513) (not e!194127))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15870 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!311066 (= res!167513 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2657 i!1240)))))

(assert (= (and start!30968 res!167517) b!311063))

(assert (= (and b!311063 res!167520) b!311057))

(assert (= (and b!311057 res!167516) b!311059))

(assert (= (and b!311059 res!167518) b!311066))

(assert (= (and b!311066 res!167513) b!311058))

(assert (= (and b!311058 res!167514) b!311062))

(assert (= (and b!311062 res!167515) b!311060))

(assert (= (and b!311060 res!167511) b!311064))

(assert (= (and b!311064 res!167512) b!311065))

(assert (= (and b!311065 res!167519) b!311061))

(declare-fun m!321005 () Bool)

(assert (=> start!30968 m!321005))

(declare-fun m!321007 () Bool)

(assert (=> start!30968 m!321007))

(declare-fun m!321009 () Bool)

(assert (=> b!311064 m!321009))

(declare-fun m!321011 () Bool)

(assert (=> b!311064 m!321011))

(declare-fun m!321013 () Bool)

(assert (=> b!311061 m!321013))

(declare-fun m!321015 () Bool)

(assert (=> b!311061 m!321015))

(declare-fun m!321017 () Bool)

(assert (=> b!311061 m!321017))

(declare-fun m!321019 () Bool)

(assert (=> b!311066 m!321019))

(declare-fun m!321021 () Bool)

(assert (=> b!311065 m!321021))

(declare-fun m!321023 () Bool)

(assert (=> b!311065 m!321023))

(declare-fun m!321025 () Bool)

(assert (=> b!311062 m!321025))

(assert (=> b!311062 m!321025))

(declare-fun m!321027 () Bool)

(assert (=> b!311062 m!321027))

(declare-fun m!321029 () Bool)

(assert (=> b!311057 m!321029))

(declare-fun m!321031 () Bool)

(assert (=> b!311059 m!321031))

(declare-fun m!321033 () Bool)

(assert (=> b!311060 m!321033))

(declare-fun m!321035 () Bool)

(assert (=> b!311058 m!321035))

(push 1)

