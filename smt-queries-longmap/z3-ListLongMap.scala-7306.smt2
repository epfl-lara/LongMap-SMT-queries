; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93672 () Bool)

(assert start!93672)

(declare-fun b!1059676 () Bool)

(declare-fun e!602932 () Bool)

(declare-fun e!602935 () Bool)

(assert (=> b!1059676 (= e!602932 e!602935)))

(declare-fun res!707446 () Bool)

(assert (=> b!1059676 (=> (not res!707446) (not e!602935))))

(declare-datatypes ((array!66790 0))(
  ( (array!66791 (arr!32107 (Array (_ BitVec 32) (_ BitVec 64))) (size!32644 (_ BitVec 32))) )
))
(declare-fun lt!467352 () array!66790)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059676 (= res!707446 (arrayContainsKey!0 lt!467352 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66790)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1059676 (= lt!467352 (array!66791 (store (arr!32107 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32644 a!3488)))))

(declare-fun b!1059677 () Bool)

(declare-fun res!707451 () Bool)

(assert (=> b!1059677 (=> (not res!707451) (not e!602932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059677 (= res!707451 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059678 () Bool)

(declare-fun e!602933 () Bool)

(assert (=> b!1059678 (= e!602933 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!707447 () Bool)

(assert (=> start!93672 (=> (not res!707447) (not e!602932))))

(assert (=> start!93672 (= res!707447 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32644 a!3488)) (bvslt (size!32644 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93672 e!602932))

(assert (=> start!93672 true))

(declare-fun array_inv!24889 (array!66790) Bool)

(assert (=> start!93672 (array_inv!24889 a!3488)))

(declare-fun b!1059679 () Bool)

(declare-fun e!602930 () Bool)

(declare-fun e!602929 () Bool)

(assert (=> b!1059679 (= e!602930 (not e!602929))))

(declare-fun res!707452 () Bool)

(assert (=> b!1059679 (=> res!707452 e!602929)))

(declare-fun lt!467356 () (_ BitVec 32))

(assert (=> b!1059679 (= res!707452 (or (bvsgt lt!467356 i!1381) (bvsle i!1381 lt!467356)))))

(declare-fun e!602934 () Bool)

(assert (=> b!1059679 e!602934))

(declare-fun res!707449 () Bool)

(assert (=> b!1059679 (=> (not res!707449) (not e!602934))))

(assert (=> b!1059679 (= res!707449 (= (select (store (arr!32107 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467356) k0!2747))))

(declare-fun b!1059680 () Bool)

(assert (=> b!1059680 (= e!602929 false)))

(assert (=> b!1059680 (not (= (select (arr!32107 a!3488) lt!467356) k0!2747))))

(declare-datatypes ((Unit!34705 0))(
  ( (Unit!34706) )
))
(declare-fun lt!467354 () Unit!34705)

(declare-datatypes ((List!22389 0))(
  ( (Nil!22386) (Cons!22385 (h!23603 (_ BitVec 64)) (t!31688 List!22389)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66790 (_ BitVec 64) (_ BitVec 32) List!22389) Unit!34705)

(assert (=> b!1059680 (= lt!467354 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!467356 Nil!22386))))

(declare-fun lt!467355 () (_ BitVec 32))

(assert (=> b!1059680 (arrayContainsKey!0 a!3488 k0!2747 lt!467355)))

(declare-fun lt!467353 () Unit!34705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66790 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34705)

(assert (=> b!1059680 (= lt!467353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467355))))

(assert (=> b!1059680 (= lt!467355 (bvadd #b00000000000000000000000000000001 lt!467356))))

(declare-fun arrayNoDuplicates!0 (array!66790 (_ BitVec 32) List!22389) Bool)

(assert (=> b!1059680 (arrayNoDuplicates!0 a!3488 lt!467356 Nil!22386)))

(declare-fun lt!467357 () Unit!34705)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66790 (_ BitVec 32) (_ BitVec 32)) Unit!34705)

(assert (=> b!1059680 (= lt!467357 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467356))))

(declare-fun b!1059681 () Bool)

(declare-fun res!707450 () Bool)

(assert (=> b!1059681 (=> (not res!707450) (not e!602932))))

(assert (=> b!1059681 (= res!707450 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22386))))

(declare-fun b!1059682 () Bool)

(declare-fun res!707445 () Bool)

(assert (=> b!1059682 (=> (not res!707445) (not e!602932))))

(assert (=> b!1059682 (= res!707445 (= (select (arr!32107 a!3488) i!1381) k0!2747))))

(declare-fun b!1059683 () Bool)

(assert (=> b!1059683 (= e!602935 e!602930)))

(declare-fun res!707453 () Bool)

(assert (=> b!1059683 (=> (not res!707453) (not e!602930))))

(assert (=> b!1059683 (= res!707453 (not (= lt!467356 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66790 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059683 (= lt!467356 (arrayScanForKey!0 lt!467352 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059684 () Bool)

(assert (=> b!1059684 (= e!602934 e!602933)))

(declare-fun res!707448 () Bool)

(assert (=> b!1059684 (=> res!707448 e!602933)))

(assert (=> b!1059684 (= res!707448 (or (bvsgt lt!467356 i!1381) (bvsle i!1381 lt!467356)))))

(assert (= (and start!93672 res!707447) b!1059681))

(assert (= (and b!1059681 res!707450) b!1059677))

(assert (= (and b!1059677 res!707451) b!1059682))

(assert (= (and b!1059682 res!707445) b!1059676))

(assert (= (and b!1059676 res!707446) b!1059683))

(assert (= (and b!1059683 res!707453) b!1059679))

(assert (= (and b!1059679 res!707449) b!1059684))

(assert (= (and b!1059684 (not res!707448)) b!1059678))

(assert (= (and b!1059679 (not res!707452)) b!1059680))

(declare-fun m!979655 () Bool)

(assert (=> b!1059682 m!979655))

(declare-fun m!979657 () Bool)

(assert (=> b!1059676 m!979657))

(declare-fun m!979659 () Bool)

(assert (=> b!1059676 m!979659))

(declare-fun m!979661 () Bool)

(assert (=> b!1059678 m!979661))

(assert (=> b!1059679 m!979659))

(declare-fun m!979663 () Bool)

(assert (=> b!1059679 m!979663))

(declare-fun m!979665 () Bool)

(assert (=> start!93672 m!979665))

(declare-fun m!979667 () Bool)

(assert (=> b!1059680 m!979667))

(declare-fun m!979669 () Bool)

(assert (=> b!1059680 m!979669))

(declare-fun m!979671 () Bool)

(assert (=> b!1059680 m!979671))

(declare-fun m!979673 () Bool)

(assert (=> b!1059680 m!979673))

(declare-fun m!979675 () Bool)

(assert (=> b!1059680 m!979675))

(declare-fun m!979677 () Bool)

(assert (=> b!1059680 m!979677))

(declare-fun m!979679 () Bool)

(assert (=> b!1059683 m!979679))

(declare-fun m!979681 () Bool)

(assert (=> b!1059681 m!979681))

(declare-fun m!979683 () Bool)

(assert (=> b!1059677 m!979683))

(check-sat (not b!1059681) (not b!1059677) (not b!1059683) (not b!1059680) (not b!1059676) (not b!1059678) (not start!93672))
(check-sat)
