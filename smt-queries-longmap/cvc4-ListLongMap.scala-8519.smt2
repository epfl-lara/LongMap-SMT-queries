; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103914 () Bool)

(assert start!103914)

(declare-fun b!1243819 () Bool)

(declare-fun res!829604 () Bool)

(declare-fun e!705038 () Bool)

(assert (=> b!1243819 (=> (not res!829604) (not e!705038))))

(declare-datatypes ((List!27399 0))(
  ( (Nil!27396) (Cons!27395 (h!28604 (_ BitVec 64)) (t!40868 List!27399)) )
))
(declare-fun contains!7420 (List!27399 (_ BitVec 64)) Bool)

(assert (=> b!1243819 (= res!829604 (not (contains!7420 Nil!27396 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243820 () Bool)

(declare-fun res!829606 () Bool)

(assert (=> b!1243820 (=> (not res!829606) (not e!705038))))

(declare-fun lt!562492 () List!27399)

(declare-fun subseq!646 (List!27399 List!27399) Bool)

(assert (=> b!1243820 (= res!829606 (subseq!646 Nil!27396 lt!562492))))

(declare-fun b!1243821 () Bool)

(declare-fun res!829599 () Bool)

(assert (=> b!1243821 (=> (not res!829599) (not e!705038))))

(assert (=> b!1243821 (= res!829599 (not (contains!7420 lt!562492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243822 () Bool)

(declare-fun res!829600 () Bool)

(assert (=> b!1243822 (=> (not res!829600) (not e!705038))))

(assert (=> b!1243822 (= res!829600 (not (contains!7420 Nil!27396 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243823 () Bool)

(declare-fun res!829596 () Bool)

(declare-fun e!705037 () Bool)

(assert (=> b!1243823 (=> (not res!829596) (not e!705037))))

(declare-datatypes ((array!80006 0))(
  ( (array!80007 (arr!38596 (Array (_ BitVec 32) (_ BitVec 64))) (size!39132 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80006)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243823 (= res!829596 (validKeyInArray!0 (select (arr!38596 a!3892) from!3270)))))

(declare-fun res!829602 () Bool)

(assert (=> start!103914 (=> (not res!829602) (not e!705037))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103914 (= res!829602 (and (bvslt (size!39132 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39132 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39132 a!3892))))))

(assert (=> start!103914 e!705037))

(declare-fun array_inv!29444 (array!80006) Bool)

(assert (=> start!103914 (array_inv!29444 a!3892)))

(assert (=> start!103914 true))

(declare-fun b!1243824 () Bool)

(declare-fun res!829598 () Bool)

(assert (=> b!1243824 (=> (not res!829598) (not e!705037))))

(assert (=> b!1243824 (= res!829598 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39132 a!3892)) (not (= newFrom!287 (size!39132 a!3892)))))))

(declare-fun b!1243825 () Bool)

(assert (=> b!1243825 (= e!705037 e!705038)))

(declare-fun res!829597 () Bool)

(assert (=> b!1243825 (=> (not res!829597) (not e!705038))))

(assert (=> b!1243825 (= res!829597 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243825 (= lt!562492 (Cons!27395 (select (arr!38596 a!3892) from!3270) Nil!27396))))

(declare-fun b!1243826 () Bool)

(declare-fun res!829605 () Bool)

(assert (=> b!1243826 (=> (not res!829605) (not e!705038))))

(declare-fun noDuplicate!1998 (List!27399) Bool)

(assert (=> b!1243826 (= res!829605 (noDuplicate!1998 lt!562492))))

(declare-fun b!1243827 () Bool)

(assert (=> b!1243827 (= e!705038 false)))

(declare-fun lt!562493 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80006 (_ BitVec 32) List!27399) Bool)

(assert (=> b!1243827 (= lt!562493 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562492))))

(declare-datatypes ((Unit!41301 0))(
  ( (Unit!41302) )
))
(declare-fun lt!562491 () Unit!41301)

(declare-fun noDuplicateSubseq!100 (List!27399 List!27399) Unit!41301)

(assert (=> b!1243827 (= lt!562491 (noDuplicateSubseq!100 Nil!27396 lt!562492))))

(declare-fun b!1243828 () Bool)

(declare-fun res!829601 () Bool)

(assert (=> b!1243828 (=> (not res!829601) (not e!705037))))

(assert (=> b!1243828 (= res!829601 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27396))))

(declare-fun b!1243829 () Bool)

(declare-fun res!829603 () Bool)

(assert (=> b!1243829 (=> (not res!829603) (not e!705038))))

(assert (=> b!1243829 (= res!829603 (not (contains!7420 lt!562492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103914 res!829602) b!1243828))

(assert (= (and b!1243828 res!829601) b!1243824))

(assert (= (and b!1243824 res!829598) b!1243823))

(assert (= (and b!1243823 res!829596) b!1243825))

(assert (= (and b!1243825 res!829597) b!1243826))

(assert (= (and b!1243826 res!829605) b!1243829))

(assert (= (and b!1243829 res!829603) b!1243821))

(assert (= (and b!1243821 res!829599) b!1243819))

(assert (= (and b!1243819 res!829604) b!1243822))

(assert (= (and b!1243822 res!829600) b!1243820))

(assert (= (and b!1243820 res!829606) b!1243827))

(declare-fun m!1146275 () Bool)

(assert (=> b!1243823 m!1146275))

(assert (=> b!1243823 m!1146275))

(declare-fun m!1146277 () Bool)

(assert (=> b!1243823 m!1146277))

(declare-fun m!1146279 () Bool)

(assert (=> b!1243821 m!1146279))

(declare-fun m!1146281 () Bool)

(assert (=> b!1243822 m!1146281))

(declare-fun m!1146283 () Bool)

(assert (=> b!1243827 m!1146283))

(declare-fun m!1146285 () Bool)

(assert (=> b!1243827 m!1146285))

(declare-fun m!1146287 () Bool)

(assert (=> b!1243819 m!1146287))

(declare-fun m!1146289 () Bool)

(assert (=> b!1243829 m!1146289))

(declare-fun m!1146291 () Bool)

(assert (=> b!1243826 m!1146291))

(declare-fun m!1146293 () Bool)

(assert (=> b!1243828 m!1146293))

(declare-fun m!1146295 () Bool)

(assert (=> b!1243820 m!1146295))

(assert (=> b!1243825 m!1146275))

(declare-fun m!1146297 () Bool)

(assert (=> start!103914 m!1146297))

(push 1)

(assert (not b!1243821))

(assert (not b!1243820))

(assert (not b!1243826))

(assert (not 