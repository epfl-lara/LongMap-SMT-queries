; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120310 () Bool)

(assert start!120310)

(declare-fun b!1400123 () Bool)

(declare-fun res!938644 () Bool)

(declare-fun e!792698 () Bool)

(assert (=> b!1400123 (=> (not res!938644) (not e!792698))))

(declare-datatypes ((array!95719 0))(
  ( (array!95720 (arr!46210 (Array (_ BitVec 32) (_ BitVec 64))) (size!46760 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95719)

(declare-datatypes ((List!32729 0))(
  ( (Nil!32726) (Cons!32725 (h!33973 (_ BitVec 64)) (t!47423 List!32729)) )
))
(declare-fun arrayNoDuplicates!0 (array!95719 (_ BitVec 32) List!32729) Bool)

(assert (=> b!1400123 (= res!938644 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32726))))

(declare-fun b!1400124 () Bool)

(declare-fun e!792696 () Bool)

(declare-fun e!792697 () Bool)

(assert (=> b!1400124 (= e!792696 e!792697)))

(declare-fun res!938641 () Bool)

(assert (=> b!1400124 (=> res!938641 e!792697)))

(declare-fun lt!615977 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10527 0))(
  ( (MissingZero!10527 (index!44485 (_ BitVec 32))) (Found!10527 (index!44486 (_ BitVec 32))) (Intermediate!10527 (undefined!11339 Bool) (index!44487 (_ BitVec 32)) (x!126130 (_ BitVec 32))) (Undefined!10527) (MissingVacant!10527 (index!44488 (_ BitVec 32))) )
))
(declare-fun lt!615981 () SeekEntryResult!10527)

(declare-fun lt!615979 () SeekEntryResult!10527)

(assert (=> b!1400124 (= res!938641 (or (bvslt (x!126130 lt!615981) #b00000000000000000000000000000000) (bvsgt (x!126130 lt!615981) #b01111111111111111111111111111110) (bvslt (x!126130 lt!615979) #b00000000000000000000000000000000) (bvsgt (x!126130 lt!615979) #b01111111111111111111111111111110) (bvslt lt!615977 #b00000000000000000000000000000000) (bvsge lt!615977 (size!46760 a!2901)) (bvslt (index!44487 lt!615981) #b00000000000000000000000000000000) (bvsge (index!44487 lt!615981) (size!46760 a!2901)) (bvslt (index!44487 lt!615979) #b00000000000000000000000000000000) (bvsge (index!44487 lt!615979) (size!46760 a!2901)) (not (= lt!615981 (Intermediate!10527 false (index!44487 lt!615981) (x!126130 lt!615981)))) (not (= lt!615979 (Intermediate!10527 false (index!44487 lt!615979) (x!126130 lt!615979))))))))

(declare-fun e!792701 () Bool)

(assert (=> b!1400124 e!792701))

(declare-fun res!938637 () Bool)

(assert (=> b!1400124 (=> (not res!938637) (not e!792701))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400124 (= res!938637 (and (not (undefined!11339 lt!615979)) (= (index!44487 lt!615979) i!1037) (bvslt (x!126130 lt!615979) (x!126130 lt!615981)) (= (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44487 lt!615979)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47058 0))(
  ( (Unit!47059) )
))
(declare-fun lt!615978 () Unit!47058)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47058)

(assert (=> b!1400124 (= lt!615978 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615977 (x!126130 lt!615981) (index!44487 lt!615981) (x!126130 lt!615979) (index!44487 lt!615979) (undefined!11339 lt!615979) mask!2840))))

(declare-fun b!1400125 () Bool)

(assert (=> b!1400125 (= e!792697 true)))

(declare-fun lt!615975 () SeekEntryResult!10527)

(declare-fun lt!615976 () array!95719)

(declare-fun lt!615974 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95719 (_ BitVec 32)) SeekEntryResult!10527)

(assert (=> b!1400125 (= lt!615975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615977 lt!615974 lt!615976 mask!2840))))

(declare-fun b!1400126 () Bool)

(declare-fun e!792699 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95719 (_ BitVec 32)) SeekEntryResult!10527)

(assert (=> b!1400126 (= e!792699 (= (seekEntryOrOpen!0 (select (arr!46210 a!2901) j!112) a!2901 mask!2840) (Found!10527 j!112)))))

(declare-fun b!1400127 () Bool)

(declare-fun e!792695 () Bool)

(assert (=> b!1400127 (= e!792698 (not e!792695))))

(declare-fun res!938636 () Bool)

(assert (=> b!1400127 (=> res!938636 e!792695)))

(assert (=> b!1400127 (= res!938636 (or (not (is-Intermediate!10527 lt!615981)) (undefined!11339 lt!615981)))))

(assert (=> b!1400127 e!792699))

(declare-fun res!938635 () Bool)

(assert (=> b!1400127 (=> (not res!938635) (not e!792699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95719 (_ BitVec 32)) Bool)

(assert (=> b!1400127 (= res!938635 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615980 () Unit!47058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47058)

(assert (=> b!1400127 (= lt!615980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400127 (= lt!615981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615977 (select (arr!46210 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400127 (= lt!615977 (toIndex!0 (select (arr!46210 a!2901) j!112) mask!2840))))

(declare-fun b!1400128 () Bool)

(declare-fun res!938634 () Bool)

(assert (=> b!1400128 (=> (not res!938634) (not e!792698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400128 (= res!938634 (validKeyInArray!0 (select (arr!46210 a!2901) j!112)))))

(declare-fun b!1400130 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95719 (_ BitVec 32)) SeekEntryResult!10527)

(assert (=> b!1400130 (= e!792701 (= (seekEntryOrOpen!0 lt!615974 lt!615976 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126130 lt!615979) (index!44487 lt!615979) (index!44487 lt!615979) (select (arr!46210 a!2901) j!112) lt!615976 mask!2840)))))

(declare-fun b!1400131 () Bool)

(declare-fun res!938638 () Bool)

(assert (=> b!1400131 (=> (not res!938638) (not e!792698))))

(assert (=> b!1400131 (= res!938638 (validKeyInArray!0 (select (arr!46210 a!2901) i!1037)))))

(declare-fun b!1400132 () Bool)

(assert (=> b!1400132 (= e!792695 e!792696)))

(declare-fun res!938639 () Bool)

(assert (=> b!1400132 (=> res!938639 e!792696)))

(assert (=> b!1400132 (= res!938639 (or (= lt!615981 lt!615979) (not (is-Intermediate!10527 lt!615979))))))

(assert (=> b!1400132 (= lt!615979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615974 mask!2840) lt!615974 lt!615976 mask!2840))))

(assert (=> b!1400132 (= lt!615974 (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400132 (= lt!615976 (array!95720 (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46760 a!2901)))))

(declare-fun b!1400133 () Bool)

(declare-fun res!938640 () Bool)

(assert (=> b!1400133 (=> (not res!938640) (not e!792698))))

(assert (=> b!1400133 (= res!938640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400129 () Bool)

(declare-fun res!938642 () Bool)

(assert (=> b!1400129 (=> (not res!938642) (not e!792698))))

(assert (=> b!1400129 (= res!938642 (and (= (size!46760 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46760 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46760 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!938643 () Bool)

(assert (=> start!120310 (=> (not res!938643) (not e!792698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120310 (= res!938643 (validMask!0 mask!2840))))

(assert (=> start!120310 e!792698))

(assert (=> start!120310 true))

(declare-fun array_inv!35238 (array!95719) Bool)

(assert (=> start!120310 (array_inv!35238 a!2901)))

(assert (= (and start!120310 res!938643) b!1400129))

(assert (= (and b!1400129 res!938642) b!1400131))

(assert (= (and b!1400131 res!938638) b!1400128))

(assert (= (and b!1400128 res!938634) b!1400133))

(assert (= (and b!1400133 res!938640) b!1400123))

(assert (= (and b!1400123 res!938644) b!1400127))

(assert (= (and b!1400127 res!938635) b!1400126))

(assert (= (and b!1400127 (not res!938636)) b!1400132))

(assert (= (and b!1400132 (not res!938639)) b!1400124))

(assert (= (and b!1400124 res!938637) b!1400130))

(assert (= (and b!1400124 (not res!938641)) b!1400125))

(declare-fun m!1287469 () Bool)

(assert (=> b!1400133 m!1287469))

(declare-fun m!1287471 () Bool)

(assert (=> b!1400125 m!1287471))

(declare-fun m!1287473 () Bool)

(assert (=> b!1400130 m!1287473))

(declare-fun m!1287475 () Bool)

(assert (=> b!1400130 m!1287475))

(assert (=> b!1400130 m!1287475))

(declare-fun m!1287477 () Bool)

(assert (=> b!1400130 m!1287477))

(declare-fun m!1287479 () Bool)

(assert (=> b!1400131 m!1287479))

(assert (=> b!1400131 m!1287479))

(declare-fun m!1287481 () Bool)

(assert (=> b!1400131 m!1287481))

(assert (=> b!1400128 m!1287475))

(assert (=> b!1400128 m!1287475))

(declare-fun m!1287483 () Bool)

(assert (=> b!1400128 m!1287483))

(declare-fun m!1287485 () Bool)

(assert (=> start!120310 m!1287485))

(declare-fun m!1287487 () Bool)

(assert (=> start!120310 m!1287487))

(declare-fun m!1287489 () Bool)

(assert (=> b!1400124 m!1287489))

(declare-fun m!1287491 () Bool)

(assert (=> b!1400124 m!1287491))

(declare-fun m!1287493 () Bool)

(assert (=> b!1400124 m!1287493))

(declare-fun m!1287495 () Bool)

(assert (=> b!1400132 m!1287495))

(assert (=> b!1400132 m!1287495))

(declare-fun m!1287497 () Bool)

(assert (=> b!1400132 m!1287497))

(assert (=> b!1400132 m!1287489))

(declare-fun m!1287499 () Bool)

(assert (=> b!1400132 m!1287499))

(declare-fun m!1287501 () Bool)

(assert (=> b!1400123 m!1287501))

(assert (=> b!1400126 m!1287475))

(assert (=> b!1400126 m!1287475))

(declare-fun m!1287503 () Bool)

(assert (=> b!1400126 m!1287503))

(assert (=> b!1400127 m!1287475))

(declare-fun m!1287505 () Bool)

(assert (=> b!1400127 m!1287505))

(assert (=> b!1400127 m!1287475))

(declare-fun m!1287507 () Bool)

(assert (=> b!1400127 m!1287507))

(assert (=> b!1400127 m!1287475))

(declare-fun m!1287509 () Bool)

(assert (=> b!1400127 m!1287509))

(declare-fun m!1287511 () Bool)

(assert (=> b!1400127 m!1287511))

(push 1)

