; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51528 () Bool)

(assert start!51528)

(declare-fun b!563234 () Bool)

(declare-fun res!354284 () Bool)

(declare-fun e!324610 () Bool)

(assert (=> b!563234 (=> (not res!354284) (not e!324610))))

(declare-datatypes ((array!35340 0))(
  ( (array!35341 (arr!16969 (Array (_ BitVec 32) (_ BitVec 64))) (size!17333 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35340)

(declare-datatypes ((List!10956 0))(
  ( (Nil!10953) (Cons!10952 (h!11958 (_ BitVec 64)) (t!17176 List!10956)) )
))
(declare-fun arrayNoDuplicates!0 (array!35340 (_ BitVec 32) List!10956) Bool)

(assert (=> b!563234 (= res!354284 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10953))))

(declare-fun res!354292 () Bool)

(declare-fun e!324609 () Bool)

(assert (=> start!51528 (=> (not res!354292) (not e!324609))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51528 (= res!354292 (validMask!0 mask!3119))))

(assert (=> start!51528 e!324609))

(assert (=> start!51528 true))

(declare-fun array_inv!12828 (array!35340) Bool)

(assert (=> start!51528 (array_inv!12828 a!3118)))

(declare-fun b!563235 () Bool)

(declare-fun res!354283 () Bool)

(assert (=> b!563235 (=> (not res!354283) (not e!324609))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563235 (= res!354283 (and (= (size!17333 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17333 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17333 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563236 () Bool)

(declare-fun e!324614 () Bool)

(assert (=> b!563236 (= e!324614 true)))

(declare-datatypes ((SeekEntryResult!5374 0))(
  ( (MissingZero!5374 (index!23723 (_ BitVec 32))) (Found!5374 (index!23724 (_ BitVec 32))) (Intermediate!5374 (undefined!6186 Bool) (index!23725 (_ BitVec 32)) (x!52768 (_ BitVec 32))) (Undefined!5374) (MissingVacant!5374 (index!23726 (_ BitVec 32))) )
))
(declare-fun lt!257050 () SeekEntryResult!5374)

(declare-fun lt!257046 () SeekEntryResult!5374)

(assert (=> b!563236 (= lt!257050 lt!257046)))

(declare-fun lt!257043 () SeekEntryResult!5374)

(declare-datatypes ((Unit!17593 0))(
  ( (Unit!17594) )
))
(declare-fun lt!257048 () Unit!17593)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17593)

(assert (=> b!563236 (= lt!257048 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52768 lt!257043) (index!23725 lt!257043) (index!23725 lt!257043) mask!3119))))

(declare-fun b!563237 () Bool)

(assert (=> b!563237 (= e!324609 e!324610)))

(declare-fun res!354288 () Bool)

(assert (=> b!563237 (=> (not res!354288) (not e!324610))))

(declare-fun lt!257051 () SeekEntryResult!5374)

(assert (=> b!563237 (= res!354288 (or (= lt!257051 (MissingZero!5374 i!1132)) (= lt!257051 (MissingVacant!5374 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35340 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!563237 (= lt!257051 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563238 () Bool)

(declare-fun res!354281 () Bool)

(assert (=> b!563238 (=> (not res!354281) (not e!324609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563238 (= res!354281 (validKeyInArray!0 k0!1914))))

(declare-fun b!563239 () Bool)

(declare-fun e!324615 () Bool)

(assert (=> b!563239 (= e!324610 e!324615)))

(declare-fun res!354282 () Bool)

(assert (=> b!563239 (=> (not res!354282) (not e!324615))))

(declare-fun lt!257049 () array!35340)

(declare-fun lt!257053 () (_ BitVec 32))

(declare-fun lt!257045 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35340 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!563239 (= res!354282 (= lt!257043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257053 lt!257045 lt!257049 mask!3119)))))

(declare-fun lt!257044 () (_ BitVec 32))

(assert (=> b!563239 (= lt!257043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257044 (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563239 (= lt!257053 (toIndex!0 lt!257045 mask!3119))))

(assert (=> b!563239 (= lt!257045 (select (store (arr!16969 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563239 (= lt!257044 (toIndex!0 (select (arr!16969 a!3118) j!142) mask!3119))))

(assert (=> b!563239 (= lt!257049 (array!35341 (store (arr!16969 a!3118) i!1132 k0!1914) (size!17333 a!3118)))))

(declare-fun b!563240 () Bool)

(declare-fun res!354290 () Bool)

(assert (=> b!563240 (=> (not res!354290) (not e!324609))))

(assert (=> b!563240 (= res!354290 (validKeyInArray!0 (select (arr!16969 a!3118) j!142)))))

(declare-fun b!563241 () Bool)

(declare-fun res!354285 () Bool)

(assert (=> b!563241 (=> (not res!354285) (not e!324609))))

(declare-fun arrayContainsKey!0 (array!35340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563241 (= res!354285 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563242 () Bool)

(declare-fun e!324613 () Bool)

(assert (=> b!563242 (= e!324615 (not e!324613))))

(declare-fun res!354287 () Bool)

(assert (=> b!563242 (=> res!354287 e!324613)))

(get-info :version)

(assert (=> b!563242 (= res!354287 (or (undefined!6186 lt!257043) (not ((_ is Intermediate!5374) lt!257043))))))

(declare-fun lt!257052 () SeekEntryResult!5374)

(declare-fun lt!257054 () SeekEntryResult!5374)

(assert (=> b!563242 (= lt!257052 lt!257054)))

(assert (=> b!563242 (= lt!257054 (Found!5374 j!142))))

(assert (=> b!563242 (= lt!257052 (seekEntryOrOpen!0 (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35340 (_ BitVec 32)) Bool)

(assert (=> b!563242 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257055 () Unit!17593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17593)

(assert (=> b!563242 (= lt!257055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563243 () Bool)

(declare-fun e!324611 () Bool)

(assert (=> b!563243 (= e!324613 e!324611)))

(declare-fun res!354289 () Bool)

(assert (=> b!563243 (=> res!354289 e!324611)))

(declare-fun lt!257056 () (_ BitVec 64))

(assert (=> b!563243 (= res!354289 (or (= lt!257056 (select (arr!16969 a!3118) j!142)) (= lt!257056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563243 (= lt!257056 (select (arr!16969 a!3118) (index!23725 lt!257043)))))

(declare-fun b!563244 () Bool)

(assert (=> b!563244 (= e!324611 e!324614)))

(declare-fun res!354291 () Bool)

(assert (=> b!563244 (=> res!354291 e!324614)))

(assert (=> b!563244 (= res!354291 (or (bvslt (index!23725 lt!257043) #b00000000000000000000000000000000) (bvsge (index!23725 lt!257043) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52768 lt!257043) #b01111111111111111111111111111110) (bvslt (x!52768 lt!257043) #b00000000000000000000000000000000) (not (= lt!257056 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16969 a!3118) i!1132 k0!1914) (index!23725 lt!257043)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257050 lt!257054))))))

(declare-fun lt!257047 () SeekEntryResult!5374)

(assert (=> b!563244 (= lt!257047 lt!257046)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35340 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!563244 (= lt!257046 (seekKeyOrZeroReturnVacant!0 (x!52768 lt!257043) (index!23725 lt!257043) (index!23725 lt!257043) lt!257045 lt!257049 mask!3119))))

(assert (=> b!563244 (= lt!257047 (seekEntryOrOpen!0 lt!257045 lt!257049 mask!3119))))

(assert (=> b!563244 (= lt!257052 lt!257050)))

(assert (=> b!563244 (= lt!257050 (seekKeyOrZeroReturnVacant!0 (x!52768 lt!257043) (index!23725 lt!257043) (index!23725 lt!257043) (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563245 () Bool)

(declare-fun res!354286 () Bool)

(assert (=> b!563245 (=> (not res!354286) (not e!324610))))

(assert (=> b!563245 (= res!354286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51528 res!354292) b!563235))

(assert (= (and b!563235 res!354283) b!563240))

(assert (= (and b!563240 res!354290) b!563238))

(assert (= (and b!563238 res!354281) b!563241))

(assert (= (and b!563241 res!354285) b!563237))

(assert (= (and b!563237 res!354288) b!563245))

(assert (= (and b!563245 res!354286) b!563234))

(assert (= (and b!563234 res!354284) b!563239))

(assert (= (and b!563239 res!354282) b!563242))

(assert (= (and b!563242 (not res!354287)) b!563243))

(assert (= (and b!563243 (not res!354289)) b!563244))

(assert (= (and b!563244 (not res!354291)) b!563236))

(declare-fun m!541607 () Bool)

(assert (=> b!563238 m!541607))

(declare-fun m!541609 () Bool)

(assert (=> b!563236 m!541609))

(declare-fun m!541611 () Bool)

(assert (=> b!563241 m!541611))

(declare-fun m!541613 () Bool)

(assert (=> b!563240 m!541613))

(assert (=> b!563240 m!541613))

(declare-fun m!541615 () Bool)

(assert (=> b!563240 m!541615))

(declare-fun m!541617 () Bool)

(assert (=> b!563234 m!541617))

(assert (=> b!563243 m!541613))

(declare-fun m!541619 () Bool)

(assert (=> b!563243 m!541619))

(assert (=> b!563242 m!541613))

(assert (=> b!563242 m!541613))

(declare-fun m!541621 () Bool)

(assert (=> b!563242 m!541621))

(declare-fun m!541623 () Bool)

(assert (=> b!563242 m!541623))

(declare-fun m!541625 () Bool)

(assert (=> b!563242 m!541625))

(declare-fun m!541627 () Bool)

(assert (=> start!51528 m!541627))

(declare-fun m!541629 () Bool)

(assert (=> start!51528 m!541629))

(declare-fun m!541631 () Bool)

(assert (=> b!563245 m!541631))

(assert (=> b!563244 m!541613))

(assert (=> b!563244 m!541613))

(declare-fun m!541633 () Bool)

(assert (=> b!563244 m!541633))

(declare-fun m!541635 () Bool)

(assert (=> b!563244 m!541635))

(declare-fun m!541637 () Bool)

(assert (=> b!563244 m!541637))

(declare-fun m!541639 () Bool)

(assert (=> b!563244 m!541639))

(declare-fun m!541641 () Bool)

(assert (=> b!563244 m!541641))

(declare-fun m!541643 () Bool)

(assert (=> b!563237 m!541643))

(assert (=> b!563239 m!541613))

(declare-fun m!541645 () Bool)

(assert (=> b!563239 m!541645))

(assert (=> b!563239 m!541613))

(declare-fun m!541647 () Bool)

(assert (=> b!563239 m!541647))

(assert (=> b!563239 m!541613))

(declare-fun m!541649 () Bool)

(assert (=> b!563239 m!541649))

(assert (=> b!563239 m!541635))

(declare-fun m!541651 () Bool)

(assert (=> b!563239 m!541651))

(declare-fun m!541653 () Bool)

(assert (=> b!563239 m!541653))

(check-sat (not start!51528) (not b!563240) (not b!563237) (not b!563238) (not b!563242) (not b!563244) (not b!563239) (not b!563241) (not b!563245) (not b!563236) (not b!563234))
(check-sat)
