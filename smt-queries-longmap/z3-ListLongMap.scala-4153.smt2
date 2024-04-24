; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56658 () Bool)

(assert start!56658)

(declare-fun b!627360 () Bool)

(declare-fun res!404963 () Bool)

(declare-fun e!359305 () Bool)

(assert (=> b!627360 (=> (not res!404963) (not e!359305))))

(declare-datatypes ((array!37893 0))(
  ( (array!37894 (arr!18184 (Array (_ BitVec 32) (_ BitVec 64))) (size!18548 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37893)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37893 (_ BitVec 32)) Bool)

(assert (=> b!627360 (= res!404963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627361 () Bool)

(declare-fun res!404955 () Bool)

(declare-fun e!359306 () Bool)

(assert (=> b!627361 (=> (not res!404955) (not e!359306))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627361 (= res!404955 (validKeyInArray!0 k0!1786))))

(declare-fun b!627362 () Bool)

(declare-fun res!404959 () Bool)

(assert (=> b!627362 (=> (not res!404959) (not e!359305))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6580 0))(
  ( (MissingZero!6580 (index!28604 (_ BitVec 32))) (Found!6580 (index!28605 (_ BitVec 32))) (Intermediate!6580 (undefined!7392 Bool) (index!28606 (_ BitVec 32)) (x!57499 (_ BitVec 32))) (Undefined!6580) (MissingVacant!6580 (index!28607 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37893 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!627362 (= res!404959 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18184 a!2986) j!136) a!2986 mask!3053) (Found!6580 j!136)))))

(declare-fun b!627363 () Bool)

(assert (=> b!627363 (= e!359305 false)))

(declare-fun lt!290328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627363 (= lt!290328 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!627364 () Bool)

(assert (=> b!627364 (= e!359306 e!359305)))

(declare-fun res!404964 () Bool)

(assert (=> b!627364 (=> (not res!404964) (not e!359305))))

(declare-fun lt!290329 () SeekEntryResult!6580)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627364 (= res!404964 (or (= lt!290329 (MissingZero!6580 i!1108)) (= lt!290329 (MissingVacant!6580 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37893 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!627364 (= lt!290329 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627365 () Bool)

(declare-fun res!404957 () Bool)

(assert (=> b!627365 (=> (not res!404957) (not e!359306))))

(declare-fun arrayContainsKey!0 (array!37893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627365 (= res!404957 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627366 () Bool)

(declare-fun res!404956 () Bool)

(assert (=> b!627366 (=> (not res!404956) (not e!359306))))

(assert (=> b!627366 (= res!404956 (and (= (size!18548 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18548 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18548 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627367 () Bool)

(declare-fun res!404958 () Bool)

(assert (=> b!627367 (=> (not res!404958) (not e!359305))))

(assert (=> b!627367 (= res!404958 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18184 a!2986) index!984) (select (arr!18184 a!2986) j!136))) (not (= (select (arr!18184 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!404961 () Bool)

(assert (=> start!56658 (=> (not res!404961) (not e!359306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56658 (= res!404961 (validMask!0 mask!3053))))

(assert (=> start!56658 e!359306))

(assert (=> start!56658 true))

(declare-fun array_inv!14043 (array!37893) Bool)

(assert (=> start!56658 (array_inv!14043 a!2986)))

(declare-fun b!627368 () Bool)

(declare-fun res!404965 () Bool)

(assert (=> b!627368 (=> (not res!404965) (not e!359306))))

(assert (=> b!627368 (= res!404965 (validKeyInArray!0 (select (arr!18184 a!2986) j!136)))))

(declare-fun b!627369 () Bool)

(declare-fun res!404960 () Bool)

(assert (=> b!627369 (=> (not res!404960) (not e!359305))))

(declare-datatypes ((List!12132 0))(
  ( (Nil!12129) (Cons!12128 (h!13176 (_ BitVec 64)) (t!18352 List!12132)) )
))
(declare-fun arrayNoDuplicates!0 (array!37893 (_ BitVec 32) List!12132) Bool)

(assert (=> b!627369 (= res!404960 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12129))))

(declare-fun b!627370 () Bool)

(declare-fun res!404962 () Bool)

(assert (=> b!627370 (=> (not res!404962) (not e!359305))))

(assert (=> b!627370 (= res!404962 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18184 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18184 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56658 res!404961) b!627366))

(assert (= (and b!627366 res!404956) b!627368))

(assert (= (and b!627368 res!404965) b!627361))

(assert (= (and b!627361 res!404955) b!627365))

(assert (= (and b!627365 res!404957) b!627364))

(assert (= (and b!627364 res!404964) b!627360))

(assert (= (and b!627360 res!404963) b!627369))

(assert (= (and b!627369 res!404960) b!627370))

(assert (= (and b!627370 res!404962) b!627362))

(assert (= (and b!627362 res!404959) b!627367))

(assert (= (and b!627367 res!404958) b!627363))

(declare-fun m!602977 () Bool)

(assert (=> b!627361 m!602977))

(declare-fun m!602979 () Bool)

(assert (=> start!56658 m!602979))

(declare-fun m!602981 () Bool)

(assert (=> start!56658 m!602981))

(declare-fun m!602983 () Bool)

(assert (=> b!627367 m!602983))

(declare-fun m!602985 () Bool)

(assert (=> b!627367 m!602985))

(declare-fun m!602987 () Bool)

(assert (=> b!627370 m!602987))

(declare-fun m!602989 () Bool)

(assert (=> b!627370 m!602989))

(declare-fun m!602991 () Bool)

(assert (=> b!627370 m!602991))

(assert (=> b!627362 m!602985))

(assert (=> b!627362 m!602985))

(declare-fun m!602993 () Bool)

(assert (=> b!627362 m!602993))

(declare-fun m!602995 () Bool)

(assert (=> b!627360 m!602995))

(declare-fun m!602997 () Bool)

(assert (=> b!627369 m!602997))

(declare-fun m!602999 () Bool)

(assert (=> b!627363 m!602999))

(declare-fun m!603001 () Bool)

(assert (=> b!627364 m!603001))

(declare-fun m!603003 () Bool)

(assert (=> b!627365 m!603003))

(assert (=> b!627368 m!602985))

(assert (=> b!627368 m!602985))

(declare-fun m!603005 () Bool)

(assert (=> b!627368 m!603005))

(check-sat (not b!627364) (not b!627360) (not b!627365) (not b!627363) (not b!627368) (not start!56658) (not b!627369) (not b!627361) (not b!627362))
(check-sat)
