; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118370 () Bool)

(assert start!118370)

(declare-fun b!1384515 () Bool)

(declare-fun e!784538 () Bool)

(declare-datatypes ((array!94626 0))(
  ( (array!94627 (arr!45691 (Array (_ BitVec 32) (_ BitVec 64))) (size!46243 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94626)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384515 (= e!784538 (validKeyInArray!0 (select (arr!45691 a!2938) startIndex!16)))))

(declare-fun b!1384516 () Bool)

(declare-fun res!925971 () Bool)

(declare-fun e!784536 () Bool)

(assert (=> b!1384516 (=> (not res!925971) (not e!784536))))

(declare-datatypes ((List!32297 0))(
  ( (Nil!32294) (Cons!32293 (h!33502 (_ BitVec 64)) (t!46983 List!32297)) )
))
(declare-fun arrayNoDuplicates!0 (array!94626 (_ BitVec 32) List!32297) Bool)

(assert (=> b!1384516 (= res!925971 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32294))))

(declare-fun b!1384517 () Bool)

(declare-fun res!925970 () Bool)

(assert (=> b!1384517 (=> (not res!925970) (not e!784536))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384517 (= res!925970 (and (= (size!46243 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46243 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46243 a!2938))))))

(declare-fun b!1384518 () Bool)

(declare-fun e!784540 () Bool)

(assert (=> b!1384518 (= e!784540 (not true))))

(declare-fun lt!608777 () array!94626)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94626 (_ BitVec 32)) Bool)

(assert (=> b!1384518 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608777 mask!2987)))

(declare-datatypes ((Unit!46026 0))(
  ( (Unit!46027) )
))
(declare-fun lt!608776 () Unit!46026)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46026)

(assert (=> b!1384518 (= lt!608776 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun res!925968 () Bool)

(assert (=> start!118370 (=> (not res!925968) (not e!784536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118370 (= res!925968 (validMask!0 mask!2987))))

(assert (=> start!118370 e!784536))

(assert (=> start!118370 true))

(declare-fun array_inv!34924 (array!94626) Bool)

(assert (=> start!118370 (array_inv!34924 a!2938)))

(declare-fun b!1384519 () Bool)

(declare-fun res!925969 () Bool)

(assert (=> b!1384519 (=> (not res!925969) (not e!784536))))

(assert (=> b!1384519 (= res!925969 (and (not (= (select (arr!45691 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45691 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384520 () Bool)

(declare-fun e!784539 () Unit!46026)

(declare-fun lt!608774 () Unit!46026)

(assert (=> b!1384520 (= e!784539 lt!608774)))

(declare-fun lt!608773 () Unit!46026)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46026)

(assert (=> b!1384520 (= lt!608773 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10108 0))(
  ( (MissingZero!10108 (index!42803 (_ BitVec 32))) (Found!10108 (index!42804 (_ BitVec 32))) (Intermediate!10108 (undefined!10920 Bool) (index!42805 (_ BitVec 32)) (x!124306 (_ BitVec 32))) (Undefined!10108) (MissingVacant!10108 (index!42806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94626 (_ BitVec 32)) SeekEntryResult!10108)

(assert (=> b!1384520 (= (seekEntryOrOpen!0 (select (arr!45691 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45691 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608777 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46026)

(assert (=> b!1384520 (= lt!608774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384520 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384521 () Bool)

(declare-fun res!925972 () Bool)

(assert (=> b!1384521 (=> (not res!925972) (not e!784536))))

(assert (=> b!1384521 (= res!925972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384522 () Bool)

(assert (=> b!1384522 (= e!784536 e!784540)))

(declare-fun res!925966 () Bool)

(assert (=> b!1384522 (=> (not res!925966) (not e!784540))))

(assert (=> b!1384522 (= res!925966 (and (bvslt startIndex!16 (bvsub (size!46243 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608775 () Unit!46026)

(assert (=> b!1384522 (= lt!608775 e!784539)))

(declare-fun c!128717 () Bool)

(assert (=> b!1384522 (= c!128717 e!784538)))

(declare-fun res!925973 () Bool)

(assert (=> b!1384522 (=> (not res!925973) (not e!784538))))

(assert (=> b!1384522 (= res!925973 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384522 (= lt!608777 (array!94627 (store (arr!45691 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46243 a!2938)))))

(declare-fun b!1384523 () Bool)

(declare-fun res!925967 () Bool)

(assert (=> b!1384523 (=> (not res!925967) (not e!784536))))

(assert (=> b!1384523 (= res!925967 (validKeyInArray!0 (select (arr!45691 a!2938) i!1065)))))

(declare-fun b!1384524 () Bool)

(declare-fun Unit!46028 () Unit!46026)

(assert (=> b!1384524 (= e!784539 Unit!46028)))

(assert (= (and start!118370 res!925968) b!1384517))

(assert (= (and b!1384517 res!925970) b!1384523))

(assert (= (and b!1384523 res!925967) b!1384516))

(assert (= (and b!1384516 res!925971) b!1384521))

(assert (= (and b!1384521 res!925972) b!1384519))

(assert (= (and b!1384519 res!925969) b!1384522))

(assert (= (and b!1384522 res!925973) b!1384515))

(assert (= (and b!1384522 c!128717) b!1384520))

(assert (= (and b!1384522 (not c!128717)) b!1384524))

(assert (= (and b!1384522 res!925966) b!1384518))

(declare-fun m!1269339 () Bool)

(assert (=> b!1384523 m!1269339))

(assert (=> b!1384523 m!1269339))

(declare-fun m!1269341 () Bool)

(assert (=> b!1384523 m!1269341))

(declare-fun m!1269343 () Bool)

(assert (=> b!1384516 m!1269343))

(declare-fun m!1269345 () Bool)

(assert (=> b!1384520 m!1269345))

(declare-fun m!1269347 () Bool)

(assert (=> b!1384520 m!1269347))

(assert (=> b!1384520 m!1269347))

(declare-fun m!1269349 () Bool)

(assert (=> b!1384520 m!1269349))

(declare-fun m!1269351 () Bool)

(assert (=> b!1384520 m!1269351))

(declare-fun m!1269353 () Bool)

(assert (=> b!1384520 m!1269353))

(declare-fun m!1269355 () Bool)

(assert (=> b!1384520 m!1269355))

(declare-fun m!1269357 () Bool)

(assert (=> b!1384520 m!1269357))

(assert (=> b!1384520 m!1269355))

(declare-fun m!1269359 () Bool)

(assert (=> b!1384520 m!1269359))

(assert (=> b!1384519 m!1269339))

(declare-fun m!1269361 () Bool)

(assert (=> b!1384521 m!1269361))

(assert (=> b!1384522 m!1269351))

(declare-fun m!1269363 () Bool)

(assert (=> b!1384518 m!1269363))

(declare-fun m!1269365 () Bool)

(assert (=> b!1384518 m!1269365))

(declare-fun m!1269367 () Bool)

(assert (=> start!118370 m!1269367))

(declare-fun m!1269369 () Bool)

(assert (=> start!118370 m!1269369))

(assert (=> b!1384515 m!1269355))

(assert (=> b!1384515 m!1269355))

(declare-fun m!1269371 () Bool)

(assert (=> b!1384515 m!1269371))

(check-sat (not b!1384518) (not start!118370) (not b!1384521) (not b!1384515) (not b!1384523) (not b!1384516) (not b!1384520))
(check-sat)
