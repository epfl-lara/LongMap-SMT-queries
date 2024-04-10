; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45184 () Bool)

(assert start!45184)

(declare-fun b!495860 () Bool)

(declare-fun res!298248 () Bool)

(declare-fun e!290862 () Bool)

(assert (=> b!495860 (=> (not res!298248) (not e!290862))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495860 (= res!298248 (validKeyInArray!0 k!2280))))

(declare-fun b!495861 () Bool)

(declare-fun res!298246 () Bool)

(assert (=> b!495861 (=> (not res!298246) (not e!290862))))

(declare-datatypes ((array!32072 0))(
  ( (array!32073 (arr!15419 (Array (_ BitVec 32) (_ BitVec 64))) (size!15783 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32072)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495861 (= res!298246 (validKeyInArray!0 (select (arr!15419 a!3235) j!176)))))

(declare-fun b!495862 () Bool)

(declare-fun e!290861 () Bool)

(assert (=> b!495862 (= e!290861 true)))

(declare-datatypes ((SeekEntryResult!3886 0))(
  ( (MissingZero!3886 (index!17723 (_ BitVec 32))) (Found!3886 (index!17724 (_ BitVec 32))) (Intermediate!3886 (undefined!4698 Bool) (index!17725 (_ BitVec 32)) (x!46786 (_ BitVec 32))) (Undefined!3886) (MissingVacant!3886 (index!17726 (_ BitVec 32))) )
))
(declare-fun lt!224480 () SeekEntryResult!3886)

(assert (=> b!495862 (and (bvslt (x!46786 lt!224480) #b01111111111111111111111111111110) (or (= (select (arr!15419 a!3235) (index!17725 lt!224480)) (select (arr!15419 a!3235) j!176)) (= (select (arr!15419 a!3235) (index!17725 lt!224480)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15419 a!3235) (index!17725 lt!224480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495863 () Bool)

(declare-fun res!298251 () Bool)

(assert (=> b!495863 (=> res!298251 e!290861)))

(assert (=> b!495863 (= res!298251 (or (undefined!4698 lt!224480) (not (is-Intermediate!3886 lt!224480))))))

(declare-fun b!495864 () Bool)

(declare-fun res!298256 () Bool)

(declare-fun e!290858 () Bool)

(assert (=> b!495864 (=> (not res!298256) (not e!290858))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32072 (_ BitVec 32)) Bool)

(assert (=> b!495864 (= res!298256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495865 () Bool)

(declare-fun res!298254 () Bool)

(assert (=> b!495865 (=> (not res!298254) (not e!290858))))

(declare-datatypes ((List!9577 0))(
  ( (Nil!9574) (Cons!9573 (h!10444 (_ BitVec 64)) (t!15805 List!9577)) )
))
(declare-fun arrayNoDuplicates!0 (array!32072 (_ BitVec 32) List!9577) Bool)

(assert (=> b!495865 (= res!298254 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9574))))

(declare-fun b!495866 () Bool)

(declare-fun res!298249 () Bool)

(assert (=> b!495866 (=> (not res!298249) (not e!290862))))

(declare-fun arrayContainsKey!0 (array!32072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495866 (= res!298249 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495867 () Bool)

(assert (=> b!495867 (= e!290862 e!290858)))

(declare-fun res!298253 () Bool)

(assert (=> b!495867 (=> (not res!298253) (not e!290858))))

(declare-fun lt!224479 () SeekEntryResult!3886)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495867 (= res!298253 (or (= lt!224479 (MissingZero!3886 i!1204)) (= lt!224479 (MissingVacant!3886 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32072 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!495867 (= lt!224479 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495859 () Bool)

(assert (=> b!495859 (= e!290858 (not e!290861))))

(declare-fun res!298250 () Bool)

(assert (=> b!495859 (=> res!298250 e!290861)))

(declare-fun lt!224478 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32072 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!495859 (= res!298250 (= lt!224480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224478 (select (store (arr!15419 a!3235) i!1204 k!2280) j!176) (array!32073 (store (arr!15419 a!3235) i!1204 k!2280) (size!15783 a!3235)) mask!3524)))))

(declare-fun lt!224481 () (_ BitVec 32))

(assert (=> b!495859 (= lt!224480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224481 (select (arr!15419 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495859 (= lt!224478 (toIndex!0 (select (store (arr!15419 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495859 (= lt!224481 (toIndex!0 (select (arr!15419 a!3235) j!176) mask!3524))))

(declare-fun e!290860 () Bool)

(assert (=> b!495859 e!290860))

(declare-fun res!298247 () Bool)

(assert (=> b!495859 (=> (not res!298247) (not e!290860))))

(assert (=> b!495859 (= res!298247 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14718 0))(
  ( (Unit!14719) )
))
(declare-fun lt!224482 () Unit!14718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14718)

(assert (=> b!495859 (= lt!224482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!298255 () Bool)

(assert (=> start!45184 (=> (not res!298255) (not e!290862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45184 (= res!298255 (validMask!0 mask!3524))))

(assert (=> start!45184 e!290862))

(assert (=> start!45184 true))

(declare-fun array_inv!11215 (array!32072) Bool)

(assert (=> start!45184 (array_inv!11215 a!3235)))

(declare-fun b!495868 () Bool)

(declare-fun res!298252 () Bool)

(assert (=> b!495868 (=> (not res!298252) (not e!290862))))

(assert (=> b!495868 (= res!298252 (and (= (size!15783 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15783 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15783 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495869 () Bool)

(assert (=> b!495869 (= e!290860 (= (seekEntryOrOpen!0 (select (arr!15419 a!3235) j!176) a!3235 mask!3524) (Found!3886 j!176)))))

(assert (= (and start!45184 res!298255) b!495868))

(assert (= (and b!495868 res!298252) b!495861))

(assert (= (and b!495861 res!298246) b!495860))

(assert (= (and b!495860 res!298248) b!495866))

(assert (= (and b!495866 res!298249) b!495867))

(assert (= (and b!495867 res!298253) b!495864))

(assert (= (and b!495864 res!298256) b!495865))

(assert (= (and b!495865 res!298254) b!495859))

(assert (= (and b!495859 res!298247) b!495869))

(assert (= (and b!495859 (not res!298250)) b!495863))

(assert (= (and b!495863 (not res!298251)) b!495862))

(declare-fun m!477007 () Bool)

(assert (=> b!495862 m!477007))

(declare-fun m!477009 () Bool)

(assert (=> b!495862 m!477009))

(declare-fun m!477011 () Bool)

(assert (=> b!495866 m!477011))

(assert (=> b!495861 m!477009))

(assert (=> b!495861 m!477009))

(declare-fun m!477013 () Bool)

(assert (=> b!495861 m!477013))

(declare-fun m!477015 () Bool)

(assert (=> b!495860 m!477015))

(declare-fun m!477017 () Bool)

(assert (=> start!45184 m!477017))

(declare-fun m!477019 () Bool)

(assert (=> start!45184 m!477019))

(declare-fun m!477021 () Bool)

(assert (=> b!495865 m!477021))

(declare-fun m!477023 () Bool)

(assert (=> b!495859 m!477023))

(declare-fun m!477025 () Bool)

(assert (=> b!495859 m!477025))

(declare-fun m!477027 () Bool)

(assert (=> b!495859 m!477027))

(assert (=> b!495859 m!477027))

(declare-fun m!477029 () Bool)

(assert (=> b!495859 m!477029))

(assert (=> b!495859 m!477009))

(declare-fun m!477031 () Bool)

(assert (=> b!495859 m!477031))

(assert (=> b!495859 m!477009))

(declare-fun m!477033 () Bool)

(assert (=> b!495859 m!477033))

(assert (=> b!495859 m!477009))

(declare-fun m!477035 () Bool)

(assert (=> b!495859 m!477035))

(assert (=> b!495859 m!477027))

(declare-fun m!477037 () Bool)

(assert (=> b!495859 m!477037))

(declare-fun m!477039 () Bool)

(assert (=> b!495867 m!477039))

(declare-fun m!477041 () Bool)

(assert (=> b!495864 m!477041))

(assert (=> b!495869 m!477009))

(assert (=> b!495869 m!477009))

(declare-fun m!477043 () Bool)

(assert (=> b!495869 m!477043))

(push 1)

(assert (not b!495867))

(assert (not b!495860))

(assert (not b!495865))

(assert (not start!45184))

(assert (not b!495859))

(assert (not b!495866))

(assert (not b!495861))

(assert (not b!495869))

(assert (not b!495864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

