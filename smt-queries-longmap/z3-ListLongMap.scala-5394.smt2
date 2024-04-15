; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71942 () Bool)

(assert start!71942)

(declare-fun b!835930 () Bool)

(declare-fun e!466319 () Bool)

(declare-fun e!466317 () Bool)

(assert (=> b!835930 (= e!466319 e!466317)))

(declare-fun res!568795 () Bool)

(assert (=> b!835930 (=> (not res!568795) (not e!466317))))

(declare-datatypes ((array!46841 0))(
  ( (array!46842 (arr!22455 (Array (_ BitVec 32) (_ BitVec 64))) (size!22876 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46841)

(declare-fun lt!380144 () array!46841)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46841 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835930 (= res!568795 (= (arrayCountValidKeys!0 lt!380144 (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835930 (= lt!380144 (array!46842 (store (arr!22455 a!4227) i!1466 k0!2968) (size!22876 a!4227)))))

(declare-fun res!568798 () Bool)

(assert (=> start!71942 (=> (not res!568798) (not e!466319))))

(assert (=> start!71942 (= res!568798 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22876 a!4227))))))

(assert (=> start!71942 e!466319))

(assert (=> start!71942 true))

(declare-fun array_inv!17967 (array!46841) Bool)

(assert (=> start!71942 (array_inv!17967 a!4227)))

(declare-fun b!835931 () Bool)

(assert (=> b!835931 (= e!466317 (not (= (arrayCountValidKeys!0 lt!380144 (bvadd #b00000000000000000000000000000001 i!1466) (size!22876 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22876 a!4227)))))))

(declare-fun b!835932 () Bool)

(declare-fun res!568793 () Bool)

(assert (=> b!835932 (=> (not res!568793) (not e!466319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835932 (= res!568793 (validKeyInArray!0 k0!2968))))

(declare-fun b!835933 () Bool)

(declare-fun res!568794 () Bool)

(assert (=> b!835933 (=> (not res!568794) (not e!466319))))

(assert (=> b!835933 (= res!568794 (not (validKeyInArray!0 (select (arr!22455 a!4227) i!1466))))))

(declare-fun b!835934 () Bool)

(declare-fun res!568797 () Bool)

(assert (=> b!835934 (=> (not res!568797) (not e!466317))))

(assert (=> b!835934 (= res!568797 (= to!390 (size!22876 a!4227)))))

(declare-fun b!835935 () Bool)

(declare-fun res!568796 () Bool)

(assert (=> b!835935 (=> (not res!568796) (not e!466319))))

(assert (=> b!835935 (= res!568796 (and (bvslt (size!22876 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22876 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71942 res!568798) b!835933))

(assert (= (and b!835933 res!568794) b!835932))

(assert (= (and b!835932 res!568793) b!835935))

(assert (= (and b!835935 res!568796) b!835930))

(assert (= (and b!835930 res!568795) b!835934))

(assert (= (and b!835934 res!568797) b!835931))

(declare-fun m!780815 () Bool)

(assert (=> b!835931 m!780815))

(declare-fun m!780817 () Bool)

(assert (=> b!835931 m!780817))

(declare-fun m!780819 () Bool)

(assert (=> b!835932 m!780819))

(declare-fun m!780821 () Bool)

(assert (=> b!835930 m!780821))

(declare-fun m!780823 () Bool)

(assert (=> b!835930 m!780823))

(declare-fun m!780825 () Bool)

(assert (=> b!835930 m!780825))

(declare-fun m!780827 () Bool)

(assert (=> start!71942 m!780827))

(declare-fun m!780829 () Bool)

(assert (=> b!835933 m!780829))

(assert (=> b!835933 m!780829))

(declare-fun m!780831 () Bool)

(assert (=> b!835933 m!780831))

(check-sat (not b!835930) (not b!835933) (not b!835931) (not start!71942) (not b!835932))
(check-sat)
