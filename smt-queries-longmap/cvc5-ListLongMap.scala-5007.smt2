; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68552 () Bool)

(assert start!68552)

(declare-fun b!797332 () Bool)

(declare-fun res!541851 () Bool)

(declare-fun e!442357 () Bool)

(assert (=> b!797332 (=> (not res!541851) (not e!442357))))

(declare-datatypes ((array!43342 0))(
  ( (array!43343 (arr!20751 (Array (_ BitVec 32) (_ BitVec 64))) (size!21172 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43342)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797332 (= res!541851 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun e!442353 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8342 0))(
  ( (MissingZero!8342 (index!35736 (_ BitVec 32))) (Found!8342 (index!35737 (_ BitVec 32))) (Intermediate!8342 (undefined!9154 Bool) (index!35738 (_ BitVec 32)) (x!66636 (_ BitVec 32))) (Undefined!8342) (MissingVacant!8342 (index!35739 (_ BitVec 32))) )
))
(declare-fun lt!355701 () SeekEntryResult!8342)

(declare-fun b!797333 () Bool)

(declare-fun lt!355704 () SeekEntryResult!8342)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797333 (= e!442353 (not (or (not (= lt!355704 lt!355701)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797333 (= lt!355704 (Found!8342 index!1236))))

(declare-fun b!797334 () Bool)

(declare-fun e!442358 () Bool)

(declare-fun e!442355 () Bool)

(assert (=> b!797334 (= e!442358 e!442355)))

(declare-fun res!541861 () Bool)

(assert (=> b!797334 (=> (not res!541861) (not e!442355))))

(declare-fun lt!355702 () SeekEntryResult!8342)

(assert (=> b!797334 (= res!541861 (= lt!355702 lt!355704))))

(declare-fun lt!355699 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355703 () array!43342)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43342 (_ BitVec 32)) SeekEntryResult!8342)

(assert (=> b!797334 (= lt!355704 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355699 lt!355703 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43342 (_ BitVec 32)) SeekEntryResult!8342)

(assert (=> b!797334 (= lt!355702 (seekEntryOrOpen!0 lt!355699 lt!355703 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797334 (= lt!355699 (select (store (arr!20751 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797334 (= lt!355703 (array!43343 (store (arr!20751 a!3170) i!1163 k!2044) (size!21172 a!3170)))))

(declare-fun b!797336 () Bool)

(declare-fun e!442354 () Bool)

(assert (=> b!797336 (= e!442355 e!442354)))

(declare-fun res!541859 () Bool)

(assert (=> b!797336 (=> (not res!541859) (not e!442354))))

(declare-fun lt!355700 () SeekEntryResult!8342)

(declare-fun lt!355705 () SeekEntryResult!8342)

(assert (=> b!797336 (= res!541859 (= lt!355700 lt!355705))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797336 (= lt!355705 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20751 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797336 (= lt!355700 (seekEntryOrOpen!0 (select (arr!20751 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797337 () Bool)

(declare-fun res!541858 () Bool)

(assert (=> b!797337 (=> (not res!541858) (not e!442358))))

(assert (=> b!797337 (= res!541858 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21172 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20751 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21172 a!3170)) (= (select (arr!20751 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797338 () Bool)

(assert (=> b!797338 (= e!442354 e!442353)))

(declare-fun res!541862 () Bool)

(assert (=> b!797338 (=> (not res!541862) (not e!442353))))

(assert (=> b!797338 (= res!541862 (and (= lt!355705 lt!355701) (= (select (arr!20751 a!3170) index!1236) (select (arr!20751 a!3170) j!153))))))

(assert (=> b!797338 (= lt!355701 (Found!8342 j!153))))

(declare-fun b!797339 () Bool)

(declare-fun res!541853 () Bool)

(assert (=> b!797339 (=> (not res!541853) (not e!442357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797339 (= res!541853 (validKeyInArray!0 (select (arr!20751 a!3170) j!153)))))

(declare-fun res!541857 () Bool)

(assert (=> start!68552 (=> (not res!541857) (not e!442357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68552 (= res!541857 (validMask!0 mask!3266))))

(assert (=> start!68552 e!442357))

(assert (=> start!68552 true))

(declare-fun array_inv!16547 (array!43342) Bool)

(assert (=> start!68552 (array_inv!16547 a!3170)))

(declare-fun b!797335 () Bool)

(declare-fun res!541854 () Bool)

(assert (=> b!797335 (=> (not res!541854) (not e!442357))))

(assert (=> b!797335 (= res!541854 (validKeyInArray!0 k!2044))))

(declare-fun b!797340 () Bool)

(assert (=> b!797340 (= e!442357 e!442358)))

(declare-fun res!541852 () Bool)

(assert (=> b!797340 (=> (not res!541852) (not e!442358))))

(declare-fun lt!355706 () SeekEntryResult!8342)

(assert (=> b!797340 (= res!541852 (or (= lt!355706 (MissingZero!8342 i!1163)) (= lt!355706 (MissingVacant!8342 i!1163))))))

(assert (=> b!797340 (= lt!355706 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797341 () Bool)

(declare-fun res!541856 () Bool)

(assert (=> b!797341 (=> (not res!541856) (not e!442358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43342 (_ BitVec 32)) Bool)

(assert (=> b!797341 (= res!541856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797342 () Bool)

(declare-fun res!541855 () Bool)

(assert (=> b!797342 (=> (not res!541855) (not e!442357))))

(assert (=> b!797342 (= res!541855 (and (= (size!21172 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21172 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21172 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797343 () Bool)

(declare-fun res!541860 () Bool)

(assert (=> b!797343 (=> (not res!541860) (not e!442358))))

(declare-datatypes ((List!14714 0))(
  ( (Nil!14711) (Cons!14710 (h!15839 (_ BitVec 64)) (t!21029 List!14714)) )
))
(declare-fun arrayNoDuplicates!0 (array!43342 (_ BitVec 32) List!14714) Bool)

(assert (=> b!797343 (= res!541860 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14711))))

(assert (= (and start!68552 res!541857) b!797342))

(assert (= (and b!797342 res!541855) b!797339))

(assert (= (and b!797339 res!541853) b!797335))

(assert (= (and b!797335 res!541854) b!797332))

(assert (= (and b!797332 res!541851) b!797340))

(assert (= (and b!797340 res!541852) b!797341))

(assert (= (and b!797341 res!541856) b!797343))

(assert (= (and b!797343 res!541860) b!797337))

(assert (= (and b!797337 res!541858) b!797334))

(assert (= (and b!797334 res!541861) b!797336))

(assert (= (and b!797336 res!541859) b!797338))

(assert (= (and b!797338 res!541862) b!797333))

(declare-fun m!738185 () Bool)

(assert (=> b!797336 m!738185))

(assert (=> b!797336 m!738185))

(declare-fun m!738187 () Bool)

(assert (=> b!797336 m!738187))

(assert (=> b!797336 m!738185))

(declare-fun m!738189 () Bool)

(assert (=> b!797336 m!738189))

(declare-fun m!738191 () Bool)

(assert (=> b!797343 m!738191))

(declare-fun m!738193 () Bool)

(assert (=> b!797337 m!738193))

(declare-fun m!738195 () Bool)

(assert (=> b!797337 m!738195))

(declare-fun m!738197 () Bool)

(assert (=> b!797335 m!738197))

(assert (=> b!797339 m!738185))

(assert (=> b!797339 m!738185))

(declare-fun m!738199 () Bool)

(assert (=> b!797339 m!738199))

(declare-fun m!738201 () Bool)

(assert (=> b!797334 m!738201))

(declare-fun m!738203 () Bool)

(assert (=> b!797334 m!738203))

(declare-fun m!738205 () Bool)

(assert (=> b!797334 m!738205))

(declare-fun m!738207 () Bool)

(assert (=> b!797334 m!738207))

(declare-fun m!738209 () Bool)

(assert (=> b!797332 m!738209))

(declare-fun m!738211 () Bool)

(assert (=> b!797341 m!738211))

(declare-fun m!738213 () Bool)

(assert (=> b!797340 m!738213))

(declare-fun m!738215 () Bool)

(assert (=> start!68552 m!738215))

(declare-fun m!738217 () Bool)

(assert (=> start!68552 m!738217))

(declare-fun m!738219 () Bool)

(assert (=> b!797338 m!738219))

(assert (=> b!797338 m!738185))

(push 1)

(assert (not b!797339))

(assert (not b!797336))

(assert (not b!797343))

(assert (not start!68552))

(assert (not b!797332))

(assert (not b!797341))

(assert (not b!797334))

(assert (not b!797340))

(assert (not b!797335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

