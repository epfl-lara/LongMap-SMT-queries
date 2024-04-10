; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71754 () Bool)

(assert start!71754)

(declare-fun res!567103 () Bool)

(declare-fun e!465345 () Bool)

(assert (=> start!71754 (=> (not res!567103) (not e!465345))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46664 0))(
  ( (array!46665 (arr!22366 (Array (_ BitVec 32) (_ BitVec 64))) (size!22787 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46664)

(assert (=> start!71754 (= res!567103 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22787 a!4227))))))

(assert (=> start!71754 e!465345))

(assert (=> start!71754 true))

(declare-fun array_inv!17813 (array!46664) Bool)

(assert (=> start!71754 (array_inv!17813 a!4227)))

(declare-fun b!834069 () Bool)

(declare-fun res!567102 () Bool)

(assert (=> b!834069 (=> (not res!567102) (not e!465345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834069 (= res!567102 (not (validKeyInArray!0 (select (arr!22366 a!4227) i!1466))))))

(declare-fun b!834070 () Bool)

(declare-fun res!567104 () Bool)

(assert (=> b!834070 (=> (not res!567104) (not e!465345))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834070 (= res!567104 (validKeyInArray!0 k0!2968))))

(declare-fun b!834071 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834071 (= e!465345 (and (bvslt (size!22787 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22787 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71754 res!567103) b!834069))

(assert (= (and b!834069 res!567102) b!834070))

(assert (= (and b!834070 res!567104) b!834071))

(declare-fun m!778995 () Bool)

(assert (=> start!71754 m!778995))

(declare-fun m!778997 () Bool)

(assert (=> b!834069 m!778997))

(assert (=> b!834069 m!778997))

(declare-fun m!778999 () Bool)

(assert (=> b!834069 m!778999))

(declare-fun m!779001 () Bool)

(assert (=> b!834070 m!779001))

(check-sat (not b!834070) (not start!71754) (not b!834069))
(check-sat)
