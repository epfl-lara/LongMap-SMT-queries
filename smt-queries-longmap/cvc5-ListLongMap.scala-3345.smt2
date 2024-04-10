; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46062 () Bool)

(assert start!46062)

(declare-fun b!510135 () Bool)

(declare-fun res!310985 () Bool)

(declare-fun e!298233 () Bool)

(assert (=> b!510135 (=> (not res!310985) (not e!298233))))

(declare-datatypes ((array!32773 0))(
  ( (array!32774 (arr!15765 (Array (_ BitVec 32) (_ BitVec 64))) (size!16129 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32773)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510135 (= res!310985 (validKeyInArray!0 (select (arr!15765 a!3235) j!176)))))

(declare-fun b!510136 () Bool)

(declare-fun res!310983 () Bool)

(assert (=> b!510136 (=> (not res!310983) (not e!298233))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510136 (= res!310983 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510137 () Bool)

(declare-fun res!310980 () Bool)

(declare-fun e!298230 () Bool)

(assert (=> b!510137 (=> (not res!310980) (not e!298230))))

(declare-datatypes ((List!9923 0))(
  ( (Nil!9920) (Cons!9919 (h!10796 (_ BitVec 64)) (t!16151 List!9923)) )
))
(declare-fun arrayNoDuplicates!0 (array!32773 (_ BitVec 32) List!9923) Bool)

(assert (=> b!510137 (= res!310980 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9920))))

(declare-fun b!510138 () Bool)

(declare-fun e!298231 () Bool)

(assert (=> b!510138 (= e!298230 (not e!298231))))

(declare-fun res!310987 () Bool)

(assert (=> b!510138 (=> res!310987 e!298231)))

(declare-fun lt!233183 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233180 () array!32773)

(declare-datatypes ((SeekEntryResult!4232 0))(
  ( (MissingZero!4232 (index!19116 (_ BitVec 32))) (Found!4232 (index!19117 (_ BitVec 32))) (Intermediate!4232 (undefined!5044 Bool) (index!19118 (_ BitVec 32)) (x!48081 (_ BitVec 32))) (Undefined!4232) (MissingVacant!4232 (index!19119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32773 (_ BitVec 32)) SeekEntryResult!4232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510138 (= res!310987 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15765 a!3235) j!176) mask!3524) (select (arr!15765 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233183 mask!3524) lt!233183 lt!233180 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510138 (= lt!233183 (select (store (arr!15765 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510138 (= lt!233180 (array!32774 (store (arr!15765 a!3235) i!1204 k!2280) (size!16129 a!3235)))))

(declare-fun lt!233182 () SeekEntryResult!4232)

(assert (=> b!510138 (= lt!233182 (Found!4232 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32773 (_ BitVec 32)) SeekEntryResult!4232)

(assert (=> b!510138 (= lt!233182 (seekEntryOrOpen!0 (select (arr!15765 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32773 (_ BitVec 32)) Bool)

(assert (=> b!510138 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15722 0))(
  ( (Unit!15723) )
))
(declare-fun lt!233181 () Unit!15722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15722)

(assert (=> b!510138 (= lt!233181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510140 () Bool)

(declare-fun res!310982 () Bool)

(assert (=> b!510140 (=> (not res!310982) (not e!298233))))

(assert (=> b!510140 (= res!310982 (and (= (size!16129 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16129 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16129 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510141 () Bool)

(assert (=> b!510141 (= e!298231 true)))

(assert (=> b!510141 (= lt!233182 (seekEntryOrOpen!0 lt!233183 lt!233180 mask!3524))))

(declare-fun lt!233185 () Unit!15722)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15722)

(assert (=> b!510141 (= lt!233185 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510142 () Bool)

(declare-fun res!310986 () Bool)

(assert (=> b!510142 (=> (not res!310986) (not e!298233))))

(assert (=> b!510142 (= res!310986 (validKeyInArray!0 k!2280))))

(declare-fun b!510143 () Bool)

(declare-fun res!310984 () Bool)

(assert (=> b!510143 (=> (not res!310984) (not e!298230))))

(assert (=> b!510143 (= res!310984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310988 () Bool)

(assert (=> start!46062 (=> (not res!310988) (not e!298233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46062 (= res!310988 (validMask!0 mask!3524))))

(assert (=> start!46062 e!298233))

(assert (=> start!46062 true))

(declare-fun array_inv!11561 (array!32773) Bool)

(assert (=> start!46062 (array_inv!11561 a!3235)))

(declare-fun b!510139 () Bool)

(assert (=> b!510139 (= e!298233 e!298230)))

(declare-fun res!310981 () Bool)

(assert (=> b!510139 (=> (not res!310981) (not e!298230))))

(declare-fun lt!233184 () SeekEntryResult!4232)

(assert (=> b!510139 (= res!310981 (or (= lt!233184 (MissingZero!4232 i!1204)) (= lt!233184 (MissingVacant!4232 i!1204))))))

(assert (=> b!510139 (= lt!233184 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46062 res!310988) b!510140))

(assert (= (and b!510140 res!310982) b!510135))

(assert (= (and b!510135 res!310985) b!510142))

(assert (= (and b!510142 res!310986) b!510136))

(assert (= (and b!510136 res!310983) b!510139))

(assert (= (and b!510139 res!310981) b!510143))

(assert (= (and b!510143 res!310984) b!510137))

(assert (= (and b!510137 res!310980) b!510138))

(assert (= (and b!510138 (not res!310987)) b!510141))

(declare-fun m!491253 () Bool)

(assert (=> b!510137 m!491253))

(declare-fun m!491255 () Bool)

(assert (=> b!510142 m!491255))

(declare-fun m!491257 () Bool)

(assert (=> b!510139 m!491257))

(declare-fun m!491259 () Bool)

(assert (=> b!510136 m!491259))

(declare-fun m!491261 () Bool)

(assert (=> start!46062 m!491261))

(declare-fun m!491263 () Bool)

(assert (=> start!46062 m!491263))

(declare-fun m!491265 () Bool)

(assert (=> b!510138 m!491265))

(declare-fun m!491267 () Bool)

(assert (=> b!510138 m!491267))

(declare-fun m!491269 () Bool)

(assert (=> b!510138 m!491269))

(declare-fun m!491271 () Bool)

(assert (=> b!510138 m!491271))

(declare-fun m!491273 () Bool)

(assert (=> b!510138 m!491273))

(declare-fun m!491275 () Bool)

(assert (=> b!510138 m!491275))

(declare-fun m!491277 () Bool)

(assert (=> b!510138 m!491277))

(assert (=> b!510138 m!491275))

(assert (=> b!510138 m!491273))

(assert (=> b!510138 m!491275))

(declare-fun m!491279 () Bool)

(assert (=> b!510138 m!491279))

(assert (=> b!510138 m!491275))

(declare-fun m!491281 () Bool)

(assert (=> b!510138 m!491281))

(assert (=> b!510138 m!491265))

(declare-fun m!491283 () Bool)

(assert (=> b!510138 m!491283))

(assert (=> b!510135 m!491275))

(assert (=> b!510135 m!491275))

(declare-fun m!491285 () Bool)

(assert (=> b!510135 m!491285))

(declare-fun m!491287 () Bool)

(assert (=> b!510143 m!491287))

(declare-fun m!491289 () Bool)

(assert (=> b!510141 m!491289))

(declare-fun m!491291 () Bool)

(assert (=> b!510141 m!491291))

(push 1)

(assert (not b!510137))

(assert (not b!510139))

