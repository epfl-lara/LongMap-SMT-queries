; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68316 () Bool)

(assert start!68316)

(declare-fun b!793694 () Bool)

(declare-fun res!538360 () Bool)

(declare-fun e!440785 () Bool)

(assert (=> b!793694 (=> (not res!538360) (not e!440785))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793694 (= res!538360 (validKeyInArray!0 k0!2044))))

(declare-fun res!538358 () Bool)

(assert (=> start!68316 (=> (not res!538358) (not e!440785))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68316 (= res!538358 (validMask!0 mask!3266))))

(assert (=> start!68316 e!440785))

(assert (=> start!68316 true))

(declare-datatypes ((array!43123 0))(
  ( (array!43124 (arr!20642 (Array (_ BitVec 32) (_ BitVec 64))) (size!21063 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43123)

(declare-fun array_inv!16525 (array!43123) Bool)

(assert (=> start!68316 (array_inv!16525 a!3170)))

(declare-fun b!793695 () Bool)

(declare-fun res!538362 () Bool)

(declare-fun e!440783 () Bool)

(assert (=> b!793695 (=> (not res!538362) (not e!440783))))

(declare-datatypes ((List!14644 0))(
  ( (Nil!14641) (Cons!14640 (h!15769 (_ BitVec 64)) (t!20950 List!14644)) )
))
(declare-fun arrayNoDuplicates!0 (array!43123 (_ BitVec 32) List!14644) Bool)

(assert (=> b!793695 (= res!538362 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14641))))

(declare-fun b!793696 () Bool)

(declare-fun res!538355 () Bool)

(assert (=> b!793696 (=> (not res!538355) (not e!440785))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793696 (= res!538355 (validKeyInArray!0 (select (arr!20642 a!3170) j!153)))))

(declare-fun b!793697 () Bool)

(declare-fun e!440782 () Bool)

(assert (=> b!793697 (= e!440783 e!440782)))

(declare-fun res!538357 () Bool)

(assert (=> b!793697 (=> (not res!538357) (not e!440782))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353685 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353687 () array!43123)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8230 0))(
  ( (MissingZero!8230 (index!35288 (_ BitVec 32))) (Found!8230 (index!35289 (_ BitVec 32))) (Intermediate!8230 (undefined!9042 Bool) (index!35290 (_ BitVec 32)) (x!66231 (_ BitVec 32))) (Undefined!8230) (MissingVacant!8230 (index!35291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43123 (_ BitVec 32)) SeekEntryResult!8230)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43123 (_ BitVec 32)) SeekEntryResult!8230)

(assert (=> b!793697 (= res!538357 (= (seekEntryOrOpen!0 lt!353685 lt!353687 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353685 lt!353687 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793697 (= lt!353685 (select (store (arr!20642 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793697 (= lt!353687 (array!43124 (store (arr!20642 a!3170) i!1163 k0!2044) (size!21063 a!3170)))))

(declare-fun b!793698 () Bool)

(declare-fun res!538353 () Bool)

(assert (=> b!793698 (=> (not res!538353) (not e!440783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43123 (_ BitVec 32)) Bool)

(assert (=> b!793698 (= res!538353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793699 () Bool)

(assert (=> b!793699 (= e!440785 e!440783)))

(declare-fun res!538359 () Bool)

(assert (=> b!793699 (=> (not res!538359) (not e!440783))))

(declare-fun lt!353686 () SeekEntryResult!8230)

(assert (=> b!793699 (= res!538359 (or (= lt!353686 (MissingZero!8230 i!1163)) (= lt!353686 (MissingVacant!8230 i!1163))))))

(assert (=> b!793699 (= lt!353686 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793700 () Bool)

(declare-fun res!538354 () Bool)

(assert (=> b!793700 (=> (not res!538354) (not e!440785))))

(assert (=> b!793700 (= res!538354 (and (= (size!21063 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21063 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21063 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793701 () Bool)

(declare-fun res!538356 () Bool)

(assert (=> b!793701 (=> (not res!538356) (not e!440785))))

(declare-fun arrayContainsKey!0 (array!43123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793701 (= res!538356 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793702 () Bool)

(assert (=> b!793702 (= e!440782 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793703 () Bool)

(declare-fun res!538361 () Bool)

(assert (=> b!793703 (=> (not res!538361) (not e!440783))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793703 (= res!538361 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21063 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20642 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21063 a!3170)) (= (select (arr!20642 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68316 res!538358) b!793700))

(assert (= (and b!793700 res!538354) b!793696))

(assert (= (and b!793696 res!538355) b!793694))

(assert (= (and b!793694 res!538360) b!793701))

(assert (= (and b!793701 res!538356) b!793699))

(assert (= (and b!793699 res!538359) b!793698))

(assert (= (and b!793698 res!538353) b!793695))

(assert (= (and b!793695 res!538362) b!793703))

(assert (= (and b!793703 res!538361) b!793697))

(assert (= (and b!793697 res!538357) b!793702))

(declare-fun m!733711 () Bool)

(assert (=> b!793696 m!733711))

(assert (=> b!793696 m!733711))

(declare-fun m!733713 () Bool)

(assert (=> b!793696 m!733713))

(declare-fun m!733715 () Bool)

(assert (=> b!793697 m!733715))

(declare-fun m!733717 () Bool)

(assert (=> b!793697 m!733717))

(declare-fun m!733719 () Bool)

(assert (=> b!793697 m!733719))

(declare-fun m!733721 () Bool)

(assert (=> b!793697 m!733721))

(declare-fun m!733723 () Bool)

(assert (=> b!793699 m!733723))

(declare-fun m!733725 () Bool)

(assert (=> b!793698 m!733725))

(declare-fun m!733727 () Bool)

(assert (=> b!793694 m!733727))

(declare-fun m!733729 () Bool)

(assert (=> b!793703 m!733729))

(declare-fun m!733731 () Bool)

(assert (=> b!793703 m!733731))

(declare-fun m!733733 () Bool)

(assert (=> start!68316 m!733733))

(declare-fun m!733735 () Bool)

(assert (=> start!68316 m!733735))

(declare-fun m!733737 () Bool)

(assert (=> b!793695 m!733737))

(declare-fun m!733739 () Bool)

(assert (=> b!793701 m!733739))

(check-sat (not b!793695) (not b!793701) (not b!793698) (not b!793697) (not b!793699) (not b!793694) (not b!793696) (not start!68316))
(check-sat)
