; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116738 () Bool)

(assert start!116738)

(declare-fun b!1375608 () Bool)

(declare-fun res!918012 () Bool)

(declare-fun e!779401 () Bool)

(assert (=> b!1375608 (=> (not res!918012) (not e!779401))))

(declare-datatypes ((array!93329 0))(
  ( (array!93330 (arr!45066 (Array (_ BitVec 32) (_ BitVec 64))) (size!45617 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93329)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375608 (= res!918012 (validKeyInArray!0 (select (arr!45066 a!4142) i!1457)))))

(declare-fun b!1375609 () Bool)

(declare-fun e!779400 () Bool)

(assert (=> b!1375609 (= e!779401 (not e!779400))))

(declare-fun res!918014 () Bool)

(assert (=> b!1375609 (=> res!918014 e!779400)))

(assert (=> b!1375609 (= res!918014 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603885 () array!93329)

(declare-fun arrayCountValidKeys!0 (array!93329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375609 (= (arrayCountValidKeys!0 lt!603885 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375609 (= lt!603885 (array!93330 (store (arr!45066 a!4142) i!1457 k!2959) (size!45617 a!4142)))))

(declare-datatypes ((Unit!45366 0))(
  ( (Unit!45367) )
))
(declare-fun lt!603887 () Unit!45366)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45366)

(assert (=> b!1375609 (= lt!603887 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918015 () Bool)

(assert (=> start!116738 (=> (not res!918015) (not e!779401))))

(assert (=> start!116738 (= res!918015 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45617 a!4142))))))

(assert (=> start!116738 e!779401))

(assert (=> start!116738 true))

(declare-fun array_inv!34347 (array!93329) Bool)

(assert (=> start!116738 (array_inv!34347 a!4142)))

(declare-fun b!1375610 () Bool)

(assert (=> b!1375610 (= e!779400 true)))

(declare-fun lt!603888 () (_ BitVec 32))

(assert (=> b!1375610 (= lt!603888 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603886 () (_ BitVec 32))

(assert (=> b!1375610 (= lt!603886 (arrayCountValidKeys!0 lt!603885 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375611 () Bool)

(declare-fun res!918011 () Bool)

(assert (=> b!1375611 (=> (not res!918011) (not e!779401))))

(assert (=> b!1375611 (= res!918011 (bvslt (size!45617 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375612 () Bool)

(declare-fun res!918013 () Bool)

(assert (=> b!1375612 (=> (not res!918013) (not e!779401))))

(assert (=> b!1375612 (= res!918013 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116738 res!918015) b!1375608))

(assert (= (and b!1375608 res!918012) b!1375612))

(assert (= (and b!1375612 res!918013) b!1375611))

(assert (= (and b!1375611 res!918011) b!1375609))

(assert (= (and b!1375609 (not res!918014)) b!1375610))

(declare-fun m!1259189 () Bool)

(assert (=> b!1375612 m!1259189))

(declare-fun m!1259191 () Bool)

(assert (=> start!116738 m!1259191))

(declare-fun m!1259193 () Bool)

(assert (=> b!1375610 m!1259193))

(declare-fun m!1259195 () Bool)

(assert (=> b!1375610 m!1259195))

(declare-fun m!1259197 () Bool)

(assert (=> b!1375609 m!1259197))

(declare-fun m!1259199 () Bool)

(assert (=> b!1375609 m!1259199))

(declare-fun m!1259201 () Bool)

(assert (=> b!1375609 m!1259201))

(declare-fun m!1259203 () Bool)

(assert (=> b!1375609 m!1259203))

(declare-fun m!1259205 () Bool)

(assert (=> b!1375608 m!1259205))

(assert (=> b!1375608 m!1259205))

(declare-fun m!1259207 () Bool)

(assert (=> b!1375608 m!1259207))

(push 1)

(assert (not b!1375609))

(assert (not start!116738))

(assert (not b!1375608))

(assert (not b!1375612))

(assert (not b!1375610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

