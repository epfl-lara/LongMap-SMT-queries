; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65668 () Bool)

(assert start!65668)

(declare-fun b!752459 () Bool)

(declare-fun e!419718 () Bool)

(declare-fun e!419720 () Bool)

(assert (=> b!752459 (= e!419718 e!419720)))

(declare-fun res!508164 () Bool)

(assert (=> b!752459 (=> res!508164 e!419720)))

(declare-datatypes ((SeekEntryResult!7634 0))(
  ( (MissingZero!7634 (index!32904 (_ BitVec 32))) (Found!7634 (index!32905 (_ BitVec 32))) (Intermediate!7634 (undefined!8446 Bool) (index!32906 (_ BitVec 32)) (x!63824 (_ BitVec 32))) (Undefined!7634) (MissingVacant!7634 (index!32907 (_ BitVec 32))) )
))
(declare-fun lt!334718 () SeekEntryResult!7634)

(declare-fun lt!334714 () SeekEntryResult!7634)

(assert (=> b!752459 (= res!508164 (not (= lt!334718 lt!334714)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41841 0))(
  ( (array!41842 (arr!20034 (Array (_ BitVec 32) (_ BitVec 64))) (size!20455 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41841)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41841 (_ BitVec 32)) SeekEntryResult!7634)

(assert (=> b!752459 (= lt!334718 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20034 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752460 () Bool)

(declare-fun res!508166 () Bool)

(declare-fun e!419719 () Bool)

(assert (=> b!752460 (=> (not res!508166) (not e!419719))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752460 (= res!508166 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752461 () Bool)

(declare-fun e!419722 () Bool)

(assert (=> b!752461 (= e!419720 e!419722)))

(declare-fun res!508163 () Bool)

(assert (=> b!752461 (=> res!508163 e!419722)))

(declare-fun lt!334710 () (_ BitVec 64))

(declare-fun lt!334721 () (_ BitVec 64))

(assert (=> b!752461 (= res!508163 (= lt!334710 lt!334721))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752461 (= lt!334710 (select (store (arr!20034 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!419728 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!752462 () Bool)

(assert (=> b!752462 (= e!419728 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20034 a!3186) j!159) a!3186 mask!3328) lt!334714))))

(declare-fun res!508167 () Bool)

(assert (=> start!65668 (=> (not res!508167) (not e!419719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65668 (= res!508167 (validMask!0 mask!3328))))

(assert (=> start!65668 e!419719))

(assert (=> start!65668 true))

(declare-fun array_inv!15830 (array!41841) Bool)

(assert (=> start!65668 (array_inv!15830 a!3186)))

(declare-fun b!752463 () Bool)

(declare-fun res!508161 () Bool)

(assert (=> b!752463 (=> (not res!508161) (not e!419719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752463 (= res!508161 (validKeyInArray!0 (select (arr!20034 a!3186) j!159)))))

(declare-fun b!752464 () Bool)

(declare-fun res!508158 () Bool)

(declare-fun e!419723 () Bool)

(assert (=> b!752464 (=> (not res!508158) (not e!419723))))

(declare-fun e!419726 () Bool)

(assert (=> b!752464 (= res!508158 e!419726)))

(declare-fun c!82533 () Bool)

(assert (=> b!752464 (= c!82533 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752465 () Bool)

(declare-fun e!419721 () Bool)

(assert (=> b!752465 (= e!419721 e!419723)))

(declare-fun res!508160 () Bool)

(assert (=> b!752465 (=> (not res!508160) (not e!419723))))

(declare-fun lt!334711 () SeekEntryResult!7634)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41841 (_ BitVec 32)) SeekEntryResult!7634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752465 (= res!508160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20034 a!3186) j!159) mask!3328) (select (arr!20034 a!3186) j!159) a!3186 mask!3328) lt!334711))))

(assert (=> b!752465 (= lt!334711 (Intermediate!7634 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752466 () Bool)

(declare-fun e!419729 () Bool)

(declare-fun lt!334719 () SeekEntryResult!7634)

(assert (=> b!752466 (= e!419729 (= lt!334719 lt!334718))))

(declare-fun b!752467 () Bool)

(declare-fun res!508165 () Bool)

(assert (=> b!752467 (=> (not res!508165) (not e!419729))))

(declare-fun lt!334716 () array!41841)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41841 (_ BitVec 32)) SeekEntryResult!7634)

(assert (=> b!752467 (= res!508165 (= (seekEntryOrOpen!0 lt!334721 lt!334716 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334721 lt!334716 mask!3328)))))

(declare-fun b!752468 () Bool)

(assert (=> b!752468 (= e!419719 e!419721)))

(declare-fun res!508172 () Bool)

(assert (=> b!752468 (=> (not res!508172) (not e!419721))))

(declare-fun lt!334717 () SeekEntryResult!7634)

(assert (=> b!752468 (= res!508172 (or (= lt!334717 (MissingZero!7634 i!1173)) (= lt!334717 (MissingVacant!7634 i!1173))))))

(assert (=> b!752468 (= lt!334717 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752469 () Bool)

(declare-datatypes ((Unit!25916 0))(
  ( (Unit!25917) )
))
(declare-fun e!419724 () Unit!25916)

(declare-fun Unit!25918 () Unit!25916)

(assert (=> b!752469 (= e!419724 Unit!25918)))

(assert (=> b!752469 false))

(declare-fun b!752470 () Bool)

(declare-fun e!419727 () Bool)

(assert (=> b!752470 (= e!419723 e!419727)))

(declare-fun res!508159 () Bool)

(assert (=> b!752470 (=> (not res!508159) (not e!419727))))

(declare-fun lt!334715 () SeekEntryResult!7634)

(declare-fun lt!334712 () SeekEntryResult!7634)

(assert (=> b!752470 (= res!508159 (= lt!334715 lt!334712))))

(assert (=> b!752470 (= lt!334712 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334721 lt!334716 mask!3328))))

(assert (=> b!752470 (= lt!334715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334721 mask!3328) lt!334721 lt!334716 mask!3328))))

(assert (=> b!752470 (= lt!334721 (select (store (arr!20034 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752470 (= lt!334716 (array!41842 (store (arr!20034 a!3186) i!1173 k!2102) (size!20455 a!3186)))))

(declare-fun b!752471 () Bool)

(declare-fun res!508162 () Bool)

(assert (=> b!752471 (=> (not res!508162) (not e!419719))))

(assert (=> b!752471 (= res!508162 (and (= (size!20455 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20455 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20455 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752472 () Bool)

(declare-fun Unit!25919 () Unit!25916)

(assert (=> b!752472 (= e!419724 Unit!25919)))

(declare-fun b!752473 () Bool)

(declare-fun res!508154 () Bool)

(assert (=> b!752473 (=> (not res!508154) (not e!419721))))

(assert (=> b!752473 (= res!508154 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20455 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20455 a!3186))))))

(declare-fun b!752474 () Bool)

(declare-fun res!508170 () Bool)

(assert (=> b!752474 (=> (not res!508170) (not e!419723))))

(assert (=> b!752474 (= res!508170 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20034 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752475 () Bool)

(assert (=> b!752475 (= e!419722 true)))

(assert (=> b!752475 e!419729))

(declare-fun res!508155 () Bool)

(assert (=> b!752475 (=> (not res!508155) (not e!419729))))

(assert (=> b!752475 (= res!508155 (= lt!334710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334720 () Unit!25916)

(assert (=> b!752475 (= lt!334720 e!419724)))

(declare-fun c!82534 () Bool)

(assert (=> b!752475 (= c!82534 (= lt!334710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752476 () Bool)

(assert (=> b!752476 (= e!419726 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20034 a!3186) j!159) a!3186 mask!3328) (Found!7634 j!159)))))

(declare-fun b!752477 () Bool)

(assert (=> b!752477 (= e!419726 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20034 a!3186) j!159) a!3186 mask!3328) lt!334711))))

(declare-fun b!752478 () Bool)

(declare-fun res!508157 () Bool)

(assert (=> b!752478 (=> (not res!508157) (not e!419721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41841 (_ BitVec 32)) Bool)

(assert (=> b!752478 (= res!508157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752479 () Bool)

(assert (=> b!752479 (= e!419727 (not e!419718))))

(declare-fun res!508171 () Bool)

(assert (=> b!752479 (=> res!508171 e!419718)))

(assert (=> b!752479 (= res!508171 (or (not (is-Intermediate!7634 lt!334712)) (bvslt x!1131 (x!63824 lt!334712)) (not (= x!1131 (x!63824 lt!334712))) (not (= index!1321 (index!32906 lt!334712)))))))

(assert (=> b!752479 e!419728))

(declare-fun res!508168 () Bool)

(assert (=> b!752479 (=> (not res!508168) (not e!419728))))

(assert (=> b!752479 (= res!508168 (= lt!334719 lt!334714))))

(assert (=> b!752479 (= lt!334714 (Found!7634 j!159))))

(assert (=> b!752479 (= lt!334719 (seekEntryOrOpen!0 (select (arr!20034 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752479 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334713 () Unit!25916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25916)

(assert (=> b!752479 (= lt!334713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752480 () Bool)

(declare-fun res!508156 () Bool)

(assert (=> b!752480 (=> (not res!508156) (not e!419721))))

(declare-datatypes ((List!14036 0))(
  ( (Nil!14033) (Cons!14032 (h!15104 (_ BitVec 64)) (t!20351 List!14036)) )
))
(declare-fun arrayNoDuplicates!0 (array!41841 (_ BitVec 32) List!14036) Bool)

(assert (=> b!752480 (= res!508156 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14033))))

(declare-fun b!752481 () Bool)

(declare-fun res!508169 () Bool)

(assert (=> b!752481 (=> (not res!508169) (not e!419719))))

(assert (=> b!752481 (= res!508169 (validKeyInArray!0 k!2102))))

(assert (= (and start!65668 res!508167) b!752471))

(assert (= (and b!752471 res!508162) b!752463))

(assert (= (and b!752463 res!508161) b!752481))

(assert (= (and b!752481 res!508169) b!752460))

(assert (= (and b!752460 res!508166) b!752468))

(assert (= (and b!752468 res!508172) b!752478))

(assert (= (and b!752478 res!508157) b!752480))

(assert (= (and b!752480 res!508156) b!752473))

(assert (= (and b!752473 res!508154) b!752465))

(assert (= (and b!752465 res!508160) b!752474))

(assert (= (and b!752474 res!508170) b!752464))

(assert (= (and b!752464 c!82533) b!752477))

(assert (= (and b!752464 (not c!82533)) b!752476))

(assert (= (and b!752464 res!508158) b!752470))

(assert (= (and b!752470 res!508159) b!752479))

(assert (= (and b!752479 res!508168) b!752462))

(assert (= (and b!752479 (not res!508171)) b!752459))

(assert (= (and b!752459 (not res!508164)) b!752461))

(assert (= (and b!752461 (not res!508163)) b!752475))

(assert (= (and b!752475 c!82534) b!752469))

(assert (= (and b!752475 (not c!82534)) b!752472))

(assert (= (and b!752475 res!508155) b!752467))

(assert (= (and b!752467 res!508165) b!752466))

(declare-fun m!701395 () Bool)

(assert (=> b!752467 m!701395))

(declare-fun m!701397 () Bool)

(assert (=> b!752467 m!701397))

(declare-fun m!701399 () Bool)

(assert (=> b!752476 m!701399))

(assert (=> b!752476 m!701399))

(declare-fun m!701401 () Bool)

(assert (=> b!752476 m!701401))

(assert (=> b!752479 m!701399))

(assert (=> b!752479 m!701399))

(declare-fun m!701403 () Bool)

(assert (=> b!752479 m!701403))

(declare-fun m!701405 () Bool)

(assert (=> b!752479 m!701405))

(declare-fun m!701407 () Bool)

(assert (=> b!752479 m!701407))

(assert (=> b!752477 m!701399))

(assert (=> b!752477 m!701399))

(declare-fun m!701409 () Bool)

(assert (=> b!752477 m!701409))

(declare-fun m!701411 () Bool)

(assert (=> b!752478 m!701411))

(assert (=> b!752459 m!701399))

(assert (=> b!752459 m!701399))

(assert (=> b!752459 m!701401))

(assert (=> b!752463 m!701399))

(assert (=> b!752463 m!701399))

(declare-fun m!701413 () Bool)

(assert (=> b!752463 m!701413))

(declare-fun m!701415 () Bool)

(assert (=> b!752474 m!701415))

(assert (=> b!752465 m!701399))

(assert (=> b!752465 m!701399))

(declare-fun m!701417 () Bool)

(assert (=> b!752465 m!701417))

(assert (=> b!752465 m!701417))

(assert (=> b!752465 m!701399))

(declare-fun m!701419 () Bool)

(assert (=> b!752465 m!701419))

(declare-fun m!701421 () Bool)

(assert (=> b!752470 m!701421))

(declare-fun m!701423 () Bool)

(assert (=> b!752470 m!701423))

(declare-fun m!701425 () Bool)

(assert (=> b!752470 m!701425))

(declare-fun m!701427 () Bool)

(assert (=> b!752470 m!701427))

(assert (=> b!752470 m!701427))

(declare-fun m!701429 () Bool)

(assert (=> b!752470 m!701429))

(declare-fun m!701431 () Bool)

(assert (=> b!752460 m!701431))

(declare-fun m!701433 () Bool)

(assert (=> b!752481 m!701433))

(declare-fun m!701435 () Bool)

(assert (=> b!752480 m!701435))

(declare-fun m!701437 () Bool)

(assert (=> start!65668 m!701437))

(declare-fun m!701439 () Bool)

(assert (=> start!65668 m!701439))

(declare-fun m!701441 () Bool)

(assert (=> b!752468 m!701441))

(assert (=> b!752462 m!701399))

(assert (=> b!752462 m!701399))

(declare-fun m!701443 () Bool)

(assert (=> b!752462 m!701443))

(assert (=> b!752461 m!701421))

(declare-fun m!701445 () Bool)

(assert (=> b!752461 m!701445))

(push 1)

