; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50674 () Bool)

(assert start!50674)

(declare-fun b!554033 () Bool)

(declare-fun res!346454 () Bool)

(declare-fun e!319510 () Bool)

(assert (=> b!554033 (=> (not res!346454) (not e!319510))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34899 0))(
  ( (array!34900 (arr!16759 (Array (_ BitVec 32) (_ BitVec 64))) (size!17123 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34899)

(declare-datatypes ((SeekEntryResult!5208 0))(
  ( (MissingZero!5208 (index!23059 (_ BitVec 32))) (Found!5208 (index!23060 (_ BitVec 32))) (Intermediate!5208 (undefined!6020 Bool) (index!23061 (_ BitVec 32)) (x!51978 (_ BitVec 32))) (Undefined!5208) (MissingVacant!5208 (index!23062 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34899 (_ BitVec 32)) SeekEntryResult!5208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554033 (= res!346454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16759 a!3118) j!142) mask!3119) (select (arr!16759 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16759 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16759 a!3118) i!1132 k0!1914) j!142) (array!34900 (store (arr!16759 a!3118) i!1132 k0!1914) (size!17123 a!3118)) mask!3119)))))

(declare-fun b!554034 () Bool)

(declare-fun res!346452 () Bool)

(declare-fun e!319512 () Bool)

(assert (=> b!554034 (=> (not res!346452) (not e!319512))))

(assert (=> b!554034 (= res!346452 (and (= (size!17123 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17123 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17123 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554035 () Bool)

(assert (=> b!554035 (= e!319512 e!319510)))

(declare-fun res!346450 () Bool)

(assert (=> b!554035 (=> (not res!346450) (not e!319510))))

(declare-fun lt!251658 () SeekEntryResult!5208)

(assert (=> b!554035 (= res!346450 (or (= lt!251658 (MissingZero!5208 i!1132)) (= lt!251658 (MissingVacant!5208 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34899 (_ BitVec 32)) SeekEntryResult!5208)

(assert (=> b!554035 (= lt!251658 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554036 () Bool)

(declare-fun res!346445 () Bool)

(assert (=> b!554036 (=> (not res!346445) (not e!319510))))

(declare-datatypes ((List!10839 0))(
  ( (Nil!10836) (Cons!10835 (h!11820 (_ BitVec 64)) (t!17067 List!10839)) )
))
(declare-fun arrayNoDuplicates!0 (array!34899 (_ BitVec 32) List!10839) Bool)

(assert (=> b!554036 (= res!346445 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10836))))

(declare-fun b!554037 () Bool)

(declare-fun res!346447 () Bool)

(assert (=> b!554037 (=> (not res!346447) (not e!319512))))

(declare-fun arrayContainsKey!0 (array!34899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554037 (= res!346447 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554038 () Bool)

(declare-fun res!346449 () Bool)

(assert (=> b!554038 (=> (not res!346449) (not e!319512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554038 (= res!346449 (validKeyInArray!0 k0!1914))))

(declare-fun b!554039 () Bool)

(declare-fun res!346453 () Bool)

(assert (=> b!554039 (=> (not res!346453) (not e!319510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34899 (_ BitVec 32)) Bool)

(assert (=> b!554039 (= res!346453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554040 () Bool)

(assert (=> b!554040 (= e!319510 (not true))))

(declare-fun e!319511 () Bool)

(assert (=> b!554040 e!319511))

(declare-fun res!346451 () Bool)

(assert (=> b!554040 (=> (not res!346451) (not e!319511))))

(assert (=> b!554040 (= res!346451 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17190 0))(
  ( (Unit!17191) )
))
(declare-fun lt!251659 () Unit!17190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17190)

(assert (=> b!554040 (= lt!251659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!346448 () Bool)

(assert (=> start!50674 (=> (not res!346448) (not e!319512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50674 (= res!346448 (validMask!0 mask!3119))))

(assert (=> start!50674 e!319512))

(assert (=> start!50674 true))

(declare-fun array_inv!12555 (array!34899) Bool)

(assert (=> start!50674 (array_inv!12555 a!3118)))

(declare-fun b!554041 () Bool)

(assert (=> b!554041 (= e!319511 (= (seekEntryOrOpen!0 (select (arr!16759 a!3118) j!142) a!3118 mask!3119) (Found!5208 j!142)))))

(declare-fun b!554042 () Bool)

(declare-fun res!346446 () Bool)

(assert (=> b!554042 (=> (not res!346446) (not e!319512))))

(assert (=> b!554042 (= res!346446 (validKeyInArray!0 (select (arr!16759 a!3118) j!142)))))

(assert (= (and start!50674 res!346448) b!554034))

(assert (= (and b!554034 res!346452) b!554042))

(assert (= (and b!554042 res!346446) b!554038))

(assert (= (and b!554038 res!346449) b!554037))

(assert (= (and b!554037 res!346447) b!554035))

(assert (= (and b!554035 res!346450) b!554039))

(assert (= (and b!554039 res!346453) b!554036))

(assert (= (and b!554036 res!346445) b!554033))

(assert (= (and b!554033 res!346454) b!554040))

(assert (= (and b!554040 res!346451) b!554041))

(declare-fun m!531243 () Bool)

(assert (=> b!554037 m!531243))

(declare-fun m!531245 () Bool)

(assert (=> b!554039 m!531245))

(declare-fun m!531247 () Bool)

(assert (=> start!50674 m!531247))

(declare-fun m!531249 () Bool)

(assert (=> start!50674 m!531249))

(declare-fun m!531251 () Bool)

(assert (=> b!554040 m!531251))

(declare-fun m!531253 () Bool)

(assert (=> b!554040 m!531253))

(declare-fun m!531255 () Bool)

(assert (=> b!554038 m!531255))

(declare-fun m!531257 () Bool)

(assert (=> b!554035 m!531257))

(declare-fun m!531259 () Bool)

(assert (=> b!554041 m!531259))

(assert (=> b!554041 m!531259))

(declare-fun m!531261 () Bool)

(assert (=> b!554041 m!531261))

(assert (=> b!554033 m!531259))

(declare-fun m!531263 () Bool)

(assert (=> b!554033 m!531263))

(assert (=> b!554033 m!531259))

(declare-fun m!531265 () Bool)

(assert (=> b!554033 m!531265))

(declare-fun m!531267 () Bool)

(assert (=> b!554033 m!531267))

(assert (=> b!554033 m!531265))

(declare-fun m!531269 () Bool)

(assert (=> b!554033 m!531269))

(assert (=> b!554033 m!531263))

(assert (=> b!554033 m!531259))

(declare-fun m!531271 () Bool)

(assert (=> b!554033 m!531271))

(declare-fun m!531273 () Bool)

(assert (=> b!554033 m!531273))

(assert (=> b!554033 m!531265))

(assert (=> b!554033 m!531267))

(assert (=> b!554042 m!531259))

(assert (=> b!554042 m!531259))

(declare-fun m!531275 () Bool)

(assert (=> b!554042 m!531275))

(declare-fun m!531277 () Bool)

(assert (=> b!554036 m!531277))

(check-sat (not b!554035) (not b!554042) (not b!554040) (not b!554037) (not b!554039) (not b!554038) (not b!554041) (not b!554033) (not b!554036) (not start!50674))
(check-sat)
