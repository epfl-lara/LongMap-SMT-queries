; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68664 () Bool)

(assert start!68664)

(declare-fun b!799415 () Bool)

(declare-fun res!544074 () Bool)

(declare-fun e!443282 () Bool)

(assert (=> b!799415 (=> (not res!544074) (not e!443282))))

(declare-datatypes ((array!43471 0))(
  ( (array!43472 (arr!20816 (Array (_ BitVec 32) (_ BitVec 64))) (size!21237 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43471)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799415 (= res!544074 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799416 () Bool)

(declare-fun res!544081 () Bool)

(declare-fun e!443280 () Bool)

(assert (=> b!799416 (=> (not res!544081) (not e!443280))))

(declare-fun lt!356894 () array!43471)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8404 0))(
  ( (MissingZero!8404 (index!35984 (_ BitVec 32))) (Found!8404 (index!35985 (_ BitVec 32))) (Intermediate!8404 (undefined!9216 Bool) (index!35986 (_ BitVec 32)) (x!66869 (_ BitVec 32))) (Undefined!8404) (MissingVacant!8404 (index!35987 (_ BitVec 32))) )
))
(declare-fun lt!356896 () SeekEntryResult!8404)

(declare-fun lt!356897 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356895 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43471 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!799416 (= res!544081 (= lt!356896 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356897 vacantAfter!23 lt!356895 lt!356894 mask!3266)))))

(declare-fun b!799417 () Bool)

(declare-fun e!443279 () Bool)

(declare-fun e!443283 () Bool)

(assert (=> b!799417 (= e!443279 e!443283)))

(declare-fun res!544077 () Bool)

(assert (=> b!799417 (=> (not res!544077) (not e!443283))))

(declare-fun lt!356892 () SeekEntryResult!8404)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356890 () SeekEntryResult!8404)

