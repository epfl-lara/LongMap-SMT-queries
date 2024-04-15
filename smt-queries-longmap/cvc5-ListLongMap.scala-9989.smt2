; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117942 () Bool)

(assert start!117942)

(declare-fun b!1381677 () Bool)

(declare-fun res!923351 () Bool)

(declare-fun e!783214 () Bool)

(assert (=> b!1381677 (=> (not res!923351) (not e!783214))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94285 0))(
  ( (array!94286 (arr!45525 (Array (_ BitVec 32) (_ BitVec 64))) (size!46077 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94285)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381677 (= res!923351 (and (= (size!46077 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46077 a!2971))))))

(declare-fun b!1381680 () Bool)

(assert (=> b!1381680 (= e!783214 false)))

(declare-fun lt!608093 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94285 (_ BitVec 32)) Bool)

(assert (=> b!1381680 (= lt!608093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923348 () Bool)

(assert (=> start!117942 (=> (not res!923348) (not e!783214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117942 (= res!923348 (validMask!0 mask!3034))))

(assert (=> start!117942 e!783214))

(assert (=> start!117942 true))

(declare-fun array_inv!34758 (array!94285) Bool)

(assert (=> start!117942 (array_inv!34758 a!2971)))

(declare-fun b!1381678 () Bool)

(declare-fun res!923350 () Bool)

(assert (=> b!1381678 (=> (not res!923350) (not e!783214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381678 (= res!923350 (validKeyInArray!0 (select (arr!45525 a!2971) i!1094)))))

(declare-fun b!1381679 () Bool)

(declare-fun res!923349 () Bool)

(assert (=> b!1381679 (=> (not res!923349) (not e!783214))))

(declare-datatypes ((List!32137 0))(
  ( (Nil!32134) (Cons!32133 (h!33342 (_ BitVec 64)) (t!46823 List!32137)) )
))
(declare-fun arrayNoDuplicates!0 (array!94285 (_ BitVec 32) List!32137) Bool)

(assert (=> b!1381679 (= res!923349 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32134))))

(assert (= (and start!117942 res!923348) b!1381677))

(assert (= (and b!1381677 res!923351) b!1381678))

(assert (= (and b!1381678 res!923350) b!1381679))

(assert (= (and b!1381679 res!923349) b!1381680))

(declare-fun m!1266423 () Bool)

(assert (=> b!1381680 m!1266423))

(declare-fun m!1266425 () Bool)

(assert (=> start!117942 m!1266425))

(declare-fun m!1266427 () Bool)

(assert (=> start!117942 m!1266427))

(declare-fun m!1266429 () Bool)

(assert (=> b!1381678 m!1266429))

(assert (=> b!1381678 m!1266429))

(declare-fun m!1266431 () Bool)

(assert (=> b!1381678 m!1266431))

(declare-fun m!1266433 () Bool)

(assert (=> b!1381679 m!1266433))

(push 1)

(assert (not start!117942))

(assert (not b!1381679))

(assert (not b!1381678))

(assert (not b!1381680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

