; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52790 () Bool)

(assert start!52790)

(declare-fun b!575697 () Bool)

(declare-fun e!331251 () Bool)

(declare-fun e!331249 () Bool)

(assert (=> b!575697 (= e!331251 e!331249)))

(declare-fun res!364113 () Bool)

(assert (=> b!575697 (=> res!364113 e!331249)))

(declare-datatypes ((SeekEntryResult!5699 0))(
  ( (MissingZero!5699 (index!25023 (_ BitVec 32))) (Found!5699 (index!25024 (_ BitVec 32))) (Intermediate!5699 (undefined!6511 Bool) (index!25025 (_ BitVec 32)) (x!53916 (_ BitVec 32))) (Undefined!5699) (MissingVacant!5699 (index!25026 (_ BitVec 32))) )
))
(declare-fun lt!263337 () SeekEntryResult!5699)

(declare-fun lt!263334 () SeekEntryResult!5699)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!263327 () (_ BitVec 64))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!263335 () SeekEntryResult!5699)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35935 0))(
  ( (array!35936 (arr!17250 (Array (_ BitVec 32) (_ BitVec 64))) (size!17614 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35935)

(assert (=> b!575697 (= res!364113 (or (bvslt (index!25025 lt!263337) #b00000000000000000000000000000000) (bvsge (index!25025 lt!263337) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53916 lt!263337) #b01111111111111111111111111111110) (bvslt (x!53916 lt!263337) #b00000000000000000000000000000000) (not (= lt!263327 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17250 a!3118) i!1132 k!1914) (index!25025 lt!263337)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263335 lt!263334))))))

(declare-fun lt!263333 () SeekEntryResult!5699)

(declare-fun lt!263338 () SeekEntryResult!5699)

(assert (=> b!575697 (= lt!263333 lt!263338)))

(declare-fun lt!263328 () (_ BitVec 64))

(declare-fun lt!263329 () array!35935)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35935 (_ BitVec 32)) SeekEntryResult!5699)

(assert (=> b!575697 (= lt!263338 (seekKeyOrZeroReturnVacant!0 (x!53916 lt!263337) (index!25025 lt!263337) (index!25025 lt!263337) lt!263328 lt!263329 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35935 (_ BitVec 32)) SeekEntryResult!5699)

(assert (=> b!575697 (= lt!263333 (seekEntryOrOpen!0 lt!263328 lt!263329 mask!3119))))

(declare-fun lt!263325 () SeekEntryResult!5699)

(assert (=> b!575697 (= lt!263325 lt!263335)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575697 (= lt!263335 (seekKeyOrZeroReturnVacant!0 (x!53916 lt!263337) (index!25025 lt!263337) (index!25025 lt!263337) (select (arr!17250 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575698 () Bool)

(declare-fun res!364118 () Bool)

(declare-fun e!331253 () Bool)

(assert (=> b!575698 (=> (not res!364118) (not e!331253))))

(declare-datatypes ((List!11330 0))(
  ( (Nil!11327) (Cons!11326 (h!12365 (_ BitVec 64)) (t!17558 List!11330)) )
))
(declare-fun arrayNoDuplicates!0 (array!35935 (_ BitVec 32) List!11330) Bool)

(assert (=> b!575698 (= res!364118 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11327))))

(declare-fun b!575699 () Bool)

(declare-fun res!364123 () Bool)

(declare-fun e!331248 () Bool)

(assert (=> b!575699 (=> (not res!364123) (not e!331248))))

(declare-fun arrayContainsKey!0 (array!35935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575699 (= res!364123 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575700 () Bool)

(declare-fun res!364121 () Bool)

(assert (=> b!575700 (=> (not res!364121) (not e!331248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575700 (= res!364121 (validKeyInArray!0 k!1914))))

(declare-fun b!575701 () Bool)

(declare-fun res!364114 () Bool)

(assert (=> b!575701 (=> (not res!364114) (not e!331248))))

(assert (=> b!575701 (= res!364114 (validKeyInArray!0 (select (arr!17250 a!3118) j!142)))))

(declare-fun res!364120 () Bool)

(assert (=> start!52790 (=> (not res!364120) (not e!331248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52790 (= res!364120 (validMask!0 mask!3119))))

(assert (=> start!52790 e!331248))

(assert (=> start!52790 true))

(declare-fun array_inv!13046 (array!35935) Bool)

(assert (=> start!52790 (array_inv!13046 a!3118)))

(declare-fun b!575702 () Bool)

(declare-fun e!331252 () Bool)

(declare-fun e!331254 () Bool)

(assert (=> b!575702 (= e!331252 (not e!331254))))

(declare-fun res!364119 () Bool)

(assert (=> b!575702 (=> res!364119 e!331254)))

(assert (=> b!575702 (= res!364119 (or (undefined!6511 lt!263337) (not (is-Intermediate!5699 lt!263337))))))

(assert (=> b!575702 (= lt!263325 lt!263334)))

(assert (=> b!575702 (= lt!263334 (Found!5699 j!142))))

(assert (=> b!575702 (= lt!263325 (seekEntryOrOpen!0 (select (arr!17250 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35935 (_ BitVec 32)) Bool)

(assert (=> b!575702 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18100 0))(
  ( (Unit!18101) )
))
(declare-fun lt!263326 () Unit!18100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18100)

(assert (=> b!575702 (= lt!263326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575703 () Bool)

(assert (=> b!575703 (= e!331254 e!331251)))

(declare-fun res!364122 () Bool)

(assert (=> b!575703 (=> res!364122 e!331251)))

(assert (=> b!575703 (= res!364122 (or (= lt!263327 (select (arr!17250 a!3118) j!142)) (= lt!263327 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575703 (= lt!263327 (select (arr!17250 a!3118) (index!25025 lt!263337)))))

(declare-fun b!575704 () Bool)

(assert (=> b!575704 (= e!331253 e!331252)))

(declare-fun res!364115 () Bool)

(assert (=> b!575704 (=> (not res!364115) (not e!331252))))

(declare-fun lt!263331 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35935 (_ BitVec 32)) SeekEntryResult!5699)

(assert (=> b!575704 (= res!364115 (= lt!263337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263331 lt!263328 lt!263329 mask!3119)))))

(declare-fun lt!263330 () (_ BitVec 32))

(assert (=> b!575704 (= lt!263337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263330 (select (arr!17250 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575704 (= lt!263331 (toIndex!0 lt!263328 mask!3119))))

(assert (=> b!575704 (= lt!263328 (select (store (arr!17250 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575704 (= lt!263330 (toIndex!0 (select (arr!17250 a!3118) j!142) mask!3119))))

(assert (=> b!575704 (= lt!263329 (array!35936 (store (arr!17250 a!3118) i!1132 k!1914) (size!17614 a!3118)))))

(declare-fun b!575705 () Bool)

(declare-fun res!364124 () Bool)

(assert (=> b!575705 (=> (not res!364124) (not e!331253))))

(assert (=> b!575705 (= res!364124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575706 () Bool)

(assert (=> b!575706 (= e!331248 e!331253)))

(declare-fun res!364117 () Bool)

(assert (=> b!575706 (=> (not res!364117) (not e!331253))))

(declare-fun lt!263336 () SeekEntryResult!5699)

(assert (=> b!575706 (= res!364117 (or (= lt!263336 (MissingZero!5699 i!1132)) (= lt!263336 (MissingVacant!5699 i!1132))))))

(assert (=> b!575706 (= lt!263336 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575707 () Bool)

(declare-fun res!364116 () Bool)

(assert (=> b!575707 (=> (not res!364116) (not e!331248))))

(assert (=> b!575707 (= res!364116 (and (= (size!17614 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17614 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17614 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575708 () Bool)

(assert (=> b!575708 (= e!331249 (= lt!263325 lt!263333))))

(assert (=> b!575708 (= lt!263335 lt!263338)))

(declare-fun lt!263332 () Unit!18100)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35935 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18100)

(assert (=> b!575708 (= lt!263332 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53916 lt!263337) (index!25025 lt!263337) (index!25025 lt!263337) mask!3119))))

(assert (= (and start!52790 res!364120) b!575707))

(assert (= (and b!575707 res!364116) b!575701))

(assert (= (and b!575701 res!364114) b!575700))

(assert (= (and b!575700 res!364121) b!575699))

(assert (= (and b!575699 res!364123) b!575706))

(assert (= (and b!575706 res!364117) b!575705))

(assert (= (and b!575705 res!364124) b!575698))

(assert (= (and b!575698 res!364118) b!575704))

(assert (= (and b!575704 res!364115) b!575702))

(assert (= (and b!575702 (not res!364119)) b!575703))

(assert (= (and b!575703 (not res!364122)) b!575697))

(assert (= (and b!575697 (not res!364113)) b!575708))

(declare-fun m!554637 () Bool)

(assert (=> b!575699 m!554637))

(declare-fun m!554639 () Bool)

(assert (=> b!575701 m!554639))

(assert (=> b!575701 m!554639))

(declare-fun m!554641 () Bool)

(assert (=> b!575701 m!554641))

(assert (=> b!575704 m!554639))

(declare-fun m!554643 () Bool)

(assert (=> b!575704 m!554643))

(assert (=> b!575704 m!554639))

(declare-fun m!554645 () Bool)

(assert (=> b!575704 m!554645))

(declare-fun m!554647 () Bool)

(assert (=> b!575704 m!554647))

(assert (=> b!575704 m!554639))

(declare-fun m!554649 () Bool)

(assert (=> b!575704 m!554649))

(declare-fun m!554651 () Bool)

(assert (=> b!575704 m!554651))

(declare-fun m!554653 () Bool)

(assert (=> b!575704 m!554653))

(declare-fun m!554655 () Bool)

(assert (=> b!575706 m!554655))

(declare-fun m!554657 () Bool)

(assert (=> b!575705 m!554657))

(assert (=> b!575703 m!554639))

(declare-fun m!554659 () Bool)

(assert (=> b!575703 m!554659))

(declare-fun m!554661 () Bool)

(assert (=> b!575698 m!554661))

(assert (=> b!575697 m!554639))

(declare-fun m!554663 () Bool)

(assert (=> b!575697 m!554663))

(assert (=> b!575697 m!554639))

(declare-fun m!554665 () Bool)

(assert (=> b!575697 m!554665))

(assert (=> b!575697 m!554653))

(declare-fun m!554667 () Bool)

(assert (=> b!575697 m!554667))

(declare-fun m!554669 () Bool)

(assert (=> b!575697 m!554669))

(assert (=> b!575702 m!554639))

(assert (=> b!575702 m!554639))

(declare-fun m!554671 () Bool)

(assert (=> b!575702 m!554671))

(declare-fun m!554673 () Bool)

(assert (=> b!575702 m!554673))

(declare-fun m!554675 () Bool)

(assert (=> b!575702 m!554675))

(declare-fun m!554677 () Bool)

(assert (=> b!575700 m!554677))

(declare-fun m!554679 () Bool)

(assert (=> start!52790 m!554679))

(declare-fun m!554681 () Bool)

(assert (=> start!52790 m!554681))

(declare-fun m!554683 () Bool)

(assert (=> b!575708 m!554683))

(push 1)

