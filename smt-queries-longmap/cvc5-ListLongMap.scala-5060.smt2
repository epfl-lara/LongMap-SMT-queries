; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68870 () Bool)

(assert start!68870)

(declare-fun b!803074 () Bool)

(declare-fun res!547594 () Bool)

(declare-fun e!445022 () Bool)

(assert (=> b!803074 (=> (not res!547594) (not e!445022))))

(declare-datatypes ((array!43660 0))(
  ( (array!43661 (arr!20910 (Array (_ BitVec 32) (_ BitVec 64))) (size!21331 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43660)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803074 (= res!547594 (validKeyInArray!0 (select (arr!20910 a!3170) j!153)))))

(declare-fun b!803075 () Bool)

(declare-fun res!547604 () Bool)

(declare-fun e!445021 () Bool)

(assert (=> b!803075 (=> (not res!547604) (not e!445021))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803075 (= res!547604 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21331 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20910 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21331 a!3170)) (= (select (arr!20910 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803076 () Bool)

(declare-fun e!445018 () Bool)

(assert (=> b!803076 (= e!445021 e!445018)))

(declare-fun res!547600 () Bool)

(assert (=> b!803076 (=> (not res!547600) (not e!445018))))

(declare-datatypes ((SeekEntryResult!8501 0))(
  ( (MissingZero!8501 (index!36372 (_ BitVec 32))) (Found!8501 (index!36373 (_ BitVec 32))) (Intermediate!8501 (undefined!9313 Bool) (index!36374 (_ BitVec 32)) (x!67219 (_ BitVec 32))) (Undefined!8501) (MissingVacant!8501 (index!36375 (_ BitVec 32))) )
))
(declare-fun lt!359325 () SeekEntryResult!8501)

(declare-fun lt!359330 () SeekEntryResult!8501)

(assert (=> b!803076 (= res!547600 (= lt!359325 lt!359330))))

(declare-fun lt!359327 () (_ BitVec 64))

(declare-fun lt!359329 () array!43660)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43660 (_ BitVec 32)) SeekEntryResult!8501)

(assert (=> b!803076 (= lt!359330 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359327 lt!359329 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43660 (_ BitVec 32)) SeekEntryResult!8501)

(assert (=> b!803076 (= lt!359325 (seekEntryOrOpen!0 lt!359327 lt!359329 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!803076 (= lt!359327 (select (store (arr!20910 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803076 (= lt!359329 (array!43661 (store (arr!20910 a!3170) i!1163 k!2044) (size!21331 a!3170)))))

(declare-fun b!803077 () Bool)

(declare-fun e!445017 () Bool)

(declare-fun lt!359321 () SeekEntryResult!8501)

(assert (=> b!803077 (= e!445017 (not (or (not (= lt!359330 lt!359321)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20910 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359324 () (_ BitVec 32))

(assert (=> b!803077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359324 vacantAfter!23 lt!359327 lt!359329 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359324 vacantBefore!23 (select (arr!20910 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27542 0))(
  ( (Unit!27543) )
))
(declare-fun lt!359328 () Unit!27542)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43660 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27542)

(assert (=> b!803077 (= lt!359328 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359324 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803077 (= lt!359324 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803078 () Bool)

(declare-fun res!547595 () Bool)

(assert (=> b!803078 (=> (not res!547595) (not e!445022))))

(assert (=> b!803078 (= res!547595 (validKeyInArray!0 k!2044))))

(declare-fun b!803079 () Bool)

(declare-fun res!547598 () Bool)

(assert (=> b!803079 (=> (not res!547598) (not e!445021))))

(declare-datatypes ((List!14873 0))(
  ( (Nil!14870) (Cons!14869 (h!15998 (_ BitVec 64)) (t!21188 List!14873)) )
))
(declare-fun arrayNoDuplicates!0 (array!43660 (_ BitVec 32) List!14873) Bool)

(assert (=> b!803079 (= res!547598 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14870))))

(declare-fun b!803080 () Bool)

(declare-fun res!547599 () Bool)

(assert (=> b!803080 (=> (not res!547599) (not e!445022))))

(assert (=> b!803080 (= res!547599 (and (= (size!21331 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21331 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21331 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803081 () Bool)

(declare-fun res!547593 () Bool)

(assert (=> b!803081 (=> (not res!547593) (not e!445022))))

(declare-fun arrayContainsKey!0 (array!43660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803081 (= res!547593 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803082 () Bool)

(declare-fun e!445019 () Bool)

(assert (=> b!803082 (= e!445019 e!445017)))

(declare-fun res!547596 () Bool)

(assert (=> b!803082 (=> (not res!547596) (not e!445017))))

(declare-fun lt!359322 () SeekEntryResult!8501)

(assert (=> b!803082 (= res!547596 (and (= lt!359322 lt!359321) (not (= (select (arr!20910 a!3170) index!1236) (select (arr!20910 a!3170) j!153)))))))

(assert (=> b!803082 (= lt!359321 (Found!8501 j!153))))

(declare-fun res!547597 () Bool)

(assert (=> start!68870 (=> (not res!547597) (not e!445022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68870 (= res!547597 (validMask!0 mask!3266))))

(assert (=> start!68870 e!445022))

(assert (=> start!68870 true))

(declare-fun array_inv!16706 (array!43660) Bool)

(assert (=> start!68870 (array_inv!16706 a!3170)))

(declare-fun b!803083 () Bool)

(assert (=> b!803083 (= e!445022 e!445021)))

(declare-fun res!547601 () Bool)

(assert (=> b!803083 (=> (not res!547601) (not e!445021))))

(declare-fun lt!359323 () SeekEntryResult!8501)

(assert (=> b!803083 (= res!547601 (or (= lt!359323 (MissingZero!8501 i!1163)) (= lt!359323 (MissingVacant!8501 i!1163))))))

(assert (=> b!803083 (= lt!359323 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803084 () Bool)

(declare-fun res!547603 () Bool)

(assert (=> b!803084 (=> (not res!547603) (not e!445021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43660 (_ BitVec 32)) Bool)

(assert (=> b!803084 (= res!547603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803085 () Bool)

(assert (=> b!803085 (= e!445018 e!445019)))

(declare-fun res!547602 () Bool)

(assert (=> b!803085 (=> (not res!547602) (not e!445019))))

(declare-fun lt!359326 () SeekEntryResult!8501)

(assert (=> b!803085 (= res!547602 (= lt!359326 lt!359322))))

(assert (=> b!803085 (= lt!359322 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20910 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803085 (= lt!359326 (seekEntryOrOpen!0 (select (arr!20910 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68870 res!547597) b!803080))

(assert (= (and b!803080 res!547599) b!803074))

(assert (= (and b!803074 res!547594) b!803078))

(assert (= (and b!803078 res!547595) b!803081))

(assert (= (and b!803081 res!547593) b!803083))

(assert (= (and b!803083 res!547601) b!803084))

(assert (= (and b!803084 res!547603) b!803079))

(assert (= (and b!803079 res!547598) b!803075))

(assert (= (and b!803075 res!547604) b!803076))

(assert (= (and b!803076 res!547600) b!803085))

(assert (= (and b!803085 res!547602) b!803082))

(assert (= (and b!803082 res!547596) b!803077))

(declare-fun m!744701 () Bool)

(assert (=> b!803081 m!744701))

(declare-fun m!744703 () Bool)

(assert (=> b!803082 m!744703))

(declare-fun m!744705 () Bool)

(assert (=> b!803082 m!744705))

(declare-fun m!744707 () Bool)

(assert (=> b!803078 m!744707))

(declare-fun m!744709 () Bool)

(assert (=> b!803075 m!744709))

(declare-fun m!744711 () Bool)

(assert (=> b!803075 m!744711))

(declare-fun m!744713 () Bool)

(assert (=> b!803076 m!744713))

(declare-fun m!744715 () Bool)

(assert (=> b!803076 m!744715))

(declare-fun m!744717 () Bool)

(assert (=> b!803076 m!744717))

(declare-fun m!744719 () Bool)

(assert (=> b!803076 m!744719))

(declare-fun m!744721 () Bool)

(assert (=> b!803083 m!744721))

(assert (=> b!803074 m!744705))

(assert (=> b!803074 m!744705))

(declare-fun m!744723 () Bool)

(assert (=> b!803074 m!744723))

(declare-fun m!744725 () Bool)

(assert (=> b!803079 m!744725))

(declare-fun m!744727 () Bool)

(assert (=> b!803084 m!744727))

(assert (=> b!803077 m!744705))

(declare-fun m!744729 () Bool)

(assert (=> b!803077 m!744729))

(declare-fun m!744731 () Bool)

(assert (=> b!803077 m!744731))

(declare-fun m!744733 () Bool)

(assert (=> b!803077 m!744733))

(assert (=> b!803077 m!744717))

(assert (=> b!803077 m!744705))

(declare-fun m!744735 () Bool)

(assert (=> b!803077 m!744735))

(declare-fun m!744737 () Bool)

(assert (=> b!803077 m!744737))

(declare-fun m!744739 () Bool)

(assert (=> start!68870 m!744739))

(declare-fun m!744741 () Bool)

(assert (=> start!68870 m!744741))

(assert (=> b!803085 m!744705))

(assert (=> b!803085 m!744705))

(declare-fun m!744743 () Bool)

(assert (=> b!803085 m!744743))

(assert (=> b!803085 m!744705))

(declare-fun m!744745 () Bool)

(assert (=> b!803085 m!744745))

(push 1)

