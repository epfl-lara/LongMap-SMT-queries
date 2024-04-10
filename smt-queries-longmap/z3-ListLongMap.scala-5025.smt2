; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68662 () Bool)

(assert start!68662)

(declare-fun b!799236 () Bool)

(declare-fun res!543764 () Bool)

(declare-fun e!443239 () Bool)

(assert (=> b!799236 (=> (not res!543764) (not e!443239))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799236 (= res!543764 (validKeyInArray!0 k0!2044))))

(declare-fun b!799237 () Bool)

(declare-fun res!543765 () Bool)

(declare-fun e!443236 () Bool)

(assert (=> b!799237 (=> (not res!543765) (not e!443236))))

(declare-datatypes ((array!43452 0))(
  ( (array!43453 (arr!20806 (Array (_ BitVec 32) (_ BitVec 64))) (size!21227 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43452)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43452 (_ BitVec 32)) Bool)

(assert (=> b!799237 (= res!543765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799238 () Bool)

(declare-fun res!543767 () Bool)

(assert (=> b!799238 (=> (not res!543767) (not e!443236))))

(declare-datatypes ((List!14769 0))(
  ( (Nil!14766) (Cons!14765 (h!15894 (_ BitVec 64)) (t!21084 List!14769)) )
))
(declare-fun arrayNoDuplicates!0 (array!43452 (_ BitVec 32) List!14769) Bool)

(assert (=> b!799238 (= res!543767 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14766))))

(declare-fun b!799239 () Bool)

(declare-fun e!443237 () Bool)

(declare-fun e!443235 () Bool)

(assert (=> b!799239 (= e!443237 e!443235)))

(declare-fun res!543758 () Bool)

(assert (=> b!799239 (=> (not res!543758) (not e!443235))))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8397 0))(
  ( (MissingZero!8397 (index!35956 (_ BitVec 32))) (Found!8397 (index!35957 (_ BitVec 32))) (Intermediate!8397 (undefined!9209 Bool) (index!35958 (_ BitVec 32)) (x!66835 (_ BitVec 32))) (Undefined!8397) (MissingVacant!8397 (index!35959 (_ BitVec 32))) )
))
(declare-fun lt!356866 () SeekEntryResult!8397)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356873 () SeekEntryResult!8397)

