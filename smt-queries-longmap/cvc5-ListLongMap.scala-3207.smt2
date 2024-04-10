; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44988 () Bool)

(assert start!44988)

(declare-fun b!493466 () Bool)

(declare-fun res!296043 () Bool)

(declare-fun e!289795 () Bool)

(assert (=> b!493466 (=> (not res!296043) (not e!289795))))

(declare-datatypes ((array!31933 0))(
  ( (array!31934 (arr!15351 (Array (_ BitVec 32) (_ BitVec 64))) (size!15715 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31933)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31933 (_ BitVec 32)) Bool)

(assert (=> b!493466 (= res!296043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493467 () Bool)

(declare-fun e!289796 () Bool)

(assert (=> b!493467 (= e!289796 e!289795)))

(declare-fun res!296041 () Bool)

(assert (=> b!493467 (=> (not res!296041) (not e!289795))))

(declare-datatypes ((SeekEntryResult!3818 0))(
  ( (MissingZero!3818 (index!17451 (_ BitVec 32))) (Found!3818 (index!17452 (_ BitVec 32))) (Intermediate!3818 (undefined!4630 Bool) (index!17453 (_ BitVec 32)) (x!46536 (_ BitVec 32))) (Undefined!3818) (MissingVacant!3818 (index!17454 (_ BitVec 32))) )
))
(declare-fun lt!223190 () SeekEntryResult!3818)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493467 (= res!296041 (or (= lt!223190 (MissingZero!3818 i!1204)) (= lt!223190 (MissingVacant!3818 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31933 (_ BitVec 32)) SeekEntryResult!3818)

(assert (=> b!493467 (= lt!223190 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493468 () Bool)

(declare-fun res!296038 () Bool)

(assert (=> b!493468 (=> (not res!296038) (not e!289796))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493468 (= res!296038 (and (= (size!15715 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15715 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15715 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493469 () Bool)

(declare-fun e!289797 () Bool)

(assert (=> b!493469 (= e!289797 true)))

(declare-fun lt!223187 () SeekEntryResult!3818)

(assert (=> b!493469 (= lt!223187 Undefined!3818)))

(declare-fun b!493470 () Bool)

(declare-fun res!296044 () Bool)

(assert (=> b!493470 (=> res!296044 e!289797)))

(declare-fun lt!223191 () SeekEntryResult!3818)

(assert (=> b!493470 (= res!296044 (or (not (is-Intermediate!3818 lt!223191)) (not (undefined!4630 lt!223191))))))

(declare-fun res!296037 () Bool)

(assert (=> start!44988 (=> (not res!296037) (not e!289796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44988 (= res!296037 (validMask!0 mask!3524))))

(assert (=> start!44988 e!289796))

(assert (=> start!44988 true))

(declare-fun array_inv!11147 (array!31933) Bool)

(assert (=> start!44988 (array_inv!11147 a!3235)))

(declare-fun b!493471 () Bool)

(assert (=> b!493471 (= e!289795 (not e!289797))))

(declare-fun res!296042 () Bool)

(assert (=> b!493471 (=> res!296042 e!289797)))

(declare-fun lt!223192 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31933 (_ BitVec 32)) SeekEntryResult!3818)

(assert (=> b!493471 (= res!296042 (= lt!223191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223192 (select (store (arr!15351 a!3235) i!1204 k!2280) j!176) (array!31934 (store (arr!15351 a!3235) i!1204 k!2280) (size!15715 a!3235)) mask!3524)))))

(declare-fun lt!223188 () (_ BitVec 32))

(assert (=> b!493471 (= lt!223191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223188 (select (arr!15351 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493471 (= lt!223192 (toIndex!0 (select (store (arr!15351 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493471 (= lt!223188 (toIndex!0 (select (arr!15351 a!3235) j!176) mask!3524))))

(assert (=> b!493471 (= lt!223187 (Found!3818 j!176))))

(assert (=> b!493471 (= lt!223187 (seekEntryOrOpen!0 (select (arr!15351 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493471 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14582 0))(
  ( (Unit!14583) )
))
(declare-fun lt!223189 () Unit!14582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14582)

(assert (=> b!493471 (= lt!223189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493472 () Bool)

(declare-fun res!296045 () Bool)

(assert (=> b!493472 (=> (not res!296045) (not e!289795))))

(declare-datatypes ((List!9509 0))(
  ( (Nil!9506) (Cons!9505 (h!10373 (_ BitVec 64)) (t!15737 List!9509)) )
))
(declare-fun arrayNoDuplicates!0 (array!31933 (_ BitVec 32) List!9509) Bool)

(assert (=> b!493472 (= res!296045 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9506))))

(declare-fun b!493473 () Bool)

(declare-fun res!296040 () Bool)

(assert (=> b!493473 (=> (not res!296040) (not e!289796))))

(declare-fun arrayContainsKey!0 (array!31933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493473 (= res!296040 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493474 () Bool)

(declare-fun res!296039 () Bool)

(assert (=> b!493474 (=> (not res!296039) (not e!289796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493474 (= res!296039 (validKeyInArray!0 k!2280))))

(declare-fun b!493475 () Bool)

(declare-fun res!296036 () Bool)

(assert (=> b!493475 (=> (not res!296036) (not e!289796))))

(assert (=> b!493475 (= res!296036 (validKeyInArray!0 (select (arr!15351 a!3235) j!176)))))

(assert (= (and start!44988 res!296037) b!493468))

(assert (= (and b!493468 res!296038) b!493475))

(assert (= (and b!493475 res!296036) b!493474))

(assert (= (and b!493474 res!296039) b!493473))

(assert (= (and b!493473 res!296040) b!493467))

(assert (= (and b!493467 res!296041) b!493466))

(assert (= (and b!493466 res!296043) b!493472))

(assert (= (and b!493472 res!296045) b!493471))

(assert (= (and b!493471 (not res!296042)) b!493470))

(assert (= (and b!493470 (not res!296044)) b!493469))

(declare-fun m!474315 () Bool)

(assert (=> b!493475 m!474315))

(assert (=> b!493475 m!474315))

(declare-fun m!474317 () Bool)

(assert (=> b!493475 m!474317))

(declare-fun m!474319 () Bool)

(assert (=> start!44988 m!474319))

(declare-fun m!474321 () Bool)

(assert (=> start!44988 m!474321))

(declare-fun m!474323 () Bool)

(assert (=> b!493466 m!474323))

(declare-fun m!474325 () Bool)

(assert (=> b!493467 m!474325))

(assert (=> b!493471 m!474315))

(declare-fun m!474327 () Bool)

(assert (=> b!493471 m!474327))

(declare-fun m!474329 () Bool)

(assert (=> b!493471 m!474329))

(declare-fun m!474331 () Bool)

(assert (=> b!493471 m!474331))

(declare-fun m!474333 () Bool)

(assert (=> b!493471 m!474333))

(assert (=> b!493471 m!474315))

(declare-fun m!474335 () Bool)

(assert (=> b!493471 m!474335))

(assert (=> b!493471 m!474333))

(declare-fun m!474337 () Bool)

(assert (=> b!493471 m!474337))

(assert (=> b!493471 m!474315))

(declare-fun m!474339 () Bool)

(assert (=> b!493471 m!474339))

(assert (=> b!493471 m!474315))

(declare-fun m!474341 () Bool)

(assert (=> b!493471 m!474341))

(assert (=> b!493471 m!474333))

(declare-fun m!474343 () Bool)

(assert (=> b!493471 m!474343))

(declare-fun m!474345 () Bool)

(assert (=> b!493473 m!474345))

(declare-fun m!474347 () Bool)

(assert (=> b!493474 m!474347))

(declare-fun m!474349 () Bool)

(assert (=> b!493472 m!474349))

(push 1)

