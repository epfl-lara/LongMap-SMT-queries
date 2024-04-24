; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115684 () Bool)

(assert start!115684)

(declare-fun b!1366892 () Bool)

(declare-fun res!909694 () Bool)

(declare-fun e!775090 () Bool)

(assert (=> b!1366892 (=> (not res!909694) (not e!775090))))

(declare-datatypes ((List!31927 0))(
  ( (Nil!31924) (Cons!31923 (h!33141 (_ BitVec 64)) (t!46613 List!31927)) )
))
(declare-fun lt!601807 () List!31927)

(declare-fun noDuplicate!2443 (List!31927) Bool)

(assert (=> b!1366892 (= res!909694 (noDuplicate!2443 lt!601807))))

(declare-fun b!1366893 () Bool)

(declare-fun res!909686 () Bool)

(declare-fun e!775088 () Bool)

(assert (=> b!1366893 (=> (not res!909686) (not e!775088))))

(declare-fun newAcc!98 () List!31927)

(declare-fun acc!866 () List!31927)

(declare-fun subseq!971 (List!31927 List!31927) Bool)

(assert (=> b!1366893 (= res!909686 (subseq!971 newAcc!98 acc!866))))

(declare-fun b!1366894 () Bool)

(declare-fun res!909692 () Bool)

(assert (=> b!1366894 (=> (not res!909692) (not e!775090))))

(declare-fun lt!601805 () List!31927)

(assert (=> b!1366894 (= res!909692 (subseq!971 lt!601805 lt!601807))))

(declare-fun res!909698 () Bool)

(assert (=> start!115684 (=> (not res!909698) (not e!775088))))

