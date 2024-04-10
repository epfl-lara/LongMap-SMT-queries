; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118530 () Bool)

(assert start!118530)

(declare-fun b!1385796 () Bool)

(declare-fun res!927049 () Bool)

(declare-fun e!785156 () Bool)

(assert (=> b!1385796 (=> (not res!927049) (not e!785156))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94806 0))(
  ( (array!94807 (arr!45779 (Array (_ BitVec 32) (_ BitVec 64))) (size!46329 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94806)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385796 (= res!927049 (and (= (size!46329 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46329 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46329 a!2938))))))

(declare-fun res!927047 () Bool)

(assert (=> start!118530 (=> (not res!927047) (not e!785156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118530 (= res!927047 (validMask!0 mask!2987))))

(assert (=> start!118530 e!785156))

(assert (=> start!118530 true))

(declare-fun array_inv!34807 (array!94806) Bool)

(assert (=> start!118530 (array_inv!34807 a!2938)))

(declare-fun b!1385799 () Bool)

(assert (=> b!1385799 (= e!785156 false)))

(declare-fun lt!609318 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94806 (_ BitVec 32)) Bool)

(assert (=> b!1385799 (= lt!609318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385798 () Bool)

(declare-fun res!927046 () Bool)

(assert (=> b!1385798 (=> (not res!927046) (not e!785156))))

(declare-datatypes ((List!32307 0))(
  ( (Nil!32304) (Cons!32303 (h!33512 (_ BitVec 64)) (t!47001 List!32307)) )
))
(declare-fun arrayNoDuplicates!0 (array!94806 (_ BitVec 32) List!32307) Bool)

(assert (=> b!1385798 (= res!927046 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32304))))

(declare-fun b!1385797 () Bool)

(declare-fun res!927048 () Bool)

(assert (=> b!1385797 (=> (not res!927048) (not e!785156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385797 (= res!927048 (validKeyInArray!0 (select (arr!45779 a!2938) i!1065)))))

(assert (= (and start!118530 res!927047) b!1385796))

(assert (= (and b!1385796 res!927049) b!1385797))

(assert (= (and b!1385797 res!927048) b!1385798))

(assert (= (and b!1385798 res!927046) b!1385799))

(declare-fun m!1271073 () Bool)

(assert (=> start!118530 m!1271073))

(declare-fun m!1271075 () Bool)

(assert (=> start!118530 m!1271075))

(declare-fun m!1271077 () Bool)

(assert (=> b!1385799 m!1271077))

(declare-fun m!1271079 () Bool)

(assert (=> b!1385798 m!1271079))

(declare-fun m!1271081 () Bool)

(assert (=> b!1385797 m!1271081))

(assert (=> b!1385797 m!1271081))

(declare-fun m!1271083 () Bool)

(assert (=> b!1385797 m!1271083))

(push 1)

(assert (not b!1385797))

(assert (not start!118530))

(assert (not b!1385798))

(assert (not b!1385799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

