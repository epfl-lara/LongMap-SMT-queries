; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86638 () Bool)

(assert start!86638)

(declare-fun b!1002016 () Bool)

(declare-fun e!564740 () Bool)

(declare-fun e!564741 () Bool)

(assert (=> b!1002016 (= e!564740 e!564741)))

(declare-fun res!670933 () Bool)

(assert (=> b!1002016 (=> (not res!670933) (not e!564741))))

(declare-datatypes ((SeekEntryResult!9343 0))(
  ( (MissingZero!9343 (index!39743 (_ BitVec 32))) (Found!9343 (index!39744 (_ BitVec 32))) (Intermediate!9343 (undefined!10155 Bool) (index!39745 (_ BitVec 32)) (x!87321 (_ BitVec 32))) (Undefined!9343) (MissingVacant!9343 (index!39746 (_ BitVec 32))) )
))
(declare-fun lt!442876 () SeekEntryResult!9343)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002016 (= res!670933 (or (= lt!442876 (MissingVacant!9343 i!1194)) (= lt!442876 (MissingZero!9343 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-datatypes ((array!63309 0))(
  ( (array!63310 (arr!30475 (Array (_ BitVec 32) (_ BitVec 64))) (size!30978 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63309)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63309 (_ BitVec 32)) SeekEntryResult!9343)

(assert (=> b!1002016 (= lt!442876 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002017 () Bool)

(declare-fun res!670935 () Bool)

(assert (=> b!1002017 (=> (not res!670935) (not e!564741))))

(declare-datatypes ((List!21122 0))(
  ( (Nil!21119) (Cons!21118 (h!22301 (_ BitVec 64)) (t!30115 List!21122)) )
))
(declare-fun arrayNoDuplicates!0 (array!63309 (_ BitVec 32) List!21122) Bool)

(assert (=> b!1002017 (= res!670935 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21119))))

(declare-fun b!1002018 () Bool)

(declare-fun res!670939 () Bool)

(assert (=> b!1002018 (=> (not res!670939) (not e!564741))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002018 (= res!670939 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30978 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30978 a!3219))))))

(declare-fun res!670932 () Bool)

(assert (=> start!86638 (=> (not res!670932) (not e!564740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86638 (= res!670932 (validMask!0 mask!3464))))

(assert (=> start!86638 e!564740))

(declare-fun array_inv!23611 (array!63309) Bool)

(assert (=> start!86638 (array_inv!23611 a!3219)))

(assert (=> start!86638 true))

(declare-fun b!1002019 () Bool)

(declare-fun res!670931 () Bool)

(assert (=> b!1002019 (=> (not res!670931) (not e!564740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002019 (= res!670931 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002020 () Bool)

(declare-fun res!670938 () Bool)

(assert (=> b!1002020 (=> (not res!670938) (not e!564740))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1002020 (= res!670938 (validKeyInArray!0 (select (arr!30475 a!3219) j!170)))))

(declare-fun b!1002021 () Bool)

(declare-fun res!670940 () Bool)

(assert (=> b!1002021 (=> (not res!670940) (not e!564741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63309 (_ BitVec 32)) Bool)

(assert (=> b!1002021 (= res!670940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002022 () Bool)

(declare-fun e!564744 () Bool)

(declare-fun e!564739 () Bool)

(assert (=> b!1002022 (= e!564744 e!564739)))

(declare-fun res!670934 () Bool)

(assert (=> b!1002022 (=> (not res!670934) (not e!564739))))

(declare-fun lt!442874 () array!63309)

(declare-fun lt!442877 () SeekEntryResult!9343)

(declare-fun lt!442875 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63309 (_ BitVec 32)) SeekEntryResult!9343)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002022 (= res!670934 (not (= lt!442877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442875 mask!3464) lt!442875 lt!442874 mask!3464))))))

(assert (=> b!1002022 (= lt!442875 (select (store (arr!30475 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002022 (= lt!442874 (array!63310 (store (arr!30475 a!3219) i!1194 k0!2224) (size!30978 a!3219)))))

(declare-fun b!1002023 () Bool)

(declare-fun res!670936 () Bool)

(assert (=> b!1002023 (=> (not res!670936) (not e!564740))))

(declare-fun arrayContainsKey!0 (array!63309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002023 (= res!670936 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002024 () Bool)

(declare-fun res!670928 () Bool)

(assert (=> b!1002024 (=> (not res!670928) (not e!564739))))

(declare-fun lt!442872 () SeekEntryResult!9343)

(assert (=> b!1002024 (= res!670928 (not (= lt!442872 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442875 lt!442874 mask!3464))))))

(declare-fun b!1002025 () Bool)

(declare-fun e!564742 () Bool)

(assert (=> b!1002025 (= e!564741 e!564742)))

(declare-fun res!670929 () Bool)

(assert (=> b!1002025 (=> (not res!670929) (not e!564742))))

(declare-fun lt!442873 () SeekEntryResult!9343)

(assert (=> b!1002025 (= res!670929 (= lt!442877 lt!442873))))

(assert (=> b!1002025 (= lt!442873 (Intermediate!9343 false resIndex!38 resX!38))))

(assert (=> b!1002025 (= lt!442877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30475 a!3219) j!170) mask!3464) (select (arr!30475 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002026 () Bool)

(assert (=> b!1002026 (= e!564739 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1002027 () Bool)

(assert (=> b!1002027 (= e!564742 e!564744)))

(declare-fun res!670937 () Bool)

(assert (=> b!1002027 (=> (not res!670937) (not e!564744))))

(assert (=> b!1002027 (= res!670937 (= lt!442872 lt!442873))))

(assert (=> b!1002027 (= lt!442872 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30475 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002028 () Bool)

(declare-fun res!670930 () Bool)

(assert (=> b!1002028 (=> (not res!670930) (not e!564740))))

(assert (=> b!1002028 (= res!670930 (and (= (size!30978 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30978 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30978 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86638 res!670932) b!1002028))

(assert (= (and b!1002028 res!670930) b!1002020))

(assert (= (and b!1002020 res!670938) b!1002019))

(assert (= (and b!1002019 res!670931) b!1002023))

(assert (= (and b!1002023 res!670936) b!1002016))

(assert (= (and b!1002016 res!670933) b!1002021))

(assert (= (and b!1002021 res!670940) b!1002017))

(assert (= (and b!1002017 res!670935) b!1002018))

(assert (= (and b!1002018 res!670939) b!1002025))

(assert (= (and b!1002025 res!670929) b!1002027))

(assert (= (and b!1002027 res!670937) b!1002022))

(assert (= (and b!1002022 res!670934) b!1002024))

(assert (= (and b!1002024 res!670928) b!1002026))

(declare-fun m!928523 () Bool)

(assert (=> b!1002016 m!928523))

(declare-fun m!928525 () Bool)

(assert (=> b!1002023 m!928525))

(declare-fun m!928527 () Bool)

(assert (=> b!1002022 m!928527))

(assert (=> b!1002022 m!928527))

(declare-fun m!928529 () Bool)

(assert (=> b!1002022 m!928529))

(declare-fun m!928531 () Bool)

(assert (=> b!1002022 m!928531))

(declare-fun m!928533 () Bool)

(assert (=> b!1002022 m!928533))

(declare-fun m!928535 () Bool)

(assert (=> b!1002020 m!928535))

(assert (=> b!1002020 m!928535))

(declare-fun m!928537 () Bool)

(assert (=> b!1002020 m!928537))

(declare-fun m!928539 () Bool)

(assert (=> b!1002021 m!928539))

(declare-fun m!928541 () Bool)

(assert (=> b!1002017 m!928541))

(assert (=> b!1002025 m!928535))

(assert (=> b!1002025 m!928535))

(declare-fun m!928543 () Bool)

(assert (=> b!1002025 m!928543))

(assert (=> b!1002025 m!928543))

(assert (=> b!1002025 m!928535))

(declare-fun m!928545 () Bool)

(assert (=> b!1002025 m!928545))

(declare-fun m!928547 () Bool)

(assert (=> b!1002019 m!928547))

(declare-fun m!928549 () Bool)

(assert (=> start!86638 m!928549))

(declare-fun m!928551 () Bool)

(assert (=> start!86638 m!928551))

(assert (=> b!1002027 m!928535))

(assert (=> b!1002027 m!928535))

(declare-fun m!928553 () Bool)

(assert (=> b!1002027 m!928553))

(declare-fun m!928555 () Bool)

(assert (=> b!1002024 m!928555))

(check-sat (not b!1002017) (not b!1002024) (not b!1002016) (not start!86638) (not b!1002025) (not b!1002019) (not b!1002022) (not b!1002020) (not b!1002027) (not b!1002021) (not b!1002023))
(check-sat)
