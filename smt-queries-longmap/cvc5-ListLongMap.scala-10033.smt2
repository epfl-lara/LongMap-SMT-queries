; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118302 () Bool)

(assert start!118302)

(declare-fun res!925230 () Bool)

(declare-fun e!784156 () Bool)

(assert (=> start!118302 (=> (not res!925230) (not e!784156))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118302 (= res!925230 (validMask!0 mask!2987))))

(assert (=> start!118302 e!784156))

(assert (=> start!118302 true))

(declare-datatypes ((array!94605 0))(
  ( (array!94606 (arr!45680 (Array (_ BitVec 32) (_ BitVec 64))) (size!46230 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94605)

(declare-fun array_inv!34708 (array!94605) Bool)

(assert (=> start!118302 (array_inv!34708 a!2938)))

(declare-fun b!1383633 () Bool)

(declare-fun res!925228 () Bool)

(assert (=> b!1383633 (=> (not res!925228) (not e!784156))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383633 (= res!925228 (validKeyInArray!0 (select (arr!45680 a!2938) i!1065)))))

(declare-fun b!1383634 () Bool)

(declare-fun res!925231 () Bool)

(assert (=> b!1383634 (=> (not res!925231) (not e!784156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94605 (_ BitVec 32)) Bool)

(assert (=> b!1383634 (= res!925231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383635 () Bool)

(declare-fun res!925229 () Bool)

(assert (=> b!1383635 (=> (not res!925229) (not e!784156))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383635 (= res!925229 (and (= (size!46230 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46230 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46230 a!2938))))))

(declare-fun b!1383636 () Bool)

(declare-fun res!925226 () Bool)

(assert (=> b!1383636 (=> (not res!925226) (not e!784156))))

(assert (=> b!1383636 (= res!925226 (validKeyInArray!0 (select (arr!45680 a!2938) startIndex!16)))))

(declare-fun b!1383637 () Bool)

(assert (=> b!1383637 (= e!784156 (not true))))

(declare-datatypes ((SeekEntryResult!10073 0))(
  ( (MissingZero!10073 (index!42663 (_ BitVec 32))) (Found!10073 (index!42664 (_ BitVec 32))) (Intermediate!10073 (undefined!10885 Bool) (index!42665 (_ BitVec 32)) (x!124178 (_ BitVec 32))) (Undefined!10073) (MissingVacant!10073 (index!42666 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94605 (_ BitVec 32)) SeekEntryResult!10073)

(assert (=> b!1383637 (= (seekEntryOrOpen!0 (select (arr!45680 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45680 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94606 (store (arr!45680 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46230 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46083 0))(
  ( (Unit!46084) )
))
(declare-fun lt!608643 () Unit!46083)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46083)

(assert (=> b!1383637 (= lt!608643 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383638 () Bool)

(declare-fun res!925227 () Bool)

(assert (=> b!1383638 (=> (not res!925227) (not e!784156))))

(assert (=> b!1383638 (= res!925227 (and (not (= (select (arr!45680 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45680 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383639 () Bool)

(declare-fun res!925225 () Bool)

(assert (=> b!1383639 (=> (not res!925225) (not e!784156))))

(declare-datatypes ((List!32208 0))(
  ( (Nil!32205) (Cons!32204 (h!33413 (_ BitVec 64)) (t!46902 List!32208)) )
))
(declare-fun arrayNoDuplicates!0 (array!94605 (_ BitVec 32) List!32208) Bool)

(assert (=> b!1383639 (= res!925225 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32205))))

(assert (= (and start!118302 res!925230) b!1383635))

(assert (= (and b!1383635 res!925229) b!1383633))

(assert (= (and b!1383633 res!925228) b!1383639))

(assert (= (and b!1383639 res!925225) b!1383634))

(assert (= (and b!1383634 res!925231) b!1383638))

(assert (= (and b!1383638 res!925227) b!1383636))

(assert (= (and b!1383636 res!925226) b!1383637))

(declare-fun m!1268775 () Bool)

(assert (=> b!1383639 m!1268775))

(declare-fun m!1268777 () Bool)

(assert (=> b!1383638 m!1268777))

(declare-fun m!1268779 () Bool)

(assert (=> b!1383637 m!1268779))

(assert (=> b!1383637 m!1268779))

(declare-fun m!1268781 () Bool)

(assert (=> b!1383637 m!1268781))

(declare-fun m!1268783 () Bool)

(assert (=> b!1383637 m!1268783))

(declare-fun m!1268785 () Bool)

(assert (=> b!1383637 m!1268785))

(declare-fun m!1268787 () Bool)

(assert (=> b!1383637 m!1268787))

(assert (=> b!1383637 m!1268787))

(declare-fun m!1268789 () Bool)

(assert (=> b!1383637 m!1268789))

(declare-fun m!1268791 () Bool)

(assert (=> b!1383634 m!1268791))

(assert (=> b!1383636 m!1268787))

(assert (=> b!1383636 m!1268787))

(declare-fun m!1268793 () Bool)

(assert (=> b!1383636 m!1268793))

(declare-fun m!1268795 () Bool)

(assert (=> start!118302 m!1268795))

(declare-fun m!1268797 () Bool)

(assert (=> start!118302 m!1268797))

(assert (=> b!1383633 m!1268777))

(assert (=> b!1383633 m!1268777))

(declare-fun m!1268799 () Bool)

(assert (=> b!1383633 m!1268799))

(push 1)

(assert (not b!1383636))

(assert (not b!1383639))

(assert (not start!118302))

(assert (not b!1383633))

(assert (not b!1383637))

(assert (not b!1383634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

