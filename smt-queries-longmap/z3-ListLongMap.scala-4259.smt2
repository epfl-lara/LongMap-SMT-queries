; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59166 () Bool)

(assert start!59166)

(declare-fun b!652587 () Bool)

(declare-fun e!374571 () Bool)

(declare-fun e!374573 () Bool)

(assert (=> b!652587 (= e!374571 e!374573)))

(declare-fun res!423170 () Bool)

(assert (=> b!652587 (=> (not res!423170) (not e!374573))))

(declare-datatypes ((SeekEntryResult!6898 0))(
  ( (MissingZero!6898 (index!29945 (_ BitVec 32))) (Found!6898 (index!29946 (_ BitVec 32))) (Intermediate!6898 (undefined!7710 Bool) (index!29947 (_ BitVec 32)) (x!58884 (_ BitVec 32))) (Undefined!6898) (MissingVacant!6898 (index!29948 (_ BitVec 32))) )
))
(declare-fun lt!303651 () SeekEntryResult!6898)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!652587 (= res!423170 (or (= lt!303651 (MissingZero!6898 i!1108)) (= lt!303651 (MissingVacant!6898 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38604 0))(
  ( (array!38605 (arr!18502 (Array (_ BitVec 32) (_ BitVec 64))) (size!18866 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38604)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38604 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!652587 (= lt!303651 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652588 () Bool)

(declare-fun e!374564 () Bool)

(declare-fun lt!303661 () array!38604)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652588 (= e!374564 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) index!984))))

(declare-fun b!652589 () Bool)

(declare-datatypes ((Unit!22287 0))(
  ( (Unit!22288) )
))
(declare-fun e!374567 () Unit!22287)

(declare-fun Unit!22289 () Unit!22287)

(assert (=> b!652589 (= e!374567 Unit!22289)))

(declare-fun lt!303656 () Unit!22287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22287)

(assert (=> b!652589 (= lt!303656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303661 (select (arr!18502 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652589 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303657 () Unit!22287)

(declare-datatypes ((List!12450 0))(
  ( (Nil!12447) (Cons!12446 (h!13494 (_ BitVec 64)) (t!18670 List!12450)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12450) Unit!22287)

(assert (=> b!652589 (= lt!303657 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12447))))

(declare-fun arrayNoDuplicates!0 (array!38604 (_ BitVec 32) List!12450) Bool)

(assert (=> b!652589 (arrayNoDuplicates!0 lt!303661 #b00000000000000000000000000000000 Nil!12447)))

(declare-fun lt!303665 () Unit!22287)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38604 (_ BitVec 32) (_ BitVec 32)) Unit!22287)

(assert (=> b!652589 (= lt!303665 (lemmaNoDuplicateFromThenFromBigger!0 lt!303661 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652589 (arrayNoDuplicates!0 lt!303661 j!136 Nil!12447)))

(declare-fun lt!303667 () Unit!22287)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38604 (_ BitVec 64) (_ BitVec 32) List!12450) Unit!22287)

(assert (=> b!652589 (= lt!303667 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303661 (select (arr!18502 a!2986) j!136) j!136 Nil!12447))))

(assert (=> b!652589 false))

(declare-fun b!652590 () Bool)

(declare-fun res!423160 () Bool)

(assert (=> b!652590 (=> (not res!423160) (not e!374571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652590 (= res!423160 (validKeyInArray!0 (select (arr!18502 a!2986) j!136)))))

(declare-fun b!652591 () Bool)

(declare-fun res!423171 () Bool)

(assert (=> b!652591 (=> (not res!423171) (not e!374573))))

(assert (=> b!652591 (= res!423171 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12447))))

(declare-fun b!652592 () Bool)

(declare-fun e!374570 () Bool)

(assert (=> b!652592 (= e!374570 (or (bvsge (size!18866 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18866 a!2986)) (bvslt index!984 (size!18866 a!2986))))))

(assert (=> b!652592 (arrayNoDuplicates!0 lt!303661 index!984 Nil!12447)))

(declare-fun lt!303666 () Unit!22287)

(assert (=> b!652592 (= lt!303666 (lemmaNoDuplicateFromThenFromBigger!0 lt!303661 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652592 (arrayNoDuplicates!0 lt!303661 #b00000000000000000000000000000000 Nil!12447)))

(declare-fun lt!303655 () Unit!22287)

(assert (=> b!652592 (= lt!303655 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12447))))

(assert (=> b!652592 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303662 () Unit!22287)

(assert (=> b!652592 (= lt!303662 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303661 (select (arr!18502 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652592 e!374564))

(declare-fun res!423176 () Bool)

(assert (=> b!652592 (=> (not res!423176) (not e!374564))))

(assert (=> b!652592 (= res!423176 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) j!136))))

(declare-fun b!652593 () Bool)

(declare-fun e!374566 () Unit!22287)

(declare-fun Unit!22290 () Unit!22287)

(assert (=> b!652593 (= e!374566 Unit!22290)))

(declare-fun res!423164 () Bool)

(assert (=> start!59166 (=> (not res!423164) (not e!374571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59166 (= res!423164 (validMask!0 mask!3053))))

(assert (=> start!59166 e!374571))

(assert (=> start!59166 true))

(declare-fun array_inv!14361 (array!38604) Bool)

(assert (=> start!59166 (array_inv!14361 a!2986)))

(declare-fun b!652594 () Bool)

(declare-fun e!374569 () Bool)

(assert (=> b!652594 (= e!374569 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) index!984))))

(declare-fun b!652595 () Bool)

(declare-fun res!423162 () Bool)

(assert (=> b!652595 (=> (not res!423162) (not e!374571))))

(assert (=> b!652595 (= res!423162 (validKeyInArray!0 k0!1786))))

(declare-fun b!652596 () Bool)

(declare-fun Unit!22291 () Unit!22287)

(assert (=> b!652596 (= e!374566 Unit!22291)))

(assert (=> b!652596 false))

(declare-fun b!652597 () Bool)

(declare-fun e!374565 () Bool)

(assert (=> b!652597 (= e!374573 e!374565)))

(declare-fun res!423163 () Bool)

(assert (=> b!652597 (=> (not res!423163) (not e!374565))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652597 (= res!423163 (= (select (store (arr!18502 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652597 (= lt!303661 (array!38605 (store (arr!18502 a!2986) i!1108 k0!1786) (size!18866 a!2986)))))

(declare-fun b!652598 () Bool)

(declare-fun e!374574 () Bool)

(declare-fun e!374572 () Bool)

(assert (=> b!652598 (= e!374574 (not e!374572))))

(declare-fun res!423161 () Bool)

(assert (=> b!652598 (=> res!423161 e!374572)))

(declare-fun lt!303664 () SeekEntryResult!6898)

(assert (=> b!652598 (= res!423161 (not (= lt!303664 (Found!6898 index!984))))))

(declare-fun lt!303658 () Unit!22287)

(assert (=> b!652598 (= lt!303658 e!374566)))

(declare-fun c!75083 () Bool)

(assert (=> b!652598 (= c!75083 (= lt!303664 Undefined!6898))))

(declare-fun lt!303659 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38604 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!652598 (= lt!303664 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303659 lt!303661 mask!3053))))

(declare-fun e!374568 () Bool)

(assert (=> b!652598 e!374568))

(declare-fun res!423174 () Bool)

(assert (=> b!652598 (=> (not res!423174) (not e!374568))))

(declare-fun lt!303663 () SeekEntryResult!6898)

(declare-fun lt!303660 () (_ BitVec 32))

(assert (=> b!652598 (= res!423174 (= lt!303663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 lt!303659 lt!303661 mask!3053)))))

(assert (=> b!652598 (= lt!303663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 (select (arr!18502 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652598 (= lt!303659 (select (store (arr!18502 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303650 () Unit!22287)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38604 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22287)

(assert (=> b!652598 (= lt!303650 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652598 (= lt!303660 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!652599 () Bool)

(declare-fun Unit!22292 () Unit!22287)

(assert (=> b!652599 (= e!374567 Unit!22292)))

(declare-fun b!652600 () Bool)

(assert (=> b!652600 (= e!374565 e!374574)))

(declare-fun res!423167 () Bool)

(assert (=> b!652600 (=> (not res!423167) (not e!374574))))

(declare-fun lt!303652 () SeekEntryResult!6898)

(assert (=> b!652600 (= res!423167 (and (= lt!303652 (Found!6898 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18502 a!2986) index!984) (select (arr!18502 a!2986) j!136))) (not (= (select (arr!18502 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652600 (= lt!303652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18502 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652601 () Bool)

(declare-fun res!423168 () Bool)

(assert (=> b!652601 (=> (not res!423168) (not e!374573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38604 (_ BitVec 32)) Bool)

(assert (=> b!652601 (= res!423168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652602 () Bool)

(declare-fun e!374575 () Bool)

(assert (=> b!652602 (= e!374575 e!374570)))

(declare-fun res!423165 () Bool)

(assert (=> b!652602 (=> res!423165 e!374570)))

(assert (=> b!652602 (= res!423165 (bvsge index!984 j!136))))

(declare-fun lt!303653 () Unit!22287)

(assert (=> b!652602 (= lt!303653 e!374567)))

(declare-fun c!75082 () Bool)

(assert (=> b!652602 (= c!75082 (bvslt j!136 index!984))))

(declare-fun b!652603 () Bool)

(assert (=> b!652603 (= e!374572 e!374575)))

(declare-fun res!423173 () Bool)

(assert (=> b!652603 (=> res!423173 e!374575)))

(declare-fun lt!303654 () (_ BitVec 64))

(assert (=> b!652603 (= res!423173 (or (not (= (select (arr!18502 a!2986) j!136) lt!303659)) (not (= (select (arr!18502 a!2986) j!136) lt!303654))))))

(declare-fun e!374576 () Bool)

(assert (=> b!652603 e!374576))

(declare-fun res!423178 () Bool)

(assert (=> b!652603 (=> (not res!423178) (not e!374576))))

(assert (=> b!652603 (= res!423178 (= lt!303654 (select (arr!18502 a!2986) j!136)))))

(assert (=> b!652603 (= lt!303654 (select (store (arr!18502 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652604 () Bool)

(declare-fun e!374563 () Bool)

(assert (=> b!652604 (= e!374563 e!374569)))

(declare-fun res!423169 () Bool)

(assert (=> b!652604 (=> (not res!423169) (not e!374569))))

(assert (=> b!652604 (= res!423169 (arrayContainsKey!0 lt!303661 (select (arr!18502 a!2986) j!136) j!136))))

(declare-fun b!652605 () Bool)

(declare-fun res!423177 () Bool)

(assert (=> b!652605 (=> (not res!423177) (not e!374571))))

(assert (=> b!652605 (= res!423177 (and (= (size!18866 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18866 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18866 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652606 () Bool)

(declare-fun res!423166 () Bool)

(assert (=> b!652606 (=> (not res!423166) (not e!374571))))

(assert (=> b!652606 (= res!423166 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652607 () Bool)

(assert (=> b!652607 (= e!374568 (= lt!303652 lt!303663))))

(declare-fun b!652608 () Bool)

(assert (=> b!652608 (= e!374576 e!374563)))

(declare-fun res!423172 () Bool)

(assert (=> b!652608 (=> res!423172 e!374563)))

(assert (=> b!652608 (= res!423172 (or (not (= (select (arr!18502 a!2986) j!136) lt!303659)) (not (= (select (arr!18502 a!2986) j!136) lt!303654)) (bvsge j!136 index!984)))))

(declare-fun b!652609 () Bool)

(declare-fun res!423175 () Bool)

(assert (=> b!652609 (=> (not res!423175) (not e!374573))))

(assert (=> b!652609 (= res!423175 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18502 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59166 res!423164) b!652605))

(assert (= (and b!652605 res!423177) b!652590))

(assert (= (and b!652590 res!423160) b!652595))

(assert (= (and b!652595 res!423162) b!652606))

(assert (= (and b!652606 res!423166) b!652587))

(assert (= (and b!652587 res!423170) b!652601))

(assert (= (and b!652601 res!423168) b!652591))

(assert (= (and b!652591 res!423171) b!652609))

(assert (= (and b!652609 res!423175) b!652597))

(assert (= (and b!652597 res!423163) b!652600))

(assert (= (and b!652600 res!423167) b!652598))

(assert (= (and b!652598 res!423174) b!652607))

(assert (= (and b!652598 c!75083) b!652596))

(assert (= (and b!652598 (not c!75083)) b!652593))

(assert (= (and b!652598 (not res!423161)) b!652603))

(assert (= (and b!652603 res!423178) b!652608))

(assert (= (and b!652608 (not res!423172)) b!652604))

(assert (= (and b!652604 res!423169) b!652594))

(assert (= (and b!652603 (not res!423173)) b!652602))

(assert (= (and b!652602 c!75082) b!652589))

(assert (= (and b!652602 (not c!75082)) b!652599))

(assert (= (and b!652602 (not res!423165)) b!652592))

(assert (= (and b!652592 res!423176) b!652588))

(declare-fun m!626173 () Bool)

(assert (=> b!652606 m!626173))

(declare-fun m!626175 () Bool)

(assert (=> start!59166 m!626175))

(declare-fun m!626177 () Bool)

(assert (=> start!59166 m!626177))

(declare-fun m!626179 () Bool)

(assert (=> b!652594 m!626179))

(assert (=> b!652594 m!626179))

(declare-fun m!626181 () Bool)

(assert (=> b!652594 m!626181))

(declare-fun m!626183 () Bool)

(assert (=> b!652597 m!626183))

(declare-fun m!626185 () Bool)

(assert (=> b!652597 m!626185))

(declare-fun m!626187 () Bool)

(assert (=> b!652600 m!626187))

(assert (=> b!652600 m!626179))

(assert (=> b!652600 m!626179))

(declare-fun m!626189 () Bool)

(assert (=> b!652600 m!626189))

(declare-fun m!626191 () Bool)

(assert (=> b!652587 m!626191))

(declare-fun m!626193 () Bool)

(assert (=> b!652601 m!626193))

(declare-fun m!626195 () Bool)

(assert (=> b!652595 m!626195))

(declare-fun m!626197 () Bool)

(assert (=> b!652589 m!626197))

(assert (=> b!652589 m!626179))

(declare-fun m!626199 () Bool)

(assert (=> b!652589 m!626199))

(assert (=> b!652589 m!626179))

(declare-fun m!626201 () Bool)

(assert (=> b!652589 m!626201))

(assert (=> b!652589 m!626179))

(declare-fun m!626203 () Bool)

(assert (=> b!652589 m!626203))

(assert (=> b!652589 m!626179))

(declare-fun m!626205 () Bool)

(assert (=> b!652589 m!626205))

(declare-fun m!626207 () Bool)

(assert (=> b!652589 m!626207))

(declare-fun m!626209 () Bool)

(assert (=> b!652589 m!626209))

(declare-fun m!626211 () Bool)

(assert (=> b!652598 m!626211))

(declare-fun m!626213 () Bool)

(assert (=> b!652598 m!626213))

(assert (=> b!652598 m!626179))

(assert (=> b!652598 m!626183))

(declare-fun m!626215 () Bool)

(assert (=> b!652598 m!626215))

(assert (=> b!652598 m!626179))

(declare-fun m!626217 () Bool)

(assert (=> b!652598 m!626217))

(declare-fun m!626219 () Bool)

(assert (=> b!652598 m!626219))

(declare-fun m!626221 () Bool)

(assert (=> b!652598 m!626221))

(declare-fun m!626223 () Bool)

(assert (=> b!652609 m!626223))

(declare-fun m!626225 () Bool)

(assert (=> b!652591 m!626225))

(assert (=> b!652588 m!626179))

(assert (=> b!652588 m!626179))

(assert (=> b!652588 m!626181))

(assert (=> b!652608 m!626179))

(assert (=> b!652604 m!626179))

(assert (=> b!652604 m!626179))

(declare-fun m!626227 () Bool)

(assert (=> b!652604 m!626227))

(assert (=> b!652592 m!626179))

(declare-fun m!626229 () Bool)

(assert (=> b!652592 m!626229))

(assert (=> b!652592 m!626199))

(assert (=> b!652592 m!626179))

(assert (=> b!652592 m!626227))

(declare-fun m!626231 () Bool)

(assert (=> b!652592 m!626231))

(assert (=> b!652592 m!626179))

(declare-fun m!626233 () Bool)

(assert (=> b!652592 m!626233))

(assert (=> b!652592 m!626209))

(assert (=> b!652592 m!626179))

(declare-fun m!626235 () Bool)

(assert (=> b!652592 m!626235))

(assert (=> b!652590 m!626179))

(assert (=> b!652590 m!626179))

(declare-fun m!626237 () Bool)

(assert (=> b!652590 m!626237))

(assert (=> b!652603 m!626179))

(assert (=> b!652603 m!626183))

(declare-fun m!626239 () Bool)

(assert (=> b!652603 m!626239))

(check-sat (not start!59166) (not b!652600) (not b!652606) (not b!652591) (not b!652601) (not b!652595) (not b!652592) (not b!652588) (not b!652589) (not b!652590) (not b!652604) (not b!652598) (not b!652594) (not b!652587))
(check-sat)
