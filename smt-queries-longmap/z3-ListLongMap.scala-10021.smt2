; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118232 () Bool)

(assert start!118232)

(declare-fun b!1383128 () Bool)

(declare-fun res!924719 () Bool)

(declare-fun e!783946 () Bool)

(assert (=> b!1383128 (=> (not res!924719) (not e!783946))))

(declare-datatypes ((array!94535 0))(
  ( (array!94536 (arr!45645 (Array (_ BitVec 32) (_ BitVec 64))) (size!46195 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94535)

(declare-datatypes ((List!32173 0))(
  ( (Nil!32170) (Cons!32169 (h!33378 (_ BitVec 64)) (t!46867 List!32173)) )
))
(declare-fun arrayNoDuplicates!0 (array!94535 (_ BitVec 32) List!32173) Bool)

(assert (=> b!1383128 (= res!924719 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32170))))

(declare-fun b!1383129 () Bool)

(assert (=> b!1383129 (= e!783946 false)))

(declare-fun lt!608538 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94535 (_ BitVec 32)) Bool)

(assert (=> b!1383129 (= lt!608538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383126 () Bool)

(declare-fun res!924718 () Bool)

(assert (=> b!1383126 (=> (not res!924718) (not e!783946))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383126 (= res!924718 (and (= (size!46195 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46195 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46195 a!2938))))))

(declare-fun b!1383127 () Bool)

(declare-fun res!924721 () Bool)

(assert (=> b!1383127 (=> (not res!924721) (not e!783946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383127 (= res!924721 (validKeyInArray!0 (select (arr!45645 a!2938) i!1065)))))

(declare-fun res!924720 () Bool)

(assert (=> start!118232 (=> (not res!924720) (not e!783946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118232 (= res!924720 (validMask!0 mask!2987))))

(assert (=> start!118232 e!783946))

(assert (=> start!118232 true))

(declare-fun array_inv!34673 (array!94535) Bool)

(assert (=> start!118232 (array_inv!34673 a!2938)))

(assert (= (and start!118232 res!924720) b!1383126))

(assert (= (and b!1383126 res!924718) b!1383127))

(assert (= (and b!1383127 res!924721) b!1383128))

(assert (= (and b!1383128 res!924719) b!1383129))

(declare-fun m!1268229 () Bool)

(assert (=> b!1383128 m!1268229))

(declare-fun m!1268231 () Bool)

(assert (=> b!1383129 m!1268231))

(declare-fun m!1268233 () Bool)

(assert (=> b!1383127 m!1268233))

(assert (=> b!1383127 m!1268233))

(declare-fun m!1268235 () Bool)

(assert (=> b!1383127 m!1268235))

(declare-fun m!1268237 () Bool)

(assert (=> start!118232 m!1268237))

(declare-fun m!1268239 () Bool)

(assert (=> start!118232 m!1268239))

(check-sat (not start!118232) (not b!1383128) (not b!1383129) (not b!1383127))
