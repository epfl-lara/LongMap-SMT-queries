; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50838 () Bool)

(assert start!50838)

(declare-fun b!555884 () Bool)

(declare-fun e!320375 () Bool)

(assert (=> b!555884 (= e!320375 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5218 0))(
  ( (MissingZero!5218 (index!23099 (_ BitVec 32))) (Found!5218 (index!23100 (_ BitVec 32))) (Intermediate!5218 (undefined!6030 Bool) (index!23101 (_ BitVec 32)) (x!52151 (_ BitVec 32))) (Undefined!5218) (MissingVacant!5218 (index!23102 (_ BitVec 32))) )
))
(declare-fun lt!252690 () SeekEntryResult!5218)

(declare-fun lt!252693 () SeekEntryResult!5218)

(declare-datatypes ((array!35010 0))(
  ( (array!35011 (arr!16813 (Array (_ BitVec 32) (_ BitVec 64))) (size!17177 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35010)

(get-info :version)

(assert (=> b!555884 (and (= lt!252693 (Found!5218 j!142)) (or (undefined!6030 lt!252690) (not ((_ is Intermediate!5218) lt!252690)) (= (select (arr!16813 a!3118) (index!23101 lt!252690)) (select (arr!16813 a!3118) j!142)) (not (= (select (arr!16813 a!3118) (index!23101 lt!252690)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252693 (MissingZero!5218 (index!23101 lt!252690)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35010 (_ BitVec 32)) SeekEntryResult!5218)

(assert (=> b!555884 (= lt!252693 (seekEntryOrOpen!0 (select (arr!16813 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35010 (_ BitVec 32)) Bool)

(assert (=> b!555884 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17281 0))(
  ( (Unit!17282) )
))
(declare-fun lt!252692 () Unit!17281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17281)

(assert (=> b!555884 (= lt!252692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555885 () Bool)

(declare-fun res!348191 () Bool)

(declare-fun e!320374 () Bool)

(assert (=> b!555885 (=> (not res!348191) (not e!320374))))

(assert (=> b!555885 (= res!348191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555886 () Bool)

(declare-fun res!348194 () Bool)

(declare-fun e!320376 () Bool)

(assert (=> b!555886 (=> (not res!348194) (not e!320376))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555886 (= res!348194 (validKeyInArray!0 k0!1914))))

(declare-fun res!348192 () Bool)

(assert (=> start!50838 (=> (not res!348192) (not e!320376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50838 (= res!348192 (validMask!0 mask!3119))))

(assert (=> start!50838 e!320376))

(assert (=> start!50838 true))

(declare-fun array_inv!12672 (array!35010) Bool)

(assert (=> start!50838 (array_inv!12672 a!3118)))

(declare-fun b!555887 () Bool)

(declare-fun res!348193 () Bool)

(assert (=> b!555887 (=> (not res!348193) (not e!320376))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555887 (= res!348193 (and (= (size!17177 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17177 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17177 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555888 () Bool)

(declare-fun res!348198 () Bool)

(assert (=> b!555888 (=> (not res!348198) (not e!320374))))

(declare-datatypes ((List!10800 0))(
  ( (Nil!10797) (Cons!10796 (h!11784 (_ BitVec 64)) (t!17020 List!10800)) )
))
(declare-fun arrayNoDuplicates!0 (array!35010 (_ BitVec 32) List!10800) Bool)

(assert (=> b!555888 (= res!348198 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10797))))

(declare-fun b!555889 () Bool)

(assert (=> b!555889 (= e!320374 e!320375)))

(declare-fun res!348199 () Bool)

(assert (=> b!555889 (=> (not res!348199) (not e!320375))))

(declare-fun lt!252694 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35010 (_ BitVec 32)) SeekEntryResult!5218)

(assert (=> b!555889 (= res!348199 (= lt!252690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252694 (select (store (arr!16813 a!3118) i!1132 k0!1914) j!142) (array!35011 (store (arr!16813 a!3118) i!1132 k0!1914) (size!17177 a!3118)) mask!3119)))))

(declare-fun lt!252691 () (_ BitVec 32))

(assert (=> b!555889 (= lt!252690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252691 (select (arr!16813 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555889 (= lt!252694 (toIndex!0 (select (store (arr!16813 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555889 (= lt!252691 (toIndex!0 (select (arr!16813 a!3118) j!142) mask!3119))))

(declare-fun b!555890 () Bool)

(declare-fun res!348195 () Bool)

(assert (=> b!555890 (=> (not res!348195) (not e!320376))))

(declare-fun arrayContainsKey!0 (array!35010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555890 (= res!348195 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555891 () Bool)

(declare-fun res!348197 () Bool)

(assert (=> b!555891 (=> (not res!348197) (not e!320376))))

(assert (=> b!555891 (= res!348197 (validKeyInArray!0 (select (arr!16813 a!3118) j!142)))))

(declare-fun b!555892 () Bool)

(assert (=> b!555892 (= e!320376 e!320374)))

(declare-fun res!348196 () Bool)

(assert (=> b!555892 (=> (not res!348196) (not e!320374))))

(declare-fun lt!252689 () SeekEntryResult!5218)

(assert (=> b!555892 (= res!348196 (or (= lt!252689 (MissingZero!5218 i!1132)) (= lt!252689 (MissingVacant!5218 i!1132))))))

(assert (=> b!555892 (= lt!252689 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50838 res!348192) b!555887))

(assert (= (and b!555887 res!348193) b!555891))

(assert (= (and b!555891 res!348197) b!555886))

(assert (= (and b!555886 res!348194) b!555890))

(assert (= (and b!555890 res!348195) b!555892))

(assert (= (and b!555892 res!348196) b!555885))

(assert (= (and b!555885 res!348191) b!555888))

(assert (= (and b!555888 res!348198) b!555889))

(assert (= (and b!555889 res!348199) b!555884))

(declare-fun m!533807 () Bool)

(assert (=> b!555888 m!533807))

(declare-fun m!533809 () Bool)

(assert (=> start!50838 m!533809))

(declare-fun m!533811 () Bool)

(assert (=> start!50838 m!533811))

(declare-fun m!533813 () Bool)

(assert (=> b!555884 m!533813))

(declare-fun m!533815 () Bool)

(assert (=> b!555884 m!533815))

(declare-fun m!533817 () Bool)

(assert (=> b!555884 m!533817))

(assert (=> b!555884 m!533813))

(declare-fun m!533819 () Bool)

(assert (=> b!555884 m!533819))

(declare-fun m!533821 () Bool)

(assert (=> b!555884 m!533821))

(assert (=> b!555889 m!533813))

(declare-fun m!533823 () Bool)

(assert (=> b!555889 m!533823))

(assert (=> b!555889 m!533813))

(declare-fun m!533825 () Bool)

(assert (=> b!555889 m!533825))

(assert (=> b!555889 m!533813))

(declare-fun m!533827 () Bool)

(assert (=> b!555889 m!533827))

(declare-fun m!533829 () Bool)

(assert (=> b!555889 m!533829))

(assert (=> b!555889 m!533827))

(declare-fun m!533831 () Bool)

(assert (=> b!555889 m!533831))

(assert (=> b!555889 m!533827))

(declare-fun m!533833 () Bool)

(assert (=> b!555889 m!533833))

(declare-fun m!533835 () Bool)

(assert (=> b!555885 m!533835))

(declare-fun m!533837 () Bool)

(assert (=> b!555890 m!533837))

(declare-fun m!533839 () Bool)

(assert (=> b!555886 m!533839))

(assert (=> b!555891 m!533813))

(assert (=> b!555891 m!533813))

(declare-fun m!533841 () Bool)

(assert (=> b!555891 m!533841))

(declare-fun m!533843 () Bool)

(assert (=> b!555892 m!533843))

(check-sat (not b!555886) (not start!50838) (not b!555884) (not b!555889) (not b!555888) (not b!555891) (not b!555885) (not b!555892) (not b!555890))
(check-sat)
