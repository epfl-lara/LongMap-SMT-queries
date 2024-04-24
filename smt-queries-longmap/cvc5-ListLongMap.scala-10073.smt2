; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118788 () Bool)

(assert start!118788)

(declare-fun b!1387512 () Bool)

(declare-fun res!927978 () Bool)

(declare-fun e!786142 () Bool)

(assert (=> b!1387512 (=> (not res!927978) (not e!786142))))

(declare-datatypes ((array!94962 0))(
  ( (array!94963 (arr!45855 (Array (_ BitVec 32) (_ BitVec 64))) (size!46406 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94962)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387512 (= res!927978 (validKeyInArray!0 (select (arr!45855 a!2938) i!1065)))))

(declare-fun b!1387514 () Bool)

(declare-fun res!927973 () Bool)

(assert (=> b!1387514 (=> (not res!927973) (not e!786142))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387514 (= res!927973 (and (not (= (select (arr!45855 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45855 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1387515 () Bool)

(assert (=> b!1387515 (= e!786142 (not true))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10102 0))(
  ( (MissingZero!10102 (index!42779 (_ BitVec 32))) (Found!10102 (index!42780 (_ BitVec 32))) (Intermediate!10102 (undefined!10914 Bool) (index!42781 (_ BitVec 32)) (x!124549 (_ BitVec 32))) (Undefined!10102) (MissingVacant!10102 (index!42782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94962 (_ BitVec 32)) SeekEntryResult!10102)

(assert (=> b!1387515 (= (seekEntryOrOpen!0 (select (arr!45855 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45855 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94963 (store (arr!45855 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46406 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46219 0))(
  ( (Unit!46220) )
))
(declare-fun lt!609867 () Unit!46219)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46219)

(assert (=> b!1387515 (= lt!609867 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1387516 () Bool)

(declare-fun res!927974 () Bool)

(assert (=> b!1387516 (=> (not res!927974) (not e!786142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94962 (_ BitVec 32)) Bool)

(assert (=> b!1387516 (= res!927974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387517 () Bool)

(declare-fun res!927979 () Bool)

(assert (=> b!1387517 (=> (not res!927979) (not e!786142))))

(assert (=> b!1387517 (= res!927979 (validKeyInArray!0 (select (arr!45855 a!2938) startIndex!16)))))

(declare-fun b!1387518 () Bool)

(declare-fun res!927976 () Bool)

(assert (=> b!1387518 (=> (not res!927976) (not e!786142))))

(assert (=> b!1387518 (= res!927976 (and (= (size!46406 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46406 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46406 a!2938))))))

(declare-fun res!927977 () Bool)

(assert (=> start!118788 (=> (not res!927977) (not e!786142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118788 (= res!927977 (validMask!0 mask!2987))))

(assert (=> start!118788 e!786142))

(assert (=> start!118788 true))

(declare-fun array_inv!35136 (array!94962) Bool)

(assert (=> start!118788 (array_inv!35136 a!2938)))

(declare-fun b!1387513 () Bool)

(declare-fun res!927975 () Bool)

(assert (=> b!1387513 (=> (not res!927975) (not e!786142))))

(declare-datatypes ((List!32370 0))(
  ( (Nil!32367) (Cons!32366 (h!33584 (_ BitVec 64)) (t!47056 List!32370)) )
))
(declare-fun arrayNoDuplicates!0 (array!94962 (_ BitVec 32) List!32370) Bool)

(assert (=> b!1387513 (= res!927975 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32367))))

(assert (= (and start!118788 res!927977) b!1387518))

(assert (= (and b!1387518 res!927976) b!1387512))

(assert (= (and b!1387512 res!927978) b!1387513))

(assert (= (and b!1387513 res!927975) b!1387516))

(assert (= (and b!1387516 res!927974) b!1387514))

(assert (= (and b!1387514 res!927973) b!1387517))

(assert (= (and b!1387517 res!927979) b!1387515))

(declare-fun m!1273177 () Bool)

(assert (=> b!1387516 m!1273177))

(declare-fun m!1273179 () Bool)

(assert (=> b!1387514 m!1273179))

(assert (=> b!1387512 m!1273179))

(assert (=> b!1387512 m!1273179))

(declare-fun m!1273181 () Bool)

(assert (=> b!1387512 m!1273181))

(declare-fun m!1273183 () Bool)

(assert (=> start!118788 m!1273183))

(declare-fun m!1273185 () Bool)

(assert (=> start!118788 m!1273185))

(declare-fun m!1273187 () Bool)

(assert (=> b!1387515 m!1273187))

(assert (=> b!1387515 m!1273187))

(declare-fun m!1273189 () Bool)

(assert (=> b!1387515 m!1273189))

(declare-fun m!1273191 () Bool)

(assert (=> b!1387515 m!1273191))

(declare-fun m!1273193 () Bool)

(assert (=> b!1387515 m!1273193))

(declare-fun m!1273195 () Bool)

(assert (=> b!1387515 m!1273195))

(assert (=> b!1387515 m!1273195))

(declare-fun m!1273197 () Bool)

(assert (=> b!1387515 m!1273197))

(assert (=> b!1387517 m!1273195))

(assert (=> b!1387517 m!1273195))

(declare-fun m!1273199 () Bool)

(assert (=> b!1387517 m!1273199))

(declare-fun m!1273201 () Bool)

(assert (=> b!1387513 m!1273201))

(push 1)

(assert (not b!1387513))

(assert (not b!1387516))

(assert (not start!118788))

(assert (not b!1387515))

(assert (not b!1387512))

(assert (not b!1387517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

