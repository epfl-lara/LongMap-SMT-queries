; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93110 () Bool)

(assert start!93110)

(declare-fun b!1056145 () Bool)

(declare-fun res!704927 () Bool)

(declare-fun e!600374 () Bool)

(assert (=> b!1056145 (=> (not res!704927) (not e!600374))))

(declare-datatypes ((array!66608 0))(
  ( (array!66609 (arr!32030 (Array (_ BitVec 32) (_ BitVec 64))) (size!32566 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66608)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056145 (= res!704927 (= (select (arr!32030 a!3488) i!1381) k0!2747))))

(declare-fun b!1056146 () Bool)

(declare-fun res!704924 () Bool)

(assert (=> b!1056146 (=> (not res!704924) (not e!600374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056146 (= res!704924 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056147 () Bool)

(declare-fun e!600375 () Bool)

(declare-fun arrayContainsKey!0 (array!66608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056147 (= e!600375 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!704929 () Bool)

(assert (=> start!93110 (=> (not res!704929) (not e!600374))))

(assert (=> start!93110 (= res!704929 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32566 a!3488)) (bvslt (size!32566 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93110 e!600374))

(assert (=> start!93110 true))

(declare-fun array_inv!24810 (array!66608) Bool)

(assert (=> start!93110 (array_inv!24810 a!3488)))

(declare-fun b!1056148 () Bool)

(declare-fun e!600371 () Bool)

(assert (=> b!1056148 (= e!600371 e!600375)))

(declare-fun res!704923 () Bool)

(assert (=> b!1056148 (=> res!704923 e!600375)))

(declare-fun lt!466041 () (_ BitVec 32))

(assert (=> b!1056148 (= res!704923 (or (bvsgt lt!466041 i!1381) (bvsle i!1381 lt!466041)))))

(declare-fun b!1056149 () Bool)

(declare-fun e!600373 () Bool)

(assert (=> b!1056149 (= e!600373 (not true))))

(assert (=> b!1056149 e!600371))

(declare-fun res!704930 () Bool)

(assert (=> b!1056149 (=> (not res!704930) (not e!600371))))

(assert (=> b!1056149 (= res!704930 (= (select (store (arr!32030 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466041) k0!2747))))

(declare-fun b!1056150 () Bool)

(declare-fun e!600376 () Bool)

(assert (=> b!1056150 (= e!600376 e!600373)))

(declare-fun res!704926 () Bool)

(assert (=> b!1056150 (=> (not res!704926) (not e!600373))))

(assert (=> b!1056150 (= res!704926 (not (= lt!466041 i!1381)))))

(declare-fun lt!466040 () array!66608)

(declare-fun arrayScanForKey!0 (array!66608 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056150 (= lt!466041 (arrayScanForKey!0 lt!466040 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056151 () Bool)

(assert (=> b!1056151 (= e!600374 e!600376)))

(declare-fun res!704928 () Bool)

(assert (=> b!1056151 (=> (not res!704928) (not e!600376))))

(assert (=> b!1056151 (= res!704928 (arrayContainsKey!0 lt!466040 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056151 (= lt!466040 (array!66609 (store (arr!32030 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32566 a!3488)))))

(declare-fun b!1056152 () Bool)

(declare-fun res!704925 () Bool)

(assert (=> b!1056152 (=> (not res!704925) (not e!600374))))

(declare-datatypes ((List!22342 0))(
  ( (Nil!22339) (Cons!22338 (h!23547 (_ BitVec 64)) (t!31649 List!22342)) )
))
(declare-fun arrayNoDuplicates!0 (array!66608 (_ BitVec 32) List!22342) Bool)

(assert (=> b!1056152 (= res!704925 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22339))))

(assert (= (and start!93110 res!704929) b!1056152))

(assert (= (and b!1056152 res!704925) b!1056146))

(assert (= (and b!1056146 res!704924) b!1056145))

(assert (= (and b!1056145 res!704927) b!1056151))

(assert (= (and b!1056151 res!704928) b!1056150))

(assert (= (and b!1056150 res!704926) b!1056149))

(assert (= (and b!1056149 res!704930) b!1056148))

(assert (= (and b!1056148 (not res!704923)) b!1056147))

(declare-fun m!976079 () Bool)

(assert (=> b!1056151 m!976079))

(declare-fun m!976081 () Bool)

(assert (=> b!1056151 m!976081))

(assert (=> b!1056149 m!976081))

(declare-fun m!976083 () Bool)

(assert (=> b!1056149 m!976083))

(declare-fun m!976085 () Bool)

(assert (=> b!1056152 m!976085))

(declare-fun m!976087 () Bool)

(assert (=> b!1056150 m!976087))

(declare-fun m!976089 () Bool)

(assert (=> start!93110 m!976089))

(declare-fun m!976091 () Bool)

(assert (=> b!1056146 m!976091))

(declare-fun m!976093 () Bool)

(assert (=> b!1056147 m!976093))

(declare-fun m!976095 () Bool)

(assert (=> b!1056145 m!976095))

(check-sat (not start!93110) (not b!1056146) (not b!1056152) (not b!1056151) (not b!1056150) (not b!1056147))
(check-sat)
