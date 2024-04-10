; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46072 () Bool)

(assert start!46072)

(declare-fun res!311120 () Bool)

(declare-fun e!298293 () Bool)

(assert (=> start!46072 (=> (not res!311120) (not e!298293))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46072 (= res!311120 (validMask!0 mask!3524))))

(assert (=> start!46072 e!298293))

(assert (=> start!46072 true))

(declare-datatypes ((array!32783 0))(
  ( (array!32784 (arr!15770 (Array (_ BitVec 32) (_ BitVec 64))) (size!16134 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32783)

(declare-fun array_inv!11566 (array!32783) Bool)

(assert (=> start!46072 (array_inv!11566 a!3235)))

(declare-fun b!510270 () Bool)

(declare-fun res!311117 () Bool)

(assert (=> b!510270 (=> (not res!311117) (not e!298293))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510270 (= res!311117 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510271 () Bool)

(declare-fun e!298292 () Bool)

(assert (=> b!510271 (= e!298293 e!298292)))

(declare-fun res!311119 () Bool)

(assert (=> b!510271 (=> (not res!311119) (not e!298292))))

(declare-datatypes ((SeekEntryResult!4237 0))(
  ( (MissingZero!4237 (index!19136 (_ BitVec 32))) (Found!4237 (index!19137 (_ BitVec 32))) (Intermediate!4237 (undefined!5049 Bool) (index!19138 (_ BitVec 32)) (x!48094 (_ BitVec 32))) (Undefined!4237) (MissingVacant!4237 (index!19139 (_ BitVec 32))) )
))
(declare-fun lt!233271 () SeekEntryResult!4237)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510271 (= res!311119 (or (= lt!233271 (MissingZero!4237 i!1204)) (= lt!233271 (MissingVacant!4237 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32783 (_ BitVec 32)) SeekEntryResult!4237)

(assert (=> b!510271 (= lt!233271 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510272 () Bool)

(declare-fun res!311116 () Bool)

(assert (=> b!510272 (=> (not res!311116) (not e!298293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510272 (= res!311116 (validKeyInArray!0 k!2280))))

(declare-fun b!510273 () Bool)

(declare-fun res!311115 () Bool)

(assert (=> b!510273 (=> (not res!311115) (not e!298292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32783 (_ BitVec 32)) Bool)

(assert (=> b!510273 (= res!311115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510274 () Bool)

(declare-fun res!311118 () Bool)

(assert (=> b!510274 (=> (not res!311118) (not e!298293))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510274 (= res!311118 (and (= (size!16134 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16134 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16134 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510275 () Bool)

(declare-fun e!298291 () Bool)

(assert (=> b!510275 (= e!298291 true)))

(declare-fun lt!233270 () SeekEntryResult!4237)

(declare-fun lt!233275 () (_ BitVec 64))

(declare-fun lt!233272 () array!32783)

(assert (=> b!510275 (= lt!233270 (seekEntryOrOpen!0 lt!233275 lt!233272 mask!3524))))

(declare-datatypes ((Unit!15732 0))(
  ( (Unit!15733) )
))
(declare-fun lt!233273 () Unit!15732)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32783 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15732)

(assert (=> b!510275 (= lt!233273 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510276 () Bool)

(declare-fun res!311123 () Bool)

(assert (=> b!510276 (=> (not res!311123) (not e!298292))))

(declare-datatypes ((List!9928 0))(
  ( (Nil!9925) (Cons!9924 (h!10801 (_ BitVec 64)) (t!16156 List!9928)) )
))
(declare-fun arrayNoDuplicates!0 (array!32783 (_ BitVec 32) List!9928) Bool)

(assert (=> b!510276 (= res!311123 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9925))))

(declare-fun b!510277 () Bool)

(declare-fun res!311122 () Bool)

(assert (=> b!510277 (=> (not res!311122) (not e!298293))))

(assert (=> b!510277 (= res!311122 (validKeyInArray!0 (select (arr!15770 a!3235) j!176)))))

(declare-fun b!510278 () Bool)

(assert (=> b!510278 (= e!298292 (not e!298291))))

(declare-fun res!311121 () Bool)

(assert (=> b!510278 (=> res!311121 e!298291)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32783 (_ BitVec 32)) SeekEntryResult!4237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510278 (= res!311121 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15770 a!3235) j!176) mask!3524) (select (arr!15770 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233275 mask!3524) lt!233275 lt!233272 mask!3524))))))

(assert (=> b!510278 (= lt!233275 (select (store (arr!15770 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510278 (= lt!233272 (array!32784 (store (arr!15770 a!3235) i!1204 k!2280) (size!16134 a!3235)))))

(assert (=> b!510278 (= lt!233270 (Found!4237 j!176))))

(assert (=> b!510278 (= lt!233270 (seekEntryOrOpen!0 (select (arr!15770 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510278 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233274 () Unit!15732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15732)

(assert (=> b!510278 (= lt!233274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46072 res!311120) b!510274))

(assert (= (and b!510274 res!311118) b!510277))

(assert (= (and b!510277 res!311122) b!510272))

(assert (= (and b!510272 res!311116) b!510270))

(assert (= (and b!510270 res!311117) b!510271))

(assert (= (and b!510271 res!311119) b!510273))

(assert (= (and b!510273 res!311115) b!510276))

(assert (= (and b!510276 res!311123) b!510278))

(assert (= (and b!510278 (not res!311121)) b!510275))

(declare-fun m!491453 () Bool)

(assert (=> b!510273 m!491453))

(declare-fun m!491455 () Bool)

(assert (=> b!510276 m!491455))

(declare-fun m!491457 () Bool)

(assert (=> start!46072 m!491457))

(declare-fun m!491459 () Bool)

(assert (=> start!46072 m!491459))

(declare-fun m!491461 () Bool)

(assert (=> b!510275 m!491461))

(declare-fun m!491463 () Bool)

(assert (=> b!510275 m!491463))

(declare-fun m!491465 () Bool)

(assert (=> b!510278 m!491465))

(declare-fun m!491467 () Bool)

(assert (=> b!510278 m!491467))

(declare-fun m!491469 () Bool)

(assert (=> b!510278 m!491469))

(declare-fun m!491471 () Bool)

(assert (=> b!510278 m!491471))

(declare-fun m!491473 () Bool)

(assert (=> b!510278 m!491473))

(declare-fun m!491475 () Bool)

(assert (=> b!510278 m!491475))

(declare-fun m!491477 () Bool)

(assert (=> b!510278 m!491477))

(declare-fun m!491479 () Bool)

(assert (=> b!510278 m!491479))

(assert (=> b!510278 m!491477))

(assert (=> b!510278 m!491475))

(assert (=> b!510278 m!491465))

(assert (=> b!510278 m!491477))

(declare-fun m!491481 () Bool)

(assert (=> b!510278 m!491481))

(assert (=> b!510278 m!491477))

(declare-fun m!491483 () Bool)

(assert (=> b!510278 m!491483))

(declare-fun m!491485 () Bool)

(assert (=> b!510271 m!491485))

(assert (=> b!510277 m!491477))

(assert (=> b!510277 m!491477))

(declare-fun m!491487 () Bool)

(assert (=> b!510277 m!491487))

(declare-fun m!491489 () Bool)

(assert (=> b!510270 m!491489))

(declare-fun m!491491 () Bool)

(assert (=> b!510272 m!491491))

(push 1)

