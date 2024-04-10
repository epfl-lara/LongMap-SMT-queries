; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54532 () Bool)

(assert start!54532)

(declare-fun b!595723 () Bool)

(declare-datatypes ((Unit!18718 0))(
  ( (Unit!18719) )
))
(declare-fun e!340362 () Unit!18718)

(declare-fun Unit!18720 () Unit!18718)

(assert (=> b!595723 (= e!340362 Unit!18720)))

(assert (=> b!595723 false))

(declare-fun b!595724 () Bool)

(declare-fun Unit!18721 () Unit!18718)

(assert (=> b!595724 (= e!340362 Unit!18721)))

(declare-fun b!595725 () Bool)

(declare-fun res!381584 () Bool)

(declare-fun e!340367 () Bool)

(assert (=> b!595725 (=> (not res!381584) (not e!340367))))

(declare-datatypes ((array!36992 0))(
  ( (array!36993 (arr!17760 (Array (_ BitVec 32) (_ BitVec 64))) (size!18124 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36992)

(declare-datatypes ((List!11801 0))(
  ( (Nil!11798) (Cons!11797 (h!12842 (_ BitVec 64)) (t!18029 List!11801)) )
))
(declare-fun arrayNoDuplicates!0 (array!36992 (_ BitVec 32) List!11801) Bool)

(assert (=> b!595725 (= res!381584 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11798))))

(declare-fun b!595726 () Bool)

(declare-fun res!381589 () Bool)

(declare-fun e!340366 () Bool)

(assert (=> b!595726 (=> (not res!381589) (not e!340366))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!595726 (= res!381589 (and (= (size!18124 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18124 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18124 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595727 () Bool)

(declare-fun e!340374 () Bool)

(assert (=> b!595727 (= e!340367 e!340374)))

(declare-fun res!381575 () Bool)

(assert (=> b!595727 (=> (not res!381575) (not e!340374))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!595727 (= res!381575 (= (select (store (arr!17760 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270527 () array!36992)

(assert (=> b!595727 (= lt!270527 (array!36993 (store (arr!17760 a!2986) i!1108 k!1786) (size!18124 a!2986)))))

(declare-fun b!595728 () Bool)

(declare-fun res!381577 () Bool)

(declare-fun e!340369 () Bool)

(assert (=> b!595728 (=> res!381577 e!340369)))

(declare-fun contains!2936 (List!11801 (_ BitVec 64)) Bool)

(assert (=> b!595728 (= res!381577 (contains!2936 Nil!11798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595729 () Bool)

(declare-fun res!381573 () Bool)

(assert (=> b!595729 (=> (not res!381573) (not e!340366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595729 (= res!381573 (validKeyInArray!0 (select (arr!17760 a!2986) j!136)))))

(declare-fun b!595731 () Bool)

(declare-fun e!340368 () Bool)

(declare-fun e!340370 () Bool)

(assert (=> b!595731 (= e!340368 e!340370)))

(declare-fun res!381580 () Bool)

(assert (=> b!595731 (=> res!381580 e!340370)))

(declare-fun lt!270526 () (_ BitVec 64))

(declare-fun lt!270520 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595731 (= res!381580 (or (not (= (select (arr!17760 a!2986) j!136) lt!270526)) (not (= (select (arr!17760 a!2986) j!136) lt!270520)) (bvsge j!136 index!984)))))

(declare-fun b!595732 () Bool)

(declare-fun e!340365 () Bool)

(assert (=> b!595732 (= e!340374 e!340365)))

(declare-fun res!381592 () Bool)

(assert (=> b!595732 (=> (not res!381592) (not e!340365))))

(declare-datatypes ((SeekEntryResult!6200 0))(
  ( (MissingZero!6200 (index!27048 (_ BitVec 32))) (Found!6200 (index!27049 (_ BitVec 32))) (Intermediate!6200 (undefined!7012 Bool) (index!27050 (_ BitVec 32)) (x!55852 (_ BitVec 32))) (Undefined!6200) (MissingVacant!6200 (index!27051 (_ BitVec 32))) )
))
(declare-fun lt!270519 () SeekEntryResult!6200)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595732 (= res!381592 (and (= lt!270519 (Found!6200 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17760 a!2986) index!984) (select (arr!17760 a!2986) j!136))) (not (= (select (arr!17760 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36992 (_ BitVec 32)) SeekEntryResult!6200)

(assert (=> b!595732 (= lt!270519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17760 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595733 () Bool)

(declare-fun e!340364 () Bool)

(declare-fun arrayContainsKey!0 (array!36992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595733 (= e!340364 (arrayContainsKey!0 lt!270527 (select (arr!17760 a!2986) j!136) index!984))))

(declare-fun b!595734 () Bool)

(assert (=> b!595734 (= e!340369 true)))

(declare-fun lt!270521 () Bool)

(assert (=> b!595734 (= lt!270521 (contains!2936 Nil!11798 k!1786))))

(declare-fun b!595735 () Bool)

(declare-fun e!340371 () Bool)

(assert (=> b!595735 (= e!340365 (not e!340371))))

(declare-fun res!381585 () Bool)

(assert (=> b!595735 (=> res!381585 e!340371)))

(declare-fun lt!270528 () SeekEntryResult!6200)

(assert (=> b!595735 (= res!381585 (not (= lt!270528 (Found!6200 index!984))))))

(declare-fun lt!270529 () Unit!18718)

(assert (=> b!595735 (= lt!270529 e!340362)))

(declare-fun c!67442 () Bool)

(assert (=> b!595735 (= c!67442 (= lt!270528 Undefined!6200))))

(assert (=> b!595735 (= lt!270528 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270526 lt!270527 mask!3053))))

(declare-fun e!340363 () Bool)

(assert (=> b!595735 e!340363))

(declare-fun res!381590 () Bool)

(assert (=> b!595735 (=> (not res!381590) (not e!340363))))

(declare-fun lt!270518 () (_ BitVec 32))

(declare-fun lt!270524 () SeekEntryResult!6200)

(assert (=> b!595735 (= res!381590 (= lt!270524 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270518 vacantSpotIndex!68 lt!270526 lt!270527 mask!3053)))))

(assert (=> b!595735 (= lt!270524 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270518 vacantSpotIndex!68 (select (arr!17760 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595735 (= lt!270526 (select (store (arr!17760 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270522 () Unit!18718)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36992 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18718)

(assert (=> b!595735 (= lt!270522 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270518 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595735 (= lt!270518 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595736 () Bool)

(declare-fun res!381583 () Bool)

(assert (=> b!595736 (=> res!381583 e!340369)))

(assert (=> b!595736 (= res!381583 (contains!2936 Nil!11798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595737 () Bool)

(assert (=> b!595737 (= e!340363 (= lt!270519 lt!270524))))

(declare-fun b!595738 () Bool)

(declare-fun res!381586 () Bool)

(assert (=> b!595738 (=> (not res!381586) (not e!340367))))

(assert (=> b!595738 (= res!381586 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17760 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595739 () Bool)

(assert (=> b!595739 (= e!340370 e!340364)))

(declare-fun res!381574 () Bool)

(assert (=> b!595739 (=> (not res!381574) (not e!340364))))

(assert (=> b!595739 (= res!381574 (arrayContainsKey!0 lt!270527 (select (arr!17760 a!2986) j!136) j!136))))

(declare-fun b!595740 () Bool)

(declare-fun res!381578 () Bool)

(assert (=> b!595740 (=> (not res!381578) (not e!340366))))

(assert (=> b!595740 (= res!381578 (validKeyInArray!0 k!1786))))

(declare-fun res!381576 () Bool)

(assert (=> start!54532 (=> (not res!381576) (not e!340366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54532 (= res!381576 (validMask!0 mask!3053))))

(assert (=> start!54532 e!340366))

(assert (=> start!54532 true))

(declare-fun array_inv!13556 (array!36992) Bool)

(assert (=> start!54532 (array_inv!13556 a!2986)))

(declare-fun b!595730 () Bool)

(declare-fun res!381579 () Bool)

(assert (=> b!595730 (=> (not res!381579) (not e!340367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36992 (_ BitVec 32)) Bool)

(assert (=> b!595730 (= res!381579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595741 () Bool)

(declare-fun res!381582 () Bool)

(assert (=> b!595741 (=> res!381582 e!340369)))

(declare-fun noDuplicate!255 (List!11801) Bool)

(assert (=> b!595741 (= res!381582 (not (noDuplicate!255 Nil!11798)))))

(declare-fun b!595742 () Bool)

(declare-fun e!340373 () Bool)

(assert (=> b!595742 (= e!340371 e!340373)))

(declare-fun res!381593 () Bool)

(assert (=> b!595742 (=> res!381593 e!340373)))

(assert (=> b!595742 (= res!381593 (or (not (= (select (arr!17760 a!2986) j!136) lt!270526)) (not (= (select (arr!17760 a!2986) j!136) lt!270520)) (bvsge j!136 index!984)))))

(assert (=> b!595742 e!340368))

(declare-fun res!381581 () Bool)

(assert (=> b!595742 (=> (not res!381581) (not e!340368))))

(assert (=> b!595742 (= res!381581 (= lt!270520 (select (arr!17760 a!2986) j!136)))))

(assert (=> b!595742 (= lt!270520 (select (store (arr!17760 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595743 () Bool)

(assert (=> b!595743 (= e!340366 e!340367)))

(declare-fun res!381591 () Bool)

(assert (=> b!595743 (=> (not res!381591) (not e!340367))))

(declare-fun lt!270525 () SeekEntryResult!6200)

(assert (=> b!595743 (= res!381591 (or (= lt!270525 (MissingZero!6200 i!1108)) (= lt!270525 (MissingVacant!6200 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36992 (_ BitVec 32)) SeekEntryResult!6200)

(assert (=> b!595743 (= lt!270525 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595744 () Bool)

(assert (=> b!595744 (= e!340373 e!340369)))

(declare-fun res!381587 () Bool)

(assert (=> b!595744 (=> res!381587 e!340369)))

(assert (=> b!595744 (= res!381587 (or (bvsge (size!18124 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18124 a!2986))))))

(assert (=> b!595744 (arrayContainsKey!0 lt!270527 (select (arr!17760 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270523 () Unit!18718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36992 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18718)

(assert (=> b!595744 (= lt!270523 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270527 (select (arr!17760 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595745 () Bool)

(declare-fun res!381588 () Bool)

(assert (=> b!595745 (=> (not res!381588) (not e!340366))))

(assert (=> b!595745 (= res!381588 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54532 res!381576) b!595726))

(assert (= (and b!595726 res!381589) b!595729))

(assert (= (and b!595729 res!381573) b!595740))

(assert (= (and b!595740 res!381578) b!595745))

(assert (= (and b!595745 res!381588) b!595743))

(assert (= (and b!595743 res!381591) b!595730))

(assert (= (and b!595730 res!381579) b!595725))

(assert (= (and b!595725 res!381584) b!595738))

(assert (= (and b!595738 res!381586) b!595727))

(assert (= (and b!595727 res!381575) b!595732))

(assert (= (and b!595732 res!381592) b!595735))

(assert (= (and b!595735 res!381590) b!595737))

(assert (= (and b!595735 c!67442) b!595723))

(assert (= (and b!595735 (not c!67442)) b!595724))

(assert (= (and b!595735 (not res!381585)) b!595742))

(assert (= (and b!595742 res!381581) b!595731))

(assert (= (and b!595731 (not res!381580)) b!595739))

(assert (= (and b!595739 res!381574) b!595733))

(assert (= (and b!595742 (not res!381593)) b!595744))

(assert (= (and b!595744 (not res!381587)) b!595741))

(assert (= (and b!595741 (not res!381582)) b!595728))

(assert (= (and b!595728 (not res!381577)) b!595736))

(assert (= (and b!595736 (not res!381583)) b!595734))

(declare-fun m!573329 () Bool)

(assert (=> b!595742 m!573329))

(declare-fun m!573331 () Bool)

(assert (=> b!595742 m!573331))

(declare-fun m!573333 () Bool)

(assert (=> b!595742 m!573333))

(declare-fun m!573335 () Bool)

(assert (=> b!595735 m!573335))

(declare-fun m!573337 () Bool)

(assert (=> b!595735 m!573337))

(assert (=> b!595735 m!573329))

(assert (=> b!595735 m!573331))

(declare-fun m!573339 () Bool)

(assert (=> b!595735 m!573339))

(declare-fun m!573341 () Bool)

(assert (=> b!595735 m!573341))

(declare-fun m!573343 () Bool)

(assert (=> b!595735 m!573343))

(assert (=> b!595735 m!573329))

(declare-fun m!573345 () Bool)

(assert (=> b!595735 m!573345))

(assert (=> b!595731 m!573329))

(assert (=> b!595744 m!573329))

(assert (=> b!595744 m!573329))

(declare-fun m!573347 () Bool)

(assert (=> b!595744 m!573347))

(assert (=> b!595744 m!573329))

(declare-fun m!573349 () Bool)

(assert (=> b!595744 m!573349))

(declare-fun m!573351 () Bool)

(assert (=> b!595745 m!573351))

(declare-fun m!573353 () Bool)

(assert (=> b!595736 m!573353))

(declare-fun m!573355 () Bool)

(assert (=> b!595740 m!573355))

(declare-fun m!573357 () Bool)

(assert (=> b!595741 m!573357))

(assert (=> b!595729 m!573329))

(assert (=> b!595729 m!573329))

(declare-fun m!573359 () Bool)

(assert (=> b!595729 m!573359))

(declare-fun m!573361 () Bool)

(assert (=> b!595738 m!573361))

(declare-fun m!573363 () Bool)

(assert (=> start!54532 m!573363))

(declare-fun m!573365 () Bool)

(assert (=> start!54532 m!573365))

(declare-fun m!573367 () Bool)

(assert (=> b!595743 m!573367))

(declare-fun m!573369 () Bool)

(assert (=> b!595728 m!573369))

(assert (=> b!595739 m!573329))

(assert (=> b!595739 m!573329))

(declare-fun m!573371 () Bool)

(assert (=> b!595739 m!573371))

(declare-fun m!573373 () Bool)

(assert (=> b!595725 m!573373))

(assert (=> b!595727 m!573331))

(declare-fun m!573375 () Bool)

(assert (=> b!595727 m!573375))

(declare-fun m!573377 () Bool)

(assert (=> b!595734 m!573377))

(declare-fun m!573379 () Bool)

(assert (=> b!595732 m!573379))

(assert (=> b!595732 m!573329))

(assert (=> b!595732 m!573329))

(declare-fun m!573381 () Bool)

(assert (=> b!595732 m!573381))

(declare-fun m!573383 () Bool)

(assert (=> b!595730 m!573383))

(assert (=> b!595733 m!573329))

(assert (=> b!595733 m!573329))

(declare-fun m!573385 () Bool)

(assert (=> b!595733 m!573385))

(push 1)

