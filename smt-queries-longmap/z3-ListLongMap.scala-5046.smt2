; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68954 () Bool)

(assert start!68954)

(declare-fun b!802538 () Bool)

(declare-fun e!444923 () Bool)

(assert (=> b!802538 (= e!444923 (not true))))

(declare-datatypes ((array!43576 0))(
  ( (array!43577 (arr!20863 (Array (_ BitVec 32) (_ BitVec 64))) (size!21283 (_ BitVec 32))) )
))
(declare-fun lt!358709 () array!43576)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!43576)

(declare-fun lt!358711 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358713 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8410 0))(
  ( (MissingZero!8410 (index!36008 (_ BitVec 32))) (Found!8410 (index!36009 (_ BitVec 32))) (Intermediate!8410 (undefined!9222 Bool) (index!36010 (_ BitVec 32)) (x!67030 (_ BitVec 32))) (Undefined!8410) (MissingVacant!8410 (index!36011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43576 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!802538 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358711 vacantAfter!23 lt!358713 lt!358709 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358711 vacantBefore!23 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27445 0))(
  ( (Unit!27446) )
))
(declare-fun lt!358715 () Unit!27445)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27445)

(assert (=> b!802538 (= lt!358715 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358711 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802538 (= lt!358711 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802539 () Bool)

(declare-fun res!546517 () Bool)

(declare-fun e!444921 () Bool)

(assert (=> b!802539 (=> (not res!546517) (not e!444921))))

(declare-fun arrayContainsKey!0 (array!43576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802539 (= res!546517 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!546519 () Bool)

(assert (=> start!68954 (=> (not res!546519) (not e!444921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68954 (= res!546519 (validMask!0 mask!3266))))

(assert (=> start!68954 e!444921))

(assert (=> start!68954 true))

(declare-fun array_inv!16722 (array!43576) Bool)

(assert (=> start!68954 (array_inv!16722 a!3170)))

(declare-fun b!802540 () Bool)

(declare-fun res!546510 () Bool)

(declare-fun e!444922 () Bool)

(assert (=> b!802540 (=> (not res!546510) (not e!444922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43576 (_ BitVec 32)) Bool)

(assert (=> b!802540 (= res!546510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802541 () Bool)

(declare-fun res!546509 () Bool)

(assert (=> b!802541 (=> (not res!546509) (not e!444922))))

(assert (=> b!802541 (= res!546509 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21283 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20863 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21283 a!3170)) (= (select (arr!20863 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802542 () Bool)

(declare-fun res!546515 () Bool)

(assert (=> b!802542 (=> (not res!546515) (not e!444921))))

(assert (=> b!802542 (= res!546515 (and (= (size!21283 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21283 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21283 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802543 () Bool)

(declare-fun e!444924 () Bool)

(assert (=> b!802543 (= e!444924 e!444923)))

(declare-fun res!546518 () Bool)

(assert (=> b!802543 (=> (not res!546518) (not e!444923))))

(declare-fun lt!358710 () SeekEntryResult!8410)

(declare-fun lt!358714 () SeekEntryResult!8410)

(assert (=> b!802543 (= res!546518 (and (= lt!358710 lt!358714) (= lt!358714 (Found!8410 j!153)) (not (= (select (arr!20863 a!3170) index!1236) (select (arr!20863 a!3170) j!153)))))))

(assert (=> b!802543 (= lt!358714 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43576 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!802543 (= lt!358710 (seekEntryOrOpen!0 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802544 () Bool)

(assert (=> b!802544 (= e!444922 e!444924)))

(declare-fun res!546511 () Bool)

(assert (=> b!802544 (=> (not res!546511) (not e!444924))))

(assert (=> b!802544 (= res!546511 (= (seekEntryOrOpen!0 lt!358713 lt!358709 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358713 lt!358709 mask!3266)))))

(assert (=> b!802544 (= lt!358713 (select (store (arr!20863 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802544 (= lt!358709 (array!43577 (store (arr!20863 a!3170) i!1163 k0!2044) (size!21283 a!3170)))))

(declare-fun b!802545 () Bool)

(declare-fun res!546516 () Bool)

(assert (=> b!802545 (=> (not res!546516) (not e!444921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802545 (= res!546516 (validKeyInArray!0 k0!2044))))

(declare-fun b!802546 () Bool)

(declare-fun res!546512 () Bool)

(assert (=> b!802546 (=> (not res!546512) (not e!444921))))

(assert (=> b!802546 (= res!546512 (validKeyInArray!0 (select (arr!20863 a!3170) j!153)))))

(declare-fun b!802547 () Bool)

(declare-fun res!546514 () Bool)

(assert (=> b!802547 (=> (not res!546514) (not e!444922))))

(declare-datatypes ((List!14733 0))(
  ( (Nil!14730) (Cons!14729 (h!15864 (_ BitVec 64)) (t!21040 List!14733)) )
))
(declare-fun arrayNoDuplicates!0 (array!43576 (_ BitVec 32) List!14733) Bool)

(assert (=> b!802547 (= res!546514 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14730))))

(declare-fun b!802548 () Bool)

(assert (=> b!802548 (= e!444921 e!444922)))

(declare-fun res!546513 () Bool)

(assert (=> b!802548 (=> (not res!546513) (not e!444922))))

(declare-fun lt!358712 () SeekEntryResult!8410)

(assert (=> b!802548 (= res!546513 (or (= lt!358712 (MissingZero!8410 i!1163)) (= lt!358712 (MissingVacant!8410 i!1163))))))

(assert (=> b!802548 (= lt!358712 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68954 res!546519) b!802542))

(assert (= (and b!802542 res!546515) b!802546))

(assert (= (and b!802546 res!546512) b!802545))

(assert (= (and b!802545 res!546516) b!802539))

(assert (= (and b!802539 res!546517) b!802548))

(assert (= (and b!802548 res!546513) b!802540))

(assert (= (and b!802540 res!546510) b!802547))

(assert (= (and b!802547 res!546514) b!802541))

(assert (= (and b!802541 res!546509) b!802544))

(assert (= (and b!802544 res!546511) b!802543))

(assert (= (and b!802543 res!546518) b!802538))

(declare-fun m!744091 () Bool)

(assert (=> b!802540 m!744091))

(declare-fun m!744093 () Bool)

(assert (=> start!68954 m!744093))

(declare-fun m!744095 () Bool)

(assert (=> start!68954 m!744095))

(declare-fun m!744097 () Bool)

(assert (=> b!802544 m!744097))

(declare-fun m!744099 () Bool)

(assert (=> b!802544 m!744099))

(declare-fun m!744101 () Bool)

(assert (=> b!802544 m!744101))

(declare-fun m!744103 () Bool)

(assert (=> b!802544 m!744103))

(declare-fun m!744105 () Bool)

(assert (=> b!802541 m!744105))

(declare-fun m!744107 () Bool)

(assert (=> b!802541 m!744107))

(declare-fun m!744109 () Bool)

(assert (=> b!802545 m!744109))

(declare-fun m!744111 () Bool)

(assert (=> b!802543 m!744111))

(declare-fun m!744113 () Bool)

(assert (=> b!802543 m!744113))

(assert (=> b!802543 m!744113))

(declare-fun m!744115 () Bool)

(assert (=> b!802543 m!744115))

(assert (=> b!802543 m!744113))

(declare-fun m!744117 () Bool)

(assert (=> b!802543 m!744117))

(declare-fun m!744119 () Bool)

(assert (=> b!802539 m!744119))

(declare-fun m!744121 () Bool)

(assert (=> b!802548 m!744121))

(declare-fun m!744123 () Bool)

(assert (=> b!802547 m!744123))

(declare-fun m!744125 () Bool)

(assert (=> b!802538 m!744125))

(assert (=> b!802538 m!744113))

(declare-fun m!744127 () Bool)

(assert (=> b!802538 m!744127))

(assert (=> b!802538 m!744113))

(declare-fun m!744129 () Bool)

(assert (=> b!802538 m!744129))

(declare-fun m!744131 () Bool)

(assert (=> b!802538 m!744131))

(assert (=> b!802546 m!744113))

(assert (=> b!802546 m!744113))

(declare-fun m!744133 () Bool)

(assert (=> b!802546 m!744133))

(check-sat (not b!802539) (not b!802545) (not b!802548) (not b!802540) (not b!802547) (not b!802546) (not b!802543) (not b!802544) (not start!68954) (not b!802538))
(check-sat)
