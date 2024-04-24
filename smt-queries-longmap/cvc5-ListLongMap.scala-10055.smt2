; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118680 () Bool)

(assert start!118680)

(declare-fun b!1386705 () Bool)

(declare-fun res!927169 () Bool)

(declare-fun e!785817 () Bool)

(assert (=> b!1386705 (=> (not res!927169) (not e!785817))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94854 0))(
  ( (array!94855 (arr!45801 (Array (_ BitVec 32) (_ BitVec 64))) (size!46352 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94854)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386705 (= res!927169 (and (= (size!46352 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46352 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46352 a!2938))))))

(declare-fun b!1386708 () Bool)

(assert (=> b!1386708 (= e!785817 false)))

(declare-fun lt!609714 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94854 (_ BitVec 32)) Bool)

(assert (=> b!1386708 (= lt!609714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386706 () Bool)

(declare-fun res!927166 () Bool)

(assert (=> b!1386706 (=> (not res!927166) (not e!785817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386706 (= res!927166 (validKeyInArray!0 (select (arr!45801 a!2938) i!1065)))))

(declare-fun res!927167 () Bool)

(assert (=> start!118680 (=> (not res!927167) (not e!785817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118680 (= res!927167 (validMask!0 mask!2987))))

(assert (=> start!118680 e!785817))

(assert (=> start!118680 true))

(declare-fun array_inv!35082 (array!94854) Bool)

(assert (=> start!118680 (array_inv!35082 a!2938)))

(declare-fun b!1386707 () Bool)

(declare-fun res!927168 () Bool)

(assert (=> b!1386707 (=> (not res!927168) (not e!785817))))

(declare-datatypes ((List!32316 0))(
  ( (Nil!32313) (Cons!32312 (h!33530 (_ BitVec 64)) (t!47002 List!32316)) )
))
(declare-fun arrayNoDuplicates!0 (array!94854 (_ BitVec 32) List!32316) Bool)

(assert (=> b!1386707 (= res!927168 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32313))))

(assert (= (and start!118680 res!927167) b!1386705))

(assert (= (and b!1386705 res!927169) b!1386706))

(assert (= (and b!1386706 res!927166) b!1386707))

(assert (= (and b!1386707 res!927168) b!1386708))

(declare-fun m!1272321 () Bool)

(assert (=> b!1386708 m!1272321))

(declare-fun m!1272323 () Bool)

(assert (=> b!1386706 m!1272323))

(assert (=> b!1386706 m!1272323))

(declare-fun m!1272325 () Bool)

(assert (=> b!1386706 m!1272325))

(declare-fun m!1272327 () Bool)

(assert (=> start!118680 m!1272327))

(declare-fun m!1272329 () Bool)

(assert (=> start!118680 m!1272329))

(declare-fun m!1272331 () Bool)

(assert (=> b!1386707 m!1272331))

(push 1)

(assert (not b!1386708))

(assert (not b!1386707))

(assert (not start!118680))

(assert (not b!1386706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

