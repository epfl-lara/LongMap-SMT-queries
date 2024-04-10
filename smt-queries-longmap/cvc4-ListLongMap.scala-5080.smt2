; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68994 () Bool)

(assert start!68994)

(declare-fun b!804849 () Bool)

(declare-fun e!445814 () Bool)

(declare-fun e!445812 () Bool)

(assert (=> b!804849 (= e!445814 e!445812)))

(declare-fun res!549377 () Bool)

(assert (=> b!804849 (=> (not res!549377) (not e!445812))))

(declare-datatypes ((array!43784 0))(
  ( (array!43785 (arr!20972 (Array (_ BitVec 32) (_ BitVec 64))) (size!21393 (_ BitVec 32))) )
))
(declare-fun lt!360332 () array!43784)

(declare-fun lt!360334 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8563 0))(
  ( (MissingZero!8563 (index!36620 (_ BitVec 32))) (Found!8563 (index!36621 (_ BitVec 32))) (Intermediate!8563 (undefined!9375 Bool) (index!36622 (_ BitVec 32)) (x!67441 (_ BitVec 32))) (Undefined!8563) (MissingVacant!8563 (index!36623 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43784 (_ BitVec 32)) SeekEntryResult!8563)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43784 (_ BitVec 32)) SeekEntryResult!8563)

(assert (=> b!804849 (= res!549377 (= (seekEntryOrOpen!0 lt!360334 lt!360332 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360334 lt!360332 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43784)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804849 (= lt!360334 (select (store (arr!20972 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804849 (= lt!360332 (array!43785 (store (arr!20972 a!3170) i!1163 k!2044) (size!21393 a!3170)))))

(declare-fun b!804850 () Bool)

(declare-fun res!549376 () Bool)

(assert (=> b!804850 (=> (not res!549376) (not e!445814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43784 (_ BitVec 32)) Bool)

(assert (=> b!804850 (= res!549376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804851 () Bool)

(declare-fun res!549371 () Bool)

(declare-fun e!445811 () Bool)

(assert (=> b!804851 (=> (not res!549371) (not e!445811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804851 (= res!549371 (validKeyInArray!0 k!2044))))

(declare-fun b!804852 () Bool)

(declare-fun res!549368 () Bool)

(assert (=> b!804852 (=> (not res!549368) (not e!445814))))

(declare-datatypes ((List!14935 0))(
  ( (Nil!14932) (Cons!14931 (h!16060 (_ BitVec 64)) (t!21250 List!14935)) )
))
(declare-fun arrayNoDuplicates!0 (array!43784 (_ BitVec 32) List!14935) Bool)

(assert (=> b!804852 (= res!549368 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14932))))

(declare-fun b!804853 () Bool)

(assert (=> b!804853 (= e!445812 false)))

(declare-fun lt!360331 () SeekEntryResult!8563)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804853 (= lt!360331 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20972 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360333 () SeekEntryResult!8563)

(assert (=> b!804853 (= lt!360333 (seekEntryOrOpen!0 (select (arr!20972 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804854 () Bool)

(declare-fun res!549374 () Bool)

(assert (=> b!804854 (=> (not res!549374) (not e!445814))))

(assert (=> b!804854 (= res!549374 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21393 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20972 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21393 a!3170)) (= (select (arr!20972 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804855 () Bool)

(declare-fun res!549372 () Bool)

(assert (=> b!804855 (=> (not res!549372) (not e!445811))))

(assert (=> b!804855 (= res!549372 (validKeyInArray!0 (select (arr!20972 a!3170) j!153)))))

(declare-fun b!804856 () Bool)

(declare-fun res!549369 () Bool)

(assert (=> b!804856 (=> (not res!549369) (not e!445811))))

(assert (=> b!804856 (= res!549369 (and (= (size!21393 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21393 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21393 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!549375 () Bool)

(assert (=> start!68994 (=> (not res!549375) (not e!445811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68994 (= res!549375 (validMask!0 mask!3266))))

(assert (=> start!68994 e!445811))

(assert (=> start!68994 true))

(declare-fun array_inv!16768 (array!43784) Bool)

(assert (=> start!68994 (array_inv!16768 a!3170)))

(declare-fun b!804857 () Bool)

(declare-fun res!549370 () Bool)

(assert (=> b!804857 (=> (not res!549370) (not e!445811))))

(declare-fun arrayContainsKey!0 (array!43784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804857 (= res!549370 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804858 () Bool)

(assert (=> b!804858 (= e!445811 e!445814)))

(declare-fun res!549373 () Bool)

(assert (=> b!804858 (=> (not res!549373) (not e!445814))))

(declare-fun lt!360335 () SeekEntryResult!8563)

(assert (=> b!804858 (= res!549373 (or (= lt!360335 (MissingZero!8563 i!1163)) (= lt!360335 (MissingVacant!8563 i!1163))))))

(assert (=> b!804858 (= lt!360335 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68994 res!549375) b!804856))

(assert (= (and b!804856 res!549369) b!804855))

(assert (= (and b!804855 res!549372) b!804851))

(assert (= (and b!804851 res!549371) b!804857))

(assert (= (and b!804857 res!549370) b!804858))

(assert (= (and b!804858 res!549373) b!804850))

(assert (= (and b!804850 res!549376) b!804852))

(assert (= (and b!804852 res!549368) b!804854))

(assert (= (and b!804854 res!549374) b!804849))

(assert (= (and b!804849 res!549377) b!804853))

(declare-fun m!746719 () Bool)

(assert (=> b!804851 m!746719))

(declare-fun m!746721 () Bool)

(assert (=> b!804857 m!746721))

(declare-fun m!746723 () Bool)

(assert (=> b!804849 m!746723))

(declare-fun m!746725 () Bool)

(assert (=> b!804849 m!746725))

(declare-fun m!746727 () Bool)

(assert (=> b!804849 m!746727))

(declare-fun m!746729 () Bool)

(assert (=> b!804849 m!746729))

(declare-fun m!746731 () Bool)

(assert (=> start!68994 m!746731))

(declare-fun m!746733 () Bool)

(assert (=> start!68994 m!746733))

(declare-fun m!746735 () Bool)

(assert (=> b!804850 m!746735))

(declare-fun m!746737 () Bool)

(assert (=> b!804853 m!746737))

(assert (=> b!804853 m!746737))

(declare-fun m!746739 () Bool)

(assert (=> b!804853 m!746739))

(assert (=> b!804853 m!746737))

(declare-fun m!746741 () Bool)

(assert (=> b!804853 m!746741))

(declare-fun m!746743 () Bool)

(assert (=> b!804852 m!746743))

(declare-fun m!746745 () Bool)

(assert (=> b!804854 m!746745))

(declare-fun m!746747 () Bool)

(assert (=> b!804854 m!746747))

(declare-fun m!746749 () Bool)

(assert (=> b!804858 m!746749))

(assert (=> b!804855 m!746737))

(assert (=> b!804855 m!746737))

(declare-fun m!746751 () Bool)

(assert (=> b!804855 m!746751))

(push 1)

