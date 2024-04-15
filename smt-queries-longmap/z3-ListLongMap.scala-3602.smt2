; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49590 () Bool)

(assert start!49590)

(declare-fun b!545422 () Bool)

(declare-fun res!339493 () Bool)

(declare-fun e!315240 () Bool)

(assert (=> b!545422 (=> (not res!339493) (not e!315240))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34413 0))(
  ( (array!34414 (arr!16535 (Array (_ BitVec 32) (_ BitVec 64))) (size!16900 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34413)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545422 (= res!339493 (and (= (size!16900 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16900 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16900 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545423 () Bool)

(declare-fun e!315235 () Bool)

(declare-fun e!315239 () Bool)

(assert (=> b!545423 (= e!315235 e!315239)))

(declare-fun res!339503 () Bool)

(assert (=> b!545423 (=> (not res!339503) (not e!315239))))

(declare-fun lt!248717 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!545423 (= res!339503 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248717 #b00000000000000000000000000000000) (bvslt lt!248717 (size!16900 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545423 (= lt!248717 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545424 () Bool)

(declare-fun res!339498 () Bool)

(assert (=> b!545424 (=> (not res!339498) (not e!315240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545424 (= res!339498 (validKeyInArray!0 (select (arr!16535 a!3154) j!147)))))

(declare-fun b!545425 () Bool)

(declare-fun e!315237 () Bool)

(assert (=> b!545425 (= e!315237 (not true))))

(declare-datatypes ((SeekEntryResult!4990 0))(
  ( (MissingZero!4990 (index!22184 (_ BitVec 32))) (Found!4990 (index!22185 (_ BitVec 32))) (Intermediate!4990 (undefined!5802 Bool) (index!22186 (_ BitVec 32)) (x!51121 (_ BitVec 32))) (Undefined!4990) (MissingVacant!4990 (index!22187 (_ BitVec 32))) )
))
(declare-fun lt!248719 () SeekEntryResult!4990)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34413 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!545425 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248717 (select (store (arr!16535 a!3154) i!1153 k0!1998) j!147) (array!34414 (store (arr!16535 a!3154) i!1153 k0!1998) (size!16900 a!3154)) mask!3216) lt!248719)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16906 0))(
  ( (Unit!16907) )
))
(declare-fun lt!248720 () Unit!16906)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16906)

(assert (=> b!545425 (= lt!248720 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248717 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545426 () Bool)

(declare-fun res!339496 () Bool)

(assert (=> b!545426 (=> (not res!339496) (not e!315240))))

(assert (=> b!545426 (= res!339496 (validKeyInArray!0 k0!1998))))

(declare-fun b!545427 () Bool)

(declare-fun res!339494 () Bool)

(declare-fun e!315234 () Bool)

(assert (=> b!545427 (=> (not res!339494) (not e!315234))))

(assert (=> b!545427 (= res!339494 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16900 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16900 a!3154)) (= (select (arr!16535 a!3154) resIndex!32) (select (arr!16535 a!3154) j!147))))))

(declare-fun b!545428 () Bool)

(assert (=> b!545428 (= e!315239 e!315237)))

(declare-fun res!339502 () Bool)

(assert (=> b!545428 (=> (not res!339502) (not e!315237))))

(declare-fun lt!248721 () SeekEntryResult!4990)

(declare-fun lt!248718 () SeekEntryResult!4990)

(assert (=> b!545428 (= res!339502 (and (= lt!248718 lt!248719) (= lt!248721 lt!248718)))))

(assert (=> b!545428 (= lt!248718 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248717 (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!339497 () Bool)

(assert (=> start!49590 (=> (not res!339497) (not e!315240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49590 (= res!339497 (validMask!0 mask!3216))))

(assert (=> start!49590 e!315240))

(assert (=> start!49590 true))

(declare-fun array_inv!12418 (array!34413) Bool)

(assert (=> start!49590 (array_inv!12418 a!3154)))

(declare-fun b!545429 () Bool)

(assert (=> b!545429 (= e!315240 e!315234)))

(declare-fun res!339491 () Bool)

(assert (=> b!545429 (=> (not res!339491) (not e!315234))))

(declare-fun lt!248722 () SeekEntryResult!4990)

(assert (=> b!545429 (= res!339491 (or (= lt!248722 (MissingZero!4990 i!1153)) (= lt!248722 (MissingVacant!4990 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34413 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!545429 (= lt!248722 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545430 () Bool)

(declare-fun e!315236 () Bool)

(assert (=> b!545430 (= e!315236 e!315235)))

(declare-fun res!339495 () Bool)

(assert (=> b!545430 (=> (not res!339495) (not e!315235))))

(declare-fun lt!248716 () SeekEntryResult!4990)

(assert (=> b!545430 (= res!339495 (and (= lt!248721 lt!248716) (not (= (select (arr!16535 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16535 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16535 a!3154) index!1177) (select (arr!16535 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545430 (= lt!248721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16535 a!3154) j!147) mask!3216) (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545431 () Bool)

(declare-fun res!339500 () Bool)

(assert (=> b!545431 (=> (not res!339500) (not e!315240))))

(declare-fun arrayContainsKey!0 (array!34413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545431 (= res!339500 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545432 () Bool)

(declare-fun res!339501 () Bool)

(assert (=> b!545432 (=> (not res!339501) (not e!315234))))

(declare-datatypes ((List!10693 0))(
  ( (Nil!10690) (Cons!10689 (h!11653 (_ BitVec 64)) (t!16912 List!10693)) )
))
(declare-fun arrayNoDuplicates!0 (array!34413 (_ BitVec 32) List!10693) Bool)

(assert (=> b!545432 (= res!339501 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10690))))

(declare-fun b!545433 () Bool)

(assert (=> b!545433 (= e!315234 e!315236)))

(declare-fun res!339499 () Bool)

(assert (=> b!545433 (=> (not res!339499) (not e!315236))))

(assert (=> b!545433 (= res!339499 (= lt!248716 lt!248719))))

(assert (=> b!545433 (= lt!248719 (Intermediate!4990 false resIndex!32 resX!32))))

(assert (=> b!545433 (= lt!248716 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16535 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545434 () Bool)

(declare-fun res!339492 () Bool)

(assert (=> b!545434 (=> (not res!339492) (not e!315234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34413 (_ BitVec 32)) Bool)

(assert (=> b!545434 (= res!339492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49590 res!339497) b!545422))

(assert (= (and b!545422 res!339493) b!545424))

(assert (= (and b!545424 res!339498) b!545426))

(assert (= (and b!545426 res!339496) b!545431))

(assert (= (and b!545431 res!339500) b!545429))

(assert (= (and b!545429 res!339491) b!545434))

(assert (= (and b!545434 res!339492) b!545432))

(assert (= (and b!545432 res!339501) b!545427))

(assert (= (and b!545427 res!339494) b!545433))

(assert (= (and b!545433 res!339499) b!545430))

(assert (= (and b!545430 res!339495) b!545423))

(assert (= (and b!545423 res!339503) b!545428))

(assert (= (and b!545428 res!339502) b!545425))

(declare-fun m!522481 () Bool)

(assert (=> start!49590 m!522481))

(declare-fun m!522483 () Bool)

(assert (=> start!49590 m!522483))

(declare-fun m!522485 () Bool)

(assert (=> b!545426 m!522485))

(declare-fun m!522487 () Bool)

(assert (=> b!545433 m!522487))

(assert (=> b!545433 m!522487))

(declare-fun m!522489 () Bool)

(assert (=> b!545433 m!522489))

(declare-fun m!522491 () Bool)

(assert (=> b!545430 m!522491))

(assert (=> b!545430 m!522487))

(assert (=> b!545430 m!522487))

(declare-fun m!522493 () Bool)

(assert (=> b!545430 m!522493))

(assert (=> b!545430 m!522493))

(assert (=> b!545430 m!522487))

(declare-fun m!522495 () Bool)

(assert (=> b!545430 m!522495))

(declare-fun m!522497 () Bool)

(assert (=> b!545425 m!522497))

(declare-fun m!522499 () Bool)

(assert (=> b!545425 m!522499))

(assert (=> b!545425 m!522499))

(declare-fun m!522501 () Bool)

(assert (=> b!545425 m!522501))

(declare-fun m!522503 () Bool)

(assert (=> b!545425 m!522503))

(assert (=> b!545424 m!522487))

(assert (=> b!545424 m!522487))

(declare-fun m!522505 () Bool)

(assert (=> b!545424 m!522505))

(assert (=> b!545428 m!522487))

(assert (=> b!545428 m!522487))

(declare-fun m!522507 () Bool)

(assert (=> b!545428 m!522507))

(declare-fun m!522509 () Bool)

(assert (=> b!545429 m!522509))

(declare-fun m!522511 () Bool)

(assert (=> b!545432 m!522511))

(declare-fun m!522513 () Bool)

(assert (=> b!545431 m!522513))

(declare-fun m!522515 () Bool)

(assert (=> b!545434 m!522515))

(declare-fun m!522517 () Bool)

(assert (=> b!545423 m!522517))

(declare-fun m!522519 () Bool)

(assert (=> b!545427 m!522519))

(assert (=> b!545427 m!522487))

(check-sat (not start!49590) (not b!545431) (not b!545432) (not b!545434) (not b!545428) (not b!545424) (not b!545430) (not b!545425) (not b!545433) (not b!545423) (not b!545426) (not b!545429))
(check-sat)
