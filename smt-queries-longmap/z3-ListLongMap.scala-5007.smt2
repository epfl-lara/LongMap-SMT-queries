; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68554 () Bool)

(assert start!68554)

(declare-fun b!797368 () Bool)

(declare-fun res!541889 () Bool)

(declare-fun e!442373 () Bool)

(assert (=> b!797368 (=> (not res!541889) (not e!442373))))

(declare-datatypes ((array!43344 0))(
  ( (array!43345 (arr!20752 (Array (_ BitVec 32) (_ BitVec 64))) (size!21173 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43344)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797368 (= res!541889 (validKeyInArray!0 (select (arr!20752 a!3170) j!153)))))

(declare-fun b!797369 () Bool)

(declare-fun e!442374 () Bool)

(declare-fun e!442371 () Bool)

(assert (=> b!797369 (= e!442374 e!442371)))

(declare-fun res!541887 () Bool)

(assert (=> b!797369 (=> (not res!541887) (not e!442371))))

(declare-datatypes ((SeekEntryResult!8343 0))(
  ( (MissingZero!8343 (index!35740 (_ BitVec 32))) (Found!8343 (index!35741 (_ BitVec 32))) (Intermediate!8343 (undefined!9155 Bool) (index!35742 (_ BitVec 32)) (x!66637 (_ BitVec 32))) (Undefined!8343) (MissingVacant!8343 (index!35743 (_ BitVec 32))) )
))
(declare-fun lt!355726 () SeekEntryResult!8343)

(declare-fun lt!355727 () SeekEntryResult!8343)

(assert (=> b!797369 (= res!541887 (= lt!355726 lt!355727))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43344 (_ BitVec 32)) SeekEntryResult!8343)

(assert (=> b!797369 (= lt!355727 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20752 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43344 (_ BitVec 32)) SeekEntryResult!8343)

(assert (=> b!797369 (= lt!355726 (seekEntryOrOpen!0 (select (arr!20752 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797370 () Bool)

(declare-fun res!541898 () Bool)

(assert (=> b!797370 (=> (not res!541898) (not e!442373))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797370 (= res!541898 (and (= (size!21173 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21173 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21173 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797371 () Bool)

(declare-fun res!541896 () Bool)

(declare-fun e!442372 () Bool)

(assert (=> b!797371 (=> (not res!541896) (not e!442372))))

(declare-datatypes ((List!14715 0))(
  ( (Nil!14712) (Cons!14711 (h!15840 (_ BitVec 64)) (t!21030 List!14715)) )
))
(declare-fun arrayNoDuplicates!0 (array!43344 (_ BitVec 32) List!14715) Bool)

(assert (=> b!797371 (= res!541896 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14712))))

(declare-fun b!797372 () Bool)

(declare-fun res!541892 () Bool)

(assert (=> b!797372 (=> (not res!541892) (not e!442372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43344 (_ BitVec 32)) Bool)

(assert (=> b!797372 (= res!541892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797373 () Bool)

(declare-fun e!442376 () Bool)

(assert (=> b!797373 (= e!442371 e!442376)))

(declare-fun res!541895 () Bool)

(assert (=> b!797373 (=> (not res!541895) (not e!442376))))

(declare-fun lt!355723 () SeekEntryResult!8343)

(assert (=> b!797373 (= res!541895 (and (= lt!355727 lt!355723) (= (select (arr!20752 a!3170) index!1236) (select (arr!20752 a!3170) j!153))))))

(assert (=> b!797373 (= lt!355723 (Found!8343 j!153))))

(declare-fun b!797375 () Bool)

(assert (=> b!797375 (= e!442373 e!442372)))

(declare-fun res!541897 () Bool)

(assert (=> b!797375 (=> (not res!541897) (not e!442372))))

(declare-fun lt!355725 () SeekEntryResult!8343)

(assert (=> b!797375 (= res!541897 (or (= lt!355725 (MissingZero!8343 i!1163)) (= lt!355725 (MissingVacant!8343 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!797375 (= lt!355725 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun lt!355730 () SeekEntryResult!8343)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!797376 () Bool)

(assert (=> b!797376 (= e!442376 (not (or (not (= lt!355730 lt!355723)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797376 (= lt!355730 (Found!8343 index!1236))))

(declare-fun b!797377 () Bool)

(declare-fun res!541893 () Bool)

(assert (=> b!797377 (=> (not res!541893) (not e!442372))))

(assert (=> b!797377 (= res!541893 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21173 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20752 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21173 a!3170)) (= (select (arr!20752 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797378 () Bool)

(declare-fun res!541890 () Bool)

(assert (=> b!797378 (=> (not res!541890) (not e!442373))))

(assert (=> b!797378 (= res!541890 (validKeyInArray!0 k0!2044))))

(declare-fun b!797379 () Bool)

(declare-fun res!541888 () Bool)

(assert (=> b!797379 (=> (not res!541888) (not e!442373))))

(declare-fun arrayContainsKey!0 (array!43344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797379 (= res!541888 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!541891 () Bool)

(assert (=> start!68554 (=> (not res!541891) (not e!442373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68554 (= res!541891 (validMask!0 mask!3266))))

(assert (=> start!68554 e!442373))

(assert (=> start!68554 true))

(declare-fun array_inv!16548 (array!43344) Bool)

(assert (=> start!68554 (array_inv!16548 a!3170)))

(declare-fun b!797374 () Bool)

(assert (=> b!797374 (= e!442372 e!442374)))

(declare-fun res!541894 () Bool)

(assert (=> b!797374 (=> (not res!541894) (not e!442374))))

(declare-fun lt!355728 () SeekEntryResult!8343)

(assert (=> b!797374 (= res!541894 (= lt!355728 lt!355730))))

(declare-fun lt!355724 () array!43344)

(declare-fun lt!355729 () (_ BitVec 64))

(assert (=> b!797374 (= lt!355730 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355729 lt!355724 mask!3266))))

(assert (=> b!797374 (= lt!355728 (seekEntryOrOpen!0 lt!355729 lt!355724 mask!3266))))

(assert (=> b!797374 (= lt!355729 (select (store (arr!20752 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797374 (= lt!355724 (array!43345 (store (arr!20752 a!3170) i!1163 k0!2044) (size!21173 a!3170)))))

(assert (= (and start!68554 res!541891) b!797370))

(assert (= (and b!797370 res!541898) b!797368))

(assert (= (and b!797368 res!541889) b!797378))

(assert (= (and b!797378 res!541890) b!797379))

(assert (= (and b!797379 res!541888) b!797375))

(assert (= (and b!797375 res!541897) b!797372))

(assert (= (and b!797372 res!541892) b!797371))

(assert (= (and b!797371 res!541896) b!797377))

(assert (= (and b!797377 res!541893) b!797374))

(assert (= (and b!797374 res!541894) b!797369))

(assert (= (and b!797369 res!541887) b!797373))

(assert (= (and b!797373 res!541895) b!797376))

(declare-fun m!738221 () Bool)

(assert (=> b!797368 m!738221))

(assert (=> b!797368 m!738221))

(declare-fun m!738223 () Bool)

(assert (=> b!797368 m!738223))

(assert (=> b!797369 m!738221))

(assert (=> b!797369 m!738221))

(declare-fun m!738225 () Bool)

(assert (=> b!797369 m!738225))

(assert (=> b!797369 m!738221))

(declare-fun m!738227 () Bool)

(assert (=> b!797369 m!738227))

(declare-fun m!738229 () Bool)

(assert (=> b!797375 m!738229))

(declare-fun m!738231 () Bool)

(assert (=> b!797371 m!738231))

(declare-fun m!738233 () Bool)

(assert (=> b!797378 m!738233))

(declare-fun m!738235 () Bool)

(assert (=> b!797377 m!738235))

(declare-fun m!738237 () Bool)

(assert (=> b!797377 m!738237))

(declare-fun m!738239 () Bool)

(assert (=> b!797372 m!738239))

(declare-fun m!738241 () Bool)

(assert (=> b!797373 m!738241))

(assert (=> b!797373 m!738221))

(declare-fun m!738243 () Bool)

(assert (=> b!797374 m!738243))

(declare-fun m!738245 () Bool)

(assert (=> b!797374 m!738245))

(declare-fun m!738247 () Bool)

(assert (=> b!797374 m!738247))

(declare-fun m!738249 () Bool)

(assert (=> b!797374 m!738249))

(declare-fun m!738251 () Bool)

(assert (=> start!68554 m!738251))

(declare-fun m!738253 () Bool)

(assert (=> start!68554 m!738253))

(declare-fun m!738255 () Bool)

(assert (=> b!797379 m!738255))

(check-sat (not start!68554) (not b!797378) (not b!797371) (not b!797375) (not b!797369) (not b!797374) (not b!797379) (not b!797372) (not b!797368))
(check-sat)
