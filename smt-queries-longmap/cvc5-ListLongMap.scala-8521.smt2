; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103922 () Bool)

(assert start!103922)

(declare-fun b!1243951 () Bool)

(declare-fun res!829732 () Bool)

(declare-fun e!705075 () Bool)

(assert (=> b!1243951 (=> (not res!829732) (not e!705075))))

(declare-datatypes ((array!80014 0))(
  ( (array!80015 (arr!38600 (Array (_ BitVec 32) (_ BitVec 64))) (size!39136 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80014)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27403 0))(
  ( (Nil!27400) (Cons!27399 (h!28608 (_ BitVec 64)) (t!40872 List!27403)) )
))
(declare-fun arrayNoDuplicates!0 (array!80014 (_ BitVec 32) List!27403) Bool)

(assert (=> b!1243951 (= res!829732 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27400))))

(declare-fun b!1243952 () Bool)

(declare-fun res!829735 () Bool)

(assert (=> b!1243952 (=> (not res!829735) (not e!705075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243952 (= res!829735 (validKeyInArray!0 (select (arr!38600 a!3892) from!3270)))))

(declare-fun b!1243953 () Bool)

(declare-fun res!829728 () Bool)

(declare-fun e!705073 () Bool)

(assert (=> b!1243953 (=> (not res!829728) (not e!705073))))

(declare-fun lt!562529 () List!27403)

(declare-fun contains!7424 (List!27403 (_ BitVec 64)) Bool)

(assert (=> b!1243953 (= res!829728 (not (contains!7424 lt!562529 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243954 () Bool)

(declare-fun res!829738 () Bool)

(assert (=> b!1243954 (=> (not res!829738) (not e!705073))))

(declare-fun noDuplicate!2002 (List!27403) Bool)

(assert (=> b!1243954 (= res!829738 (noDuplicate!2002 lt!562529))))

(declare-fun b!1243955 () Bool)

(assert (=> b!1243955 (= e!705073 false)))

(declare-fun lt!562527 () Bool)

(assert (=> b!1243955 (= lt!562527 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562529))))

(declare-datatypes ((Unit!41309 0))(
  ( (Unit!41310) )
))
(declare-fun lt!562528 () Unit!41309)

(declare-fun noDuplicateSubseq!104 (List!27403 List!27403) Unit!41309)

(assert (=> b!1243955 (= lt!562528 (noDuplicateSubseq!104 Nil!27400 lt!562529))))

(declare-fun b!1243956 () Bool)

(declare-fun res!829737 () Bool)

(assert (=> b!1243956 (=> (not res!829737) (not e!705073))))

(assert (=> b!1243956 (= res!829737 (not (contains!7424 Nil!27400 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243957 () Bool)

(declare-fun res!829729 () Bool)

(assert (=> b!1243957 (=> (not res!829729) (not e!705073))))

(assert (=> b!1243957 (= res!829729 (not (contains!7424 lt!562529 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243958 () Bool)

(declare-fun res!829733 () Bool)

(assert (=> b!1243958 (=> (not res!829733) (not e!705073))))

(assert (=> b!1243958 (= res!829733 (not (contains!7424 Nil!27400 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243960 () Bool)

(declare-fun res!829736 () Bool)

(assert (=> b!1243960 (=> (not res!829736) (not e!705073))))

(declare-fun subseq!650 (List!27403 List!27403) Bool)

(assert (=> b!1243960 (= res!829736 (subseq!650 Nil!27400 lt!562529))))

(declare-fun b!1243961 () Bool)

(declare-fun res!829734 () Bool)

(assert (=> b!1243961 (=> (not res!829734) (not e!705075))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243961 (= res!829734 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39136 a!3892)) (not (= newFrom!287 (size!39136 a!3892)))))))

(declare-fun b!1243959 () Bool)

(assert (=> b!1243959 (= e!705075 e!705073)))

(declare-fun res!829731 () Bool)

(assert (=> b!1243959 (=> (not res!829731) (not e!705073))))

(assert (=> b!1243959 (= res!829731 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243959 (= lt!562529 (Cons!27399 (select (arr!38600 a!3892) from!3270) Nil!27400))))

(declare-fun res!829730 () Bool)

(assert (=> start!103922 (=> (not res!829730) (not e!705075))))

(assert (=> start!103922 (= res!829730 (and (bvslt (size!39136 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39136 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39136 a!3892))))))

(assert (=> start!103922 e!705075))

(declare-fun array_inv!29448 (array!80014) Bool)

(assert (=> start!103922 (array_inv!29448 a!3892)))

(assert (=> start!103922 true))

(assert (= (and start!103922 res!829730) b!1243951))

(assert (= (and b!1243951 res!829732) b!1243961))

(assert (= (and b!1243961 res!829734) b!1243952))

(assert (= (and b!1243952 res!829735) b!1243959))

(assert (= (and b!1243959 res!829731) b!1243954))

(assert (= (and b!1243954 res!829738) b!1243957))

(assert (= (and b!1243957 res!829729) b!1243953))

(assert (= (and b!1243953 res!829728) b!1243958))

(assert (= (and b!1243958 res!829733) b!1243956))

(assert (= (and b!1243956 res!829737) b!1243960))

(assert (= (and b!1243960 res!829736) b!1243955))

(declare-fun m!1146371 () Bool)

(assert (=> b!1243955 m!1146371))

(declare-fun m!1146373 () Bool)

(assert (=> b!1243955 m!1146373))

(declare-fun m!1146375 () Bool)

(assert (=> b!1243960 m!1146375))

(declare-fun m!1146377 () Bool)

(assert (=> b!1243956 m!1146377))

(declare-fun m!1146379 () Bool)

(assert (=> b!1243958 m!1146379))

(declare-fun m!1146381 () Bool)

(assert (=> b!1243953 m!1146381))

(declare-fun m!1146383 () Bool)

(assert (=> b!1243952 m!1146383))

(assert (=> b!1243952 m!1146383))

(declare-fun m!1146385 () Bool)

(assert (=> b!1243952 m!1146385))

(declare-fun m!1146387 () Bool)

(assert (=> b!1243954 m!1146387))

(declare-fun m!1146389 () Bool)

(assert (=> start!103922 m!1146389))

(declare-fun m!1146391 () Bool)

(assert (=> b!1243957 m!1146391))

(assert (=> b!1243959 m!1146383))

(declare-fun m!1146393 () Bool)

(assert (=> b!1243951 m!1146393))

(push 1)

(assert (not b!1243952))

(assert (not b!1243951))

(assert (not b!1243954))

(assert (not b!1243955))

(assert (not b!1243956))

(assert (not b!1243957))

(assert (not b!1243958))

(assert (not start!103922))

(assert (not b!1243953))

(assert (not b!1243960))

(check-sat)

(pop 1)

