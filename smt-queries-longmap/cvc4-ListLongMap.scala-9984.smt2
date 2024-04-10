; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117914 () Bool)

(assert start!117914)

(declare-fun b!1381569 () Bool)

(declare-fun e!783154 () Bool)

(assert (=> b!1381569 (= e!783154 false)))

(declare-fun lt!608232 () Bool)

(declare-datatypes ((array!94305 0))(
  ( (array!94306 (arr!45535 (Array (_ BitVec 32) (_ BitVec 64))) (size!46085 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94305)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94305 (_ BitVec 32)) Bool)

(assert (=> b!1381569 (= lt!608232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923197 () Bool)

(assert (=> start!117914 (=> (not res!923197) (not e!783154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117914 (= res!923197 (validMask!0 mask!3034))))

(assert (=> start!117914 e!783154))

(assert (=> start!117914 true))

(declare-fun array_inv!34563 (array!94305) Bool)

(assert (=> start!117914 (array_inv!34563 a!2971)))

(declare-fun b!1381568 () Bool)

(declare-fun res!923195 () Bool)

(assert (=> b!1381568 (=> (not res!923195) (not e!783154))))

(declare-datatypes ((List!32069 0))(
  ( (Nil!32066) (Cons!32065 (h!33274 (_ BitVec 64)) (t!46763 List!32069)) )
))
(declare-fun arrayNoDuplicates!0 (array!94305 (_ BitVec 32) List!32069) Bool)

(assert (=> b!1381568 (= res!923195 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32066))))

(declare-fun b!1381567 () Bool)

(declare-fun res!923194 () Bool)

(assert (=> b!1381567 (=> (not res!923194) (not e!783154))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381567 (= res!923194 (validKeyInArray!0 (select (arr!45535 a!2971) i!1094)))))

(declare-fun b!1381566 () Bool)

(declare-fun res!923196 () Bool)

(assert (=> b!1381566 (=> (not res!923196) (not e!783154))))

(assert (=> b!1381566 (= res!923196 (and (= (size!46085 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46085 a!2971))))))

(assert (= (and start!117914 res!923197) b!1381566))

(assert (= (and b!1381566 res!923196) b!1381567))

(assert (= (and b!1381567 res!923194) b!1381568))

(assert (= (and b!1381568 res!923195) b!1381569))

(declare-fun m!1266747 () Bool)

(assert (=> b!1381569 m!1266747))

(declare-fun m!1266749 () Bool)

(assert (=> start!117914 m!1266749))

(declare-fun m!1266751 () Bool)

(assert (=> start!117914 m!1266751))

(declare-fun m!1266753 () Bool)

(assert (=> b!1381568 m!1266753))

(declare-fun m!1266755 () Bool)

(assert (=> b!1381567 m!1266755))

(assert (=> b!1381567 m!1266755))

(declare-fun m!1266757 () Bool)

(assert (=> b!1381567 m!1266757))

(push 1)

(assert (not start!117914))

(assert (not b!1381568))

(assert (not b!1381567))

(assert (not b!1381569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

