; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93230 () Bool)

(assert start!93230)

(declare-fun b!1057023 () Bool)

(declare-fun e!601049 () Bool)

(declare-fun e!601054 () Bool)

(assert (=> b!1057023 (= e!601049 e!601054)))

(declare-fun res!705731 () Bool)

(assert (=> b!1057023 (=> (not res!705731) (not e!601054))))

(declare-fun lt!466271 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057023 (= res!705731 (not (= lt!466271 i!1381)))))

(declare-datatypes ((array!66668 0))(
  ( (array!66669 (arr!32057 (Array (_ BitVec 32) (_ BitVec 64))) (size!32593 (_ BitVec 32))) )
))
(declare-fun lt!466270 () array!66668)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66668 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057023 (= lt!466271 (arrayScanForKey!0 lt!466270 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057024 () Bool)

(declare-fun e!601050 () Bool)

(assert (=> b!1057024 (= e!601054 (not e!601050))))

(declare-fun res!705724 () Bool)

(assert (=> b!1057024 (=> res!705724 e!601050)))

(assert (=> b!1057024 (= res!705724 (or (bvsgt lt!466271 i!1381) (bvsle i!1381 lt!466271)))))

(declare-fun e!601048 () Bool)

(assert (=> b!1057024 e!601048))

(declare-fun res!705723 () Bool)

(assert (=> b!1057024 (=> (not res!705723) (not e!601048))))

(declare-fun a!3488 () array!66668)

(assert (=> b!1057024 (= res!705723 (= (select (store (arr!32057 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466271) k0!2747))))

(declare-fun b!1057025 () Bool)

(declare-fun e!601053 () Bool)

(declare-fun arrayContainsKey!0 (array!66668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057025 (= e!601053 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057026 () Bool)

(assert (=> b!1057026 (= e!601048 e!601053)))

(declare-fun res!705726 () Bool)

(assert (=> b!1057026 (=> res!705726 e!601053)))

(assert (=> b!1057026 (= res!705726 (or (bvsgt lt!466271 i!1381) (bvsle i!1381 lt!466271)))))

(declare-fun b!1057027 () Bool)

(declare-fun res!705727 () Bool)

(declare-fun e!601051 () Bool)

(assert (=> b!1057027 (=> (not res!705727) (not e!601051))))

(assert (=> b!1057027 (= res!705727 (= (select (arr!32057 a!3488) i!1381) k0!2747))))

(declare-fun res!705730 () Bool)

(assert (=> start!93230 (=> (not res!705730) (not e!601051))))

(assert (=> start!93230 (= res!705730 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32593 a!3488)) (bvslt (size!32593 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93230 e!601051))

(assert (=> start!93230 true))

(declare-fun array_inv!24837 (array!66668) Bool)

(assert (=> start!93230 (array_inv!24837 a!3488)))

(declare-fun b!1057028 () Bool)

(declare-fun res!705728 () Bool)

(assert (=> b!1057028 (=> (not res!705728) (not e!601051))))

(declare-datatypes ((List!22369 0))(
  ( (Nil!22366) (Cons!22365 (h!23574 (_ BitVec 64)) (t!31676 List!22369)) )
))
(declare-fun arrayNoDuplicates!0 (array!66668 (_ BitVec 32) List!22369) Bool)

(assert (=> b!1057028 (= res!705728 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22366))))

(declare-fun b!1057029 () Bool)

(assert (=> b!1057029 (= e!601050 true)))

(assert (=> b!1057029 (arrayNoDuplicates!0 a!3488 lt!466271 Nil!22366)))

(declare-datatypes ((Unit!34636 0))(
  ( (Unit!34637) )
))
(declare-fun lt!466272 () Unit!34636)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66668 (_ BitVec 32) (_ BitVec 32)) Unit!34636)

(assert (=> b!1057029 (= lt!466272 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466271))))

(declare-fun b!1057030 () Bool)

(assert (=> b!1057030 (= e!601051 e!601049)))

(declare-fun res!705729 () Bool)

(assert (=> b!1057030 (=> (not res!705729) (not e!601049))))

(assert (=> b!1057030 (= res!705729 (arrayContainsKey!0 lt!466270 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057030 (= lt!466270 (array!66669 (store (arr!32057 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32593 a!3488)))))

(declare-fun b!1057031 () Bool)

(declare-fun res!705725 () Bool)

(assert (=> b!1057031 (=> (not res!705725) (not e!601051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057031 (= res!705725 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93230 res!705730) b!1057028))

(assert (= (and b!1057028 res!705728) b!1057031))

(assert (= (and b!1057031 res!705725) b!1057027))

(assert (= (and b!1057027 res!705727) b!1057030))

(assert (= (and b!1057030 res!705729) b!1057023))

(assert (= (and b!1057023 res!705731) b!1057024))

(assert (= (and b!1057024 res!705723) b!1057026))

(assert (= (and b!1057026 (not res!705726)) b!1057025))

(assert (= (and b!1057024 (not res!705724)) b!1057029))

(declare-fun m!976755 () Bool)

(assert (=> b!1057023 m!976755))

(declare-fun m!976757 () Bool)

(assert (=> b!1057025 m!976757))

(declare-fun m!976759 () Bool)

(assert (=> b!1057027 m!976759))

(declare-fun m!976761 () Bool)

(assert (=> b!1057030 m!976761))

(declare-fun m!976763 () Bool)

(assert (=> b!1057030 m!976763))

(declare-fun m!976765 () Bool)

(assert (=> b!1057028 m!976765))

(declare-fun m!976767 () Bool)

(assert (=> start!93230 m!976767))

(declare-fun m!976769 () Bool)

(assert (=> b!1057029 m!976769))

(declare-fun m!976771 () Bool)

(assert (=> b!1057029 m!976771))

(assert (=> b!1057024 m!976763))

(declare-fun m!976773 () Bool)

(assert (=> b!1057024 m!976773))

(declare-fun m!976775 () Bool)

(assert (=> b!1057031 m!976775))

(check-sat (not b!1057028) (not b!1057029) (not b!1057025) (not start!93230) (not b!1057030) (not b!1057023) (not b!1057031))
(check-sat)
