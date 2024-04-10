; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57276 () Bool)

(assert start!57276)

(declare-fun b!634189 () Bool)

(declare-fun e!362644 () Bool)

(declare-fun e!362639 () Bool)

(assert (=> b!634189 (= e!362644 e!362639)))

(declare-fun res!410258 () Bool)

(assert (=> b!634189 (=> (not res!410258) (not e!362639))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38186 0))(
  ( (array!38187 (arr!18323 (Array (_ BitVec 32) (_ BitVec 64))) (size!18687 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38186)

(declare-fun lt!293185 () array!38186)

(declare-fun arrayContainsKey!0 (array!38186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634189 (= res!410258 (arrayContainsKey!0 lt!293185 (select (arr!18323 a!2986) j!136) j!136))))

(declare-fun b!634190 () Bool)

(declare-fun e!362645 () Bool)

(declare-fun e!362641 () Bool)

(assert (=> b!634190 (= e!362645 (not e!362641))))

(declare-fun res!410264 () Bool)

(assert (=> b!634190 (=> res!410264 e!362641)))

(declare-datatypes ((SeekEntryResult!6763 0))(
  ( (MissingZero!6763 (index!29351 (_ BitVec 32))) (Found!6763 (index!29352 (_ BitVec 32))) (Intermediate!6763 (undefined!7575 Bool) (index!29353 (_ BitVec 32)) (x!58088 (_ BitVec 32))) (Undefined!6763) (MissingVacant!6763 (index!29354 (_ BitVec 32))) )
))
(declare-fun lt!293188 () SeekEntryResult!6763)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634190 (= res!410264 (not (= lt!293188 (Found!6763 index!984))))))

(declare-datatypes ((Unit!21386 0))(
  ( (Unit!21387) )
))
(declare-fun lt!293191 () Unit!21386)

(declare-fun e!362649 () Unit!21386)

(assert (=> b!634190 (= lt!293191 e!362649)))

(declare-fun c!72332 () Bool)

(assert (=> b!634190 (= c!72332 (= lt!293188 Undefined!6763))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!293183 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38186 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!634190 (= lt!293188 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293183 lt!293185 mask!3053))))

(declare-fun e!362643 () Bool)

(assert (=> b!634190 e!362643))

(declare-fun res!410262 () Bool)

(assert (=> b!634190 (=> (not res!410262) (not e!362643))))

(declare-fun lt!293190 () SeekEntryResult!6763)

(declare-fun lt!293189 () (_ BitVec 32))

(assert (=> b!634190 (= res!410262 (= lt!293190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293189 vacantSpotIndex!68 lt!293183 lt!293185 mask!3053)))))

