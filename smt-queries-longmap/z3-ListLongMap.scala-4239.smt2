; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58540 () Bool)

(assert start!58540)

(declare-fun b!646252 () Bool)

(declare-fun e!370435 () Bool)

(declare-datatypes ((SeekEntryResult!6888 0))(
  ( (MissingZero!6888 (index!29890 (_ BitVec 32))) (Found!6888 (index!29891 (_ BitVec 32))) (Intermediate!6888 (undefined!7700 Bool) (index!29892 (_ BitVec 32)) (x!58666 (_ BitVec 32))) (Undefined!6888) (MissingVacant!6888 (index!29893 (_ BitVec 32))) )
))
(declare-fun lt!299790 () SeekEntryResult!6888)

(declare-fun lt!299780 () SeekEntryResult!6888)

(assert (=> b!646252 (= e!370435 (= lt!299790 lt!299780))))

(declare-fun b!646253 () Bool)

(declare-fun e!370433 () Bool)

(assert (=> b!646253 (= e!370433 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38475 0))(
  ( (array!38476 (arr!18448 (Array (_ BitVec 32) (_ BitVec 64))) (size!18812 (_ BitVec 32))) )
))
(declare-fun lt!299791 () array!38475)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38475)

(declare-fun arrayContainsKey!0 (array!38475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646253 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21954 0))(
  ( (Unit!21955) )
))
(declare-fun lt!299777 () Unit!21954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21954)

