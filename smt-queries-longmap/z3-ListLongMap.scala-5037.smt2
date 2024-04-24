; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68900 () Bool)

(assert start!68900)

(declare-fun b!801489 () Bool)

(declare-fun res!545463 () Bool)

(declare-fun e!444438 () Bool)

(assert (=> b!801489 (=> (not res!545463) (not e!444438))))

(declare-datatypes ((array!43522 0))(
  ( (array!43523 (arr!20836 (Array (_ BitVec 32) (_ BitVec 64))) (size!21256 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43522)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43522 (_ BitVec 32)) Bool)

(assert (=> b!801489 (= res!545463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!545461 () Bool)

(declare-fun e!444442 () Bool)

(assert (=> start!68900 (=> (not res!545461) (not e!444442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68900 (= res!545461 (validMask!0 mask!3266))))

(assert (=> start!68900 e!444442))

(assert (=> start!68900 true))

(declare-fun array_inv!16695 (array!43522) Bool)

(assert (=> start!68900 (array_inv!16695 a!3170)))

(declare-fun b!801490 () Bool)

(declare-fun res!545465 () Bool)

(declare-fun e!444441 () Bool)

(assert (=> b!801490 (=> (not res!545465) (not e!444441))))

(declare-fun lt!358063 () array!43522)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358064 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8383 0))(
  ( (MissingZero!8383 (index!35900 (_ BitVec 32))) (Found!8383 (index!35901 (_ BitVec 32))) (Intermediate!8383 (undefined!9195 Bool) (index!35902 (_ BitVec 32)) (x!66931 (_ BitVec 32))) (Undefined!8383) (MissingVacant!8383 (index!35903 (_ BitVec 32))) )
))
(declare-fun lt!358069 () SeekEntryResult!8383)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358066 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43522 (_ BitVec 32)) SeekEntryResult!8383)

(assert (=> b!801490 (= res!545465 (= lt!358069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358066 vacantAfter!23 lt!358064 lt!358063 mask!3266)))))

(declare-fun b!801491 () Bool)

(declare-fun res!545469 () Bool)

