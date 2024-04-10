; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68500 () Bool)

(assert start!68500)

(declare-fun b!796445 () Bool)

(declare-fun e!441935 () Bool)

(declare-fun e!441936 () Bool)

(assert (=> b!796445 (= e!441935 e!441936)))

(declare-fun res!540968 () Bool)

(assert (=> b!796445 (=> (not res!540968) (not e!441936))))

(declare-datatypes ((SeekEntryResult!8316 0))(
  ( (MissingZero!8316 (index!35632 (_ BitVec 32))) (Found!8316 (index!35633 (_ BitVec 32))) (Intermediate!8316 (undefined!9128 Bool) (index!35634 (_ BitVec 32)) (x!66538 (_ BitVec 32))) (Undefined!8316) (MissingVacant!8316 (index!35635 (_ BitVec 32))) )
))
(declare-fun lt!355133 () SeekEntryResult!8316)

(declare-fun lt!355139 () SeekEntryResult!8316)

(assert (=> b!796445 (= res!540968 (= lt!355133 lt!355139))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43290 0))(
  ( (array!43291 (arr!20725 (Array (_ BitVec 32) (_ BitVec 64))) (size!21146 (_ BitVec 32))) )
))
(declare-fun lt!355134 () array!43290)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355135 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43290 (_ BitVec 32)) SeekEntryResult!8316)

