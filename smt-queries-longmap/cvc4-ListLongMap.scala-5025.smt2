; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68664 () Bool)

(assert start!68664)

(declare-fun b!799275 () Bool)

(declare-fun res!543801 () Bool)

(declare-fun e!443256 () Bool)

(assert (=> b!799275 (=> (not res!543801) (not e!443256))))

(declare-datatypes ((array!43454 0))(
  ( (array!43455 (arr!20807 (Array (_ BitVec 32) (_ BitVec 64))) (size!21228 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43454)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799275 (= res!543801 (validKeyInArray!0 (select (arr!20807 a!3170) j!153)))))

(declare-fun b!799276 () Bool)

(declare-fun res!543806 () Bool)

(assert (=> b!799276 (=> (not res!543806) (not e!443256))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799276 (= res!543806 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!543804 () Bool)

(assert (=> start!68664 (=> (not res!543804) (not e!443256))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68664 (= res!543804 (validMask!0 mask!3266))))

(assert (=> start!68664 e!443256))

(assert (=> start!68664 true))

(declare-fun array_inv!16603 (array!43454) Bool)

(assert (=> start!68664 (array_inv!16603 a!3170)))

(declare-fun b!799277 () Bool)

(declare-fun res!543800 () Bool)

(declare-fun e!443258 () Bool)

(assert (=> b!799277 (=> (not res!543800) (not e!443258))))

(declare-datatypes ((List!14770 0))(
  ( (Nil!14767) (Cons!14766 (h!15895 (_ BitVec 64)) (t!21085 List!14770)) )
))
(declare-fun arrayNoDuplicates!0 (array!43454 (_ BitVec 32) List!14770) Bool)

(assert (=> b!799277 (= res!543800 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14767))))

(declare-fun b!799278 () Bool)

(declare-fun e!443255 () Bool)

(declare-fun e!443253 () Bool)

(assert (=> b!799278 (= e!443255 e!443253)))

(declare-fun res!543794 () Bool)

(assert (=> b!799278 (=> (not res!543794) (not e!443253))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356895 () (_ BitVec 32))

(assert (=> b!799278 (= res!543794 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356895 #b00000000000000000000000000000000) (bvslt lt!356895 (size!21228 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799278 (= lt!356895 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799279 () Bool)

(declare-fun e!443257 () Bool)

(assert (=> b!799279 (= e!443257 e!443255)))

(declare-fun res!543797 () Bool)

(assert (=> b!799279 (=> (not res!543797) (not e!443255))))

(declare-datatypes ((SeekEntryResult!8398 0))(
  ( (MissingZero!8398 (index!35960 (_ BitVec 32))) (Found!8398 (index!35961 (_ BitVec 32))) (Intermediate!8398 (undefined!9210 Bool) (index!35962 (_ BitVec 32)) (x!66836 (_ BitVec 32))) (Undefined!8398) (MissingVacant!8398 (index!35963 (_ BitVec 32))) )
))
(declare-fun lt!356890 () SeekEntryResult!8398)

(declare-fun lt!356894 () SeekEntryResult!8398)

(assert (=> b!799279 (= res!543797 (and (= lt!356890 lt!356894) (= lt!356894 (Found!8398 j!153)) (not (= (select (arr!20807 a!3170) index!1236) (select (arr!20807 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43454 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!799279 (= lt!356894 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43454 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!799279 (= lt!356890 (seekEntryOrOpen!0 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799280 () Bool)

(declare-fun res!543805 () Bool)

(assert (=> b!799280 (=> (not res!543805) (not e!443256))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799280 (= res!543805 (and (= (size!21228 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21228 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21228 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799281 () Bool)

(declare-fun res!543802 () Bool)

(assert (=> b!799281 (=> (not res!543802) (not e!443258))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!799281 (= res!543802 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21228 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20807 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21228 a!3170)) (= (select (arr!20807 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799282 () Bool)

(assert (=> b!799282 (= e!443256 e!443258)))

(declare-fun res!543803 () Bool)

(assert (=> b!799282 (=> (not res!543803) (not e!443258))))

(declare-fun lt!356896 () SeekEntryResult!8398)

(assert (=> b!799282 (= res!543803 (or (= lt!356896 (MissingZero!8398 i!1163)) (= lt!356896 (MissingVacant!8398 i!1163))))))

(assert (=> b!799282 (= lt!356896 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799283 () Bool)

(assert (=> b!799283 (= e!443258 e!443257)))

(declare-fun res!543795 () Bool)

(assert (=> b!799283 (=> (not res!543795) (not e!443257))))

(declare-fun lt!356892 () SeekEntryResult!8398)

(declare-fun lt!356897 () array!43454)

(declare-fun lt!356891 () (_ BitVec 64))

(assert (=> b!799283 (= res!543795 (= lt!356892 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356891 lt!356897 mask!3266)))))

(assert (=> b!799283 (= lt!356892 (seekEntryOrOpen!0 lt!356891 lt!356897 mask!3266))))

(assert (=> b!799283 (= lt!356891 (select (store (arr!20807 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799283 (= lt!356897 (array!43455 (store (arr!20807 a!3170) i!1163 k!2044) (size!21228 a!3170)))))

(declare-fun b!799284 () Bool)

(assert (=> b!799284 (= e!443253 false)))

(declare-fun lt!356893 () SeekEntryResult!8398)

(assert (=> b!799284 (= lt!356893 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356895 vacantBefore!23 (select (arr!20807 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799285 () Bool)

(declare-fun res!543799 () Bool)

(assert (=> b!799285 (=> (not res!543799) (not e!443256))))

(assert (=> b!799285 (= res!543799 (validKeyInArray!0 k!2044))))

(declare-fun b!799286 () Bool)

(declare-fun res!543796 () Bool)

(assert (=> b!799286 (=> (not res!543796) (not e!443258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43454 (_ BitVec 32)) Bool)

(assert (=> b!799286 (= res!543796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799287 () Bool)

(declare-fun res!543798 () Bool)

(assert (=> b!799287 (=> (not res!543798) (not e!443253))))

(assert (=> b!799287 (= res!543798 (= lt!356892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356895 vacantAfter!23 lt!356891 lt!356897 mask!3266)))))

(assert (= (and start!68664 res!543804) b!799280))

(assert (= (and b!799280 res!543805) b!799275))

(assert (= (and b!799275 res!543801) b!799285))

(assert (= (and b!799285 res!543799) b!799276))

(assert (= (and b!799276 res!543806) b!799282))

(assert (= (and b!799282 res!543803) b!799286))

(assert (= (and b!799286 res!543796) b!799277))

(assert (= (and b!799277 res!543800) b!799281))

(assert (= (and b!799281 res!543802) b!799283))

(assert (= (and b!799283 res!543795) b!799279))

(assert (= (and b!799279 res!543797) b!799278))

(assert (= (and b!799278 res!543794) b!799287))

(assert (= (and b!799287 res!543798) b!799284))

(declare-fun m!740273 () Bool)

(assert (=> b!799287 m!740273))

(declare-fun m!740275 () Bool)

(assert (=> b!799281 m!740275))

(declare-fun m!740277 () Bool)

(assert (=> b!799281 m!740277))

(declare-fun m!740279 () Bool)

(assert (=> b!799277 m!740279))

(declare-fun m!740281 () Bool)

(assert (=> start!68664 m!740281))

(declare-fun m!740283 () Bool)

(assert (=> start!68664 m!740283))

(declare-fun m!740285 () Bool)

(assert (=> b!799283 m!740285))

(declare-fun m!740287 () Bool)

(assert (=> b!799283 m!740287))

(declare-fun m!740289 () Bool)

(assert (=> b!799283 m!740289))

(declare-fun m!740291 () Bool)

(assert (=> b!799283 m!740291))

(declare-fun m!740293 () Bool)

(assert (=> b!799284 m!740293))

(assert (=> b!799284 m!740293))

(declare-fun m!740295 () Bool)

(assert (=> b!799284 m!740295))

(declare-fun m!740297 () Bool)

(assert (=> b!799286 m!740297))

(declare-fun m!740299 () Bool)

(assert (=> b!799276 m!740299))

(declare-fun m!740301 () Bool)

(assert (=> b!799278 m!740301))

(declare-fun m!740303 () Bool)

(assert (=> b!799282 m!740303))

(declare-fun m!740305 () Bool)

(assert (=> b!799285 m!740305))

(assert (=> b!799275 m!740293))

(assert (=> b!799275 m!740293))

(declare-fun m!740307 () Bool)

(assert (=> b!799275 m!740307))

(declare-fun m!740309 () Bool)

(assert (=> b!799279 m!740309))

(assert (=> b!799279 m!740293))

(assert (=> b!799279 m!740293))

(declare-fun m!740311 () Bool)

(assert (=> b!799279 m!740311))

(assert (=> b!799279 m!740293))

(declare-fun m!740313 () Bool)

(assert (=> b!799279 m!740313))

(push 1)

(assert (not start!68664))

(assert (not b!799279))

(assert (not b!799285))

(assert (not b!799286))

(assert (not b!799287))

(assert (not b!799277))

(assert (not b!799276))

(assert (not b!799278))

