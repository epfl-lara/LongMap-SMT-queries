; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46998 () Bool)

(assert start!46998)

(declare-fun res!317259 () Bool)

(declare-fun e!302383 () Bool)

(assert (=> start!46998 (=> (not res!317259) (not e!302383))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46998 (= res!317259 (validMask!0 mask!3524))))

(assert (=> start!46998 e!302383))

(assert (=> start!46998 true))

(declare-datatypes ((array!33139 0))(
  ( (array!33140 (arr!15933 (Array (_ BitVec 32) (_ BitVec 64))) (size!16297 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33139)

(declare-fun array_inv!11729 (array!33139) Bool)

(assert (=> start!46998 (array_inv!11729 a!3235)))

(declare-fun b!518235 () Bool)

(declare-fun e!302381 () Bool)

(assert (=> b!518235 (= e!302381 false)))

(declare-fun lt!237230 () (_ BitVec 32))

(declare-fun lt!237232 () array!33139)

(declare-datatypes ((SeekEntryResult!4400 0))(
  ( (MissingZero!4400 (index!19788 (_ BitVec 32))) (Found!4400 (index!19789 (_ BitVec 32))) (Intermediate!4400 (undefined!5212 Bool) (index!19790 (_ BitVec 32)) (x!48757 (_ BitVec 32))) (Undefined!4400) (MissingVacant!4400 (index!19791 (_ BitVec 32))) )
))
(declare-fun lt!237235 () SeekEntryResult!4400)

(declare-fun lt!237234 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33139 (_ BitVec 32)) SeekEntryResult!4400)

(assert (=> b!518235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237230 lt!237234 lt!237232 mask!3524) (Intermediate!4400 false (index!19790 lt!237235) (x!48757 lt!237235)))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!16058 0))(
  ( (Unit!16059) )
))
(declare-fun lt!237229 () Unit!16058)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16058)

