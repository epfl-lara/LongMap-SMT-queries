; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52418 () Bool)

(assert start!52418)

(declare-fun b!572114 () Bool)

(declare-fun e!329082 () Bool)

(declare-fun e!329080 () Bool)

(assert (=> b!572114 (= e!329082 e!329080)))

(declare-fun res!361623 () Bool)

(assert (=> b!572114 (=> res!361623 e!329080)))

(declare-datatypes ((SeekEntryResult!5645 0))(
  ( (MissingZero!5645 (index!24807 (_ BitVec 32))) (Found!5645 (index!24808 (_ BitVec 32))) (Intermediate!5645 (undefined!6457 Bool) (index!24809 (_ BitVec 32)) (x!53682 (_ BitVec 32))) (Undefined!5645) (MissingVacant!5645 (index!24810 (_ BitVec 32))) )
))
(declare-fun lt!261011 () SeekEntryResult!5645)

(assert (=> b!572114 (= res!361623 (or (undefined!6457 lt!261011) (not (is-Intermediate!5645 lt!261011))))))

(declare-fun b!572115 () Bool)

(declare-fun e!329081 () Bool)

(assert (=> b!572115 (= e!329080 e!329081)))

(declare-fun res!361625 () Bool)

(assert (=> b!572115 (=> res!361625 e!329081)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261015 () (_ BitVec 64))

(declare-datatypes ((array!35815 0))(
  ( (array!35816 (arr!17196 (Array (_ BitVec 32) (_ BitVec 64))) (size!17560 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35815)

(assert (=> b!572115 (= res!361625 (or (= lt!261015 (select (arr!17196 a!3118) j!142)) (= lt!261015 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572115 (= lt!261015 (select (arr!17196 a!3118) (index!24809 lt!261011)))))

(declare-fun b!572116 () Bool)

(declare-fun res!361631 () Bool)

(declare-fun e!329076 () Bool)

(assert (=> b!572116 (=> (not res!361631) (not e!329076))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572116 (= res!361631 (validKeyInArray!0 k!1914))))

(declare-fun b!572117 () Bool)

(declare-fun e!329075 () Bool)

(assert (=> b!572117 (= e!329081 e!329075)))

(declare-fun res!361628 () Bool)

(assert (=> b!572117 (=> (not res!361628) (not e!329075))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!261017 () SeekEntryResult!5645)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35815 (_ BitVec 32)) SeekEntryResult!5645)

(assert (=> b!572117 (= res!361628 (= lt!261017 (seekKeyOrZeroReturnVacant!0 (x!53682 lt!261011) (index!24809 lt!261011) (index!24809 lt!261011) (select (arr!17196 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572118 () Bool)

(declare-fun e!329079 () Bool)

(declare-fun e!329077 () Bool)

(assert (=> b!572118 (= e!329079 e!329077)))

(declare-fun res!361629 () Bool)

(assert (=> b!572118 (=> (not res!361629) (not e!329077))))

(declare-fun lt!261018 () array!35815)

(declare-fun lt!261014 () (_ BitVec 32))

(declare-fun lt!261019 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35815 (_ BitVec 32)) SeekEntryResult!5645)

(assert (=> b!572118 (= res!361629 (= lt!261011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261014 lt!261019 lt!261018 mask!3119)))))

(declare-fun lt!261013 () (_ BitVec 32))

(assert (=> b!572118 (= lt!261011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261013 (select (arr!17196 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572118 (= lt!261014 (toIndex!0 lt!261019 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572118 (= lt!261019 (select (store (arr!17196 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572118 (= lt!261013 (toIndex!0 (select (arr!17196 a!3118) j!142) mask!3119))))

(assert (=> b!572118 (= lt!261018 (array!35816 (store (arr!17196 a!3118) i!1132 k!1914) (size!17560 a!3118)))))

(declare-fun b!572119 () Bool)

(declare-fun res!361633 () Bool)

(assert (=> b!572119 (=> (not res!361633) (not e!329079))))

(declare-datatypes ((List!11276 0))(
  ( (Nil!11273) (Cons!11272 (h!12299 (_ BitVec 64)) (t!17504 List!11276)) )
))
(declare-fun arrayNoDuplicates!0 (array!35815 (_ BitVec 32) List!11276) Bool)

(assert (=> b!572119 (= res!361633 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11273))))

(declare-fun b!572120 () Bool)

(declare-fun res!361626 () Bool)

(assert (=> b!572120 (=> (not res!361626) (not e!329076))))

(assert (=> b!572120 (= res!361626 (validKeyInArray!0 (select (arr!17196 a!3118) j!142)))))

(declare-fun b!572121 () Bool)

(declare-fun res!361630 () Bool)

(assert (=> b!572121 (=> (not res!361630) (not e!329076))))

(declare-fun arrayContainsKey!0 (array!35815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572121 (= res!361630 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572122 () Bool)

(declare-fun res!361627 () Bool)

(assert (=> b!572122 (=> (not res!361627) (not e!329076))))

(assert (=> b!572122 (= res!361627 (and (= (size!17560 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17560 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17560 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572123 () Bool)

(assert (=> b!572123 (= e!329077 (not true))))

(assert (=> b!572123 e!329082))

(declare-fun res!361632 () Bool)

(assert (=> b!572123 (=> (not res!361632) (not e!329082))))

(assert (=> b!572123 (= res!361632 (= lt!261017 (Found!5645 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35815 (_ BitVec 32)) SeekEntryResult!5645)

(assert (=> b!572123 (= lt!261017 (seekEntryOrOpen!0 (select (arr!17196 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35815 (_ BitVec 32)) Bool)

(assert (=> b!572123 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17992 0))(
  ( (Unit!17993) )
))
(declare-fun lt!261012 () Unit!17992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17992)

(assert (=> b!572123 (= lt!261012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572125 () Bool)

(declare-fun res!361624 () Bool)

(assert (=> b!572125 (=> (not res!361624) (not e!329079))))

(assert (=> b!572125 (= res!361624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572126 () Bool)

(assert (=> b!572126 (= e!329075 (= (seekEntryOrOpen!0 lt!261019 lt!261018 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53682 lt!261011) (index!24809 lt!261011) (index!24809 lt!261011) lt!261019 lt!261018 mask!3119)))))

(declare-fun res!361622 () Bool)

(assert (=> start!52418 (=> (not res!361622) (not e!329076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52418 (= res!361622 (validMask!0 mask!3119))))

(assert (=> start!52418 e!329076))

(assert (=> start!52418 true))

(declare-fun array_inv!12992 (array!35815) Bool)

(assert (=> start!52418 (array_inv!12992 a!3118)))

(declare-fun b!572124 () Bool)

(assert (=> b!572124 (= e!329076 e!329079)))

(declare-fun res!361634 () Bool)

(assert (=> b!572124 (=> (not res!361634) (not e!329079))))

(declare-fun lt!261016 () SeekEntryResult!5645)

(assert (=> b!572124 (= res!361634 (or (= lt!261016 (MissingZero!5645 i!1132)) (= lt!261016 (MissingVacant!5645 i!1132))))))

(assert (=> b!572124 (= lt!261016 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52418 res!361622) b!572122))

(assert (= (and b!572122 res!361627) b!572120))

(assert (= (and b!572120 res!361626) b!572116))

(assert (= (and b!572116 res!361631) b!572121))

(assert (= (and b!572121 res!361630) b!572124))

(assert (= (and b!572124 res!361634) b!572125))

(assert (= (and b!572125 res!361624) b!572119))

(assert (= (and b!572119 res!361633) b!572118))

(assert (= (and b!572118 res!361629) b!572123))

(assert (= (and b!572123 res!361632) b!572114))

(assert (= (and b!572114 (not res!361623)) b!572115))

(assert (= (and b!572115 (not res!361625)) b!572117))

(assert (= (and b!572117 res!361628) b!572126))

(declare-fun m!551049 () Bool)

(assert (=> b!572116 m!551049))

(declare-fun m!551051 () Bool)

(assert (=> b!572121 m!551051))

(declare-fun m!551053 () Bool)

(assert (=> b!572123 m!551053))

(assert (=> b!572123 m!551053))

(declare-fun m!551055 () Bool)

(assert (=> b!572123 m!551055))

(declare-fun m!551057 () Bool)

(assert (=> b!572123 m!551057))

(declare-fun m!551059 () Bool)

(assert (=> b!572123 m!551059))

(declare-fun m!551061 () Bool)

(assert (=> b!572126 m!551061))

(declare-fun m!551063 () Bool)

(assert (=> b!572126 m!551063))

(declare-fun m!551065 () Bool)

(assert (=> start!52418 m!551065))

(declare-fun m!551067 () Bool)

(assert (=> start!52418 m!551067))

(assert (=> b!572117 m!551053))

(assert (=> b!572117 m!551053))

(declare-fun m!551069 () Bool)

(assert (=> b!572117 m!551069))

(assert (=> b!572118 m!551053))

(declare-fun m!551071 () Bool)

(assert (=> b!572118 m!551071))

(declare-fun m!551073 () Bool)

(assert (=> b!572118 m!551073))

(assert (=> b!572118 m!551053))

(assert (=> b!572118 m!551053))

(declare-fun m!551075 () Bool)

(assert (=> b!572118 m!551075))

(declare-fun m!551077 () Bool)

(assert (=> b!572118 m!551077))

(declare-fun m!551079 () Bool)

(assert (=> b!572118 m!551079))

(declare-fun m!551081 () Bool)

(assert (=> b!572118 m!551081))

(declare-fun m!551083 () Bool)

(assert (=> b!572125 m!551083))

(assert (=> b!572120 m!551053))

(assert (=> b!572120 m!551053))

(declare-fun m!551085 () Bool)

(assert (=> b!572120 m!551085))

(declare-fun m!551087 () Bool)

(assert (=> b!572124 m!551087))

(declare-fun m!551089 () Bool)

(assert (=> b!572119 m!551089))

(assert (=> b!572115 m!551053))

(declare-fun m!551091 () Bool)

(assert (=> b!572115 m!551091))

(push 1)

