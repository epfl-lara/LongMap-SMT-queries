; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44992 () Bool)

(assert start!44992)

(declare-fun b!493526 () Bool)

(declare-fun res!296104 () Bool)

(declare-fun e!289821 () Bool)

(assert (=> b!493526 (=> res!296104 e!289821)))

(declare-datatypes ((SeekEntryResult!3820 0))(
  ( (MissingZero!3820 (index!17459 (_ BitVec 32))) (Found!3820 (index!17460 (_ BitVec 32))) (Intermediate!3820 (undefined!4632 Bool) (index!17461 (_ BitVec 32)) (x!46538 (_ BitVec 32))) (Undefined!3820) (MissingVacant!3820 (index!17462 (_ BitVec 32))) )
))
(declare-fun lt!223223 () SeekEntryResult!3820)

(assert (=> b!493526 (= res!296104 (or (not (is-Intermediate!3820 lt!223223)) (not (undefined!4632 lt!223223))))))

(declare-fun b!493527 () Bool)

(declare-fun res!296099 () Bool)

(declare-fun e!289820 () Bool)

(assert (=> b!493527 (=> (not res!296099) (not e!289820))))

(declare-datatypes ((array!31937 0))(
  ( (array!31938 (arr!15353 (Array (_ BitVec 32) (_ BitVec 64))) (size!15717 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31937)

(declare-datatypes ((List!9511 0))(
  ( (Nil!9508) (Cons!9507 (h!10375 (_ BitVec 64)) (t!15739 List!9511)) )
))
(declare-fun arrayNoDuplicates!0 (array!31937 (_ BitVec 32) List!9511) Bool)

(assert (=> b!493527 (= res!296099 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9508))))

(declare-fun b!493528 () Bool)

(declare-fun res!296103 () Bool)

(assert (=> b!493528 (=> (not res!296103) (not e!289820))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31937 (_ BitVec 32)) Bool)

(assert (=> b!493528 (= res!296103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493530 () Bool)

(declare-fun res!296097 () Bool)

(declare-fun e!289818 () Bool)

(assert (=> b!493530 (=> (not res!296097) (not e!289818))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493530 (= res!296097 (and (= (size!15717 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15717 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15717 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493531 () Bool)

(declare-fun res!296096 () Bool)

(assert (=> b!493531 (=> (not res!296096) (not e!289818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493531 (= res!296096 (validKeyInArray!0 (select (arr!15353 a!3235) j!176)))))

(declare-fun b!493532 () Bool)

(assert (=> b!493532 (= e!289818 e!289820)))

(declare-fun res!296101 () Bool)

(assert (=> b!493532 (=> (not res!296101) (not e!289820))))

(declare-fun lt!223224 () SeekEntryResult!3820)

(assert (=> b!493532 (= res!296101 (or (= lt!223224 (MissingZero!3820 i!1204)) (= lt!223224 (MissingVacant!3820 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31937 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!493532 (= lt!223224 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493533 () Bool)

(declare-fun res!296100 () Bool)

(assert (=> b!493533 (=> (not res!296100) (not e!289818))))

(declare-fun arrayContainsKey!0 (array!31937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493533 (= res!296100 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296102 () Bool)

(assert (=> start!44992 (=> (not res!296102) (not e!289818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44992 (= res!296102 (validMask!0 mask!3524))))

(assert (=> start!44992 e!289818))

(assert (=> start!44992 true))

(declare-fun array_inv!11149 (array!31937) Bool)

(assert (=> start!44992 (array_inv!11149 a!3235)))

(declare-fun b!493529 () Bool)

(assert (=> b!493529 (= e!289820 (not e!289821))))

(declare-fun res!296105 () Bool)

(assert (=> b!493529 (=> res!296105 e!289821)))

(declare-fun lt!223228 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31937 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!493529 (= res!296105 (= lt!223223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223228 (select (store (arr!15353 a!3235) i!1204 k!2280) j!176) (array!31938 (store (arr!15353 a!3235) i!1204 k!2280) (size!15717 a!3235)) mask!3524)))))

(declare-fun lt!223225 () (_ BitVec 32))

(assert (=> b!493529 (= lt!223223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223225 (select (arr!15353 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493529 (= lt!223228 (toIndex!0 (select (store (arr!15353 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493529 (= lt!223225 (toIndex!0 (select (arr!15353 a!3235) j!176) mask!3524))))

(declare-fun lt!223226 () SeekEntryResult!3820)

(assert (=> b!493529 (= lt!223226 (Found!3820 j!176))))

(assert (=> b!493529 (= lt!223226 (seekEntryOrOpen!0 (select (arr!15353 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493529 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14586 0))(
  ( (Unit!14587) )
))
(declare-fun lt!223227 () Unit!14586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14586)

(assert (=> b!493529 (= lt!223227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493534 () Bool)

(declare-fun res!296098 () Bool)

(assert (=> b!493534 (=> (not res!296098) (not e!289818))))

(assert (=> b!493534 (= res!296098 (validKeyInArray!0 k!2280))))

(declare-fun b!493535 () Bool)

(assert (=> b!493535 (= e!289821 true)))

(assert (=> b!493535 (= lt!223226 Undefined!3820)))

(assert (= (and start!44992 res!296102) b!493530))

(assert (= (and b!493530 res!296097) b!493531))

(assert (= (and b!493531 res!296096) b!493534))

(assert (= (and b!493534 res!296098) b!493533))

(assert (= (and b!493533 res!296100) b!493532))

(assert (= (and b!493532 res!296101) b!493528))

(assert (= (and b!493528 res!296103) b!493527))

(assert (= (and b!493527 res!296099) b!493529))

(assert (= (and b!493529 (not res!296105)) b!493526))

(assert (= (and b!493526 (not res!296104)) b!493535))

(declare-fun m!474387 () Bool)

(assert (=> b!493533 m!474387))

(declare-fun m!474389 () Bool)

(assert (=> b!493531 m!474389))

(assert (=> b!493531 m!474389))

(declare-fun m!474391 () Bool)

(assert (=> b!493531 m!474391))

(declare-fun m!474393 () Bool)

(assert (=> b!493527 m!474393))

(declare-fun m!474395 () Bool)

(assert (=> b!493529 m!474395))

(declare-fun m!474397 () Bool)

(assert (=> b!493529 m!474397))

(assert (=> b!493529 m!474389))

(declare-fun m!474399 () Bool)

(assert (=> b!493529 m!474399))

(assert (=> b!493529 m!474389))

(declare-fun m!474401 () Bool)

(assert (=> b!493529 m!474401))

(assert (=> b!493529 m!474389))

(declare-fun m!474403 () Bool)

(assert (=> b!493529 m!474403))

(assert (=> b!493529 m!474389))

(declare-fun m!474405 () Bool)

(assert (=> b!493529 m!474405))

(assert (=> b!493529 m!474397))

(declare-fun m!474407 () Bool)

(assert (=> b!493529 m!474407))

(assert (=> b!493529 m!474397))

(declare-fun m!474409 () Bool)

(assert (=> b!493529 m!474409))

(declare-fun m!474411 () Bool)

(assert (=> b!493529 m!474411))

(declare-fun m!474413 () Bool)

(assert (=> b!493528 m!474413))

(declare-fun m!474415 () Bool)

(assert (=> start!44992 m!474415))

(declare-fun m!474417 () Bool)

(assert (=> start!44992 m!474417))

(declare-fun m!474419 () Bool)

(assert (=> b!493534 m!474419))

(declare-fun m!474421 () Bool)

(assert (=> b!493532 m!474421))

(push 1)