(assert (=> b!518235 (= lt!237229 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237230 #b00000000000000000000000000000000 (index!19790 lt!237235) (x!48757 lt!237235) mask!3524))))

(declare-fun b!518236 () Bool)

(declare-fun res!317253 () Bool)

(declare-fun e!302382 () Bool)

(assert (=> b!518236 (=> res!317253 e!302382)))

(assert (=> b!518236 (= res!317253 (or (undefined!5212 lt!237235) (not (is-Intermediate!4400 lt!237235))))))

(declare-fun b!518237 () Bool)

(assert (=> b!518237 (= e!302382 e!302381)))

(declare-fun res!317250 () Bool)

(assert (=> b!518237 (=> res!317250 e!302381)))

(assert (=> b!518237 (= res!317250 (not (= (select (arr!15933 a!3235) (index!19790 lt!237235)) (select (arr!15933 a!3235) j!176))))))

(assert (=> b!518237 (and (bvslt (x!48757 lt!237235) #b01111111111111111111111111111110) (or (= (select (arr!15933 a!3235) (index!19790 lt!237235)) (select (arr!15933 a!3235) j!176)) (= (select (arr!15933 a!3235) (index!19790 lt!237235)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15933 a!3235) (index!19790 lt!237235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518238 () Bool)

(declare-fun res!317252 () Bool)

(declare-fun e!302380 () Bool)

(assert (=> b!518238 (=> (not res!317252) (not e!302380))))

(declare-datatypes ((List!10091 0))(
  ( (Nil!10088) (Cons!10087 (h!10994 (_ BitVec 64)) (t!16319 List!10091)) )
))
(declare-fun arrayNoDuplicates!0 (array!33139 (_ BitVec 32) List!10091) Bool)

(assert (=> b!518238 (= res!317252 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10088))))

(declare-fun b!518239 () Bool)

(declare-fun res!317258 () Bool)

(assert (=> b!518239 (=> (not res!317258) (not e!302383))))

(declare-fun arrayContainsKey!0 (array!33139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518239 (= res!317258 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518240 () Bool)

(assert (=> b!518240 (= e!302383 e!302380)))

(declare-fun res!317256 () Bool)

(assert (=> b!518240 (=> (not res!317256) (not e!302380))))

(declare-fun lt!237228 () SeekEntryResult!4400)

(assert (=> b!518240 (= res!317256 (or (= lt!237228 (MissingZero!4400 i!1204)) (= lt!237228 (MissingVacant!4400 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33139 (_ BitVec 32)) SeekEntryResult!4400)

(assert (=> b!518240 (= lt!237228 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518241 () Bool)

(declare-fun e!302385 () Bool)

(assert (=> b!518241 (= e!302385 (= (seekEntryOrOpen!0 (select (arr!15933 a!3235) j!176) a!3235 mask!3524) (Found!4400 j!176)))))

(declare-fun b!518242 () Bool)

(declare-fun res!317261 () Bool)

(assert (=> b!518242 (=> (not res!317261) (not e!302383))))

(assert (=> b!518242 (= res!317261 (and (= (size!16297 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16297 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16297 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518243 () Bool)

(assert (=> b!518243 (= e!302380 (not e!302382))))

(declare-fun res!317260 () Bool)

(assert (=> b!518243 (=> res!317260 e!302382)))

(declare-fun lt!237231 () (_ BitVec 32))

(assert (=> b!518243 (= res!317260 (= lt!237235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237231 lt!237234 lt!237232 mask!3524)))))

(assert (=> b!518243 (= lt!237235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237230 (select (arr!15933 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518243 (= lt!237231 (toIndex!0 lt!237234 mask!3524))))

(assert (=> b!518243 (= lt!237234 (select (store (arr!15933 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518243 (= lt!237230 (toIndex!0 (select (arr!15933 a!3235) j!176) mask!3524))))

(assert (=> b!518243 (= lt!237232 (array!33140 (store (arr!15933 a!3235) i!1204 k!2280) (size!16297 a!3235)))))

(assert (=> b!518243 e!302385))

(declare-fun res!317254 () Bool)

(assert (=> b!518243 (=> (not res!317254) (not e!302385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33139 (_ BitVec 32)) Bool)

(assert (=> b!518243 (= res!317254 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237233 () Unit!16058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16058)

(assert (=> b!518243 (= lt!237233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518244 () Bool)

(declare-fun res!317257 () Bool)

(assert (=> b!518244 (=> (not res!317257) (not e!302383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518244 (= res!317257 (validKeyInArray!0 (select (arr!15933 a!3235) j!176)))))

(declare-fun b!518245 () Bool)

(declare-fun res!317255 () Bool)

(assert (=> b!518245 (=> (not res!317255) (not e!302380))))

(assert (=> b!518245 (= res!317255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518246 () Bool)

(declare-fun res!317251 () Bool)

(assert (=> b!518246 (=> (not res!317251) (not e!302383))))

(assert (=> b!518246 (= res!317251 (validKeyInArray!0 k!2280))))

(assert (= (and start!46998 res!317259) b!518242))

(assert (= (and b!518242 res!317261) b!518244))

(assert (= (and b!518244 res!317257) b!518246))

(assert (= (and b!518246 res!317251) b!518239))

(assert (= (and b!518239 res!317258) b!518240))

(assert (= (and b!518240 res!317256) b!518245))

(assert (= (and b!518245 res!317255) b!518238))

(assert (= (and b!518238 res!317252) b!518243))

(assert (= (and b!518243 res!317254) b!518241))

(assert (= (and b!518243 (not res!317260)) b!518236))

(assert (= (and b!518236 (not res!317253)) b!518237))

(assert (= (and b!518237 (not res!317250)) b!518235))

(declare-fun m!499599 () Bool)

(assert (=> b!518238 m!499599))

(declare-fun m!499601 () Bool)

(assert (=> b!518239 m!499601))

(declare-fun m!499603 () Bool)

(assert (=> start!46998 m!499603))

(declare-fun m!499605 () Bool)

(assert (=> start!46998 m!499605))

(declare-fun m!499607 () Bool)

(assert (=> b!518246 m!499607))

(declare-fun m!499609 () Bool)

(assert (=> b!518243 m!499609))

(declare-fun m!499611 () Bool)

(assert (=> b!518243 m!499611))

(declare-fun m!499613 () Bool)

(assert (=> b!518243 m!499613))

(declare-fun m!499615 () Bool)

(assert (=> b!518243 m!499615))

(declare-fun m!499617 () Bool)

(assert (=> b!518243 m!499617))

(assert (=> b!518243 m!499611))

(declare-fun m!499619 () Bool)

(assert (=> b!518243 m!499619))

(assert (=> b!518243 m!499611))

(declare-fun m!499621 () Bool)

(assert (=> b!518243 m!499621))

(declare-fun m!499623 () Bool)

(assert (=> b!518243 m!499623))

(declare-fun m!499625 () Bool)

(assert (=> b!518243 m!499625))

(declare-fun m!499627 () Bool)

(assert (=> b!518237 m!499627))

(assert (=> b!518237 m!499611))

(declare-fun m!499629 () Bool)

(assert (=> b!518245 m!499629))

(declare-fun m!499631 () Bool)

(assert (=> b!518235 m!499631))

(declare-fun m!499633 () Bool)

(assert (=> b!518235 m!499633))

(assert (=> b!518244 m!499611))

(assert (=> b!518244 m!499611))

(declare-fun m!499635 () Bool)

(assert (=> b!518244 m!499635))

(declare-fun m!499637 () Bool)

(assert (=> b!518240 m!499637))

(assert (=> b!518241 m!499611))

(assert (=> b!518241 m!499611))

(declare-fun m!499639 () Bool)

(assert (=> b!518241 m!499639))

(push 1)

