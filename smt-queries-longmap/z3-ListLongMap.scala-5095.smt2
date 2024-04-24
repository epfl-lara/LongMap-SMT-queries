; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69344 () Bool)

(assert start!69344)

(declare-fun b!807623 () Bool)

(declare-fun res!551203 () Bool)

(declare-fun e!447299 () Bool)

(assert (=> b!807623 (=> (not res!551203) (not e!447299))))

(declare-datatypes ((array!43876 0))(
  ( (array!43877 (arr!21010 (Array (_ BitVec 32) (_ BitVec 64))) (size!21430 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43876)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43876 (_ BitVec 32)) Bool)

(assert (=> b!807623 (= res!551203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807624 () Bool)

(declare-fun res!551199 () Bool)

(assert (=> b!807624 (=> (not res!551199) (not e!447299))))

(declare-datatypes ((List!14880 0))(
  ( (Nil!14877) (Cons!14876 (h!16011 (_ BitVec 64)) (t!21187 List!14880)) )
))
(declare-fun arrayNoDuplicates!0 (array!43876 (_ BitVec 32) List!14880) Bool)

(assert (=> b!807624 (= res!551199 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14877))))

(declare-fun b!807625 () Bool)

(declare-fun res!551205 () Bool)

(declare-fun e!447301 () Bool)

(assert (=> b!807625 (=> (not res!551205) (not e!447301))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807625 (= res!551205 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551201 () Bool)

(assert (=> start!69344 (=> (not res!551201) (not e!447301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69344 (= res!551201 (validMask!0 mask!3266))))

(assert (=> start!69344 e!447301))

(assert (=> start!69344 true))

(declare-fun array_inv!16869 (array!43876) Bool)

(assert (=> start!69344 (array_inv!16869 a!3170)))

(declare-fun b!807626 () Bool)

(declare-fun res!551206 () Bool)

(assert (=> b!807626 (=> (not res!551206) (not e!447301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807626 (= res!551206 (validKeyInArray!0 k0!2044))))

(declare-fun b!807627 () Bool)

(assert (=> b!807627 (= e!447301 e!447299)))

(declare-fun res!551200 () Bool)

(assert (=> b!807627 (=> (not res!551200) (not e!447299))))

(declare-datatypes ((SeekEntryResult!8557 0))(
  ( (MissingZero!8557 (index!36596 (_ BitVec 32))) (Found!8557 (index!36597 (_ BitVec 32))) (Intermediate!8557 (undefined!9369 Bool) (index!36598 (_ BitVec 32)) (x!67575 (_ BitVec 32))) (Undefined!8557) (MissingVacant!8557 (index!36599 (_ BitVec 32))) )
))
(declare-fun lt!361684 () SeekEntryResult!8557)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807627 (= res!551200 (or (= lt!361684 (MissingZero!8557 i!1163)) (= lt!361684 (MissingVacant!8557 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43876 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!807627 (= lt!361684 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807628 () Bool)

(declare-fun e!447300 () Bool)

(assert (=> b!807628 (= e!447299 e!447300)))

(declare-fun res!551202 () Bool)

(assert (=> b!807628 (=> (not res!551202) (not e!447300))))

(declare-fun lt!361688 () SeekEntryResult!8557)

(declare-fun lt!361685 () SeekEntryResult!8557)

(assert (=> b!807628 (= res!551202 (= lt!361688 lt!361685))))

(declare-fun lt!361682 () array!43876)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361687 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43876 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!807628 (= lt!361685 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361687 lt!361682 mask!3266))))

(assert (=> b!807628 (= lt!361688 (seekEntryOrOpen!0 lt!361687 lt!361682 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807628 (= lt!361687 (select (store (arr!21010 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807628 (= lt!361682 (array!43877 (store (arr!21010 a!3170) i!1163 k0!2044) (size!21430 a!3170)))))

(declare-fun b!807629 () Bool)

(declare-fun res!551208 () Bool)

(assert (=> b!807629 (=> (not res!551208) (not e!447299))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807629 (= res!551208 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21430 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21010 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21430 a!3170)) (= (select (arr!21010 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807630 () Bool)

(declare-fun e!447297 () Bool)

(assert (=> b!807630 (= e!447297 (not true))))

(assert (=> b!807630 (= lt!361685 (Found!8557 index!1236))))

(declare-fun b!807631 () Bool)

(declare-fun res!551204 () Bool)

(assert (=> b!807631 (=> (not res!551204) (not e!447301))))

(assert (=> b!807631 (= res!551204 (and (= (size!21430 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21430 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21430 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807632 () Bool)

(declare-fun res!551198 () Bool)

(assert (=> b!807632 (=> (not res!551198) (not e!447301))))

(assert (=> b!807632 (= res!551198 (validKeyInArray!0 (select (arr!21010 a!3170) j!153)))))

(declare-fun b!807633 () Bool)

(assert (=> b!807633 (= e!447300 e!447297)))

(declare-fun res!551207 () Bool)

(assert (=> b!807633 (=> (not res!551207) (not e!447297))))

(declare-fun lt!361686 () SeekEntryResult!8557)

(declare-fun lt!361683 () SeekEntryResult!8557)

(assert (=> b!807633 (= res!551207 (and (= lt!361683 lt!361686) (= lt!361686 (Found!8557 j!153)) (= (select (arr!21010 a!3170) index!1236) (select (arr!21010 a!3170) j!153))))))

(assert (=> b!807633 (= lt!361686 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21010 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807633 (= lt!361683 (seekEntryOrOpen!0 (select (arr!21010 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69344 res!551201) b!807631))

(assert (= (and b!807631 res!551204) b!807632))

(assert (= (and b!807632 res!551198) b!807626))

(assert (= (and b!807626 res!551206) b!807625))

(assert (= (and b!807625 res!551205) b!807627))

(assert (= (and b!807627 res!551200) b!807623))

(assert (= (and b!807623 res!551203) b!807624))

(assert (= (and b!807624 res!551199) b!807629))

(assert (= (and b!807629 res!551208) b!807628))

(assert (= (and b!807628 res!551202) b!807633))

(assert (= (and b!807633 res!551207) b!807630))

(declare-fun m!749941 () Bool)

(assert (=> b!807628 m!749941))

(declare-fun m!749943 () Bool)

(assert (=> b!807628 m!749943))

(declare-fun m!749945 () Bool)

(assert (=> b!807628 m!749945))

(declare-fun m!749947 () Bool)

(assert (=> b!807628 m!749947))

(declare-fun m!749949 () Bool)

(assert (=> b!807626 m!749949))

(declare-fun m!749951 () Bool)

(assert (=> b!807629 m!749951))

(declare-fun m!749953 () Bool)

(assert (=> b!807629 m!749953))

(declare-fun m!749955 () Bool)

(assert (=> b!807632 m!749955))

(assert (=> b!807632 m!749955))

(declare-fun m!749957 () Bool)

(assert (=> b!807632 m!749957))

(declare-fun m!749959 () Bool)

(assert (=> b!807633 m!749959))

(assert (=> b!807633 m!749955))

(assert (=> b!807633 m!749955))

(declare-fun m!749961 () Bool)

(assert (=> b!807633 m!749961))

(assert (=> b!807633 m!749955))

(declare-fun m!749963 () Bool)

(assert (=> b!807633 m!749963))

(declare-fun m!749965 () Bool)

(assert (=> b!807623 m!749965))

(declare-fun m!749967 () Bool)

(assert (=> start!69344 m!749967))

(declare-fun m!749969 () Bool)

(assert (=> start!69344 m!749969))

(declare-fun m!749971 () Bool)

(assert (=> b!807627 m!749971))

(declare-fun m!749973 () Bool)

(assert (=> b!807625 m!749973))

(declare-fun m!749975 () Bool)

(assert (=> b!807624 m!749975))

(check-sat (not start!69344) (not b!807624) (not b!807628) (not b!807626) (not b!807633) (not b!807632) (not b!807627) (not b!807625) (not b!807623))
(check-sat)
