; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120284 () Bool)

(assert start!120284)

(declare-fun b!1399679 () Bool)

(declare-fun res!938245 () Bool)

(declare-fun e!792426 () Bool)

(assert (=> b!1399679 (=> (not res!938245) (not e!792426))))

(declare-datatypes ((array!95646 0))(
  ( (array!95647 (arr!46174 (Array (_ BitVec 32) (_ BitVec 64))) (size!46726 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95646)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95646 (_ BitVec 32)) Bool)

(assert (=> b!1399679 (= res!938245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!792430 () Bool)

(declare-fun b!1399680 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10517 0))(
  ( (MissingZero!10517 (index!44445 (_ BitVec 32))) (Found!10517 (index!44446 (_ BitVec 32))) (Intermediate!10517 (undefined!11329 Bool) (index!44447 (_ BitVec 32)) (x!126093 (_ BitVec 32))) (Undefined!10517) (MissingVacant!10517 (index!44448 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95646 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1399680 (= e!792430 (= (seekEntryOrOpen!0 (select (arr!46174 a!2901) j!112) a!2901 mask!2840) (Found!10517 j!112)))))

(declare-fun lt!615523 () (_ BitVec 64))

(declare-fun lt!615525 () SeekEntryResult!10517)

(declare-fun lt!615520 () array!95646)

(declare-fun b!1399681 () Bool)

(declare-fun e!792428 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95646 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1399681 (= e!792428 (= (seekEntryOrOpen!0 lt!615523 lt!615520 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126093 lt!615525) (index!44447 lt!615525) (index!44447 lt!615525) (select (arr!46174 a!2901) j!112) lt!615520 mask!2840)))))

(declare-fun b!1399682 () Bool)

(declare-fun res!938241 () Bool)

(assert (=> b!1399682 (=> (not res!938241) (not e!792426))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399682 (= res!938241 (and (= (size!46726 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46726 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46726 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399684 () Bool)

(declare-fun res!938243 () Bool)

(assert (=> b!1399684 (=> (not res!938243) (not e!792426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399684 (= res!938243 (validKeyInArray!0 (select (arr!46174 a!2901) i!1037)))))

(declare-fun b!1399685 () Bool)

(declare-fun e!792425 () Bool)

(declare-fun e!792429 () Bool)

(assert (=> b!1399685 (= e!792425 e!792429)))

(declare-fun res!938242 () Bool)

(assert (=> b!1399685 (=> res!938242 e!792429)))

(declare-fun lt!615522 () SeekEntryResult!10517)

(get-info :version)

(assert (=> b!1399685 (= res!938242 (or (= lt!615522 lt!615525) (not ((_ is Intermediate!10517) lt!615525))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95646 (_ BitVec 32)) SeekEntryResult!10517)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399685 (= lt!615525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615523 mask!2840) lt!615523 lt!615520 mask!2840))))

(assert (=> b!1399685 (= lt!615523 (select (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399685 (= lt!615520 (array!95647 (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46726 a!2901)))))

(declare-fun b!1399686 () Bool)

(declare-fun e!792431 () Bool)

(assert (=> b!1399686 (= e!792429 e!792431)))

(declare-fun res!938247 () Bool)

(assert (=> b!1399686 (=> res!938247 e!792431)))

(declare-fun lt!615521 () (_ BitVec 32))

(assert (=> b!1399686 (= res!938247 (or (bvslt (x!126093 lt!615522) #b00000000000000000000000000000000) (bvsgt (x!126093 lt!615522) #b01111111111111111111111111111110) (bvslt (x!126093 lt!615525) #b00000000000000000000000000000000) (bvsgt (x!126093 lt!615525) #b01111111111111111111111111111110) (bvslt lt!615521 #b00000000000000000000000000000000) (bvsge lt!615521 (size!46726 a!2901)) (bvslt (index!44447 lt!615522) #b00000000000000000000000000000000) (bvsge (index!44447 lt!615522) (size!46726 a!2901)) (bvslt (index!44447 lt!615525) #b00000000000000000000000000000000) (bvsge (index!44447 lt!615525) (size!46726 a!2901)) (not (= lt!615522 (Intermediate!10517 false (index!44447 lt!615522) (x!126093 lt!615522)))) (not (= lt!615525 (Intermediate!10517 false (index!44447 lt!615525) (x!126093 lt!615525))))))))

(assert (=> b!1399686 e!792428))

(declare-fun res!938251 () Bool)

(assert (=> b!1399686 (=> (not res!938251) (not e!792428))))

(assert (=> b!1399686 (= res!938251 (and (not (undefined!11329 lt!615525)) (= (index!44447 lt!615525) i!1037) (bvslt (x!126093 lt!615525) (x!126093 lt!615522)) (= (select (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44447 lt!615525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46881 0))(
  ( (Unit!46882) )
))
(declare-fun lt!615527 () Unit!46881)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46881)

(assert (=> b!1399686 (= lt!615527 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615521 (x!126093 lt!615522) (index!44447 lt!615522) (x!126093 lt!615525) (index!44447 lt!615525) (undefined!11329 lt!615525) mask!2840))))

(declare-fun b!1399687 () Bool)

(declare-fun res!938249 () Bool)

(assert (=> b!1399687 (=> (not res!938249) (not e!792426))))

(declare-datatypes ((List!32771 0))(
  ( (Nil!32768) (Cons!32767 (h!34015 (_ BitVec 64)) (t!47457 List!32771)) )
))
(declare-fun arrayNoDuplicates!0 (array!95646 (_ BitVec 32) List!32771) Bool)

(assert (=> b!1399687 (= res!938249 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32768))))

(declare-fun b!1399683 () Bool)

(assert (=> b!1399683 (= e!792426 (not e!792425))))

(declare-fun res!938244 () Bool)

(assert (=> b!1399683 (=> res!938244 e!792425)))

(assert (=> b!1399683 (= res!938244 (or (not ((_ is Intermediate!10517) lt!615522)) (undefined!11329 lt!615522)))))

(assert (=> b!1399683 e!792430))

(declare-fun res!938248 () Bool)

(assert (=> b!1399683 (=> (not res!938248) (not e!792430))))

(assert (=> b!1399683 (= res!938248 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615524 () Unit!46881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46881)

(assert (=> b!1399683 (= lt!615524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399683 (= lt!615522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615521 (select (arr!46174 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399683 (= lt!615521 (toIndex!0 (select (arr!46174 a!2901) j!112) mask!2840))))

(declare-fun res!938246 () Bool)

(assert (=> start!120284 (=> (not res!938246) (not e!792426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120284 (= res!938246 (validMask!0 mask!2840))))

(assert (=> start!120284 e!792426))

(assert (=> start!120284 true))

(declare-fun array_inv!35407 (array!95646) Bool)

(assert (=> start!120284 (array_inv!35407 a!2901)))

(declare-fun b!1399688 () Bool)

(declare-fun res!938250 () Bool)

(assert (=> b!1399688 (=> (not res!938250) (not e!792426))))

(assert (=> b!1399688 (= res!938250 (validKeyInArray!0 (select (arr!46174 a!2901) j!112)))))

(declare-fun b!1399689 () Bool)

(assert (=> b!1399689 (= e!792431 true)))

(declare-fun lt!615526 () SeekEntryResult!10517)

(assert (=> b!1399689 (= lt!615526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615521 lt!615523 lt!615520 mask!2840))))

(assert (= (and start!120284 res!938246) b!1399682))

(assert (= (and b!1399682 res!938241) b!1399684))

(assert (= (and b!1399684 res!938243) b!1399688))

(assert (= (and b!1399688 res!938250) b!1399679))

(assert (= (and b!1399679 res!938245) b!1399687))

(assert (= (and b!1399687 res!938249) b!1399683))

(assert (= (and b!1399683 res!938248) b!1399680))

(assert (= (and b!1399683 (not res!938244)) b!1399685))

(assert (= (and b!1399685 (not res!938242)) b!1399686))

(assert (= (and b!1399686 res!938251) b!1399681))

(assert (= (and b!1399686 (not res!938247)) b!1399689))

(declare-fun m!1286449 () Bool)

(assert (=> b!1399689 m!1286449))

(declare-fun m!1286451 () Bool)

(assert (=> b!1399679 m!1286451))

(declare-fun m!1286453 () Bool)

(assert (=> b!1399684 m!1286453))

(assert (=> b!1399684 m!1286453))

(declare-fun m!1286455 () Bool)

(assert (=> b!1399684 m!1286455))

(declare-fun m!1286457 () Bool)

(assert (=> b!1399680 m!1286457))

(assert (=> b!1399680 m!1286457))

(declare-fun m!1286459 () Bool)

(assert (=> b!1399680 m!1286459))

(declare-fun m!1286461 () Bool)

(assert (=> b!1399687 m!1286461))

(declare-fun m!1286463 () Bool)

(assert (=> b!1399681 m!1286463))

(assert (=> b!1399681 m!1286457))

(assert (=> b!1399681 m!1286457))

(declare-fun m!1286465 () Bool)

(assert (=> b!1399681 m!1286465))

(declare-fun m!1286467 () Bool)

(assert (=> b!1399685 m!1286467))

(assert (=> b!1399685 m!1286467))

(declare-fun m!1286469 () Bool)

(assert (=> b!1399685 m!1286469))

(declare-fun m!1286471 () Bool)

(assert (=> b!1399685 m!1286471))

(declare-fun m!1286473 () Bool)

(assert (=> b!1399685 m!1286473))

(assert (=> b!1399688 m!1286457))

(assert (=> b!1399688 m!1286457))

(declare-fun m!1286475 () Bool)

(assert (=> b!1399688 m!1286475))

(assert (=> b!1399686 m!1286471))

(declare-fun m!1286477 () Bool)

(assert (=> b!1399686 m!1286477))

(declare-fun m!1286479 () Bool)

(assert (=> b!1399686 m!1286479))

(assert (=> b!1399683 m!1286457))

(declare-fun m!1286481 () Bool)

(assert (=> b!1399683 m!1286481))

(assert (=> b!1399683 m!1286457))

(declare-fun m!1286483 () Bool)

(assert (=> b!1399683 m!1286483))

(assert (=> b!1399683 m!1286457))

(declare-fun m!1286485 () Bool)

(assert (=> b!1399683 m!1286485))

(declare-fun m!1286487 () Bool)

(assert (=> b!1399683 m!1286487))

(declare-fun m!1286489 () Bool)

(assert (=> start!120284 m!1286489))

(declare-fun m!1286491 () Bool)

(assert (=> start!120284 m!1286491))

(check-sat (not b!1399684) (not b!1399687) (not b!1399680) (not b!1399685) (not b!1399681) (not b!1399686) (not start!120284) (not b!1399679) (not b!1399688) (not b!1399683) (not b!1399689))
(check-sat)
