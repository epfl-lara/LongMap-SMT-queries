; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68454 () Bool)

(assert start!68454)

(declare-fun b!795705 () Bool)

(declare-fun e!441611 () Bool)

(declare-fun e!441609 () Bool)

(assert (=> b!795705 (= e!441611 e!441609)))

(declare-fun res!540225 () Bool)

(assert (=> b!795705 (=> (not res!540225) (not e!441609))))

(declare-datatypes ((SeekEntryResult!8293 0))(
  ( (MissingZero!8293 (index!35540 (_ BitVec 32))) (Found!8293 (index!35541 (_ BitVec 32))) (Intermediate!8293 (undefined!9105 Bool) (index!35542 (_ BitVec 32)) (x!66451 (_ BitVec 32))) (Undefined!8293) (MissingVacant!8293 (index!35543 (_ BitVec 32))) )
))
(declare-fun lt!354708 () SeekEntryResult!8293)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795705 (= res!540225 (or (= lt!354708 (MissingZero!8293 i!1163)) (= lt!354708 (MissingVacant!8293 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43244 0))(
  ( (array!43245 (arr!20702 (Array (_ BitVec 32) (_ BitVec 64))) (size!21123 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43244 (_ BitVec 32)) SeekEntryResult!8293)

(assert (=> b!795705 (= lt!354708 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795706 () Bool)

(declare-fun res!540233 () Bool)

(assert (=> b!795706 (=> (not res!540233) (not e!441609))))

(declare-datatypes ((List!14665 0))(
  ( (Nil!14662) (Cons!14661 (h!15790 (_ BitVec 64)) (t!20980 List!14665)) )
))
(declare-fun arrayNoDuplicates!0 (array!43244 (_ BitVec 32) List!14665) Bool)

(assert (=> b!795706 (= res!540233 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14662))))

(declare-fun b!795707 () Bool)

(declare-fun e!441608 () Bool)

(assert (=> b!795707 (= e!441608 false)))

(declare-fun lt!354706 () SeekEntryResult!8293)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43244 (_ BitVec 32)) SeekEntryResult!8293)

(assert (=> b!795707 (= lt!354706 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20702 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354707 () SeekEntryResult!8293)

(assert (=> b!795707 (= lt!354707 (seekEntryOrOpen!0 (select (arr!20702 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795708 () Bool)

(declare-fun res!540224 () Bool)

(assert (=> b!795708 (=> (not res!540224) (not e!441611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795708 (= res!540224 (validKeyInArray!0 (select (arr!20702 a!3170) j!153)))))

(declare-fun b!795709 () Bool)

(declare-fun res!540230 () Bool)

(assert (=> b!795709 (=> (not res!540230) (not e!441611))))

(assert (=> b!795709 (= res!540230 (validKeyInArray!0 k!2044))))

(declare-fun res!540227 () Bool)

(assert (=> start!68454 (=> (not res!540227) (not e!441611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68454 (= res!540227 (validMask!0 mask!3266))))

(assert (=> start!68454 e!441611))

(assert (=> start!68454 true))

(declare-fun array_inv!16498 (array!43244) Bool)

(assert (=> start!68454 (array_inv!16498 a!3170)))

(declare-fun b!795710 () Bool)

(declare-fun res!540231 () Bool)

(assert (=> b!795710 (=> (not res!540231) (not e!441609))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795710 (= res!540231 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21123 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20702 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21123 a!3170)) (= (select (arr!20702 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795711 () Bool)

(declare-fun res!540229 () Bool)

(assert (=> b!795711 (=> (not res!540229) (not e!441611))))

(declare-fun arrayContainsKey!0 (array!43244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795711 (= res!540229 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795712 () Bool)

(declare-fun res!540228 () Bool)

(assert (=> b!795712 (=> (not res!540228) (not e!441609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43244 (_ BitVec 32)) Bool)

(assert (=> b!795712 (= res!540228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795713 () Bool)

(declare-fun res!540226 () Bool)

(assert (=> b!795713 (=> (not res!540226) (not e!441611))))

(assert (=> b!795713 (= res!540226 (and (= (size!21123 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21123 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21123 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795714 () Bool)

(assert (=> b!795714 (= e!441609 e!441608)))

(declare-fun res!540232 () Bool)

(assert (=> b!795714 (=> (not res!540232) (not e!441608))))

(declare-fun lt!354710 () array!43244)

(declare-fun lt!354709 () (_ BitVec 64))

(assert (=> b!795714 (= res!540232 (= (seekEntryOrOpen!0 lt!354709 lt!354710 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354709 lt!354710 mask!3266)))))

(assert (=> b!795714 (= lt!354709 (select (store (arr!20702 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795714 (= lt!354710 (array!43245 (store (arr!20702 a!3170) i!1163 k!2044) (size!21123 a!3170)))))

(assert (= (and start!68454 res!540227) b!795713))

(assert (= (and b!795713 res!540226) b!795708))

(assert (= (and b!795708 res!540224) b!795709))

(assert (= (and b!795709 res!540230) b!795711))

(assert (= (and b!795711 res!540229) b!795705))

(assert (= (and b!795705 res!540225) b!795712))

(assert (= (and b!795712 res!540228) b!795706))

(assert (= (and b!795706 res!540233) b!795710))

(assert (= (and b!795710 res!540231) b!795714))

(assert (= (and b!795714 res!540232) b!795707))

(declare-fun m!736387 () Bool)

(assert (=> start!68454 m!736387))

(declare-fun m!736389 () Bool)

(assert (=> start!68454 m!736389))

(declare-fun m!736391 () Bool)

(assert (=> b!795709 m!736391))

(declare-fun m!736393 () Bool)

(assert (=> b!795710 m!736393))

(declare-fun m!736395 () Bool)

(assert (=> b!795710 m!736395))

(declare-fun m!736397 () Bool)

(assert (=> b!795705 m!736397))

(declare-fun m!736399 () Bool)

(assert (=> b!795714 m!736399))

(declare-fun m!736401 () Bool)

(assert (=> b!795714 m!736401))

(declare-fun m!736403 () Bool)

(assert (=> b!795714 m!736403))

(declare-fun m!736405 () Bool)

(assert (=> b!795714 m!736405))

(declare-fun m!736407 () Bool)

(assert (=> b!795708 m!736407))

(assert (=> b!795708 m!736407))

(declare-fun m!736409 () Bool)

(assert (=> b!795708 m!736409))

(declare-fun m!736411 () Bool)

(assert (=> b!795711 m!736411))

(assert (=> b!795707 m!736407))

(assert (=> b!795707 m!736407))

(declare-fun m!736413 () Bool)

(assert (=> b!795707 m!736413))

(assert (=> b!795707 m!736407))

(declare-fun m!736415 () Bool)

(assert (=> b!795707 m!736415))

(declare-fun m!736417 () Bool)

(assert (=> b!795706 m!736417))

(declare-fun m!736419 () Bool)

(assert (=> b!795712 m!736419))

(push 1)

