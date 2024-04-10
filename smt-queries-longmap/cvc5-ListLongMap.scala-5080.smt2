; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68990 () Bool)

(assert start!68990)

(declare-fun b!804789 () Bool)

(declare-fun res!549314 () Bool)

(declare-fun e!445788 () Bool)

(assert (=> b!804789 (=> (not res!549314) (not e!445788))))

(declare-datatypes ((array!43780 0))(
  ( (array!43781 (arr!20970 (Array (_ BitVec 32) (_ BitVec 64))) (size!21391 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43780)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804789 (= res!549314 (validKeyInArray!0 (select (arr!20970 a!3170) j!153)))))

(declare-fun b!804790 () Bool)

(declare-fun res!549312 () Bool)

(declare-fun e!445787 () Bool)

(assert (=> b!804790 (=> (not res!549312) (not e!445787))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804790 (= res!549312 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21391 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20970 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21391 a!3170)) (= (select (arr!20970 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804791 () Bool)

(declare-fun e!445789 () Bool)

(assert (=> b!804791 (= e!445787 e!445789)))

(declare-fun res!549317 () Bool)

(assert (=> b!804791 (=> (not res!549317) (not e!445789))))

(declare-fun lt!360304 () array!43780)

(declare-fun lt!360303 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8561 0))(
  ( (MissingZero!8561 (index!36612 (_ BitVec 32))) (Found!8561 (index!36613 (_ BitVec 32))) (Intermediate!8561 (undefined!9373 Bool) (index!36614 (_ BitVec 32)) (x!67439 (_ BitVec 32))) (Undefined!8561) (MissingVacant!8561 (index!36615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43780 (_ BitVec 32)) SeekEntryResult!8561)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43780 (_ BitVec 32)) SeekEntryResult!8561)

(assert (=> b!804791 (= res!549317 (= (seekEntryOrOpen!0 lt!360303 lt!360304 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360303 lt!360304 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!804791 (= lt!360303 (select (store (arr!20970 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804791 (= lt!360304 (array!43781 (store (arr!20970 a!3170) i!1163 k!2044) (size!21391 a!3170)))))

(declare-fun b!804793 () Bool)

(declare-fun res!549313 () Bool)

(assert (=> b!804793 (=> (not res!549313) (not e!445788))))

(declare-fun arrayContainsKey!0 (array!43780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804793 (= res!549313 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804794 () Bool)

(declare-fun res!549310 () Bool)

(assert (=> b!804794 (=> (not res!549310) (not e!445787))))

(declare-datatypes ((List!14933 0))(
  ( (Nil!14930) (Cons!14929 (h!16058 (_ BitVec 64)) (t!21248 List!14933)) )
))
(declare-fun arrayNoDuplicates!0 (array!43780 (_ BitVec 32) List!14933) Bool)

(assert (=> b!804794 (= res!549310 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14930))))

(declare-fun b!804795 () Bool)

(declare-fun res!549308 () Bool)

(assert (=> b!804795 (=> (not res!549308) (not e!445788))))

(assert (=> b!804795 (= res!549308 (validKeyInArray!0 k!2044))))

(declare-fun b!804796 () Bool)

(declare-fun res!549316 () Bool)

(assert (=> b!804796 (=> (not res!549316) (not e!445788))))

(assert (=> b!804796 (= res!549316 (and (= (size!21391 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21391 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21391 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804797 () Bool)

(assert (=> b!804797 (= e!445789 false)))

(declare-fun lt!360305 () SeekEntryResult!8561)

(assert (=> b!804797 (= lt!360305 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20970 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360301 () SeekEntryResult!8561)

(assert (=> b!804797 (= lt!360301 (seekEntryOrOpen!0 (select (arr!20970 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804798 () Bool)

(declare-fun res!549309 () Bool)

(assert (=> b!804798 (=> (not res!549309) (not e!445787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43780 (_ BitVec 32)) Bool)

(assert (=> b!804798 (= res!549309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804792 () Bool)

(assert (=> b!804792 (= e!445788 e!445787)))

(declare-fun res!549311 () Bool)

(assert (=> b!804792 (=> (not res!549311) (not e!445787))))

(declare-fun lt!360302 () SeekEntryResult!8561)

(assert (=> b!804792 (= res!549311 (or (= lt!360302 (MissingZero!8561 i!1163)) (= lt!360302 (MissingVacant!8561 i!1163))))))

(assert (=> b!804792 (= lt!360302 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!549315 () Bool)

(assert (=> start!68990 (=> (not res!549315) (not e!445788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68990 (= res!549315 (validMask!0 mask!3266))))

(assert (=> start!68990 e!445788))

(assert (=> start!68990 true))

(declare-fun array_inv!16766 (array!43780) Bool)

(assert (=> start!68990 (array_inv!16766 a!3170)))

(assert (= (and start!68990 res!549315) b!804796))

(assert (= (and b!804796 res!549316) b!804789))

(assert (= (and b!804789 res!549314) b!804795))

(assert (= (and b!804795 res!549308) b!804793))

(assert (= (and b!804793 res!549313) b!804792))

(assert (= (and b!804792 res!549311) b!804798))

(assert (= (and b!804798 res!549309) b!804794))

(assert (= (and b!804794 res!549310) b!804790))

(assert (= (and b!804790 res!549312) b!804791))

(assert (= (and b!804791 res!549317) b!804797))

(declare-fun m!746651 () Bool)

(assert (=> start!68990 m!746651))

(declare-fun m!746653 () Bool)

(assert (=> start!68990 m!746653))

(declare-fun m!746655 () Bool)

(assert (=> b!804794 m!746655))

(declare-fun m!746657 () Bool)

(assert (=> b!804797 m!746657))

(assert (=> b!804797 m!746657))

(declare-fun m!746659 () Bool)

(assert (=> b!804797 m!746659))

(assert (=> b!804797 m!746657))

(declare-fun m!746661 () Bool)

(assert (=> b!804797 m!746661))

(declare-fun m!746663 () Bool)

(assert (=> b!804793 m!746663))

(declare-fun m!746665 () Bool)

(assert (=> b!804790 m!746665))

(declare-fun m!746667 () Bool)

(assert (=> b!804790 m!746667))

(declare-fun m!746669 () Bool)

(assert (=> b!804792 m!746669))

(declare-fun m!746671 () Bool)

(assert (=> b!804791 m!746671))

(declare-fun m!746673 () Bool)

(assert (=> b!804791 m!746673))

(declare-fun m!746675 () Bool)

(assert (=> b!804791 m!746675))

(declare-fun m!746677 () Bool)

(assert (=> b!804791 m!746677))

(declare-fun m!746679 () Bool)

(assert (=> b!804795 m!746679))

(assert (=> b!804789 m!746657))

(assert (=> b!804789 m!746657))

(declare-fun m!746681 () Bool)

(assert (=> b!804789 m!746681))

(declare-fun m!746683 () Bool)

(assert (=> b!804798 m!746683))

(push 1)

