; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57690 () Bool)

(assert start!57690)

(declare-fun b!637535 () Bool)

(declare-fun res!412444 () Bool)

(declare-fun e!364802 () Bool)

(assert (=> b!637535 (=> (not res!412444) (not e!364802))))

(declare-datatypes ((array!38261 0))(
  ( (array!38262 (arr!18353 (Array (_ BitVec 32) (_ BitVec 64))) (size!18717 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38261)

(declare-datatypes ((List!12394 0))(
  ( (Nil!12391) (Cons!12390 (h!13435 (_ BitVec 64)) (t!18622 List!12394)) )
))
(declare-fun arrayNoDuplicates!0 (array!38261 (_ BitVec 32) List!12394) Bool)

(assert (=> b!637535 (= res!412444 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12391))))

(declare-fun b!637536 () Bool)

(declare-datatypes ((Unit!21506 0))(
  ( (Unit!21507) )
))
(declare-fun e!364807 () Unit!21506)

(declare-fun Unit!21508 () Unit!21506)

(assert (=> b!637536 (= e!364807 Unit!21508)))

(assert (=> b!637536 false))

(declare-fun b!637537 () Bool)

(declare-fun e!364804 () Bool)

(declare-datatypes ((SeekEntryResult!6793 0))(
  ( (MissingZero!6793 (index!29486 (_ BitVec 32))) (Found!6793 (index!29487 (_ BitVec 32))) (Intermediate!6793 (undefined!7605 Bool) (index!29488 (_ BitVec 32)) (x!58243 (_ BitVec 32))) (Undefined!6793) (MissingVacant!6793 (index!29489 (_ BitVec 32))) )
))
(declare-fun lt!294775 () SeekEntryResult!6793)

(declare-fun lt!294781 () SeekEntryResult!6793)

(assert (=> b!637537 (= e!364804 (= lt!294775 lt!294781))))

(declare-fun b!637538 () Bool)

(declare-fun e!364800 () Bool)

(declare-fun e!364811 () Bool)

(assert (=> b!637538 (= e!364800 (not e!364811))))

(declare-fun res!412451 () Bool)

(assert (=> b!637538 (=> res!412451 e!364811)))

(declare-fun lt!294776 () SeekEntryResult!6793)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637538 (= res!412451 (not (= lt!294776 (Found!6793 index!984))))))

(declare-fun lt!294777 () Unit!21506)

(assert (=> b!637538 (= lt!294777 e!364807)))

(declare-fun c!72917 () Bool)

(assert (=> b!637538 (= c!72917 (= lt!294776 Undefined!6793))))

(declare-fun lt!294774 () array!38261)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!294783 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38261 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!637538 (= lt!294776 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294783 lt!294774 mask!3053))))

(assert (=> b!637538 e!364804))

(declare-fun res!412452 () Bool)

(assert (=> b!637538 (=> (not res!412452) (not e!364804))))

(declare-fun lt!294782 () (_ BitVec 32))

