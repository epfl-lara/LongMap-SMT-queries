; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93232 () Bool)

(assert start!93232)

(declare-fun b!1057050 () Bool)

(declare-fun res!705753 () Bool)

(declare-fun e!601075 () Bool)

(assert (=> b!1057050 (=> (not res!705753) (not e!601075))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057050 (= res!705753 (validKeyInArray!0 k!2747))))

(declare-fun b!1057051 () Bool)

(declare-fun e!601070 () Bool)

(declare-fun e!601069 () Bool)

(assert (=> b!1057051 (= e!601070 e!601069)))

(declare-fun res!705758 () Bool)

(assert (=> b!1057051 (=> res!705758 e!601069)))

(declare-fun lt!466281 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057051 (= res!705758 (or (bvsgt lt!466281 i!1381) (bvsle i!1381 lt!466281)))))

(declare-fun b!1057052 () Bool)

(declare-fun e!601073 () Bool)

(declare-fun e!601071 () Bool)

(assert (=> b!1057052 (= e!601073 e!601071)))

(declare-fun res!705754 () Bool)

(assert (=> b!1057052 (=> (not res!705754) (not e!601071))))

(assert (=> b!1057052 (= res!705754 (not (= lt!466281 i!1381)))))

(declare-datatypes ((array!66670 0))(
  ( (array!66671 (arr!32058 (Array (_ BitVec 32) (_ BitVec 64))) (size!32594 (_ BitVec 32))) )
))
(declare-fun lt!466280 () array!66670)

(declare-fun arrayScanForKey!0 (array!66670 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057052 (= lt!466281 (arrayScanForKey!0 lt!466280 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057053 () Bool)

(assert (=> b!1057053 (= e!601075 e!601073)))

(declare-fun res!705752 () Bool)

(assert (=> b!1057053 (=> (not res!705752) (not e!601073))))

(declare-fun arrayContainsKey!0 (array!66670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057053 (= res!705752 (arrayContainsKey!0 lt!466280 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66670)

(assert (=> b!1057053 (= lt!466280 (array!66671 (store (arr!32058 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32594 a!3488)))))

(declare-fun b!1057054 () Bool)

(assert (=> b!1057054 (= e!601069 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!705751 () Bool)

(assert (=> start!93232 (=> (not res!705751) (not e!601075))))

(assert (=> start!93232 (= res!705751 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32594 a!3488)) (bvslt (size!32594 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93232 e!601075))

(assert (=> start!93232 true))

(declare-fun array_inv!24838 (array!66670) Bool)

(assert (=> start!93232 (array_inv!24838 a!3488)))

(declare-fun b!1057055 () Bool)

(declare-fun e!601074 () Bool)

(assert (=> b!1057055 (= e!601074 true)))

(declare-datatypes ((List!22370 0))(
  ( (Nil!22367) (Cons!22366 (h!23575 (_ BitVec 64)) (t!31677 List!22370)) )
))
(declare-fun arrayNoDuplicates!0 (array!66670 (_ BitVec 32) List!22370) Bool)

(assert (=> b!1057055 (arrayNoDuplicates!0 a!3488 lt!466281 Nil!22367)))

(declare-datatypes ((Unit!34638 0))(
  ( (Unit!34639) )
))
(declare-fun lt!466279 () Unit!34638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66670 (_ BitVec 32) (_ BitVec 32)) Unit!34638)

(assert (=> b!1057055 (= lt!466279 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466281))))

(declare-fun b!1057056 () Bool)

(declare-fun res!705755 () Bool)

(assert (=> b!1057056 (=> (not res!705755) (not e!601075))))

(assert (=> b!1057056 (= res!705755 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22367))))

(declare-fun b!1057057 () Bool)

(declare-fun res!705750 () Bool)

(assert (=> b!1057057 (=> (not res!705750) (not e!601075))))

(assert (=> b!1057057 (= res!705750 (= (select (arr!32058 a!3488) i!1381) k!2747))))

(declare-fun b!1057058 () Bool)

(assert (=> b!1057058 (= e!601071 (not e!601074))))

(declare-fun res!705757 () Bool)

(assert (=> b!1057058 (=> res!705757 e!601074)))

(assert (=> b!1057058 (= res!705757 (or (bvsgt lt!466281 i!1381) (bvsle i!1381 lt!466281)))))

(assert (=> b!1057058 e!601070))

(declare-fun res!705756 () Bool)

(assert (=> b!1057058 (=> (not res!705756) (not e!601070))))

(assert (=> b!1057058 (= res!705756 (= (select (store (arr!32058 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466281) k!2747))))

(assert (= (and start!93232 res!705751) b!1057056))

(assert (= (and b!1057056 res!705755) b!1057050))

(assert (= (and b!1057050 res!705753) b!1057057))

(assert (= (and b!1057057 res!705750) b!1057053))

(assert (= (and b!1057053 res!705752) b!1057052))

(assert (= (and b!1057052 res!705754) b!1057058))

(assert (= (and b!1057058 res!705756) b!1057051))

(assert (= (and b!1057051 (not res!705758)) b!1057054))

(assert (= (and b!1057058 (not res!705757)) b!1057055))

(declare-fun m!976777 () Bool)

(assert (=> start!93232 m!976777))

(declare-fun m!976779 () Bool)

(assert (=> b!1057058 m!976779))

(declare-fun m!976781 () Bool)

(assert (=> b!1057058 m!976781))

(declare-fun m!976783 () Bool)

(assert (=> b!1057050 m!976783))

(declare-fun m!976785 () Bool)

(assert (=> b!1057057 m!976785))

(declare-fun m!976787 () Bool)

(assert (=> b!1057054 m!976787))

(declare-fun m!976789 () Bool)

(assert (=> b!1057053 m!976789))

(assert (=> b!1057053 m!976779))

(declare-fun m!976791 () Bool)

(assert (=> b!1057056 m!976791))

(declare-fun m!976793 () Bool)

(assert (=> b!1057055 m!976793))

(declare-fun m!976795 () Bool)

(assert (=> b!1057055 m!976795))

(declare-fun m!976797 () Bool)

(assert (=> b!1057052 m!976797))

(push 1)

(assert (not b!1057052))

