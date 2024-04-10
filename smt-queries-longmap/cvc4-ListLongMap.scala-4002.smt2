; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54338 () Bool)

(assert start!54338)

(declare-fun b!593581 () Bool)

(declare-fun e!339065 () Bool)

(declare-fun e!339066 () Bool)

(assert (=> b!593581 (= e!339065 e!339066)))

(declare-fun res!379962 () Bool)

(assert (=> b!593581 (=> res!379962 e!339066)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!269491 () (_ BitVec 64))

(declare-fun lt!269500 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36942 0))(
  ( (array!36943 (arr!17738 (Array (_ BitVec 32) (_ BitVec 64))) (size!18102 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36942)

(assert (=> b!593581 (= res!379962 (or (not (= (select (arr!17738 a!2986) j!136) lt!269491)) (not (= (select (arr!17738 a!2986) j!136) lt!269500)) (bvsge j!136 index!984)))))

(declare-fun b!593582 () Bool)

(declare-fun res!379970 () Bool)

(declare-fun e!339060 () Bool)

(assert (=> b!593582 (=> (not res!379970) (not e!339060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!593582 (= res!379970 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17738 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593583 () Bool)

(declare-fun res!379968 () Bool)

(declare-fun e!339069 () Bool)

(assert (=> b!593583 (=> (not res!379968) (not e!339069))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593583 (= res!379968 (validKeyInArray!0 k!1786))))

(declare-fun b!593584 () Bool)

(declare-fun e!339059 () Bool)

(declare-fun e!339057 () Bool)

(assert (=> b!593584 (= e!339059 e!339057)))

(declare-fun res!379974 () Bool)

(assert (=> b!593584 (=> res!379974 e!339057)))

(assert (=> b!593584 (= res!379974 (or (not (= (select (arr!17738 a!2986) j!136) lt!269491)) (not (= (select (arr!17738 a!2986) j!136) lt!269500)) (bvsge j!136 index!984)))))

(assert (=> b!593584 e!339065))

(declare-fun res!379965 () Bool)

(assert (=> b!593584 (=> (not res!379965) (not e!339065))))

(assert (=> b!593584 (= res!379965 (= lt!269500 (select (arr!17738 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593584 (= lt!269500 (select (store (arr!17738 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!593585 () Bool)

(declare-fun e!339058 () Bool)

(declare-datatypes ((SeekEntryResult!6178 0))(
  ( (MissingZero!6178 (index!26954 (_ BitVec 32))) (Found!6178 (index!26955 (_ BitVec 32))) (Intermediate!6178 (undefined!6990 Bool) (index!26956 (_ BitVec 32)) (x!55748 (_ BitVec 32))) (Undefined!6178) (MissingVacant!6178 (index!26957 (_ BitVec 32))) )
))
(declare-fun lt!269499 () SeekEntryResult!6178)

(declare-fun lt!269498 () SeekEntryResult!6178)

(assert (=> b!593585 (= e!339058 (= lt!269499 lt!269498))))

(declare-fun b!593586 () Bool)

(declare-fun e!339068 () Bool)

(assert (=> b!593586 (= e!339068 (not e!339059))))

(declare-fun res!379969 () Bool)

(assert (=> b!593586 (=> res!379969 e!339059)))

(declare-fun lt!269490 () SeekEntryResult!6178)

(assert (=> b!593586 (= res!379969 (not (= lt!269490 (Found!6178 index!984))))))

(declare-datatypes ((Unit!18630 0))(
  ( (Unit!18631) )
))
(declare-fun lt!269495 () Unit!18630)

(declare-fun e!339063 () Unit!18630)

(assert (=> b!593586 (= lt!269495 e!339063)))

(declare-fun c!67178 () Bool)

(assert (=> b!593586 (= c!67178 (= lt!269490 Undefined!6178))))

(declare-fun lt!269493 () array!36942)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36942 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!593586 (= lt!269490 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269491 lt!269493 mask!3053))))

(assert (=> b!593586 e!339058))

(declare-fun res!379966 () Bool)

(assert (=> b!593586 (=> (not res!379966) (not e!339058))))

(declare-fun lt!269494 () (_ BitVec 32))

(assert (=> b!593586 (= res!379966 (= lt!269498 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 lt!269491 lt!269493 mask!3053)))))

(assert (=> b!593586 (= lt!269498 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593586 (= lt!269491 (select (store (arr!17738 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269496 () Unit!18630)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36942 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18630)

(assert (=> b!593586 (= lt!269496 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593586 (= lt!269494 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593587 () Bool)

(declare-fun Unit!18632 () Unit!18630)

(assert (=> b!593587 (= e!339063 Unit!18632)))

(assert (=> b!593587 false))

(declare-fun b!593588 () Bool)

(declare-fun res!379959 () Bool)

(assert (=> b!593588 (=> (not res!379959) (not e!339069))))

(declare-fun arrayContainsKey!0 (array!36942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593588 (= res!379959 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593589 () Bool)

(declare-fun e!339062 () Bool)

(assert (=> b!593589 (= e!339060 e!339062)))

(declare-fun res!379972 () Bool)

(assert (=> b!593589 (=> (not res!379972) (not e!339062))))

(assert (=> b!593589 (= res!379972 (= (select (store (arr!17738 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593589 (= lt!269493 (array!36943 (store (arr!17738 a!2986) i!1108 k!1786) (size!18102 a!2986)))))

(declare-fun b!593590 () Bool)

(declare-fun e!339061 () Bool)

(declare-datatypes ((List!11779 0))(
  ( (Nil!11776) (Cons!11775 (h!12820 (_ BitVec 64)) (t!18007 List!11779)) )
))
(declare-fun noDuplicate!233 (List!11779) Bool)

(assert (=> b!593590 (= e!339061 (noDuplicate!233 Nil!11776))))

(declare-fun b!593591 () Bool)

(declare-fun res!379960 () Bool)

(assert (=> b!593591 (=> (not res!379960) (not e!339060))))

(declare-fun arrayNoDuplicates!0 (array!36942 (_ BitVec 32) List!11779) Bool)

(assert (=> b!593591 (= res!379960 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11776))))

(declare-fun b!593593 () Bool)

(declare-fun e!339067 () Bool)

(assert (=> b!593593 (= e!339066 e!339067)))

(declare-fun res!379964 () Bool)

(assert (=> b!593593 (=> (not res!379964) (not e!339067))))

(assert (=> b!593593 (= res!379964 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) j!136))))

(declare-fun b!593594 () Bool)

(declare-fun res!379963 () Bool)

(assert (=> b!593594 (=> (not res!379963) (not e!339069))))

(assert (=> b!593594 (= res!379963 (and (= (size!18102 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18102 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18102 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593595 () Bool)

(declare-fun res!379975 () Bool)

(assert (=> b!593595 (=> (not res!379975) (not e!339069))))

(assert (=> b!593595 (= res!379975 (validKeyInArray!0 (select (arr!17738 a!2986) j!136)))))

(declare-fun b!593596 () Bool)

(declare-fun Unit!18633 () Unit!18630)

(assert (=> b!593596 (= e!339063 Unit!18633)))

(declare-fun b!593597 () Bool)

(assert (=> b!593597 (= e!339062 e!339068)))

(declare-fun res!379973 () Bool)

(assert (=> b!593597 (=> (not res!379973) (not e!339068))))

(assert (=> b!593597 (= res!379973 (and (= lt!269499 (Found!6178 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17738 a!2986) index!984) (select (arr!17738 a!2986) j!136))) (not (= (select (arr!17738 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593597 (= lt!269499 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593598 () Bool)

(assert (=> b!593598 (= e!339067 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) index!984))))

(declare-fun b!593599 () Bool)

(declare-fun res!379976 () Bool)

(assert (=> b!593599 (=> (not res!379976) (not e!339060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36942 (_ BitVec 32)) Bool)

(assert (=> b!593599 (= res!379976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593600 () Bool)

(assert (=> b!593600 (= e!339069 e!339060)))

(declare-fun res!379961 () Bool)

(assert (=> b!593600 (=> (not res!379961) (not e!339060))))

(declare-fun lt!269492 () SeekEntryResult!6178)

(assert (=> b!593600 (= res!379961 (or (= lt!269492 (MissingZero!6178 i!1108)) (= lt!269492 (MissingVacant!6178 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36942 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!593600 (= lt!269492 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!593592 () Bool)

(assert (=> b!593592 (= e!339057 e!339061)))

(declare-fun res!379967 () Bool)

(assert (=> b!593592 (=> res!379967 e!339061)))

(assert (=> b!593592 (= res!379967 (or (bvsgt #b00000000000000000000000000000000 (size!18102 a!2986)) (bvsge (size!18102 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593592 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269497 () Unit!18630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18630)

(assert (=> b!593592 (= lt!269497 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269493 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!379971 () Bool)

(assert (=> start!54338 (=> (not res!379971) (not e!339069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54338 (= res!379971 (validMask!0 mask!3053))))

(assert (=> start!54338 e!339069))

(assert (=> start!54338 true))

(declare-fun array_inv!13534 (array!36942) Bool)

(assert (=> start!54338 (array_inv!13534 a!2986)))

(assert (= (and start!54338 res!379971) b!593594))

(assert (= (and b!593594 res!379963) b!593595))

(assert (= (and b!593595 res!379975) b!593583))

(assert (= (and b!593583 res!379968) b!593588))

(assert (= (and b!593588 res!379959) b!593600))

(assert (= (and b!593600 res!379961) b!593599))

(assert (= (and b!593599 res!379976) b!593591))

(assert (= (and b!593591 res!379960) b!593582))

(assert (= (and b!593582 res!379970) b!593589))

(assert (= (and b!593589 res!379972) b!593597))

(assert (= (and b!593597 res!379973) b!593586))

(assert (= (and b!593586 res!379966) b!593585))

(assert (= (and b!593586 c!67178) b!593587))

(assert (= (and b!593586 (not c!67178)) b!593596))

(assert (= (and b!593586 (not res!379969)) b!593584))

(assert (= (and b!593584 res!379965) b!593581))

(assert (= (and b!593581 (not res!379962)) b!593593))

(assert (= (and b!593593 res!379964) b!593598))

(assert (= (and b!593584 (not res!379974)) b!593592))

(assert (= (and b!593592 (not res!379967)) b!593590))

(declare-fun m!571519 () Bool)

(assert (=> b!593582 m!571519))

(declare-fun m!571521 () Bool)

(assert (=> b!593588 m!571521))

(declare-fun m!571523 () Bool)

(assert (=> b!593583 m!571523))

(declare-fun m!571525 () Bool)

(assert (=> b!593597 m!571525))

(declare-fun m!571527 () Bool)

(assert (=> b!593597 m!571527))

(assert (=> b!593597 m!571527))

(declare-fun m!571529 () Bool)

(assert (=> b!593597 m!571529))

(assert (=> b!593593 m!571527))

(assert (=> b!593593 m!571527))

(declare-fun m!571531 () Bool)

(assert (=> b!593593 m!571531))

(declare-fun m!571533 () Bool)

(assert (=> b!593590 m!571533))

(declare-fun m!571535 () Bool)

(assert (=> b!593599 m!571535))

(assert (=> b!593584 m!571527))

(declare-fun m!571537 () Bool)

(assert (=> b!593584 m!571537))

(declare-fun m!571539 () Bool)

(assert (=> b!593584 m!571539))

(assert (=> b!593589 m!571537))

(declare-fun m!571541 () Bool)

(assert (=> b!593589 m!571541))

(declare-fun m!571543 () Bool)

(assert (=> b!593600 m!571543))

(declare-fun m!571545 () Bool)

(assert (=> b!593586 m!571545))

(declare-fun m!571547 () Bool)

(assert (=> b!593586 m!571547))

(declare-fun m!571549 () Bool)

(assert (=> b!593586 m!571549))

(declare-fun m!571551 () Bool)

(assert (=> b!593586 m!571551))

(assert (=> b!593586 m!571527))

(declare-fun m!571553 () Bool)

(assert (=> b!593586 m!571553))

(assert (=> b!593586 m!571527))

(declare-fun m!571555 () Bool)

(assert (=> b!593586 m!571555))

(assert (=> b!593586 m!571537))

(declare-fun m!571557 () Bool)

(assert (=> b!593591 m!571557))

(assert (=> b!593581 m!571527))

(assert (=> b!593592 m!571527))

(assert (=> b!593592 m!571527))

(declare-fun m!571559 () Bool)

(assert (=> b!593592 m!571559))

(assert (=> b!593592 m!571527))

(declare-fun m!571561 () Bool)

(assert (=> b!593592 m!571561))

(assert (=> b!593595 m!571527))

(assert (=> b!593595 m!571527))

(declare-fun m!571563 () Bool)

(assert (=> b!593595 m!571563))

(declare-fun m!571565 () Bool)

(assert (=> start!54338 m!571565))

(declare-fun m!571567 () Bool)

(assert (=> start!54338 m!571567))

(assert (=> b!593598 m!571527))

(assert (=> b!593598 m!571527))

(declare-fun m!571569 () Bool)

(assert (=> b!593598 m!571569))

(push 1)

(assert (not b!593586))

(assert (not start!54338))

(assert (not b!593591))

(assert (not b!593595))

(assert (not b!593597))

(assert (not b!593598))

(assert (not b!593600))

(assert (not b!593590))

(assert (not b!593592))

(assert (not b!593588))

(assert (not b!593599))

(assert (not b!593593))

(assert (not b!593583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86459 () Bool)

(declare-fun res!380007 () Bool)

(declare-fun e!339115 () Bool)

(assert (=> d!86459 (=> res!380007 e!339115)))

(assert (=> d!86459 (= res!380007 (= (select (arr!17738 lt!269493) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17738 a!2986) j!136)))))

(assert (=> d!86459 (= (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339115)))

(declare-fun b!593661 () Bool)

(declare-fun e!339117 () Bool)

(assert (=> b!593661 (= e!339115 e!339117)))

(declare-fun res!380009 () Bool)

(assert (=> b!593661 (=> (not res!380009) (not e!339117))))

(assert (=> b!593661 (= res!380009 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18102 lt!269493)))))

(declare-fun b!593663 () Bool)

(assert (=> b!593663 (= e!339117 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86459 (not res!380007)) b!593661))

(assert (= (and b!593661 res!380009) b!593663))

(declare-fun m!571607 () Bool)

(assert (=> d!86459 m!571607))

(assert (=> b!593663 m!571527))

(declare-fun m!571611 () Bool)

(assert (=> b!593663 m!571611))

(assert (=> b!593592 d!86459))

(declare-fun d!86462 () Bool)

(assert (=> d!86462 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269529 () Unit!18630)

(declare-fun choose!114 (array!36942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18630)

(assert (=> d!86462 (= lt!269529 (choose!114 lt!269493 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86462 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86462 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269493 (select (arr!17738 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269529)))

(declare-fun bs!18310 () Bool)

(assert (= bs!18310 d!86462))

(assert (=> bs!18310 m!571527))

(assert (=> bs!18310 m!571559))

(assert (=> bs!18310 m!571527))

(declare-fun m!571623 () Bool)

(assert (=> bs!18310 m!571623))

(assert (=> b!593592 d!86462))

(declare-fun d!86469 () Bool)

(assert (=> d!86469 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54338 d!86469))

(declare-fun d!86483 () Bool)

(assert (=> d!86483 (= (array_inv!13534 a!2986) (bvsge (size!18102 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54338 d!86483))

(declare-fun d!86485 () Bool)

(declare-fun res!380012 () Bool)

(declare-fun e!339135 () Bool)

(assert (=> d!86485 (=> res!380012 e!339135)))

(assert (=> d!86485 (= res!380012 (= (select (arr!17738 lt!269493) j!136) (select (arr!17738 a!2986) j!136)))))

(assert (=> d!86485 (= (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) j!136) e!339135)))

(declare-fun b!593696 () Bool)

(declare-fun e!339136 () Bool)

(assert (=> b!593696 (= e!339135 e!339136)))

(declare-fun res!380013 () Bool)

(assert (=> b!593696 (=> (not res!380013) (not e!339136))))

(assert (=> b!593696 (= res!380013 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18102 lt!269493)))))

(declare-fun b!593697 () Bool)

(assert (=> b!593697 (= e!339136 (arrayContainsKey!0 lt!269493 (select (arr!17738 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86485 (not res!380012)) b!593696))

(assert (= (and b!593696 res!380013) b!593697))

(declare-fun m!571645 () Bool)

(assert (=> d!86485 m!571645))

(assert (=> b!593697 m!571527))

(declare-fun m!571647 () Bool)

(assert (=> b!593697 m!571647))

(assert (=> b!593593 d!86485))

(declare-fun d!86487 () Bool)

(assert (=> d!86487 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593583 d!86487))

(declare-fun d!86489 () Bool)

(assert (=> d!86489 (= (validKeyInArray!0 (select (arr!17738 a!2986) j!136)) (and (not (= (select (arr!17738 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17738 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593595 d!86489))

(declare-fun d!86491 () Bool)

(declare-fun e!339172 () Bool)

(assert (=> d!86491 e!339172))

(declare-fun res!380034 () Bool)

(assert (=> d!86491 (=> (not res!380034) (not e!339172))))

(assert (=> d!86491 (= res!380034 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18102 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18102 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18102 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18102 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18102 a!2986))))))

(declare-fun lt!269554 () Unit!18630)

(declare-fun choose!9 (array!36942 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18630)

(assert (=> d!86491 (= lt!269554 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86491 (validMask!0 mask!3053)))

(assert (=> d!86491 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 mask!3053) lt!269554)))

(declare-fun b!593748 () Bool)

(assert (=> b!593748 (= e!339172 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 (select (arr!17738 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269494 vacantSpotIndex!68 (select (store (arr!17738 a!2986) i!1108 k!1786) j!136) (array!36943 (store (arr!17738 a!2986) i!1108 k!1786) (size!18102 a!2986)) mask!3053)))))

(assert (= (and d!86491 res!380034) b!593748))

(declare-fun m!571687 () Bool)

(assert (=> d!86491 m!571687))

(assert (=> d!86491 m!571565))

(assert (=> b!593748 m!571549))

(declare-fun m!571689 () Bool)

(assert (=> b!593748 m!571689))

(assert (=> b!593748 m!571549))

(assert (=> b!593748 m!571527))

(assert (=> b!593748 m!571553))

(assert (=> b!593748 m!571527))

(assert (=> b!593748 m!571537))

(assert (=> b!593586 d!86491))

(declare-fun b!593776 () Bool)

(declare-fun e!339191 () SeekEntryResult!6178)

(declare-fun e!339190 () SeekEntryResult!6178)

(assert (=> b!593776 (= e!339191 e!339190)))

(declare-fun c!67234 () Bool)

(declare-fun lt!269561 () (_ BitVec 64))

(assert (=> b!593776 (= c!67234 (= lt!269561 lt!269491))))

(declare-fun b!593777 () Bool)

(declare-fun e!339192 () SeekEntryResult!6178)

(assert (=> b!593777 (= e!339192 (MissingVacant!6178 vacantSpotIndex!68))))

(declare-fun b!593778 () Bool)

(declare-fun c!67235 () Bool)

(assert (=> b!593778 (= c!67235 (= lt!269561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593778 (= e!339190 e!339192)))

(declare-fun lt!269562 () SeekEntryResult!6178)

(declare-fun d!86509 () Bool)

(assert (=> d!86509 (and (or (is-Undefined!6178 lt!269562) (not (is-Found!6178 lt!269562)) (and (bvsge (index!26955 lt!269562) #b00000000000000000000000000000000) (bvslt (index!26955 lt!269562) (size!18102 lt!269493)))) (or (is-Undefined!6178 lt!269562) (is-Found!6178 lt!269562) (not (is-MissingVacant!6178 lt!269562)) (not (= (index!26957 lt!269562) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!269562) #b00000000000000000000000000000000) (bvslt (index!26957 lt!269562) (size!18102 lt!269493)))) (or (is-Undefined!6178 lt!269562) (ite (is-Found!6178 lt!269562) (= (select (arr!17738 lt!269493) (index!26955 lt!269562)) lt!269491) (and (is-MissingVacant!6178 lt!269562) (= (index!26957 lt!269562) vacantSpotIndex!68) (= (select (arr!17738 lt!269493) (index!26957 lt!269562)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86509 (= lt!269562 e!339191)))

(declare-fun c!67233 () Bool)

(assert (=> d!86509 (= c!67233 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86509 (= lt!269561 (select (arr!17738 lt!269493) index!984))))

(assert (=> d!86509 (validMask!0 mask!3053)))

(assert (=> d!86509 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269491 lt!269493 mask!3053) lt!269562)))

(declare-fun b!593775 () Bool)

(assert (=> b!593775 (= e!339191 Undefined!6178)))

(declare-fun b!593779 () Bool)

(assert (=> b!593779 (= e!339190 (Found!6178 index!984))))

(declare-fun b!593780 () Bool)

(assert (=> b!593780 (= e!339192 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269491 lt!269493 mask!3053))))

(assert (= (and d!86509 c!67233) b!593775))

(assert (= (and d!86509 (not c!67233)) b!593776))

(assert (= (and b!593776 c!67234) b!593779))

(assert (= (and b!593776 (not c!67234)) b!593778))

(assert (= (and b!593778 c!67235) b!593777))

(assert (= (and b!593778 (not c!67235)) b!593780))

(declare-fun m!571709 () Bool)

(assert (=> d!86509 m!571709))

(declare-fun m!571711 () Bool)

(assert (=> d!86509 m!571711))

(declare-fun m!571713 () Bool)

(assert (=> d!86509 m!571713))

(assert (=> d!86509 m!571565))

(assert (=> b!593780 m!571547))

(assert (=> b!593780 m!571547))

(declare-fun m!571715 () Bool)

(assert (=> b!593780 m!571715))

(assert (=> b!593586 d!86509))

(declare-fun b!593782 () Bool)

(declare-fun e!339194 () SeekEntryResult!6178)

(declare-fun e!339193 () SeekEntryResult!6178)

(assert (=> b!593782 (= e!339194 e!339193)))

(declare-fun c!67237 () Bool)

(declare-fun lt!269563 () (_ BitVec 64))

(assert (=> b!593782 (= c!67237 (= lt!269563 lt!269491))))

(declare-fun b!593783 () Bool)

(declare-fun e!339195 () SeekEntryResult!6178)

(assert (=> b!593783 (= e!339195 (MissingVacant!6178 vacantSpotIndex!68))))

(declare-fun b!593784 () Bool)

(declare-fun c!67238 () Bool)

(assert (=> b!593784 (= c!67238 (= lt!269563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593784 (= e!339193 e!339195)))

(declare-fun d!86525 () Bool)

(declare-fun lt!269564 () SeekEntryResult!6178)

(assert (=> d!86525 (and (or (is-Undefined!6178 lt!269564) (not (is-Found!6178 lt!269564)) (and (bvsge (index!26955 lt!269564) #b00000000000000000000000000000000) (bvslt (index!26955 lt!269564) (size!18102 lt!269493)))) (or (is-Undefined!6178 lt!269564) (is-Found!6178 lt!269564) (not (is-MissingVacant!6178 lt!269564)) (not (= (index!26957 lt!269564) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!269564) #b00000000000000000000000000000000) (bvslt (index!26957 lt!269564) (size!18102 lt!269493)))) (or (is-Undefined!6178 lt!269564) (ite (is-Found!6178 lt!269564) (= (select (arr!17738 lt!269493) (index!26955 lt!269564)) lt!269491) (and (is-MissingVacant!6178 lt!269564) (= (index!26957 lt!269564) vacantSpotIndex!68) (= (select (arr!17738 lt!269493) (index!26957 lt!269564)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86525 (= lt!269564 e!339194)))

(declare-fun c!67236 () Bool)

(assert (=> d!86525 (= c!67236 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86525 (= lt!269563 (select (arr!17738 lt!269493) lt!269494))))

(assert (=> d!86525 (validMask!0 mask!3053)))

