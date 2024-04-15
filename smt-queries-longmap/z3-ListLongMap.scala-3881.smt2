; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53280 () Bool)

(assert start!53280)

(declare-fun b!579239 () Bool)

(declare-fun res!367201 () Bool)

(declare-fun e!332849 () Bool)

(assert (=> b!579239 (=> (not res!367201) (not e!332849))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579239 (= res!367201 (validKeyInArray!0 k0!1786))))

(declare-fun b!579240 () Bool)

(declare-fun res!367197 () Bool)

(declare-fun e!332850 () Bool)

(assert (=> b!579240 (=> (not res!367197) (not e!332850))))

(declare-datatypes ((array!36195 0))(
  ( (array!36196 (arr!17372 (Array (_ BitVec 32) (_ BitVec 64))) (size!17737 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36195)

(declare-datatypes ((List!11452 0))(
  ( (Nil!11449) (Cons!11448 (h!12493 (_ BitVec 64)) (t!17671 List!11452)) )
))
(declare-fun arrayNoDuplicates!0 (array!36195 (_ BitVec 32) List!11452) Bool)

(assert (=> b!579240 (= res!367197 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11449))))

(declare-fun b!579241 () Bool)

(declare-fun res!367203 () Bool)

(assert (=> b!579241 (=> (not res!367203) (not e!332849))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579241 (= res!367203 (and (= (size!17737 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17737 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17737 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579242 () Bool)

(assert (=> b!579242 (= e!332850 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5809 0))(
  ( (MissingZero!5809 (index!25463 (_ BitVec 32))) (Found!5809 (index!25464 (_ BitVec 32))) (Intermediate!5809 (undefined!6621 Bool) (index!25465 (_ BitVec 32)) (x!54361 (_ BitVec 32))) (Undefined!5809) (MissingVacant!5809 (index!25466 (_ BitVec 32))) )
))
(declare-fun lt!264264 () SeekEntryResult!5809)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36195 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!579242 (= lt!264264 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17372 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579243 () Bool)

(declare-fun res!367202 () Bool)

(assert (=> b!579243 (=> (not res!367202) (not e!332849))))

(assert (=> b!579243 (= res!367202 (validKeyInArray!0 (select (arr!17372 a!2986) j!136)))))

(declare-fun res!367205 () Bool)

(assert (=> start!53280 (=> (not res!367205) (not e!332849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53280 (= res!367205 (validMask!0 mask!3053))))

(assert (=> start!53280 e!332849))

(assert (=> start!53280 true))

(declare-fun array_inv!13255 (array!36195) Bool)

(assert (=> start!53280 (array_inv!13255 a!2986)))

(declare-fun b!579244 () Bool)

(declare-fun res!367198 () Bool)

(assert (=> b!579244 (=> (not res!367198) (not e!332850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36195 (_ BitVec 32)) Bool)

(assert (=> b!579244 (= res!367198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579245 () Bool)

(assert (=> b!579245 (= e!332849 e!332850)))

(declare-fun res!367204 () Bool)

(assert (=> b!579245 (=> (not res!367204) (not e!332850))))

(declare-fun lt!264265 () SeekEntryResult!5809)

(assert (=> b!579245 (= res!367204 (or (= lt!264265 (MissingZero!5809 i!1108)) (= lt!264265 (MissingVacant!5809 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36195 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!579245 (= lt!264265 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579246 () Bool)

(declare-fun res!367199 () Bool)

(assert (=> b!579246 (=> (not res!367199) (not e!332849))))

(declare-fun arrayContainsKey!0 (array!36195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579246 (= res!367199 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579247 () Bool)

(declare-fun res!367200 () Bool)

(assert (=> b!579247 (=> (not res!367200) (not e!332850))))

(assert (=> b!579247 (= res!367200 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17372 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17372 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53280 res!367205) b!579241))

(assert (= (and b!579241 res!367203) b!579243))

(assert (= (and b!579243 res!367202) b!579239))

(assert (= (and b!579239 res!367201) b!579246))

(assert (= (and b!579246 res!367199) b!579245))

(assert (= (and b!579245 res!367204) b!579244))

(assert (= (and b!579244 res!367198) b!579240))

(assert (= (and b!579240 res!367197) b!579247))

(assert (= (and b!579247 res!367200) b!579242))

(declare-fun m!557341 () Bool)

(assert (=> b!579240 m!557341))

(declare-fun m!557343 () Bool)

(assert (=> b!579243 m!557343))

(assert (=> b!579243 m!557343))

(declare-fun m!557345 () Bool)

(assert (=> b!579243 m!557345))

(assert (=> b!579242 m!557343))

(assert (=> b!579242 m!557343))

(declare-fun m!557347 () Bool)

(assert (=> b!579242 m!557347))

(declare-fun m!557349 () Bool)

(assert (=> b!579247 m!557349))

(declare-fun m!557351 () Bool)

(assert (=> b!579247 m!557351))

(declare-fun m!557353 () Bool)

(assert (=> b!579247 m!557353))

(declare-fun m!557355 () Bool)

(assert (=> b!579246 m!557355))

(declare-fun m!557357 () Bool)

(assert (=> b!579245 m!557357))

(declare-fun m!557359 () Bool)

(assert (=> start!53280 m!557359))

(declare-fun m!557361 () Bool)

(assert (=> start!53280 m!557361))

(declare-fun m!557363 () Bool)

(assert (=> b!579244 m!557363))

(declare-fun m!557365 () Bool)

(assert (=> b!579239 m!557365))

(check-sat (not b!579243) (not b!579242) (not start!53280) (not b!579240) (not b!579239) (not b!579246) (not b!579244) (not b!579245))
(check-sat)
