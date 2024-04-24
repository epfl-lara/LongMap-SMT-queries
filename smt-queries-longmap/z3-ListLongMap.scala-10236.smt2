; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120656 () Bool)

(assert start!120656)

(declare-fun b!1403823 () Bool)

(declare-fun e!795001 () Bool)

(declare-fun e!794998 () Bool)

(assert (=> b!1403823 (= e!795001 e!794998)))

(declare-fun res!941656 () Bool)

(assert (=> b!1403823 (=> res!941656 e!794998)))

(declare-datatypes ((array!95987 0))(
  ( (array!95988 (arr!46342 (Array (_ BitVec 32) (_ BitVec 64))) (size!46893 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95987)

(declare-fun lt!618363 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10562 0))(
  ( (MissingZero!10562 (index!44625 (_ BitVec 32))) (Found!10562 (index!44626 (_ BitVec 32))) (Intermediate!10562 (undefined!11374 Bool) (index!44627 (_ BitVec 32)) (x!126400 (_ BitVec 32))) (Undefined!10562) (MissingVacant!10562 (index!44628 (_ BitVec 32))) )
))
(declare-fun lt!618369 () SeekEntryResult!10562)

(declare-fun lt!618366 () SeekEntryResult!10562)

(assert (=> b!1403823 (= res!941656 (or (bvslt (x!126400 lt!618366) #b00000000000000000000000000000000) (bvsgt (x!126400 lt!618366) #b01111111111111111111111111111110) (bvslt (x!126400 lt!618369) #b00000000000000000000000000000000) (bvsgt (x!126400 lt!618369) #b01111111111111111111111111111110) (bvslt lt!618363 #b00000000000000000000000000000000) (bvsge lt!618363 (size!46893 a!2901)) (bvslt (index!44627 lt!618366) #b00000000000000000000000000000000) (bvsge (index!44627 lt!618366) (size!46893 a!2901)) (bvslt (index!44627 lt!618369) #b00000000000000000000000000000000) (bvsge (index!44627 lt!618369) (size!46893 a!2901)) (not (= lt!618366 (Intermediate!10562 false (index!44627 lt!618366) (x!126400 lt!618366)))) (not (= lt!618369 (Intermediate!10562 false (index!44627 lt!618369) (x!126400 lt!618369))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!618362 () array!95987)

(declare-fun lt!618367 () SeekEntryResult!10562)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95987 (_ BitVec 32)) SeekEntryResult!10562)

(assert (=> b!1403823 (= lt!618367 (seekKeyOrZeroReturnVacant!0 (x!126400 lt!618369) (index!44627 lt!618369) (index!44627 lt!618369) (select (arr!46342 a!2901) j!112) lt!618362 mask!2840))))

(declare-fun lt!618370 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95987 (_ BitVec 32)) SeekEntryResult!10562)

(assert (=> b!1403823 (= lt!618367 (seekEntryOrOpen!0 lt!618370 lt!618362 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403823 (and (not (undefined!11374 lt!618369)) (= (index!44627 lt!618369) i!1037) (bvslt (x!126400 lt!618369) (x!126400 lt!618366)) (= (select (store (arr!46342 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44627 lt!618369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47155 0))(
  ( (Unit!47156) )
))
(declare-fun lt!618371 () Unit!47155)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47155)

(assert (=> b!1403823 (= lt!618371 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618363 (x!126400 lt!618366) (index!44627 lt!618366) (x!126400 lt!618369) (index!44627 lt!618369) (undefined!11374 lt!618369) mask!2840))))

(declare-fun b!1403824 () Bool)

(declare-fun res!941650 () Bool)

(declare-fun e!795002 () Bool)

(assert (=> b!1403824 (=> (not res!941650) (not e!795002))))

(assert (=> b!1403824 (= res!941650 (and (= (size!46893 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46893 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46893 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403825 () Bool)

(assert (=> b!1403825 (= e!794998 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!618368 () SeekEntryResult!10562)

(assert (=> b!1403825 (= lt!618368 lt!618367)))

(declare-fun lt!618365 () Unit!47155)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47155)

(assert (=> b!1403825 (= lt!618365 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618363 (x!126400 lt!618366) (index!44627 lt!618366) (x!126400 lt!618369) (index!44627 lt!618369) mask!2840))))

(declare-fun b!1403826 () Bool)

(declare-fun res!941658 () Bool)

(assert (=> b!1403826 (=> (not res!941658) (not e!795002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95987 (_ BitVec 32)) Bool)

(assert (=> b!1403826 (= res!941658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403827 () Bool)

(declare-fun res!941653 () Bool)

(assert (=> b!1403827 (=> (not res!941653) (not e!795002))))

(declare-datatypes ((List!32848 0))(
  ( (Nil!32845) (Cons!32844 (h!34100 (_ BitVec 64)) (t!47534 List!32848)) )
))
(declare-fun arrayNoDuplicates!0 (array!95987 (_ BitVec 32) List!32848) Bool)

(assert (=> b!1403827 (= res!941653 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32845))))

(declare-fun res!941652 () Bool)

(assert (=> start!120656 (=> (not res!941652) (not e!795002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120656 (= res!941652 (validMask!0 mask!2840))))

(assert (=> start!120656 e!795002))

(assert (=> start!120656 true))

(declare-fun array_inv!35623 (array!95987) Bool)

(assert (=> start!120656 (array_inv!35623 a!2901)))

(declare-fun b!1403828 () Bool)

(declare-fun e!795000 () Bool)

(assert (=> b!1403828 (= e!795000 e!795001)))

(declare-fun res!941654 () Bool)

(assert (=> b!1403828 (=> res!941654 e!795001)))

(get-info :version)

(assert (=> b!1403828 (= res!941654 (or (= lt!618366 lt!618369) (not ((_ is Intermediate!10562) lt!618369))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95987 (_ BitVec 32)) SeekEntryResult!10562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403828 (= lt!618369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618370 mask!2840) lt!618370 lt!618362 mask!2840))))

(assert (=> b!1403828 (= lt!618370 (select (store (arr!46342 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403828 (= lt!618362 (array!95988 (store (arr!46342 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46893 a!2901)))))

(declare-fun b!1403829 () Bool)

(declare-fun res!941659 () Bool)

(assert (=> b!1403829 (=> res!941659 e!794998)))

(assert (=> b!1403829 (= res!941659 (not (= lt!618369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618363 lt!618370 lt!618362 mask!2840))))))

(declare-fun b!1403830 () Bool)

(assert (=> b!1403830 (= e!795002 (not e!795000))))

(declare-fun res!941651 () Bool)

(assert (=> b!1403830 (=> res!941651 e!795000)))

(assert (=> b!1403830 (= res!941651 (or (not ((_ is Intermediate!10562) lt!618366)) (undefined!11374 lt!618366)))))

(assert (=> b!1403830 (= lt!618368 (Found!10562 j!112))))

(assert (=> b!1403830 (= lt!618368 (seekEntryOrOpen!0 (select (arr!46342 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403830 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618364 () Unit!47155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47155)

(assert (=> b!1403830 (= lt!618364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403830 (= lt!618366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618363 (select (arr!46342 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403830 (= lt!618363 (toIndex!0 (select (arr!46342 a!2901) j!112) mask!2840))))

(declare-fun b!1403831 () Bool)

(declare-fun res!941657 () Bool)

(assert (=> b!1403831 (=> (not res!941657) (not e!795002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403831 (= res!941657 (validKeyInArray!0 (select (arr!46342 a!2901) i!1037)))))

(declare-fun b!1403832 () Bool)

(declare-fun res!941655 () Bool)

(assert (=> b!1403832 (=> (not res!941655) (not e!795002))))

(assert (=> b!1403832 (= res!941655 (validKeyInArray!0 (select (arr!46342 a!2901) j!112)))))

(assert (= (and start!120656 res!941652) b!1403824))

(assert (= (and b!1403824 res!941650) b!1403831))

(assert (= (and b!1403831 res!941657) b!1403832))

(assert (= (and b!1403832 res!941655) b!1403826))

(assert (= (and b!1403826 res!941658) b!1403827))

(assert (= (and b!1403827 res!941653) b!1403830))

(assert (= (and b!1403830 (not res!941651)) b!1403828))

(assert (= (and b!1403828 (not res!941654)) b!1403823))

(assert (= (and b!1403823 (not res!941656)) b!1403829))

(assert (= (and b!1403829 (not res!941659)) b!1403825))

(declare-fun m!1292347 () Bool)

(assert (=> b!1403831 m!1292347))

(assert (=> b!1403831 m!1292347))

(declare-fun m!1292349 () Bool)

(assert (=> b!1403831 m!1292349))

(declare-fun m!1292351 () Bool)

(assert (=> b!1403828 m!1292351))

(assert (=> b!1403828 m!1292351))

(declare-fun m!1292353 () Bool)

(assert (=> b!1403828 m!1292353))

(declare-fun m!1292355 () Bool)

(assert (=> b!1403828 m!1292355))

(declare-fun m!1292357 () Bool)

(assert (=> b!1403828 m!1292357))

(declare-fun m!1292359 () Bool)

(assert (=> b!1403826 m!1292359))

(declare-fun m!1292361 () Bool)

(assert (=> b!1403830 m!1292361))

(declare-fun m!1292363 () Bool)

(assert (=> b!1403830 m!1292363))

(assert (=> b!1403830 m!1292361))

(declare-fun m!1292365 () Bool)

(assert (=> b!1403830 m!1292365))

(assert (=> b!1403830 m!1292361))

(declare-fun m!1292367 () Bool)

(assert (=> b!1403830 m!1292367))

(assert (=> b!1403830 m!1292361))

(declare-fun m!1292369 () Bool)

(assert (=> b!1403830 m!1292369))

(declare-fun m!1292371 () Bool)

(assert (=> b!1403830 m!1292371))

(assert (=> b!1403823 m!1292361))

(declare-fun m!1292373 () Bool)

(assert (=> b!1403823 m!1292373))

(declare-fun m!1292375 () Bool)

(assert (=> b!1403823 m!1292375))

(declare-fun m!1292377 () Bool)

(assert (=> b!1403823 m!1292377))

(assert (=> b!1403823 m!1292355))

(assert (=> b!1403823 m!1292361))

(declare-fun m!1292379 () Bool)

(assert (=> b!1403823 m!1292379))

(declare-fun m!1292381 () Bool)

(assert (=> start!120656 m!1292381))

(declare-fun m!1292383 () Bool)

(assert (=> start!120656 m!1292383))

(assert (=> b!1403832 m!1292361))

(assert (=> b!1403832 m!1292361))

(declare-fun m!1292385 () Bool)

(assert (=> b!1403832 m!1292385))

(declare-fun m!1292387 () Bool)

(assert (=> b!1403829 m!1292387))

(declare-fun m!1292389 () Bool)

(assert (=> b!1403825 m!1292389))

(declare-fun m!1292391 () Bool)

(assert (=> b!1403827 m!1292391))

(check-sat (not start!120656) (not b!1403830) (not b!1403829) (not b!1403832) (not b!1403826) (not b!1403823) (not b!1403827) (not b!1403825) (not b!1403831) (not b!1403828))
(check-sat)
