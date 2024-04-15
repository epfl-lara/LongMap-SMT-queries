; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47796 () Bool)

(assert start!47796)

(declare-fun b!526497 () Bool)

(declare-fun e!306850 () Bool)

(assert (=> b!526497 (= e!306850 false)))

(declare-fun b!526498 () Bool)

(declare-fun res!323217 () Bool)

(declare-fun e!306854 () Bool)

(assert (=> b!526498 (=> (not res!323217) (not e!306854))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526498 (= res!323217 (validKeyInArray!0 k0!2280))))

(declare-fun res!323216 () Bool)

(assert (=> start!47796 (=> (not res!323216) (not e!306854))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47796 (= res!323216 (validMask!0 mask!3524))))

(assert (=> start!47796 e!306854))

(assert (=> start!47796 true))

(declare-datatypes ((array!33443 0))(
  ( (array!33444 (arr!16073 (Array (_ BitVec 32) (_ BitVec 64))) (size!16438 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33443)

(declare-fun array_inv!11956 (array!33443) Bool)

(assert (=> start!47796 (array_inv!11956 a!3235)))

(declare-fun b!526499 () Bool)

(declare-fun res!323218 () Bool)

(assert (=> b!526499 (=> (not res!323218) (not e!306854))))

(declare-fun arrayContainsKey!0 (array!33443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526499 (= res!323218 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526500 () Bool)

(declare-fun e!306852 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4537 0))(
  ( (MissingZero!4537 (index!20360 (_ BitVec 32))) (Found!4537 (index!20361 (_ BitVec 32))) (Intermediate!4537 (undefined!5349 Bool) (index!20362 (_ BitVec 32)) (x!49337 (_ BitVec 32))) (Undefined!4537) (MissingVacant!4537 (index!20363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33443 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!526500 (= e!306852 (= (seekEntryOrOpen!0 (select (arr!16073 a!3235) j!176) a!3235 mask!3524) (Found!4537 j!176)))))

(declare-fun b!526501 () Bool)

(declare-datatypes ((Unit!16594 0))(
  ( (Unit!16595) )
))
(declare-fun e!306853 () Unit!16594)

(declare-fun Unit!16596 () Unit!16594)

(assert (=> b!526501 (= e!306853 Unit!16596)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242118 () SeekEntryResult!4537)

(declare-fun lt!242113 () (_ BitVec 32))

(declare-fun lt!242115 () Unit!16594)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16594)

(assert (=> b!526501 (= lt!242115 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242113 #b00000000000000000000000000000000 (index!20362 lt!242118) (x!49337 lt!242118) mask!3524))))

(declare-fun res!323221 () Bool)

(declare-fun lt!242116 () array!33443)

(declare-fun lt!242119 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33443 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!526501 (= res!323221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242113 lt!242119 lt!242116 mask!3524) (Intermediate!4537 false (index!20362 lt!242118) (x!49337 lt!242118))))))

(assert (=> b!526501 (=> (not res!323221) (not e!306850))))

(assert (=> b!526501 e!306850))

(declare-fun b!526502 () Bool)

(declare-fun res!323219 () Bool)

(assert (=> b!526502 (=> (not res!323219) (not e!306854))))

(assert (=> b!526502 (= res!323219 (validKeyInArray!0 (select (arr!16073 a!3235) j!176)))))

(declare-fun b!526503 () Bool)

(declare-fun res!323223 () Bool)

(declare-fun e!306855 () Bool)

(assert (=> b!526503 (=> res!323223 e!306855)))

(get-info :version)

(assert (=> b!526503 (= res!323223 (or (undefined!5349 lt!242118) (not ((_ is Intermediate!4537) lt!242118))))))

(declare-fun b!526504 () Bool)

(declare-fun Unit!16597 () Unit!16594)

(assert (=> b!526504 (= e!306853 Unit!16597)))

(declare-fun b!526505 () Bool)

(declare-fun e!306849 () Bool)

(assert (=> b!526505 (= e!306854 e!306849)))

(declare-fun res!323214 () Bool)

(assert (=> b!526505 (=> (not res!323214) (not e!306849))))

(declare-fun lt!242114 () SeekEntryResult!4537)

(assert (=> b!526505 (= res!323214 (or (= lt!242114 (MissingZero!4537 i!1204)) (= lt!242114 (MissingVacant!4537 i!1204))))))

(assert (=> b!526505 (= lt!242114 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526506 () Bool)

(assert (=> b!526506 (= e!306849 (not e!306855))))

(declare-fun res!323215 () Bool)

(assert (=> b!526506 (=> res!323215 e!306855)))

(declare-fun lt!242111 () (_ BitVec 32))

(assert (=> b!526506 (= res!323215 (= lt!242118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242111 lt!242119 lt!242116 mask!3524)))))

(assert (=> b!526506 (= lt!242118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242113 (select (arr!16073 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526506 (= lt!242111 (toIndex!0 lt!242119 mask!3524))))

(assert (=> b!526506 (= lt!242119 (select (store (arr!16073 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526506 (= lt!242113 (toIndex!0 (select (arr!16073 a!3235) j!176) mask!3524))))

(assert (=> b!526506 (= lt!242116 (array!33444 (store (arr!16073 a!3235) i!1204 k0!2280) (size!16438 a!3235)))))

(assert (=> b!526506 e!306852))

(declare-fun res!323224 () Bool)

(assert (=> b!526506 (=> (not res!323224) (not e!306852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33443 (_ BitVec 32)) Bool)

(assert (=> b!526506 (= res!323224 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242110 () Unit!16594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16594)

(assert (=> b!526506 (= lt!242110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526507 () Bool)

(declare-fun res!323222 () Bool)

(assert (=> b!526507 (=> (not res!323222) (not e!306854))))

(assert (=> b!526507 (= res!323222 (and (= (size!16438 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16438 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16438 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526508 () Bool)

(declare-fun res!323220 () Bool)

(assert (=> b!526508 (=> (not res!323220) (not e!306849))))

(assert (=> b!526508 (= res!323220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526509 () Bool)

(assert (=> b!526509 (= e!306855 (bvsle (x!49337 lt!242118) #b01111111111111111111111111111110))))

(assert (=> b!526509 (= (index!20362 lt!242118) i!1204)))

(declare-fun lt!242112 () Unit!16594)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16594)

(assert (=> b!526509 (= lt!242112 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242113 #b00000000000000000000000000000000 (index!20362 lt!242118) (x!49337 lt!242118) mask!3524))))

(assert (=> b!526509 (and (or (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242117 () Unit!16594)

(assert (=> b!526509 (= lt!242117 e!306853)))

(declare-fun c!61947 () Bool)

(assert (=> b!526509 (= c!61947 (= (select (arr!16073 a!3235) (index!20362 lt!242118)) (select (arr!16073 a!3235) j!176)))))

(assert (=> b!526509 (and (bvslt (x!49337 lt!242118) #b01111111111111111111111111111110) (or (= (select (arr!16073 a!3235) (index!20362 lt!242118)) (select (arr!16073 a!3235) j!176)) (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16073 a!3235) (index!20362 lt!242118)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526510 () Bool)

(declare-fun res!323225 () Bool)

(assert (=> b!526510 (=> (not res!323225) (not e!306849))))

(declare-datatypes ((List!10270 0))(
  ( (Nil!10267) (Cons!10266 (h!11197 (_ BitVec 64)) (t!16489 List!10270)) )
))
(declare-fun arrayNoDuplicates!0 (array!33443 (_ BitVec 32) List!10270) Bool)

(assert (=> b!526510 (= res!323225 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10267))))

(assert (= (and start!47796 res!323216) b!526507))

(assert (= (and b!526507 res!323222) b!526502))

(assert (= (and b!526502 res!323219) b!526498))

(assert (= (and b!526498 res!323217) b!526499))

(assert (= (and b!526499 res!323218) b!526505))

(assert (= (and b!526505 res!323214) b!526508))

(assert (= (and b!526508 res!323220) b!526510))

(assert (= (and b!526510 res!323225) b!526506))

(assert (= (and b!526506 res!323224) b!526500))

(assert (= (and b!526506 (not res!323215)) b!526503))

(assert (= (and b!526503 (not res!323223)) b!526509))

(assert (= (and b!526509 c!61947) b!526501))

(assert (= (and b!526509 (not c!61947)) b!526504))

(assert (= (and b!526501 res!323221) b!526497))

(declare-fun m!506737 () Bool)

(assert (=> b!526506 m!506737))

(declare-fun m!506739 () Bool)

(assert (=> b!526506 m!506739))

(declare-fun m!506741 () Bool)

(assert (=> b!526506 m!506741))

(declare-fun m!506743 () Bool)

(assert (=> b!526506 m!506743))

(assert (=> b!526506 m!506741))

(declare-fun m!506745 () Bool)

(assert (=> b!526506 m!506745))

(declare-fun m!506747 () Bool)

(assert (=> b!526506 m!506747))

(declare-fun m!506749 () Bool)

(assert (=> b!526506 m!506749))

(assert (=> b!526506 m!506741))

(declare-fun m!506751 () Bool)

(assert (=> b!526506 m!506751))

(declare-fun m!506753 () Bool)

(assert (=> b!526506 m!506753))

(declare-fun m!506755 () Bool)

(assert (=> start!47796 m!506755))

(declare-fun m!506757 () Bool)

(assert (=> start!47796 m!506757))

(declare-fun m!506759 () Bool)

(assert (=> b!526498 m!506759))

(declare-fun m!506761 () Bool)

(assert (=> b!526505 m!506761))

(assert (=> b!526502 m!506741))

(assert (=> b!526502 m!506741))

(declare-fun m!506763 () Bool)

(assert (=> b!526502 m!506763))

(declare-fun m!506765 () Bool)

(assert (=> b!526508 m!506765))

(declare-fun m!506767 () Bool)

(assert (=> b!526510 m!506767))

(declare-fun m!506769 () Bool)

(assert (=> b!526499 m!506769))

(assert (=> b!526500 m!506741))

(assert (=> b!526500 m!506741))

(declare-fun m!506771 () Bool)

(assert (=> b!526500 m!506771))

(declare-fun m!506773 () Bool)

(assert (=> b!526509 m!506773))

(declare-fun m!506775 () Bool)

(assert (=> b!526509 m!506775))

(assert (=> b!526509 m!506741))

(declare-fun m!506777 () Bool)

(assert (=> b!526501 m!506777))

(declare-fun m!506779 () Bool)

(assert (=> b!526501 m!506779))

(check-sat (not b!526508) (not start!47796) (not b!526506) (not b!526499) (not b!526509) (not b!526505) (not b!526500) (not b!526502) (not b!526510) (not b!526501) (not b!526498))
(check-sat)
