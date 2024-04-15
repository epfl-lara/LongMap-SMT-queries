; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118332 () Bool)

(assert start!118332)

(declare-fun b!1383991 () Bool)

(declare-fun res!925559 () Bool)

(declare-fun e!784297 () Bool)

(assert (=> b!1383991 (=> (not res!925559) (not e!784297))))

(declare-datatypes ((array!94588 0))(
  ( (array!94589 (arr!45672 (Array (_ BitVec 32) (_ BitVec 64))) (size!46224 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94588)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94588 (_ BitVec 32)) Bool)

(assert (=> b!1383991 (= res!925559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383992 () Bool)

(declare-datatypes ((Unit!45969 0))(
  ( (Unit!45970) )
))
(declare-fun e!784298 () Unit!45969)

(declare-fun Unit!45971 () Unit!45969)

(assert (=> b!1383992 (= e!784298 Unit!45971)))

(declare-fun b!1383993 () Bool)

(assert (=> b!1383993 (= e!784297 false)))

(declare-fun lt!608582 () Unit!45969)

(assert (=> b!1383993 (= lt!608582 e!784298)))

(declare-fun c!128660 () Bool)

(declare-fun e!784299 () Bool)

(assert (=> b!1383993 (= c!128660 e!784299)))

(declare-fun res!925561 () Bool)

(assert (=> b!1383993 (=> (not res!925561) (not e!784299))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383993 (= res!925561 (not (= startIndex!16 i!1065)))))

(declare-fun res!925556 () Bool)

(assert (=> start!118332 (=> (not res!925556) (not e!784297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118332 (= res!925556 (validMask!0 mask!2987))))

(assert (=> start!118332 e!784297))

(assert (=> start!118332 true))

(declare-fun array_inv!34905 (array!94588) Bool)

(assert (=> start!118332 (array_inv!34905 a!2938)))

(declare-fun b!1383994 () Bool)

(declare-fun res!925562 () Bool)

(assert (=> b!1383994 (=> (not res!925562) (not e!784297))))

(declare-datatypes ((List!32278 0))(
  ( (Nil!32275) (Cons!32274 (h!33483 (_ BitVec 64)) (t!46964 List!32278)) )
))
(declare-fun arrayNoDuplicates!0 (array!94588 (_ BitVec 32) List!32278) Bool)

(assert (=> b!1383994 (= res!925562 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32275))))

(declare-fun b!1383995 () Bool)

(declare-fun res!925558 () Bool)

(assert (=> b!1383995 (=> (not res!925558) (not e!784297))))

(assert (=> b!1383995 (= res!925558 (and (not (= (select (arr!45672 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45672 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383996 () Bool)

(declare-fun res!925557 () Bool)

(assert (=> b!1383996 (=> (not res!925557) (not e!784297))))

(assert (=> b!1383996 (= res!925557 (and (= (size!46224 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46224 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46224 a!2938))))))

(declare-fun b!1383997 () Bool)

(declare-fun lt!608580 () Unit!45969)

(assert (=> b!1383997 (= e!784298 lt!608580)))

(declare-fun lt!608581 () Unit!45969)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45969)

(assert (=> b!1383997 (= lt!608581 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10089 0))(
  ( (MissingZero!10089 (index!42727 (_ BitVec 32))) (Found!10089 (index!42728 (_ BitVec 32))) (Intermediate!10089 (undefined!10901 Bool) (index!42729 (_ BitVec 32)) (x!124231 (_ BitVec 32))) (Undefined!10089) (MissingVacant!10089 (index!42730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94588 (_ BitVec 32)) SeekEntryResult!10089)

(assert (=> b!1383997 (= (seekEntryOrOpen!0 (select (arr!45672 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45672 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94589 (store (arr!45672 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46224 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45969)

(assert (=> b!1383997 (= lt!608580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1383997 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383998 () Bool)

(declare-fun res!925560 () Bool)

(assert (=> b!1383998 (=> (not res!925560) (not e!784297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383998 (= res!925560 (validKeyInArray!0 (select (arr!45672 a!2938) i!1065)))))

(declare-fun b!1383999 () Bool)

(assert (=> b!1383999 (= e!784299 (validKeyInArray!0 (select (arr!45672 a!2938) startIndex!16)))))

(assert (= (and start!118332 res!925556) b!1383996))

(assert (= (and b!1383996 res!925557) b!1383998))

(assert (= (and b!1383998 res!925560) b!1383994))

(assert (= (and b!1383994 res!925562) b!1383991))

(assert (= (and b!1383991 res!925559) b!1383995))

(assert (= (and b!1383995 res!925558) b!1383993))

(assert (= (and b!1383993 res!925561) b!1383999))

(assert (= (and b!1383993 c!128660) b!1383997))

(assert (= (and b!1383993 (not c!128660)) b!1383992))

(declare-fun m!1268757 () Bool)

(assert (=> b!1383991 m!1268757))

(declare-fun m!1268759 () Bool)

(assert (=> b!1383999 m!1268759))

(assert (=> b!1383999 m!1268759))

(declare-fun m!1268761 () Bool)

(assert (=> b!1383999 m!1268761))

(declare-fun m!1268763 () Bool)

(assert (=> b!1383995 m!1268763))

(declare-fun m!1268765 () Bool)

(assert (=> start!118332 m!1268765))

(declare-fun m!1268767 () Bool)

(assert (=> start!118332 m!1268767))

(declare-fun m!1268769 () Bool)

(assert (=> b!1383997 m!1268769))

(declare-fun m!1268771 () Bool)

(assert (=> b!1383997 m!1268771))

(assert (=> b!1383997 m!1268771))

(declare-fun m!1268773 () Bool)

(assert (=> b!1383997 m!1268773))

(declare-fun m!1268775 () Bool)

(assert (=> b!1383997 m!1268775))

(declare-fun m!1268777 () Bool)

(assert (=> b!1383997 m!1268777))

(assert (=> b!1383997 m!1268759))

(declare-fun m!1268779 () Bool)

(assert (=> b!1383997 m!1268779))

(assert (=> b!1383997 m!1268759))

(declare-fun m!1268781 () Bool)

(assert (=> b!1383997 m!1268781))

(assert (=> b!1383998 m!1268763))

(assert (=> b!1383998 m!1268763))

(declare-fun m!1268783 () Bool)

(assert (=> b!1383998 m!1268783))

(declare-fun m!1268785 () Bool)

(assert (=> b!1383994 m!1268785))

(push 1)

(assert (not start!118332))

(assert (not b!1383997))

(assert (not b!1383991))

(assert (not b!1383999))

(assert (not b!1383994))

(assert (not b!1383998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

