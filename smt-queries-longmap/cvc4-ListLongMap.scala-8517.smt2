; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103902 () Bool)

(assert start!103902)

(declare-fun b!1243621 () Bool)

(declare-fun res!829406 () Bool)

(declare-fun e!704985 () Bool)

(assert (=> b!1243621 (=> (not res!829406) (not e!704985))))

(declare-datatypes ((List!27393 0))(
  ( (Nil!27390) (Cons!27389 (h!28598 (_ BitVec 64)) (t!40862 List!27393)) )
))
(declare-fun lt!562439 () List!27393)

(declare-fun subseq!640 (List!27393 List!27393) Bool)

(assert (=> b!1243621 (= res!829406 (subseq!640 Nil!27390 lt!562439))))

(declare-fun b!1243622 () Bool)

(declare-fun e!704983 () Bool)

(assert (=> b!1243622 (= e!704983 e!704985)))

(declare-fun res!829402 () Bool)

(assert (=> b!1243622 (=> (not res!829402) (not e!704985))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243622 (= res!829402 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79994 0))(
  ( (array!79995 (arr!38590 (Array (_ BitVec 32) (_ BitVec 64))) (size!39126 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79994)

(assert (=> b!1243622 (= lt!562439 (Cons!27389 (select (arr!38590 a!3892) from!3270) Nil!27390))))

(declare-fun b!1243623 () Bool)

(assert (=> b!1243623 (= e!704985 false)))

(declare-fun lt!562437 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79994 (_ BitVec 32) List!27393) Bool)

(assert (=> b!1243623 (= lt!562437 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562439))))

(declare-datatypes ((Unit!41289 0))(
  ( (Unit!41290) )
))
(declare-fun lt!562438 () Unit!41289)

(declare-fun noDuplicateSubseq!94 (List!27393 List!27393) Unit!41289)

(assert (=> b!1243623 (= lt!562438 (noDuplicateSubseq!94 Nil!27390 lt!562439))))

(declare-fun res!829398 () Bool)

(assert (=> start!103902 (=> (not res!829398) (not e!704983))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103902 (= res!829398 (and (bvslt (size!39126 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39126 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39126 a!3892))))))

(assert (=> start!103902 e!704983))

(declare-fun array_inv!29438 (array!79994) Bool)

(assert (=> start!103902 (array_inv!29438 a!3892)))

(assert (=> start!103902 true))

(declare-fun b!1243624 () Bool)

(declare-fun res!829400 () Bool)

(assert (=> b!1243624 (=> (not res!829400) (not e!704985))))

(declare-fun contains!7414 (List!27393 (_ BitVec 64)) Bool)

(assert (=> b!1243624 (= res!829400 (not (contains!7414 lt!562439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243625 () Bool)

(declare-fun res!829399 () Bool)

(assert (=> b!1243625 (=> (not res!829399) (not e!704985))))

(assert (=> b!1243625 (= res!829399 (not (contains!7414 Nil!27390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243626 () Bool)

(declare-fun res!829408 () Bool)

(assert (=> b!1243626 (=> (not res!829408) (not e!704983))))

(assert (=> b!1243626 (= res!829408 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27390))))

(declare-fun b!1243627 () Bool)

(declare-fun res!829403 () Bool)

(assert (=> b!1243627 (=> (not res!829403) (not e!704983))))

(assert (=> b!1243627 (= res!829403 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39126 a!3892)) (not (= newFrom!287 (size!39126 a!3892)))))))

(declare-fun b!1243628 () Bool)

(declare-fun res!829404 () Bool)

(assert (=> b!1243628 (=> (not res!829404) (not e!704985))))

(assert (=> b!1243628 (= res!829404 (not (contains!7414 lt!562439 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243629 () Bool)

(declare-fun res!829401 () Bool)

(assert (=> b!1243629 (=> (not res!829401) (not e!704985))))

(declare-fun noDuplicate!1992 (List!27393) Bool)

(assert (=> b!1243629 (= res!829401 (noDuplicate!1992 lt!562439))))

(declare-fun b!1243630 () Bool)

(declare-fun res!829407 () Bool)

(assert (=> b!1243630 (=> (not res!829407) (not e!704983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243630 (= res!829407 (validKeyInArray!0 (select (arr!38590 a!3892) from!3270)))))

(declare-fun b!1243631 () Bool)

(declare-fun res!829405 () Bool)

(assert (=> b!1243631 (=> (not res!829405) (not e!704985))))

(assert (=> b!1243631 (= res!829405 (not (contains!7414 Nil!27390 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103902 res!829398) b!1243626))

(assert (= (and b!1243626 res!829408) b!1243627))

(assert (= (and b!1243627 res!829403) b!1243630))

(assert (= (and b!1243630 res!829407) b!1243622))

(assert (= (and b!1243622 res!829402) b!1243629))

(assert (= (and b!1243629 res!829401) b!1243624))

(assert (= (and b!1243624 res!829400) b!1243628))

(assert (= (and b!1243628 res!829404) b!1243625))

(assert (= (and b!1243625 res!829399) b!1243631))

(assert (= (and b!1243631 res!829405) b!1243621))

(assert (= (and b!1243621 res!829406) b!1243623))

(declare-fun m!1146131 () Bool)

(assert (=> start!103902 m!1146131))

(declare-fun m!1146133 () Bool)

(assert (=> b!1243629 m!1146133))

(declare-fun m!1146135 () Bool)

(assert (=> b!1243625 m!1146135))

(declare-fun m!1146137 () Bool)

(assert (=> b!1243626 m!1146137))

(declare-fun m!1146139 () Bool)

(assert (=> b!1243624 m!1146139))

(declare-fun m!1146141 () Bool)

(assert (=> b!1243631 m!1146141))

(declare-fun m!1146143 () Bool)

(assert (=> b!1243630 m!1146143))

(assert (=> b!1243630 m!1146143))

(declare-fun m!1146145 () Bool)

(assert (=> b!1243630 m!1146145))

(assert (=> b!1243622 m!1146143))

(declare-fun m!1146147 () Bool)

(assert (=> b!1243623 m!1146147))

(declare-fun m!1146149 () Bool)

(assert (=> b!1243623 m!1146149))

(declare-fun m!1146151 () Bool)

(assert (=> b!1243621 m!1146151))

(declare-fun m!1146153 () Bool)

(assert (=> b!1243628 m!1146153))

(push 1)

(assert (not b!1243630))

