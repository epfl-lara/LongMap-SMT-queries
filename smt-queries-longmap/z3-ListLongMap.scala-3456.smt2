; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47994 () Bool)

(assert start!47994)

(declare-fun b!528246 () Bool)

(declare-datatypes ((Unit!16690 0))(
  ( (Unit!16691) )
))
(declare-fun e!307838 () Unit!16690)

(declare-fun Unit!16692 () Unit!16690)

(assert (=> b!528246 (= e!307838 Unit!16692)))

(declare-datatypes ((SeekEntryResult!4561 0))(
  ( (MissingZero!4561 (index!20468 (_ BitVec 32))) (Found!4561 (index!20469 (_ BitVec 32))) (Intermediate!4561 (undefined!5373 Bool) (index!20470 (_ BitVec 32)) (x!49452 (_ BitVec 32))) (Undefined!4561) (MissingVacant!4561 (index!20471 (_ BitVec 32))) )
))
(declare-fun lt!243172 () SeekEntryResult!4561)

(declare-fun lt!243177 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33497 0))(
  ( (array!33498 (arr!16097 (Array (_ BitVec 32) (_ BitVec 64))) (size!16462 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33497)

(declare-fun lt!243180 () Unit!16690)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16690)

(assert (=> b!528246 (= lt!243180 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243177 #b00000000000000000000000000000000 (index!20470 lt!243172) (x!49452 lt!243172) mask!3524))))

(declare-fun lt!243181 () (_ BitVec 64))

(declare-fun lt!243179 () array!33497)

(declare-fun res!324366 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!528246 (= res!324366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243177 lt!243181 lt!243179 mask!3524) (Intermediate!4561 false (index!20470 lt!243172) (x!49452 lt!243172))))))

(declare-fun e!307833 () Bool)

(assert (=> b!528246 (=> (not res!324366) (not e!307833))))

(assert (=> b!528246 e!307833))

(declare-fun b!528247 () Bool)

(declare-fun Unit!16693 () Unit!16690)

(assert (=> b!528247 (= e!307838 Unit!16693)))

(declare-fun b!528248 () Bool)

(declare-fun res!324373 () Bool)

(declare-fun e!307835 () Bool)

(assert (=> b!528248 (=> (not res!324373) (not e!307835))))

(assert (=> b!528248 (= res!324373 (and (= (size!16462 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16462 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16462 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528249 () Bool)

(assert (=> b!528249 (= e!307833 false)))

(declare-fun b!528250 () Bool)

(declare-fun res!324367 () Bool)

(declare-fun e!307831 () Bool)

(assert (=> b!528250 (=> res!324367 e!307831)))

(declare-fun lt!243174 () SeekEntryResult!4561)

(assert (=> b!528250 (= res!324367 (not (= lt!243174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243177 lt!243181 lt!243179 mask!3524))))))

(declare-fun b!528251 () Bool)

(declare-fun e!307839 () Bool)

(assert (=> b!528251 (= e!307839 e!307831)))

(declare-fun res!324369 () Bool)

(assert (=> b!528251 (=> res!324369 e!307831)))

(assert (=> b!528251 (= res!324369 (or (bvsgt (x!49452 lt!243172) #b01111111111111111111111111111110) (bvslt lt!243177 #b00000000000000000000000000000000) (bvsge lt!243177 (size!16462 a!3235)) (bvslt (index!20470 lt!243172) #b00000000000000000000000000000000) (bvsge (index!20470 lt!243172) (size!16462 a!3235)) (not (= lt!243172 (Intermediate!4561 false (index!20470 lt!243172) (x!49452 lt!243172))))))))

(assert (=> b!528251 (= (index!20470 lt!243172) i!1204)))

(declare-fun lt!243173 () Unit!16690)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16690)

(assert (=> b!528251 (= lt!243173 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243177 #b00000000000000000000000000000000 (index!20470 lt!243172) (x!49452 lt!243172) mask!3524))))

(assert (=> b!528251 (and (or (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243178 () Unit!16690)

(assert (=> b!528251 (= lt!243178 e!307838)))

(declare-fun c!62250 () Bool)

(assert (=> b!528251 (= c!62250 (= (select (arr!16097 a!3235) (index!20470 lt!243172)) (select (arr!16097 a!3235) j!176)))))

(assert (=> b!528251 (and (bvslt (x!49452 lt!243172) #b01111111111111111111111111111110) (or (= (select (arr!16097 a!3235) (index!20470 lt!243172)) (select (arr!16097 a!3235) j!176)) (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16097 a!3235) (index!20470 lt!243172)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528252 () Bool)

(declare-fun e!307832 () Bool)

(assert (=> b!528252 (= e!307835 e!307832)))

(declare-fun res!324372 () Bool)

(assert (=> b!528252 (=> (not res!324372) (not e!307832))))

(declare-fun lt!243170 () SeekEntryResult!4561)

(assert (=> b!528252 (= res!324372 (or (= lt!243170 (MissingZero!4561 i!1204)) (= lt!243170 (MissingVacant!4561 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!528252 (= lt!243170 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528253 () Bool)

(declare-fun res!324370 () Bool)

(assert (=> b!528253 (=> (not res!324370) (not e!307835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528253 (= res!324370 (validKeyInArray!0 (select (arr!16097 a!3235) j!176)))))

(declare-fun b!528254 () Bool)

(assert (=> b!528254 (= e!307832 (not e!307839))))

(declare-fun res!324374 () Bool)

(assert (=> b!528254 (=> res!324374 e!307839)))

(get-info :version)

(assert (=> b!528254 (= res!324374 (or (= lt!243172 lt!243174) (undefined!5373 lt!243172) (not ((_ is Intermediate!4561) lt!243172))))))

(declare-fun lt!243175 () (_ BitVec 32))

(assert (=> b!528254 (= lt!243174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243175 lt!243181 lt!243179 mask!3524))))

(assert (=> b!528254 (= lt!243172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243177 (select (arr!16097 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528254 (= lt!243175 (toIndex!0 lt!243181 mask!3524))))

(assert (=> b!528254 (= lt!243181 (select (store (arr!16097 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528254 (= lt!243177 (toIndex!0 (select (arr!16097 a!3235) j!176) mask!3524))))

(assert (=> b!528254 (= lt!243179 (array!33498 (store (arr!16097 a!3235) i!1204 k0!2280) (size!16462 a!3235)))))

(declare-fun lt!243169 () SeekEntryResult!4561)

(assert (=> b!528254 (= lt!243169 (Found!4561 j!176))))

(declare-fun e!307837 () Bool)

(assert (=> b!528254 e!307837))

(declare-fun res!324371 () Bool)

(assert (=> b!528254 (=> (not res!324371) (not e!307837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33497 (_ BitVec 32)) Bool)

(assert (=> b!528254 (= res!324371 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243176 () Unit!16690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16690)

(assert (=> b!528254 (= lt!243176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528255 () Bool)

(assert (=> b!528255 (= e!307831 true)))

(assert (=> b!528255 (= (seekEntryOrOpen!0 lt!243181 lt!243179 mask!3524) lt!243169)))

(declare-fun lt!243171 () Unit!16690)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16690)

(assert (=> b!528255 (= lt!243171 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243177 #b00000000000000000000000000000000 (index!20470 lt!243172) (x!49452 lt!243172) mask!3524))))

(declare-fun b!528256 () Bool)

(assert (=> b!528256 (= e!307837 (= (seekEntryOrOpen!0 (select (arr!16097 a!3235) j!176) a!3235 mask!3524) (Found!4561 j!176)))))

(declare-fun b!528257 () Bool)

(declare-fun res!324364 () Bool)

(assert (=> b!528257 (=> (not res!324364) (not e!307835))))

(declare-fun arrayContainsKey!0 (array!33497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528257 (= res!324364 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528258 () Bool)

(declare-fun res!324375 () Bool)

(assert (=> b!528258 (=> (not res!324375) (not e!307832))))

(assert (=> b!528258 (= res!324375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528260 () Bool)

(declare-fun res!324377 () Bool)

(assert (=> b!528260 (=> (not res!324377) (not e!307832))))

(declare-datatypes ((List!10294 0))(
  ( (Nil!10291) (Cons!10290 (h!11227 (_ BitVec 64)) (t!16513 List!10294)) )
))
(declare-fun arrayNoDuplicates!0 (array!33497 (_ BitVec 32) List!10294) Bool)

(assert (=> b!528260 (= res!324377 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10291))))

(declare-fun b!528261 () Bool)

(declare-fun res!324368 () Bool)

(assert (=> b!528261 (=> (not res!324368) (not e!307835))))

(assert (=> b!528261 (= res!324368 (validKeyInArray!0 k0!2280))))

(declare-fun b!528262 () Bool)

(declare-fun e!307834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33497 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!528262 (= e!307834 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243177 (index!20470 lt!243172) (select (arr!16097 a!3235) j!176) a!3235 mask!3524) lt!243169)))))

(declare-fun b!528259 () Bool)

(declare-fun res!324363 () Bool)

(assert (=> b!528259 (=> res!324363 e!307831)))

(assert (=> b!528259 (= res!324363 e!307834)))

(declare-fun res!324376 () Bool)

(assert (=> b!528259 (=> (not res!324376) (not e!307834))))

(assert (=> b!528259 (= res!324376 (bvsgt #b00000000000000000000000000000000 (x!49452 lt!243172)))))

(declare-fun res!324365 () Bool)

(assert (=> start!47994 (=> (not res!324365) (not e!307835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47994 (= res!324365 (validMask!0 mask!3524))))

(assert (=> start!47994 e!307835))

(assert (=> start!47994 true))

(declare-fun array_inv!11980 (array!33497) Bool)

(assert (=> start!47994 (array_inv!11980 a!3235)))

(assert (= (and start!47994 res!324365) b!528248))

(assert (= (and b!528248 res!324373) b!528253))

(assert (= (and b!528253 res!324370) b!528261))

(assert (= (and b!528261 res!324368) b!528257))

(assert (= (and b!528257 res!324364) b!528252))

(assert (= (and b!528252 res!324372) b!528258))

(assert (= (and b!528258 res!324375) b!528260))

(assert (= (and b!528260 res!324377) b!528254))

(assert (= (and b!528254 res!324371) b!528256))

(assert (= (and b!528254 (not res!324374)) b!528251))

(assert (= (and b!528251 c!62250) b!528246))

(assert (= (and b!528251 (not c!62250)) b!528247))

(assert (= (and b!528246 res!324366) b!528249))

(assert (= (and b!528251 (not res!324369)) b!528259))

(assert (= (and b!528259 res!324376) b!528262))

(assert (= (and b!528259 (not res!324363)) b!528250))

(assert (= (and b!528250 (not res!324367)) b!528255))

(declare-fun m!508303 () Bool)

(assert (=> b!528260 m!508303))

(declare-fun m!508305 () Bool)

(assert (=> b!528261 m!508305))

(declare-fun m!508307 () Bool)

(assert (=> b!528258 m!508307))

(declare-fun m!508309 () Bool)

(assert (=> b!528255 m!508309))

(declare-fun m!508311 () Bool)

(assert (=> b!528255 m!508311))

(declare-fun m!508313 () Bool)

(assert (=> b!528251 m!508313))

(declare-fun m!508315 () Bool)

(assert (=> b!528251 m!508315))

(declare-fun m!508317 () Bool)

(assert (=> b!528251 m!508317))

(declare-fun m!508319 () Bool)

(assert (=> b!528257 m!508319))

(declare-fun m!508321 () Bool)

(assert (=> start!47994 m!508321))

(declare-fun m!508323 () Bool)

(assert (=> start!47994 m!508323))

(declare-fun m!508325 () Bool)

(assert (=> b!528250 m!508325))

(assert (=> b!528262 m!508317))

(assert (=> b!528262 m!508317))

(declare-fun m!508327 () Bool)

(assert (=> b!528262 m!508327))

(declare-fun m!508329 () Bool)

(assert (=> b!528254 m!508329))

(declare-fun m!508331 () Bool)

(assert (=> b!528254 m!508331))

(declare-fun m!508333 () Bool)

(assert (=> b!528254 m!508333))

(assert (=> b!528254 m!508317))

(declare-fun m!508335 () Bool)

(assert (=> b!528254 m!508335))

(assert (=> b!528254 m!508317))

(declare-fun m!508337 () Bool)

(assert (=> b!528254 m!508337))

(declare-fun m!508339 () Bool)

(assert (=> b!528254 m!508339))

(declare-fun m!508341 () Bool)

(assert (=> b!528254 m!508341))

(assert (=> b!528254 m!508317))

(declare-fun m!508343 () Bool)

(assert (=> b!528254 m!508343))

(declare-fun m!508345 () Bool)

(assert (=> b!528252 m!508345))

(assert (=> b!528253 m!508317))

(assert (=> b!528253 m!508317))

(declare-fun m!508347 () Bool)

(assert (=> b!528253 m!508347))

(assert (=> b!528256 m!508317))

(assert (=> b!528256 m!508317))

(declare-fun m!508349 () Bool)

(assert (=> b!528256 m!508349))

(declare-fun m!508351 () Bool)

(assert (=> b!528246 m!508351))

(assert (=> b!528246 m!508325))

(check-sat (not start!47994) (not b!528262) (not b!528252) (not b!528255) (not b!528254) (not b!528251) (not b!528257) (not b!528260) (not b!528250) (not b!528261) (not b!528253) (not b!528256) (not b!528258) (not b!528246))
(check-sat)
