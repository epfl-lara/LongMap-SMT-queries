; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93442 () Bool)

(assert start!93442)

(declare-fun b!1058415 () Bool)

(declare-fun e!602129 () Bool)

(declare-datatypes ((array!66745 0))(
  ( (array!66746 (arr!32091 (Array (_ BitVec 32) (_ BitVec 64))) (size!32627 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66745)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058415 (= e!602129 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058416 () Bool)

(declare-fun res!706997 () Bool)

(declare-fun e!602133 () Bool)

(assert (=> b!1058416 (=> (not res!706997) (not e!602133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058416 (= res!706997 (validKeyInArray!0 k!2747))))

(declare-fun b!1058417 () Bool)

(declare-fun e!602131 () Bool)

(assert (=> b!1058417 (= e!602131 false)))

(declare-fun lt!466875 () (_ BitVec 32))

(assert (=> b!1058417 (not (= (select (arr!32091 a!3488) lt!466875) k!2747))))

(declare-datatypes ((Unit!34704 0))(
  ( (Unit!34705) )
))
(declare-fun lt!466876 () Unit!34704)

(declare-datatypes ((List!22403 0))(
  ( (Nil!22400) (Cons!22399 (h!23608 (_ BitVec 64)) (t!31710 List!22403)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66745 (_ BitVec 64) (_ BitVec 32) List!22403) Unit!34704)

(assert (=> b!1058417 (= lt!466876 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466875 Nil!22400))))

(declare-fun lt!466873 () (_ BitVec 32))

(assert (=> b!1058417 (arrayContainsKey!0 a!3488 k!2747 lt!466873)))

(declare-fun lt!466878 () Unit!34704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66745 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34704)

(assert (=> b!1058417 (= lt!466878 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466873))))

(assert (=> b!1058417 (= lt!466873 (bvadd #b00000000000000000000000000000001 lt!466875))))

(declare-fun arrayNoDuplicates!0 (array!66745 (_ BitVec 32) List!22403) Bool)

(assert (=> b!1058417 (arrayNoDuplicates!0 a!3488 lt!466875 Nil!22400)))

(declare-fun lt!466874 () Unit!34704)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66745 (_ BitVec 32) (_ BitVec 32)) Unit!34704)

(assert (=> b!1058417 (= lt!466874 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466875))))

(declare-fun b!1058418 () Bool)

(declare-fun e!602132 () Bool)

(assert (=> b!1058418 (= e!602132 (not e!602131))))

(declare-fun res!706995 () Bool)

(assert (=> b!1058418 (=> res!706995 e!602131)))

(assert (=> b!1058418 (= res!706995 (or (bvsgt lt!466875 i!1381) (bvsle i!1381 lt!466875)))))

(declare-fun e!602128 () Bool)

(assert (=> b!1058418 e!602128))

(declare-fun res!706993 () Bool)

(assert (=> b!1058418 (=> (not res!706993) (not e!602128))))

(assert (=> b!1058418 (= res!706993 (= (select (store (arr!32091 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466875) k!2747))))

(declare-fun b!1058419 () Bool)

(assert (=> b!1058419 (= e!602128 e!602129)))

(declare-fun res!706990 () Bool)

(assert (=> b!1058419 (=> res!706990 e!602129)))

(assert (=> b!1058419 (= res!706990 (or (bvsgt lt!466875 i!1381) (bvsle i!1381 lt!466875)))))

(declare-fun b!1058420 () Bool)

(declare-fun res!706996 () Bool)

(assert (=> b!1058420 (=> (not res!706996) (not e!602133))))

(assert (=> b!1058420 (= res!706996 (= (select (arr!32091 a!3488) i!1381) k!2747))))

(declare-fun b!1058421 () Bool)

(declare-fun e!602134 () Bool)

(assert (=> b!1058421 (= e!602133 e!602134)))

(declare-fun res!706991 () Bool)

(assert (=> b!1058421 (=> (not res!706991) (not e!602134))))

(declare-fun lt!466877 () array!66745)

(assert (=> b!1058421 (= res!706991 (arrayContainsKey!0 lt!466877 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058421 (= lt!466877 (array!66746 (store (arr!32091 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32627 a!3488)))))

(declare-fun b!1058422 () Bool)

(declare-fun res!706989 () Bool)

(assert (=> b!1058422 (=> (not res!706989) (not e!602133))))

(assert (=> b!1058422 (= res!706989 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22400))))

(declare-fun res!706992 () Bool)

(assert (=> start!93442 (=> (not res!706992) (not e!602133))))

(assert (=> start!93442 (= res!706992 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32627 a!3488)) (bvslt (size!32627 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93442 e!602133))

(assert (=> start!93442 true))

(declare-fun array_inv!24871 (array!66745) Bool)

(assert (=> start!93442 (array_inv!24871 a!3488)))

(declare-fun b!1058423 () Bool)

(assert (=> b!1058423 (= e!602134 e!602132)))

(declare-fun res!706994 () Bool)

(assert (=> b!1058423 (=> (not res!706994) (not e!602132))))

(assert (=> b!1058423 (= res!706994 (not (= lt!466875 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66745 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058423 (= lt!466875 (arrayScanForKey!0 lt!466877 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93442 res!706992) b!1058422))

(assert (= (and b!1058422 res!706989) b!1058416))

(assert (= (and b!1058416 res!706997) b!1058420))

(assert (= (and b!1058420 res!706996) b!1058421))

(assert (= (and b!1058421 res!706991) b!1058423))

(assert (= (and b!1058423 res!706994) b!1058418))

(assert (= (and b!1058418 res!706993) b!1058419))

(assert (= (and b!1058419 (not res!706990)) b!1058415))

(assert (= (and b!1058418 (not res!706995)) b!1058417))

(declare-fun m!978047 () Bool)

(assert (=> b!1058415 m!978047))

(declare-fun m!978049 () Bool)

(assert (=> b!1058421 m!978049))

(declare-fun m!978051 () Bool)

(assert (=> b!1058421 m!978051))

(declare-fun m!978053 () Bool)

(assert (=> b!1058417 m!978053))

(declare-fun m!978055 () Bool)

(assert (=> b!1058417 m!978055))

(declare-fun m!978057 () Bool)

(assert (=> b!1058417 m!978057))

(declare-fun m!978059 () Bool)

(assert (=> b!1058417 m!978059))

(declare-fun m!978061 () Bool)

(assert (=> b!1058417 m!978061))

(declare-fun m!978063 () Bool)

(assert (=> b!1058417 m!978063))

(declare-fun m!978065 () Bool)

(assert (=> start!93442 m!978065))

(declare-fun m!978067 () Bool)

(assert (=> b!1058420 m!978067))

(declare-fun m!978069 () Bool)

(assert (=> b!1058423 m!978069))

(assert (=> b!1058418 m!978051))

(declare-fun m!978071 () Bool)

(assert (=> b!1058418 m!978071))

(declare-fun m!978073 () Bool)

(assert (=> b!1058422 m!978073))

(declare-fun m!978075 () Bool)

(assert (=> b!1058416 m!978075))

(push 1)

(assert (not b!1058422))

(assert (not b!1058423))

(assert (not start!93442))

