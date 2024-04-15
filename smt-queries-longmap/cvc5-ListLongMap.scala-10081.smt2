; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118620 () Bool)

(assert start!118620)

(declare-fun b!1386781 () Bool)

(declare-fun res!927934 () Bool)

(declare-fun e!785549 () Bool)

(assert (=> b!1386781 (=> (not res!927934) (not e!785549))))

(declare-datatypes ((array!94849 0))(
  ( (array!94850 (arr!45801 (Array (_ BitVec 32) (_ BitVec 64))) (size!46353 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94849)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386781 (= res!927934 (validKeyInArray!0 (select (arr!45801 a!2938) i!1065)))))

(declare-fun b!1386782 () Bool)

(assert (=> b!1386782 (= e!785549 false)))

(declare-datatypes ((Unit!46194 0))(
  ( (Unit!46195) )
))
(declare-fun lt!609417 () Unit!46194)

(declare-fun e!785551 () Unit!46194)

(assert (=> b!1386782 (= lt!609417 e!785551)))

(declare-fun c!128867 () Bool)

(declare-fun e!785550 () Bool)

(assert (=> b!1386782 (= c!128867 e!785550)))

(declare-fun res!927932 () Bool)

(assert (=> b!1386782 (=> (not res!927932) (not e!785550))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386782 (= res!927932 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386783 () Bool)

(assert (=> b!1386783 (= e!785550 (validKeyInArray!0 (select (arr!45801 a!2938) startIndex!16)))))

(declare-fun res!927933 () Bool)

(assert (=> start!118620 (=> (not res!927933) (not e!785549))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118620 (= res!927933 (validMask!0 mask!2987))))

(assert (=> start!118620 e!785549))

(assert (=> start!118620 true))

(declare-fun array_inv!35034 (array!94849) Bool)

(assert (=> start!118620 (array_inv!35034 a!2938)))

(declare-fun b!1386784 () Bool)

(declare-fun res!927938 () Bool)

(assert (=> b!1386784 (=> (not res!927938) (not e!785549))))

(assert (=> b!1386784 (= res!927938 (and (= (size!46353 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46353 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46353 a!2938))))))

(declare-fun b!1386785 () Bool)

(declare-fun res!927936 () Bool)

(assert (=> b!1386785 (=> (not res!927936) (not e!785549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94849 (_ BitVec 32)) Bool)

(assert (=> b!1386785 (= res!927936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386786 () Bool)

(declare-fun lt!609418 () Unit!46194)

(assert (=> b!1386786 (= e!785551 lt!609418)))

(declare-fun lt!609419 () Unit!46194)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46194)

(assert (=> b!1386786 (= lt!609419 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10170 0))(
  ( (MissingZero!10170 (index!43051 (_ BitVec 32))) (Found!10170 (index!43052 (_ BitVec 32))) (Intermediate!10170 (undefined!10982 Bool) (index!43053 (_ BitVec 32)) (x!124656 (_ BitVec 32))) (Undefined!10170) (MissingVacant!10170 (index!43054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94849 (_ BitVec 32)) SeekEntryResult!10170)

(assert (=> b!1386786 (= (seekEntryOrOpen!0 (select (arr!45801 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45801 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94850 (store (arr!45801 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46353 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46194)

(assert (=> b!1386786 (= lt!609418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386786 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386787 () Bool)

(declare-fun res!927935 () Bool)

(assert (=> b!1386787 (=> (not res!927935) (not e!785549))))

(assert (=> b!1386787 (= res!927935 (and (not (= (select (arr!45801 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45801 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386788 () Bool)

(declare-fun res!927937 () Bool)

(assert (=> b!1386788 (=> (not res!927937) (not e!785549))))

(declare-datatypes ((List!32407 0))(
  ( (Nil!32404) (Cons!32403 (h!33612 (_ BitVec 64)) (t!47093 List!32407)) )
))
(declare-fun arrayNoDuplicates!0 (array!94849 (_ BitVec 32) List!32407) Bool)

(assert (=> b!1386788 (= res!927937 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32404))))

(declare-fun b!1386789 () Bool)

(declare-fun Unit!46196 () Unit!46194)

(assert (=> b!1386789 (= e!785551 Unit!46196)))

(assert (= (and start!118620 res!927933) b!1386784))

(assert (= (and b!1386784 res!927938) b!1386781))

(assert (= (and b!1386781 res!927934) b!1386788))

(assert (= (and b!1386788 res!927937) b!1386785))

(assert (= (and b!1386785 res!927936) b!1386787))

(assert (= (and b!1386787 res!927935) b!1386782))

(assert (= (and b!1386782 res!927932) b!1386783))

(assert (= (and b!1386782 c!128867) b!1386786))

(assert (= (and b!1386782 (not c!128867)) b!1386789))

(declare-fun m!1271757 () Bool)

(assert (=> b!1386787 m!1271757))

(declare-fun m!1271759 () Bool)

(assert (=> b!1386785 m!1271759))

(assert (=> b!1386781 m!1271757))

(assert (=> b!1386781 m!1271757))

(declare-fun m!1271761 () Bool)

(assert (=> b!1386781 m!1271761))

(declare-fun m!1271763 () Bool)

(assert (=> b!1386786 m!1271763))

(declare-fun m!1271765 () Bool)

(assert (=> b!1386786 m!1271765))

(assert (=> b!1386786 m!1271765))

(declare-fun m!1271767 () Bool)

(assert (=> b!1386786 m!1271767))

(declare-fun m!1271769 () Bool)

(assert (=> b!1386786 m!1271769))

(declare-fun m!1271771 () Bool)

(assert (=> b!1386786 m!1271771))

(declare-fun m!1271773 () Bool)

(assert (=> b!1386786 m!1271773))

(declare-fun m!1271775 () Bool)

(assert (=> b!1386786 m!1271775))

(assert (=> b!1386786 m!1271773))

(declare-fun m!1271777 () Bool)

(assert (=> b!1386786 m!1271777))

(assert (=> b!1386783 m!1271773))

(assert (=> b!1386783 m!1271773))

(declare-fun m!1271779 () Bool)

(assert (=> b!1386783 m!1271779))

(declare-fun m!1271781 () Bool)

(assert (=> start!118620 m!1271781))

(declare-fun m!1271783 () Bool)

(assert (=> start!118620 m!1271783))

(declare-fun m!1271785 () Bool)

(assert (=> b!1386788 m!1271785))

(push 1)

(assert (not b!1386786))

(assert (not b!1386781))

(assert (not b!1386783))

(assert (not start!118620))

(assert (not b!1386785))

(assert (not b!1386788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

