; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103922 () Bool)

(assert start!103922)

(declare-fun b!1243958 () Bool)

(declare-datatypes ((Unit!41160 0))(
  ( (Unit!41161) )
))
(declare-fun e!705058 () Unit!41160)

(declare-fun lt!562375 () Unit!41160)

(assert (=> b!1243958 (= e!705058 lt!562375)))

(declare-datatypes ((array!79940 0))(
  ( (array!79941 (arr!38564 (Array (_ BitVec 32) (_ BitVec 64))) (size!39102 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79940)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27468 0))(
  ( (Nil!27465) (Cons!27464 (h!28673 (_ BitVec 64)) (t!40928 List!27468)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79940 List!27468 List!27468 (_ BitVec 32)) Unit!41160)

(assert (=> b!1243958 (= lt!562375 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27464 (select (arr!38564 a!3892) from!3270) Nil!27465) Nil!27465 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!79940 (_ BitVec 32) List!27468) Bool)

(assert (=> b!1243958 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27465)))

(declare-fun b!1243959 () Bool)

(declare-fun res!829774 () Bool)

(declare-fun e!705060 () Bool)

(assert (=> b!1243959 (=> (not res!829774) (not e!705060))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243959 (= res!829774 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39102 a!3892)) (not (= newFrom!287 (size!39102 a!3892)))))))

(declare-fun b!1243960 () Bool)

(declare-fun Unit!41162 () Unit!41160)

(assert (=> b!1243960 (= e!705058 Unit!41162)))

(declare-fun b!1243961 () Bool)

(declare-fun res!829775 () Bool)

(assert (=> b!1243961 (=> (not res!829775) (not e!705060))))

(assert (=> b!1243961 (= res!829775 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27465))))

(declare-fun b!1243962 () Bool)

(declare-fun e!705059 () Bool)

(assert (=> b!1243962 (= e!705060 e!705059)))

(declare-fun res!829776 () Bool)

(assert (=> b!1243962 (=> (not res!829776) (not e!705059))))

(assert (=> b!1243962 (= res!829776 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562377 () Unit!41160)

(assert (=> b!1243962 (= lt!562377 e!705058)))

(declare-fun c!121780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243962 (= c!121780 (validKeyInArray!0 (select (arr!38564 a!3892) from!3270)))))

(declare-fun b!1243963 () Bool)

(assert (=> b!1243963 (= e!705059 false)))

(declare-fun lt!562376 () Bool)

(assert (=> b!1243963 (= lt!562376 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27465))))

(declare-fun res!829773 () Bool)

(assert (=> start!103922 (=> (not res!829773) (not e!705060))))

(assert (=> start!103922 (= res!829773 (and (bvslt (size!39102 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39102 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39102 a!3892))))))

(assert (=> start!103922 e!705060))

(declare-fun array_inv!29547 (array!79940) Bool)

(assert (=> start!103922 (array_inv!29547 a!3892)))

(assert (=> start!103922 true))

(assert (= (and start!103922 res!829773) b!1243961))

(assert (= (and b!1243961 res!829775) b!1243959))

(assert (= (and b!1243959 res!829774) b!1243962))

(assert (= (and b!1243962 c!121780) b!1243958))

(assert (= (and b!1243962 (not c!121780)) b!1243960))

(assert (= (and b!1243962 res!829776) b!1243963))

(declare-fun m!1145913 () Bool)

(assert (=> b!1243963 m!1145913))

(declare-fun m!1145915 () Bool)

(assert (=> start!103922 m!1145915))

(declare-fun m!1145917 () Bool)

(assert (=> b!1243961 m!1145917))

(declare-fun m!1145919 () Bool)

(assert (=> b!1243962 m!1145919))

(assert (=> b!1243962 m!1145919))

(declare-fun m!1145921 () Bool)

(assert (=> b!1243962 m!1145921))

(assert (=> b!1243958 m!1145919))

(declare-fun m!1145923 () Bool)

(assert (=> b!1243958 m!1145923))

(assert (=> b!1243958 m!1145913))

(check-sat (not b!1243963) (not b!1243958) (not start!103922) (not b!1243962) (not b!1243961))
(check-sat)