(assert (=> b!799417 (= res!544077 (and (= lt!356890 lt!356892) (= lt!356892 (Found!8404 j!153)) (not (= (select (arr!20816 a!3170) index!1236) (select (arr!20816 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799417 (= lt!356892 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43471 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!799417 (= lt!356890 (seekEntryOrOpen!0 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799418 () Bool)

(assert (=> b!799418 (= e!443283 e!443280)))

(declare-fun res!544079 () Bool)

(assert (=> b!799418 (=> (not res!544079) (not e!443280))))

(assert (=> b!799418 (= res!544079 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356897 #b00000000000000000000000000000000) (bvslt lt!356897 (size!21237 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799418 (= lt!356897 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544078 () Bool)

(assert (=> start!68664 (=> (not res!544078) (not e!443282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68664 (= res!544078 (validMask!0 mask!3266))))

(assert (=> start!68664 e!443282))

(assert (=> start!68664 true))

(declare-fun array_inv!16699 (array!43471) Bool)

(assert (=> start!68664 (array_inv!16699 a!3170)))

(declare-fun b!799419 () Bool)

(assert (=> b!799419 (= e!443280 false)))

(declare-fun lt!356891 () SeekEntryResult!8404)

(assert (=> b!799419 (= lt!356891 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356897 vacantBefore!23 (select (arr!20816 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799420 () Bool)

(declare-fun e!443284 () Bool)

(assert (=> b!799420 (= e!443282 e!443284)))

(declare-fun res!544082 () Bool)

(assert (=> b!799420 (=> (not res!544082) (not e!443284))))

(declare-fun lt!356893 () SeekEntryResult!8404)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799420 (= res!544082 (or (= lt!356893 (MissingZero!8404 i!1163)) (= lt!356893 (MissingVacant!8404 i!1163))))))

(assert (=> b!799420 (= lt!356893 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799421 () Bool)

(assert (=> b!799421 (= e!443284 e!443279)))

(declare-fun res!544084 () Bool)

(assert (=> b!799421 (=> (not res!544084) (not e!443279))))

(assert (=> b!799421 (= res!544084 (= lt!356896 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356895 lt!356894 mask!3266)))))

(assert (=> b!799421 (= lt!356896 (seekEntryOrOpen!0 lt!356895 lt!356894 mask!3266))))

(assert (=> b!799421 (= lt!356895 (select (store (arr!20816 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799421 (= lt!356894 (array!43472 (store (arr!20816 a!3170) i!1163 k0!2044) (size!21237 a!3170)))))

(declare-fun b!799422 () Bool)

(declare-fun res!544080 () Bool)

(assert (=> b!799422 (=> (not res!544080) (not e!443284))))

(declare-datatypes ((List!14818 0))(
  ( (Nil!14815) (Cons!14814 (h!15943 (_ BitVec 64)) (t!21124 List!14818)) )
))
(declare-fun arrayNoDuplicates!0 (array!43471 (_ BitVec 32) List!14818) Bool)

(assert (=> b!799422 (= res!544080 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14815))))

(declare-fun b!799423 () Bool)

(declare-fun res!544076 () Bool)

(assert (=> b!799423 (=> (not res!544076) (not e!443282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799423 (= res!544076 (validKeyInArray!0 (select (arr!20816 a!3170) j!153)))))

(declare-fun b!799424 () Bool)

(declare-fun res!544086 () Bool)

(assert (=> b!799424 (=> (not res!544086) (not e!443282))))

(assert (=> b!799424 (= res!544086 (and (= (size!21237 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21237 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21237 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799425 () Bool)

(declare-fun res!544083 () Bool)

(assert (=> b!799425 (=> (not res!544083) (not e!443284))))

(assert (=> b!799425 (= res!544083 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21237 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20816 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21237 a!3170)) (= (select (arr!20816 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799426 () Bool)

(declare-fun res!544075 () Bool)

(assert (=> b!799426 (=> (not res!544075) (not e!443282))))

(assert (=> b!799426 (= res!544075 (validKeyInArray!0 k0!2044))))

(declare-fun b!799427 () Bool)

(declare-fun res!544085 () Bool)

(assert (=> b!799427 (=> (not res!544085) (not e!443284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43471 (_ BitVec 32)) Bool)

(assert (=> b!799427 (= res!544085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68664 res!544078) b!799424))

(assert (= (and b!799424 res!544086) b!799423))

(assert (= (and b!799423 res!544076) b!799426))

(assert (= (and b!799426 res!544075) b!799415))

(assert (= (and b!799415 res!544074) b!799420))

(assert (= (and b!799420 res!544082) b!799427))

(assert (= (and b!799427 res!544085) b!799422))

(assert (= (and b!799422 res!544080) b!799425))

(assert (= (and b!799425 res!544083) b!799421))

(assert (= (and b!799421 res!544084) b!799417))

(assert (= (and b!799417 res!544077) b!799418))

(assert (= (and b!799418 res!544079) b!799416))

(assert (= (and b!799416 res!544081) b!799419))

(declare-fun m!739951 () Bool)

(assert (=> b!799426 m!739951))

(declare-fun m!739953 () Bool)

(assert (=> b!799421 m!739953))

(declare-fun m!739955 () Bool)

(assert (=> b!799421 m!739955))

(declare-fun m!739957 () Bool)

(assert (=> b!799421 m!739957))

(declare-fun m!739959 () Bool)

(assert (=> b!799421 m!739959))

(declare-fun m!739961 () Bool)

(assert (=> b!799425 m!739961))

(declare-fun m!739963 () Bool)

(assert (=> b!799425 m!739963))

(declare-fun m!739965 () Bool)

(assert (=> b!799417 m!739965))

(declare-fun m!739967 () Bool)

(assert (=> b!799417 m!739967))

(assert (=> b!799417 m!739967))

(declare-fun m!739969 () Bool)

(assert (=> b!799417 m!739969))

(assert (=> b!799417 m!739967))

(declare-fun m!739971 () Bool)

(assert (=> b!799417 m!739971))

(declare-fun m!739973 () Bool)

(assert (=> b!799420 m!739973))

(declare-fun m!739975 () Bool)

(assert (=> b!799415 m!739975))

(declare-fun m!739977 () Bool)

(assert (=> b!799416 m!739977))

(declare-fun m!739979 () Bool)

(assert (=> start!68664 m!739979))

(declare-fun m!739981 () Bool)

(assert (=> start!68664 m!739981))

(declare-fun m!739983 () Bool)

(assert (=> b!799422 m!739983))

(assert (=> b!799419 m!739967))

(assert (=> b!799419 m!739967))

(declare-fun m!739985 () Bool)

(assert (=> b!799419 m!739985))

(declare-fun m!739987 () Bool)

(assert (=> b!799427 m!739987))

(declare-fun m!739989 () Bool)

(assert (=> b!799418 m!739989))

(assert (=> b!799423 m!739967))

(assert (=> b!799423 m!739967))

(declare-fun m!739991 () Bool)

(assert (=> b!799423 m!739991))

(check-sat (not b!799427) (not b!799419) (not start!68664) (not b!799420) (not b!799416) (not b!799421) (not b!799426) (not b!799418) (not b!799417) (not b!799423) (not b!799415) (not b!799422))
(check-sat)
