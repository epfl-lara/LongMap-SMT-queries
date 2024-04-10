; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56140 () Bool)

(assert start!56140)

(declare-fun b!620553 () Bool)

(declare-fun res!399884 () Bool)

(declare-fun e!355921 () Bool)

(assert (=> b!620553 (=> (not res!399884) (not e!355921))))

(declare-datatypes ((array!37610 0))(
  ( (array!37611 (arr!18051 (Array (_ BitVec 32) (_ BitVec 64))) (size!18415 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37610)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37610 (_ BitVec 32)) Bool)

(assert (=> b!620553 (= res!399884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!399878 () Bool)

(declare-fun e!355925 () Bool)

(assert (=> start!56140 (=> (not res!399878) (not e!355925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56140 (= res!399878 (validMask!0 mask!3053))))

(assert (=> start!56140 e!355925))

(assert (=> start!56140 true))

(declare-fun array_inv!13847 (array!37610) Bool)

(assert (=> start!56140 (array_inv!13847 a!2986)))

(declare-fun b!620554 () Bool)

(declare-fun res!399886 () Bool)

(assert (=> b!620554 (=> (not res!399886) (not e!355921))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620554 (= res!399886 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18051 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620555 () Bool)

(declare-fun res!399882 () Bool)

(assert (=> b!620555 (=> (not res!399882) (not e!355925))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620555 (= res!399882 (validKeyInArray!0 (select (arr!18051 a!2986) j!136)))))

(declare-fun b!620556 () Bool)

(declare-fun e!355926 () Bool)

(assert (=> b!620556 (= e!355921 e!355926)))

(declare-fun res!399888 () Bool)

(assert (=> b!620556 (=> (not res!399888) (not e!355926))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!620556 (= res!399888 (= (select (store (arr!18051 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286827 () array!37610)

(assert (=> b!620556 (= lt!286827 (array!37611 (store (arr!18051 a!2986) i!1108 k!1786) (size!18415 a!2986)))))

(declare-fun b!620557 () Bool)

(declare-fun res!399890 () Bool)

(assert (=> b!620557 (=> (not res!399890) (not e!355925))))

(assert (=> b!620557 (= res!399890 (and (= (size!18415 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18415 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18415 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620558 () Bool)

(declare-fun res!399880 () Bool)

(assert (=> b!620558 (=> (not res!399880) (not e!355921))))

(declare-datatypes ((List!12092 0))(
  ( (Nil!12089) (Cons!12088 (h!13133 (_ BitVec 64)) (t!18320 List!12092)) )
))
(declare-fun arrayNoDuplicates!0 (array!37610 (_ BitVec 32) List!12092) Bool)

(assert (=> b!620558 (= res!399880 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12089))))

(declare-fun b!620559 () Bool)

(declare-datatypes ((Unit!20638 0))(
  ( (Unit!20639) )
))
(declare-fun e!355924 () Unit!20638)

(declare-fun Unit!20640 () Unit!20638)

(assert (=> b!620559 (= e!355924 Unit!20640)))

(declare-fun b!620560 () Bool)

(declare-fun res!399883 () Bool)

(assert (=> b!620560 (= res!399883 (bvsge j!136 index!984))))

(declare-fun e!355916 () Bool)

(assert (=> b!620560 (=> res!399883 e!355916)))

(declare-fun e!355922 () Bool)

(assert (=> b!620560 (= e!355922 e!355916)))

(declare-fun b!620561 () Bool)

(declare-fun e!355913 () Bool)

(assert (=> b!620561 (= e!355913 (not true))))

(declare-fun lt!286823 () Unit!20638)

(declare-fun e!355915 () Unit!20638)

(assert (=> b!620561 (= lt!286823 e!355915)))

(declare-fun c!70706 () Bool)

(declare-datatypes ((SeekEntryResult!6491 0))(
  ( (MissingZero!6491 (index!28248 (_ BitVec 32))) (Found!6491 (index!28249 (_ BitVec 32))) (Intermediate!6491 (undefined!7303 Bool) (index!28250 (_ BitVec 32)) (x!57027 (_ BitVec 32))) (Undefined!6491) (MissingVacant!6491 (index!28251 (_ BitVec 32))) )
))
(declare-fun lt!286822 () SeekEntryResult!6491)

(assert (=> b!620561 (= c!70706 (= lt!286822 (Found!6491 index!984)))))

(declare-fun lt!286834 () Unit!20638)

(declare-fun e!355917 () Unit!20638)

(assert (=> b!620561 (= lt!286834 e!355917)))

(declare-fun c!70709 () Bool)

(assert (=> b!620561 (= c!70709 (= lt!286822 Undefined!6491))))

(declare-fun lt!286837 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37610 (_ BitVec 32)) SeekEntryResult!6491)

(assert (=> b!620561 (= lt!286822 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286837 lt!286827 mask!3053))))

(declare-fun e!355923 () Bool)

(assert (=> b!620561 e!355923))

(declare-fun res!399879 () Bool)

(assert (=> b!620561 (=> (not res!399879) (not e!355923))))

(declare-fun lt!286836 () SeekEntryResult!6491)

(declare-fun lt!286831 () (_ BitVec 32))

(assert (=> b!620561 (= res!399879 (= lt!286836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286831 vacantSpotIndex!68 lt!286837 lt!286827 mask!3053)))))

(assert (=> b!620561 (= lt!286836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286831 vacantSpotIndex!68 (select (arr!18051 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620561 (= lt!286837 (select (store (arr!18051 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286821 () Unit!20638)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37610 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20638)

(assert (=> b!620561 (= lt!286821 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286831 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620561 (= lt!286831 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!355919 () Bool)

(declare-fun b!620562 () Bool)

(declare-fun arrayContainsKey!0 (array!37610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620562 (= e!355919 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) index!984))))

(declare-fun b!620563 () Bool)

(assert (=> b!620563 (= e!355926 e!355913)))

(declare-fun res!399877 () Bool)

(assert (=> b!620563 (=> (not res!399877) (not e!355913))))

(declare-fun lt!286825 () SeekEntryResult!6491)

(assert (=> b!620563 (= res!399877 (and (= lt!286825 (Found!6491 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18051 a!2986) index!984) (select (arr!18051 a!2986) j!136))) (not (= (select (arr!18051 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620563 (= lt!286825 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18051 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620564 () Bool)

(declare-fun res!399876 () Bool)

(assert (=> b!620564 (= res!399876 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) j!136))))

(assert (=> b!620564 (=> (not res!399876) (not e!355919))))

(assert (=> b!620564 (= e!355916 e!355919)))

(declare-fun e!355920 () Bool)

(declare-fun b!620565 () Bool)

(assert (=> b!620565 (= e!355920 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) index!984))))

(declare-fun b!620566 () Bool)

(declare-fun Unit!20641 () Unit!20638)

(assert (=> b!620566 (= e!355917 Unit!20641)))

(declare-fun b!620567 () Bool)

(declare-fun Unit!20642 () Unit!20638)

(assert (=> b!620567 (= e!355917 Unit!20642)))

(assert (=> b!620567 false))

(declare-fun b!620568 () Bool)

(declare-fun Unit!20643 () Unit!20638)

(assert (=> b!620568 (= e!355915 Unit!20643)))

(declare-fun b!620569 () Bool)

(assert (=> b!620569 false))

(declare-fun lt!286818 () Unit!20638)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37610 (_ BitVec 64) (_ BitVec 32) List!12092) Unit!20638)

(assert (=> b!620569 (= lt!286818 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286827 (select (arr!18051 a!2986) j!136) index!984 Nil!12089))))

(assert (=> b!620569 (arrayNoDuplicates!0 lt!286827 index!984 Nil!12089)))

(declare-fun lt!286820 () Unit!20638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37610 (_ BitVec 32) (_ BitVec 32)) Unit!20638)

(assert (=> b!620569 (= lt!286820 (lemmaNoDuplicateFromThenFromBigger!0 lt!286827 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620569 (arrayNoDuplicates!0 lt!286827 #b00000000000000000000000000000000 Nil!12089)))

(declare-fun lt!286833 () Unit!20638)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12092) Unit!20638)

(assert (=> b!620569 (= lt!286833 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12089))))

(assert (=> b!620569 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286819 () Unit!20638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20638)

(assert (=> b!620569 (= lt!286819 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286827 (select (arr!18051 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620569 e!355920))

(declare-fun res!399885 () Bool)

(assert (=> b!620569 (=> (not res!399885) (not e!355920))))

(assert (=> b!620569 (= res!399885 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) j!136))))

(declare-fun Unit!20644 () Unit!20638)

(assert (=> b!620569 (= e!355924 Unit!20644)))

(declare-fun b!620570 () Bool)

(declare-fun e!355914 () Unit!20638)

(declare-fun Unit!20645 () Unit!20638)

(assert (=> b!620570 (= e!355914 Unit!20645)))

(declare-fun b!620571 () Bool)

(assert (=> b!620571 (= e!355925 e!355921)))

(declare-fun res!399889 () Bool)

(assert (=> b!620571 (=> (not res!399889) (not e!355921))))

(declare-fun lt!286832 () SeekEntryResult!6491)

(assert (=> b!620571 (= res!399889 (or (= lt!286832 (MissingZero!6491 i!1108)) (= lt!286832 (MissingVacant!6491 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37610 (_ BitVec 32)) SeekEntryResult!6491)

(assert (=> b!620571 (= lt!286832 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620572 () Bool)

(assert (=> b!620572 (= e!355923 (= lt!286825 lt!286836))))

(declare-fun b!620573 () Bool)

(declare-fun res!399887 () Bool)

(assert (=> b!620573 (=> (not res!399887) (not e!355925))))

(assert (=> b!620573 (= res!399887 (validKeyInArray!0 k!1786))))

(declare-fun b!620574 () Bool)

(declare-fun Unit!20646 () Unit!20638)

(assert (=> b!620574 (= e!355915 Unit!20646)))

(declare-fun res!399875 () Bool)

(assert (=> b!620574 (= res!399875 (= (select (store (arr!18051 a!2986) i!1108 k!1786) index!984) (select (arr!18051 a!2986) j!136)))))

(assert (=> b!620574 (=> (not res!399875) (not e!355922))))

(assert (=> b!620574 e!355922))

(declare-fun c!70708 () Bool)

(assert (=> b!620574 (= c!70708 (bvslt j!136 index!984))))

(declare-fun lt!286830 () Unit!20638)

(assert (=> b!620574 (= lt!286830 e!355914)))

(declare-fun c!70707 () Bool)

(assert (=> b!620574 (= c!70707 (bvslt index!984 j!136))))

(declare-fun lt!286826 () Unit!20638)

(assert (=> b!620574 (= lt!286826 e!355924)))

(assert (=> b!620574 false))

(declare-fun b!620575 () Bool)

(assert (=> b!620575 false))

(declare-fun lt!286835 () Unit!20638)

(assert (=> b!620575 (= lt!286835 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286827 (select (arr!18051 a!2986) j!136) j!136 Nil!12089))))

(assert (=> b!620575 (arrayNoDuplicates!0 lt!286827 j!136 Nil!12089)))

(declare-fun lt!286829 () Unit!20638)

(assert (=> b!620575 (= lt!286829 (lemmaNoDuplicateFromThenFromBigger!0 lt!286827 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620575 (arrayNoDuplicates!0 lt!286827 #b00000000000000000000000000000000 Nil!12089)))

(declare-fun lt!286824 () Unit!20638)

(assert (=> b!620575 (= lt!286824 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12089))))

(assert (=> b!620575 (arrayContainsKey!0 lt!286827 (select (arr!18051 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286828 () Unit!20638)

(assert (=> b!620575 (= lt!286828 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286827 (select (arr!18051 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20647 () Unit!20638)

(assert (=> b!620575 (= e!355914 Unit!20647)))

(declare-fun b!620576 () Bool)

(declare-fun res!399881 () Bool)

(assert (=> b!620576 (=> (not res!399881) (not e!355925))))

(assert (=> b!620576 (= res!399881 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56140 res!399878) b!620557))

(assert (= (and b!620557 res!399890) b!620555))

(assert (= (and b!620555 res!399882) b!620573))

(assert (= (and b!620573 res!399887) b!620576))

(assert (= (and b!620576 res!399881) b!620571))

(assert (= (and b!620571 res!399889) b!620553))

(assert (= (and b!620553 res!399884) b!620558))

(assert (= (and b!620558 res!399880) b!620554))

(assert (= (and b!620554 res!399886) b!620556))

(assert (= (and b!620556 res!399888) b!620563))

(assert (= (and b!620563 res!399877) b!620561))

(assert (= (and b!620561 res!399879) b!620572))

(assert (= (and b!620561 c!70709) b!620567))

(assert (= (and b!620561 (not c!70709)) b!620566))

(assert (= (and b!620561 c!70706) b!620574))

(assert (= (and b!620561 (not c!70706)) b!620568))

(assert (= (and b!620574 res!399875) b!620560))

(assert (= (and b!620560 (not res!399883)) b!620564))

(assert (= (and b!620564 res!399876) b!620562))

(assert (= (and b!620574 c!70708) b!620575))

(assert (= (and b!620574 (not c!70708)) b!620570))

(assert (= (and b!620574 c!70707) b!620569))

(assert (= (and b!620574 (not c!70707)) b!620559))

(assert (= (and b!620569 res!399885) b!620565))

(declare-fun m!596471 () Bool)

(assert (=> b!620575 m!596471))

(declare-fun m!596473 () Bool)

(assert (=> b!620575 m!596473))

(declare-fun m!596475 () Bool)

(assert (=> b!620575 m!596475))

(assert (=> b!620575 m!596471))

(declare-fun m!596477 () Bool)

(assert (=> b!620575 m!596477))

(declare-fun m!596479 () Bool)

(assert (=> b!620575 m!596479))

(declare-fun m!596481 () Bool)

(assert (=> b!620575 m!596481))

(assert (=> b!620575 m!596471))

(declare-fun m!596483 () Bool)

(assert (=> b!620575 m!596483))

(assert (=> b!620575 m!596471))

(declare-fun m!596485 () Bool)

(assert (=> b!620575 m!596485))

(declare-fun m!596487 () Bool)

(assert (=> b!620556 m!596487))

(declare-fun m!596489 () Bool)

(assert (=> b!620556 m!596489))

(assert (=> b!620562 m!596471))

(assert (=> b!620562 m!596471))

(declare-fun m!596491 () Bool)

(assert (=> b!620562 m!596491))

(declare-fun m!596493 () Bool)

(assert (=> b!620558 m!596493))

(assert (=> b!620574 m!596487))

(declare-fun m!596495 () Bool)

(assert (=> b!620574 m!596495))

(assert (=> b!620574 m!596471))

(assert (=> b!620564 m!596471))

(assert (=> b!620564 m!596471))

(declare-fun m!596497 () Bool)

(assert (=> b!620564 m!596497))

(declare-fun m!596499 () Bool)

(assert (=> b!620571 m!596499))

(declare-fun m!596501 () Bool)

(assert (=> start!56140 m!596501))

(declare-fun m!596503 () Bool)

(assert (=> start!56140 m!596503))

(assert (=> b!620569 m!596471))

(declare-fun m!596505 () Bool)

(assert (=> b!620569 m!596505))

(assert (=> b!620569 m!596471))

(declare-fun m!596507 () Bool)

(assert (=> b!620569 m!596507))

(assert (=> b!620569 m!596471))

(assert (=> b!620569 m!596497))

(assert (=> b!620569 m!596471))

(assert (=> b!620569 m!596485))

(declare-fun m!596509 () Bool)

(assert (=> b!620569 m!596509))

(declare-fun m!596511 () Bool)

(assert (=> b!620569 m!596511))

(assert (=> b!620569 m!596479))

(assert (=> b!620569 m!596471))

(declare-fun m!596513 () Bool)

(assert (=> b!620569 m!596513))

(assert (=> b!620555 m!596471))

(assert (=> b!620555 m!596471))

(declare-fun m!596515 () Bool)

(assert (=> b!620555 m!596515))

(declare-fun m!596517 () Bool)

(assert (=> b!620561 m!596517))

(declare-fun m!596519 () Bool)

(assert (=> b!620561 m!596519))

(declare-fun m!596521 () Bool)

(assert (=> b!620561 m!596521))

(assert (=> b!620561 m!596471))

(declare-fun m!596523 () Bool)

(assert (=> b!620561 m!596523))

(declare-fun m!596525 () Bool)

(assert (=> b!620561 m!596525))

(assert (=> b!620561 m!596471))

(declare-fun m!596527 () Bool)

(assert (=> b!620561 m!596527))

(assert (=> b!620561 m!596487))

(declare-fun m!596529 () Bool)

(assert (=> b!620573 m!596529))

(declare-fun m!596531 () Bool)

(assert (=> b!620563 m!596531))

(assert (=> b!620563 m!596471))

(assert (=> b!620563 m!596471))

(declare-fun m!596533 () Bool)

(assert (=> b!620563 m!596533))

(declare-fun m!596535 () Bool)

(assert (=> b!620553 m!596535))

(declare-fun m!596537 () Bool)

(assert (=> b!620554 m!596537))

(declare-fun m!596539 () Bool)

(assert (=> b!620576 m!596539))

(assert (=> b!620565 m!596471))

(assert (=> b!620565 m!596471))

(assert (=> b!620565 m!596491))

(push 1)

