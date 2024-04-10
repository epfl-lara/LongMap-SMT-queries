; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52864 () Bool)

(assert start!52864)

(declare-fun b!576212 () Bool)

(declare-fun res!364449 () Bool)

(declare-fun e!331551 () Bool)

(assert (=> b!576212 (=> (not res!364449) (not e!331551))))

(declare-datatypes ((array!35952 0))(
  ( (array!35953 (arr!17257 (Array (_ BitVec 32) (_ BitVec 64))) (size!17621 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35952)

(declare-datatypes ((List!11337 0))(
  ( (Nil!11334) (Cons!11333 (h!12375 (_ BitVec 64)) (t!17565 List!11337)) )
))
(declare-fun arrayNoDuplicates!0 (array!35952 (_ BitVec 32) List!11337) Bool)

(assert (=> b!576212 (= res!364449 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11334))))

(declare-fun b!576213 () Bool)

(declare-fun res!364448 () Bool)

(declare-fun e!331548 () Bool)

(assert (=> b!576213 (=> (not res!364448) (not e!331548))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576213 (= res!364448 (validKeyInArray!0 (select (arr!17257 a!3118) j!142)))))

(declare-fun b!576214 () Bool)

(assert (=> b!576214 (= e!331551 (not true))))

(declare-fun e!331549 () Bool)

(assert (=> b!576214 e!331549))

(declare-fun res!364450 () Bool)

(assert (=> b!576214 (=> (not res!364450) (not e!331549))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35952 (_ BitVec 32)) Bool)

(assert (=> b!576214 (= res!364450 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18114 0))(
  ( (Unit!18115) )
))
(declare-fun lt!263616 () Unit!18114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18114)

(assert (=> b!576214 (= lt!263616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576215 () Bool)

(declare-fun res!364446 () Bool)

(assert (=> b!576215 (=> (not res!364446) (not e!331548))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576215 (= res!364446 (and (= (size!17621 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17621 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17621 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576216 () Bool)

(declare-fun res!364452 () Bool)

(assert (=> b!576216 (=> (not res!364452) (not e!331551))))

(assert (=> b!576216 (= res!364452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!364453 () Bool)

(assert (=> start!52864 (=> (not res!364453) (not e!331548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52864 (= res!364453 (validMask!0 mask!3119))))

(assert (=> start!52864 e!331548))

(assert (=> start!52864 true))

(declare-fun array_inv!13053 (array!35952) Bool)

(assert (=> start!52864 (array_inv!13053 a!3118)))

(declare-fun b!576217 () Bool)

(declare-fun res!364454 () Bool)

(assert (=> b!576217 (=> (not res!364454) (not e!331548))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576217 (= res!364454 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576218 () Bool)

(declare-datatypes ((SeekEntryResult!5706 0))(
  ( (MissingZero!5706 (index!25051 (_ BitVec 32))) (Found!5706 (index!25052 (_ BitVec 32))) (Intermediate!5706 (undefined!6518 Bool) (index!25053 (_ BitVec 32)) (x!53945 (_ BitVec 32))) (Undefined!5706) (MissingVacant!5706 (index!25054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35952 (_ BitVec 32)) SeekEntryResult!5706)

(assert (=> b!576218 (= e!331549 (= (seekEntryOrOpen!0 (select (arr!17257 a!3118) j!142) a!3118 mask!3119) (Found!5706 j!142)))))

(declare-fun b!576219 () Bool)

(assert (=> b!576219 (= e!331548 e!331551)))

(declare-fun res!364445 () Bool)

(assert (=> b!576219 (=> (not res!364445) (not e!331551))))

(declare-fun lt!263617 () SeekEntryResult!5706)

(assert (=> b!576219 (= res!364445 (or (= lt!263617 (MissingZero!5706 i!1132)) (= lt!263617 (MissingVacant!5706 i!1132))))))

(assert (=> b!576219 (= lt!263617 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576220 () Bool)

(declare-fun res!364451 () Bool)

(assert (=> b!576220 (=> (not res!364451) (not e!331548))))

(assert (=> b!576220 (= res!364451 (validKeyInArray!0 k0!1914))))

(declare-fun b!576221 () Bool)

(declare-fun res!364447 () Bool)

(assert (=> b!576221 (=> (not res!364447) (not e!331551))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35952 (_ BitVec 32)) SeekEntryResult!5706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576221 (= res!364447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17257 a!3118) j!142) mask!3119) (select (arr!17257 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17257 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17257 a!3118) i!1132 k0!1914) j!142) (array!35953 (store (arr!17257 a!3118) i!1132 k0!1914) (size!17621 a!3118)) mask!3119)))))

(assert (= (and start!52864 res!364453) b!576215))

(assert (= (and b!576215 res!364446) b!576213))

(assert (= (and b!576213 res!364448) b!576220))

(assert (= (and b!576220 res!364451) b!576217))

(assert (= (and b!576217 res!364454) b!576219))

(assert (= (and b!576219 res!364445) b!576216))

(assert (= (and b!576216 res!364452) b!576212))

(assert (= (and b!576212 res!364449) b!576221))

(assert (= (and b!576221 res!364447) b!576214))

(assert (= (and b!576214 res!364450) b!576218))

(declare-fun m!555129 () Bool)

(assert (=> b!576219 m!555129))

(declare-fun m!555131 () Bool)

(assert (=> b!576218 m!555131))

(assert (=> b!576218 m!555131))

(declare-fun m!555133 () Bool)

(assert (=> b!576218 m!555133))

(declare-fun m!555135 () Bool)

(assert (=> b!576216 m!555135))

(assert (=> b!576213 m!555131))

(assert (=> b!576213 m!555131))

(declare-fun m!555137 () Bool)

(assert (=> b!576213 m!555137))

(declare-fun m!555139 () Bool)

(assert (=> b!576217 m!555139))

(assert (=> b!576221 m!555131))

(declare-fun m!555141 () Bool)

(assert (=> b!576221 m!555141))

(assert (=> b!576221 m!555131))

(declare-fun m!555143 () Bool)

(assert (=> b!576221 m!555143))

(declare-fun m!555145 () Bool)

(assert (=> b!576221 m!555145))

(assert (=> b!576221 m!555143))

(declare-fun m!555147 () Bool)

(assert (=> b!576221 m!555147))

(assert (=> b!576221 m!555141))

(assert (=> b!576221 m!555131))

(declare-fun m!555149 () Bool)

(assert (=> b!576221 m!555149))

(declare-fun m!555151 () Bool)

(assert (=> b!576221 m!555151))

(assert (=> b!576221 m!555143))

(assert (=> b!576221 m!555145))

(declare-fun m!555153 () Bool)

(assert (=> start!52864 m!555153))

(declare-fun m!555155 () Bool)

(assert (=> start!52864 m!555155))

(declare-fun m!555157 () Bool)

(assert (=> b!576214 m!555157))

(declare-fun m!555159 () Bool)

(assert (=> b!576214 m!555159))

(declare-fun m!555161 () Bool)

(assert (=> b!576212 m!555161))

(declare-fun m!555163 () Bool)

(assert (=> b!576220 m!555163))

(check-sat (not b!576216) (not b!576212) (not b!576219) (not b!576213) (not b!576217) (not b!576214) (not start!52864) (not b!576218) (not b!576221) (not b!576220))
(check-sat)
