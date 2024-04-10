; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69406 () Bool)

(assert start!69406)

(declare-fun res!553011 () Bool)

(declare-fun e!447975 () Bool)

(assert (=> start!69406 (=> (not res!553011) (not e!447975))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69406 (= res!553011 (validMask!0 mask!3266))))

(assert (=> start!69406 e!447975))

(assert (=> start!69406 true))

(declare-datatypes ((array!44004 0))(
  ( (array!44005 (arr!21076 (Array (_ BitVec 32) (_ BitVec 64))) (size!21497 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44004)

(declare-fun array_inv!16872 (array!44004) Bool)

(assert (=> start!69406 (array_inv!16872 a!3170)))

(declare-fun b!809279 () Bool)

(declare-fun e!447976 () Bool)

(declare-fun e!447973 () Bool)

(assert (=> b!809279 (= e!447976 e!447973)))

(declare-fun res!553009 () Bool)

(assert (=> b!809279 (=> (not res!553009) (not e!447973))))

(declare-fun lt!362660 () array!44004)

(declare-fun lt!362658 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8667 0))(
  ( (MissingZero!8667 (index!37036 (_ BitVec 32))) (Found!8667 (index!37037 (_ BitVec 32))) (Intermediate!8667 (undefined!9479 Bool) (index!37038 (_ BitVec 32)) (x!67843 (_ BitVec 32))) (Undefined!8667) (MissingVacant!8667 (index!37039 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44004 (_ BitVec 32)) SeekEntryResult!8667)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44004 (_ BitVec 32)) SeekEntryResult!8667)

(assert (=> b!809279 (= res!553009 (= (seekEntryOrOpen!0 lt!362658 lt!362660 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362658 lt!362660 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809279 (= lt!362658 (select (store (arr!21076 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809279 (= lt!362660 (array!44005 (store (arr!21076 a!3170) i!1163 k0!2044) (size!21497 a!3170)))))

(declare-fun b!809280 () Bool)

(declare-fun e!447977 () Bool)

(assert (=> b!809280 (= e!447977 false)))

(declare-fun lt!362659 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809280 (= lt!362659 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809281 () Bool)

(declare-fun res!553016 () Bool)

(assert (=> b!809281 (=> (not res!553016) (not e!447976))))

(declare-datatypes ((List!15039 0))(
  ( (Nil!15036) (Cons!15035 (h!16164 (_ BitVec 64)) (t!21354 List!15039)) )
))
(declare-fun arrayNoDuplicates!0 (array!44004 (_ BitVec 32) List!15039) Bool)

(assert (=> b!809281 (= res!553016 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15036))))

(declare-fun b!809282 () Bool)

(assert (=> b!809282 (= e!447975 e!447976)))

(declare-fun res!553013 () Bool)

(assert (=> b!809282 (=> (not res!553013) (not e!447976))))

(declare-fun lt!362663 () SeekEntryResult!8667)

(assert (=> b!809282 (= res!553013 (or (= lt!362663 (MissingZero!8667 i!1163)) (= lt!362663 (MissingVacant!8667 i!1163))))))

(assert (=> b!809282 (= lt!362663 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809283 () Bool)

(declare-fun res!553014 () Bool)

(assert (=> b!809283 (=> (not res!553014) (not e!447976))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809283 (= res!553014 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21497 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21076 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21497 a!3170)) (= (select (arr!21076 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809284 () Bool)

(declare-fun res!553008 () Bool)

(assert (=> b!809284 (=> (not res!553008) (not e!447975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809284 (= res!553008 (validKeyInArray!0 (select (arr!21076 a!3170) j!153)))))

(declare-fun b!809285 () Bool)

(declare-fun res!553007 () Bool)

(assert (=> b!809285 (=> (not res!553007) (not e!447975))))

(assert (=> b!809285 (= res!553007 (validKeyInArray!0 k0!2044))))

(declare-fun b!809286 () Bool)

(assert (=> b!809286 (= e!447973 e!447977)))

(declare-fun res!553006 () Bool)

(assert (=> b!809286 (=> (not res!553006) (not e!447977))))

(declare-fun lt!362662 () SeekEntryResult!8667)

(declare-fun lt!362661 () SeekEntryResult!8667)

(assert (=> b!809286 (= res!553006 (and (= lt!362661 lt!362662) (= lt!362662 (Found!8667 j!153)) (not (= (select (arr!21076 a!3170) index!1236) (select (arr!21076 a!3170) j!153)))))))

(assert (=> b!809286 (= lt!362662 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21076 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809286 (= lt!362661 (seekEntryOrOpen!0 (select (arr!21076 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809287 () Bool)

(declare-fun res!553015 () Bool)

(assert (=> b!809287 (=> (not res!553015) (not e!447975))))

(assert (=> b!809287 (= res!553015 (and (= (size!21497 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21497 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21497 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809288 () Bool)

(declare-fun res!553010 () Bool)

(assert (=> b!809288 (=> (not res!553010) (not e!447975))))

(declare-fun arrayContainsKey!0 (array!44004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809288 (= res!553010 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809289 () Bool)

(declare-fun res!553012 () Bool)

(assert (=> b!809289 (=> (not res!553012) (not e!447976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44004 (_ BitVec 32)) Bool)

(assert (=> b!809289 (= res!553012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69406 res!553011) b!809287))

(assert (= (and b!809287 res!553015) b!809284))

(assert (= (and b!809284 res!553008) b!809285))

(assert (= (and b!809285 res!553007) b!809288))

(assert (= (and b!809288 res!553010) b!809282))

(assert (= (and b!809282 res!553013) b!809289))

(assert (= (and b!809289 res!553012) b!809281))

(assert (= (and b!809281 res!553016) b!809283))

(assert (= (and b!809283 res!553014) b!809279))

(assert (= (and b!809279 res!553009) b!809286))

(assert (= (and b!809286 res!553006) b!809280))

(declare-fun m!751447 () Bool)

(assert (=> b!809286 m!751447))

(declare-fun m!751449 () Bool)

(assert (=> b!809286 m!751449))

(assert (=> b!809286 m!751449))

(declare-fun m!751451 () Bool)

(assert (=> b!809286 m!751451))

(assert (=> b!809286 m!751449))

(declare-fun m!751453 () Bool)

(assert (=> b!809286 m!751453))

(declare-fun m!751455 () Bool)

(assert (=> b!809281 m!751455))

(declare-fun m!751457 () Bool)

(assert (=> b!809288 m!751457))

(declare-fun m!751459 () Bool)

(assert (=> b!809282 m!751459))

(declare-fun m!751461 () Bool)

(assert (=> b!809283 m!751461))

(declare-fun m!751463 () Bool)

(assert (=> b!809283 m!751463))

(declare-fun m!751465 () Bool)

(assert (=> b!809279 m!751465))

(declare-fun m!751467 () Bool)

(assert (=> b!809279 m!751467))

(declare-fun m!751469 () Bool)

(assert (=> b!809279 m!751469))

(declare-fun m!751471 () Bool)

(assert (=> b!809279 m!751471))

(declare-fun m!751473 () Bool)

(assert (=> start!69406 m!751473))

(declare-fun m!751475 () Bool)

(assert (=> start!69406 m!751475))

(declare-fun m!751477 () Bool)

(assert (=> b!809280 m!751477))

(declare-fun m!751479 () Bool)

(assert (=> b!809285 m!751479))

(declare-fun m!751481 () Bool)

(assert (=> b!809289 m!751481))

(assert (=> b!809284 m!751449))

(assert (=> b!809284 m!751449))

(declare-fun m!751483 () Bool)

(assert (=> b!809284 m!751483))

(check-sat (not b!809286) (not b!809289) (not start!69406) (not b!809281) (not b!809285) (not b!809288) (not b!809279) (not b!809280) (not b!809282) (not b!809284))
(check-sat)
