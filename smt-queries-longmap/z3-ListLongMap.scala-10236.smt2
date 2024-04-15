; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120464 () Bool)

(assert start!120464)

(declare-fun b!1402602 () Bool)

(declare-fun e!794222 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1402602 (= e!794222 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10607 0))(
  ( (MissingZero!10607 (index!44805 (_ BitVec 32))) (Found!10607 (index!44806 (_ BitVec 32))) (Intermediate!10607 (undefined!11419 Bool) (index!44807 (_ BitVec 32)) (x!126423 (_ BitVec 32))) (Undefined!10607) (MissingVacant!10607 (index!44808 (_ BitVec 32))) )
))
(declare-fun lt!617781 () SeekEntryResult!10607)

(declare-fun lt!617777 () SeekEntryResult!10607)

(assert (=> b!1402602 (= lt!617781 lt!617777)))

(declare-datatypes ((array!95826 0))(
  ( (array!95827 (arr!46264 (Array (_ BitVec 32) (_ BitVec 64))) (size!46816 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95826)

(declare-fun lt!617775 () SeekEntryResult!10607)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((Unit!47061 0))(
  ( (Unit!47062) )
))
(declare-fun lt!617779 () Unit!47061)

(declare-fun lt!617783 () (_ BitVec 32))

(declare-fun lt!617780 () SeekEntryResult!10607)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47061)

(assert (=> b!1402602 (= lt!617779 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617783 (x!126423 lt!617775) (index!44807 lt!617775) (x!126423 lt!617780) (index!44807 lt!617780) mask!2840))))

(declare-fun b!1402603 () Bool)

(declare-fun res!941171 () Bool)

(declare-fun e!794223 () Bool)

(assert (=> b!1402603 (=> (not res!941171) (not e!794223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402603 (= res!941171 (validKeyInArray!0 (select (arr!46264 a!2901) j!112)))))

(declare-fun b!1402604 () Bool)

(declare-fun e!794225 () Bool)

(declare-fun e!794221 () Bool)

(assert (=> b!1402604 (= e!794225 e!794221)))

(declare-fun res!941164 () Bool)

(assert (=> b!1402604 (=> res!941164 e!794221)))

(get-info :version)

(assert (=> b!1402604 (= res!941164 (or (= lt!617775 lt!617780) (not ((_ is Intermediate!10607) lt!617780))))))

(declare-fun lt!617778 () (_ BitVec 64))

(declare-fun lt!617776 () array!95826)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95826 (_ BitVec 32)) SeekEntryResult!10607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402604 (= lt!617780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617778 mask!2840) lt!617778 lt!617776 mask!2840))))