(assert (=> b!646253 (= lt!299777 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299791 (select (arr!18448 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370426 () Bool)

(assert (=> b!646253 e!370426))

(declare-fun res!418703 () Bool)

(assert (=> b!646253 (=> (not res!418703) (not e!370426))))

(assert (=> b!646253 (= res!418703 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) j!136))))

(declare-fun b!646254 () Bool)

(declare-fun e!370429 () Unit!21954)

(declare-fun Unit!21956 () Unit!21954)

(assert (=> b!646254 (= e!370429 Unit!21956)))

(assert (=> b!646254 false))

(declare-fun b!646256 () Bool)

(declare-fun e!370440 () Bool)

(declare-fun e!370428 () Bool)

(assert (=> b!646256 (= e!370440 e!370428)))

(declare-fun res!418713 () Bool)

(assert (=> b!646256 (=> res!418713 e!370428)))

(declare-fun lt!299776 () (_ BitVec 64))

(declare-fun lt!299778 () (_ BitVec 64))

(assert (=> b!646256 (= res!418713 (or (not (= (select (arr!18448 a!2986) j!136) lt!299778)) (not (= (select (arr!18448 a!2986) j!136) lt!299776))))))

(declare-fun e!370437 () Bool)

(assert (=> b!646256 e!370437))

(declare-fun res!418700 () Bool)

(assert (=> b!646256 (=> (not res!418700) (not e!370437))))

(assert (=> b!646256 (= res!418700 (= lt!299776 (select (arr!18448 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!646256 (= lt!299776 (select (store (arr!18448 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646257 () Bool)

(declare-fun e!370438 () Bool)

(assert (=> b!646257 (= e!370437 e!370438)))

(declare-fun res!418716 () Bool)

(assert (=> b!646257 (=> res!418716 e!370438)))

(assert (=> b!646257 (= res!418716 (or (not (= (select (arr!18448 a!2986) j!136) lt!299778)) (not (= (select (arr!18448 a!2986) j!136) lt!299776)) (bvsge j!136 index!984)))))

(declare-fun b!646258 () Bool)

(declare-fun Unit!21957 () Unit!21954)

(assert (=> b!646258 (= e!370429 Unit!21957)))

(declare-fun b!646259 () Bool)

(declare-fun e!370436 () Bool)

(declare-fun e!370427 () Bool)

(assert (=> b!646259 (= e!370436 e!370427)))

(declare-fun res!418704 () Bool)

(assert (=> b!646259 (=> (not res!418704) (not e!370427))))

(declare-fun lt!299782 () SeekEntryResult!6888)

(assert (=> b!646259 (= res!418704 (or (= lt!299782 (MissingZero!6888 i!1108)) (= lt!299782 (MissingVacant!6888 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38475 (_ BitVec 32)) SeekEntryResult!6888)

(assert (=> b!646259 (= lt!299782 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646260 () Bool)

(declare-fun res!418707 () Bool)

(assert (=> b!646260 (=> (not res!418707) (not e!370427))))

(declare-datatypes ((List!12489 0))(
  ( (Nil!12486) (Cons!12485 (h!13530 (_ BitVec 64)) (t!18717 List!12489)) )
))
(declare-fun arrayNoDuplicates!0 (array!38475 (_ BitVec 32) List!12489) Bool)

(assert (=> b!646260 (= res!418707 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12486))))

(declare-fun b!646261 () Bool)

(assert (=> b!646261 (= e!370426 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) index!984))))

(declare-fun b!646262 () Bool)

(declare-fun e!370434 () Unit!21954)

(declare-fun Unit!21958 () Unit!21954)

(assert (=> b!646262 (= e!370434 Unit!21958)))

(declare-fun lt!299785 () Unit!21954)

(assert (=> b!646262 (= lt!299785 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299791 (select (arr!18448 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646262 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299783 () Unit!21954)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12489) Unit!21954)

(assert (=> b!646262 (= lt!299783 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12486))))

(assert (=> b!646262 (arrayNoDuplicates!0 lt!299791 #b00000000000000000000000000000000 Nil!12486)))

(declare-fun lt!299786 () Unit!21954)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38475 (_ BitVec 32) (_ BitVec 32)) Unit!21954)

(assert (=> b!646262 (= lt!299786 (lemmaNoDuplicateFromThenFromBigger!0 lt!299791 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646262 (arrayNoDuplicates!0 lt!299791 j!136 Nil!12486)))

(declare-fun lt!299779 () Unit!21954)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38475 (_ BitVec 64) (_ BitVec 32) List!12489) Unit!21954)

(assert (=> b!646262 (= lt!299779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299791 (select (arr!18448 a!2986) j!136) j!136 Nil!12486))))

(assert (=> b!646262 false))

(declare-fun b!646263 () Bool)

(declare-fun Unit!21959 () Unit!21954)

(assert (=> b!646263 (= e!370434 Unit!21959)))

(declare-fun b!646264 () Bool)

(declare-fun res!418717 () Bool)

(assert (=> b!646264 (=> (not res!418717) (not e!370436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646264 (= res!418717 (validKeyInArray!0 (select (arr!18448 a!2986) j!136)))))

(declare-fun b!646265 () Bool)

(declare-fun e!370432 () Bool)

(assert (=> b!646265 (= e!370438 e!370432)))

(declare-fun res!418702 () Bool)

(assert (=> b!646265 (=> (not res!418702) (not e!370432))))

(assert (=> b!646265 (= res!418702 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) j!136))))

(declare-fun b!646266 () Bool)

(declare-fun res!418710 () Bool)

(assert (=> b!646266 (=> (not res!418710) (not e!370427))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!646266 (= res!418710 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18448 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646267 () Bool)

(declare-fun e!370430 () Bool)

(assert (=> b!646267 (= e!370427 e!370430)))

(declare-fun res!418705 () Bool)

(assert (=> b!646267 (=> (not res!418705) (not e!370430))))

(assert (=> b!646267 (= res!418705 (= (select (store (arr!18448 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646267 (= lt!299791 (array!38476 (store (arr!18448 a!2986) i!1108 k0!1786) (size!18812 a!2986)))))

(declare-fun b!646268 () Bool)

(assert (=> b!646268 (= e!370432 (arrayContainsKey!0 lt!299791 (select (arr!18448 a!2986) j!136) index!984))))

(declare-fun b!646269 () Bool)

(declare-fun res!418718 () Bool)

(assert (=> b!646269 (=> (not res!418718) (not e!370436))))

(assert (=> b!646269 (= res!418718 (and (= (size!18812 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18812 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18812 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646255 () Bool)

(assert (=> b!646255 (= e!370428 e!370433)))

(declare-fun res!418709 () Bool)

(assert (=> b!646255 (=> res!418709 e!370433)))

(assert (=> b!646255 (= res!418709 (bvsge index!984 j!136))))

(declare-fun lt!299787 () Unit!21954)

(assert (=> b!646255 (= lt!299787 e!370434)))

(declare-fun c!74143 () Bool)

(assert (=> b!646255 (= c!74143 (bvslt j!136 index!984))))

(declare-fun res!418708 () Bool)

(assert (=> start!58540 (=> (not res!418708) (not e!370436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58540 (= res!418708 (validMask!0 mask!3053))))

(assert (=> start!58540 e!370436))

(assert (=> start!58540 true))

(declare-fun array_inv!14244 (array!38475) Bool)

(assert (=> start!58540 (array_inv!14244 a!2986)))

(declare-fun b!646270 () Bool)

(declare-fun res!418706 () Bool)

(assert (=> b!646270 (=> (not res!418706) (not e!370427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38475 (_ BitVec 32)) Bool)

(assert (=> b!646270 (= res!418706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646271 () Bool)

(declare-fun e!370431 () Bool)

(assert (=> b!646271 (= e!370431 (not e!370440))))

(declare-fun res!418714 () Bool)

(assert (=> b!646271 (=> res!418714 e!370440)))

(declare-fun lt!299784 () SeekEntryResult!6888)

(assert (=> b!646271 (= res!418714 (not (= lt!299784 (Found!6888 index!984))))))

(declare-fun lt!299781 () Unit!21954)

(assert (=> b!646271 (= lt!299781 e!370429)))

(declare-fun c!74144 () Bool)

(assert (=> b!646271 (= c!74144 (= lt!299784 Undefined!6888))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38475 (_ BitVec 32)) SeekEntryResult!6888)

(assert (=> b!646271 (= lt!299784 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299778 lt!299791 mask!3053))))

(assert (=> b!646271 e!370435))

(declare-fun res!418715 () Bool)

(assert (=> b!646271 (=> (not res!418715) (not e!370435))))

(declare-fun lt!299789 () (_ BitVec 32))

(assert (=> b!646271 (= res!418715 (= lt!299780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299789 vacantSpotIndex!68 lt!299778 lt!299791 mask!3053)))))

(assert (=> b!646271 (= lt!299780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299789 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646271 (= lt!299778 (select (store (arr!18448 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299788 () Unit!21954)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21954)

(assert (=> b!646271 (= lt!299788 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299789 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646271 (= lt!299789 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646272 () Bool)

(declare-fun res!418701 () Bool)

(assert (=> b!646272 (=> (not res!418701) (not e!370436))))

(assert (=> b!646272 (= res!418701 (validKeyInArray!0 k0!1786))))

(declare-fun b!646273 () Bool)

(declare-fun res!418712 () Bool)

(assert (=> b!646273 (=> (not res!418712) (not e!370436))))

(assert (=> b!646273 (= res!418712 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646274 () Bool)

(assert (=> b!646274 (= e!370430 e!370431)))

(declare-fun res!418711 () Bool)

(assert (=> b!646274 (=> (not res!418711) (not e!370431))))

(assert (=> b!646274 (= res!418711 (and (= lt!299790 (Found!6888 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18448 a!2986) index!984) (select (arr!18448 a!2986) j!136))) (not (= (select (arr!18448 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646274 (= lt!299790 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!58540 res!418708) b!646269))

(assert (= (and b!646269 res!418718) b!646264))

(assert (= (and b!646264 res!418717) b!646272))

(assert (= (and b!646272 res!418701) b!646273))

(assert (= (and b!646273 res!418712) b!646259))

(assert (= (and b!646259 res!418704) b!646270))

(assert (= (and b!646270 res!418706) b!646260))

(assert (= (and b!646260 res!418707) b!646266))

(assert (= (and b!646266 res!418710) b!646267))

(assert (= (and b!646267 res!418705) b!646274))

(assert (= (and b!646274 res!418711) b!646271))

(assert (= (and b!646271 res!418715) b!646252))

(assert (= (and b!646271 c!74144) b!646254))

(assert (= (and b!646271 (not c!74144)) b!646258))

(assert (= (and b!646271 (not res!418714)) b!646256))

(assert (= (and b!646256 res!418700) b!646257))

(assert (= (and b!646257 (not res!418716)) b!646265))

(assert (= (and b!646265 res!418702) b!646268))

(assert (= (and b!646256 (not res!418713)) b!646255))

(assert (= (and b!646255 c!74143) b!646262))

(assert (= (and b!646255 (not c!74143)) b!646263))

(assert (= (and b!646255 (not res!418709)) b!646253))

(assert (= (and b!646253 res!418703) b!646261))

(declare-fun m!619731 () Bool)

(assert (=> b!646264 m!619731))

(assert (=> b!646264 m!619731))

(declare-fun m!619733 () Bool)

(assert (=> b!646264 m!619733))

(declare-fun m!619735 () Bool)

(assert (=> b!646259 m!619735))

(declare-fun m!619737 () Bool)

(assert (=> b!646272 m!619737))

(assert (=> b!646256 m!619731))

(declare-fun m!619739 () Bool)

(assert (=> b!646256 m!619739))

(declare-fun m!619741 () Bool)

(assert (=> b!646256 m!619741))

(assert (=> b!646257 m!619731))

(assert (=> b!646261 m!619731))

(assert (=> b!646261 m!619731))

(declare-fun m!619743 () Bool)

(assert (=> b!646261 m!619743))

(assert (=> b!646267 m!619739))

(declare-fun m!619745 () Bool)

(assert (=> b!646267 m!619745))

(assert (=> b!646268 m!619731))

(assert (=> b!646268 m!619731))

(assert (=> b!646268 m!619743))

(declare-fun m!619747 () Bool)

(assert (=> start!58540 m!619747))

(declare-fun m!619749 () Bool)

(assert (=> start!58540 m!619749))

(declare-fun m!619751 () Bool)

(assert (=> b!646271 m!619751))

(declare-fun m!619753 () Bool)

(assert (=> b!646271 m!619753))

(assert (=> b!646271 m!619731))

(assert (=> b!646271 m!619739))

(declare-fun m!619755 () Bool)

(assert (=> b!646271 m!619755))

(declare-fun m!619757 () Bool)

(assert (=> b!646271 m!619757))

(assert (=> b!646271 m!619731))

(declare-fun m!619759 () Bool)

(assert (=> b!646271 m!619759))

(declare-fun m!619761 () Bool)

(assert (=> b!646271 m!619761))

(declare-fun m!619763 () Bool)

(assert (=> b!646270 m!619763))

(assert (=> b!646253 m!619731))

(assert (=> b!646253 m!619731))

(declare-fun m!619765 () Bool)

(assert (=> b!646253 m!619765))

(assert (=> b!646253 m!619731))

(declare-fun m!619767 () Bool)

(assert (=> b!646253 m!619767))

(assert (=> b!646253 m!619731))

(declare-fun m!619769 () Bool)

(assert (=> b!646253 m!619769))

(assert (=> b!646265 m!619731))

(assert (=> b!646265 m!619731))

(assert (=> b!646265 m!619769))

(declare-fun m!619771 () Bool)

(assert (=> b!646274 m!619771))

(assert (=> b!646274 m!619731))

(assert (=> b!646274 m!619731))

(declare-fun m!619773 () Bool)

(assert (=> b!646274 m!619773))

(declare-fun m!619775 () Bool)

(assert (=> b!646260 m!619775))

(declare-fun m!619777 () Bool)

(assert (=> b!646273 m!619777))

(assert (=> b!646262 m!619731))

(declare-fun m!619779 () Bool)

(assert (=> b!646262 m!619779))

(assert (=> b!646262 m!619731))

(declare-fun m!619781 () Bool)

(assert (=> b!646262 m!619781))

(declare-fun m!619783 () Bool)

(assert (=> b!646262 m!619783))

(assert (=> b!646262 m!619731))

(declare-fun m!619785 () Bool)

(assert (=> b!646262 m!619785))

(assert (=> b!646262 m!619731))

(declare-fun m!619787 () Bool)

(assert (=> b!646262 m!619787))

(declare-fun m!619789 () Bool)

(assert (=> b!646262 m!619789))

(declare-fun m!619791 () Bool)

(assert (=> b!646262 m!619791))

(declare-fun m!619793 () Bool)

(assert (=> b!646266 m!619793))

(check-sat (not b!646262) (not b!646268) (not b!646270) (not b!646273) (not b!646272) (not b!646253) (not start!58540) (not b!646265) (not b!646261) (not b!646260) (not b!646271) (not b!646274) (not b!646264) (not b!646259))
(check-sat)
