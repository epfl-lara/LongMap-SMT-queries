; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50666 () Bool)

(assert start!50666)

(declare-fun res!346328 () Bool)

(declare-fun e!319456 () Bool)

(assert (=> start!50666 (=> (not res!346328) (not e!319456))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50666 (= res!346328 (validMask!0 mask!3119))))

(assert (=> start!50666 e!319456))

(assert (=> start!50666 true))

(declare-datatypes ((array!34891 0))(
  ( (array!34892 (arr!16755 (Array (_ BitVec 32) (_ BitVec 64))) (size!17119 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34891)

(declare-fun array_inv!12551 (array!34891) Bool)

(assert (=> start!50666 (array_inv!12551 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553913 () Bool)

(declare-fun e!319457 () Bool)

(declare-datatypes ((SeekEntryResult!5204 0))(
  ( (MissingZero!5204 (index!23043 (_ BitVec 32))) (Found!5204 (index!23044 (_ BitVec 32))) (Intermediate!5204 (undefined!6016 Bool) (index!23045 (_ BitVec 32)) (x!51966 (_ BitVec 32))) (Undefined!5204) (MissingVacant!5204 (index!23046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34891 (_ BitVec 32)) SeekEntryResult!5204)

(assert (=> b!553913 (= e!319457 (= (seekEntryOrOpen!0 (select (arr!16755 a!3118) j!142) a!3118 mask!3119) (Found!5204 j!142)))))

(declare-fun b!553914 () Bool)

(declare-fun res!346332 () Bool)

(assert (=> b!553914 (=> (not res!346332) (not e!319456))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553914 (= res!346332 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553915 () Bool)

(declare-fun res!346330 () Bool)

(declare-fun e!319458 () Bool)

(assert (=> b!553915 (=> (not res!346330) (not e!319458))))

(declare-datatypes ((List!10835 0))(
  ( (Nil!10832) (Cons!10831 (h!11816 (_ BitVec 64)) (t!17063 List!10835)) )
))
(declare-fun arrayNoDuplicates!0 (array!34891 (_ BitVec 32) List!10835) Bool)

(assert (=> b!553915 (= res!346330 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10832))))

(declare-fun b!553916 () Bool)

(declare-fun e!319455 () Bool)

(declare-fun lt!251615 () SeekEntryResult!5204)

(assert (=> b!553916 (= e!319455 (not (or (not (is-Intermediate!5204 lt!251615)) (undefined!6016 lt!251615) (not (= (select (arr!16755 a!3118) (index!23045 lt!251615)) (select (arr!16755 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553916 e!319457))

(declare-fun res!346334 () Bool)

(assert (=> b!553916 (=> (not res!346334) (not e!319457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34891 (_ BitVec 32)) Bool)

(assert (=> b!553916 (= res!346334 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17182 0))(
  ( (Unit!17183) )
))
(declare-fun lt!251617 () Unit!17182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17182)

(assert (=> b!553916 (= lt!251617 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553917 () Bool)

(assert (=> b!553917 (= e!319456 e!319458)))

(declare-fun res!346325 () Bool)

(assert (=> b!553917 (=> (not res!346325) (not e!319458))))

(declare-fun lt!251614 () SeekEntryResult!5204)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553917 (= res!346325 (or (= lt!251614 (MissingZero!5204 i!1132)) (= lt!251614 (MissingVacant!5204 i!1132))))))

(assert (=> b!553917 (= lt!251614 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553918 () Bool)

(declare-fun res!346333 () Bool)

(assert (=> b!553918 (=> (not res!346333) (not e!319458))))

(assert (=> b!553918 (= res!346333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553919 () Bool)

(declare-fun res!346329 () Bool)

(assert (=> b!553919 (=> (not res!346329) (not e!319456))))

(assert (=> b!553919 (= res!346329 (and (= (size!17119 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17119 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17119 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553920 () Bool)

(declare-fun res!346327 () Bool)

(assert (=> b!553920 (=> (not res!346327) (not e!319456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553920 (= res!346327 (validKeyInArray!0 k!1914))))

(declare-fun b!553921 () Bool)

(declare-fun res!346326 () Bool)

(assert (=> b!553921 (=> (not res!346326) (not e!319456))))

(assert (=> b!553921 (= res!346326 (validKeyInArray!0 (select (arr!16755 a!3118) j!142)))))

(declare-fun b!553922 () Bool)

(assert (=> b!553922 (= e!319458 e!319455)))

(declare-fun res!346331 () Bool)

(assert (=> b!553922 (=> (not res!346331) (not e!319455))))

(declare-fun lt!251613 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34891 (_ BitVec 32)) SeekEntryResult!5204)

(assert (=> b!553922 (= res!346331 (= lt!251615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251613 (select (store (arr!16755 a!3118) i!1132 k!1914) j!142) (array!34892 (store (arr!16755 a!3118) i!1132 k!1914) (size!17119 a!3118)) mask!3119)))))

(declare-fun lt!251616 () (_ BitVec 32))

(assert (=> b!553922 (= lt!251615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251616 (select (arr!16755 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553922 (= lt!251613 (toIndex!0 (select (store (arr!16755 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553922 (= lt!251616 (toIndex!0 (select (arr!16755 a!3118) j!142) mask!3119))))

(assert (= (and start!50666 res!346328) b!553919))

(assert (= (and b!553919 res!346329) b!553921))

(assert (= (and b!553921 res!346326) b!553920))

(assert (= (and b!553920 res!346327) b!553914))

(assert (= (and b!553914 res!346332) b!553917))

(assert (= (and b!553917 res!346325) b!553918))

(assert (= (and b!553918 res!346333) b!553915))

(assert (= (and b!553915 res!346330) b!553922))

(assert (= (and b!553922 res!346331) b!553916))

(assert (= (and b!553916 res!346334) b!553913))

(declare-fun m!531093 () Bool)

(assert (=> b!553920 m!531093))

(declare-fun m!531095 () Bool)

(assert (=> b!553915 m!531095))

(declare-fun m!531097 () Bool)

(assert (=> b!553913 m!531097))

(assert (=> b!553913 m!531097))

(declare-fun m!531099 () Bool)

(assert (=> b!553913 m!531099))

(declare-fun m!531101 () Bool)

(assert (=> start!50666 m!531101))

(declare-fun m!531103 () Bool)

(assert (=> start!50666 m!531103))

(declare-fun m!531105 () Bool)

(assert (=> b!553917 m!531105))

(assert (=> b!553921 m!531097))

(assert (=> b!553921 m!531097))

(declare-fun m!531107 () Bool)

(assert (=> b!553921 m!531107))

(declare-fun m!531109 () Bool)

(assert (=> b!553918 m!531109))

(declare-fun m!531111 () Bool)

(assert (=> b!553916 m!531111))

(assert (=> b!553916 m!531097))

(declare-fun m!531113 () Bool)

(assert (=> b!553916 m!531113))

(declare-fun m!531115 () Bool)

(assert (=> b!553916 m!531115))

(declare-fun m!531117 () Bool)

(assert (=> b!553914 m!531117))

(assert (=> b!553922 m!531097))

(declare-fun m!531119 () Bool)

(assert (=> b!553922 m!531119))

(declare-fun m!531121 () Bool)

(assert (=> b!553922 m!531121))

(declare-fun m!531123 () Bool)

(assert (=> b!553922 m!531123))

(assert (=> b!553922 m!531097))

(assert (=> b!553922 m!531121))

(assert (=> b!553922 m!531097))

(declare-fun m!531125 () Bool)

(assert (=> b!553922 m!531125))

(declare-fun m!531127 () Bool)

(assert (=> b!553922 m!531127))

(assert (=> b!553922 m!531121))

(declare-fun m!531129 () Bool)

(assert (=> b!553922 m!531129))

(push 1)

