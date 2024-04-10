; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56056 () Bool)

(assert start!56056)

(declare-fun b!617423 () Bool)

(declare-fun e!354049 () Bool)

(declare-fun e!354044 () Bool)

(assert (=> b!617423 (= e!354049 e!354044)))

(declare-fun res!397757 () Bool)

(assert (=> b!617423 (=> (not res!397757) (not e!354044))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6449 0))(
  ( (MissingZero!6449 (index!28080 (_ BitVec 32))) (Found!6449 (index!28081 (_ BitVec 32))) (Intermediate!6449 (undefined!7261 Bool) (index!28082 (_ BitVec 32)) (x!56873 (_ BitVec 32))) (Undefined!6449) (MissingVacant!6449 (index!28083 (_ BitVec 32))) )
))
(declare-fun lt!284305 () SeekEntryResult!6449)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37526 0))(
  ( (array!37527 (arr!18009 (Array (_ BitVec 32) (_ BitVec 64))) (size!18373 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37526)

(assert (=> b!617423 (= res!397757 (and (= lt!284305 (Found!6449 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18009 a!2986) index!984) (select (arr!18009 a!2986) j!136))) (not (= (select (arr!18009 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37526 (_ BitVec 32)) SeekEntryResult!6449)

(assert (=> b!617423 (= lt!284305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18009 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617424 () Bool)

(declare-fun res!397758 () Bool)

(declare-fun e!354043 () Bool)

(assert (=> b!617424 (=> (not res!397758) (not e!354043))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617424 (= res!397758 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617425 () Bool)

(declare-fun res!397759 () Bool)

(assert (=> b!617425 (=> (not res!397759) (not e!354043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617425 (= res!397759 (validKeyInArray!0 k!1786))))

(declare-fun b!617426 () Bool)

(declare-datatypes ((Unit!20218 0))(
  ( (Unit!20219) )
))
(declare-fun e!354051 () Unit!20218)

(declare-fun Unit!20220 () Unit!20218)

(assert (=> b!617426 (= e!354051 Unit!20220)))

(assert (=> b!617426 false))

(declare-fun b!617427 () Bool)

(declare-fun e!354048 () Unit!20218)

(declare-fun Unit!20221 () Unit!20218)

(assert (=> b!617427 (= e!354048 Unit!20221)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!397766 () Bool)

(assert (=> b!617427 (= res!397766 (= (select (store (arr!18009 a!2986) i!1108 k!1786) index!984) (select (arr!18009 a!2986) j!136)))))

(declare-fun e!354056 () Bool)

(assert (=> b!617427 (=> (not res!397766) (not e!354056))))

(assert (=> b!617427 e!354056))

(declare-fun c!70205 () Bool)

(assert (=> b!617427 (= c!70205 (bvslt j!136 index!984))))

(declare-fun lt!284300 () Unit!20218)

(declare-fun e!354045 () Unit!20218)

(assert (=> b!617427 (= lt!284300 e!354045)))

(declare-fun c!70202 () Bool)

(assert (=> b!617427 (= c!70202 (bvslt index!984 j!136))))

(declare-fun lt!284314 () Unit!20218)

(declare-fun e!354047 () Unit!20218)

(assert (=> b!617427 (= lt!284314 e!354047)))

(assert (=> b!617427 false))

(declare-fun b!617428 () Bool)

(declare-fun lt!284298 () array!37526)

(declare-fun e!354046 () Bool)

(assert (=> b!617428 (= e!354046 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) index!984))))

(declare-fun b!617429 () Bool)

(declare-fun res!397763 () Bool)

(declare-fun e!354053 () Bool)

(assert (=> b!617429 (=> (not res!397763) (not e!354053))))

(assert (=> b!617429 (= res!397763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18009 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!354052 () Bool)

(declare-fun b!617430 () Bool)

(assert (=> b!617430 (= e!354052 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) index!984))))

(declare-fun b!617431 () Bool)

(declare-fun res!397756 () Bool)

(assert (=> b!617431 (=> (not res!397756) (not e!354053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37526 (_ BitVec 32)) Bool)

(assert (=> b!617431 (= res!397756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617432 () Bool)

(declare-fun res!397769 () Bool)

(assert (=> b!617432 (= res!397769 (bvsge j!136 index!984))))

(declare-fun e!354050 () Bool)

(assert (=> b!617432 (=> res!397769 e!354050)))

(assert (=> b!617432 (= e!354056 e!354050)))

(declare-fun res!397765 () Bool)

(assert (=> start!56056 (=> (not res!397765) (not e!354043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56056 (= res!397765 (validMask!0 mask!3053))))

(assert (=> start!56056 e!354043))

(assert (=> start!56056 true))

(declare-fun array_inv!13805 (array!37526) Bool)

(assert (=> start!56056 (array_inv!13805 a!2986)))

(declare-fun b!617433 () Bool)

(declare-fun e!354054 () Bool)

(declare-fun lt!284302 () SeekEntryResult!6449)

(assert (=> b!617433 (= e!354054 (= lt!284305 lt!284302))))

(declare-fun b!617434 () Bool)

(declare-fun res!397767 () Bool)

(assert (=> b!617434 (=> (not res!397767) (not e!354053))))

(declare-datatypes ((List!12050 0))(
  ( (Nil!12047) (Cons!12046 (h!13091 (_ BitVec 64)) (t!18278 List!12050)) )
))
(declare-fun arrayNoDuplicates!0 (array!37526 (_ BitVec 32) List!12050) Bool)

(assert (=> b!617434 (= res!397767 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12047))))

(declare-fun b!617435 () Bool)

(declare-fun Unit!20222 () Unit!20218)

(assert (=> b!617435 (= e!354045 Unit!20222)))

(declare-fun b!617436 () Bool)

(declare-fun Unit!20223 () Unit!20218)

(assert (=> b!617436 (= e!354047 Unit!20223)))

(declare-fun b!617437 () Bool)

(assert (=> b!617437 (= e!354043 e!354053)))

(declare-fun res!397754 () Bool)

(assert (=> b!617437 (=> (not res!397754) (not e!354053))))

(declare-fun lt!284304 () SeekEntryResult!6449)

(assert (=> b!617437 (= res!397754 (or (= lt!284304 (MissingZero!6449 i!1108)) (= lt!284304 (MissingVacant!6449 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37526 (_ BitVec 32)) SeekEntryResult!6449)

(assert (=> b!617437 (= lt!284304 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617438 () Bool)

(declare-fun Unit!20224 () Unit!20218)

(assert (=> b!617438 (= e!354051 Unit!20224)))

(declare-fun b!617439 () Bool)

(declare-fun Unit!20225 () Unit!20218)

(assert (=> b!617439 (= e!354048 Unit!20225)))

(declare-fun b!617440 () Bool)

(assert (=> b!617440 false))

(declare-fun lt!284299 () Unit!20218)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37526 (_ BitVec 64) (_ BitVec 32) List!12050) Unit!20218)

(assert (=> b!617440 (= lt!284299 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284298 (select (arr!18009 a!2986) j!136) j!136 Nil!12047))))

(assert (=> b!617440 (arrayNoDuplicates!0 lt!284298 j!136 Nil!12047)))

(declare-fun lt!284317 () Unit!20218)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37526 (_ BitVec 32) (_ BitVec 32)) Unit!20218)

(assert (=> b!617440 (= lt!284317 (lemmaNoDuplicateFromThenFromBigger!0 lt!284298 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617440 (arrayNoDuplicates!0 lt!284298 #b00000000000000000000000000000000 Nil!12047)))

(declare-fun lt!284313 () Unit!20218)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12050) Unit!20218)

(assert (=> b!617440 (= lt!284313 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12047))))

(assert (=> b!617440 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284307 () Unit!20218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20218)

(assert (=> b!617440 (= lt!284307 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284298 (select (arr!18009 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20226 () Unit!20218)

(assert (=> b!617440 (= e!354045 Unit!20226)))

(declare-fun b!617441 () Bool)

(declare-fun e!354055 () Bool)

(assert (=> b!617441 (= e!354055 true)))

(assert (=> b!617441 (= (select (store (arr!18009 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617442 () Bool)

(declare-fun res!397753 () Bool)

(assert (=> b!617442 (=> (not res!397753) (not e!354043))))

(assert (=> b!617442 (= res!397753 (and (= (size!18373 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18373 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18373 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!397762 () Bool)

(declare-fun b!617443 () Bool)

(assert (=> b!617443 (= res!397762 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) j!136))))

(assert (=> b!617443 (=> (not res!397762) (not e!354046))))

(assert (=> b!617443 (= e!354050 e!354046)))

(declare-fun b!617444 () Bool)

(declare-fun res!397768 () Bool)

(assert (=> b!617444 (=> (not res!397768) (not e!354043))))

(assert (=> b!617444 (= res!397768 (validKeyInArray!0 (select (arr!18009 a!2986) j!136)))))

(declare-fun b!617445 () Bool)

(assert (=> b!617445 false))

(declare-fun lt!284306 () Unit!20218)

(assert (=> b!617445 (= lt!284306 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284298 (select (arr!18009 a!2986) j!136) index!984 Nil!12047))))

(assert (=> b!617445 (arrayNoDuplicates!0 lt!284298 index!984 Nil!12047)))

(declare-fun lt!284312 () Unit!20218)

(assert (=> b!617445 (= lt!284312 (lemmaNoDuplicateFromThenFromBigger!0 lt!284298 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617445 (arrayNoDuplicates!0 lt!284298 #b00000000000000000000000000000000 Nil!12047)))

(declare-fun lt!284303 () Unit!20218)

(assert (=> b!617445 (= lt!284303 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12047))))

(assert (=> b!617445 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284309 () Unit!20218)

(assert (=> b!617445 (= lt!284309 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284298 (select (arr!18009 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617445 e!354052))

(declare-fun res!397761 () Bool)

(assert (=> b!617445 (=> (not res!397761) (not e!354052))))

(assert (=> b!617445 (= res!397761 (arrayContainsKey!0 lt!284298 (select (arr!18009 a!2986) j!136) j!136))))

(declare-fun Unit!20227 () Unit!20218)

(assert (=> b!617445 (= e!354047 Unit!20227)))

(declare-fun b!617446 () Bool)

(assert (=> b!617446 (= e!354053 e!354049)))

(declare-fun res!397760 () Bool)

(assert (=> b!617446 (=> (not res!397760) (not e!354049))))

(assert (=> b!617446 (= res!397760 (= (select (store (arr!18009 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617446 (= lt!284298 (array!37527 (store (arr!18009 a!2986) i!1108 k!1786) (size!18373 a!2986)))))

(declare-fun b!617447 () Bool)

(assert (=> b!617447 (= e!354044 (not e!354055))))

(declare-fun res!397755 () Bool)

(assert (=> b!617447 (=> res!397755 e!354055)))

(declare-fun lt!284301 () SeekEntryResult!6449)

(assert (=> b!617447 (= res!397755 (not (= lt!284301 (MissingVacant!6449 vacantSpotIndex!68))))))

(declare-fun lt!284316 () Unit!20218)

(assert (=> b!617447 (= lt!284316 e!354048)))

(declare-fun c!70203 () Bool)

(assert (=> b!617447 (= c!70203 (= lt!284301 (Found!6449 index!984)))))

(declare-fun lt!284308 () Unit!20218)

(assert (=> b!617447 (= lt!284308 e!354051)))

(declare-fun c!70204 () Bool)

(assert (=> b!617447 (= c!70204 (= lt!284301 Undefined!6449))))

(declare-fun lt!284311 () (_ BitVec 64))

(assert (=> b!617447 (= lt!284301 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284311 lt!284298 mask!3053))))

(assert (=> b!617447 e!354054))

(declare-fun res!397764 () Bool)

(assert (=> b!617447 (=> (not res!397764) (not e!354054))))

(declare-fun lt!284315 () (_ BitVec 32))

(assert (=> b!617447 (= res!397764 (= lt!284302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284315 vacantSpotIndex!68 lt!284311 lt!284298 mask!3053)))))

(assert (=> b!617447 (= lt!284302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284315 vacantSpotIndex!68 (select (arr!18009 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617447 (= lt!284311 (select (store (arr!18009 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284310 () Unit!20218)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20218)

(assert (=> b!617447 (= lt!284310 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284315 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617447 (= lt!284315 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56056 res!397765) b!617442))

(assert (= (and b!617442 res!397753) b!617444))

(assert (= (and b!617444 res!397768) b!617425))

(assert (= (and b!617425 res!397759) b!617424))

(assert (= (and b!617424 res!397758) b!617437))

(assert (= (and b!617437 res!397754) b!617431))

(assert (= (and b!617431 res!397756) b!617434))

(assert (= (and b!617434 res!397767) b!617429))

(assert (= (and b!617429 res!397763) b!617446))

(assert (= (and b!617446 res!397760) b!617423))

(assert (= (and b!617423 res!397757) b!617447))

(assert (= (and b!617447 res!397764) b!617433))

(assert (= (and b!617447 c!70204) b!617426))

(assert (= (and b!617447 (not c!70204)) b!617438))

(assert (= (and b!617447 c!70203) b!617427))

(assert (= (and b!617447 (not c!70203)) b!617439))

(assert (= (and b!617427 res!397766) b!617432))

(assert (= (and b!617432 (not res!397769)) b!617443))

(assert (= (and b!617443 res!397762) b!617428))

(assert (= (and b!617427 c!70205) b!617440))

(assert (= (and b!617427 (not c!70205)) b!617435))

(assert (= (and b!617427 c!70202) b!617445))

(assert (= (and b!617427 (not c!70202)) b!617436))

(assert (= (and b!617445 res!397761) b!617430))

(assert (= (and b!617447 (not res!397755)) b!617441))

(declare-fun m!593531 () Bool)

(assert (=> b!617443 m!593531))

(assert (=> b!617443 m!593531))

(declare-fun m!593533 () Bool)

(assert (=> b!617443 m!593533))

(assert (=> b!617445 m!593531))

(declare-fun m!593535 () Bool)

(assert (=> b!617445 m!593535))

(declare-fun m!593537 () Bool)

(assert (=> b!617445 m!593537))

(assert (=> b!617445 m!593531))

(assert (=> b!617445 m!593533))

(assert (=> b!617445 m!593531))

(declare-fun m!593539 () Bool)

(assert (=> b!617445 m!593539))

(declare-fun m!593541 () Bool)

(assert (=> b!617445 m!593541))

(assert (=> b!617445 m!593531))

(declare-fun m!593543 () Bool)

(assert (=> b!617445 m!593543))

(assert (=> b!617445 m!593531))

(declare-fun m!593545 () Bool)

(assert (=> b!617445 m!593545))

(declare-fun m!593547 () Bool)

(assert (=> b!617445 m!593547))

(declare-fun m!593549 () Bool)

(assert (=> b!617425 m!593549))

(declare-fun m!593551 () Bool)

(assert (=> b!617440 m!593551))

(declare-fun m!593553 () Bool)

(assert (=> b!617440 m!593553))

(assert (=> b!617440 m!593547))

(assert (=> b!617440 m!593531))

(declare-fun m!593555 () Bool)

(assert (=> b!617440 m!593555))

(assert (=> b!617440 m!593531))

(declare-fun m!593557 () Bool)

(assert (=> b!617440 m!593557))

(assert (=> b!617440 m!593541))

(assert (=> b!617440 m!593531))

(assert (=> b!617440 m!593531))

(declare-fun m!593559 () Bool)

(assert (=> b!617440 m!593559))

(assert (=> b!617430 m!593531))

(assert (=> b!617430 m!593531))

(declare-fun m!593561 () Bool)

(assert (=> b!617430 m!593561))

(declare-fun m!593563 () Bool)

(assert (=> b!617431 m!593563))

(declare-fun m!593565 () Bool)

(assert (=> b!617429 m!593565))

(declare-fun m!593567 () Bool)

(assert (=> start!56056 m!593567))

(declare-fun m!593569 () Bool)

(assert (=> start!56056 m!593569))

(declare-fun m!593571 () Bool)

(assert (=> b!617437 m!593571))

(declare-fun m!593573 () Bool)

(assert (=> b!617424 m!593573))

(assert (=> b!617428 m!593531))

(assert (=> b!617428 m!593531))

(assert (=> b!617428 m!593561))

(declare-fun m!593575 () Bool)

(assert (=> b!617423 m!593575))

(assert (=> b!617423 m!593531))

(assert (=> b!617423 m!593531))

(declare-fun m!593577 () Bool)

(assert (=> b!617423 m!593577))

(declare-fun m!593579 () Bool)

(assert (=> b!617427 m!593579))

(declare-fun m!593581 () Bool)

(assert (=> b!617427 m!593581))

(assert (=> b!617427 m!593531))

(assert (=> b!617441 m!593579))

(assert (=> b!617441 m!593581))

(assert (=> b!617444 m!593531))

(assert (=> b!617444 m!593531))

(declare-fun m!593583 () Bool)

(assert (=> b!617444 m!593583))

(assert (=> b!617446 m!593579))

(declare-fun m!593585 () Bool)

(assert (=> b!617446 m!593585))

(declare-fun m!593587 () Bool)

(assert (=> b!617447 m!593587))

(declare-fun m!593589 () Bool)

(assert (=> b!617447 m!593589))

(declare-fun m!593591 () Bool)

(assert (=> b!617447 m!593591))

(assert (=> b!617447 m!593531))

(declare-fun m!593593 () Bool)

(assert (=> b!617447 m!593593))

(assert (=> b!617447 m!593579))

(declare-fun m!593595 () Bool)

(assert (=> b!617447 m!593595))

(assert (=> b!617447 m!593531))

(declare-fun m!593597 () Bool)

(assert (=> b!617447 m!593597))

(declare-fun m!593599 () Bool)

(assert (=> b!617434 m!593599))

(push 1)

