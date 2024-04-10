; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46066 () Bool)

(assert start!46066)

(declare-fun res!311034 () Bool)

(declare-fun e!298255 () Bool)

(assert (=> start!46066 (=> (not res!311034) (not e!298255))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46066 (= res!311034 (validMask!0 mask!3524))))

(assert (=> start!46066 e!298255))

(assert (=> start!46066 true))

(declare-datatypes ((array!32777 0))(
  ( (array!32778 (arr!15767 (Array (_ BitVec 32) (_ BitVec 64))) (size!16131 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32777)

(declare-fun array_inv!11563 (array!32777) Bool)

(assert (=> start!46066 (array_inv!11563 a!3235)))

(declare-fun b!510189 () Bool)

(declare-fun e!298256 () Bool)

(assert (=> b!510189 (= e!298255 e!298256)))

(declare-fun res!311036 () Bool)

(assert (=> b!510189 (=> (not res!311036) (not e!298256))))

(declare-datatypes ((SeekEntryResult!4234 0))(
  ( (MissingZero!4234 (index!19124 (_ BitVec 32))) (Found!4234 (index!19125 (_ BitVec 32))) (Intermediate!4234 (undefined!5046 Bool) (index!19126 (_ BitVec 32)) (x!48083 (_ BitVec 32))) (Undefined!4234) (MissingVacant!4234 (index!19127 (_ BitVec 32))) )
))
(declare-fun lt!233218 () SeekEntryResult!4234)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510189 (= res!311036 (or (= lt!233218 (MissingZero!4234 i!1204)) (= lt!233218 (MissingVacant!4234 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32777 (_ BitVec 32)) SeekEntryResult!4234)

(assert (=> b!510189 (= lt!233218 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510190 () Bool)

(declare-fun res!311038 () Bool)

(assert (=> b!510190 (=> (not res!311038) (not e!298255))))

(declare-fun arrayContainsKey!0 (array!32777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510190 (= res!311038 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510191 () Bool)

(declare-fun res!311041 () Bool)

(assert (=> b!510191 (=> (not res!311041) (not e!298255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510191 (= res!311041 (validKeyInArray!0 k!2280))))

(declare-fun b!510192 () Bool)

(declare-fun res!311040 () Bool)

(assert (=> b!510192 (=> (not res!311040) (not e!298256))))

(declare-datatypes ((List!9925 0))(
  ( (Nil!9922) (Cons!9921 (h!10798 (_ BitVec 64)) (t!16153 List!9925)) )
))
(declare-fun arrayNoDuplicates!0 (array!32777 (_ BitVec 32) List!9925) Bool)

(assert (=> b!510192 (= res!311040 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9922))))

(declare-fun b!510193 () Bool)

(declare-fun e!298254 () Bool)

(assert (=> b!510193 (= e!298256 (not e!298254))))

(declare-fun res!311042 () Bool)

(assert (=> b!510193 (=> res!311042 e!298254)))

(declare-fun lt!233219 () array!32777)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233220 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32777 (_ BitVec 32)) SeekEntryResult!4234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510193 (= res!311042 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15767 a!3235) j!176) mask!3524) (select (arr!15767 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233220 mask!3524) lt!233220 lt!233219 mask!3524))))))

(assert (=> b!510193 (= lt!233220 (select (store (arr!15767 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510193 (= lt!233219 (array!32778 (store (arr!15767 a!3235) i!1204 k!2280) (size!16131 a!3235)))))

(declare-fun lt!233217 () SeekEntryResult!4234)

(assert (=> b!510193 (= lt!233217 (Found!4234 j!176))))

(assert (=> b!510193 (= lt!233217 (seekEntryOrOpen!0 (select (arr!15767 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32777 (_ BitVec 32)) Bool)

(assert (=> b!510193 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15726 0))(
  ( (Unit!15727) )
))
(declare-fun lt!233221 () Unit!15726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15726)

(assert (=> b!510193 (= lt!233221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510194 () Bool)

(declare-fun res!311035 () Bool)

(assert (=> b!510194 (=> (not res!311035) (not e!298255))))

(assert (=> b!510194 (= res!311035 (and (= (size!16131 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16131 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16131 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510195 () Bool)

(declare-fun res!311039 () Bool)

(assert (=> b!510195 (=> (not res!311039) (not e!298256))))

(assert (=> b!510195 (= res!311039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510196 () Bool)

(assert (=> b!510196 (= e!298254 true)))

(assert (=> b!510196 (= lt!233217 (seekEntryOrOpen!0 lt!233220 lt!233219 mask!3524))))

(declare-fun lt!233216 () Unit!15726)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15726)

(assert (=> b!510196 (= lt!233216 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510197 () Bool)

(declare-fun res!311037 () Bool)

(assert (=> b!510197 (=> (not res!311037) (not e!298255))))

(assert (=> b!510197 (= res!311037 (validKeyInArray!0 (select (arr!15767 a!3235) j!176)))))

(assert (= (and start!46066 res!311034) b!510194))

(assert (= (and b!510194 res!311035) b!510197))

(assert (= (and b!510197 res!311037) b!510191))

(assert (= (and b!510191 res!311041) b!510190))

(assert (= (and b!510190 res!311038) b!510189))

(assert (= (and b!510189 res!311036) b!510195))

(assert (= (and b!510195 res!311039) b!510192))

(assert (= (and b!510192 res!311040) b!510193))

(assert (= (and b!510193 (not res!311042)) b!510196))

(declare-fun m!491333 () Bool)

(assert (=> b!510197 m!491333))

(assert (=> b!510197 m!491333))

(declare-fun m!491335 () Bool)

(assert (=> b!510197 m!491335))

(declare-fun m!491337 () Bool)

(assert (=> b!510195 m!491337))

(declare-fun m!491339 () Bool)

(assert (=> b!510192 m!491339))

(declare-fun m!491341 () Bool)

(assert (=> b!510191 m!491341))

(declare-fun m!491343 () Bool)

(assert (=> b!510193 m!491343))

(declare-fun m!491345 () Bool)

(assert (=> b!510193 m!491345))

(assert (=> b!510193 m!491343))

(declare-fun m!491347 () Bool)

(assert (=> b!510193 m!491347))

(declare-fun m!491349 () Bool)

(assert (=> b!510193 m!491349))

(declare-fun m!491351 () Bool)

(assert (=> b!510193 m!491351))

(declare-fun m!491353 () Bool)

(assert (=> b!510193 m!491353))

(assert (=> b!510193 m!491333))

(declare-fun m!491355 () Bool)

(assert (=> b!510193 m!491355))

(assert (=> b!510193 m!491333))

(assert (=> b!510193 m!491353))

(assert (=> b!510193 m!491333))

(declare-fun m!491357 () Bool)

(assert (=> b!510193 m!491357))

(assert (=> b!510193 m!491333))

(declare-fun m!491359 () Bool)

(assert (=> b!510193 m!491359))

(declare-fun m!491361 () Bool)

(assert (=> b!510189 m!491361))

(declare-fun m!491363 () Bool)

(assert (=> b!510190 m!491363))

(declare-fun m!491365 () Bool)

(assert (=> b!510196 m!491365))

(declare-fun m!491367 () Bool)

(assert (=> b!510196 m!491367))

(declare-fun m!491369 () Bool)

(assert (=> start!46066 m!491369))

(declare-fun m!491371 () Bool)

(assert (=> start!46066 m!491371))

(push 1)

