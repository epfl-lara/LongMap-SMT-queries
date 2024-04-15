; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104484 () Bool)

(assert start!104484)

(declare-fun b!1246625 () Bool)

(declare-datatypes ((Unit!41292 0))(
  ( (Unit!41293) )
))
(declare-fun e!707048 () Unit!41292)

(declare-fun Unit!41294 () Unit!41292)

(assert (=> b!1246625 (= e!707048 Unit!41294)))

(declare-fun b!1246626 () Bool)

(declare-fun e!707045 () Bool)

(declare-fun e!707046 () Bool)

(assert (=> b!1246626 (= e!707045 e!707046)))

(declare-fun res!831916 () Bool)

(assert (=> b!1246626 (=> (not res!831916) (not e!707046))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246626 (= res!831916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562989 () Unit!41292)

(assert (=> b!1246626 (= lt!562989 e!707048)))

(declare-fun c!122043 () Bool)

(declare-datatypes ((array!80180 0))(
  ( (array!80181 (arr!38666 (Array (_ BitVec 32) (_ BitVec 64))) (size!39204 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80180)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246626 (= c!122043 (validKeyInArray!0 (select (arr!38666 a!3892) from!3270)))))

(declare-fun b!1246627 () Bool)

(declare-fun res!831918 () Bool)

(assert (=> b!1246627 (=> (not res!831918) (not e!707045))))

(declare-datatypes ((List!27570 0))(
  ( (Nil!27567) (Cons!27566 (h!28775 (_ BitVec 64)) (t!41030 List!27570)) )
))
(declare-fun arrayNoDuplicates!0 (array!80180 (_ BitVec 32) List!27570) Bool)

(assert (=> b!1246627 (= res!831918 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27567))))

(declare-fun b!1246628 () Bool)

(declare-fun lt!562990 () Unit!41292)

(assert (=> b!1246628 (= e!707048 lt!562990)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80180 List!27570 List!27570 (_ BitVec 32)) Unit!41292)

(assert (=> b!1246628 (= lt!562990 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27566 (select (arr!38666 a!3892) from!3270) Nil!27567) Nil!27567 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246628 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27567)))

(declare-fun b!1246629 () Bool)

(declare-fun res!831917 () Bool)

(assert (=> b!1246629 (=> (not res!831917) (not e!707046))))

(assert (=> b!1246629 (= res!831917 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27567))))

(declare-fun b!1246630 () Bool)

(declare-fun res!831914 () Bool)

(assert (=> b!1246630 (=> (not res!831914) (not e!707045))))

(assert (=> b!1246630 (= res!831914 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39204 a!3892)) (not (= newFrom!287 (size!39204 a!3892)))))))

(declare-fun res!831915 () Bool)

(assert (=> start!104484 (=> (not res!831915) (not e!707045))))

(assert (=> start!104484 (= res!831915 (and (bvslt (size!39204 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39204 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39204 a!3892))))))

(assert (=> start!104484 e!707045))

(declare-fun array_inv!29649 (array!80180) Bool)

(assert (=> start!104484 (array_inv!29649 a!3892)))

(assert (=> start!104484 true))

(declare-fun b!1246631 () Bool)

(assert (=> b!1246631 (= e!707046 (bvsge (bvsub newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270)) (bvsub newFrom!287 from!3270)))))

(assert (= (and start!104484 res!831915) b!1246627))

(assert (= (and b!1246627 res!831918) b!1246630))

(assert (= (and b!1246630 res!831914) b!1246626))

(assert (= (and b!1246626 c!122043) b!1246628))

(assert (= (and b!1246626 (not c!122043)) b!1246625))

(assert (= (and b!1246626 res!831916) b!1246629))

(assert (= (and b!1246629 res!831917) b!1246631))

(declare-fun m!1147951 () Bool)

(assert (=> b!1246626 m!1147951))

(assert (=> b!1246626 m!1147951))

(declare-fun m!1147953 () Bool)

(assert (=> b!1246626 m!1147953))

(declare-fun m!1147955 () Bool)

(assert (=> b!1246629 m!1147955))

(declare-fun m!1147957 () Bool)

(assert (=> b!1246627 m!1147957))

(assert (=> b!1246628 m!1147951))

(declare-fun m!1147959 () Bool)

(assert (=> b!1246628 m!1147959))

(assert (=> b!1246628 m!1147955))

(declare-fun m!1147961 () Bool)

(assert (=> start!104484 m!1147961))

(check-sat (not b!1246628) (not b!1246626) (not b!1246627) (not b!1246629) (not start!104484))
(check-sat)
