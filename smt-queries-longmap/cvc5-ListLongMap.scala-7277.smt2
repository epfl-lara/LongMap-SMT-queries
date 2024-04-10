; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92922 () Bool)

(assert start!92922)

(declare-fun b!1054959 () Bool)

(declare-fun res!703859 () Bool)

(declare-fun e!599464 () Bool)

(assert (=> b!1054959 (=> (not res!703859) (not e!599464))))

(declare-datatypes ((array!66543 0))(
  ( (array!66544 (arr!32002 (Array (_ BitVec 32) (_ BitVec 64))) (size!32538 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66543)

(declare-datatypes ((List!22314 0))(
  ( (Nil!22311) (Cons!22310 (h!23519 (_ BitVec 64)) (t!31621 List!22314)) )
))
(declare-fun arrayNoDuplicates!0 (array!66543 (_ BitVec 32) List!22314) Bool)

(assert (=> b!1054959 (= res!703859 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22311))))

(declare-fun b!1054960 () Bool)

(declare-fun e!599458 () Bool)

(assert (=> b!1054960 (= e!599458 true)))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054960 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34562 0))(
  ( (Unit!34563) )
))
(declare-fun lt!465612 () Unit!34562)

(declare-fun lt!465615 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34562)

(assert (=> b!1054960 (= lt!465612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465615 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054960 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22311)))

(declare-fun lt!465614 () Unit!34562)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66543 (_ BitVec 32) (_ BitVec 32)) Unit!34562)

(assert (=> b!1054960 (= lt!465614 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054961 () Bool)

(declare-fun e!599460 () Bool)

(assert (=> b!1054961 (= e!599460 (arrayContainsKey!0 a!3488 k!2747 lt!465615))))

(declare-fun b!1054962 () Bool)

(declare-fun res!703863 () Bool)

(assert (=> b!1054962 (=> (not res!703863) (not e!599464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054962 (= res!703863 (validKeyInArray!0 k!2747))))

(declare-fun b!1054963 () Bool)

(declare-fun e!599463 () Bool)

(assert (=> b!1054963 (= e!599464 e!599463)))

(declare-fun res!703858 () Bool)

(assert (=> b!1054963 (=> (not res!703858) (not e!599463))))

(declare-fun lt!465613 () array!66543)

(assert (=> b!1054963 (= res!703858 (arrayContainsKey!0 lt!465613 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054963 (= lt!465613 (array!66544 (store (arr!32002 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32538 a!3488)))))

(declare-fun res!703857 () Bool)

(assert (=> start!92922 (=> (not res!703857) (not e!599464))))

(assert (=> start!92922 (= res!703857 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32538 a!3488)) (bvslt (size!32538 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92922 e!599464))

(assert (=> start!92922 true))

(declare-fun array_inv!24782 (array!66543) Bool)

(assert (=> start!92922 (array_inv!24782 a!3488)))

(declare-fun b!1054964 () Bool)

(declare-fun e!599459 () Bool)

(assert (=> b!1054964 (= e!599459 (not e!599458))))

(declare-fun res!703862 () Bool)

(assert (=> b!1054964 (=> res!703862 e!599458)))

(assert (=> b!1054964 (= res!703862 (bvsle lt!465615 i!1381))))

(declare-fun e!599461 () Bool)

(assert (=> b!1054964 e!599461))

(declare-fun res!703861 () Bool)

(assert (=> b!1054964 (=> (not res!703861) (not e!599461))))

(assert (=> b!1054964 (= res!703861 (= (select (store (arr!32002 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465615) k!2747))))

(declare-fun b!1054965 () Bool)

(declare-fun res!703865 () Bool)

(assert (=> b!1054965 (=> (not res!703865) (not e!599464))))

(assert (=> b!1054965 (= res!703865 (= (select (arr!32002 a!3488) i!1381) k!2747))))

(declare-fun b!1054966 () Bool)

(assert (=> b!1054966 (= e!599463 e!599459)))

(declare-fun res!703860 () Bool)

(assert (=> b!1054966 (=> (not res!703860) (not e!599459))))

(assert (=> b!1054966 (= res!703860 (not (= lt!465615 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66543 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054966 (= lt!465615 (arrayScanForKey!0 lt!465613 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054967 () Bool)

(assert (=> b!1054967 (= e!599461 e!599460)))

(declare-fun res!703864 () Bool)

(assert (=> b!1054967 (=> res!703864 e!599460)))

(assert (=> b!1054967 (= res!703864 (bvsle lt!465615 i!1381))))

(assert (= (and start!92922 res!703857) b!1054959))

(assert (= (and b!1054959 res!703859) b!1054962))

(assert (= (and b!1054962 res!703863) b!1054965))

(assert (= (and b!1054965 res!703865) b!1054963))

(assert (= (and b!1054963 res!703858) b!1054966))

(assert (= (and b!1054966 res!703860) b!1054964))

(assert (= (and b!1054964 res!703861) b!1054967))

(assert (= (and b!1054967 (not res!703864)) b!1054961))

(assert (= (and b!1054964 (not res!703862)) b!1054960))

(declare-fun m!974993 () Bool)

(assert (=> start!92922 m!974993))

(declare-fun m!974995 () Bool)

(assert (=> b!1054959 m!974995))

(declare-fun m!974997 () Bool)

(assert (=> b!1054964 m!974997))

(declare-fun m!974999 () Bool)

(assert (=> b!1054964 m!974999))

(declare-fun m!975001 () Bool)

(assert (=> b!1054962 m!975001))

(declare-fun m!975003 () Bool)

(assert (=> b!1054965 m!975003))

(declare-fun m!975005 () Bool)

(assert (=> b!1054963 m!975005))

(assert (=> b!1054963 m!974997))

(declare-fun m!975007 () Bool)

(assert (=> b!1054960 m!975007))

(declare-fun m!975009 () Bool)

(assert (=> b!1054960 m!975009))

(declare-fun m!975011 () Bool)

(assert (=> b!1054960 m!975011))

(declare-fun m!975013 () Bool)

(assert (=> b!1054960 m!975013))

(declare-fun m!975015 () Bool)

(assert (=> b!1054961 m!975015))

(declare-fun m!975017 () Bool)

(assert (=> b!1054966 m!975017))

(push 1)

