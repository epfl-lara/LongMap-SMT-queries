; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52442 () Bool)

(assert start!52442)

(declare-fun b!572545 () Bool)

(declare-fun res!362206 () Bool)

(declare-fun e!329334 () Bool)

(assert (=> b!572545 (=> (not res!362206) (not e!329334))))

(declare-datatypes ((array!35848 0))(
  ( (array!35849 (arr!17213 (Array (_ BitVec 32) (_ BitVec 64))) (size!17578 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35848)

(declare-datatypes ((List!11332 0))(
  ( (Nil!11329) (Cons!11328 (h!12355 (_ BitVec 64)) (t!17551 List!11332)) )
))
(declare-fun arrayNoDuplicates!0 (array!35848 (_ BitVec 32) List!11332) Bool)

(assert (=> b!572545 (= res!362206 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11329))))

(declare-fun b!572546 () Bool)

(declare-fun e!329340 () Bool)

(declare-fun e!329339 () Bool)

(assert (=> b!572546 (= e!329340 e!329339)))

(declare-fun res!362200 () Bool)

(assert (=> b!572546 (=> res!362200 e!329339)))

(declare-datatypes ((SeekEntryResult!5659 0))(
  ( (MissingZero!5659 (index!24863 (_ BitVec 32))) (Found!5659 (index!24864 (_ BitVec 32))) (Intermediate!5659 (undefined!6471 Bool) (index!24865 (_ BitVec 32)) (x!53739 (_ BitVec 32))) (Undefined!5659) (MissingVacant!5659 (index!24866 (_ BitVec 32))) )
))
(declare-fun lt!261263 () SeekEntryResult!5659)

(get-info :version)

(assert (=> b!572546 (= res!362200 (or (undefined!6471 lt!261263) (not ((_ is Intermediate!5659) lt!261263))))))

(declare-fun b!572547 () Bool)

(declare-fun res!362203 () Bool)

(declare-fun e!329335 () Bool)

(assert (=> b!572547 (=> (not res!362203) (not e!329335))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572547 (= res!362203 (validKeyInArray!0 k0!1914))))

(declare-fun lt!261270 () array!35848)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!572548 () Bool)

(declare-fun lt!261264 () (_ BitVec 64))

(declare-fun e!329333 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35848 (_ BitVec 32)) SeekEntryResult!5659)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35848 (_ BitVec 32)) SeekEntryResult!5659)

(assert (=> b!572548 (= e!329333 (= (seekEntryOrOpen!0 lt!261264 lt!261270 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53739 lt!261263) (index!24865 lt!261263) (index!24865 lt!261263) lt!261264 lt!261270 mask!3119)))))

(declare-fun b!572549 () Bool)

(declare-fun e!329338 () Bool)

(assert (=> b!572549 (= e!329338 e!329333)))

(declare-fun res!362199 () Bool)

