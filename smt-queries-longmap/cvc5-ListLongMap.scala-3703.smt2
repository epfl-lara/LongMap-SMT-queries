; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50834 () Bool)

(assert start!50834)

(declare-fun b!556289 () Bool)

(declare-fun res!348704 () Bool)

(declare-fun e!320505 () Bool)

(assert (=> b!556289 (=> (not res!348704) (not e!320505))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35059 0))(
  ( (array!35060 (arr!16839 (Array (_ BitVec 32) (_ BitVec 64))) (size!17203 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35059)

(assert (=> b!556289 (= res!348704 (and (= (size!17203 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17203 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17203 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556290 () Bool)

(declare-fun res!348703 () Bool)

(declare-fun e!320508 () Bool)

(assert (=> b!556290 (=> (not res!348703) (not e!320508))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5288 0))(
  ( (MissingZero!5288 (index!23379 (_ BitVec 32))) (Found!5288 (index!23380 (_ BitVec 32))) (Intermediate!5288 (undefined!6100 Bool) (index!23381 (_ BitVec 32)) (x!52274 (_ BitVec 32))) (Undefined!5288) (MissingVacant!5288 (index!23382 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35059 (_ BitVec 32)) SeekEntryResult!5288)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556290 (= res!348703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16839 a!3118) j!142) mask!3119) (select (arr!16839 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16839 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16839 a!3118) i!1132 k!1914) j!142) (array!35060 (store (arr!16839 a!3118) i!1132 k!1914) (size!17203 a!3118)) mask!3119)))))

(declare-fun b!556291 () Bool)

(assert (=> b!556291 (= e!320505 e!320508)))

(declare-fun res!348707 () Bool)

(assert (=> b!556291 (=> (not res!348707) (not e!320508))))

(declare-fun lt!252831 () SeekEntryResult!5288)

(assert (=> b!556291 (= res!348707 (or (= lt!252831 (MissingZero!5288 i!1132)) (= lt!252831 (MissingVacant!5288 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35059 (_ BitVec 32)) SeekEntryResult!5288)

(assert (=> b!556291 (= lt!252831 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556292 () Bool)

(declare-fun res!348706 () Bool)

(assert (=> b!556292 (=> (not res!348706) (not e!320505))))

(declare-fun arrayContainsKey!0 (array!35059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556292 (= res!348706 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556293 () Bool)

(declare-fun res!348709 () Bool)

(assert (=> b!556293 (=> (not res!348709) (not e!320505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556293 (= res!348709 (validKeyInArray!0 (select (arr!16839 a!3118) j!142)))))

(declare-fun b!556294 () Bool)

(declare-fun res!348705 () Bool)

(assert (=> b!556294 (=> (not res!348705) (not e!320508))))

(declare-datatypes ((List!10919 0))(
  ( (Nil!10916) (Cons!10915 (h!11900 (_ BitVec 64)) (t!17147 List!10919)) )
))
(declare-fun arrayNoDuplicates!0 (array!35059 (_ BitVec 32) List!10919) Bool)

(assert (=> b!556294 (= res!348705 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10916))))

(declare-fun b!556295 () Bool)

(assert (=> b!556295 (= e!320508 (not true))))

(declare-fun e!320507 () Bool)

(assert (=> b!556295 e!320507))

(declare-fun res!348708 () Bool)

(assert (=> b!556295 (=> (not res!348708) (not e!320507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35059 (_ BitVec 32)) Bool)

(assert (=> b!556295 (= res!348708 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17350 0))(
  ( (Unit!17351) )
))
(declare-fun lt!252832 () Unit!17350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17350)

(assert (=> b!556295 (= lt!252832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556296 () Bool)

(declare-fun res!348710 () Bool)

(assert (=> b!556296 (=> (not res!348710) (not e!320505))))

(assert (=> b!556296 (= res!348710 (validKeyInArray!0 k!1914))))

(declare-fun b!556297 () Bool)

(declare-fun res!348701 () Bool)

(assert (=> b!556297 (=> (not res!348701) (not e!320508))))

(assert (=> b!556297 (= res!348701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556298 () Bool)

(assert (=> b!556298 (= e!320507 (= (seekEntryOrOpen!0 (select (arr!16839 a!3118) j!142) a!3118 mask!3119) (Found!5288 j!142)))))

(declare-fun res!348702 () Bool)

(assert (=> start!50834 (=> (not res!348702) (not e!320505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50834 (= res!348702 (validMask!0 mask!3119))))

(assert (=> start!50834 e!320505))

(assert (=> start!50834 true))

(declare-fun array_inv!12635 (array!35059) Bool)

(assert (=> start!50834 (array_inv!12635 a!3118)))

(assert (= (and start!50834 res!348702) b!556289))

(assert (= (and b!556289 res!348704) b!556293))

(assert (= (and b!556293 res!348709) b!556296))

(assert (= (and b!556296 res!348710) b!556292))

(assert (= (and b!556292 res!348706) b!556291))

(assert (= (and b!556291 res!348707) b!556297))

(assert (= (and b!556297 res!348701) b!556294))

(assert (= (and b!556294 res!348705) b!556290))

(assert (= (and b!556290 res!348703) b!556295))

(assert (= (and b!556295 res!348708) b!556298))

(declare-fun m!534249 () Bool)

(assert (=> start!50834 m!534249))

(declare-fun m!534251 () Bool)

(assert (=> start!50834 m!534251))

(declare-fun m!534253 () Bool)

(assert (=> b!556296 m!534253))

(declare-fun m!534255 () Bool)

(assert (=> b!556298 m!534255))

(assert (=> b!556298 m!534255))

(declare-fun m!534257 () Bool)

(assert (=> b!556298 m!534257))

(declare-fun m!534259 () Bool)

(assert (=> b!556294 m!534259))

(declare-fun m!534261 () Bool)

(assert (=> b!556292 m!534261))

(declare-fun m!534263 () Bool)

(assert (=> b!556291 m!534263))

(declare-fun m!534265 () Bool)

(assert (=> b!556297 m!534265))

(assert (=> b!556290 m!534255))

(declare-fun m!534267 () Bool)

(assert (=> b!556290 m!534267))

(assert (=> b!556290 m!534255))

(declare-fun m!534269 () Bool)

(assert (=> b!556290 m!534269))

(declare-fun m!534271 () Bool)

(assert (=> b!556290 m!534271))

(assert (=> b!556290 m!534269))

(declare-fun m!534273 () Bool)

(assert (=> b!556290 m!534273))

(assert (=> b!556290 m!534267))

(assert (=> b!556290 m!534255))

(declare-fun m!534275 () Bool)

(assert (=> b!556290 m!534275))

(declare-fun m!534277 () Bool)

(assert (=> b!556290 m!534277))

(assert (=> b!556290 m!534269))

(assert (=> b!556290 m!534271))

(assert (=> b!556293 m!534255))

(assert (=> b!556293 m!534255))

(declare-fun m!534279 () Bool)

(assert (=> b!556293 m!534279))

(declare-fun m!534281 () Bool)

(assert (=> b!556295 m!534281))

(declare-fun m!534283 () Bool)

(assert (=> b!556295 m!534283))

(push 1)

