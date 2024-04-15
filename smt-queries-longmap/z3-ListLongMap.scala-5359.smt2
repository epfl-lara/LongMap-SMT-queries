; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71732 () Bool)

(assert start!71732)

(declare-fun res!566989 () Bool)

(declare-fun e!465190 () Bool)

(assert (=> start!71732 (=> (not res!566989) (not e!465190))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46631 0))(
  ( (array!46632 (arr!22350 (Array (_ BitVec 32) (_ BitVec 64))) (size!22771 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46631)

(assert (=> start!71732 (= res!566989 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22771 a!4227))))))

(assert (=> start!71732 e!465190))

(assert (=> start!71732 true))

(declare-fun array_inv!17862 (array!46631) Bool)

(assert (=> start!71732 (array_inv!17862 a!4227)))

(declare-fun b!833818 () Bool)

(declare-fun res!566988 () Bool)

(assert (=> b!833818 (=> (not res!566988) (not e!465190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833818 (= res!566988 (not (validKeyInArray!0 (select (arr!22350 a!4227) i!1466))))))

(declare-fun b!833819 () Bool)

(declare-fun res!566987 () Bool)

(assert (=> b!833819 (=> (not res!566987) (not e!465190))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!833819 (= res!566987 (validKeyInArray!0 k0!2968))))

(declare-fun b!833820 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!833820 (= e!465190 (and (bvslt (size!22771 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22771 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71732 res!566989) b!833818))

(assert (= (and b!833818 res!566988) b!833819))

(assert (= (and b!833819 res!566987) b!833820))

(declare-fun m!778239 () Bool)

(assert (=> start!71732 m!778239))

(declare-fun m!778241 () Bool)

(assert (=> b!833818 m!778241))

(assert (=> b!833818 m!778241))

(declare-fun m!778243 () Bool)

(assert (=> b!833818 m!778243))

(declare-fun m!778245 () Bool)

(assert (=> b!833819 m!778245))

(check-sat (not b!833819) (not b!833818) (not start!71732))
(check-sat)
