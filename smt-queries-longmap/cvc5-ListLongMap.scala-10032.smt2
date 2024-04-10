; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118296 () Bool)

(assert start!118296)

(declare-fun res!925168 () Bool)

(declare-fun e!784138 () Bool)

(assert (=> start!118296 (=> (not res!925168) (not e!784138))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118296 (= res!925168 (validMask!0 mask!2987))))

(assert (=> start!118296 e!784138))

(assert (=> start!118296 true))

(declare-datatypes ((array!94599 0))(
  ( (array!94600 (arr!45677 (Array (_ BitVec 32) (_ BitVec 64))) (size!46227 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94599)

(declare-fun array_inv!34705 (array!94599) Bool)

(assert (=> start!118296 (array_inv!34705 a!2938)))

(declare-fun b!1383570 () Bool)

(declare-fun res!925164 () Bool)

(assert (=> b!1383570 (=> (not res!925164) (not e!784138))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383570 (= res!925164 (and (not (= (select (arr!45677 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45677 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383571 () Bool)

(declare-fun res!925163 () Bool)

(assert (=> b!1383571 (=> (not res!925163) (not e!784138))))

(assert (=> b!1383571 (= res!925163 (and (= (size!46227 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46227 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46227 a!2938))))))

(declare-fun b!1383572 () Bool)

(declare-fun res!925167 () Bool)

(assert (=> b!1383572 (=> (not res!925167) (not e!784138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94599 (_ BitVec 32)) Bool)

(assert (=> b!1383572 (= res!925167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383573 () Bool)

(declare-fun res!925166 () Bool)

(assert (=> b!1383573 (=> (not res!925166) (not e!784138))))

(declare-datatypes ((List!32205 0))(
  ( (Nil!32202) (Cons!32201 (h!33410 (_ BitVec 64)) (t!46899 List!32205)) )
))
(declare-fun arrayNoDuplicates!0 (array!94599 (_ BitVec 32) List!32205) Bool)

(assert (=> b!1383573 (= res!925166 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32202))))

(declare-fun b!1383574 () Bool)

(assert (=> b!1383574 (= e!784138 (not true))))

(declare-datatypes ((SeekEntryResult!10070 0))(
  ( (MissingZero!10070 (index!42651 (_ BitVec 32))) (Found!10070 (index!42652 (_ BitVec 32))) (Intermediate!10070 (undefined!10882 Bool) (index!42653 (_ BitVec 32)) (x!124167 (_ BitVec 32))) (Undefined!10070) (MissingVacant!10070 (index!42654 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94599 (_ BitVec 32)) SeekEntryResult!10070)

(assert (=> b!1383574 (= (seekEntryOrOpen!0 (select (arr!45677 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45677 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94600 (store (arr!45677 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46227 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46077 0))(
  ( (Unit!46078) )
))
(declare-fun lt!608634 () Unit!46077)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46077)

(assert (=> b!1383574 (= lt!608634 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383575 () Bool)

(declare-fun res!925165 () Bool)

(assert (=> b!1383575 (=> (not res!925165) (not e!784138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383575 (= res!925165 (validKeyInArray!0 (select (arr!45677 a!2938) startIndex!16)))))

(declare-fun b!1383576 () Bool)

(declare-fun res!925162 () Bool)

(assert (=> b!1383576 (=> (not res!925162) (not e!784138))))

(assert (=> b!1383576 (= res!925162 (validKeyInArray!0 (select (arr!45677 a!2938) i!1065)))))

(assert (= (and start!118296 res!925168) b!1383571))

(assert (= (and b!1383571 res!925163) b!1383576))

(assert (= (and b!1383576 res!925162) b!1383573))

(assert (= (and b!1383573 res!925166) b!1383572))

(assert (= (and b!1383572 res!925167) b!1383570))

(assert (= (and b!1383570 res!925164) b!1383575))

(assert (= (and b!1383575 res!925165) b!1383574))

(declare-fun m!1268697 () Bool)

(assert (=> b!1383576 m!1268697))

(assert (=> b!1383576 m!1268697))

(declare-fun m!1268699 () Bool)

(assert (=> b!1383576 m!1268699))

(declare-fun m!1268701 () Bool)

(assert (=> b!1383572 m!1268701))

(declare-fun m!1268703 () Bool)

(assert (=> b!1383575 m!1268703))

(assert (=> b!1383575 m!1268703))

(declare-fun m!1268705 () Bool)

(assert (=> b!1383575 m!1268705))

(assert (=> b!1383570 m!1268697))

(declare-fun m!1268707 () Bool)

(assert (=> start!118296 m!1268707))

(declare-fun m!1268709 () Bool)

(assert (=> start!118296 m!1268709))

(declare-fun m!1268711 () Bool)

(assert (=> b!1383573 m!1268711))

(declare-fun m!1268713 () Bool)

(assert (=> b!1383574 m!1268713))

(assert (=> b!1383574 m!1268713))

(declare-fun m!1268715 () Bool)

(assert (=> b!1383574 m!1268715))

(declare-fun m!1268717 () Bool)

(assert (=> b!1383574 m!1268717))

(declare-fun m!1268719 () Bool)

(assert (=> b!1383574 m!1268719))

(assert (=> b!1383574 m!1268703))

(assert (=> b!1383574 m!1268703))

(declare-fun m!1268721 () Bool)

(assert (=> b!1383574 m!1268721))

(push 1)

(assert (not b!1383575))

(assert (not start!118296))

(assert (not b!1383572))

(assert (not b!1383576))

(assert (not b!1383574))

(assert (not b!1383573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

