; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56636 () Bool)

(assert start!56636)

(declare-fun b!627646 () Bool)

(declare-fun res!405350 () Bool)

(declare-fun e!359312 () Bool)

(assert (=> b!627646 (=> (not res!405350) (not e!359312))))

(declare-datatypes ((array!37928 0))(
  ( (array!37929 (arr!18204 (Array (_ BitVec 32) (_ BitVec 64))) (size!18568 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37928)

(declare-datatypes ((List!12245 0))(
  ( (Nil!12242) (Cons!12241 (h!13286 (_ BitVec 64)) (t!18473 List!12245)) )
))
(declare-fun arrayNoDuplicates!0 (array!37928 (_ BitVec 32) List!12245) Bool)

(assert (=> b!627646 (= res!405350 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12242))))

(declare-fun b!627647 () Bool)

(declare-fun res!405356 () Bool)

(assert (=> b!627647 (=> (not res!405356) (not e!359312))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6644 0))(
  ( (MissingZero!6644 (index!28860 (_ BitVec 32))) (Found!6644 (index!28861 (_ BitVec 32))) (Intermediate!6644 (undefined!7456 Bool) (index!28862 (_ BitVec 32)) (x!57600 (_ BitVec 32))) (Undefined!6644) (MissingVacant!6644 (index!28863 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37928 (_ BitVec 32)) SeekEntryResult!6644)

(assert (=> b!627647 (= res!405356 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18204 a!2986) j!136) a!2986 mask!3053) (Found!6644 j!136)))))

(declare-fun b!627648 () Bool)

(declare-fun res!405351 () Bool)

(declare-fun e!359311 () Bool)

(assert (=> b!627648 (=> (not res!405351) (not e!359311))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627648 (= res!405351 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627649 () Bool)

(assert (=> b!627649 (= e!359312 false)))

(declare-fun lt!290316 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627649 (= lt!290316 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627650 () Bool)

(declare-fun res!405347 () Bool)

(assert (=> b!627650 (=> (not res!405347) (not e!359311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627650 (= res!405347 (validKeyInArray!0 k!1786))))

(declare-fun b!627651 () Bool)

(assert (=> b!627651 (= e!359311 e!359312)))

(declare-fun res!405353 () Bool)

(assert (=> b!627651 (=> (not res!405353) (not e!359312))))

(declare-fun lt!290317 () SeekEntryResult!6644)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627651 (= res!405353 (or (= lt!290317 (MissingZero!6644 i!1108)) (= lt!290317 (MissingVacant!6644 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37928 (_ BitVec 32)) SeekEntryResult!6644)

(assert (=> b!627651 (= lt!290317 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!405349 () Bool)

(assert (=> start!56636 (=> (not res!405349) (not e!359311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56636 (= res!405349 (validMask!0 mask!3053))))

(assert (=> start!56636 e!359311))

(assert (=> start!56636 true))

(declare-fun array_inv!14000 (array!37928) Bool)

(assert (=> start!56636 (array_inv!14000 a!2986)))

(declare-fun b!627652 () Bool)

(declare-fun res!405352 () Bool)

(assert (=> b!627652 (=> (not res!405352) (not e!359311))))

(assert (=> b!627652 (= res!405352 (and (= (size!18568 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18568 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18568 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627653 () Bool)

(declare-fun res!405346 () Bool)

(assert (=> b!627653 (=> (not res!405346) (not e!359311))))

(assert (=> b!627653 (= res!405346 (validKeyInArray!0 (select (arr!18204 a!2986) j!136)))))

(declare-fun b!627654 () Bool)

(declare-fun res!405348 () Bool)

(assert (=> b!627654 (=> (not res!405348) (not e!359312))))

(assert (=> b!627654 (= res!405348 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18204 a!2986) index!984) (select (arr!18204 a!2986) j!136))) (not (= (select (arr!18204 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627655 () Bool)

(declare-fun res!405355 () Bool)

(assert (=> b!627655 (=> (not res!405355) (not e!359312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37928 (_ BitVec 32)) Bool)

(assert (=> b!627655 (= res!405355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627656 () Bool)

(declare-fun res!405354 () Bool)

(assert (=> b!627656 (=> (not res!405354) (not e!359312))))

(assert (=> b!627656 (= res!405354 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18204 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18204 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56636 res!405349) b!627652))

(assert (= (and b!627652 res!405352) b!627653))

(assert (= (and b!627653 res!405346) b!627650))

(assert (= (and b!627650 res!405347) b!627648))

(assert (= (and b!627648 res!405351) b!627651))

(assert (= (and b!627651 res!405353) b!627655))

(assert (= (and b!627655 res!405355) b!627646))

(assert (= (and b!627646 res!405350) b!627656))

(assert (= (and b!627656 res!405354) b!627647))

(assert (= (and b!627647 res!405356) b!627654))

(assert (= (and b!627654 res!405348) b!627649))

(declare-fun m!602937 () Bool)

(assert (=> b!627647 m!602937))

(assert (=> b!627647 m!602937))

(declare-fun m!602939 () Bool)

(assert (=> b!627647 m!602939))

(assert (=> b!627653 m!602937))

(assert (=> b!627653 m!602937))

(declare-fun m!602941 () Bool)

(assert (=> b!627653 m!602941))

(declare-fun m!602943 () Bool)

(assert (=> b!627654 m!602943))

(assert (=> b!627654 m!602937))

(declare-fun m!602945 () Bool)

(assert (=> b!627656 m!602945))

(declare-fun m!602947 () Bool)

(assert (=> b!627656 m!602947))

(declare-fun m!602949 () Bool)

(assert (=> b!627656 m!602949))

(declare-fun m!602951 () Bool)

(assert (=> b!627650 m!602951))

(declare-fun m!602953 () Bool)

(assert (=> b!627651 m!602953))

(declare-fun m!602955 () Bool)

(assert (=> start!56636 m!602955))

(declare-fun m!602957 () Bool)

(assert (=> start!56636 m!602957))

(declare-fun m!602959 () Bool)

(assert (=> b!627655 m!602959))

(declare-fun m!602961 () Bool)

(assert (=> b!627646 m!602961))

(declare-fun m!602963 () Bool)

(assert (=> b!627649 m!602963))

(declare-fun m!602965 () Bool)

(assert (=> b!627648 m!602965))

(push 1)

