; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118762 () Bool)

(assert start!118762)

(declare-fun b!1387861 () Bool)

(declare-fun e!786166 () Bool)

(assert (=> b!1387861 (= e!786166 false)))

(declare-datatypes ((Unit!46394 0))(
  ( (Unit!46395) )
))
(declare-fun lt!610069 () Unit!46394)

(declare-fun e!786165 () Unit!46394)

(assert (=> b!1387861 (= lt!610069 e!786165)))

(declare-fun c!129120 () Bool)

(declare-fun e!786167 () Bool)

(assert (=> b!1387861 (= c!129120 e!786167)))

(declare-fun res!928506 () Bool)

(assert (=> b!1387861 (=> (not res!928506) (not e!786167))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387861 (= res!928506 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387862 () Bool)

(declare-fun res!928510 () Bool)

(assert (=> b!1387862 (=> (not res!928510) (not e!786166))))

(declare-datatypes ((array!94933 0))(
  ( (array!94934 (arr!45841 (Array (_ BitVec 32) (_ BitVec 64))) (size!46391 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94933)

(declare-datatypes ((List!32369 0))(
  ( (Nil!32366) (Cons!32365 (h!33577 (_ BitVec 64)) (t!47063 List!32369)) )
))
(declare-fun arrayNoDuplicates!0 (array!94933 (_ BitVec 32) List!32369) Bool)

(assert (=> b!1387862 (= res!928510 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32366))))

(declare-fun res!928508 () Bool)

(assert (=> start!118762 (=> (not res!928508) (not e!786166))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118762 (= res!928508 (validMask!0 mask!2987))))

(assert (=> start!118762 e!786166))

(assert (=> start!118762 true))

(declare-fun array_inv!34869 (array!94933) Bool)

(assert (=> start!118762 (array_inv!34869 a!2938)))

(declare-fun b!1387863 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387863 (= e!786167 (validKeyInArray!0 (select (arr!45841 a!2938) startIndex!16)))))

(declare-fun b!1387864 () Bool)

(declare-fun Unit!46396 () Unit!46394)

(assert (=> b!1387864 (= e!786165 Unit!46396)))

(declare-fun b!1387865 () Bool)

(declare-fun res!928507 () Bool)

(assert (=> b!1387865 (=> (not res!928507) (not e!786166))))

(assert (=> b!1387865 (= res!928507 (validKeyInArray!0 (select (arr!45841 a!2938) i!1065)))))

(declare-fun b!1387866 () Bool)

(declare-fun res!928504 () Bool)

(assert (=> b!1387866 (=> (not res!928504) (not e!786166))))

(assert (=> b!1387866 (= res!928504 (and (not (= (select (arr!45841 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45841 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387867 () Bool)

(declare-fun lt!610070 () Unit!46394)

(assert (=> b!1387867 (= e!786165 lt!610070)))

(declare-fun lt!610071 () Unit!46394)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46394)

(assert (=> b!1387867 (= lt!610071 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10184 0))(
  ( (MissingZero!10184 (index!43107 (_ BitVec 32))) (Found!10184 (index!43108 (_ BitVec 32))) (Intermediate!10184 (undefined!10996 Bool) (index!43109 (_ BitVec 32)) (x!124722 (_ BitVec 32))) (Undefined!10184) (MissingVacant!10184 (index!43110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94933 (_ BitVec 32)) SeekEntryResult!10184)

(assert (=> b!1387867 (= (seekEntryOrOpen!0 (select (arr!45841 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45841 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94934 (store (arr!45841 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46391 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46394)

(assert (=> b!1387867 (= lt!610070 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94933 (_ BitVec 32)) Bool)

(assert (=> b!1387867 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387868 () Bool)

(declare-fun res!928509 () Bool)

(assert (=> b!1387868 (=> (not res!928509) (not e!786166))))

(assert (=> b!1387868 (= res!928509 (and (= (size!46391 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46391 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46391 a!2938))))))

(declare-fun b!1387869 () Bool)

(declare-fun res!928505 () Bool)

(assert (=> b!1387869 (=> (not res!928505) (not e!786166))))

(assert (=> b!1387869 (= res!928505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118762 res!928508) b!1387868))

(assert (= (and b!1387868 res!928509) b!1387865))

(assert (= (and b!1387865 res!928507) b!1387862))

(assert (= (and b!1387862 res!928510) b!1387869))

(assert (= (and b!1387869 res!928505) b!1387866))

(assert (= (and b!1387866 res!928504) b!1387861))

(assert (= (and b!1387861 res!928506) b!1387863))

(assert (= (and b!1387861 c!129120) b!1387867))

(assert (= (and b!1387861 (not c!129120)) b!1387864))

(declare-fun m!1273515 () Bool)

(assert (=> start!118762 m!1273515))

(declare-fun m!1273517 () Bool)

(assert (=> start!118762 m!1273517))

(declare-fun m!1273519 () Bool)

(assert (=> b!1387865 m!1273519))

(assert (=> b!1387865 m!1273519))

(declare-fun m!1273521 () Bool)

(assert (=> b!1387865 m!1273521))

(declare-fun m!1273523 () Bool)

(assert (=> b!1387863 m!1273523))

(assert (=> b!1387863 m!1273523))

(declare-fun m!1273525 () Bool)

(assert (=> b!1387863 m!1273525))

(declare-fun m!1273527 () Bool)

(assert (=> b!1387862 m!1273527))

(declare-fun m!1273529 () Bool)

(assert (=> b!1387869 m!1273529))

(declare-fun m!1273531 () Bool)

(assert (=> b!1387867 m!1273531))

(declare-fun m!1273533 () Bool)

(assert (=> b!1387867 m!1273533))

(assert (=> b!1387867 m!1273533))

(declare-fun m!1273535 () Bool)

(assert (=> b!1387867 m!1273535))

(declare-fun m!1273537 () Bool)

(assert (=> b!1387867 m!1273537))

(declare-fun m!1273539 () Bool)

(assert (=> b!1387867 m!1273539))

(assert (=> b!1387867 m!1273523))

(declare-fun m!1273541 () Bool)

(assert (=> b!1387867 m!1273541))

(assert (=> b!1387867 m!1273523))

(declare-fun m!1273543 () Bool)

(assert (=> b!1387867 m!1273543))

(assert (=> b!1387866 m!1273519))

(push 1)

(assert (not start!118762))

(assert (not b!1387862))

(assert (not b!1387865))

(assert (not b!1387867))

(assert (not b!1387869))

(assert (not b!1387863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

