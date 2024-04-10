; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65822 () Bool)

(assert start!65822)

(declare-fun b!757772 () Bool)

(declare-datatypes ((Unit!26224 0))(
  ( (Unit!26225) )
))
(declare-fun e!422494 () Unit!26224)

(declare-fun Unit!26226 () Unit!26224)

(assert (=> b!757772 (= e!422494 Unit!26226)))

(assert (=> b!757772 false))

(declare-fun b!757773 () Bool)

(declare-fun res!512547 () Bool)

(declare-fun e!422490 () Bool)

(assert (=> b!757773 (=> (not res!512547) (not e!422490))))

(declare-datatypes ((array!41995 0))(
  ( (array!41996 (arr!20111 (Array (_ BitVec 32) (_ BitVec 64))) (size!20532 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41995)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757773 (= res!512547 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757775 () Bool)

(declare-fun e!422491 () Bool)

(assert (=> b!757775 (= e!422490 e!422491)))

(declare-fun res!512549 () Bool)

(assert (=> b!757775 (=> (not res!512549) (not e!422491))))

(declare-datatypes ((SeekEntryResult!7711 0))(
  ( (MissingZero!7711 (index!33212 (_ BitVec 32))) (Found!7711 (index!33213 (_ BitVec 32))) (Intermediate!7711 (undefined!8523 Bool) (index!33214 (_ BitVec 32)) (x!64101 (_ BitVec 32))) (Undefined!7711) (MissingVacant!7711 (index!33215 (_ BitVec 32))) )
))
(declare-fun lt!337488 () SeekEntryResult!7711)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757775 (= res!512549 (or (= lt!337488 (MissingZero!7711 i!1173)) (= lt!337488 (MissingVacant!7711 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757775 (= lt!337488 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757776 () Bool)

(declare-fun e!422493 () Bool)

(declare-fun e!422498 () Bool)

(assert (=> b!757776 (= e!422493 e!422498)))

(declare-fun res!512557 () Bool)

(assert (=> b!757776 (=> (not res!512557) (not e!422498))))

(declare-fun lt!337483 () SeekEntryResult!7711)

(declare-fun lt!337486 () SeekEntryResult!7711)

(assert (=> b!757776 (= res!512557 (= lt!337483 lt!337486))))

(declare-fun lt!337484 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337489 () array!41995)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757776 (= lt!337486 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337484 lt!337489 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757776 (= lt!337483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337484 mask!3328) lt!337484 lt!337489 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!757776 (= lt!337484 (select (store (arr!20111 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757776 (= lt!337489 (array!41996 (store (arr!20111 a!3186) i!1173 k!2102) (size!20532 a!3186)))))

(declare-fun b!757777 () Bool)

(declare-fun res!512554 () Bool)

(assert (=> b!757777 (=> (not res!512554) (not e!422493))))

(declare-fun e!422501 () Bool)

(assert (=> b!757777 (= res!512554 e!422501)))

(declare-fun c!82995 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757777 (= c!82995 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757778 () Bool)

(declare-fun res!512552 () Bool)

(assert (=> b!757778 (=> (not res!512552) (not e!422493))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757778 (= res!512552 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20111 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757779 () Bool)

(declare-fun lt!337490 () SeekEntryResult!7711)

(assert (=> b!757779 (= e!422501 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337490))))

(declare-fun e!422492 () Bool)

(declare-fun lt!337493 () SeekEntryResult!7711)

(declare-fun b!757780 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41995 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!757780 (= e!422492 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337493))))

(declare-fun b!757781 () Bool)

(declare-fun e!422496 () Bool)

(assert (=> b!757781 (= e!422498 (not e!422496))))

(declare-fun res!512548 () Bool)

(assert (=> b!757781 (=> res!512548 e!422496)))

(assert (=> b!757781 (= res!512548 (or (not (is-Intermediate!7711 lt!337486)) (bvslt x!1131 (x!64101 lt!337486)) (not (= x!1131 (x!64101 lt!337486))) (not (= index!1321 (index!33214 lt!337486)))))))

(assert (=> b!757781 e!422492))

(declare-fun res!512545 () Bool)

(assert (=> b!757781 (=> (not res!512545) (not e!422492))))

(declare-fun lt!337491 () SeekEntryResult!7711)

(assert (=> b!757781 (= res!512545 (= lt!337491 lt!337493))))

(assert (=> b!757781 (= lt!337493 (Found!7711 j!159))))

(assert (=> b!757781 (= lt!337491 (seekEntryOrOpen!0 (select (arr!20111 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41995 (_ BitVec 32)) Bool)

(assert (=> b!757781 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337485 () Unit!26224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26224)

(assert (=> b!757781 (= lt!337485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757782 () Bool)

(declare-fun e!422499 () Bool)

(assert (=> b!757782 (= e!422496 e!422499)))

(declare-fun res!512544 () Bool)

(assert (=> b!757782 (=> res!512544 e!422499)))

(declare-fun lt!337487 () SeekEntryResult!7711)

(assert (=> b!757782 (= res!512544 (not (= lt!337487 lt!337493)))))

(assert (=> b!757782 (= lt!337487 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757783 () Bool)

(assert (=> b!757783 (= e!422501 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20111 a!3186) j!159) a!3186 mask!3328) (Found!7711 j!159)))))

(declare-fun b!757784 () Bool)

(declare-fun e!422500 () Bool)

(assert (=> b!757784 (= e!422500 (= lt!337491 lt!337487))))

(declare-fun b!757785 () Bool)

(declare-fun res!512543 () Bool)

(assert (=> b!757785 (=> (not res!512543) (not e!422500))))

(assert (=> b!757785 (= res!512543 (= (seekEntryOrOpen!0 lt!337484 lt!337489 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337484 lt!337489 mask!3328)))))

(declare-fun b!757786 () Bool)

(declare-fun res!512556 () Bool)

(assert (=> b!757786 (=> (not res!512556) (not e!422490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757786 (= res!512556 (validKeyInArray!0 k!2102))))

(declare-fun b!757787 () Bool)

(declare-fun res!512550 () Bool)

(assert (=> b!757787 (=> (not res!512550) (not e!422491))))

(assert (=> b!757787 (= res!512550 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20532 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20532 a!3186))))))

(declare-fun b!757774 () Bool)

(declare-fun res!512555 () Bool)

(assert (=> b!757774 (=> (not res!512555) (not e!422490))))

(assert (=> b!757774 (= res!512555 (validKeyInArray!0 (select (arr!20111 a!3186) j!159)))))

(declare-fun res!512561 () Bool)

(assert (=> start!65822 (=> (not res!512561) (not e!422490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65822 (= res!512561 (validMask!0 mask!3328))))

(assert (=> start!65822 e!422490))

(assert (=> start!65822 true))

(declare-fun array_inv!15907 (array!41995) Bool)

(assert (=> start!65822 (array_inv!15907 a!3186)))

(declare-fun b!757788 () Bool)

(assert (=> b!757788 (= e!422491 e!422493)))

(declare-fun res!512560 () Bool)

(assert (=> b!757788 (=> (not res!512560) (not e!422493))))

(assert (=> b!757788 (= res!512560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20111 a!3186) j!159) mask!3328) (select (arr!20111 a!3186) j!159) a!3186 mask!3328) lt!337490))))

(assert (=> b!757788 (= lt!337490 (Intermediate!7711 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757789 () Bool)

(declare-fun e!422495 () Bool)

(assert (=> b!757789 (= e!422499 e!422495)))

(declare-fun res!512559 () Bool)

(assert (=> b!757789 (=> res!512559 e!422495)))

(declare-fun lt!337492 () (_ BitVec 64))

(assert (=> b!757789 (= res!512559 (= lt!337492 lt!337484))))

(assert (=> b!757789 (= lt!337492 (select (store (arr!20111 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757790 () Bool)

(declare-fun res!512558 () Bool)

(assert (=> b!757790 (=> (not res!512558) (not e!422491))))

(declare-datatypes ((List!14113 0))(
  ( (Nil!14110) (Cons!14109 (h!15181 (_ BitVec 64)) (t!20428 List!14113)) )
))
(declare-fun arrayNoDuplicates!0 (array!41995 (_ BitVec 32) List!14113) Bool)

(assert (=> b!757790 (= res!512558 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14110))))

(declare-fun b!757791 () Bool)

(declare-fun Unit!26227 () Unit!26224)

(assert (=> b!757791 (= e!422494 Unit!26227)))

(declare-fun b!757792 () Bool)

(assert (=> b!757792 (= e!422495 true)))

(assert (=> b!757792 e!422500))

(declare-fun res!512553 () Bool)

(assert (=> b!757792 (=> (not res!512553) (not e!422500))))

(assert (=> b!757792 (= res!512553 (= lt!337492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337482 () Unit!26224)

(assert (=> b!757792 (= lt!337482 e!422494)))

(declare-fun c!82996 () Bool)

(assert (=> b!757792 (= c!82996 (= lt!337492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757793 () Bool)

(declare-fun res!512551 () Bool)

(assert (=> b!757793 (=> (not res!512551) (not e!422491))))

(assert (=> b!757793 (= res!512551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757794 () Bool)

(declare-fun res!512546 () Bool)

(assert (=> b!757794 (=> (not res!512546) (not e!422490))))

(assert (=> b!757794 (= res!512546 (and (= (size!20532 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20532 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20532 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65822 res!512561) b!757794))

(assert (= (and b!757794 res!512546) b!757774))

(assert (= (and b!757774 res!512555) b!757786))

(assert (= (and b!757786 res!512556) b!757773))

(assert (= (and b!757773 res!512547) b!757775))

(assert (= (and b!757775 res!512549) b!757793))

(assert (= (and b!757793 res!512551) b!757790))

(assert (= (and b!757790 res!512558) b!757787))

(assert (= (and b!757787 res!512550) b!757788))

(assert (= (and b!757788 res!512560) b!757778))

(assert (= (and b!757778 res!512552) b!757777))

(assert (= (and b!757777 c!82995) b!757779))

(assert (= (and b!757777 (not c!82995)) b!757783))

(assert (= (and b!757777 res!512554) b!757776))

(assert (= (and b!757776 res!512557) b!757781))

(assert (= (and b!757781 res!512545) b!757780))

(assert (= (and b!757781 (not res!512548)) b!757782))

(assert (= (and b!757782 (not res!512544)) b!757789))

(assert (= (and b!757789 (not res!512559)) b!757792))

(assert (= (and b!757792 c!82996) b!757772))

(assert (= (and b!757792 (not c!82996)) b!757791))

(assert (= (and b!757792 res!512553) b!757785))

(assert (= (and b!757785 res!512543) b!757784))

(declare-fun m!705399 () Bool)

(assert (=> b!757774 m!705399))

(assert (=> b!757774 m!705399))

(declare-fun m!705401 () Bool)

(assert (=> b!757774 m!705401))

(declare-fun m!705403 () Bool)

(assert (=> b!757775 m!705403))

(assert (=> b!757779 m!705399))

(assert (=> b!757779 m!705399))

(declare-fun m!705405 () Bool)

(assert (=> b!757779 m!705405))

(assert (=> b!757781 m!705399))

(assert (=> b!757781 m!705399))

(declare-fun m!705407 () Bool)

(assert (=> b!757781 m!705407))

(declare-fun m!705409 () Bool)

(assert (=> b!757781 m!705409))

(declare-fun m!705411 () Bool)

(assert (=> b!757781 m!705411))

(assert (=> b!757788 m!705399))

(assert (=> b!757788 m!705399))

(declare-fun m!705413 () Bool)

(assert (=> b!757788 m!705413))

(assert (=> b!757788 m!705413))

(assert (=> b!757788 m!705399))

(declare-fun m!705415 () Bool)

(assert (=> b!757788 m!705415))

(declare-fun m!705417 () Bool)

(assert (=> b!757773 m!705417))

(declare-fun m!705419 () Bool)

(assert (=> b!757786 m!705419))

(declare-fun m!705421 () Bool)

(assert (=> start!65822 m!705421))

(declare-fun m!705423 () Bool)

(assert (=> start!65822 m!705423))

(declare-fun m!705425 () Bool)

(assert (=> b!757789 m!705425))

(declare-fun m!705427 () Bool)

(assert (=> b!757789 m!705427))

(declare-fun m!705429 () Bool)

(assert (=> b!757790 m!705429))

(assert (=> b!757783 m!705399))

(assert (=> b!757783 m!705399))

(declare-fun m!705431 () Bool)

(assert (=> b!757783 m!705431))

(declare-fun m!705433 () Bool)

(assert (=> b!757793 m!705433))

(declare-fun m!705435 () Bool)

(assert (=> b!757778 m!705435))

(declare-fun m!705437 () Bool)

(assert (=> b!757776 m!705437))

(assert (=> b!757776 m!705425))

(assert (=> b!757776 m!705437))

(declare-fun m!705439 () Bool)

(assert (=> b!757776 m!705439))

(declare-fun m!705441 () Bool)

(assert (=> b!757776 m!705441))

(declare-fun m!705443 () Bool)

(assert (=> b!757776 m!705443))

(assert (=> b!757780 m!705399))

(assert (=> b!757780 m!705399))

(declare-fun m!705445 () Bool)

(assert (=> b!757780 m!705445))

(declare-fun m!705447 () Bool)

(assert (=> b!757785 m!705447))

(declare-fun m!705449 () Bool)

(assert (=> b!757785 m!705449))

(assert (=> b!757782 m!705399))

(assert (=> b!757782 m!705399))

(assert (=> b!757782 m!705431))

(push 1)

