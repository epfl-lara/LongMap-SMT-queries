; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103910 () Bool)

(assert start!103910)

(declare-fun b!1243770 () Bool)

(declare-fun res!829589 () Bool)

(declare-fun e!705001 () Bool)

(assert (=> b!1243770 (=> (not res!829589) (not e!705001))))

(declare-datatypes ((List!27462 0))(
  ( (Nil!27459) (Cons!27458 (h!28667 (_ BitVec 64)) (t!40922 List!27462)) )
))
(declare-fun lt!562323 () List!27462)

(declare-fun contains!7392 (List!27462 (_ BitVec 64)) Bool)

(assert (=> b!1243770 (= res!829589 (not (contains!7392 lt!562323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243771 () Bool)

(declare-fun res!829599 () Bool)

(assert (=> b!1243771 (=> (not res!829599) (not e!705001))))

(assert (=> b!1243771 (= res!829599 (not (contains!7392 lt!562323 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243772 () Bool)

(declare-fun res!829595 () Bool)

(assert (=> b!1243772 (=> (not res!829595) (not e!705001))))

(assert (=> b!1243772 (= res!829595 (not (contains!7392 Nil!27459 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243773 () Bool)

(declare-fun res!829594 () Bool)

(declare-fun e!705002 () Bool)

(assert (=> b!1243773 (=> (not res!829594) (not e!705002))))

(declare-datatypes ((array!79928 0))(
  ( (array!79929 (arr!38558 (Array (_ BitVec 32) (_ BitVec 64))) (size!39096 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79928)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79928 (_ BitVec 32) List!27462) Bool)

(assert (=> b!1243773 (= res!829594 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27459))))

(declare-fun res!829596 () Bool)

(assert (=> start!103910 (=> (not res!829596) (not e!705002))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103910 (= res!829596 (and (bvslt (size!39096 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39096 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39096 a!3892))))))

(assert (=> start!103910 e!705002))

(declare-fun array_inv!29541 (array!79928) Bool)

(assert (=> start!103910 (array_inv!29541 a!3892)))

(assert (=> start!103910 true))

(declare-fun b!1243774 () Bool)

(assert (=> b!1243774 (= e!705002 e!705001)))

(declare-fun res!829593 () Bool)

(assert (=> b!1243774 (=> (not res!829593) (not e!705001))))

(assert (=> b!1243774 (= res!829593 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243774 (= lt!562323 (Cons!27458 (select (arr!38558 a!3892) from!3270) Nil!27459))))

(declare-fun b!1243775 () Bool)

(declare-fun res!829590 () Bool)

(assert (=> b!1243775 (=> (not res!829590) (not e!705001))))

(assert (=> b!1243775 (= res!829590 (not (contains!7392 Nil!27459 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243776 () Bool)

(declare-fun res!829592 () Bool)

(assert (=> b!1243776 (=> (not res!829592) (not e!705002))))

(assert (=> b!1243776 (= res!829592 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39096 a!3892)) (not (= newFrom!287 (size!39096 a!3892)))))))

(declare-fun b!1243777 () Bool)

(assert (=> b!1243777 (= e!705001 false)))

(declare-fun lt!562322 () Bool)

(assert (=> b!1243777 (= lt!562322 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562323))))

(declare-datatypes ((Unit!41148 0))(
  ( (Unit!41149) )
))
(declare-fun lt!562321 () Unit!41148)

(declare-fun noDuplicateSubseq!101 (List!27462 List!27462) Unit!41148)

(assert (=> b!1243777 (= lt!562321 (noDuplicateSubseq!101 Nil!27459 lt!562323))))

(declare-fun b!1243778 () Bool)

(declare-fun res!829598 () Bool)

(assert (=> b!1243778 (=> (not res!829598) (not e!705001))))

(declare-fun noDuplicate!2017 (List!27462) Bool)

(assert (=> b!1243778 (= res!829598 (noDuplicate!2017 lt!562323))))

(declare-fun b!1243779 () Bool)

(declare-fun res!829597 () Bool)

(assert (=> b!1243779 (=> (not res!829597) (not e!705002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243779 (= res!829597 (validKeyInArray!0 (select (arr!38558 a!3892) from!3270)))))

(declare-fun b!1243780 () Bool)

(declare-fun res!829591 () Bool)

(assert (=> b!1243780 (=> (not res!829591) (not e!705001))))

(declare-fun subseq!647 (List!27462 List!27462) Bool)

(assert (=> b!1243780 (= res!829591 (subseq!647 Nil!27459 lt!562323))))

(assert (= (and start!103910 res!829596) b!1243773))

(assert (= (and b!1243773 res!829594) b!1243776))

(assert (= (and b!1243776 res!829592) b!1243779))

(assert (= (and b!1243779 res!829597) b!1243774))

(assert (= (and b!1243774 res!829593) b!1243778))

(assert (= (and b!1243778 res!829598) b!1243770))

(assert (= (and b!1243770 res!829589) b!1243771))

(assert (= (and b!1243771 res!829599) b!1243772))

(assert (= (and b!1243772 res!829595) b!1243775))

(assert (= (and b!1243775 res!829590) b!1243780))

(assert (= (and b!1243780 res!829591) b!1243777))

(declare-fun m!1145769 () Bool)

(assert (=> b!1243772 m!1145769))

(declare-fun m!1145771 () Bool)

(assert (=> b!1243777 m!1145771))

(declare-fun m!1145773 () Bool)

(assert (=> b!1243777 m!1145773))

(declare-fun m!1145775 () Bool)

(assert (=> b!1243778 m!1145775))

(declare-fun m!1145777 () Bool)

(assert (=> b!1243775 m!1145777))

(declare-fun m!1145779 () Bool)

(assert (=> b!1243771 m!1145779))

(declare-fun m!1145781 () Bool)

(assert (=> b!1243780 m!1145781))

(declare-fun m!1145783 () Bool)

(assert (=> start!103910 m!1145783))

(declare-fun m!1145785 () Bool)

(assert (=> b!1243779 m!1145785))

(assert (=> b!1243779 m!1145785))

(declare-fun m!1145787 () Bool)

(assert (=> b!1243779 m!1145787))

(declare-fun m!1145789 () Bool)

(assert (=> b!1243773 m!1145789))

(declare-fun m!1145791 () Bool)

(assert (=> b!1243770 m!1145791))

(assert (=> b!1243774 m!1145785))

(check-sat (not b!1243779) (not b!1243773) (not b!1243770) (not b!1243775) (not b!1243780) (not start!103910) (not b!1243771) (not b!1243777) (not b!1243778) (not b!1243772))
(check-sat)
