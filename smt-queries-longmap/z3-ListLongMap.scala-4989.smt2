; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68568 () Bool)

(assert start!68568)

(declare-fun b!796206 () Bool)

(declare-fun res!540358 () Bool)

(declare-fun e!441970 () Bool)

(assert (=> b!796206 (=> (not res!540358) (not e!441970))))

(declare-datatypes ((array!43232 0))(
  ( (array!43233 (arr!20692 (Array (_ BitVec 32) (_ BitVec 64))) (size!21112 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43232)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796206 (= res!540358 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796207 () Bool)

(declare-fun res!540354 () Bool)

(declare-fun e!441972 () Bool)

(assert (=> b!796207 (=> (not res!540354) (not e!441972))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796207 (= res!540354 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21112 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20692 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21112 a!3170)) (= (select (arr!20692 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796208 () Bool)

(declare-fun res!540355 () Bool)

(assert (=> b!796208 (=> (not res!540355) (not e!441972))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43232 (_ BitVec 32)) Bool)

(assert (=> b!796208 (= res!540355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796209 () Bool)

(declare-fun res!540357 () Bool)

(assert (=> b!796209 (=> (not res!540357) (not e!441970))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796209 (= res!540357 (and (= (size!21112 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21112 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21112 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!540356 () Bool)

(assert (=> start!68568 (=> (not res!540356) (not e!441970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68568 (= res!540356 (validMask!0 mask!3266))))

(assert (=> start!68568 e!441970))

(assert (=> start!68568 true))

(declare-fun array_inv!16551 (array!43232) Bool)

(assert (=> start!68568 (array_inv!16551 a!3170)))

(declare-fun b!796210 () Bool)

(declare-fun res!540351 () Bool)

(assert (=> b!796210 (=> (not res!540351) (not e!441970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796210 (= res!540351 (validKeyInArray!0 k0!2044))))

(declare-fun b!796211 () Bool)

(declare-fun res!540359 () Bool)

(assert (=> b!796211 (=> (not res!540359) (not e!441972))))

(declare-datatypes ((List!14562 0))(
  ( (Nil!14559) (Cons!14558 (h!15693 (_ BitVec 64)) (t!20869 List!14562)) )
))
(declare-fun arrayNoDuplicates!0 (array!43232 (_ BitVec 32) List!14562) Bool)

(assert (=> b!796211 (= res!540359 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14559))))

(declare-fun b!796212 () Bool)

(declare-fun e!441971 () Bool)

(assert (=> b!796212 (= e!441972 e!441971)))

(declare-fun res!540352 () Bool)

(assert (=> b!796212 (=> (not res!540352) (not e!441971))))

(declare-fun lt!354905 () array!43232)

(declare-fun lt!354907 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8239 0))(
  ( (MissingZero!8239 (index!35324 (_ BitVec 32))) (Found!8239 (index!35325 (_ BitVec 32))) (Intermediate!8239 (undefined!9051 Bool) (index!35326 (_ BitVec 32)) (x!66400 (_ BitVec 32))) (Undefined!8239) (MissingVacant!8239 (index!35327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43232 (_ BitVec 32)) SeekEntryResult!8239)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43232 (_ BitVec 32)) SeekEntryResult!8239)

(assert (=> b!796212 (= res!540352 (= (seekEntryOrOpen!0 lt!354907 lt!354905 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354907 lt!354905 mask!3266)))))

(assert (=> b!796212 (= lt!354907 (select (store (arr!20692 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796212 (= lt!354905 (array!43233 (store (arr!20692 a!3170) i!1163 k0!2044) (size!21112 a!3170)))))

(declare-fun b!796213 () Bool)

(declare-fun res!540360 () Bool)

(assert (=> b!796213 (=> (not res!540360) (not e!441970))))

(assert (=> b!796213 (= res!540360 (validKeyInArray!0 (select (arr!20692 a!3170) j!153)))))

(declare-fun b!796214 () Bool)

(declare-fun lt!354903 () SeekEntryResult!8239)

(declare-fun lt!354904 () SeekEntryResult!8239)

(assert (=> b!796214 (= e!441971 (and (= lt!354904 lt!354903) (= lt!354903 (Found!8239 j!153)) (= (select (arr!20692 a!3170) index!1236) (select (arr!20692 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!796214 (= lt!354903 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20692 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796214 (= lt!354904 (seekEntryOrOpen!0 (select (arr!20692 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796215 () Bool)

(assert (=> b!796215 (= e!441970 e!441972)))

(declare-fun res!540353 () Bool)

(assert (=> b!796215 (=> (not res!540353) (not e!441972))))

(declare-fun lt!354906 () SeekEntryResult!8239)

(assert (=> b!796215 (= res!540353 (or (= lt!354906 (MissingZero!8239 i!1163)) (= lt!354906 (MissingVacant!8239 i!1163))))))

(assert (=> b!796215 (= lt!354906 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68568 res!540356) b!796209))

(assert (= (and b!796209 res!540357) b!796213))

(assert (= (and b!796213 res!540360) b!796210))

(assert (= (and b!796210 res!540351) b!796206))

(assert (= (and b!796206 res!540358) b!796215))

(assert (= (and b!796215 res!540353) b!796208))

(assert (= (and b!796208 res!540355) b!796211))

(assert (= (and b!796211 res!540359) b!796207))

(assert (= (and b!796207 res!540354) b!796212))

(assert (= (and b!796212 res!540352) b!796214))

(declare-fun m!737291 () Bool)

(assert (=> b!796215 m!737291))

(declare-fun m!737293 () Bool)

(assert (=> b!796206 m!737293))

(declare-fun m!737295 () Bool)

(assert (=> b!796212 m!737295))

(declare-fun m!737297 () Bool)

(assert (=> b!796212 m!737297))

(declare-fun m!737299 () Bool)

(assert (=> b!796212 m!737299))

(declare-fun m!737301 () Bool)

(assert (=> b!796212 m!737301))

(declare-fun m!737303 () Bool)

(assert (=> b!796214 m!737303))

(declare-fun m!737305 () Bool)

(assert (=> b!796214 m!737305))

(assert (=> b!796214 m!737305))

(declare-fun m!737307 () Bool)

(assert (=> b!796214 m!737307))

(assert (=> b!796214 m!737305))

(declare-fun m!737309 () Bool)

(assert (=> b!796214 m!737309))

(declare-fun m!737311 () Bool)

(assert (=> b!796207 m!737311))

(declare-fun m!737313 () Bool)

(assert (=> b!796207 m!737313))

(declare-fun m!737315 () Bool)

(assert (=> start!68568 m!737315))

(declare-fun m!737317 () Bool)

(assert (=> start!68568 m!737317))

(declare-fun m!737319 () Bool)

(assert (=> b!796211 m!737319))

(assert (=> b!796213 m!737305))

(assert (=> b!796213 m!737305))

(declare-fun m!737321 () Bool)

(assert (=> b!796213 m!737321))

(declare-fun m!737323 () Bool)

(assert (=> b!796208 m!737323))

(declare-fun m!737325 () Bool)

(assert (=> b!796210 m!737325))

(check-sat (not b!796212) (not b!796211) (not b!796206) (not b!796213) (not b!796210) (not b!796208) (not b!796214) (not b!796215) (not start!68568))
(check-sat)
