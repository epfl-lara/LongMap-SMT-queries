; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50672 () Bool)

(assert start!50672)

(declare-fun b!554003 () Bool)

(declare-fun res!346416 () Bool)

(declare-fun e!319500 () Bool)

(assert (=> b!554003 (=> (not res!346416) (not e!319500))))

(declare-datatypes ((array!34897 0))(
  ( (array!34898 (arr!16758 (Array (_ BitVec 32) (_ BitVec 64))) (size!17122 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34897)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554003 (= res!346416 (validKeyInArray!0 (select (arr!16758 a!3118) j!142)))))

(declare-fun b!554004 () Bool)

(declare-fun res!346419 () Bool)

(declare-fun e!319497 () Bool)

(assert (=> b!554004 (=> (not res!346419) (not e!319497))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5207 0))(
  ( (MissingZero!5207 (index!23055 (_ BitVec 32))) (Found!5207 (index!23056 (_ BitVec 32))) (Intermediate!5207 (undefined!6019 Bool) (index!23057 (_ BitVec 32)) (x!51977 (_ BitVec 32))) (Undefined!5207) (MissingVacant!5207 (index!23058 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34897 (_ BitVec 32)) SeekEntryResult!5207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554004 (= res!346419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16758 a!3118) j!142) mask!3119) (select (arr!16758 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16758 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16758 a!3118) i!1132 k!1914) j!142) (array!34898 (store (arr!16758 a!3118) i!1132 k!1914) (size!17122 a!3118)) mask!3119)))))

(declare-fun b!554005 () Bool)

(declare-fun res!346420 () Bool)

(assert (=> b!554005 (=> (not res!346420) (not e!319497))))

(declare-datatypes ((List!10838 0))(
  ( (Nil!10835) (Cons!10834 (h!11819 (_ BitVec 64)) (t!17066 List!10838)) )
))
(declare-fun arrayNoDuplicates!0 (array!34897 (_ BitVec 32) List!10838) Bool)

(assert (=> b!554005 (= res!346420 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10835))))

(declare-fun b!554006 () Bool)

(declare-fun res!346417 () Bool)

(assert (=> b!554006 (=> (not res!346417) (not e!319500))))

(assert (=> b!554006 (= res!346417 (and (= (size!17122 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17122 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17122 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554007 () Bool)

(declare-fun e!319499 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34897 (_ BitVec 32)) SeekEntryResult!5207)

(assert (=> b!554007 (= e!319499 (= (seekEntryOrOpen!0 (select (arr!16758 a!3118) j!142) a!3118 mask!3119) (Found!5207 j!142)))))

(declare-fun b!554008 () Bool)

(assert (=> b!554008 (= e!319497 (not true))))

(assert (=> b!554008 e!319499))

(declare-fun res!346415 () Bool)

(assert (=> b!554008 (=> (not res!346415) (not e!319499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34897 (_ BitVec 32)) Bool)

(assert (=> b!554008 (= res!346415 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17188 0))(
  ( (Unit!17189) )
))
(declare-fun lt!251652 () Unit!17188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17188)

(assert (=> b!554008 (= lt!251652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554009 () Bool)

(declare-fun res!346424 () Bool)

(assert (=> b!554009 (=> (not res!346424) (not e!319500))))

(declare-fun arrayContainsKey!0 (array!34897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554009 (= res!346424 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346418 () Bool)

(assert (=> start!50672 (=> (not res!346418) (not e!319500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50672 (= res!346418 (validMask!0 mask!3119))))

(assert (=> start!50672 e!319500))

(assert (=> start!50672 true))

(declare-fun array_inv!12554 (array!34897) Bool)

(assert (=> start!50672 (array_inv!12554 a!3118)))

(declare-fun b!554010 () Bool)

(declare-fun res!346423 () Bool)

(assert (=> b!554010 (=> (not res!346423) (not e!319500))))

(assert (=> b!554010 (= res!346423 (validKeyInArray!0 k!1914))))

(declare-fun b!554011 () Bool)

(assert (=> b!554011 (= e!319500 e!319497)))

(declare-fun res!346422 () Bool)

(assert (=> b!554011 (=> (not res!346422) (not e!319497))))

(declare-fun lt!251653 () SeekEntryResult!5207)

(assert (=> b!554011 (= res!346422 (or (= lt!251653 (MissingZero!5207 i!1132)) (= lt!251653 (MissingVacant!5207 i!1132))))))

(assert (=> b!554011 (= lt!251653 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554012 () Bool)

(declare-fun res!346421 () Bool)

(assert (=> b!554012 (=> (not res!346421) (not e!319497))))

(assert (=> b!554012 (= res!346421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50672 res!346418) b!554006))

(assert (= (and b!554006 res!346417) b!554003))

(assert (= (and b!554003 res!346416) b!554010))

(assert (= (and b!554010 res!346423) b!554009))

(assert (= (and b!554009 res!346424) b!554011))

(assert (= (and b!554011 res!346422) b!554012))

(assert (= (and b!554012 res!346421) b!554005))

(assert (= (and b!554005 res!346420) b!554004))

(assert (= (and b!554004 res!346419) b!554008))

(assert (= (and b!554008 res!346415) b!554007))

(declare-fun m!531207 () Bool)

(assert (=> b!554009 m!531207))

(declare-fun m!531209 () Bool)

(assert (=> b!554007 m!531209))

(assert (=> b!554007 m!531209))

(declare-fun m!531211 () Bool)

(assert (=> b!554007 m!531211))

(assert (=> b!554004 m!531209))

(declare-fun m!531213 () Bool)

(assert (=> b!554004 m!531213))

(assert (=> b!554004 m!531209))

(declare-fun m!531215 () Bool)

(assert (=> b!554004 m!531215))

(declare-fun m!531217 () Bool)

(assert (=> b!554004 m!531217))

(assert (=> b!554004 m!531215))

(declare-fun m!531219 () Bool)

(assert (=> b!554004 m!531219))

(assert (=> b!554004 m!531213))

(assert (=> b!554004 m!531209))

(declare-fun m!531221 () Bool)

(assert (=> b!554004 m!531221))

(declare-fun m!531223 () Bool)

(assert (=> b!554004 m!531223))

(assert (=> b!554004 m!531215))

(assert (=> b!554004 m!531217))

(declare-fun m!531225 () Bool)

(assert (=> b!554010 m!531225))

(declare-fun m!531227 () Bool)

(assert (=> start!50672 m!531227))

(declare-fun m!531229 () Bool)

(assert (=> start!50672 m!531229))

(declare-fun m!531231 () Bool)

(assert (=> b!554005 m!531231))

(assert (=> b!554003 m!531209))

(assert (=> b!554003 m!531209))

(declare-fun m!531233 () Bool)

(assert (=> b!554003 m!531233))

(declare-fun m!531235 () Bool)

(assert (=> b!554008 m!531235))

(declare-fun m!531237 () Bool)

(assert (=> b!554008 m!531237))

(declare-fun m!531239 () Bool)

(assert (=> b!554012 m!531239))

(declare-fun m!531241 () Bool)

(assert (=> b!554011 m!531241))

(push 1)

