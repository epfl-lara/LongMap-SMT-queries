; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68620 () Bool)

(assert start!68620)

(declare-fun b!798510 () Bool)

(declare-fun res!543029 () Bool)

(declare-fun e!442920 () Bool)

(assert (=> b!798510 (=> (not res!543029) (not e!442920))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43410 0))(
  ( (array!43411 (arr!20785 (Array (_ BitVec 32) (_ BitVec 64))) (size!21206 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43410)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798510 (= res!543029 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21206 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20785 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21206 a!3170)) (= (select (arr!20785 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798511 () Bool)

(declare-fun res!543037 () Bool)

(declare-fun e!442919 () Bool)

(assert (=> b!798511 (=> (not res!543037) (not e!442919))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798511 (= res!543037 (validKeyInArray!0 k0!2044))))

(declare-fun b!798512 () Bool)

(declare-fun res!543030 () Bool)

(assert (=> b!798512 (=> (not res!543030) (not e!442920))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43410 (_ BitVec 32)) Bool)

(assert (=> b!798512 (= res!543030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798513 () Bool)

(declare-fun res!543031 () Bool)

(assert (=> b!798513 (=> (not res!543031) (not e!442919))))

(declare-fun arrayContainsKey!0 (array!43410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798513 (= res!543031 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798514 () Bool)

(assert (=> b!798514 (= e!442919 e!442920)))

(declare-fun res!543035 () Bool)

(assert (=> b!798514 (=> (not res!543035) (not e!442920))))

(declare-datatypes ((SeekEntryResult!8376 0))(
  ( (MissingZero!8376 (index!35872 (_ BitVec 32))) (Found!8376 (index!35873 (_ BitVec 32))) (Intermediate!8376 (undefined!9188 Bool) (index!35874 (_ BitVec 32)) (x!66758 (_ BitVec 32))) (Undefined!8376) (MissingVacant!8376 (index!35875 (_ BitVec 32))) )
))
(declare-fun lt!356455 () SeekEntryResult!8376)

(assert (=> b!798514 (= res!543035 (or (= lt!356455 (MissingZero!8376 i!1163)) (= lt!356455 (MissingVacant!8376 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43410 (_ BitVec 32)) SeekEntryResult!8376)

(assert (=> b!798514 (= lt!356455 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798515 () Bool)

(declare-fun e!442922 () Bool)

(assert (=> b!798515 (= e!442922 false)))

(declare-fun lt!356459 () SeekEntryResult!8376)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43410 (_ BitVec 32)) SeekEntryResult!8376)

(assert (=> b!798515 (= lt!356459 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20785 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356457 () SeekEntryResult!8376)

(assert (=> b!798515 (= lt!356457 (seekEntryOrOpen!0 (select (arr!20785 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798516 () Bool)

(declare-fun res!543038 () Bool)

(assert (=> b!798516 (=> (not res!543038) (not e!442919))))

(assert (=> b!798516 (= res!543038 (validKeyInArray!0 (select (arr!20785 a!3170) j!153)))))

(declare-fun res!543036 () Bool)

(assert (=> start!68620 (=> (not res!543036) (not e!442919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68620 (= res!543036 (validMask!0 mask!3266))))

(assert (=> start!68620 e!442919))

(assert (=> start!68620 true))

(declare-fun array_inv!16581 (array!43410) Bool)

(assert (=> start!68620 (array_inv!16581 a!3170)))

(declare-fun b!798517 () Bool)

(assert (=> b!798517 (= e!442920 e!442922)))

(declare-fun res!543032 () Bool)

(assert (=> b!798517 (=> (not res!543032) (not e!442922))))

(declare-fun lt!356458 () array!43410)

(declare-fun lt!356456 () (_ BitVec 64))

(assert (=> b!798517 (= res!543032 (= (seekEntryOrOpen!0 lt!356456 lt!356458 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356456 lt!356458 mask!3266)))))

(assert (=> b!798517 (= lt!356456 (select (store (arr!20785 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798517 (= lt!356458 (array!43411 (store (arr!20785 a!3170) i!1163 k0!2044) (size!21206 a!3170)))))

(declare-fun b!798518 () Bool)

(declare-fun res!543033 () Bool)

(assert (=> b!798518 (=> (not res!543033) (not e!442920))))

(declare-datatypes ((List!14748 0))(
  ( (Nil!14745) (Cons!14744 (h!15873 (_ BitVec 64)) (t!21063 List!14748)) )
))
(declare-fun arrayNoDuplicates!0 (array!43410 (_ BitVec 32) List!14748) Bool)

(assert (=> b!798518 (= res!543033 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14745))))

(declare-fun b!798519 () Bool)

(declare-fun res!543034 () Bool)

(assert (=> b!798519 (=> (not res!543034) (not e!442919))))

(assert (=> b!798519 (= res!543034 (and (= (size!21206 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21206 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21206 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68620 res!543036) b!798519))

(assert (= (and b!798519 res!543034) b!798516))

(assert (= (and b!798516 res!543038) b!798511))

(assert (= (and b!798511 res!543037) b!798513))

(assert (= (and b!798513 res!543031) b!798514))

(assert (= (and b!798514 res!543035) b!798512))

(assert (= (and b!798512 res!543030) b!798518))

(assert (= (and b!798518 res!543033) b!798510))

(assert (= (and b!798510 res!543029) b!798517))

(assert (= (and b!798517 res!543032) b!798515))

(declare-fun m!739425 () Bool)

(assert (=> b!798510 m!739425))

(declare-fun m!739427 () Bool)

(assert (=> b!798510 m!739427))

(declare-fun m!739429 () Bool)

(assert (=> b!798513 m!739429))

(declare-fun m!739431 () Bool)

(assert (=> b!798515 m!739431))

(assert (=> b!798515 m!739431))

(declare-fun m!739433 () Bool)

(assert (=> b!798515 m!739433))

(assert (=> b!798515 m!739431))

(declare-fun m!739435 () Bool)

(assert (=> b!798515 m!739435))

(declare-fun m!739437 () Bool)

(assert (=> b!798518 m!739437))

(declare-fun m!739439 () Bool)

(assert (=> b!798514 m!739439))

(declare-fun m!739441 () Bool)

(assert (=> start!68620 m!739441))

(declare-fun m!739443 () Bool)

(assert (=> start!68620 m!739443))

(assert (=> b!798516 m!739431))

(assert (=> b!798516 m!739431))

(declare-fun m!739445 () Bool)

(assert (=> b!798516 m!739445))

(declare-fun m!739447 () Bool)

(assert (=> b!798512 m!739447))

(declare-fun m!739449 () Bool)

(assert (=> b!798511 m!739449))

(declare-fun m!739451 () Bool)

(assert (=> b!798517 m!739451))

(declare-fun m!739453 () Bool)

(assert (=> b!798517 m!739453))

(declare-fun m!739455 () Bool)

(assert (=> b!798517 m!739455))

(declare-fun m!739457 () Bool)

(assert (=> b!798517 m!739457))

(check-sat (not start!68620) (not b!798518) (not b!798517) (not b!798511) (not b!798513) (not b!798514) (not b!798512) (not b!798516) (not b!798515))
(check-sat)
