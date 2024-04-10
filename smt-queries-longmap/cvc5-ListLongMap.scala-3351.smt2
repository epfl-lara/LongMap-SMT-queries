; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46098 () Bool)

(assert start!46098)

(declare-fun b!510621 () Bool)

(declare-fun res!311471 () Bool)

(declare-fun e!298449 () Bool)

(assert (=> b!510621 (=> (not res!311471) (not e!298449))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510621 (= res!311471 (validKeyInArray!0 k!2280))))

(declare-fun b!510622 () Bool)

(declare-fun res!311473 () Bool)

(assert (=> b!510622 (=> (not res!311473) (not e!298449))))

(declare-datatypes ((array!32809 0))(
  ( (array!32810 (arr!15783 (Array (_ BitVec 32) (_ BitVec 64))) (size!16147 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32809)

(declare-fun arrayContainsKey!0 (array!32809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510622 (= res!311473 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510623 () Bool)

(declare-fun res!311470 () Bool)

(assert (=> b!510623 (=> (not res!311470) (not e!298449))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510623 (= res!311470 (validKeyInArray!0 (select (arr!15783 a!3235) j!176)))))

(declare-fun b!510624 () Bool)

(declare-fun res!311474 () Bool)

(declare-fun e!298446 () Bool)

(assert (=> b!510624 (=> (not res!311474) (not e!298446))))

(declare-datatypes ((List!9941 0))(
  ( (Nil!9938) (Cons!9937 (h!10814 (_ BitVec 64)) (t!16169 List!9941)) )
))
(declare-fun arrayNoDuplicates!0 (array!32809 (_ BitVec 32) List!9941) Bool)

(assert (=> b!510624 (= res!311474 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9938))))

(declare-fun res!311472 () Bool)

(assert (=> start!46098 (=> (not res!311472) (not e!298449))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46098 (= res!311472 (validMask!0 mask!3524))))

(assert (=> start!46098 e!298449))

(assert (=> start!46098 true))

(declare-fun array_inv!11579 (array!32809) Bool)

(assert (=> start!46098 (array_inv!11579 a!3235)))

(declare-fun b!510625 () Bool)

(assert (=> b!510625 (= e!298449 e!298446)))

(declare-fun res!311468 () Bool)

(assert (=> b!510625 (=> (not res!311468) (not e!298446))))

(declare-datatypes ((SeekEntryResult!4250 0))(
  ( (MissingZero!4250 (index!19188 (_ BitVec 32))) (Found!4250 (index!19189 (_ BitVec 32))) (Intermediate!4250 (undefined!5062 Bool) (index!19190 (_ BitVec 32)) (x!48147 (_ BitVec 32))) (Undefined!4250) (MissingVacant!4250 (index!19191 (_ BitVec 32))) )
))
(declare-fun lt!233506 () SeekEntryResult!4250)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510625 (= res!311468 (or (= lt!233506 (MissingZero!4250 i!1204)) (= lt!233506 (MissingVacant!4250 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32809 (_ BitVec 32)) SeekEntryResult!4250)

(assert (=> b!510625 (= lt!233506 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510626 () Bool)

(declare-fun res!311469 () Bool)

(assert (=> b!510626 (=> (not res!311469) (not e!298449))))

(assert (=> b!510626 (= res!311469 (and (= (size!16147 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16147 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16147 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510627 () Bool)

(declare-fun e!298448 () Bool)

(assert (=> b!510627 (= e!298448 true)))

(declare-fun lt!233507 () array!32809)

(declare-fun lt!233504 () SeekEntryResult!4250)

(declare-fun lt!233508 () (_ BitVec 64))

(assert (=> b!510627 (= lt!233504 (seekEntryOrOpen!0 lt!233508 lt!233507 mask!3524))))

(declare-datatypes ((Unit!15758 0))(
  ( (Unit!15759) )
))
(declare-fun lt!233505 () Unit!15758)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15758)

(assert (=> b!510627 (= lt!233505 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510628 () Bool)

(declare-fun res!311467 () Bool)

(assert (=> b!510628 (=> (not res!311467) (not e!298446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32809 (_ BitVec 32)) Bool)

(assert (=> b!510628 (= res!311467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510629 () Bool)

(assert (=> b!510629 (= e!298446 (not e!298448))))

(declare-fun res!311466 () Bool)

(assert (=> b!510629 (=> res!311466 e!298448)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32809 (_ BitVec 32)) SeekEntryResult!4250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510629 (= res!311466 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15783 a!3235) j!176) mask!3524) (select (arr!15783 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233508 mask!3524) lt!233508 lt!233507 mask!3524))))))

(assert (=> b!510629 (= lt!233508 (select (store (arr!15783 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510629 (= lt!233507 (array!32810 (store (arr!15783 a!3235) i!1204 k!2280) (size!16147 a!3235)))))

(assert (=> b!510629 (= lt!233504 (Found!4250 j!176))))

(assert (=> b!510629 (= lt!233504 (seekEntryOrOpen!0 (select (arr!15783 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510629 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233509 () Unit!15758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15758)

(assert (=> b!510629 (= lt!233509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46098 res!311472) b!510626))

(assert (= (and b!510626 res!311469) b!510623))

(assert (= (and b!510623 res!311470) b!510621))

(assert (= (and b!510621 res!311471) b!510622))

(assert (= (and b!510622 res!311473) b!510625))

(assert (= (and b!510625 res!311468) b!510628))

(assert (= (and b!510628 res!311467) b!510624))

(assert (= (and b!510624 res!311474) b!510629))

(assert (= (and b!510629 (not res!311466)) b!510627))

(declare-fun m!491973 () Bool)

(assert (=> b!510624 m!491973))

(declare-fun m!491975 () Bool)

(assert (=> b!510621 m!491975))

(declare-fun m!491977 () Bool)

(assert (=> b!510628 m!491977))

(declare-fun m!491979 () Bool)

(assert (=> start!46098 m!491979))

(declare-fun m!491981 () Bool)

(assert (=> start!46098 m!491981))

(declare-fun m!491983 () Bool)

(assert (=> b!510622 m!491983))

(declare-fun m!491985 () Bool)

(assert (=> b!510627 m!491985))

(declare-fun m!491987 () Bool)

(assert (=> b!510627 m!491987))

(declare-fun m!491989 () Bool)

(assert (=> b!510625 m!491989))

(declare-fun m!491991 () Bool)

(assert (=> b!510623 m!491991))

(assert (=> b!510623 m!491991))

(declare-fun m!491993 () Bool)

(assert (=> b!510623 m!491993))

(declare-fun m!491995 () Bool)

(assert (=> b!510629 m!491995))

(declare-fun m!491997 () Bool)

(assert (=> b!510629 m!491997))

(declare-fun m!491999 () Bool)

(assert (=> b!510629 m!491999))

(declare-fun m!492001 () Bool)

(assert (=> b!510629 m!492001))

(assert (=> b!510629 m!491991))

(declare-fun m!492003 () Bool)

(assert (=> b!510629 m!492003))

(assert (=> b!510629 m!491991))

(declare-fun m!492005 () Bool)

(assert (=> b!510629 m!492005))

(assert (=> b!510629 m!491991))

(declare-fun m!492007 () Bool)

(assert (=> b!510629 m!492007))

(declare-fun m!492009 () Bool)

(assert (=> b!510629 m!492009))

(assert (=> b!510629 m!491991))

(assert (=> b!510629 m!492001))

(assert (=> b!510629 m!492009))

(declare-fun m!492011 () Bool)

(assert (=> b!510629 m!492011))

(push 1)

