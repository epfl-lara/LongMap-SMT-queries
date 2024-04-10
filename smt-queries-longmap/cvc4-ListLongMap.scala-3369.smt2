; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46270 () Bool)

(assert start!46270)

(declare-fun b!512540 () Bool)

(declare-fun e!299307 () Bool)

(declare-fun e!299306 () Bool)

(assert (=> b!512540 (= e!299307 (not e!299306))))

(declare-fun res!313202 () Bool)

(assert (=> b!512540 (=> res!313202 e!299306)))

(declare-fun lt!234645 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32924 0))(
  ( (array!32925 (arr!15839 (Array (_ BitVec 32) (_ BitVec 64))) (size!16203 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32924)

(declare-datatypes ((SeekEntryResult!4306 0))(
  ( (MissingZero!4306 (index!19412 (_ BitVec 32))) (Found!4306 (index!19413 (_ BitVec 32))) (Intermediate!4306 (undefined!5118 Bool) (index!19414 (_ BitVec 32)) (x!48353 (_ BitVec 32))) (Undefined!4306) (MissingVacant!4306 (index!19415 (_ BitVec 32))) )
))
(declare-fun lt!234646 () SeekEntryResult!4306)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32924 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!512540 (= res!313202 (= lt!234646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234645 (select (store (arr!15839 a!3235) i!1204 k!2280) j!176) (array!32925 (store (arr!15839 a!3235) i!1204 k!2280) (size!16203 a!3235)) mask!3524)))))

(declare-fun lt!234641 () (_ BitVec 32))

