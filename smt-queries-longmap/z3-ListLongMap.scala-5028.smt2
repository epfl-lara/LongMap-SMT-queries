; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68680 () Bool)

(assert start!68680)

(declare-fun b!799587 () Bool)

(declare-fun res!544116 () Bool)

(declare-fun e!443400 () Bool)

(assert (=> b!799587 (=> (not res!544116) (not e!443400))))

(declare-fun lt!357087 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8406 0))(
  ( (MissingZero!8406 (index!35992 (_ BitVec 32))) (Found!8406 (index!35993 (_ BitVec 32))) (Intermediate!8406 (undefined!9218 Bool) (index!35994 (_ BitVec 32)) (x!66868 (_ BitVec 32))) (Undefined!8406) (MissingVacant!8406 (index!35995 (_ BitVec 32))) )
))
(declare-fun lt!357082 () SeekEntryResult!8406)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357085 () (_ BitVec 64))

(declare-datatypes ((array!43470 0))(
  ( (array!43471 (arr!20815 (Array (_ BitVec 32) (_ BitVec 64))) (size!21236 (_ BitVec 32))) )
))
(declare-fun lt!357084 () array!43470)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43470 (_ BitVec 32)) SeekEntryResult!8406)

(assert (=> b!799587 (= res!544116 (= lt!357082 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357087 vacantAfter!23 lt!357085 lt!357084 mask!3266)))))

(declare-fun b!799588 () Bool)

(assert (=> b!799588 (= e!443400 false)))

(declare-fun lt!357088 () SeekEntryResult!8406)

(declare-fun a!3170 () array!43470)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799588 (= lt!357088 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357087 vacantBefore!23 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799589 () Bool)

(declare-fun res!544111 () Bool)

(declare-fun e!443397 () Bool)

(assert (=> b!799589 (=> (not res!544111) (not e!443397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799589 (= res!544111 (validKeyInArray!0 (select (arr!20815 a!3170) j!153)))))

(declare-fun b!799590 () Bool)

(declare-fun e!443401 () Bool)

(declare-fun e!443399 () Bool)

(assert (=> b!799590 (= e!443401 e!443399)))

(declare-fun res!544108 () Bool)

(assert (=> b!799590 (=> (not res!544108) (not e!443399))))

(declare-fun lt!357083 () SeekEntryResult!8406)

(declare-fun lt!357089 () SeekEntryResult!8406)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799590 (= res!544108 (and (= lt!357083 lt!357089) (= lt!357089 (Found!8406 j!153)) (not (= (select (arr!20815 a!3170) index!1236) (select (arr!20815 a!3170) j!153)))))))

