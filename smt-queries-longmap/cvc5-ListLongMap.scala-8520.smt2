; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103916 () Bool)

(assert start!103916)

(declare-fun b!1243852 () Bool)

(declare-fun res!829633 () Bool)

(declare-fun e!705048 () Bool)

(assert (=> b!1243852 (=> (not res!829633) (not e!705048))))

(declare-datatypes ((List!27400 0))(
  ( (Nil!27397) (Cons!27396 (h!28605 (_ BitVec 64)) (t!40869 List!27400)) )
))
(declare-fun contains!7421 (List!27400 (_ BitVec 64)) Bool)

(assert (=> b!1243852 (= res!829633 (not (contains!7421 Nil!27397 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829636 () Bool)

(declare-fun e!705046 () Bool)

(assert (=> start!103916 (=> (not res!829636) (not e!705046))))

(declare-datatypes ((array!80008 0))(
  ( (array!80009 (arr!38597 (Array (_ BitVec 32) (_ BitVec 64))) (size!39133 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80008)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103916 (= res!829636 (and (bvslt (size!39133 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39133 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39133 a!3892))))))

(assert (=> start!103916 e!705046))

(declare-fun array_inv!29445 (array!80008) Bool)

(assert (=> start!103916 (array_inv!29445 a!3892)))

(assert (=> start!103916 true))

(declare-fun b!1243853 () Bool)

(assert (=> b!1243853 (= e!705048 false)))

(declare-fun lt!562502 () Bool)

(declare-fun lt!562501 () List!27400)

(declare-fun arrayNoDuplicates!0 (array!80008 (_ BitVec 32) List!27400) Bool)

(assert (=> b!1243853 (= lt!562502 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562501))))

(declare-datatypes ((Unit!41303 0))(
  ( (Unit!41304) )
))
(declare-fun lt!562500 () Unit!41303)

(declare-fun noDuplicateSubseq!101 (List!27400 List!27400) Unit!41303)

(assert (=> b!1243853 (= lt!562500 (noDuplicateSubseq!101 Nil!27397 lt!562501))))

(declare-fun b!1243854 () Bool)

(declare-fun res!829631 () Bool)

(assert (=> b!1243854 (=> (not res!829631) (not e!705046))))

(assert (=> b!1243854 (= res!829631 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27397))))

(declare-fun b!1243855 () Bool)

(declare-fun res!829638 () Bool)

(assert (=> b!1243855 (=> (not res!829638) (not e!705048))))

(assert (=> b!1243855 (= res!829638 (not (contains!7421 lt!562501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243856 () Bool)

(declare-fun res!829629 () Bool)

(assert (=> b!1243856 (=> (not res!829629) (not e!705048))))

(declare-fun noDuplicate!1999 (List!27400) Bool)

(assert (=> b!1243856 (= res!829629 (noDuplicate!1999 lt!562501))))

(declare-fun b!1243857 () Bool)

(declare-fun res!829639 () Bool)

(assert (=> b!1243857 (=> (not res!829639) (not e!705048))))

(assert (=> b!1243857 (= res!829639 (not (contains!7421 Nil!27397 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243858 () Bool)

(assert (=> b!1243858 (= e!705046 e!705048)))

(declare-fun res!829637 () Bool)

(assert (=> b!1243858 (=> (not res!829637) (not e!705048))))

(assert (=> b!1243858 (= res!829637 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243858 (= lt!562501 (Cons!27396 (select (arr!38597 a!3892) from!3270) Nil!27397))))

(declare-fun b!1243859 () Bool)

(declare-fun res!829630 () Bool)

(assert (=> b!1243859 (=> (not res!829630) (not e!705048))))

(declare-fun subseq!647 (List!27400 List!27400) Bool)

(assert (=> b!1243859 (= res!829630 (subseq!647 Nil!27397 lt!562501))))

(declare-fun b!1243860 () Bool)

(declare-fun res!829634 () Bool)

(assert (=> b!1243860 (=> (not res!829634) (not e!705046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243860 (= res!829634 (validKeyInArray!0 (select (arr!38597 a!3892) from!3270)))))

(declare-fun b!1243861 () Bool)

(declare-fun res!829632 () Bool)

(assert (=> b!1243861 (=> (not res!829632) (not e!705048))))

(assert (=> b!1243861 (= res!829632 (not (contains!7421 lt!562501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243862 () Bool)

(declare-fun res!829635 () Bool)

(assert (=> b!1243862 (=> (not res!829635) (not e!705046))))

(assert (=> b!1243862 (= res!829635 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39133 a!3892)) (not (= newFrom!287 (size!39133 a!3892)))))))

(assert (= (and start!103916 res!829636) b!1243854))

(assert (= (and b!1243854 res!829631) b!1243862))

(assert (= (and b!1243862 res!829635) b!1243860))

(assert (= (and b!1243860 res!829634) b!1243858))

(assert (= (and b!1243858 res!829637) b!1243856))

(assert (= (and b!1243856 res!829629) b!1243855))

(assert (= (and b!1243855 res!829638) b!1243861))

(assert (= (and b!1243861 res!829632) b!1243857))

(assert (= (and b!1243857 res!829639) b!1243852))

(assert (= (and b!1243852 res!829633) b!1243859))

(assert (= (and b!1243859 res!829630) b!1243853))

(declare-fun m!1146299 () Bool)

(assert (=> b!1243858 m!1146299))

(declare-fun m!1146301 () Bool)

(assert (=> b!1243854 m!1146301))

(declare-fun m!1146303 () Bool)

(assert (=> b!1243857 m!1146303))

(declare-fun m!1146305 () Bool)

(assert (=> b!1243852 m!1146305))

(assert (=> b!1243860 m!1146299))

(assert (=> b!1243860 m!1146299))

(declare-fun m!1146307 () Bool)

(assert (=> b!1243860 m!1146307))

(declare-fun m!1146309 () Bool)

(assert (=> b!1243859 m!1146309))

(declare-fun m!1146311 () Bool)

(assert (=> b!1243853 m!1146311))

(declare-fun m!1146313 () Bool)

(assert (=> b!1243853 m!1146313))

(declare-fun m!1146315 () Bool)

(assert (=> start!103916 m!1146315))

(declare-fun m!1146317 () Bool)

(assert (=> b!1243861 m!1146317))

(declare-fun m!1146319 () Bool)

(assert (=> b!1243855 m!1146319))

(declare-fun m!1146321 () Bool)

(assert (=> b!1243856 m!1146321))

(push 1)

