; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65046 () Bool)

(assert start!65046)

(declare-fun b!733327 () Bool)

(declare-fun e!410418 () Bool)

(declare-fun e!410409 () Bool)

(assert (=> b!733327 (= e!410418 e!410409)))

(declare-fun res!492478 () Bool)

(assert (=> b!733327 (=> (not res!492478) (not e!410409))))

(declare-datatypes ((SeekEntryResult!7282 0))(
  ( (MissingZero!7282 (index!31496 (_ BitVec 32))) (Found!7282 (index!31497 (_ BitVec 32))) (Intermediate!7282 (undefined!8094 Bool) (index!31498 (_ BitVec 32)) (x!62652 (_ BitVec 32))) (Undefined!7282) (MissingVacant!7282 (index!31499 (_ BitVec 32))) )
))
(declare-fun lt!324951 () SeekEntryResult!7282)

(declare-fun lt!324958 () SeekEntryResult!7282)

(assert (=> b!733327 (= res!492478 (= lt!324951 lt!324958))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!324952 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41227 0))(
  ( (array!41228 (arr!19726 (Array (_ BitVec 32) (_ BitVec 64))) (size!20146 (_ BitVec 32))) )
))
(declare-fun lt!324957 () array!41227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!733327 (= lt!324958 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324952 lt!324957 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733327 (= lt!324951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324952 mask!3328) lt!324952 lt!324957 mask!3328))))

(declare-fun a!3186 () array!41227)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!733327 (= lt!324952 (select (store (arr!19726 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733327 (= lt!324957 (array!41228 (store (arr!19726 a!3186) i!1173 k0!2102) (size!20146 a!3186)))))

(declare-fun b!733328 () Bool)

(declare-fun lt!324953 () SeekEntryResult!7282)

(declare-fun e!410416 () Bool)

(assert (=> b!733328 (= e!410416 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324953))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!733329 () Bool)

(declare-fun lt!324959 () SeekEntryResult!7282)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!410415 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!733329 (= e!410415 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324959))))

(declare-fun b!733330 () Bool)

(declare-fun res!492465 () Bool)

(declare-fun e!410410 () Bool)

(assert (=> b!733330 (=> (not res!492465) (not e!410410))))

(declare-datatypes ((List!13635 0))(
  ( (Nil!13632) (Cons!13631 (h!14703 (_ BitVec 64)) (t!19942 List!13635)) )
))
(declare-fun arrayNoDuplicates!0 (array!41227 (_ BitVec 32) List!13635) Bool)

(assert (=> b!733330 (= res!492465 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13632))))

(declare-fun b!733331 () Bool)

(declare-fun res!492469 () Bool)

(declare-fun e!410413 () Bool)

