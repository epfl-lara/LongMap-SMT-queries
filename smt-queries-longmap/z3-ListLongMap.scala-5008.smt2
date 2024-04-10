; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68560 () Bool)

(assert start!68560)

(declare-fun b!797476 () Bool)

(declare-fun e!442429 () Bool)

(declare-fun e!442428 () Bool)

(assert (=> b!797476 (= e!442429 e!442428)))

(declare-fun res!541997 () Bool)

(assert (=> b!797476 (=> (not res!541997) (not e!442428))))

(declare-datatypes ((SeekEntryResult!8346 0))(
  ( (MissingZero!8346 (index!35752 (_ BitVec 32))) (Found!8346 (index!35753 (_ BitVec 32))) (Intermediate!8346 (undefined!9158 Bool) (index!35754 (_ BitVec 32)) (x!66648 (_ BitVec 32))) (Undefined!8346) (MissingVacant!8346 (index!35755 (_ BitVec 32))) )
))
(declare-fun lt!355801 () SeekEntryResult!8346)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797476 (= res!541997 (or (= lt!355801 (MissingZero!8346 i!1163)) (= lt!355801 (MissingVacant!8346 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43350 0))(
  ( (array!43351 (arr!20755 (Array (_ BitVec 32) (_ BitVec 64))) (size!21176 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43350)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43350 (_ BitVec 32)) SeekEntryResult!8346)

(assert (=> b!797476 (= lt!355801 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797477 () Bool)

(declare-fun e!442427 () Bool)

(declare-fun e!442425 () Bool)

(assert (=> b!797477 (= e!442427 e!442425)))

(declare-fun res!542000 () Bool)

(assert (=> b!797477 (=> (not res!542000) (not e!442425))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355797 () SeekEntryResult!8346)

(declare-fun lt!355796 () SeekEntryResult!8346)

(assert (=> b!797477 (= res!542000 (and (= lt!355797 lt!355796) (= (select (arr!20755 a!3170) index!1236) (select (arr!20755 a!3170) j!153))))))

(assert (=> b!797477 (= lt!355796 (Found!8346 j!153))))

(declare-fun b!797478 () Bool)

(declare-fun res!542006 () Bool)

(assert (=> b!797478 (=> (not res!542006) (not e!442428))))

(declare-datatypes ((List!14718 0))(
  ( (Nil!14715) (Cons!14714 (h!15843 (_ BitVec 64)) (t!21033 List!14718)) )
))
(declare-fun arrayNoDuplicates!0 (array!43350 (_ BitVec 32) List!14718) Bool)

(assert (=> b!797478 (= res!542006 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14715))))

(declare-fun b!797479 () Bool)

(declare-fun e!442426 () Bool)

(assert (=> b!797479 (= e!442428 e!442426)))

(declare-fun res!541996 () Bool)

(assert (=> b!797479 (=> (not res!541996) (not e!442426))))

(declare-fun lt!355799 () SeekEntryResult!8346)

(declare-fun lt!355795 () SeekEntryResult!8346)

(assert (=> b!797479 (= res!541996 (= lt!355799 lt!355795))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355798 () (_ BitVec 64))

(declare-fun lt!355802 () array!43350)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43350 (_ BitVec 32)) SeekEntryResult!8346)

(assert (=> b!797479 (= lt!355795 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355798 lt!355802 mask!3266))))

(assert (=> b!797479 (= lt!355799 (seekEntryOrOpen!0 lt!355798 lt!355802 mask!3266))))

(assert (=> b!797479 (= lt!355798 (select (store (arr!20755 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797479 (= lt!355802 (array!43351 (store (arr!20755 a!3170) i!1163 k0!2044) (size!21176 a!3170)))))

(declare-fun b!797480 () Bool)

(declare-fun res!542004 () Bool)

(assert (=> b!797480 (=> (not res!542004) (not e!442429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797480 (= res!542004 (validKeyInArray!0 k0!2044))))

(declare-fun b!797481 () Bool)

(declare-fun res!542003 () Bool)

(assert (=> b!797481 (=> (not res!542003) (not e!442429))))

(declare-fun arrayContainsKey!0 (array!43350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797481 (= res!542003 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797482 () Bool)

(declare-fun res!541999 () Bool)

(assert (=> b!797482 (=> (not res!541999) (not e!442429))))

(assert (=> b!797482 (= res!541999 (and (= (size!21176 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21176 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21176 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797483 () Bool)

(declare-fun res!541998 () Bool)

(assert (=> b!797483 (=> (not res!541998) (not e!442429))))

(assert (=> b!797483 (= res!541998 (validKeyInArray!0 (select (arr!20755 a!3170) j!153)))))

(declare-fun b!797484 () Bool)

(assert (=> b!797484 (= e!442425 (not (or (not (= lt!355795 lt!355796)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20755 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797484 (= lt!355795 (Found!8346 index!1236))))

(declare-fun b!797485 () Bool)

(assert (=> b!797485 (= e!442426 e!442427)))

(declare-fun res!541995 () Bool)

(assert (=> b!797485 (=> (not res!541995) (not e!442427))))

(declare-fun lt!355800 () SeekEntryResult!8346)

(assert (=> b!797485 (= res!541995 (= lt!355800 lt!355797))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797485 (= lt!355797 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20755 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797485 (= lt!355800 (seekEntryOrOpen!0 (select (arr!20755 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797486 () Bool)

(declare-fun res!542002 () Bool)

(assert (=> b!797486 (=> (not res!542002) (not e!442428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43350 (_ BitVec 32)) Bool)

(assert (=> b!797486 (= res!542002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!542005 () Bool)

(assert (=> start!68560 (=> (not res!542005) (not e!442429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68560 (= res!542005 (validMask!0 mask!3266))))

(assert (=> start!68560 e!442429))

(assert (=> start!68560 true))

(declare-fun array_inv!16551 (array!43350) Bool)

(assert (=> start!68560 (array_inv!16551 a!3170)))

(declare-fun b!797487 () Bool)

(declare-fun res!542001 () Bool)

(assert (=> b!797487 (=> (not res!542001) (not e!442428))))

(assert (=> b!797487 (= res!542001 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21176 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20755 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21176 a!3170)) (= (select (arr!20755 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68560 res!542005) b!797482))

(assert (= (and b!797482 res!541999) b!797483))

(assert (= (and b!797483 res!541998) b!797480))

(assert (= (and b!797480 res!542004) b!797481))

(assert (= (and b!797481 res!542003) b!797476))

(assert (= (and b!797476 res!541997) b!797486))

(assert (= (and b!797486 res!542002) b!797478))

(assert (= (and b!797478 res!542006) b!797487))

(assert (= (and b!797487 res!542001) b!797479))

(assert (= (and b!797479 res!541996) b!797485))

(assert (= (and b!797485 res!541995) b!797477))

(assert (= (and b!797477 res!542000) b!797484))

(declare-fun m!738331 () Bool)

(assert (=> b!797477 m!738331))

(declare-fun m!738333 () Bool)

(assert (=> b!797477 m!738333))

(assert (=> b!797483 m!738333))

(assert (=> b!797483 m!738333))

(declare-fun m!738335 () Bool)

(assert (=> b!797483 m!738335))

(declare-fun m!738337 () Bool)

(assert (=> b!797476 m!738337))

(declare-fun m!738339 () Bool)

(assert (=> b!797480 m!738339))

(declare-fun m!738341 () Bool)

(assert (=> b!797481 m!738341))

(assert (=> b!797485 m!738333))

(assert (=> b!797485 m!738333))

(declare-fun m!738343 () Bool)

(assert (=> b!797485 m!738343))

(assert (=> b!797485 m!738333))

(declare-fun m!738345 () Bool)

(assert (=> b!797485 m!738345))

(declare-fun m!738347 () Bool)

(assert (=> b!797479 m!738347))

(declare-fun m!738349 () Bool)

(assert (=> b!797479 m!738349))

(declare-fun m!738351 () Bool)

(assert (=> b!797479 m!738351))

(declare-fun m!738353 () Bool)

(assert (=> b!797479 m!738353))

(declare-fun m!738355 () Bool)

(assert (=> b!797478 m!738355))

(declare-fun m!738357 () Bool)

(assert (=> b!797487 m!738357))

(declare-fun m!738359 () Bool)

(assert (=> b!797487 m!738359))

(assert (=> b!797484 m!738351))

(declare-fun m!738361 () Bool)

(assert (=> b!797484 m!738361))

(declare-fun m!738363 () Bool)

(assert (=> start!68560 m!738363))

(declare-fun m!738365 () Bool)

(assert (=> start!68560 m!738365))

(declare-fun m!738367 () Bool)

(assert (=> b!797486 m!738367))

(check-sat (not b!797483) (not b!797480) (not b!797486) (not b!797476) (not b!797479) (not start!68560) (not b!797478) (not b!797485) (not b!797481))
(check-sat)
