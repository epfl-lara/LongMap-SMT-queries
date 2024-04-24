; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104134 () Bool)

(assert start!104134)

(declare-fun b!1244879 () Bool)

(declare-fun res!829869 () Bool)

(declare-fun e!705828 () Bool)

(assert (=> b!1244879 (=> (not res!829869) (not e!705828))))

(declare-datatypes ((array!80025 0))(
  ( (array!80026 (arr!38600 (Array (_ BitVec 32) (_ BitVec 64))) (size!39137 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80025)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27416 0))(
  ( (Nil!27413) (Cons!27412 (h!28630 (_ BitVec 64)) (t!40877 List!27416)) )
))
(declare-fun arrayNoDuplicates!0 (array!80025 (_ BitVec 32) List!27416) Bool)

(assert (=> b!1244879 (= res!829869 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27413))))

(declare-fun b!1244880 () Bool)

(declare-fun res!829870 () Bool)

(declare-fun e!705829 () Bool)

(assert (=> b!1244880 (=> (not res!829870) (not e!705829))))

(declare-fun lt!562906 () List!27416)

(declare-fun contains!7446 (List!27416 (_ BitVec 64)) Bool)

(assert (=> b!1244880 (= res!829870 (not (contains!7446 lt!562906 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244881 () Bool)

(declare-fun res!829874 () Bool)

(assert (=> b!1244881 (=> (not res!829874) (not e!705828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244881 (= res!829874 (validKeyInArray!0 (select (arr!38600 a!3892) from!3270)))))

(declare-fun b!1244882 () Bool)

(declare-fun res!829871 () Bool)

(assert (=> b!1244882 (=> (not res!829871) (not e!705829))))

(declare-fun noDuplicate!2008 (List!27416) Bool)

(assert (=> b!1244882 (= res!829871 (noDuplicate!2008 lt!562906))))

(declare-fun b!1244883 () Bool)

(declare-fun res!829873 () Bool)

(assert (=> b!1244883 (=> (not res!829873) (not e!705829))))

(assert (=> b!1244883 (= res!829873 (not (contains!7446 lt!562906 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244884 () Bool)

(assert (=> b!1244884 (= e!705828 e!705829)))

(declare-fun res!829868 () Bool)

(assert (=> b!1244884 (=> (not res!829868) (not e!705829))))

(assert (=> b!1244884 (= res!829868 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244884 (= lt!562906 (Cons!27412 (select (arr!38600 a!3892) from!3270) Nil!27413))))

(declare-fun b!1244885 () Bool)

(declare-fun res!829867 () Bool)

(assert (=> b!1244885 (=> (not res!829867) (not e!705829))))

(declare-fun subseq!638 (List!27416 List!27416) Bool)

(assert (=> b!1244885 (= res!829867 (subseq!638 Nil!27413 lt!562906))))

(declare-fun res!829872 () Bool)

(assert (=> start!104134 (=> (not res!829872) (not e!705828))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104134 (= res!829872 (and (bvslt (size!39137 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39137 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39137 a!3892))))))

(assert (=> start!104134 e!705828))

(declare-fun array_inv!29538 (array!80025) Bool)

(assert (=> start!104134 (array_inv!29538 a!3892)))

(assert (=> start!104134 true))

(declare-fun b!1244886 () Bool)

(declare-fun res!829865 () Bool)

(assert (=> b!1244886 (=> (not res!829865) (not e!705829))))

(assert (=> b!1244886 (= res!829865 (not (contains!7446 Nil!27413 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244887 () Bool)

(declare-fun res!829875 () Bool)

(assert (=> b!1244887 (=> (not res!829875) (not e!705828))))

(assert (=> b!1244887 (= res!829875 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39137 a!3892)) (not (= newFrom!287 (size!39137 a!3892)))))))

(declare-fun b!1244888 () Bool)

(declare-fun res!829866 () Bool)

(assert (=> b!1244888 (=> (not res!829866) (not e!705829))))

(assert (=> b!1244888 (= res!829866 (not (contains!7446 Nil!27413 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244889 () Bool)

(assert (=> b!1244889 (= e!705829 false)))

(declare-fun lt!562907 () Bool)

(assert (=> b!1244889 (= lt!562907 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562906))))

(declare-datatypes ((Unit!41258 0))(
  ( (Unit!41259) )
))
(declare-fun lt!562905 () Unit!41258)

(declare-fun noDuplicateSubseq!92 (List!27416 List!27416) Unit!41258)

(assert (=> b!1244889 (= lt!562905 (noDuplicateSubseq!92 Nil!27413 lt!562906))))

(assert (= (and start!104134 res!829872) b!1244879))

(assert (= (and b!1244879 res!829869) b!1244887))

(assert (= (and b!1244887 res!829875) b!1244881))

(assert (= (and b!1244881 res!829874) b!1244884))

(assert (= (and b!1244884 res!829868) b!1244882))

(assert (= (and b!1244882 res!829871) b!1244880))

(assert (= (and b!1244880 res!829870) b!1244883))

(assert (= (and b!1244883 res!829873) b!1244888))

(assert (= (and b!1244888 res!829866) b!1244886))

(assert (= (and b!1244886 res!829865) b!1244885))

(assert (= (and b!1244885 res!829867) b!1244889))

(declare-fun m!1147723 () Bool)

(assert (=> b!1244881 m!1147723))

(assert (=> b!1244881 m!1147723))

(declare-fun m!1147725 () Bool)

(assert (=> b!1244881 m!1147725))

(declare-fun m!1147727 () Bool)

(assert (=> b!1244883 m!1147727))

(declare-fun m!1147729 () Bool)

(assert (=> start!104134 m!1147729))

(declare-fun m!1147731 () Bool)

(assert (=> b!1244888 m!1147731))

(declare-fun m!1147733 () Bool)

(assert (=> b!1244886 m!1147733))

(declare-fun m!1147735 () Bool)

(assert (=> b!1244889 m!1147735))

(declare-fun m!1147737 () Bool)

(assert (=> b!1244889 m!1147737))

(declare-fun m!1147739 () Bool)

(assert (=> b!1244885 m!1147739))

(declare-fun m!1147741 () Bool)

(assert (=> b!1244879 m!1147741))

(declare-fun m!1147743 () Bool)

(assert (=> b!1244882 m!1147743))

(assert (=> b!1244884 m!1147723))

(declare-fun m!1147745 () Bool)

(assert (=> b!1244880 m!1147745))

(check-sat (not start!104134) (not b!1244889) (not b!1244879) (not b!1244883) (not b!1244886) (not b!1244885) (not b!1244881) (not b!1244882) (not b!1244880) (not b!1244888))
(check-sat)
