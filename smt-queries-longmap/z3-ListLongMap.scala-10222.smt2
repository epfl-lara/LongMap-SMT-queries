; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120572 () Bool)

(assert start!120572)

(declare-fun b!1402484 () Bool)

(declare-fun e!794216 () Bool)

(declare-fun e!794215 () Bool)

(assert (=> b!1402484 (= e!794216 e!794215)))

(declare-fun res!940320 () Bool)

(assert (=> b!1402484 (=> res!940320 e!794215)))

(declare-datatypes ((array!95903 0))(
  ( (array!95904 (arr!46300 (Array (_ BitVec 32) (_ BitVec 64))) (size!46851 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95903)

(declare-fun lt!617265 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10520 0))(
  ( (MissingZero!10520 (index!44457 (_ BitVec 32))) (Found!10520 (index!44458 (_ BitVec 32))) (Intermediate!10520 (undefined!11332 Bool) (index!44459 (_ BitVec 32)) (x!126246 (_ BitVec 32))) (Undefined!10520) (MissingVacant!10520 (index!44460 (_ BitVec 32))) )
))
(declare-fun lt!617267 () SeekEntryResult!10520)

(declare-fun lt!617262 () SeekEntryResult!10520)

(assert (=> b!1402484 (= res!940320 (or (bvslt (x!126246 lt!617267) #b00000000000000000000000000000000) (bvsgt (x!126246 lt!617267) #b01111111111111111111111111111110) (bvslt (x!126246 lt!617262) #b00000000000000000000000000000000) (bvsgt (x!126246 lt!617262) #b01111111111111111111111111111110) (bvslt lt!617265 #b00000000000000000000000000000000) (bvsge lt!617265 (size!46851 a!2901)) (bvslt (index!44459 lt!617267) #b00000000000000000000000000000000) (bvsge (index!44459 lt!617267) (size!46851 a!2901)) (bvslt (index!44459 lt!617262) #b00000000000000000000000000000000) (bvsge (index!44459 lt!617262) (size!46851 a!2901)) (not (= lt!617267 (Intermediate!10520 false (index!44459 lt!617267) (x!126246 lt!617267)))) (not (= lt!617262 (Intermediate!10520 false (index!44459 lt!617262) (x!126246 lt!617262))))))))

(declare-fun e!794212 () Bool)

(assert (=> b!1402484 e!794212))

(declare-fun res!940314 () Bool)

(assert (=> b!1402484 (=> (not res!940314) (not e!794212))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402484 (= res!940314 (and (not (undefined!11332 lt!617262)) (= (index!44459 lt!617262) i!1037) (bvslt (x!126246 lt!617262) (x!126246 lt!617267)) (= (select (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44459 lt!617262)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47071 0))(
  ( (Unit!47072) )
))
(declare-fun lt!617263 () Unit!47071)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47071)

(assert (=> b!1402484 (= lt!617263 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617265 (x!126246 lt!617267) (index!44459 lt!617267) (x!126246 lt!617262) (index!44459 lt!617262) (undefined!11332 lt!617262) mask!2840))))

(declare-fun b!1402485 () Bool)

(declare-fun res!940319 () Bool)

(declare-fun e!794210 () Bool)

(assert (=> b!1402485 (=> (not res!940319) (not e!794210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95903 (_ BitVec 32)) Bool)

(assert (=> b!1402485 (= res!940319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402486 () Bool)

(declare-fun res!940312 () Bool)

(assert (=> b!1402486 (=> (not res!940312) (not e!794210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402486 (= res!940312 (validKeyInArray!0 (select (arr!46300 a!2901) j!112)))))

(declare-fun b!1402487 () Bool)

(declare-fun res!940315 () Bool)

(assert (=> b!1402487 (=> (not res!940315) (not e!794210))))

(assert (=> b!1402487 (= res!940315 (and (= (size!46851 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46851 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46851 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402488 () Bool)

(declare-fun e!794211 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95903 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1402488 (= e!794211 (= (seekEntryOrOpen!0 (select (arr!46300 a!2901) j!112) a!2901 mask!2840) (Found!10520 j!112)))))

(declare-fun res!940316 () Bool)

(assert (=> start!120572 (=> (not res!940316) (not e!794210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120572 (= res!940316 (validMask!0 mask!2840))))

(assert (=> start!120572 e!794210))

(assert (=> start!120572 true))

(declare-fun array_inv!35581 (array!95903) Bool)

(assert (=> start!120572 (array_inv!35581 a!2901)))

(declare-fun b!1402489 () Bool)

(declare-fun res!940313 () Bool)

(assert (=> b!1402489 (=> (not res!940313) (not e!794210))))

(assert (=> b!1402489 (= res!940313 (validKeyInArray!0 (select (arr!46300 a!2901) i!1037)))))

(declare-fun b!1402490 () Bool)

(declare-fun res!940311 () Bool)

(assert (=> b!1402490 (=> (not res!940311) (not e!794210))))

(declare-datatypes ((List!32806 0))(
  ( (Nil!32803) (Cons!32802 (h!34058 (_ BitVec 64)) (t!47492 List!32806)) )
))
(declare-fun arrayNoDuplicates!0 (array!95903 (_ BitVec 32) List!32806) Bool)

(assert (=> b!1402490 (= res!940311 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32803))))

(declare-fun b!1402491 () Bool)

(assert (=> b!1402491 (= e!794215 true)))

(declare-fun lt!617264 () array!95903)

(declare-fun lt!617266 () SeekEntryResult!10520)

(declare-fun lt!617260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95903 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1402491 (= lt!617266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617265 lt!617260 lt!617264 mask!2840))))

(declare-fun b!1402492 () Bool)

(declare-fun e!794213 () Bool)

(assert (=> b!1402492 (= e!794213 e!794216)))

(declare-fun res!940317 () Bool)

(assert (=> b!1402492 (=> res!940317 e!794216)))

(get-info :version)

(assert (=> b!1402492 (= res!940317 (or (= lt!617267 lt!617262) (not ((_ is Intermediate!10520) lt!617262))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402492 (= lt!617262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617260 mask!2840) lt!617260 lt!617264 mask!2840))))

(assert (=> b!1402492 (= lt!617260 (select (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402492 (= lt!617264 (array!95904 (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46851 a!2901)))))

(declare-fun b!1402493 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95903 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1402493 (= e!794212 (= (seekEntryOrOpen!0 lt!617260 lt!617264 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126246 lt!617262) (index!44459 lt!617262) (index!44459 lt!617262) (select (arr!46300 a!2901) j!112) lt!617264 mask!2840)))))

(declare-fun b!1402494 () Bool)

(assert (=> b!1402494 (= e!794210 (not e!794213))))

(declare-fun res!940318 () Bool)

(assert (=> b!1402494 (=> res!940318 e!794213)))

(assert (=> b!1402494 (= res!940318 (or (not ((_ is Intermediate!10520) lt!617267)) (undefined!11332 lt!617267)))))

(assert (=> b!1402494 e!794211))

(declare-fun res!940321 () Bool)

(assert (=> b!1402494 (=> (not res!940321) (not e!794211))))

(assert (=> b!1402494 (= res!940321 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617261 () Unit!47071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47071)

(assert (=> b!1402494 (= lt!617261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402494 (= lt!617267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617265 (select (arr!46300 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402494 (= lt!617265 (toIndex!0 (select (arr!46300 a!2901) j!112) mask!2840))))

(assert (= (and start!120572 res!940316) b!1402487))

(assert (= (and b!1402487 res!940315) b!1402489))

(assert (= (and b!1402489 res!940313) b!1402486))

(assert (= (and b!1402486 res!940312) b!1402485))

(assert (= (and b!1402485 res!940319) b!1402490))

(assert (= (and b!1402490 res!940311) b!1402494))

(assert (= (and b!1402494 res!940321) b!1402488))

(assert (= (and b!1402494 (not res!940318)) b!1402492))

(assert (= (and b!1402492 (not res!940317)) b!1402484))

(assert (= (and b!1402484 res!940314) b!1402493))

(assert (= (and b!1402484 (not res!940320)) b!1402491))

(declare-fun m!1290469 () Bool)

(assert (=> start!120572 m!1290469))

(declare-fun m!1290471 () Bool)

(assert (=> start!120572 m!1290471))

(declare-fun m!1290473 () Bool)

(assert (=> b!1402484 m!1290473))

(declare-fun m!1290475 () Bool)

(assert (=> b!1402484 m!1290475))

(declare-fun m!1290477 () Bool)

(assert (=> b!1402484 m!1290477))

(declare-fun m!1290479 () Bool)

(assert (=> b!1402491 m!1290479))

(declare-fun m!1290481 () Bool)

(assert (=> b!1402488 m!1290481))

(assert (=> b!1402488 m!1290481))

(declare-fun m!1290483 () Bool)

(assert (=> b!1402488 m!1290483))

(assert (=> b!1402486 m!1290481))

(assert (=> b!1402486 m!1290481))

(declare-fun m!1290485 () Bool)

(assert (=> b!1402486 m!1290485))

(assert (=> b!1402494 m!1290481))

(declare-fun m!1290487 () Bool)

(assert (=> b!1402494 m!1290487))

(declare-fun m!1290489 () Bool)

(assert (=> b!1402494 m!1290489))

(assert (=> b!1402494 m!1290481))

(declare-fun m!1290491 () Bool)

(assert (=> b!1402494 m!1290491))

(assert (=> b!1402494 m!1290481))

(declare-fun m!1290493 () Bool)

(assert (=> b!1402494 m!1290493))

(declare-fun m!1290495 () Bool)

(assert (=> b!1402490 m!1290495))

(declare-fun m!1290497 () Bool)

(assert (=> b!1402492 m!1290497))

(assert (=> b!1402492 m!1290497))

(declare-fun m!1290499 () Bool)

(assert (=> b!1402492 m!1290499))

(assert (=> b!1402492 m!1290473))

(declare-fun m!1290501 () Bool)

(assert (=> b!1402492 m!1290501))

(declare-fun m!1290503 () Bool)

(assert (=> b!1402489 m!1290503))

(assert (=> b!1402489 m!1290503))

(declare-fun m!1290505 () Bool)

(assert (=> b!1402489 m!1290505))

(declare-fun m!1290507 () Bool)

(assert (=> b!1402493 m!1290507))

(assert (=> b!1402493 m!1290481))

(assert (=> b!1402493 m!1290481))

(declare-fun m!1290509 () Bool)

(assert (=> b!1402493 m!1290509))

(declare-fun m!1290511 () Bool)

(assert (=> b!1402485 m!1290511))

(check-sat (not b!1402484) (not start!120572) (not b!1402492) (not b!1402491) (not b!1402493) (not b!1402494) (not b!1402486) (not b!1402489) (not b!1402485) (not b!1402488) (not b!1402490))
(check-sat)
