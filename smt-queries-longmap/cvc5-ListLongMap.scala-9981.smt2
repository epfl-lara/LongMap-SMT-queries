; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117892 () Bool)

(assert start!117892)

(declare-fun res!923079 () Bool)

(declare-fun e!783088 () Bool)

(assert (=> start!117892 (=> (not res!923079) (not e!783088))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117892 (= res!923079 (validMask!0 mask!3034))))

(assert (=> start!117892 e!783088))

(assert (=> start!117892 true))

(declare-datatypes ((array!94283 0))(
  ( (array!94284 (arr!45524 (Array (_ BitVec 32) (_ BitVec 64))) (size!46074 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94283)

(declare-fun array_inv!34552 (array!94283) Bool)

(assert (=> start!117892 (array_inv!34552 a!2971)))

(declare-fun b!1381450 () Bool)

(declare-fun res!923078 () Bool)

(assert (=> b!1381450 (=> (not res!923078) (not e!783088))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381450 (= res!923078 (and (= (size!46074 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46074 a!2971))))))

(declare-fun b!1381451 () Bool)

(declare-fun res!923080 () Bool)

(assert (=> b!1381451 (=> (not res!923080) (not e!783088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381451 (= res!923080 (validKeyInArray!0 (select (arr!45524 a!2971) i!1094)))))

(declare-fun b!1381452 () Bool)

(assert (=> b!1381452 (= e!783088 false)))

(declare-fun lt!608208 () Bool)

(declare-datatypes ((List!32058 0))(
  ( (Nil!32055) (Cons!32054 (h!33263 (_ BitVec 64)) (t!46752 List!32058)) )
))
(declare-fun arrayNoDuplicates!0 (array!94283 (_ BitVec 32) List!32058) Bool)

(assert (=> b!1381452 (= lt!608208 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32055))))

(assert (= (and start!117892 res!923079) b!1381450))

(assert (= (and b!1381450 res!923078) b!1381451))

(assert (= (and b!1381451 res!923080) b!1381452))

(declare-fun m!1266633 () Bool)

(assert (=> start!117892 m!1266633))

(declare-fun m!1266635 () Bool)

(assert (=> start!117892 m!1266635))

(declare-fun m!1266637 () Bool)

(assert (=> b!1381451 m!1266637))

(assert (=> b!1381451 m!1266637))

(declare-fun m!1266639 () Bool)

(assert (=> b!1381451 m!1266639))

(declare-fun m!1266641 () Bool)

(assert (=> b!1381452 m!1266641))

(push 1)

(assert (not b!1381451))

(assert (not b!1381452))

(assert (not start!117892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

