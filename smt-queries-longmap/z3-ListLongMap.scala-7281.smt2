; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93050 () Bool)

(assert start!93050)

(declare-fun b!1055664 () Bool)

(declare-fun e!600012 () Bool)

(assert (=> b!1055664 (= e!600012 true)))

(declare-fun lt!465851 () Bool)

(declare-datatypes ((List!22327 0))(
  ( (Nil!22324) (Cons!22323 (h!23532 (_ BitVec 64)) (t!31634 List!22327)) )
))
(declare-fun contains!6187 (List!22327 (_ BitVec 64)) Bool)

(assert (=> b!1055664 (= lt!465851 (contains!6187 Nil!22324 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055666 () Bool)

(declare-fun res!704489 () Bool)

(declare-fun e!600013 () Bool)

(assert (=> b!1055666 (=> (not res!704489) (not e!600013))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055666 (= res!704489 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055667 () Bool)

(declare-fun res!704483 () Bool)

(assert (=> b!1055667 (=> (not res!704483) (not e!600013))))

(declare-datatypes ((array!66575 0))(
  ( (array!66576 (arr!32015 (Array (_ BitVec 32) (_ BitVec 64))) (size!32551 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66575)

(declare-fun arrayNoDuplicates!0 (array!66575 (_ BitVec 32) List!22327) Bool)

(assert (=> b!1055667 (= res!704483 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22324))))

(declare-fun b!1055668 () Bool)

(declare-fun e!600010 () Bool)

(declare-fun e!600006 () Bool)

(assert (=> b!1055668 (= e!600010 e!600006)))

(declare-fun res!704478 () Bool)

(assert (=> b!1055668 (=> res!704478 e!600006)))

(declare-fun lt!465849 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055668 (= res!704478 (bvsle lt!465849 i!1381))))

(declare-fun b!1055669 () Bool)

(declare-fun e!600007 () Bool)

(declare-fun e!600008 () Bool)

(assert (=> b!1055669 (= e!600007 (not e!600008))))

(declare-fun res!704488 () Bool)

(assert (=> b!1055669 (=> res!704488 e!600008)))

(assert (=> b!1055669 (= res!704488 (bvsle lt!465849 i!1381))))

(assert (=> b!1055669 e!600010))

(declare-fun res!704484 () Bool)

(assert (=> b!1055669 (=> (not res!704484) (not e!600010))))

(assert (=> b!1055669 (= res!704484 (= (select (store (arr!32015 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465849) k0!2747))))

(declare-fun b!1055670 () Bool)

(declare-fun res!704487 () Bool)

(assert (=> b!1055670 (=> (not res!704487) (not e!600013))))

(assert (=> b!1055670 (= res!704487 (= (select (arr!32015 a!3488) i!1381) k0!2747))))

(declare-fun b!1055671 () Bool)

(declare-fun res!704480 () Bool)

(assert (=> b!1055671 (=> res!704480 e!600012)))

(assert (=> b!1055671 (= res!704480 (contains!6187 Nil!22324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055672 () Bool)

(declare-fun e!600009 () Bool)

(assert (=> b!1055672 (= e!600009 e!600007)))

(declare-fun res!704485 () Bool)

(assert (=> b!1055672 (=> (not res!704485) (not e!600007))))

(assert (=> b!1055672 (= res!704485 (not (= lt!465849 i!1381)))))

(declare-fun lt!465848 () array!66575)

(declare-fun arrayScanForKey!0 (array!66575 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055672 (= lt!465849 (arrayScanForKey!0 lt!465848 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055673 () Bool)

(declare-fun res!704479 () Bool)

(assert (=> b!1055673 (=> res!704479 e!600012)))

(declare-fun noDuplicate!1555 (List!22327) Bool)

(assert (=> b!1055673 (= res!704479 (not (noDuplicate!1555 Nil!22324)))))

(declare-fun b!1055665 () Bool)

(assert (=> b!1055665 (= e!600008 e!600012)))

(declare-fun res!704481 () Bool)

(assert (=> b!1055665 (=> res!704481 e!600012)))

(assert (=> b!1055665 (= res!704481 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32551 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055665 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34588 0))(
  ( (Unit!34589) )
))
(declare-fun lt!465852 () Unit!34588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34588)

(assert (=> b!1055665 (= lt!465852 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465849 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055665 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22324)))

(declare-fun lt!465850 () Unit!34588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66575 (_ BitVec 32) (_ BitVec 32)) Unit!34588)

(assert (=> b!1055665 (= lt!465850 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!704482 () Bool)

(assert (=> start!93050 (=> (not res!704482) (not e!600013))))

(assert (=> start!93050 (= res!704482 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32551 a!3488)) (bvslt (size!32551 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93050 e!600013))

(assert (=> start!93050 true))

(declare-fun array_inv!24795 (array!66575) Bool)

(assert (=> start!93050 (array_inv!24795 a!3488)))

(declare-fun b!1055674 () Bool)

(assert (=> b!1055674 (= e!600006 (arrayContainsKey!0 a!3488 k0!2747 lt!465849))))

(declare-fun b!1055675 () Bool)

(assert (=> b!1055675 (= e!600013 e!600009)))

(declare-fun res!704486 () Bool)

(assert (=> b!1055675 (=> (not res!704486) (not e!600009))))

(assert (=> b!1055675 (= res!704486 (arrayContainsKey!0 lt!465848 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055675 (= lt!465848 (array!66576 (store (arr!32015 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32551 a!3488)))))

(assert (= (and start!93050 res!704482) b!1055667))

(assert (= (and b!1055667 res!704483) b!1055666))

(assert (= (and b!1055666 res!704489) b!1055670))

(assert (= (and b!1055670 res!704487) b!1055675))

(assert (= (and b!1055675 res!704486) b!1055672))

(assert (= (and b!1055672 res!704485) b!1055669))

(assert (= (and b!1055669 res!704484) b!1055668))

(assert (= (and b!1055668 (not res!704478)) b!1055674))

(assert (= (and b!1055669 (not res!704488)) b!1055665))

(assert (= (and b!1055665 (not res!704481)) b!1055673))

(assert (= (and b!1055673 (not res!704479)) b!1055671))

(assert (= (and b!1055671 (not res!704480)) b!1055664))

(declare-fun m!975637 () Bool)

(assert (=> b!1055665 m!975637))

(declare-fun m!975639 () Bool)

(assert (=> b!1055665 m!975639))

(declare-fun m!975641 () Bool)

(assert (=> b!1055665 m!975641))

(declare-fun m!975643 () Bool)

(assert (=> b!1055665 m!975643))

(declare-fun m!975645 () Bool)

(assert (=> b!1055675 m!975645))

(declare-fun m!975647 () Bool)

(assert (=> b!1055675 m!975647))

(declare-fun m!975649 () Bool)

(assert (=> b!1055673 m!975649))

(declare-fun m!975651 () Bool)

(assert (=> b!1055667 m!975651))

(assert (=> b!1055669 m!975647))

(declare-fun m!975653 () Bool)

(assert (=> b!1055669 m!975653))

(declare-fun m!975655 () Bool)

(assert (=> b!1055672 m!975655))

(declare-fun m!975657 () Bool)

(assert (=> b!1055671 m!975657))

(declare-fun m!975659 () Bool)

(assert (=> start!93050 m!975659))

(declare-fun m!975661 () Bool)

(assert (=> b!1055664 m!975661))

(declare-fun m!975663 () Bool)

(assert (=> b!1055666 m!975663))

(declare-fun m!975665 () Bool)

(assert (=> b!1055670 m!975665))

(declare-fun m!975667 () Bool)

(assert (=> b!1055674 m!975667))

(check-sat (not b!1055665) (not b!1055666) (not b!1055672) (not b!1055673) (not b!1055667) (not b!1055664) (not b!1055675) (not b!1055674) (not start!93050) (not b!1055671))
(check-sat)
