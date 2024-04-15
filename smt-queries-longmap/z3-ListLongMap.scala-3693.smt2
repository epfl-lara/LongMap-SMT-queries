; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50762 () Bool)

(assert start!50762)

(declare-fun b!555170 () Bool)

(declare-fun res!347732 () Bool)

(declare-fun e!319963 () Bool)

(assert (=> b!555170 (=> (not res!347732) (not e!319963))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34996 0))(
  ( (array!34997 (arr!16808 (Array (_ BitVec 32) (_ BitVec 64))) (size!17173 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34996)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555170 (= res!347732 (and (= (size!17173 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17173 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17173 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555171 () Bool)

(declare-fun res!347726 () Bool)

(assert (=> b!555171 (=> (not res!347726) (not e!319963))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555171 (= res!347726 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555172 () Bool)

(declare-fun e!319964 () Bool)

(assert (=> b!555172 (= e!319963 e!319964)))

(declare-fun res!347727 () Bool)

(assert (=> b!555172 (=> (not res!347727) (not e!319964))))

(declare-datatypes ((SeekEntryResult!5254 0))(
  ( (MissingZero!5254 (index!23243 (_ BitVec 32))) (Found!5254 (index!23244 (_ BitVec 32))) (Intermediate!5254 (undefined!6066 Bool) (index!23245 (_ BitVec 32)) (x!52155 (_ BitVec 32))) (Undefined!5254) (MissingVacant!5254 (index!23246 (_ BitVec 32))) )
))
(declare-fun lt!252183 () SeekEntryResult!5254)

(assert (=> b!555172 (= res!347727 (or (= lt!252183 (MissingZero!5254 i!1132)) (= lt!252183 (MissingVacant!5254 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34996 (_ BitVec 32)) SeekEntryResult!5254)

(assert (=> b!555172 (= lt!252183 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555173 () Bool)

(declare-fun res!347729 () Bool)

(assert (=> b!555173 (=> (not res!347729) (not e!319963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555173 (= res!347729 (validKeyInArray!0 (select (arr!16808 a!3118) j!142)))))

(declare-fun b!555174 () Bool)

(declare-fun e!319962 () Bool)

(assert (=> b!555174 (= e!319964 e!319962)))

(declare-fun res!347730 () Bool)

(assert (=> b!555174 (=> (not res!347730) (not e!319962))))

(declare-fun lt!252184 () (_ BitVec 32))

(declare-fun lt!252185 () SeekEntryResult!5254)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34996 (_ BitVec 32)) SeekEntryResult!5254)

(assert (=> b!555174 (= res!347730 (= lt!252185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252184 (select (store (arr!16808 a!3118) i!1132 k0!1914) j!142) (array!34997 (store (arr!16808 a!3118) i!1132 k0!1914) (size!17173 a!3118)) mask!3119)))))

(declare-fun lt!252186 () (_ BitVec 32))

(assert (=> b!555174 (= lt!252185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252186 (select (arr!16808 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555174 (= lt!252184 (toIndex!0 (select (store (arr!16808 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555174 (= lt!252186 (toIndex!0 (select (arr!16808 a!3118) j!142) mask!3119))))

(declare-fun b!555175 () Bool)

(declare-fun res!347724 () Bool)

(assert (=> b!555175 (=> (not res!347724) (not e!319964))))

(declare-datatypes ((List!10927 0))(
  ( (Nil!10924) (Cons!10923 (h!11908 (_ BitVec 64)) (t!17146 List!10927)) )
))
(declare-fun arrayNoDuplicates!0 (array!34996 (_ BitVec 32) List!10927) Bool)

(assert (=> b!555175 (= res!347724 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10924))))

(declare-fun res!347725 () Bool)

(assert (=> start!50762 (=> (not res!347725) (not e!319963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50762 (= res!347725 (validMask!0 mask!3119))))

(assert (=> start!50762 e!319963))

(assert (=> start!50762 true))

(declare-fun array_inv!12691 (array!34996) Bool)

(assert (=> start!50762 (array_inv!12691 a!3118)))

(declare-fun b!555176 () Bool)

(declare-fun res!347731 () Bool)

(assert (=> b!555176 (=> (not res!347731) (not e!319964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34996 (_ BitVec 32)) Bool)

(assert (=> b!555176 (= res!347731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555177 () Bool)

(declare-fun res!347728 () Bool)

(assert (=> b!555177 (=> (not res!347728) (not e!319963))))

(assert (=> b!555177 (= res!347728 (validKeyInArray!0 k0!1914))))

(declare-fun b!555178 () Bool)

(assert (=> b!555178 (= e!319962 (not true))))

(declare-fun lt!252182 () SeekEntryResult!5254)

(get-info :version)

(assert (=> b!555178 (and (= lt!252182 (Found!5254 j!142)) (or (undefined!6066 lt!252185) (not ((_ is Intermediate!5254) lt!252185)) (= (select (arr!16808 a!3118) (index!23245 lt!252185)) (select (arr!16808 a!3118) j!142)) (not (= (select (arr!16808 a!3118) (index!23245 lt!252185)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252182 (MissingZero!5254 (index!23245 lt!252185)))))))

(assert (=> b!555178 (= lt!252182 (seekEntryOrOpen!0 (select (arr!16808 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555178 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17268 0))(
  ( (Unit!17269) )
))
(declare-fun lt!252187 () Unit!17268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17268)

(assert (=> b!555178 (= lt!252187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50762 res!347725) b!555170))

(assert (= (and b!555170 res!347732) b!555173))

(assert (= (and b!555173 res!347729) b!555177))

(assert (= (and b!555177 res!347728) b!555171))

(assert (= (and b!555171 res!347726) b!555172))

(assert (= (and b!555172 res!347727) b!555176))

(assert (= (and b!555176 res!347731) b!555175))

(assert (= (and b!555175 res!347724) b!555174))

(assert (= (and b!555174 res!347730) b!555178))

(declare-fun m!532355 () Bool)

(assert (=> b!555176 m!532355))

(declare-fun m!532357 () Bool)

(assert (=> b!555171 m!532357))

(declare-fun m!532359 () Bool)

(assert (=> b!555175 m!532359))

(declare-fun m!532361 () Bool)

(assert (=> b!555173 m!532361))

(assert (=> b!555173 m!532361))

(declare-fun m!532363 () Bool)

(assert (=> b!555173 m!532363))

(assert (=> b!555174 m!532361))

(declare-fun m!532365 () Bool)

(assert (=> b!555174 m!532365))

(assert (=> b!555174 m!532361))

(declare-fun m!532367 () Bool)

(assert (=> b!555174 m!532367))

(assert (=> b!555174 m!532367))

(declare-fun m!532369 () Bool)

(assert (=> b!555174 m!532369))

(declare-fun m!532371 () Bool)

(assert (=> b!555174 m!532371))

(assert (=> b!555174 m!532361))

(declare-fun m!532373 () Bool)

(assert (=> b!555174 m!532373))

(assert (=> b!555174 m!532367))

(declare-fun m!532375 () Bool)

(assert (=> b!555174 m!532375))

(assert (=> b!555178 m!532361))

(declare-fun m!532377 () Bool)

(assert (=> b!555178 m!532377))

(declare-fun m!532379 () Bool)

(assert (=> b!555178 m!532379))

(declare-fun m!532381 () Bool)

(assert (=> b!555178 m!532381))

(assert (=> b!555178 m!532361))

(declare-fun m!532383 () Bool)

(assert (=> b!555178 m!532383))

(declare-fun m!532385 () Bool)

(assert (=> start!50762 m!532385))

(declare-fun m!532387 () Bool)

(assert (=> start!50762 m!532387))

(declare-fun m!532389 () Bool)

(assert (=> b!555172 m!532389))

(declare-fun m!532391 () Bool)

(assert (=> b!555177 m!532391))

(check-sat (not b!555171) (not b!555177) (not b!555178) (not b!555176) (not start!50762) (not b!555174) (not b!555172) (not b!555173) (not b!555175))
(check-sat)
