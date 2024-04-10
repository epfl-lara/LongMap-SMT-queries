; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117952 () Bool)

(assert start!117952)

(declare-fun b!1381797 () Bool)

(declare-fun e!783268 () Bool)

(assert (=> b!1381797 (= e!783268 false)))

(declare-fun lt!608289 () Bool)

(declare-datatypes ((array!94343 0))(
  ( (array!94344 (arr!45554 (Array (_ BitVec 32) (_ BitVec 64))) (size!46104 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94343)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94343 (_ BitVec 32)) Bool)

(assert (=> b!1381797 (= lt!608289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923423 () Bool)

(assert (=> start!117952 (=> (not res!923423) (not e!783268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117952 (= res!923423 (validMask!0 mask!3034))))

(assert (=> start!117952 e!783268))

(assert (=> start!117952 true))

(declare-fun array_inv!34582 (array!94343) Bool)

(assert (=> start!117952 (array_inv!34582 a!2971)))

(declare-fun b!1381795 () Bool)

(declare-fun res!923422 () Bool)

(assert (=> b!1381795 (=> (not res!923422) (not e!783268))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381795 (= res!923422 (validKeyInArray!0 (select (arr!45554 a!2971) i!1094)))))

(declare-fun b!1381794 () Bool)

(declare-fun res!923425 () Bool)

(assert (=> b!1381794 (=> (not res!923425) (not e!783268))))

(assert (=> b!1381794 (= res!923425 (and (= (size!46104 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46104 a!2971))))))

(declare-fun b!1381796 () Bool)

(declare-fun res!923424 () Bool)

(assert (=> b!1381796 (=> (not res!923424) (not e!783268))))

(declare-datatypes ((List!32088 0))(
  ( (Nil!32085) (Cons!32084 (h!33293 (_ BitVec 64)) (t!46782 List!32088)) )
))
(declare-fun arrayNoDuplicates!0 (array!94343 (_ BitVec 32) List!32088) Bool)

(assert (=> b!1381796 (= res!923424 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32085))))

(assert (= (and start!117952 res!923423) b!1381794))

(assert (= (and b!1381794 res!923425) b!1381795))

(assert (= (and b!1381795 res!923422) b!1381796))

(assert (= (and b!1381796 res!923424) b!1381797))

(declare-fun m!1266975 () Bool)

(assert (=> b!1381797 m!1266975))

(declare-fun m!1266977 () Bool)

(assert (=> start!117952 m!1266977))

(declare-fun m!1266979 () Bool)

(assert (=> start!117952 m!1266979))

(declare-fun m!1266981 () Bool)

(assert (=> b!1381795 m!1266981))

(assert (=> b!1381795 m!1266981))

(declare-fun m!1266983 () Bool)

(assert (=> b!1381795 m!1266983))

(declare-fun m!1266985 () Bool)

(assert (=> b!1381796 m!1266985))

(push 1)

(assert (not b!1381797))

(assert (not start!117952))

(assert (not b!1381796))

(assert (not b!1381795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

