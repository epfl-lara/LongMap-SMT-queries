; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68948 () Bool)

(assert start!68948)

(declare-fun b!802425 () Bool)

(declare-fun res!546398 () Bool)

(declare-fun e!444869 () Bool)

(assert (=> b!802425 (=> (not res!546398) (not e!444869))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43570 0))(
  ( (array!43571 (arr!20860 (Array (_ BitVec 32) (_ BitVec 64))) (size!21280 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43570)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802425 (= res!546398 (and (= (size!21280 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21280 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21280 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802426 () Bool)

(declare-fun res!546407 () Bool)

(assert (=> b!802426 (=> (not res!546407) (not e!444869))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802426 (= res!546407 (validKeyInArray!0 k0!2044))))

(declare-fun b!802427 () Bool)

(declare-fun res!546399 () Bool)

(declare-fun e!444874 () Bool)

(assert (=> b!802427 (=> (not res!546399) (not e!444874))))

(declare-datatypes ((SeekEntryResult!8407 0))(
  ( (MissingZero!8407 (index!35996 (_ BitVec 32))) (Found!8407 (index!35997 (_ BitVec 32))) (Intermediate!8407 (undefined!9219 Bool) (index!35998 (_ BitVec 32)) (x!67019 (_ BitVec 32))) (Undefined!8407) (MissingVacant!8407 (index!35999 (_ BitVec 32))) )
))
(declare-fun lt!358643 () SeekEntryResult!8407)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358644 () (_ BitVec 64))

(declare-fun lt!358640 () array!43570)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358639 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43570 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!802427 (= res!546399 (= lt!358643 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358639 vacantAfter!23 lt!358644 lt!358640 mask!3266)))))

(declare-fun b!802428 () Bool)

(declare-fun e!444870 () Bool)

(declare-fun e!444872 () Bool)

(assert (=> b!802428 (= e!444870 e!444872)))

(declare-fun res!546408 () Bool)

(assert (=> b!802428 (=> (not res!546408) (not e!444872))))

(declare-fun lt!358646 () SeekEntryResult!8407)

(declare-fun lt!358645 () SeekEntryResult!8407)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802428 (= res!546408 (and (= lt!358646 lt!358645) (= lt!358645 (Found!8407 j!153)) (not (= (select (arr!20860 a!3170) index!1236) (select (arr!20860 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802428 (= lt!358645 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43570 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!802428 (= lt!358646 (seekEntryOrOpen!0 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546400 () Bool)

(assert (=> start!68948 (=> (not res!546400) (not e!444869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68948 (= res!546400 (validMask!0 mask!3266))))

(assert (=> start!68948 e!444869))

(assert (=> start!68948 true))

(declare-fun array_inv!16719 (array!43570) Bool)

(assert (=> start!68948 (array_inv!16719 a!3170)))

(declare-fun b!802429 () Bool)

(declare-fun res!546406 () Bool)

(assert (=> b!802429 (=> (not res!546406) (not e!444869))))

(declare-fun arrayContainsKey!0 (array!43570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802429 (= res!546406 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802430 () Bool)

(declare-fun res!546405 () Bool)

(declare-fun e!444871 () Bool)

(assert (=> b!802430 (=> (not res!546405) (not e!444871))))

(assert (=> b!802430 (= res!546405 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21280 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20860 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21280 a!3170)) (= (select (arr!20860 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802431 () Bool)

(assert (=> b!802431 (= e!444872 e!444874)))

(declare-fun res!546402 () Bool)

(assert (=> b!802431 (=> (not res!546402) (not e!444874))))

(assert (=> b!802431 (= res!546402 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358639 #b00000000000000000000000000000000) (bvslt lt!358639 (size!21280 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802431 (= lt!358639 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802432 () Bool)

(assert (=> b!802432 (= e!444874 false)))

(declare-fun lt!358641 () SeekEntryResult!8407)

(assert (=> b!802432 (= lt!358641 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358639 vacantBefore!23 (select (arr!20860 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802433 () Bool)

(declare-fun res!546403 () Bool)

(assert (=> b!802433 (=> (not res!546403) (not e!444871))))

(declare-datatypes ((List!14730 0))(
  ( (Nil!14727) (Cons!14726 (h!15861 (_ BitVec 64)) (t!21037 List!14730)) )
))
(declare-fun arrayNoDuplicates!0 (array!43570 (_ BitVec 32) List!14730) Bool)

(assert (=> b!802433 (= res!546403 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14727))))

(declare-fun b!802434 () Bool)

(declare-fun res!546404 () Bool)

(assert (=> b!802434 (=> (not res!546404) (not e!444869))))

(assert (=> b!802434 (= res!546404 (validKeyInArray!0 (select (arr!20860 a!3170) j!153)))))

(declare-fun b!802435 () Bool)

(declare-fun res!546397 () Bool)

(assert (=> b!802435 (=> (not res!546397) (not e!444871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43570 (_ BitVec 32)) Bool)

(assert (=> b!802435 (= res!546397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802436 () Bool)

(assert (=> b!802436 (= e!444871 e!444870)))

(declare-fun res!546396 () Bool)

(assert (=> b!802436 (=> (not res!546396) (not e!444870))))

(assert (=> b!802436 (= res!546396 (= lt!358643 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358644 lt!358640 mask!3266)))))

(assert (=> b!802436 (= lt!358643 (seekEntryOrOpen!0 lt!358644 lt!358640 mask!3266))))

(assert (=> b!802436 (= lt!358644 (select (store (arr!20860 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802436 (= lt!358640 (array!43571 (store (arr!20860 a!3170) i!1163 k0!2044) (size!21280 a!3170)))))

(declare-fun b!802437 () Bool)

(assert (=> b!802437 (= e!444869 e!444871)))

(declare-fun res!546401 () Bool)

(assert (=> b!802437 (=> (not res!546401) (not e!444871))))

(declare-fun lt!358642 () SeekEntryResult!8407)

(assert (=> b!802437 (= res!546401 (or (= lt!358642 (MissingZero!8407 i!1163)) (= lt!358642 (MissingVacant!8407 i!1163))))))

(assert (=> b!802437 (= lt!358642 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68948 res!546400) b!802425))

(assert (= (and b!802425 res!546398) b!802434))

(assert (= (and b!802434 res!546404) b!802426))

(assert (= (and b!802426 res!546407) b!802429))

(assert (= (and b!802429 res!546406) b!802437))

(assert (= (and b!802437 res!546401) b!802435))

(assert (= (and b!802435 res!546397) b!802433))

(assert (= (and b!802433 res!546403) b!802430))

(assert (= (and b!802430 res!546405) b!802436))

(assert (= (and b!802436 res!546396) b!802428))

(assert (= (and b!802428 res!546408) b!802431))

(assert (= (and b!802431 res!546402) b!802427))

(assert (= (and b!802427 res!546399) b!802432))

(declare-fun m!743965 () Bool)

(assert (=> b!802431 m!743965))

(declare-fun m!743967 () Bool)

(assert (=> b!802436 m!743967))

(declare-fun m!743969 () Bool)

(assert (=> b!802436 m!743969))

(declare-fun m!743971 () Bool)

(assert (=> b!802436 m!743971))

(declare-fun m!743973 () Bool)

(assert (=> b!802436 m!743973))

(declare-fun m!743975 () Bool)

(assert (=> b!802433 m!743975))

(declare-fun m!743977 () Bool)

(assert (=> b!802432 m!743977))

(assert (=> b!802432 m!743977))

(declare-fun m!743979 () Bool)

(assert (=> b!802432 m!743979))

(declare-fun m!743981 () Bool)

(assert (=> b!802435 m!743981))

(declare-fun m!743983 () Bool)

(assert (=> b!802428 m!743983))

(assert (=> b!802428 m!743977))

(assert (=> b!802428 m!743977))

(declare-fun m!743985 () Bool)

(assert (=> b!802428 m!743985))

(assert (=> b!802428 m!743977))

(declare-fun m!743987 () Bool)

(assert (=> b!802428 m!743987))

(declare-fun m!743989 () Bool)

(assert (=> b!802430 m!743989))

(declare-fun m!743991 () Bool)

(assert (=> b!802430 m!743991))

(assert (=> b!802434 m!743977))

(assert (=> b!802434 m!743977))

(declare-fun m!743993 () Bool)

(assert (=> b!802434 m!743993))

(declare-fun m!743995 () Bool)

(assert (=> b!802429 m!743995))

(declare-fun m!743997 () Bool)

(assert (=> b!802427 m!743997))

(declare-fun m!743999 () Bool)

(assert (=> b!802426 m!743999))

(declare-fun m!744001 () Bool)

(assert (=> b!802437 m!744001))

(declare-fun m!744003 () Bool)

(assert (=> start!68948 m!744003))

(declare-fun m!744005 () Bool)

(assert (=> start!68948 m!744005))

(check-sat (not b!802432) (not start!68948) (not b!802435) (not b!802434) (not b!802437) (not b!802431) (not b!802427) (not b!802433) (not b!802429) (not b!802426) (not b!802428) (not b!802436))
(check-sat)
