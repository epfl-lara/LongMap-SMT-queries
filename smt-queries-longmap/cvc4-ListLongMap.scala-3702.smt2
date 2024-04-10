; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50832 () Bool)

(assert start!50832)

(declare-fun b!556259 () Bool)

(declare-fun res!348677 () Bool)

(declare-fun e!320496 () Bool)

(assert (=> b!556259 (=> (not res!348677) (not e!320496))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556259 (= res!348677 (validKeyInArray!0 k!1914))))

(declare-fun b!556260 () Bool)

(declare-fun res!348671 () Bool)

(declare-fun e!320494 () Bool)

(assert (=> b!556260 (=> (not res!348671) (not e!320494))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35057 0))(
  ( (array!35058 (arr!16838 (Array (_ BitVec 32) (_ BitVec 64))) (size!17202 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35057)

(declare-datatypes ((SeekEntryResult!5287 0))(
  ( (MissingZero!5287 (index!23375 (_ BitVec 32))) (Found!5287 (index!23376 (_ BitVec 32))) (Intermediate!5287 (undefined!6099 Bool) (index!23377 (_ BitVec 32)) (x!52265 (_ BitVec 32))) (Undefined!5287) (MissingVacant!5287 (index!23378 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35057 (_ BitVec 32)) SeekEntryResult!5287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556260 (= res!348671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16838 a!3118) j!142) mask!3119) (select (arr!16838 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16838 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16838 a!3118) i!1132 k!1914) j!142) (array!35058 (store (arr!16838 a!3118) i!1132 k!1914) (size!17202 a!3118)) mask!3119)))))

(declare-fun b!556261 () Bool)

(declare-fun res!348678 () Bool)

(assert (=> b!556261 (=> (not res!348678) (not e!320494))))

(declare-datatypes ((List!10918 0))(
  ( (Nil!10915) (Cons!10914 (h!11899 (_ BitVec 64)) (t!17146 List!10918)) )
))
(declare-fun arrayNoDuplicates!0 (array!35057 (_ BitVec 32) List!10918) Bool)

(assert (=> b!556261 (= res!348678 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10915))))

(declare-fun b!556262 () Bool)

(assert (=> b!556262 (= e!320496 e!320494)))

(declare-fun res!348673 () Bool)

(assert (=> b!556262 (=> (not res!348673) (not e!320494))))

(declare-fun lt!252826 () SeekEntryResult!5287)

(assert (=> b!556262 (= res!348673 (or (= lt!252826 (MissingZero!5287 i!1132)) (= lt!252826 (MissingVacant!5287 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35057 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!556262 (= lt!252826 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556263 () Bool)

(declare-fun res!348676 () Bool)

(assert (=> b!556263 (=> (not res!348676) (not e!320496))))

(assert (=> b!556263 (= res!348676 (validKeyInArray!0 (select (arr!16838 a!3118) j!142)))))

(declare-fun b!556264 () Bool)

(assert (=> b!556264 (= e!320494 (not true))))

(declare-fun e!320495 () Bool)

(assert (=> b!556264 e!320495))

(declare-fun res!348675 () Bool)

(assert (=> b!556264 (=> (not res!348675) (not e!320495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35057 (_ BitVec 32)) Bool)

(assert (=> b!556264 (= res!348675 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17348 0))(
  ( (Unit!17349) )
))
(declare-fun lt!252825 () Unit!17348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17348)

(assert (=> b!556264 (= lt!252825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556265 () Bool)

(declare-fun res!348672 () Bool)

(assert (=> b!556265 (=> (not res!348672) (not e!320494))))

(assert (=> b!556265 (= res!348672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!348674 () Bool)

(assert (=> start!50832 (=> (not res!348674) (not e!320496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50832 (= res!348674 (validMask!0 mask!3119))))

(assert (=> start!50832 e!320496))

(assert (=> start!50832 true))

(declare-fun array_inv!12634 (array!35057) Bool)

(assert (=> start!50832 (array_inv!12634 a!3118)))

(declare-fun b!556266 () Bool)

(declare-fun res!348680 () Bool)

(assert (=> b!556266 (=> (not res!348680) (not e!320496))))

(assert (=> b!556266 (= res!348680 (and (= (size!17202 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17202 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17202 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556267 () Bool)

(assert (=> b!556267 (= e!320495 (= (seekEntryOrOpen!0 (select (arr!16838 a!3118) j!142) a!3118 mask!3119) (Found!5287 j!142)))))

(declare-fun b!556268 () Bool)

(declare-fun res!348679 () Bool)

(assert (=> b!556268 (=> (not res!348679) (not e!320496))))

(declare-fun arrayContainsKey!0 (array!35057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556268 (= res!348679 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50832 res!348674) b!556266))

(assert (= (and b!556266 res!348680) b!556263))

(assert (= (and b!556263 res!348676) b!556259))

(assert (= (and b!556259 res!348677) b!556268))

(assert (= (and b!556268 res!348679) b!556262))

(assert (= (and b!556262 res!348673) b!556265))

(assert (= (and b!556265 res!348672) b!556261))

(assert (= (and b!556261 res!348678) b!556260))

(assert (= (and b!556260 res!348671) b!556264))

(assert (= (and b!556264 res!348675) b!556267))

(declare-fun m!534213 () Bool)

(assert (=> b!556263 m!534213))

(assert (=> b!556263 m!534213))

(declare-fun m!534215 () Bool)

(assert (=> b!556263 m!534215))

(declare-fun m!534217 () Bool)

(assert (=> b!556261 m!534217))

(assert (=> b!556260 m!534213))

(declare-fun m!534219 () Bool)

(assert (=> b!556260 m!534219))

(assert (=> b!556260 m!534213))

(declare-fun m!534221 () Bool)

(assert (=> b!556260 m!534221))

(declare-fun m!534223 () Bool)

(assert (=> b!556260 m!534223))

(assert (=> b!556260 m!534221))

(declare-fun m!534225 () Bool)

(assert (=> b!556260 m!534225))

(assert (=> b!556260 m!534219))

(assert (=> b!556260 m!534213))

(declare-fun m!534227 () Bool)

(assert (=> b!556260 m!534227))

(declare-fun m!534229 () Bool)

(assert (=> b!556260 m!534229))

(assert (=> b!556260 m!534221))

(assert (=> b!556260 m!534223))

(assert (=> b!556267 m!534213))

(assert (=> b!556267 m!534213))

(declare-fun m!534231 () Bool)

(assert (=> b!556267 m!534231))

(declare-fun m!534233 () Bool)

(assert (=> b!556262 m!534233))

(declare-fun m!534235 () Bool)

(assert (=> b!556268 m!534235))

(declare-fun m!534237 () Bool)

(assert (=> b!556264 m!534237))

(declare-fun m!534239 () Bool)

(assert (=> b!556264 m!534239))

(declare-fun m!534241 () Bool)

(assert (=> b!556259 m!534241))

(declare-fun m!534243 () Bool)

(assert (=> start!50832 m!534243))

(declare-fun m!534245 () Bool)

(assert (=> start!50832 m!534245))

(declare-fun m!534247 () Bool)

(assert (=> b!556265 m!534247))

(push 1)

