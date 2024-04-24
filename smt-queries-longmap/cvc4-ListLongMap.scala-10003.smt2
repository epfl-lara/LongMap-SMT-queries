; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118270 () Bool)

(assert start!118270)

(declare-fun res!924511 () Bool)

(declare-fun e!784401 () Bool)

(assert (=> start!118270 (=> (not res!924511) (not e!784401))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118270 (= res!924511 (validMask!0 mask!3034))))

(assert (=> start!118270 e!784401))

(assert (=> start!118270 true))

(declare-datatypes ((array!94530 0))(
  ( (array!94531 (arr!45644 (Array (_ BitVec 32) (_ BitVec 64))) (size!46195 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94530)

(declare-fun array_inv!34925 (array!94530) Bool)

(assert (=> start!118270 (array_inv!34925 a!2971)))

(declare-fun b!1383711 () Bool)

(assert (=> b!1383711 (= e!784401 false)))

(declare-fun lt!608898 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94530 (_ BitVec 32)) Bool)

(assert (=> b!1383711 (= lt!608898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383708 () Bool)

(declare-fun res!924512 () Bool)

(assert (=> b!1383708 (=> (not res!924512) (not e!784401))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383708 (= res!924512 (and (= (size!46195 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46195 a!2971))))))

(declare-fun b!1383710 () Bool)

(declare-fun res!924514 () Bool)

(assert (=> b!1383710 (=> (not res!924514) (not e!784401))))

(declare-datatypes ((List!32165 0))(
  ( (Nil!32162) (Cons!32161 (h!33379 (_ BitVec 64)) (t!46851 List!32165)) )
))
(declare-fun arrayNoDuplicates!0 (array!94530 (_ BitVec 32) List!32165) Bool)

(assert (=> b!1383710 (= res!924514 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32162))))

(declare-fun b!1383709 () Bool)

(declare-fun res!924513 () Bool)

(assert (=> b!1383709 (=> (not res!924513) (not e!784401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383709 (= res!924513 (validKeyInArray!0 (select (arr!45644 a!2971) i!1094)))))

(assert (= (and start!118270 res!924511) b!1383708))

(assert (= (and b!1383708 res!924512) b!1383709))

(assert (= (and b!1383709 res!924513) b!1383710))

(assert (= (and b!1383710 res!924514) b!1383711))

(declare-fun m!1269171 () Bool)

(assert (=> start!118270 m!1269171))

(declare-fun m!1269173 () Bool)

(assert (=> start!118270 m!1269173))

(declare-fun m!1269175 () Bool)

(assert (=> b!1383711 m!1269175))

(declare-fun m!1269177 () Bool)

(assert (=> b!1383710 m!1269177))

(declare-fun m!1269179 () Bool)

(assert (=> b!1383709 m!1269179))

(assert (=> b!1383709 m!1269179))

(declare-fun m!1269181 () Bool)

(assert (=> b!1383709 m!1269181))

(push 1)

(assert (not b!1383709))

(assert (not start!118270))

(assert (not b!1383710))

(assert (not b!1383711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

