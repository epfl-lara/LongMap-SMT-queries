; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118326 () Bool)

(assert start!118326)

(declare-fun b!1383925 () Bool)

(declare-fun e!784271 () Bool)

(declare-datatypes ((array!94629 0))(
  ( (array!94630 (arr!45692 (Array (_ BitVec 32) (_ BitVec 64))) (size!46242 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94629)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383925 (= e!784271 (validKeyInArray!0 (select (arr!45692 a!2938) startIndex!16)))))

(declare-fun b!1383926 () Bool)

(declare-fun res!925479 () Bool)

(declare-fun e!784268 () Bool)

(assert (=> b!1383926 (=> (not res!925479) (not e!784268))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383926 (= res!925479 (validKeyInArray!0 (select (arr!45692 a!2938) i!1065)))))

(declare-fun b!1383927 () Bool)

(declare-fun res!925480 () Bool)

(assert (=> b!1383927 (=> (not res!925480) (not e!784268))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383927 (= res!925480 (and (= (size!46242 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46242 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46242 a!2938))))))

(declare-fun b!1383929 () Bool)

(declare-datatypes ((Unit!46113 0))(
  ( (Unit!46114) )
))
(declare-fun e!784270 () Unit!46113)

(declare-fun Unit!46115 () Unit!46113)

(assert (=> b!1383929 (= e!784270 Unit!46115)))

(declare-fun b!1383930 () Bool)

(declare-fun lt!608721 () Unit!46113)

(assert (=> b!1383930 (= e!784270 lt!608721)))

(declare-fun lt!608720 () Unit!46113)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46113)

(assert (=> b!1383930 (= lt!608720 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10085 0))(
  ( (MissingZero!10085 (index!42711 (_ BitVec 32))) (Found!10085 (index!42712 (_ BitVec 32))) (Intermediate!10085 (undefined!10897 Bool) (index!42713 (_ BitVec 32)) (x!124222 (_ BitVec 32))) (Undefined!10085) (MissingVacant!10085 (index!42714 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94629 (_ BitVec 32)) SeekEntryResult!10085)

(assert (=> b!1383930 (= (seekEntryOrOpen!0 (select (arr!45692 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45692 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94630 (store (arr!45692 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46242 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46113)

(assert (=> b!1383930 (= lt!608721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94629 (_ BitVec 32)) Bool)

(assert (=> b!1383930 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383931 () Bool)

(assert (=> b!1383931 (= e!784268 false)))

(declare-fun lt!608719 () Unit!46113)

(assert (=> b!1383931 (= lt!608719 e!784270)))

(declare-fun c!128664 () Bool)

(assert (=> b!1383931 (= c!128664 e!784271)))

(declare-fun res!925478 () Bool)

(assert (=> b!1383931 (=> (not res!925478) (not e!784271))))

(assert (=> b!1383931 (= res!925478 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383932 () Bool)

(declare-fun res!925482 () Bool)

(assert (=> b!1383932 (=> (not res!925482) (not e!784268))))

(declare-datatypes ((List!32220 0))(
  ( (Nil!32217) (Cons!32216 (h!33425 (_ BitVec 64)) (t!46914 List!32220)) )
))
(declare-fun arrayNoDuplicates!0 (array!94629 (_ BitVec 32) List!32220) Bool)

(assert (=> b!1383932 (= res!925482 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32217))))

(declare-fun b!1383933 () Bool)

(declare-fun res!925483 () Bool)

(assert (=> b!1383933 (=> (not res!925483) (not e!784268))))

(assert (=> b!1383933 (= res!925483 (and (not (= (select (arr!45692 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45692 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!925477 () Bool)

(assert (=> start!118326 (=> (not res!925477) (not e!784268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118326 (= res!925477 (validMask!0 mask!2987))))

(assert (=> start!118326 e!784268))

(assert (=> start!118326 true))

(declare-fun array_inv!34720 (array!94629) Bool)

(assert (=> start!118326 (array_inv!34720 a!2938)))

(declare-fun b!1383928 () Bool)

(declare-fun res!925481 () Bool)

(assert (=> b!1383928 (=> (not res!925481) (not e!784268))))

(assert (=> b!1383928 (= res!925481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118326 res!925477) b!1383927))

(assert (= (and b!1383927 res!925480) b!1383926))

(assert (= (and b!1383926 res!925479) b!1383932))

(assert (= (and b!1383932 res!925482) b!1383928))

(assert (= (and b!1383928 res!925481) b!1383933))

(assert (= (and b!1383933 res!925483) b!1383931))

(assert (= (and b!1383931 res!925478) b!1383925))

(assert (= (and b!1383931 c!128664) b!1383930))

(assert (= (and b!1383931 (not c!128664)) b!1383929))

(declare-fun m!1269111 () Bool)

(assert (=> b!1383932 m!1269111))

(declare-fun m!1269113 () Bool)

(assert (=> b!1383928 m!1269113))

(declare-fun m!1269115 () Bool)

(assert (=> start!118326 m!1269115))

(declare-fun m!1269117 () Bool)

(assert (=> start!118326 m!1269117))

(declare-fun m!1269119 () Bool)

(assert (=> b!1383933 m!1269119))

(declare-fun m!1269121 () Bool)

(assert (=> b!1383925 m!1269121))

(assert (=> b!1383925 m!1269121))

(declare-fun m!1269123 () Bool)

(assert (=> b!1383925 m!1269123))

(assert (=> b!1383926 m!1269119))

(assert (=> b!1383926 m!1269119))

(declare-fun m!1269125 () Bool)

(assert (=> b!1383926 m!1269125))

(declare-fun m!1269127 () Bool)

(assert (=> b!1383930 m!1269127))

(declare-fun m!1269129 () Bool)

(assert (=> b!1383930 m!1269129))

(assert (=> b!1383930 m!1269129))

(declare-fun m!1269131 () Bool)

(assert (=> b!1383930 m!1269131))

(declare-fun m!1269133 () Bool)

(assert (=> b!1383930 m!1269133))

(declare-fun m!1269135 () Bool)

(assert (=> b!1383930 m!1269135))

(assert (=> b!1383930 m!1269121))

(declare-fun m!1269137 () Bool)

(assert (=> b!1383930 m!1269137))

(assert (=> b!1383930 m!1269121))

(declare-fun m!1269139 () Bool)

(assert (=> b!1383930 m!1269139))

(push 1)

(assert (not b!1383926))

(assert (not b!1383925))

(assert (not start!118326))

(assert (not b!1383932))

(assert (not b!1383930))

(assert (not b!1383928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

