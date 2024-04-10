; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92382 () Bool)

(assert start!92382)

(declare-fun b!1050369 () Bool)

(declare-fun e!596046 () Bool)

(assert (=> b!1050369 (= e!596046 true)))

(assert (=> b!1050369 false))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66183 0))(
  ( (array!66184 (arr!31831 (Array (_ BitVec 32) (_ BitVec 64))) (size!32367 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66183)

(declare-datatypes ((Unit!34382 0))(
  ( (Unit!34383) )
))
(declare-fun lt!463917 () Unit!34382)

(declare-datatypes ((List!22143 0))(
  ( (Nil!22140) (Cons!22139 (h!23348 (_ BitVec 64)) (t!31450 List!22143)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66183 (_ BitVec 64) (_ BitVec 32) List!22143) Unit!34382)

(assert (=> b!1050369 (= lt!463917 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22140))))

(declare-fun arrayContainsKey!0 (array!66183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050369 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463914 () (_ BitVec 32))

(declare-fun lt!463916 () Unit!34382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34382)

(assert (=> b!1050369 (= lt!463916 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463914 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66183 (_ BitVec 32) List!22143) Bool)

(assert (=> b!1050369 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22140)))

(declare-fun lt!463913 () Unit!34382)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66183 (_ BitVec 32) (_ BitVec 32)) Unit!34382)

(assert (=> b!1050369 (= lt!463913 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050370 () Bool)

(declare-fun e!596044 () Bool)

(assert (=> b!1050370 (= e!596044 (not e!596046))))

(declare-fun res!699498 () Bool)

(assert (=> b!1050370 (=> res!699498 e!596046)))

(assert (=> b!1050370 (= res!699498 (bvsle lt!463914 i!1381))))

(declare-fun e!596048 () Bool)

(assert (=> b!1050370 e!596048))

(declare-fun res!699497 () Bool)

(assert (=> b!1050370 (=> (not res!699497) (not e!596048))))

(assert (=> b!1050370 (= res!699497 (= (select (store (arr!31831 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463914) k!2747))))

(declare-fun b!1050371 () Bool)

(declare-fun res!699499 () Bool)

(declare-fun e!596045 () Bool)

(assert (=> b!1050371 (=> (not res!699499) (not e!596045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050371 (= res!699499 (validKeyInArray!0 k!2747))))

(declare-fun res!699501 () Bool)

(assert (=> start!92382 (=> (not res!699501) (not e!596045))))

(assert (=> start!92382 (= res!699501 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32367 a!3488)) (bvslt (size!32367 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92382 e!596045))

(assert (=> start!92382 true))

(declare-fun array_inv!24611 (array!66183) Bool)

(assert (=> start!92382 (array_inv!24611 a!3488)))

(declare-fun b!1050372 () Bool)

(declare-fun e!596050 () Bool)

(assert (=> b!1050372 (= e!596050 e!596044)))

(declare-fun res!699502 () Bool)

(assert (=> b!1050372 (=> (not res!699502) (not e!596044))))

(assert (=> b!1050372 (= res!699502 (not (= lt!463914 i!1381)))))

(declare-fun lt!463915 () array!66183)

(declare-fun arrayScanForKey!0 (array!66183 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050372 (= lt!463914 (arrayScanForKey!0 lt!463915 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050373 () Bool)

(assert (=> b!1050373 (= e!596045 e!596050)))

(declare-fun res!699495 () Bool)

(assert (=> b!1050373 (=> (not res!699495) (not e!596050))))

(assert (=> b!1050373 (= res!699495 (arrayContainsKey!0 lt!463915 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050373 (= lt!463915 (array!66184 (store (arr!31831 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32367 a!3488)))))

(declare-fun b!1050374 () Bool)

(declare-fun res!699500 () Bool)

(assert (=> b!1050374 (=> (not res!699500) (not e!596045))))

(assert (=> b!1050374 (= res!699500 (= (select (arr!31831 a!3488) i!1381) k!2747))))

(declare-fun b!1050375 () Bool)

(declare-fun res!699503 () Bool)

(assert (=> b!1050375 (=> (not res!699503) (not e!596045))))

(assert (=> b!1050375 (= res!699503 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22140))))

(declare-fun b!1050376 () Bool)

(declare-fun e!596047 () Bool)

(assert (=> b!1050376 (= e!596048 e!596047)))

(declare-fun res!699496 () Bool)

(assert (=> b!1050376 (=> res!699496 e!596047)))

(assert (=> b!1050376 (= res!699496 (bvsle lt!463914 i!1381))))

(declare-fun b!1050377 () Bool)

(assert (=> b!1050377 (= e!596047 (arrayContainsKey!0 a!3488 k!2747 lt!463914))))

(assert (= (and start!92382 res!699501) b!1050375))

(assert (= (and b!1050375 res!699503) b!1050371))

(assert (= (and b!1050371 res!699499) b!1050374))

(assert (= (and b!1050374 res!699500) b!1050373))

(assert (= (and b!1050373 res!699495) b!1050372))

(assert (= (and b!1050372 res!699502) b!1050370))

(assert (= (and b!1050370 res!699497) b!1050376))

(assert (= (and b!1050376 (not res!699496)) b!1050377))

(assert (= (and b!1050370 (not res!699498)) b!1050369))

(declare-fun m!971045 () Bool)

(assert (=> b!1050373 m!971045))

(declare-fun m!971047 () Bool)

(assert (=> b!1050373 m!971047))

(declare-fun m!971049 () Bool)

(assert (=> start!92382 m!971049))

(declare-fun m!971051 () Bool)

(assert (=> b!1050375 m!971051))

(declare-fun m!971053 () Bool)

(assert (=> b!1050377 m!971053))

(declare-fun m!971055 () Bool)

(assert (=> b!1050369 m!971055))

(declare-fun m!971057 () Bool)

(assert (=> b!1050369 m!971057))

(declare-fun m!971059 () Bool)

(assert (=> b!1050369 m!971059))

(declare-fun m!971061 () Bool)

(assert (=> b!1050369 m!971061))

(declare-fun m!971063 () Bool)

(assert (=> b!1050369 m!971063))

(declare-fun m!971065 () Bool)

(assert (=> b!1050372 m!971065))

(declare-fun m!971067 () Bool)

(assert (=> b!1050371 m!971067))

(assert (=> b!1050370 m!971047))

(declare-fun m!971069 () Bool)

(assert (=> b!1050370 m!971069))

(declare-fun m!971071 () Bool)

(assert (=> b!1050374 m!971071))

(push 1)

(assert (not b!1050372))

(assert (not b!1050377))

(assert (not b!1050371))

(assert (not start!92382))

(assert (not b!1050375))

(assert (not b!1050373))

