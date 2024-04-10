; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118542 () Bool)

(assert start!118542)

(declare-fun b!1385870 () Bool)

(declare-fun res!927118 () Bool)

(declare-fun e!785191 () Bool)

(assert (=> b!1385870 (=> (not res!927118) (not e!785191))))

(declare-datatypes ((array!94818 0))(
  ( (array!94819 (arr!45785 (Array (_ BitVec 32) (_ BitVec 64))) (size!46335 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94818)

(declare-datatypes ((List!32313 0))(
  ( (Nil!32310) (Cons!32309 (h!33518 (_ BitVec 64)) (t!47007 List!32313)) )
))
(declare-fun arrayNoDuplicates!0 (array!94818 (_ BitVec 32) List!32313) Bool)

(assert (=> b!1385870 (= res!927118 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32310))))

(declare-fun res!927120 () Bool)

(assert (=> start!118542 (=> (not res!927120) (not e!785191))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118542 (= res!927120 (validMask!0 mask!2987))))

(assert (=> start!118542 e!785191))

(assert (=> start!118542 true))

(declare-fun array_inv!34813 (array!94818) Bool)

(assert (=> start!118542 (array_inv!34813 a!2938)))

(declare-fun b!1385868 () Bool)

(declare-fun res!927121 () Bool)

(assert (=> b!1385868 (=> (not res!927121) (not e!785191))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385868 (= res!927121 (and (= (size!46335 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46335 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46335 a!2938))))))

(declare-fun b!1385871 () Bool)

(assert (=> b!1385871 (= e!785191 false)))

(declare-fun lt!609336 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94818 (_ BitVec 32)) Bool)

(assert (=> b!1385871 (= lt!609336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385869 () Bool)

(declare-fun res!927119 () Bool)

(assert (=> b!1385869 (=> (not res!927119) (not e!785191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385869 (= res!927119 (validKeyInArray!0 (select (arr!45785 a!2938) i!1065)))))

(assert (= (and start!118542 res!927120) b!1385868))

(assert (= (and b!1385868 res!927121) b!1385869))

(assert (= (and b!1385869 res!927119) b!1385870))

(assert (= (and b!1385870 res!927118) b!1385871))

(declare-fun m!1271145 () Bool)

(assert (=> b!1385870 m!1271145))

(declare-fun m!1271147 () Bool)

(assert (=> start!118542 m!1271147))

(declare-fun m!1271149 () Bool)

(assert (=> start!118542 m!1271149))

(declare-fun m!1271151 () Bool)

(assert (=> b!1385871 m!1271151))

(declare-fun m!1271153 () Bool)

(assert (=> b!1385869 m!1271153))

(assert (=> b!1385869 m!1271153))

(declare-fun m!1271155 () Bool)

(assert (=> b!1385869 m!1271155))

(push 1)

(assert (not b!1385871))

(assert (not b!1385869))

(assert (not start!118542))

(assert (not b!1385870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

