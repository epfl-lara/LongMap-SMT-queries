; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51438 () Bool)

(assert start!51438)

(declare-fun res!353394 () Bool)

(declare-fun e!324014 () Bool)

(assert (=> start!51438 (=> (not res!353394) (not e!324014))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51438 (= res!353394 (validMask!0 mask!3119))))

(assert (=> start!51438 e!324014))

(assert (=> start!51438 true))

(declare-datatypes ((array!35303 0))(
  ( (array!35304 (arr!16952 (Array (_ BitVec 32) (_ BitVec 64))) (size!17316 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35303)

(declare-fun array_inv!12748 (array!35303) Bool)

(assert (=> start!51438 (array_inv!12748 a!3118)))

(declare-fun b!562232 () Bool)

(declare-fun res!353392 () Bool)

(declare-fun e!324010 () Bool)

(assert (=> b!562232 (=> (not res!353392) (not e!324010))))

(declare-datatypes ((List!11032 0))(
  ( (Nil!11029) (Cons!11028 (h!12031 (_ BitVec 64)) (t!17260 List!11032)) )
))
(declare-fun arrayNoDuplicates!0 (array!35303 (_ BitVec 32) List!11032) Bool)

(assert (=> b!562232 (= res!353392 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11029))))

(declare-datatypes ((SeekEntryResult!5401 0))(
  ( (MissingZero!5401 (index!23831 (_ BitVec 32))) (Found!5401 (index!23832 (_ BitVec 32))) (Intermediate!5401 (undefined!6213 Bool) (index!23833 (_ BitVec 32)) (x!52728 (_ BitVec 32))) (Undefined!5401) (MissingVacant!5401 (index!23834 (_ BitVec 32))) )
))
(declare-fun lt!256058 () SeekEntryResult!5401)

(declare-fun e!324013 () Bool)

(declare-fun b!562233 () Bool)

(declare-fun lt!256062 () (_ BitVec 64))

(declare-fun lt!256065 () array!35303)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35303 (_ BitVec 32)) SeekEntryResult!5401)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35303 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!562233 (= e!324013 (= (seekEntryOrOpen!0 lt!256062 lt!256065 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52728 lt!256058) (index!23833 lt!256058) (index!23833 lt!256058) lt!256062 lt!256065 mask!3119)))))

(declare-fun b!562234 () Bool)

(declare-fun e!324015 () Bool)

(declare-fun e!324008 () Bool)

(assert (=> b!562234 (= e!324015 e!324008)))

(declare-fun res!353385 () Bool)

(assert (=> b!562234 (=> res!353385 e!324008)))

(assert (=> b!562234 (= res!353385 (or (undefined!6213 lt!256058) (not (is-Intermediate!5401 lt!256058))))))

(declare-fun b!562235 () Bool)

(declare-fun res!353395 () Bool)

