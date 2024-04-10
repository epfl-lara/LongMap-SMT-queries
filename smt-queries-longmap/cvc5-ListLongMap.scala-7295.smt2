; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93228 () Bool)

(assert start!93228)

(declare-fun b!1056997 () Bool)

(declare-fun res!705696 () Bool)

(declare-fun e!601027 () Bool)

(assert (=> b!1056997 (=> (not res!705696) (not e!601027))))

(declare-datatypes ((array!66666 0))(
  ( (array!66667 (arr!32056 (Array (_ BitVec 32) (_ BitVec 64))) (size!32592 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66666)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056997 (= res!705696 (= (select (arr!32056 a!3488) i!1381) k!2747))))

(declare-fun b!1056998 () Bool)

(declare-fun res!705702 () Bool)

(assert (=> b!1056998 (=> (not res!705702) (not e!601027))))

(declare-datatypes ((List!22368 0))(
  ( (Nil!22365) (Cons!22364 (h!23573 (_ BitVec 64)) (t!31675 List!22368)) )
))
(declare-fun arrayNoDuplicates!0 (array!66666 (_ BitVec 32) List!22368) Bool)

(assert (=> b!1056998 (= res!705702 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22365))))

(declare-fun b!1056999 () Bool)

(declare-fun e!601033 () Bool)

(declare-fun e!601030 () Bool)

(assert (=> b!1056999 (= e!601033 e!601030)))

(declare-fun res!705700 () Bool)

(assert (=> b!1056999 (=> res!705700 e!601030)))

(declare-fun lt!466261 () (_ BitVec 32))

(assert (=> b!1056999 (= res!705700 (or (bvsgt lt!466261 i!1381) (bvsle i!1381 lt!466261)))))

(declare-fun b!1056996 () Bool)

(declare-fun e!601029 () Bool)

(declare-fun e!601032 () Bool)

(assert (=> b!1056996 (= e!601029 e!601032)))

(declare-fun res!705698 () Bool)

(assert (=> b!1056996 (=> (not res!705698) (not e!601032))))

(assert (=> b!1056996 (= res!705698 (not (= lt!466261 i!1381)))))

(declare-fun lt!466263 () array!66666)

(declare-fun arrayScanForKey!0 (array!66666 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056996 (= lt!466261 (arrayScanForKey!0 lt!466263 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!705697 () Bool)

(assert (=> start!93228 (=> (not res!705697) (not e!601027))))

(assert (=> start!93228 (= res!705697 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32592 a!3488)) (bvslt (size!32592 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93228 e!601027))

(assert (=> start!93228 true))

(declare-fun array_inv!24836 (array!66666) Bool)

(assert (=> start!93228 (array_inv!24836 a!3488)))

(declare-fun b!1057000 () Bool)

(declare-fun e!601031 () Bool)

(assert (=> b!1057000 (= e!601031 true)))

(assert (=> b!1057000 (arrayNoDuplicates!0 a!3488 lt!466261 Nil!22365)))

(declare-datatypes ((Unit!34634 0))(
  ( (Unit!34635) )
))
(declare-fun lt!466262 () Unit!34634)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66666 (_ BitVec 32) (_ BitVec 32)) Unit!34634)

(assert (=> b!1057000 (= lt!466262 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466261))))

(declare-fun b!1057001 () Bool)

(assert (=> b!1057001 (= e!601027 e!601029)))

(declare-fun res!705704 () Bool)

(assert (=> b!1057001 (=> (not res!705704) (not e!601029))))

(declare-fun arrayContainsKey!0 (array!66666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057001 (= res!705704 (arrayContainsKey!0 lt!466263 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057001 (= lt!466263 (array!66667 (store (arr!32056 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32592 a!3488)))))

(declare-fun b!1057002 () Bool)

(declare-fun res!705701 () Bool)

(assert (=> b!1057002 (=> (not res!705701) (not e!601027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057002 (= res!705701 (validKeyInArray!0 k!2747))))

(declare-fun b!1057003 () Bool)

(assert (=> b!1057003 (= e!601032 (not e!601031))))

(declare-fun res!705699 () Bool)

(assert (=> b!1057003 (=> res!705699 e!601031)))

(assert (=> b!1057003 (= res!705699 (or (bvsgt lt!466261 i!1381) (bvsle i!1381 lt!466261)))))

(assert (=> b!1057003 e!601033))

(declare-fun res!705703 () Bool)

(assert (=> b!1057003 (=> (not res!705703) (not e!601033))))

(assert (=> b!1057003 (= res!705703 (= (select (store (arr!32056 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466261) k!2747))))

(declare-fun b!1057004 () Bool)

(assert (=> b!1057004 (= e!601030 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93228 res!705697) b!1056998))

(assert (= (and b!1056998 res!705702) b!1057002))

(assert (= (and b!1057002 res!705701) b!1056997))

(assert (= (and b!1056997 res!705696) b!1057001))

(assert (= (and b!1057001 res!705704) b!1056996))

(assert (= (and b!1056996 res!705698) b!1057003))

(assert (= (and b!1057003 res!705703) b!1056999))

(assert (= (and b!1056999 (not res!705700)) b!1057004))

(assert (= (and b!1057003 (not res!705699)) b!1057000))

(declare-fun m!976733 () Bool)

(assert (=> b!1057004 m!976733))

(declare-fun m!976735 () Bool)

(assert (=> b!1057003 m!976735))

(declare-fun m!976737 () Bool)

(assert (=> b!1057003 m!976737))

(declare-fun m!976739 () Bool)

(assert (=> b!1057000 m!976739))

(declare-fun m!976741 () Bool)

(assert (=> b!1057000 m!976741))

(declare-fun m!976743 () Bool)

(assert (=> b!1057001 m!976743))

(assert (=> b!1057001 m!976735))

(declare-fun m!976745 () Bool)

(assert (=> b!1056996 m!976745))

(declare-fun m!976747 () Bool)

(assert (=> start!93228 m!976747))

(declare-fun m!976749 () Bool)

(assert (=> b!1056997 m!976749))

(declare-fun m!976751 () Bool)

(assert (=> b!1056998 m!976751))

(declare-fun m!976753 () Bool)

(assert (=> b!1057002 m!976753))

(push 1)

