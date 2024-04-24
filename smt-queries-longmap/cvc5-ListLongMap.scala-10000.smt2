; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118254 () Bool)

(assert start!118254)

(declare-fun b!1383612 () Bool)

(declare-fun res!924415 () Bool)

(declare-fun e!784354 () Bool)

(assert (=> b!1383612 (=> (not res!924415) (not e!784354))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94514 0))(
  ( (array!94515 (arr!45636 (Array (_ BitVec 32) (_ BitVec 64))) (size!46187 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94514)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383612 (= res!924415 (and (= (size!46187 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46187 a!2971))))))

(declare-fun b!1383615 () Bool)

(assert (=> b!1383615 (= e!784354 false)))

(declare-fun lt!608874 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94514 (_ BitVec 32)) Bool)

(assert (=> b!1383615 (= lt!608874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383614 () Bool)

(declare-fun res!924418 () Bool)

(assert (=> b!1383614 (=> (not res!924418) (not e!784354))))

(declare-datatypes ((List!32157 0))(
  ( (Nil!32154) (Cons!32153 (h!33371 (_ BitVec 64)) (t!46843 List!32157)) )
))
(declare-fun arrayNoDuplicates!0 (array!94514 (_ BitVec 32) List!32157) Bool)

(assert (=> b!1383614 (= res!924418 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32154))))

(declare-fun res!924416 () Bool)

(assert (=> start!118254 (=> (not res!924416) (not e!784354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118254 (= res!924416 (validMask!0 mask!3034))))

(assert (=> start!118254 e!784354))

(assert (=> start!118254 true))

(declare-fun array_inv!34917 (array!94514) Bool)

(assert (=> start!118254 (array_inv!34917 a!2971)))

(declare-fun b!1383613 () Bool)

(declare-fun res!924417 () Bool)

(assert (=> b!1383613 (=> (not res!924417) (not e!784354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383613 (= res!924417 (validKeyInArray!0 (select (arr!45636 a!2971) i!1094)))))

(assert (= (and start!118254 res!924416) b!1383612))

(assert (= (and b!1383612 res!924415) b!1383613))

(assert (= (and b!1383613 res!924417) b!1383614))

(assert (= (and b!1383614 res!924418) b!1383615))

(declare-fun m!1269075 () Bool)

(assert (=> b!1383615 m!1269075))

(declare-fun m!1269077 () Bool)

(assert (=> b!1383614 m!1269077))

(declare-fun m!1269079 () Bool)

(assert (=> start!118254 m!1269079))

(declare-fun m!1269081 () Bool)

(assert (=> start!118254 m!1269081))

(declare-fun m!1269083 () Bool)

(assert (=> b!1383613 m!1269083))

(assert (=> b!1383613 m!1269083))

(declare-fun m!1269085 () Bool)

(assert (=> b!1383613 m!1269085))

(push 1)

(assert (not b!1383613))

(assert (not b!1383615))

(assert (not start!118254))

(assert (not b!1383614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

