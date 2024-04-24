; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53478 () Bool)

(assert start!53478)

(declare-fun b!581503 () Bool)

(declare-fun res!369214 () Bool)

(declare-fun e!333747 () Bool)

(assert (=> b!581503 (=> (not res!369214) (not e!333747))))

(declare-datatypes ((array!36324 0))(
  ( (array!36325 (arr!17434 (Array (_ BitVec 32) (_ BitVec 64))) (size!17798 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36324)

(declare-datatypes ((List!11382 0))(
  ( (Nil!11379) (Cons!11378 (h!12426 (_ BitVec 64)) (t!17602 List!11382)) )
))
(declare-fun arrayNoDuplicates!0 (array!36324 (_ BitVec 32) List!11382) Bool)

(assert (=> b!581503 (= res!369214 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11379))))

(declare-fun b!581504 () Bool)

(declare-fun res!369219 () Bool)

(assert (=> b!581504 (=> (not res!369219) (not e!333747))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5830 0))(
  ( (MissingZero!5830 (index!25547 (_ BitVec 32))) (Found!5830 (index!25548 (_ BitVec 32))) (Intermediate!5830 (undefined!6642 Bool) (index!25549 (_ BitVec 32)) (x!54566 (_ BitVec 32))) (Undefined!5830) (MissingVacant!5830 (index!25550 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36324 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!581504 (= res!369219 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17434 a!2986) j!136) a!2986 mask!3053) (Found!5830 j!136)))))

(declare-fun b!581505 () Bool)

(declare-fun e!333745 () Bool)

(assert (=> b!581505 (= e!333745 e!333747)))

(declare-fun res!369220 () Bool)

(assert (=> b!581505 (=> (not res!369220) (not e!333747))))

(declare-fun lt!264994 () SeekEntryResult!5830)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581505 (= res!369220 (or (= lt!264994 (MissingZero!5830 i!1108)) (= lt!264994 (MissingVacant!5830 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36324 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!581505 (= lt!264994 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581506 () Bool)

(declare-fun res!369217 () Bool)

(assert (=> b!581506 (=> (not res!369217) (not e!333747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36324 (_ BitVec 32)) Bool)

(assert (=> b!581506 (= res!369217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581507 () Bool)

(assert (=> b!581507 (= e!333747 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17434 a!2986) index!984) (select (arr!17434 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581508 () Bool)

(declare-fun res!369221 () Bool)

(assert (=> b!581508 (=> (not res!369221) (not e!333745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581508 (= res!369221 (validKeyInArray!0 (select (arr!17434 a!2986) j!136)))))

(declare-fun b!581509 () Bool)

(declare-fun res!369218 () Bool)

(assert (=> b!581509 (=> (not res!369218) (not e!333745))))

(assert (=> b!581509 (= res!369218 (and (= (size!17798 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17798 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17798 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581510 () Bool)

(declare-fun res!369216 () Bool)

(assert (=> b!581510 (=> (not res!369216) (not e!333745))))

(assert (=> b!581510 (= res!369216 (validKeyInArray!0 k0!1786))))

(declare-fun b!581511 () Bool)

(declare-fun res!369223 () Bool)

(assert (=> b!581511 (=> (not res!369223) (not e!333745))))

(declare-fun arrayContainsKey!0 (array!36324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581511 (= res!369223 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581512 () Bool)

(declare-fun res!369215 () Bool)

(assert (=> b!581512 (=> (not res!369215) (not e!333747))))

(assert (=> b!581512 (= res!369215 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17434 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17434 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369222 () Bool)

(assert (=> start!53478 (=> (not res!369222) (not e!333745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53478 (= res!369222 (validMask!0 mask!3053))))

(assert (=> start!53478 e!333745))

(assert (=> start!53478 true))

(declare-fun array_inv!13293 (array!36324) Bool)

(assert (=> start!53478 (array_inv!13293 a!2986)))

(assert (= (and start!53478 res!369222) b!581509))

(assert (= (and b!581509 res!369218) b!581508))

(assert (= (and b!581508 res!369221) b!581510))

(assert (= (and b!581510 res!369216) b!581511))

(assert (= (and b!581511 res!369223) b!581505))

(assert (= (and b!581505 res!369220) b!581506))

(assert (= (and b!581506 res!369217) b!581503))

(assert (= (and b!581503 res!369214) b!581512))

(assert (= (and b!581512 res!369215) b!581504))

(assert (= (and b!581504 res!369219) b!581507))

(declare-fun m!560201 () Bool)

(assert (=> b!581507 m!560201))

(declare-fun m!560203 () Bool)

(assert (=> b!581507 m!560203))

(declare-fun m!560205 () Bool)

(assert (=> b!581510 m!560205))

(declare-fun m!560207 () Bool)

(assert (=> start!53478 m!560207))

(declare-fun m!560209 () Bool)

(assert (=> start!53478 m!560209))

(declare-fun m!560211 () Bool)

(assert (=> b!581505 m!560211))

(declare-fun m!560213 () Bool)

(assert (=> b!581512 m!560213))

(declare-fun m!560215 () Bool)

(assert (=> b!581512 m!560215))

(declare-fun m!560217 () Bool)

(assert (=> b!581512 m!560217))

(assert (=> b!581504 m!560203))

(assert (=> b!581504 m!560203))

(declare-fun m!560219 () Bool)

(assert (=> b!581504 m!560219))

(declare-fun m!560221 () Bool)

(assert (=> b!581511 m!560221))

(declare-fun m!560223 () Bool)

(assert (=> b!581506 m!560223))

(assert (=> b!581508 m!560203))

(assert (=> b!581508 m!560203))

(declare-fun m!560225 () Bool)

(assert (=> b!581508 m!560225))

(declare-fun m!560227 () Bool)

(assert (=> b!581503 m!560227))

(check-sat (not b!581506) (not b!581508) (not b!581503) (not b!581511) (not b!581510) (not b!581505) (not b!581504) (not start!53478))
(check-sat)