(assert (=> b!799590 (= lt!357089 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43470 (_ BitVec 32)) SeekEntryResult!8406)

(assert (=> b!799590 (= lt!357083 (seekEntryOrOpen!0 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799592 () Bool)

(assert (=> b!799592 (= e!443399 e!443400)))

(declare-fun res!544113 () Bool)

(assert (=> b!799592 (=> (not res!544113) (not e!443400))))

(assert (=> b!799592 (= res!544113 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357087 #b00000000000000000000000000000000) (bvslt lt!357087 (size!21236 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799592 (= lt!357087 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799593 () Bool)

(declare-fun res!544112 () Bool)

(assert (=> b!799593 (=> (not res!544112) (not e!443397))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!799593 (= res!544112 (validKeyInArray!0 k0!2044))))

(declare-fun b!799594 () Bool)

(declare-fun res!544109 () Bool)

(declare-fun e!443402 () Bool)

(assert (=> b!799594 (=> (not res!544109) (not e!443402))))

(declare-datatypes ((List!14778 0))(
  ( (Nil!14775) (Cons!14774 (h!15903 (_ BitVec 64)) (t!21093 List!14778)) )
))
(declare-fun arrayNoDuplicates!0 (array!43470 (_ BitVec 32) List!14778) Bool)

(assert (=> b!799594 (= res!544109 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14775))))

(declare-fun b!799595 () Bool)

(declare-fun res!544117 () Bool)

(assert (=> b!799595 (=> (not res!544117) (not e!443402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43470 (_ BitVec 32)) Bool)

(assert (=> b!799595 (= res!544117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799596 () Bool)

(assert (=> b!799596 (= e!443397 e!443402)))

(declare-fun res!544118 () Bool)

(assert (=> b!799596 (=> (not res!544118) (not e!443402))))

(declare-fun lt!357086 () SeekEntryResult!8406)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799596 (= res!544118 (or (= lt!357086 (MissingZero!8406 i!1163)) (= lt!357086 (MissingVacant!8406 i!1163))))))

(assert (=> b!799596 (= lt!357086 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799597 () Bool)

(declare-fun res!544114 () Bool)

(assert (=> b!799597 (=> (not res!544114) (not e!443402))))

(assert (=> b!799597 (= res!544114 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21236 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20815 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21236 a!3170)) (= (select (arr!20815 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799598 () Bool)

(assert (=> b!799598 (= e!443402 e!443401)))

(declare-fun res!544107 () Bool)

(assert (=> b!799598 (=> (not res!544107) (not e!443401))))

(assert (=> b!799598 (= res!544107 (= lt!357082 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357085 lt!357084 mask!3266)))))

(assert (=> b!799598 (= lt!357082 (seekEntryOrOpen!0 lt!357085 lt!357084 mask!3266))))

(assert (=> b!799598 (= lt!357085 (select (store (arr!20815 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799598 (= lt!357084 (array!43471 (store (arr!20815 a!3170) i!1163 k0!2044) (size!21236 a!3170)))))

(declare-fun b!799599 () Bool)

(declare-fun res!544115 () Bool)

(assert (=> b!799599 (=> (not res!544115) (not e!443397))))

(assert (=> b!799599 (= res!544115 (and (= (size!21236 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21236 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21236 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799591 () Bool)

(declare-fun res!544110 () Bool)

(assert (=> b!799591 (=> (not res!544110) (not e!443397))))

(declare-fun arrayContainsKey!0 (array!43470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799591 (= res!544110 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!544106 () Bool)

(assert (=> start!68680 (=> (not res!544106) (not e!443397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68680 (= res!544106 (validMask!0 mask!3266))))

(assert (=> start!68680 e!443397))

(assert (=> start!68680 true))

(declare-fun array_inv!16611 (array!43470) Bool)

(assert (=> start!68680 (array_inv!16611 a!3170)))

(assert (= (and start!68680 res!544106) b!799599))

(assert (= (and b!799599 res!544115) b!799589))

(assert (= (and b!799589 res!544111) b!799593))

(assert (= (and b!799593 res!544112) b!799591))

(assert (= (and b!799591 res!544110) b!799596))

(assert (= (and b!799596 res!544118) b!799595))

(assert (= (and b!799595 res!544117) b!799594))

(assert (= (and b!799594 res!544109) b!799597))

(assert (= (and b!799597 res!544114) b!799598))

(assert (= (and b!799598 res!544107) b!799590))

(assert (= (and b!799590 res!544108) b!799592))

(assert (= (and b!799592 res!544113) b!799587))

(assert (= (and b!799587 res!544116) b!799588))

(declare-fun m!740609 () Bool)

(assert (=> b!799597 m!740609))

(declare-fun m!740611 () Bool)

(assert (=> b!799597 m!740611))

(declare-fun m!740613 () Bool)

(assert (=> b!799588 m!740613))

(assert (=> b!799588 m!740613))

(declare-fun m!740615 () Bool)

(assert (=> b!799588 m!740615))

(declare-fun m!740617 () Bool)

(assert (=> b!799590 m!740617))

(assert (=> b!799590 m!740613))

(assert (=> b!799590 m!740613))

(declare-fun m!740619 () Bool)

(assert (=> b!799590 m!740619))

(assert (=> b!799590 m!740613))

(declare-fun m!740621 () Bool)

(assert (=> b!799590 m!740621))

(declare-fun m!740623 () Bool)

(assert (=> b!799596 m!740623))

(declare-fun m!740625 () Bool)

(assert (=> b!799591 m!740625))

(declare-fun m!740627 () Bool)

(assert (=> start!68680 m!740627))

(declare-fun m!740629 () Bool)

(assert (=> start!68680 m!740629))

(declare-fun m!740631 () Bool)

(assert (=> b!799594 m!740631))

(declare-fun m!740633 () Bool)

(assert (=> b!799587 m!740633))

(declare-fun m!740635 () Bool)

(assert (=> b!799598 m!740635))

(declare-fun m!740637 () Bool)

(assert (=> b!799598 m!740637))

(declare-fun m!740639 () Bool)

(assert (=> b!799598 m!740639))

(declare-fun m!740641 () Bool)

(assert (=> b!799598 m!740641))

(declare-fun m!740643 () Bool)

(assert (=> b!799595 m!740643))

(assert (=> b!799589 m!740613))

(assert (=> b!799589 m!740613))

(declare-fun m!740645 () Bool)

(assert (=> b!799589 m!740645))

(declare-fun m!740647 () Bool)

(assert (=> b!799592 m!740647))

(declare-fun m!740649 () Bool)

(assert (=> b!799593 m!740649))

(check-sat (not b!799595) (not b!799598) (not b!799591) (not b!799588) (not start!68680) (not b!799590) (not b!799587) (not b!799589) (not b!799594) (not b!799593) (not b!799592) (not b!799596))
(check-sat)
