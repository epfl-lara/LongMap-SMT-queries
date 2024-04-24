; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87106 () Bool)

(assert start!87106)

(declare-fun b!1008417 () Bool)

(declare-fun e!567677 () Bool)

(assert (=> b!1008417 (= e!567677 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445546 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008417 (= lt!445546 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1008418 () Bool)

(declare-fun e!567674 () Bool)

(declare-fun e!567678 () Bool)

(assert (=> b!1008418 (= e!567674 e!567678)))

(declare-fun res!676550 () Bool)

(assert (=> b!1008418 (=> (not res!676550) (not e!567678))))

(declare-datatypes ((SeekEntryResult!9469 0))(
  ( (MissingZero!9469 (index!40247 (_ BitVec 32))) (Found!9469 (index!40248 (_ BitVec 32))) (Intermediate!9469 (undefined!10281 Bool) (index!40249 (_ BitVec 32)) (x!87807 (_ BitVec 32))) (Undefined!9469) (MissingVacant!9469 (index!40250 (_ BitVec 32))) )
))
(declare-fun lt!445544 () SeekEntryResult!9469)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008418 (= res!676550 (or (= lt!445544 (MissingVacant!9469 i!1194)) (= lt!445544 (MissingZero!9469 i!1194))))))

(declare-datatypes ((array!63573 0))(
  ( (array!63574 (arr!30601 (Array (_ BitVec 32) (_ BitVec 64))) (size!31104 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63573)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63573 (_ BitVec 32)) SeekEntryResult!9469)

(assert (=> b!1008418 (= lt!445544 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008419 () Bool)

(declare-fun e!567676 () Bool)

(declare-fun e!567675 () Bool)

(assert (=> b!1008419 (= e!567676 e!567675)))

(declare-fun res!676561 () Bool)

(assert (=> b!1008419 (=> (not res!676561) (not e!567675))))

(declare-fun lt!445545 () SeekEntryResult!9469)

(declare-fun lt!445549 () SeekEntryResult!9469)

(assert (=> b!1008419 (= res!676561 (= lt!445545 lt!445549))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63573 (_ BitVec 32)) SeekEntryResult!9469)

(assert (=> b!1008419 (= lt!445545 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30601 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008420 () Bool)

(declare-fun res!676553 () Bool)

(assert (=> b!1008420 (=> (not res!676553) (not e!567674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008420 (= res!676553 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008421 () Bool)

(assert (=> b!1008421 (= e!567678 e!567676)))

(declare-fun res!676555 () Bool)

(assert (=> b!1008421 (=> (not res!676555) (not e!567676))))

(declare-fun lt!445547 () SeekEntryResult!9469)

(assert (=> b!1008421 (= res!676555 (= lt!445547 lt!445549))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008421 (= lt!445549 (Intermediate!9469 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008421 (= lt!445547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30601 a!3219) j!170) mask!3464) (select (arr!30601 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008422 () Bool)

(declare-fun res!676562 () Bool)

(assert (=> b!1008422 (=> (not res!676562) (not e!567678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63573 (_ BitVec 32)) Bool)

(assert (=> b!1008422 (= res!676562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008423 () Bool)

(declare-fun res!676556 () Bool)

(assert (=> b!1008423 (=> (not res!676556) (not e!567674))))

(assert (=> b!1008423 (= res!676556 (and (= (size!31104 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31104 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31104 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008424 () Bool)

(declare-fun res!676552 () Bool)

(assert (=> b!1008424 (=> (not res!676552) (not e!567677))))

(declare-fun lt!445548 () array!63573)

(declare-fun lt!445550 () (_ BitVec 64))

(assert (=> b!1008424 (= res!676552 (not (= lt!445545 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445550 lt!445548 mask!3464))))))

(declare-fun b!1008426 () Bool)

(declare-fun res!676549 () Bool)

(assert (=> b!1008426 (=> (not res!676549) (not e!567678))))

(declare-datatypes ((List!21248 0))(
  ( (Nil!21245) (Cons!21244 (h!22439 (_ BitVec 64)) (t!30241 List!21248)) )
))
(declare-fun arrayNoDuplicates!0 (array!63573 (_ BitVec 32) List!21248) Bool)

(assert (=> b!1008426 (= res!676549 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21245))))

(declare-fun b!1008427 () Bool)

(assert (=> b!1008427 (= e!567675 e!567677)))

(declare-fun res!676559 () Bool)

(assert (=> b!1008427 (=> (not res!676559) (not e!567677))))

(assert (=> b!1008427 (= res!676559 (not (= lt!445547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445550 mask!3464) lt!445550 lt!445548 mask!3464))))))

(assert (=> b!1008427 (= lt!445550 (select (store (arr!30601 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008427 (= lt!445548 (array!63574 (store (arr!30601 a!3219) i!1194 k0!2224) (size!31104 a!3219)))))

(declare-fun b!1008428 () Bool)

(declare-fun res!676560 () Bool)

(assert (=> b!1008428 (=> (not res!676560) (not e!567677))))

(assert (=> b!1008428 (= res!676560 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008429 () Bool)

(declare-fun res!676554 () Bool)

(assert (=> b!1008429 (=> (not res!676554) (not e!567678))))

(assert (=> b!1008429 (= res!676554 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31104 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31104 a!3219))))))

(declare-fun b!1008430 () Bool)

(declare-fun res!676557 () Bool)

(assert (=> b!1008430 (=> (not res!676557) (not e!567674))))

(assert (=> b!1008430 (= res!676557 (validKeyInArray!0 (select (arr!30601 a!3219) j!170)))))

(declare-fun res!676558 () Bool)

(assert (=> start!87106 (=> (not res!676558) (not e!567674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87106 (= res!676558 (validMask!0 mask!3464))))

(assert (=> start!87106 e!567674))

(declare-fun array_inv!23737 (array!63573) Bool)

(assert (=> start!87106 (array_inv!23737 a!3219)))

(assert (=> start!87106 true))

(declare-fun b!1008425 () Bool)

(declare-fun res!676551 () Bool)

(assert (=> b!1008425 (=> (not res!676551) (not e!567674))))

(declare-fun arrayContainsKey!0 (array!63573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008425 (= res!676551 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87106 res!676558) b!1008423))

(assert (= (and b!1008423 res!676556) b!1008430))

(assert (= (and b!1008430 res!676557) b!1008420))

(assert (= (and b!1008420 res!676553) b!1008425))

(assert (= (and b!1008425 res!676551) b!1008418))

(assert (= (and b!1008418 res!676550) b!1008422))

(assert (= (and b!1008422 res!676562) b!1008426))

(assert (= (and b!1008426 res!676549) b!1008429))

(assert (= (and b!1008429 res!676554) b!1008421))

(assert (= (and b!1008421 res!676555) b!1008419))

(assert (= (and b!1008419 res!676561) b!1008427))

(assert (= (and b!1008427 res!676559) b!1008424))

(assert (= (and b!1008424 res!676552) b!1008428))

(assert (= (and b!1008428 res!676560) b!1008417))

(declare-fun m!933623 () Bool)

(assert (=> b!1008421 m!933623))

(assert (=> b!1008421 m!933623))

(declare-fun m!933625 () Bool)

(assert (=> b!1008421 m!933625))

(assert (=> b!1008421 m!933625))

(assert (=> b!1008421 m!933623))

(declare-fun m!933627 () Bool)

(assert (=> b!1008421 m!933627))

(declare-fun m!933629 () Bool)

(assert (=> start!87106 m!933629))

(declare-fun m!933631 () Bool)

(assert (=> start!87106 m!933631))

(declare-fun m!933633 () Bool)

(assert (=> b!1008420 m!933633))

(declare-fun m!933635 () Bool)

(assert (=> b!1008422 m!933635))

(declare-fun m!933637 () Bool)

(assert (=> b!1008417 m!933637))

(assert (=> b!1008419 m!933623))

(assert (=> b!1008419 m!933623))

(declare-fun m!933639 () Bool)

(assert (=> b!1008419 m!933639))

(declare-fun m!933641 () Bool)

(assert (=> b!1008418 m!933641))

(declare-fun m!933643 () Bool)

(assert (=> b!1008426 m!933643))

(declare-fun m!933645 () Bool)

(assert (=> b!1008424 m!933645))

(declare-fun m!933647 () Bool)

(assert (=> b!1008427 m!933647))

(assert (=> b!1008427 m!933647))

(declare-fun m!933649 () Bool)

(assert (=> b!1008427 m!933649))

(declare-fun m!933651 () Bool)

(assert (=> b!1008427 m!933651))

(declare-fun m!933653 () Bool)

(assert (=> b!1008427 m!933653))

(assert (=> b!1008430 m!933623))

(assert (=> b!1008430 m!933623))

(declare-fun m!933655 () Bool)

(assert (=> b!1008430 m!933655))

(declare-fun m!933657 () Bool)

(assert (=> b!1008425 m!933657))

(check-sat (not b!1008419) (not start!87106) (not b!1008422) (not b!1008426) (not b!1008420) (not b!1008425) (not b!1008424) (not b!1008430) (not b!1008417) (not b!1008427) (not b!1008418) (not b!1008421))
(check-sat)
