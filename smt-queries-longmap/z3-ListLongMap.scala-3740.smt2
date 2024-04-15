; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51422 () Bool)

(assert start!51422)

(declare-fun b!561883 () Bool)

(declare-fun res!353184 () Bool)

(declare-fun e!323792 () Bool)

(assert (=> b!561883 (=> (not res!353184) (not e!323792))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561883 (= res!353184 (validKeyInArray!0 k0!1914))))

(declare-fun b!561884 () Bool)

(declare-fun res!353185 () Bool)

(assert (=> b!561884 (=> (not res!353185) (not e!323792))))

(declare-datatypes ((array!35296 0))(
  ( (array!35297 (arr!16949 (Array (_ BitVec 32) (_ BitVec 64))) (size!17314 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35296)

(declare-fun arrayContainsKey!0 (array!35296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561884 (= res!353185 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561885 () Bool)

(declare-fun lt!255778 () array!35296)

(declare-datatypes ((SeekEntryResult!5395 0))(
  ( (MissingZero!5395 (index!23807 (_ BitVec 32))) (Found!5395 (index!23808 (_ BitVec 32))) (Intermediate!5395 (undefined!6207 Bool) (index!23809 (_ BitVec 32)) (x!52717 (_ BitVec 32))) (Undefined!5395) (MissingVacant!5395 (index!23810 (_ BitVec 32))) )
))
(declare-fun lt!255776 () SeekEntryResult!5395)

(declare-fun lt!255775 () (_ BitVec 64))

(declare-fun e!323793 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35296 (_ BitVec 32)) SeekEntryResult!5395)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35296 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!561885 (= e!323793 (= (seekEntryOrOpen!0 lt!255775 lt!255778 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52717 lt!255776) (index!23809 lt!255776) (index!23809 lt!255776) lt!255775 lt!255778 mask!3119)))))

(declare-fun b!561886 () Bool)

(declare-fun e!323789 () Bool)

(assert (=> b!561886 (= e!323792 e!323789)))

(declare-fun res!353177 () Bool)

(assert (=> b!561886 (=> (not res!353177) (not e!323789))))

(declare-fun lt!255771 () SeekEntryResult!5395)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561886 (= res!353177 (or (= lt!255771 (MissingZero!5395 i!1132)) (= lt!255771 (MissingVacant!5395 i!1132))))))

(assert (=> b!561886 (= lt!255771 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561887 () Bool)

(declare-fun e!323786 () Bool)

(assert (=> b!561887 (= e!323786 (not true))))

(declare-fun e!323788 () Bool)

(assert (=> b!561887 e!323788))

(declare-fun res!353189 () Bool)

(assert (=> b!561887 (=> (not res!353189) (not e!323788))))

(declare-fun lt!255777 () SeekEntryResult!5395)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561887 (= res!353189 (= lt!255777 (Found!5395 j!142)))))

