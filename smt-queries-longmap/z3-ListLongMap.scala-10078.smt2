; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118814 () Bool)

(assert start!118814)

(declare-fun b!1387861 () Bool)

(declare-fun res!928250 () Bool)

(declare-fun e!786296 () Bool)

(assert (=> b!1387861 (=> (not res!928250) (not e!786296))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94988 0))(
  ( (array!94989 (arr!45868 (Array (_ BitVec 32) (_ BitVec 64))) (size!46419 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94988)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387861 (= res!928250 (and (= (size!46419 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46419 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46419 a!2938))))))

(declare-fun b!1387862 () Bool)

(declare-fun res!928248 () Bool)

(assert (=> b!1387862 (=> (not res!928248) (not e!786296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94988 (_ BitVec 32)) Bool)

(assert (=> b!1387862 (= res!928248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!928251 () Bool)

(assert (=> start!118814 (=> (not res!928251) (not e!786296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118814 (= res!928251 (validMask!0 mask!2987))))

(assert (=> start!118814 e!786296))

(assert (=> start!118814 true))

(declare-fun array_inv!35149 (array!94988) Bool)

(assert (=> start!118814 (array_inv!35149 a!2938)))

(declare-fun b!1387863 () Bool)

(declare-datatypes ((Unit!46257 0))(
  ( (Unit!46258) )
))
(declare-fun e!786297 () Unit!46257)

(declare-fun Unit!46259 () Unit!46257)

(assert (=> b!1387863 (= e!786297 Unit!46259)))

(declare-fun b!1387864 () Bool)

(declare-fun res!928246 () Bool)

(assert (=> b!1387864 (=> (not res!928246) (not e!786296))))

(declare-datatypes ((List!32383 0))(
  ( (Nil!32380) (Cons!32379 (h!33597 (_ BitVec 64)) (t!47069 List!32383)) )
))
(declare-fun arrayNoDuplicates!0 (array!94988 (_ BitVec 32) List!32383) Bool)

(assert (=> b!1387864 (= res!928246 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32380))))

(declare-fun b!1387865 () Bool)

(declare-fun res!928252 () Bool)

(assert (=> b!1387865 (=> (not res!928252) (not e!786296))))

(assert (=> b!1387865 (= res!928252 (and (not (= (select (arr!45868 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45868 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387866 () Bool)

(declare-fun lt!609983 () Unit!46257)

(assert (=> b!1387866 (= e!786297 lt!609983)))

(declare-fun lt!609982 () Unit!46257)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46257)

(assert (=> b!1387866 (= lt!609982 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10115 0))(
  ( (MissingZero!10115 (index!42831 (_ BitVec 32))) (Found!10115 (index!42832 (_ BitVec 32))) (Intermediate!10115 (undefined!10927 Bool) (index!42833 (_ BitVec 32)) (x!124602 (_ BitVec 32))) (Undefined!10115) (MissingVacant!10115 (index!42834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94988 (_ BitVec 32)) SeekEntryResult!10115)

(assert (=> b!1387866 (= (seekEntryOrOpen!0 (select (arr!45868 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45868 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94989 (store (arr!45868 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46419 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46257)

(assert (=> b!1387866 (= lt!609983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387866 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387867 () Bool)

(declare-fun e!786295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387867 (= e!786295 (validKeyInArray!0 (select (arr!45868 a!2938) startIndex!16)))))

(declare-fun b!1387868 () Bool)

(declare-fun res!928249 () Bool)

(assert (=> b!1387868 (=> (not res!928249) (not e!786296))))

(assert (=> b!1387868 (= res!928249 (validKeyInArray!0 (select (arr!45868 a!2938) i!1065)))))

(declare-fun b!1387869 () Bool)

(assert (=> b!1387869 (= e!786296 (and (bvslt startIndex!16 (bvsub (size!46419 a!2938) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609984 () Unit!46257)

(assert (=> b!1387869 (= lt!609984 e!786297)))

(declare-fun c!129255 () Bool)

(assert (=> b!1387869 (= c!129255 e!786295)))

(declare-fun res!928247 () Bool)

(assert (=> b!1387869 (=> (not res!928247) (not e!786295))))

(assert (=> b!1387869 (= res!928247 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118814 res!928251) b!1387861))

(assert (= (and b!1387861 res!928250) b!1387868))

(assert (= (and b!1387868 res!928249) b!1387864))

(assert (= (and b!1387864 res!928246) b!1387862))

(assert (= (and b!1387862 res!928248) b!1387865))

(assert (= (and b!1387865 res!928252) b!1387869))

(assert (= (and b!1387869 res!928247) b!1387867))

(assert (= (and b!1387869 c!129255) b!1387866))

(assert (= (and b!1387869 (not c!129255)) b!1387863))

(declare-fun m!1273563 () Bool)

(assert (=> b!1387862 m!1273563))

(declare-fun m!1273565 () Bool)

(assert (=> b!1387867 m!1273565))

(assert (=> b!1387867 m!1273565))

(declare-fun m!1273567 () Bool)

(assert (=> b!1387867 m!1273567))

(declare-fun m!1273569 () Bool)

(assert (=> start!118814 m!1273569))

(declare-fun m!1273571 () Bool)

(assert (=> start!118814 m!1273571))

(declare-fun m!1273573 () Bool)

(assert (=> b!1387864 m!1273573))

(declare-fun m!1273575 () Bool)

(assert (=> b!1387865 m!1273575))

(assert (=> b!1387868 m!1273575))

(assert (=> b!1387868 m!1273575))

(declare-fun m!1273577 () Bool)

(assert (=> b!1387868 m!1273577))

(declare-fun m!1273579 () Bool)

(assert (=> b!1387866 m!1273579))

(declare-fun m!1273581 () Bool)

(assert (=> b!1387866 m!1273581))

(assert (=> b!1387866 m!1273581))

(declare-fun m!1273583 () Bool)

(assert (=> b!1387866 m!1273583))

(declare-fun m!1273585 () Bool)

(assert (=> b!1387866 m!1273585))

(declare-fun m!1273587 () Bool)

(assert (=> b!1387866 m!1273587))

(assert (=> b!1387866 m!1273565))

(declare-fun m!1273589 () Bool)

(assert (=> b!1387866 m!1273589))

(assert (=> b!1387866 m!1273565))

(declare-fun m!1273591 () Bool)

(assert (=> b!1387866 m!1273591))

(check-sat (not b!1387866) (not start!118814) (not b!1387868) (not b!1387862) (not b!1387867) (not b!1387864))
(check-sat)
