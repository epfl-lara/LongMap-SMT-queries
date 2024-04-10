; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93440 () Bool)

(assert start!93440)

(declare-fun b!1058388 () Bool)

(declare-fun res!706970 () Bool)

(declare-fun e!602109 () Bool)

(assert (=> b!1058388 (=> (not res!706970) (not e!602109))))

(declare-datatypes ((array!66743 0))(
  ( (array!66744 (arr!32090 (Array (_ BitVec 32) (_ BitVec 64))) (size!32626 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66743)

(declare-datatypes ((List!22402 0))(
  ( (Nil!22399) (Cons!22398 (h!23607 (_ BitVec 64)) (t!31709 List!22402)) )
))
(declare-fun arrayNoDuplicates!0 (array!66743 (_ BitVec 32) List!22402) Bool)

(assert (=> b!1058388 (= res!706970 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22399))))

(declare-fun b!1058389 () Bool)

(declare-fun e!602112 () Bool)

(declare-fun e!602113 () Bool)

(assert (=> b!1058389 (= e!602112 e!602113)))

(declare-fun res!706969 () Bool)

(assert (=> b!1058389 (=> res!706969 e!602113)))

(declare-fun lt!466855 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058389 (= res!706969 (or (bvsgt lt!466855 i!1381) (bvsle i!1381 lt!466855)))))

(declare-fun b!1058390 () Bool)

(declare-fun res!706963 () Bool)

(assert (=> b!1058390 (=> (not res!706963) (not e!602109))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058390 (= res!706963 (= (select (arr!32090 a!3488) i!1381) k0!2747))))

(declare-fun b!1058391 () Bool)

(declare-fun res!706967 () Bool)

(assert (=> b!1058391 (=> (not res!706967) (not e!602109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058391 (= res!706967 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058392 () Bool)

(declare-fun arrayContainsKey!0 (array!66743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058392 (= e!602113 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058393 () Bool)

(declare-fun e!602111 () Bool)

(assert (=> b!1058393 (= e!602109 e!602111)))

(declare-fun res!706966 () Bool)

(assert (=> b!1058393 (=> (not res!706966) (not e!602111))))

(declare-fun lt!466858 () array!66743)

(assert (=> b!1058393 (= res!706966 (arrayContainsKey!0 lt!466858 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058393 (= lt!466858 (array!66744 (store (arr!32090 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32626 a!3488)))))

(declare-fun res!706964 () Bool)

(assert (=> start!93440 (=> (not res!706964) (not e!602109))))

(assert (=> start!93440 (= res!706964 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32626 a!3488)) (bvslt (size!32626 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93440 e!602109))

(assert (=> start!93440 true))

(declare-fun array_inv!24870 (array!66743) Bool)

(assert (=> start!93440 (array_inv!24870 a!3488)))

(declare-fun b!1058394 () Bool)

(declare-fun e!602108 () Bool)

(assert (=> b!1058394 (= e!602111 e!602108)))

(declare-fun res!706962 () Bool)

(assert (=> b!1058394 (=> (not res!706962) (not e!602108))))

(assert (=> b!1058394 (= res!706962 (not (= lt!466855 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66743 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058394 (= lt!466855 (arrayScanForKey!0 lt!466858 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058395 () Bool)

(declare-fun e!602110 () Bool)

(assert (=> b!1058395 (= e!602110 false)))

(assert (=> b!1058395 (not (= (select (arr!32090 a!3488) lt!466855) k0!2747))))

(declare-datatypes ((Unit!34702 0))(
  ( (Unit!34703) )
))
(declare-fun lt!466856 () Unit!34702)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66743 (_ BitVec 64) (_ BitVec 32) List!22402) Unit!34702)

(assert (=> b!1058395 (= lt!466856 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466855 Nil!22399))))

(declare-fun lt!466857 () (_ BitVec 32))

(assert (=> b!1058395 (arrayContainsKey!0 a!3488 k0!2747 lt!466857)))

(declare-fun lt!466859 () Unit!34702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66743 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34702)

(assert (=> b!1058395 (= lt!466859 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466857))))

(assert (=> b!1058395 (= lt!466857 (bvadd #b00000000000000000000000000000001 lt!466855))))

(assert (=> b!1058395 (arrayNoDuplicates!0 a!3488 lt!466855 Nil!22399)))

(declare-fun lt!466860 () Unit!34702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66743 (_ BitVec 32) (_ BitVec 32)) Unit!34702)

(assert (=> b!1058395 (= lt!466860 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466855))))

(declare-fun b!1058396 () Bool)

(assert (=> b!1058396 (= e!602108 (not e!602110))))

(declare-fun res!706965 () Bool)

(assert (=> b!1058396 (=> res!706965 e!602110)))

(assert (=> b!1058396 (= res!706965 (or (bvsgt lt!466855 i!1381) (bvsle i!1381 lt!466855)))))

(assert (=> b!1058396 e!602112))

(declare-fun res!706968 () Bool)

(assert (=> b!1058396 (=> (not res!706968) (not e!602112))))

(assert (=> b!1058396 (= res!706968 (= (select (store (arr!32090 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466855) k0!2747))))

(assert (= (and start!93440 res!706964) b!1058388))

(assert (= (and b!1058388 res!706970) b!1058391))

(assert (= (and b!1058391 res!706967) b!1058390))

(assert (= (and b!1058390 res!706963) b!1058393))

(assert (= (and b!1058393 res!706966) b!1058394))

(assert (= (and b!1058394 res!706962) b!1058396))

(assert (= (and b!1058396 res!706968) b!1058389))

(assert (= (and b!1058389 (not res!706969)) b!1058392))

(assert (= (and b!1058396 (not res!706965)) b!1058395))

(declare-fun m!978017 () Bool)

(assert (=> b!1058392 m!978017))

(declare-fun m!978019 () Bool)

(assert (=> start!93440 m!978019))

(declare-fun m!978021 () Bool)

(assert (=> b!1058396 m!978021))

(declare-fun m!978023 () Bool)

(assert (=> b!1058396 m!978023))

(declare-fun m!978025 () Bool)

(assert (=> b!1058388 m!978025))

(declare-fun m!978027 () Bool)

(assert (=> b!1058393 m!978027))

(assert (=> b!1058393 m!978021))

(declare-fun m!978029 () Bool)

(assert (=> b!1058390 m!978029))

(declare-fun m!978031 () Bool)

(assert (=> b!1058391 m!978031))

(declare-fun m!978033 () Bool)

(assert (=> b!1058395 m!978033))

(declare-fun m!978035 () Bool)

(assert (=> b!1058395 m!978035))

(declare-fun m!978037 () Bool)

(assert (=> b!1058395 m!978037))

(declare-fun m!978039 () Bool)

(assert (=> b!1058395 m!978039))

(declare-fun m!978041 () Bool)

(assert (=> b!1058395 m!978041))

(declare-fun m!978043 () Bool)

(assert (=> b!1058395 m!978043))

(declare-fun m!978045 () Bool)

(assert (=> b!1058394 m!978045))

(check-sat (not b!1058393) (not b!1058392) (not b!1058388) (not b!1058391) (not start!93440) (not b!1058394) (not b!1058395))
(check-sat)
