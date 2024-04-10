; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50780 () Bool)

(assert start!50780)

(declare-fun b!555522 () Bool)

(declare-fun res!347937 () Bool)

(declare-fun e!320172 () Bool)

(assert (=> b!555522 (=> (not res!347937) (not e!320172))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555522 (= res!347937 (validKeyInArray!0 k!1914))))

(declare-fun b!555523 () Bool)

(declare-fun res!347938 () Bool)

(declare-fun e!320175 () Bool)

(assert (=> b!555523 (=> (not res!347938) (not e!320175))))

(declare-datatypes ((array!35005 0))(
  ( (array!35006 (arr!16812 (Array (_ BitVec 32) (_ BitVec 64))) (size!17176 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35005)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35005 (_ BitVec 32)) Bool)

(assert (=> b!555523 (= res!347938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555524 () Bool)

(declare-fun res!347936 () Bool)

(assert (=> b!555524 (=> (not res!347936) (not e!320172))))

(declare-fun arrayContainsKey!0 (array!35005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555524 (= res!347936 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555525 () Bool)

(declare-fun e!320173 () Bool)

(assert (=> b!555525 (= e!320173 (not true))))

(declare-datatypes ((SeekEntryResult!5261 0))(
  ( (MissingZero!5261 (index!23271 (_ BitVec 32))) (Found!5261 (index!23272 (_ BitVec 32))) (Intermediate!5261 (undefined!6073 Bool) (index!23273 (_ BitVec 32)) (x!52175 (_ BitVec 32))) (Undefined!5261) (MissingVacant!5261 (index!23274 (_ BitVec 32))) )
))
(declare-fun lt!252470 () SeekEntryResult!5261)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252474 () SeekEntryResult!5261)

(assert (=> b!555525 (and (= lt!252470 (Found!5261 j!142)) (or (undefined!6073 lt!252474) (not (is-Intermediate!5261 lt!252474)) (= (select (arr!16812 a!3118) (index!23273 lt!252474)) (select (arr!16812 a!3118) j!142)) (not (= (select (arr!16812 a!3118) (index!23273 lt!252474)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252470 (MissingZero!5261 (index!23273 lt!252474)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35005 (_ BitVec 32)) SeekEntryResult!5261)

(assert (=> b!555525 (= lt!252470 (seekEntryOrOpen!0 (select (arr!16812 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555525 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17296 0))(
  ( (Unit!17297) )
))
(declare-fun lt!252471 () Unit!17296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17296)

(assert (=> b!555525 (= lt!252471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555526 () Bool)

(assert (=> b!555526 (= e!320175 e!320173)))

(declare-fun res!347939 () Bool)

(assert (=> b!555526 (=> (not res!347939) (not e!320173))))

(declare-fun lt!252475 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35005 (_ BitVec 32)) SeekEntryResult!5261)

(assert (=> b!555526 (= res!347939 (= lt!252474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252475 (select (store (arr!16812 a!3118) i!1132 k!1914) j!142) (array!35006 (store (arr!16812 a!3118) i!1132 k!1914) (size!17176 a!3118)) mask!3119)))))

(declare-fun lt!252472 () (_ BitVec 32))

(assert (=> b!555526 (= lt!252474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252472 (select (arr!16812 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555526 (= lt!252475 (toIndex!0 (select (store (arr!16812 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555526 (= lt!252472 (toIndex!0 (select (arr!16812 a!3118) j!142) mask!3119))))

(declare-fun b!555527 () Bool)

(declare-fun res!347940 () Bool)

(assert (=> b!555527 (=> (not res!347940) (not e!320175))))

(declare-datatypes ((List!10892 0))(
  ( (Nil!10889) (Cons!10888 (h!11873 (_ BitVec 64)) (t!17120 List!10892)) )
))
(declare-fun arrayNoDuplicates!0 (array!35005 (_ BitVec 32) List!10892) Bool)

(assert (=> b!555527 (= res!347940 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10889))))

(declare-fun b!555528 () Bool)

(declare-fun res!347935 () Bool)

(assert (=> b!555528 (=> (not res!347935) (not e!320172))))

(assert (=> b!555528 (= res!347935 (and (= (size!17176 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17176 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17176 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555530 () Bool)

(assert (=> b!555530 (= e!320172 e!320175)))

(declare-fun res!347941 () Bool)

(assert (=> b!555530 (=> (not res!347941) (not e!320175))))

(declare-fun lt!252473 () SeekEntryResult!5261)

(assert (=> b!555530 (= res!347941 (or (= lt!252473 (MissingZero!5261 i!1132)) (= lt!252473 (MissingVacant!5261 i!1132))))))

(assert (=> b!555530 (= lt!252473 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!347934 () Bool)

(assert (=> start!50780 (=> (not res!347934) (not e!320172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50780 (= res!347934 (validMask!0 mask!3119))))

(assert (=> start!50780 e!320172))

(assert (=> start!50780 true))

(declare-fun array_inv!12608 (array!35005) Bool)

(assert (=> start!50780 (array_inv!12608 a!3118)))

(declare-fun b!555529 () Bool)

(declare-fun res!347942 () Bool)

(assert (=> b!555529 (=> (not res!347942) (not e!320172))))

(assert (=> b!555529 (= res!347942 (validKeyInArray!0 (select (arr!16812 a!3118) j!142)))))

(assert (= (and start!50780 res!347934) b!555528))

(assert (= (and b!555528 res!347935) b!555529))

(assert (= (and b!555529 res!347942) b!555522))

(assert (= (and b!555522 res!347937) b!555524))

(assert (= (and b!555524 res!347936) b!555530))

(assert (= (and b!555530 res!347941) b!555523))

(assert (= (and b!555523 res!347938) b!555527))

(assert (= (and b!555527 res!347940) b!555526))

(assert (= (and b!555526 res!347939) b!555525))

(declare-fun m!533241 () Bool)

(assert (=> b!555522 m!533241))

(declare-fun m!533243 () Bool)

(assert (=> b!555527 m!533243))

(declare-fun m!533245 () Bool)

(assert (=> b!555525 m!533245))

(declare-fun m!533247 () Bool)

(assert (=> b!555525 m!533247))

(declare-fun m!533249 () Bool)

(assert (=> b!555525 m!533249))

(declare-fun m!533251 () Bool)

(assert (=> b!555525 m!533251))

(assert (=> b!555525 m!533245))

(declare-fun m!533253 () Bool)

(assert (=> b!555525 m!533253))

(declare-fun m!533255 () Bool)

(assert (=> start!50780 m!533255))

(declare-fun m!533257 () Bool)

(assert (=> start!50780 m!533257))

(declare-fun m!533259 () Bool)

(assert (=> b!555524 m!533259))

(declare-fun m!533261 () Bool)

(assert (=> b!555530 m!533261))

(declare-fun m!533263 () Bool)

(assert (=> b!555523 m!533263))

(assert (=> b!555529 m!533245))

(assert (=> b!555529 m!533245))

(declare-fun m!533265 () Bool)

(assert (=> b!555529 m!533265))

(assert (=> b!555526 m!533245))

(declare-fun m!533267 () Bool)

(assert (=> b!555526 m!533267))

(assert (=> b!555526 m!533245))

(declare-fun m!533269 () Bool)

(assert (=> b!555526 m!533269))

(assert (=> b!555526 m!533245))

(declare-fun m!533271 () Bool)

(assert (=> b!555526 m!533271))

(assert (=> b!555526 m!533271))

(declare-fun m!533273 () Bool)

(assert (=> b!555526 m!533273))

(assert (=> b!555526 m!533271))

(declare-fun m!533275 () Bool)

(assert (=> b!555526 m!533275))

(declare-fun m!533277 () Bool)

(assert (=> b!555526 m!533277))

(push 1)

