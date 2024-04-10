; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31850 () Bool)

(assert start!31850)

(declare-fun b!318392 () Bool)

(declare-fun e!197843 () Bool)

(declare-fun e!197841 () Bool)

(assert (=> b!318392 (= e!197843 e!197841)))

(declare-fun res!172980 () Bool)

(assert (=> b!318392 (=> (not res!172980) (not e!197841))))

(declare-datatypes ((array!16221 0))(
  ( (array!16222 (arr!7676 (Array (_ BitVec 32) (_ BitVec 64))) (size!8028 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16221)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2816 0))(
  ( (MissingZero!2816 (index!13440 (_ BitVec 32))) (Found!2816 (index!13441 (_ BitVec 32))) (Intermediate!2816 (undefined!3628 Bool) (index!13442 (_ BitVec 32)) (x!31697 (_ BitVec 32))) (Undefined!2816) (MissingVacant!2816 (index!13443 (_ BitVec 32))) )
))
(declare-fun lt!155334 () SeekEntryResult!2816)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16221 (_ BitVec 32)) SeekEntryResult!2816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318392 (= res!172980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155334))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318392 (= lt!155334 (Intermediate!2816 false resIndex!52 resX!52))))

(declare-fun b!318393 () Bool)

(declare-fun res!172979 () Bool)

(assert (=> b!318393 (=> (not res!172979) (not e!197843))))

(declare-fun arrayContainsKey!0 (array!16221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318393 (= res!172979 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318394 () Bool)

(declare-fun res!172971 () Bool)

(assert (=> b!318394 (=> (not res!172971) (not e!197843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16221 (_ BitVec 32)) Bool)

(assert (=> b!318394 (= res!172971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!172978 () Bool)

(assert (=> start!31850 (=> (not res!172978) (not e!197843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31850 (= res!172978 (validMask!0 mask!3709))))

(assert (=> start!31850 e!197843))

(declare-fun array_inv!5639 (array!16221) Bool)

(assert (=> start!31850 (array_inv!5639 a!3293)))

(assert (=> start!31850 true))

(declare-fun b!318395 () Bool)

(declare-fun res!172975 () Bool)

(assert (=> b!318395 (=> (not res!172975) (not e!197843))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318395 (= res!172975 (and (= (size!8028 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8028 a!3293))))))

(declare-fun e!197844 () Bool)

(declare-fun lt!155333 () (_ BitVec 32))

(declare-fun lt!155331 () array!16221)

(declare-fun b!318396 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318396 (= e!197844 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155331 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155333 k!2441 lt!155331 mask!3709)))))

(assert (=> b!318396 (= lt!155331 (array!16222 (store (arr!7676 a!3293) i!1240 k!2441) (size!8028 a!3293)))))

(declare-fun b!318397 () Bool)

(declare-fun e!197842 () Bool)

(assert (=> b!318397 (= e!197841 e!197842)))

(declare-fun res!172976 () Bool)

(assert (=> b!318397 (=> (not res!172976) (not e!197842))))

(declare-fun lt!155332 () SeekEntryResult!2816)

(assert (=> b!318397 (= res!172976 (and (= lt!155332 lt!155334) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7676 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318397 (= lt!155332 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318398 () Bool)

(declare-fun res!172972 () Bool)

(assert (=> b!318398 (=> (not res!172972) (not e!197843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318398 (= res!172972 (validKeyInArray!0 k!2441))))

(declare-fun b!318399 () Bool)

(declare-fun res!172974 () Bool)

(assert (=> b!318399 (=> (not res!172974) (not e!197843))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16221 (_ BitVec 32)) SeekEntryResult!2816)

(assert (=> b!318399 (= res!172974 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2816 i!1240)))))

(declare-fun b!318400 () Bool)

(declare-fun res!172973 () Bool)

(assert (=> b!318400 (=> (not res!172973) (not e!197841))))

(assert (=> b!318400 (= res!172973 (and (= (select (arr!7676 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8028 a!3293))))))

(declare-fun b!318401 () Bool)

(assert (=> b!318401 (= e!197842 (not (bvsle (bvadd #b00000000000000000000000000000001 x!1427) resX!52)))))

(assert (=> b!318401 e!197844))

(declare-fun res!172977 () Bool)

(assert (=> b!318401 (=> (not res!172977) (not e!197844))))

(assert (=> b!318401 (= res!172977 (= lt!155332 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155333 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318401 (= lt!155333 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31850 res!172978) b!318395))

(assert (= (and b!318395 res!172975) b!318398))

(assert (= (and b!318398 res!172972) b!318393))

(assert (= (and b!318393 res!172979) b!318399))

(assert (= (and b!318399 res!172974) b!318394))

(assert (= (and b!318394 res!172971) b!318392))

(assert (= (and b!318392 res!172980) b!318400))

(assert (= (and b!318400 res!172973) b!318397))

(assert (= (and b!318397 res!172976) b!318401))

(assert (= (and b!318401 res!172977) b!318396))

(declare-fun m!327089 () Bool)

(assert (=> b!318398 m!327089))

(declare-fun m!327091 () Bool)

(assert (=> b!318401 m!327091))

(declare-fun m!327093 () Bool)

(assert (=> b!318401 m!327093))

(declare-fun m!327095 () Bool)

(assert (=> b!318396 m!327095))

(declare-fun m!327097 () Bool)

(assert (=> b!318396 m!327097))

(declare-fun m!327099 () Bool)

(assert (=> b!318396 m!327099))

(declare-fun m!327101 () Bool)

(assert (=> b!318394 m!327101))

(declare-fun m!327103 () Bool)

(assert (=> b!318400 m!327103))

(declare-fun m!327105 () Bool)

(assert (=> start!31850 m!327105))

(declare-fun m!327107 () Bool)

(assert (=> start!31850 m!327107))

(declare-fun m!327109 () Bool)

(assert (=> b!318392 m!327109))

(assert (=> b!318392 m!327109))

(declare-fun m!327111 () Bool)

(assert (=> b!318392 m!327111))

(declare-fun m!327113 () Bool)

(assert (=> b!318397 m!327113))

(declare-fun m!327115 () Bool)

(assert (=> b!318397 m!327115))

(declare-fun m!327117 () Bool)

(assert (=> b!318393 m!327117))

(declare-fun m!327119 () Bool)

(assert (=> b!318399 m!327119))

(push 1)

(assert (not b!318397))

(assert (not b!318401))

(assert (not b!318399))

(assert (not start!31850))

(assert (not b!318396))

(assert (not b!318398))

(assert (not b!318393))

(assert (not b!318392))

(assert (not b!318394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

