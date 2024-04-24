; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68858 () Bool)

(assert start!68858)

(declare-fun b!800670 () Bool)

(declare-fun res!544653 () Bool)

(declare-fun e!444061 () Bool)

(assert (=> b!800670 (=> (not res!544653) (not e!444061))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43480 0))(
  ( (array!43481 (arr!20815 (Array (_ BitVec 32) (_ BitVec 64))) (size!21235 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43480)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800670 (= res!544653 (and (= (size!21235 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21235 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21235 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800671 () Bool)

(declare-fun e!444059 () Bool)

(declare-fun e!444062 () Bool)

(assert (=> b!800671 (= e!444059 e!444062)))

(declare-fun res!544648 () Bool)

(assert (=> b!800671 (=> (not res!544648) (not e!444062))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357559 () (_ BitVec 32))

(assert (=> b!800671 (= res!544648 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357559 #b00000000000000000000000000000000) (bvslt lt!357559 (size!21235 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800671 (= lt!357559 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800672 () Bool)

(declare-fun e!444064 () Bool)

(assert (=> b!800672 (= e!444064 e!444059)))

(declare-fun res!544643 () Bool)

(assert (=> b!800672 (=> (not res!544643) (not e!444059))))

(declare-datatypes ((SeekEntryResult!8362 0))(
  ( (MissingZero!8362 (index!35816 (_ BitVec 32))) (Found!8362 (index!35817 (_ BitVec 32))) (Intermediate!8362 (undefined!9174 Bool) (index!35818 (_ BitVec 32)) (x!66854 (_ BitVec 32))) (Undefined!8362) (MissingVacant!8362 (index!35819 (_ BitVec 32))) )
))
(declare-fun lt!357560 () SeekEntryResult!8362)

(declare-fun lt!357564 () SeekEntryResult!8362)

(assert (=> b!800672 (= res!544643 (and (= lt!357564 lt!357560) (= lt!357560 (Found!8362 j!153)) (not (= (select (arr!20815 a!3170) index!1236) (select (arr!20815 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43480 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!800672 (= lt!357560 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43480 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!800672 (= lt!357564 (seekEntryOrOpen!0 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544647 () Bool)

(assert (=> start!68858 (=> (not res!544647) (not e!444061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68858 (= res!544647 (validMask!0 mask!3266))))

(assert (=> start!68858 e!444061))

(assert (=> start!68858 true))

(declare-fun array_inv!16674 (array!43480) Bool)

(assert (=> start!68858 (array_inv!16674 a!3170)))

(declare-fun b!800673 () Bool)

(declare-fun res!544652 () Bool)

(assert (=> b!800673 (=> (not res!544652) (not e!444061))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800673 (= res!544652 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800674 () Bool)

(declare-fun e!444060 () Bool)

(assert (=> b!800674 (= e!444060 e!444064)))

(declare-fun res!544641 () Bool)

(assert (=> b!800674 (=> (not res!544641) (not e!444064))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357563 () array!43480)

(declare-fun lt!357566 () (_ BitVec 64))

(declare-fun lt!357565 () SeekEntryResult!8362)

(assert (=> b!800674 (= res!544641 (= lt!357565 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357566 lt!357563 mask!3266)))))

(assert (=> b!800674 (= lt!357565 (seekEntryOrOpen!0 lt!357566 lt!357563 mask!3266))))

(assert (=> b!800674 (= lt!357566 (select (store (arr!20815 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800674 (= lt!357563 (array!43481 (store (arr!20815 a!3170) i!1163 k0!2044) (size!21235 a!3170)))))

(declare-fun b!800675 () Bool)

(declare-fun res!544651 () Bool)

(assert (=> b!800675 (=> (not res!544651) (not e!444062))))

(assert (=> b!800675 (= res!544651 (= lt!357565 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357559 vacantAfter!23 lt!357566 lt!357563 mask!3266)))))

(declare-fun b!800676 () Bool)

(declare-fun res!544645 () Bool)

(assert (=> b!800676 (=> (not res!544645) (not e!444061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800676 (= res!544645 (validKeyInArray!0 (select (arr!20815 a!3170) j!153)))))

(declare-fun b!800677 () Bool)

(declare-fun res!544649 () Bool)

(assert (=> b!800677 (=> (not res!544649) (not e!444060))))

(assert (=> b!800677 (= res!544649 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21235 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20815 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21235 a!3170)) (= (select (arr!20815 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800678 () Bool)

(declare-fun res!544650 () Bool)

(assert (=> b!800678 (=> (not res!544650) (not e!444060))))

(declare-datatypes ((List!14685 0))(
  ( (Nil!14682) (Cons!14681 (h!15816 (_ BitVec 64)) (t!20992 List!14685)) )
))
(declare-fun arrayNoDuplicates!0 (array!43480 (_ BitVec 32) List!14685) Bool)

(assert (=> b!800678 (= res!544650 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14682))))

(declare-fun b!800679 () Bool)

(declare-fun res!544644 () Bool)

(assert (=> b!800679 (=> (not res!544644) (not e!444061))))

(assert (=> b!800679 (= res!544644 (validKeyInArray!0 k0!2044))))

(declare-fun b!800680 () Bool)

(assert (=> b!800680 (= e!444062 false)))

(declare-fun lt!357561 () SeekEntryResult!8362)

(assert (=> b!800680 (= lt!357561 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357559 vacantBefore!23 (select (arr!20815 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800681 () Bool)

(assert (=> b!800681 (= e!444061 e!444060)))

(declare-fun res!544646 () Bool)

(assert (=> b!800681 (=> (not res!544646) (not e!444060))))

(declare-fun lt!357562 () SeekEntryResult!8362)

(assert (=> b!800681 (= res!544646 (or (= lt!357562 (MissingZero!8362 i!1163)) (= lt!357562 (MissingVacant!8362 i!1163))))))

(assert (=> b!800681 (= lt!357562 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800682 () Bool)

(declare-fun res!544642 () Bool)

(assert (=> b!800682 (=> (not res!544642) (not e!444060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43480 (_ BitVec 32)) Bool)

(assert (=> b!800682 (= res!544642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68858 res!544647) b!800670))

(assert (= (and b!800670 res!544653) b!800676))

(assert (= (and b!800676 res!544645) b!800679))

(assert (= (and b!800679 res!544644) b!800673))

(assert (= (and b!800673 res!544652) b!800681))

(assert (= (and b!800681 res!544646) b!800682))

(assert (= (and b!800682 res!544642) b!800678))

(assert (= (and b!800678 res!544650) b!800677))

(assert (= (and b!800677 res!544649) b!800674))

(assert (= (and b!800674 res!544641) b!800672))

(assert (= (and b!800672 res!544643) b!800671))

(assert (= (and b!800671 res!544648) b!800675))

(assert (= (and b!800675 res!544651) b!800680))

(declare-fun m!742075 () Bool)

(assert (=> b!800676 m!742075))

(assert (=> b!800676 m!742075))

(declare-fun m!742077 () Bool)

(assert (=> b!800676 m!742077))

(declare-fun m!742079 () Bool)

(assert (=> b!800673 m!742079))

(declare-fun m!742081 () Bool)

(assert (=> b!800678 m!742081))

(declare-fun m!742083 () Bool)

(assert (=> b!800671 m!742083))

(declare-fun m!742085 () Bool)

(assert (=> b!800672 m!742085))

(assert (=> b!800672 m!742075))

(assert (=> b!800672 m!742075))

(declare-fun m!742087 () Bool)

(assert (=> b!800672 m!742087))

(assert (=> b!800672 m!742075))

(declare-fun m!742089 () Bool)

(assert (=> b!800672 m!742089))

(declare-fun m!742091 () Bool)

(assert (=> b!800679 m!742091))

(declare-fun m!742093 () Bool)

(assert (=> b!800677 m!742093))

(declare-fun m!742095 () Bool)

(assert (=> b!800677 m!742095))

(declare-fun m!742097 () Bool)

(assert (=> b!800682 m!742097))

(declare-fun m!742099 () Bool)

(assert (=> b!800681 m!742099))

(assert (=> b!800680 m!742075))

(assert (=> b!800680 m!742075))

(declare-fun m!742101 () Bool)

(assert (=> b!800680 m!742101))

(declare-fun m!742103 () Bool)

(assert (=> b!800675 m!742103))

(declare-fun m!742105 () Bool)

(assert (=> b!800674 m!742105))

(declare-fun m!742107 () Bool)

(assert (=> b!800674 m!742107))

(declare-fun m!742109 () Bool)

(assert (=> b!800674 m!742109))

(declare-fun m!742111 () Bool)

(assert (=> b!800674 m!742111))

(declare-fun m!742113 () Bool)

(assert (=> start!68858 m!742113))

(declare-fun m!742115 () Bool)

(assert (=> start!68858 m!742115))

(check-sat (not b!800675) (not b!800682) (not b!800679) (not b!800673) (not b!800671) (not b!800676) (not start!68858) (not b!800672) (not b!800674) (not b!800680) (not b!800681) (not b!800678))
(check-sat)
