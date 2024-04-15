; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57084 () Bool)

(assert start!57084)

(declare-fun b!631766 () Bool)

(declare-fun res!408563 () Bool)

(declare-fun e!361187 () Bool)

(assert (=> b!631766 (=> (not res!408563) (not e!361187))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631766 (= res!408563 (validKeyInArray!0 k0!1786))))

(declare-fun b!631767 () Bool)

(declare-fun e!361185 () Bool)

(declare-fun e!361186 () Bool)

(assert (=> b!631767 (= e!361185 e!361186)))

(declare-fun res!408570 () Bool)

(assert (=> b!631767 (=> (not res!408570) (not e!361186))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6727 0))(
  ( (MissingZero!6727 (index!29201 (_ BitVec 32))) (Found!6727 (index!29202 (_ BitVec 32))) (Intermediate!6727 (undefined!7539 Bool) (index!29203 (_ BitVec 32)) (x!57949 (_ BitVec 32))) (Undefined!6727) (MissingVacant!6727 (index!29204 (_ BitVec 32))) )
))
(declare-fun lt!291817 () SeekEntryResult!6727)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38115 0))(
  ( (array!38116 (arr!18290 (Array (_ BitVec 32) (_ BitVec 64))) (size!18655 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38115)

(assert (=> b!631767 (= res!408570 (and (= lt!291817 (Found!6727 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18290 a!2986) index!984) (select (arr!18290 a!2986) j!136))) (not (= (select (arr!18290 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38115 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!631767 (= lt!291817 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18290 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631768 () Bool)

(declare-fun e!361181 () Bool)

(assert (=> b!631768 (= e!361181 e!361185)))

(declare-fun res!408567 () Bool)

(assert (=> b!631768 (=> (not res!408567) (not e!361185))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631768 (= res!408567 (= (select (store (arr!18290 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291816 () array!38115)

(assert (=> b!631768 (= lt!291816 (array!38116 (store (arr!18290 a!2986) i!1108 k0!1786) (size!18655 a!2986)))))

(declare-fun b!631769 () Bool)

(assert (=> b!631769 (= e!361187 e!361181)))

(declare-fun res!408568 () Bool)

(assert (=> b!631769 (=> (not res!408568) (not e!361181))))

(declare-fun lt!291818 () SeekEntryResult!6727)

(assert (=> b!631769 (= res!408568 (or (= lt!291818 (MissingZero!6727 i!1108)) (= lt!291818 (MissingVacant!6727 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38115 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!631769 (= lt!291818 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!408562 () Bool)

(assert (=> start!57084 (=> (not res!408562) (not e!361187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57084 (= res!408562 (validMask!0 mask!3053))))

(assert (=> start!57084 e!361187))

(assert (=> start!57084 true))

(declare-fun array_inv!14173 (array!38115) Bool)

(assert (=> start!57084 (array_inv!14173 a!2986)))

(declare-fun b!631770 () Bool)

(declare-datatypes ((Unit!21236 0))(
  ( (Unit!21237) )
))
(declare-fun e!361188 () Unit!21236)

(declare-fun Unit!21238 () Unit!21236)

(assert (=> b!631770 (= e!361188 Unit!21238)))

(declare-fun b!631771 () Bool)

(declare-fun res!408572 () Bool)

(assert (=> b!631771 (=> (not res!408572) (not e!361181))))

(declare-datatypes ((List!12370 0))(
  ( (Nil!12367) (Cons!12366 (h!13411 (_ BitVec 64)) (t!18589 List!12370)) )
))
(declare-fun arrayNoDuplicates!0 (array!38115 (_ BitVec 32) List!12370) Bool)

(assert (=> b!631771 (= res!408572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12367))))

(declare-fun b!631772 () Bool)

(declare-fun e!361182 () Bool)

(declare-fun lt!291822 () SeekEntryResult!6727)

(assert (=> b!631772 (= e!361182 (= lt!291817 lt!291822))))

(declare-fun b!631773 () Bool)

(declare-fun res!408569 () Bool)

(assert (=> b!631773 (=> (not res!408569) (not e!361187))))

(declare-fun arrayContainsKey!0 (array!38115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631773 (= res!408569 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631774 () Bool)

(declare-fun e!361184 () Bool)

(assert (=> b!631774 (= e!361186 (not e!361184))))

(declare-fun res!408560 () Bool)

(assert (=> b!631774 (=> res!408560 e!361184)))

(declare-fun lt!291819 () SeekEntryResult!6727)

(assert (=> b!631774 (= res!408560 (not (= lt!291819 (Found!6727 index!984))))))

(declare-fun lt!291821 () Unit!21236)

(assert (=> b!631774 (= lt!291821 e!361188)))

(declare-fun c!71970 () Bool)

(assert (=> b!631774 (= c!71970 (= lt!291819 Undefined!6727))))

(declare-fun lt!291820 () (_ BitVec 64))

(assert (=> b!631774 (= lt!291819 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291820 lt!291816 mask!3053))))

(assert (=> b!631774 e!361182))

(declare-fun res!408566 () Bool)

(assert (=> b!631774 (=> (not res!408566) (not e!361182))))

(declare-fun lt!291823 () (_ BitVec 32))

(assert (=> b!631774 (= res!408566 (= lt!291822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291823 vacantSpotIndex!68 lt!291820 lt!291816 mask!3053)))))

(assert (=> b!631774 (= lt!291822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291823 vacantSpotIndex!68 (select (arr!18290 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631774 (= lt!291820 (select (store (arr!18290 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291815 () Unit!21236)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21236)

(assert (=> b!631774 (= lt!291815 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291823 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631774 (= lt!291823 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631775 () Bool)

(declare-fun res!408571 () Bool)

(assert (=> b!631775 (=> (not res!408571) (not e!361181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38115 (_ BitVec 32)) Bool)

(assert (=> b!631775 (= res!408571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631776 () Bool)

(declare-fun res!408561 () Bool)

(assert (=> b!631776 (=> (not res!408561) (not e!361187))))

(assert (=> b!631776 (= res!408561 (and (= (size!18655 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18655 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18655 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631777 () Bool)

(declare-fun res!408564 () Bool)

(assert (=> b!631777 (=> (not res!408564) (not e!361187))))

(assert (=> b!631777 (= res!408564 (validKeyInArray!0 (select (arr!18290 a!2986) j!136)))))

(declare-fun b!631778 () Bool)

(declare-fun res!408565 () Bool)

(assert (=> b!631778 (=> (not res!408565) (not e!361181))))

(assert (=> b!631778 (= res!408565 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18290 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631779 () Bool)

(assert (=> b!631779 (= e!361184 true)))

(assert (=> b!631779 (= (select (store (arr!18290 a!2986) i!1108 k0!1786) index!984) (select (arr!18290 a!2986) j!136))))

(declare-fun b!631780 () Bool)

(declare-fun Unit!21239 () Unit!21236)

(assert (=> b!631780 (= e!361188 Unit!21239)))

(assert (=> b!631780 false))

(assert (= (and start!57084 res!408562) b!631776))

(assert (= (and b!631776 res!408561) b!631777))

(assert (= (and b!631777 res!408564) b!631766))

(assert (= (and b!631766 res!408563) b!631773))

(assert (= (and b!631773 res!408569) b!631769))

(assert (= (and b!631769 res!408568) b!631775))

(assert (= (and b!631775 res!408571) b!631771))

(assert (= (and b!631771 res!408572) b!631778))

(assert (= (and b!631778 res!408565) b!631768))

(assert (= (and b!631768 res!408567) b!631767))

(assert (= (and b!631767 res!408570) b!631774))

(assert (= (and b!631774 res!408566) b!631772))

(assert (= (and b!631774 c!71970) b!631780))

(assert (= (and b!631774 (not c!71970)) b!631770))

(assert (= (and b!631774 (not res!408560)) b!631779))

(declare-fun m!606127 () Bool)

(assert (=> b!631769 m!606127))

(declare-fun m!606129 () Bool)

(assert (=> b!631773 m!606129))

(declare-fun m!606131 () Bool)

(assert (=> b!631771 m!606131))

(declare-fun m!606133 () Bool)

(assert (=> b!631767 m!606133))

(declare-fun m!606135 () Bool)

(assert (=> b!631767 m!606135))

(assert (=> b!631767 m!606135))

(declare-fun m!606137 () Bool)

(assert (=> b!631767 m!606137))

(declare-fun m!606139 () Bool)

(assert (=> b!631768 m!606139))

(declare-fun m!606141 () Bool)

(assert (=> b!631768 m!606141))

(declare-fun m!606143 () Bool)

(assert (=> b!631775 m!606143))

(assert (=> b!631777 m!606135))

(assert (=> b!631777 m!606135))

(declare-fun m!606145 () Bool)

(assert (=> b!631777 m!606145))

(declare-fun m!606147 () Bool)

(assert (=> b!631766 m!606147))

(assert (=> b!631779 m!606139))

(declare-fun m!606149 () Bool)

(assert (=> b!631779 m!606149))

(assert (=> b!631779 m!606135))

(declare-fun m!606151 () Bool)

(assert (=> b!631778 m!606151))

(declare-fun m!606153 () Bool)

(assert (=> start!57084 m!606153))

(declare-fun m!606155 () Bool)

(assert (=> start!57084 m!606155))

(declare-fun m!606157 () Bool)

(assert (=> b!631774 m!606157))

(declare-fun m!606159 () Bool)

(assert (=> b!631774 m!606159))

(declare-fun m!606161 () Bool)

(assert (=> b!631774 m!606161))

(declare-fun m!606163 () Bool)

(assert (=> b!631774 m!606163))

(assert (=> b!631774 m!606135))

(assert (=> b!631774 m!606139))

(declare-fun m!606165 () Bool)

(assert (=> b!631774 m!606165))

(assert (=> b!631774 m!606135))

(declare-fun m!606167 () Bool)

(assert (=> b!631774 m!606167))

(check-sat (not b!631767) (not b!631774) (not b!631766) (not b!631771) (not b!631773) (not b!631769) (not b!631775) (not b!631777) (not start!57084))
(check-sat)