(assert (=> b!801491 (=> (not res!545469) (not e!444442))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801491 (= res!545469 (and (= (size!21256 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21256 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21256 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801492 () Bool)

(declare-fun res!545472 () Bool)

(assert (=> b!801492 (=> (not res!545472) (not e!444442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801492 (= res!545472 (validKeyInArray!0 (select (arr!20836 a!3170) j!153)))))

(declare-fun b!801493 () Bool)

(assert (=> b!801493 (= e!444441 false)))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358065 () SeekEntryResult!8383)

(assert (=> b!801493 (= lt!358065 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358066 vacantBefore!23 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801494 () Bool)

(declare-fun res!545466 () Bool)

(assert (=> b!801494 (=> (not res!545466) (not e!444442))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!801494 (= res!545466 (validKeyInArray!0 k0!2044))))

(declare-fun b!801495 () Bool)

(declare-fun res!545462 () Bool)

(assert (=> b!801495 (=> (not res!545462) (not e!444438))))

(declare-datatypes ((List!14706 0))(
  ( (Nil!14703) (Cons!14702 (h!15837 (_ BitVec 64)) (t!21013 List!14706)) )
))
(declare-fun arrayNoDuplicates!0 (array!43522 (_ BitVec 32) List!14706) Bool)

(assert (=> b!801495 (= res!545462 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14703))))

(declare-fun b!801496 () Bool)

(assert (=> b!801496 (= e!444442 e!444438)))

(declare-fun res!545467 () Bool)

(assert (=> b!801496 (=> (not res!545467) (not e!444438))))

(declare-fun lt!358068 () SeekEntryResult!8383)

(assert (=> b!801496 (= res!545467 (or (= lt!358068 (MissingZero!8383 i!1163)) (= lt!358068 (MissingVacant!8383 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43522 (_ BitVec 32)) SeekEntryResult!8383)

(assert (=> b!801496 (= lt!358068 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801497 () Bool)

(declare-fun res!545468 () Bool)

(assert (=> b!801497 (=> (not res!545468) (not e!444438))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801497 (= res!545468 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21256 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20836 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21256 a!3170)) (= (select (arr!20836 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801498 () Bool)

(declare-fun res!545470 () Bool)

(assert (=> b!801498 (=> (not res!545470) (not e!444442))))

(declare-fun arrayContainsKey!0 (array!43522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801498 (= res!545470 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801499 () Bool)

(declare-fun e!444440 () Bool)

(declare-fun e!444439 () Bool)

(assert (=> b!801499 (= e!444440 e!444439)))

(declare-fun res!545471 () Bool)

(assert (=> b!801499 (=> (not res!545471) (not e!444439))))

(declare-fun lt!358070 () SeekEntryResult!8383)

(declare-fun lt!358067 () SeekEntryResult!8383)

(assert (=> b!801499 (= res!545471 (and (= lt!358067 lt!358070) (= lt!358070 (Found!8383 j!153)) (not (= (select (arr!20836 a!3170) index!1236) (select (arr!20836 a!3170) j!153)))))))

(assert (=> b!801499 (= lt!358070 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801499 (= lt!358067 (seekEntryOrOpen!0 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801500 () Bool)

(assert (=> b!801500 (= e!444439 e!444441)))

(declare-fun res!545464 () Bool)

(assert (=> b!801500 (=> (not res!545464) (not e!444441))))

(assert (=> b!801500 (= res!545464 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358066 #b00000000000000000000000000000000) (bvslt lt!358066 (size!21256 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801500 (= lt!358066 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801501 () Bool)

(assert (=> b!801501 (= e!444438 e!444440)))

(declare-fun res!545460 () Bool)

(assert (=> b!801501 (=> (not res!545460) (not e!444440))))

(assert (=> b!801501 (= res!545460 (= lt!358069 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358064 lt!358063 mask!3266)))))

(assert (=> b!801501 (= lt!358069 (seekEntryOrOpen!0 lt!358064 lt!358063 mask!3266))))

(assert (=> b!801501 (= lt!358064 (select (store (arr!20836 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801501 (= lt!358063 (array!43523 (store (arr!20836 a!3170) i!1163 k0!2044) (size!21256 a!3170)))))

(assert (= (and start!68900 res!545461) b!801491))

(assert (= (and b!801491 res!545469) b!801492))

(assert (= (and b!801492 res!545472) b!801494))

(assert (= (and b!801494 res!545466) b!801498))

(assert (= (and b!801498 res!545470) b!801496))

(assert (= (and b!801496 res!545467) b!801489))

(assert (= (and b!801489 res!545463) b!801495))

(assert (= (and b!801495 res!545462) b!801497))

(assert (= (and b!801497 res!545468) b!801501))

(assert (= (and b!801501 res!545460) b!801499))

(assert (= (and b!801499 res!545471) b!801500))

(assert (= (and b!801500 res!545464) b!801490))

(assert (= (and b!801490 res!545465) b!801493))

(declare-fun m!742957 () Bool)

(assert (=> b!801490 m!742957))

(declare-fun m!742959 () Bool)

(assert (=> b!801498 m!742959))

(declare-fun m!742961 () Bool)

(assert (=> b!801489 m!742961))

(declare-fun m!742963 () Bool)

(assert (=> start!68900 m!742963))

(declare-fun m!742965 () Bool)

(assert (=> start!68900 m!742965))

(declare-fun m!742967 () Bool)

(assert (=> b!801492 m!742967))

(assert (=> b!801492 m!742967))

(declare-fun m!742969 () Bool)

(assert (=> b!801492 m!742969))

(declare-fun m!742971 () Bool)

(assert (=> b!801495 m!742971))

(declare-fun m!742973 () Bool)

(assert (=> b!801494 m!742973))

(declare-fun m!742975 () Bool)

(assert (=> b!801501 m!742975))

(declare-fun m!742977 () Bool)

(assert (=> b!801501 m!742977))

(declare-fun m!742979 () Bool)

(assert (=> b!801501 m!742979))

(declare-fun m!742981 () Bool)

(assert (=> b!801501 m!742981))

(declare-fun m!742983 () Bool)

(assert (=> b!801497 m!742983))

(declare-fun m!742985 () Bool)

(assert (=> b!801497 m!742985))

(declare-fun m!742987 () Bool)

(assert (=> b!801496 m!742987))

(declare-fun m!742989 () Bool)

(assert (=> b!801499 m!742989))

(assert (=> b!801499 m!742967))

(assert (=> b!801499 m!742967))

(declare-fun m!742991 () Bool)

(assert (=> b!801499 m!742991))

(assert (=> b!801499 m!742967))

(declare-fun m!742993 () Bool)

(assert (=> b!801499 m!742993))

(assert (=> b!801493 m!742967))

(assert (=> b!801493 m!742967))

(declare-fun m!742995 () Bool)

(assert (=> b!801493 m!742995))

(declare-fun m!742997 () Bool)

(assert (=> b!801500 m!742997))

(check-sat (not b!801489) (not b!801498) (not b!801499) (not b!801494) (not b!801496) (not b!801500) (not b!801492) (not start!68900) (not b!801493) (not b!801490) (not b!801501) (not b!801495))
(check-sat)
