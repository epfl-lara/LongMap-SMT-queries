; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64486 () Bool)

(assert start!64486)

(declare-fun b!725468 () Bool)

(declare-fun e!406271 () Bool)

(declare-fun e!406265 () Bool)

(assert (=> b!725468 (= e!406271 e!406265)))

(declare-fun res!486574 () Bool)

(assert (=> b!725468 (=> (not res!486574) (not e!406265))))

(declare-datatypes ((array!41004 0))(
  ( (array!41005 (arr!19623 (Array (_ BitVec 32) (_ BitVec 64))) (size!20044 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41004)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7223 0))(
  ( (MissingZero!7223 (index!31260 (_ BitVec 32))) (Found!7223 (index!31261 (_ BitVec 32))) (Intermediate!7223 (undefined!8035 Bool) (index!31262 (_ BitVec 32)) (x!62257 (_ BitVec 32))) (Undefined!7223) (MissingVacant!7223 (index!31263 (_ BitVec 32))) )
))
(declare-fun lt!321354 () SeekEntryResult!7223)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41004 (_ BitVec 32)) SeekEntryResult!7223)

(assert (=> b!725468 (= res!486574 (= (seekEntryOrOpen!0 (select (arr!19623 a!3186) j!159) a!3186 mask!3328) lt!321354))))

(assert (=> b!725468 (= lt!321354 (Found!7223 j!159))))

(declare-fun b!725469 () Bool)

(declare-fun e!406268 () Bool)

(declare-fun e!406269 () Bool)

(assert (=> b!725469 (= e!406268 e!406269)))

(declare-fun res!486571 () Bool)

(assert (=> b!725469 (=> (not res!486571) (not e!406269))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321357 () array!41004)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321358 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41004 (_ BitVec 32)) SeekEntryResult!7223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725469 (= res!486571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321358 mask!3328) lt!321358 lt!321357 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321358 lt!321357 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!725469 (= lt!321358 (select (store (arr!19623 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725469 (= lt!321357 (array!41005 (store (arr!19623 a!3186) i!1173 k!2102) (size!20044 a!3186)))))

(declare-fun lt!321359 () SeekEntryResult!7223)

(declare-fun b!725470 () Bool)

(declare-fun e!406266 () Bool)

(assert (=> b!725470 (= e!406266 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19623 a!3186) j!159) a!3186 mask!3328) lt!321359))))

(declare-fun b!725471 () Bool)

(declare-fun res!486564 () Bool)

(declare-fun e!406270 () Bool)

(assert (=> b!725471 (=> (not res!486564) (not e!406270))))

(declare-datatypes ((List!13625 0))(
  ( (Nil!13622) (Cons!13621 (h!14678 (_ BitVec 64)) (t!19940 List!13625)) )
))
(declare-fun arrayNoDuplicates!0 (array!41004 (_ BitVec 32) List!13625) Bool)

(assert (=> b!725471 (= res!486564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13622))))

(declare-fun res!486575 () Bool)

(declare-fun e!406267 () Bool)

(assert (=> start!64486 (=> (not res!486575) (not e!406267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64486 (= res!486575 (validMask!0 mask!3328))))

(assert (=> start!64486 e!406267))

(assert (=> start!64486 true))

(declare-fun array_inv!15419 (array!41004) Bool)

(assert (=> start!64486 (array_inv!15419 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!725472 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41004 (_ BitVec 32)) SeekEntryResult!7223)

(assert (=> b!725472 (= e!406265 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19623 a!3186) j!159) a!3186 mask!3328) lt!321354))))

(declare-fun b!725473 () Bool)

(assert (=> b!725473 (= e!406267 e!406270)))

(declare-fun res!486572 () Bool)

(assert (=> b!725473 (=> (not res!486572) (not e!406270))))

(declare-fun lt!321355 () SeekEntryResult!7223)

(assert (=> b!725473 (= res!486572 (or (= lt!321355 (MissingZero!7223 i!1173)) (= lt!321355 (MissingVacant!7223 i!1173))))))

(assert (=> b!725473 (= lt!321355 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725474 () Bool)

(declare-fun res!486576 () Bool)

(assert (=> b!725474 (=> (not res!486576) (not e!406267))))

(declare-fun arrayContainsKey!0 (array!41004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725474 (= res!486576 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725475 () Bool)

(declare-fun res!486578 () Bool)

(assert (=> b!725475 (=> (not res!486578) (not e!406268))))

(assert (=> b!725475 (= res!486578 e!406266)))

(declare-fun c!79825 () Bool)

(assert (=> b!725475 (= c!79825 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725476 () Bool)

(assert (=> b!725476 (= e!406266 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19623 a!3186) j!159) a!3186 mask!3328) (Found!7223 j!159)))))

(declare-fun b!725477 () Bool)

(declare-fun res!486568 () Bool)

(assert (=> b!725477 (=> (not res!486568) (not e!406270))))

(assert (=> b!725477 (= res!486568 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20044 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20044 a!3186))))))

(declare-fun b!725478 () Bool)

(declare-fun res!486569 () Bool)

