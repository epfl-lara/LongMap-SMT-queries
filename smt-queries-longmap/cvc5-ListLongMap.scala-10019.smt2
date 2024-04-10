; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118218 () Bool)

(assert start!118218)

(declare-fun res!924634 () Bool)

(declare-fun e!783904 () Bool)

(assert (=> start!118218 (=> (not res!924634) (not e!783904))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118218 (= res!924634 (validMask!0 mask!2987))))

(assert (=> start!118218 e!783904))

(assert (=> start!118218 true))

(declare-datatypes ((array!94521 0))(
  ( (array!94522 (arr!45638 (Array (_ BitVec 32) (_ BitVec 64))) (size!46188 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94521)

(declare-fun array_inv!34666 (array!94521) Bool)

(assert (=> start!118218 (array_inv!34666 a!2938)))

(declare-fun b!1383043 () Bool)

(declare-fun res!924636 () Bool)

(assert (=> b!1383043 (=> (not res!924636) (not e!783904))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383043 (= res!924636 (validKeyInArray!0 (select (arr!45638 a!2938) i!1065)))))

(declare-fun b!1383044 () Bool)

(declare-fun res!924635 () Bool)

(assert (=> b!1383044 (=> (not res!924635) (not e!783904))))

(declare-datatypes ((List!32166 0))(
  ( (Nil!32163) (Cons!32162 (h!33371 (_ BitVec 64)) (t!46860 List!32166)) )
))
(declare-fun arrayNoDuplicates!0 (array!94521 (_ BitVec 32) List!32166) Bool)

(assert (=> b!1383044 (= res!924635 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32163))))

(declare-fun b!1383045 () Bool)

(assert (=> b!1383045 (= e!783904 false)))

(declare-fun lt!608517 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94521 (_ BitVec 32)) Bool)

(assert (=> b!1383045 (= lt!608517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383042 () Bool)

(declare-fun res!924637 () Bool)

(assert (=> b!1383042 (=> (not res!924637) (not e!783904))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383042 (= res!924637 (and (= (size!46188 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46188 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46188 a!2938))))))

(assert (= (and start!118218 res!924634) b!1383042))

(assert (= (and b!1383042 res!924637) b!1383043))

(assert (= (and b!1383043 res!924636) b!1383044))

(assert (= (and b!1383044 res!924635) b!1383045))

(declare-fun m!1268145 () Bool)

(assert (=> start!118218 m!1268145))

(declare-fun m!1268147 () Bool)

(assert (=> start!118218 m!1268147))

(declare-fun m!1268149 () Bool)

(assert (=> b!1383043 m!1268149))

(assert (=> b!1383043 m!1268149))

(declare-fun m!1268151 () Bool)

(assert (=> b!1383043 m!1268151))

(declare-fun m!1268153 () Bool)

(assert (=> b!1383044 m!1268153))

(declare-fun m!1268155 () Bool)

(assert (=> b!1383045 m!1268155))

(push 1)

(assert (not start!118218))

(assert (not b!1383044))

(assert (not b!1383043))

(assert (not b!1383045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

