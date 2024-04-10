; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118314 () Bool)

(assert start!118314)

(declare-fun b!1383763 () Bool)

(declare-datatypes ((Unit!46095 0))(
  ( (Unit!46096) )
))
(declare-fun e!784199 () Unit!46095)

(declare-fun lt!608667 () Unit!46095)

(assert (=> b!1383763 (= e!784199 lt!608667)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608665 () Unit!46095)

(declare-datatypes ((array!94617 0))(
  ( (array!94618 (arr!45686 (Array (_ BitVec 32) (_ BitVec 64))) (size!46236 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94617)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46095)

(assert (=> b!1383763 (= lt!608665 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10079 0))(
  ( (MissingZero!10079 (index!42687 (_ BitVec 32))) (Found!10079 (index!42688 (_ BitVec 32))) (Intermediate!10079 (undefined!10891 Bool) (index!42689 (_ BitVec 32)) (x!124200 (_ BitVec 32))) (Undefined!10079) (MissingVacant!10079 (index!42690 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94617 (_ BitVec 32)) SeekEntryResult!10079)

(assert (=> b!1383763 (= (seekEntryOrOpen!0 (select (arr!45686 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45686 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94618 (store (arr!45686 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46236 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46095)

(assert (=> b!1383763 (= lt!608667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94617 (_ BitVec 32)) Bool)

(assert (=> b!1383763 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925351 () Bool)

(declare-fun e!784196 () Bool)

(assert (=> start!118314 (=> (not res!925351) (not e!784196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118314 (= res!925351 (validMask!0 mask!2987))))

(assert (=> start!118314 e!784196))

(assert (=> start!118314 true))

(declare-fun array_inv!34714 (array!94617) Bool)

(assert (=> start!118314 (array_inv!34714 a!2938)))

(declare-fun b!1383764 () Bool)

(assert (=> b!1383764 (= e!784196 false)))

(declare-fun lt!608666 () Unit!46095)

(assert (=> b!1383764 (= lt!608666 e!784199)))

(declare-fun c!128646 () Bool)

(declare-fun e!784198 () Bool)

(assert (=> b!1383764 (= c!128646 e!784198)))

(declare-fun res!925352 () Bool)

(assert (=> b!1383764 (=> (not res!925352) (not e!784198))))

(assert (=> b!1383764 (= res!925352 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383765 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383765 (= e!784198 (validKeyInArray!0 (select (arr!45686 a!2938) startIndex!16)))))

(declare-fun b!1383766 () Bool)

(declare-fun res!925355 () Bool)

(assert (=> b!1383766 (=> (not res!925355) (not e!784196))))

(assert (=> b!1383766 (= res!925355 (and (= (size!46236 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46236 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46236 a!2938))))))

(declare-fun b!1383767 () Bool)

(declare-fun res!925356 () Bool)

(assert (=> b!1383767 (=> (not res!925356) (not e!784196))))

(assert (=> b!1383767 (= res!925356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383768 () Bool)

(declare-fun res!925354 () Bool)

(assert (=> b!1383768 (=> (not res!925354) (not e!784196))))

(declare-datatypes ((List!32214 0))(
  ( (Nil!32211) (Cons!32210 (h!33419 (_ BitVec 64)) (t!46908 List!32214)) )
))
(declare-fun arrayNoDuplicates!0 (array!94617 (_ BitVec 32) List!32214) Bool)

(assert (=> b!1383768 (= res!925354 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32211))))

(declare-fun b!1383769 () Bool)

(declare-fun Unit!46097 () Unit!46095)

(assert (=> b!1383769 (= e!784199 Unit!46097)))

(declare-fun b!1383770 () Bool)

(declare-fun res!925353 () Bool)

(assert (=> b!1383770 (=> (not res!925353) (not e!784196))))

(assert (=> b!1383770 (= res!925353 (and (not (= (select (arr!45686 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45686 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383771 () Bool)

(declare-fun res!925357 () Bool)

(assert (=> b!1383771 (=> (not res!925357) (not e!784196))))

(assert (=> b!1383771 (= res!925357 (validKeyInArray!0 (select (arr!45686 a!2938) i!1065)))))

(assert (= (and start!118314 res!925351) b!1383766))

(assert (= (and b!1383766 res!925355) b!1383771))

(assert (= (and b!1383771 res!925357) b!1383768))

(assert (= (and b!1383768 res!925354) b!1383767))

(assert (= (and b!1383767 res!925356) b!1383770))

(assert (= (and b!1383770 res!925353) b!1383764))

(assert (= (and b!1383764 res!925352) b!1383765))

(assert (= (and b!1383764 c!128646) b!1383763))

(assert (= (and b!1383764 (not c!128646)) b!1383769))

(declare-fun m!1268931 () Bool)

(assert (=> b!1383771 m!1268931))

(assert (=> b!1383771 m!1268931))

(declare-fun m!1268933 () Bool)

(assert (=> b!1383771 m!1268933))

(declare-fun m!1268935 () Bool)

(assert (=> start!118314 m!1268935))

(declare-fun m!1268937 () Bool)

(assert (=> start!118314 m!1268937))

(declare-fun m!1268939 () Bool)

(assert (=> b!1383765 m!1268939))

(assert (=> b!1383765 m!1268939))

(declare-fun m!1268941 () Bool)

(assert (=> b!1383765 m!1268941))

(declare-fun m!1268943 () Bool)

(assert (=> b!1383768 m!1268943))

(declare-fun m!1268945 () Bool)

(assert (=> b!1383767 m!1268945))

(assert (=> b!1383770 m!1268931))

(declare-fun m!1268947 () Bool)

(assert (=> b!1383763 m!1268947))

(declare-fun m!1268949 () Bool)

(assert (=> b!1383763 m!1268949))

(assert (=> b!1383763 m!1268949))

(declare-fun m!1268951 () Bool)

(assert (=> b!1383763 m!1268951))

(declare-fun m!1268953 () Bool)

(assert (=> b!1383763 m!1268953))

(declare-fun m!1268955 () Bool)

(assert (=> b!1383763 m!1268955))

(assert (=> b!1383763 m!1268939))

(declare-fun m!1268957 () Bool)

(assert (=> b!1383763 m!1268957))

(assert (=> b!1383763 m!1268939))

(declare-fun m!1268959 () Bool)

(assert (=> b!1383763 m!1268959))

(push 1)

(assert (not b!1383763))

(assert (not start!118314))

(assert (not b!1383771))

(assert (not b!1383765))

(assert (not b!1383767))

(assert (not b!1383768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

