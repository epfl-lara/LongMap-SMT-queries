; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68568 () Bool)

(assert start!68568)

(declare-fun b!797721 () Bool)

(declare-fun res!542381 () Bool)

(declare-fun e!442517 () Bool)

(assert (=> b!797721 (=> (not res!542381) (not e!442517))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43375 0))(
  ( (array!43376 (arr!20768 (Array (_ BitVec 32) (_ BitVec 64))) (size!21189 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43375)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797721 (= res!542381 (and (= (size!21189 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21189 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21189 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797722 () Bool)

(declare-fun res!542389 () Bool)

(declare-fun e!442515 () Bool)

(assert (=> b!797722 (=> (not res!542389) (not e!442515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43375 (_ BitVec 32)) Bool)

(assert (=> b!797722 (= res!542389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797723 () Bool)

(declare-fun e!442514 () Bool)

(declare-fun e!442519 () Bool)

(assert (=> b!797723 (= e!442514 e!442519)))

(declare-fun res!542383 () Bool)

(assert (=> b!797723 (=> (not res!542383) (not e!442519))))

(declare-datatypes ((SeekEntryResult!8356 0))(
  ( (MissingZero!8356 (index!35792 (_ BitVec 32))) (Found!8356 (index!35793 (_ BitVec 32))) (Intermediate!8356 (undefined!9168 Bool) (index!35794 (_ BitVec 32)) (x!66693 (_ BitVec 32))) (Undefined!8356) (MissingVacant!8356 (index!35795 (_ BitVec 32))) )
))
(declare-fun lt!355875 () SeekEntryResult!8356)

(declare-fun lt!355873 () SeekEntryResult!8356)

(assert (=> b!797723 (= res!542383 (= lt!355875 lt!355873))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43375 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!797723 (= lt!355873 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20768 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43375 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!797723 (= lt!355875 (seekEntryOrOpen!0 (select (arr!20768 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797725 () Bool)

(declare-fun e!442516 () Bool)

(assert (=> b!797725 (= e!442519 e!442516)))

(declare-fun res!542380 () Bool)

(assert (=> b!797725 (=> (not res!542380) (not e!442516))))

(declare-fun lt!355876 () SeekEntryResult!8356)

(assert (=> b!797725 (= res!542380 (and (= lt!355873 lt!355876) (= (select (arr!20768 a!3170) index!1236) (select (arr!20768 a!3170) j!153))))))

(assert (=> b!797725 (= lt!355876 (Found!8356 j!153))))

(declare-fun b!797726 () Bool)

(declare-fun res!542382 () Bool)

(assert (=> b!797726 (=> (not res!542382) (not e!442517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797726 (= res!542382 (validKeyInArray!0 (select (arr!20768 a!3170) j!153)))))

(declare-fun b!797727 () Bool)

(declare-fun res!542391 () Bool)

(assert (=> b!797727 (=> (not res!542391) (not e!442515))))

(declare-datatypes ((List!14770 0))(
  ( (Nil!14767) (Cons!14766 (h!15895 (_ BitVec 64)) (t!21076 List!14770)) )
))
(declare-fun arrayNoDuplicates!0 (array!43375 (_ BitVec 32) List!14770) Bool)

(assert (=> b!797727 (= res!542391 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14767))))

(declare-fun b!797728 () Bool)

(declare-fun res!542384 () Bool)

(assert (=> b!797728 (=> (not res!542384) (not e!442517))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797728 (= res!542384 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797729 () Bool)

(declare-fun lt!355878 () SeekEntryResult!8356)

(assert (=> b!797729 (= e!442516 (not (or (not (= lt!355878 lt!355876)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797729 (= lt!355878 (Found!8356 index!1236))))

(declare-fun b!797730 () Bool)

(declare-fun res!542387 () Bool)

(assert (=> b!797730 (=> (not res!542387) (not e!442517))))

(assert (=> b!797730 (= res!542387 (validKeyInArray!0 k0!2044))))

(declare-fun b!797731 () Bool)

(declare-fun res!542390 () Bool)

(assert (=> b!797731 (=> (not res!542390) (not e!442515))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797731 (= res!542390 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21189 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20768 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21189 a!3170)) (= (select (arr!20768 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797732 () Bool)

(assert (=> b!797732 (= e!442517 e!442515)))

(declare-fun res!542388 () Bool)

(assert (=> b!797732 (=> (not res!542388) (not e!442515))))

(declare-fun lt!355880 () SeekEntryResult!8356)

(assert (=> b!797732 (= res!542388 (or (= lt!355880 (MissingZero!8356 i!1163)) (= lt!355880 (MissingVacant!8356 i!1163))))))

(assert (=> b!797732 (= lt!355880 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!542385 () Bool)

(assert (=> start!68568 (=> (not res!542385) (not e!442517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68568 (= res!542385 (validMask!0 mask!3266))))

(assert (=> start!68568 e!442517))

(assert (=> start!68568 true))

(declare-fun array_inv!16651 (array!43375) Bool)

(assert (=> start!68568 (array_inv!16651 a!3170)))

(declare-fun b!797724 () Bool)

(assert (=> b!797724 (= e!442515 e!442514)))

(declare-fun res!542386 () Bool)

(assert (=> b!797724 (=> (not res!542386) (not e!442514))))

(declare-fun lt!355874 () SeekEntryResult!8356)

(assert (=> b!797724 (= res!542386 (= lt!355874 lt!355878))))

(declare-fun lt!355879 () (_ BitVec 64))

(declare-fun lt!355877 () array!43375)

(assert (=> b!797724 (= lt!355878 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355879 lt!355877 mask!3266))))

(assert (=> b!797724 (= lt!355874 (seekEntryOrOpen!0 lt!355879 lt!355877 mask!3266))))

(assert (=> b!797724 (= lt!355879 (select (store (arr!20768 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797724 (= lt!355877 (array!43376 (store (arr!20768 a!3170) i!1163 k0!2044) (size!21189 a!3170)))))

(assert (= (and start!68568 res!542385) b!797721))

(assert (= (and b!797721 res!542381) b!797726))

(assert (= (and b!797726 res!542382) b!797730))

(assert (= (and b!797730 res!542387) b!797728))

(assert (= (and b!797728 res!542384) b!797732))

(assert (= (and b!797732 res!542388) b!797722))

(assert (= (and b!797722 res!542389) b!797727))

(assert (= (and b!797727 res!542391) b!797731))

(assert (= (and b!797731 res!542390) b!797724))

(assert (= (and b!797724 res!542386) b!797723))

(assert (= (and b!797723 res!542383) b!797725))

(assert (= (and b!797725 res!542380) b!797729))

(declare-fun m!738109 () Bool)

(assert (=> b!797726 m!738109))

(assert (=> b!797726 m!738109))

(declare-fun m!738111 () Bool)

(assert (=> b!797726 m!738111))

(declare-fun m!738113 () Bool)

(assert (=> b!797727 m!738113))

(declare-fun m!738115 () Bool)

(assert (=> b!797728 m!738115))

(declare-fun m!738117 () Bool)

(assert (=> b!797731 m!738117))

(declare-fun m!738119 () Bool)

(assert (=> b!797731 m!738119))

(declare-fun m!738121 () Bool)

(assert (=> b!797732 m!738121))

(assert (=> b!797723 m!738109))

(assert (=> b!797723 m!738109))

(declare-fun m!738123 () Bool)

(assert (=> b!797723 m!738123))

(assert (=> b!797723 m!738109))

(declare-fun m!738125 () Bool)

(assert (=> b!797723 m!738125))

(declare-fun m!738127 () Bool)

(assert (=> start!68568 m!738127))

(declare-fun m!738129 () Bool)

(assert (=> start!68568 m!738129))

(declare-fun m!738131 () Bool)

(assert (=> b!797724 m!738131))

(declare-fun m!738133 () Bool)

(assert (=> b!797724 m!738133))

(declare-fun m!738135 () Bool)

(assert (=> b!797724 m!738135))

(declare-fun m!738137 () Bool)

(assert (=> b!797724 m!738137))

(declare-fun m!738139 () Bool)

(assert (=> b!797722 m!738139))

(declare-fun m!738141 () Bool)

(assert (=> b!797730 m!738141))

(declare-fun m!738143 () Bool)

(assert (=> b!797725 m!738143))

(assert (=> b!797725 m!738109))

(check-sat (not b!797730) (not b!797732) (not b!797724) (not start!68568) (not b!797722) (not b!797728) (not b!797727) (not b!797723) (not b!797726))
(check-sat)