(declare-datatypes ((array!92896 0))(
  ( (array!92897 (arr!44872 (Array (_ BitVec 32) (_ BitVec 64))) (size!45423 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92896)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115684 (= res!909698 (and (bvslt (size!45423 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45423 a!3861))))))

(assert (=> start!115684 e!775088))

(declare-fun array_inv!34153 (array!92896) Bool)

(assert (=> start!115684 (array_inv!34153 a!3861)))

(assert (=> start!115684 true))

(declare-fun b!1366895 () Bool)

(declare-fun res!909696 () Bool)

(assert (=> b!1366895 (=> (not res!909696) (not e!775088))))

(declare-fun contains!9612 (List!31927 (_ BitVec 64)) Bool)

(assert (=> b!1366895 (= res!909696 (not (contains!9612 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366896 () Bool)

(declare-fun res!909699 () Bool)

(assert (=> b!1366896 (=> (not res!909699) (not e!775088))))

(assert (=> b!1366896 (= res!909699 (not (contains!9612 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366897 () Bool)

(declare-fun res!909697 () Bool)

(declare-fun e!775089 () Bool)

(assert (=> b!1366897 (=> (not res!909697) (not e!775089))))

(assert (=> b!1366897 (= res!909697 (bvslt from!3239 (size!45423 a!3861)))))

(declare-fun b!1366898 () Bool)

(declare-fun res!909687 () Bool)

(assert (=> b!1366898 (=> (not res!909687) (not e!775089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366898 (= res!909687 (validKeyInArray!0 (select (arr!44872 a!3861) from!3239)))))

(declare-fun b!1366899 () Bool)

(declare-fun res!909695 () Bool)

(assert (=> b!1366899 (=> (not res!909695) (not e!775090))))

(assert (=> b!1366899 (= res!909695 (not (contains!9612 lt!601807 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366900 () Bool)

(assert (=> b!1366900 (= e!775090 false)))

(declare-fun lt!601808 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92896 (_ BitVec 32) List!31927) Bool)

(assert (=> b!1366900 (= lt!601808 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601807))))

(declare-datatypes ((Unit!45014 0))(
  ( (Unit!45015) )
))
(declare-fun lt!601809 () Unit!45014)

(declare-fun noDuplicateSubseq!158 (List!31927 List!31927) Unit!45014)

(assert (=> b!1366900 (= lt!601809 (noDuplicateSubseq!158 lt!601805 lt!601807))))

(declare-fun b!1366901 () Bool)

(declare-fun res!909693 () Bool)

(assert (=> b!1366901 (=> (not res!909693) (not e!775090))))

(assert (=> b!1366901 (= res!909693 (not (contains!9612 lt!601805 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366902 () Bool)

(declare-fun res!909685 () Bool)

(assert (=> b!1366902 (=> (not res!909685) (not e!775088))))

(assert (=> b!1366902 (= res!909685 (not (contains!9612 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366903 () Bool)

(declare-fun res!909702 () Bool)

(assert (=> b!1366903 (=> (not res!909702) (not e!775090))))

(assert (=> b!1366903 (= res!909702 (not (contains!9612 lt!601807 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366904 () Bool)

(declare-fun res!909689 () Bool)

(assert (=> b!1366904 (=> (not res!909689) (not e!775088))))

(assert (=> b!1366904 (= res!909689 (noDuplicate!2443 acc!866))))

(declare-fun b!1366905 () Bool)

(declare-fun res!909691 () Bool)

(assert (=> b!1366905 (=> (not res!909691) (not e!775089))))

(assert (=> b!1366905 (= res!909691 (not (contains!9612 acc!866 (select (arr!44872 a!3861) from!3239))))))

(declare-fun b!1366906 () Bool)

(declare-fun res!909688 () Bool)

(assert (=> b!1366906 (=> (not res!909688) (not e!775090))))

(assert (=> b!1366906 (= res!909688 (not (contains!9612 lt!601805 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366907 () Bool)

(assert (=> b!1366907 (= e!775089 e!775090)))

(declare-fun res!909700 () Bool)

(assert (=> b!1366907 (=> (not res!909700) (not e!775090))))

(assert (=> b!1366907 (= res!909700 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366907 (= lt!601805 (Cons!31923 (select (arr!44872 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366907 (= lt!601807 (Cons!31923 (select (arr!44872 a!3861) from!3239) acc!866))))

(declare-fun b!1366908 () Bool)

(assert (=> b!1366908 (= e!775088 e!775089)))

(declare-fun res!909701 () Bool)

(assert (=> b!1366908 (=> (not res!909701) (not e!775089))))

(assert (=> b!1366908 (= res!909701 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601806 () Unit!45014)

(assert (=> b!1366908 (= lt!601806 (noDuplicateSubseq!158 newAcc!98 acc!866))))

(declare-fun b!1366909 () Bool)

(declare-fun res!909690 () Bool)

(assert (=> b!1366909 (=> (not res!909690) (not e!775088))))

(assert (=> b!1366909 (= res!909690 (not (contains!9612 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115684 res!909698) b!1366904))

(assert (= (and b!1366904 res!909689) b!1366896))

(assert (= (and b!1366896 res!909699) b!1366902))

(assert (= (and b!1366902 res!909685) b!1366895))

(assert (= (and b!1366895 res!909696) b!1366909))

(assert (= (and b!1366909 res!909690) b!1366893))

(assert (= (and b!1366893 res!909686) b!1366908))

(assert (= (and b!1366908 res!909701) b!1366897))

(assert (= (and b!1366897 res!909697) b!1366898))

(assert (= (and b!1366898 res!909687) b!1366905))

(assert (= (and b!1366905 res!909691) b!1366907))

(assert (= (and b!1366907 res!909700) b!1366892))

(assert (= (and b!1366892 res!909694) b!1366899))

(assert (= (and b!1366899 res!909695) b!1366903))

(assert (= (and b!1366903 res!909702) b!1366906))

(assert (= (and b!1366906 res!909688) b!1366901))

(assert (= (and b!1366901 res!909693) b!1366894))

(assert (= (and b!1366894 res!909692) b!1366900))

(declare-fun m!1251697 () Bool)

(assert (=> b!1366898 m!1251697))

(assert (=> b!1366898 m!1251697))

(declare-fun m!1251699 () Bool)

(assert (=> b!1366898 m!1251699))

(assert (=> b!1366905 m!1251697))

(assert (=> b!1366905 m!1251697))

(declare-fun m!1251701 () Bool)

(assert (=> b!1366905 m!1251701))

(declare-fun m!1251703 () Bool)

(assert (=> b!1366901 m!1251703))

(declare-fun m!1251705 () Bool)

(assert (=> b!1366903 m!1251705))

(declare-fun m!1251707 () Bool)

(assert (=> start!115684 m!1251707))

(declare-fun m!1251709 () Bool)

(assert (=> b!1366893 m!1251709))

(declare-fun m!1251711 () Bool)

(assert (=> b!1366899 m!1251711))

(declare-fun m!1251713 () Bool)

(assert (=> b!1366894 m!1251713))

(declare-fun m!1251715 () Bool)

(assert (=> b!1366892 m!1251715))

(declare-fun m!1251717 () Bool)

(assert (=> b!1366908 m!1251717))

(declare-fun m!1251719 () Bool)

(assert (=> b!1366908 m!1251719))

(declare-fun m!1251721 () Bool)

(assert (=> b!1366906 m!1251721))

(declare-fun m!1251723 () Bool)

(assert (=> b!1366896 m!1251723))

(declare-fun m!1251725 () Bool)

(assert (=> b!1366909 m!1251725))

(assert (=> b!1366907 m!1251697))

(declare-fun m!1251727 () Bool)

(assert (=> b!1366904 m!1251727))

(declare-fun m!1251729 () Bool)

(assert (=> b!1366902 m!1251729))

(declare-fun m!1251731 () Bool)

(assert (=> b!1366900 m!1251731))

(declare-fun m!1251733 () Bool)

(assert (=> b!1366900 m!1251733))

(declare-fun m!1251735 () Bool)

(assert (=> b!1366895 m!1251735))

(check-sat (not b!1366892) (not b!1366906) (not b!1366908) (not b!1366900) (not b!1366893) (not b!1366902) (not b!1366904) (not b!1366896) (not b!1366909) (not b!1366903) (not b!1366894) (not b!1366895) (not b!1366898) (not b!1366899) (not b!1366901) (not start!115684) (not b!1366905))
(check-sat)
