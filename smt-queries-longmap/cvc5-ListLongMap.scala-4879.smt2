; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67254 () Bool)

(assert start!67254)

(declare-fun b!777539 () Bool)

(declare-fun e!432655 () Bool)

(declare-fun e!432654 () Bool)

(assert (=> b!777539 (= e!432655 e!432654)))

(declare-fun res!525960 () Bool)

(assert (=> b!777539 (=> (not res!525960) (not e!432654))))

(declare-datatypes ((SeekEntryResult!7967 0))(
  ( (MissingZero!7967 (index!34236 (_ BitVec 32))) (Found!7967 (index!34237 (_ BitVec 32))) (Intermediate!7967 (undefined!8779 Bool) (index!34238 (_ BitVec 32)) (x!65183 (_ BitVec 32))) (Undefined!7967) (MissingVacant!7967 (index!34239 (_ BitVec 32))) )
))
(declare-fun lt!346407 () SeekEntryResult!7967)

(declare-fun lt!346412 () SeekEntryResult!7967)

(assert (=> b!777539 (= res!525960 (= lt!346407 lt!346412))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!346409 () (_ BitVec 64))

(declare-datatypes ((array!42546 0))(
  ( (array!42547 (arr!20367 (Array (_ BitVec 32) (_ BitVec 64))) (size!20788 (_ BitVec 32))) )
))
(declare-fun lt!346415 () array!42546)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42546 (_ BitVec 32)) SeekEntryResult!7967)

(assert (=> b!777539 (= lt!346412 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346409 lt!346415 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777539 (= lt!346407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346409 mask!3328) lt!346409 lt!346415 mask!3328))))

(declare-fun a!3186 () array!42546)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!777539 (= lt!346409 (select (store (arr!20367 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777539 (= lt!346415 (array!42547 (store (arr!20367 a!3186) i!1173 k!2102) (size!20788 a!3186)))))

(declare-fun lt!346408 () SeekEntryResult!7967)

(declare-fun b!777540 () Bool)

(declare-fun e!432649 () Bool)

(assert (=> b!777540 (= e!432649 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20367 a!3186) j!159) a!3186 mask!3328) lt!346408))))

(declare-fun b!777541 () Bool)

(declare-fun res!525963 () Bool)

