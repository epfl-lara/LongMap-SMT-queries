; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68412 () Bool)

(assert start!68412)

(declare-fun b!795125 () Bool)

(declare-fun res!539792 () Bool)

(declare-fun e!441323 () Bool)

(assert (=> b!795125 (=> (not res!539792) (not e!441323))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43219 0))(
  ( (array!43220 (arr!20690 (Array (_ BitVec 32) (_ BitVec 64))) (size!21111 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43219)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795125 (= res!539792 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21111 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20690 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21111 a!3170)) (= (select (arr!20690 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795126 () Bool)

(declare-fun e!441325 () Bool)

(assert (=> b!795126 (= e!441323 e!441325)))

(declare-fun res!539784 () Bool)

(assert (=> b!795126 (=> (not res!539784) (not e!441325))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!354303 () (_ BitVec 64))

(declare-fun lt!354302 () array!43219)

(declare-datatypes ((SeekEntryResult!8278 0))(
  ( (MissingZero!8278 (index!35480 (_ BitVec 32))) (Found!8278 (index!35481 (_ BitVec 32))) (Intermediate!8278 (undefined!9090 Bool) (index!35482 (_ BitVec 32)) (x!66407 (_ BitVec 32))) (Undefined!8278) (MissingVacant!8278 (index!35483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43219 (_ BitVec 32)) SeekEntryResult!8278)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43219 (_ BitVec 32)) SeekEntryResult!8278)

(assert (=> b!795126 (= res!539784 (= (seekEntryOrOpen!0 lt!354303 lt!354302 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354303 lt!354302 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795126 (= lt!354303 (select (store (arr!20690 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795126 (= lt!354302 (array!43220 (store (arr!20690 a!3170) i!1163 k0!2044) (size!21111 a!3170)))))

(declare-fun res!539785 () Bool)

(declare-fun e!441322 () Bool)

(assert (=> start!68412 (=> (not res!539785) (not e!441322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68412 (= res!539785 (validMask!0 mask!3266))))

(assert (=> start!68412 e!441322))

(assert (=> start!68412 true))

(declare-fun array_inv!16573 (array!43219) Bool)

(assert (=> start!68412 (array_inv!16573 a!3170)))

(declare-fun b!795127 () Bool)

(declare-fun res!539790 () Bool)

(assert (=> b!795127 (=> (not res!539790) (not e!441322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795127 (= res!539790 (validKeyInArray!0 k0!2044))))

(declare-fun b!795128 () Bool)

(declare-fun res!539786 () Bool)

(assert (=> b!795128 (=> (not res!539786) (not e!441323))))

(declare-datatypes ((List!14692 0))(
  ( (Nil!14689) (Cons!14688 (h!15817 (_ BitVec 64)) (t!20998 List!14692)) )
))
(declare-fun arrayNoDuplicates!0 (array!43219 (_ BitVec 32) List!14692) Bool)

(assert (=> b!795128 (= res!539786 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14689))))

(declare-fun lt!354305 () SeekEntryResult!8278)

(declare-fun lt!354301 () SeekEntryResult!8278)

(declare-fun b!795129 () Bool)

(assert (=> b!795129 (= e!441325 (and (= lt!354301 lt!354305) (= lt!354305 (Found!8278 j!153)) (= (select (arr!20690 a!3170) index!1236) (select (arr!20690 a!3170) j!153)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!795129 (= lt!354305 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20690 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795129 (= lt!354301 (seekEntryOrOpen!0 (select (arr!20690 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795130 () Bool)

(declare-fun res!539788 () Bool)

(assert (=> b!795130 (=> (not res!539788) (not e!441322))))

(assert (=> b!795130 (= res!539788 (and (= (size!21111 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21111 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21111 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795131 () Bool)

(assert (=> b!795131 (= e!441322 e!441323)))

(declare-fun res!539787 () Bool)

(assert (=> b!795131 (=> (not res!539787) (not e!441323))))

(declare-fun lt!354304 () SeekEntryResult!8278)

(assert (=> b!795131 (= res!539787 (or (= lt!354304 (MissingZero!8278 i!1163)) (= lt!354304 (MissingVacant!8278 i!1163))))))

(assert (=> b!795131 (= lt!354304 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795132 () Bool)

(declare-fun res!539793 () Bool)

(assert (=> b!795132 (=> (not res!539793) (not e!441322))))

(declare-fun arrayContainsKey!0 (array!43219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795132 (= res!539793 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795133 () Bool)

(declare-fun res!539789 () Bool)

(assert (=> b!795133 (=> (not res!539789) (not e!441322))))

(assert (=> b!795133 (= res!539789 (validKeyInArray!0 (select (arr!20690 a!3170) j!153)))))

(declare-fun b!795134 () Bool)

(declare-fun res!539791 () Bool)

(assert (=> b!795134 (=> (not res!539791) (not e!441323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43219 (_ BitVec 32)) Bool)

(assert (=> b!795134 (= res!539791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68412 res!539785) b!795130))

(assert (= (and b!795130 res!539788) b!795133))

(assert (= (and b!795133 res!539789) b!795127))

(assert (= (and b!795127 res!539790) b!795132))

(assert (= (and b!795132 res!539793) b!795131))

(assert (= (and b!795131 res!539787) b!795134))

(assert (= (and b!795134 res!539791) b!795128))

(assert (= (and b!795128 res!539786) b!795125))

(assert (= (and b!795125 res!539792) b!795126))

(assert (= (and b!795126 res!539784) b!795129))

(declare-fun m!735259 () Bool)

(assert (=> b!795133 m!735259))

(assert (=> b!795133 m!735259))

(declare-fun m!735261 () Bool)

(assert (=> b!795133 m!735261))

(declare-fun m!735263 () Bool)

(assert (=> b!795126 m!735263))

(declare-fun m!735265 () Bool)

(assert (=> b!795126 m!735265))

(declare-fun m!735267 () Bool)

(assert (=> b!795126 m!735267))

(declare-fun m!735269 () Bool)

(assert (=> b!795126 m!735269))

(declare-fun m!735271 () Bool)

(assert (=> b!795134 m!735271))

(declare-fun m!735273 () Bool)

(assert (=> b!795128 m!735273))

(declare-fun m!735275 () Bool)

(assert (=> b!795132 m!735275))

(declare-fun m!735277 () Bool)

(assert (=> b!795127 m!735277))

(declare-fun m!735279 () Bool)

(assert (=> b!795129 m!735279))

(assert (=> b!795129 m!735259))

(assert (=> b!795129 m!735259))

(declare-fun m!735281 () Bool)

(assert (=> b!795129 m!735281))

(assert (=> b!795129 m!735259))

(declare-fun m!735283 () Bool)

(assert (=> b!795129 m!735283))

(declare-fun m!735285 () Bool)

(assert (=> b!795131 m!735285))

(declare-fun m!735287 () Bool)

(assert (=> start!68412 m!735287))

(declare-fun m!735289 () Bool)

(assert (=> start!68412 m!735289))

(declare-fun m!735291 () Bool)

(assert (=> b!795125 m!735291))

(declare-fun m!735293 () Bool)

(assert (=> b!795125 m!735293))

(check-sat (not b!795128) (not b!795127) (not b!795126) (not b!795131) (not b!795134) (not b!795132) (not b!795129) (not b!795133) (not start!68412))
(check-sat)