(assert (=> b!733331 (=> (not res!492469) (not e!410413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733331 (= res!492469 (validKeyInArray!0 (select (arr!19726 a!3186) j!159)))))

(declare-fun b!733332 () Bool)

(assert (=> b!733332 (= e!410410 e!410418)))

(declare-fun res!492477 () Bool)

(assert (=> b!733332 (=> (not res!492477) (not e!410418))))

(assert (=> b!733332 (= res!492477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324953))))

(assert (=> b!733332 (= lt!324953 (Intermediate!7282 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733333 () Bool)

(declare-fun e!410411 () Bool)

(declare-fun e!410412 () Bool)

(assert (=> b!733333 (= e!410411 e!410412)))

(declare-fun res!492471 () Bool)

(assert (=> b!733333 (=> res!492471 e!410412)))

(assert (=> b!733333 (= res!492471 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324954 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733333 (= lt!324954 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!733334 () Bool)

(assert (=> b!733334 (= e!410416 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) (Found!7282 j!159)))))

(declare-fun b!733335 () Bool)

(declare-fun res!492476 () Bool)

(assert (=> b!733335 (=> (not res!492476) (not e!410410))))

(assert (=> b!733335 (= res!492476 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20146 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20146 a!3186))))))

(declare-fun b!733336 () Bool)

(declare-fun e!410417 () Bool)

(assert (=> b!733336 (= e!410417 e!410415)))

(declare-fun res!492474 () Bool)

(assert (=> b!733336 (=> (not res!492474) (not e!410415))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!733336 (= res!492474 (= (seekEntryOrOpen!0 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324959))))

(assert (=> b!733336 (= lt!324959 (Found!7282 j!159))))

(declare-fun b!733337 () Bool)

(declare-fun res!492473 () Bool)

(assert (=> b!733337 (=> (not res!492473) (not e!410413))))

(declare-fun arrayContainsKey!0 (array!41227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733337 (= res!492473 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733338 () Bool)

(declare-fun res!492464 () Bool)

(assert (=> b!733338 (=> (not res!492464) (not e!410410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41227 (_ BitVec 32)) Bool)

(assert (=> b!733338 (= res!492464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733339 () Bool)

(assert (=> b!733339 (= e!410412 true)))

(declare-fun lt!324956 () SeekEntryResult!7282)

(assert (=> b!733339 (= lt!324956 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733340 () Bool)

(assert (=> b!733340 (= e!410413 e!410410)))

(declare-fun res!492462 () Bool)

(assert (=> b!733340 (=> (not res!492462) (not e!410410))))

(declare-fun lt!324960 () SeekEntryResult!7282)

(assert (=> b!733340 (= res!492462 (or (= lt!324960 (MissingZero!7282 i!1173)) (= lt!324960 (MissingVacant!7282 i!1173))))))

(assert (=> b!733340 (= lt!324960 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733341 () Bool)

(declare-fun res!492470 () Bool)

(assert (=> b!733341 (=> (not res!492470) (not e!410413))))

(assert (=> b!733341 (= res!492470 (and (= (size!20146 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20146 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20146 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733342 () Bool)

(assert (=> b!733342 (= e!410409 (not e!410411))))

(declare-fun res!492463 () Bool)

(assert (=> b!733342 (=> res!492463 e!410411)))

(get-info :version)

(assert (=> b!733342 (= res!492463 (or (not ((_ is Intermediate!7282) lt!324958)) (bvsge x!1131 (x!62652 lt!324958))))))

(assert (=> b!733342 e!410417))

(declare-fun res!492472 () Bool)

(assert (=> b!733342 (=> (not res!492472) (not e!410417))))

(assert (=> b!733342 (= res!492472 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24961 0))(
  ( (Unit!24962) )
))
(declare-fun lt!324955 () Unit!24961)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24961)

(assert (=> b!733342 (= lt!324955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733343 () Bool)

(declare-fun res!492467 () Bool)

(assert (=> b!733343 (=> (not res!492467) (not e!410418))))

(assert (=> b!733343 (= res!492467 e!410416)))

(declare-fun c!80813 () Bool)

(assert (=> b!733343 (= c!80813 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733344 () Bool)

(declare-fun res!492466 () Bool)

(assert (=> b!733344 (=> (not res!492466) (not e!410418))))

(assert (=> b!733344 (= res!492466 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19726 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733345 () Bool)

(declare-fun res!492468 () Bool)

(assert (=> b!733345 (=> (not res!492468) (not e!410413))))

(assert (=> b!733345 (= res!492468 (validKeyInArray!0 k0!2102))))

(declare-fun res!492475 () Bool)

(assert (=> start!65046 (=> (not res!492475) (not e!410413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65046 (= res!492475 (validMask!0 mask!3328))))

(assert (=> start!65046 e!410413))

(assert (=> start!65046 true))

(declare-fun array_inv!15585 (array!41227) Bool)

(assert (=> start!65046 (array_inv!15585 a!3186)))

(assert (= (and start!65046 res!492475) b!733341))

(assert (= (and b!733341 res!492470) b!733331))

(assert (= (and b!733331 res!492469) b!733345))

(assert (= (and b!733345 res!492468) b!733337))

(assert (= (and b!733337 res!492473) b!733340))

(assert (= (and b!733340 res!492462) b!733338))

(assert (= (and b!733338 res!492464) b!733330))

(assert (= (and b!733330 res!492465) b!733335))

(assert (= (and b!733335 res!492476) b!733332))

(assert (= (and b!733332 res!492477) b!733344))

(assert (= (and b!733344 res!492466) b!733343))

(assert (= (and b!733343 c!80813) b!733328))

(assert (= (and b!733343 (not c!80813)) b!733334))

(assert (= (and b!733343 res!492467) b!733327))

(assert (= (and b!733327 res!492478) b!733342))

(assert (= (and b!733342 res!492472) b!733336))

(assert (= (and b!733336 res!492474) b!733329))

(assert (= (and b!733342 (not res!492463)) b!733333))

(assert (= (and b!733333 (not res!492471)) b!733339))

(declare-fun m!686763 () Bool)

(assert (=> b!733328 m!686763))

(assert (=> b!733328 m!686763))

(declare-fun m!686765 () Bool)

(assert (=> b!733328 m!686765))

(assert (=> b!733329 m!686763))

(assert (=> b!733329 m!686763))

(declare-fun m!686767 () Bool)

(assert (=> b!733329 m!686767))

(declare-fun m!686769 () Bool)

(assert (=> b!733344 m!686769))

(declare-fun m!686771 () Bool)

(assert (=> b!733327 m!686771))

(declare-fun m!686773 () Bool)

(assert (=> b!733327 m!686773))

(declare-fun m!686775 () Bool)

(assert (=> b!733327 m!686775))

(assert (=> b!733327 m!686771))

(declare-fun m!686777 () Bool)

(assert (=> b!733327 m!686777))

(declare-fun m!686779 () Bool)

(assert (=> b!733327 m!686779))

(declare-fun m!686781 () Bool)

(assert (=> b!733330 m!686781))

(declare-fun m!686783 () Bool)

(assert (=> start!65046 m!686783))

(declare-fun m!686785 () Bool)

(assert (=> start!65046 m!686785))

(declare-fun m!686787 () Bool)

(assert (=> b!733345 m!686787))

(declare-fun m!686789 () Bool)

(assert (=> b!733333 m!686789))

(assert (=> b!733331 m!686763))

(assert (=> b!733331 m!686763))

(declare-fun m!686791 () Bool)

(assert (=> b!733331 m!686791))

(declare-fun m!686793 () Bool)

(assert (=> b!733342 m!686793))

(declare-fun m!686795 () Bool)

(assert (=> b!733342 m!686795))

(declare-fun m!686797 () Bool)

(assert (=> b!733338 m!686797))

(assert (=> b!733339 m!686763))

(assert (=> b!733339 m!686763))

(declare-fun m!686799 () Bool)

(assert (=> b!733339 m!686799))

(declare-fun m!686801 () Bool)

(assert (=> b!733337 m!686801))

(assert (=> b!733334 m!686763))

(assert (=> b!733334 m!686763))

(assert (=> b!733334 m!686799))

(assert (=> b!733332 m!686763))

(assert (=> b!733332 m!686763))

(declare-fun m!686803 () Bool)

(assert (=> b!733332 m!686803))

(assert (=> b!733332 m!686803))

(assert (=> b!733332 m!686763))

(declare-fun m!686805 () Bool)

(assert (=> b!733332 m!686805))

(declare-fun m!686807 () Bool)

(assert (=> b!733340 m!686807))

(assert (=> b!733336 m!686763))

(assert (=> b!733336 m!686763))

(declare-fun m!686809 () Bool)

(assert (=> b!733336 m!686809))

(check-sat (not b!733327) (not b!733329) (not b!733333) (not b!733330) (not b!733339) (not b!733332) (not b!733331) (not b!733336) (not b!733334) (not b!733340) (not start!65046) (not b!733328) (not b!733338) (not b!733345) (not b!733337) (not b!733342))
(check-sat)
