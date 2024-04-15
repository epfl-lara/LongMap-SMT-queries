; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68688 () Bool)

(assert start!68688)

(declare-fun b!799883 () Bool)

(declare-fun res!544548 () Bool)

(declare-fun e!443497 () Bool)

(assert (=> b!799883 (=> (not res!544548) (not e!443497))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43495 0))(
  ( (array!43496 (arr!20828 (Array (_ BitVec 32) (_ BitVec 64))) (size!21249 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43495)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799883 (= res!544548 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21249 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20828 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21249 a!3170)) (= (select (arr!20828 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799884 () Bool)

(declare-fun res!544554 () Bool)

(declare-fun e!443496 () Bool)

(assert (=> b!799884 (=> (not res!544554) (not e!443496))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799884 (= res!544554 (validKeyInArray!0 k0!2044))))

(declare-fun b!799885 () Bool)

(declare-fun res!544546 () Bool)

(assert (=> b!799885 (=> (not res!544546) (not e!443496))))

(declare-fun arrayContainsKey!0 (array!43495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799885 (= res!544546 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!544552 () Bool)

(assert (=> start!68688 (=> (not res!544552) (not e!443496))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68688 (= res!544552 (validMask!0 mask!3266))))

(assert (=> start!68688 e!443496))

(assert (=> start!68688 true))

(declare-fun array_inv!16711 (array!43495) Bool)

(assert (=> start!68688 (array_inv!16711 a!3170)))

(declare-fun b!799886 () Bool)

(declare-fun e!443499 () Bool)

(declare-fun e!443498 () Bool)

(assert (=> b!799886 (= e!443499 e!443498)))

(declare-fun res!544549 () Bool)

(assert (=> b!799886 (=> (not res!544549) (not e!443498))))

(declare-fun lt!357179 () (_ BitVec 32))

(assert (=> b!799886 (= res!544549 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357179 #b00000000000000000000000000000000) (bvslt lt!357179 (size!21249 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799886 (= lt!357179 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799887 () Bool)

(declare-fun res!544544 () Bool)

(assert (=> b!799887 (=> (not res!544544) (not e!443496))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799887 (= res!544544 (and (= (size!21249 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21249 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21249 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799888 () Bool)

(declare-fun res!544545 () Bool)

(assert (=> b!799888 (=> (not res!544545) (not e!443497))))

(declare-datatypes ((List!14830 0))(
  ( (Nil!14827) (Cons!14826 (h!15955 (_ BitVec 64)) (t!21136 List!14830)) )
))
(declare-fun arrayNoDuplicates!0 (array!43495 (_ BitVec 32) List!14830) Bool)

(assert (=> b!799888 (= res!544545 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14827))))

(declare-fun b!799889 () Bool)

(declare-fun res!544553 () Bool)

(assert (=> b!799889 (=> (not res!544553) (not e!443496))))

(assert (=> b!799889 (= res!544553 (validKeyInArray!0 (select (arr!20828 a!3170) j!153)))))

(declare-fun b!799890 () Bool)

(declare-fun res!544551 () Bool)

(assert (=> b!799890 (=> (not res!544551) (not e!443497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43495 (_ BitVec 32)) Bool)

(assert (=> b!799890 (= res!544551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799891 () Bool)

(declare-fun e!443495 () Bool)

(assert (=> b!799891 (= e!443495 e!443499)))

(declare-fun res!544550 () Bool)

(assert (=> b!799891 (=> (not res!544550) (not e!443499))))

(declare-datatypes ((SeekEntryResult!8416 0))(
  ( (MissingZero!8416 (index!36032 (_ BitVec 32))) (Found!8416 (index!36033 (_ BitVec 32))) (Intermediate!8416 (undefined!9228 Bool) (index!36034 (_ BitVec 32)) (x!66913 (_ BitVec 32))) (Undefined!8416) (MissingVacant!8416 (index!36035 (_ BitVec 32))) )
))
(declare-fun lt!357181 () SeekEntryResult!8416)

(declare-fun lt!357183 () SeekEntryResult!8416)

(assert (=> b!799891 (= res!544550 (and (= lt!357183 lt!357181) (= lt!357181 (Found!8416 j!153)) (not (= (select (arr!20828 a!3170) index!1236) (select (arr!20828 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43495 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!799891 (= lt!357181 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43495 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!799891 (= lt!357183 (seekEntryOrOpen!0 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799892 () Bool)

(assert (=> b!799892 (= e!443498 false)))

(declare-fun lt!357184 () SeekEntryResult!8416)

(assert (=> b!799892 (= lt!357184 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357179 vacantBefore!23 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799893 () Bool)

(assert (=> b!799893 (= e!443497 e!443495)))

(declare-fun res!544542 () Bool)

(assert (=> b!799893 (=> (not res!544542) (not e!443495))))

(declare-fun lt!357180 () SeekEntryResult!8416)

(declare-fun lt!357185 () (_ BitVec 64))

(declare-fun lt!357178 () array!43495)

(assert (=> b!799893 (= res!544542 (= lt!357180 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357185 lt!357178 mask!3266)))))

(assert (=> b!799893 (= lt!357180 (seekEntryOrOpen!0 lt!357185 lt!357178 mask!3266))))

(assert (=> b!799893 (= lt!357185 (select (store (arr!20828 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799893 (= lt!357178 (array!43496 (store (arr!20828 a!3170) i!1163 k0!2044) (size!21249 a!3170)))))

(declare-fun b!799894 () Bool)

(assert (=> b!799894 (= e!443496 e!443497)))

(declare-fun res!544547 () Bool)

(assert (=> b!799894 (=> (not res!544547) (not e!443497))))

(declare-fun lt!357182 () SeekEntryResult!8416)

(assert (=> b!799894 (= res!544547 (or (= lt!357182 (MissingZero!8416 i!1163)) (= lt!357182 (MissingVacant!8416 i!1163))))))

(assert (=> b!799894 (= lt!357182 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799895 () Bool)

(declare-fun res!544543 () Bool)

(assert (=> b!799895 (=> (not res!544543) (not e!443498))))

(assert (=> b!799895 (= res!544543 (= lt!357180 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357179 vacantAfter!23 lt!357185 lt!357178 mask!3266)))))

(assert (= (and start!68688 res!544552) b!799887))

(assert (= (and b!799887 res!544544) b!799889))

(assert (= (and b!799889 res!544553) b!799884))

(assert (= (and b!799884 res!544554) b!799885))

(assert (= (and b!799885 res!544546) b!799894))

(assert (= (and b!799894 res!544547) b!799890))

(assert (= (and b!799890 res!544551) b!799888))

(assert (= (and b!799888 res!544545) b!799883))

(assert (= (and b!799883 res!544548) b!799893))

(assert (= (and b!799893 res!544542) b!799891))

(assert (= (and b!799891 res!544550) b!799886))

(assert (= (and b!799886 res!544549) b!799895))

(assert (= (and b!799895 res!544543) b!799892))

(declare-fun m!740455 () Bool)

(assert (=> b!799892 m!740455))

(assert (=> b!799892 m!740455))

(declare-fun m!740457 () Bool)

(assert (=> b!799892 m!740457))

(declare-fun m!740459 () Bool)

(assert (=> b!799888 m!740459))

(declare-fun m!740461 () Bool)

(assert (=> b!799885 m!740461))

(declare-fun m!740463 () Bool)

(assert (=> b!799886 m!740463))

(declare-fun m!740465 () Bool)

(assert (=> b!799884 m!740465))

(declare-fun m!740467 () Bool)

(assert (=> b!799893 m!740467))

(declare-fun m!740469 () Bool)

(assert (=> b!799893 m!740469))

(declare-fun m!740471 () Bool)

(assert (=> b!799893 m!740471))

(declare-fun m!740473 () Bool)

(assert (=> b!799893 m!740473))

(declare-fun m!740475 () Bool)

(assert (=> start!68688 m!740475))

(declare-fun m!740477 () Bool)

(assert (=> start!68688 m!740477))

(declare-fun m!740479 () Bool)

(assert (=> b!799891 m!740479))

(assert (=> b!799891 m!740455))

(assert (=> b!799891 m!740455))

(declare-fun m!740481 () Bool)

(assert (=> b!799891 m!740481))

(assert (=> b!799891 m!740455))

(declare-fun m!740483 () Bool)

(assert (=> b!799891 m!740483))

(declare-fun m!740485 () Bool)

(assert (=> b!799890 m!740485))

(assert (=> b!799889 m!740455))

(assert (=> b!799889 m!740455))

(declare-fun m!740487 () Bool)

(assert (=> b!799889 m!740487))

(declare-fun m!740489 () Bool)

(assert (=> b!799883 m!740489))

(declare-fun m!740491 () Bool)

(assert (=> b!799883 m!740491))

(declare-fun m!740493 () Bool)

(assert (=> b!799895 m!740493))

(declare-fun m!740495 () Bool)

(assert (=> b!799894 m!740495))

(check-sat (not b!799889) (not b!799890) (not b!799888) (not b!799892) (not start!68688) (not b!799893) (not b!799885) (not b!799884) (not b!799895) (not b!799886) (not b!799891) (not b!799894))
(check-sat)
