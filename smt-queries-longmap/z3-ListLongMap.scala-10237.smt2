; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120662 () Bool)

(assert start!120662)

(declare-fun res!941741 () Bool)

(declare-fun e!795045 () Bool)

(assert (=> start!120662 (=> (not res!941741) (not e!795045))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120662 (= res!941741 (validMask!0 mask!2840))))

(assert (=> start!120662 e!795045))

(assert (=> start!120662 true))

(declare-datatypes ((array!95993 0))(
  ( (array!95994 (arr!46345 (Array (_ BitVec 32) (_ BitVec 64))) (size!46896 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95993)

(declare-fun array_inv!35626 (array!95993) Bool)

(assert (=> start!120662 (array_inv!35626 a!2901)))

(declare-fun b!1403913 () Bool)

(declare-fun res!941743 () Bool)

(assert (=> b!1403913 (=> (not res!941743) (not e!795045))))

(declare-datatypes ((List!32851 0))(
  ( (Nil!32848) (Cons!32847 (h!34103 (_ BitVec 64)) (t!47537 List!32851)) )
))
(declare-fun arrayNoDuplicates!0 (array!95993 (_ BitVec 32) List!32851) Bool)

(assert (=> b!1403913 (= res!941743 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32848))))

(declare-fun b!1403914 () Bool)

(declare-fun e!795046 () Bool)

(assert (=> b!1403914 (= e!795045 (not e!795046))))

(declare-fun res!941742 () Bool)

(assert (=> b!1403914 (=> res!941742 e!795046)))

(declare-datatypes ((SeekEntryResult!10565 0))(
  ( (MissingZero!10565 (index!44637 (_ BitVec 32))) (Found!10565 (index!44638 (_ BitVec 32))) (Intermediate!10565 (undefined!11377 Bool) (index!44639 (_ BitVec 32)) (x!126411 (_ BitVec 32))) (Undefined!10565) (MissingVacant!10565 (index!44640 (_ BitVec 32))) )
))
(declare-fun lt!618452 () SeekEntryResult!10565)

(get-info :version)

(assert (=> b!1403914 (= res!941742 (or (not ((_ is Intermediate!10565) lt!618452)) (undefined!11377 lt!618452)))))

(declare-fun lt!618457 () SeekEntryResult!10565)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403914 (= lt!618457 (Found!10565 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95993 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1403914 (= lt!618457 (seekEntryOrOpen!0 (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95993 (_ BitVec 32)) Bool)

(assert (=> b!1403914 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47161 0))(
  ( (Unit!47162) )
))
(declare-fun lt!618455 () Unit!47161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47161)

(assert (=> b!1403914 (= lt!618455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618461 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95993 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1403914 (= lt!618452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618461 (select (arr!46345 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403914 (= lt!618461 (toIndex!0 (select (arr!46345 a!2901) j!112) mask!2840))))

(declare-fun b!1403915 () Bool)

(declare-fun e!795047 () Bool)

(assert (=> b!1403915 (= e!795047 true)))

(declare-fun lt!618453 () SeekEntryResult!10565)

(assert (=> b!1403915 (= lt!618457 lt!618453)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618460 () Unit!47161)

(declare-fun lt!618456 () SeekEntryResult!10565)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47161)

(assert (=> b!1403915 (= lt!618460 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618461 (x!126411 lt!618452) (index!44639 lt!618452) (x!126411 lt!618456) (index!44639 lt!618456) mask!2840))))

(declare-fun b!1403916 () Bool)

(declare-fun res!941740 () Bool)

(assert (=> b!1403916 (=> (not res!941740) (not e!795045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403916 (= res!941740 (validKeyInArray!0 (select (arr!46345 a!2901) j!112)))))

(declare-fun b!1403917 () Bool)

(declare-fun res!941748 () Bool)

(assert (=> b!1403917 (=> (not res!941748) (not e!795045))))

(assert (=> b!1403917 (= res!941748 (validKeyInArray!0 (select (arr!46345 a!2901) i!1037)))))

(declare-fun b!1403918 () Bool)

(declare-fun res!941747 () Bool)

(assert (=> b!1403918 (=> (not res!941747) (not e!795045))))

(assert (=> b!1403918 (= res!941747 (and (= (size!46896 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46896 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46896 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403919 () Bool)

(declare-fun e!795044 () Bool)

(assert (=> b!1403919 (= e!795044 e!795047)))

(declare-fun res!941744 () Bool)

(assert (=> b!1403919 (=> res!941744 e!795047)))

(assert (=> b!1403919 (= res!941744 (or (bvslt (x!126411 lt!618452) #b00000000000000000000000000000000) (bvsgt (x!126411 lt!618452) #b01111111111111111111111111111110) (bvslt (x!126411 lt!618456) #b00000000000000000000000000000000) (bvsgt (x!126411 lt!618456) #b01111111111111111111111111111110) (bvslt lt!618461 #b00000000000000000000000000000000) (bvsge lt!618461 (size!46896 a!2901)) (bvslt (index!44639 lt!618452) #b00000000000000000000000000000000) (bvsge (index!44639 lt!618452) (size!46896 a!2901)) (bvslt (index!44639 lt!618456) #b00000000000000000000000000000000) (bvsge (index!44639 lt!618456) (size!46896 a!2901)) (not (= lt!618452 (Intermediate!10565 false (index!44639 lt!618452) (x!126411 lt!618452)))) (not (= lt!618456 (Intermediate!10565 false (index!44639 lt!618456) (x!126411 lt!618456))))))))

(declare-fun lt!618459 () array!95993)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95993 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1403919 (= lt!618453 (seekKeyOrZeroReturnVacant!0 (x!126411 lt!618456) (index!44639 lt!618456) (index!44639 lt!618456) (select (arr!46345 a!2901) j!112) lt!618459 mask!2840))))

(declare-fun lt!618458 () (_ BitVec 64))

(assert (=> b!1403919 (= lt!618453 (seekEntryOrOpen!0 lt!618458 lt!618459 mask!2840))))

(assert (=> b!1403919 (and (not (undefined!11377 lt!618456)) (= (index!44639 lt!618456) i!1037) (bvslt (x!126411 lt!618456) (x!126411 lt!618452)) (= (select (store (arr!46345 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44639 lt!618456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618454 () Unit!47161)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47161)

(assert (=> b!1403919 (= lt!618454 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618461 (x!126411 lt!618452) (index!44639 lt!618452) (x!126411 lt!618456) (index!44639 lt!618456) (undefined!11377 lt!618456) mask!2840))))

(declare-fun b!1403920 () Bool)

(declare-fun res!941749 () Bool)

(assert (=> b!1403920 (=> res!941749 e!795047)))

(assert (=> b!1403920 (= res!941749 (not (= lt!618456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618461 lt!618458 lt!618459 mask!2840))))))

(declare-fun b!1403921 () Bool)

(declare-fun res!941746 () Bool)

(assert (=> b!1403921 (=> (not res!941746) (not e!795045))))

(assert (=> b!1403921 (= res!941746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403922 () Bool)

(assert (=> b!1403922 (= e!795046 e!795044)))

(declare-fun res!941745 () Bool)

(assert (=> b!1403922 (=> res!941745 e!795044)))

(assert (=> b!1403922 (= res!941745 (or (= lt!618452 lt!618456) (not ((_ is Intermediate!10565) lt!618456))))))

(assert (=> b!1403922 (= lt!618456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618458 mask!2840) lt!618458 lt!618459 mask!2840))))

(assert (=> b!1403922 (= lt!618458 (select (store (arr!46345 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403922 (= lt!618459 (array!95994 (store (arr!46345 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46896 a!2901)))))

(assert (= (and start!120662 res!941741) b!1403918))

(assert (= (and b!1403918 res!941747) b!1403917))

(assert (= (and b!1403917 res!941748) b!1403916))

(assert (= (and b!1403916 res!941740) b!1403921))

(assert (= (and b!1403921 res!941746) b!1403913))

(assert (= (and b!1403913 res!941743) b!1403914))

(assert (= (and b!1403914 (not res!941742)) b!1403922))

(assert (= (and b!1403922 (not res!941745)) b!1403919))

(assert (= (and b!1403919 (not res!941744)) b!1403920))

(assert (= (and b!1403920 (not res!941749)) b!1403915))

(declare-fun m!1292485 () Bool)

(assert (=> b!1403914 m!1292485))

(declare-fun m!1292487 () Bool)

(assert (=> b!1403914 m!1292487))

(assert (=> b!1403914 m!1292485))

(declare-fun m!1292489 () Bool)

(assert (=> b!1403914 m!1292489))

(assert (=> b!1403914 m!1292485))

(declare-fun m!1292491 () Bool)

(assert (=> b!1403914 m!1292491))

(assert (=> b!1403914 m!1292485))

(declare-fun m!1292493 () Bool)

(assert (=> b!1403914 m!1292493))

(declare-fun m!1292495 () Bool)

(assert (=> b!1403914 m!1292495))

(declare-fun m!1292497 () Bool)

(assert (=> b!1403913 m!1292497))

(declare-fun m!1292499 () Bool)

(assert (=> b!1403921 m!1292499))

(declare-fun m!1292501 () Bool)

(assert (=> b!1403919 m!1292501))

(declare-fun m!1292503 () Bool)

(assert (=> b!1403919 m!1292503))

(assert (=> b!1403919 m!1292485))

(assert (=> b!1403919 m!1292485))

(declare-fun m!1292505 () Bool)

(assert (=> b!1403919 m!1292505))

(declare-fun m!1292507 () Bool)

(assert (=> b!1403919 m!1292507))

(declare-fun m!1292509 () Bool)

(assert (=> b!1403919 m!1292509))

(declare-fun m!1292511 () Bool)

(assert (=> start!120662 m!1292511))

(declare-fun m!1292513 () Bool)

(assert (=> start!120662 m!1292513))

(declare-fun m!1292515 () Bool)

(assert (=> b!1403917 m!1292515))

(assert (=> b!1403917 m!1292515))

(declare-fun m!1292517 () Bool)

(assert (=> b!1403917 m!1292517))

(assert (=> b!1403916 m!1292485))

(assert (=> b!1403916 m!1292485))

(declare-fun m!1292519 () Bool)

(assert (=> b!1403916 m!1292519))

(declare-fun m!1292521 () Bool)

(assert (=> b!1403915 m!1292521))

(declare-fun m!1292523 () Bool)

(assert (=> b!1403920 m!1292523))

(declare-fun m!1292525 () Bool)

(assert (=> b!1403922 m!1292525))

(assert (=> b!1403922 m!1292525))

(declare-fun m!1292527 () Bool)

(assert (=> b!1403922 m!1292527))

(assert (=> b!1403922 m!1292509))

(declare-fun m!1292529 () Bool)

(assert (=> b!1403922 m!1292529))

(check-sat (not b!1403920) (not b!1403917) (not b!1403913) (not b!1403914) (not start!120662) (not b!1403919) (not b!1403915) (not b!1403922) (not b!1403916) (not b!1403921))
(check-sat)