(assert (=> b!1402604 (= lt!617778 (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402604 (= lt!617776 (array!95827 (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46816 a!2901)))))

(declare-fun res!941167 () Bool)

(assert (=> start!120464 (=> (not res!941167) (not e!794223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120464 (= res!941167 (validMask!0 mask!2840))))

(assert (=> start!120464 e!794223))

(assert (=> start!120464 true))

(declare-fun array_inv!35497 (array!95826) Bool)

(assert (=> start!120464 (array_inv!35497 a!2901)))

(declare-fun b!1402605 () Bool)

(declare-fun res!941165 () Bool)

(assert (=> b!1402605 (=> (not res!941165) (not e!794223))))

(declare-datatypes ((List!32861 0))(
  ( (Nil!32858) (Cons!32857 (h!34105 (_ BitVec 64)) (t!47547 List!32861)) )
))
(declare-fun arrayNoDuplicates!0 (array!95826 (_ BitVec 32) List!32861) Bool)

(assert (=> b!1402605 (= res!941165 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32858))))

(declare-fun b!1402606 () Bool)

(declare-fun res!941173 () Bool)

(assert (=> b!1402606 (=> res!941173 e!794222)))

(assert (=> b!1402606 (= res!941173 (not (= lt!617780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617783 lt!617778 lt!617776 mask!2840))))))

(declare-fun b!1402607 () Bool)

(declare-fun res!941168 () Bool)

(assert (=> b!1402607 (=> (not res!941168) (not e!794223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95826 (_ BitVec 32)) Bool)

(assert (=> b!1402607 (= res!941168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402608 () Bool)

(assert (=> b!1402608 (= e!794221 e!794222)))

(declare-fun res!941170 () Bool)

(assert (=> b!1402608 (=> res!941170 e!794222)))

(assert (=> b!1402608 (= res!941170 (or (bvslt (x!126423 lt!617775) #b00000000000000000000000000000000) (bvsgt (x!126423 lt!617775) #b01111111111111111111111111111110) (bvslt (x!126423 lt!617780) #b00000000000000000000000000000000) (bvsgt (x!126423 lt!617780) #b01111111111111111111111111111110) (bvslt lt!617783 #b00000000000000000000000000000000) (bvsge lt!617783 (size!46816 a!2901)) (bvslt (index!44807 lt!617775) #b00000000000000000000000000000000) (bvsge (index!44807 lt!617775) (size!46816 a!2901)) (bvslt (index!44807 lt!617780) #b00000000000000000000000000000000) (bvsge (index!44807 lt!617780) (size!46816 a!2901)) (not (= lt!617775 (Intermediate!10607 false (index!44807 lt!617775) (x!126423 lt!617775)))) (not (= lt!617780 (Intermediate!10607 false (index!44807 lt!617780) (x!126423 lt!617780))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95826 (_ BitVec 32)) SeekEntryResult!10607)

(assert (=> b!1402608 (= lt!617777 (seekKeyOrZeroReturnVacant!0 (x!126423 lt!617780) (index!44807 lt!617780) (index!44807 lt!617780) (select (arr!46264 a!2901) j!112) lt!617776 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95826 (_ BitVec 32)) SeekEntryResult!10607)

(assert (=> b!1402608 (= lt!617777 (seekEntryOrOpen!0 lt!617778 lt!617776 mask!2840))))

(assert (=> b!1402608 (and (not (undefined!11419 lt!617780)) (= (index!44807 lt!617780) i!1037) (bvslt (x!126423 lt!617780) (x!126423 lt!617775)) (= (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44807 lt!617780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617774 () Unit!47061)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47061)

(assert (=> b!1402608 (= lt!617774 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617783 (x!126423 lt!617775) (index!44807 lt!617775) (x!126423 lt!617780) (index!44807 lt!617780) (undefined!11419 lt!617780) mask!2840))))

(declare-fun b!1402609 () Bool)

(assert (=> b!1402609 (= e!794223 (not e!794225))))

(declare-fun res!941169 () Bool)

(assert (=> b!1402609 (=> res!941169 e!794225)))

(assert (=> b!1402609 (= res!941169 (or (not ((_ is Intermediate!10607) lt!617775)) (undefined!11419 lt!617775)))))

(assert (=> b!1402609 (= lt!617781 (Found!10607 j!112))))

(assert (=> b!1402609 (= lt!617781 (seekEntryOrOpen!0 (select (arr!46264 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402609 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617782 () Unit!47061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47061)

(assert (=> b!1402609 (= lt!617782 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402609 (= lt!617775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617783 (select (arr!46264 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402609 (= lt!617783 (toIndex!0 (select (arr!46264 a!2901) j!112) mask!2840))))

(declare-fun b!1402610 () Bool)

(declare-fun res!941166 () Bool)

(assert (=> b!1402610 (=> (not res!941166) (not e!794223))))

(assert (=> b!1402610 (= res!941166 (and (= (size!46816 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46816 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46816 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402611 () Bool)

(declare-fun res!941172 () Bool)

(assert (=> b!1402611 (=> (not res!941172) (not e!794223))))

(assert (=> b!1402611 (= res!941172 (validKeyInArray!0 (select (arr!46264 a!2901) i!1037)))))

(assert (= (and start!120464 res!941167) b!1402610))

(assert (= (and b!1402610 res!941166) b!1402611))

(assert (= (and b!1402611 res!941172) b!1402603))

(assert (= (and b!1402603 res!941171) b!1402607))

(assert (= (and b!1402607 res!941168) b!1402605))

(assert (= (and b!1402605 res!941165) b!1402609))

(assert (= (and b!1402609 (not res!941169)) b!1402604))

(assert (= (and b!1402604 (not res!941164)) b!1402608))

(assert (= (and b!1402608 (not res!941170)) b!1402606))

(assert (= (and b!1402606 (not res!941173)) b!1402602))

(declare-fun m!1290439 () Bool)

(assert (=> b!1402607 m!1290439))

(declare-fun m!1290441 () Bool)

(assert (=> start!120464 m!1290441))

(declare-fun m!1290443 () Bool)

(assert (=> start!120464 m!1290443))

(declare-fun m!1290445 () Bool)

(assert (=> b!1402608 m!1290445))

(declare-fun m!1290447 () Bool)

(assert (=> b!1402608 m!1290447))

(declare-fun m!1290449 () Bool)

(assert (=> b!1402608 m!1290449))

(assert (=> b!1402608 m!1290447))

(declare-fun m!1290451 () Bool)

(assert (=> b!1402608 m!1290451))

(declare-fun m!1290453 () Bool)

(assert (=> b!1402608 m!1290453))

(declare-fun m!1290455 () Bool)

(assert (=> b!1402608 m!1290455))

(assert (=> b!1402603 m!1290447))

(assert (=> b!1402603 m!1290447))

(declare-fun m!1290457 () Bool)

(assert (=> b!1402603 m!1290457))

(assert (=> b!1402609 m!1290447))

(declare-fun m!1290459 () Bool)

(assert (=> b!1402609 m!1290459))

(assert (=> b!1402609 m!1290447))

(declare-fun m!1290461 () Bool)

(assert (=> b!1402609 m!1290461))

(assert (=> b!1402609 m!1290447))

(declare-fun m!1290463 () Bool)

(assert (=> b!1402609 m!1290463))

(declare-fun m!1290465 () Bool)

(assert (=> b!1402609 m!1290465))

(assert (=> b!1402609 m!1290447))

(declare-fun m!1290467 () Bool)

(assert (=> b!1402609 m!1290467))

(declare-fun m!1290469 () Bool)

(assert (=> b!1402606 m!1290469))

(declare-fun m!1290471 () Bool)

(assert (=> b!1402602 m!1290471))

(declare-fun m!1290473 () Bool)

(assert (=> b!1402605 m!1290473))

(declare-fun m!1290475 () Bool)

(assert (=> b!1402604 m!1290475))

(assert (=> b!1402604 m!1290475))

(declare-fun m!1290477 () Bool)

(assert (=> b!1402604 m!1290477))

(assert (=> b!1402604 m!1290455))

(declare-fun m!1290479 () Bool)

(assert (=> b!1402604 m!1290479))

(declare-fun m!1290481 () Bool)

(assert (=> b!1402611 m!1290481))

(assert (=> b!1402611 m!1290481))

(declare-fun m!1290483 () Bool)

(assert (=> b!1402611 m!1290483))

(check-sat (not b!1402606) (not b!1402607) (not b!1402604) (not b!1402605) (not b!1402608) (not start!120464) (not b!1402609) (not b!1402603) (not b!1402611) (not b!1402602))
(check-sat)