(assert (=> b!512540 (= lt!234646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234641 (select (arr!15839 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512540 (= lt!234645 (toIndex!0 (select (store (arr!15839 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512540 (= lt!234641 (toIndex!0 (select (arr!15839 a!3235) j!176) mask!3524))))

(declare-fun lt!234642 () SeekEntryResult!4306)

(assert (=> b!512540 (= lt!234642 (Found!4306 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32924 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!512540 (= lt!234642 (seekEntryOrOpen!0 (select (arr!15839 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32924 (_ BitVec 32)) Bool)

(assert (=> b!512540 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15870 0))(
  ( (Unit!15871) )
))
(declare-fun lt!234644 () Unit!15870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15870)

(assert (=> b!512540 (= lt!234644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512541 () Bool)

(declare-fun res!313206 () Bool)

(assert (=> b!512541 (=> (not res!313206) (not e!299307))))

(declare-datatypes ((List!9997 0))(
  ( (Nil!9994) (Cons!9993 (h!10873 (_ BitVec 64)) (t!16225 List!9997)) )
))
(declare-fun arrayNoDuplicates!0 (array!32924 (_ BitVec 32) List!9997) Bool)

(assert (=> b!512541 (= res!313206 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9994))))

(declare-fun b!512542 () Bool)

(declare-fun res!313204 () Bool)

(declare-fun e!299305 () Bool)

(assert (=> b!512542 (=> (not res!313204) (not e!299305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512542 (= res!313204 (validKeyInArray!0 k!2280))))

(declare-fun b!512543 () Bool)

(declare-fun res!313207 () Bool)

(assert (=> b!512543 (=> (not res!313207) (not e!299305))))

(assert (=> b!512543 (= res!313207 (validKeyInArray!0 (select (arr!15839 a!3235) j!176)))))

(declare-fun b!512544 () Bool)

(assert (=> b!512544 (= e!299306 true)))

(assert (=> b!512544 (= lt!234642 Undefined!4306)))

(declare-fun res!313208 () Bool)

(assert (=> start!46270 (=> (not res!313208) (not e!299305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46270 (= res!313208 (validMask!0 mask!3524))))

(assert (=> start!46270 e!299305))

(assert (=> start!46270 true))

(declare-fun array_inv!11635 (array!32924) Bool)

(assert (=> start!46270 (array_inv!11635 a!3235)))

(declare-fun b!512545 () Bool)

(declare-fun res!313211 () Bool)

(assert (=> b!512545 (=> (not res!313211) (not e!299307))))

(assert (=> b!512545 (= res!313211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512546 () Bool)

(assert (=> b!512546 (= e!299305 e!299307)))

(declare-fun res!313209 () Bool)

(assert (=> b!512546 (=> (not res!313209) (not e!299307))))

(declare-fun lt!234643 () SeekEntryResult!4306)

(assert (=> b!512546 (= res!313209 (or (= lt!234643 (MissingZero!4306 i!1204)) (= lt!234643 (MissingVacant!4306 i!1204))))))

(assert (=> b!512546 (= lt!234643 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512547 () Bool)

(declare-fun res!313205 () Bool)

(assert (=> b!512547 (=> res!313205 e!299306)))

(assert (=> b!512547 (= res!313205 (or (not (is-Intermediate!4306 lt!234646)) (not (undefined!5118 lt!234646))))))

(declare-fun b!512548 () Bool)

(declare-fun res!313210 () Bool)

(assert (=> b!512548 (=> (not res!313210) (not e!299305))))

(assert (=> b!512548 (= res!313210 (and (= (size!16203 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16203 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16203 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512549 () Bool)

(declare-fun res!313203 () Bool)

(assert (=> b!512549 (=> (not res!313203) (not e!299305))))

(declare-fun arrayContainsKey!0 (array!32924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512549 (= res!313203 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46270 res!313208) b!512548))

(assert (= (and b!512548 res!313210) b!512543))

(assert (= (and b!512543 res!313207) b!512542))

(assert (= (and b!512542 res!313204) b!512549))

(assert (= (and b!512549 res!313203) b!512546))

(assert (= (and b!512546 res!313209) b!512545))

(assert (= (and b!512545 res!313211) b!512541))

(assert (= (and b!512541 res!313206) b!512540))

(assert (= (and b!512540 (not res!313202)) b!512547))

(assert (= (and b!512547 (not res!313205)) b!512544))

(declare-fun m!494217 () Bool)

(assert (=> b!512549 m!494217))

(declare-fun m!494219 () Bool)

(assert (=> b!512542 m!494219))

(declare-fun m!494221 () Bool)

(assert (=> b!512546 m!494221))

(declare-fun m!494223 () Bool)

(assert (=> b!512540 m!494223))

(declare-fun m!494225 () Bool)

(assert (=> b!512540 m!494225))

(declare-fun m!494227 () Bool)

(assert (=> b!512540 m!494227))

(declare-fun m!494229 () Bool)

(assert (=> b!512540 m!494229))

(declare-fun m!494231 () Bool)

(assert (=> b!512540 m!494231))

(declare-fun m!494233 () Bool)

(assert (=> b!512540 m!494233))

(assert (=> b!512540 m!494227))

(assert (=> b!512540 m!494223))

(declare-fun m!494235 () Bool)

(assert (=> b!512540 m!494235))

(assert (=> b!512540 m!494223))

(declare-fun m!494237 () Bool)

(assert (=> b!512540 m!494237))

(assert (=> b!512540 m!494223))

(declare-fun m!494239 () Bool)

(assert (=> b!512540 m!494239))

(assert (=> b!512540 m!494227))

(declare-fun m!494241 () Bool)

(assert (=> b!512540 m!494241))

(declare-fun m!494243 () Bool)

(assert (=> b!512541 m!494243))

(declare-fun m!494245 () Bool)

(assert (=> b!512545 m!494245))

(assert (=> b!512543 m!494223))

(assert (=> b!512543 m!494223))

(declare-fun m!494247 () Bool)

(assert (=> b!512543 m!494247))

(declare-fun m!494249 () Bool)

(assert (=> start!46270 m!494249))

(declare-fun m!494251 () Bool)

(assert (=> start!46270 m!494251))

(push 1)

