; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50756 () Bool)

(assert start!50756)

(declare-fun b!555198 () Bool)

(declare-fun res!347612 () Bool)

(declare-fun e!320031 () Bool)

(assert (=> b!555198 (=> (not res!347612) (not e!320031))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34981 0))(
  ( (array!34982 (arr!16800 (Array (_ BitVec 32) (_ BitVec 64))) (size!17164 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34981)

(assert (=> b!555198 (= res!347612 (and (= (size!17164 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17164 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17164 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555199 () Bool)

(declare-fun e!320029 () Bool)

(assert (=> b!555199 (= e!320029 (not true))))

(declare-datatypes ((SeekEntryResult!5249 0))(
  ( (MissingZero!5249 (index!23223 (_ BitVec 32))) (Found!5249 (index!23224 (_ BitVec 32))) (Intermediate!5249 (undefined!6061 Bool) (index!23225 (_ BitVec 32)) (x!52131 (_ BitVec 32))) (Undefined!5249) (MissingVacant!5249 (index!23226 (_ BitVec 32))) )
))
(declare-fun lt!252259 () SeekEntryResult!5249)

(declare-fun lt!252258 () SeekEntryResult!5249)

(assert (=> b!555199 (and (= lt!252258 (Found!5249 j!142)) (or (undefined!6061 lt!252259) (not (is-Intermediate!5249 lt!252259)) (= (select (arr!16800 a!3118) (index!23225 lt!252259)) (select (arr!16800 a!3118) j!142)) (not (= (select (arr!16800 a!3118) (index!23225 lt!252259)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252258 (MissingZero!5249 (index!23225 lt!252259)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34981 (_ BitVec 32)) SeekEntryResult!5249)

(assert (=> b!555199 (= lt!252258 (seekEntryOrOpen!0 (select (arr!16800 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34981 (_ BitVec 32)) Bool)

(assert (=> b!555199 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17272 0))(
  ( (Unit!17273) )
))
(declare-fun lt!252257 () Unit!17272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17272)

(assert (=> b!555199 (= lt!252257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555200 () Bool)

(declare-fun e!320028 () Bool)

(assert (=> b!555200 (= e!320031 e!320028)))

(declare-fun res!347615 () Bool)

(assert (=> b!555200 (=> (not res!347615) (not e!320028))))

(declare-fun lt!252254 () SeekEntryResult!5249)

(assert (=> b!555200 (= res!347615 (or (= lt!252254 (MissingZero!5249 i!1132)) (= lt!252254 (MissingVacant!5249 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!555200 (= lt!252254 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555201 () Bool)

(assert (=> b!555201 (= e!320028 e!320029)))

(declare-fun res!347613 () Bool)

(assert (=> b!555201 (=> (not res!347613) (not e!320029))))

(declare-fun lt!252255 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34981 (_ BitVec 32)) SeekEntryResult!5249)

(assert (=> b!555201 (= res!347613 (= lt!252259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252255 (select (store (arr!16800 a!3118) i!1132 k!1914) j!142) (array!34982 (store (arr!16800 a!3118) i!1132 k!1914) (size!17164 a!3118)) mask!3119)))))

(declare-fun lt!252256 () (_ BitVec 32))

(assert (=> b!555201 (= lt!252259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252256 (select (arr!16800 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555201 (= lt!252255 (toIndex!0 (select (store (arr!16800 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555201 (= lt!252256 (toIndex!0 (select (arr!16800 a!3118) j!142) mask!3119))))

(declare-fun res!347618 () Bool)

(assert (=> start!50756 (=> (not res!347618) (not e!320031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50756 (= res!347618 (validMask!0 mask!3119))))

(assert (=> start!50756 e!320031))

(assert (=> start!50756 true))

(declare-fun array_inv!12596 (array!34981) Bool)

(assert (=> start!50756 (array_inv!12596 a!3118)))

(declare-fun b!555202 () Bool)

(declare-fun res!347614 () Bool)

(assert (=> b!555202 (=> (not res!347614) (not e!320028))))

(declare-datatypes ((List!10880 0))(
  ( (Nil!10877) (Cons!10876 (h!11861 (_ BitVec 64)) (t!17108 List!10880)) )
))
(declare-fun arrayNoDuplicates!0 (array!34981 (_ BitVec 32) List!10880) Bool)

(assert (=> b!555202 (= res!347614 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10877))))

(declare-fun b!555203 () Bool)

(declare-fun res!347611 () Bool)

(assert (=> b!555203 (=> (not res!347611) (not e!320031))))

(declare-fun arrayContainsKey!0 (array!34981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555203 (= res!347611 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555204 () Bool)

(declare-fun res!347617 () Bool)

(assert (=> b!555204 (=> (not res!347617) (not e!320031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555204 (= res!347617 (validKeyInArray!0 (select (arr!16800 a!3118) j!142)))))

(declare-fun b!555205 () Bool)

(declare-fun res!347616 () Bool)

(assert (=> b!555205 (=> (not res!347616) (not e!320028))))

(assert (=> b!555205 (= res!347616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555206 () Bool)

(declare-fun res!347610 () Bool)

(assert (=> b!555206 (=> (not res!347610) (not e!320031))))

(assert (=> b!555206 (= res!347610 (validKeyInArray!0 k!1914))))

(assert (= (and start!50756 res!347618) b!555198))

(assert (= (and b!555198 res!347612) b!555204))

(assert (= (and b!555204 res!347617) b!555206))

(assert (= (and b!555206 res!347610) b!555203))

(assert (= (and b!555203 res!347611) b!555200))

(assert (= (and b!555200 res!347615) b!555205))

(assert (= (and b!555205 res!347616) b!555202))

(assert (= (and b!555202 res!347614) b!555201))

(assert (= (and b!555201 res!347613) b!555199))

(declare-fun m!532785 () Bool)

(assert (=> b!555201 m!532785))

(declare-fun m!532787 () Bool)

(assert (=> b!555201 m!532787))

(assert (=> b!555201 m!532785))

(declare-fun m!532789 () Bool)

(assert (=> b!555201 m!532789))

(assert (=> b!555201 m!532785))

(declare-fun m!532791 () Bool)

(assert (=> b!555201 m!532791))

(assert (=> b!555201 m!532789))

(declare-fun m!532793 () Bool)

(assert (=> b!555201 m!532793))

(declare-fun m!532795 () Bool)

(assert (=> b!555201 m!532795))

(assert (=> b!555201 m!532789))

(declare-fun m!532797 () Bool)

(assert (=> b!555201 m!532797))

(declare-fun m!532799 () Bool)

(assert (=> b!555206 m!532799))

(declare-fun m!532801 () Bool)

(assert (=> b!555199 m!532801))

(assert (=> b!555199 m!532785))

(declare-fun m!532803 () Bool)

(assert (=> b!555199 m!532803))

(declare-fun m!532805 () Bool)

(assert (=> b!555199 m!532805))

(assert (=> b!555199 m!532785))

(declare-fun m!532807 () Bool)

(assert (=> b!555199 m!532807))

(declare-fun m!532809 () Bool)

(assert (=> b!555203 m!532809))

(declare-fun m!532811 () Bool)

(assert (=> b!555205 m!532811))

(declare-fun m!532813 () Bool)

(assert (=> b!555200 m!532813))

(declare-fun m!532815 () Bool)

(assert (=> b!555202 m!532815))

(assert (=> b!555204 m!532785))

(assert (=> b!555204 m!532785))

(declare-fun m!532817 () Bool)

(assert (=> b!555204 m!532817))

(declare-fun m!532819 () Bool)

(assert (=> start!50756 m!532819))

(declare-fun m!532821 () Bool)

(assert (=> start!50756 m!532821))

(push 1)

