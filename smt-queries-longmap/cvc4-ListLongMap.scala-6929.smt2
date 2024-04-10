; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87130 () Bool)

(assert start!87130)

(declare-fun b!1010463 () Bool)

(declare-fun e!568450 () Bool)

(declare-fun e!568449 () Bool)

(assert (=> b!1010463 (= e!568450 e!568449)))

(declare-fun res!678868 () Bool)

(assert (=> b!1010463 (=> (not res!678868) (not e!568449))))

(declare-datatypes ((SeekEntryResult!9574 0))(
  ( (MissingZero!9574 (index!40667 (_ BitVec 32))) (Found!9574 (index!40668 (_ BitVec 32))) (Intermediate!9574 (undefined!10386 Bool) (index!40669 (_ BitVec 32)) (x!88066 (_ BitVec 32))) (Undefined!9574) (MissingVacant!9574 (index!40670 (_ BitVec 32))) )
))
(declare-fun lt!446615 () SeekEntryResult!9574)

(declare-fun lt!446619 () SeekEntryResult!9574)

(assert (=> b!1010463 (= res!678868 (= lt!446615 lt!446619))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010463 (= lt!446619 (Intermediate!9574 false resIndex!38 resX!38))))

(declare-datatypes ((array!63648 0))(
  ( (array!63649 (arr!30642 (Array (_ BitVec 32) (_ BitVec 64))) (size!31144 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63648)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63648 (_ BitVec 32)) SeekEntryResult!9574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010463 (= lt!446615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) (select (arr!30642 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010464 () Bool)

(declare-fun res!678869 () Bool)

(declare-fun e!568445 () Bool)

(assert (=> b!1010464 (=> (not res!678869) (not e!568445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010464 (= res!678869 (validKeyInArray!0 (select (arr!30642 a!3219) j!170)))))

(declare-fun b!1010465 () Bool)

(declare-fun res!678860 () Bool)

(assert (=> b!1010465 (=> (not res!678860) (not e!568450))))

(declare-datatypes ((List!21318 0))(
  ( (Nil!21315) (Cons!21314 (h!22506 (_ BitVec 64)) (t!30319 List!21318)) )
))
(declare-fun arrayNoDuplicates!0 (array!63648 (_ BitVec 32) List!21318) Bool)

(assert (=> b!1010465 (= res!678860 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21315))))

(declare-fun b!1010466 () Bool)

(declare-fun res!678862 () Bool)

(assert (=> b!1010466 (=> (not res!678862) (not e!568445))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010466 (= res!678862 (and (= (size!31144 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31144 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31144 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010467 () Bool)

(declare-fun res!678867 () Bool)

(declare-fun e!568447 () Bool)

(assert (=> b!1010467 (=> (not res!678867) (not e!568447))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1010467 (= res!678867 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010468 () Bool)

(declare-fun res!678865 () Bool)

(assert (=> b!1010468 (=> (not res!678865) (not e!568445))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1010468 (= res!678865 (validKeyInArray!0 k!2224))))

(declare-fun b!1010469 () Bool)

(declare-fun e!568448 () Bool)

(assert (=> b!1010469 (= e!568448 e!568447)))

(declare-fun res!678863 () Bool)

(assert (=> b!1010469 (=> (not res!678863) (not e!568447))))

(declare-fun lt!446618 () array!63648)

(declare-fun lt!446616 () (_ BitVec 64))

(assert (=> b!1010469 (= res!678863 (not (= lt!446615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446616 mask!3464) lt!446616 lt!446618 mask!3464))))))

(assert (=> b!1010469 (= lt!446616 (select (store (arr!30642 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010469 (= lt!446618 (array!63649 (store (arr!30642 a!3219) i!1194 k!2224) (size!31144 a!3219)))))

(declare-fun b!1010470 () Bool)

(assert (=> b!1010470 (= e!568449 e!568448)))

(declare-fun res!678856 () Bool)

(assert (=> b!1010470 (=> (not res!678856) (not e!568448))))

(declare-fun lt!446617 () SeekEntryResult!9574)

(assert (=> b!1010470 (= res!678856 (= lt!446617 lt!446619))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1010470 (= lt!446617 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30642 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010472 () Bool)

(declare-fun res!678870 () Bool)

(assert (=> b!1010472 (=> (not res!678870) (not e!568447))))

(assert (=> b!1010472 (= res!678870 (not (= lt!446617 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446616 lt!446618 mask!3464))))))

(declare-fun lt!446613 () (_ BitVec 32))

(declare-fun e!568444 () Bool)

(declare-fun b!1010473 () Bool)

(assert (=> b!1010473 (= e!568444 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446613 (select (arr!30642 a!3219) j!170) a!3219 mask!3464) lt!446619)))))

(declare-fun b!1010474 () Bool)

(declare-fun res!678857 () Bool)

(assert (=> b!1010474 (=> (not res!678857) (not e!568445))))

(declare-fun arrayContainsKey!0 (array!63648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010474 (= res!678857 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010475 () Bool)

(assert (=> b!1010475 (= e!568445 e!568450)))

(declare-fun res!678859 () Bool)

(assert (=> b!1010475 (=> (not res!678859) (not e!568450))))

(declare-fun lt!446614 () SeekEntryResult!9574)

(assert (=> b!1010475 (= res!678859 (or (= lt!446614 (MissingVacant!9574 i!1194)) (= lt!446614 (MissingZero!9574 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63648 (_ BitVec 32)) SeekEntryResult!9574)

(assert (=> b!1010475 (= lt!446614 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010476 () Bool)

(assert (=> b!1010476 (= e!568447 e!568444)))

(declare-fun res!678861 () Bool)

(assert (=> b!1010476 (=> (not res!678861) (not e!568444))))

(assert (=> b!1010476 (= res!678861 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446613 #b00000000000000000000000000000000) (bvslt lt!446613 (size!31144 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010476 (= lt!446613 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010477 () Bool)

(declare-fun res!678858 () Bool)

(assert (=> b!1010477 (=> (not res!678858) (not e!568450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63648 (_ BitVec 32)) Bool)

(assert (=> b!1010477 (= res!678858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!678864 () Bool)

(assert (=> start!87130 (=> (not res!678864) (not e!568445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87130 (= res!678864 (validMask!0 mask!3464))))

(assert (=> start!87130 e!568445))

(declare-fun array_inv!23766 (array!63648) Bool)

(assert (=> start!87130 (array_inv!23766 a!3219)))

(assert (=> start!87130 true))

(declare-fun b!1010471 () Bool)

(declare-fun res!678866 () Bool)

(assert (=> b!1010471 (=> (not res!678866) (not e!568450))))

(assert (=> b!1010471 (= res!678866 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31144 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31144 a!3219))))))

(assert (= (and start!87130 res!678864) b!1010466))

(assert (= (and b!1010466 res!678862) b!1010464))

(assert (= (and b!1010464 res!678869) b!1010468))

(assert (= (and b!1010468 res!678865) b!1010474))

(assert (= (and b!1010474 res!678857) b!1010475))

(assert (= (and b!1010475 res!678859) b!1010477))

(assert (= (and b!1010477 res!678858) b!1010465))

(assert (= (and b!1010465 res!678860) b!1010471))

(assert (= (and b!1010471 res!678866) b!1010463))

(assert (= (and b!1010463 res!678868) b!1010470))

(assert (= (and b!1010470 res!678856) b!1010469))

(assert (= (and b!1010469 res!678863) b!1010472))

(assert (= (and b!1010472 res!678870) b!1010467))

(assert (= (and b!1010467 res!678867) b!1010476))

(assert (= (and b!1010476 res!678861) b!1010473))

(declare-fun m!934783 () Bool)

(assert (=> b!1010475 m!934783))

(declare-fun m!934785 () Bool)

(assert (=> b!1010469 m!934785))

(assert (=> b!1010469 m!934785))

(declare-fun m!934787 () Bool)

(assert (=> b!1010469 m!934787))

(declare-fun m!934789 () Bool)

(assert (=> b!1010469 m!934789))

(declare-fun m!934791 () Bool)

(assert (=> b!1010469 m!934791))

(declare-fun m!934793 () Bool)

(assert (=> b!1010474 m!934793))

(declare-fun m!934795 () Bool)

(assert (=> b!1010465 m!934795))

(declare-fun m!934797 () Bool)

(assert (=> b!1010472 m!934797))

(declare-fun m!934799 () Bool)

(assert (=> b!1010476 m!934799))

(declare-fun m!934801 () Bool)

(assert (=> b!1010464 m!934801))

(assert (=> b!1010464 m!934801))

(declare-fun m!934803 () Bool)

(assert (=> b!1010464 m!934803))

(declare-fun m!934805 () Bool)

(assert (=> b!1010477 m!934805))

(declare-fun m!934807 () Bool)

(assert (=> b!1010468 m!934807))

(assert (=> b!1010470 m!934801))

(assert (=> b!1010470 m!934801))

(declare-fun m!934809 () Bool)

(assert (=> b!1010470 m!934809))

(assert (=> b!1010463 m!934801))

(assert (=> b!1010463 m!934801))

(declare-fun m!934811 () Bool)

(assert (=> b!1010463 m!934811))

(assert (=> b!1010463 m!934811))

(assert (=> b!1010463 m!934801))

(declare-fun m!934813 () Bool)

(assert (=> b!1010463 m!934813))

(assert (=> b!1010473 m!934801))

(assert (=> b!1010473 m!934801))

(declare-fun m!934815 () Bool)

(assert (=> b!1010473 m!934815))

(declare-fun m!934817 () Bool)

(assert (=> start!87130 m!934817))

(declare-fun m!934819 () Bool)

(assert (=> start!87130 m!934819))

(push 1)

(assert (not b!1010473))

(assert (not b!1010476))

(assert (not b!1010465))

(assert (not b!1010468))

(assert (not b!1010474))

(assert (not b!1010463))

(assert (not b!1010464))

(assert (not b!1010470))

(assert (not b!1010477))

(assert (not start!87130))

(assert (not b!1010475))

(assert (not b!1010469))

(assert (not b!1010472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1010577 () Bool)

(declare-fun e!568509 () Bool)

(declare-fun e!568507 () Bool)

(assert (=> b!1010577 (= e!568509 e!568507)))

(declare-fun res!678899 () Bool)

(declare-fun lt!446657 () SeekEntryResult!9574)

(assert (=> b!1010577 (= res!678899 (and (is-Intermediate!9574 lt!446657) (not (undefined!10386 lt!446657)) (bvslt (x!88066 lt!446657) #b01111111111111111111111111111110) (bvsge (x!88066 lt!446657) #b00000000000000000000000000000000) (bvsge (x!88066 lt!446657) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1010577 (=> (not res!678899) (not e!568507))))

(declare-fun b!1010578 () Bool)

(assert (=> b!1010578 (and (bvsge (index!40669 lt!446657) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446657) (size!31144 a!3219)))))

(declare-fun res!678900 () Bool)

(assert (=> b!1010578 (= res!678900 (= (select (arr!30642 a!3219) (index!40669 lt!446657)) (select (arr!30642 a!3219) j!170)))))

(declare-fun e!568505 () Bool)

(assert (=> b!1010578 (=> res!678900 e!568505)))

(assert (=> b!1010578 (= e!568507 e!568505)))

(declare-fun b!1010579 () Bool)

(assert (=> b!1010579 (= e!568509 (bvsge (x!88066 lt!446657) #b01111111111111111111111111111110))))

(declare-fun d!119997 () Bool)

(assert (=> d!119997 e!568509))

(declare-fun c!101999 () Bool)

(assert (=> d!119997 (= c!101999 (and (is-Intermediate!9574 lt!446657) (undefined!10386 lt!446657)))))

(declare-fun e!568508 () SeekEntryResult!9574)

(assert (=> d!119997 (= lt!446657 e!568508)))

(declare-fun c!101998 () Bool)

(assert (=> d!119997 (= c!101998 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(declare-fun lt!446656 () (_ BitVec 64))

(assert (=> d!119997 (= lt!446656 (select (arr!30642 a!3219) lt!446613))))

(assert (=> d!119997 (validMask!0 mask!3464)))

(assert (=> d!119997 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446613 (select (arr!30642 a!3219) j!170) a!3219 mask!3464) lt!446657)))

(declare-fun b!1010580 () Bool)

(declare-fun e!568506 () SeekEntryResult!9574)

(assert (=> b!1010580 (= e!568506 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446613 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30642 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010581 () Bool)

(assert (=> b!1010581 (= e!568506 (Intermediate!9574 false lt!446613 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010582 () Bool)

(assert (=> b!1010582 (= e!568508 (Intermediate!9574 true lt!446613 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010583 () Bool)

(assert (=> b!1010583 (and (bvsge (index!40669 lt!446657) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446657) (size!31144 a!3219)))))

(assert (=> b!1010583 (= e!568505 (= (select (arr!30642 a!3219) (index!40669 lt!446657)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010584 () Bool)

(assert (=> b!1010584 (= e!568508 e!568506)))

(declare-fun c!102000 () Bool)

(assert (=> b!1010584 (= c!102000 (or (= lt!446656 (select (arr!30642 a!3219) j!170)) (= (bvadd lt!446656 lt!446656) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010585 () Bool)

(assert (=> b!1010585 (and (bvsge (index!40669 lt!446657) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446657) (size!31144 a!3219)))))

(declare-fun res!678901 () Bool)

(assert (=> b!1010585 (= res!678901 (= (select (arr!30642 a!3219) (index!40669 lt!446657)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010585 (=> res!678901 e!568505)))

(assert (= (and d!119997 c!101998) b!1010582))

(assert (= (and d!119997 (not c!101998)) b!1010584))

(assert (= (and b!1010584 c!102000) b!1010581))

(assert (= (and b!1010584 (not c!102000)) b!1010580))

(assert (= (and d!119997 c!101999) b!1010579))

(assert (= (and d!119997 (not c!101999)) b!1010577))

(assert (= (and b!1010577 res!678899) b!1010578))

(assert (= (and b!1010578 (not res!678900)) b!1010585))

(assert (= (and b!1010585 (not res!678901)) b!1010583))

(declare-fun m!934859 () Bool)

(assert (=> b!1010583 m!934859))

(assert (=> b!1010585 m!934859))

(assert (=> b!1010578 m!934859))

(declare-fun m!934861 () Bool)

(assert (=> d!119997 m!934861))

(assert (=> d!119997 m!934817))

(declare-fun m!934863 () Bool)

(assert (=> b!1010580 m!934863))

(assert (=> b!1010580 m!934863))

(assert (=> b!1010580 m!934801))

(declare-fun m!934865 () Bool)

(assert (=> b!1010580 m!934865))

(assert (=> b!1010473 d!119997))

(declare-fun d!120007 () Bool)

(assert (=> d!120007 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87130 d!120007))

(declare-fun d!120019 () Bool)

(assert (=> d!120019 (= (array_inv!23766 a!3219) (bvsge (size!31144 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87130 d!120019))

(declare-fun b!1010625 () Bool)

(declare-fun e!568542 () Bool)

(declare-fun e!568540 () Bool)

(assert (=> b!1010625 (= e!568542 e!568540)))

(declare-fun res!678924 () Bool)

(declare-fun lt!446669 () SeekEntryResult!9574)

(assert (=> b!1010625 (= res!678924 (and (is-Intermediate!9574 lt!446669) (not (undefined!10386 lt!446669)) (bvslt (x!88066 lt!446669) #b01111111111111111111111111111110) (bvsge (x!88066 lt!446669) #b00000000000000000000000000000000) (bvsge (x!88066 lt!446669) x!1245)))))

(assert (=> b!1010625 (=> (not res!678924) (not e!568540))))

(declare-fun b!1010626 () Bool)

(assert (=> b!1010626 (and (bvsge (index!40669 lt!446669) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446669) (size!31144 lt!446618)))))

(declare-fun res!678925 () Bool)

(assert (=> b!1010626 (= res!678925 (= (select (arr!30642 lt!446618) (index!40669 lt!446669)) lt!446616))))

(declare-fun e!568538 () Bool)

(assert (=> b!1010626 (=> res!678925 e!568538)))

(assert (=> b!1010626 (= e!568540 e!568538)))

(declare-fun b!1010627 () Bool)

(assert (=> b!1010627 (= e!568542 (bvsge (x!88066 lt!446669) #b01111111111111111111111111111110))))

(declare-fun d!120025 () Bool)

(assert (=> d!120025 e!568542))

(declare-fun c!102011 () Bool)

(assert (=> d!120025 (= c!102011 (and (is-Intermediate!9574 lt!446669) (undefined!10386 lt!446669)))))

(declare-fun e!568541 () SeekEntryResult!9574)

(assert (=> d!120025 (= lt!446669 e!568541)))

(declare-fun c!102010 () Bool)

(assert (=> d!120025 (= c!102010 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446668 () (_ BitVec 64))

(assert (=> d!120025 (= lt!446668 (select (arr!30642 lt!446618) index!1507))))

(assert (=> d!120025 (validMask!0 mask!3464)))

(assert (=> d!120025 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446616 lt!446618 mask!3464) lt!446669)))

(declare-fun e!568539 () SeekEntryResult!9574)

(declare-fun b!1010628 () Bool)

(assert (=> b!1010628 (= e!568539 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446616 lt!446618 mask!3464))))

(declare-fun b!1010629 () Bool)

(assert (=> b!1010629 (= e!568539 (Intermediate!9574 false index!1507 x!1245))))

(declare-fun b!1010630 () Bool)

(assert (=> b!1010630 (= e!568541 (Intermediate!9574 true index!1507 x!1245))))

(declare-fun b!1010631 () Bool)

(assert (=> b!1010631 (and (bvsge (index!40669 lt!446669) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446669) (size!31144 lt!446618)))))

(assert (=> b!1010631 (= e!568538 (= (select (arr!30642 lt!446618) (index!40669 lt!446669)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010632 () Bool)

(assert (=> b!1010632 (= e!568541 e!568539)))

(declare-fun c!102012 () Bool)

(assert (=> b!1010632 (= c!102012 (or (= lt!446668 lt!446616) (= (bvadd lt!446668 lt!446668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010633 () Bool)

(assert (=> b!1010633 (and (bvsge (index!40669 lt!446669) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446669) (size!31144 lt!446618)))))

(declare-fun res!678926 () Bool)

(assert (=> b!1010633 (= res!678926 (= (select (arr!30642 lt!446618) (index!40669 lt!446669)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010633 (=> res!678926 e!568538)))

(assert (= (and d!120025 c!102010) b!1010630))

(assert (= (and d!120025 (not c!102010)) b!1010632))

(assert (= (and b!1010632 c!102012) b!1010629))

(assert (= (and b!1010632 (not c!102012)) b!1010628))

(assert (= (and d!120025 c!102011) b!1010627))

(assert (= (and d!120025 (not c!102011)) b!1010625))

(assert (= (and b!1010625 res!678924) b!1010626))

(assert (= (and b!1010626 (not res!678925)) b!1010633))

(assert (= (and b!1010633 (not res!678926)) b!1010631))

(declare-fun m!934891 () Bool)

(assert (=> b!1010631 m!934891))

(assert (=> b!1010633 m!934891))

(assert (=> b!1010626 m!934891))

(declare-fun m!934893 () Bool)

(assert (=> d!120025 m!934893))

(assert (=> d!120025 m!934817))

(assert (=> b!1010628 m!934799))

(assert (=> b!1010628 m!934799))

(declare-fun m!934895 () Bool)

(assert (=> b!1010628 m!934895))

(assert (=> b!1010472 d!120025))

(declare-fun lt!446701 () SeekEntryResult!9574)

(declare-fun e!568596 () SeekEntryResult!9574)

(declare-fun b!1010715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63648 (_ BitVec 32)) SeekEntryResult!9574)

(assert (=> b!1010715 (= e!568596 (seekKeyOrZeroReturnVacant!0 (x!88066 lt!446701) (index!40669 lt!446701) (index!40669 lt!446701) k!2224 a!3219 mask!3464))))

(declare-fun b!1010716 () Bool)

(assert (=> b!1010716 (= e!568596 (MissingZero!9574 (index!40669 lt!446701)))))

(declare-fun b!1010717 () Bool)

(declare-fun e!568598 () SeekEntryResult!9574)

(declare-fun e!568597 () SeekEntryResult!9574)

(assert (=> b!1010717 (= e!568598 e!568597)))

(declare-fun lt!446702 () (_ BitVec 64))

(assert (=> b!1010717 (= lt!446702 (select (arr!30642 a!3219) (index!40669 lt!446701)))))

(declare-fun c!102038 () Bool)

(assert (=> b!1010717 (= c!102038 (= lt!446702 k!2224))))

(declare-fun d!120029 () Bool)

(declare-fun lt!446700 () SeekEntryResult!9574)

(assert (=> d!120029 (and (or (is-Undefined!9574 lt!446700) (not (is-Found!9574 lt!446700)) (and (bvsge (index!40668 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40668 lt!446700) (size!31144 a!3219)))) (or (is-Undefined!9574 lt!446700) (is-Found!9574 lt!446700) (not (is-MissingZero!9574 lt!446700)) (and (bvsge (index!40667 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40667 lt!446700) (size!31144 a!3219)))) (or (is-Undefined!9574 lt!446700) (is-Found!9574 lt!446700) (is-MissingZero!9574 lt!446700) (not (is-MissingVacant!9574 lt!446700)) (and (bvsge (index!40670 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40670 lt!446700) (size!31144 a!3219)))) (or (is-Undefined!9574 lt!446700) (ite (is-Found!9574 lt!446700) (= (select (arr!30642 a!3219) (index!40668 lt!446700)) k!2224) (ite (is-MissingZero!9574 lt!446700) (= (select (arr!30642 a!3219) (index!40667 lt!446700)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9574 lt!446700) (= (select (arr!30642 a!3219) (index!40670 lt!446700)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120029 (= lt!446700 e!568598)))

(declare-fun c!102037 () Bool)

(assert (=> d!120029 (= c!102037 (and (is-Intermediate!9574 lt!446701) (undefined!10386 lt!446701)))))

(assert (=> d!120029 (= lt!446701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!120029 (validMask!0 mask!3464)))

(assert (=> d!120029 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446700)))

(declare-fun b!1010718 () Bool)

(assert (=> b!1010718 (= e!568598 Undefined!9574)))

(declare-fun b!1010719 () Bool)

(assert (=> b!1010719 (= e!568597 (Found!9574 (index!40669 lt!446701)))))

(declare-fun b!1010720 () Bool)

(declare-fun c!102039 () Bool)

(assert (=> b!1010720 (= c!102039 (= lt!446702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010720 (= e!568597 e!568596)))

(assert (= (and d!120029 c!102037) b!1010718))

(assert (= (and d!120029 (not c!102037)) b!1010717))

(assert (= (and b!1010717 c!102038) b!1010719))

(assert (= (and b!1010717 (not c!102038)) b!1010720))

(assert (= (and b!1010720 c!102039) b!1010716))

(assert (= (and b!1010720 (not c!102039)) b!1010715))

(declare-fun m!934945 () Bool)

(assert (=> b!1010715 m!934945))

(declare-fun m!934947 () Bool)

(assert (=> b!1010717 m!934947))

(declare-fun m!934949 () Bool)

(assert (=> d!120029 m!934949))

(declare-fun m!934951 () Bool)

(assert (=> d!120029 m!934951))

(declare-fun m!934953 () Bool)

(assert (=> d!120029 m!934953))

(declare-fun m!934955 () Bool)

(assert (=> d!120029 m!934955))

(declare-fun m!934957 () Bool)

(assert (=> d!120029 m!934957))

(assert (=> d!120029 m!934953))

(assert (=> d!120029 m!934817))

(assert (=> b!1010475 d!120029))

(declare-fun d!120049 () Bool)

(declare-fun lt!446705 () (_ BitVec 32))

(assert (=> d!120049 (and (bvsge lt!446705 #b00000000000000000000000000000000) (bvslt lt!446705 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120049 (= lt!446705 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120049 (validMask!0 mask!3464)))

(assert (=> d!120049 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446705)))

(declare-fun bs!28727 () Bool)

(assert (= bs!28727 d!120049))

(declare-fun m!934959 () Bool)

(assert (=> bs!28727 m!934959))

(assert (=> bs!28727 m!934817))

(assert (=> b!1010476 d!120049))

(declare-fun b!1010731 () Bool)

(declare-fun e!568607 () Bool)

(declare-fun e!568609 () Bool)

(assert (=> b!1010731 (= e!568607 e!568609)))

(declare-fun c!102042 () Bool)

(assert (=> b!1010731 (= c!102042 (validKeyInArray!0 (select (arr!30642 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010732 () Bool)

(declare-fun e!568610 () Bool)

(assert (=> b!1010732 (= e!568610 e!568607)))

(declare-fun res!678967 () Bool)

(assert (=> b!1010732 (=> (not res!678967) (not e!568607))))

(declare-fun e!568608 () Bool)

(assert (=> b!1010732 (= res!678967 (not e!568608))))

(declare-fun res!678966 () Bool)

(assert (=> b!1010732 (=> (not res!678966) (not e!568608))))

(assert (=> b!1010732 (= res!678966 (validKeyInArray!0 (select (arr!30642 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42414 () Bool)

(declare-fun call!42417 () Bool)

(assert (=> bm!42414 (= call!42417 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102042 (Cons!21314 (select (arr!30642 a!3219) #b00000000000000000000000000000000) Nil!21315) Nil!21315)))))

(declare-fun b!1010733 () Bool)

(assert (=> b!1010733 (= e!568609 call!42417)))

(declare-fun d!120051 () Bool)

(declare-fun res!678968 () Bool)

(assert (=> d!120051 (=> res!678968 e!568610)))

(assert (=> d!120051 (= res!678968 (bvsge #b00000000000000000000000000000000 (size!31144 a!3219)))))

(assert (=> d!120051 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21315) e!568610)))

(declare-fun b!1010734 () Bool)

(declare-fun contains!5896 (List!21318 (_ BitVec 64)) Bool)

(assert (=> b!1010734 (= e!568608 (contains!5896 Nil!21315 (select (arr!30642 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010735 () Bool)

(assert (=> b!1010735 (= e!568609 call!42417)))

(assert (= (and d!120051 (not res!678968)) b!1010732))

(assert (= (and b!1010732 res!678966) b!1010734))

(assert (= (and b!1010732 res!678967) b!1010731))

(assert (= (and b!1010731 c!102042) b!1010735))

(assert (= (and b!1010731 (not c!102042)) b!1010733))

(assert (= (or b!1010735 b!1010733) bm!42414))

(declare-fun m!934961 () Bool)

(assert (=> b!1010731 m!934961))

(assert (=> b!1010731 m!934961))

(declare-fun m!934963 () Bool)

(assert (=> b!1010731 m!934963))

(assert (=> b!1010732 m!934961))

(assert (=> b!1010732 m!934961))

(assert (=> b!1010732 m!934963))

(assert (=> bm!42414 m!934961))

(declare-fun m!934965 () Bool)

(assert (=> bm!42414 m!934965))

(assert (=> b!1010734 m!934961))

(assert (=> b!1010734 m!934961))

(declare-fun m!934967 () Bool)

(assert (=> b!1010734 m!934967))

(assert (=> b!1010465 d!120051))

(declare-fun d!120053 () Bool)

(declare-fun res!678973 () Bool)

(declare-fun e!568615 () Bool)

(assert (=> d!120053 (=> res!678973 e!568615)))

(assert (=> d!120053 (= res!678973 (= (select (arr!30642 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!120053 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568615)))

(declare-fun b!1010740 () Bool)

(declare-fun e!568616 () Bool)

(assert (=> b!1010740 (= e!568615 e!568616)))

(declare-fun res!678974 () Bool)

(assert (=> b!1010740 (=> (not res!678974) (not e!568616))))

(assert (=> b!1010740 (= res!678974 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31144 a!3219)))))

(declare-fun b!1010741 () Bool)

(assert (=> b!1010741 (= e!568616 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120053 (not res!678973)) b!1010740))

(assert (= (and b!1010740 res!678974) b!1010741))

(assert (=> d!120053 m!934961))

(declare-fun m!934969 () Bool)

(assert (=> b!1010741 m!934969))

(assert (=> b!1010474 d!120053))

(declare-fun b!1010742 () Bool)

(declare-fun e!568621 () Bool)

(declare-fun e!568619 () Bool)

(assert (=> b!1010742 (= e!568621 e!568619)))

(declare-fun res!678975 () Bool)

(declare-fun lt!446707 () SeekEntryResult!9574)

(assert (=> b!1010742 (= res!678975 (and (is-Intermediate!9574 lt!446707) (not (undefined!10386 lt!446707)) (bvslt (x!88066 lt!446707) #b01111111111111111111111111111110) (bvsge (x!88066 lt!446707) #b00000000000000000000000000000000) (bvsge (x!88066 lt!446707) #b00000000000000000000000000000000)))))

(assert (=> b!1010742 (=> (not res!678975) (not e!568619))))

(declare-fun b!1010743 () Bool)

(assert (=> b!1010743 (and (bvsge (index!40669 lt!446707) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446707) (size!31144 a!3219)))))

(declare-fun res!678976 () Bool)

(assert (=> b!1010743 (= res!678976 (= (select (arr!30642 a!3219) (index!40669 lt!446707)) (select (arr!30642 a!3219) j!170)))))

(declare-fun e!568617 () Bool)

(assert (=> b!1010743 (=> res!678976 e!568617)))

(assert (=> b!1010743 (= e!568619 e!568617)))

(declare-fun b!1010744 () Bool)

(assert (=> b!1010744 (= e!568621 (bvsge (x!88066 lt!446707) #b01111111111111111111111111111110))))

(declare-fun d!120055 () Bool)

(assert (=> d!120055 e!568621))

(declare-fun c!102044 () Bool)

(assert (=> d!120055 (= c!102044 (and (is-Intermediate!9574 lt!446707) (undefined!10386 lt!446707)))))

(declare-fun e!568620 () SeekEntryResult!9574)

(assert (=> d!120055 (= lt!446707 e!568620)))

(declare-fun c!102043 () Bool)

(assert (=> d!120055 (= c!102043 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446706 () (_ BitVec 64))

(assert (=> d!120055 (= lt!446706 (select (arr!30642 a!3219) (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464)))))

(assert (=> d!120055 (validMask!0 mask!3464)))

(assert (=> d!120055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) (select (arr!30642 a!3219) j!170) a!3219 mask!3464) lt!446707)))

(declare-fun b!1010745 () Bool)

(declare-fun e!568618 () SeekEntryResult!9574)

(assert (=> b!1010745 (= e!568618 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30642 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010746 () Bool)

(assert (=> b!1010746 (= e!568618 (Intermediate!9574 false (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010747 () Bool)

(assert (=> b!1010747 (= e!568620 (Intermediate!9574 true (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010748 () Bool)

(assert (=> b!1010748 (and (bvsge (index!40669 lt!446707) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446707) (size!31144 a!3219)))))

(assert (=> b!1010748 (= e!568617 (= (select (arr!30642 a!3219) (index!40669 lt!446707)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010749 () Bool)

(assert (=> b!1010749 (= e!568620 e!568618)))

(declare-fun c!102045 () Bool)

(assert (=> b!1010749 (= c!102045 (or (= lt!446706 (select (arr!30642 a!3219) j!170)) (= (bvadd lt!446706 lt!446706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010750 () Bool)

(assert (=> b!1010750 (and (bvsge (index!40669 lt!446707) #b00000000000000000000000000000000) (bvslt (index!40669 lt!446707) (size!31144 a!3219)))))

(declare-fun res!678977 () Bool)

(assert (=> b!1010750 (= res!678977 (= (select (arr!30642 a!3219) (index!40669 lt!446707)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010750 (=> res!678977 e!568617)))

(assert (= (and d!120055 c!102043) b!1010747))

(assert (= (and d!120055 (not c!102043)) b!1010749))

(assert (= (and b!1010749 c!102045) b!1010746))

(assert (= (and b!1010749 (not c!102045)) b!1010745))

(assert (= (and d!120055 c!102044) b!1010744))

(assert (= (and d!120055 (not c!102044)) b!1010742))

(assert (= (and b!1010742 res!678975) b!1010743))

(assert (= (and b!1010743 (not res!678976)) b!1010750))

(assert (= (and b!1010750 (not res!678977)) b!1010748))

(declare-fun m!934971 () Bool)

(assert (=> b!1010748 m!934971))

(assert (=> b!1010750 m!934971))

(assert (=> b!1010743 m!934971))

(assert (=> d!120055 m!934811))

(declare-fun m!934973 () Bool)

(assert (=> d!120055 m!934973))

(assert (=> d!120055 m!934817))

(assert (=> b!1010745 m!934811))

(declare-fun m!934975 () Bool)

(assert (=> b!1010745 m!934975))

(assert (=> b!1010745 m!934975))

(assert (=> b!1010745 m!934801))

(declare-fun m!934977 () Bool)

(assert (=> b!1010745 m!934977))

(assert (=> b!1010463 d!120055))

(declare-fun d!120057 () Bool)

(declare-fun lt!446719 () (_ BitVec 32))

(declare-fun lt!446718 () (_ BitVec 32))

(assert (=> d!120057 (= lt!446719 (bvmul (bvxor lt!446718 (bvlshr lt!446718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120057 (= lt!446718 ((_ extract 31 0) (bvand (bvxor (select (arr!30642 a!3219) j!170) (bvlshr (select (arr!30642 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120057 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678978 (let ((h!22509 ((_ extract 31 0) (bvand (bvxor (select (arr!30642 a!3219) j!170) (bvlshr (select (arr!30642 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88075 (bvmul (bvxor h!22509 (bvlshr h!22509 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88075 (bvlshr x!88075 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678978 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678978 #b00000000000000000000000000000000))))))

(assert (=> d!120057 (= (toIndex!0 (select (arr!30642 a!3219) j!170) mask!3464) (bvand (bvxor lt!446719 (bvlshr lt!446719 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010463 d!120057))

(declare-fun d!120059 () Bool)

(assert (=> d!120059 (= (validKeyInArray!0 (select (arr!30642 a!3219) j!170)) (and (not (= (select (arr!30642 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30642 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010464 d!120059))

(declare-fun d!120061 () Bool)

(assert (=> d!120061 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010468 d!120061))

(declare-fun bm!42417 () Bool)

(declare-fun call!42420 () Bool)

(assert (=> bm!42417 (= call!42420 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

