; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93438 () Bool)

(assert start!93438)

(declare-fun b!1058361 () Bool)

(declare-fun res!706942 () Bool)

(declare-fun e!602086 () Bool)

(assert (=> b!1058361 (=> (not res!706942) (not e!602086))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058361 (= res!706942 (validKeyInArray!0 k!2747))))

(declare-fun b!1058362 () Bool)

(declare-fun e!602092 () Bool)

(declare-fun e!602091 () Bool)

(assert (=> b!1058362 (= e!602092 (not e!602091))))

(declare-fun res!706936 () Bool)

(assert (=> b!1058362 (=> res!706936 e!602091)))

(declare-fun lt!466841 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058362 (= res!706936 (or (bvsgt lt!466841 i!1381) (bvsle i!1381 lt!466841)))))

(declare-fun e!602087 () Bool)

(assert (=> b!1058362 e!602087))

(declare-fun res!706935 () Bool)

(assert (=> b!1058362 (=> (not res!706935) (not e!602087))))

(declare-datatypes ((array!66741 0))(
  ( (array!66742 (arr!32089 (Array (_ BitVec 32) (_ BitVec 64))) (size!32625 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66741)

(assert (=> b!1058362 (= res!706935 (= (select (store (arr!32089 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466841) k!2747))))

(declare-fun e!602089 () Bool)

(declare-fun b!1058364 () Bool)

(declare-fun arrayContainsKey!0 (array!66741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058364 (= e!602089 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058365 () Bool)

(declare-fun e!602090 () Bool)

(assert (=> b!1058365 (= e!602086 e!602090)))

(declare-fun res!706940 () Bool)

(assert (=> b!1058365 (=> (not res!706940) (not e!602090))))

(declare-fun lt!466839 () array!66741)

(assert (=> b!1058365 (= res!706940 (arrayContainsKey!0 lt!466839 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058365 (= lt!466839 (array!66742 (store (arr!32089 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32625 a!3488)))))

(declare-fun b!1058366 () Bool)

(declare-fun res!706937 () Bool)

(assert (=> b!1058366 (=> (not res!706937) (not e!602086))))

(declare-datatypes ((List!22401 0))(
  ( (Nil!22398) (Cons!22397 (h!23606 (_ BitVec 64)) (t!31708 List!22401)) )
))
(declare-fun arrayNoDuplicates!0 (array!66741 (_ BitVec 32) List!22401) Bool)

(assert (=> b!1058366 (= res!706937 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22398))))

(declare-fun b!1058367 () Bool)

(assert (=> b!1058367 (= e!602087 e!602089)))

(declare-fun res!706939 () Bool)

(assert (=> b!1058367 (=> res!706939 e!602089)))

(assert (=> b!1058367 (= res!706939 (or (bvsgt lt!466841 i!1381) (bvsle i!1381 lt!466841)))))

(declare-fun b!1058368 () Bool)

(assert (=> b!1058368 (= e!602091 false)))

(assert (=> b!1058368 (not (= (select (arr!32089 a!3488) lt!466841) k!2747))))

(declare-datatypes ((Unit!34700 0))(
  ( (Unit!34701) )
))
(declare-fun lt!466837 () Unit!34700)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66741 (_ BitVec 64) (_ BitVec 32) List!22401) Unit!34700)

(assert (=> b!1058368 (= lt!466837 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466841 Nil!22398))))

(declare-fun lt!466842 () (_ BitVec 32))

(assert (=> b!1058368 (arrayContainsKey!0 a!3488 k!2747 lt!466842)))

(declare-fun lt!466838 () Unit!34700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66741 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34700)

(assert (=> b!1058368 (= lt!466838 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466842))))

(assert (=> b!1058368 (= lt!466842 (bvadd #b00000000000000000000000000000001 lt!466841))))

(assert (=> b!1058368 (arrayNoDuplicates!0 a!3488 lt!466841 Nil!22398)))

(declare-fun lt!466840 () Unit!34700)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66741 (_ BitVec 32) (_ BitVec 32)) Unit!34700)

(assert (=> b!1058368 (= lt!466840 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466841))))

(declare-fun b!1058369 () Bool)

(assert (=> b!1058369 (= e!602090 e!602092)))

(declare-fun res!706938 () Bool)

(assert (=> b!1058369 (=> (not res!706938) (not e!602092))))

(assert (=> b!1058369 (= res!706938 (not (= lt!466841 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66741 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058369 (= lt!466841 (arrayScanForKey!0 lt!466839 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058363 () Bool)

(declare-fun res!706941 () Bool)

(assert (=> b!1058363 (=> (not res!706941) (not e!602086))))

(assert (=> b!1058363 (= res!706941 (= (select (arr!32089 a!3488) i!1381) k!2747))))

(declare-fun res!706943 () Bool)

(assert (=> start!93438 (=> (not res!706943) (not e!602086))))

(assert (=> start!93438 (= res!706943 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32625 a!3488)) (bvslt (size!32625 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93438 e!602086))

(assert (=> start!93438 true))

(declare-fun array_inv!24869 (array!66741) Bool)

(assert (=> start!93438 (array_inv!24869 a!3488)))

(assert (= (and start!93438 res!706943) b!1058366))

(assert (= (and b!1058366 res!706937) b!1058361))

(assert (= (and b!1058361 res!706942) b!1058363))

(assert (= (and b!1058363 res!706941) b!1058365))

(assert (= (and b!1058365 res!706940) b!1058369))

(assert (= (and b!1058369 res!706938) b!1058362))

(assert (= (and b!1058362 res!706935) b!1058367))

(assert (= (and b!1058367 (not res!706939)) b!1058364))

(assert (= (and b!1058362 (not res!706936)) b!1058368))

(declare-fun m!977987 () Bool)

(assert (=> b!1058364 m!977987))

(declare-fun m!977989 () Bool)

(assert (=> b!1058363 m!977989))

(declare-fun m!977991 () Bool)

(assert (=> b!1058361 m!977991))

(declare-fun m!977993 () Bool)

(assert (=> b!1058366 m!977993))

(declare-fun m!977995 () Bool)

(assert (=> b!1058362 m!977995))

(declare-fun m!977997 () Bool)

(assert (=> b!1058362 m!977997))

(declare-fun m!977999 () Bool)

(assert (=> start!93438 m!977999))

(declare-fun m!978001 () Bool)

(assert (=> b!1058368 m!978001))

(declare-fun m!978003 () Bool)

(assert (=> b!1058368 m!978003))

(declare-fun m!978005 () Bool)

(assert (=> b!1058368 m!978005))

(declare-fun m!978007 () Bool)

(assert (=> b!1058368 m!978007))

(declare-fun m!978009 () Bool)

(assert (=> b!1058368 m!978009))

(declare-fun m!978011 () Bool)

(assert (=> b!1058368 m!978011))

(declare-fun m!978013 () Bool)

(assert (=> b!1058369 m!978013))

(declare-fun m!978015 () Bool)

(assert (=> b!1058365 m!978015))

(assert (=> b!1058365 m!977995))

(push 1)

