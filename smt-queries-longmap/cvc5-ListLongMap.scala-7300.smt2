; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93300 () Bool)

(assert start!93300)

(declare-fun e!601433 () Bool)

(declare-fun lt!466484 () (_ BitVec 32))

(declare-fun b!1057509 () Bool)

(declare-datatypes ((array!66699 0))(
  ( (array!66700 (arr!32071 (Array (_ BitVec 32) (_ BitVec 64))) (size!32607 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66699)

(declare-fun lt!466481 () (_ BitVec 32))

(assert (=> b!1057509 (= e!601433 (or (bvslt lt!466481 #b00000000000000000000000000000000) (bvslt lt!466484 (size!32607 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057509 (arrayContainsKey!0 a!3488 k!2747 lt!466484)))

(declare-datatypes ((Unit!34664 0))(
  ( (Unit!34665) )
))
(declare-fun lt!466482 () Unit!34664)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66699 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34664)

(assert (=> b!1057509 (= lt!466482 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466484))))

(assert (=> b!1057509 (= lt!466484 (bvadd #b00000000000000000000000000000001 lt!466481))))

(declare-datatypes ((List!22383 0))(
  ( (Nil!22380) (Cons!22379 (h!23588 (_ BitVec 64)) (t!31690 List!22383)) )
))
(declare-fun arrayNoDuplicates!0 (array!66699 (_ BitVec 32) List!22383) Bool)

(assert (=> b!1057509 (arrayNoDuplicates!0 a!3488 lt!466481 Nil!22380)))

(declare-fun lt!466483 () Unit!34664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66699 (_ BitVec 32) (_ BitVec 32)) Unit!34664)

(assert (=> b!1057509 (= lt!466483 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466481))))

(declare-fun b!1057510 () Bool)

(declare-fun e!601430 () Bool)

(declare-fun e!601431 () Bool)

(assert (=> b!1057510 (= e!601430 e!601431)))

(declare-fun res!706169 () Bool)

(assert (=> b!1057510 (=> (not res!706169) (not e!601431))))

(declare-fun lt!466485 () array!66699)

(assert (=> b!1057510 (= res!706169 (arrayContainsKey!0 lt!466485 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057510 (= lt!466485 (array!66700 (store (arr!32071 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32607 a!3488)))))

(declare-fun b!1057511 () Bool)

(declare-fun res!706168 () Bool)

(assert (=> b!1057511 (=> (not res!706168) (not e!601430))))

(assert (=> b!1057511 (= res!706168 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22380))))

(declare-fun b!1057512 () Bool)

(declare-fun e!601435 () Bool)

(assert (=> b!1057512 (= e!601435 (not e!601433))))

(declare-fun res!706173 () Bool)

(assert (=> b!1057512 (=> res!706173 e!601433)))

(assert (=> b!1057512 (= res!706173 (or (bvsgt lt!466481 i!1381) (bvsle i!1381 lt!466481)))))

(declare-fun e!601429 () Bool)

(assert (=> b!1057512 e!601429))

(declare-fun res!706167 () Bool)

(assert (=> b!1057512 (=> (not res!706167) (not e!601429))))

(assert (=> b!1057512 (= res!706167 (= (select (store (arr!32071 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466481) k!2747))))

(declare-fun b!1057513 () Bool)

(declare-fun res!706170 () Bool)

(assert (=> b!1057513 (=> (not res!706170) (not e!601430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057513 (= res!706170 (validKeyInArray!0 k!2747))))

(declare-fun b!1057514 () Bool)

(declare-fun e!601432 () Bool)

(assert (=> b!1057514 (= e!601432 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057515 () Bool)

(declare-fun res!706174 () Bool)

(assert (=> b!1057515 (=> (not res!706174) (not e!601430))))

(assert (=> b!1057515 (= res!706174 (= (select (arr!32071 a!3488) i!1381) k!2747))))

(declare-fun res!706172 () Bool)

(assert (=> start!93300 (=> (not res!706172) (not e!601430))))

(assert (=> start!93300 (= res!706172 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32607 a!3488)) (bvslt (size!32607 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93300 e!601430))

(assert (=> start!93300 true))

(declare-fun array_inv!24851 (array!66699) Bool)

(assert (=> start!93300 (array_inv!24851 a!3488)))

(declare-fun b!1057516 () Bool)

(assert (=> b!1057516 (= e!601429 e!601432)))

(declare-fun res!706175 () Bool)

(assert (=> b!1057516 (=> res!706175 e!601432)))

(assert (=> b!1057516 (= res!706175 (or (bvsgt lt!466481 i!1381) (bvsle i!1381 lt!466481)))))

(declare-fun b!1057517 () Bool)

(assert (=> b!1057517 (= e!601431 e!601435)))

(declare-fun res!706171 () Bool)

(assert (=> b!1057517 (=> (not res!706171) (not e!601435))))

(assert (=> b!1057517 (= res!706171 (not (= lt!466481 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66699 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057517 (= lt!466481 (arrayScanForKey!0 lt!466485 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93300 res!706172) b!1057511))

(assert (= (and b!1057511 res!706168) b!1057513))

(assert (= (and b!1057513 res!706170) b!1057515))

(assert (= (and b!1057515 res!706174) b!1057510))

(assert (= (and b!1057510 res!706169) b!1057517))

(assert (= (and b!1057517 res!706171) b!1057512))

(assert (= (and b!1057512 res!706167) b!1057516))

(assert (= (and b!1057516 (not res!706175)) b!1057514))

(assert (= (and b!1057512 (not res!706173)) b!1057509))

(declare-fun m!977201 () Bool)

(assert (=> b!1057509 m!977201))

(declare-fun m!977203 () Bool)

(assert (=> b!1057509 m!977203))

(declare-fun m!977205 () Bool)

(assert (=> b!1057509 m!977205))

(declare-fun m!977207 () Bool)

(assert (=> b!1057509 m!977207))

(declare-fun m!977209 () Bool)

(assert (=> b!1057517 m!977209))

(declare-fun m!977211 () Bool)

(assert (=> b!1057514 m!977211))

(declare-fun m!977213 () Bool)

(assert (=> start!93300 m!977213))

(declare-fun m!977215 () Bool)

(assert (=> b!1057511 m!977215))

(declare-fun m!977217 () Bool)

(assert (=> b!1057513 m!977217))

(declare-fun m!977219 () Bool)

(assert (=> b!1057510 m!977219))

(declare-fun m!977221 () Bool)

(assert (=> b!1057510 m!977221))

(declare-fun m!977223 () Bool)

(assert (=> b!1057515 m!977223))

(assert (=> b!1057512 m!977221))

(declare-fun m!977225 () Bool)

(assert (=> b!1057512 m!977225))

(push 1)

(assert (not b!1057517))

(assert (not start!93300))

(assert (not b!1057510))

(assert (not b!1057513))

(assert (not b!1057514))

(assert (not b!1057511))

(assert (not b!1057509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

