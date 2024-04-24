; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68736 () Bool)

(assert start!68736)

(declare-fun b!799034 () Bool)

(declare-fun res!543188 () Bool)

(declare-fun e!443288 () Bool)

(assert (=> b!799034 (=> (not res!543188) (not e!443288))))

(declare-datatypes ((array!43400 0))(
  ( (array!43401 (arr!20776 (Array (_ BitVec 32) (_ BitVec 64))) (size!21196 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43400)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799034 (= res!543188 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799035 () Bool)

(declare-fun e!443287 () Bool)

(assert (=> b!799035 (= e!443287 (not true))))

(declare-datatypes ((SeekEntryResult!8323 0))(
  ( (MissingZero!8323 (index!35660 (_ BitVec 32))) (Found!8323 (index!35661 (_ BitVec 32))) (Intermediate!8323 (undefined!9135 Bool) (index!35662 (_ BitVec 32)) (x!66708 (_ BitVec 32))) (Undefined!8323) (MissingVacant!8323 (index!35663 (_ BitVec 32))) )
))
(declare-fun lt!356658 () SeekEntryResult!8323)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799035 (= lt!356658 (Found!8323 index!1236))))

(declare-fun b!799036 () Bool)

(declare-fun res!543184 () Bool)

(assert (=> b!799036 (=> (not res!543184) (not e!443288))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!799036 (= res!543184 (and (= (size!21196 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21196 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21196 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799037 () Bool)

(declare-fun res!543179 () Bool)

(assert (=> b!799037 (=> (not res!543179) (not e!443288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799037 (= res!543179 (validKeyInArray!0 (select (arr!20776 a!3170) j!153)))))

(declare-fun b!799038 () Bool)

(declare-fun e!443290 () Bool)

(assert (=> b!799038 (= e!443288 e!443290)))

(declare-fun res!543181 () Bool)

(assert (=> b!799038 (=> (not res!543181) (not e!443290))))

(declare-fun lt!356654 () SeekEntryResult!8323)

(assert (=> b!799038 (= res!543181 (or (= lt!356654 (MissingZero!8323 i!1163)) (= lt!356654 (MissingVacant!8323 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43400 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!799038 (= lt!356654 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799039 () Bool)

(declare-fun e!443289 () Bool)

(assert (=> b!799039 (= e!443290 e!443289)))

(declare-fun res!543182 () Bool)

(assert (=> b!799039 (=> (not res!543182) (not e!443289))))

(declare-fun lt!356655 () SeekEntryResult!8323)

(assert (=> b!799039 (= res!543182 (= lt!356655 lt!356658))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356653 () (_ BitVec 64))

(declare-fun lt!356659 () array!43400)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43400 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!799039 (= lt!356658 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356653 lt!356659 mask!3266))))

(assert (=> b!799039 (= lt!356655 (seekEntryOrOpen!0 lt!356653 lt!356659 mask!3266))))

(assert (=> b!799039 (= lt!356653 (select (store (arr!20776 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799039 (= lt!356659 (array!43401 (store (arr!20776 a!3170) i!1163 k0!2044) (size!21196 a!3170)))))

(declare-fun b!799040 () Bool)

(assert (=> b!799040 (= e!443289 e!443287)))

(declare-fun res!543183 () Bool)

(assert (=> b!799040 (=> (not res!543183) (not e!443287))))

(declare-fun lt!356657 () SeekEntryResult!8323)

(declare-fun lt!356656 () SeekEntryResult!8323)

(assert (=> b!799040 (= res!543183 (and (= lt!356657 lt!356656) (= lt!356656 (Found!8323 j!153)) (= (select (arr!20776 a!3170) index!1236) (select (arr!20776 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799040 (= lt!356656 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20776 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799040 (= lt!356657 (seekEntryOrOpen!0 (select (arr!20776 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799041 () Bool)

(declare-fun res!543189 () Bool)

(assert (=> b!799041 (=> (not res!543189) (not e!443290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43400 (_ BitVec 32)) Bool)

(assert (=> b!799041 (= res!543189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799042 () Bool)

(declare-fun res!543186 () Bool)

(assert (=> b!799042 (=> (not res!543186) (not e!443288))))

(assert (=> b!799042 (= res!543186 (validKeyInArray!0 k0!2044))))

(declare-fun b!799043 () Bool)

(declare-fun res!543180 () Bool)

(assert (=> b!799043 (=> (not res!543180) (not e!443290))))

(assert (=> b!799043 (= res!543180 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21196 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20776 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21196 a!3170)) (= (select (arr!20776 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!543185 () Bool)

(assert (=> start!68736 (=> (not res!543185) (not e!443288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68736 (= res!543185 (validMask!0 mask!3266))))

(assert (=> start!68736 e!443288))

(assert (=> start!68736 true))

(declare-fun array_inv!16635 (array!43400) Bool)

(assert (=> start!68736 (array_inv!16635 a!3170)))

(declare-fun b!799044 () Bool)

(declare-fun res!543187 () Bool)

(assert (=> b!799044 (=> (not res!543187) (not e!443290))))

(declare-datatypes ((List!14646 0))(
  ( (Nil!14643) (Cons!14642 (h!15777 (_ BitVec 64)) (t!20953 List!14646)) )
))
(declare-fun arrayNoDuplicates!0 (array!43400 (_ BitVec 32) List!14646) Bool)

(assert (=> b!799044 (= res!543187 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14643))))

(assert (= (and start!68736 res!543185) b!799036))

(assert (= (and b!799036 res!543184) b!799037))

(assert (= (and b!799037 res!543179) b!799042))

(assert (= (and b!799042 res!543186) b!799034))

(assert (= (and b!799034 res!543188) b!799038))

(assert (= (and b!799038 res!543181) b!799041))

(assert (= (and b!799041 res!543189) b!799044))

(assert (= (and b!799044 res!543187) b!799043))

(assert (= (and b!799043 res!543180) b!799039))

(assert (= (and b!799039 res!543182) b!799040))

(assert (= (and b!799040 res!543183) b!799035))

(declare-fun m!740363 () Bool)

(assert (=> b!799041 m!740363))

(declare-fun m!740365 () Bool)

(assert (=> b!799044 m!740365))

(declare-fun m!740367 () Bool)

(assert (=> b!799034 m!740367))

(declare-fun m!740369 () Bool)

(assert (=> b!799039 m!740369))

(declare-fun m!740371 () Bool)

(assert (=> b!799039 m!740371))

(declare-fun m!740373 () Bool)

(assert (=> b!799039 m!740373))

(declare-fun m!740375 () Bool)

(assert (=> b!799039 m!740375))

(declare-fun m!740377 () Bool)

(assert (=> b!799038 m!740377))

(declare-fun m!740379 () Bool)

(assert (=> b!799042 m!740379))

(declare-fun m!740381 () Bool)

(assert (=> start!68736 m!740381))

(declare-fun m!740383 () Bool)

(assert (=> start!68736 m!740383))

(declare-fun m!740385 () Bool)

(assert (=> b!799043 m!740385))

(declare-fun m!740387 () Bool)

(assert (=> b!799043 m!740387))

(declare-fun m!740389 () Bool)

(assert (=> b!799040 m!740389))

(declare-fun m!740391 () Bool)

(assert (=> b!799040 m!740391))

(assert (=> b!799040 m!740391))

(declare-fun m!740393 () Bool)

(assert (=> b!799040 m!740393))

(assert (=> b!799040 m!740391))

(declare-fun m!740395 () Bool)

(assert (=> b!799040 m!740395))

(assert (=> b!799037 m!740391))

(assert (=> b!799037 m!740391))

(declare-fun m!740397 () Bool)

(assert (=> b!799037 m!740397))

(check-sat (not b!799039) (not b!799041) (not b!799040) (not b!799038) (not b!799034) (not start!68736) (not b!799037) (not b!799044) (not b!799042))
(check-sat)
