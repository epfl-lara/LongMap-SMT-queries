; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118038 () Bool)

(assert start!118038)

(declare-fun b!1382235 () Bool)

(declare-fun res!923873 () Bool)

(declare-fun e!783474 () Bool)

(assert (=> b!1382235 (=> (not res!923873) (not e!783474))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94354 0))(
  ( (array!94355 (arr!45558 (Array (_ BitVec 32) (_ BitVec 64))) (size!46110 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94354)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382235 (= res!923873 (and (= (size!46110 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46110 a!2971))))))

(declare-fun b!1382238 () Bool)

(assert (=> b!1382238 (= e!783474 false)))

(declare-fun lt!608210 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94354 (_ BitVec 32)) Bool)

(assert (=> b!1382238 (= lt!608210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382236 () Bool)

(declare-fun res!923872 () Bool)

(assert (=> b!1382236 (=> (not res!923872) (not e!783474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382236 (= res!923872 (validKeyInArray!0 (select (arr!45558 a!2971) i!1094)))))

(declare-fun b!1382237 () Bool)

(declare-fun res!923871 () Bool)

(assert (=> b!1382237 (=> (not res!923871) (not e!783474))))

(declare-datatypes ((List!32170 0))(
  ( (Nil!32167) (Cons!32166 (h!33375 (_ BitVec 64)) (t!46856 List!32170)) )
))
(declare-fun arrayNoDuplicates!0 (array!94354 (_ BitVec 32) List!32170) Bool)

(assert (=> b!1382237 (= res!923871 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32167))))

(declare-fun res!923870 () Bool)

(assert (=> start!118038 (=> (not res!923870) (not e!783474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118038 (= res!923870 (validMask!0 mask!3034))))

(assert (=> start!118038 e!783474))

(assert (=> start!118038 true))

(declare-fun array_inv!34791 (array!94354) Bool)

(assert (=> start!118038 (array_inv!34791 a!2971)))

(assert (= (and start!118038 res!923870) b!1382235))

(assert (= (and b!1382235 res!923873) b!1382236))

(assert (= (and b!1382236 res!923872) b!1382237))

(assert (= (and b!1382237 res!923871) b!1382238))

(declare-fun m!1266939 () Bool)

(assert (=> b!1382238 m!1266939))

(declare-fun m!1266941 () Bool)

(assert (=> b!1382236 m!1266941))

(assert (=> b!1382236 m!1266941))

(declare-fun m!1266943 () Bool)

(assert (=> b!1382236 m!1266943))

(declare-fun m!1266945 () Bool)

(assert (=> b!1382237 m!1266945))

(declare-fun m!1266947 () Bool)

(assert (=> start!118038 m!1266947))

(declare-fun m!1266949 () Bool)

(assert (=> start!118038 m!1266949))

(push 1)

(assert (not b!1382236))

(assert (not start!118038))

(assert (not b!1382237))

(assert (not b!1382238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

