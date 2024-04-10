; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118070 () Bool)

(assert start!118070)

(declare-fun b!1382492 () Bool)

(declare-fun res!924085 () Bool)

(declare-fun e!783595 () Bool)

(assert (=> b!1382492 (=> (not res!924085) (not e!783595))))

(declare-datatypes ((array!94434 0))(
  ( (array!94435 (arr!45598 (Array (_ BitVec 32) (_ BitVec 64))) (size!46148 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94434)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382492 (= res!924085 (validKeyInArray!0 (select (arr!45598 a!2971) i!1094)))))

(declare-fun b!1382493 () Bool)

(declare-fun res!924087 () Bool)

(assert (=> b!1382493 (=> (not res!924087) (not e!783595))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1382493 (= res!924087 (and (= (size!46148 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46148 a!2971))))))

(declare-fun b!1382494 () Bool)

(assert (=> b!1382494 (= e!783595 (and (not (= (select (arr!45598 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45598 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!46148 a!2971))))))

(declare-fun b!1382495 () Bool)

(declare-fun res!924086 () Bool)

(assert (=> b!1382495 (=> (not res!924086) (not e!783595))))

(declare-datatypes ((List!32132 0))(
  ( (Nil!32129) (Cons!32128 (h!33337 (_ BitVec 64)) (t!46826 List!32132)) )
))
(declare-fun arrayNoDuplicates!0 (array!94434 (_ BitVec 32) List!32132) Bool)

(assert (=> b!1382495 (= res!924086 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32129))))

(declare-fun res!924088 () Bool)

(assert (=> start!118070 (=> (not res!924088) (not e!783595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118070 (= res!924088 (validMask!0 mask!3034))))

(assert (=> start!118070 e!783595))

(assert (=> start!118070 true))

(declare-fun array_inv!34626 (array!94434) Bool)

(assert (=> start!118070 (array_inv!34626 a!2971)))

(declare-fun b!1382496 () Bool)

(declare-fun res!924084 () Bool)

(assert (=> b!1382496 (=> (not res!924084) (not e!783595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94434 (_ BitVec 32)) Bool)

(assert (=> b!1382496 (= res!924084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118070 res!924088) b!1382493))

(assert (= (and b!1382493 res!924087) b!1382492))

(assert (= (and b!1382492 res!924085) b!1382495))

(assert (= (and b!1382495 res!924086) b!1382496))

(assert (= (and b!1382496 res!924084) b!1382494))

(declare-fun m!1267623 () Bool)

(assert (=> b!1382494 m!1267623))

(declare-fun m!1267625 () Bool)

(assert (=> b!1382496 m!1267625))

(declare-fun m!1267627 () Bool)

(assert (=> start!118070 m!1267627))

(declare-fun m!1267629 () Bool)

(assert (=> start!118070 m!1267629))

(declare-fun m!1267631 () Bool)

(assert (=> b!1382495 m!1267631))

(assert (=> b!1382492 m!1267623))

(assert (=> b!1382492 m!1267623))

(declare-fun m!1267633 () Bool)

(assert (=> b!1382492 m!1267633))

(push 1)

(assert (not start!118070))

(assert (not b!1382492))

(assert (not b!1382496))

(assert (not b!1382495))

(check-sat)

