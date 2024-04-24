; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135882 () Bool)

(assert start!135882)

(declare-fun res!1076308 () Bool)

(declare-fun e!879380 () Bool)

(assert (=> start!135882 (=> (not res!1076308) (not e!879380))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135882 (= res!1076308 (validMask!0 mask!877))))

(assert (=> start!135882 e!879380))

(assert (=> start!135882 true))

(declare-datatypes ((array!105320 0))(
  ( (array!105321 (arr!50803 (Array (_ BitVec 32) (_ BitVec 64))) (size!51354 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105320)

(declare-fun array_inv!39758 (array!105320) Bool)

(assert (=> start!135882 (array_inv!39758 _keys!591)))

(declare-fun b!1576591 () Bool)

(declare-fun res!1076309 () Bool)

(assert (=> b!1576591 (=> (not res!1076309) (not e!879380))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576591 (= res!1076309 (and (= (size!51354 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51354 _keys!591)) (bvslt i!537 (size!51354 _keys!591))))))

(declare-fun b!1576592 () Bool)

(declare-fun res!1076307 () Bool)

(assert (=> b!1576592 (=> (not res!1076307) (not e!879380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576592 (= res!1076307 (not (validKeyInArray!0 (select (arr!50803 _keys!591) i!537))))))

(declare-fun b!1576593 () Bool)

(assert (=> b!1576593 (= e!879380 (bvslt (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135882 res!1076308) b!1576591))

(assert (= (and b!1576591 res!1076309) b!1576592))

(assert (= (and b!1576592 res!1076307) b!1576593))

(declare-fun m!1449675 () Bool)

(assert (=> start!135882 m!1449675))

(declare-fun m!1449677 () Bool)

(assert (=> start!135882 m!1449677))

(declare-fun m!1449679 () Bool)

(assert (=> b!1576592 m!1449679))

(assert (=> b!1576592 m!1449679))

(declare-fun m!1449681 () Bool)

(assert (=> b!1576592 m!1449681))

(check-sat (not b!1576592) (not start!135882))
(check-sat)
