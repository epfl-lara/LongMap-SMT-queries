; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92434 () Bool)

(assert start!92434)

(declare-fun b!1050828 () Bool)

(declare-fun e!596406 () Bool)

(declare-fun e!596401 () Bool)

(assert (=> b!1050828 (= e!596406 e!596401)))

(declare-fun res!700041 () Bool)

(assert (=> b!1050828 (=> (not res!700041) (not e!596401))))

(declare-fun lt!463924 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050828 (= res!700041 (not (= lt!463924 i!1381)))))

(declare-datatypes ((array!66176 0))(
  ( (array!66177 (arr!31827 (Array (_ BitVec 32) (_ BitVec 64))) (size!32365 (_ BitVec 32))) )
))
(declare-fun lt!463923 () array!66176)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66176 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050828 (= lt!463924 (arrayScanForKey!0 lt!463923 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050829 () Bool)

(declare-fun e!596403 () Bool)

(assert (=> b!1050829 (= e!596403 e!596406)))

(declare-fun res!700044 () Bool)

(assert (=> b!1050829 (=> (not res!700044) (not e!596406))))

(declare-fun arrayContainsKey!0 (array!66176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050829 (= res!700044 (arrayContainsKey!0 lt!463923 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66176)

(assert (=> b!1050829 (= lt!463923 (array!66177 (store (arr!31827 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32365 a!3488)))))

(declare-fun b!1050830 () Bool)

(declare-fun res!700043 () Bool)

(assert (=> b!1050830 (=> (not res!700043) (not e!596403))))

(declare-datatypes ((List!22198 0))(
  ( (Nil!22195) (Cons!22194 (h!23403 (_ BitVec 64)) (t!31496 List!22198)) )
))
(declare-fun arrayNoDuplicates!0 (array!66176 (_ BitVec 32) List!22198) Bool)

(assert (=> b!1050830 (= res!700043 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22195))))

(declare-fun b!1050831 () Bool)

(declare-fun res!700040 () Bool)

(assert (=> b!1050831 (=> (not res!700040) (not e!596403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050831 (= res!700040 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050832 () Bool)

(declare-fun e!596404 () Bool)

(declare-fun e!596402 () Bool)

(assert (=> b!1050832 (= e!596404 e!596402)))

(declare-fun res!700038 () Bool)

(assert (=> b!1050832 (=> res!700038 e!596402)))

(assert (=> b!1050832 (= res!700038 (or (bvsgt lt!463924 i!1381) (bvsle i!1381 lt!463924)))))

(declare-fun b!1050833 () Bool)

(declare-fun res!700039 () Bool)

(assert (=> b!1050833 (=> (not res!700039) (not e!596403))))

(assert (=> b!1050833 (= res!700039 (= (select (arr!31827 a!3488) i!1381) k0!2747))))

(declare-fun b!1050834 () Bool)

(assert (=> b!1050834 (= e!596402 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050835 () Bool)

(assert (=> b!1050835 (= e!596401 (not true))))

(assert (=> b!1050835 e!596404))

(declare-fun res!700045 () Bool)

(assert (=> b!1050835 (=> (not res!700045) (not e!596404))))

(assert (=> b!1050835 (= res!700045 (= (select (store (arr!31827 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463924) k0!2747))))

(declare-fun res!700042 () Bool)

(assert (=> start!92434 (=> (not res!700042) (not e!596403))))

(assert (=> start!92434 (= res!700042 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32365 a!3488)) (bvslt (size!32365 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92434 e!596403))

(assert (=> start!92434 true))

(declare-fun array_inv!24610 (array!66176) Bool)

(assert (=> start!92434 (array_inv!24610 a!3488)))

(assert (= (and start!92434 res!700042) b!1050830))

(assert (= (and b!1050830 res!700043) b!1050831))

(assert (= (and b!1050831 res!700040) b!1050833))

(assert (= (and b!1050833 res!700039) b!1050829))

(assert (= (and b!1050829 res!700044) b!1050828))

(assert (= (and b!1050828 res!700041) b!1050835))

(assert (= (and b!1050835 res!700045) b!1050832))

(assert (= (and b!1050832 (not res!700038)) b!1050834))

(declare-fun m!970957 () Bool)

(assert (=> b!1050829 m!970957))

(declare-fun m!970959 () Bool)

(assert (=> b!1050829 m!970959))

(declare-fun m!970961 () Bool)

(assert (=> b!1050833 m!970961))

(declare-fun m!970963 () Bool)

(assert (=> b!1050831 m!970963))

(declare-fun m!970965 () Bool)

(assert (=> b!1050830 m!970965))

(assert (=> b!1050835 m!970959))

(declare-fun m!970967 () Bool)

(assert (=> b!1050835 m!970967))

(declare-fun m!970969 () Bool)

(assert (=> b!1050834 m!970969))

(declare-fun m!970971 () Bool)

(assert (=> b!1050828 m!970971))

(declare-fun m!970973 () Bool)

(assert (=> start!92434 m!970973))

(check-sat (not b!1050829) (not b!1050828) (not start!92434) (not b!1050834) (not b!1050831) (not b!1050830))
(check-sat)
