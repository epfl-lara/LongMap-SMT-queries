; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44754 () Bool)

(assert start!44754)

(declare-fun b!491280 () Bool)

(declare-fun e!288685 () Bool)

(declare-fun e!288687 () Bool)

(assert (=> b!491280 (= e!288685 (not e!288687))))

(declare-fun res!294218 () Bool)

(assert (=> b!491280 (=> res!294218 e!288687)))

(declare-datatypes ((array!31813 0))(
  ( (array!31814 (arr!15294 (Array (_ BitVec 32) (_ BitVec 64))) (size!15658 (_ BitVec 32))) )
))
(declare-fun lt!222049 () array!31813)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222048 () (_ BitVec 64))

(declare-fun a!3235 () array!31813)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3761 0))(
  ( (MissingZero!3761 (index!17223 (_ BitVec 32))) (Found!3761 (index!17224 (_ BitVec 32))) (Intermediate!3761 (undefined!4573 Bool) (index!17225 (_ BitVec 32)) (x!46315 (_ BitVec 32))) (Undefined!3761) (MissingVacant!3761 (index!17226 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31813 (_ BitVec 32)) SeekEntryResult!3761)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491280 (= res!294218 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15294 a!3235) j!176) mask!3524) (select (arr!15294 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222048 mask!3524) lt!222048 lt!222049 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491280 (= lt!222048 (select (store (arr!15294 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491280 (= lt!222049 (array!31814 (store (arr!15294 a!3235) i!1204 k!2280) (size!15658 a!3235)))))

(declare-fun lt!222050 () SeekEntryResult!3761)

(assert (=> b!491280 (= lt!222050 (Found!3761 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31813 (_ BitVec 32)) SeekEntryResult!3761)

(assert (=> b!491280 (= lt!222050 (seekEntryOrOpen!0 (select (arr!15294 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31813 (_ BitVec 32)) Bool)

(assert (=> b!491280 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14468 0))(
  ( (Unit!14469) )
))
(declare-fun lt!222052 () Unit!14468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14468)

(assert (=> b!491280 (= lt!222052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491281 () Bool)

(declare-fun res!294221 () Bool)

(assert (=> b!491281 (=> (not res!294221) (not e!288685))))

(assert (=> b!491281 (= res!294221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491283 () Bool)

(assert (=> b!491283 (= e!288687 true)))

(assert (=> b!491283 (= lt!222050 (seekEntryOrOpen!0 lt!222048 lt!222049 mask!3524))))

(declare-fun lt!222047 () Unit!14468)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14468)

(assert (=> b!491283 (= lt!222047 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491284 () Bool)

(declare-fun res!294223 () Bool)

(declare-fun e!288686 () Bool)

(assert (=> b!491284 (=> (not res!294223) (not e!288686))))

(assert (=> b!491284 (= res!294223 (and (= (size!15658 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15658 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15658 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491285 () Bool)

(declare-fun res!294224 () Bool)

(assert (=> b!491285 (=> (not res!294224) (not e!288685))))

(declare-datatypes ((List!9452 0))(
  ( (Nil!9449) (Cons!9448 (h!10310 (_ BitVec 64)) (t!15680 List!9452)) )
))
(declare-fun arrayNoDuplicates!0 (array!31813 (_ BitVec 32) List!9452) Bool)

(assert (=> b!491285 (= res!294224 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9449))))

(declare-fun b!491286 () Bool)

(assert (=> b!491286 (= e!288686 e!288685)))

(declare-fun res!294216 () Bool)

(assert (=> b!491286 (=> (not res!294216) (not e!288685))))

(declare-fun lt!222051 () SeekEntryResult!3761)

(assert (=> b!491286 (= res!294216 (or (= lt!222051 (MissingZero!3761 i!1204)) (= lt!222051 (MissingVacant!3761 i!1204))))))

(assert (=> b!491286 (= lt!222051 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491287 () Bool)

(declare-fun res!294217 () Bool)

(assert (=> b!491287 (=> (not res!294217) (not e!288686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491287 (= res!294217 (validKeyInArray!0 k!2280))))

(declare-fun b!491288 () Bool)

(declare-fun res!294220 () Bool)

(assert (=> b!491288 (=> (not res!294220) (not e!288686))))

(declare-fun arrayContainsKey!0 (array!31813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491288 (= res!294220 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491282 () Bool)

(declare-fun res!294222 () Bool)

(assert (=> b!491282 (=> (not res!294222) (not e!288686))))

(assert (=> b!491282 (= res!294222 (validKeyInArray!0 (select (arr!15294 a!3235) j!176)))))

(declare-fun res!294219 () Bool)

(assert (=> start!44754 (=> (not res!294219) (not e!288686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44754 (= res!294219 (validMask!0 mask!3524))))

(assert (=> start!44754 e!288686))

(assert (=> start!44754 true))

(declare-fun array_inv!11090 (array!31813) Bool)

(assert (=> start!44754 (array_inv!11090 a!3235)))

(assert (= (and start!44754 res!294219) b!491284))

(assert (= (and b!491284 res!294223) b!491282))

(assert (= (and b!491282 res!294222) b!491287))

(assert (= (and b!491287 res!294217) b!491288))

(assert (= (and b!491288 res!294220) b!491286))

(assert (= (and b!491286 res!294216) b!491281))

(assert (= (and b!491281 res!294221) b!491285))

(assert (= (and b!491285 res!294224) b!491280))

(assert (= (and b!491280 (not res!294218)) b!491283))

(declare-fun m!471783 () Bool)

(assert (=> b!491285 m!471783))

(declare-fun m!471785 () Bool)

(assert (=> b!491281 m!471785))

(declare-fun m!471787 () Bool)

(assert (=> start!44754 m!471787))

(declare-fun m!471789 () Bool)

(assert (=> start!44754 m!471789))

(declare-fun m!471791 () Bool)

(assert (=> b!491287 m!471791))

(declare-fun m!471793 () Bool)

(assert (=> b!491280 m!471793))

(declare-fun m!471795 () Bool)

(assert (=> b!491280 m!471795))

(declare-fun m!471797 () Bool)

(assert (=> b!491280 m!471797))

(declare-fun m!471799 () Bool)

(assert (=> b!491280 m!471799))

(declare-fun m!471801 () Bool)

(assert (=> b!491280 m!471801))

(declare-fun m!471803 () Bool)

(assert (=> b!491280 m!471803))

(declare-fun m!471805 () Bool)

(assert (=> b!491280 m!471805))

(declare-fun m!471807 () Bool)

(assert (=> b!491280 m!471807))

(assert (=> b!491280 m!471801))

(assert (=> b!491280 m!471799))

(declare-fun m!471809 () Bool)

(assert (=> b!491280 m!471809))

(assert (=> b!491280 m!471801))

(declare-fun m!471811 () Bool)

(assert (=> b!491280 m!471811))

(assert (=> b!491280 m!471805))

(assert (=> b!491280 m!471801))

(assert (=> b!491282 m!471801))

(assert (=> b!491282 m!471801))

(declare-fun m!471813 () Bool)

(assert (=> b!491282 m!471813))

(declare-fun m!471815 () Bool)

(assert (=> b!491288 m!471815))

(declare-fun m!471817 () Bool)

(assert (=> b!491283 m!471817))

(declare-fun m!471819 () Bool)

(assert (=> b!491283 m!471819))

(declare-fun m!471821 () Bool)

(assert (=> b!491286 m!471821))

(push 1)

