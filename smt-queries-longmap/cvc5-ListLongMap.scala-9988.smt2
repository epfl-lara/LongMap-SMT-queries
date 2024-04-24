; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118152 () Bool)

(assert start!118152)

(declare-fun b!1383021 () Bool)

(declare-fun e!784075 () Bool)

(assert (=> b!1383021 (= e!784075 false)))

(declare-fun lt!608748 () Bool)

(declare-datatypes ((array!94439 0))(
  ( (array!94440 (arr!45600 (Array (_ BitVec 32) (_ BitVec 64))) (size!46151 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94439)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94439 (_ BitVec 32)) Bool)

(assert (=> b!1383021 (= lt!608748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383018 () Bool)

(declare-fun res!923858 () Bool)

(assert (=> b!1383018 (=> (not res!923858) (not e!784075))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383018 (= res!923858 (and (= (size!46151 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46151 a!2971))))))

(declare-fun b!1383019 () Bool)

(declare-fun res!923857 () Bool)

(assert (=> b!1383019 (=> (not res!923857) (not e!784075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383019 (= res!923857 (validKeyInArray!0 (select (arr!45600 a!2971) i!1094)))))

(declare-fun b!1383020 () Bool)

(declare-fun res!923859 () Bool)

(assert (=> b!1383020 (=> (not res!923859) (not e!784075))))

(declare-datatypes ((List!32121 0))(
  ( (Nil!32118) (Cons!32117 (h!33335 (_ BitVec 64)) (t!46807 List!32121)) )
))
(declare-fun arrayNoDuplicates!0 (array!94439 (_ BitVec 32) List!32121) Bool)

(assert (=> b!1383020 (= res!923859 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32118))))

(declare-fun res!923860 () Bool)

(assert (=> start!118152 (=> (not res!923860) (not e!784075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118152 (= res!923860 (validMask!0 mask!3034))))

(assert (=> start!118152 e!784075))

(assert (=> start!118152 true))

(declare-fun array_inv!34881 (array!94439) Bool)

(assert (=> start!118152 (array_inv!34881 a!2971)))

(assert (= (and start!118152 res!923860) b!1383018))

(assert (= (and b!1383018 res!923858) b!1383019))

(assert (= (and b!1383019 res!923857) b!1383020))

(assert (= (and b!1383020 res!923859) b!1383021))

(declare-fun m!1268523 () Bool)

(assert (=> b!1383021 m!1268523))

(declare-fun m!1268525 () Bool)

(assert (=> b!1383019 m!1268525))

(assert (=> b!1383019 m!1268525))

(declare-fun m!1268527 () Bool)

(assert (=> b!1383019 m!1268527))

(declare-fun m!1268529 () Bool)

(assert (=> b!1383020 m!1268529))

(declare-fun m!1268531 () Bool)

(assert (=> start!118152 m!1268531))

(declare-fun m!1268533 () Bool)

(assert (=> start!118152 m!1268533))

(push 1)

(assert (not b!1383021))

(assert (not start!118152))

(assert (not b!1383020))

(assert (not b!1383019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

