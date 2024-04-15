; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45708 () Bool)

(assert start!45708)

(declare-fun b!505017 () Bool)

(declare-fun res!306242 () Bool)

(declare-fun e!295631 () Bool)

(assert (=> b!505017 (=> (not res!306242) (not e!295631))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505017 (= res!306242 (validKeyInArray!0 k0!2280))))

(declare-fun b!505018 () Bool)

(declare-datatypes ((Unit!15394 0))(
  ( (Unit!15395) )
))
(declare-fun e!295630 () Unit!15394)

(declare-fun Unit!15396 () Unit!15394)

(assert (=> b!505018 (= e!295630 Unit!15396)))

(declare-fun b!505019 () Bool)

(declare-fun e!295629 () Bool)

(assert (=> b!505019 (= e!295631 e!295629)))

(declare-fun res!306246 () Bool)

(assert (=> b!505019 (=> (not res!306246) (not e!295629))))

(declare-datatypes ((SeekEntryResult!4081 0))(
  ( (MissingZero!4081 (index!18512 (_ BitVec 32))) (Found!4081 (index!18513 (_ BitVec 32))) (Intermediate!4081 (undefined!4893 Bool) (index!18514 (_ BitVec 32)) (x!47533 (_ BitVec 32))) (Undefined!4081) (MissingVacant!4081 (index!18515 (_ BitVec 32))) )
))
(declare-fun lt!230012 () SeekEntryResult!4081)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505019 (= res!306246 (or (= lt!230012 (MissingZero!4081 i!1204)) (= lt!230012 (MissingVacant!4081 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32474 0))(
  ( (array!32475 (arr!15617 (Array (_ BitVec 32) (_ BitVec 64))) (size!15982 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32474)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505019 (= lt!230012 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505020 () Bool)

(declare-fun e!295635 () Bool)

(declare-fun e!295627 () Bool)

(assert (=> b!505020 (= e!295635 e!295627)))

(declare-fun res!306254 () Bool)

(assert (=> b!505020 (=> res!306254 e!295627)))

(declare-fun lt!230009 () SeekEntryResult!4081)

(declare-fun lt!230016 () (_ BitVec 32))

(assert (=> b!505020 (= res!306254 (or (bvsgt (x!47533 lt!230009) #b01111111111111111111111111111110) (bvslt lt!230016 #b00000000000000000000000000000000) (bvsge lt!230016 (size!15982 a!3235)) (bvslt (index!18514 lt!230009) #b00000000000000000000000000000000) (bvsge (index!18514 lt!230009) (size!15982 a!3235)) (not (= lt!230009 (Intermediate!4081 false (index!18514 lt!230009) (x!47533 lt!230009))))))))

(assert (=> b!505020 (= (index!18514 lt!230009) i!1204)))

(declare-fun lt!230013 () Unit!15394)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15394)

(assert (=> b!505020 (= lt!230013 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230016 #b00000000000000000000000000000000 (index!18514 lt!230009) (x!47533 lt!230009) mask!3524))))

(assert (=> b!505020 (and (or (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230011 () Unit!15394)

(assert (=> b!505020 (= lt!230011 e!295630)))

(declare-fun c!59667 () Bool)

(assert (=> b!505020 (= c!59667 (= (select (arr!15617 a!3235) (index!18514 lt!230009)) (select (arr!15617 a!3235) j!176)))))

(assert (=> b!505020 (and (bvslt (x!47533 lt!230009) #b01111111111111111111111111111110) (or (= (select (arr!15617 a!3235) (index!18514 lt!230009)) (select (arr!15617 a!3235) j!176)) (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15617 a!3235) (index!18514 lt!230009)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505021 () Bool)

(declare-fun res!306247 () Bool)

(assert (=> b!505021 (=> (not res!306247) (not e!295631))))

(declare-fun arrayContainsKey!0 (array!32474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505021 (= res!306247 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505022 () Bool)

(declare-fun res!306252 () Bool)

(assert (=> b!505022 (=> res!306252 e!295627)))

(declare-fun lt!230020 () SeekEntryResult!4081)

(declare-fun lt!230015 () array!32474)

(declare-fun lt!230017 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505022 (= res!306252 (not (= lt!230020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230016 lt!230017 lt!230015 mask!3524))))))

(declare-fun b!505023 () Bool)

(assert (=> b!505023 (= e!295629 (not e!295635))))

(declare-fun res!306245 () Bool)

(assert (=> b!505023 (=> res!306245 e!295635)))

(get-info :version)

(assert (=> b!505023 (= res!306245 (or (= lt!230009 lt!230020) (undefined!4893 lt!230009) (not ((_ is Intermediate!4081) lt!230009))))))

(declare-fun lt!230014 () (_ BitVec 32))

(assert (=> b!505023 (= lt!230020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230014 lt!230017 lt!230015 mask!3524))))

(assert (=> b!505023 (= lt!230009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230016 (select (arr!15617 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505023 (= lt!230014 (toIndex!0 lt!230017 mask!3524))))

(assert (=> b!505023 (= lt!230017 (select (store (arr!15617 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505023 (= lt!230016 (toIndex!0 (select (arr!15617 a!3235) j!176) mask!3524))))

(assert (=> b!505023 (= lt!230015 (array!32475 (store (arr!15617 a!3235) i!1204 k0!2280) (size!15982 a!3235)))))

(declare-fun lt!230019 () SeekEntryResult!4081)

(assert (=> b!505023 (= lt!230019 (Found!4081 j!176))))

(declare-fun e!295628 () Bool)

(assert (=> b!505023 e!295628))

(declare-fun res!306240 () Bool)

(assert (=> b!505023 (=> (not res!306240) (not e!295628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32474 (_ BitVec 32)) Bool)

(assert (=> b!505023 (= res!306240 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230018 () Unit!15394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15394)

(assert (=> b!505023 (= lt!230018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505024 () Bool)

(assert (=> b!505024 (= e!295627 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!505024 (= (seekEntryOrOpen!0 lt!230017 lt!230015 mask!3524) lt!230019)))

(declare-fun lt!230008 () Unit!15394)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15394)

(assert (=> b!505024 (= lt!230008 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230016 #b00000000000000000000000000000000 (index!18514 lt!230009) (x!47533 lt!230009) mask!3524))))

(declare-fun b!505025 () Bool)

(declare-fun e!295632 () Bool)

(assert (=> b!505025 (= e!295632 false)))

(declare-fun b!505026 () Bool)

(declare-fun res!306248 () Bool)

(assert (=> b!505026 (=> res!306248 e!295627)))

(declare-fun e!295634 () Bool)

(assert (=> b!505026 (= res!306248 e!295634)))

(declare-fun res!306241 () Bool)

(assert (=> b!505026 (=> (not res!306241) (not e!295634))))

(assert (=> b!505026 (= res!306241 (bvsgt #b00000000000000000000000000000000 (x!47533 lt!230009)))))

(declare-fun res!306244 () Bool)

(assert (=> start!45708 (=> (not res!306244) (not e!295631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45708 (= res!306244 (validMask!0 mask!3524))))

(assert (=> start!45708 e!295631))

(assert (=> start!45708 true))

(declare-fun array_inv!11500 (array!32474) Bool)

(assert (=> start!45708 (array_inv!11500 a!3235)))

(declare-fun b!505027 () Bool)

(declare-fun res!306253 () Bool)

(assert (=> b!505027 (=> (not res!306253) (not e!295629))))

(assert (=> b!505027 (= res!306253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505028 () Bool)

(assert (=> b!505028 (= e!295628 (= (seekEntryOrOpen!0 (select (arr!15617 a!3235) j!176) a!3235 mask!3524) (Found!4081 j!176)))))

(declare-fun b!505029 () Bool)

(declare-fun res!306243 () Bool)

(assert (=> b!505029 (=> (not res!306243) (not e!295629))))

(declare-datatypes ((List!9814 0))(
  ( (Nil!9811) (Cons!9810 (h!10687 (_ BitVec 64)) (t!16033 List!9814)) )
))
(declare-fun arrayNoDuplicates!0 (array!32474 (_ BitVec 32) List!9814) Bool)

(assert (=> b!505029 (= res!306243 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9811))))

(declare-fun b!505030 () Bool)

(declare-fun res!306250 () Bool)

(assert (=> b!505030 (=> (not res!306250) (not e!295631))))

(assert (=> b!505030 (= res!306250 (validKeyInArray!0 (select (arr!15617 a!3235) j!176)))))

(declare-fun b!505031 () Bool)

(declare-fun res!306251 () Bool)

(assert (=> b!505031 (=> (not res!306251) (not e!295631))))

(assert (=> b!505031 (= res!306251 (and (= (size!15982 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15982 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15982 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505032 () Bool)

(declare-fun Unit!15397 () Unit!15394)

(assert (=> b!505032 (= e!295630 Unit!15397)))

(declare-fun lt!230010 () Unit!15394)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15394)

(assert (=> b!505032 (= lt!230010 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230016 #b00000000000000000000000000000000 (index!18514 lt!230009) (x!47533 lt!230009) mask!3524))))

(declare-fun res!306249 () Bool)

(assert (=> b!505032 (= res!306249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230016 lt!230017 lt!230015 mask!3524) (Intermediate!4081 false (index!18514 lt!230009) (x!47533 lt!230009))))))

(assert (=> b!505032 (=> (not res!306249) (not e!295632))))

(assert (=> b!505032 e!295632))

(declare-fun b!505033 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505033 (= e!295634 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230016 (index!18514 lt!230009) (select (arr!15617 a!3235) j!176) a!3235 mask!3524) lt!230019)))))

(assert (= (and start!45708 res!306244) b!505031))

(assert (= (and b!505031 res!306251) b!505030))

(assert (= (and b!505030 res!306250) b!505017))

(assert (= (and b!505017 res!306242) b!505021))

(assert (= (and b!505021 res!306247) b!505019))

(assert (= (and b!505019 res!306246) b!505027))

(assert (= (and b!505027 res!306253) b!505029))

(assert (= (and b!505029 res!306243) b!505023))

(assert (= (and b!505023 res!306240) b!505028))

(assert (= (and b!505023 (not res!306245)) b!505020))

(assert (= (and b!505020 c!59667) b!505032))

(assert (= (and b!505020 (not c!59667)) b!505018))

(assert (= (and b!505032 res!306249) b!505025))

(assert (= (and b!505020 (not res!306254)) b!505026))

(assert (= (and b!505026 res!306241) b!505033))

(assert (= (and b!505026 (not res!306248)) b!505022))

(assert (= (and b!505022 (not res!306252)) b!505024))

(declare-fun m!485203 () Bool)

(assert (=> b!505033 m!485203))

(assert (=> b!505033 m!485203))

(declare-fun m!485205 () Bool)

(assert (=> b!505033 m!485205))

(declare-fun m!485207 () Bool)

(assert (=> b!505017 m!485207))

(declare-fun m!485209 () Bool)

(assert (=> b!505022 m!485209))

(declare-fun m!485211 () Bool)

(assert (=> b!505020 m!485211))

(declare-fun m!485213 () Bool)

(assert (=> b!505020 m!485213))

(assert (=> b!505020 m!485203))

(declare-fun m!485215 () Bool)

(assert (=> b!505024 m!485215))

(declare-fun m!485217 () Bool)

(assert (=> b!505024 m!485217))

(declare-fun m!485219 () Bool)

(assert (=> b!505021 m!485219))

(declare-fun m!485221 () Bool)

(assert (=> b!505029 m!485221))

(declare-fun m!485223 () Bool)

(assert (=> b!505032 m!485223))

(assert (=> b!505032 m!485209))

(declare-fun m!485225 () Bool)

(assert (=> b!505019 m!485225))

(assert (=> b!505028 m!485203))

(assert (=> b!505028 m!485203))

(declare-fun m!485227 () Bool)

(assert (=> b!505028 m!485227))

(declare-fun m!485229 () Bool)

(assert (=> b!505027 m!485229))

(assert (=> b!505030 m!485203))

(assert (=> b!505030 m!485203))

(declare-fun m!485231 () Bool)

(assert (=> b!505030 m!485231))

(declare-fun m!485233 () Bool)

(assert (=> b!505023 m!485233))

(declare-fun m!485235 () Bool)

(assert (=> b!505023 m!485235))

(declare-fun m!485237 () Bool)

(assert (=> b!505023 m!485237))

(declare-fun m!485239 () Bool)

(assert (=> b!505023 m!485239))

(assert (=> b!505023 m!485203))

(declare-fun m!485241 () Bool)

(assert (=> b!505023 m!485241))

(assert (=> b!505023 m!485203))

(declare-fun m!485243 () Bool)

(assert (=> b!505023 m!485243))

(declare-fun m!485245 () Bool)

(assert (=> b!505023 m!485245))

(assert (=> b!505023 m!485203))

(declare-fun m!485247 () Bool)

(assert (=> b!505023 m!485247))

(declare-fun m!485249 () Bool)

(assert (=> start!45708 m!485249))

(declare-fun m!485251 () Bool)

(assert (=> start!45708 m!485251))

(check-sat (not b!505017) (not b!505033) (not b!505023) (not b!505019) (not b!505020) (not b!505029) (not b!505032) (not b!505021) (not b!505030) (not b!505028) (not b!505022) (not b!505024) (not start!45708) (not b!505027))
(check-sat)
