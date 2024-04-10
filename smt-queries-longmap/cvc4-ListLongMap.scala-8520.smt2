; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103920 () Bool)

(assert start!103920)

(declare-fun b!1243918 () Bool)

(declare-fun res!829697 () Bool)

(declare-fun e!705065 () Bool)

(assert (=> b!1243918 (=> (not res!829697) (not e!705065))))

(declare-datatypes ((List!27402 0))(
  ( (Nil!27399) (Cons!27398 (h!28607 (_ BitVec 64)) (t!40871 List!27402)) )
))
(declare-fun contains!7423 (List!27402 (_ BitVec 64)) Bool)

(assert (=> b!1243918 (= res!829697 (not (contains!7423 Nil!27399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243919 () Bool)

(declare-fun e!705066 () Bool)

(assert (=> b!1243919 (= e!705066 e!705065)))

(declare-fun res!829695 () Bool)

(assert (=> b!1243919 (=> (not res!829695) (not e!705065))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243919 (= res!829695 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!562520 () List!27402)

(declare-datatypes ((array!80012 0))(
  ( (array!80013 (arr!38599 (Array (_ BitVec 32) (_ BitVec 64))) (size!39135 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80012)

(assert (=> b!1243919 (= lt!562520 (Cons!27398 (select (arr!38599 a!3892) from!3270) Nil!27399))))

(declare-fun b!1243920 () Bool)

(declare-fun res!829704 () Bool)

(assert (=> b!1243920 (=> (not res!829704) (not e!705066))))

(declare-fun arrayNoDuplicates!0 (array!80012 (_ BitVec 32) List!27402) Bool)

(assert (=> b!1243920 (= res!829704 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27399))))

(declare-fun res!829703 () Bool)

(assert (=> start!103920 (=> (not res!829703) (not e!705066))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103920 (= res!829703 (and (bvslt (size!39135 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39135 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39135 a!3892))))))

(assert (=> start!103920 e!705066))

(declare-fun array_inv!29447 (array!80012) Bool)

(assert (=> start!103920 (array_inv!29447 a!3892)))

(assert (=> start!103920 true))

(declare-fun b!1243921 () Bool)

(declare-fun res!829696 () Bool)

(assert (=> b!1243921 (=> (not res!829696) (not e!705065))))

(declare-fun subseq!649 (List!27402 List!27402) Bool)

(assert (=> b!1243921 (= res!829696 (subseq!649 Nil!27399 lt!562520))))

(declare-fun b!1243922 () Bool)

(declare-fun res!829705 () Bool)

(assert (=> b!1243922 (=> (not res!829705) (not e!705065))))

(declare-fun noDuplicate!2001 (List!27402) Bool)

(assert (=> b!1243922 (= res!829705 (noDuplicate!2001 lt!562520))))

(declare-fun b!1243923 () Bool)

(declare-fun res!829700 () Bool)

(assert (=> b!1243923 (=> (not res!829700) (not e!705066))))

(assert (=> b!1243923 (= res!829700 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39135 a!3892)) (not (= newFrom!287 (size!39135 a!3892)))))))

(declare-fun b!1243924 () Bool)

(declare-fun res!829699 () Bool)

(assert (=> b!1243924 (=> (not res!829699) (not e!705065))))

(assert (=> b!1243924 (= res!829699 (not (contains!7423 Nil!27399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243925 () Bool)

(assert (=> b!1243925 (= e!705065 false)))

(declare-fun lt!562518 () Bool)

(assert (=> b!1243925 (= lt!562518 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562520))))

(declare-datatypes ((Unit!41307 0))(
  ( (Unit!41308) )
))
(declare-fun lt!562519 () Unit!41307)

(declare-fun noDuplicateSubseq!103 (List!27402 List!27402) Unit!41307)

(assert (=> b!1243925 (= lt!562519 (noDuplicateSubseq!103 Nil!27399 lt!562520))))

(declare-fun b!1243926 () Bool)

(declare-fun res!829698 () Bool)

(assert (=> b!1243926 (=> (not res!829698) (not e!705066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243926 (= res!829698 (validKeyInArray!0 (select (arr!38599 a!3892) from!3270)))))

(declare-fun b!1243927 () Bool)

(declare-fun res!829702 () Bool)

(assert (=> b!1243927 (=> (not res!829702) (not e!705065))))

(assert (=> b!1243927 (= res!829702 (not (contains!7423 lt!562520 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243928 () Bool)

(declare-fun res!829701 () Bool)

(assert (=> b!1243928 (=> (not res!829701) (not e!705065))))

(assert (=> b!1243928 (= res!829701 (not (contains!7423 lt!562520 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103920 res!829703) b!1243920))

(assert (= (and b!1243920 res!829704) b!1243923))

(assert (= (and b!1243923 res!829700) b!1243926))

(assert (= (and b!1243926 res!829698) b!1243919))

(assert (= (and b!1243919 res!829695) b!1243922))

(assert (= (and b!1243922 res!829705) b!1243928))

(assert (= (and b!1243928 res!829701) b!1243927))

(assert (= (and b!1243927 res!829702) b!1243918))

(assert (= (and b!1243918 res!829697) b!1243924))

(assert (= (and b!1243924 res!829699) b!1243921))

(assert (= (and b!1243921 res!829696) b!1243925))

(declare-fun m!1146347 () Bool)

(assert (=> b!1243924 m!1146347))

(declare-fun m!1146349 () Bool)

(assert (=> b!1243920 m!1146349))

(declare-fun m!1146351 () Bool)

(assert (=> b!1243925 m!1146351))

(declare-fun m!1146353 () Bool)

(assert (=> b!1243925 m!1146353))

(declare-fun m!1146355 () Bool)

(assert (=> b!1243926 m!1146355))

(assert (=> b!1243926 m!1146355))

(declare-fun m!1146357 () Bool)

(assert (=> b!1243926 m!1146357))

(assert (=> b!1243919 m!1146355))

(declare-fun m!1146359 () Bool)

(assert (=> b!1243921 m!1146359))

(declare-fun m!1146361 () Bool)

(assert (=> b!1243927 m!1146361))

(declare-fun m!1146363 () Bool)

(assert (=> start!103920 m!1146363))

(declare-fun m!1146365 () Bool)

(assert (=> b!1243918 m!1146365))

(declare-fun m!1146367 () Bool)

(assert (=> b!1243922 m!1146367))

(declare-fun m!1146369 () Bool)

(assert (=> b!1243928 m!1146369))

(push 1)

(assert (not b!1243921))

