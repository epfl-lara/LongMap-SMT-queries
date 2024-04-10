; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68608 () Bool)

(assert start!68608)

(declare-fun b!798317 () Bool)

(declare-fun res!542836 () Bool)

(declare-fun e!442836 () Bool)

(assert (=> b!798317 (=> (not res!542836) (not e!442836))))

(declare-datatypes ((array!43398 0))(
  ( (array!43399 (arr!20779 (Array (_ BitVec 32) (_ BitVec 64))) (size!21200 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43398)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798317 (= res!542836 (validKeyInArray!0 (select (arr!20779 a!3170) j!153)))))

(declare-fun b!798318 () Bool)

(declare-fun e!442835 () Bool)

(declare-fun e!442834 () Bool)

(assert (=> b!798318 (= e!442835 e!442834)))

(declare-fun res!542846 () Bool)

(assert (=> b!798318 (=> (not res!542846) (not e!442834))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8370 0))(
  ( (MissingZero!8370 (index!35848 (_ BitVec 32))) (Found!8370 (index!35849 (_ BitVec 32))) (Intermediate!8370 (undefined!9182 Bool) (index!35850 (_ BitVec 32)) (x!66736 (_ BitVec 32))) (Undefined!8370) (MissingVacant!8370 (index!35851 (_ BitVec 32))) )
))
(declare-fun lt!356345 () SeekEntryResult!8370)

(declare-fun lt!356340 () SeekEntryResult!8370)

(assert (=> b!798318 (= res!542846 (and (= lt!356345 lt!356340) (= lt!356340 (Found!8370 j!153)) (= (select (arr!20779 a!3170) index!1236) (select (arr!20779 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43398 (_ BitVec 32)) SeekEntryResult!8370)

(assert (=> b!798318 (= lt!356340 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20779 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43398 (_ BitVec 32)) SeekEntryResult!8370)

(assert (=> b!798318 (= lt!356345 (seekEntryOrOpen!0 (select (arr!20779 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798319 () Bool)

(declare-fun res!542840 () Bool)

(declare-fun e!442837 () Bool)

(assert (=> b!798319 (=> (not res!542840) (not e!442837))))

(declare-datatypes ((List!14742 0))(
  ( (Nil!14739) (Cons!14738 (h!15867 (_ BitVec 64)) (t!21057 List!14742)) )
))
(declare-fun arrayNoDuplicates!0 (array!43398 (_ BitVec 32) List!14742) Bool)

(assert (=> b!798319 (= res!542840 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14739))))

(declare-fun b!798320 () Bool)

(declare-fun res!542844 () Bool)

(assert (=> b!798320 (=> (not res!542844) (not e!442836))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798320 (= res!542844 (validKeyInArray!0 k0!2044))))

(declare-fun b!798321 () Bool)

(assert (=> b!798321 (= e!442837 e!442835)))

(declare-fun res!542838 () Bool)

(assert (=> b!798321 (=> (not res!542838) (not e!442835))))

(declare-fun lt!356341 () SeekEntryResult!8370)

(declare-fun lt!356342 () SeekEntryResult!8370)

(assert (=> b!798321 (= res!542838 (= lt!356341 lt!356342))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356344 () (_ BitVec 64))

(declare-fun lt!356343 () array!43398)

(assert (=> b!798321 (= lt!356342 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356344 lt!356343 mask!3266))))

(assert (=> b!798321 (= lt!356341 (seekEntryOrOpen!0 lt!356344 lt!356343 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798321 (= lt!356344 (select (store (arr!20779 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798321 (= lt!356343 (array!43399 (store (arr!20779 a!3170) i!1163 k0!2044) (size!21200 a!3170)))))

(declare-fun b!798322 () Bool)

(declare-fun res!542837 () Bool)

(assert (=> b!798322 (=> (not res!542837) (not e!442837))))

(assert (=> b!798322 (= res!542837 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21200 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20779 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21200 a!3170)) (= (select (arr!20779 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798323 () Bool)

(assert (=> b!798323 (= e!442836 e!442837)))

(declare-fun res!542845 () Bool)

(assert (=> b!798323 (=> (not res!542845) (not e!442837))))

(declare-fun lt!356339 () SeekEntryResult!8370)

(assert (=> b!798323 (= res!542845 (or (= lt!356339 (MissingZero!8370 i!1163)) (= lt!356339 (MissingVacant!8370 i!1163))))))

(assert (=> b!798323 (= lt!356339 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798324 () Bool)

(declare-fun res!542843 () Bool)

(assert (=> b!798324 (=> (not res!542843) (not e!442836))))

(assert (=> b!798324 (= res!542843 (and (= (size!21200 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21200 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21200 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!542841 () Bool)

(assert (=> start!68608 (=> (not res!542841) (not e!442836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68608 (= res!542841 (validMask!0 mask!3266))))

(assert (=> start!68608 e!442836))

(assert (=> start!68608 true))

(declare-fun array_inv!16575 (array!43398) Bool)

(assert (=> start!68608 (array_inv!16575 a!3170)))

(declare-fun b!798325 () Bool)

(assert (=> b!798325 (= e!442834 (not true))))

(assert (=> b!798325 (= lt!356342 (Found!8370 index!1236))))

(declare-fun b!798326 () Bool)

(declare-fun res!542839 () Bool)

(assert (=> b!798326 (=> (not res!542839) (not e!442836))))

(declare-fun arrayContainsKey!0 (array!43398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798326 (= res!542839 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798327 () Bool)

(declare-fun res!542842 () Bool)

(assert (=> b!798327 (=> (not res!542842) (not e!442837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43398 (_ BitVec 32)) Bool)

(assert (=> b!798327 (= res!542842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68608 res!542841) b!798324))

(assert (= (and b!798324 res!542843) b!798317))

(assert (= (and b!798317 res!542836) b!798320))

(assert (= (and b!798320 res!542844) b!798326))

(assert (= (and b!798326 res!542839) b!798323))

(assert (= (and b!798323 res!542845) b!798327))

(assert (= (and b!798327 res!542842) b!798319))

(assert (= (and b!798319 res!542840) b!798322))

(assert (= (and b!798322 res!542837) b!798321))

(assert (= (and b!798321 res!542838) b!798318))

(assert (= (and b!798318 res!542846) b!798325))

(declare-fun m!739211 () Bool)

(assert (=> b!798323 m!739211))

(declare-fun m!739213 () Bool)

(assert (=> b!798319 m!739213))

(declare-fun m!739215 () Bool)

(assert (=> b!798321 m!739215))

(declare-fun m!739217 () Bool)

(assert (=> b!798321 m!739217))

(declare-fun m!739219 () Bool)

(assert (=> b!798321 m!739219))

(declare-fun m!739221 () Bool)

(assert (=> b!798321 m!739221))

(declare-fun m!739223 () Bool)

(assert (=> start!68608 m!739223))

(declare-fun m!739225 () Bool)

(assert (=> start!68608 m!739225))

(declare-fun m!739227 () Bool)

(assert (=> b!798326 m!739227))

(declare-fun m!739229 () Bool)

(assert (=> b!798322 m!739229))

(declare-fun m!739231 () Bool)

(assert (=> b!798322 m!739231))

(declare-fun m!739233 () Bool)

(assert (=> b!798318 m!739233))

(declare-fun m!739235 () Bool)

(assert (=> b!798318 m!739235))

(assert (=> b!798318 m!739235))

(declare-fun m!739237 () Bool)

(assert (=> b!798318 m!739237))

(assert (=> b!798318 m!739235))

(declare-fun m!739239 () Bool)

(assert (=> b!798318 m!739239))

(declare-fun m!739241 () Bool)

(assert (=> b!798327 m!739241))

(assert (=> b!798317 m!739235))

(assert (=> b!798317 m!739235))

(declare-fun m!739243 () Bool)

(assert (=> b!798317 m!739243))

(declare-fun m!739245 () Bool)

(assert (=> b!798320 m!739245))

(check-sat (not b!798319) (not b!798320) (not b!798326) (not b!798323) (not b!798321) (not start!68608) (not b!798317) (not b!798318) (not b!798327))
(check-sat)
