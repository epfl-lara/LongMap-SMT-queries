; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71744 () Bool)

(assert start!71744)

(declare-fun b!833887 () Bool)

(declare-fun res!567056 () Bool)

(declare-fun e!465230 () Bool)

(assert (=> b!833887 (=> (not res!567056) (not e!465230))))

(declare-datatypes ((array!46643 0))(
  ( (array!46644 (arr!22356 (Array (_ BitVec 32) (_ BitVec 64))) (size!22777 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46643)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833887 (= res!567056 (validKeyInArray!0 (select (arr!22356 a!4227) to!390)))))

(declare-fun b!833888 () Bool)

(declare-fun res!567057 () Bool)

(declare-fun e!465229 () Bool)

(assert (=> b!833888 (=> (not res!567057) (not e!465229))))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!833888 (= res!567057 (and (bvslt (size!22777 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22777 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567061 () Bool)

(assert (=> start!71744 (=> (not res!567061) (not e!465229))))

(assert (=> start!71744 (= res!567061 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22777 a!4227))))))

(assert (=> start!71744 e!465229))

(assert (=> start!71744 true))

(declare-fun array_inv!17868 (array!46643) Bool)

(assert (=> start!71744 (array_inv!17868 a!4227)))

(declare-fun b!833889 () Bool)

(declare-fun res!567060 () Bool)

(assert (=> b!833889 (=> (not res!567060) (not e!465229))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!833889 (= res!567060 (validKeyInArray!0 k0!2968))))

(declare-fun b!833890 () Bool)

(declare-fun res!567058 () Bool)

(assert (=> b!833890 (=> (not res!567058) (not e!465229))))

(assert (=> b!833890 (= res!567058 (not (validKeyInArray!0 (select (arr!22356 a!4227) i!1466))))))

(declare-fun b!833891 () Bool)

(assert (=> b!833891 (= e!465230 (not true))))

(declare-fun lt!378548 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!833891 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!378548))))

(declare-datatypes ((Unit!28589 0))(
  ( (Unit!28590) )
))
(declare-fun lt!378546 () Unit!28589)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46643 (_ BitVec 32) (_ BitVec 32)) Unit!28589)

(assert (=> b!833891 (= lt!378546 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!833892 () Bool)

(assert (=> b!833892 (= e!465229 e!465230)))

(declare-fun res!567059 () Bool)

(assert (=> b!833892 (=> (not res!567059) (not e!465230))))

(declare-fun lt!378547 () (_ BitVec 32))

(assert (=> b!833892 (= res!567059 (and (= lt!378547 lt!378548) (not (= to!390 (size!22777 a!4227)))))))

(assert (=> b!833892 (= lt!378548 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!833892 (= lt!378547 (arrayCountValidKeys!0 (array!46644 (store (arr!22356 a!4227) i!1466 k0!2968) (size!22777 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71744 res!567061) b!833890))

(assert (= (and b!833890 res!567058) b!833889))

(assert (= (and b!833889 res!567060) b!833888))

(assert (= (and b!833888 res!567057) b!833892))

(assert (= (and b!833892 res!567059) b!833887))

(assert (= (and b!833887 res!567056) b!833891))

(declare-fun m!778305 () Bool)

(assert (=> b!833890 m!778305))

(assert (=> b!833890 m!778305))

(declare-fun m!778307 () Bool)

(assert (=> b!833890 m!778307))

(declare-fun m!778309 () Bool)

(assert (=> start!71744 m!778309))

(declare-fun m!778311 () Bool)

(assert (=> b!833891 m!778311))

(declare-fun m!778313 () Bool)

(assert (=> b!833891 m!778313))

(declare-fun m!778315 () Bool)

(assert (=> b!833889 m!778315))

(declare-fun m!778317 () Bool)

(assert (=> b!833892 m!778317))

(declare-fun m!778319 () Bool)

(assert (=> b!833892 m!778319))

(declare-fun m!778321 () Bool)

(assert (=> b!833892 m!778321))

(declare-fun m!778323 () Bool)

(assert (=> b!833887 m!778323))

(assert (=> b!833887 m!778323))

(declare-fun m!778325 () Bool)

(assert (=> b!833887 m!778325))

(check-sat (not b!833889) (not b!833892) (not b!833891) (not b!833890) (not b!833887) (not start!71744))
(check-sat)
