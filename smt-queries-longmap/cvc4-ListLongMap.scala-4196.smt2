; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57270 () Bool)

(assert start!57270)

(declare-fun b!634026 () Bool)

(declare-fun e!362548 () Bool)

(declare-fun e!362545 () Bool)

(assert (=> b!634026 (= e!362548 e!362545)))

(declare-fun res!410114 () Bool)

(assert (=> b!634026 (=> (not res!410114) (not e!362545))))

(declare-datatypes ((SeekEntryResult!6760 0))(
  ( (MissingZero!6760 (index!29339 (_ BitVec 32))) (Found!6760 (index!29340 (_ BitVec 32))) (Intermediate!6760 (undefined!7572 Bool) (index!29341 (_ BitVec 32)) (x!58077 (_ BitVec 32))) (Undefined!6760) (MissingVacant!6760 (index!29342 (_ BitVec 32))) )
))
(declare-fun lt!293101 () SeekEntryResult!6760)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634026 (= res!410114 (or (= lt!293101 (MissingZero!6760 i!1108)) (= lt!293101 (MissingVacant!6760 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38180 0))(
  ( (array!38181 (arr!18320 (Array (_ BitVec 32) (_ BitVec 64))) (size!18684 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38180)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38180 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!634026 (= lt!293101 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634028 () Bool)

(declare-fun e!362546 () Bool)

(declare-fun e!362540 () Bool)

(assert (=> b!634028 (= e!362546 (not e!362540))))

(declare-fun res!410122 () Bool)

(assert (=> b!634028 (=> res!410122 e!362540)))

(declare-fun lt!293095 () SeekEntryResult!6760)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634028 (= res!410122 (not (= lt!293095 (Found!6760 index!984))))))

(declare-datatypes ((Unit!21374 0))(
  ( (Unit!21375) )
))
(declare-fun lt!293099 () Unit!21374)

(declare-fun e!362542 () Unit!21374)

(assert (=> b!634028 (= lt!293099 e!362542)))

(declare-fun c!72323 () Bool)

(assert (=> b!634028 (= c!72323 (= lt!293095 Undefined!6760))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293096 () array!38180)

(declare-fun lt!293100 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38180 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!634028 (= lt!293095 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293100 lt!293096 mask!3053))))

(declare-fun e!362550 () Bool)

(assert (=> b!634028 e!362550))

(declare-fun res!410128 () Bool)

(assert (=> b!634028 (=> (not res!410128) (not e!362550))))

(declare-fun lt!293098 () SeekEntryResult!6760)

(declare-fun lt!293094 () (_ BitVec 32))

(assert (=> b!634028 (= res!410128 (= lt!293098 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293094 vacantSpotIndex!68 lt!293100 lt!293096 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!634028 (= lt!293098 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293094 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634028 (= lt!293100 (select (store (arr!18320 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293097 () Unit!21374)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38180 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21374)

(assert (=> b!634028 (= lt!293097 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293094 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634028 (= lt!293094 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634029 () Bool)

(declare-fun res!410127 () Bool)

(assert (=> b!634029 (=> (not res!410127) (not e!362548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634029 (= res!410127 (validKeyInArray!0 (select (arr!18320 a!2986) j!136)))))

(declare-fun b!634030 () Bool)

(declare-fun e!362544 () Bool)

(declare-fun e!362549 () Bool)

(assert (=> b!634030 (= e!362544 e!362549)))

(declare-fun res!410125 () Bool)

(assert (=> b!634030 (=> res!410125 e!362549)))

(declare-fun lt!293093 () (_ BitVec 64))

(assert (=> b!634030 (= res!410125 (or (not (= (select (arr!18320 a!2986) j!136) lt!293100)) (not (= (select (arr!18320 a!2986) j!136) lt!293093)) (bvsge j!136 index!984)))))

(declare-fun b!634031 () Bool)

(declare-fun lt!293092 () SeekEntryResult!6760)

(assert (=> b!634031 (= e!362550 (= lt!293092 lt!293098))))

(declare-fun b!634032 () Bool)

(declare-fun e!362541 () Bool)

(assert (=> b!634032 (= e!362545 e!362541)))

(declare-fun res!410116 () Bool)

(assert (=> b!634032 (=> (not res!410116) (not e!362541))))

(assert (=> b!634032 (= res!410116 (= (select (store (arr!18320 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634032 (= lt!293096 (array!38181 (store (arr!18320 a!2986) i!1108 k!1786) (size!18684 a!2986)))))

(declare-fun b!634033 () Bool)

(declare-fun e!362543 () Bool)

(assert (=> b!634033 (= e!362549 e!362543)))

(declare-fun res!410129 () Bool)

(assert (=> b!634033 (=> (not res!410129) (not e!362543))))

(declare-fun arrayContainsKey!0 (array!38180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634033 (= res!410129 (arrayContainsKey!0 lt!293096 (select (arr!18320 a!2986) j!136) j!136))))

(declare-fun b!634034 () Bool)

(declare-fun res!410124 () Bool)

(assert (=> b!634034 (=> (not res!410124) (not e!362545))))

(declare-datatypes ((List!12361 0))(
  ( (Nil!12358) (Cons!12357 (h!13402 (_ BitVec 64)) (t!18589 List!12361)) )
))
(declare-fun arrayNoDuplicates!0 (array!38180 (_ BitVec 32) List!12361) Bool)

(assert (=> b!634034 (= res!410124 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12358))))

(declare-fun b!634035 () Bool)

(declare-fun res!410119 () Bool)

(assert (=> b!634035 (=> (not res!410119) (not e!362548))))

(assert (=> b!634035 (= res!410119 (and (= (size!18684 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18684 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18684 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634036 () Bool)

(declare-fun Unit!21376 () Unit!21374)

(assert (=> b!634036 (= e!362542 Unit!21376)))

(assert (=> b!634036 false))

(declare-fun b!634037 () Bool)

(assert (=> b!634037 (= e!362543 (arrayContainsKey!0 lt!293096 (select (arr!18320 a!2986) j!136) index!984))))

(declare-fun b!634038 () Bool)

(declare-fun res!410120 () Bool)

(assert (=> b!634038 (=> (not res!410120) (not e!362548))))

(assert (=> b!634038 (= res!410120 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634039 () Bool)

(declare-fun res!410123 () Bool)

(assert (=> b!634039 (=> (not res!410123) (not e!362545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38180 (_ BitVec 32)) Bool)

(assert (=> b!634039 (= res!410123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634027 () Bool)

(assert (=> b!634027 (= e!362540 true)))

(assert (=> b!634027 e!362544))

(declare-fun res!410117 () Bool)

(assert (=> b!634027 (=> (not res!410117) (not e!362544))))

(assert (=> b!634027 (= res!410117 (= lt!293093 (select (arr!18320 a!2986) j!136)))))

(assert (=> b!634027 (= lt!293093 (select (store (arr!18320 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!410115 () Bool)

(assert (=> start!57270 (=> (not res!410115) (not e!362548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57270 (= res!410115 (validMask!0 mask!3053))))

(assert (=> start!57270 e!362548))

(assert (=> start!57270 true))

(declare-fun array_inv!14116 (array!38180) Bool)

(assert (=> start!57270 (array_inv!14116 a!2986)))

(declare-fun b!634040 () Bool)

(declare-fun res!410118 () Bool)

(assert (=> b!634040 (=> (not res!410118) (not e!362548))))

(assert (=> b!634040 (= res!410118 (validKeyInArray!0 k!1786))))

(declare-fun b!634041 () Bool)

(declare-fun res!410126 () Bool)

(assert (=> b!634041 (=> (not res!410126) (not e!362545))))

(assert (=> b!634041 (= res!410126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18320 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634042 () Bool)

(declare-fun Unit!21377 () Unit!21374)

(assert (=> b!634042 (= e!362542 Unit!21377)))

(declare-fun b!634043 () Bool)

(assert (=> b!634043 (= e!362541 e!362546)))

(declare-fun res!410121 () Bool)

(assert (=> b!634043 (=> (not res!410121) (not e!362546))))

(assert (=> b!634043 (= res!410121 (and (= lt!293092 (Found!6760 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18320 a!2986) index!984) (select (arr!18320 a!2986) j!136))) (not (= (select (arr!18320 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634043 (= lt!293092 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57270 res!410115) b!634035))

(assert (= (and b!634035 res!410119) b!634029))

(assert (= (and b!634029 res!410127) b!634040))

(assert (= (and b!634040 res!410118) b!634038))

(assert (= (and b!634038 res!410120) b!634026))

(assert (= (and b!634026 res!410114) b!634039))

(assert (= (and b!634039 res!410123) b!634034))

(assert (= (and b!634034 res!410124) b!634041))

(assert (= (and b!634041 res!410126) b!634032))

(assert (= (and b!634032 res!410116) b!634043))

(assert (= (and b!634043 res!410121) b!634028))

(assert (= (and b!634028 res!410128) b!634031))

(assert (= (and b!634028 c!72323) b!634036))

(assert (= (and b!634028 (not c!72323)) b!634042))

(assert (= (and b!634028 (not res!410122)) b!634027))

(assert (= (and b!634027 res!410117) b!634030))

(assert (= (and b!634030 (not res!410125)) b!634033))

(assert (= (and b!634033 res!410129) b!634037))

(declare-fun m!608593 () Bool)

(assert (=> b!634038 m!608593))

(declare-fun m!608595 () Bool)

(assert (=> b!634043 m!608595))

(declare-fun m!608597 () Bool)

(assert (=> b!634043 m!608597))

(assert (=> b!634043 m!608597))

(declare-fun m!608599 () Bool)

(assert (=> b!634043 m!608599))

(declare-fun m!608601 () Bool)

(assert (=> b!634028 m!608601))

(declare-fun m!608603 () Bool)

(assert (=> b!634028 m!608603))

(declare-fun m!608605 () Bool)

(assert (=> b!634028 m!608605))

(assert (=> b!634028 m!608597))

(declare-fun m!608607 () Bool)

(assert (=> b!634028 m!608607))

(declare-fun m!608609 () Bool)

(assert (=> b!634028 m!608609))

(declare-fun m!608611 () Bool)

(assert (=> b!634028 m!608611))

(assert (=> b!634028 m!608597))

(declare-fun m!608613 () Bool)

(assert (=> b!634028 m!608613))

(declare-fun m!608615 () Bool)

(assert (=> b!634041 m!608615))

(assert (=> b!634030 m!608597))

(assert (=> b!634027 m!608597))

(assert (=> b!634027 m!608609))

(declare-fun m!608617 () Bool)

(assert (=> b!634027 m!608617))

(assert (=> b!634029 m!608597))

(assert (=> b!634029 m!608597))

(declare-fun m!608619 () Bool)

(assert (=> b!634029 m!608619))

(assert (=> b!634033 m!608597))

(assert (=> b!634033 m!608597))

(declare-fun m!608621 () Bool)

(assert (=> b!634033 m!608621))

(declare-fun m!608623 () Bool)

(assert (=> start!57270 m!608623))

(declare-fun m!608625 () Bool)

(assert (=> start!57270 m!608625))

(declare-fun m!608627 () Bool)

(assert (=> b!634040 m!608627))

(assert (=> b!634032 m!608609))

(declare-fun m!608629 () Bool)

(assert (=> b!634032 m!608629))

(declare-fun m!608631 () Bool)

(assert (=> b!634039 m!608631))

(declare-fun m!608633 () Bool)

(assert (=> b!634034 m!608633))

(assert (=> b!634037 m!608597))

(assert (=> b!634037 m!608597))

(declare-fun m!608635 () Bool)

(assert (=> b!634037 m!608635))

(declare-fun m!608637 () Bool)

(assert (=> b!634026 m!608637))

(push 1)

