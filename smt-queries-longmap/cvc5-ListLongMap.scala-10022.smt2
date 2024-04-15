; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118236 () Bool)

(assert start!118236)

(declare-fun res!924743 () Bool)

(declare-fun e!783940 () Bool)

(assert (=> start!118236 (=> (not res!924743) (not e!783940))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118236 (= res!924743 (validMask!0 mask!2987))))

(assert (=> start!118236 e!783940))

(assert (=> start!118236 true))

(declare-datatypes ((array!94492 0))(
  ( (array!94493 (arr!45624 (Array (_ BitVec 32) (_ BitVec 64))) (size!46176 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94492)

(declare-fun array_inv!34857 (array!94492) Bool)

(assert (=> start!118236 (array_inv!34857 a!2938)))

(declare-fun b!1383106 () Bool)

(declare-fun res!924742 () Bool)

(assert (=> b!1383106 (=> (not res!924742) (not e!783940))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383106 (= res!924742 (validKeyInArray!0 (select (arr!45624 a!2938) i!1065)))))

(declare-fun b!1383105 () Bool)

(declare-fun res!924740 () Bool)

(assert (=> b!1383105 (=> (not res!924740) (not e!783940))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383105 (= res!924740 (and (= (size!46176 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46176 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46176 a!2938))))))

(declare-fun b!1383108 () Bool)

(assert (=> b!1383108 (= e!783940 false)))

(declare-fun lt!608366 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94492 (_ BitVec 32)) Bool)

(assert (=> b!1383108 (= lt!608366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383107 () Bool)

(declare-fun res!924741 () Bool)

(assert (=> b!1383107 (=> (not res!924741) (not e!783940))))

(declare-datatypes ((List!32230 0))(
  ( (Nil!32227) (Cons!32226 (h!33435 (_ BitVec 64)) (t!46916 List!32230)) )
))
(declare-fun arrayNoDuplicates!0 (array!94492 (_ BitVec 32) List!32230) Bool)

(assert (=> b!1383107 (= res!924741 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32227))))

(assert (= (and start!118236 res!924743) b!1383105))

(assert (= (and b!1383105 res!924740) b!1383106))

(assert (= (and b!1383106 res!924742) b!1383107))

(assert (= (and b!1383107 res!924741) b!1383108))

(declare-fun m!1267773 () Bool)

(assert (=> start!118236 m!1267773))

(declare-fun m!1267775 () Bool)

(assert (=> start!118236 m!1267775))

(declare-fun m!1267777 () Bool)

(assert (=> b!1383106 m!1267777))

(assert (=> b!1383106 m!1267777))

(declare-fun m!1267779 () Bool)

(assert (=> b!1383106 m!1267779))

(declare-fun m!1267781 () Bool)

(assert (=> b!1383108 m!1267781))

(declare-fun m!1267783 () Bool)

(assert (=> b!1383107 m!1267783))

(push 1)

(assert (not start!118236))

(assert (not b!1383107))

(assert (not b!1383106))

(assert (not b!1383108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

