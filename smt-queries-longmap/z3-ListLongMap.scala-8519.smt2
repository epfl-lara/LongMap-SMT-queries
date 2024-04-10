; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103912 () Bool)

(assert start!103912)

(declare-fun b!1243786 () Bool)

(declare-fun res!829569 () Bool)

(declare-fun e!705030 () Bool)

(assert (=> b!1243786 (=> (not res!829569) (not e!705030))))

(declare-datatypes ((List!27398 0))(
  ( (Nil!27395) (Cons!27394 (h!28603 (_ BitVec 64)) (t!40867 List!27398)) )
))
(declare-fun contains!7419 (List!27398 (_ BitVec 64)) Bool)

(assert (=> b!1243786 (= res!829569 (not (contains!7419 Nil!27395 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243787 () Bool)

(declare-fun res!829566 () Bool)

(declare-fun e!705028 () Bool)

(assert (=> b!1243787 (=> (not res!829566) (not e!705028))))

(declare-datatypes ((array!80004 0))(
  ( (array!80005 (arr!38595 (Array (_ BitVec 32) (_ BitVec 64))) (size!39131 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80004)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243787 (= res!829566 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39131 a!3892)) (not (= newFrom!287 (size!39131 a!3892)))))))

(declare-fun b!1243788 () Bool)

(assert (=> b!1243788 (= e!705030 false)))

(declare-fun lt!562483 () List!27398)

(declare-fun lt!562482 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80004 (_ BitVec 32) List!27398) Bool)

(assert (=> b!1243788 (= lt!562482 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562483))))

(declare-datatypes ((Unit!41299 0))(
  ( (Unit!41300) )
))
(declare-fun lt!562484 () Unit!41299)

(declare-fun noDuplicateSubseq!99 (List!27398 List!27398) Unit!41299)

(assert (=> b!1243788 (= lt!562484 (noDuplicateSubseq!99 Nil!27395 lt!562483))))

(declare-fun b!1243789 () Bool)

(declare-fun res!829567 () Bool)

(assert (=> b!1243789 (=> (not res!829567) (not e!705028))))

(assert (=> b!1243789 (= res!829567 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27395))))

(declare-fun b!1243790 () Bool)

(declare-fun res!829565 () Bool)

(assert (=> b!1243790 (=> (not res!829565) (not e!705030))))

(assert (=> b!1243790 (= res!829565 (not (contains!7419 lt!562483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243791 () Bool)

(declare-fun res!829572 () Bool)

(assert (=> b!1243791 (=> (not res!829572) (not e!705030))))

(declare-fun subseq!645 (List!27398 List!27398) Bool)

(assert (=> b!1243791 (= res!829572 (subseq!645 Nil!27395 lt!562483))))

(declare-fun b!1243792 () Bool)

(declare-fun res!829573 () Bool)

(assert (=> b!1243792 (=> (not res!829573) (not e!705030))))

(declare-fun noDuplicate!1997 (List!27398) Bool)

(assert (=> b!1243792 (= res!829573 (noDuplicate!1997 lt!562483))))

(declare-fun b!1243793 () Bool)

(declare-fun res!829570 () Bool)

(assert (=> b!1243793 (=> (not res!829570) (not e!705030))))

(assert (=> b!1243793 (= res!829570 (not (contains!7419 Nil!27395 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829564 () Bool)

(assert (=> start!103912 (=> (not res!829564) (not e!705028))))

(assert (=> start!103912 (= res!829564 (and (bvslt (size!39131 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39131 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39131 a!3892))))))

(assert (=> start!103912 e!705028))

(declare-fun array_inv!29443 (array!80004) Bool)

(assert (=> start!103912 (array_inv!29443 a!3892)))

(assert (=> start!103912 true))

(declare-fun b!1243794 () Bool)

(declare-fun res!829571 () Bool)

(assert (=> b!1243794 (=> (not res!829571) (not e!705028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243794 (= res!829571 (validKeyInArray!0 (select (arr!38595 a!3892) from!3270)))))

(declare-fun b!1243795 () Bool)

(declare-fun res!829568 () Bool)

(assert (=> b!1243795 (=> (not res!829568) (not e!705030))))

(assert (=> b!1243795 (= res!829568 (not (contains!7419 lt!562483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243796 () Bool)

(assert (=> b!1243796 (= e!705028 e!705030)))

(declare-fun res!829563 () Bool)

(assert (=> b!1243796 (=> (not res!829563) (not e!705030))))

(assert (=> b!1243796 (= res!829563 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243796 (= lt!562483 (Cons!27394 (select (arr!38595 a!3892) from!3270) Nil!27395))))

(assert (= (and start!103912 res!829564) b!1243789))

(assert (= (and b!1243789 res!829567) b!1243787))

(assert (= (and b!1243787 res!829566) b!1243794))

(assert (= (and b!1243794 res!829571) b!1243796))

(assert (= (and b!1243796 res!829563) b!1243792))

(assert (= (and b!1243792 res!829573) b!1243790))

(assert (= (and b!1243790 res!829565) b!1243795))

(assert (= (and b!1243795 res!829568) b!1243786))

(assert (= (and b!1243786 res!829569) b!1243793))

(assert (= (and b!1243793 res!829570) b!1243791))

(assert (= (and b!1243791 res!829572) b!1243788))

(declare-fun m!1146251 () Bool)

(assert (=> b!1243788 m!1146251))

(declare-fun m!1146253 () Bool)

(assert (=> b!1243788 m!1146253))

(declare-fun m!1146255 () Bool)

(assert (=> b!1243790 m!1146255))

(declare-fun m!1146257 () Bool)

(assert (=> b!1243794 m!1146257))

(assert (=> b!1243794 m!1146257))

(declare-fun m!1146259 () Bool)

(assert (=> b!1243794 m!1146259))

(declare-fun m!1146261 () Bool)

(assert (=> b!1243789 m!1146261))

(declare-fun m!1146263 () Bool)

(assert (=> b!1243786 m!1146263))

(declare-fun m!1146265 () Bool)

(assert (=> b!1243793 m!1146265))

(declare-fun m!1146267 () Bool)

(assert (=> b!1243795 m!1146267))

(declare-fun m!1146269 () Bool)

(assert (=> b!1243791 m!1146269))

(declare-fun m!1146271 () Bool)

(assert (=> b!1243792 m!1146271))

(assert (=> b!1243796 m!1146257))

(declare-fun m!1146273 () Bool)

(assert (=> start!103912 m!1146273))

(check-sat (not b!1243792) (not b!1243793) (not start!103912) (not b!1243791) (not b!1243794) (not b!1243789) (not b!1243788) (not b!1243790) (not b!1243795) (not b!1243786))
(check-sat)
