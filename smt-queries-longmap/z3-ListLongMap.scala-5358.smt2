; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71748 () Bool)

(assert start!71748)

(declare-fun res!567077 () Bool)

(declare-fun e!465327 () Bool)

(assert (=> start!71748 (=> (not res!567077) (not e!465327))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46658 0))(
  ( (array!46659 (arr!22363 (Array (_ BitVec 32) (_ BitVec 64))) (size!22784 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46658)

(assert (=> start!71748 (= res!567077 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22784 a!4227))))))

(assert (=> start!71748 e!465327))

(assert (=> start!71748 true))

(declare-fun array_inv!17810 (array!46658) Bool)

(assert (=> start!71748 (array_inv!17810 a!4227)))

(declare-fun b!834042 () Bool)

(declare-fun res!567076 () Bool)

(assert (=> b!834042 (=> (not res!567076) (not e!465327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834042 (= res!567076 (not (validKeyInArray!0 (select (arr!22363 a!4227) i!1466))))))

(declare-fun b!834043 () Bool)

(declare-fun res!567075 () Bool)

(assert (=> b!834043 (=> (not res!567075) (not e!465327))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834043 (= res!567075 (validKeyInArray!0 k0!2968))))

(declare-fun b!834044 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834044 (= e!465327 (and (bvslt (size!22784 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22784 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71748 res!567077) b!834042))

(assert (= (and b!834042 res!567076) b!834043))

(assert (= (and b!834043 res!567075) b!834044))

(declare-fun m!778971 () Bool)

(assert (=> start!71748 m!778971))

(declare-fun m!778973 () Bool)

(assert (=> b!834042 m!778973))

(assert (=> b!834042 m!778973))

(declare-fun m!778975 () Bool)

(assert (=> b!834042 m!778975))

(declare-fun m!778977 () Bool)

(assert (=> b!834043 m!778977))

(check-sat (not start!71748) (not b!834042) (not b!834043))
(check-sat)
