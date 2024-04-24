; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68628 () Bool)

(assert start!68628)

(declare-fun b!797163 () Bool)

(declare-fun res!541314 () Bool)

(declare-fun e!442387 () Bool)

(assert (=> b!797163 (=> (not res!541314) (not e!442387))))

(declare-datatypes ((array!43292 0))(
  ( (array!43293 (arr!20722 (Array (_ BitVec 32) (_ BitVec 64))) (size!21142 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43292)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797163 (= res!541314 (validKeyInArray!0 (select (arr!20722 a!3170) j!153)))))

(declare-fun b!797164 () Bool)

(declare-fun e!442389 () Bool)

(declare-fun e!442390 () Bool)

(assert (=> b!797164 (= e!442389 e!442390)))

(declare-fun res!541312 () Bool)

(assert (=> b!797164 (=> (not res!541312) (not e!442390))))

(declare-datatypes ((SeekEntryResult!8269 0))(
  ( (MissingZero!8269 (index!35444 (_ BitVec 32))) (Found!8269 (index!35445 (_ BitVec 32))) (Intermediate!8269 (undefined!9081 Bool) (index!35446 (_ BitVec 32)) (x!66510 (_ BitVec 32))) (Undefined!8269) (MissingVacant!8269 (index!35447 (_ BitVec 32))) )
))
(declare-fun lt!355449 () SeekEntryResult!8269)

(declare-fun lt!355448 () SeekEntryResult!8269)

(assert (=> b!797164 (= res!541312 (= lt!355449 lt!355448))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355451 () array!43292)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355453 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43292 (_ BitVec 32)) SeekEntryResult!8269)

(assert (=> b!797164 (= lt!355448 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355453 lt!355451 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43292 (_ BitVec 32)) SeekEntryResult!8269)

(assert (=> b!797164 (= lt!355449 (seekEntryOrOpen!0 lt!355453 lt!355451 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797164 (= lt!355453 (select (store (arr!20722 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797164 (= lt!355451 (array!43293 (store (arr!20722 a!3170) i!1163 k0!2044) (size!21142 a!3170)))))

(declare-fun b!797165 () Bool)

(declare-fun res!541315 () Bool)

(assert (=> b!797165 (=> (not res!541315) (not e!442389))))

(declare-datatypes ((List!14592 0))(
  ( (Nil!14589) (Cons!14588 (h!15723 (_ BitVec 64)) (t!20899 List!14592)) )
))
(declare-fun arrayNoDuplicates!0 (array!43292 (_ BitVec 32) List!14592) Bool)

(assert (=> b!797165 (= res!541315 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14589))))

(declare-fun b!797166 () Bool)

(declare-fun res!541309 () Bool)

(assert (=> b!797166 (=> (not res!541309) (not e!442387))))

(assert (=> b!797166 (= res!541309 (validKeyInArray!0 k0!2044))))

(declare-fun b!797167 () Bool)

(declare-fun res!541316 () Bool)

(assert (=> b!797167 (=> (not res!541316) (not e!442389))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797167 (= res!541316 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21142 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20722 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21142 a!3170)) (= (select (arr!20722 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!541317 () Bool)

(assert (=> start!68628 (=> (not res!541317) (not e!442387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68628 (= res!541317 (validMask!0 mask!3266))))

(assert (=> start!68628 e!442387))

(assert (=> start!68628 true))

(declare-fun array_inv!16581 (array!43292) Bool)

(assert (=> start!68628 (array_inv!16581 a!3170)))

(declare-fun b!797162 () Bool)

(declare-fun e!442388 () Bool)

(assert (=> b!797162 (= e!442388 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797162 (= lt!355448 (Found!8269 index!1236))))

(declare-fun b!797168 () Bool)

(declare-fun res!541308 () Bool)

(assert (=> b!797168 (=> (not res!541308) (not e!442389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43292 (_ BitVec 32)) Bool)

(assert (=> b!797168 (= res!541308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797169 () Bool)

(assert (=> b!797169 (= e!442387 e!442389)))

(declare-fun res!541311 () Bool)

(assert (=> b!797169 (=> (not res!541311) (not e!442389))))

(declare-fun lt!355447 () SeekEntryResult!8269)

(assert (=> b!797169 (= res!541311 (or (= lt!355447 (MissingZero!8269 i!1163)) (= lt!355447 (MissingVacant!8269 i!1163))))))

(assert (=> b!797169 (= lt!355447 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797170 () Bool)

(declare-fun res!541313 () Bool)

(assert (=> b!797170 (=> (not res!541313) (not e!442387))))

(assert (=> b!797170 (= res!541313 (and (= (size!21142 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21142 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21142 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797171 () Bool)

(declare-fun res!541307 () Bool)

(assert (=> b!797171 (=> (not res!541307) (not e!442387))))

(declare-fun arrayContainsKey!0 (array!43292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797171 (= res!541307 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797172 () Bool)

(assert (=> b!797172 (= e!442390 e!442388)))

(declare-fun res!541310 () Bool)

(assert (=> b!797172 (=> (not res!541310) (not e!442388))))

(declare-fun lt!355450 () SeekEntryResult!8269)

(declare-fun lt!355452 () SeekEntryResult!8269)

(assert (=> b!797172 (= res!541310 (and (= lt!355450 lt!355452) (= lt!355452 (Found!8269 j!153)) (= (select (arr!20722 a!3170) index!1236) (select (arr!20722 a!3170) j!153))))))

(assert (=> b!797172 (= lt!355452 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20722 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797172 (= lt!355450 (seekEntryOrOpen!0 (select (arr!20722 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68628 res!541317) b!797170))

(assert (= (and b!797170 res!541313) b!797163))

(assert (= (and b!797163 res!541314) b!797166))

(assert (= (and b!797166 res!541309) b!797171))

(assert (= (and b!797171 res!541307) b!797169))

(assert (= (and b!797169 res!541311) b!797168))

(assert (= (and b!797168 res!541308) b!797165))

(assert (= (and b!797165 res!541315) b!797167))

(assert (= (and b!797167 res!541316) b!797164))

(assert (= (and b!797164 res!541312) b!797172))

(assert (= (and b!797172 res!541310) b!797162))

(declare-fun m!738383 () Bool)

(assert (=> b!797164 m!738383))

(declare-fun m!738385 () Bool)

(assert (=> b!797164 m!738385))

(declare-fun m!738387 () Bool)

(assert (=> b!797164 m!738387))

(declare-fun m!738389 () Bool)

(assert (=> b!797164 m!738389))

(declare-fun m!738391 () Bool)

(assert (=> b!797169 m!738391))

(declare-fun m!738393 () Bool)

(assert (=> b!797165 m!738393))

(declare-fun m!738395 () Bool)

(assert (=> b!797172 m!738395))

(declare-fun m!738397 () Bool)

(assert (=> b!797172 m!738397))

(assert (=> b!797172 m!738397))

(declare-fun m!738399 () Bool)

(assert (=> b!797172 m!738399))

(assert (=> b!797172 m!738397))

(declare-fun m!738401 () Bool)

(assert (=> b!797172 m!738401))

(declare-fun m!738403 () Bool)

(assert (=> b!797171 m!738403))

(declare-fun m!738405 () Bool)

(assert (=> b!797166 m!738405))

(declare-fun m!738407 () Bool)

(assert (=> b!797168 m!738407))

(assert (=> b!797163 m!738397))

(assert (=> b!797163 m!738397))

(declare-fun m!738409 () Bool)

(assert (=> b!797163 m!738409))

(declare-fun m!738411 () Bool)

(assert (=> start!68628 m!738411))

(declare-fun m!738413 () Bool)

(assert (=> start!68628 m!738413))

(declare-fun m!738415 () Bool)

(assert (=> b!797167 m!738415))

(declare-fun m!738417 () Bool)

(assert (=> b!797167 m!738417))

(check-sat (not b!797163) (not b!797171) (not b!797166) (not b!797164) (not start!68628) (not b!797169) (not b!797172) (not b!797165) (not b!797168))
(check-sat)
