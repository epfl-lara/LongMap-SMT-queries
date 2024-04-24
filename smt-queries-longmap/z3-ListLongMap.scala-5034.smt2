; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68882 () Bool)

(assert start!68882)

(declare-fun b!801138 () Bool)

(declare-fun e!444275 () Bool)

(declare-fun e!444276 () Bool)

(assert (=> b!801138 (= e!444275 e!444276)))

(declare-fun res!545116 () Bool)

(assert (=> b!801138 (=> (not res!545116) (not e!444276))))

(declare-datatypes ((array!43504 0))(
  ( (array!43505 (arr!20827 (Array (_ BitVec 32) (_ BitVec 64))) (size!21247 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43504)

(declare-fun lt!357851 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!801138 (= res!545116 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357851 #b00000000000000000000000000000000) (bvslt lt!357851 (size!21247 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801138 (= lt!357851 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801139 () Bool)

(declare-fun res!545114 () Bool)

(declare-fun e!444278 () Bool)

(assert (=> b!801139 (=> (not res!545114) (not e!444278))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801139 (= res!545114 (validKeyInArray!0 k0!2044))))

(declare-fun b!801140 () Bool)

(declare-fun e!444280 () Bool)

(assert (=> b!801140 (= e!444280 e!444275)))

(declare-fun res!545111 () Bool)

(assert (=> b!801140 (=> (not res!545111) (not e!444275))))

(declare-datatypes ((SeekEntryResult!8374 0))(
  ( (MissingZero!8374 (index!35864 (_ BitVec 32))) (Found!8374 (index!35865 (_ BitVec 32))) (Intermediate!8374 (undefined!9186 Bool) (index!35866 (_ BitVec 32)) (x!66898 (_ BitVec 32))) (Undefined!8374) (MissingVacant!8374 (index!35867 (_ BitVec 32))) )
))
(declare-fun lt!357847 () SeekEntryResult!8374)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357849 () SeekEntryResult!8374)

(assert (=> b!801140 (= res!545111 (and (= lt!357849 lt!357847) (= lt!357847 (Found!8374 j!153)) (not (= (select (arr!20827 a!3170) index!1236) (select (arr!20827 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43504 (_ BitVec 32)) SeekEntryResult!8374)

(assert (=> b!801140 (= lt!357847 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43504 (_ BitVec 32)) SeekEntryResult!8374)

(assert (=> b!801140 (= lt!357849 (seekEntryOrOpen!0 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801141 () Bool)

(declare-fun res!545109 () Bool)

(assert (=> b!801141 (=> (not res!545109) (not e!444278))))

(declare-fun arrayContainsKey!0 (array!43504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801141 (= res!545109 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801143 () Bool)

(declare-fun res!545121 () Bool)

(assert (=> b!801143 (=> (not res!545121) (not e!444278))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801143 (= res!545121 (and (= (size!21247 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21247 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21247 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801144 () Bool)

(declare-fun res!545113 () Bool)

(assert (=> b!801144 (=> (not res!545113) (not e!444278))))

(assert (=> b!801144 (= res!545113 (validKeyInArray!0 (select (arr!20827 a!3170) j!153)))))

(declare-fun b!801145 () Bool)

(declare-fun res!545119 () Bool)

(declare-fun e!444277 () Bool)

(assert (=> b!801145 (=> (not res!545119) (not e!444277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43504 (_ BitVec 32)) Bool)

(assert (=> b!801145 (= res!545119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801146 () Bool)

(assert (=> b!801146 (= e!444277 e!444280)))

(declare-fun res!545115 () Bool)

(assert (=> b!801146 (=> (not res!545115) (not e!444280))))

(declare-fun lt!357850 () SeekEntryResult!8374)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357848 () array!43504)

(declare-fun lt!357852 () (_ BitVec 64))

(assert (=> b!801146 (= res!545115 (= lt!357850 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357852 lt!357848 mask!3266)))))

(assert (=> b!801146 (= lt!357850 (seekEntryOrOpen!0 lt!357852 lt!357848 mask!3266))))

(assert (=> b!801146 (= lt!357852 (select (store (arr!20827 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801146 (= lt!357848 (array!43505 (store (arr!20827 a!3170) i!1163 k0!2044) (size!21247 a!3170)))))

(declare-fun b!801147 () Bool)

(declare-fun res!545117 () Bool)

(assert (=> b!801147 (=> (not res!545117) (not e!444277))))

(declare-datatypes ((List!14697 0))(
  ( (Nil!14694) (Cons!14693 (h!15828 (_ BitVec 64)) (t!21004 List!14697)) )
))
(declare-fun arrayNoDuplicates!0 (array!43504 (_ BitVec 32) List!14697) Bool)

(assert (=> b!801147 (= res!545117 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14694))))

(declare-fun b!801148 () Bool)

(declare-fun res!545118 () Bool)

(assert (=> b!801148 (=> (not res!545118) (not e!444276))))

(assert (=> b!801148 (= res!545118 (= lt!357850 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357851 vacantAfter!23 lt!357852 lt!357848 mask!3266)))))

(declare-fun b!801149 () Bool)

(declare-fun res!545120 () Bool)

(assert (=> b!801149 (=> (not res!545120) (not e!444277))))

(assert (=> b!801149 (= res!545120 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21247 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20827 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21247 a!3170)) (= (select (arr!20827 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801150 () Bool)

(assert (=> b!801150 (= e!444276 false)))

(declare-fun lt!357854 () SeekEntryResult!8374)

(assert (=> b!801150 (= lt!357854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357851 vacantBefore!23 (select (arr!20827 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545112 () Bool)

(assert (=> start!68882 (=> (not res!545112) (not e!444278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68882 (= res!545112 (validMask!0 mask!3266))))

(assert (=> start!68882 e!444278))

(assert (=> start!68882 true))

(declare-fun array_inv!16686 (array!43504) Bool)

(assert (=> start!68882 (array_inv!16686 a!3170)))

(declare-fun b!801142 () Bool)

(assert (=> b!801142 (= e!444278 e!444277)))

(declare-fun res!545110 () Bool)

(assert (=> b!801142 (=> (not res!545110) (not e!444277))))

(declare-fun lt!357853 () SeekEntryResult!8374)

(assert (=> b!801142 (= res!545110 (or (= lt!357853 (MissingZero!8374 i!1163)) (= lt!357853 (MissingVacant!8374 i!1163))))))

(assert (=> b!801142 (= lt!357853 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68882 res!545112) b!801143))

(assert (= (and b!801143 res!545121) b!801144))

(assert (= (and b!801144 res!545113) b!801139))

(assert (= (and b!801139 res!545114) b!801141))

(assert (= (and b!801141 res!545109) b!801142))

(assert (= (and b!801142 res!545110) b!801145))

(assert (= (and b!801145 res!545119) b!801147))

(assert (= (and b!801147 res!545117) b!801149))

(assert (= (and b!801149 res!545120) b!801146))

(assert (= (and b!801146 res!545115) b!801140))

(assert (= (and b!801140 res!545111) b!801138))

(assert (= (and b!801138 res!545116) b!801148))

(assert (= (and b!801148 res!545118) b!801150))

(declare-fun m!742579 () Bool)

(assert (=> b!801150 m!742579))

(assert (=> b!801150 m!742579))

(declare-fun m!742581 () Bool)

(assert (=> b!801150 m!742581))

(declare-fun m!742583 () Bool)

(assert (=> b!801148 m!742583))

(declare-fun m!742585 () Bool)

(assert (=> b!801146 m!742585))

(declare-fun m!742587 () Bool)

(assert (=> b!801146 m!742587))

(declare-fun m!742589 () Bool)

(assert (=> b!801146 m!742589))

(declare-fun m!742591 () Bool)

(assert (=> b!801146 m!742591))

(declare-fun m!742593 () Bool)

(assert (=> b!801140 m!742593))

(assert (=> b!801140 m!742579))

(assert (=> b!801140 m!742579))

(declare-fun m!742595 () Bool)

(assert (=> b!801140 m!742595))

(assert (=> b!801140 m!742579))

(declare-fun m!742597 () Bool)

(assert (=> b!801140 m!742597))

(declare-fun m!742599 () Bool)

(assert (=> b!801145 m!742599))

(declare-fun m!742601 () Bool)

(assert (=> b!801141 m!742601))

(declare-fun m!742603 () Bool)

(assert (=> b!801138 m!742603))

(assert (=> b!801144 m!742579))

(assert (=> b!801144 m!742579))

(declare-fun m!742605 () Bool)

(assert (=> b!801144 m!742605))

(declare-fun m!742607 () Bool)

(assert (=> b!801142 m!742607))

(declare-fun m!742609 () Bool)

(assert (=> start!68882 m!742609))

(declare-fun m!742611 () Bool)

(assert (=> start!68882 m!742611))

(declare-fun m!742613 () Bool)

(assert (=> b!801147 m!742613))

(declare-fun m!742615 () Bool)

(assert (=> b!801139 m!742615))

(declare-fun m!742617 () Bool)

(assert (=> b!801149 m!742617))

(declare-fun m!742619 () Bool)

(assert (=> b!801149 m!742619))

(check-sat (not start!68882) (not b!801144) (not b!801147) (not b!801145) (not b!801142) (not b!801150) (not b!801141) (not b!801148) (not b!801140) (not b!801138) (not b!801146) (not b!801139))
(check-sat)
