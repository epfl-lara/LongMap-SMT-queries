; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52850 () Bool)

(assert start!52850)

(declare-fun b!575911 () Bool)

(declare-fun res!364286 () Bool)

(declare-fun e!331365 () Bool)

(assert (=> b!575911 (=> (not res!364286) (not e!331365))))

(declare-datatypes ((array!35947 0))(
  ( (array!35948 (arr!17255 (Array (_ BitVec 32) (_ BitVec 64))) (size!17620 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35947)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575911 (= res!364286 (validKeyInArray!0 (select (arr!17255 a!3118) j!142)))))

(declare-fun b!575912 () Bool)

(declare-fun e!331362 () Bool)

(assert (=> b!575912 (= e!331362 (not true))))

(declare-fun e!331363 () Bool)

(assert (=> b!575912 e!331363))

(declare-fun res!364295 () Bool)

(assert (=> b!575912 (=> (not res!364295) (not e!331363))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35947 (_ BitVec 32)) Bool)

(assert (=> b!575912 (= res!364295 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18090 0))(
  ( (Unit!18091) )
))
(declare-fun lt!263376 () Unit!18090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18090)

(assert (=> b!575912 (= lt!263376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575913 () Bool)

(declare-fun res!364288 () Bool)

(assert (=> b!575913 (=> (not res!364288) (not e!331362))))

(assert (=> b!575913 (= res!364288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575914 () Bool)

(declare-fun res!364291 () Bool)

(assert (=> b!575914 (=> (not res!364291) (not e!331362))))

(declare-datatypes ((List!11374 0))(
  ( (Nil!11371) (Cons!11370 (h!12412 (_ BitVec 64)) (t!17593 List!11374)) )
))
(declare-fun arrayNoDuplicates!0 (array!35947 (_ BitVec 32) List!11374) Bool)

(assert (=> b!575914 (= res!364291 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11371))))

(declare-fun b!575915 () Bool)

(declare-fun res!364292 () Bool)

(assert (=> b!575915 (=> (not res!364292) (not e!331365))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575915 (= res!364292 (and (= (size!17620 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17620 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17620 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575916 () Bool)

(declare-fun res!364293 () Bool)

(assert (=> b!575916 (=> (not res!364293) (not e!331365))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575916 (= res!364293 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575918 () Bool)

(declare-datatypes ((SeekEntryResult!5701 0))(
  ( (MissingZero!5701 (index!25031 (_ BitVec 32))) (Found!5701 (index!25032 (_ BitVec 32))) (Intermediate!5701 (undefined!6513 Bool) (index!25033 (_ BitVec 32)) (x!53935 (_ BitVec 32))) (Undefined!5701) (MissingVacant!5701 (index!25034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35947 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!575918 (= e!331363 (= (seekEntryOrOpen!0 (select (arr!17255 a!3118) j!142) a!3118 mask!3119) (Found!5701 j!142)))))

(declare-fun b!575919 () Bool)

(declare-fun res!364290 () Bool)

(assert (=> b!575919 (=> (not res!364290) (not e!331362))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35947 (_ BitVec 32)) SeekEntryResult!5701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575919 (= res!364290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17255 a!3118) j!142) mask!3119) (select (arr!17255 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17255 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17255 a!3118) i!1132 k0!1914) j!142) (array!35948 (store (arr!17255 a!3118) i!1132 k0!1914) (size!17620 a!3118)) mask!3119)))))

(declare-fun b!575920 () Bool)

(assert (=> b!575920 (= e!331365 e!331362)))

(declare-fun res!364289 () Bool)

(assert (=> b!575920 (=> (not res!364289) (not e!331362))))

(declare-fun lt!263377 () SeekEntryResult!5701)

(assert (=> b!575920 (= res!364289 (or (= lt!263377 (MissingZero!5701 i!1132)) (= lt!263377 (MissingVacant!5701 i!1132))))))

(assert (=> b!575920 (= lt!263377 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!364287 () Bool)

(assert (=> start!52850 (=> (not res!364287) (not e!331365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52850 (= res!364287 (validMask!0 mask!3119))))

(assert (=> start!52850 e!331365))

(assert (=> start!52850 true))

(declare-fun array_inv!13138 (array!35947) Bool)

(assert (=> start!52850 (array_inv!13138 a!3118)))

(declare-fun b!575917 () Bool)

(declare-fun res!364294 () Bool)

(assert (=> b!575917 (=> (not res!364294) (not e!331365))))

(assert (=> b!575917 (= res!364294 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52850 res!364287) b!575915))

(assert (= (and b!575915 res!364292) b!575911))

(assert (= (and b!575911 res!364286) b!575917))

(assert (= (and b!575917 res!364294) b!575916))

(assert (= (and b!575916 res!364293) b!575920))

(assert (= (and b!575920 res!364289) b!575913))

(assert (= (and b!575913 res!364288) b!575914))

(assert (= (and b!575914 res!364291) b!575919))

(assert (= (and b!575919 res!364290) b!575912))

(assert (= (and b!575912 res!364295) b!575918))

(declare-fun m!554321 () Bool)

(assert (=> b!575918 m!554321))

(assert (=> b!575918 m!554321))

(declare-fun m!554323 () Bool)

(assert (=> b!575918 m!554323))

(declare-fun m!554325 () Bool)

(assert (=> b!575916 m!554325))

(assert (=> b!575919 m!554321))

(declare-fun m!554327 () Bool)

(assert (=> b!575919 m!554327))

(assert (=> b!575919 m!554321))

(declare-fun m!554329 () Bool)

(assert (=> b!575919 m!554329))

(declare-fun m!554331 () Bool)

(assert (=> b!575919 m!554331))

(assert (=> b!575919 m!554329))

(declare-fun m!554333 () Bool)

(assert (=> b!575919 m!554333))

(assert (=> b!575919 m!554327))

(assert (=> b!575919 m!554321))

(declare-fun m!554335 () Bool)

(assert (=> b!575919 m!554335))

(declare-fun m!554337 () Bool)

(assert (=> b!575919 m!554337))

(assert (=> b!575919 m!554329))

(assert (=> b!575919 m!554331))

(declare-fun m!554339 () Bool)

(assert (=> b!575917 m!554339))

(declare-fun m!554341 () Bool)

(assert (=> start!52850 m!554341))

(declare-fun m!554343 () Bool)

(assert (=> start!52850 m!554343))

(declare-fun m!554345 () Bool)

(assert (=> b!575920 m!554345))

(assert (=> b!575911 m!554321))

(assert (=> b!575911 m!554321))

(declare-fun m!554347 () Bool)

(assert (=> b!575911 m!554347))

(declare-fun m!554349 () Bool)

(assert (=> b!575914 m!554349))

(declare-fun m!554351 () Bool)

(assert (=> b!575913 m!554351))

(declare-fun m!554353 () Bool)

(assert (=> b!575912 m!554353))

(declare-fun m!554355 () Bool)

(assert (=> b!575912 m!554355))

(check-sat (not b!575920) (not b!575917) (not b!575916) (not b!575912) (not b!575914) (not b!575919) (not start!52850) (not b!575918) (not b!575913) (not b!575911))
(check-sat)
