; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56184 () Bool)

(assert start!56184)

(declare-fun b!622442 () Bool)

(assert (=> b!622442 false))

(declare-datatypes ((array!37668 0))(
  ( (array!37669 (arr!18080 (Array (_ BitVec 32) (_ BitVec 64))) (size!18445 (_ BitVec 32))) )
))
(declare-fun lt!288400 () array!37668)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20916 0))(
  ( (Unit!20917) )
))
(declare-fun lt!288388 () Unit!20916)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37668)

(declare-datatypes ((List!12160 0))(
  ( (Nil!12157) (Cons!12156 (h!13201 (_ BitVec 64)) (t!18379 List!12160)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37668 (_ BitVec 64) (_ BitVec 32) List!12160) Unit!20916)

(assert (=> b!622442 (= lt!288388 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288400 (select (arr!18080 a!2986) j!136) index!984 Nil!12157))))

(declare-fun arrayNoDuplicates!0 (array!37668 (_ BitVec 32) List!12160) Bool)

(assert (=> b!622442 (arrayNoDuplicates!0 lt!288400 index!984 Nil!12157)))

(declare-fun lt!288398 () Unit!20916)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37668 (_ BitVec 32) (_ BitVec 32)) Unit!20916)

(assert (=> b!622442 (= lt!288398 (lemmaNoDuplicateFromThenFromBigger!0 lt!288400 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622442 (arrayNoDuplicates!0 lt!288400 #b00000000000000000000000000000000 Nil!12157)))

(declare-fun lt!288387 () Unit!20916)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12160) Unit!20916)

(assert (=> b!622442 (= lt!288387 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12157))))

(declare-fun arrayContainsKey!0 (array!37668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622442 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288401 () Unit!20916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20916)

(assert (=> b!622442 (= lt!288401 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288400 (select (arr!18080 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357003 () Bool)

(assert (=> b!622442 e!357003))

(declare-fun res!401196 () Bool)

(assert (=> b!622442 (=> (not res!401196) (not e!357003))))

(assert (=> b!622442 (= res!401196 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) j!136))))

(declare-fun e!357012 () Unit!20916)

(declare-fun Unit!20918 () Unit!20916)

(assert (=> b!622442 (= e!357012 Unit!20918)))

(declare-fun b!622443 () Bool)

(declare-fun e!357004 () Unit!20916)

(declare-fun Unit!20919 () Unit!20916)

(assert (=> b!622443 (= e!357004 Unit!20919)))

(assert (=> b!622443 false))

(declare-fun b!622444 () Bool)

(declare-fun e!357002 () Bool)

(declare-datatypes ((SeekEntryResult!6517 0))(
  ( (MissingZero!6517 (index!28352 (_ BitVec 32))) (Found!6517 (index!28353 (_ BitVec 32))) (Intermediate!6517 (undefined!7329 Bool) (index!28354 (_ BitVec 32)) (x!57128 (_ BitVec 32))) (Undefined!6517) (MissingVacant!6517 (index!28355 (_ BitVec 32))) )
))
(declare-fun lt!288385 () SeekEntryResult!6517)

(declare-fun lt!288397 () SeekEntryResult!6517)

(assert (=> b!622444 (= e!357002 (= lt!288385 lt!288397))))

(declare-fun b!622445 () Bool)

(declare-fun e!357009 () Unit!20916)

(declare-fun Unit!20920 () Unit!20916)

(assert (=> b!622445 (= e!357009 Unit!20920)))

(declare-fun b!622446 () Bool)

(declare-fun res!401190 () Bool)

(declare-fun e!357007 () Bool)

(assert (=> b!622446 (=> (not res!401190) (not e!357007))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622446 (= res!401190 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18080 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622447 () Bool)

(declare-fun res!401197 () Bool)

(declare-fun e!357011 () Bool)

(assert (=> b!622447 (=> (not res!401197) (not e!357011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622447 (= res!401197 (validKeyInArray!0 (select (arr!18080 a!2986) j!136)))))

(declare-fun b!622448 () Bool)

(declare-fun e!357008 () Unit!20916)

(declare-fun Unit!20921 () Unit!20916)

(assert (=> b!622448 (= e!357008 Unit!20921)))

(declare-fun b!622450 () Bool)

(declare-fun e!357010 () Bool)

(assert (=> b!622450 (= e!357007 e!357010)))

(declare-fun res!401189 () Bool)

(assert (=> b!622450 (=> (not res!401189) (not e!357010))))

(assert (=> b!622450 (= res!401189 (= (select (store (arr!18080 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622450 (= lt!288400 (array!37669 (store (arr!18080 a!2986) i!1108 k0!1786) (size!18445 a!2986)))))

(declare-fun b!622451 () Bool)

(declare-fun res!401195 () Bool)

(assert (=> b!622451 (=> (not res!401195) (not e!357011))))

(assert (=> b!622451 (= res!401195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622452 () Bool)

(assert (=> b!622452 false))

(declare-fun lt!288403 () Unit!20916)

(assert (=> b!622452 (= lt!288403 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288400 (select (arr!18080 a!2986) j!136) j!136 Nil!12157))))

(assert (=> b!622452 (arrayNoDuplicates!0 lt!288400 j!136 Nil!12157)))

(declare-fun lt!288389 () Unit!20916)

(assert (=> b!622452 (= lt!288389 (lemmaNoDuplicateFromThenFromBigger!0 lt!288400 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622452 (arrayNoDuplicates!0 lt!288400 #b00000000000000000000000000000000 Nil!12157)))

(declare-fun lt!288394 () Unit!20916)

(assert (=> b!622452 (= lt!288394 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12157))))

(assert (=> b!622452 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288391 () Unit!20916)

(assert (=> b!622452 (= lt!288391 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288400 (select (arr!18080 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20922 () Unit!20916)

(assert (=> b!622452 (= e!357008 Unit!20922)))

(declare-fun b!622453 () Bool)

(declare-fun e!357006 () Bool)

(assert (=> b!622453 (= e!357006 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) index!984))))

(declare-fun res!401194 () Bool)

(declare-fun b!622454 () Bool)

(assert (=> b!622454 (= res!401194 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) j!136))))

(assert (=> b!622454 (=> (not res!401194) (not e!357006))))

(declare-fun e!356999 () Bool)

(assert (=> b!622454 (= e!356999 e!357006)))

(declare-fun b!622455 () Bool)

(declare-fun res!401193 () Bool)

(assert (=> b!622455 (=> (not res!401193) (not e!357007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37668 (_ BitVec 32)) Bool)

(assert (=> b!622455 (= res!401193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622456 () Bool)

(declare-fun Unit!20923 () Unit!20916)

(assert (=> b!622456 (= e!357004 Unit!20923)))

(declare-fun b!622457 () Bool)

(declare-fun e!357005 () Bool)

(assert (=> b!622457 (= e!357010 e!357005)))

(declare-fun res!401186 () Bool)

(assert (=> b!622457 (=> (not res!401186) (not e!357005))))

(assert (=> b!622457 (= res!401186 (and (= lt!288385 (Found!6517 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18080 a!2986) index!984) (select (arr!18080 a!2986) j!136))) (not (= (select (arr!18080 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37668 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!622457 (= lt!288385 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18080 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622458 () Bool)

(declare-fun res!401198 () Bool)

(assert (=> b!622458 (=> (not res!401198) (not e!357011))))

(assert (=> b!622458 (= res!401198 (validKeyInArray!0 k0!1786))))

(declare-fun b!622459 () Bool)

(declare-fun res!401192 () Bool)

(assert (=> b!622459 (=> (not res!401192) (not e!357007))))

(assert (=> b!622459 (= res!401192 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12157))))

(declare-fun b!622460 () Bool)

(declare-fun res!401201 () Bool)

(assert (=> b!622460 (=> (not res!401201) (not e!357011))))

(assert (=> b!622460 (= res!401201 (and (= (size!18445 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18445 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18445 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622449 () Bool)

(declare-fun Unit!20924 () Unit!20916)

(assert (=> b!622449 (= e!357012 Unit!20924)))

(declare-fun res!401199 () Bool)

(assert (=> start!56184 (=> (not res!401199) (not e!357011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56184 (= res!401199 (validMask!0 mask!3053))))

(assert (=> start!56184 e!357011))

(assert (=> start!56184 true))

(declare-fun array_inv!13963 (array!37668) Bool)

(assert (=> start!56184 (array_inv!13963 a!2986)))

(declare-fun b!622461 () Bool)

(declare-fun Unit!20925 () Unit!20916)

(assert (=> b!622461 (= e!357009 Unit!20925)))

(declare-fun res!401188 () Bool)

(assert (=> b!622461 (= res!401188 (= (select (store (arr!18080 a!2986) i!1108 k0!1786) index!984) (select (arr!18080 a!2986) j!136)))))

(declare-fun e!357000 () Bool)

(assert (=> b!622461 (=> (not res!401188) (not e!357000))))

(assert (=> b!622461 e!357000))

(declare-fun c!70996 () Bool)

(assert (=> b!622461 (= c!70996 (bvslt j!136 index!984))))

(declare-fun lt!288396 () Unit!20916)

(assert (=> b!622461 (= lt!288396 e!357008)))

(declare-fun c!70997 () Bool)

(assert (=> b!622461 (= c!70997 (bvslt index!984 j!136))))

(declare-fun lt!288390 () Unit!20916)

(assert (=> b!622461 (= lt!288390 e!357012)))

(assert (=> b!622461 false))

(declare-fun b!622462 () Bool)

(assert (=> b!622462 (= e!357003 (arrayContainsKey!0 lt!288400 (select (arr!18080 a!2986) j!136) index!984))))

(declare-fun b!622463 () Bool)

(declare-fun res!401191 () Bool)

(assert (=> b!622463 (= res!401191 (bvsge j!136 index!984))))

(assert (=> b!622463 (=> res!401191 e!356999)))

(assert (=> b!622463 (= e!357000 e!356999)))

(declare-fun b!622464 () Bool)

(assert (=> b!622464 (= e!357011 e!357007)))

(declare-fun res!401187 () Bool)

(assert (=> b!622464 (=> (not res!401187) (not e!357007))))

(declare-fun lt!288399 () SeekEntryResult!6517)

(assert (=> b!622464 (= res!401187 (or (= lt!288399 (MissingZero!6517 i!1108)) (= lt!288399 (MissingVacant!6517 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37668 (_ BitVec 32)) SeekEntryResult!6517)

(assert (=> b!622464 (= lt!288399 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622465 () Bool)

(assert (=> b!622465 (= e!357005 (not true))))

(declare-fun lt!288395 () Unit!20916)

(assert (=> b!622465 (= lt!288395 e!357009)))

(declare-fun c!70998 () Bool)

(declare-fun lt!288393 () SeekEntryResult!6517)

(assert (=> b!622465 (= c!70998 (= lt!288393 (Found!6517 index!984)))))

(declare-fun lt!288386 () Unit!20916)

(assert (=> b!622465 (= lt!288386 e!357004)))

(declare-fun c!70995 () Bool)

(assert (=> b!622465 (= c!70995 (= lt!288393 Undefined!6517))))

(declare-fun lt!288402 () (_ BitVec 64))

(assert (=> b!622465 (= lt!288393 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288402 lt!288400 mask!3053))))

(assert (=> b!622465 e!357002))

(declare-fun res!401200 () Bool)

(assert (=> b!622465 (=> (not res!401200) (not e!357002))))

(declare-fun lt!288392 () (_ BitVec 32))

(assert (=> b!622465 (= res!401200 (= lt!288397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 lt!288402 lt!288400 mask!3053)))))

(assert (=> b!622465 (= lt!288397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 (select (arr!18080 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622465 (= lt!288402 (select (store (arr!18080 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288384 () Unit!20916)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20916)

(assert (=> b!622465 (= lt!288384 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288392 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622465 (= lt!288392 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56184 res!401199) b!622460))

(assert (= (and b!622460 res!401201) b!622447))

(assert (= (and b!622447 res!401197) b!622458))

(assert (= (and b!622458 res!401198) b!622451))

(assert (= (and b!622451 res!401195) b!622464))

(assert (= (and b!622464 res!401187) b!622455))

(assert (= (and b!622455 res!401193) b!622459))

(assert (= (and b!622459 res!401192) b!622446))

(assert (= (and b!622446 res!401190) b!622450))

(assert (= (and b!622450 res!401189) b!622457))

(assert (= (and b!622457 res!401186) b!622465))

(assert (= (and b!622465 res!401200) b!622444))

(assert (= (and b!622465 c!70995) b!622443))

(assert (= (and b!622465 (not c!70995)) b!622456))

(assert (= (and b!622465 c!70998) b!622461))

(assert (= (and b!622465 (not c!70998)) b!622445))

(assert (= (and b!622461 res!401188) b!622463))

(assert (= (and b!622463 (not res!401191)) b!622454))

(assert (= (and b!622454 res!401194) b!622453))

(assert (= (and b!622461 c!70996) b!622452))

(assert (= (and b!622461 (not c!70996)) b!622448))

(assert (= (and b!622461 c!70997) b!622442))

(assert (= (and b!622461 (not c!70997)) b!622449))

(assert (= (and b!622442 res!401196) b!622462))

(declare-fun m!597799 () Bool)

(assert (=> b!622453 m!597799))

(assert (=> b!622453 m!597799))

(declare-fun m!597801 () Bool)

(assert (=> b!622453 m!597801))

(declare-fun m!597803 () Bool)

(assert (=> b!622451 m!597803))

(declare-fun m!597805 () Bool)

(assert (=> b!622446 m!597805))

(declare-fun m!597807 () Bool)

(assert (=> b!622465 m!597807))

(declare-fun m!597809 () Bool)

(assert (=> b!622465 m!597809))

(declare-fun m!597811 () Bool)

(assert (=> b!622465 m!597811))

(assert (=> b!622465 m!597799))

(declare-fun m!597813 () Bool)

(assert (=> b!622465 m!597813))

(declare-fun m!597815 () Bool)

(assert (=> b!622465 m!597815))

(declare-fun m!597817 () Bool)

(assert (=> b!622465 m!597817))

(assert (=> b!622465 m!597799))

(declare-fun m!597819 () Bool)

(assert (=> b!622465 m!597819))

(declare-fun m!597821 () Bool)

(assert (=> start!56184 m!597821))

(declare-fun m!597823 () Bool)

(assert (=> start!56184 m!597823))

(assert (=> b!622461 m!597811))

(declare-fun m!597825 () Bool)

(assert (=> b!622461 m!597825))

(assert (=> b!622461 m!597799))

(declare-fun m!597827 () Bool)

(assert (=> b!622455 m!597827))

(assert (=> b!622442 m!597799))

(declare-fun m!597829 () Bool)

(assert (=> b!622442 m!597829))

(assert (=> b!622442 m!597799))

(declare-fun m!597831 () Bool)

(assert (=> b!622442 m!597831))

(declare-fun m!597833 () Bool)

(assert (=> b!622442 m!597833))

(declare-fun m!597835 () Bool)

(assert (=> b!622442 m!597835))

(declare-fun m!597837 () Bool)

(assert (=> b!622442 m!597837))

(assert (=> b!622442 m!597799))

(assert (=> b!622442 m!597799))

(declare-fun m!597839 () Bool)

(assert (=> b!622442 m!597839))

(assert (=> b!622442 m!597799))

(declare-fun m!597841 () Bool)

(assert (=> b!622442 m!597841))

(declare-fun m!597843 () Bool)

(assert (=> b!622442 m!597843))

(assert (=> b!622454 m!597799))

(assert (=> b!622454 m!597799))

(assert (=> b!622454 m!597829))

(assert (=> b!622462 m!597799))

(assert (=> b!622462 m!597799))

(assert (=> b!622462 m!597801))

(assert (=> b!622450 m!597811))

(declare-fun m!597845 () Bool)

(assert (=> b!622450 m!597845))

(declare-fun m!597847 () Bool)

(assert (=> b!622457 m!597847))

(assert (=> b!622457 m!597799))

(assert (=> b!622457 m!597799))

(declare-fun m!597849 () Bool)

(assert (=> b!622457 m!597849))

(declare-fun m!597851 () Bool)

(assert (=> b!622459 m!597851))

(declare-fun m!597853 () Bool)

(assert (=> b!622458 m!597853))

(assert (=> b!622452 m!597799))

(declare-fun m!597855 () Bool)

(assert (=> b!622452 m!597855))

(assert (=> b!622452 m!597799))

(assert (=> b!622452 m!597799))

(declare-fun m!597857 () Bool)

(assert (=> b!622452 m!597857))

(declare-fun m!597859 () Bool)

(assert (=> b!622452 m!597859))

(assert (=> b!622452 m!597835))

(declare-fun m!597861 () Bool)

(assert (=> b!622452 m!597861))

(assert (=> b!622452 m!597799))

(declare-fun m!597863 () Bool)

(assert (=> b!622452 m!597863))

(assert (=> b!622452 m!597843))

(assert (=> b!622447 m!597799))

(assert (=> b!622447 m!597799))

(declare-fun m!597865 () Bool)

(assert (=> b!622447 m!597865))

(declare-fun m!597867 () Bool)

(assert (=> b!622464 m!597867))

(check-sat (not b!622459) (not b!622454) (not b!622458) (not b!622453) (not b!622457) (not b!622455) (not b!622447) (not b!622442) (not start!56184) (not b!622465) (not b!622452) (not b!622462) (not b!622451) (not b!622464))
(check-sat)
