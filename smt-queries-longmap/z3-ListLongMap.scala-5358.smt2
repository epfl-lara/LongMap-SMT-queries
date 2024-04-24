; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71912 () Bool)

(assert start!71912)

(declare-fun res!567412 () Bool)

(declare-fun e!465900 () Bool)

(assert (=> start!71912 (=> (not res!567412) (not e!465900))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46659 0))(
  ( (array!46660 (arr!22359 (Array (_ BitVec 32) (_ BitVec 64))) (size!22779 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46659)

(assert (=> start!71912 (= res!567412 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22779 a!4227))))))

(assert (=> start!71912 e!465900))

(assert (=> start!71912 true))

(declare-fun array_inv!17845 (array!46659) Bool)

(assert (=> start!71912 (array_inv!17845 a!4227)))

(declare-fun b!834931 () Bool)

(declare-fun res!567414 () Bool)

(assert (=> b!834931 (=> (not res!567414) (not e!465900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834931 (= res!567414 (not (validKeyInArray!0 (select (arr!22359 a!4227) i!1466))))))

(declare-fun b!834932 () Bool)

(declare-fun res!567413 () Bool)

(assert (=> b!834932 (=> (not res!567413) (not e!465900))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834932 (= res!567413 (validKeyInArray!0 k0!2968))))

(declare-fun b!834933 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834933 (= e!465900 (and (bvslt (size!22779 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22779 a!4227)) (bvsgt to!390 i!1466) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (= (and start!71912 res!567412) b!834931))

(assert (= (and b!834931 res!567414) b!834932))

(assert (= (and b!834932 res!567413) b!834933))

(declare-fun m!780249 () Bool)

(assert (=> start!71912 m!780249))

(declare-fun m!780251 () Bool)

(assert (=> b!834931 m!780251))

(assert (=> b!834931 m!780251))

(declare-fun m!780253 () Bool)

(assert (=> b!834931 m!780253))

(declare-fun m!780255 () Bool)

(assert (=> b!834932 m!780255))

(check-sat (not b!834931) (not start!71912) (not b!834932))
(check-sat)