(assert (=> b!796445 (= lt!355139 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355135 lt!355134 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43290 (_ BitVec 32)) SeekEntryResult!8316)

(assert (=> b!796445 (= lt!355133 (seekEntryOrOpen!0 lt!355135 lt!355134 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43290)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796445 (= lt!355135 (select (store (arr!20725 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796445 (= lt!355134 (array!43291 (store (arr!20725 a!3170) i!1163 k0!2044) (size!21146 a!3170)))))

(declare-fun b!796446 () Bool)

(declare-fun res!540972 () Bool)

(assert (=> b!796446 (=> (not res!540972) (not e!441935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43290 (_ BitVec 32)) Bool)

(assert (=> b!796446 (= res!540972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796447 () Bool)

(declare-fun e!441938 () Bool)

(assert (=> b!796447 (= e!441938 (not true))))

(assert (=> b!796447 (= lt!355139 (Found!8316 index!1236))))

(declare-fun res!540973 () Bool)

(declare-fun e!441937 () Bool)

(assert (=> start!68500 (=> (not res!540973) (not e!441937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68500 (= res!540973 (validMask!0 mask!3266))))

(assert (=> start!68500 e!441937))

(assert (=> start!68500 true))

(declare-fun array_inv!16521 (array!43290) Bool)

(assert (=> start!68500 (array_inv!16521 a!3170)))

(declare-fun b!796448 () Bool)

(declare-fun res!540967 () Bool)

(assert (=> b!796448 (=> (not res!540967) (not e!441937))))

(declare-fun arrayContainsKey!0 (array!43290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796448 (= res!540967 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796449 () Bool)

(declare-fun res!540969 () Bool)

(assert (=> b!796449 (=> (not res!540969) (not e!441935))))

(declare-datatypes ((List!14688 0))(
  ( (Nil!14685) (Cons!14684 (h!15813 (_ BitVec 64)) (t!21003 List!14688)) )
))
(declare-fun arrayNoDuplicates!0 (array!43290 (_ BitVec 32) List!14688) Bool)

(assert (=> b!796449 (= res!540969 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14685))))

(declare-fun b!796450 () Bool)

(declare-fun res!540974 () Bool)

(assert (=> b!796450 (=> (not res!540974) (not e!441937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796450 (= res!540974 (validKeyInArray!0 k0!2044))))

(declare-fun b!796451 () Bool)

(assert (=> b!796451 (= e!441936 e!441938)))

(declare-fun res!540964 () Bool)

(assert (=> b!796451 (=> (not res!540964) (not e!441938))))

(declare-fun lt!355137 () SeekEntryResult!8316)

(declare-fun lt!355136 () SeekEntryResult!8316)

(assert (=> b!796451 (= res!540964 (and (= lt!355136 lt!355137) (= lt!355137 (Found!8316 j!153)) (= (select (arr!20725 a!3170) index!1236) (select (arr!20725 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796451 (= lt!355137 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20725 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796451 (= lt!355136 (seekEntryOrOpen!0 (select (arr!20725 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796452 () Bool)

(declare-fun res!540965 () Bool)

(assert (=> b!796452 (=> (not res!540965) (not e!441937))))

(assert (=> b!796452 (= res!540965 (and (= (size!21146 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21146 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21146 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796453 () Bool)

(assert (=> b!796453 (= e!441937 e!441935)))

(declare-fun res!540966 () Bool)

(assert (=> b!796453 (=> (not res!540966) (not e!441935))))

(declare-fun lt!355138 () SeekEntryResult!8316)

(assert (=> b!796453 (= res!540966 (or (= lt!355138 (MissingZero!8316 i!1163)) (= lt!355138 (MissingVacant!8316 i!1163))))))

(assert (=> b!796453 (= lt!355138 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796454 () Bool)

(declare-fun res!540970 () Bool)

(assert (=> b!796454 (=> (not res!540970) (not e!441937))))

(assert (=> b!796454 (= res!540970 (validKeyInArray!0 (select (arr!20725 a!3170) j!153)))))

(declare-fun b!796455 () Bool)

(declare-fun res!540971 () Bool)

(assert (=> b!796455 (=> (not res!540971) (not e!441935))))

(assert (=> b!796455 (= res!540971 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21146 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20725 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21146 a!3170)) (= (select (arr!20725 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68500 res!540973) b!796452))

(assert (= (and b!796452 res!540965) b!796454))

(assert (= (and b!796454 res!540970) b!796450))

(assert (= (and b!796450 res!540974) b!796448))

(assert (= (and b!796448 res!540967) b!796453))

(assert (= (and b!796453 res!540966) b!796446))

(assert (= (and b!796446 res!540972) b!796449))

(assert (= (and b!796449 res!540969) b!796455))

(assert (= (and b!796455 res!540971) b!796445))

(assert (= (and b!796445 res!540968) b!796451))

(assert (= (and b!796451 res!540964) b!796447))

(declare-fun m!737231 () Bool)

(assert (=> b!796448 m!737231))

(declare-fun m!737233 () Bool)

(assert (=> b!796453 m!737233))

(declare-fun m!737235 () Bool)

(assert (=> b!796446 m!737235))

(declare-fun m!737237 () Bool)

(assert (=> b!796451 m!737237))

(declare-fun m!737239 () Bool)

(assert (=> b!796451 m!737239))

(assert (=> b!796451 m!737239))

(declare-fun m!737241 () Bool)

(assert (=> b!796451 m!737241))

(assert (=> b!796451 m!737239))

(declare-fun m!737243 () Bool)

(assert (=> b!796451 m!737243))

(assert (=> b!796454 m!737239))

(assert (=> b!796454 m!737239))

(declare-fun m!737245 () Bool)

(assert (=> b!796454 m!737245))

(declare-fun m!737247 () Bool)

(assert (=> b!796450 m!737247))

(declare-fun m!737249 () Bool)

(assert (=> start!68500 m!737249))

(declare-fun m!737251 () Bool)

(assert (=> start!68500 m!737251))

(declare-fun m!737253 () Bool)

(assert (=> b!796449 m!737253))

(declare-fun m!737255 () Bool)

(assert (=> b!796445 m!737255))

(declare-fun m!737257 () Bool)

(assert (=> b!796445 m!737257))

(declare-fun m!737259 () Bool)

(assert (=> b!796445 m!737259))

(declare-fun m!737261 () Bool)

(assert (=> b!796445 m!737261))

(declare-fun m!737263 () Bool)

(assert (=> b!796455 m!737263))

(declare-fun m!737265 () Bool)

(assert (=> b!796455 m!737265))

(check-sat (not b!796454) (not start!68500) (not b!796446) (not b!796448) (not b!796449) (not b!796450) (not b!796445) (not b!796451) (not b!796453))
(check-sat)
