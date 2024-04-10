; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68716 () Bool)

(assert start!68716)

(declare-fun b!800289 () Bool)

(declare-fun res!544814 () Bool)

(declare-fun e!443721 () Bool)

(assert (=> b!800289 (=> (not res!544814) (not e!443721))))

(declare-datatypes ((array!43506 0))(
  ( (array!43507 (arr!20833 (Array (_ BitVec 32) (_ BitVec 64))) (size!21254 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43506)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800289 (= res!544814 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800290 () Bool)

(declare-fun e!443722 () Bool)

(declare-fun e!443725 () Bool)

(assert (=> b!800290 (= e!443722 e!443725)))

(declare-fun res!544812 () Bool)

(assert (=> b!800290 (=> (not res!544812) (not e!443725))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8424 0))(
  ( (MissingZero!8424 (index!36064 (_ BitVec 32))) (Found!8424 (index!36065 (_ BitVec 32))) (Intermediate!8424 (undefined!9236 Bool) (index!36066 (_ BitVec 32)) (x!66934 (_ BitVec 32))) (Undefined!8424) (MissingVacant!8424 (index!36067 (_ BitVec 32))) )
))
(declare-fun lt!357517 () SeekEntryResult!8424)

(declare-fun lt!357514 () SeekEntryResult!8424)

(assert (=> b!800290 (= res!544812 (and (= lt!357514 lt!357517) (= lt!357517 (Found!8424 j!153)) (not (= (select (arr!20833 a!3170) index!1236) (select (arr!20833 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43506 (_ BitVec 32)) SeekEntryResult!8424)

(assert (=> b!800290 (= lt!357517 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43506 (_ BitVec 32)) SeekEntryResult!8424)

(assert (=> b!800290 (= lt!357514 (seekEntryOrOpen!0 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800291 () Bool)

(declare-fun res!544817 () Bool)

(assert (=> b!800291 (=> (not res!544817) (not e!443721))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800291 (= res!544817 (and (= (size!21254 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21254 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21254 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800292 () Bool)

(declare-fun res!544820 () Bool)

(declare-fun e!443723 () Bool)

(assert (=> b!800292 (=> (not res!544820) (not e!443723))))

(declare-datatypes ((List!14796 0))(
  ( (Nil!14793) (Cons!14792 (h!15921 (_ BitVec 64)) (t!21111 List!14796)) )
))
(declare-fun arrayNoDuplicates!0 (array!43506 (_ BitVec 32) List!14796) Bool)

(assert (=> b!800292 (= res!544820 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14793))))

(declare-fun b!800293 () Bool)

(declare-fun res!544819 () Bool)

(assert (=> b!800293 (=> (not res!544819) (not e!443721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800293 (= res!544819 (validKeyInArray!0 k0!2044))))

(declare-fun b!800294 () Bool)

(assert (=> b!800294 (= e!443723 e!443722)))

(declare-fun res!544815 () Bool)

(assert (=> b!800294 (=> (not res!544815) (not e!443722))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357520 () (_ BitVec 64))

(declare-fun lt!357515 () SeekEntryResult!8424)

(declare-fun lt!357519 () array!43506)

(assert (=> b!800294 (= res!544815 (= lt!357515 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357520 lt!357519 mask!3266)))))

(assert (=> b!800294 (= lt!357515 (seekEntryOrOpen!0 lt!357520 lt!357519 mask!3266))))

(assert (=> b!800294 (= lt!357520 (select (store (arr!20833 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800294 (= lt!357519 (array!43507 (store (arr!20833 a!3170) i!1163 k0!2044) (size!21254 a!3170)))))

(declare-fun b!800296 () Bool)

(declare-fun res!544810 () Bool)

(assert (=> b!800296 (=> (not res!544810) (not e!443723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43506 (_ BitVec 32)) Bool)

(assert (=> b!800296 (= res!544810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800297 () Bool)

(assert (=> b!800297 (= e!443721 e!443723)))

(declare-fun res!544816 () Bool)

(assert (=> b!800297 (=> (not res!544816) (not e!443723))))

(declare-fun lt!357521 () SeekEntryResult!8424)

(assert (=> b!800297 (= res!544816 (or (= lt!357521 (MissingZero!8424 i!1163)) (= lt!357521 (MissingVacant!8424 i!1163))))))

(assert (=> b!800297 (= lt!357521 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800298 () Bool)

(declare-fun res!544818 () Bool)

(assert (=> b!800298 (=> (not res!544818) (not e!443723))))

(assert (=> b!800298 (= res!544818 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21254 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20833 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21254 a!3170)) (= (select (arr!20833 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800299 () Bool)

(declare-fun res!544808 () Bool)

(assert (=> b!800299 (=> (not res!544808) (not e!443721))))

(assert (=> b!800299 (= res!544808 (validKeyInArray!0 (select (arr!20833 a!3170) j!153)))))

(declare-fun b!800300 () Bool)

(declare-fun e!443726 () Bool)

(assert (=> b!800300 (= e!443726 false)))

(declare-fun lt!357518 () SeekEntryResult!8424)

(declare-fun lt!357516 () (_ BitVec 32))

(assert (=> b!800300 (= lt!357518 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357516 vacantBefore!23 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800301 () Bool)

(declare-fun res!544809 () Bool)

(assert (=> b!800301 (=> (not res!544809) (not e!443726))))

(assert (=> b!800301 (= res!544809 (= lt!357515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357516 vacantAfter!23 lt!357520 lt!357519 mask!3266)))))

(declare-fun res!544813 () Bool)

(assert (=> start!68716 (=> (not res!544813) (not e!443721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68716 (= res!544813 (validMask!0 mask!3266))))

(assert (=> start!68716 e!443721))

(assert (=> start!68716 true))

(declare-fun array_inv!16629 (array!43506) Bool)

(assert (=> start!68716 (array_inv!16629 a!3170)))

(declare-fun b!800295 () Bool)

(assert (=> b!800295 (= e!443725 e!443726)))

(declare-fun res!544811 () Bool)

(assert (=> b!800295 (=> (not res!544811) (not e!443726))))

(assert (=> b!800295 (= res!544811 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357516 #b00000000000000000000000000000000) (bvslt lt!357516 (size!21254 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800295 (= lt!357516 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68716 res!544813) b!800291))

(assert (= (and b!800291 res!544817) b!800299))

(assert (= (and b!800299 res!544808) b!800293))

(assert (= (and b!800293 res!544819) b!800289))

(assert (= (and b!800289 res!544814) b!800297))

(assert (= (and b!800297 res!544816) b!800296))

(assert (= (and b!800296 res!544810) b!800292))

(assert (= (and b!800292 res!544820) b!800298))

(assert (= (and b!800298 res!544818) b!800294))

(assert (= (and b!800294 res!544815) b!800290))

(assert (= (and b!800290 res!544812) b!800295))

(assert (= (and b!800295 res!544811) b!800301))

(assert (= (and b!800301 res!544809) b!800300))

(declare-fun m!741365 () Bool)

(assert (=> b!800296 m!741365))

(declare-fun m!741367 () Bool)

(assert (=> b!800292 m!741367))

(declare-fun m!741369 () Bool)

(assert (=> b!800290 m!741369))

(declare-fun m!741371 () Bool)

(assert (=> b!800290 m!741371))

(assert (=> b!800290 m!741371))

(declare-fun m!741373 () Bool)

(assert (=> b!800290 m!741373))

(assert (=> b!800290 m!741371))

(declare-fun m!741375 () Bool)

(assert (=> b!800290 m!741375))

(declare-fun m!741377 () Bool)

(assert (=> b!800301 m!741377))

(declare-fun m!741379 () Bool)

(assert (=> b!800295 m!741379))

(declare-fun m!741381 () Bool)

(assert (=> b!800289 m!741381))

(assert (=> b!800299 m!741371))

(assert (=> b!800299 m!741371))

(declare-fun m!741383 () Bool)

(assert (=> b!800299 m!741383))

(declare-fun m!741385 () Bool)

(assert (=> start!68716 m!741385))

(declare-fun m!741387 () Bool)

(assert (=> start!68716 m!741387))

(declare-fun m!741389 () Bool)

(assert (=> b!800294 m!741389))

(declare-fun m!741391 () Bool)

(assert (=> b!800294 m!741391))

(declare-fun m!741393 () Bool)

(assert (=> b!800294 m!741393))

(declare-fun m!741395 () Bool)

(assert (=> b!800294 m!741395))

(declare-fun m!741397 () Bool)

(assert (=> b!800298 m!741397))

(declare-fun m!741399 () Bool)

(assert (=> b!800298 m!741399))

(declare-fun m!741401 () Bool)

(assert (=> b!800293 m!741401))

(declare-fun m!741403 () Bool)

(assert (=> b!800297 m!741403))

(assert (=> b!800300 m!741371))

(assert (=> b!800300 m!741371))

(declare-fun m!741405 () Bool)

(assert (=> b!800300 m!741405))

(check-sat (not b!800293) (not b!800299) (not b!800301) (not b!800294) (not b!800290) (not b!800292) (not b!800297) (not b!800296) (not b!800289) (not b!800295) (not start!68716) (not b!800300))
(check-sat)