(assert (=> b!572549 (=> (not res!362199) (not e!329333))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261271 () SeekEntryResult!5659)

(assert (=> b!572549 (= res!362199 (= lt!261271 (seekKeyOrZeroReturnVacant!0 (x!53739 lt!261263) (index!24865 lt!261263) (index!24865 lt!261263) (select (arr!17213 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572551 () Bool)

(assert (=> b!572551 (= e!329335 e!329334)))

(declare-fun res!362201 () Bool)

(assert (=> b!572551 (=> (not res!362201) (not e!329334))))

(declare-fun lt!261268 () SeekEntryResult!5659)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572551 (= res!362201 (or (= lt!261268 (MissingZero!5659 i!1132)) (= lt!261268 (MissingVacant!5659 i!1132))))))

(assert (=> b!572551 (= lt!261268 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572552 () Bool)

(assert (=> b!572552 (= e!329339 e!329338)))

(declare-fun res!362195 () Bool)

(assert (=> b!572552 (=> res!362195 e!329338)))

(declare-fun lt!261265 () (_ BitVec 64))

(assert (=> b!572552 (= res!362195 (or (= lt!261265 (select (arr!17213 a!3118) j!142)) (= lt!261265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572552 (= lt!261265 (select (arr!17213 a!3118) (index!24865 lt!261263)))))

(declare-fun b!572550 () Bool)

(declare-fun e!329336 () Bool)

(assert (=> b!572550 (= e!329334 e!329336)))

(declare-fun res!362202 () Bool)

(assert (=> b!572550 (=> (not res!362202) (not e!329336))))

(declare-fun lt!261267 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35848 (_ BitVec 32)) SeekEntryResult!5659)

(assert (=> b!572550 (= res!362202 (= lt!261263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261267 lt!261264 lt!261270 mask!3119)))))

(declare-fun lt!261269 () (_ BitVec 32))

(assert (=> b!572550 (= lt!261263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261269 (select (arr!17213 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572550 (= lt!261267 (toIndex!0 lt!261264 mask!3119))))

(assert (=> b!572550 (= lt!261264 (select (store (arr!17213 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572550 (= lt!261269 (toIndex!0 (select (arr!17213 a!3118) j!142) mask!3119))))

(assert (=> b!572550 (= lt!261270 (array!35849 (store (arr!17213 a!3118) i!1132 k0!1914) (size!17578 a!3118)))))

(declare-fun res!362197 () Bool)

(assert (=> start!52442 (=> (not res!362197) (not e!329335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52442 (= res!362197 (validMask!0 mask!3119))))

(assert (=> start!52442 e!329335))

(assert (=> start!52442 true))

(declare-fun array_inv!13096 (array!35848) Bool)

(assert (=> start!52442 (array_inv!13096 a!3118)))

(declare-fun b!572553 () Bool)

(declare-fun res!362207 () Bool)

(assert (=> b!572553 (=> (not res!362207) (not e!329334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35848 (_ BitVec 32)) Bool)

(assert (=> b!572553 (= res!362207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572554 () Bool)

(declare-fun res!362205 () Bool)

(assert (=> b!572554 (=> (not res!362205) (not e!329335))))

(assert (=> b!572554 (= res!362205 (and (= (size!17578 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17578 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17578 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572555 () Bool)

(declare-fun res!362196 () Bool)

(assert (=> b!572555 (=> (not res!362196) (not e!329335))))

(declare-fun arrayContainsKey!0 (array!35848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572555 (= res!362196 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572556 () Bool)

(assert (=> b!572556 (= e!329336 (not true))))

(assert (=> b!572556 e!329340))

(declare-fun res!362198 () Bool)

(assert (=> b!572556 (=> (not res!362198) (not e!329340))))

(assert (=> b!572556 (= res!362198 (= lt!261271 (Found!5659 j!142)))))

(assert (=> b!572556 (= lt!261271 (seekEntryOrOpen!0 (select (arr!17213 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572556 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18006 0))(
  ( (Unit!18007) )
))
(declare-fun lt!261266 () Unit!18006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18006)

(assert (=> b!572556 (= lt!261266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572557 () Bool)

(declare-fun res!362204 () Bool)

(assert (=> b!572557 (=> (not res!362204) (not e!329335))))

(assert (=> b!572557 (= res!362204 (validKeyInArray!0 (select (arr!17213 a!3118) j!142)))))

(assert (= (and start!52442 res!362197) b!572554))

(assert (= (and b!572554 res!362205) b!572557))

(assert (= (and b!572557 res!362204) b!572547))

(assert (= (and b!572547 res!362203) b!572555))

(assert (= (and b!572555 res!362196) b!572551))

(assert (= (and b!572551 res!362201) b!572553))

(assert (= (and b!572553 res!362207) b!572545))

(assert (= (and b!572545 res!362206) b!572550))

(assert (= (and b!572550 res!362202) b!572556))

(assert (= (and b!572556 res!362198) b!572546))

(assert (= (and b!572546 (not res!362200)) b!572552))

(assert (= (and b!572552 (not res!362195)) b!572549))

(assert (= (and b!572549 res!362199) b!572548))

(declare-fun m!551069 () Bool)

(assert (=> b!572550 m!551069))

(declare-fun m!551071 () Bool)

(assert (=> b!572550 m!551071))

(assert (=> b!572550 m!551069))

(declare-fun m!551073 () Bool)

(assert (=> b!572550 m!551073))

(declare-fun m!551075 () Bool)

(assert (=> b!572550 m!551075))

(assert (=> b!572550 m!551069))

(declare-fun m!551077 () Bool)

(assert (=> b!572550 m!551077))

(declare-fun m!551079 () Bool)

(assert (=> b!572550 m!551079))

(declare-fun m!551081 () Bool)

(assert (=> b!572550 m!551081))

(declare-fun m!551083 () Bool)

(assert (=> start!52442 m!551083))

(declare-fun m!551085 () Bool)

(assert (=> start!52442 m!551085))

(declare-fun m!551087 () Bool)

(assert (=> b!572553 m!551087))

(assert (=> b!572552 m!551069))

(declare-fun m!551089 () Bool)

(assert (=> b!572552 m!551089))

(assert (=> b!572556 m!551069))

(assert (=> b!572556 m!551069))

(declare-fun m!551091 () Bool)

(assert (=> b!572556 m!551091))

(declare-fun m!551093 () Bool)

(assert (=> b!572556 m!551093))

(declare-fun m!551095 () Bool)

(assert (=> b!572556 m!551095))

(declare-fun m!551097 () Bool)

(assert (=> b!572555 m!551097))

(declare-fun m!551099 () Bool)

(assert (=> b!572545 m!551099))

(declare-fun m!551101 () Bool)

(assert (=> b!572551 m!551101))

(assert (=> b!572557 m!551069))

(assert (=> b!572557 m!551069))

(declare-fun m!551103 () Bool)

(assert (=> b!572557 m!551103))

(declare-fun m!551105 () Bool)

(assert (=> b!572547 m!551105))

(declare-fun m!551107 () Bool)

(assert (=> b!572548 m!551107))

(declare-fun m!551109 () Bool)

(assert (=> b!572548 m!551109))

(assert (=> b!572549 m!551069))

(assert (=> b!572549 m!551069))

(declare-fun m!551111 () Bool)

(assert (=> b!572549 m!551111))

(check-sat (not b!572545) (not b!572548) (not b!572557) (not b!572550) (not b!572547) (not start!52442) (not b!572549) (not b!572553) (not b!572556) (not b!572551) (not b!572555))
(check-sat)
