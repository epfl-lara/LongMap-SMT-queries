; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56420 () Bool)

(assert start!56420)

(declare-fun b!625409 () Bool)

(declare-fun res!403415 () Bool)

(declare-fun e!358474 () Bool)

(assert (=> b!625409 (=> (not res!403415) (not e!358474))))

(declare-datatypes ((array!37800 0))(
  ( (array!37801 (arr!18143 (Array (_ BitVec 32) (_ BitVec 64))) (size!18507 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37800)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625409 (= res!403415 (validKeyInArray!0 (select (arr!18143 a!2986) j!136)))))

(declare-fun b!625410 () Bool)

(declare-fun res!403418 () Bool)

(assert (=> b!625410 (=> (not res!403418) (not e!358474))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!625410 (= res!403418 (validKeyInArray!0 k!1786))))

(declare-fun b!625412 () Bool)

(declare-fun res!403423 () Bool)

(assert (=> b!625412 (=> (not res!403423) (not e!358474))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625412 (= res!403423 (and (= (size!18507 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18507 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18507 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625413 () Bool)

(declare-fun res!403422 () Bool)

(declare-fun e!358475 () Bool)

(assert (=> b!625413 (=> (not res!403422) (not e!358475))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625413 (= res!403422 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18143 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18143 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625414 () Bool)

(assert (=> b!625414 (= e!358474 e!358475)))

(declare-fun res!403424 () Bool)

(assert (=> b!625414 (=> (not res!403424) (not e!358475))))

(declare-datatypes ((SeekEntryResult!6583 0))(
  ( (MissingZero!6583 (index!28616 (_ BitVec 32))) (Found!6583 (index!28617 (_ BitVec 32))) (Intermediate!6583 (undefined!7395 Bool) (index!28618 (_ BitVec 32)) (x!57365 (_ BitVec 32))) (Undefined!6583) (MissingVacant!6583 (index!28619 (_ BitVec 32))) )
))
(declare-fun lt!289819 () SeekEntryResult!6583)

(assert (=> b!625414 (= res!403424 (or (= lt!289819 (MissingZero!6583 i!1108)) (= lt!289819 (MissingVacant!6583 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37800 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!625414 (= lt!289819 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625415 () Bool)

(declare-fun res!403416 () Bool)

(assert (=> b!625415 (=> (not res!403416) (not e!358475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37800 (_ BitVec 32)) Bool)

(assert (=> b!625415 (= res!403416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625416 () Bool)

(declare-fun res!403420 () Bool)

(assert (=> b!625416 (=> (not res!403420) (not e!358474))))

(declare-fun arrayContainsKey!0 (array!37800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625416 (= res!403420 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625417 () Bool)

(declare-fun res!403417 () Bool)

(assert (=> b!625417 (=> (not res!403417) (not e!358475))))

(declare-datatypes ((List!12184 0))(
  ( (Nil!12181) (Cons!12180 (h!13225 (_ BitVec 64)) (t!18412 List!12184)) )
))
(declare-fun arrayNoDuplicates!0 (array!37800 (_ BitVec 32) List!12184) Bool)

(assert (=> b!625417 (= res!403417 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12181))))

(declare-fun b!625418 () Bool)

(assert (=> b!625418 (= e!358475 (and (bvslt x!910 #b01111111111111111111111111111110) (bvsge index!984 (size!18507 a!2986))))))

(declare-fun res!403421 () Bool)

(assert (=> start!56420 (=> (not res!403421) (not e!358474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56420 (= res!403421 (validMask!0 mask!3053))))

(assert (=> start!56420 e!358474))

(assert (=> start!56420 true))

(declare-fun array_inv!13939 (array!37800) Bool)

(assert (=> start!56420 (array_inv!13939 a!2986)))

(declare-fun b!625411 () Bool)

(declare-fun res!403419 () Bool)

(assert (=> b!625411 (=> (not res!403419) (not e!358475))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37800 (_ BitVec 32)) SeekEntryResult!6583)

(assert (=> b!625411 (= res!403419 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18143 a!2986) j!136) a!2986 mask!3053) (Found!6583 j!136)))))

(assert (= (and start!56420 res!403421) b!625412))

(assert (= (and b!625412 res!403423) b!625409))

(assert (= (and b!625409 res!403415) b!625410))

(assert (= (and b!625410 res!403418) b!625416))

(assert (= (and b!625416 res!403420) b!625414))

(assert (= (and b!625414 res!403424) b!625415))

(assert (= (and b!625415 res!403416) b!625417))

(assert (= (and b!625417 res!403417) b!625413))

(assert (= (and b!625413 res!403422) b!625411))

(assert (= (and b!625411 res!403419) b!625418))

(declare-fun m!600981 () Bool)

(assert (=> b!625415 m!600981))

(declare-fun m!600983 () Bool)

(assert (=> b!625414 m!600983))

(declare-fun m!600985 () Bool)

(assert (=> b!625417 m!600985))

(declare-fun m!600987 () Bool)

(assert (=> b!625409 m!600987))

(assert (=> b!625409 m!600987))

(declare-fun m!600989 () Bool)

(assert (=> b!625409 m!600989))

(declare-fun m!600991 () Bool)

(assert (=> b!625413 m!600991))

(declare-fun m!600993 () Bool)

(assert (=> b!625413 m!600993))

(declare-fun m!600995 () Bool)

(assert (=> b!625413 m!600995))

(declare-fun m!600997 () Bool)

(assert (=> b!625410 m!600997))

(declare-fun m!600999 () Bool)

(assert (=> start!56420 m!600999))

(declare-fun m!601001 () Bool)

(assert (=> start!56420 m!601001))

(assert (=> b!625411 m!600987))

(assert (=> b!625411 m!600987))

(declare-fun m!601003 () Bool)

(assert (=> b!625411 m!601003))

(declare-fun m!601005 () Bool)

(assert (=> b!625416 m!601005))

(push 1)

(assert (not b!625417))

(assert (not b!625416))

(assert (not b!625414))

(assert (not start!56420))

(assert (not b!625409))

(assert (not b!625411))

(assert (not b!625410))

(assert (not b!625415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

