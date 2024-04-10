; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118760 () Bool)

(assert start!118760)

(declare-fun b!1387834 () Bool)

(declare-fun e!786155 () Bool)

(declare-datatypes ((array!94931 0))(
  ( (array!94932 (arr!45840 (Array (_ BitVec 32) (_ BitVec 64))) (size!46390 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94931)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387834 (= e!786155 (validKeyInArray!0 (select (arr!45840 a!2938) startIndex!16)))))

(declare-fun b!1387835 () Bool)

(declare-fun res!928486 () Bool)

(declare-fun e!786152 () Bool)

(assert (=> b!1387835 (=> (not res!928486) (not e!786152))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387835 (= res!928486 (and (= (size!46390 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46390 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46390 a!2938))))))

(declare-fun b!1387836 () Bool)

(declare-datatypes ((Unit!46391 0))(
  ( (Unit!46392) )
))
(declare-fun e!786154 () Unit!46391)

(declare-fun Unit!46393 () Unit!46391)

(assert (=> b!1387836 (= e!786154 Unit!46393)))

(declare-fun b!1387837 () Bool)

(declare-fun res!928483 () Bool)

(assert (=> b!1387837 (=> (not res!928483) (not e!786152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94931 (_ BitVec 32)) Bool)

(assert (=> b!1387837 (= res!928483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387838 () Bool)

(assert (=> b!1387838 (= e!786152 false)))

(declare-fun lt!610061 () Unit!46391)

(assert (=> b!1387838 (= lt!610061 e!786154)))

(declare-fun c!129117 () Bool)

(assert (=> b!1387838 (= c!129117 e!786155)))

(declare-fun res!928487 () Bool)

(assert (=> b!1387838 (=> (not res!928487) (not e!786155))))

(assert (=> b!1387838 (= res!928487 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387839 () Bool)

(declare-fun res!928485 () Bool)

(assert (=> b!1387839 (=> (not res!928485) (not e!786152))))

(assert (=> b!1387839 (= res!928485 (validKeyInArray!0 (select (arr!45840 a!2938) i!1065)))))

(declare-fun b!1387840 () Bool)

(declare-fun res!928488 () Bool)

(assert (=> b!1387840 (=> (not res!928488) (not e!786152))))

(assert (=> b!1387840 (= res!928488 (and (not (= (select (arr!45840 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45840 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387842 () Bool)

(declare-fun lt!610062 () Unit!46391)

(assert (=> b!1387842 (= e!786154 lt!610062)))

(declare-fun lt!610060 () Unit!46391)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46391)

(assert (=> b!1387842 (= lt!610060 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10183 0))(
  ( (MissingZero!10183 (index!43103 (_ BitVec 32))) (Found!10183 (index!43104 (_ BitVec 32))) (Intermediate!10183 (undefined!10995 Bool) (index!43105 (_ BitVec 32)) (x!124721 (_ BitVec 32))) (Undefined!10183) (MissingVacant!10183 (index!43106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94931 (_ BitVec 32)) SeekEntryResult!10183)

(assert (=> b!1387842 (= (seekEntryOrOpen!0 (select (arr!45840 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45840 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94932 (store (arr!45840 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46390 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46391)

(assert (=> b!1387842 (= lt!610062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387842 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928484 () Bool)

(assert (=> start!118760 (=> (not res!928484) (not e!786152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118760 (= res!928484 (validMask!0 mask!2987))))

(assert (=> start!118760 e!786152))

(assert (=> start!118760 true))

(declare-fun array_inv!34868 (array!94931) Bool)

(assert (=> start!118760 (array_inv!34868 a!2938)))

(declare-fun b!1387841 () Bool)

(declare-fun res!928489 () Bool)

(assert (=> b!1387841 (=> (not res!928489) (not e!786152))))

(declare-datatypes ((List!32368 0))(
  ( (Nil!32365) (Cons!32364 (h!33576 (_ BitVec 64)) (t!47062 List!32368)) )
))
(declare-fun arrayNoDuplicates!0 (array!94931 (_ BitVec 32) List!32368) Bool)

(assert (=> b!1387841 (= res!928489 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32365))))

(assert (= (and start!118760 res!928484) b!1387835))

(assert (= (and b!1387835 res!928486) b!1387839))

(assert (= (and b!1387839 res!928485) b!1387841))

(assert (= (and b!1387841 res!928489) b!1387837))

(assert (= (and b!1387837 res!928483) b!1387840))

(assert (= (and b!1387840 res!928488) b!1387838))

(assert (= (and b!1387838 res!928487) b!1387834))

(assert (= (and b!1387838 c!129117) b!1387842))

(assert (= (and b!1387838 (not c!129117)) b!1387836))

(declare-fun m!1273485 () Bool)

(assert (=> b!1387841 m!1273485))

(declare-fun m!1273487 () Bool)

(assert (=> b!1387842 m!1273487))

(declare-fun m!1273489 () Bool)

(assert (=> b!1387842 m!1273489))

(assert (=> b!1387842 m!1273489))

(declare-fun m!1273491 () Bool)

(assert (=> b!1387842 m!1273491))

(declare-fun m!1273493 () Bool)

(assert (=> b!1387842 m!1273493))

(declare-fun m!1273495 () Bool)

(assert (=> b!1387842 m!1273495))

(declare-fun m!1273497 () Bool)

(assert (=> b!1387842 m!1273497))

(declare-fun m!1273499 () Bool)

(assert (=> b!1387842 m!1273499))

(assert (=> b!1387842 m!1273497))

(declare-fun m!1273501 () Bool)

(assert (=> b!1387842 m!1273501))

(assert (=> b!1387834 m!1273497))

(assert (=> b!1387834 m!1273497))

(declare-fun m!1273503 () Bool)

(assert (=> b!1387834 m!1273503))

(declare-fun m!1273505 () Bool)

(assert (=> b!1387840 m!1273505))

(declare-fun m!1273507 () Bool)

(assert (=> b!1387837 m!1273507))

(declare-fun m!1273509 () Bool)

(assert (=> start!118760 m!1273509))

(declare-fun m!1273511 () Bool)

(assert (=> start!118760 m!1273511))

(assert (=> b!1387839 m!1273505))

(assert (=> b!1387839 m!1273505))

(declare-fun m!1273513 () Bool)

(assert (=> b!1387839 m!1273513))

(check-sat (not b!1387841) (not b!1387837) (not b!1387842) (not b!1387834) (not b!1387839) (not start!118760))
