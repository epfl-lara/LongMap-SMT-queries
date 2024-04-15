; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92338 () Bool)

(assert start!92338)

(declare-fun b!1049495 () Bool)

(declare-fun e!595462 () Bool)

(assert (=> b!1049495 (= e!595462 true)))

(declare-fun lt!463399 () Bool)

(declare-datatypes ((List!22150 0))(
  ( (Nil!22147) (Cons!22146 (h!23355 (_ BitVec 64)) (t!31448 List!22150)) )
))
(declare-fun contains!6088 (List!22150 (_ BitVec 64)) Bool)

(assert (=> b!1049495 (= lt!463399 (contains!6088 Nil!22147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049496 () Bool)

(declare-fun res!698708 () Bool)

(declare-fun e!595466 () Bool)

(assert (=> b!1049496 (=> (not res!698708) (not e!595466))))

(declare-datatypes ((array!66080 0))(
  ( (array!66081 (arr!31779 (Array (_ BitVec 32) (_ BitVec 64))) (size!32317 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66080)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049496 (= res!698708 (= (select (arr!31779 a!3488) i!1381) k0!2747))))

(declare-fun b!1049497 () Bool)

(declare-fun e!595465 () Bool)

(declare-fun e!595467 () Bool)

(assert (=> b!1049497 (= e!595465 e!595467)))

(declare-fun res!698715 () Bool)

(assert (=> b!1049497 (=> (not res!698715) (not e!595467))))

(declare-fun lt!463398 () (_ BitVec 32))

(assert (=> b!1049497 (= res!698715 (not (= lt!463398 i!1381)))))

(declare-fun lt!463400 () array!66080)

(declare-fun arrayScanForKey!0 (array!66080 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049497 (= lt!463398 (arrayScanForKey!0 lt!463400 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049498 () Bool)

(declare-fun res!698712 () Bool)

(assert (=> b!1049498 (=> res!698712 e!595462)))

(declare-fun noDuplicate!1513 (List!22150) Bool)

(assert (=> b!1049498 (= res!698712 (not (noDuplicate!1513 Nil!22147)))))

(declare-fun b!1049499 () Bool)

(declare-fun res!698705 () Bool)

(assert (=> b!1049499 (=> (not res!698705) (not e!595466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049499 (= res!698705 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049500 () Bool)

(declare-fun res!698706 () Bool)

(assert (=> b!1049500 (=> res!698706 e!595462)))

(assert (=> b!1049500 (= res!698706 (contains!6088 Nil!22147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049502 () Bool)

(declare-fun e!595463 () Bool)

(assert (=> b!1049502 (= e!595467 (not e!595463))))

(declare-fun res!698709 () Bool)

(assert (=> b!1049502 (=> res!698709 e!595463)))

(assert (=> b!1049502 (= res!698709 (bvsle lt!463398 i!1381))))

(declare-fun e!595461 () Bool)

(assert (=> b!1049502 e!595461))

(declare-fun res!698716 () Bool)

(assert (=> b!1049502 (=> (not res!698716) (not e!595461))))

(assert (=> b!1049502 (= res!698716 (= (select (store (arr!31779 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463398) k0!2747))))

(declare-fun b!1049503 () Bool)

(declare-fun e!595464 () Bool)

(declare-fun arrayContainsKey!0 (array!66080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049503 (= e!595464 (arrayContainsKey!0 a!3488 k0!2747 lt!463398))))

(declare-fun b!1049501 () Bool)

(declare-fun res!698707 () Bool)

(assert (=> b!1049501 (=> (not res!698707) (not e!595466))))

(declare-fun arrayNoDuplicates!0 (array!66080 (_ BitVec 32) List!22150) Bool)

(assert (=> b!1049501 (= res!698707 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22147))))

(declare-fun res!698710 () Bool)

(assert (=> start!92338 (=> (not res!698710) (not e!595466))))

(assert (=> start!92338 (= res!698710 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32317 a!3488)) (bvslt (size!32317 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92338 e!595466))

(assert (=> start!92338 true))

(declare-fun array_inv!24562 (array!66080) Bool)

(assert (=> start!92338 (array_inv!24562 a!3488)))

(declare-fun b!1049504 () Bool)

(assert (=> b!1049504 (= e!595463 e!595462)))

(declare-fun res!698713 () Bool)

(assert (=> b!1049504 (=> res!698713 e!595462)))

(assert (=> b!1049504 (= res!698713 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32317 a!3488)))))

(assert (=> b!1049504 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34211 0))(
  ( (Unit!34212) )
))
(declare-fun lt!463402 () Unit!34211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66080 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34211)

(assert (=> b!1049504 (= lt!463402 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463398 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049504 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22147)))

(declare-fun lt!463401 () Unit!34211)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66080 (_ BitVec 32) (_ BitVec 32)) Unit!34211)

(assert (=> b!1049504 (= lt!463401 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049505 () Bool)

(assert (=> b!1049505 (= e!595461 e!595464)))

(declare-fun res!698714 () Bool)

(assert (=> b!1049505 (=> res!698714 e!595464)))

(assert (=> b!1049505 (= res!698714 (bvsle lt!463398 i!1381))))

(declare-fun b!1049506 () Bool)

(assert (=> b!1049506 (= e!595466 e!595465)))

(declare-fun res!698711 () Bool)

(assert (=> b!1049506 (=> (not res!698711) (not e!595465))))

(assert (=> b!1049506 (= res!698711 (arrayContainsKey!0 lt!463400 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049506 (= lt!463400 (array!66081 (store (arr!31779 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32317 a!3488)))))

(assert (= (and start!92338 res!698710) b!1049501))

(assert (= (and b!1049501 res!698707) b!1049499))

(assert (= (and b!1049499 res!698705) b!1049496))

(assert (= (and b!1049496 res!698708) b!1049506))

(assert (= (and b!1049506 res!698711) b!1049497))

(assert (= (and b!1049497 res!698715) b!1049502))

(assert (= (and b!1049502 res!698716) b!1049505))

(assert (= (and b!1049505 (not res!698714)) b!1049503))

(assert (= (and b!1049502 (not res!698709)) b!1049504))

(assert (= (and b!1049504 (not res!698713)) b!1049498))

(assert (= (and b!1049498 (not res!698712)) b!1049500))

(assert (= (and b!1049500 (not res!698706)) b!1049495))

(declare-fun m!969769 () Bool)

(assert (=> b!1049499 m!969769))

(declare-fun m!969771 () Bool)

(assert (=> b!1049500 m!969771))

(declare-fun m!969773 () Bool)

(assert (=> b!1049495 m!969773))

(declare-fun m!969775 () Bool)

(assert (=> b!1049504 m!969775))

(declare-fun m!969777 () Bool)

(assert (=> b!1049504 m!969777))

(declare-fun m!969779 () Bool)

(assert (=> b!1049504 m!969779))

(declare-fun m!969781 () Bool)

(assert (=> b!1049504 m!969781))

(declare-fun m!969783 () Bool)

(assert (=> start!92338 m!969783))

(declare-fun m!969785 () Bool)

(assert (=> b!1049496 m!969785))

(declare-fun m!969787 () Bool)

(assert (=> b!1049503 m!969787))

(declare-fun m!969789 () Bool)

(assert (=> b!1049506 m!969789))

(declare-fun m!969791 () Bool)

(assert (=> b!1049506 m!969791))

(declare-fun m!969793 () Bool)

(assert (=> b!1049501 m!969793))

(declare-fun m!969795 () Bool)

(assert (=> b!1049498 m!969795))

(assert (=> b!1049502 m!969791))

(declare-fun m!969797 () Bool)

(assert (=> b!1049502 m!969797))

(declare-fun m!969799 () Bool)

(assert (=> b!1049497 m!969799))

(check-sat (not b!1049500) (not b!1049506) (not b!1049501) (not b!1049504) (not b!1049503) (not b!1049497) (not start!92338) (not b!1049495) (not b!1049499) (not b!1049498))
(check-sat)
