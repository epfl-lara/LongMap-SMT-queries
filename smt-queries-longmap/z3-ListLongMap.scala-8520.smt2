; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103918 () Bool)

(assert start!103918)

(declare-fun b!1243886 () Bool)

(declare-fun res!829671 () Bool)

(declare-fun e!705055 () Bool)

(assert (=> b!1243886 (=> (not res!829671) (not e!705055))))

(declare-datatypes ((List!27401 0))(
  ( (Nil!27398) (Cons!27397 (h!28606 (_ BitVec 64)) (t!40870 List!27401)) )
))
(declare-fun contains!7422 (List!27401 (_ BitVec 64)) Bool)

(assert (=> b!1243886 (= res!829671 (not (contains!7422 Nil!27398 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243887 () Bool)

(declare-fun res!829662 () Bool)

(declare-fun e!705056 () Bool)

(assert (=> b!1243887 (=> (not res!829662) (not e!705056))))

(declare-datatypes ((array!80010 0))(
  ( (array!80011 (arr!38598 (Array (_ BitVec 32) (_ BitVec 64))) (size!39134 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80010)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!80010 (_ BitVec 32) List!27401) Bool)

(assert (=> b!1243887 (= res!829662 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27398))))

(declare-fun b!1243888 () Bool)

(assert (=> b!1243888 (= e!705056 e!705055)))

(declare-fun res!829669 () Bool)

(assert (=> b!1243888 (=> (not res!829669) (not e!705055))))

(assert (=> b!1243888 (= res!829669 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!562509 () List!27401)

(assert (=> b!1243888 (= lt!562509 (Cons!27397 (select (arr!38598 a!3892) from!3270) Nil!27398))))

(declare-fun b!1243889 () Bool)

(declare-fun res!829666 () Bool)

(assert (=> b!1243889 (=> (not res!829666) (not e!705055))))

(declare-fun noDuplicate!2000 (List!27401) Bool)

(assert (=> b!1243889 (= res!829666 (noDuplicate!2000 lt!562509))))

(declare-fun b!1243890 () Bool)

(declare-fun res!829668 () Bool)

(assert (=> b!1243890 (=> (not res!829668) (not e!705055))))

(assert (=> b!1243890 (= res!829668 (not (contains!7422 lt!562509 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243891 () Bool)

(declare-fun res!829667 () Bool)

(assert (=> b!1243891 (=> (not res!829667) (not e!705055))))

(assert (=> b!1243891 (= res!829667 (not (contains!7422 lt!562509 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243885 () Bool)

(assert (=> b!1243885 (= e!705055 false)))

(declare-fun lt!562510 () Bool)

(assert (=> b!1243885 (= lt!562510 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562509))))

(declare-datatypes ((Unit!41305 0))(
  ( (Unit!41306) )
))
(declare-fun lt!562511 () Unit!41305)

(declare-fun noDuplicateSubseq!102 (List!27401 List!27401) Unit!41305)

(assert (=> b!1243885 (= lt!562511 (noDuplicateSubseq!102 Nil!27398 lt!562509))))

(declare-fun res!829672 () Bool)

(assert (=> start!103918 (=> (not res!829672) (not e!705056))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103918 (= res!829672 (and (bvslt (size!39134 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39134 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39134 a!3892))))))

(assert (=> start!103918 e!705056))

(declare-fun array_inv!29446 (array!80010) Bool)

(assert (=> start!103918 (array_inv!29446 a!3892)))

(assert (=> start!103918 true))

(declare-fun b!1243892 () Bool)

(declare-fun res!829670 () Bool)

(assert (=> b!1243892 (=> (not res!829670) (not e!705056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243892 (= res!829670 (validKeyInArray!0 (select (arr!38598 a!3892) from!3270)))))

(declare-fun b!1243893 () Bool)

(declare-fun res!829663 () Bool)

(assert (=> b!1243893 (=> (not res!829663) (not e!705055))))

(declare-fun subseq!648 (List!27401 List!27401) Bool)

(assert (=> b!1243893 (= res!829663 (subseq!648 Nil!27398 lt!562509))))

(declare-fun b!1243894 () Bool)

(declare-fun res!829664 () Bool)

(assert (=> b!1243894 (=> (not res!829664) (not e!705056))))

(assert (=> b!1243894 (= res!829664 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39134 a!3892)) (not (= newFrom!287 (size!39134 a!3892)))))))

(declare-fun b!1243895 () Bool)

(declare-fun res!829665 () Bool)

(assert (=> b!1243895 (=> (not res!829665) (not e!705055))))

(assert (=> b!1243895 (= res!829665 (not (contains!7422 Nil!27398 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103918 res!829672) b!1243887))

(assert (= (and b!1243887 res!829662) b!1243894))

(assert (= (and b!1243894 res!829664) b!1243892))

(assert (= (and b!1243892 res!829670) b!1243888))

(assert (= (and b!1243888 res!829669) b!1243889))

(assert (= (and b!1243889 res!829666) b!1243891))

(assert (= (and b!1243891 res!829667) b!1243890))

(assert (= (and b!1243890 res!829668) b!1243895))

(assert (= (and b!1243895 res!829665) b!1243886))

(assert (= (and b!1243886 res!829671) b!1243893))

(assert (= (and b!1243893 res!829663) b!1243885))

(declare-fun m!1146323 () Bool)

(assert (=> b!1243888 m!1146323))

(declare-fun m!1146325 () Bool)

(assert (=> b!1243895 m!1146325))

(declare-fun m!1146327 () Bool)

(assert (=> b!1243885 m!1146327))

(declare-fun m!1146329 () Bool)

(assert (=> b!1243885 m!1146329))

(declare-fun m!1146331 () Bool)

(assert (=> start!103918 m!1146331))

(declare-fun m!1146333 () Bool)

(assert (=> b!1243893 m!1146333))

(assert (=> b!1243892 m!1146323))

(assert (=> b!1243892 m!1146323))

(declare-fun m!1146335 () Bool)

(assert (=> b!1243892 m!1146335))

(declare-fun m!1146337 () Bool)

(assert (=> b!1243886 m!1146337))

(declare-fun m!1146339 () Bool)

(assert (=> b!1243890 m!1146339))

(declare-fun m!1146341 () Bool)

(assert (=> b!1243887 m!1146341))

(declare-fun m!1146343 () Bool)

(assert (=> b!1243891 m!1146343))

(declare-fun m!1146345 () Bool)

(assert (=> b!1243889 m!1146345))

(check-sat (not b!1243892) (not b!1243885) (not b!1243887) (not b!1243889) (not b!1243886) (not b!1243891) (not start!103918) (not b!1243893) (not b!1243895) (not b!1243890))
(check-sat)
