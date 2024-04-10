; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57012 () Bool)

(assert start!57012)

(declare-fun b!631201 () Bool)

(declare-datatypes ((SeekEntryResult!6718 0))(
  ( (MissingZero!6718 (index!29162 (_ BitVec 32))) (Found!6718 (index!29163 (_ BitVec 32))) (Intermediate!6718 (undefined!7530 Bool) (index!29164 (_ BitVec 32)) (x!57896 (_ BitVec 32))) (Undefined!6718) (MissingVacant!6718 (index!29165 (_ BitVec 32))) )
))
(declare-fun lt!291603 () SeekEntryResult!6718)

(declare-fun e!360893 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38088 0))(
  ( (array!38089 (arr!18278 (Array (_ BitVec 32) (_ BitVec 64))) (size!18642 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38088)

(assert (=> b!631201 (= e!360893 (not (or (not (= lt!291603 (Found!6718 index!984))) (bvslt index!984 (size!18642 a!2986)))))))

(declare-datatypes ((Unit!21206 0))(
  ( (Unit!21207) )
))
(declare-fun lt!291607 () Unit!21206)

(declare-fun e!360897 () Unit!21206)

(assert (=> b!631201 (= lt!291607 e!360897)))

(declare-fun c!71903 () Bool)

(assert (=> b!631201 (= c!71903 (= lt!291603 Undefined!6718))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!291599 () array!38088)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!291601 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38088 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!631201 (= lt!291603 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291601 lt!291599 mask!3053))))

(declare-fun e!360891 () Bool)

(assert (=> b!631201 e!360891))

(declare-fun res!408134 () Bool)

(assert (=> b!631201 (=> (not res!408134) (not e!360891))))

(declare-fun lt!291602 () SeekEntryResult!6718)

(declare-fun lt!291606 () (_ BitVec 32))

(assert (=> b!631201 (= res!408134 (= lt!291602 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291606 vacantSpotIndex!68 lt!291601 lt!291599 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631201 (= lt!291602 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291606 vacantSpotIndex!68 (select (arr!18278 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!631201 (= lt!291601 (select (store (arr!18278 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291604 () Unit!21206)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38088 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21206)

(assert (=> b!631201 (= lt!291604 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291606 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631201 (= lt!291606 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631202 () Bool)

(declare-fun res!408133 () Bool)

(declare-fun e!360895 () Bool)

(assert (=> b!631202 (=> (not res!408133) (not e!360895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631202 (= res!408133 (validKeyInArray!0 (select (arr!18278 a!2986) j!136)))))

(declare-fun b!631203 () Bool)

(declare-fun res!408137 () Bool)

(assert (=> b!631203 (=> (not res!408137) (not e!360895))))

(assert (=> b!631203 (= res!408137 (and (= (size!18642 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18642 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18642 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631204 () Bool)

(declare-fun e!360896 () Bool)

(assert (=> b!631204 (= e!360896 e!360893)))

(declare-fun res!408136 () Bool)

(assert (=> b!631204 (=> (not res!408136) (not e!360893))))

(declare-fun lt!291605 () SeekEntryResult!6718)

(assert (=> b!631204 (= res!408136 (and (= lt!291605 (Found!6718 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18278 a!2986) index!984) (select (arr!18278 a!2986) j!136))) (not (= (select (arr!18278 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631204 (= lt!291605 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18278 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631205 () Bool)

(declare-fun res!408132 () Bool)

(declare-fun e!360892 () Bool)

(assert (=> b!631205 (=> (not res!408132) (not e!360892))))

(declare-datatypes ((List!12319 0))(
  ( (Nil!12316) (Cons!12315 (h!13360 (_ BitVec 64)) (t!18547 List!12319)) )
))
(declare-fun arrayNoDuplicates!0 (array!38088 (_ BitVec 32) List!12319) Bool)

(assert (=> b!631205 (= res!408132 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12316))))

(declare-fun b!631206 () Bool)

(declare-fun Unit!21208 () Unit!21206)

(assert (=> b!631206 (= e!360897 Unit!21208)))

(assert (=> b!631206 false))

(declare-fun b!631207 () Bool)

(declare-fun res!408129 () Bool)

(assert (=> b!631207 (=> (not res!408129) (not e!360892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38088 (_ BitVec 32)) Bool)

(assert (=> b!631207 (= res!408129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631208 () Bool)

(assert (=> b!631208 (= e!360891 (= lt!291605 lt!291602))))

(declare-fun b!631209 () Bool)

(assert (=> b!631209 (= e!360892 e!360896)))

(declare-fun res!408140 () Bool)

(assert (=> b!631209 (=> (not res!408140) (not e!360896))))

(assert (=> b!631209 (= res!408140 (= (select (store (arr!18278 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631209 (= lt!291599 (array!38089 (store (arr!18278 a!2986) i!1108 k!1786) (size!18642 a!2986)))))

(declare-fun b!631210 () Bool)

(declare-fun res!408138 () Bool)

(assert (=> b!631210 (=> (not res!408138) (not e!360895))))

(assert (=> b!631210 (= res!408138 (validKeyInArray!0 k!1786))))

(declare-fun res!408135 () Bool)

(assert (=> start!57012 (=> (not res!408135) (not e!360895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57012 (= res!408135 (validMask!0 mask!3053))))

(assert (=> start!57012 e!360895))

(assert (=> start!57012 true))

(declare-fun array_inv!14074 (array!38088) Bool)

(assert (=> start!57012 (array_inv!14074 a!2986)))

(declare-fun b!631211 () Bool)

(declare-fun res!408130 () Bool)

(assert (=> b!631211 (=> (not res!408130) (not e!360892))))

(assert (=> b!631211 (= res!408130 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18278 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631212 () Bool)

(declare-fun res!408139 () Bool)

(assert (=> b!631212 (=> (not res!408139) (not e!360895))))

(declare-fun arrayContainsKey!0 (array!38088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631212 (= res!408139 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631213 () Bool)

(assert (=> b!631213 (= e!360895 e!360892)))

(declare-fun res!408131 () Bool)

(assert (=> b!631213 (=> (not res!408131) (not e!360892))))

(declare-fun lt!291600 () SeekEntryResult!6718)

(assert (=> b!631213 (= res!408131 (or (= lt!291600 (MissingZero!6718 i!1108)) (= lt!291600 (MissingVacant!6718 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38088 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!631213 (= lt!291600 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631214 () Bool)

(declare-fun Unit!21209 () Unit!21206)

(assert (=> b!631214 (= e!360897 Unit!21209)))

(assert (= (and start!57012 res!408135) b!631203))

(assert (= (and b!631203 res!408137) b!631202))

(assert (= (and b!631202 res!408133) b!631210))

(assert (= (and b!631210 res!408138) b!631212))

(assert (= (and b!631212 res!408139) b!631213))

(assert (= (and b!631213 res!408131) b!631207))

(assert (= (and b!631207 res!408129) b!631205))

(assert (= (and b!631205 res!408132) b!631211))

(assert (= (and b!631211 res!408130) b!631209))

(assert (= (and b!631209 res!408140) b!631204))

(assert (= (and b!631204 res!408136) b!631201))

(assert (= (and b!631201 res!408134) b!631208))

(assert (= (and b!631201 c!71903) b!631206))

(assert (= (and b!631201 (not c!71903)) b!631214))

(declare-fun m!606143 () Bool)

(assert (=> b!631204 m!606143))

(declare-fun m!606145 () Bool)

(assert (=> b!631204 m!606145))

(assert (=> b!631204 m!606145))

(declare-fun m!606147 () Bool)

(assert (=> b!631204 m!606147))

(declare-fun m!606149 () Bool)

(assert (=> b!631211 m!606149))

(declare-fun m!606151 () Bool)

(assert (=> b!631201 m!606151))

(declare-fun m!606153 () Bool)

(assert (=> b!631201 m!606153))

(assert (=> b!631201 m!606145))

(declare-fun m!606155 () Bool)

(assert (=> b!631201 m!606155))

(declare-fun m!606157 () Bool)

(assert (=> b!631201 m!606157))

(declare-fun m!606159 () Bool)

(assert (=> b!631201 m!606159))

(declare-fun m!606161 () Bool)

(assert (=> b!631201 m!606161))

(assert (=> b!631201 m!606145))

(declare-fun m!606163 () Bool)

(assert (=> b!631201 m!606163))

(declare-fun m!606165 () Bool)

(assert (=> b!631210 m!606165))

(declare-fun m!606167 () Bool)

(assert (=> start!57012 m!606167))

(declare-fun m!606169 () Bool)

(assert (=> start!57012 m!606169))

(declare-fun m!606171 () Bool)

(assert (=> b!631205 m!606171))

(declare-fun m!606173 () Bool)

(assert (=> b!631213 m!606173))

(assert (=> b!631202 m!606145))

(assert (=> b!631202 m!606145))

(declare-fun m!606175 () Bool)

(assert (=> b!631202 m!606175))

(declare-fun m!606177 () Bool)

(assert (=> b!631212 m!606177))

(assert (=> b!631209 m!606155))

(declare-fun m!606179 () Bool)

(assert (=> b!631209 m!606179))

(declare-fun m!606181 () Bool)

(assert (=> b!631207 m!606181))

(push 1)

(assert (not start!57012))

(assert (not b!631210))

(assert (not b!631213))

(assert (not b!631202))

(assert (not b!631205))

(assert (not b!631204))

(assert (not b!631207))

(assert (not b!631212))

(assert (not b!631201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

