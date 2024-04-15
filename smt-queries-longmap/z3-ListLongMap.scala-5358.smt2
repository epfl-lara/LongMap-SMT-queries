; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71726 () Bool)

(assert start!71726)

(declare-fun res!566962 () Bool)

(declare-fun e!465172 () Bool)

(assert (=> start!71726 (=> (not res!566962) (not e!465172))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46625 0))(
  ( (array!46626 (arr!22347 (Array (_ BitVec 32) (_ BitVec 64))) (size!22768 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46625)

(assert (=> start!71726 (= res!566962 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22768 a!4227))))))

(assert (=> start!71726 e!465172))

(assert (=> start!71726 true))

(declare-fun array_inv!17859 (array!46625) Bool)

(assert (=> start!71726 (array_inv!17859 a!4227)))

(declare-fun b!833791 () Bool)

(declare-fun res!566961 () Bool)

(assert (=> b!833791 (=> (not res!566961) (not e!465172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833791 (= res!566961 (not (validKeyInArray!0 (select (arr!22347 a!4227) i!1466))))))

(declare-fun b!833792 () Bool)

(declare-fun res!566960 () Bool)

(assert (=> b!833792 (=> (not res!566960) (not e!465172))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!833792 (= res!566960 (validKeyInArray!0 k0!2968))))

(declare-fun b!833793 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!833793 (= e!465172 (and (bvslt (size!22768 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22768 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71726 res!566962) b!833791))

(assert (= (and b!833791 res!566961) b!833792))

(assert (= (and b!833792 res!566960) b!833793))

(declare-fun m!778215 () Bool)

(assert (=> start!71726 m!778215))

(declare-fun m!778217 () Bool)

(assert (=> b!833791 m!778217))

(assert (=> b!833791 m!778217))

(declare-fun m!778219 () Bool)

(assert (=> b!833791 m!778219))

(declare-fun m!778221 () Bool)

(assert (=> b!833792 m!778221))

(check-sat (not b!833792) (not b!833791) (not start!71726))
(check-sat)
