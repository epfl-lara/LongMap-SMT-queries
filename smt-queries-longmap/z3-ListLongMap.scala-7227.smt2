; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92658 () Bool)

(assert start!92658)

(declare-datatypes ((array!66274 0))(
  ( (array!66275 (arr!31870 (Array (_ BitVec 32) (_ BitVec 64))) (size!32407 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66274)

(declare-fun e!597231 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun b!1052150 () Bool)

(declare-fun arrayContainsKey!0 (array!66274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052150 (= e!597231 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052151 () Bool)

(declare-fun e!597230 () Bool)

(declare-fun e!597228 () Bool)

(assert (=> b!1052151 (= e!597230 e!597228)))

(declare-fun res!700473 () Bool)

(assert (=> b!1052151 (=> (not res!700473) (not e!597228))))

(declare-fun lt!464603 () array!66274)

(assert (=> b!1052151 (= res!700473 (arrayContainsKey!0 lt!464603 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052151 (= lt!464603 (array!66275 (store (arr!31870 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32407 a!3488)))))

(declare-fun b!1052152 () Bool)

(declare-fun res!700477 () Bool)

(assert (=> b!1052152 (=> (not res!700477) (not e!597230))))

(declare-datatypes ((List!22152 0))(
  ( (Nil!22149) (Cons!22148 (h!23366 (_ BitVec 64)) (t!31451 List!22152)) )
))
(declare-fun arrayNoDuplicates!0 (array!66274 (_ BitVec 32) List!22152) Bool)

(assert (=> b!1052152 (= res!700477 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22149))))

(declare-fun b!1052153 () Bool)

(declare-fun e!597232 () Bool)

(assert (=> b!1052153 (= e!597228 e!597232)))

(declare-fun res!700474 () Bool)

(assert (=> b!1052153 (=> (not res!700474) (not e!597232))))

(declare-fun lt!464602 () (_ BitVec 32))

(assert (=> b!1052153 (= res!700474 (not (= lt!464602 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66274 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052153 (= lt!464602 (arrayScanForKey!0 lt!464603 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700478 () Bool)

(assert (=> start!92658 (=> (not res!700478) (not e!597230))))

(assert (=> start!92658 (= res!700478 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32407 a!3488)) (bvslt (size!32407 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92658 e!597230))

(assert (=> start!92658 true))

(declare-fun array_inv!24652 (array!66274) Bool)

(assert (=> start!92658 (array_inv!24652 a!3488)))

(declare-fun b!1052154 () Bool)

(declare-fun e!597227 () Bool)

(assert (=> b!1052154 (= e!597227 e!597231)))

(declare-fun res!700472 () Bool)

(assert (=> b!1052154 (=> res!700472 e!597231)))

(assert (=> b!1052154 (= res!700472 (or (bvsgt lt!464602 i!1381) (bvsle i!1381 lt!464602)))))

(declare-fun b!1052155 () Bool)

(declare-fun res!700475 () Bool)

(assert (=> b!1052155 (=> (not res!700475) (not e!597230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052155 (= res!700475 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052156 () Bool)

(assert (=> b!1052156 (= e!597232 (not true))))

(assert (=> b!1052156 e!597227))

(declare-fun res!700476 () Bool)

(assert (=> b!1052156 (=> (not res!700476) (not e!597227))))

(assert (=> b!1052156 (= res!700476 (= (select (store (arr!31870 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464602) k0!2747))))

(declare-fun b!1052157 () Bool)

(declare-fun res!700471 () Bool)

(assert (=> b!1052157 (=> (not res!700471) (not e!597230))))

(assert (=> b!1052157 (= res!700471 (= (select (arr!31870 a!3488) i!1381) k0!2747))))

(assert (= (and start!92658 res!700478) b!1052152))

(assert (= (and b!1052152 res!700477) b!1052155))

(assert (= (and b!1052155 res!700475) b!1052157))

(assert (= (and b!1052157 res!700471) b!1052151))

(assert (= (and b!1052151 res!700473) b!1052153))

(assert (= (and b!1052153 res!700474) b!1052156))

(assert (= (and b!1052156 res!700476) b!1052154))

(assert (= (and b!1052154 (not res!700472)) b!1052150))

(declare-fun m!973133 () Bool)

(assert (=> b!1052151 m!973133))

(declare-fun m!973135 () Bool)

(assert (=> b!1052151 m!973135))

(declare-fun m!973137 () Bool)

(assert (=> b!1052152 m!973137))

(declare-fun m!973139 () Bool)

(assert (=> b!1052150 m!973139))

(assert (=> b!1052156 m!973135))

(declare-fun m!973141 () Bool)

(assert (=> b!1052156 m!973141))

(declare-fun m!973143 () Bool)

(assert (=> b!1052153 m!973143))

(declare-fun m!973145 () Bool)

(assert (=> start!92658 m!973145))

(declare-fun m!973147 () Bool)

(assert (=> b!1052155 m!973147))

(declare-fun m!973149 () Bool)

(assert (=> b!1052157 m!973149))

(check-sat (not b!1052155) (not b!1052153) (not b!1052150) (not b!1052151) (not start!92658) (not b!1052152))
(check-sat)
