; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68760 () Bool)

(assert start!68760)

(declare-fun b!801287 () Bool)

(declare-fun res!545948 () Bool)

(declare-fun e!444146 () Bool)

(assert (=> b!801287 (=> (not res!545948) (not e!444146))))

(declare-datatypes ((array!43567 0))(
  ( (array!43568 (arr!20864 (Array (_ BitVec 32) (_ BitVec 64))) (size!21285 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43567)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801287 (= res!545948 (validKeyInArray!0 (select (arr!20864 a!3170) j!153)))))

(declare-fun b!801288 () Bool)

(declare-fun e!444144 () Bool)

(declare-fun e!444143 () Bool)

(assert (=> b!801288 (= e!444144 e!444143)))

(declare-fun res!545950 () Bool)

(assert (=> b!801288 (=> (not res!545950) (not e!444143))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358045 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8452 0))(
  ( (MissingZero!8452 (index!36176 (_ BitVec 32))) (Found!8452 (index!36177 (_ BitVec 32))) (Intermediate!8452 (undefined!9264 Bool) (index!36178 (_ BitVec 32)) (x!67045 (_ BitVec 32))) (Undefined!8452) (MissingVacant!8452 (index!36179 (_ BitVec 32))) )
))
(declare-fun lt!358043 () SeekEntryResult!8452)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358046 () array!43567)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43567 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!801288 (= res!545950 (= lt!358043 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358045 lt!358046 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43567 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!801288 (= lt!358043 (seekEntryOrOpen!0 lt!358045 lt!358046 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!801288 (= lt!358045 (select (store (arr!20864 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801288 (= lt!358046 (array!43568 (store (arr!20864 a!3170) i!1163 k0!2044) (size!21285 a!3170)))))

(declare-fun res!545953 () Bool)

(assert (=> start!68760 (=> (not res!545953) (not e!444146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68760 (= res!545953 (validMask!0 mask!3266))))

(assert (=> start!68760 e!444146))

(assert (=> start!68760 true))

(declare-fun array_inv!16747 (array!43567) Bool)

(assert (=> start!68760 (array_inv!16747 a!3170)))

(declare-fun b!801289 () Bool)

(declare-fun e!444145 () Bool)

(assert (=> b!801289 (= e!444143 e!444145)))

(declare-fun res!545947 () Bool)

(assert (=> b!801289 (=> (not res!545947) (not e!444145))))

(declare-fun lt!358049 () SeekEntryResult!8452)

(declare-fun lt!358044 () SeekEntryResult!8452)

(assert (=> b!801289 (= res!545947 (and (= lt!358049 lt!358044) (= lt!358044 (Found!8452 j!153)) (not (= (select (arr!20864 a!3170) index!1236) (select (arr!20864 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801289 (= lt!358044 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801289 (= lt!358049 (seekEntryOrOpen!0 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801290 () Bool)

(declare-fun res!545957 () Bool)

(assert (=> b!801290 (=> (not res!545957) (not e!444146))))

(assert (=> b!801290 (= res!545957 (validKeyInArray!0 k0!2044))))

(declare-fun b!801291 () Bool)

(declare-fun res!545954 () Bool)

(assert (=> b!801291 (=> (not res!545954) (not e!444146))))

(assert (=> b!801291 (= res!545954 (and (= (size!21285 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21285 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21285 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801292 () Bool)

(declare-fun e!444148 () Bool)

(assert (=> b!801292 (= e!444148 false)))

(declare-fun lt!358042 () SeekEntryResult!8452)

(declare-fun lt!358047 () (_ BitVec 32))

(assert (=> b!801292 (= lt!358042 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358047 vacantBefore!23 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801293 () Bool)

(assert (=> b!801293 (= e!444145 e!444148)))

(declare-fun res!545958 () Bool)

(assert (=> b!801293 (=> (not res!545958) (not e!444148))))

(assert (=> b!801293 (= res!545958 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358047 #b00000000000000000000000000000000) (bvslt lt!358047 (size!21285 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801293 (= lt!358047 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801294 () Bool)

(declare-fun res!545949 () Bool)

(assert (=> b!801294 (=> (not res!545949) (not e!444144))))

(declare-datatypes ((List!14866 0))(
  ( (Nil!14863) (Cons!14862 (h!15991 (_ BitVec 64)) (t!21172 List!14866)) )
))
(declare-fun arrayNoDuplicates!0 (array!43567 (_ BitVec 32) List!14866) Bool)

(assert (=> b!801294 (= res!545949 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14863))))

(declare-fun b!801295 () Bool)

(declare-fun res!545956 () Bool)

(assert (=> b!801295 (=> (not res!545956) (not e!444148))))

(assert (=> b!801295 (= res!545956 (= lt!358043 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358047 vacantAfter!23 lt!358045 lt!358046 mask!3266)))))

(declare-fun b!801296 () Bool)

(declare-fun res!545946 () Bool)

(assert (=> b!801296 (=> (not res!545946) (not e!444144))))

(assert (=> b!801296 (= res!545946 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21285 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20864 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21285 a!3170)) (= (select (arr!20864 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801297 () Bool)

(assert (=> b!801297 (= e!444146 e!444144)))

(declare-fun res!545951 () Bool)

(assert (=> b!801297 (=> (not res!545951) (not e!444144))))

(declare-fun lt!358048 () SeekEntryResult!8452)

(assert (=> b!801297 (= res!545951 (or (= lt!358048 (MissingZero!8452 i!1163)) (= lt!358048 (MissingVacant!8452 i!1163))))))

(assert (=> b!801297 (= lt!358048 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801298 () Bool)

(declare-fun res!545955 () Bool)

(assert (=> b!801298 (=> (not res!545955) (not e!444144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43567 (_ BitVec 32)) Bool)

(assert (=> b!801298 (= res!545955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801299 () Bool)

(declare-fun res!545952 () Bool)

(assert (=> b!801299 (=> (not res!545952) (not e!444146))))

(declare-fun arrayContainsKey!0 (array!43567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801299 (= res!545952 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68760 res!545953) b!801291))

(assert (= (and b!801291 res!545954) b!801287))

(assert (= (and b!801287 res!545948) b!801290))

(assert (= (and b!801290 res!545957) b!801299))

(assert (= (and b!801299 res!545952) b!801297))

(assert (= (and b!801297 res!545951) b!801298))

(assert (= (and b!801298 res!545955) b!801294))

(assert (= (and b!801294 res!545949) b!801296))

(assert (= (and b!801296 res!545946) b!801288))

(assert (= (and b!801288 res!545950) b!801289))

(assert (= (and b!801289 res!545947) b!801293))

(assert (= (and b!801293 res!545958) b!801295))

(assert (= (and b!801295 res!545956) b!801292))

(declare-fun m!741967 () Bool)

(assert (=> b!801298 m!741967))

(declare-fun m!741969 () Bool)

(assert (=> b!801292 m!741969))

(assert (=> b!801292 m!741969))

(declare-fun m!741971 () Bool)

(assert (=> b!801292 m!741971))

(declare-fun m!741973 () Bool)

(assert (=> b!801289 m!741973))

(assert (=> b!801289 m!741969))

(assert (=> b!801289 m!741969))

(declare-fun m!741975 () Bool)

(assert (=> b!801289 m!741975))

(assert (=> b!801289 m!741969))

(declare-fun m!741977 () Bool)

(assert (=> b!801289 m!741977))

(declare-fun m!741979 () Bool)

(assert (=> b!801297 m!741979))

(declare-fun m!741981 () Bool)

(assert (=> b!801299 m!741981))

(declare-fun m!741983 () Bool)

(assert (=> b!801294 m!741983))

(declare-fun m!741985 () Bool)

(assert (=> b!801288 m!741985))

(declare-fun m!741987 () Bool)

(assert (=> b!801288 m!741987))

(declare-fun m!741989 () Bool)

(assert (=> b!801288 m!741989))

(declare-fun m!741991 () Bool)

(assert (=> b!801288 m!741991))

(declare-fun m!741993 () Bool)

(assert (=> start!68760 m!741993))

(declare-fun m!741995 () Bool)

(assert (=> start!68760 m!741995))

(declare-fun m!741997 () Bool)

(assert (=> b!801293 m!741997))

(assert (=> b!801287 m!741969))

(assert (=> b!801287 m!741969))

(declare-fun m!741999 () Bool)

(assert (=> b!801287 m!741999))

(declare-fun m!742001 () Bool)

(assert (=> b!801295 m!742001))

(declare-fun m!742003 () Bool)

(assert (=> b!801296 m!742003))

(declare-fun m!742005 () Bool)

(assert (=> b!801296 m!742005))

(declare-fun m!742007 () Bool)

(assert (=> b!801290 m!742007))

(check-sat (not b!801293) (not b!801289) (not b!801294) (not b!801299) (not b!801292) (not b!801288) (not b!801298) (not b!801287) (not b!801295) (not b!801290) (not start!68760) (not b!801297))
(check-sat)
