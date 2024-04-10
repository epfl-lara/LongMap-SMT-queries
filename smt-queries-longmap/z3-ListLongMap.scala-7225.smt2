; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92414 () Bool)

(assert start!92414)

(declare-fun b!1050715 () Bool)

(declare-fun e!596299 () Bool)

(declare-fun e!596296 () Bool)

(assert (=> b!1050715 (= e!596299 e!596296)))

(declare-fun res!699843 () Bool)

(assert (=> b!1050715 (=> (not res!699843) (not e!596296))))

(declare-fun lt!464057 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050715 (= res!699843 (not (= lt!464057 i!1381)))))

(declare-datatypes ((array!66215 0))(
  ( (array!66216 (arr!31847 (Array (_ BitVec 32) (_ BitVec 64))) (size!32383 (_ BitVec 32))) )
))
(declare-fun lt!464058 () array!66215)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66215 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050715 (= lt!464057 (arrayScanForKey!0 lt!464058 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050716 () Bool)

(declare-fun res!699842 () Bool)

(declare-fun e!596295 () Bool)

(assert (=> b!1050716 (=> (not res!699842) (not e!596295))))

(declare-fun a!3488 () array!66215)

(assert (=> b!1050716 (= res!699842 (= (select (arr!31847 a!3488) i!1381) k0!2747))))

(declare-fun b!1050717 () Bool)

(assert (=> b!1050717 (= e!596296 (not true))))

(declare-fun e!596298 () Bool)

(assert (=> b!1050717 e!596298))

(declare-fun res!699845 () Bool)

(assert (=> b!1050717 (=> (not res!699845) (not e!596298))))

(assert (=> b!1050717 (= res!699845 (= (select (store (arr!31847 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464057) k0!2747))))

(declare-fun e!596297 () Bool)

(declare-fun b!1050718 () Bool)

(declare-fun arrayContainsKey!0 (array!66215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050718 (= e!596297 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050720 () Bool)

(assert (=> b!1050720 (= e!596295 e!596299)))

(declare-fun res!699841 () Bool)

(assert (=> b!1050720 (=> (not res!699841) (not e!596299))))

(assert (=> b!1050720 (= res!699841 (arrayContainsKey!0 lt!464058 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050720 (= lt!464058 (array!66216 (store (arr!31847 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32383 a!3488)))))

(declare-fun b!1050721 () Bool)

(declare-fun res!699847 () Bool)

(assert (=> b!1050721 (=> (not res!699847) (not e!596295))))

(declare-datatypes ((List!22159 0))(
  ( (Nil!22156) (Cons!22155 (h!23364 (_ BitVec 64)) (t!31466 List!22159)) )
))
(declare-fun arrayNoDuplicates!0 (array!66215 (_ BitVec 32) List!22159) Bool)

(assert (=> b!1050721 (= res!699847 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22156))))

(declare-fun b!1050722 () Bool)

(assert (=> b!1050722 (= e!596298 e!596297)))

(declare-fun res!699848 () Bool)

(assert (=> b!1050722 (=> res!699848 e!596297)))

(assert (=> b!1050722 (= res!699848 (or (bvsgt lt!464057 i!1381) (bvsle i!1381 lt!464057)))))

(declare-fun res!699846 () Bool)

(assert (=> start!92414 (=> (not res!699846) (not e!596295))))

(assert (=> start!92414 (= res!699846 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32383 a!3488)) (bvslt (size!32383 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92414 e!596295))

(assert (=> start!92414 true))

(declare-fun array_inv!24627 (array!66215) Bool)

(assert (=> start!92414 (array_inv!24627 a!3488)))

(declare-fun b!1050719 () Bool)

(declare-fun res!699844 () Bool)

(assert (=> b!1050719 (=> (not res!699844) (not e!596295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050719 (= res!699844 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92414 res!699846) b!1050721))

(assert (= (and b!1050721 res!699847) b!1050719))

(assert (= (and b!1050719 res!699844) b!1050716))

(assert (= (and b!1050716 res!699842) b!1050720))

(assert (= (and b!1050720 res!699841) b!1050715))

(assert (= (and b!1050715 res!699843) b!1050717))

(assert (= (and b!1050717 res!699845) b!1050722))

(assert (= (and b!1050722 (not res!699848)) b!1050718))

(declare-fun m!971375 () Bool)

(assert (=> b!1050717 m!971375))

(declare-fun m!971377 () Bool)

(assert (=> b!1050717 m!971377))

(declare-fun m!971379 () Bool)

(assert (=> b!1050716 m!971379))

(declare-fun m!971381 () Bool)

(assert (=> b!1050715 m!971381))

(declare-fun m!971383 () Bool)

(assert (=> b!1050720 m!971383))

(assert (=> b!1050720 m!971375))

(declare-fun m!971385 () Bool)

(assert (=> b!1050721 m!971385))

(declare-fun m!971387 () Bool)

(assert (=> b!1050718 m!971387))

(declare-fun m!971389 () Bool)

(assert (=> start!92414 m!971389))

(declare-fun m!971391 () Bool)

(assert (=> b!1050719 m!971391))

(check-sat (not start!92414) (not b!1050720) (not b!1050719) (not b!1050715) (not b!1050718) (not b!1050721))
(check-sat)
