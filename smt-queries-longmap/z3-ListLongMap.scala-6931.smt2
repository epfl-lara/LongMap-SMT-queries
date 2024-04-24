; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87436 () Bool)

(assert start!87436)

(declare-fun res!679698 () Bool)

(declare-fun e!569606 () Bool)

(assert (=> start!87436 (=> (not res!679698) (not e!569606))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87436 (= res!679698 (validMask!0 mask!3464))))

(assert (=> start!87436 e!569606))

(declare-datatypes ((array!63708 0))(
  ( (array!63709 (arr!30664 (Array (_ BitVec 32) (_ BitVec 64))) (size!31167 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63708)

(declare-fun array_inv!23800 (array!63708) Bool)

(assert (=> start!87436 (array_inv!23800 a!3219)))

(assert (=> start!87436 true))

(declare-fun b!1012321 () Bool)

(declare-fun res!679700 () Bool)

(assert (=> b!1012321 (=> (not res!679700) (not e!569606))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1012321 (= res!679700 (and (= (size!31167 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31167 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31167 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1012322 () Bool)

(declare-fun e!569607 () Bool)

(assert (=> b!1012322 (= e!569606 e!569607)))

(declare-fun res!679690 () Bool)

(assert (=> b!1012322 (=> (not res!679690) (not e!569607))))

(declare-datatypes ((SeekEntryResult!9532 0))(
  ( (MissingZero!9532 (index!40499 (_ BitVec 32))) (Found!9532 (index!40500 (_ BitVec 32))) (Intermediate!9532 (undefined!10344 Bool) (index!40501 (_ BitVec 32)) (x!88071 (_ BitVec 32))) (Undefined!9532) (MissingVacant!9532 (index!40502 (_ BitVec 32))) )
))
(declare-fun lt!447357 () SeekEntryResult!9532)

(assert (=> b!1012322 (= res!679690 (or (= lt!447357 (MissingVacant!9532 i!1194)) (= lt!447357 (MissingZero!9532 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63708 (_ BitVec 32)) SeekEntryResult!9532)

(assert (=> b!1012322 (= lt!447357 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1012323 () Bool)

(declare-fun res!679697 () Bool)

(assert (=> b!1012323 (=> (not res!679697) (not e!569607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63708 (_ BitVec 32)) Bool)

(assert (=> b!1012323 (= res!679697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1012324 () Bool)

(declare-fun res!679693 () Bool)

(assert (=> b!1012324 (=> (not res!679693) (not e!569607))))

(declare-datatypes ((List!21311 0))(
  ( (Nil!21308) (Cons!21307 (h!22511 (_ BitVec 64)) (t!30304 List!21311)) )
))
(declare-fun arrayNoDuplicates!0 (array!63708 (_ BitVec 32) List!21311) Bool)

(assert (=> b!1012324 (= res!679693 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21308))))

(declare-fun b!1012325 () Bool)

(declare-fun e!569600 () Bool)

(declare-fun e!569604 () Bool)

(assert (=> b!1012325 (= e!569600 e!569604)))

(declare-fun res!679692 () Bool)

(assert (=> b!1012325 (=> (not res!679692) (not e!569604))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!447358 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1012325 (= res!679692 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447358 #b00000000000000000000000000000000) (bvslt lt!447358 (size!31167 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012325 (= lt!447358 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1012326 () Bool)

(declare-fun res!679691 () Bool)

(assert (=> b!1012326 (=> (not res!679691) (not e!569600))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1012326 (= res!679691 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1012327 () Bool)

(declare-fun e!569605 () Bool)

(assert (=> b!1012327 (= e!569605 e!569600)))

(declare-fun res!679696 () Bool)

(assert (=> b!1012327 (=> (not res!679696) (not e!569600))))

(declare-fun lt!447355 () array!63708)

(declare-fun lt!447354 () SeekEntryResult!9532)

(declare-fun lt!447352 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63708 (_ BitVec 32)) SeekEntryResult!9532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012327 (= res!679696 (not (= lt!447354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447352 mask!3464) lt!447352 lt!447355 mask!3464))))))

(assert (=> b!1012327 (= lt!447352 (select (store (arr!30664 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1012327 (= lt!447355 (array!63709 (store (arr!30664 a!3219) i!1194 k0!2224) (size!31167 a!3219)))))

(declare-fun b!1012328 () Bool)

(declare-fun e!569603 () Bool)

(assert (=> b!1012328 (= e!569604 e!569603)))

(declare-fun res!679694 () Bool)

(assert (=> b!1012328 (=> (not res!679694) (not e!569603))))

(declare-fun lt!447359 () SeekEntryResult!9532)

(declare-fun lt!447356 () SeekEntryResult!9532)

(assert (=> b!1012328 (= res!679694 (= lt!447359 lt!447356))))

(assert (=> b!1012328 (= lt!447359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447358 (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012329 () Bool)

(declare-fun e!569601 () Bool)

(assert (=> b!1012329 (= e!569601 e!569605)))

(declare-fun res!679688 () Bool)

(assert (=> b!1012329 (=> (not res!679688) (not e!569605))))

(declare-fun lt!447353 () SeekEntryResult!9532)

(assert (=> b!1012329 (= res!679688 (= lt!447353 lt!447356))))

(assert (=> b!1012329 (= lt!447353 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012330 () Bool)

(declare-fun res!679687 () Bool)

(assert (=> b!1012330 (=> (not res!679687) (not e!569606))))

(declare-fun arrayContainsKey!0 (array!63708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1012330 (= res!679687 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1012331 () Bool)

(declare-fun res!679686 () Bool)

(assert (=> b!1012331 (=> (not res!679686) (not e!569606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1012331 (= res!679686 (validKeyInArray!0 k0!2224))))

(declare-fun b!1012332 () Bool)

(assert (=> b!1012332 (= e!569607 e!569601)))

(declare-fun res!679695 () Bool)

(assert (=> b!1012332 (=> (not res!679695) (not e!569601))))

(assert (=> b!1012332 (= res!679695 (= lt!447354 lt!447356))))

(assert (=> b!1012332 (= lt!447356 (Intermediate!9532 false resIndex!38 resX!38))))

(assert (=> b!1012332 (= lt!447354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012333 () Bool)

(declare-fun res!679689 () Bool)

(assert (=> b!1012333 (=> (not res!679689) (not e!569607))))

(assert (=> b!1012333 (= res!679689 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31167 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31167 a!3219))))))

(declare-fun b!1012334 () Bool)

(declare-fun res!679699 () Bool)

(assert (=> b!1012334 (=> (not res!679699) (not e!569600))))

(assert (=> b!1012334 (= res!679699 (not (= lt!447353 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447352 lt!447355 mask!3464))))))

(declare-fun b!1012335 () Bool)

(assert (=> b!1012335 (= e!569603 (= lt!447359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447358 lt!447352 lt!447355 mask!3464)))))

(declare-fun b!1012336 () Bool)

(declare-fun res!679685 () Bool)

(assert (=> b!1012336 (=> (not res!679685) (not e!569606))))

(assert (=> b!1012336 (= res!679685 (validKeyInArray!0 (select (arr!30664 a!3219) j!170)))))

(assert (= (and start!87436 res!679698) b!1012321))

(assert (= (and b!1012321 res!679700) b!1012336))

(assert (= (and b!1012336 res!679685) b!1012331))

(assert (= (and b!1012331 res!679686) b!1012330))

(assert (= (and b!1012330 res!679687) b!1012322))

(assert (= (and b!1012322 res!679690) b!1012323))

(assert (= (and b!1012323 res!679697) b!1012324))

(assert (= (and b!1012324 res!679693) b!1012333))

(assert (= (and b!1012333 res!679689) b!1012332))

(assert (= (and b!1012332 res!679695) b!1012329))

(assert (= (and b!1012329 res!679688) b!1012327))

(assert (= (and b!1012327 res!679696) b!1012334))

(assert (= (and b!1012334 res!679699) b!1012326))

(assert (= (and b!1012326 res!679691) b!1012325))

(assert (= (and b!1012325 res!679692) b!1012328))

(assert (= (and b!1012328 res!679694) b!1012335))

(declare-fun m!936785 () Bool)

(assert (=> b!1012322 m!936785))

(declare-fun m!936787 () Bool)

(assert (=> b!1012336 m!936787))

(assert (=> b!1012336 m!936787))

(declare-fun m!936789 () Bool)

(assert (=> b!1012336 m!936789))

(declare-fun m!936791 () Bool)

(assert (=> b!1012323 m!936791))

(declare-fun m!936793 () Bool)

(assert (=> b!1012327 m!936793))

(assert (=> b!1012327 m!936793))

(declare-fun m!936795 () Bool)

(assert (=> b!1012327 m!936795))

(declare-fun m!936797 () Bool)

(assert (=> b!1012327 m!936797))

(declare-fun m!936799 () Bool)

(assert (=> b!1012327 m!936799))

(assert (=> b!1012329 m!936787))

(assert (=> b!1012329 m!936787))

(declare-fun m!936801 () Bool)

(assert (=> b!1012329 m!936801))

(declare-fun m!936803 () Bool)

(assert (=> b!1012334 m!936803))

(declare-fun m!936805 () Bool)

(assert (=> b!1012325 m!936805))

(declare-fun m!936807 () Bool)

(assert (=> b!1012324 m!936807))

(assert (=> b!1012328 m!936787))

(assert (=> b!1012328 m!936787))

(declare-fun m!936809 () Bool)

(assert (=> b!1012328 m!936809))

(assert (=> b!1012332 m!936787))

(assert (=> b!1012332 m!936787))

(declare-fun m!936811 () Bool)

(assert (=> b!1012332 m!936811))

(assert (=> b!1012332 m!936811))

(assert (=> b!1012332 m!936787))

(declare-fun m!936813 () Bool)

(assert (=> b!1012332 m!936813))

(declare-fun m!936815 () Bool)

(assert (=> start!87436 m!936815))

(declare-fun m!936817 () Bool)

(assert (=> start!87436 m!936817))

(declare-fun m!936819 () Bool)

(assert (=> b!1012335 m!936819))

(declare-fun m!936821 () Bool)

(assert (=> b!1012331 m!936821))

(declare-fun m!936823 () Bool)

(assert (=> b!1012330 m!936823))

(check-sat (not start!87436) (not b!1012325) (not b!1012336) (not b!1012322) (not b!1012328) (not b!1012334) (not b!1012329) (not b!1012330) (not b!1012324) (not b!1012331) (not b!1012335) (not b!1012332) (not b!1012323) (not b!1012327))
(check-sat)
(get-model)

(declare-fun b!1012451 () Bool)

(declare-fun e!569670 () SeekEntryResult!9532)

(declare-fun e!569668 () SeekEntryResult!9532)

(assert (=> b!1012451 (= e!569670 e!569668)))

(declare-fun c!102492 () Bool)

(declare-fun lt!447412 () (_ BitVec 64))

(assert (=> b!1012451 (= c!102492 (or (= lt!447412 lt!447352) (= (bvadd lt!447412 lt!447412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012452 () Bool)

(assert (=> b!1012452 (= e!569668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!447358 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) mask!3464) lt!447352 lt!447355 mask!3464))))

(declare-fun b!1012453 () Bool)

(declare-fun e!569666 () Bool)

(declare-fun e!569669 () Bool)

(assert (=> b!1012453 (= e!569666 e!569669)))

(declare-fun res!679804 () Bool)

(declare-fun lt!447413 () SeekEntryResult!9532)

(get-info :version)

(assert (=> b!1012453 (= res!679804 (and ((_ is Intermediate!9532) lt!447413) (not (undefined!10344 lt!447413)) (bvslt (x!88071 lt!447413) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447413) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447413) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1012453 (=> (not res!679804) (not e!569669))))

(declare-fun b!1012454 () Bool)

(assert (=> b!1012454 (= e!569670 (Intermediate!9532 true lt!447358 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1012455 () Bool)

(assert (=> b!1012455 (and (bvsge (index!40501 lt!447413) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447413) (size!31167 lt!447355)))))

(declare-fun e!569667 () Bool)

(assert (=> b!1012455 (= e!569667 (= (select (arr!30664 lt!447355) (index!40501 lt!447413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012456 () Bool)

(assert (=> b!1012456 (and (bvsge (index!40501 lt!447413) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447413) (size!31167 lt!447355)))))

(declare-fun res!679803 () Bool)

(assert (=> b!1012456 (= res!679803 (= (select (arr!30664 lt!447355) (index!40501 lt!447413)) lt!447352))))

(assert (=> b!1012456 (=> res!679803 e!569667)))

(assert (=> b!1012456 (= e!569669 e!569667)))

(declare-fun b!1012457 () Bool)

(assert (=> b!1012457 (= e!569666 (bvsge (x!88071 lt!447413) #b01111111111111111111111111111110))))

(declare-fun b!1012458 () Bool)

(assert (=> b!1012458 (and (bvsge (index!40501 lt!447413) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447413) (size!31167 lt!447355)))))

(declare-fun res!679805 () Bool)

(assert (=> b!1012458 (= res!679805 (= (select (arr!30664 lt!447355) (index!40501 lt!447413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012458 (=> res!679805 e!569667)))

(declare-fun b!1012459 () Bool)

(assert (=> b!1012459 (= e!569668 (Intermediate!9532 false lt!447358 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun d!120561 () Bool)

(assert (=> d!120561 e!569666))

(declare-fun c!102491 () Bool)

(assert (=> d!120561 (= c!102491 (and ((_ is Intermediate!9532) lt!447413) (undefined!10344 lt!447413)))))

(assert (=> d!120561 (= lt!447413 e!569670)))

(declare-fun c!102493 () Bool)

(assert (=> d!120561 (= c!102493 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120561 (= lt!447412 (select (arr!30664 lt!447355) lt!447358))))

(assert (=> d!120561 (validMask!0 mask!3464)))

(assert (=> d!120561 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447358 lt!447352 lt!447355 mask!3464) lt!447413)))

(assert (= (and d!120561 c!102493) b!1012454))

(assert (= (and d!120561 (not c!102493)) b!1012451))

(assert (= (and b!1012451 c!102492) b!1012459))

(assert (= (and b!1012451 (not c!102492)) b!1012452))

(assert (= (and d!120561 c!102491) b!1012457))

(assert (= (and d!120561 (not c!102491)) b!1012453))

(assert (= (and b!1012453 res!679804) b!1012456))

(assert (= (and b!1012456 (not res!679803)) b!1012458))

(assert (= (and b!1012458 (not res!679805)) b!1012455))

(declare-fun m!936905 () Bool)

(assert (=> b!1012456 m!936905))

(declare-fun m!936907 () Bool)

(assert (=> b!1012452 m!936907))

(assert (=> b!1012452 m!936907))

(declare-fun m!936909 () Bool)

(assert (=> b!1012452 m!936909))

(assert (=> b!1012455 m!936905))

(declare-fun m!936911 () Bool)

(assert (=> d!120561 m!936911))

(assert (=> d!120561 m!936815))

(assert (=> b!1012458 m!936905))

(assert (=> b!1012335 d!120561))

(declare-fun d!120563 () Bool)

(assert (=> d!120563 (= (validKeyInArray!0 (select (arr!30664 a!3219) j!170)) (and (not (= (select (arr!30664 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30664 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1012336 d!120563))

(declare-fun d!120565 () Bool)

(declare-fun lt!447416 () (_ BitVec 32))

(assert (=> d!120565 (and (bvsge lt!447416 #b00000000000000000000000000000000) (bvslt lt!447416 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120565 (= lt!447416 (choose!52 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(assert (=> d!120565 (validMask!0 mask!3464)))

(assert (=> d!120565 (= (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!447416)))

(declare-fun bs!28754 () Bool)

(assert (= bs!28754 d!120565))

(declare-fun m!936913 () Bool)

(assert (=> bs!28754 m!936913))

(assert (=> bs!28754 m!936815))

(assert (=> b!1012325 d!120565))

(declare-fun b!1012460 () Bool)

(declare-fun e!569675 () SeekEntryResult!9532)

(declare-fun e!569673 () SeekEntryResult!9532)

(assert (=> b!1012460 (= e!569675 e!569673)))

(declare-fun c!102495 () Bool)

(declare-fun lt!447417 () (_ BitVec 64))

(assert (=> b!1012460 (= c!102495 (or (= lt!447417 lt!447352) (= (bvadd lt!447417 lt!447417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012461 () Bool)

(assert (=> b!1012461 (= e!569673 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!447352 lt!447355 mask!3464))))

(declare-fun b!1012462 () Bool)

(declare-fun e!569671 () Bool)

(declare-fun e!569674 () Bool)

(assert (=> b!1012462 (= e!569671 e!569674)))

(declare-fun res!679807 () Bool)

(declare-fun lt!447418 () SeekEntryResult!9532)

(assert (=> b!1012462 (= res!679807 (and ((_ is Intermediate!9532) lt!447418) (not (undefined!10344 lt!447418)) (bvslt (x!88071 lt!447418) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447418) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447418) x!1245)))))

(assert (=> b!1012462 (=> (not res!679807) (not e!569674))))

(declare-fun b!1012463 () Bool)

(assert (=> b!1012463 (= e!569675 (Intermediate!9532 true index!1507 x!1245))))

(declare-fun b!1012464 () Bool)

(assert (=> b!1012464 (and (bvsge (index!40501 lt!447418) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447418) (size!31167 lt!447355)))))

(declare-fun e!569672 () Bool)

(assert (=> b!1012464 (= e!569672 (= (select (arr!30664 lt!447355) (index!40501 lt!447418)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012465 () Bool)

(assert (=> b!1012465 (and (bvsge (index!40501 lt!447418) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447418) (size!31167 lt!447355)))))

(declare-fun res!679806 () Bool)

(assert (=> b!1012465 (= res!679806 (= (select (arr!30664 lt!447355) (index!40501 lt!447418)) lt!447352))))

(assert (=> b!1012465 (=> res!679806 e!569672)))

(assert (=> b!1012465 (= e!569674 e!569672)))

(declare-fun b!1012466 () Bool)

(assert (=> b!1012466 (= e!569671 (bvsge (x!88071 lt!447418) #b01111111111111111111111111111110))))

(declare-fun b!1012467 () Bool)

(assert (=> b!1012467 (and (bvsge (index!40501 lt!447418) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447418) (size!31167 lt!447355)))))

(declare-fun res!679808 () Bool)

(assert (=> b!1012467 (= res!679808 (= (select (arr!30664 lt!447355) (index!40501 lt!447418)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012467 (=> res!679808 e!569672)))

(declare-fun b!1012468 () Bool)

(assert (=> b!1012468 (= e!569673 (Intermediate!9532 false index!1507 x!1245))))

(declare-fun d!120567 () Bool)

(assert (=> d!120567 e!569671))

(declare-fun c!102494 () Bool)

(assert (=> d!120567 (= c!102494 (and ((_ is Intermediate!9532) lt!447418) (undefined!10344 lt!447418)))))

(assert (=> d!120567 (= lt!447418 e!569675)))

(declare-fun c!102496 () Bool)

(assert (=> d!120567 (= c!102496 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120567 (= lt!447417 (select (arr!30664 lt!447355) index!1507))))

(assert (=> d!120567 (validMask!0 mask!3464)))

(assert (=> d!120567 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447352 lt!447355 mask!3464) lt!447418)))

(assert (= (and d!120567 c!102496) b!1012463))

(assert (= (and d!120567 (not c!102496)) b!1012460))

(assert (= (and b!1012460 c!102495) b!1012468))

(assert (= (and b!1012460 (not c!102495)) b!1012461))

(assert (= (and d!120567 c!102494) b!1012466))

(assert (= (and d!120567 (not c!102494)) b!1012462))

(assert (= (and b!1012462 res!679807) b!1012465))

(assert (= (and b!1012465 (not res!679806)) b!1012467))

(assert (= (and b!1012467 (not res!679808)) b!1012464))

(declare-fun m!936915 () Bool)

(assert (=> b!1012465 m!936915))

(declare-fun m!936917 () Bool)

(assert (=> b!1012461 m!936917))

(assert (=> b!1012461 m!936917))

(declare-fun m!936919 () Bool)

(assert (=> b!1012461 m!936919))

(assert (=> b!1012464 m!936915))

(declare-fun m!936921 () Bool)

(assert (=> d!120567 m!936921))

(assert (=> d!120567 m!936815))

(assert (=> b!1012467 m!936915))

(assert (=> b!1012334 d!120567))

(declare-fun b!1012477 () Bool)

(declare-fun e!569683 () Bool)

(declare-fun call!42493 () Bool)

(assert (=> b!1012477 (= e!569683 call!42493)))

(declare-fun b!1012478 () Bool)

(declare-fun e!569682 () Bool)

(assert (=> b!1012478 (= e!569682 e!569683)))

(declare-fun c!102499 () Bool)

(assert (=> b!1012478 (= c!102499 (validKeyInArray!0 (select (arr!30664 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1012479 () Bool)

(declare-fun e!569684 () Bool)

(assert (=> b!1012479 (= e!569684 call!42493)))

(declare-fun bm!42490 () Bool)

(assert (=> bm!42490 (= call!42493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1012480 () Bool)

(assert (=> b!1012480 (= e!569683 e!569684)))

(declare-fun lt!447426 () (_ BitVec 64))

(assert (=> b!1012480 (= lt!447426 (select (arr!30664 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33021 0))(
  ( (Unit!33022) )
))
(declare-fun lt!447427 () Unit!33021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63708 (_ BitVec 64) (_ BitVec 32)) Unit!33021)

(assert (=> b!1012480 (= lt!447427 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!447426 #b00000000000000000000000000000000))))

(assert (=> b!1012480 (arrayContainsKey!0 a!3219 lt!447426 #b00000000000000000000000000000000)))

(declare-fun lt!447425 () Unit!33021)

(assert (=> b!1012480 (= lt!447425 lt!447427)))

(declare-fun res!679814 () Bool)

(assert (=> b!1012480 (= res!679814 (= (seekEntryOrOpen!0 (select (arr!30664 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9532 #b00000000000000000000000000000000)))))

(assert (=> b!1012480 (=> (not res!679814) (not e!569684))))

(declare-fun d!120569 () Bool)

(declare-fun res!679813 () Bool)

(assert (=> d!120569 (=> res!679813 e!569682)))

(assert (=> d!120569 (= res!679813 (bvsge #b00000000000000000000000000000000 (size!31167 a!3219)))))

(assert (=> d!120569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!569682)))

(assert (= (and d!120569 (not res!679813)) b!1012478))

(assert (= (and b!1012478 c!102499) b!1012480))

(assert (= (and b!1012478 (not c!102499)) b!1012477))

(assert (= (and b!1012480 res!679814) b!1012479))

(assert (= (or b!1012479 b!1012477) bm!42490))

(declare-fun m!936923 () Bool)

(assert (=> b!1012478 m!936923))

(assert (=> b!1012478 m!936923))

(declare-fun m!936925 () Bool)

(assert (=> b!1012478 m!936925))

(declare-fun m!936927 () Bool)

(assert (=> bm!42490 m!936927))

(assert (=> b!1012480 m!936923))

(declare-fun m!936929 () Bool)

(assert (=> b!1012480 m!936929))

(declare-fun m!936931 () Bool)

(assert (=> b!1012480 m!936931))

(assert (=> b!1012480 m!936923))

(declare-fun m!936933 () Bool)

(assert (=> b!1012480 m!936933))

(assert (=> b!1012323 d!120569))

(declare-fun b!1012491 () Bool)

(declare-fun e!569695 () Bool)

(declare-fun call!42496 () Bool)

(assert (=> b!1012491 (= e!569695 call!42496)))

(declare-fun b!1012492 () Bool)

(declare-fun e!569696 () Bool)

(declare-fun contains!5917 (List!21311 (_ BitVec 64)) Bool)

(assert (=> b!1012492 (= e!569696 (contains!5917 Nil!21308 (select (arr!30664 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42493 () Bool)

(declare-fun c!102502 () Bool)

(assert (=> bm!42493 (= call!42496 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102502 (Cons!21307 (select (arr!30664 a!3219) #b00000000000000000000000000000000) Nil!21308) Nil!21308)))))

(declare-fun b!1012493 () Bool)

(declare-fun e!569693 () Bool)

(declare-fun e!569694 () Bool)

(assert (=> b!1012493 (= e!569693 e!569694)))

(declare-fun res!679821 () Bool)

(assert (=> b!1012493 (=> (not res!679821) (not e!569694))))

(assert (=> b!1012493 (= res!679821 (not e!569696))))

(declare-fun res!679823 () Bool)

(assert (=> b!1012493 (=> (not res!679823) (not e!569696))))

(assert (=> b!1012493 (= res!679823 (validKeyInArray!0 (select (arr!30664 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1012494 () Bool)

(assert (=> b!1012494 (= e!569694 e!569695)))

(assert (=> b!1012494 (= c!102502 (validKeyInArray!0 (select (arr!30664 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120571 () Bool)

(declare-fun res!679822 () Bool)

(assert (=> d!120571 (=> res!679822 e!569693)))

(assert (=> d!120571 (= res!679822 (bvsge #b00000000000000000000000000000000 (size!31167 a!3219)))))

(assert (=> d!120571 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21308) e!569693)))

(declare-fun b!1012495 () Bool)

(assert (=> b!1012495 (= e!569695 call!42496)))

(assert (= (and d!120571 (not res!679822)) b!1012493))

(assert (= (and b!1012493 res!679823) b!1012492))

(assert (= (and b!1012493 res!679821) b!1012494))

(assert (= (and b!1012494 c!102502) b!1012495))

(assert (= (and b!1012494 (not c!102502)) b!1012491))

(assert (= (or b!1012495 b!1012491) bm!42493))

(assert (=> b!1012492 m!936923))

(assert (=> b!1012492 m!936923))

(declare-fun m!936935 () Bool)

(assert (=> b!1012492 m!936935))

(assert (=> bm!42493 m!936923))

(declare-fun m!936937 () Bool)

(assert (=> bm!42493 m!936937))

(assert (=> b!1012493 m!936923))

(assert (=> b!1012493 m!936923))

(assert (=> b!1012493 m!936925))

(assert (=> b!1012494 m!936923))

(assert (=> b!1012494 m!936923))

(assert (=> b!1012494 m!936925))

(assert (=> b!1012324 d!120571))

(declare-fun b!1012562 () Bool)

(declare-fun e!569735 () SeekEntryResult!9532)

(declare-fun lt!447448 () SeekEntryResult!9532)

(assert (=> b!1012562 (= e!569735 (Found!9532 (index!40501 lt!447448)))))

(declare-fun b!1012563 () Bool)

(declare-fun e!569734 () SeekEntryResult!9532)

(assert (=> b!1012563 (= e!569734 (MissingZero!9532 (index!40501 lt!447448)))))

(declare-fun d!120577 () Bool)

(declare-fun lt!447446 () SeekEntryResult!9532)

(assert (=> d!120577 (and (or ((_ is Undefined!9532) lt!447446) (not ((_ is Found!9532) lt!447446)) (and (bvsge (index!40500 lt!447446) #b00000000000000000000000000000000) (bvslt (index!40500 lt!447446) (size!31167 a!3219)))) (or ((_ is Undefined!9532) lt!447446) ((_ is Found!9532) lt!447446) (not ((_ is MissingZero!9532) lt!447446)) (and (bvsge (index!40499 lt!447446) #b00000000000000000000000000000000) (bvslt (index!40499 lt!447446) (size!31167 a!3219)))) (or ((_ is Undefined!9532) lt!447446) ((_ is Found!9532) lt!447446) ((_ is MissingZero!9532) lt!447446) (not ((_ is MissingVacant!9532) lt!447446)) (and (bvsge (index!40502 lt!447446) #b00000000000000000000000000000000) (bvslt (index!40502 lt!447446) (size!31167 a!3219)))) (or ((_ is Undefined!9532) lt!447446) (ite ((_ is Found!9532) lt!447446) (= (select (arr!30664 a!3219) (index!40500 lt!447446)) k0!2224) (ite ((_ is MissingZero!9532) lt!447446) (= (select (arr!30664 a!3219) (index!40499 lt!447446)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9532) lt!447446) (= (select (arr!30664 a!3219) (index!40502 lt!447446)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!569733 () SeekEntryResult!9532)

(assert (=> d!120577 (= lt!447446 e!569733)))

(declare-fun c!102528 () Bool)

(assert (=> d!120577 (= c!102528 (and ((_ is Intermediate!9532) lt!447448) (undefined!10344 lt!447448)))))

(assert (=> d!120577 (= lt!447448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120577 (validMask!0 mask!3464)))

(assert (=> d!120577 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!447446)))

(declare-fun b!1012564 () Bool)

(assert (=> b!1012564 (= e!569733 Undefined!9532)))

(declare-fun b!1012565 () Bool)

(assert (=> b!1012565 (= e!569733 e!569735)))

(declare-fun lt!447447 () (_ BitVec 64))

(assert (=> b!1012565 (= lt!447447 (select (arr!30664 a!3219) (index!40501 lt!447448)))))

(declare-fun c!102529 () Bool)

(assert (=> b!1012565 (= c!102529 (= lt!447447 k0!2224))))

(declare-fun b!1012566 () Bool)

(declare-fun c!102527 () Bool)

(assert (=> b!1012566 (= c!102527 (= lt!447447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012566 (= e!569735 e!569734)))

(declare-fun b!1012567 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63708 (_ BitVec 32)) SeekEntryResult!9532)

(assert (=> b!1012567 (= e!569734 (seekKeyOrZeroReturnVacant!0 (x!88071 lt!447448) (index!40501 lt!447448) (index!40501 lt!447448) k0!2224 a!3219 mask!3464))))

(assert (= (and d!120577 c!102528) b!1012564))

(assert (= (and d!120577 (not c!102528)) b!1012565))

(assert (= (and b!1012565 c!102529) b!1012562))

(assert (= (and b!1012565 (not c!102529)) b!1012566))

(assert (= (and b!1012566 c!102527) b!1012563))

(assert (= (and b!1012566 (not c!102527)) b!1012567))

(declare-fun m!936955 () Bool)

(assert (=> d!120577 m!936955))

(declare-fun m!936957 () Bool)

(assert (=> d!120577 m!936957))

(assert (=> d!120577 m!936955))

(declare-fun m!936959 () Bool)

(assert (=> d!120577 m!936959))

(assert (=> d!120577 m!936815))

(declare-fun m!936961 () Bool)

(assert (=> d!120577 m!936961))

(declare-fun m!936963 () Bool)

(assert (=> d!120577 m!936963))

(declare-fun m!936965 () Bool)

(assert (=> b!1012565 m!936965))

(declare-fun m!936967 () Bool)

(assert (=> b!1012567 m!936967))

(assert (=> b!1012322 d!120577))

(declare-fun d!120583 () Bool)

(assert (=> d!120583 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1012331 d!120583))

(declare-fun b!1012568 () Bool)

(declare-fun e!569740 () SeekEntryResult!9532)

(declare-fun e!569738 () SeekEntryResult!9532)

(assert (=> b!1012568 (= e!569740 e!569738)))

(declare-fun lt!447449 () (_ BitVec 64))

(declare-fun c!102531 () Bool)

(assert (=> b!1012568 (= c!102531 (or (= lt!447449 (select (arr!30664 a!3219) j!170)) (= (bvadd lt!447449 lt!447449) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012569 () Bool)

(assert (=> b!1012569 (= e!569738 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012570 () Bool)

(declare-fun e!569736 () Bool)

(declare-fun e!569739 () Bool)

(assert (=> b!1012570 (= e!569736 e!569739)))

(declare-fun res!679844 () Bool)

(declare-fun lt!447450 () SeekEntryResult!9532)

(assert (=> b!1012570 (= res!679844 (and ((_ is Intermediate!9532) lt!447450) (not (undefined!10344 lt!447450)) (bvslt (x!88071 lt!447450) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447450) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447450) #b00000000000000000000000000000000)))))

(assert (=> b!1012570 (=> (not res!679844) (not e!569739))))

(declare-fun b!1012571 () Bool)

(assert (=> b!1012571 (= e!569740 (Intermediate!9532 true (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1012572 () Bool)

(assert (=> b!1012572 (and (bvsge (index!40501 lt!447450) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447450) (size!31167 a!3219)))))

(declare-fun e!569737 () Bool)

(assert (=> b!1012572 (= e!569737 (= (select (arr!30664 a!3219) (index!40501 lt!447450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012573 () Bool)

(assert (=> b!1012573 (and (bvsge (index!40501 lt!447450) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447450) (size!31167 a!3219)))))

(declare-fun res!679843 () Bool)

(assert (=> b!1012573 (= res!679843 (= (select (arr!30664 a!3219) (index!40501 lt!447450)) (select (arr!30664 a!3219) j!170)))))

(assert (=> b!1012573 (=> res!679843 e!569737)))

(assert (=> b!1012573 (= e!569739 e!569737)))

(declare-fun b!1012574 () Bool)

(assert (=> b!1012574 (= e!569736 (bvsge (x!88071 lt!447450) #b01111111111111111111111111111110))))

(declare-fun b!1012575 () Bool)

(assert (=> b!1012575 (and (bvsge (index!40501 lt!447450) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447450) (size!31167 a!3219)))))

(declare-fun res!679845 () Bool)

(assert (=> b!1012575 (= res!679845 (= (select (arr!30664 a!3219) (index!40501 lt!447450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012575 (=> res!679845 e!569737)))

(declare-fun b!1012576 () Bool)

(assert (=> b!1012576 (= e!569738 (Intermediate!9532 false (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!120585 () Bool)

(assert (=> d!120585 e!569736))

(declare-fun c!102530 () Bool)

(assert (=> d!120585 (= c!102530 (and ((_ is Intermediate!9532) lt!447450) (undefined!10344 lt!447450)))))

(assert (=> d!120585 (= lt!447450 e!569740)))

(declare-fun c!102532 () Bool)

(assert (=> d!120585 (= c!102532 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120585 (= lt!447449 (select (arr!30664 a!3219) (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464)))))

(assert (=> d!120585 (validMask!0 mask!3464)))

(assert (=> d!120585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) (select (arr!30664 a!3219) j!170) a!3219 mask!3464) lt!447450)))

(assert (= (and d!120585 c!102532) b!1012571))

(assert (= (and d!120585 (not c!102532)) b!1012568))

(assert (= (and b!1012568 c!102531) b!1012576))

(assert (= (and b!1012568 (not c!102531)) b!1012569))

(assert (= (and d!120585 c!102530) b!1012574))

(assert (= (and d!120585 (not c!102530)) b!1012570))

(assert (= (and b!1012570 res!679844) b!1012573))

(assert (= (and b!1012573 (not res!679843)) b!1012575))

(assert (= (and b!1012575 (not res!679845)) b!1012572))

(declare-fun m!936969 () Bool)

(assert (=> b!1012573 m!936969))

(assert (=> b!1012569 m!936811))

(declare-fun m!936971 () Bool)

(assert (=> b!1012569 m!936971))

(assert (=> b!1012569 m!936971))

(assert (=> b!1012569 m!936787))

(declare-fun m!936973 () Bool)

(assert (=> b!1012569 m!936973))

(assert (=> b!1012572 m!936969))

(assert (=> d!120585 m!936811))

(declare-fun m!936975 () Bool)

(assert (=> d!120585 m!936975))

(assert (=> d!120585 m!936815))

(assert (=> b!1012575 m!936969))

(assert (=> b!1012332 d!120585))

(declare-fun d!120587 () Bool)

(declare-fun lt!447468 () (_ BitVec 32))

(declare-fun lt!447467 () (_ BitVec 32))

(assert (=> d!120587 (= lt!447468 (bvmul (bvxor lt!447467 (bvlshr lt!447467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120587 (= lt!447467 ((_ extract 31 0) (bvand (bvxor (select (arr!30664 a!3219) j!170) (bvlshr (select (arr!30664 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120587 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679846 (let ((h!22515 ((_ extract 31 0) (bvand (bvxor (select (arr!30664 a!3219) j!170) (bvlshr (select (arr!30664 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88079 (bvmul (bvxor h!22515 (bvlshr h!22515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88079 (bvlshr x!88079 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679846 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679846 #b00000000000000000000000000000000))))))

(assert (=> d!120587 (= (toIndex!0 (select (arr!30664 a!3219) j!170) mask!3464) (bvand (bvxor lt!447468 (bvlshr lt!447468 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1012332 d!120587))

(declare-fun d!120597 () Bool)

(declare-fun res!679857 () Bool)

(declare-fun e!569755 () Bool)

(assert (=> d!120597 (=> res!679857 e!569755)))

(assert (=> d!120597 (= res!679857 (= (select (arr!30664 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120597 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!569755)))

(declare-fun b!1012599 () Bool)

(declare-fun e!569756 () Bool)

(assert (=> b!1012599 (= e!569755 e!569756)))

(declare-fun res!679858 () Bool)

(assert (=> b!1012599 (=> (not res!679858) (not e!569756))))

(assert (=> b!1012599 (= res!679858 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31167 a!3219)))))

(declare-fun b!1012600 () Bool)

(assert (=> b!1012600 (= e!569756 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120597 (not res!679857)) b!1012599))

(assert (= (and b!1012599 res!679858) b!1012600))

(assert (=> d!120597 m!936923))

(declare-fun m!936993 () Bool)

(assert (=> b!1012600 m!936993))

(assert (=> b!1012330 d!120597))

(declare-fun d!120603 () Bool)

(assert (=> d!120603 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87436 d!120603))

(declare-fun d!120619 () Bool)

(assert (=> d!120619 (= (array_inv!23800 a!3219) (bvsge (size!31167 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87436 d!120619))

(declare-fun b!1012628 () Bool)

(declare-fun e!569776 () SeekEntryResult!9532)

(declare-fun e!569774 () SeekEntryResult!9532)

(assert (=> b!1012628 (= e!569776 e!569774)))

(declare-fun c!102549 () Bool)

(declare-fun lt!447483 () (_ BitVec 64))

(assert (=> b!1012628 (= c!102549 (or (= lt!447483 (select (arr!30664 a!3219) j!170)) (= (bvadd lt!447483 lt!447483) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012629 () Bool)

(assert (=> b!1012629 (= e!569774 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012630 () Bool)

(declare-fun e!569772 () Bool)

(declare-fun e!569775 () Bool)

(assert (=> b!1012630 (= e!569772 e!569775)))

(declare-fun res!679870 () Bool)

(declare-fun lt!447484 () SeekEntryResult!9532)

(assert (=> b!1012630 (= res!679870 (and ((_ is Intermediate!9532) lt!447484) (not (undefined!10344 lt!447484)) (bvslt (x!88071 lt!447484) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447484) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447484) x!1245)))))

(assert (=> b!1012630 (=> (not res!679870) (not e!569775))))

(declare-fun b!1012631 () Bool)

(assert (=> b!1012631 (= e!569776 (Intermediate!9532 true index!1507 x!1245))))

(declare-fun b!1012632 () Bool)

(assert (=> b!1012632 (and (bvsge (index!40501 lt!447484) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447484) (size!31167 a!3219)))))

(declare-fun e!569773 () Bool)

(assert (=> b!1012632 (= e!569773 (= (select (arr!30664 a!3219) (index!40501 lt!447484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012633 () Bool)

(assert (=> b!1012633 (and (bvsge (index!40501 lt!447484) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447484) (size!31167 a!3219)))))

(declare-fun res!679869 () Bool)

(assert (=> b!1012633 (= res!679869 (= (select (arr!30664 a!3219) (index!40501 lt!447484)) (select (arr!30664 a!3219) j!170)))))

(assert (=> b!1012633 (=> res!679869 e!569773)))

(assert (=> b!1012633 (= e!569775 e!569773)))

(declare-fun b!1012634 () Bool)

(assert (=> b!1012634 (= e!569772 (bvsge (x!88071 lt!447484) #b01111111111111111111111111111110))))

(declare-fun b!1012635 () Bool)

(assert (=> b!1012635 (and (bvsge (index!40501 lt!447484) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447484) (size!31167 a!3219)))))

(declare-fun res!679871 () Bool)

(assert (=> b!1012635 (= res!679871 (= (select (arr!30664 a!3219) (index!40501 lt!447484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012635 (=> res!679871 e!569773)))

(declare-fun b!1012636 () Bool)

(assert (=> b!1012636 (= e!569774 (Intermediate!9532 false index!1507 x!1245))))

(declare-fun d!120621 () Bool)

(assert (=> d!120621 e!569772))

(declare-fun c!102548 () Bool)

(assert (=> d!120621 (= c!102548 (and ((_ is Intermediate!9532) lt!447484) (undefined!10344 lt!447484)))))

(assert (=> d!120621 (= lt!447484 e!569776)))

(declare-fun c!102550 () Bool)

(assert (=> d!120621 (= c!102550 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120621 (= lt!447483 (select (arr!30664 a!3219) index!1507))))

(assert (=> d!120621 (validMask!0 mask!3464)))

(assert (=> d!120621 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30664 a!3219) j!170) a!3219 mask!3464) lt!447484)))

(assert (= (and d!120621 c!102550) b!1012631))

(assert (= (and d!120621 (not c!102550)) b!1012628))

(assert (= (and b!1012628 c!102549) b!1012636))

(assert (= (and b!1012628 (not c!102549)) b!1012629))

(assert (= (and d!120621 c!102548) b!1012634))

(assert (= (and d!120621 (not c!102548)) b!1012630))

(assert (= (and b!1012630 res!679870) b!1012633))

(assert (= (and b!1012633 (not res!679869)) b!1012635))

(assert (= (and b!1012635 (not res!679871)) b!1012632))

(declare-fun m!937017 () Bool)

(assert (=> b!1012633 m!937017))

(assert (=> b!1012629 m!936917))

(assert (=> b!1012629 m!936917))

(assert (=> b!1012629 m!936787))

(declare-fun m!937019 () Bool)

(assert (=> b!1012629 m!937019))

(assert (=> b!1012632 m!937017))

(declare-fun m!937021 () Bool)

(assert (=> d!120621 m!937021))

(assert (=> d!120621 m!936815))

(assert (=> b!1012635 m!937017))

(assert (=> b!1012329 d!120621))

(declare-fun b!1012637 () Bool)

(declare-fun e!569781 () SeekEntryResult!9532)

(declare-fun e!569779 () SeekEntryResult!9532)

(assert (=> b!1012637 (= e!569781 e!569779)))

(declare-fun c!102552 () Bool)

(declare-fun lt!447485 () (_ BitVec 64))

(assert (=> b!1012637 (= c!102552 (or (= lt!447485 lt!447352) (= (bvadd lt!447485 lt!447485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012638 () Bool)

(assert (=> b!1012638 (= e!569779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!447352 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!447352 lt!447355 mask!3464))))

(declare-fun b!1012639 () Bool)

(declare-fun e!569777 () Bool)

(declare-fun e!569780 () Bool)

(assert (=> b!1012639 (= e!569777 e!569780)))

(declare-fun res!679873 () Bool)

(declare-fun lt!447486 () SeekEntryResult!9532)

(assert (=> b!1012639 (= res!679873 (and ((_ is Intermediate!9532) lt!447486) (not (undefined!10344 lt!447486)) (bvslt (x!88071 lt!447486) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447486) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447486) #b00000000000000000000000000000000)))))

(assert (=> b!1012639 (=> (not res!679873) (not e!569780))))

(declare-fun b!1012640 () Bool)

(assert (=> b!1012640 (= e!569781 (Intermediate!9532 true (toIndex!0 lt!447352 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1012641 () Bool)

(assert (=> b!1012641 (and (bvsge (index!40501 lt!447486) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447486) (size!31167 lt!447355)))))

(declare-fun e!569778 () Bool)

(assert (=> b!1012641 (= e!569778 (= (select (arr!30664 lt!447355) (index!40501 lt!447486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012642 () Bool)

(assert (=> b!1012642 (and (bvsge (index!40501 lt!447486) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447486) (size!31167 lt!447355)))))

(declare-fun res!679872 () Bool)

(assert (=> b!1012642 (= res!679872 (= (select (arr!30664 lt!447355) (index!40501 lt!447486)) lt!447352))))

(assert (=> b!1012642 (=> res!679872 e!569778)))

(assert (=> b!1012642 (= e!569780 e!569778)))

(declare-fun b!1012643 () Bool)

(assert (=> b!1012643 (= e!569777 (bvsge (x!88071 lt!447486) #b01111111111111111111111111111110))))

(declare-fun b!1012644 () Bool)

(assert (=> b!1012644 (and (bvsge (index!40501 lt!447486) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447486) (size!31167 lt!447355)))))

(declare-fun res!679874 () Bool)

(assert (=> b!1012644 (= res!679874 (= (select (arr!30664 lt!447355) (index!40501 lt!447486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012644 (=> res!679874 e!569778)))

(declare-fun b!1012645 () Bool)

(assert (=> b!1012645 (= e!569779 (Intermediate!9532 false (toIndex!0 lt!447352 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!120627 () Bool)

(assert (=> d!120627 e!569777))

(declare-fun c!102551 () Bool)

(assert (=> d!120627 (= c!102551 (and ((_ is Intermediate!9532) lt!447486) (undefined!10344 lt!447486)))))

(assert (=> d!120627 (= lt!447486 e!569781)))

(declare-fun c!102553 () Bool)

(assert (=> d!120627 (= c!102553 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120627 (= lt!447485 (select (arr!30664 lt!447355) (toIndex!0 lt!447352 mask!3464)))))

(assert (=> d!120627 (validMask!0 mask!3464)))

(assert (=> d!120627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447352 mask!3464) lt!447352 lt!447355 mask!3464) lt!447486)))

(assert (= (and d!120627 c!102553) b!1012640))

(assert (= (and d!120627 (not c!102553)) b!1012637))

(assert (= (and b!1012637 c!102552) b!1012645))

(assert (= (and b!1012637 (not c!102552)) b!1012638))

(assert (= (and d!120627 c!102551) b!1012643))

(assert (= (and d!120627 (not c!102551)) b!1012639))

(assert (= (and b!1012639 res!679873) b!1012642))

(assert (= (and b!1012642 (not res!679872)) b!1012644))

(assert (= (and b!1012644 (not res!679874)) b!1012641))

(declare-fun m!937023 () Bool)

(assert (=> b!1012642 m!937023))

(assert (=> b!1012638 m!936793))

(declare-fun m!937025 () Bool)

(assert (=> b!1012638 m!937025))

(assert (=> b!1012638 m!937025))

(declare-fun m!937027 () Bool)

(assert (=> b!1012638 m!937027))

(assert (=> b!1012641 m!937023))

(assert (=> d!120627 m!936793))

(declare-fun m!937029 () Bool)

(assert (=> d!120627 m!937029))

(assert (=> d!120627 m!936815))

(assert (=> b!1012644 m!937023))

(assert (=> b!1012327 d!120627))

(declare-fun d!120629 () Bool)

(declare-fun lt!447488 () (_ BitVec 32))

(declare-fun lt!447487 () (_ BitVec 32))

(assert (=> d!120629 (= lt!447488 (bvmul (bvxor lt!447487 (bvlshr lt!447487 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120629 (= lt!447487 ((_ extract 31 0) (bvand (bvxor lt!447352 (bvlshr lt!447352 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120629 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679846 (let ((h!22515 ((_ extract 31 0) (bvand (bvxor lt!447352 (bvlshr lt!447352 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88079 (bvmul (bvxor h!22515 (bvlshr h!22515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88079 (bvlshr x!88079 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679846 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679846 #b00000000000000000000000000000000))))))

(assert (=> d!120629 (= (toIndex!0 lt!447352 mask!3464) (bvand (bvxor lt!447488 (bvlshr lt!447488 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1012327 d!120629))

(declare-fun b!1012650 () Bool)

(declare-fun e!569788 () SeekEntryResult!9532)

(declare-fun e!569786 () SeekEntryResult!9532)

(assert (=> b!1012650 (= e!569788 e!569786)))

(declare-fun lt!447493 () (_ BitVec 64))

(declare-fun c!102557 () Bool)

(assert (=> b!1012650 (= c!102557 (or (= lt!447493 (select (arr!30664 a!3219) j!170)) (= (bvadd lt!447493 lt!447493) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1012651 () Bool)

(assert (=> b!1012651 (= e!569786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!447358 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30664 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012652 () Bool)

(declare-fun e!569784 () Bool)

(declare-fun e!569787 () Bool)

(assert (=> b!1012652 (= e!569784 e!569787)))

(declare-fun res!679876 () Bool)

(declare-fun lt!447494 () SeekEntryResult!9532)

(assert (=> b!1012652 (= res!679876 (and ((_ is Intermediate!9532) lt!447494) (not (undefined!10344 lt!447494)) (bvslt (x!88071 lt!447494) #b01111111111111111111111111111110) (bvsge (x!88071 lt!447494) #b00000000000000000000000000000000) (bvsge (x!88071 lt!447494) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1012652 (=> (not res!679876) (not e!569787))))

(declare-fun b!1012653 () Bool)

(assert (=> b!1012653 (= e!569788 (Intermediate!9532 true lt!447358 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1012654 () Bool)

(assert (=> b!1012654 (and (bvsge (index!40501 lt!447494) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447494) (size!31167 a!3219)))))

(declare-fun e!569785 () Bool)

(assert (=> b!1012654 (= e!569785 (= (select (arr!30664 a!3219) (index!40501 lt!447494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1012655 () Bool)

(assert (=> b!1012655 (and (bvsge (index!40501 lt!447494) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447494) (size!31167 a!3219)))))

(declare-fun res!679875 () Bool)

(assert (=> b!1012655 (= res!679875 (= (select (arr!30664 a!3219) (index!40501 lt!447494)) (select (arr!30664 a!3219) j!170)))))

(assert (=> b!1012655 (=> res!679875 e!569785)))

(assert (=> b!1012655 (= e!569787 e!569785)))

(declare-fun b!1012656 () Bool)

(assert (=> b!1012656 (= e!569784 (bvsge (x!88071 lt!447494) #b01111111111111111111111111111110))))

(declare-fun b!1012657 () Bool)

(assert (=> b!1012657 (and (bvsge (index!40501 lt!447494) #b00000000000000000000000000000000) (bvslt (index!40501 lt!447494) (size!31167 a!3219)))))

(declare-fun res!679877 () Bool)

(assert (=> b!1012657 (= res!679877 (= (select (arr!30664 a!3219) (index!40501 lt!447494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1012657 (=> res!679877 e!569785)))

(declare-fun b!1012658 () Bool)

(assert (=> b!1012658 (= e!569786 (Intermediate!9532 false lt!447358 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun d!120631 () Bool)

(assert (=> d!120631 e!569784))

(declare-fun c!102556 () Bool)

(assert (=> d!120631 (= c!102556 (and ((_ is Intermediate!9532) lt!447494) (undefined!10344 lt!447494)))))

(assert (=> d!120631 (= lt!447494 e!569788)))

(declare-fun c!102558 () Bool)

(assert (=> d!120631 (= c!102558 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120631 (= lt!447493 (select (arr!30664 a!3219) lt!447358))))

(assert (=> d!120631 (validMask!0 mask!3464)))

(assert (=> d!120631 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447358 (select (arr!30664 a!3219) j!170) a!3219 mask!3464) lt!447494)))

(assert (= (and d!120631 c!102558) b!1012653))

(assert (= (and d!120631 (not c!102558)) b!1012650))

(assert (= (and b!1012650 c!102557) b!1012658))

(assert (= (and b!1012650 (not c!102557)) b!1012651))

(assert (= (and d!120631 c!102556) b!1012656))

(assert (= (and d!120631 (not c!102556)) b!1012652))

(assert (= (and b!1012652 res!679876) b!1012655))

(assert (= (and b!1012655 (not res!679875)) b!1012657))

(assert (= (and b!1012657 (not res!679877)) b!1012654))

(declare-fun m!937031 () Bool)

(assert (=> b!1012655 m!937031))

(assert (=> b!1012651 m!936907))

(assert (=> b!1012651 m!936907))

(assert (=> b!1012651 m!936787))

(declare-fun m!937033 () Bool)

(assert (=> b!1012651 m!937033))

(assert (=> b!1012654 m!937031))

(declare-fun m!937035 () Bool)

(assert (=> d!120631 m!937035))

(assert (=> d!120631 m!936815))

(assert (=> b!1012657 m!937031))

(assert (=> b!1012328 d!120631))

(check-sat (not b!1012651) (not b!1012638) (not d!120627) (not d!120565) (not b!1012493) (not b!1012452) (not b!1012600) (not d!120585) (not b!1012461) (not b!1012492) (not d!120631) (not bm!42490) (not b!1012569) (not d!120577) (not d!120621) (not b!1012494) (not b!1012567) (not b!1012480) (not b!1012629) (not b!1012478) (not d!120561) (not bm!42493) (not d!120567))
(check-sat)
