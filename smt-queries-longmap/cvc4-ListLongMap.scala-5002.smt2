; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68526 () Bool)

(assert start!68526)

(declare-fun b!796884 () Bool)

(declare-fun res!541410 () Bool)

(declare-fun e!442140 () Bool)

(assert (=> b!796884 (=> (not res!541410) (not e!442140))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43316 0))(
  ( (array!43317 (arr!20738 (Array (_ BitVec 32) (_ BitVec 64))) (size!21159 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43316)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796884 (= res!541410 (and (= (size!21159 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21159 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21159 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796885 () Bool)

(declare-fun res!541409 () Bool)

(declare-fun e!442139 () Bool)

(assert (=> b!796885 (=> (not res!541409) (not e!442139))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796885 (= res!541409 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21159 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20738 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21159 a!3170)) (= (select (arr!20738 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796886 () Bool)

(declare-fun res!541403 () Bool)

(assert (=> b!796886 (=> (not res!541403) (not e!442140))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796886 (= res!541403 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796887 () Bool)

(declare-fun res!541406 () Bool)

(assert (=> b!796887 (=> (not res!541406) (not e!442139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43316 (_ BitVec 32)) Bool)

(assert (=> b!796887 (= res!541406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796888 () Bool)

(declare-fun res!541412 () Bool)

(assert (=> b!796888 (=> (not res!541412) (not e!442140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796888 (= res!541412 (validKeyInArray!0 (select (arr!20738 a!3170) j!153)))))

(declare-fun b!796889 () Bool)

(declare-fun e!442141 () Bool)

(declare-fun e!442138 () Bool)

(assert (=> b!796889 (= e!442141 e!442138)))

(declare-fun res!541408 () Bool)

(assert (=> b!796889 (=> (not res!541408) (not e!442138))))

(declare-datatypes ((SeekEntryResult!8329 0))(
  ( (MissingZero!8329 (index!35684 (_ BitVec 32))) (Found!8329 (index!35685 (_ BitVec 32))) (Intermediate!8329 (undefined!9141 Bool) (index!35686 (_ BitVec 32)) (x!66583 (_ BitVec 32))) (Undefined!8329) (MissingVacant!8329 (index!35687 (_ BitVec 32))) )
))
(declare-fun lt!355410 () SeekEntryResult!8329)

(declare-fun lt!355409 () SeekEntryResult!8329)

(assert (=> b!796889 (= res!541408 (and (= lt!355409 lt!355410) (= lt!355410 (Found!8329 j!153)) (= (select (arr!20738 a!3170) index!1236) (select (arr!20738 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43316 (_ BitVec 32)) SeekEntryResult!8329)

(assert (=> b!796889 (= lt!355410 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20738 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43316 (_ BitVec 32)) SeekEntryResult!8329)

(assert (=> b!796889 (= lt!355409 (seekEntryOrOpen!0 (select (arr!20738 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!541407 () Bool)

(assert (=> start!68526 (=> (not res!541407) (not e!442140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68526 (= res!541407 (validMask!0 mask!3266))))

(assert (=> start!68526 e!442140))

(assert (=> start!68526 true))

(declare-fun array_inv!16534 (array!43316) Bool)

(assert (=> start!68526 (array_inv!16534 a!3170)))

(declare-fun b!796883 () Bool)

(assert (=> b!796883 (= e!442140 e!442139)))

(declare-fun res!541404 () Bool)

(assert (=> b!796883 (=> (not res!541404) (not e!442139))))

(declare-fun lt!355411 () SeekEntryResult!8329)

(assert (=> b!796883 (= res!541404 (or (= lt!355411 (MissingZero!8329 i!1163)) (= lt!355411 (MissingVacant!8329 i!1163))))))

(assert (=> b!796883 (= lt!355411 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796890 () Bool)

(declare-fun res!541405 () Bool)

(assert (=> b!796890 (=> (not res!541405) (not e!442139))))

(declare-datatypes ((List!14701 0))(
  ( (Nil!14698) (Cons!14697 (h!15826 (_ BitVec 64)) (t!21016 List!14701)) )
))
(declare-fun arrayNoDuplicates!0 (array!43316 (_ BitVec 32) List!14701) Bool)

(assert (=> b!796890 (= res!541405 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14698))))

(declare-fun b!796891 () Bool)

(assert (=> b!796891 (= e!442138 (not true))))

(declare-fun lt!355412 () SeekEntryResult!8329)

(assert (=> b!796891 (= lt!355412 (Found!8329 index!1236))))

(declare-fun b!796892 () Bool)

(declare-fun res!541402 () Bool)

(assert (=> b!796892 (=> (not res!541402) (not e!442140))))

(assert (=> b!796892 (= res!541402 (validKeyInArray!0 k!2044))))

(declare-fun b!796893 () Bool)

(assert (=> b!796893 (= e!442139 e!442141)))

(declare-fun res!541411 () Bool)

(assert (=> b!796893 (=> (not res!541411) (not e!442141))))

(declare-fun lt!355406 () SeekEntryResult!8329)

(assert (=> b!796893 (= res!541411 (= lt!355406 lt!355412))))

(declare-fun lt!355408 () (_ BitVec 64))

(declare-fun lt!355407 () array!43316)

(assert (=> b!796893 (= lt!355412 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355408 lt!355407 mask!3266))))

(assert (=> b!796893 (= lt!355406 (seekEntryOrOpen!0 lt!355408 lt!355407 mask!3266))))

(assert (=> b!796893 (= lt!355408 (select (store (arr!20738 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796893 (= lt!355407 (array!43317 (store (arr!20738 a!3170) i!1163 k!2044) (size!21159 a!3170)))))

(assert (= (and start!68526 res!541407) b!796884))

(assert (= (and b!796884 res!541410) b!796888))

(assert (= (and b!796888 res!541412) b!796892))

(assert (= (and b!796892 res!541402) b!796886))

(assert (= (and b!796886 res!541403) b!796883))

(assert (= (and b!796883 res!541404) b!796887))

(assert (= (and b!796887 res!541406) b!796890))

(assert (= (and b!796890 res!541405) b!796885))

(assert (= (and b!796885 res!541409) b!796893))

(assert (= (and b!796893 res!541411) b!796889))

(assert (= (and b!796889 res!541408) b!796891))

(declare-fun m!737717 () Bool)

(assert (=> b!796887 m!737717))

(declare-fun m!737719 () Bool)

(assert (=> b!796893 m!737719))

(declare-fun m!737721 () Bool)

(assert (=> b!796893 m!737721))

(declare-fun m!737723 () Bool)

(assert (=> b!796893 m!737723))

(declare-fun m!737725 () Bool)

(assert (=> b!796893 m!737725))

(declare-fun m!737727 () Bool)

(assert (=> b!796889 m!737727))

(declare-fun m!737729 () Bool)

(assert (=> b!796889 m!737729))

(assert (=> b!796889 m!737729))

(declare-fun m!737731 () Bool)

(assert (=> b!796889 m!737731))

(assert (=> b!796889 m!737729))

(declare-fun m!737733 () Bool)

(assert (=> b!796889 m!737733))

(assert (=> b!796888 m!737729))

(assert (=> b!796888 m!737729))

(declare-fun m!737735 () Bool)

(assert (=> b!796888 m!737735))

(declare-fun m!737737 () Bool)

(assert (=> b!796883 m!737737))

(declare-fun m!737739 () Bool)

(assert (=> start!68526 m!737739))

(declare-fun m!737741 () Bool)

(assert (=> start!68526 m!737741))

(declare-fun m!737743 () Bool)

(assert (=> b!796885 m!737743))

(declare-fun m!737745 () Bool)

(assert (=> b!796885 m!737745))

(declare-fun m!737747 () Bool)

(assert (=> b!796886 m!737747))

(declare-fun m!737749 () Bool)

(assert (=> b!796892 m!737749))

(declare-fun m!737751 () Bool)

(assert (=> b!796890 m!737751))

(push 1)

