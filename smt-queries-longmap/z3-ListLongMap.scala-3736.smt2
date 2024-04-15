; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51398 () Bool)

(assert start!51398)

(declare-fun b!561415 () Bool)

(declare-fun res!352719 () Bool)

(declare-fun e!323505 () Bool)

(assert (=> b!561415 (=> (not res!352719) (not e!323505))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561415 (= res!352719 (validKeyInArray!0 k0!1914))))

(declare-fun b!561416 () Bool)

(declare-fun e!323504 () Bool)

(declare-fun e!323501 () Bool)

(assert (=> b!561416 (= e!323504 e!323501)))

(declare-fun res!352713 () Bool)

(assert (=> b!561416 (=> res!352713 e!323501)))

(declare-datatypes ((SeekEntryResult!5383 0))(
  ( (MissingZero!5383 (index!23759 (_ BitVec 32))) (Found!5383 (index!23760 (_ BitVec 32))) (Intermediate!5383 (undefined!6195 Bool) (index!23761 (_ BitVec 32)) (x!52673 (_ BitVec 32))) (Undefined!5383) (MissingVacant!5383 (index!23762 (_ BitVec 32))) )
))
(declare-fun lt!255449 () SeekEntryResult!5383)

(get-info :version)

(assert (=> b!561416 (= res!352713 (or (undefined!6195 lt!255449) (not ((_ is Intermediate!5383) lt!255449))))))

(declare-fun b!561417 () Bool)

(declare-fun e!323498 () Bool)

(declare-fun e!323500 () Bool)

(assert (=> b!561417 (= e!323498 e!323500)))

(declare-fun res!352717 () Bool)

