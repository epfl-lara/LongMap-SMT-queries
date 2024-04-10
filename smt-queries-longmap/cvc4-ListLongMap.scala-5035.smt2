; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68724 () Bool)

(assert start!68724)

(declare-fun b!800445 () Bool)

(declare-fun res!544973 () Bool)

(declare-fun e!443793 () Bool)

(assert (=> b!800445 (=> (not res!544973) (not e!443793))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43514 0))(
  ( (array!43515 (arr!20837 (Array (_ BitVec 32) (_ BitVec 64))) (size!21258 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43514)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800445 (= res!544973 (and (= (size!21258 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21258 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21258 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800446 () Bool)

(declare-fun e!443796 () Bool)

(declare-fun e!443795 () Bool)

(assert (=> b!800446 (= e!443796 e!443795)))

(declare-fun res!544969 () Bool)

(assert (=> b!800446 (=> (not res!544969) (not e!443795))))

(declare-datatypes ((SeekEntryResult!8428 0))(
  ( (MissingZero!8428 (index!36080 (_ BitVec 32))) (Found!8428 (index!36081 (_ BitVec 32))) (Intermediate!8428 (undefined!9240 Bool) (index!36082 (_ BitVec 32)) (x!66946 (_ BitVec 32))) (Undefined!8428) (MissingVacant!8428 (index!36083 (_ BitVec 32))) )
))
(declare-fun lt!357610 () SeekEntryResult!8428)

(declare-fun lt!357614 () SeekEntryResult!8428)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800446 (= res!544969 (and (= lt!357610 lt!357614) (= lt!357614 (Found!8428 j!153)) (not (= (select (arr!20837 a!3170) index!1236) (select (arr!20837 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43514 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!800446 (= lt!357614 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43514 (_ BitVec 32)) SeekEntryResult!8428)

(assert (=> b!800446 (= lt!357610 (seekEntryOrOpen!0 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800447 () Bool)

(declare-fun res!544965 () Bool)

(declare-fun e!443797 () Bool)

(assert (=> b!800447 (=> (not res!544965) (not e!443797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43514 (_ BitVec 32)) Bool)

(assert (=> b!800447 (= res!544965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800448 () Bool)

(assert (=> b!800448 (= e!443797 e!443796)))

(declare-fun res!544974 () Bool)

(assert (=> b!800448 (=> (not res!544974) (not e!443796))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357613 () (_ BitVec 64))

(declare-fun lt!357615 () SeekEntryResult!8428)

(declare-fun lt!357616 () array!43514)

(assert (=> b!800448 (= res!544974 (= lt!357615 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357613 lt!357616 mask!3266)))))

(assert (=> b!800448 (= lt!357615 (seekEntryOrOpen!0 lt!357613 lt!357616 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!800448 (= lt!357613 (select (store (arr!20837 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800448 (= lt!357616 (array!43515 (store (arr!20837 a!3170) i!1163 k!2044) (size!21258 a!3170)))))

(declare-fun b!800449 () Bool)

(declare-fun res!544964 () Bool)

(declare-fun e!443794 () Bool)

(assert (=> b!800449 (=> (not res!544964) (not e!443794))))

(declare-fun lt!357611 () (_ BitVec 32))

(assert (=> b!800449 (= res!544964 (= lt!357615 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357611 vacantAfter!23 lt!357613 lt!357616 mask!3266)))))

(declare-fun b!800450 () Bool)

(assert (=> b!800450 (= e!443795 e!443794)))

(declare-fun res!544975 () Bool)

(assert (=> b!800450 (=> (not res!544975) (not e!443794))))

(assert (=> b!800450 (= res!544975 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357611 #b00000000000000000000000000000000) (bvslt lt!357611 (size!21258 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800450 (= lt!357611 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800451 () Bool)

(declare-fun res!544972 () Bool)

(assert (=> b!800451 (=> (not res!544972) (not e!443793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800451 (= res!544972 (validKeyInArray!0 (select (arr!20837 a!3170) j!153)))))

(declare-fun b!800452 () Bool)

(declare-fun res!544971 () Bool)

(assert (=> b!800452 (=> (not res!544971) (not e!443797))))

(declare-datatypes ((List!14800 0))(
  ( (Nil!14797) (Cons!14796 (h!15925 (_ BitVec 64)) (t!21115 List!14800)) )
))
(declare-fun arrayNoDuplicates!0 (array!43514 (_ BitVec 32) List!14800) Bool)

(assert (=> b!800452 (= res!544971 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14797))))

(declare-fun b!800453 () Bool)

(declare-fun res!544970 () Bool)

(assert (=> b!800453 (=> (not res!544970) (not e!443797))))

(assert (=> b!800453 (= res!544970 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21258 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20837 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21258 a!3170)) (= (select (arr!20837 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800454 () Bool)

(declare-fun res!544968 () Bool)

(assert (=> b!800454 (=> (not res!544968) (not e!443793))))

(declare-fun arrayContainsKey!0 (array!43514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800454 (= res!544968 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800455 () Bool)

(assert (=> b!800455 (= e!443793 e!443797)))

(declare-fun res!544967 () Bool)

(assert (=> b!800455 (=> (not res!544967) (not e!443797))))

(declare-fun lt!357617 () SeekEntryResult!8428)

(assert (=> b!800455 (= res!544967 (or (= lt!357617 (MissingZero!8428 i!1163)) (= lt!357617 (MissingVacant!8428 i!1163))))))

(assert (=> b!800455 (= lt!357617 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800456 () Bool)

(assert (=> b!800456 (= e!443794 false)))

(declare-fun lt!357612 () SeekEntryResult!8428)

(assert (=> b!800456 (= lt!357612 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357611 vacantBefore!23 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544976 () Bool)

(assert (=> start!68724 (=> (not res!544976) (not e!443793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68724 (= res!544976 (validMask!0 mask!3266))))

(assert (=> start!68724 e!443793))

(assert (=> start!68724 true))

(declare-fun array_inv!16633 (array!43514) Bool)

(assert (=> start!68724 (array_inv!16633 a!3170)))

(declare-fun b!800457 () Bool)

(declare-fun res!544966 () Bool)

(assert (=> b!800457 (=> (not res!544966) (not e!443793))))

(assert (=> b!800457 (= res!544966 (validKeyInArray!0 k!2044))))

(assert (= (and start!68724 res!544976) b!800445))

(assert (= (and b!800445 res!544973) b!800451))

(assert (= (and b!800451 res!544972) b!800457))

(assert (= (and b!800457 res!544966) b!800454))

(assert (= (and b!800454 res!544968) b!800455))

(assert (= (and b!800455 res!544967) b!800447))

(assert (= (and b!800447 res!544965) b!800452))

(assert (= (and b!800452 res!544971) b!800453))

(assert (= (and b!800453 res!544970) b!800448))

(assert (= (and b!800448 res!544974) b!800446))

(assert (= (and b!800446 res!544969) b!800450))

(assert (= (and b!800450 res!544975) b!800449))

(assert (= (and b!800449 res!544964) b!800456))

(declare-fun m!741533 () Bool)

(assert (=> b!800455 m!741533))

(declare-fun m!741535 () Bool)

(assert (=> b!800456 m!741535))

(assert (=> b!800456 m!741535))

(declare-fun m!741537 () Bool)

(assert (=> b!800456 m!741537))

(declare-fun m!741539 () Bool)

(assert (=> b!800454 m!741539))

(assert (=> b!800451 m!741535))

(assert (=> b!800451 m!741535))

(declare-fun m!741541 () Bool)

(assert (=> b!800451 m!741541))

(declare-fun m!741543 () Bool)

(assert (=> b!800448 m!741543))

(declare-fun m!741545 () Bool)

(assert (=> b!800448 m!741545))

(declare-fun m!741547 () Bool)

(assert (=> b!800448 m!741547))

(declare-fun m!741549 () Bool)

(assert (=> b!800448 m!741549))

(declare-fun m!741551 () Bool)

(assert (=> b!800447 m!741551))

(declare-fun m!741553 () Bool)

(assert (=> b!800452 m!741553))

(declare-fun m!741555 () Bool)

(assert (=> b!800446 m!741555))

(assert (=> b!800446 m!741535))

(assert (=> b!800446 m!741535))

(declare-fun m!741557 () Bool)

(assert (=> b!800446 m!741557))

(assert (=> b!800446 m!741535))

(declare-fun m!741559 () Bool)

(assert (=> b!800446 m!741559))

(declare-fun m!741561 () Bool)

(assert (=> b!800453 m!741561))

(declare-fun m!741563 () Bool)

(assert (=> b!800453 m!741563))

(declare-fun m!741565 () Bool)

(assert (=> b!800449 m!741565))

(declare-fun m!741567 () Bool)

(assert (=> b!800457 m!741567))

(declare-fun m!741569 () Bool)

(assert (=> start!68724 m!741569))

(declare-fun m!741571 () Bool)

(assert (=> start!68724 m!741571))

(declare-fun m!741573 () Bool)

(assert (=> b!800450 m!741573))

(push 1)