(assert (=> b!799239 (= res!543758 (and (= lt!356866 lt!356873) (= lt!356873 (Found!8397 j!153)) (not (= (select (arr!20806 a!3170) index!1236) (select (arr!20806 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43452 (_ BitVec 32)) SeekEntryResult!8397)

(assert (=> b!799239 (= lt!356873 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43452 (_ BitVec 32)) SeekEntryResult!8397)

(assert (=> b!799239 (= lt!356866 (seekEntryOrOpen!0 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799240 () Bool)

(declare-fun e!443238 () Bool)

(assert (=> b!799240 (= e!443238 false)))

(declare-fun lt!356871 () (_ BitVec 32))

(declare-fun lt!356868 () SeekEntryResult!8397)

(assert (=> b!799240 (= lt!356868 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356871 vacantBefore!23 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799241 () Bool)

(declare-fun res!543755 () Bool)

(assert (=> b!799241 (=> (not res!543755) (not e!443239))))

(assert (=> b!799241 (= res!543755 (validKeyInArray!0 (select (arr!20806 a!3170) j!153)))))

(declare-fun b!799242 () Bool)

(assert (=> b!799242 (= e!443239 e!443236)))

(declare-fun res!543757 () Bool)

(assert (=> b!799242 (=> (not res!543757) (not e!443236))))

(declare-fun lt!356867 () SeekEntryResult!8397)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799242 (= res!543757 (or (= lt!356867 (MissingZero!8397 i!1163)) (= lt!356867 (MissingVacant!8397 i!1163))))))

(assert (=> b!799242 (= lt!356867 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799243 () Bool)

(assert (=> b!799243 (= e!443235 e!443238)))

(declare-fun res!543759 () Bool)

(assert (=> b!799243 (=> (not res!543759) (not e!443238))))

(assert (=> b!799243 (= res!543759 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356871 #b00000000000000000000000000000000) (bvslt lt!356871 (size!21227 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799243 (= lt!356871 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!543763 () Bool)

(assert (=> start!68662 (=> (not res!543763) (not e!443239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68662 (= res!543763 (validMask!0 mask!3266))))

(assert (=> start!68662 e!443239))

(assert (=> start!68662 true))

(declare-fun array_inv!16602 (array!43452) Bool)

(assert (=> start!68662 (array_inv!16602 a!3170)))

(declare-fun b!799244 () Bool)

(assert (=> b!799244 (= e!443236 e!443237)))

(declare-fun res!543756 () Bool)

(assert (=> b!799244 (=> (not res!543756) (not e!443237))))

(declare-fun lt!356870 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356872 () SeekEntryResult!8397)

(declare-fun lt!356869 () array!43452)

(assert (=> b!799244 (= res!543756 (= lt!356872 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356870 lt!356869 mask!3266)))))

(assert (=> b!799244 (= lt!356872 (seekEntryOrOpen!0 lt!356870 lt!356869 mask!3266))))

(assert (=> b!799244 (= lt!356870 (select (store (arr!20806 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799244 (= lt!356869 (array!43453 (store (arr!20806 a!3170) i!1163 k0!2044) (size!21227 a!3170)))))

(declare-fun b!799245 () Bool)

(declare-fun res!543762 () Bool)

(assert (=> b!799245 (=> (not res!543762) (not e!443238))))

(assert (=> b!799245 (= res!543762 (= lt!356872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356871 vacantAfter!23 lt!356870 lt!356869 mask!3266)))))

(declare-fun b!799246 () Bool)

(declare-fun res!543766 () Bool)

(assert (=> b!799246 (=> (not res!543766) (not e!443239))))

(declare-fun arrayContainsKey!0 (array!43452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799246 (= res!543766 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799247 () Bool)

(declare-fun res!543761 () Bool)

(assert (=> b!799247 (=> (not res!543761) (not e!443236))))

(assert (=> b!799247 (= res!543761 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21227 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20806 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21227 a!3170)) (= (select (arr!20806 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799248 () Bool)

(declare-fun res!543760 () Bool)

(assert (=> b!799248 (=> (not res!543760) (not e!443239))))

(assert (=> b!799248 (= res!543760 (and (= (size!21227 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21227 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21227 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68662 res!543763) b!799248))

(assert (= (and b!799248 res!543760) b!799241))

(assert (= (and b!799241 res!543755) b!799236))

(assert (= (and b!799236 res!543764) b!799246))

(assert (= (and b!799246 res!543766) b!799242))

(assert (= (and b!799242 res!543757) b!799237))

(assert (= (and b!799237 res!543765) b!799238))

(assert (= (and b!799238 res!543767) b!799247))

(assert (= (and b!799247 res!543761) b!799244))

(assert (= (and b!799244 res!543756) b!799239))

(assert (= (and b!799239 res!543758) b!799243))

(assert (= (and b!799243 res!543759) b!799245))

(assert (= (and b!799245 res!543762) b!799240))

(declare-fun m!740231 () Bool)

(assert (=> b!799243 m!740231))

(declare-fun m!740233 () Bool)

(assert (=> b!799246 m!740233))

(declare-fun m!740235 () Bool)

(assert (=> b!799245 m!740235))

(declare-fun m!740237 () Bool)

(assert (=> b!799237 m!740237))

(declare-fun m!740239 () Bool)

(assert (=> b!799236 m!740239))

(declare-fun m!740241 () Bool)

(assert (=> b!799242 m!740241))

(declare-fun m!740243 () Bool)

(assert (=> b!799247 m!740243))

(declare-fun m!740245 () Bool)

(assert (=> b!799247 m!740245))

(declare-fun m!740247 () Bool)

(assert (=> start!68662 m!740247))

(declare-fun m!740249 () Bool)

(assert (=> start!68662 m!740249))

(declare-fun m!740251 () Bool)

(assert (=> b!799241 m!740251))

(assert (=> b!799241 m!740251))

(declare-fun m!740253 () Bool)

(assert (=> b!799241 m!740253))

(declare-fun m!740255 () Bool)

(assert (=> b!799244 m!740255))

(declare-fun m!740257 () Bool)

(assert (=> b!799244 m!740257))

(declare-fun m!740259 () Bool)

(assert (=> b!799244 m!740259))

(declare-fun m!740261 () Bool)

(assert (=> b!799244 m!740261))

(declare-fun m!740263 () Bool)

(assert (=> b!799238 m!740263))

(declare-fun m!740265 () Bool)

(assert (=> b!799239 m!740265))

(assert (=> b!799239 m!740251))

(assert (=> b!799239 m!740251))

(declare-fun m!740267 () Bool)

(assert (=> b!799239 m!740267))

(assert (=> b!799239 m!740251))

(declare-fun m!740269 () Bool)

(assert (=> b!799239 m!740269))

(assert (=> b!799240 m!740251))

(assert (=> b!799240 m!740251))

(declare-fun m!740271 () Bool)

(assert (=> b!799240 m!740271))

(check-sat (not b!799239) (not b!799240) (not b!799245) (not b!799244) (not b!799241) (not b!799243) (not b!799238) (not b!799237) (not b!799242) (not b!799236) (not start!68662) (not b!799246))
(check-sat)