(assert (=> b!561417 (=> (not res!352717) (not e!323500))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255448 () (_ BitVec 32))

(declare-datatypes ((array!35272 0))(
  ( (array!35273 (arr!16937 (Array (_ BitVec 32) (_ BitVec 64))) (size!17302 (_ BitVec 32))) )
))
(declare-fun lt!255453 () array!35272)

(declare-fun lt!255454 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35272 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561417 (= res!352717 (= lt!255449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255448 lt!255454 lt!255453 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255451 () (_ BitVec 32))

(declare-fun a!3118 () array!35272)

(assert (=> b!561417 (= lt!255449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255451 (select (arr!16937 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561417 (= lt!255448 (toIndex!0 lt!255454 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561417 (= lt!255454 (select (store (arr!16937 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561417 (= lt!255451 (toIndex!0 (select (arr!16937 a!3118) j!142) mask!3119))))

(assert (=> b!561417 (= lt!255453 (array!35273 (store (arr!16937 a!3118) i!1132 k0!1914) (size!17302 a!3118)))))

(declare-fun b!561418 () Bool)

(declare-fun e!323499 () Bool)

(assert (=> b!561418 (= e!323501 e!323499)))

(declare-fun res!352716 () Bool)

(assert (=> b!561418 (=> res!352716 e!323499)))

(declare-fun lt!255446 () (_ BitVec 64))

(assert (=> b!561418 (= res!352716 (or (= lt!255446 (select (arr!16937 a!3118) j!142)) (= lt!255446 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561418 (= lt!255446 (select (arr!16937 a!3118) (index!23761 lt!255449)))))

(declare-fun b!561419 () Bool)

(declare-fun res!352709 () Bool)

(assert (=> b!561419 (=> (not res!352709) (not e!323498))))

(declare-datatypes ((List!11056 0))(
  ( (Nil!11053) (Cons!11052 (h!12055 (_ BitVec 64)) (t!17275 List!11056)) )
))
(declare-fun arrayNoDuplicates!0 (array!35272 (_ BitVec 32) List!11056) Bool)

(assert (=> b!561419 (= res!352709 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11053))))

(declare-fun res!352720 () Bool)

(assert (=> start!51398 (=> (not res!352720) (not e!323505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51398 (= res!352720 (validMask!0 mask!3119))))

(assert (=> start!51398 e!323505))

(assert (=> start!51398 true))

(declare-fun array_inv!12820 (array!35272) Bool)

(assert (=> start!51398 (array_inv!12820 a!3118)))

(declare-fun b!561420 () Bool)

(declare-fun e!323502 () Bool)

(assert (=> b!561420 (= e!323499 e!323502)))

(declare-fun res!352718 () Bool)

(assert (=> b!561420 (=> (not res!352718) (not e!323502))))

(declare-fun lt!255452 () SeekEntryResult!5383)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35272 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561420 (= res!352718 (= lt!255452 (seekKeyOrZeroReturnVacant!0 (x!52673 lt!255449) (index!23761 lt!255449) (index!23761 lt!255449) (select (arr!16937 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561421 () Bool)

(declare-fun res!352710 () Bool)

(assert (=> b!561421 (=> (not res!352710) (not e!323505))))

(assert (=> b!561421 (= res!352710 (and (= (size!17302 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17302 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17302 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561422 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35272 (_ BitVec 32)) SeekEntryResult!5383)

(assert (=> b!561422 (= e!323502 (= (seekEntryOrOpen!0 lt!255454 lt!255453 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52673 lt!255449) (index!23761 lt!255449) (index!23761 lt!255449) lt!255454 lt!255453 mask!3119)))))

(declare-fun b!561423 () Bool)

(assert (=> b!561423 (= e!323505 e!323498)))

(declare-fun res!352714 () Bool)

(assert (=> b!561423 (=> (not res!352714) (not e!323498))))

(declare-fun lt!255450 () SeekEntryResult!5383)

(assert (=> b!561423 (= res!352714 (or (= lt!255450 (MissingZero!5383 i!1132)) (= lt!255450 (MissingVacant!5383 i!1132))))))

(assert (=> b!561423 (= lt!255450 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561424 () Bool)

(declare-fun res!352712 () Bool)

(assert (=> b!561424 (=> (not res!352712) (not e!323498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35272 (_ BitVec 32)) Bool)

(assert (=> b!561424 (= res!352712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561425 () Bool)

(declare-fun res!352711 () Bool)

(assert (=> b!561425 (=> (not res!352711) (not e!323505))))

(declare-fun arrayContainsKey!0 (array!35272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561425 (= res!352711 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561426 () Bool)

(declare-fun res!352721 () Bool)

(assert (=> b!561426 (=> (not res!352721) (not e!323505))))

(assert (=> b!561426 (= res!352721 (validKeyInArray!0 (select (arr!16937 a!3118) j!142)))))

(declare-fun b!561427 () Bool)

(assert (=> b!561427 (= e!323500 (not true))))

(assert (=> b!561427 e!323504))

(declare-fun res!352715 () Bool)

(assert (=> b!561427 (=> (not res!352715) (not e!323504))))

(assert (=> b!561427 (= res!352715 (= lt!255452 (Found!5383 j!142)))))

(assert (=> b!561427 (= lt!255452 (seekEntryOrOpen!0 (select (arr!16937 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561427 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17526 0))(
  ( (Unit!17527) )
))
(declare-fun lt!255447 () Unit!17526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17526)

(assert (=> b!561427 (= lt!255447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51398 res!352720) b!561421))

(assert (= (and b!561421 res!352710) b!561426))

(assert (= (and b!561426 res!352721) b!561415))

(assert (= (and b!561415 res!352719) b!561425))

(assert (= (and b!561425 res!352711) b!561423))

(assert (= (and b!561423 res!352714) b!561424))

(assert (= (and b!561424 res!352712) b!561419))

(assert (= (and b!561419 res!352709) b!561417))

(assert (= (and b!561417 res!352717) b!561427))

(assert (= (and b!561427 res!352715) b!561416))

(assert (= (and b!561416 (not res!352713)) b!561418))

(assert (= (and b!561418 (not res!352716)) b!561420))

(assert (= (and b!561420 res!352718) b!561422))

(declare-fun m!538841 () Bool)

(assert (=> b!561415 m!538841))

(declare-fun m!538843 () Bool)

(assert (=> b!561422 m!538843))

(declare-fun m!538845 () Bool)

(assert (=> b!561422 m!538845))

(declare-fun m!538847 () Bool)

(assert (=> b!561418 m!538847))

(declare-fun m!538849 () Bool)

(assert (=> b!561418 m!538849))

(declare-fun m!538851 () Bool)

(assert (=> start!51398 m!538851))

(declare-fun m!538853 () Bool)

(assert (=> start!51398 m!538853))

(assert (=> b!561427 m!538847))

(assert (=> b!561427 m!538847))

(declare-fun m!538855 () Bool)

(assert (=> b!561427 m!538855))

(declare-fun m!538857 () Bool)

(assert (=> b!561427 m!538857))

(declare-fun m!538859 () Bool)

(assert (=> b!561427 m!538859))

(declare-fun m!538861 () Bool)

(assert (=> b!561423 m!538861))

(assert (=> b!561426 m!538847))

(assert (=> b!561426 m!538847))

(declare-fun m!538863 () Bool)

(assert (=> b!561426 m!538863))

(declare-fun m!538865 () Bool)

(assert (=> b!561425 m!538865))

(assert (=> b!561420 m!538847))

(assert (=> b!561420 m!538847))

(declare-fun m!538867 () Bool)

(assert (=> b!561420 m!538867))

(declare-fun m!538869 () Bool)

(assert (=> b!561419 m!538869))

(declare-fun m!538871 () Bool)

(assert (=> b!561424 m!538871))

(assert (=> b!561417 m!538847))

(declare-fun m!538873 () Bool)

(assert (=> b!561417 m!538873))

(declare-fun m!538875 () Bool)

(assert (=> b!561417 m!538875))

(assert (=> b!561417 m!538847))

(declare-fun m!538877 () Bool)

(assert (=> b!561417 m!538877))

(declare-fun m!538879 () Bool)

(assert (=> b!561417 m!538879))

(assert (=> b!561417 m!538847))

(declare-fun m!538881 () Bool)

(assert (=> b!561417 m!538881))

(declare-fun m!538883 () Bool)

(assert (=> b!561417 m!538883))

(check-sat (not b!561427) (not b!561420) (not b!561422) (not b!561417) (not b!561423) (not start!51398) (not b!561424) (not b!561425) (not b!561426) (not b!561415) (not b!561419))
(check-sat)