(assert (=> b!637538 (= res!412452 (= lt!294781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294782 vacantSpotIndex!68 lt!294783 lt!294774 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!637538 (= lt!294781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294782 vacantSpotIndex!68 (select (arr!18353 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!637538 (= lt!294783 (select (store (arr!18353 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294784 () Unit!21506)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21506)

(assert (=> b!637538 (= lt!294784 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294782 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637538 (= lt!294782 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637539 () Bool)

(declare-fun res!412445 () Bool)

(declare-fun e!364812 () Bool)

(assert (=> b!637539 (=> res!412445 e!364812)))

(declare-fun noDuplicate!386 (List!12394) Bool)

(assert (=> b!637539 (= res!412445 (not (noDuplicate!386 Nil!12391)))))

(declare-fun b!637540 () Bool)

(assert (=> b!637540 (= e!364812 true)))

(declare-fun lt!294779 () Bool)

(declare-fun contains!3108 (List!12394 (_ BitVec 64)) Bool)

(assert (=> b!637540 (= lt!294779 (contains!3108 Nil!12391 k!1786))))

(declare-fun b!637541 () Bool)

(declare-fun res!412454 () Bool)

(declare-fun e!364801 () Bool)

(assert (=> b!637541 (=> (not res!412454) (not e!364801))))

(assert (=> b!637541 (= res!412454 (and (= (size!18717 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18717 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18717 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637542 () Bool)

(declare-fun e!364806 () Bool)

(assert (=> b!637542 (= e!364806 e!364800)))

(declare-fun res!412449 () Bool)

(assert (=> b!637542 (=> (not res!412449) (not e!364800))))

(assert (=> b!637542 (= res!412449 (and (= lt!294775 (Found!6793 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18353 a!2986) index!984) (select (arr!18353 a!2986) j!136))) (not (= (select (arr!18353 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637542 (= lt!294775 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18353 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637543 () Bool)

(declare-fun e!364810 () Bool)

(declare-fun e!364808 () Bool)

(assert (=> b!637543 (= e!364810 e!364808)))

(declare-fun res!412435 () Bool)

(assert (=> b!637543 (=> (not res!412435) (not e!364808))))

(declare-fun arrayContainsKey!0 (array!38261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637543 (= res!412435 (arrayContainsKey!0 lt!294774 (select (arr!18353 a!2986) j!136) j!136))))

(declare-fun b!637544 () Bool)

(declare-fun res!412441 () Bool)

(assert (=> b!637544 (=> (not res!412441) (not e!364802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38261 (_ BitVec 32)) Bool)

(assert (=> b!637544 (= res!412441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637545 () Bool)

(assert (=> b!637545 (= e!364802 e!364806)))

(declare-fun res!412446 () Bool)

(assert (=> b!637545 (=> (not res!412446) (not e!364806))))

(assert (=> b!637545 (= res!412446 (= (select (store (arr!18353 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637545 (= lt!294774 (array!38262 (store (arr!18353 a!2986) i!1108 k!1786) (size!18717 a!2986)))))

(declare-fun b!637534 () Bool)

(assert (=> b!637534 (= e!364808 (arrayContainsKey!0 lt!294774 (select (arr!18353 a!2986) j!136) index!984))))

(declare-fun res!412447 () Bool)

(assert (=> start!57690 (=> (not res!412447) (not e!364801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57690 (= res!412447 (validMask!0 mask!3053))))

(assert (=> start!57690 e!364801))

(assert (=> start!57690 true))

(declare-fun array_inv!14149 (array!38261) Bool)

(assert (=> start!57690 (array_inv!14149 a!2986)))

(declare-fun b!637546 () Bool)

(declare-fun res!412440 () Bool)

(assert (=> b!637546 (=> (not res!412440) (not e!364801))))

(assert (=> b!637546 (= res!412440 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637547 () Bool)

(declare-fun e!364803 () Bool)

(assert (=> b!637547 (= e!364803 e!364810)))

(declare-fun res!412438 () Bool)

(assert (=> b!637547 (=> res!412438 e!364810)))

(declare-fun lt!294778 () (_ BitVec 64))

(assert (=> b!637547 (= res!412438 (or (not (= (select (arr!18353 a!2986) j!136) lt!294783)) (not (= (select (arr!18353 a!2986) j!136) lt!294778)) (bvsge j!136 index!984)))))

(declare-fun b!637548 () Bool)

(declare-fun res!412436 () Bool)

(assert (=> b!637548 (=> (not res!412436) (not e!364801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637548 (= res!412436 (validKeyInArray!0 (select (arr!18353 a!2986) j!136)))))

(declare-fun b!637549 () Bool)

(declare-fun e!364805 () Bool)

(assert (=> b!637549 (= e!364811 e!364805)))

(declare-fun res!412450 () Bool)

(assert (=> b!637549 (=> res!412450 e!364805)))

(assert (=> b!637549 (= res!412450 (or (not (= (select (arr!18353 a!2986) j!136) lt!294783)) (not (= (select (arr!18353 a!2986) j!136) lt!294778)) (bvsge j!136 index!984)))))

(assert (=> b!637549 e!364803))

(declare-fun res!412439 () Bool)

(assert (=> b!637549 (=> (not res!412439) (not e!364803))))

(assert (=> b!637549 (= res!412439 (= lt!294778 (select (arr!18353 a!2986) j!136)))))

(assert (=> b!637549 (= lt!294778 (select (store (arr!18353 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637550 () Bool)

(assert (=> b!637550 (= e!364801 e!364802)))

(declare-fun res!412434 () Bool)

(assert (=> b!637550 (=> (not res!412434) (not e!364802))))

(declare-fun lt!294773 () SeekEntryResult!6793)

(assert (=> b!637550 (= res!412434 (or (= lt!294773 (MissingZero!6793 i!1108)) (= lt!294773 (MissingVacant!6793 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38261 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!637550 (= lt!294773 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637551 () Bool)

(declare-fun res!412442 () Bool)

(assert (=> b!637551 (=> (not res!412442) (not e!364802))))

(assert (=> b!637551 (= res!412442 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18353 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637552 () Bool)

(declare-fun res!412443 () Bool)

(assert (=> b!637552 (=> (not res!412443) (not e!364801))))

(assert (=> b!637552 (= res!412443 (validKeyInArray!0 k!1786))))

(declare-fun b!637553 () Bool)

(declare-fun res!412453 () Bool)

(assert (=> b!637553 (=> res!412453 e!364812)))

(assert (=> b!637553 (= res!412453 (contains!3108 Nil!12391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637554 () Bool)

(declare-fun Unit!21509 () Unit!21506)

(assert (=> b!637554 (= e!364807 Unit!21509)))

(declare-fun b!637555 () Bool)

(declare-fun res!412448 () Bool)

(assert (=> b!637555 (=> res!412448 e!364812)))

(assert (=> b!637555 (= res!412448 (contains!3108 Nil!12391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637556 () Bool)

(assert (=> b!637556 (= e!364805 e!364812)))

(declare-fun res!412437 () Bool)

(assert (=> b!637556 (=> res!412437 e!364812)))

(assert (=> b!637556 (= res!412437 (or (bvsge (size!18717 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18717 a!2986))))))

(assert (=> b!637556 (arrayContainsKey!0 lt!294774 (select (arr!18353 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294780 () Unit!21506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38261 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21506)

(assert (=> b!637556 (= lt!294780 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294774 (select (arr!18353 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57690 res!412447) b!637541))

(assert (= (and b!637541 res!412454) b!637548))

(assert (= (and b!637548 res!412436) b!637552))

(assert (= (and b!637552 res!412443) b!637546))

(assert (= (and b!637546 res!412440) b!637550))

(assert (= (and b!637550 res!412434) b!637544))

(assert (= (and b!637544 res!412441) b!637535))

(assert (= (and b!637535 res!412444) b!637551))

(assert (= (and b!637551 res!412442) b!637545))

(assert (= (and b!637545 res!412446) b!637542))

(assert (= (and b!637542 res!412449) b!637538))

(assert (= (and b!637538 res!412452) b!637537))

(assert (= (and b!637538 c!72917) b!637536))

(assert (= (and b!637538 (not c!72917)) b!637554))

(assert (= (and b!637538 (not res!412451)) b!637549))

(assert (= (and b!637549 res!412439) b!637547))

(assert (= (and b!637547 (not res!412438)) b!637543))

(assert (= (and b!637543 res!412435) b!637534))

(assert (= (and b!637549 (not res!412450)) b!637556))

(assert (= (and b!637556 (not res!412437)) b!637539))

(assert (= (and b!637539 (not res!412445)) b!637555))

(assert (= (and b!637555 (not res!412448)) b!637553))

(assert (= (and b!637553 (not res!412453)) b!637540))

(declare-fun m!611599 () Bool)

(assert (=> b!637534 m!611599))

(assert (=> b!637534 m!611599))

(declare-fun m!611601 () Bool)

(assert (=> b!637534 m!611601))

(declare-fun m!611603 () Bool)

(assert (=> b!637550 m!611603))

(declare-fun m!611605 () Bool)

(assert (=> b!637553 m!611605))

(declare-fun m!611607 () Bool)

(assert (=> b!637535 m!611607))

(declare-fun m!611609 () Bool)

(assert (=> b!637552 m!611609))

(declare-fun m!611611 () Bool)

(assert (=> b!637540 m!611611))

(assert (=> b!637556 m!611599))

(assert (=> b!637556 m!611599))

(declare-fun m!611613 () Bool)

(assert (=> b!637556 m!611613))

(assert (=> b!637556 m!611599))

(declare-fun m!611615 () Bool)

(assert (=> b!637556 m!611615))

(assert (=> b!637548 m!611599))

(assert (=> b!637548 m!611599))

(declare-fun m!611617 () Bool)

(assert (=> b!637548 m!611617))

(declare-fun m!611619 () Bool)

(assert (=> b!637542 m!611619))

(assert (=> b!637542 m!611599))

(assert (=> b!637542 m!611599))

(declare-fun m!611621 () Bool)

(assert (=> b!637542 m!611621))

(declare-fun m!611623 () Bool)

(assert (=> b!637551 m!611623))

(assert (=> b!637547 m!611599))

(assert (=> b!637549 m!611599))

(declare-fun m!611625 () Bool)

(assert (=> b!637549 m!611625))

(declare-fun m!611627 () Bool)

(assert (=> b!637549 m!611627))

(declare-fun m!611629 () Bool)

(assert (=> b!637538 m!611629))

(declare-fun m!611631 () Bool)

(assert (=> b!637538 m!611631))

(assert (=> b!637538 m!611599))

(declare-fun m!611633 () Bool)

(assert (=> b!637538 m!611633))

(assert (=> b!637538 m!611599))

(declare-fun m!611635 () Bool)

(assert (=> b!637538 m!611635))

(declare-fun m!611637 () Bool)

(assert (=> b!637538 m!611637))

(assert (=> b!637538 m!611625))

(declare-fun m!611639 () Bool)

(assert (=> b!637538 m!611639))

(declare-fun m!611641 () Bool)

(assert (=> b!637539 m!611641))

(declare-fun m!611643 () Bool)

(assert (=> b!637546 m!611643))

(declare-fun m!611645 () Bool)

(assert (=> b!637544 m!611645))

(declare-fun m!611647 () Bool)

(assert (=> b!637555 m!611647))

(declare-fun m!611649 () Bool)

(assert (=> start!57690 m!611649))

(declare-fun m!611651 () Bool)

(assert (=> start!57690 m!611651))

(assert (=> b!637545 m!611625))

(declare-fun m!611653 () Bool)

(assert (=> b!637545 m!611653))

(assert (=> b!637543 m!611599))

(assert (=> b!637543 m!611599))

(declare-fun m!611655 () Bool)

(assert (=> b!637543 m!611655))

(push 1)

