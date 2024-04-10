; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117940 () Bool)

(assert start!117940)

(declare-fun b!1381725 () Bool)

(declare-fun e!783233 () Bool)

(assert (=> b!1381725 (= e!783233 false)))

(declare-fun lt!608271 () Bool)

(declare-datatypes ((array!94331 0))(
  ( (array!94332 (arr!45548 (Array (_ BitVec 32) (_ BitVec 64))) (size!46098 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94331)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94331 (_ BitVec 32)) Bool)

(assert (=> b!1381725 (= lt!608271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381723 () Bool)

(declare-fun res!923352 () Bool)

(assert (=> b!1381723 (=> (not res!923352) (not e!783233))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381723 (= res!923352 (validKeyInArray!0 (select (arr!45548 a!2971) i!1094)))))

(declare-fun b!1381724 () Bool)

(declare-fun res!923350 () Bool)

(assert (=> b!1381724 (=> (not res!923350) (not e!783233))))

(declare-datatypes ((List!32082 0))(
  ( (Nil!32079) (Cons!32078 (h!33287 (_ BitVec 64)) (t!46776 List!32082)) )
))
(declare-fun arrayNoDuplicates!0 (array!94331 (_ BitVec 32) List!32082) Bool)

(assert (=> b!1381724 (= res!923350 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32079))))

(declare-fun b!1381722 () Bool)

(declare-fun res!923353 () Bool)

(assert (=> b!1381722 (=> (not res!923353) (not e!783233))))

(assert (=> b!1381722 (= res!923353 (and (= (size!46098 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46098 a!2971))))))

(declare-fun res!923351 () Bool)

(assert (=> start!117940 (=> (not res!923351) (not e!783233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117940 (= res!923351 (validMask!0 mask!3034))))

(assert (=> start!117940 e!783233))

(assert (=> start!117940 true))

(declare-fun array_inv!34576 (array!94331) Bool)

(assert (=> start!117940 (array_inv!34576 a!2971)))

(assert (= (and start!117940 res!923351) b!1381722))

(assert (= (and b!1381722 res!923353) b!1381723))

(assert (= (and b!1381723 res!923352) b!1381724))

(assert (= (and b!1381724 res!923350) b!1381725))

(declare-fun m!1266903 () Bool)

(assert (=> b!1381725 m!1266903))

(declare-fun m!1266905 () Bool)

(assert (=> b!1381723 m!1266905))

(assert (=> b!1381723 m!1266905))

(declare-fun m!1266907 () Bool)

(assert (=> b!1381723 m!1266907))

(declare-fun m!1266909 () Bool)

(assert (=> b!1381724 m!1266909))

(declare-fun m!1266911 () Bool)

(assert (=> start!117940 m!1266911))

(declare-fun m!1266913 () Bool)

(assert (=> start!117940 m!1266913))

(push 1)

(assert (not b!1381723))

(assert (not b!1381725))

(assert (not start!117940))

(assert (not b!1381724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

