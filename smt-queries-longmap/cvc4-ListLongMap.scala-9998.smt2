; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118028 () Bool)

(assert start!118028)

(declare-fun b!1382235 () Bool)

(declare-fun e!783469 () Bool)

(assert (=> b!1382235 (= e!783469 false)))

(declare-fun lt!608376 () Bool)

(declare-datatypes ((array!94392 0))(
  ( (array!94393 (arr!45577 (Array (_ BitVec 32) (_ BitVec 64))) (size!46127 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94392)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94392 (_ BitVec 32)) Bool)

(assert (=> b!1382235 (= lt!608376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382234 () Bool)

(declare-fun res!923824 () Bool)

(assert (=> b!1382234 (=> (not res!923824) (not e!783469))))

(declare-datatypes ((List!32111 0))(
  ( (Nil!32108) (Cons!32107 (h!33316 (_ BitVec 64)) (t!46805 List!32111)) )
))
(declare-fun arrayNoDuplicates!0 (array!94392 (_ BitVec 32) List!32111) Bool)

(assert (=> b!1382234 (= res!923824 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32108))))

(declare-fun b!1382233 () Bool)

(declare-fun res!923826 () Bool)

(assert (=> b!1382233 (=> (not res!923826) (not e!783469))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382233 (= res!923826 (validKeyInArray!0 (select (arr!45577 a!2971) i!1094)))))

(declare-fun res!923827 () Bool)

(assert (=> start!118028 (=> (not res!923827) (not e!783469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118028 (= res!923827 (validMask!0 mask!3034))))

(assert (=> start!118028 e!783469))

(assert (=> start!118028 true))

(declare-fun array_inv!34605 (array!94392) Bool)

(assert (=> start!118028 (array_inv!34605 a!2971)))

(declare-fun b!1382232 () Bool)

(declare-fun res!923825 () Bool)

(assert (=> b!1382232 (=> (not res!923825) (not e!783469))))

(assert (=> b!1382232 (= res!923825 (and (= (size!46127 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46127 a!2971))))))

(assert (= (and start!118028 res!923827) b!1382232))

(assert (= (and b!1382232 res!923825) b!1382233))

(assert (= (and b!1382233 res!923826) b!1382234))

(assert (= (and b!1382234 res!923824) b!1382235))

(declare-fun m!1267371 () Bool)

(assert (=> b!1382235 m!1267371))

(declare-fun m!1267373 () Bool)

(assert (=> b!1382234 m!1267373))

(declare-fun m!1267375 () Bool)

(assert (=> b!1382233 m!1267375))

(assert (=> b!1382233 m!1267375))

(declare-fun m!1267377 () Bool)

(assert (=> b!1382233 m!1267377))

(declare-fun m!1267379 () Bool)

(assert (=> start!118028 m!1267379))

(declare-fun m!1267381 () Bool)

(assert (=> start!118028 m!1267381))

(push 1)

(assert (not b!1382233))

(assert (not start!118028))

(assert (not b!1382234))

(assert (not b!1382235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