(assert (=> b!634190 (= lt!293190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293189 vacantSpotIndex!68 (select (arr!18323 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!634190 (= lt!293183 (select (store (arr!18323 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293187 () Unit!21386)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38186 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21386)

(assert (=> b!634190 (= lt!293187 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293189 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634190 (= lt!293189 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634191 () Bool)

(declare-fun e!362647 () Bool)

(declare-fun e!362646 () Bool)

(assert (=> b!634191 (= e!362647 e!362646)))

(declare-fun res!410263 () Bool)

(assert (=> b!634191 (=> (not res!410263) (not e!362646))))

(declare-fun lt!293186 () SeekEntryResult!6763)

(assert (=> b!634191 (= res!410263 (or (= lt!293186 (MissingZero!6763 i!1108)) (= lt!293186 (MissingVacant!6763 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38186 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!634191 (= lt!293186 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634192 () Bool)

(declare-fun res!410261 () Bool)

(assert (=> b!634192 (=> (not res!410261) (not e!362647))))

(assert (=> b!634192 (= res!410261 (and (= (size!18687 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18687 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18687 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!293182 () (_ BitVec 64))

(declare-fun b!634193 () Bool)

(assert (=> b!634193 (= e!362641 (or (not (= (select (arr!18323 a!2986) j!136) lt!293183)) (not (= (select (arr!18323 a!2986) j!136) lt!293182)) (bvsge j!136 index!984) (bvsge index!984 (size!18687 a!2986)) (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (size!18687 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!362648 () Bool)

(assert (=> b!634193 e!362648))

(declare-fun res!410271 () Bool)

(assert (=> b!634193 (=> (not res!410271) (not e!362648))))

(assert (=> b!634193 (= res!410271 (= lt!293182 (select (arr!18323 a!2986) j!136)))))

(assert (=> b!634193 (= lt!293182 (select (store (arr!18323 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634194 () Bool)

(declare-fun res!410273 () Bool)

(assert (=> b!634194 (=> (not res!410273) (not e!362647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634194 (= res!410273 (validKeyInArray!0 k!1786))))

(declare-fun b!634195 () Bool)

(declare-fun res!410259 () Bool)

(assert (=> b!634195 (=> (not res!410259) (not e!362646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38186 (_ BitVec 32)) Bool)

(assert (=> b!634195 (= res!410259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634196 () Bool)

(declare-fun Unit!21388 () Unit!21386)

(assert (=> b!634196 (= e!362649 Unit!21388)))

(declare-fun b!634197 () Bool)

(declare-fun res!410267 () Bool)

(assert (=> b!634197 (=> (not res!410267) (not e!362647))))

(assert (=> b!634197 (= res!410267 (validKeyInArray!0 (select (arr!18323 a!2986) j!136)))))

(declare-fun b!634198 () Bool)

(declare-fun lt!293184 () SeekEntryResult!6763)

(assert (=> b!634198 (= e!362643 (= lt!293184 lt!293190))))

(declare-fun res!410266 () Bool)

(assert (=> start!57276 (=> (not res!410266) (not e!362647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57276 (= res!410266 (validMask!0 mask!3053))))

(assert (=> start!57276 e!362647))

(assert (=> start!57276 true))

(declare-fun array_inv!14119 (array!38186) Bool)

(assert (=> start!57276 (array_inv!14119 a!2986)))

(declare-fun b!634188 () Bool)

(declare-fun res!410268 () Bool)

(assert (=> b!634188 (=> (not res!410268) (not e!362647))))

(assert (=> b!634188 (= res!410268 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634199 () Bool)

(declare-fun res!410265 () Bool)

(assert (=> b!634199 (=> (not res!410265) (not e!362646))))

(declare-datatypes ((List!12364 0))(
  ( (Nil!12361) (Cons!12360 (h!13405 (_ BitVec 64)) (t!18592 List!12364)) )
))
(declare-fun arrayNoDuplicates!0 (array!38186 (_ BitVec 32) List!12364) Bool)

(assert (=> b!634199 (= res!410265 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12361))))

(declare-fun b!634200 () Bool)

(declare-fun Unit!21389 () Unit!21386)

(assert (=> b!634200 (= e!362649 Unit!21389)))

(assert (=> b!634200 false))

(declare-fun b!634201 () Bool)

(declare-fun e!362642 () Bool)

(assert (=> b!634201 (= e!362642 e!362645)))

(declare-fun res!410260 () Bool)

(assert (=> b!634201 (=> (not res!410260) (not e!362645))))

(assert (=> b!634201 (= res!410260 (and (= lt!293184 (Found!6763 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18323 a!2986) index!984) (select (arr!18323 a!2986) j!136))) (not (= (select (arr!18323 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634201 (= lt!293184 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18323 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634202 () Bool)

(assert (=> b!634202 (= e!362648 e!362644)))

(declare-fun res!410270 () Bool)

(assert (=> b!634202 (=> res!410270 e!362644)))

(assert (=> b!634202 (= res!410270 (or (not (= (select (arr!18323 a!2986) j!136) lt!293183)) (not (= (select (arr!18323 a!2986) j!136) lt!293182)) (bvsge j!136 index!984)))))

(declare-fun b!634203 () Bool)

(declare-fun res!410272 () Bool)

(assert (=> b!634203 (=> (not res!410272) (not e!362646))))

(assert (=> b!634203 (= res!410272 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18323 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634204 () Bool)

(assert (=> b!634204 (= e!362646 e!362642)))

(declare-fun res!410269 () Bool)

(assert (=> b!634204 (=> (not res!410269) (not e!362642))))

(assert (=> b!634204 (= res!410269 (= (select (store (arr!18323 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634204 (= lt!293185 (array!38187 (store (arr!18323 a!2986) i!1108 k!1786) (size!18687 a!2986)))))

(declare-fun b!634205 () Bool)

(assert (=> b!634205 (= e!362639 (arrayContainsKey!0 lt!293185 (select (arr!18323 a!2986) j!136) index!984))))

(assert (= (and start!57276 res!410266) b!634192))

(assert (= (and b!634192 res!410261) b!634197))

(assert (= (and b!634197 res!410267) b!634194))

(assert (= (and b!634194 res!410273) b!634188))

(assert (= (and b!634188 res!410268) b!634191))

(assert (= (and b!634191 res!410263) b!634195))

(assert (= (and b!634195 res!410259) b!634199))

(assert (= (and b!634199 res!410265) b!634203))

(assert (= (and b!634203 res!410272) b!634204))

(assert (= (and b!634204 res!410269) b!634201))

(assert (= (and b!634201 res!410260) b!634190))

(assert (= (and b!634190 res!410262) b!634198))

(assert (= (and b!634190 c!72332) b!634200))

(assert (= (and b!634190 (not c!72332)) b!634196))

(assert (= (and b!634190 (not res!410264)) b!634193))

(assert (= (and b!634193 res!410271) b!634202))

(assert (= (and b!634202 (not res!410270)) b!634189))

(assert (= (and b!634189 res!410258) b!634205))

(declare-fun m!608731 () Bool)

(assert (=> b!634197 m!608731))

(assert (=> b!634197 m!608731))

(declare-fun m!608733 () Bool)

(assert (=> b!634197 m!608733))

(declare-fun m!608735 () Bool)

(assert (=> b!634191 m!608735))

(declare-fun m!608737 () Bool)

(assert (=> b!634195 m!608737))

(assert (=> b!634202 m!608731))

(declare-fun m!608739 () Bool)

(assert (=> b!634201 m!608739))

(assert (=> b!634201 m!608731))

(assert (=> b!634201 m!608731))

(declare-fun m!608741 () Bool)

(assert (=> b!634201 m!608741))

(declare-fun m!608743 () Bool)

(assert (=> start!57276 m!608743))

(declare-fun m!608745 () Bool)

(assert (=> start!57276 m!608745))

(declare-fun m!608747 () Bool)

(assert (=> b!634188 m!608747))

(declare-fun m!608749 () Bool)

(assert (=> b!634204 m!608749))

(declare-fun m!608751 () Bool)

(assert (=> b!634204 m!608751))

(assert (=> b!634193 m!608731))

(assert (=> b!634193 m!608749))

(declare-fun m!608753 () Bool)

(assert (=> b!634193 m!608753))

(declare-fun m!608755 () Bool)

(assert (=> b!634190 m!608755))

(declare-fun m!608757 () Bool)

(assert (=> b!634190 m!608757))

(declare-fun m!608759 () Bool)

(assert (=> b!634190 m!608759))

(assert (=> b!634190 m!608731))

(assert (=> b!634190 m!608749))

(assert (=> b!634190 m!608731))

(declare-fun m!608761 () Bool)

(assert (=> b!634190 m!608761))

(declare-fun m!608763 () Bool)

(assert (=> b!634190 m!608763))

(declare-fun m!608765 () Bool)

(assert (=> b!634190 m!608765))

(assert (=> b!634205 m!608731))

(assert (=> b!634205 m!608731))

(declare-fun m!608767 () Bool)

(assert (=> b!634205 m!608767))

(declare-fun m!608769 () Bool)

(assert (=> b!634194 m!608769))

(assert (=> b!634189 m!608731))

(assert (=> b!634189 m!608731))

(declare-fun m!608771 () Bool)

(assert (=> b!634189 m!608771))

(declare-fun m!608773 () Bool)

(assert (=> b!634203 m!608773))

(declare-fun m!608775 () Bool)

(assert (=> b!634199 m!608775))

(push 1)

(assert (not start!57276))

(assert (not b!634188))

(assert (not b!634191))

(assert (not b!634201))

(assert (not b!634197))

(assert (not b!634190))

(assert (not b!634189))

(assert (not b!634195))

(assert (not b!634205))

(assert (not b!634199))

(assert (not b!634194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89619 () Bool)

(assert (=> d!89619 (= (validKeyInArray!0 (select (arr!18323 a!2986) j!136)) (and (not (= (select (arr!18323 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18323 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634197 d!89619))

(declare-fun d!89621 () Bool)

(assert (=> d!89621 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57276 d!89621))

(declare-fun d!89633 () Bool)

(assert (=> d!89633 (= (array_inv!14119 a!2986) (bvsge (size!18687 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57276 d!89633))

(declare-fun b!634345 () Bool)

(declare-fun e!362746 () SeekEntryResult!6763)

(declare-fun lt!293241 () SeekEntryResult!6763)

(assert (=> b!634345 (= e!362746 (MissingZero!6763 (index!29353 lt!293241)))))

(declare-fun b!634346 () Bool)

(declare-fun e!362744 () SeekEntryResult!6763)

(assert (=> b!634346 (= e!362744 Undefined!6763)))

(declare-fun b!634347 () Bool)

(declare-fun e!362745 () SeekEntryResult!6763)

(assert (=> b!634347 (= e!362745 (Found!6763 (index!29353 lt!293241)))))

(declare-fun b!634348 () Bool)

(declare-fun c!72379 () Bool)

(declare-fun lt!293242 () (_ BitVec 64))

(assert (=> b!634348 (= c!72379 (= lt!293242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634348 (= e!362745 e!362746)))

(declare-fun b!634349 () Bool)

(assert (=> b!634349 (= e!362744 e!362745)))

(assert (=> b!634349 (= lt!293242 (select (arr!18323 a!2986) (index!29353 lt!293241)))))

(declare-fun c!72378 () Bool)

(assert (=> b!634349 (= c!72378 (= lt!293242 k!1786))))

(declare-fun d!89635 () Bool)

(declare-fun lt!293240 () SeekEntryResult!6763)

(assert (=> d!89635 (and (or (is-Undefined!6763 lt!293240) (not (is-Found!6763 lt!293240)) (and (bvsge (index!29352 lt!293240) #b00000000000000000000000000000000) (bvslt (index!29352 lt!293240) (size!18687 a!2986)))) (or (is-Undefined!6763 lt!293240) (is-Found!6763 lt!293240) (not (is-MissingZero!6763 lt!293240)) (and (bvsge (index!29351 lt!293240) #b00000000000000000000000000000000) (bvslt (index!29351 lt!293240) (size!18687 a!2986)))) (or (is-Undefined!6763 lt!293240) (is-Found!6763 lt!293240) (is-MissingZero!6763 lt!293240) (not (is-MissingVacant!6763 lt!293240)) (and (bvsge (index!29354 lt!293240) #b00000000000000000000000000000000) (bvslt (index!29354 lt!293240) (size!18687 a!2986)))) (or (is-Undefined!6763 lt!293240) (ite (is-Found!6763 lt!293240) (= (select (arr!18323 a!2986) (index!29352 lt!293240)) k!1786) (ite (is-MissingZero!6763 lt!293240) (= (select (arr!18323 a!2986) (index!29351 lt!293240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6763 lt!293240) (= (select (arr!18323 a!2986) (index!29354 lt!293240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89635 (= lt!293240 e!362744)))

(declare-fun c!72380 () Bool)

(assert (=> d!89635 (= c!72380 (and (is-Intermediate!6763 lt!293241) (undefined!7575 lt!293241)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38186 (_ BitVec 32)) SeekEntryResult!6763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89635 (= lt!293241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89635 (validMask!0 mask!3053)))

(assert (=> d!89635 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!293240)))

(declare-fun b!634350 () Bool)

(assert (=> b!634350 (= e!362746 (seekKeyOrZeroReturnVacant!0 (x!58088 lt!293241) (index!29353 lt!293241) (index!29353 lt!293241) k!1786 a!2986 mask!3053))))

(assert (= (and d!89635 c!72380) b!634346))

(assert (= (and d!89635 (not c!72380)) b!634349))

(assert (= (and b!634349 c!72378) b!634347))

(assert (= (and b!634349 (not c!72378)) b!634348))

(assert (= (and b!634348 c!72379) b!634345))

(assert (= (and b!634348 (not c!72379)) b!634350))

(declare-fun m!608857 () Bool)

(assert (=> b!634349 m!608857))

(assert (=> d!89635 m!608743))

(declare-fun m!608859 () Bool)

(assert (=> d!89635 m!608859))

(declare-fun m!608861 () Bool)

(assert (=> d!89635 m!608861))

(declare-fun m!608863 () Bool)

(assert (=> d!89635 m!608863))

(declare-fun m!608865 () Bool)

(assert (=> d!89635 m!608865))

(assert (=> d!89635 m!608861))

(declare-fun m!608867 () Bool)

(assert (=> d!89635 m!608867))

(declare-fun m!608869 () Bool)

(assert (=> b!634350 m!608869))

(assert (=> b!634191 d!89635))

(declare-fun b!634381 () Bool)

(declare-fun e!362764 () SeekEntryResult!6763)

(assert (=> b!634381 (= e!362764 (MissingVacant!6763 vacantSpotIndex!68))))

(declare-fun b!634382 () Bool)

(declare-fun e!362765 () SeekEntryResult!6763)

(assert (=> b!634382 (= e!362765 Undefined!6763)))

(declare-fun b!634383 () Bool)

(declare-fun c!72398 () Bool)

(declare-fun lt!293262 () (_ BitVec 64))

(assert (=> b!634383 (= c!72398 (= lt!293262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362766 () SeekEntryResult!6763)

(assert (=> b!634383 (= e!362766 e!362764)))

(declare-fun b!634384 () Bool)

(assert (=> b!634384 (= e!362764 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18323 a!2986) j!136) a!2986 mask!3053))))

