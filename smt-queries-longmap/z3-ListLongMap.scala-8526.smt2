; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103954 () Bool)

(assert start!103954)

(declare-fun b!1244274 () Bool)

(declare-datatypes ((Unit!41354 0))(
  ( (Unit!41355) )
))
(declare-fun e!705258 () Unit!41354)

(declare-fun lt!562672 () Unit!41354)

(assert (=> b!1244274 (= e!705258 lt!562672)))

(declare-datatypes ((array!80046 0))(
  ( (array!80047 (arr!38616 (Array (_ BitVec 32) (_ BitVec 64))) (size!39152 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80046)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27419 0))(
  ( (Nil!27416) (Cons!27415 (h!28624 (_ BitVec 64)) (t!40888 List!27419)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80046 List!27419 List!27419 (_ BitVec 32)) Unit!41354)

(assert (=> b!1244274 (= lt!562672 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27415 (select (arr!38616 a!3892) from!3270) Nil!27416) Nil!27416 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80046 (_ BitVec 32) List!27419) Bool)

(assert (=> b!1244274 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27416)))

(declare-fun b!1244275 () Bool)

(declare-fun e!705259 () Bool)

(declare-fun e!705260 () Bool)

(assert (=> b!1244275 (= e!705259 e!705260)))

(declare-fun res!829971 () Bool)

(assert (=> b!1244275 (=> (not res!829971) (not e!705260))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244275 (= res!829971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562671 () Unit!41354)

(assert (=> b!1244275 (= lt!562671 e!705258)))

(declare-fun c!121837 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244275 (= c!121837 (validKeyInArray!0 (select (arr!38616 a!3892) from!3270)))))

(declare-fun res!829972 () Bool)

(assert (=> start!103954 (=> (not res!829972) (not e!705259))))

(assert (=> start!103954 (= res!829972 (and (bvslt (size!39152 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39152 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39152 a!3892))))))

(assert (=> start!103954 e!705259))

(declare-fun array_inv!29464 (array!80046) Bool)

(assert (=> start!103954 (array_inv!29464 a!3892)))

(assert (=> start!103954 true))

(declare-fun b!1244276 () Bool)

(declare-fun Unit!41356 () Unit!41354)

(assert (=> b!1244276 (= e!705258 Unit!41356)))

(declare-fun b!1244277 () Bool)

(declare-fun res!829970 () Bool)

(assert (=> b!1244277 (=> (not res!829970) (not e!705259))))

(assert (=> b!1244277 (= res!829970 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39152 a!3892)) (not (= newFrom!287 (size!39152 a!3892)))))))

(declare-fun b!1244278 () Bool)

(declare-fun res!829969 () Bool)

(assert (=> b!1244278 (=> (not res!829969) (not e!705259))))

(assert (=> b!1244278 (= res!829969 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27416))))

(declare-fun b!1244279 () Bool)

(assert (=> b!1244279 (= e!705260 false)))

(declare-fun lt!562673 () Bool)

(assert (=> b!1244279 (= lt!562673 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27416))))

(assert (= (and start!103954 res!829972) b!1244278))

(assert (= (and b!1244278 res!829969) b!1244277))

(assert (= (and b!1244277 res!829970) b!1244275))

(assert (= (and b!1244275 c!121837) b!1244274))

(assert (= (and b!1244275 (not c!121837)) b!1244276))

(assert (= (and b!1244275 res!829971) b!1244279))

(declare-fun m!1146599 () Bool)

(assert (=> start!103954 m!1146599))

(declare-fun m!1146601 () Bool)

(assert (=> b!1244274 m!1146601))

(declare-fun m!1146603 () Bool)

(assert (=> b!1244274 m!1146603))

(declare-fun m!1146605 () Bool)

(assert (=> b!1244274 m!1146605))

(assert (=> b!1244279 m!1146605))

(assert (=> b!1244275 m!1146601))

(assert (=> b!1244275 m!1146601))

(declare-fun m!1146607 () Bool)

(assert (=> b!1244275 m!1146607))

(declare-fun m!1146609 () Bool)

(assert (=> b!1244278 m!1146609))

(check-sat (not b!1244279) (not b!1244278) (not start!103954) (not b!1244275) (not b!1244274))
(check-sat)