(assert (=> b!561887 (= lt!255777 (seekEntryOrOpen!0 (select (arr!16949 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35296 (_ BitVec 32)) Bool)

(assert (=> b!561887 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17550 0))(
  ( (Unit!17551) )
))
(declare-fun lt!255772 () Unit!17550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17550)

(assert (=> b!561887 (= lt!255772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561888 () Bool)

(declare-fun e!323790 () Bool)

(assert (=> b!561888 (= e!323788 e!323790)))

(declare-fun res!353179 () Bool)

(assert (=> b!561888 (=> res!353179 e!323790)))

(get-info :version)

(assert (=> b!561888 (= res!353179 (or (undefined!6207 lt!255776) (not ((_ is Intermediate!5395) lt!255776))))))

(declare-fun b!561889 () Bool)

(assert (=> b!561889 (= e!323789 e!323786)))

(declare-fun res!353186 () Bool)

(assert (=> b!561889 (=> (not res!353186) (not e!323786))))

(declare-fun lt!255774 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35296 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!561889 (= res!353186 (= lt!255776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255774 lt!255775 lt!255778 mask!3119)))))

(declare-fun lt!255773 () (_ BitVec 32))

(assert (=> b!561889 (= lt!255776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255773 (select (arr!16949 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561889 (= lt!255774 (toIndex!0 lt!255775 mask!3119))))

(assert (=> b!561889 (= lt!255775 (select (store (arr!16949 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561889 (= lt!255773 (toIndex!0 (select (arr!16949 a!3118) j!142) mask!3119))))

(assert (=> b!561889 (= lt!255778 (array!35297 (store (arr!16949 a!3118) i!1132 k0!1914) (size!17314 a!3118)))))

(declare-fun b!561890 () Bool)

(declare-fun res!353187 () Bool)

(assert (=> b!561890 (=> (not res!353187) (not e!323789))))

(assert (=> b!561890 (= res!353187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561891 () Bool)

(declare-fun e!323787 () Bool)

(assert (=> b!561891 (= e!323790 e!323787)))

(declare-fun res!353182 () Bool)

(assert (=> b!561891 (=> res!353182 e!323787)))

(declare-fun lt!255770 () (_ BitVec 64))

(assert (=> b!561891 (= res!353182 (or (= lt!255770 (select (arr!16949 a!3118) j!142)) (= lt!255770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561891 (= lt!255770 (select (arr!16949 a!3118) (index!23809 lt!255776)))))

(declare-fun res!353181 () Bool)

(assert (=> start!51422 (=> (not res!353181) (not e!323792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51422 (= res!353181 (validMask!0 mask!3119))))

(assert (=> start!51422 e!323792))

(assert (=> start!51422 true))

(declare-fun array_inv!12832 (array!35296) Bool)

(assert (=> start!51422 (array_inv!12832 a!3118)))

(declare-fun b!561892 () Bool)

(declare-fun res!353188 () Bool)

(assert (=> b!561892 (=> (not res!353188) (not e!323792))))

(assert (=> b!561892 (= res!353188 (and (= (size!17314 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17314 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17314 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561893 () Bool)

(assert (=> b!561893 (= e!323787 e!323793)))

(declare-fun res!353183 () Bool)

(assert (=> b!561893 (=> (not res!353183) (not e!323793))))

(assert (=> b!561893 (= res!353183 (= lt!255777 (seekKeyOrZeroReturnVacant!0 (x!52717 lt!255776) (index!23809 lt!255776) (index!23809 lt!255776) (select (arr!16949 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561894 () Bool)

(declare-fun res!353178 () Bool)

(assert (=> b!561894 (=> (not res!353178) (not e!323792))))

(assert (=> b!561894 (= res!353178 (validKeyInArray!0 (select (arr!16949 a!3118) j!142)))))

(declare-fun b!561895 () Bool)

(declare-fun res!353180 () Bool)

(assert (=> b!561895 (=> (not res!353180) (not e!323789))))

(declare-datatypes ((List!11068 0))(
  ( (Nil!11065) (Cons!11064 (h!12067 (_ BitVec 64)) (t!17287 List!11068)) )
))
(declare-fun arrayNoDuplicates!0 (array!35296 (_ BitVec 32) List!11068) Bool)

(assert (=> b!561895 (= res!353180 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11065))))

(assert (= (and start!51422 res!353181) b!561892))

(assert (= (and b!561892 res!353188) b!561894))

(assert (= (and b!561894 res!353178) b!561883))

(assert (= (and b!561883 res!353184) b!561884))

(assert (= (and b!561884 res!353185) b!561886))

(assert (= (and b!561886 res!353177) b!561890))

(assert (= (and b!561890 res!353187) b!561895))

(assert (= (and b!561895 res!353180) b!561889))

(assert (= (and b!561889 res!353186) b!561887))

(assert (= (and b!561887 res!353189) b!561888))

(assert (= (and b!561888 (not res!353179)) b!561891))

(assert (= (and b!561891 (not res!353182)) b!561893))

(assert (= (and b!561893 res!353183) b!561885))

(declare-fun m!539369 () Bool)

(assert (=> start!51422 m!539369))

(declare-fun m!539371 () Bool)

(assert (=> start!51422 m!539371))

(declare-fun m!539373 () Bool)

(assert (=> b!561894 m!539373))

(assert (=> b!561894 m!539373))

(declare-fun m!539375 () Bool)

(assert (=> b!561894 m!539375))

(declare-fun m!539377 () Bool)

(assert (=> b!561890 m!539377))

(assert (=> b!561887 m!539373))

(assert (=> b!561887 m!539373))

(declare-fun m!539379 () Bool)

(assert (=> b!561887 m!539379))

(declare-fun m!539381 () Bool)

(assert (=> b!561887 m!539381))

(declare-fun m!539383 () Bool)

(assert (=> b!561887 m!539383))

(declare-fun m!539385 () Bool)

(assert (=> b!561884 m!539385))

(assert (=> b!561891 m!539373))

(declare-fun m!539387 () Bool)

(assert (=> b!561891 m!539387))

(declare-fun m!539389 () Bool)

(assert (=> b!561883 m!539389))

(declare-fun m!539391 () Bool)

(assert (=> b!561886 m!539391))

(assert (=> b!561893 m!539373))

(assert (=> b!561893 m!539373))

(declare-fun m!539393 () Bool)

(assert (=> b!561893 m!539393))

(declare-fun m!539395 () Bool)

(assert (=> b!561885 m!539395))

(declare-fun m!539397 () Bool)

(assert (=> b!561885 m!539397))

(assert (=> b!561889 m!539373))

(declare-fun m!539399 () Bool)

(assert (=> b!561889 m!539399))

(declare-fun m!539401 () Bool)

(assert (=> b!561889 m!539401))

(assert (=> b!561889 m!539373))

(declare-fun m!539403 () Bool)

(assert (=> b!561889 m!539403))

(declare-fun m!539405 () Bool)

(assert (=> b!561889 m!539405))

(declare-fun m!539407 () Bool)

(assert (=> b!561889 m!539407))

(declare-fun m!539409 () Bool)

(assert (=> b!561889 m!539409))

(assert (=> b!561889 m!539373))

(declare-fun m!539411 () Bool)

(assert (=> b!561895 m!539411))

(check-sat (not b!561886) (not b!561885) (not b!561890) (not b!561883) (not b!561884) (not start!51422) (not b!561895) (not b!561894) (not b!561887) (not b!561893) (not b!561889))
(check-sat)