(assert (=> b!777541 (=> (not res!525963) (not e!432655))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!777541 (= res!525963 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20367 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777542 () Bool)

(declare-fun e!432652 () Bool)

(declare-fun e!432651 () Bool)

(assert (=> b!777542 (= e!432652 e!432651)))

(declare-fun res!525976 () Bool)

(assert (=> b!777542 (=> (not res!525976) (not e!432651))))

(declare-fun lt!346411 () SeekEntryResult!7967)

(assert (=> b!777542 (= res!525976 (or (= lt!346411 (MissingZero!7967 i!1173)) (= lt!346411 (MissingVacant!7967 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42546 (_ BitVec 32)) SeekEntryResult!7967)

(assert (=> b!777542 (= lt!346411 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!777543 () Bool)

(declare-fun res!525973 () Bool)

(declare-fun e!432653 () Bool)

(assert (=> b!777543 (=> res!525973 e!432653)))

(assert (=> b!777543 (= res!525973 (or (not (= (select (store (arr!20367 a!3186) i!1173 k!2102) index!1321) lt!346409)) (undefined!8779 lt!346412)))))

(declare-fun b!777544 () Bool)

(declare-fun res!525967 () Bool)

(assert (=> b!777544 (=> (not res!525967) (not e!432652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777544 (= res!525967 (validKeyInArray!0 k!2102))))

(declare-fun b!777545 () Bool)

(declare-fun res!525964 () Bool)

(assert (=> b!777545 (=> (not res!525964) (not e!432652))))

(assert (=> b!777545 (= res!525964 (and (= (size!20788 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20788 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20788 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777547 () Bool)

(assert (=> b!777547 (= e!432651 e!432655)))

(declare-fun res!525970 () Bool)

(assert (=> b!777547 (=> (not res!525970) (not e!432655))))

(assert (=> b!777547 (= res!525970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20367 a!3186) j!159) mask!3328) (select (arr!20367 a!3186) j!159) a!3186 mask!3328) lt!346408))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777547 (= lt!346408 (Intermediate!7967 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777548 () Bool)

(declare-fun e!432656 () Bool)

(declare-fun e!432648 () Bool)

(assert (=> b!777548 (= e!432656 e!432648)))

(declare-fun res!525966 () Bool)

(assert (=> b!777548 (=> (not res!525966) (not e!432648))))

(declare-fun lt!346410 () SeekEntryResult!7967)

(assert (=> b!777548 (= res!525966 (= (seekEntryOrOpen!0 (select (arr!20367 a!3186) j!159) a!3186 mask!3328) lt!346410))))

(assert (=> b!777548 (= lt!346410 (Found!7967 j!159))))

(declare-fun b!777549 () Bool)

(declare-fun res!525961 () Bool)

(assert (=> b!777549 (=> (not res!525961) (not e!432651))))

(declare-datatypes ((List!14369 0))(
  ( (Nil!14366) (Cons!14365 (h!15476 (_ BitVec 64)) (t!20684 List!14369)) )
))
(declare-fun arrayNoDuplicates!0 (array!42546 (_ BitVec 32) List!14369) Bool)

(assert (=> b!777549 (= res!525961 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14366))))

(declare-fun b!777550 () Bool)

(assert (=> b!777550 (= e!432654 (not e!432653))))

(declare-fun res!525969 () Bool)

(assert (=> b!777550 (=> res!525969 e!432653)))

(assert (=> b!777550 (= res!525969 (or (not (is-Intermediate!7967 lt!346412)) (bvslt x!1131 (x!65183 lt!346412)) (not (= x!1131 (x!65183 lt!346412))) (not (= index!1321 (index!34238 lt!346412)))))))

(assert (=> b!777550 e!432656))

(declare-fun res!525972 () Bool)

(assert (=> b!777550 (=> (not res!525972) (not e!432656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42546 (_ BitVec 32)) Bool)

(assert (=> b!777550 (= res!525972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26828 0))(
  ( (Unit!26829) )
))
(declare-fun lt!346413 () Unit!26828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26828)

(assert (=> b!777550 (= lt!346413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777551 () Bool)

(declare-fun res!525968 () Bool)

(assert (=> b!777551 (=> (not res!525968) (not e!432651))))

(assert (=> b!777551 (= res!525968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42546 (_ BitVec 32)) SeekEntryResult!7967)

(assert (=> b!777552 (= e!432649 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20367 a!3186) j!159) a!3186 mask!3328) (Found!7967 j!159)))))

(declare-fun b!777553 () Bool)

(declare-fun res!525974 () Bool)

(assert (=> b!777553 (=> (not res!525974) (not e!432652))))

(assert (=> b!777553 (= res!525974 (validKeyInArray!0 (select (arr!20367 a!3186) j!159)))))

(declare-fun b!777554 () Bool)

(declare-fun res!525965 () Bool)

(assert (=> b!777554 (=> (not res!525965) (not e!432652))))

(declare-fun arrayContainsKey!0 (array!42546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777554 (= res!525965 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777555 () Bool)

(declare-fun res!525962 () Bool)

(assert (=> b!777555 (=> (not res!525962) (not e!432655))))

(assert (=> b!777555 (= res!525962 e!432649)))

(declare-fun c!86191 () Bool)

(assert (=> b!777555 (= c!86191 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777556 () Bool)

(assert (=> b!777556 (= e!432653 true)))

(declare-fun lt!346414 () SeekEntryResult!7967)

(assert (=> b!777556 (= lt!346414 (seekEntryOrOpen!0 lt!346409 lt!346415 mask!3328))))

(declare-fun res!525971 () Bool)

(assert (=> start!67254 (=> (not res!525971) (not e!432652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67254 (= res!525971 (validMask!0 mask!3328))))

(assert (=> start!67254 e!432652))

(assert (=> start!67254 true))

(declare-fun array_inv!16163 (array!42546) Bool)

(assert (=> start!67254 (array_inv!16163 a!3186)))

(declare-fun b!777546 () Bool)

(assert (=> b!777546 (= e!432648 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20367 a!3186) j!159) a!3186 mask!3328) lt!346410))))

(declare-fun b!777557 () Bool)

(declare-fun res!525977 () Bool)

(assert (=> b!777557 (=> res!525977 e!432653)))

(assert (=> b!777557 (= res!525977 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20367 a!3186) j!159) a!3186 mask!3328) (Found!7967 j!159))))))

(declare-fun b!777558 () Bool)

(declare-fun res!525975 () Bool)

(assert (=> b!777558 (=> (not res!525975) (not e!432651))))

(assert (=> b!777558 (= res!525975 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20788 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20788 a!3186))))))

(assert (= (and start!67254 res!525971) b!777545))

(assert (= (and b!777545 res!525964) b!777553))

(assert (= (and b!777553 res!525974) b!777544))

(assert (= (and b!777544 res!525967) b!777554))

(assert (= (and b!777554 res!525965) b!777542))

(assert (= (and b!777542 res!525976) b!777551))

(assert (= (and b!777551 res!525968) b!777549))

(assert (= (and b!777549 res!525961) b!777558))

(assert (= (and b!777558 res!525975) b!777547))

(assert (= (and b!777547 res!525970) b!777541))

(assert (= (and b!777541 res!525963) b!777555))

(assert (= (and b!777555 c!86191) b!777540))

(assert (= (and b!777555 (not c!86191)) b!777552))

(assert (= (and b!777555 res!525962) b!777539))

(assert (= (and b!777539 res!525960) b!777550))

(assert (= (and b!777550 res!525972) b!777548))

(assert (= (and b!777548 res!525966) b!777546))

(assert (= (and b!777550 (not res!525969)) b!777557))

(assert (= (and b!777557 (not res!525977)) b!777543))

(assert (= (and b!777543 (not res!525973)) b!777556))

(declare-fun m!721391 () Bool)

(assert (=> b!777541 m!721391))

(declare-fun m!721393 () Bool)

(assert (=> b!777552 m!721393))

(assert (=> b!777552 m!721393))

(declare-fun m!721395 () Bool)

(assert (=> b!777552 m!721395))

(declare-fun m!721397 () Bool)

(assert (=> b!777549 m!721397))

(declare-fun m!721399 () Bool)

(assert (=> start!67254 m!721399))

(declare-fun m!721401 () Bool)

(assert (=> start!67254 m!721401))

(declare-fun m!721403 () Bool)

(assert (=> b!777556 m!721403))

(assert (=> b!777540 m!721393))

(assert (=> b!777540 m!721393))

(declare-fun m!721405 () Bool)

(assert (=> b!777540 m!721405))

(assert (=> b!777546 m!721393))

(assert (=> b!777546 m!721393))

(declare-fun m!721407 () Bool)

(assert (=> b!777546 m!721407))

(declare-fun m!721409 () Bool)

(assert (=> b!777554 m!721409))

(declare-fun m!721411 () Bool)

(assert (=> b!777544 m!721411))

(assert (=> b!777548 m!721393))

(assert (=> b!777548 m!721393))

(declare-fun m!721413 () Bool)

(assert (=> b!777548 m!721413))

(declare-fun m!721415 () Bool)

(assert (=> b!777543 m!721415))

(declare-fun m!721417 () Bool)

(assert (=> b!777543 m!721417))

(declare-fun m!721419 () Bool)

(assert (=> b!777550 m!721419))

(declare-fun m!721421 () Bool)

(assert (=> b!777550 m!721421))

(declare-fun m!721423 () Bool)

(assert (=> b!777551 m!721423))

(declare-fun m!721425 () Bool)

(assert (=> b!777539 m!721425))

(declare-fun m!721427 () Bool)

(assert (=> b!777539 m!721427))

(declare-fun m!721429 () Bool)

(assert (=> b!777539 m!721429))

(assert (=> b!777539 m!721415))

(declare-fun m!721431 () Bool)

(assert (=> b!777539 m!721431))

(assert (=> b!777539 m!721425))

(assert (=> b!777553 m!721393))

(assert (=> b!777553 m!721393))

(declare-fun m!721433 () Bool)

(assert (=> b!777553 m!721433))

(assert (=> b!777557 m!721393))

(assert (=> b!777557 m!721393))

(assert (=> b!777557 m!721395))

(declare-fun m!721435 () Bool)

(assert (=> b!777542 m!721435))

(assert (=> b!777547 m!721393))

(assert (=> b!777547 m!721393))

(declare-fun m!721437 () Bool)

(assert (=> b!777547 m!721437))

(assert (=> b!777547 m!721437))

(assert (=> b!777547 m!721393))

(declare-fun m!721439 () Bool)

(assert (=> b!777547 m!721439))

(push 1)

