; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68712 () Bool)

(assert start!68712)

(declare-fun b!800211 () Bool)

(declare-fun res!544739 () Bool)

(declare-fun e!443689 () Bool)

(assert (=> b!800211 (=> (not res!544739) (not e!443689))))

(declare-datatypes ((array!43502 0))(
  ( (array!43503 (arr!20831 (Array (_ BitVec 32) (_ BitVec 64))) (size!21252 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43502)

(declare-datatypes ((List!14794 0))(
  ( (Nil!14791) (Cons!14790 (h!15919 (_ BitVec 64)) (t!21109 List!14794)) )
))
(declare-fun arrayNoDuplicates!0 (array!43502 (_ BitVec 32) List!14794) Bool)

(assert (=> b!800211 (= res!544739 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14791))))

(declare-fun b!800212 () Bool)

(declare-fun e!443685 () Bool)

(assert (=> b!800212 (= e!443689 e!443685)))

(declare-fun res!544734 () Bool)

(assert (=> b!800212 (=> (not res!544734) (not e!443685))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8422 0))(
  ( (MissingZero!8422 (index!36056 (_ BitVec 32))) (Found!8422 (index!36057 (_ BitVec 32))) (Intermediate!8422 (undefined!9234 Bool) (index!36058 (_ BitVec 32)) (x!66924 (_ BitVec 32))) (Undefined!8422) (MissingVacant!8422 (index!36059 (_ BitVec 32))) )
))
(declare-fun lt!357468 () SeekEntryResult!8422)

(declare-fun lt!357469 () array!43502)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357470 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43502 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!800212 (= res!544734 (= lt!357468 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357470 lt!357469 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43502 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!800212 (= lt!357468 (seekEntryOrOpen!0 lt!357470 lt!357469 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800212 (= lt!357470 (select (store (arr!20831 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800212 (= lt!357469 (array!43503 (store (arr!20831 a!3170) i!1163 k!2044) (size!21252 a!3170)))))

(declare-fun b!800213 () Bool)

(declare-fun res!544733 () Bool)

(assert (=> b!800213 (=> (not res!544733) (not e!443689))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800213 (= res!544733 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21252 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20831 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21252 a!3170)) (= (select (arr!20831 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!544741 () Bool)

(declare-fun e!443688 () Bool)

(assert (=> start!68712 (=> (not res!544741) (not e!443688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68712 (= res!544741 (validMask!0 mask!3266))))

(assert (=> start!68712 e!443688))

(assert (=> start!68712 true))

(declare-fun array_inv!16627 (array!43502) Bool)

(assert (=> start!68712 (array_inv!16627 a!3170)))

(declare-fun b!800214 () Bool)

(declare-fun res!544740 () Bool)

(assert (=> b!800214 (=> (not res!544740) (not e!443688))))

(assert (=> b!800214 (= res!544740 (and (= (size!21252 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21252 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21252 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800215 () Bool)

(declare-fun res!544730 () Bool)

(assert (=> b!800215 (=> (not res!544730) (not e!443688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800215 (= res!544730 (validKeyInArray!0 k!2044))))

(declare-fun b!800216 () Bool)

(assert (=> b!800216 (= e!443688 e!443689)))

(declare-fun res!544732 () Bool)

(assert (=> b!800216 (=> (not res!544732) (not e!443689))))

(declare-fun lt!357472 () SeekEntryResult!8422)

(assert (=> b!800216 (= res!544732 (or (= lt!357472 (MissingZero!8422 i!1163)) (= lt!357472 (MissingVacant!8422 i!1163))))))

(assert (=> b!800216 (= lt!357472 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800217 () Bool)

(declare-fun res!544731 () Bool)

(declare-fun e!443690 () Bool)

(assert (=> b!800217 (=> (not res!544731) (not e!443690))))

(declare-fun lt!357473 () (_ BitVec 32))

(assert (=> b!800217 (= res!544731 (= lt!357468 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357473 vacantAfter!23 lt!357470 lt!357469 mask!3266)))))

(declare-fun b!800218 () Bool)

(assert (=> b!800218 (= e!443690 false)))

(declare-fun lt!357467 () SeekEntryResult!8422)

(assert (=> b!800218 (= lt!357467 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357473 vacantBefore!23 (select (arr!20831 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800219 () Bool)

(declare-fun e!443686 () Bool)

(assert (=> b!800219 (= e!443686 e!443690)))

(declare-fun res!544738 () Bool)

(assert (=> b!800219 (=> (not res!544738) (not e!443690))))

(assert (=> b!800219 (= res!544738 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357473 #b00000000000000000000000000000000) (bvslt lt!357473 (size!21252 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800219 (= lt!357473 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800220 () Bool)

(declare-fun res!544736 () Bool)

(assert (=> b!800220 (=> (not res!544736) (not e!443688))))

(assert (=> b!800220 (= res!544736 (validKeyInArray!0 (select (arr!20831 a!3170) j!153)))))

(declare-fun b!800221 () Bool)

(declare-fun res!544735 () Bool)

(assert (=> b!800221 (=> (not res!544735) (not e!443688))))

(declare-fun arrayContainsKey!0 (array!43502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800221 (= res!544735 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800222 () Bool)

(declare-fun res!544737 () Bool)

(assert (=> b!800222 (=> (not res!544737) (not e!443689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43502 (_ BitVec 32)) Bool)

(assert (=> b!800222 (= res!544737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800223 () Bool)

(assert (=> b!800223 (= e!443685 e!443686)))

(declare-fun res!544742 () Bool)

(assert (=> b!800223 (=> (not res!544742) (not e!443686))))

(declare-fun lt!357466 () SeekEntryResult!8422)

(declare-fun lt!357471 () SeekEntryResult!8422)

(assert (=> b!800223 (= res!544742 (and (= lt!357466 lt!357471) (= lt!357471 (Found!8422 j!153)) (not (= (select (arr!20831 a!3170) index!1236) (select (arr!20831 a!3170) j!153)))))))

(assert (=> b!800223 (= lt!357471 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20831 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800223 (= lt!357466 (seekEntryOrOpen!0 (select (arr!20831 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68712 res!544741) b!800214))

(assert (= (and b!800214 res!544740) b!800220))

(assert (= (and b!800220 res!544736) b!800215))

(assert (= (and b!800215 res!544730) b!800221))

(assert (= (and b!800221 res!544735) b!800216))

(assert (= (and b!800216 res!544732) b!800222))

(assert (= (and b!800222 res!544737) b!800211))

(assert (= (and b!800211 res!544739) b!800213))

(assert (= (and b!800213 res!544733) b!800212))

(assert (= (and b!800212 res!544734) b!800223))

(assert (= (and b!800223 res!544742) b!800219))

(assert (= (and b!800219 res!544738) b!800217))

(assert (= (and b!800217 res!544731) b!800218))

(declare-fun m!741281 () Bool)

(assert (=> start!68712 m!741281))

(declare-fun m!741283 () Bool)

(assert (=> start!68712 m!741283))

(declare-fun m!741285 () Bool)

(assert (=> b!800222 m!741285))

(declare-fun m!741287 () Bool)

(assert (=> b!800215 m!741287))

(declare-fun m!741289 () Bool)

(assert (=> b!800213 m!741289))

(declare-fun m!741291 () Bool)

(assert (=> b!800213 m!741291))

(declare-fun m!741293 () Bool)

(assert (=> b!800221 m!741293))

(declare-fun m!741295 () Bool)

(assert (=> b!800212 m!741295))

(declare-fun m!741297 () Bool)

(assert (=> b!800212 m!741297))

(declare-fun m!741299 () Bool)

(assert (=> b!800212 m!741299))

(declare-fun m!741301 () Bool)

(assert (=> b!800212 m!741301))

(declare-fun m!741303 () Bool)

(assert (=> b!800216 m!741303))

(declare-fun m!741305 () Bool)

(assert (=> b!800217 m!741305))

(declare-fun m!741307 () Bool)

(assert (=> b!800211 m!741307))

(declare-fun m!741309 () Bool)

(assert (=> b!800223 m!741309))

(declare-fun m!741311 () Bool)

(assert (=> b!800223 m!741311))

(assert (=> b!800223 m!741311))

(declare-fun m!741313 () Bool)

(assert (=> b!800223 m!741313))

(assert (=> b!800223 m!741311))

(declare-fun m!741315 () Bool)

(assert (=> b!800223 m!741315))

(assert (=> b!800220 m!741311))

(assert (=> b!800220 m!741311))

(declare-fun m!741317 () Bool)

(assert (=> b!800220 m!741317))

(declare-fun m!741319 () Bool)

(assert (=> b!800219 m!741319))

(assert (=> b!800218 m!741311))

(assert (=> b!800218 m!741311))

(declare-fun m!741321 () Bool)

(assert (=> b!800218 m!741321))

(push 1)