(assert (=> b!725478 (=> (not res!486569) (not e!406270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41004 (_ BitVec 32)) Bool)

(assert (=> b!725478 (= res!486569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725479 () Bool)

(declare-fun res!486566 () Bool)

(assert (=> b!725479 (=> (not res!486566) (not e!406267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725479 (= res!486566 (validKeyInArray!0 k!2102))))

(declare-fun b!725480 () Bool)

(declare-fun res!486573 () Bool)

(assert (=> b!725480 (=> (not res!486573) (not e!406267))))

(assert (=> b!725480 (= res!486573 (and (= (size!20044 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20044 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20044 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725481 () Bool)

(declare-fun res!486577 () Bool)

(assert (=> b!725481 (=> (not res!486577) (not e!406267))))

(assert (=> b!725481 (= res!486577 (validKeyInArray!0 (select (arr!19623 a!3186) j!159)))))

(declare-fun b!725482 () Bool)

(declare-fun res!486567 () Bool)

(assert (=> b!725482 (=> (not res!486567) (not e!406268))))

(assert (=> b!725482 (= res!486567 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19623 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725483 () Bool)

(assert (=> b!725483 (= e!406270 e!406268)))

(declare-fun res!486570 () Bool)

(assert (=> b!725483 (=> (not res!486570) (not e!406268))))

(assert (=> b!725483 (= res!486570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19623 a!3186) j!159) mask!3328) (select (arr!19623 a!3186) j!159) a!3186 mask!3328) lt!321359))))

(assert (=> b!725483 (= lt!321359 (Intermediate!7223 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725484 () Bool)

(assert (=> b!725484 (= e!406269 (not true))))

(assert (=> b!725484 e!406271))

(declare-fun res!486565 () Bool)

(assert (=> b!725484 (=> (not res!486565) (not e!406271))))

(assert (=> b!725484 (= res!486565 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24764 0))(
  ( (Unit!24765) )
))
(declare-fun lt!321356 () Unit!24764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24764)

(assert (=> b!725484 (= lt!321356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64486 res!486575) b!725480))

(assert (= (and b!725480 res!486573) b!725481))

(assert (= (and b!725481 res!486577) b!725479))

(assert (= (and b!725479 res!486566) b!725474))

(assert (= (and b!725474 res!486576) b!725473))

(assert (= (and b!725473 res!486572) b!725478))

(assert (= (and b!725478 res!486569) b!725471))

(assert (= (and b!725471 res!486564) b!725477))

(assert (= (and b!725477 res!486568) b!725483))

(assert (= (and b!725483 res!486570) b!725482))

(assert (= (and b!725482 res!486567) b!725475))

(assert (= (and b!725475 c!79825) b!725470))

(assert (= (and b!725475 (not c!79825)) b!725476))

(assert (= (and b!725475 res!486578) b!725469))

(assert (= (and b!725469 res!486571) b!725484))

(assert (= (and b!725484 res!486565) b!725468))

(assert (= (and b!725468 res!486574) b!725472))

(declare-fun m!679627 () Bool)

(assert (=> b!725469 m!679627))

(assert (=> b!725469 m!679627))

(declare-fun m!679629 () Bool)

(assert (=> b!725469 m!679629))

(declare-fun m!679631 () Bool)

(assert (=> b!725469 m!679631))

(declare-fun m!679633 () Bool)

(assert (=> b!725469 m!679633))

(declare-fun m!679635 () Bool)

(assert (=> b!725469 m!679635))

(declare-fun m!679637 () Bool)

(assert (=> b!725474 m!679637))

(declare-fun m!679639 () Bool)

(assert (=> b!725481 m!679639))

(assert (=> b!725481 m!679639))

(declare-fun m!679641 () Bool)

(assert (=> b!725481 m!679641))

(assert (=> b!725470 m!679639))

(assert (=> b!725470 m!679639))

(declare-fun m!679643 () Bool)

(assert (=> b!725470 m!679643))

(declare-fun m!679645 () Bool)

(assert (=> b!725482 m!679645))

(assert (=> b!725472 m!679639))

(assert (=> b!725472 m!679639))

(declare-fun m!679647 () Bool)

(assert (=> b!725472 m!679647))

(declare-fun m!679649 () Bool)

(assert (=> b!725479 m!679649))

(assert (=> b!725476 m!679639))

(assert (=> b!725476 m!679639))

(declare-fun m!679651 () Bool)

(assert (=> b!725476 m!679651))

(declare-fun m!679653 () Bool)

(assert (=> b!725473 m!679653))

(declare-fun m!679655 () Bool)

(assert (=> b!725484 m!679655))

(declare-fun m!679657 () Bool)

(assert (=> b!725484 m!679657))

(declare-fun m!679659 () Bool)

(assert (=> start!64486 m!679659))

(declare-fun m!679661 () Bool)

(assert (=> start!64486 m!679661))

(declare-fun m!679663 () Bool)

(assert (=> b!725478 m!679663))

(declare-fun m!679665 () Bool)

(assert (=> b!725471 m!679665))

(assert (=> b!725468 m!679639))

(assert (=> b!725468 m!679639))

(declare-fun m!679667 () Bool)

(assert (=> b!725468 m!679667))

(assert (=> b!725483 m!679639))

(assert (=> b!725483 m!679639))

(declare-fun m!679669 () Bool)

(assert (=> b!725483 m!679669))

(assert (=> b!725483 m!679669))

(assert (=> b!725483 m!679639))

(declare-fun m!679671 () Bool)

(assert (=> b!725483 m!679671))

(push 1)

