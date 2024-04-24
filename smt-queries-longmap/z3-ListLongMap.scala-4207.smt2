; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57744 () Bool)

(assert start!57744)

(declare-fun b!637620 () Bool)

(declare-fun e!364868 () Bool)

(declare-fun e!364865 () Bool)

(assert (=> b!637620 (= e!364868 e!364865)))

(declare-fun res!412441 () Bool)

(assert (=> b!637620 (=> res!412441 e!364865)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294810 () (_ BitVec 64))

(declare-fun lt!294814 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38253 0))(
  ( (array!38254 (arr!18346 (Array (_ BitVec 32) (_ BitVec 64))) (size!18710 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38253)

(assert (=> b!637620 (= res!412441 (or (not (= (select (arr!18346 a!2986) j!136) lt!294810)) (not (= (select (arr!18346 a!2986) j!136) lt!294814)) (bvsge j!136 index!984)))))

(declare-fun lt!294804 () array!38253)

(declare-fun b!637621 () Bool)

(declare-fun e!364873 () Bool)

(declare-fun arrayContainsKey!0 (array!38253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637621 (= e!364873 (arrayContainsKey!0 lt!294804 (select (arr!18346 a!2986) j!136) index!984))))

(declare-fun b!637622 () Bool)

(declare-fun res!412433 () Bool)

(declare-fun e!364870 () Bool)

(assert (=> b!637622 (=> (not res!412433) (not e!364870))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38253 (_ BitVec 32)) Bool)

(assert (=> b!637622 (= res!412433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637623 () Bool)

(declare-fun res!412436 () Bool)

(assert (=> b!637623 (=> (not res!412436) (not e!364870))))

(declare-datatypes ((List!12294 0))(
  ( (Nil!12291) (Cons!12290 (h!13338 (_ BitVec 64)) (t!18514 List!12294)) )
))
(declare-fun arrayNoDuplicates!0 (array!38253 (_ BitVec 32) List!12294) Bool)

(assert (=> b!637623 (= res!412436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12291))))

(declare-fun b!637624 () Bool)

(declare-datatypes ((Unit!21477 0))(
  ( (Unit!21478) )
))
(declare-fun e!364872 () Unit!21477)

(declare-fun Unit!21479 () Unit!21477)

(assert (=> b!637624 (= e!364872 Unit!21479)))

(assert (=> b!637624 false))

(declare-fun b!637625 () Bool)

(declare-fun res!412425 () Bool)

(declare-fun e!364871 () Bool)

(assert (=> b!637625 (=> (not res!412425) (not e!364871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637625 (= res!412425 (validKeyInArray!0 (select (arr!18346 a!2986) j!136)))))

(declare-fun b!637626 () Bool)

(declare-fun res!412422 () Bool)

(declare-fun e!364864 () Bool)

(assert (=> b!637626 (=> res!412422 e!364864)))

(declare-fun noDuplicate!388 (List!12294) Bool)

(assert (=> b!637626 (= res!412422 (not (noDuplicate!388 Nil!12291)))))

(declare-fun b!637627 () Bool)

(declare-fun e!364869 () Bool)

(assert (=> b!637627 (= e!364869 e!364864)))

(declare-fun res!412434 () Bool)

(assert (=> b!637627 (=> res!412434 e!364864)))

(assert (=> b!637627 (= res!412434 (or (bvsge (size!18710 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18710 a!2986))))))

(assert (=> b!637627 (arrayContainsKey!0 lt!294804 (select (arr!18346 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294807 () Unit!21477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38253 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21477)

(assert (=> b!637627 (= lt!294807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294804 (select (arr!18346 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637629 () Bool)

(assert (=> b!637629 (= e!364871 e!364870)))

(declare-fun res!412435 () Bool)

(assert (=> b!637629 (=> (not res!412435) (not e!364870))))

(declare-datatypes ((SeekEntryResult!6742 0))(
  ( (MissingZero!6742 (index!29282 (_ BitVec 32))) (Found!6742 (index!29283 (_ BitVec 32))) (Intermediate!6742 (undefined!7554 Bool) (index!29284 (_ BitVec 32)) (x!58195 (_ BitVec 32))) (Undefined!6742) (MissingVacant!6742 (index!29285 (_ BitVec 32))) )
))
(declare-fun lt!294812 () SeekEntryResult!6742)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637629 (= res!412435 (or (= lt!294812 (MissingZero!6742 i!1108)) (= lt!294812 (MissingVacant!6742 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38253 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!637629 (= lt!294812 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637630 () Bool)

(declare-fun e!364874 () Bool)

(assert (=> b!637630 (= e!364870 e!364874)))

(declare-fun res!412437 () Bool)

(assert (=> b!637630 (=> (not res!412437) (not e!364874))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!637630 (= res!412437 (= (select (store (arr!18346 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637630 (= lt!294804 (array!38254 (store (arr!18346 a!2986) i!1108 k0!1786) (size!18710 a!2986)))))

(declare-fun b!637631 () Bool)

(declare-fun res!412432 () Bool)

(assert (=> b!637631 (=> (not res!412432) (not e!364871))))

(assert (=> b!637631 (= res!412432 (and (= (size!18710 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18710 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18710 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637632 () Bool)

(declare-fun res!412426 () Bool)

(assert (=> b!637632 (=> (not res!412426) (not e!364870))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!637632 (= res!412426 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18346 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637633 () Bool)

(declare-fun e!364866 () Bool)

(declare-fun lt!294808 () SeekEntryResult!6742)

(declare-fun lt!294803 () SeekEntryResult!6742)

(assert (=> b!637633 (= e!364866 (= lt!294808 lt!294803))))

(declare-fun b!637634 () Bool)

(assert (=> b!637634 (= e!364864 true)))

(declare-fun lt!294805 () Bool)

(declare-fun contains!3086 (List!12294 (_ BitVec 64)) Bool)

(assert (=> b!637634 (= lt!294805 (contains!3086 Nil!12291 k0!1786))))

(declare-fun b!637635 () Bool)

(assert (=> b!637635 (= e!364865 e!364873)))

(declare-fun res!412427 () Bool)

(assert (=> b!637635 (=> (not res!412427) (not e!364873))))

(assert (=> b!637635 (= res!412427 (arrayContainsKey!0 lt!294804 (select (arr!18346 a!2986) j!136) j!136))))

(declare-fun b!637636 () Bool)

(declare-fun res!412439 () Bool)

(assert (=> b!637636 (=> (not res!412439) (not e!364871))))

(assert (=> b!637636 (= res!412439 (validKeyInArray!0 k0!1786))))

(declare-fun b!637637 () Bool)

(declare-fun res!412423 () Bool)

(assert (=> b!637637 (=> (not res!412423) (not e!364871))))

(assert (=> b!637637 (= res!412423 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637638 () Bool)

(declare-fun Unit!21480 () Unit!21477)

(assert (=> b!637638 (= e!364872 Unit!21480)))

(declare-fun b!637639 () Bool)

(declare-fun e!364867 () Bool)

(assert (=> b!637639 (= e!364874 e!364867)))

(declare-fun res!412431 () Bool)

(assert (=> b!637639 (=> (not res!412431) (not e!364867))))

(assert (=> b!637639 (= res!412431 (and (= lt!294808 (Found!6742 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18346 a!2986) index!984) (select (arr!18346 a!2986) j!136))) (not (= (select (arr!18346 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38253 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!637639 (= lt!294808 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637640 () Bool)

(declare-fun e!364863 () Bool)

(assert (=> b!637640 (= e!364867 (not e!364863))))

(declare-fun res!412424 () Bool)

(assert (=> b!637640 (=> res!412424 e!364863)))

(declare-fun lt!294813 () SeekEntryResult!6742)

(assert (=> b!637640 (= res!412424 (not (= lt!294813 (Found!6742 index!984))))))

(declare-fun lt!294809 () Unit!21477)

(assert (=> b!637640 (= lt!294809 e!364872)))

(declare-fun c!72968 () Bool)

(assert (=> b!637640 (= c!72968 (= lt!294813 Undefined!6742))))

(assert (=> b!637640 (= lt!294813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294810 lt!294804 mask!3053))))

(assert (=> b!637640 e!364866))

(declare-fun res!412438 () Bool)

(assert (=> b!637640 (=> (not res!412438) (not e!364866))))

(declare-fun lt!294806 () (_ BitVec 32))

(assert (=> b!637640 (= res!412438 (= lt!294803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294806 vacantSpotIndex!68 lt!294810 lt!294804 mask!3053)))))

(assert (=> b!637640 (= lt!294803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294806 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637640 (= lt!294810 (select (store (arr!18346 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294811 () Unit!21477)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21477)

(assert (=> b!637640 (= lt!294811 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294806 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637640 (= lt!294806 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!637641 () Bool)

(declare-fun res!412430 () Bool)

(assert (=> b!637641 (=> res!412430 e!364864)))

(assert (=> b!637641 (= res!412430 (contains!3086 Nil!12291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637642 () Bool)

(assert (=> b!637642 (= e!364863 e!364869)))

(declare-fun res!412428 () Bool)

(assert (=> b!637642 (=> res!412428 e!364869)))

(assert (=> b!637642 (= res!412428 (or (not (= (select (arr!18346 a!2986) j!136) lt!294810)) (not (= (select (arr!18346 a!2986) j!136) lt!294814)) (bvsge j!136 index!984)))))

(assert (=> b!637642 e!364868))

(declare-fun res!412421 () Bool)

(assert (=> b!637642 (=> (not res!412421) (not e!364868))))

(assert (=> b!637642 (= res!412421 (= lt!294814 (select (arr!18346 a!2986) j!136)))))

(assert (=> b!637642 (= lt!294814 (select (store (arr!18346 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637628 () Bool)

(declare-fun res!412429 () Bool)

(assert (=> b!637628 (=> res!412429 e!364864)))

(assert (=> b!637628 (= res!412429 (contains!3086 Nil!12291 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!412440 () Bool)

(assert (=> start!57744 (=> (not res!412440) (not e!364871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57744 (= res!412440 (validMask!0 mask!3053))))

(assert (=> start!57744 e!364871))

(assert (=> start!57744 true))

(declare-fun array_inv!14205 (array!38253) Bool)

(assert (=> start!57744 (array_inv!14205 a!2986)))

(assert (= (and start!57744 res!412440) b!637631))

(assert (= (and b!637631 res!412432) b!637625))

(assert (= (and b!637625 res!412425) b!637636))

(assert (= (and b!637636 res!412439) b!637637))

(assert (= (and b!637637 res!412423) b!637629))

(assert (= (and b!637629 res!412435) b!637622))

(assert (= (and b!637622 res!412433) b!637623))

(assert (= (and b!637623 res!412436) b!637632))

(assert (= (and b!637632 res!412426) b!637630))

(assert (= (and b!637630 res!412437) b!637639))

(assert (= (and b!637639 res!412431) b!637640))

(assert (= (and b!637640 res!412438) b!637633))

(assert (= (and b!637640 c!72968) b!637624))

(assert (= (and b!637640 (not c!72968)) b!637638))

(assert (= (and b!637640 (not res!412424)) b!637642))

(assert (= (and b!637642 res!412421) b!637620))

(assert (= (and b!637620 (not res!412441)) b!637635))

(assert (= (and b!637635 res!412427) b!637621))

(assert (= (and b!637642 (not res!412428)) b!637627))

(assert (= (and b!637627 (not res!412434)) b!637626))

(assert (= (and b!637626 (not res!412422)) b!637641))

(assert (= (and b!637641 (not res!412430)) b!637628))

(assert (= (and b!637628 (not res!412429)) b!637634))

(declare-fun m!612073 () Bool)

(assert (=> b!637640 m!612073))

(declare-fun m!612075 () Bool)

(assert (=> b!637640 m!612075))

(declare-fun m!612077 () Bool)

(assert (=> b!637640 m!612077))

(declare-fun m!612079 () Bool)

(assert (=> b!637640 m!612079))

(declare-fun m!612081 () Bool)

(assert (=> b!637640 m!612081))

(declare-fun m!612083 () Bool)

(assert (=> b!637640 m!612083))

(declare-fun m!612085 () Bool)

(assert (=> b!637640 m!612085))

(assert (=> b!637640 m!612075))

(declare-fun m!612087 () Bool)

(assert (=> b!637640 m!612087))

(assert (=> b!637621 m!612075))

(assert (=> b!637621 m!612075))

(declare-fun m!612089 () Bool)

(assert (=> b!637621 m!612089))

(declare-fun m!612091 () Bool)

(assert (=> b!637623 m!612091))

(declare-fun m!612093 () Bool)

(assert (=> b!637622 m!612093))

(assert (=> b!637635 m!612075))

(assert (=> b!637635 m!612075))

(declare-fun m!612095 () Bool)

(assert (=> b!637635 m!612095))

(declare-fun m!612097 () Bool)

(assert (=> b!637632 m!612097))

(declare-fun m!612099 () Bool)

(assert (=> b!637628 m!612099))

(assert (=> b!637642 m!612075))

(assert (=> b!637642 m!612079))

(declare-fun m!612101 () Bool)

(assert (=> b!637642 m!612101))

(assert (=> b!637627 m!612075))

(assert (=> b!637627 m!612075))

(declare-fun m!612103 () Bool)

(assert (=> b!637627 m!612103))

(assert (=> b!637627 m!612075))

(declare-fun m!612105 () Bool)

(assert (=> b!637627 m!612105))

(declare-fun m!612107 () Bool)

(assert (=> b!637641 m!612107))

(declare-fun m!612109 () Bool)

(assert (=> b!637639 m!612109))

(assert (=> b!637639 m!612075))

(assert (=> b!637639 m!612075))

(declare-fun m!612111 () Bool)

(assert (=> b!637639 m!612111))

(assert (=> b!637630 m!612079))

(declare-fun m!612113 () Bool)

(assert (=> b!637630 m!612113))

(declare-fun m!612115 () Bool)

(assert (=> b!637629 m!612115))

(assert (=> b!637620 m!612075))

(declare-fun m!612117 () Bool)

(assert (=> b!637626 m!612117))

(assert (=> b!637625 m!612075))

(assert (=> b!637625 m!612075))

(declare-fun m!612119 () Bool)

(assert (=> b!637625 m!612119))

(declare-fun m!612121 () Bool)

(assert (=> start!57744 m!612121))

(declare-fun m!612123 () Bool)

(assert (=> start!57744 m!612123))

(declare-fun m!612125 () Bool)

(assert (=> b!637634 m!612125))

(declare-fun m!612127 () Bool)

(assert (=> b!637637 m!612127))

(declare-fun m!612129 () Bool)

(assert (=> b!637636 m!612129))

(check-sat (not b!637637) (not b!637634) (not b!637628) (not b!637641) (not b!637627) (not b!637626) (not b!637639) (not b!637623) (not b!637622) (not b!637635) (not start!57744) (not b!637636) (not b!637621) (not b!637629) (not b!637640) (not b!637625))
(check-sat)
