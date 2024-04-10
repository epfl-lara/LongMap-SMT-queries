; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93234 () Bool)

(assert start!93234)

(declare-fun b!1057077 () Bool)

(declare-datatypes ((array!66672 0))(
  ( (array!66673 (arr!32059 (Array (_ BitVec 32) (_ BitVec 64))) (size!32595 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66672)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun e!601090 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057077 (= e!601090 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057078 () Bool)

(declare-fun e!601095 () Bool)

(declare-fun e!601091 () Bool)

(assert (=> b!1057078 (= e!601095 (not e!601091))))

(declare-fun res!705780 () Bool)

(assert (=> b!1057078 (=> res!705780 e!601091)))

(declare-fun lt!466290 () (_ BitVec 32))

(assert (=> b!1057078 (= res!705780 (or (bvsgt lt!466290 i!1381) (bvsle i!1381 lt!466290)))))

(declare-fun e!601093 () Bool)

(assert (=> b!1057078 e!601093))

(declare-fun res!705782 () Bool)

(assert (=> b!1057078 (=> (not res!705782) (not e!601093))))

(assert (=> b!1057078 (= res!705782 (= (select (store (arr!32059 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466290) k!2747))))

(declare-fun res!705781 () Bool)

(declare-fun e!601092 () Bool)

(assert (=> start!93234 (=> (not res!705781) (not e!601092))))

(assert (=> start!93234 (= res!705781 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32595 a!3488)) (bvslt (size!32595 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93234 e!601092))

(assert (=> start!93234 true))

(declare-fun array_inv!24839 (array!66672) Bool)

(assert (=> start!93234 (array_inv!24839 a!3488)))

(declare-fun b!1057079 () Bool)

(declare-fun e!601094 () Bool)

(assert (=> b!1057079 (= e!601092 e!601094)))

(declare-fun res!705783 () Bool)

(assert (=> b!1057079 (=> (not res!705783) (not e!601094))))

(declare-fun lt!466288 () array!66672)

(assert (=> b!1057079 (= res!705783 (arrayContainsKey!0 lt!466288 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057079 (= lt!466288 (array!66673 (store (arr!32059 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32595 a!3488)))))

(declare-fun b!1057080 () Bool)

(declare-fun res!705777 () Bool)

(assert (=> b!1057080 (=> (not res!705777) (not e!601092))))

(declare-datatypes ((List!22371 0))(
  ( (Nil!22368) (Cons!22367 (h!23576 (_ BitVec 64)) (t!31678 List!22371)) )
))
(declare-fun arrayNoDuplicates!0 (array!66672 (_ BitVec 32) List!22371) Bool)

(assert (=> b!1057080 (= res!705777 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22368))))

(declare-fun b!1057081 () Bool)

(assert (=> b!1057081 (= e!601094 e!601095)))

(declare-fun res!705779 () Bool)

(assert (=> b!1057081 (=> (not res!705779) (not e!601095))))

(assert (=> b!1057081 (= res!705779 (not (= lt!466290 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66672 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057081 (= lt!466290 (arrayScanForKey!0 lt!466288 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057082 () Bool)

(assert (=> b!1057082 (= e!601091 true)))

(assert (=> b!1057082 (arrayNoDuplicates!0 a!3488 lt!466290 Nil!22368)))

(declare-datatypes ((Unit!34640 0))(
  ( (Unit!34641) )
))
(declare-fun lt!466289 () Unit!34640)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66672 (_ BitVec 32) (_ BitVec 32)) Unit!34640)

(assert (=> b!1057082 (= lt!466289 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466290))))

(declare-fun b!1057083 () Bool)

(declare-fun res!705778 () Bool)

(assert (=> b!1057083 (=> (not res!705778) (not e!601092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057083 (= res!705778 (validKeyInArray!0 k!2747))))

(declare-fun b!1057084 () Bool)

(declare-fun res!705784 () Bool)

(assert (=> b!1057084 (=> (not res!705784) (not e!601092))))

(assert (=> b!1057084 (= res!705784 (= (select (arr!32059 a!3488) i!1381) k!2747))))

(declare-fun b!1057085 () Bool)

(assert (=> b!1057085 (= e!601093 e!601090)))

(declare-fun res!705785 () Bool)

(assert (=> b!1057085 (=> res!705785 e!601090)))

(assert (=> b!1057085 (= res!705785 (or (bvsgt lt!466290 i!1381) (bvsle i!1381 lt!466290)))))

(assert (= (and start!93234 res!705781) b!1057080))

(assert (= (and b!1057080 res!705777) b!1057083))

(assert (= (and b!1057083 res!705778) b!1057084))

(assert (= (and b!1057084 res!705784) b!1057079))

(assert (= (and b!1057079 res!705783) b!1057081))

(assert (= (and b!1057081 res!705779) b!1057078))

(assert (= (and b!1057078 res!705782) b!1057085))

(assert (= (and b!1057085 (not res!705785)) b!1057077))

(assert (= (and b!1057078 (not res!705780)) b!1057082))

(declare-fun m!976799 () Bool)

(assert (=> b!1057077 m!976799))

(declare-fun m!976801 () Bool)

(assert (=> b!1057079 m!976801))

(declare-fun m!976803 () Bool)

(assert (=> b!1057079 m!976803))

(declare-fun m!976805 () Bool)

(assert (=> b!1057083 m!976805))

(declare-fun m!976807 () Bool)

(assert (=> b!1057082 m!976807))

(declare-fun m!976809 () Bool)

(assert (=> b!1057082 m!976809))

(assert (=> b!1057078 m!976803))

(declare-fun m!976811 () Bool)

(assert (=> b!1057078 m!976811))

(declare-fun m!976813 () Bool)

(assert (=> start!93234 m!976813))

(declare-fun m!976815 () Bool)

(assert (=> b!1057080 m!976815))

(declare-fun m!976817 () Bool)

(assert (=> b!1057081 m!976817))

(declare-fun m!976819 () Bool)

(assert (=> b!1057084 m!976819))

(push 1)

