; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64490 () Bool)

(assert start!64490)

(declare-datatypes ((SeekEntryResult!7225 0))(
  ( (MissingZero!7225 (index!31268 (_ BitVec 32))) (Found!7225 (index!31269 (_ BitVec 32))) (Intermediate!7225 (undefined!8037 Bool) (index!31270 (_ BitVec 32)) (x!62259 (_ BitVec 32))) (Undefined!7225) (MissingVacant!7225 (index!31271 (_ BitVec 32))) )
))
(declare-fun lt!321395 () SeekEntryResult!7225)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41008 0))(
  ( (array!41009 (arr!19625 (Array (_ BitVec 32) (_ BitVec 64))) (size!20046 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41008)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!406315 () Bool)

(declare-fun b!725570 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41008 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!725570 (= e!406315 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321395))))

(declare-fun b!725571 () Bool)

(declare-fun res!486659 () Bool)

(declare-fun e!406316 () Bool)

(assert (=> b!725571 (=> (not res!486659) (not e!406316))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725571 (= res!486659 (validKeyInArray!0 k!2102))))

(declare-fun b!725572 () Bool)

(declare-fun res!486663 () Bool)

(declare-fun e!406317 () Bool)

(assert (=> b!725572 (=> (not res!486663) (not e!406317))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725572 (= res!486663 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19625 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725573 () Bool)

(declare-fun e!406318 () Bool)

(assert (=> b!725573 (= e!406318 e!406315)))

(declare-fun res!486660 () Bool)

(assert (=> b!725573 (=> (not res!486660) (not e!406315))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41008 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!725573 (= res!486660 (= (seekEntryOrOpen!0 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321395))))

(assert (=> b!725573 (= lt!321395 (Found!7225 j!159))))

(declare-fun b!725574 () Bool)

(declare-fun res!486664 () Bool)

(assert (=> b!725574 (=> (not res!486664) (not e!406317))))

(declare-fun e!406312 () Bool)

(assert (=> b!725574 (= res!486664 e!406312)))

(declare-fun c!79831 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725574 (= c!79831 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725575 () Bool)

(declare-fun e!406319 () Bool)

(assert (=> b!725575 (= e!406319 (not true))))

(assert (=> b!725575 e!406318))

(declare-fun res!486665 () Bool)

(assert (=> b!725575 (=> (not res!486665) (not e!406318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41008 (_ BitVec 32)) Bool)

(assert (=> b!725575 (= res!486665 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24768 0))(
  ( (Unit!24769) )
))
(declare-fun lt!321394 () Unit!24768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24768)

(assert (=> b!725575 (= lt!321394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!486656 () Bool)

(assert (=> start!64490 (=> (not res!486656) (not e!406316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64490 (= res!486656 (validMask!0 mask!3328))))

(assert (=> start!64490 e!406316))

(assert (=> start!64490 true))

(declare-fun array_inv!15421 (array!41008) Bool)

(assert (=> start!64490 (array_inv!15421 a!3186)))

(declare-fun b!725576 () Bool)

(declare-fun res!486655 () Bool)

(declare-fun e!406313 () Bool)

(assert (=> b!725576 (=> (not res!486655) (not e!406313))))

(declare-datatypes ((List!13627 0))(
  ( (Nil!13624) (Cons!13623 (h!14680 (_ BitVec 64)) (t!19942 List!13627)) )
))
(declare-fun arrayNoDuplicates!0 (array!41008 (_ BitVec 32) List!13627) Bool)

(assert (=> b!725576 (= res!486655 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13624))))

(declare-fun b!725577 () Bool)

(assert (=> b!725577 (= e!406317 e!406319)))

(declare-fun res!486657 () Bool)

(assert (=> b!725577 (=> (not res!486657) (not e!406319))))

(declare-fun lt!321392 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321390 () array!41008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41008 (_ BitVec 32)) SeekEntryResult!7225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725577 (= res!486657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321392 mask!3328) lt!321392 lt!321390 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321392 lt!321390 mask!3328)))))

(assert (=> b!725577 (= lt!321392 (select (store (arr!19625 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725577 (= lt!321390 (array!41009 (store (arr!19625 a!3186) i!1173 k!2102) (size!20046 a!3186)))))

(declare-fun lt!321393 () SeekEntryResult!7225)

(declare-fun b!725578 () Bool)

(assert (=> b!725578 (= e!406312 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321393))))

(declare-fun b!725579 () Bool)

(assert (=> b!725579 (= e!406316 e!406313)))

(declare-fun res!486668 () Bool)

(assert (=> b!725579 (=> (not res!486668) (not e!406313))))

(declare-fun lt!321391 () SeekEntryResult!7225)

(assert (=> b!725579 (= res!486668 (or (= lt!321391 (MissingZero!7225 i!1173)) (= lt!321391 (MissingVacant!7225 i!1173))))))

(assert (=> b!725579 (= lt!321391 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725580 () Bool)

(declare-fun res!486654 () Bool)

(assert (=> b!725580 (=> (not res!486654) (not e!406313))))

(assert (=> b!725580 (= res!486654 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20046 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20046 a!3186))))))

(declare-fun b!725581 () Bool)

(assert (=> b!725581 (= e!406313 e!406317)))

(declare-fun res!486661 () Bool)

(assert (=> b!725581 (=> (not res!486661) (not e!406317))))

(assert (=> b!725581 (= res!486661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19625 a!3186) j!159) mask!3328) (select (arr!19625 a!3186) j!159) a!3186 mask!3328) lt!321393))))

(assert (=> b!725581 (= lt!321393 (Intermediate!7225 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725582 () Bool)

(declare-fun res!486667 () Bool)

(assert (=> b!725582 (=> (not res!486667) (not e!406316))))

(assert (=> b!725582 (= res!486667 (and (= (size!20046 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20046 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20046 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725583 () Bool)

(declare-fun res!486662 () Bool)

(assert (=> b!725583 (=> (not res!486662) (not e!406316))))

(declare-fun arrayContainsKey!0 (array!41008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725583 (= res!486662 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725584 () Bool)

(assert (=> b!725584 (= e!406312 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19625 a!3186) j!159) a!3186 mask!3328) (Found!7225 j!159)))))

(declare-fun b!725585 () Bool)

(declare-fun res!486666 () Bool)

(assert (=> b!725585 (=> (not res!486666) (not e!406316))))

(assert (=> b!725585 (= res!486666 (validKeyInArray!0 (select (arr!19625 a!3186) j!159)))))

(declare-fun b!725586 () Bool)

(declare-fun res!486658 () Bool)

(assert (=> b!725586 (=> (not res!486658) (not e!406313))))

(assert (=> b!725586 (= res!486658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64490 res!486656) b!725582))

(assert (= (and b!725582 res!486667) b!725585))

(assert (= (and b!725585 res!486666) b!725571))

(assert (= (and b!725571 res!486659) b!725583))

(assert (= (and b!725583 res!486662) b!725579))

(assert (= (and b!725579 res!486668) b!725586))

(assert (= (and b!725586 res!486658) b!725576))

(assert (= (and b!725576 res!486655) b!725580))

(assert (= (and b!725580 res!486654) b!725581))

(assert (= (and b!725581 res!486661) b!725572))

(assert (= (and b!725572 res!486663) b!725574))

(assert (= (and b!725574 c!79831) b!725578))

(assert (= (and b!725574 (not c!79831)) b!725584))

(assert (= (and b!725574 res!486664) b!725577))

(assert (= (and b!725577 res!486657) b!725575))

(assert (= (and b!725575 res!486665) b!725573))

(assert (= (and b!725573 res!486660) b!725570))

(declare-fun m!679719 () Bool)

(assert (=> b!725575 m!679719))

(declare-fun m!679721 () Bool)

(assert (=> b!725575 m!679721))

(declare-fun m!679723 () Bool)

(assert (=> b!725583 m!679723))

(declare-fun m!679725 () Bool)

(assert (=> b!725586 m!679725))

(declare-fun m!679727 () Bool)

(assert (=> b!725578 m!679727))

(assert (=> b!725578 m!679727))

(declare-fun m!679729 () Bool)

(assert (=> b!725578 m!679729))

(declare-fun m!679731 () Bool)

(assert (=> b!725579 m!679731))

(assert (=> b!725581 m!679727))

(assert (=> b!725581 m!679727))

(declare-fun m!679733 () Bool)

(assert (=> b!725581 m!679733))

(assert (=> b!725581 m!679733))

(assert (=> b!725581 m!679727))

(declare-fun m!679735 () Bool)

(assert (=> b!725581 m!679735))

(assert (=> b!725585 m!679727))

(assert (=> b!725585 m!679727))

(declare-fun m!679737 () Bool)

(assert (=> b!725585 m!679737))

(declare-fun m!679739 () Bool)

(assert (=> b!725571 m!679739))

(assert (=> b!725573 m!679727))

(assert (=> b!725573 m!679727))

(declare-fun m!679741 () Bool)

(assert (=> b!725573 m!679741))

(declare-fun m!679743 () Bool)

(assert (=> start!64490 m!679743))

(declare-fun m!679745 () Bool)

(assert (=> start!64490 m!679745))

(declare-fun m!679747 () Bool)

(assert (=> b!725577 m!679747))

(assert (=> b!725577 m!679747))

(declare-fun m!679749 () Bool)

(assert (=> b!725577 m!679749))

(declare-fun m!679751 () Bool)

(assert (=> b!725577 m!679751))

(declare-fun m!679753 () Bool)

(assert (=> b!725577 m!679753))

(declare-fun m!679755 () Bool)

(assert (=> b!725577 m!679755))

(assert (=> b!725584 m!679727))

(assert (=> b!725584 m!679727))

(declare-fun m!679757 () Bool)

(assert (=> b!725584 m!679757))

(declare-fun m!679759 () Bool)

(assert (=> b!725572 m!679759))

(assert (=> b!725570 m!679727))

(assert (=> b!725570 m!679727))

(declare-fun m!679761 () Bool)

(assert (=> b!725570 m!679761))

(declare-fun m!679763 () Bool)

(assert (=> b!725576 m!679763))

(push 1)