(assert (=> b!562235 (=> (not res!353395) (not e!324014))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562235 (= res!353395 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562236 () Bool)

(declare-fun res!353393 () Bool)

(assert (=> b!562236 (=> (not res!353393) (not e!324014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562236 (= res!353393 (validKeyInArray!0 k!1914))))

(declare-fun b!562237 () Bool)

(declare-fun res!353389 () Bool)

(assert (=> b!562237 (=> (not res!353389) (not e!324014))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562237 (= res!353389 (validKeyInArray!0 (select (arr!16952 a!3118) j!142)))))

(declare-fun b!562238 () Bool)

(declare-fun res!353391 () Bool)

(assert (=> b!562238 (=> (not res!353391) (not e!324014))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562238 (= res!353391 (and (= (size!17316 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17316 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17316 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562239 () Bool)

(declare-fun e!324009 () Bool)

(assert (=> b!562239 (= e!324010 e!324009)))

(declare-fun res!353388 () Bool)

(assert (=> b!562239 (=> (not res!353388) (not e!324009))))

(declare-fun lt!256064 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35303 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!562239 (= res!353388 (= lt!256058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256064 lt!256062 lt!256065 mask!3119)))))

(declare-fun lt!256061 () (_ BitVec 32))

(assert (=> b!562239 (= lt!256058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256061 (select (arr!16952 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562239 (= lt!256064 (toIndex!0 lt!256062 mask!3119))))

(assert (=> b!562239 (= lt!256062 (select (store (arr!16952 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562239 (= lt!256061 (toIndex!0 (select (arr!16952 a!3118) j!142) mask!3119))))

(assert (=> b!562239 (= lt!256065 (array!35304 (store (arr!16952 a!3118) i!1132 k!1914) (size!17316 a!3118)))))

(declare-fun b!562240 () Bool)

(declare-fun e!324012 () Bool)

(assert (=> b!562240 (= e!324012 e!324013)))

(declare-fun res!353384 () Bool)

(assert (=> b!562240 (=> (not res!353384) (not e!324013))))

(declare-fun lt!256059 () SeekEntryResult!5401)

(assert (=> b!562240 (= res!353384 (= lt!256059 (seekKeyOrZeroReturnVacant!0 (x!52728 lt!256058) (index!23833 lt!256058) (index!23833 lt!256058) (select (arr!16952 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562241 () Bool)

(assert (=> b!562241 (= e!324009 (not true))))

(assert (=> b!562241 e!324015))

(declare-fun res!353386 () Bool)

(assert (=> b!562241 (=> (not res!353386) (not e!324015))))

(assert (=> b!562241 (= res!353386 (= lt!256059 (Found!5401 j!142)))))

(assert (=> b!562241 (= lt!256059 (seekEntryOrOpen!0 (select (arr!16952 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35303 (_ BitVec 32)) Bool)

(assert (=> b!562241 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17576 0))(
  ( (Unit!17577) )
))
(declare-fun lt!256060 () Unit!17576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17576)

(assert (=> b!562241 (= lt!256060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562242 () Bool)

(declare-fun res!353387 () Bool)

(assert (=> b!562242 (=> (not res!353387) (not e!324010))))

(assert (=> b!562242 (= res!353387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562243 () Bool)

(assert (=> b!562243 (= e!324014 e!324010)))

(declare-fun res!353390 () Bool)

(assert (=> b!562243 (=> (not res!353390) (not e!324010))))

(declare-fun lt!256066 () SeekEntryResult!5401)

(assert (=> b!562243 (= res!353390 (or (= lt!256066 (MissingZero!5401 i!1132)) (= lt!256066 (MissingVacant!5401 i!1132))))))

(assert (=> b!562243 (= lt!256066 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562244 () Bool)

(assert (=> b!562244 (= e!324008 e!324012)))

(declare-fun res!353396 () Bool)

(assert (=> b!562244 (=> res!353396 e!324012)))

(declare-fun lt!256063 () (_ BitVec 64))

(assert (=> b!562244 (= res!353396 (or (= lt!256063 (select (arr!16952 a!3118) j!142)) (= lt!256063 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562244 (= lt!256063 (select (arr!16952 a!3118) (index!23833 lt!256058)))))

(assert (= (and start!51438 res!353394) b!562238))

(assert (= (and b!562238 res!353391) b!562237))

(assert (= (and b!562237 res!353389) b!562236))

(assert (= (and b!562236 res!353393) b!562235))

(assert (= (and b!562235 res!353395) b!562243))

(assert (= (and b!562243 res!353390) b!562242))

(assert (= (and b!562242 res!353387) b!562232))

(assert (= (and b!562232 res!353392) b!562239))

(assert (= (and b!562239 res!353388) b!562241))

(assert (= (and b!562241 res!353386) b!562234))

(assert (= (and b!562234 (not res!353385)) b!562244))

(assert (= (and b!562244 (not res!353396)) b!562240))

(assert (= (and b!562240 res!353384) b!562233))

(declare-fun m!540229 () Bool)

(assert (=> b!562240 m!540229))

(assert (=> b!562240 m!540229))

(declare-fun m!540231 () Bool)

(assert (=> b!562240 m!540231))

(assert (=> b!562239 m!540229))

(declare-fun m!540233 () Bool)

(assert (=> b!562239 m!540233))

(assert (=> b!562239 m!540229))

(declare-fun m!540235 () Bool)

(assert (=> b!562239 m!540235))

(declare-fun m!540237 () Bool)

(assert (=> b!562239 m!540237))

(declare-fun m!540239 () Bool)

(assert (=> b!562239 m!540239))

(declare-fun m!540241 () Bool)

(assert (=> b!562239 m!540241))

(assert (=> b!562239 m!540229))

(declare-fun m!540243 () Bool)

(assert (=> b!562239 m!540243))

(declare-fun m!540245 () Bool)

(assert (=> start!51438 m!540245))

(declare-fun m!540247 () Bool)

(assert (=> start!51438 m!540247))

(declare-fun m!540249 () Bool)

(assert (=> b!562233 m!540249))

(declare-fun m!540251 () Bool)

(assert (=> b!562233 m!540251))

(declare-fun m!540253 () Bool)

(assert (=> b!562235 m!540253))

(declare-fun m!540255 () Bool)

(assert (=> b!562236 m!540255))

(assert (=> b!562244 m!540229))

(declare-fun m!540257 () Bool)

(assert (=> b!562244 m!540257))

(assert (=> b!562237 m!540229))

(assert (=> b!562237 m!540229))

(declare-fun m!540259 () Bool)

(assert (=> b!562237 m!540259))

(declare-fun m!540261 () Bool)

(assert (=> b!562242 m!540261))

(assert (=> b!562241 m!540229))

(assert (=> b!562241 m!540229))

(declare-fun m!540263 () Bool)

(assert (=> b!562241 m!540263))

(declare-fun m!540265 () Bool)

(assert (=> b!562241 m!540265))

(declare-fun m!540267 () Bool)

(assert (=> b!562241 m!540267))

(declare-fun m!540269 () Bool)

(assert (=> b!562243 m!540269))

(declare-fun m!540271 () Bool)

(assert (=> b!562232 m!540271))

(push 1)

