; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56614 () Bool)

(assert start!56614)

(declare-fun b!627284 () Bool)

(declare-fun e!359213 () Bool)

(assert (=> b!627284 (= e!359213 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290251 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627284 (= lt!290251 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627285 () Bool)

(declare-fun res!404987 () Bool)

(assert (=> b!627285 (=> (not res!404987) (not e!359213))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37906 0))(
  ( (array!37907 (arr!18193 (Array (_ BitVec 32) (_ BitVec 64))) (size!18557 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37906)

(declare-datatypes ((SeekEntryResult!6633 0))(
  ( (MissingZero!6633 (index!28816 (_ BitVec 32))) (Found!6633 (index!28817 (_ BitVec 32))) (Intermediate!6633 (undefined!7445 Bool) (index!28818 (_ BitVec 32)) (x!57557 (_ BitVec 32))) (Undefined!6633) (MissingVacant!6633 (index!28819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37906 (_ BitVec 32)) SeekEntryResult!6633)

(assert (=> b!627285 (= res!404987 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18193 a!2986) j!136) a!2986 mask!3053) (Found!6633 j!136)))))

(declare-fun b!627286 () Bool)

(declare-fun res!404986 () Bool)

(declare-fun e!359212 () Bool)

(assert (=> b!627286 (=> (not res!404986) (not e!359212))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627286 (= res!404986 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627287 () Bool)

(declare-fun res!404990 () Bool)

(assert (=> b!627287 (=> (not res!404990) (not e!359213))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627287 (= res!404990 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18193 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18193 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627288 () Bool)

(declare-fun res!404984 () Bool)

(assert (=> b!627288 (=> (not res!404984) (not e!359212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627288 (= res!404984 (validKeyInArray!0 k0!1786))))

(declare-fun b!627289 () Bool)

(declare-fun res!404993 () Bool)

(assert (=> b!627289 (=> (not res!404993) (not e!359212))))

(assert (=> b!627289 (= res!404993 (and (= (size!18557 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18557 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18557 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!404991 () Bool)

(assert (=> start!56614 (=> (not res!404991) (not e!359212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56614 (= res!404991 (validMask!0 mask!3053))))

(assert (=> start!56614 e!359212))

(assert (=> start!56614 true))

(declare-fun array_inv!13989 (array!37906) Bool)

(assert (=> start!56614 (array_inv!13989 a!2986)))

(declare-fun b!627283 () Bool)

(declare-fun res!404989 () Bool)

(assert (=> b!627283 (=> (not res!404989) (not e!359213))))

(assert (=> b!627283 (= res!404989 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18193 a!2986) index!984) (select (arr!18193 a!2986) j!136))) (not (= (select (arr!18193 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627290 () Bool)

(declare-fun res!404985 () Bool)

(assert (=> b!627290 (=> (not res!404985) (not e!359213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37906 (_ BitVec 32)) Bool)

(assert (=> b!627290 (= res!404985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627291 () Bool)

(declare-fun res!404988 () Bool)

(assert (=> b!627291 (=> (not res!404988) (not e!359213))))

(declare-datatypes ((List!12234 0))(
  ( (Nil!12231) (Cons!12230 (h!13275 (_ BitVec 64)) (t!18462 List!12234)) )
))
(declare-fun arrayNoDuplicates!0 (array!37906 (_ BitVec 32) List!12234) Bool)

(assert (=> b!627291 (= res!404988 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12231))))

(declare-fun b!627292 () Bool)

(assert (=> b!627292 (= e!359212 e!359213)))

(declare-fun res!404992 () Bool)

(assert (=> b!627292 (=> (not res!404992) (not e!359213))))

(declare-fun lt!290250 () SeekEntryResult!6633)

(assert (=> b!627292 (= res!404992 (or (= lt!290250 (MissingZero!6633 i!1108)) (= lt!290250 (MissingVacant!6633 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37906 (_ BitVec 32)) SeekEntryResult!6633)

(assert (=> b!627292 (= lt!290250 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627293 () Bool)

(declare-fun res!404983 () Bool)

(assert (=> b!627293 (=> (not res!404983) (not e!359212))))

(assert (=> b!627293 (= res!404983 (validKeyInArray!0 (select (arr!18193 a!2986) j!136)))))

(assert (= (and start!56614 res!404991) b!627289))

(assert (= (and b!627289 res!404993) b!627293))

(assert (= (and b!627293 res!404983) b!627288))

(assert (= (and b!627288 res!404984) b!627286))

(assert (= (and b!627286 res!404986) b!627292))

(assert (= (and b!627292 res!404992) b!627290))

(assert (= (and b!627290 res!404985) b!627291))

(assert (= (and b!627291 res!404988) b!627287))

(assert (= (and b!627287 res!404990) b!627285))

(assert (= (and b!627285 res!404987) b!627283))

(assert (= (and b!627283 res!404989) b!627284))

(declare-fun m!602607 () Bool)

(assert (=> b!627291 m!602607))

(declare-fun m!602609 () Bool)

(assert (=> b!627288 m!602609))

(declare-fun m!602611 () Bool)

(assert (=> b!627285 m!602611))

(assert (=> b!627285 m!602611))

(declare-fun m!602613 () Bool)

(assert (=> b!627285 m!602613))

(declare-fun m!602615 () Bool)

(assert (=> b!627286 m!602615))

(declare-fun m!602617 () Bool)

(assert (=> b!627283 m!602617))

(assert (=> b!627283 m!602611))

(declare-fun m!602619 () Bool)

(assert (=> b!627292 m!602619))

(declare-fun m!602621 () Bool)

(assert (=> b!627290 m!602621))

(declare-fun m!602623 () Bool)

(assert (=> start!56614 m!602623))

(declare-fun m!602625 () Bool)

(assert (=> start!56614 m!602625))

(assert (=> b!627293 m!602611))

(assert (=> b!627293 m!602611))

(declare-fun m!602627 () Bool)

(assert (=> b!627293 m!602627))

(declare-fun m!602629 () Bool)

(assert (=> b!627287 m!602629))

(declare-fun m!602631 () Bool)

(assert (=> b!627287 m!602631))

(declare-fun m!602633 () Bool)

(assert (=> b!627287 m!602633))

(declare-fun m!602635 () Bool)

(assert (=> b!627284 m!602635))

(check-sat (not b!627288) (not b!627293) (not b!627284) (not b!627291) (not b!627290) (not b!627286) (not start!56614) (not b!627285) (not b!627292))
(check-sat)
