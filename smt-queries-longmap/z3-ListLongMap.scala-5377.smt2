; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71840 () Bool)

(assert start!71840)

(declare-fun res!567882 () Bool)

(declare-fun e!465776 () Bool)

(assert (=> start!71840 (=> (not res!567882) (not e!465776))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46739 0))(
  ( (array!46740 (arr!22404 (Array (_ BitVec 32) (_ BitVec 64))) (size!22825 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46739)

(assert (=> start!71840 (= res!567882 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22825 a!4227))))))

(assert (=> start!71840 e!465776))

(assert (=> start!71840 true))

(declare-fun array_inv!17916 (array!46739) Bool)

(assert (=> start!71840 (array_inv!17916 a!4227)))

(declare-fun b!834875 () Bool)

(declare-fun res!567883 () Bool)

(assert (=> b!834875 (=> (not res!567883) (not e!465776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834875 (= res!567883 (not (validKeyInArray!0 (select (arr!22404 a!4227) i!1466))))))

(declare-fun b!834876 () Bool)

(declare-fun res!567886 () Bool)

(assert (=> b!834876 (=> (not res!567886) (not e!465776))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834876 (= res!567886 (= (arrayCountValidKeys!0 (array!46740 (store (arr!22404 a!4227) i!1466 k0!2968) (size!22825 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!834877 () Bool)

(declare-fun res!567884 () Bool)

(assert (=> b!834877 (=> (not res!567884) (not e!465776))))

(assert (=> b!834877 (= res!567884 (validKeyInArray!0 k0!2968))))

(declare-fun b!834878 () Bool)

(declare-fun res!567885 () Bool)

(assert (=> b!834878 (=> (not res!567885) (not e!465776))))

(assert (=> b!834878 (= res!567885 (and (bvslt (size!22825 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22825 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834879 () Bool)

(assert (=> b!834879 (= e!465776 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!22825 a!4227)) to!390) #b00000000000000000000000000000000))))

(assert (= (and start!71840 res!567882) b!834875))

(assert (= (and b!834875 res!567883) b!834877))

(assert (= (and b!834877 res!567884) b!834878))

(assert (= (and b!834878 res!567885) b!834876))

(assert (= (and b!834876 res!567886) b!834879))

(declare-fun m!779533 () Bool)

(assert (=> start!71840 m!779533))

(declare-fun m!779535 () Bool)

(assert (=> b!834875 m!779535))

(assert (=> b!834875 m!779535))

(declare-fun m!779537 () Bool)

(assert (=> b!834875 m!779537))

(declare-fun m!779539 () Bool)

(assert (=> b!834876 m!779539))

(declare-fun m!779541 () Bool)

(assert (=> b!834876 m!779541))

(declare-fun m!779543 () Bool)

(assert (=> b!834876 m!779543))

(declare-fun m!779545 () Bool)

(assert (=> b!834877 m!779545))

(check-sat (not b!834877) (not b!834876) (not b!834875) (not start!71840))
(check-sat)
