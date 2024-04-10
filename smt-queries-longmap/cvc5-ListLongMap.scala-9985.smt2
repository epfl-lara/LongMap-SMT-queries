; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117916 () Bool)

(assert start!117916)

(declare-fun res!923208 () Bool)

(declare-fun e!783161 () Bool)

(assert (=> start!117916 (=> (not res!923208) (not e!783161))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117916 (= res!923208 (validMask!0 mask!3034))))

(assert (=> start!117916 e!783161))

(assert (=> start!117916 true))

(declare-datatypes ((array!94307 0))(
  ( (array!94308 (arr!45536 (Array (_ BitVec 32) (_ BitVec 64))) (size!46086 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94307)

(declare-fun array_inv!34564 (array!94307) Bool)

(assert (=> start!117916 (array_inv!34564 a!2971)))

(declare-fun b!1381580 () Bool)

(declare-fun res!923207 () Bool)

(assert (=> b!1381580 (=> (not res!923207) (not e!783161))))

(declare-datatypes ((List!32070 0))(
  ( (Nil!32067) (Cons!32066 (h!33275 (_ BitVec 64)) (t!46764 List!32070)) )
))
(declare-fun arrayNoDuplicates!0 (array!94307 (_ BitVec 32) List!32070) Bool)

(assert (=> b!1381580 (= res!923207 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32067))))

(declare-fun b!1381581 () Bool)

(assert (=> b!1381581 (= e!783161 false)))

(declare-fun lt!608235 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94307 (_ BitVec 32)) Bool)

(assert (=> b!1381581 (= lt!608235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381579 () Bool)

(declare-fun res!923209 () Bool)

(assert (=> b!1381579 (=> (not res!923209) (not e!783161))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381579 (= res!923209 (validKeyInArray!0 (select (arr!45536 a!2971) i!1094)))))

(declare-fun b!1381578 () Bool)

(declare-fun res!923206 () Bool)

(assert (=> b!1381578 (=> (not res!923206) (not e!783161))))

(assert (=> b!1381578 (= res!923206 (and (= (size!46086 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46086 a!2971))))))

(assert (= (and start!117916 res!923208) b!1381578))

(assert (= (and b!1381578 res!923206) b!1381579))

(assert (= (and b!1381579 res!923209) b!1381580))

(assert (= (and b!1381580 res!923207) b!1381581))

(declare-fun m!1266759 () Bool)

(assert (=> start!117916 m!1266759))

(declare-fun m!1266761 () Bool)

(assert (=> start!117916 m!1266761))

(declare-fun m!1266763 () Bool)

(assert (=> b!1381580 m!1266763))

(declare-fun m!1266765 () Bool)

(assert (=> b!1381581 m!1266765))

(declare-fun m!1266767 () Bool)

(assert (=> b!1381579 m!1266767))

(assert (=> b!1381579 m!1266767))

(declare-fun m!1266769 () Bool)

(assert (=> b!1381579 m!1266769))

(push 1)

(assert (not b!1381581))

(assert (not start!117916))

(assert (not b!1381580))

(assert (not b!1381579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

