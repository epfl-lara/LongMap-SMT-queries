; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69404 () Bool)

(assert start!69404)

(declare-fun b!809246 () Bool)

(declare-fun res!552974 () Bool)

(declare-fun e!447961 () Bool)

(assert (=> b!809246 (=> (not res!552974) (not e!447961))))

(declare-datatypes ((array!44002 0))(
  ( (array!44003 (arr!21075 (Array (_ BitVec 32) (_ BitVec 64))) (size!21496 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44002)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809246 (= res!552974 (validKeyInArray!0 (select (arr!21075 a!3170) j!153)))))

(declare-fun b!809247 () Bool)

(declare-fun e!447958 () Bool)

(assert (=> b!809247 (= e!447958 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362640 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809247 (= lt!362640 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809248 () Bool)

(declare-fun e!447959 () Bool)

(declare-fun e!447962 () Bool)

(assert (=> b!809248 (= e!447959 e!447962)))

(declare-fun res!552978 () Bool)

(assert (=> b!809248 (=> (not res!552978) (not e!447962))))

(declare-fun lt!362642 () array!44002)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362641 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8666 0))(
  ( (MissingZero!8666 (index!37032 (_ BitVec 32))) (Found!8666 (index!37033 (_ BitVec 32))) (Intermediate!8666 (undefined!9478 Bool) (index!37034 (_ BitVec 32)) (x!67842 (_ BitVec 32))) (Undefined!8666) (MissingVacant!8666 (index!37035 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44002 (_ BitVec 32)) SeekEntryResult!8666)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44002 (_ BitVec 32)) SeekEntryResult!8666)

(assert (=> b!809248 (= res!552978 (= (seekEntryOrOpen!0 lt!362641 lt!362642 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362641 lt!362642 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809248 (= lt!362641 (select (store (arr!21075 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809248 (= lt!362642 (array!44003 (store (arr!21075 a!3170) i!1163 k!2044) (size!21496 a!3170)))))

(declare-fun b!809249 () Bool)

(declare-fun res!552981 () Bool)

(assert (=> b!809249 (=> (not res!552981) (not e!447959))))

(declare-datatypes ((List!15038 0))(
  ( (Nil!15035) (Cons!15034 (h!16163 (_ BitVec 64)) (t!21353 List!15038)) )
))
(declare-fun arrayNoDuplicates!0 (array!44002 (_ BitVec 32) List!15038) Bool)

(assert (=> b!809249 (= res!552981 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15035))))

(declare-fun res!552977 () Bool)

(assert (=> start!69404 (=> (not res!552977) (not e!447961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69404 (= res!552977 (validMask!0 mask!3266))))

(assert (=> start!69404 e!447961))

(assert (=> start!69404 true))

(declare-fun array_inv!16871 (array!44002) Bool)

(assert (=> start!69404 (array_inv!16871 a!3170)))

(declare-fun b!809250 () Bool)

(declare-fun res!552982 () Bool)

(assert (=> b!809250 (=> (not res!552982) (not e!447961))))

(declare-fun arrayContainsKey!0 (array!44002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809250 (= res!552982 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809251 () Bool)

(assert (=> b!809251 (= e!447962 e!447958)))

(declare-fun res!552975 () Bool)

(assert (=> b!809251 (=> (not res!552975) (not e!447958))))

(declare-fun lt!362643 () SeekEntryResult!8666)

(declare-fun lt!362644 () SeekEntryResult!8666)

(assert (=> b!809251 (= res!552975 (and (= lt!362643 lt!362644) (= lt!362644 (Found!8666 j!153)) (not (= (select (arr!21075 a!3170) index!1236) (select (arr!21075 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809251 (= lt!362644 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21075 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809251 (= lt!362643 (seekEntryOrOpen!0 (select (arr!21075 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809252 () Bool)

(assert (=> b!809252 (= e!447961 e!447959)))

(declare-fun res!552973 () Bool)

(assert (=> b!809252 (=> (not res!552973) (not e!447959))))

(declare-fun lt!362645 () SeekEntryResult!8666)

(assert (=> b!809252 (= res!552973 (or (= lt!362645 (MissingZero!8666 i!1163)) (= lt!362645 (MissingVacant!8666 i!1163))))))

(assert (=> b!809252 (= lt!362645 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809253 () Bool)

(declare-fun res!552980 () Bool)

(assert (=> b!809253 (=> (not res!552980) (not e!447961))))

(assert (=> b!809253 (= res!552980 (validKeyInArray!0 k!2044))))

(declare-fun b!809254 () Bool)

(declare-fun res!552983 () Bool)

(assert (=> b!809254 (=> (not res!552983) (not e!447959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44002 (_ BitVec 32)) Bool)

(assert (=> b!809254 (= res!552983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809255 () Bool)

(declare-fun res!552976 () Bool)

(assert (=> b!809255 (=> (not res!552976) (not e!447961))))

(assert (=> b!809255 (= res!552976 (and (= (size!21496 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21496 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21496 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809256 () Bool)

(declare-fun res!552979 () Bool)

(assert (=> b!809256 (=> (not res!552979) (not e!447959))))

(assert (=> b!809256 (= res!552979 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21496 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21075 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21496 a!3170)) (= (select (arr!21075 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69404 res!552977) b!809255))

(assert (= (and b!809255 res!552976) b!809246))

(assert (= (and b!809246 res!552974) b!809253))

(assert (= (and b!809253 res!552980) b!809250))

(assert (= (and b!809250 res!552982) b!809252))

(assert (= (and b!809252 res!552973) b!809254))

(assert (= (and b!809254 res!552983) b!809249))

(assert (= (and b!809249 res!552981) b!809256))

(assert (= (and b!809256 res!552979) b!809248))

(assert (= (and b!809248 res!552978) b!809251))

(assert (= (and b!809251 res!552975) b!809247))

(declare-fun m!751409 () Bool)

(assert (=> b!809247 m!751409))

(declare-fun m!751411 () Bool)

(assert (=> b!809250 m!751411))

(declare-fun m!751413 () Bool)

(assert (=> b!809248 m!751413))

(declare-fun m!751415 () Bool)

(assert (=> b!809248 m!751415))

(declare-fun m!751417 () Bool)

(assert (=> b!809248 m!751417))

(declare-fun m!751419 () Bool)

(assert (=> b!809248 m!751419))

(declare-fun m!751421 () Bool)

(assert (=> b!809251 m!751421))

(declare-fun m!751423 () Bool)

(assert (=> b!809251 m!751423))

(assert (=> b!809251 m!751423))

(declare-fun m!751425 () Bool)

(assert (=> b!809251 m!751425))

(assert (=> b!809251 m!751423))

(declare-fun m!751427 () Bool)

(assert (=> b!809251 m!751427))

(declare-fun m!751429 () Bool)

(assert (=> b!809252 m!751429))

(declare-fun m!751431 () Bool)

(assert (=> b!809253 m!751431))

(declare-fun m!751433 () Bool)

(assert (=> b!809249 m!751433))

(declare-fun m!751435 () Bool)

(assert (=> start!69404 m!751435))

(declare-fun m!751437 () Bool)

(assert (=> start!69404 m!751437))

(assert (=> b!809246 m!751423))

(assert (=> b!809246 m!751423))

(declare-fun m!751439 () Bool)

(assert (=> b!809246 m!751439))

(declare-fun m!751441 () Bool)

(assert (=> b!809256 m!751441))

(declare-fun m!751443 () Bool)

(assert (=> b!809256 m!751443))

(declare-fun m!751445 () Bool)

(assert (=> b!809254 m!751445))

(push 1)

