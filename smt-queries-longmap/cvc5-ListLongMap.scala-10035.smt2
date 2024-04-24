; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118530 () Bool)

(assert start!118530)

(declare-fun b!1385125 () Bool)

(declare-fun res!925914 () Bool)

(declare-fun e!785070 () Bool)

(assert (=> b!1385125 (=> (not res!925914) (not e!785070))))

(declare-datatypes ((array!94731 0))(
  ( (array!94732 (arr!45741 (Array (_ BitVec 32) (_ BitVec 64))) (size!46292 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94731)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94731 (_ BitVec 32)) Bool)

(assert (=> b!1385125 (= res!925914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385126 () Bool)

(declare-fun res!925915 () Bool)

(assert (=> b!1385126 (=> (not res!925915) (not e!785070))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385126 (= res!925915 (and (= (size!46292 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46292 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46292 a!2938))))))

(declare-fun b!1385127 () Bool)

(declare-fun res!925913 () Bool)

(assert (=> b!1385127 (=> (not res!925913) (not e!785070))))

(declare-datatypes ((List!32256 0))(
  ( (Nil!32253) (Cons!32252 (h!33470 (_ BitVec 64)) (t!46942 List!32256)) )
))
(declare-fun arrayNoDuplicates!0 (array!94731 (_ BitVec 32) List!32256) Bool)

(assert (=> b!1385127 (= res!925913 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32253))))

(declare-fun b!1385128 () Bool)

(declare-datatypes ((Unit!46040 0))(
  ( (Unit!46041) )
))
(declare-fun e!785069 () Unit!46040)

(declare-fun lt!609165 () Unit!46040)

(assert (=> b!1385128 (= e!785069 lt!609165)))

(declare-fun lt!609164 () Unit!46040)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46040)

(assert (=> b!1385128 (= lt!609164 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10037 0))(
  ( (MissingZero!10037 (index!42519 (_ BitVec 32))) (Found!10037 (index!42520 (_ BitVec 32))) (Intermediate!10037 (undefined!10849 Bool) (index!42521 (_ BitVec 32)) (x!124180 (_ BitVec 32))) (Undefined!10037) (MissingVacant!10037 (index!42522 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94731 (_ BitVec 32)) SeekEntryResult!10037)

(assert (=> b!1385128 (= (seekEntryOrOpen!0 (select (arr!45741 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45741 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94732 (store (arr!45741 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46292 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46040)

(assert (=> b!1385128 (= lt!609165 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385128 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925918 () Bool)

(assert (=> start!118530 (=> (not res!925918) (not e!785070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118530 (= res!925918 (validMask!0 mask!2987))))

(assert (=> start!118530 e!785070))

(assert (=> start!118530 true))

(declare-fun array_inv!35022 (array!94731) Bool)

(assert (=> start!118530 (array_inv!35022 a!2938)))

(declare-fun b!1385129 () Bool)

(declare-fun res!925912 () Bool)

(assert (=> b!1385129 (=> (not res!925912) (not e!785070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385129 (= res!925912 (validKeyInArray!0 (select (arr!45741 a!2938) i!1065)))))

(declare-fun b!1385130 () Bool)

(declare-fun Unit!46042 () Unit!46040)

(assert (=> b!1385130 (= e!785069 Unit!46042)))

(declare-fun b!1385131 () Bool)

(declare-fun res!925917 () Bool)

(assert (=> b!1385131 (=> (not res!925917) (not e!785070))))

(assert (=> b!1385131 (= res!925917 (and (not (= (select (arr!45741 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45741 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385132 () Bool)

(assert (=> b!1385132 (= e!785070 false)))

(declare-fun lt!609163 () Unit!46040)

(assert (=> b!1385132 (= lt!609163 e!785069)))

(declare-fun c!129054 () Bool)

(declare-fun e!785071 () Bool)

(assert (=> b!1385132 (= c!129054 e!785071)))

(declare-fun res!925916 () Bool)

(assert (=> b!1385132 (=> (not res!925916) (not e!785071))))

(assert (=> b!1385132 (= res!925916 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385133 () Bool)

(assert (=> b!1385133 (= e!785071 (validKeyInArray!0 (select (arr!45741 a!2938) startIndex!16)))))

(assert (= (and start!118530 res!925918) b!1385126))

(assert (= (and b!1385126 res!925915) b!1385129))

(assert (= (and b!1385129 res!925912) b!1385127))

(assert (= (and b!1385127 res!925913) b!1385125))

(assert (= (and b!1385125 res!925914) b!1385131))

(assert (= (and b!1385131 res!925917) b!1385132))

(assert (= (and b!1385132 res!925916) b!1385133))

(assert (= (and b!1385132 c!129054) b!1385128))

(assert (= (and b!1385132 (not c!129054)) b!1385130))

(declare-fun m!1270623 () Bool)

(assert (=> start!118530 m!1270623))

(declare-fun m!1270625 () Bool)

(assert (=> start!118530 m!1270625))

(declare-fun m!1270627 () Bool)

(assert (=> b!1385128 m!1270627))

(declare-fun m!1270629 () Bool)

(assert (=> b!1385128 m!1270629))

(assert (=> b!1385128 m!1270629))

(declare-fun m!1270631 () Bool)

(assert (=> b!1385128 m!1270631))

(declare-fun m!1270633 () Bool)

(assert (=> b!1385128 m!1270633))

(declare-fun m!1270635 () Bool)

(assert (=> b!1385128 m!1270635))

(declare-fun m!1270637 () Bool)

(assert (=> b!1385128 m!1270637))

(declare-fun m!1270639 () Bool)

(assert (=> b!1385128 m!1270639))

(assert (=> b!1385128 m!1270637))

(declare-fun m!1270641 () Bool)

(assert (=> b!1385128 m!1270641))

(assert (=> b!1385133 m!1270637))

(assert (=> b!1385133 m!1270637))

(declare-fun m!1270643 () Bool)

(assert (=> b!1385133 m!1270643))

(declare-fun m!1270645 () Bool)

(assert (=> b!1385129 m!1270645))

(assert (=> b!1385129 m!1270645))

(declare-fun m!1270647 () Bool)

(assert (=> b!1385129 m!1270647))

(declare-fun m!1270649 () Bool)

(assert (=> b!1385127 m!1270649))

(declare-fun m!1270651 () Bool)

(assert (=> b!1385125 m!1270651))

(assert (=> b!1385131 m!1270645))

(push 1)

(assert (not b!1385127))

(assert (not b!1385128))

(assert (not b!1385129))

(assert (not start!118530))

(assert (not b!1385133))

(assert (not b!1385125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

