; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68478 () Bool)

(assert start!68478)

(declare-fun b!796082 () Bool)

(declare-fun res!540610 () Bool)

(declare-fun e!441773 () Bool)

(assert (=> b!796082 (=> (not res!540610) (not e!441773))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43268 0))(
  ( (array!43269 (arr!20714 (Array (_ BitVec 32) (_ BitVec 64))) (size!21135 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43268)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796082 (= res!540610 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21135 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20714 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21135 a!3170)) (= (select (arr!20714 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796083 () Bool)

(declare-fun e!441770 () Bool)

(declare-fun e!441772 () Bool)

(assert (=> b!796083 (= e!441770 e!441772)))

(declare-fun res!540601 () Bool)

(assert (=> b!796083 (=> (not res!540601) (not e!441772))))

(declare-datatypes ((SeekEntryResult!8305 0))(
  ( (MissingZero!8305 (index!35588 (_ BitVec 32))) (Found!8305 (index!35589 (_ BitVec 32))) (Intermediate!8305 (undefined!9117 Bool) (index!35590 (_ BitVec 32)) (x!66495 (_ BitVec 32))) (Undefined!8305) (MissingVacant!8305 (index!35591 (_ BitVec 32))) )
))
(declare-fun lt!354908 () SeekEntryResult!8305)

(declare-fun lt!354903 () SeekEntryResult!8305)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796083 (= res!540601 (and (= lt!354908 lt!354903) (= lt!354903 (Found!8305 j!153)) (= (select (arr!20714 a!3170) index!1236) (select (arr!20714 a!3170) j!153))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43268 (_ BitVec 32)) SeekEntryResult!8305)

(assert (=> b!796083 (= lt!354903 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20714 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43268 (_ BitVec 32)) SeekEntryResult!8305)

(assert (=> b!796083 (= lt!354908 (seekEntryOrOpen!0 (select (arr!20714 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796084 () Bool)

(assert (=> b!796084 (= e!441772 (not true))))

(declare-fun lt!354906 () SeekEntryResult!8305)

(assert (=> b!796084 (= lt!354906 (Found!8305 index!1236))))

(declare-fun b!796085 () Bool)

(declare-fun res!540611 () Bool)

(declare-fun e!441769 () Bool)

(assert (=> b!796085 (=> (not res!540611) (not e!441769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796085 (= res!540611 (validKeyInArray!0 (select (arr!20714 a!3170) j!153)))))

(declare-fun b!796086 () Bool)

(declare-fun res!540603 () Bool)

(assert (=> b!796086 (=> (not res!540603) (not e!441773))))

(declare-datatypes ((List!14677 0))(
  ( (Nil!14674) (Cons!14673 (h!15802 (_ BitVec 64)) (t!20992 List!14677)) )
))
(declare-fun arrayNoDuplicates!0 (array!43268 (_ BitVec 32) List!14677) Bool)

(assert (=> b!796086 (= res!540603 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14674))))

(declare-fun b!796087 () Bool)

(assert (=> b!796087 (= e!441773 e!441770)))

(declare-fun res!540602 () Bool)

(assert (=> b!796087 (=> (not res!540602) (not e!441770))))

(declare-fun lt!354902 () SeekEntryResult!8305)

(assert (=> b!796087 (= res!540602 (= lt!354902 lt!354906))))

(declare-fun lt!354904 () array!43268)

(declare-fun lt!354905 () (_ BitVec 64))

(assert (=> b!796087 (= lt!354906 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354905 lt!354904 mask!3266))))

(assert (=> b!796087 (= lt!354902 (seekEntryOrOpen!0 lt!354905 lt!354904 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!796087 (= lt!354905 (select (store (arr!20714 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796087 (= lt!354904 (array!43269 (store (arr!20714 a!3170) i!1163 k!2044) (size!21135 a!3170)))))

(declare-fun b!796088 () Bool)

(assert (=> b!796088 (= e!441769 e!441773)))

(declare-fun res!540607 () Bool)

(assert (=> b!796088 (=> (not res!540607) (not e!441773))))

(declare-fun lt!354907 () SeekEntryResult!8305)

(assert (=> b!796088 (= res!540607 (or (= lt!354907 (MissingZero!8305 i!1163)) (= lt!354907 (MissingVacant!8305 i!1163))))))

(assert (=> b!796088 (= lt!354907 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796089 () Bool)

(declare-fun res!540604 () Bool)

(assert (=> b!796089 (=> (not res!540604) (not e!441769))))

(assert (=> b!796089 (= res!540604 (and (= (size!21135 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21135 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21135 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796090 () Bool)

(declare-fun res!540609 () Bool)

(assert (=> b!796090 (=> (not res!540609) (not e!441769))))

(assert (=> b!796090 (= res!540609 (validKeyInArray!0 k!2044))))

(declare-fun res!540605 () Bool)

(assert (=> start!68478 (=> (not res!540605) (not e!441769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68478 (= res!540605 (validMask!0 mask!3266))))

(assert (=> start!68478 e!441769))

(assert (=> start!68478 true))

(declare-fun array_inv!16510 (array!43268) Bool)

(assert (=> start!68478 (array_inv!16510 a!3170)))

(declare-fun b!796091 () Bool)

(declare-fun res!540608 () Bool)

(assert (=> b!796091 (=> (not res!540608) (not e!441769))))

(declare-fun arrayContainsKey!0 (array!43268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796091 (= res!540608 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796092 () Bool)

(declare-fun res!540606 () Bool)

(assert (=> b!796092 (=> (not res!540606) (not e!441773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43268 (_ BitVec 32)) Bool)

(assert (=> b!796092 (= res!540606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68478 res!540605) b!796089))

(assert (= (and b!796089 res!540604) b!796085))

(assert (= (and b!796085 res!540611) b!796090))

(assert (= (and b!796090 res!540609) b!796091))

(assert (= (and b!796091 res!540608) b!796088))

(assert (= (and b!796088 res!540607) b!796092))

(assert (= (and b!796092 res!540606) b!796086))

(assert (= (and b!796086 res!540603) b!796082))

(assert (= (and b!796082 res!540610) b!796087))

(assert (= (and b!796087 res!540602) b!796083))

(assert (= (and b!796083 res!540601) b!796084))

(declare-fun m!736835 () Bool)

(assert (=> b!796090 m!736835))

(declare-fun m!736837 () Bool)

(assert (=> b!796082 m!736837))

(declare-fun m!736839 () Bool)

(assert (=> b!796082 m!736839))

(declare-fun m!736841 () Bool)

(assert (=> start!68478 m!736841))

(declare-fun m!736843 () Bool)

(assert (=> start!68478 m!736843))

(declare-fun m!736845 () Bool)

(assert (=> b!796088 m!736845))

(declare-fun m!736847 () Bool)

(assert (=> b!796091 m!736847))

(declare-fun m!736849 () Bool)

(assert (=> b!796092 m!736849))

(declare-fun m!736851 () Bool)

(assert (=> b!796083 m!736851))

(declare-fun m!736853 () Bool)

(assert (=> b!796083 m!736853))

(assert (=> b!796083 m!736853))

(declare-fun m!736855 () Bool)

(assert (=> b!796083 m!736855))

(assert (=> b!796083 m!736853))

(declare-fun m!736857 () Bool)

(assert (=> b!796083 m!736857))

(declare-fun m!736859 () Bool)

(assert (=> b!796086 m!736859))

(declare-fun m!736861 () Bool)

(assert (=> b!796087 m!736861))

(declare-fun m!736863 () Bool)

(assert (=> b!796087 m!736863))

(declare-fun m!736865 () Bool)

(assert (=> b!796087 m!736865))

(declare-fun m!736867 () Bool)

(assert (=> b!796087 m!736867))

(assert (=> b!796085 m!736853))

(assert (=> b!796085 m!736853))

(declare-fun m!736869 () Bool)

(assert (=> b!796085 m!736869))

(push 1)

