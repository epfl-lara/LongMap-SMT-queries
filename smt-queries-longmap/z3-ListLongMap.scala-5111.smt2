; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69494 () Bool)

(assert start!69494)

(declare-fun b!809477 () Bool)

(declare-fun e!448191 () Bool)

(declare-fun e!448189 () Bool)

(assert (=> b!809477 (= e!448191 e!448189)))

(declare-fun res!552857 () Bool)

(assert (=> b!809477 (=> (not res!552857) (not e!448189))))

(declare-fun lt!362679 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43975 0))(
  ( (array!43976 (arr!21058 (Array (_ BitVec 32) (_ BitVec 64))) (size!21478 (_ BitVec 32))) )
))
(declare-fun lt!362678 () array!43975)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8605 0))(
  ( (MissingZero!8605 (index!36788 (_ BitVec 32))) (Found!8605 (index!36789 (_ BitVec 32))) (Intermediate!8605 (undefined!9417 Bool) (index!36790 (_ BitVec 32)) (x!67757 (_ BitVec 32))) (Undefined!8605) (MissingVacant!8605 (index!36791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43975 (_ BitVec 32)) SeekEntryResult!8605)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43975 (_ BitVec 32)) SeekEntryResult!8605)

(assert (=> b!809477 (= res!552857 (= (seekEntryOrOpen!0 lt!362679 lt!362678 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362679 lt!362678 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43975)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809477 (= lt!362679 (select (store (arr!21058 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809477 (= lt!362678 (array!43976 (store (arr!21058 a!3170) i!1163 k0!2044) (size!21478 a!3170)))))

(declare-fun b!809478 () Bool)

(declare-fun res!552856 () Bool)

(assert (=> b!809478 (=> (not res!552856) (not e!448191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43975 (_ BitVec 32)) Bool)

(assert (=> b!809478 (= res!552856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809479 () Bool)

(declare-fun e!448190 () Bool)

(assert (=> b!809479 (= e!448189 e!448190)))

(declare-fun res!552862 () Bool)

(assert (=> b!809479 (=> (not res!552862) (not e!448190))))

(declare-fun lt!362681 () SeekEntryResult!8605)

(declare-fun lt!362677 () SeekEntryResult!8605)

(assert (=> b!809479 (= res!552862 (and (= lt!362681 lt!362677) (= lt!362677 (Found!8605 j!153)) (not (= (select (arr!21058 a!3170) index!1236) (select (arr!21058 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809479 (= lt!362677 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21058 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809479 (= lt!362681 (seekEntryOrOpen!0 (select (arr!21058 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809480 () Bool)

(declare-fun res!552860 () Bool)

(declare-fun e!448192 () Bool)

(assert (=> b!809480 (=> (not res!552860) (not e!448192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809480 (= res!552860 (validKeyInArray!0 (select (arr!21058 a!3170) j!153)))))

(declare-fun b!809481 () Bool)

(assert (=> b!809481 (= e!448192 e!448191)))

(declare-fun res!552864 () Bool)

(assert (=> b!809481 (=> (not res!552864) (not e!448191))))

(declare-fun lt!362676 () SeekEntryResult!8605)

(assert (=> b!809481 (= res!552864 (or (= lt!362676 (MissingZero!8605 i!1163)) (= lt!362676 (MissingVacant!8605 i!1163))))))

(assert (=> b!809481 (= lt!362676 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809482 () Bool)

(assert (=> b!809482 (= e!448190 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000)))))

(declare-fun lt!362680 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809482 (= lt!362680 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!809483 () Bool)

(declare-fun res!552855 () Bool)

(assert (=> b!809483 (=> (not res!552855) (not e!448192))))

(declare-fun arrayContainsKey!0 (array!43975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809483 (= res!552855 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809484 () Bool)

(declare-fun res!552858 () Bool)

(assert (=> b!809484 (=> (not res!552858) (not e!448192))))

(assert (=> b!809484 (= res!552858 (and (= (size!21478 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21478 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21478 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!552863 () Bool)

(assert (=> start!69494 (=> (not res!552863) (not e!448192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69494 (= res!552863 (validMask!0 mask!3266))))

(assert (=> start!69494 e!448192))

(assert (=> start!69494 true))

(declare-fun array_inv!16917 (array!43975) Bool)

(assert (=> start!69494 (array_inv!16917 a!3170)))

(declare-fun b!809485 () Bool)

(declare-fun res!552859 () Bool)

(assert (=> b!809485 (=> (not res!552859) (not e!448191))))

(assert (=> b!809485 (= res!552859 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21478 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21058 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21478 a!3170)) (= (select (arr!21058 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809486 () Bool)

(declare-fun res!552854 () Bool)

(assert (=> b!809486 (=> (not res!552854) (not e!448191))))

(declare-datatypes ((List!14928 0))(
  ( (Nil!14925) (Cons!14924 (h!16059 (_ BitVec 64)) (t!21235 List!14928)) )
))
(declare-fun arrayNoDuplicates!0 (array!43975 (_ BitVec 32) List!14928) Bool)

(assert (=> b!809486 (= res!552854 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14925))))

(declare-fun b!809487 () Bool)

(declare-fun res!552861 () Bool)

(assert (=> b!809487 (=> (not res!552861) (not e!448192))))

(assert (=> b!809487 (= res!552861 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69494 res!552863) b!809484))

(assert (= (and b!809484 res!552858) b!809480))

(assert (= (and b!809480 res!552860) b!809487))

(assert (= (and b!809487 res!552861) b!809483))

(assert (= (and b!809483 res!552855) b!809481))

(assert (= (and b!809481 res!552864) b!809478))

(assert (= (and b!809478 res!552856) b!809486))

(assert (= (and b!809486 res!552854) b!809485))

(assert (= (and b!809485 res!552859) b!809477))

(assert (= (and b!809477 res!552857) b!809479))

(assert (= (and b!809479 res!552862) b!809482))

(declare-fun m!751987 () Bool)

(assert (=> b!809487 m!751987))

(declare-fun m!751989 () Bool)

(assert (=> b!809478 m!751989))

(declare-fun m!751991 () Bool)

(assert (=> b!809480 m!751991))

(assert (=> b!809480 m!751991))

(declare-fun m!751993 () Bool)

(assert (=> b!809480 m!751993))

(declare-fun m!751995 () Bool)

(assert (=> b!809483 m!751995))

(declare-fun m!751997 () Bool)

(assert (=> b!809482 m!751997))

(declare-fun m!751999 () Bool)

(assert (=> b!809481 m!751999))

(declare-fun m!752001 () Bool)

(assert (=> b!809479 m!752001))

(assert (=> b!809479 m!751991))

(assert (=> b!809479 m!751991))

(declare-fun m!752003 () Bool)

(assert (=> b!809479 m!752003))

(assert (=> b!809479 m!751991))

(declare-fun m!752005 () Bool)

(assert (=> b!809479 m!752005))

(declare-fun m!752007 () Bool)

(assert (=> b!809477 m!752007))

(declare-fun m!752009 () Bool)

(assert (=> b!809477 m!752009))

(declare-fun m!752011 () Bool)

(assert (=> b!809477 m!752011))

(declare-fun m!752013 () Bool)

(assert (=> b!809477 m!752013))

(declare-fun m!752015 () Bool)

(assert (=> b!809486 m!752015))

(declare-fun m!752017 () Bool)

(assert (=> b!809485 m!752017))

(declare-fun m!752019 () Bool)

(assert (=> b!809485 m!752019))

(declare-fun m!752021 () Bool)

(assert (=> start!69494 m!752021))

(declare-fun m!752023 () Bool)

(assert (=> start!69494 m!752023))

(check-sat (not b!809481) (not b!809479) (not b!809487) (not b!809478) (not b!809482) (not b!809486) (not b!809477) (not b!809483) (not b!809480) (not start!69494))
(check-sat)
