; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51612 () Bool)

(assert start!51612)

(declare-fun b!564819 () Bool)

(declare-fun res!355979 () Bool)

(declare-fun e!325257 () Bool)

(assert (=> b!564819 (=> (not res!355979) (not e!325257))))

(declare-datatypes ((array!35477 0))(
  ( (array!35478 (arr!17039 (Array (_ BitVec 32) (_ BitVec 64))) (size!17403 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35477)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35477 (_ BitVec 32)) Bool)

(assert (=> b!564819 (= res!355979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564820 () Bool)

(declare-fun res!355977 () Bool)

(declare-fun e!325256 () Bool)

(assert (=> b!564820 (=> (not res!355977) (not e!325256))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564820 (= res!355977 (validKeyInArray!0 k!1914))))

(declare-fun b!564822 () Bool)

(declare-fun res!355971 () Bool)

(assert (=> b!564822 (=> (not res!355971) (not e!325257))))

(declare-datatypes ((List!11119 0))(
  ( (Nil!11116) (Cons!11115 (h!12118 (_ BitVec 64)) (t!17347 List!11119)) )
))
(declare-fun arrayNoDuplicates!0 (array!35477 (_ BitVec 32) List!11119) Bool)

(assert (=> b!564822 (= res!355971 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11116))))

(declare-fun b!564823 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564823 (= e!325257 (and (bvsle #b00000000000000000000000000000000 (size!17403 a!3118)) (bvsgt j!142 (size!17403 a!3118))))))

(declare-fun b!564824 () Bool)

(declare-fun res!355974 () Bool)

(assert (=> b!564824 (=> (not res!355974) (not e!325256))))

(declare-fun arrayContainsKey!0 (array!35477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564824 (= res!355974 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564825 () Bool)

(declare-fun res!355975 () Bool)

(assert (=> b!564825 (=> (not res!355975) (not e!325256))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564825 (= res!355975 (and (= (size!17403 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17403 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17403 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564826 () Bool)

(declare-fun res!355976 () Bool)

(assert (=> b!564826 (=> (not res!355976) (not e!325256))))

(assert (=> b!564826 (= res!355976 (validKeyInArray!0 (select (arr!17039 a!3118) j!142)))))

(declare-fun b!564827 () Bool)

(declare-fun res!355972 () Bool)

(assert (=> b!564827 (=> (not res!355972) (not e!325257))))

(declare-datatypes ((SeekEntryResult!5488 0))(
  ( (MissingZero!5488 (index!24179 (_ BitVec 32))) (Found!5488 (index!24180 (_ BitVec 32))) (Intermediate!5488 (undefined!6300 Bool) (index!24181 (_ BitVec 32)) (x!53047 (_ BitVec 32))) (Undefined!5488) (MissingVacant!5488 (index!24182 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35477 (_ BitVec 32)) SeekEntryResult!5488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564827 (= res!355972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17039 a!3118) j!142) mask!3119) (select (arr!17039 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17039 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17039 a!3118) i!1132 k!1914) j!142) (array!35478 (store (arr!17039 a!3118) i!1132 k!1914) (size!17403 a!3118)) mask!3119)))))

(declare-fun b!564821 () Bool)

(assert (=> b!564821 (= e!325256 e!325257)))

(declare-fun res!355978 () Bool)

(assert (=> b!564821 (=> (not res!355978) (not e!325257))))

(declare-fun lt!257659 () SeekEntryResult!5488)

(assert (=> b!564821 (= res!355978 (or (= lt!257659 (MissingZero!5488 i!1132)) (= lt!257659 (MissingVacant!5488 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35477 (_ BitVec 32)) SeekEntryResult!5488)

(assert (=> b!564821 (= lt!257659 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!355973 () Bool)

(assert (=> start!51612 (=> (not res!355973) (not e!325256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51612 (= res!355973 (validMask!0 mask!3119))))

(assert (=> start!51612 e!325256))

(assert (=> start!51612 true))

(declare-fun array_inv!12835 (array!35477) Bool)

(assert (=> start!51612 (array_inv!12835 a!3118)))

(assert (= (and start!51612 res!355973) b!564825))

(assert (= (and b!564825 res!355975) b!564826))

(assert (= (and b!564826 res!355976) b!564820))

(assert (= (and b!564820 res!355977) b!564824))

(assert (= (and b!564824 res!355974) b!564821))

(assert (= (and b!564821 res!355978) b!564819))

(assert (= (and b!564819 res!355979) b!564822))

(assert (= (and b!564822 res!355971) b!564827))

(assert (= (and b!564827 res!355972) b!564823))

(declare-fun m!543291 () Bool)

(assert (=> b!564820 m!543291))

(declare-fun m!543293 () Bool)

(assert (=> b!564826 m!543293))

(assert (=> b!564826 m!543293))

(declare-fun m!543295 () Bool)

(assert (=> b!564826 m!543295))

(declare-fun m!543297 () Bool)

(assert (=> b!564824 m!543297))

(declare-fun m!543299 () Bool)

(assert (=> b!564819 m!543299))

(declare-fun m!543301 () Bool)

(assert (=> start!51612 m!543301))

(declare-fun m!543303 () Bool)

(assert (=> start!51612 m!543303))

(declare-fun m!543305 () Bool)

(assert (=> b!564822 m!543305))

(assert (=> b!564827 m!543293))

(declare-fun m!543307 () Bool)

(assert (=> b!564827 m!543307))

(assert (=> b!564827 m!543293))

(declare-fun m!543309 () Bool)

(assert (=> b!564827 m!543309))

(declare-fun m!543311 () Bool)

(assert (=> b!564827 m!543311))

(assert (=> b!564827 m!543309))

(declare-fun m!543313 () Bool)

(assert (=> b!564827 m!543313))

(assert (=> b!564827 m!543307))

(assert (=> b!564827 m!543293))

(declare-fun m!543315 () Bool)

(assert (=> b!564827 m!543315))

(declare-fun m!543317 () Bool)

(assert (=> b!564827 m!543317))

(assert (=> b!564827 m!543309))

(assert (=> b!564827 m!543311))

(declare-fun m!543319 () Bool)

(assert (=> b!564821 m!543319))

(push 1)

(assert (not start!51612))

(assert (not b!564827))

(assert (not b!564826))

(assert (not b!564819))

(assert (not b!564820))

(assert (not b!564822))

(assert (not b!564821))

(assert (not b!564824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

