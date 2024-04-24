; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59058 () Bool)

(assert start!59058)

(declare-fun b!651411 () Bool)

(declare-fun res!422347 () Bool)

(declare-fun e!373795 () Bool)

(assert (=> b!651411 (=> (not res!422347) (not e!373795))))

(declare-datatypes ((array!38577 0))(
  ( (array!38578 (arr!18490 (Array (_ BitVec 32) (_ BitVec 64))) (size!18854 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38577)

(declare-datatypes ((List!12438 0))(
  ( (Nil!12435) (Cons!12434 (h!13482 (_ BitVec 64)) (t!18658 List!12438)) )
))
(declare-fun arrayNoDuplicates!0 (array!38577 (_ BitVec 32) List!12438) Bool)

(assert (=> b!651411 (= res!422347 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12435))))

(declare-fun b!651412 () Bool)

(declare-fun e!373787 () Bool)

(assert (=> b!651412 (= e!373787 e!373795)))

(declare-fun res!422351 () Bool)

(assert (=> b!651412 (=> (not res!422351) (not e!373795))))

(declare-datatypes ((SeekEntryResult!6886 0))(
  ( (MissingZero!6886 (index!29894 (_ BitVec 32))) (Found!6886 (index!29895 (_ BitVec 32))) (Intermediate!6886 (undefined!7698 Bool) (index!29896 (_ BitVec 32)) (x!58831 (_ BitVec 32))) (Undefined!6886) (MissingVacant!6886 (index!29897 (_ BitVec 32))) )
))
(declare-fun lt!302864 () SeekEntryResult!6886)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651412 (= res!422351 (or (= lt!302864 (MissingZero!6886 i!1108)) (= lt!302864 (MissingVacant!6886 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38577 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!651412 (= lt!302864 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651413 () Bool)

(declare-fun e!373788 () Bool)

(assert (=> b!651413 (= e!373795 e!373788)))

(declare-fun res!422350 () Bool)

(assert (=> b!651413 (=> (not res!422350) (not e!373788))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651413 (= res!422350 (= (select (store (arr!18490 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!302869 () array!38577)

(assert (=> b!651413 (= lt!302869 (array!38578 (store (arr!18490 a!2986) i!1108 k0!1786) (size!18854 a!2986)))))

(declare-fun b!651414 () Bool)

(declare-fun e!373785 () Bool)

(assert (=> b!651414 (= e!373785 (bvslt (size!18854 a!2986) #b01111111111111111111111111111111))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651414 (arrayNoDuplicates!0 lt!302869 index!984 Nil!12435)))

(declare-datatypes ((Unit!22215 0))(
  ( (Unit!22216) )
))
(declare-fun lt!302860 () Unit!22215)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38577 (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> b!651414 (= lt!302860 (lemmaNoDuplicateFromThenFromBigger!0 lt!302869 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651414 (arrayNoDuplicates!0 lt!302869 #b00000000000000000000000000000000 Nil!12435)))

(declare-fun lt!302863 () Unit!22215)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12438) Unit!22215)

(assert (=> b!651414 (= lt!302863 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12435))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651414 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302867 () Unit!22215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> b!651414 (= lt!302867 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373792 () Bool)

(assert (=> b!651414 e!373792))

(declare-fun res!422346 () Bool)

(assert (=> b!651414 (=> (not res!422346) (not e!373792))))

(assert (=> b!651414 (= res!422346 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136))))

(declare-fun b!651415 () Bool)

(assert (=> b!651415 (= e!373792 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) index!984))))

(declare-fun b!651416 () Bool)

(declare-fun e!373797 () Unit!22215)

(declare-fun Unit!22217 () Unit!22215)

(assert (=> b!651416 (= e!373797 Unit!22217)))

(declare-fun lt!302862 () Unit!22215)

(assert (=> b!651416 (= lt!302862 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302869 (select (arr!18490 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651416 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302855 () Unit!22215)

(assert (=> b!651416 (= lt!302855 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12435))))

(assert (=> b!651416 (arrayNoDuplicates!0 lt!302869 #b00000000000000000000000000000000 Nil!12435)))

(declare-fun lt!302858 () Unit!22215)

(assert (=> b!651416 (= lt!302858 (lemmaNoDuplicateFromThenFromBigger!0 lt!302869 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651416 (arrayNoDuplicates!0 lt!302869 j!136 Nil!12435)))

(declare-fun lt!302854 () Unit!22215)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38577 (_ BitVec 64) (_ BitVec 32) List!12438) Unit!22215)

(assert (=> b!651416 (= lt!302854 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136 Nil!12435))))

(assert (=> b!651416 false))

(declare-fun b!651417 () Bool)

(declare-fun res!422345 () Bool)

(assert (=> b!651417 (=> (not res!422345) (not e!373787))))

(assert (=> b!651417 (= res!422345 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651418 () Bool)

(declare-fun res!422358 () Bool)

(assert (=> b!651418 (=> (not res!422358) (not e!373787))))

(assert (=> b!651418 (= res!422358 (and (= (size!18854 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18854 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18854 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651419 () Bool)

(declare-fun e!373791 () Unit!22215)

(declare-fun Unit!22218 () Unit!22215)

(assert (=> b!651419 (= e!373791 Unit!22218)))

(declare-fun b!651420 () Bool)

(declare-fun e!373783 () Bool)

(assert (=> b!651420 (= e!373788 e!373783)))

(declare-fun res!422357 () Bool)

(assert (=> b!651420 (=> (not res!422357) (not e!373783))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302856 () SeekEntryResult!6886)

(assert (=> b!651420 (= res!422357 (and (= lt!302856 (Found!6886 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18490 a!2986) index!984) (select (arr!18490 a!2986) j!136))) (not (= (select (arr!18490 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38577 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!651420 (= lt!302856 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651421 () Bool)

(declare-fun res!422362 () Bool)

(assert (=> b!651421 (=> (not res!422362) (not e!373795))))

(assert (=> b!651421 (= res!422362 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18490 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651423 () Bool)

(declare-fun e!373794 () Bool)

(declare-fun e!373796 () Bool)

(assert (=> b!651423 (= e!373794 e!373796)))

(declare-fun res!422348 () Bool)

(assert (=> b!651423 (=> res!422348 e!373796)))

(declare-fun lt!302853 () (_ BitVec 64))

(declare-fun lt!302866 () (_ BitVec 64))

(assert (=> b!651423 (= res!422348 (or (not (= (select (arr!18490 a!2986) j!136) lt!302866)) (not (= (select (arr!18490 a!2986) j!136) lt!302853))))))

(declare-fun e!373790 () Bool)

(assert (=> b!651423 e!373790))

(declare-fun res!422360 () Bool)

(assert (=> b!651423 (=> (not res!422360) (not e!373790))))

(assert (=> b!651423 (= res!422360 (= lt!302853 (select (arr!18490 a!2986) j!136)))))

(assert (=> b!651423 (= lt!302853 (select (store (arr!18490 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651424 () Bool)

(declare-fun e!373789 () Bool)

(assert (=> b!651424 (= e!373789 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) index!984))))

(declare-fun b!651425 () Bool)

(declare-fun Unit!22219 () Unit!22215)

(assert (=> b!651425 (= e!373797 Unit!22219)))

(declare-fun b!651426 () Bool)

(declare-fun e!373784 () Bool)

(assert (=> b!651426 (= e!373784 e!373789)))

(declare-fun res!422354 () Bool)

(assert (=> b!651426 (=> (not res!422354) (not e!373789))))

(assert (=> b!651426 (= res!422354 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136))))

(declare-fun b!651427 () Bool)

(declare-fun res!422352 () Bool)

(assert (=> b!651427 (=> (not res!422352) (not e!373787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651427 (= res!422352 (validKeyInArray!0 (select (arr!18490 a!2986) j!136)))))

(declare-fun res!422344 () Bool)

(assert (=> start!59058 (=> (not res!422344) (not e!373787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59058 (= res!422344 (validMask!0 mask!3053))))

(assert (=> start!59058 e!373787))

(assert (=> start!59058 true))

(declare-fun array_inv!14349 (array!38577) Bool)

(assert (=> start!59058 (array_inv!14349 a!2986)))

(declare-fun b!651422 () Bool)

(assert (=> b!651422 (= e!373796 e!373785)))

(declare-fun res!422349 () Bool)

(assert (=> b!651422 (=> res!422349 e!373785)))

(assert (=> b!651422 (= res!422349 (bvsge index!984 j!136))))

(declare-fun lt!302857 () Unit!22215)

(assert (=> b!651422 (= lt!302857 e!373797)))

(declare-fun c!74902 () Bool)

(assert (=> b!651422 (= c!74902 (bvslt j!136 index!984))))

(declare-fun b!651428 () Bool)

(assert (=> b!651428 (= e!373783 (not e!373794))))

(declare-fun res!422356 () Bool)

(assert (=> b!651428 (=> res!422356 e!373794)))

(declare-fun lt!302865 () SeekEntryResult!6886)

(assert (=> b!651428 (= res!422356 (not (= lt!302865 (Found!6886 index!984))))))

(declare-fun lt!302859 () Unit!22215)

(assert (=> b!651428 (= lt!302859 e!373791)))

(declare-fun c!74903 () Bool)

(assert (=> b!651428 (= c!74903 (= lt!302865 Undefined!6886))))

(assert (=> b!651428 (= lt!302865 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302866 lt!302869 mask!3053))))

(declare-fun e!373793 () Bool)

(assert (=> b!651428 e!373793))

(declare-fun res!422359 () Bool)

(assert (=> b!651428 (=> (not res!422359) (not e!373793))))

(declare-fun lt!302868 () (_ BitVec 32))

(declare-fun lt!302861 () SeekEntryResult!6886)

(assert (=> b!651428 (= res!422359 (= lt!302861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 lt!302866 lt!302869 mask!3053)))))

(assert (=> b!651428 (= lt!302861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651428 (= lt!302866 (select (store (arr!18490 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302852 () Unit!22215)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> b!651428 (= lt!302852 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651428 (= lt!302868 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!651429 () Bool)

(declare-fun res!422361 () Bool)

(assert (=> b!651429 (=> (not res!422361) (not e!373795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38577 (_ BitVec 32)) Bool)

(assert (=> b!651429 (= res!422361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651430 () Bool)

(assert (=> b!651430 (= e!373793 (= lt!302856 lt!302861))))

(declare-fun b!651431 () Bool)

(declare-fun Unit!22220 () Unit!22215)

(assert (=> b!651431 (= e!373791 Unit!22220)))

(assert (=> b!651431 false))

(declare-fun b!651432 () Bool)

(assert (=> b!651432 (= e!373790 e!373784)))

(declare-fun res!422355 () Bool)

(assert (=> b!651432 (=> res!422355 e!373784)))

(assert (=> b!651432 (= res!422355 (or (not (= (select (arr!18490 a!2986) j!136) lt!302866)) (not (= (select (arr!18490 a!2986) j!136) lt!302853)) (bvsge j!136 index!984)))))

(declare-fun b!651433 () Bool)

(declare-fun res!422353 () Bool)

(assert (=> b!651433 (=> (not res!422353) (not e!373787))))

(assert (=> b!651433 (= res!422353 (validKeyInArray!0 k0!1786))))

(assert (= (and start!59058 res!422344) b!651418))

(assert (= (and b!651418 res!422358) b!651427))

(assert (= (and b!651427 res!422352) b!651433))

(assert (= (and b!651433 res!422353) b!651417))

(assert (= (and b!651417 res!422345) b!651412))

(assert (= (and b!651412 res!422351) b!651429))

(assert (= (and b!651429 res!422361) b!651411))

(assert (= (and b!651411 res!422347) b!651421))

(assert (= (and b!651421 res!422362) b!651413))

(assert (= (and b!651413 res!422350) b!651420))

(assert (= (and b!651420 res!422357) b!651428))

(assert (= (and b!651428 res!422359) b!651430))

(assert (= (and b!651428 c!74903) b!651431))

(assert (= (and b!651428 (not c!74903)) b!651419))

(assert (= (and b!651428 (not res!422356)) b!651423))

(assert (= (and b!651423 res!422360) b!651432))

(assert (= (and b!651432 (not res!422355)) b!651426))

(assert (= (and b!651426 res!422354) b!651424))

(assert (= (and b!651423 (not res!422348)) b!651422))

(assert (= (and b!651422 c!74902) b!651416))

(assert (= (and b!651422 (not c!74902)) b!651425))

(assert (= (and b!651422 (not res!422349)) b!651414))

(assert (= (and b!651414 res!422346) b!651415))

(declare-fun m!624997 () Bool)

(assert (=> b!651411 m!624997))

(declare-fun m!624999 () Bool)

(assert (=> b!651420 m!624999))

(declare-fun m!625001 () Bool)

(assert (=> b!651420 m!625001))

(assert (=> b!651420 m!625001))

(declare-fun m!625003 () Bool)

(assert (=> b!651420 m!625003))

(assert (=> b!651416 m!625001))

(declare-fun m!625005 () Bool)

(assert (=> b!651416 m!625005))

(assert (=> b!651416 m!625001))

(declare-fun m!625007 () Bool)

(assert (=> b!651416 m!625007))

(declare-fun m!625009 () Bool)

(assert (=> b!651416 m!625009))

(declare-fun m!625011 () Bool)

(assert (=> b!651416 m!625011))

(assert (=> b!651416 m!625001))

(declare-fun m!625013 () Bool)

(assert (=> b!651416 m!625013))

(assert (=> b!651416 m!625001))

(declare-fun m!625015 () Bool)

(assert (=> b!651416 m!625015))

(declare-fun m!625017 () Bool)

(assert (=> b!651416 m!625017))

(assert (=> b!651427 m!625001))

(assert (=> b!651427 m!625001))

(declare-fun m!625019 () Bool)

(assert (=> b!651427 m!625019))

(assert (=> b!651423 m!625001))

(declare-fun m!625021 () Bool)

(assert (=> b!651423 m!625021))

(declare-fun m!625023 () Bool)

(assert (=> b!651423 m!625023))

(declare-fun m!625025 () Bool)

(assert (=> start!59058 m!625025))

(declare-fun m!625027 () Bool)

(assert (=> start!59058 m!625027))

(declare-fun m!625029 () Bool)

(assert (=> b!651421 m!625029))

(assert (=> b!651414 m!625001))

(declare-fun m!625031 () Bool)

(assert (=> b!651414 m!625031))

(assert (=> b!651414 m!625001))

(assert (=> b!651414 m!625001))

(declare-fun m!625033 () Bool)

(assert (=> b!651414 m!625033))

(declare-fun m!625035 () Bool)

(assert (=> b!651414 m!625035))

(assert (=> b!651414 m!625009))

(declare-fun m!625037 () Bool)

(assert (=> b!651414 m!625037))

(assert (=> b!651414 m!625001))

(declare-fun m!625039 () Bool)

(assert (=> b!651414 m!625039))

(assert (=> b!651414 m!625017))

(declare-fun m!625041 () Bool)

(assert (=> b!651428 m!625041))

(assert (=> b!651428 m!625001))

(declare-fun m!625043 () Bool)

(assert (=> b!651428 m!625043))

(assert (=> b!651428 m!625021))

(declare-fun m!625045 () Bool)

(assert (=> b!651428 m!625045))

(assert (=> b!651428 m!625001))

(declare-fun m!625047 () Bool)

(assert (=> b!651428 m!625047))

(declare-fun m!625049 () Bool)

(assert (=> b!651428 m!625049))

(declare-fun m!625051 () Bool)

(assert (=> b!651428 m!625051))

(assert (=> b!651424 m!625001))

(assert (=> b!651424 m!625001))

(declare-fun m!625053 () Bool)

(assert (=> b!651424 m!625053))

(assert (=> b!651413 m!625021))

(declare-fun m!625055 () Bool)

(assert (=> b!651413 m!625055))

(assert (=> b!651415 m!625001))

(assert (=> b!651415 m!625001))

(assert (=> b!651415 m!625053))

(assert (=> b!651432 m!625001))

(declare-fun m!625057 () Bool)

(assert (=> b!651412 m!625057))

(assert (=> b!651426 m!625001))

(assert (=> b!651426 m!625001))

(assert (=> b!651426 m!625033))

(declare-fun m!625059 () Bool)

(assert (=> b!651429 m!625059))

(declare-fun m!625061 () Bool)

(assert (=> b!651417 m!625061))

(declare-fun m!625063 () Bool)

(assert (=> b!651433 m!625063))

(check-sat (not b!651417) (not b!651411) (not b!651427) (not b!651426) (not b!651429) (not start!59058) (not b!651433) (not b!651416) (not b!651414) (not b!651428) (not b!651412) (not b!651420) (not b!651424) (not b!651415))
(check-sat)
(get-model)

(declare-fun b!651585 () Bool)

(declare-fun e!373895 () SeekEntryResult!6886)

(assert (=> b!651585 (= e!373895 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!651586 () Bool)

(declare-fun c!74922 () Bool)

(declare-fun lt!302982 () (_ BitVec 64))

(assert (=> b!651586 (= c!74922 (= lt!302982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373896 () SeekEntryResult!6886)

(assert (=> b!651586 (= e!373896 e!373895)))

(declare-fun b!651587 () Bool)

(assert (=> b!651587 (= e!373895 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651588 () Bool)

(declare-fun e!373894 () SeekEntryResult!6886)

(assert (=> b!651588 (= e!373894 Undefined!6886)))

(declare-fun b!651589 () Bool)

(assert (=> b!651589 (= e!373894 e!373896)))

(declare-fun c!74924 () Bool)

(assert (=> b!651589 (= c!74924 (= lt!302982 (select (arr!18490 a!2986) j!136)))))

(declare-fun d!92171 () Bool)

(declare-fun lt!302983 () SeekEntryResult!6886)

(get-info :version)

(assert (=> d!92171 (and (or ((_ is Undefined!6886) lt!302983) (not ((_ is Found!6886) lt!302983)) (and (bvsge (index!29895 lt!302983) #b00000000000000000000000000000000) (bvslt (index!29895 lt!302983) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!302983) ((_ is Found!6886) lt!302983) (not ((_ is MissingVacant!6886) lt!302983)) (not (= (index!29897 lt!302983) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!302983) #b00000000000000000000000000000000) (bvslt (index!29897 lt!302983) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!302983) (ite ((_ is Found!6886) lt!302983) (= (select (arr!18490 a!2986) (index!29895 lt!302983)) (select (arr!18490 a!2986) j!136)) (and ((_ is MissingVacant!6886) lt!302983) (= (index!29897 lt!302983) vacantSpotIndex!68) (= (select (arr!18490 a!2986) (index!29897 lt!302983)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92171 (= lt!302983 e!373894)))

(declare-fun c!74923 () Bool)

(assert (=> d!92171 (= c!74923 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92171 (= lt!302982 (select (arr!18490 a!2986) index!984))))

(assert (=> d!92171 (validMask!0 mask!3053)))

(assert (=> d!92171 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053) lt!302983)))

(declare-fun b!651584 () Bool)

(assert (=> b!651584 (= e!373896 (Found!6886 index!984))))

(assert (= (and d!92171 c!74923) b!651588))

(assert (= (and d!92171 (not c!74923)) b!651589))

(assert (= (and b!651589 c!74924) b!651584))

(assert (= (and b!651589 (not c!74924)) b!651586))

(assert (= (and b!651586 c!74922) b!651585))

(assert (= (and b!651586 (not c!74922)) b!651587))

(declare-fun m!625201 () Bool)

(assert (=> b!651587 m!625201))

(assert (=> b!651587 m!625201))

(assert (=> b!651587 m!625001))

(declare-fun m!625203 () Bool)

(assert (=> b!651587 m!625203))

(declare-fun m!625205 () Bool)

(assert (=> d!92171 m!625205))

(declare-fun m!625207 () Bool)

(assert (=> d!92171 m!625207))

(assert (=> d!92171 m!624999))

(assert (=> d!92171 m!625025))

(assert (=> b!651420 d!92171))

(declare-fun d!92173 () Bool)

(declare-fun res!422481 () Bool)

(declare-fun e!373901 () Bool)

(assert (=> d!92173 (=> res!422481 e!373901)))

(assert (=> d!92173 (= res!422481 (= (select (arr!18490 lt!302869) index!984) (select (arr!18490 a!2986) j!136)))))

(assert (=> d!92173 (= (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) index!984) e!373901)))

(declare-fun b!651594 () Bool)

(declare-fun e!373902 () Bool)

(assert (=> b!651594 (= e!373901 e!373902)))

(declare-fun res!422482 () Bool)

(assert (=> b!651594 (=> (not res!422482) (not e!373902))))

(assert (=> b!651594 (= res!422482 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18854 lt!302869)))))

(declare-fun b!651595 () Bool)

(assert (=> b!651595 (= e!373902 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92173 (not res!422481)) b!651594))

(assert (= (and b!651594 res!422482) b!651595))

(declare-fun m!625209 () Bool)

(assert (=> d!92173 m!625209))

(assert (=> b!651595 m!625001))

(declare-fun m!625211 () Bool)

(assert (=> b!651595 m!625211))

(assert (=> b!651424 d!92173))

(declare-fun b!651606 () Bool)

(declare-fun e!373914 () Bool)

(declare-fun call!33762 () Bool)

(assert (=> b!651606 (= e!373914 call!33762)))

(declare-fun b!651607 () Bool)

(declare-fun e!373912 () Bool)

(assert (=> b!651607 (= e!373912 e!373914)))

(declare-fun c!74927 () Bool)

(assert (=> b!651607 (= c!74927 (validKeyInArray!0 (select (arr!18490 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33759 () Bool)

(assert (=> bm!33759 (= call!33762 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74927 (Cons!12434 (select (arr!18490 a!2986) #b00000000000000000000000000000000) Nil!12435) Nil!12435)))))

(declare-fun d!92175 () Bool)

(declare-fun res!422489 () Bool)

(declare-fun e!373913 () Bool)

(assert (=> d!92175 (=> res!422489 e!373913)))

(assert (=> d!92175 (= res!422489 (bvsge #b00000000000000000000000000000000 (size!18854 a!2986)))))

(assert (=> d!92175 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12435) e!373913)))

(declare-fun b!651608 () Bool)

(assert (=> b!651608 (= e!373914 call!33762)))

(declare-fun b!651609 () Bool)

(assert (=> b!651609 (= e!373913 e!373912)))

(declare-fun res!422490 () Bool)

(assert (=> b!651609 (=> (not res!422490) (not e!373912))))

(declare-fun e!373911 () Bool)

(assert (=> b!651609 (= res!422490 (not e!373911))))

(declare-fun res!422491 () Bool)

(assert (=> b!651609 (=> (not res!422491) (not e!373911))))

(assert (=> b!651609 (= res!422491 (validKeyInArray!0 (select (arr!18490 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651610 () Bool)

(declare-fun contains!3154 (List!12438 (_ BitVec 64)) Bool)

(assert (=> b!651610 (= e!373911 (contains!3154 Nil!12435 (select (arr!18490 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92175 (not res!422489)) b!651609))

(assert (= (and b!651609 res!422491) b!651610))

(assert (= (and b!651609 res!422490) b!651607))

(assert (= (and b!651607 c!74927) b!651606))

(assert (= (and b!651607 (not c!74927)) b!651608))

(assert (= (or b!651606 b!651608) bm!33759))

(declare-fun m!625213 () Bool)

(assert (=> b!651607 m!625213))

(assert (=> b!651607 m!625213))

(declare-fun m!625215 () Bool)

(assert (=> b!651607 m!625215))

(assert (=> bm!33759 m!625213))

(declare-fun m!625217 () Bool)

(assert (=> bm!33759 m!625217))

(assert (=> b!651609 m!625213))

(assert (=> b!651609 m!625213))

(assert (=> b!651609 m!625215))

(assert (=> b!651610 m!625213))

(assert (=> b!651610 m!625213))

(declare-fun m!625219 () Bool)

(assert (=> b!651610 m!625219))

(assert (=> b!651411 d!92175))

(declare-fun d!92177 () Bool)

(assert (=> d!92177 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!651433 d!92177))

(declare-fun d!92179 () Bool)

(declare-fun lt!302991 () SeekEntryResult!6886)

(assert (=> d!92179 (and (or ((_ is Undefined!6886) lt!302991) (not ((_ is Found!6886) lt!302991)) (and (bvsge (index!29895 lt!302991) #b00000000000000000000000000000000) (bvslt (index!29895 lt!302991) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!302991) ((_ is Found!6886) lt!302991) (not ((_ is MissingZero!6886) lt!302991)) (and (bvsge (index!29894 lt!302991) #b00000000000000000000000000000000) (bvslt (index!29894 lt!302991) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!302991) ((_ is Found!6886) lt!302991) ((_ is MissingZero!6886) lt!302991) (not ((_ is MissingVacant!6886) lt!302991)) (and (bvsge (index!29897 lt!302991) #b00000000000000000000000000000000) (bvslt (index!29897 lt!302991) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!302991) (ite ((_ is Found!6886) lt!302991) (= (select (arr!18490 a!2986) (index!29895 lt!302991)) k0!1786) (ite ((_ is MissingZero!6886) lt!302991) (= (select (arr!18490 a!2986) (index!29894 lt!302991)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6886) lt!302991) (= (select (arr!18490 a!2986) (index!29897 lt!302991)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!373940 () SeekEntryResult!6886)

(assert (=> d!92179 (= lt!302991 e!373940)))

(declare-fun c!74939 () Bool)

(declare-fun lt!302990 () SeekEntryResult!6886)

(assert (=> d!92179 (= c!74939 (and ((_ is Intermediate!6886) lt!302990) (undefined!7698 lt!302990)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38577 (_ BitVec 32)) SeekEntryResult!6886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92179 (= lt!302990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92179 (validMask!0 mask!3053)))

(assert (=> d!92179 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!302991)))

(declare-fun b!651644 () Bool)

(assert (=> b!651644 (= e!373940 Undefined!6886)))

(declare-fun b!651645 () Bool)

(declare-fun e!373941 () SeekEntryResult!6886)

(assert (=> b!651645 (= e!373941 (Found!6886 (index!29896 lt!302990)))))

(declare-fun e!373939 () SeekEntryResult!6886)

(declare-fun b!651646 () Bool)

(assert (=> b!651646 (= e!373939 (seekKeyOrZeroReturnVacant!0 (x!58831 lt!302990) (index!29896 lt!302990) (index!29896 lt!302990) k0!1786 a!2986 mask!3053))))

(declare-fun b!651647 () Bool)

(declare-fun c!74937 () Bool)

(declare-fun lt!302992 () (_ BitVec 64))

(assert (=> b!651647 (= c!74937 (= lt!302992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651647 (= e!373941 e!373939)))

(declare-fun b!651648 () Bool)

(assert (=> b!651648 (= e!373939 (MissingZero!6886 (index!29896 lt!302990)))))

(declare-fun b!651649 () Bool)

(assert (=> b!651649 (= e!373940 e!373941)))

(assert (=> b!651649 (= lt!302992 (select (arr!18490 a!2986) (index!29896 lt!302990)))))

(declare-fun c!74938 () Bool)

(assert (=> b!651649 (= c!74938 (= lt!302992 k0!1786))))

(assert (= (and d!92179 c!74939) b!651644))

(assert (= (and d!92179 (not c!74939)) b!651649))

(assert (= (and b!651649 c!74938) b!651645))

(assert (= (and b!651649 (not c!74938)) b!651647))

(assert (= (and b!651647 c!74937) b!651648))

(assert (= (and b!651647 (not c!74937)) b!651646))

(assert (=> d!92179 m!625025))

(declare-fun m!625233 () Bool)

(assert (=> d!92179 m!625233))

(declare-fun m!625235 () Bool)

(assert (=> d!92179 m!625235))

(declare-fun m!625237 () Bool)

(assert (=> d!92179 m!625237))

(declare-fun m!625239 () Bool)

(assert (=> d!92179 m!625239))

(assert (=> d!92179 m!625235))

(declare-fun m!625241 () Bool)

(assert (=> d!92179 m!625241))

(declare-fun m!625243 () Bool)

(assert (=> b!651646 m!625243))

(declare-fun m!625245 () Bool)

(assert (=> b!651649 m!625245))

(assert (=> b!651412 d!92179))

(assert (=> b!651415 d!92173))

(declare-fun d!92191 () Bool)

(declare-fun res!422507 () Bool)

(declare-fun e!373942 () Bool)

(assert (=> d!92191 (=> res!422507 e!373942)))

(assert (=> d!92191 (= res!422507 (= (select (arr!18490 lt!302869) j!136) (select (arr!18490 a!2986) j!136)))))

(assert (=> d!92191 (= (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136) e!373942)))

(declare-fun b!651650 () Bool)

(declare-fun e!373943 () Bool)

(assert (=> b!651650 (= e!373942 e!373943)))

(declare-fun res!422508 () Bool)

(assert (=> b!651650 (=> (not res!422508) (not e!373943))))

(assert (=> b!651650 (= res!422508 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18854 lt!302869)))))

(declare-fun b!651651 () Bool)

(assert (=> b!651651 (= e!373943 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92191 (not res!422507)) b!651650))

(assert (= (and b!651650 res!422508) b!651651))

(declare-fun m!625247 () Bool)

(assert (=> d!92191 m!625247))

(assert (=> b!651651 m!625001))

(declare-fun m!625249 () Bool)

(assert (=> b!651651 m!625249))

(assert (=> b!651426 d!92191))

(declare-fun d!92193 () Bool)

(assert (=> d!92193 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59058 d!92193))

(declare-fun d!92205 () Bool)

(assert (=> d!92205 (= (array_inv!14349 a!2986) (bvsge (size!18854 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59058 d!92205))

(declare-fun b!651674 () Bool)

(declare-fun e!373962 () Bool)

(declare-fun call!33766 () Bool)

(assert (=> b!651674 (= e!373962 call!33766)))

(declare-fun b!651675 () Bool)

(declare-fun e!373960 () Bool)

(assert (=> b!651675 (= e!373960 e!373962)))

(declare-fun c!74949 () Bool)

(assert (=> b!651675 (= c!74949 (validKeyInArray!0 (select (arr!18490 lt!302869) #b00000000000000000000000000000000)))))

(declare-fun bm!33763 () Bool)

(assert (=> bm!33763 (= call!33766 (arrayNoDuplicates!0 lt!302869 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74949 (Cons!12434 (select (arr!18490 lt!302869) #b00000000000000000000000000000000) Nil!12435) Nil!12435)))))

(declare-fun d!92207 () Bool)

(declare-fun res!422515 () Bool)

(declare-fun e!373961 () Bool)

(assert (=> d!92207 (=> res!422515 e!373961)))

(assert (=> d!92207 (= res!422515 (bvsge #b00000000000000000000000000000000 (size!18854 lt!302869)))))

(assert (=> d!92207 (= (arrayNoDuplicates!0 lt!302869 #b00000000000000000000000000000000 Nil!12435) e!373961)))

(declare-fun b!651676 () Bool)

(assert (=> b!651676 (= e!373962 call!33766)))

(declare-fun b!651677 () Bool)

(assert (=> b!651677 (= e!373961 e!373960)))

(declare-fun res!422516 () Bool)

(assert (=> b!651677 (=> (not res!422516) (not e!373960))))

(declare-fun e!373958 () Bool)

(assert (=> b!651677 (= res!422516 (not e!373958))))

(declare-fun res!422517 () Bool)

(assert (=> b!651677 (=> (not res!422517) (not e!373958))))

(assert (=> b!651677 (= res!422517 (validKeyInArray!0 (select (arr!18490 lt!302869) #b00000000000000000000000000000000)))))

(declare-fun b!651678 () Bool)

(assert (=> b!651678 (= e!373958 (contains!3154 Nil!12435 (select (arr!18490 lt!302869) #b00000000000000000000000000000000)))))

(assert (= (and d!92207 (not res!422515)) b!651677))

(assert (= (and b!651677 res!422517) b!651678))

(assert (= (and b!651677 res!422516) b!651675))

(assert (= (and b!651675 c!74949) b!651674))

(assert (= (and b!651675 (not c!74949)) b!651676))

(assert (= (or b!651674 b!651676) bm!33763))

(declare-fun m!625271 () Bool)

(assert (=> b!651675 m!625271))

(assert (=> b!651675 m!625271))

(declare-fun m!625273 () Bool)

(assert (=> b!651675 m!625273))

(assert (=> bm!33763 m!625271))

(declare-fun m!625275 () Bool)

(assert (=> bm!33763 m!625275))

(assert (=> b!651677 m!625271))

(assert (=> b!651677 m!625271))

(assert (=> b!651677 m!625273))

(assert (=> b!651678 m!625271))

(assert (=> b!651678 m!625271))

(declare-fun m!625277 () Bool)

(assert (=> b!651678 m!625277))

(assert (=> b!651416 d!92207))

(declare-fun d!92209 () Bool)

(assert (=> d!92209 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303004 () Unit!22215)

(declare-fun choose!114 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> d!92209 (= lt!303004 (choose!114 lt!302869 (select (arr!18490 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92209 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92209 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302869 (select (arr!18490 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303004)))

(declare-fun bs!19439 () Bool)

(assert (= bs!19439 d!92209))

(assert (=> bs!19439 m!625001))

(assert (=> bs!19439 m!625015))

(assert (=> bs!19439 m!625001))

(declare-fun m!625279 () Bool)

(assert (=> bs!19439 m!625279))

(assert (=> b!651416 d!92209))

(declare-fun d!92211 () Bool)

(declare-fun res!422525 () Bool)

(declare-fun e!373973 () Bool)

(assert (=> d!92211 (=> res!422525 e!373973)))

(assert (=> d!92211 (= res!422525 (= (select (arr!18490 lt!302869) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18490 a!2986) j!136)))))

(assert (=> d!92211 (= (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373973)))

(declare-fun b!651694 () Bool)

(declare-fun e!373974 () Bool)

(assert (=> b!651694 (= e!373973 e!373974)))

(declare-fun res!422526 () Bool)

(assert (=> b!651694 (=> (not res!422526) (not e!373974))))

(assert (=> b!651694 (= res!422526 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18854 lt!302869)))))

(declare-fun b!651695 () Bool)

(assert (=> b!651695 (= e!373974 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92211 (not res!422525)) b!651694))

(assert (= (and b!651694 res!422526) b!651695))

(declare-fun m!625281 () Bool)

(assert (=> d!92211 m!625281))

(assert (=> b!651695 m!625001))

(declare-fun m!625283 () Bool)

(assert (=> b!651695 m!625283))

(assert (=> b!651416 d!92211))

(declare-fun b!651696 () Bool)

(declare-fun e!373978 () Bool)

(declare-fun call!33770 () Bool)

(assert (=> b!651696 (= e!373978 call!33770)))

(declare-fun b!651697 () Bool)

(declare-fun e!373976 () Bool)

(assert (=> b!651697 (= e!373976 e!373978)))

(declare-fun c!74953 () Bool)

(assert (=> b!651697 (= c!74953 (validKeyInArray!0 (select (arr!18490 lt!302869) j!136)))))

(declare-fun bm!33767 () Bool)

(assert (=> bm!33767 (= call!33770 (arrayNoDuplicates!0 lt!302869 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74953 (Cons!12434 (select (arr!18490 lt!302869) j!136) Nil!12435) Nil!12435)))))

(declare-fun d!92213 () Bool)

(declare-fun res!422527 () Bool)

(declare-fun e!373977 () Bool)

(assert (=> d!92213 (=> res!422527 e!373977)))

(assert (=> d!92213 (= res!422527 (bvsge j!136 (size!18854 lt!302869)))))

(assert (=> d!92213 (= (arrayNoDuplicates!0 lt!302869 j!136 Nil!12435) e!373977)))

(declare-fun b!651698 () Bool)

(assert (=> b!651698 (= e!373978 call!33770)))

(declare-fun b!651699 () Bool)

(assert (=> b!651699 (= e!373977 e!373976)))

(declare-fun res!422528 () Bool)

(assert (=> b!651699 (=> (not res!422528) (not e!373976))))

(declare-fun e!373975 () Bool)

(assert (=> b!651699 (= res!422528 (not e!373975))))

(declare-fun res!422529 () Bool)

(assert (=> b!651699 (=> (not res!422529) (not e!373975))))

(assert (=> b!651699 (= res!422529 (validKeyInArray!0 (select (arr!18490 lt!302869) j!136)))))

(declare-fun b!651700 () Bool)

(assert (=> b!651700 (= e!373975 (contains!3154 Nil!12435 (select (arr!18490 lt!302869) j!136)))))

(assert (= (and d!92213 (not res!422527)) b!651699))

(assert (= (and b!651699 res!422529) b!651700))

(assert (= (and b!651699 res!422528) b!651697))

(assert (= (and b!651697 c!74953) b!651696))

(assert (= (and b!651697 (not c!74953)) b!651698))

(assert (= (or b!651696 b!651698) bm!33767))

(assert (=> b!651697 m!625247))

(assert (=> b!651697 m!625247))

(declare-fun m!625293 () Bool)

(assert (=> b!651697 m!625293))

(assert (=> bm!33767 m!625247))

(declare-fun m!625295 () Bool)

(assert (=> bm!33767 m!625295))

(assert (=> b!651699 m!625247))

(assert (=> b!651699 m!625247))

(assert (=> b!651699 m!625293))

(assert (=> b!651700 m!625247))

(assert (=> b!651700 m!625247))

(declare-fun m!625297 () Bool)

(assert (=> b!651700 m!625297))

(assert (=> b!651416 d!92213))

(declare-fun d!92217 () Bool)

(declare-fun e!373987 () Bool)

(assert (=> d!92217 e!373987))

(declare-fun res!422538 () Bool)

(assert (=> d!92217 (=> (not res!422538) (not e!373987))))

(assert (=> d!92217 (= res!422538 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18854 a!2986))))))

(declare-fun lt!303010 () Unit!22215)

(declare-fun choose!41 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12438) Unit!22215)

(assert (=> d!92217 (= lt!303010 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12435))))

(assert (=> d!92217 (bvslt (size!18854 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92217 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12435) lt!303010)))

(declare-fun b!651709 () Bool)

(assert (=> b!651709 (= e!373987 (arrayNoDuplicates!0 (array!38578 (store (arr!18490 a!2986) i!1108 k0!1786) (size!18854 a!2986)) #b00000000000000000000000000000000 Nil!12435))))

(assert (= (and d!92217 res!422538) b!651709))

(declare-fun m!625305 () Bool)

(assert (=> d!92217 m!625305))

(assert (=> b!651709 m!625021))

(declare-fun m!625307 () Bool)

(assert (=> b!651709 m!625307))

(assert (=> b!651416 d!92217))

(declare-fun d!92223 () Bool)

(assert (=> d!92223 (arrayNoDuplicates!0 lt!302869 j!136 Nil!12435)))

(declare-fun lt!303020 () Unit!22215)

(declare-fun choose!39 (array!38577 (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> d!92223 (= lt!303020 (choose!39 lt!302869 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92223 (bvslt (size!18854 lt!302869) #b01111111111111111111111111111111)))

(assert (=> d!92223 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302869 #b00000000000000000000000000000000 j!136) lt!303020)))

(declare-fun bs!19442 () Bool)

(assert (= bs!19442 d!92223))

(assert (=> bs!19442 m!625011))

(declare-fun m!625311 () Bool)

(assert (=> bs!19442 m!625311))

(assert (=> b!651416 d!92223))

(declare-fun d!92227 () Bool)

(assert (=> d!92227 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18854 lt!302869)) (not (= (select (arr!18490 lt!302869) j!136) (select (arr!18490 a!2986) j!136))))))

(declare-fun lt!303030 () Unit!22215)

(declare-fun choose!21 (array!38577 (_ BitVec 64) (_ BitVec 32) List!12438) Unit!22215)

(assert (=> d!92227 (= lt!303030 (choose!21 lt!302869 (select (arr!18490 a!2986) j!136) j!136 Nil!12435))))

(assert (=> d!92227 (bvslt (size!18854 lt!302869) #b01111111111111111111111111111111)))

(assert (=> d!92227 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136 Nil!12435) lt!303030)))

(declare-fun bs!19444 () Bool)

(assert (= bs!19444 d!92227))

(assert (=> bs!19444 m!625247))

(assert (=> bs!19444 m!625001))

(declare-fun m!625333 () Bool)

(assert (=> bs!19444 m!625333))

(assert (=> b!651416 d!92227))

(assert (=> b!651414 d!92191))

(assert (=> b!651414 d!92217))

(declare-fun d!92235 () Bool)

(assert (=> d!92235 (arrayNoDuplicates!0 lt!302869 index!984 Nil!12435)))

(declare-fun lt!303031 () Unit!22215)

(assert (=> d!92235 (= lt!303031 (choose!39 lt!302869 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92235 (bvslt (size!18854 lt!302869) #b01111111111111111111111111111111)))

(assert (=> d!92235 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302869 #b00000000000000000000000000000000 index!984) lt!303031)))

(declare-fun bs!19445 () Bool)

(assert (= bs!19445 d!92235))

(assert (=> bs!19445 m!625037))

(declare-fun m!625335 () Bool)

(assert (=> bs!19445 m!625335))

(assert (=> b!651414 d!92235))

(assert (=> b!651414 d!92207))

(declare-fun d!92237 () Bool)

(assert (=> d!92237 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303034 () Unit!22215)

(assert (=> d!92237 (= lt!303034 (choose!114 lt!302869 (select (arr!18490 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92237 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92237 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302869 (select (arr!18490 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303034)))

(declare-fun bs!19446 () Bool)

(assert (= bs!19446 d!92237))

(assert (=> bs!19446 m!625001))

(assert (=> bs!19446 m!625039))

(assert (=> bs!19446 m!625001))

(declare-fun m!625347 () Bool)

(assert (=> bs!19446 m!625347))

(assert (=> b!651414 d!92237))

(declare-fun b!651745 () Bool)

(declare-fun e!374010 () Bool)

(declare-fun call!33772 () Bool)

(assert (=> b!651745 (= e!374010 call!33772)))

(declare-fun b!651746 () Bool)

(declare-fun e!374008 () Bool)

(assert (=> b!651746 (= e!374008 e!374010)))

(declare-fun c!74970 () Bool)

(assert (=> b!651746 (= c!74970 (validKeyInArray!0 (select (arr!18490 lt!302869) index!984)))))

(declare-fun bm!33769 () Bool)

(assert (=> bm!33769 (= call!33772 (arrayNoDuplicates!0 lt!302869 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74970 (Cons!12434 (select (arr!18490 lt!302869) index!984) Nil!12435) Nil!12435)))))

(declare-fun d!92241 () Bool)

(declare-fun res!422542 () Bool)

(declare-fun e!374009 () Bool)

(assert (=> d!92241 (=> res!422542 e!374009)))

(assert (=> d!92241 (= res!422542 (bvsge index!984 (size!18854 lt!302869)))))

(assert (=> d!92241 (= (arrayNoDuplicates!0 lt!302869 index!984 Nil!12435) e!374009)))

(declare-fun b!651747 () Bool)

(assert (=> b!651747 (= e!374010 call!33772)))

(declare-fun b!651748 () Bool)

(assert (=> b!651748 (= e!374009 e!374008)))

(declare-fun res!422543 () Bool)

(assert (=> b!651748 (=> (not res!422543) (not e!374008))))

(declare-fun e!374007 () Bool)

(assert (=> b!651748 (= res!422543 (not e!374007))))

(declare-fun res!422544 () Bool)

(assert (=> b!651748 (=> (not res!422544) (not e!374007))))

(assert (=> b!651748 (= res!422544 (validKeyInArray!0 (select (arr!18490 lt!302869) index!984)))))

(declare-fun b!651749 () Bool)

(assert (=> b!651749 (= e!374007 (contains!3154 Nil!12435 (select (arr!18490 lt!302869) index!984)))))

(assert (= (and d!92241 (not res!422542)) b!651748))

(assert (= (and b!651748 res!422544) b!651749))

(assert (= (and b!651748 res!422543) b!651746))

(assert (= (and b!651746 c!74970) b!651745))

(assert (= (and b!651746 (not c!74970)) b!651747))

(assert (= (or b!651745 b!651747) bm!33769))

(assert (=> b!651746 m!625209))

(assert (=> b!651746 m!625209))

(declare-fun m!625355 () Bool)

(assert (=> b!651746 m!625355))

(assert (=> bm!33769 m!625209))

(declare-fun m!625357 () Bool)

(assert (=> bm!33769 m!625357))

(assert (=> b!651748 m!625209))

(assert (=> b!651748 m!625209))

(assert (=> b!651748 m!625355))

(assert (=> b!651749 m!625209))

(assert (=> b!651749 m!625209))

(declare-fun m!625359 () Bool)

(assert (=> b!651749 m!625359))

(assert (=> b!651414 d!92241))

(declare-fun d!92245 () Bool)

(declare-fun res!422545 () Bool)

(declare-fun e!374011 () Bool)

(assert (=> d!92245 (=> res!422545 e!374011)))

(assert (=> d!92245 (= res!422545 (= (select (arr!18490 lt!302869) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18490 a!2986) j!136)))))

(assert (=> d!92245 (= (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374011)))

(declare-fun b!651750 () Bool)

(declare-fun e!374012 () Bool)

(assert (=> b!651750 (= e!374011 e!374012)))

(declare-fun res!422546 () Bool)

(assert (=> b!651750 (=> (not res!422546) (not e!374012))))

(assert (=> b!651750 (= res!422546 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18854 lt!302869)))))

(declare-fun b!651751 () Bool)

(assert (=> b!651751 (= e!374012 (arrayContainsKey!0 lt!302869 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92245 (not res!422545)) b!651750))

(assert (= (and b!651750 res!422546) b!651751))

(declare-fun m!625361 () Bool)

(assert (=> d!92245 m!625361))

(assert (=> b!651751 m!625001))

(declare-fun m!625363 () Bool)

(assert (=> b!651751 m!625363))

(assert (=> b!651414 d!92245))

(declare-fun b!651772 () Bool)

(declare-fun e!374031 () Bool)

(declare-fun call!33776 () Bool)

(assert (=> b!651772 (= e!374031 call!33776)))

(declare-fun b!651773 () Bool)

(declare-fun e!374032 () Bool)

(assert (=> b!651773 (= e!374032 e!374031)))

(declare-fun c!74974 () Bool)

(assert (=> b!651773 (= c!74974 (validKeyInArray!0 (select (arr!18490 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651774 () Bool)

(declare-fun e!374030 () Bool)

(assert (=> b!651774 (= e!374030 call!33776)))

(declare-fun d!92247 () Bool)

(declare-fun res!422561 () Bool)

(assert (=> d!92247 (=> res!422561 e!374032)))

(assert (=> d!92247 (= res!422561 (bvsge #b00000000000000000000000000000000 (size!18854 a!2986)))))

(assert (=> d!92247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!374032)))

(declare-fun bm!33773 () Bool)

(assert (=> bm!33773 (= call!33776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!651775 () Bool)

(assert (=> b!651775 (= e!374031 e!374030)))

(declare-fun lt!303046 () (_ BitVec 64))

(assert (=> b!651775 (= lt!303046 (select (arr!18490 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303048 () Unit!22215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38577 (_ BitVec 64) (_ BitVec 32)) Unit!22215)

(assert (=> b!651775 (= lt!303048 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303046 #b00000000000000000000000000000000))))

(assert (=> b!651775 (arrayContainsKey!0 a!2986 lt!303046 #b00000000000000000000000000000000)))

(declare-fun lt!303047 () Unit!22215)

(assert (=> b!651775 (= lt!303047 lt!303048)))

(declare-fun res!422562 () Bool)

(assert (=> b!651775 (= res!422562 (= (seekEntryOrOpen!0 (select (arr!18490 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6886 #b00000000000000000000000000000000)))))

(assert (=> b!651775 (=> (not res!422562) (not e!374030))))

(assert (= (and d!92247 (not res!422561)) b!651773))

(assert (= (and b!651773 c!74974) b!651775))

(assert (= (and b!651773 (not c!74974)) b!651772))

(assert (= (and b!651775 res!422562) b!651774))

(assert (= (or b!651774 b!651772) bm!33773))

(assert (=> b!651773 m!625213))

(assert (=> b!651773 m!625213))

(assert (=> b!651773 m!625215))

(declare-fun m!625387 () Bool)

(assert (=> bm!33773 m!625387))

(assert (=> b!651775 m!625213))

(declare-fun m!625389 () Bool)

(assert (=> b!651775 m!625389))

(declare-fun m!625391 () Bool)

(assert (=> b!651775 m!625391))

(assert (=> b!651775 m!625213))

(declare-fun m!625393 () Bool)

(assert (=> b!651775 m!625393))

(assert (=> b!651429 d!92247))

(declare-fun d!92261 () Bool)

(assert (=> d!92261 (= (validKeyInArray!0 (select (arr!18490 a!2986) j!136)) (and (not (= (select (arr!18490 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18490 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!651427 d!92261))

(declare-fun d!92263 () Bool)

(declare-fun res!422563 () Bool)

(declare-fun e!374033 () Bool)

(assert (=> d!92263 (=> res!422563 e!374033)))

(assert (=> d!92263 (= res!422563 (= (select (arr!18490 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92263 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!374033)))

(declare-fun b!651776 () Bool)

(declare-fun e!374034 () Bool)

(assert (=> b!651776 (= e!374033 e!374034)))

(declare-fun res!422564 () Bool)

(assert (=> b!651776 (=> (not res!422564) (not e!374034))))

(assert (=> b!651776 (= res!422564 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18854 a!2986)))))

(declare-fun b!651777 () Bool)

(assert (=> b!651777 (= e!374034 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92263 (not res!422563)) b!651776))

(assert (= (and b!651776 res!422564) b!651777))

(assert (=> d!92263 m!625213))

(declare-fun m!625395 () Bool)

(assert (=> b!651777 m!625395))

(assert (=> b!651417 d!92263))

(declare-fun d!92265 () Bool)

(declare-fun e!374058 () Bool)

(assert (=> d!92265 e!374058))

(declare-fun res!422574 () Bool)

(assert (=> d!92265 (=> (not res!422574) (not e!374058))))

(assert (=> d!92265 (= res!422574 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18854 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18854 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18854 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18854 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18854 a!2986))))))

(declare-fun lt!303071 () Unit!22215)

(declare-fun choose!9 (array!38577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22215)

(assert (=> d!92265 (= lt!303071 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92265 (validMask!0 mask!3053)))

(assert (=> d!92265 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 mask!3053) lt!303071)))

(declare-fun b!651815 () Bool)

(assert (=> b!651815 (= e!374058 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 (select (store (arr!18490 a!2986) i!1108 k0!1786) j!136) (array!38578 (store (arr!18490 a!2986) i!1108 k0!1786) (size!18854 a!2986)) mask!3053)))))

(assert (= (and d!92265 res!422574) b!651815))

(declare-fun m!625421 () Bool)

(assert (=> d!92265 m!625421))

(assert (=> d!92265 m!625025))

(assert (=> b!651815 m!625001))

(assert (=> b!651815 m!625001))

(assert (=> b!651815 m!625047))

(assert (=> b!651815 m!625051))

(assert (=> b!651815 m!625021))

(assert (=> b!651815 m!625051))

(declare-fun m!625423 () Bool)

(assert (=> b!651815 m!625423))

(assert (=> b!651428 d!92265))

(declare-fun b!651823 () Bool)

(declare-fun e!374063 () SeekEntryResult!6886)

(assert (=> b!651823 (= e!374063 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!651824 () Bool)

(declare-fun c!74992 () Bool)

(declare-fun lt!303074 () (_ BitVec 64))

(assert (=> b!651824 (= c!74992 (= lt!303074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374064 () SeekEntryResult!6886)

(assert (=> b!651824 (= e!374064 e!374063)))

(declare-fun b!651825 () Bool)

(assert (=> b!651825 (= e!374063 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302868 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!302866 lt!302869 mask!3053))))

(declare-fun b!651826 () Bool)

(declare-fun e!374062 () SeekEntryResult!6886)

(assert (=> b!651826 (= e!374062 Undefined!6886)))

(declare-fun b!651827 () Bool)

(assert (=> b!651827 (= e!374062 e!374064)))

(declare-fun c!74994 () Bool)

(assert (=> b!651827 (= c!74994 (= lt!303074 lt!302866))))

(declare-fun d!92275 () Bool)

(declare-fun lt!303075 () SeekEntryResult!6886)

(assert (=> d!92275 (and (or ((_ is Undefined!6886) lt!303075) (not ((_ is Found!6886) lt!303075)) (and (bvsge (index!29895 lt!303075) #b00000000000000000000000000000000) (bvslt (index!29895 lt!303075) (size!18854 lt!302869)))) (or ((_ is Undefined!6886) lt!303075) ((_ is Found!6886) lt!303075) (not ((_ is MissingVacant!6886) lt!303075)) (not (= (index!29897 lt!303075) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!303075) #b00000000000000000000000000000000) (bvslt (index!29897 lt!303075) (size!18854 lt!302869)))) (or ((_ is Undefined!6886) lt!303075) (ite ((_ is Found!6886) lt!303075) (= (select (arr!18490 lt!302869) (index!29895 lt!303075)) lt!302866) (and ((_ is MissingVacant!6886) lt!303075) (= (index!29897 lt!303075) vacantSpotIndex!68) (= (select (arr!18490 lt!302869) (index!29897 lt!303075)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92275 (= lt!303075 e!374062)))

(declare-fun c!74993 () Bool)

(assert (=> d!92275 (= c!74993 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92275 (= lt!303074 (select (arr!18490 lt!302869) lt!302868))))

(assert (=> d!92275 (validMask!0 mask!3053)))

(assert (=> d!92275 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 lt!302866 lt!302869 mask!3053) lt!303075)))

(declare-fun b!651822 () Bool)

(assert (=> b!651822 (= e!374064 (Found!6886 lt!302868))))

(assert (= (and d!92275 c!74993) b!651826))

(assert (= (and d!92275 (not c!74993)) b!651827))

(assert (= (and b!651827 c!74994) b!651822))

(assert (= (and b!651827 (not c!74994)) b!651824))

(assert (= (and b!651824 c!74992) b!651823))

(assert (= (and b!651824 (not c!74992)) b!651825))

(declare-fun m!625435 () Bool)

(assert (=> b!651825 m!625435))

(assert (=> b!651825 m!625435))

(declare-fun m!625441 () Bool)

(assert (=> b!651825 m!625441))

(declare-fun m!625445 () Bool)

(assert (=> d!92275 m!625445))

(declare-fun m!625447 () Bool)

(assert (=> d!92275 m!625447))

(declare-fun m!625449 () Bool)

(assert (=> d!92275 m!625449))

(assert (=> d!92275 m!625025))

(assert (=> b!651428 d!92275))

(declare-fun b!651833 () Bool)

(declare-fun e!374069 () SeekEntryResult!6886)

(assert (=> b!651833 (= e!374069 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!651834 () Bool)

(declare-fun c!74996 () Bool)

(declare-fun lt!303079 () (_ BitVec 64))

(assert (=> b!651834 (= c!74996 (= lt!303079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374070 () SeekEntryResult!6886)

(assert (=> b!651834 (= e!374070 e!374069)))

(declare-fun b!651835 () Bool)

(assert (=> b!651835 (= e!374069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302868 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651836 () Bool)

(declare-fun e!374068 () SeekEntryResult!6886)

(assert (=> b!651836 (= e!374068 Undefined!6886)))

(declare-fun b!651837 () Bool)

(assert (=> b!651837 (= e!374068 e!374070)))

(declare-fun c!74998 () Bool)

(assert (=> b!651837 (= c!74998 (= lt!303079 (select (arr!18490 a!2986) j!136)))))

(declare-fun lt!303080 () SeekEntryResult!6886)

(declare-fun d!92281 () Bool)

(assert (=> d!92281 (and (or ((_ is Undefined!6886) lt!303080) (not ((_ is Found!6886) lt!303080)) (and (bvsge (index!29895 lt!303080) #b00000000000000000000000000000000) (bvslt (index!29895 lt!303080) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!303080) ((_ is Found!6886) lt!303080) (not ((_ is MissingVacant!6886) lt!303080)) (not (= (index!29897 lt!303080) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!303080) #b00000000000000000000000000000000) (bvslt (index!29897 lt!303080) (size!18854 a!2986)))) (or ((_ is Undefined!6886) lt!303080) (ite ((_ is Found!6886) lt!303080) (= (select (arr!18490 a!2986) (index!29895 lt!303080)) (select (arr!18490 a!2986) j!136)) (and ((_ is MissingVacant!6886) lt!303080) (= (index!29897 lt!303080) vacantSpotIndex!68) (= (select (arr!18490 a!2986) (index!29897 lt!303080)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92281 (= lt!303080 e!374068)))

(declare-fun c!74997 () Bool)

(assert (=> d!92281 (= c!74997 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92281 (= lt!303079 (select (arr!18490 a!2986) lt!302868))))

(assert (=> d!92281 (validMask!0 mask!3053)))

(assert (=> d!92281 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302868 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053) lt!303080)))

(declare-fun b!651832 () Bool)

(assert (=> b!651832 (= e!374070 (Found!6886 lt!302868))))

(assert (= (and d!92281 c!74997) b!651836))

(assert (= (and d!92281 (not c!74997)) b!651837))

(assert (= (and b!651837 c!74998) b!651832))

(assert (= (and b!651837 (not c!74998)) b!651834))

(assert (= (and b!651834 c!74996) b!651833))

(assert (= (and b!651834 (not c!74996)) b!651835))

(assert (=> b!651835 m!625435))

(assert (=> b!651835 m!625435))

(assert (=> b!651835 m!625001))

(declare-fun m!625451 () Bool)

(assert (=> b!651835 m!625451))

(declare-fun m!625453 () Bool)

(assert (=> d!92281 m!625453))

(declare-fun m!625455 () Bool)

(assert (=> d!92281 m!625455))

(declare-fun m!625457 () Bool)

(assert (=> d!92281 m!625457))

(assert (=> d!92281 m!625025))

(assert (=> b!651428 d!92281))

(declare-fun d!92283 () Bool)

(declare-fun lt!303089 () (_ BitVec 32))

(assert (=> d!92283 (and (bvsge lt!303089 #b00000000000000000000000000000000) (bvslt lt!303089 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92283 (= lt!303089 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92283 (validMask!0 mask!3053)))

(assert (=> d!92283 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!303089)))

(declare-fun bs!19452 () Bool)

(assert (= bs!19452 d!92283))

(declare-fun m!625469 () Bool)

(assert (=> bs!19452 m!625469))

(assert (=> bs!19452 m!625025))

(assert (=> b!651428 d!92283))

(declare-fun b!651849 () Bool)

(declare-fun e!374080 () SeekEntryResult!6886)

(assert (=> b!651849 (= e!374080 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!651850 () Bool)

(declare-fun c!75001 () Bool)

(declare-fun lt!303090 () (_ BitVec 64))

(assert (=> b!651850 (= c!75001 (= lt!303090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374081 () SeekEntryResult!6886)

(assert (=> b!651850 (= e!374081 e!374080)))

(declare-fun b!651851 () Bool)

(assert (=> b!651851 (= e!374080 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!302866 lt!302869 mask!3053))))

(declare-fun b!651852 () Bool)

(declare-fun e!374079 () SeekEntryResult!6886)

(assert (=> b!651852 (= e!374079 Undefined!6886)))

(declare-fun b!651853 () Bool)

(assert (=> b!651853 (= e!374079 e!374081)))

(declare-fun c!75003 () Bool)

(assert (=> b!651853 (= c!75003 (= lt!303090 lt!302866))))

(declare-fun d!92291 () Bool)

(declare-fun lt!303091 () SeekEntryResult!6886)

(assert (=> d!92291 (and (or ((_ is Undefined!6886) lt!303091) (not ((_ is Found!6886) lt!303091)) (and (bvsge (index!29895 lt!303091) #b00000000000000000000000000000000) (bvslt (index!29895 lt!303091) (size!18854 lt!302869)))) (or ((_ is Undefined!6886) lt!303091) ((_ is Found!6886) lt!303091) (not ((_ is MissingVacant!6886) lt!303091)) (not (= (index!29897 lt!303091) vacantSpotIndex!68)) (and (bvsge (index!29897 lt!303091) #b00000000000000000000000000000000) (bvslt (index!29897 lt!303091) (size!18854 lt!302869)))) (or ((_ is Undefined!6886) lt!303091) (ite ((_ is Found!6886) lt!303091) (= (select (arr!18490 lt!302869) (index!29895 lt!303091)) lt!302866) (and ((_ is MissingVacant!6886) lt!303091) (= (index!29897 lt!303091) vacantSpotIndex!68) (= (select (arr!18490 lt!302869) (index!29897 lt!303091)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92291 (= lt!303091 e!374079)))

(declare-fun c!75002 () Bool)

(assert (=> d!92291 (= c!75002 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92291 (= lt!303090 (select (arr!18490 lt!302869) index!984))))

(assert (=> d!92291 (validMask!0 mask!3053)))

(assert (=> d!92291 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302866 lt!302869 mask!3053) lt!303091)))

(declare-fun b!651848 () Bool)

(assert (=> b!651848 (= e!374081 (Found!6886 index!984))))

(assert (= (and d!92291 c!75002) b!651852))

(assert (= (and d!92291 (not c!75002)) b!651853))

(assert (= (and b!651853 c!75003) b!651848))

(assert (= (and b!651853 (not c!75003)) b!651850))

(assert (= (and b!651850 c!75001) b!651849))

(assert (= (and b!651850 (not c!75001)) b!651851))

(assert (=> b!651851 m!625201))

(assert (=> b!651851 m!625201))

(declare-fun m!625479 () Bool)

(assert (=> b!651851 m!625479))

(declare-fun m!625481 () Bool)

(assert (=> d!92291 m!625481))

(declare-fun m!625485 () Bool)

(assert (=> d!92291 m!625485))

(assert (=> d!92291 m!625209))

(assert (=> d!92291 m!625025))

(assert (=> b!651428 d!92291))

(check-sat (not b!651700) (not bm!33773) (not d!92223) (not b!651709) (not bm!33769) (not d!92235) (not b!651610) (not b!651749) (not b!651651) (not d!92275) (not b!651699) (not d!92217) (not b!651851) (not bm!33759) (not d!92179) (not d!92291) (not b!651607) (not d!92237) (not b!651773) (not bm!33763) (not d!92227) (not b!651835) (not d!92283) (not b!651609) (not b!651746) (not b!651595) (not b!651815) (not d!92209) (not b!651695) (not d!92171) (not bm!33767) (not d!92281) (not b!651677) (not d!92265) (not b!651697) (not b!651751) (not b!651825) (not b!651646) (not b!651678) (not b!651675) (not b!651748) (not b!651775) (not b!651587) (not b!651777))
(check-sat)
