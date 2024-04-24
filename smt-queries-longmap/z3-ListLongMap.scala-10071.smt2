; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118772 () Bool)

(assert start!118772)

(declare-fun b!1387344 () Bool)

(declare-fun res!927811 () Bool)

(declare-fun e!786094 () Bool)

(assert (=> b!1387344 (=> (not res!927811) (not e!786094))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94946 0))(
  ( (array!94947 (arr!45847 (Array (_ BitVec 32) (_ BitVec 64))) (size!46398 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94946)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387344 (= res!927811 (and (not (= (select (arr!45847 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45847 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1387345 () Bool)

(declare-fun res!927810 () Bool)

(assert (=> b!1387345 (=> (not res!927810) (not e!786094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387345 (= res!927810 (validKeyInArray!0 (select (arr!45847 a!2938) i!1065)))))

(declare-fun b!1387346 () Bool)

(assert (=> b!1387346 (= e!786094 (not (bvsle #b00000000000000000000000000000000 (size!46398 a!2938))))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10094 0))(
  ( (MissingZero!10094 (index!42747 (_ BitVec 32))) (Found!10094 (index!42748 (_ BitVec 32))) (Intermediate!10094 (undefined!10906 Bool) (index!42749 (_ BitVec 32)) (x!124525 (_ BitVec 32))) (Undefined!10094) (MissingVacant!10094 (index!42750 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94946 (_ BitVec 32)) SeekEntryResult!10094)

(assert (=> b!1387346 (= (seekEntryOrOpen!0 (select (arr!45847 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45847 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94947 (store (arr!45847 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46398 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46203 0))(
  ( (Unit!46204) )
))
(declare-fun lt!609843 () Unit!46203)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1387346 (= lt!609843 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1387347 () Bool)

(declare-fun res!927806 () Bool)

(assert (=> b!1387347 (=> (not res!927806) (not e!786094))))

(assert (=> b!1387347 (= res!927806 (validKeyInArray!0 (select (arr!45847 a!2938) startIndex!16)))))

(declare-fun b!1387348 () Bool)

(declare-fun res!927807 () Bool)

(assert (=> b!1387348 (=> (not res!927807) (not e!786094))))

(declare-datatypes ((List!32362 0))(
  ( (Nil!32359) (Cons!32358 (h!33576 (_ BitVec 64)) (t!47048 List!32362)) )
))
(declare-fun arrayNoDuplicates!0 (array!94946 (_ BitVec 32) List!32362) Bool)

(assert (=> b!1387348 (= res!927807 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32359))))

(declare-fun b!1387349 () Bool)

(declare-fun res!927808 () Bool)

(assert (=> b!1387349 (=> (not res!927808) (not e!786094))))

(assert (=> b!1387349 (= res!927808 (and (= (size!46398 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46398 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46398 a!2938))))))

(declare-fun b!1387350 () Bool)

(declare-fun res!927805 () Bool)

(assert (=> b!1387350 (=> (not res!927805) (not e!786094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94946 (_ BitVec 32)) Bool)

(assert (=> b!1387350 (= res!927805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927809 () Bool)

(assert (=> start!118772 (=> (not res!927809) (not e!786094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118772 (= res!927809 (validMask!0 mask!2987))))

(assert (=> start!118772 e!786094))

(assert (=> start!118772 true))

(declare-fun array_inv!35128 (array!94946) Bool)

(assert (=> start!118772 (array_inv!35128 a!2938)))

(assert (= (and start!118772 res!927809) b!1387349))

(assert (= (and b!1387349 res!927808) b!1387345))

(assert (= (and b!1387345 res!927810) b!1387348))

(assert (= (and b!1387348 res!927807) b!1387350))

(assert (= (and b!1387350 res!927805) b!1387344))

(assert (= (and b!1387344 res!927811) b!1387347))

(assert (= (and b!1387347 res!927806) b!1387346))

(declare-fun m!1272969 () Bool)

(assert (=> start!118772 m!1272969))

(declare-fun m!1272971 () Bool)

(assert (=> start!118772 m!1272971))

(declare-fun m!1272973 () Bool)

(assert (=> b!1387347 m!1272973))

(assert (=> b!1387347 m!1272973))

(declare-fun m!1272975 () Bool)

(assert (=> b!1387347 m!1272975))

(declare-fun m!1272977 () Bool)

(assert (=> b!1387345 m!1272977))

(assert (=> b!1387345 m!1272977))

(declare-fun m!1272979 () Bool)

(assert (=> b!1387345 m!1272979))

(declare-fun m!1272981 () Bool)

(assert (=> b!1387350 m!1272981))

(declare-fun m!1272983 () Bool)

(assert (=> b!1387346 m!1272983))

(assert (=> b!1387346 m!1272983))

(declare-fun m!1272985 () Bool)

(assert (=> b!1387346 m!1272985))

(declare-fun m!1272987 () Bool)

(assert (=> b!1387346 m!1272987))

(declare-fun m!1272989 () Bool)

(assert (=> b!1387346 m!1272989))

(assert (=> b!1387346 m!1272973))

(assert (=> b!1387346 m!1272973))

(declare-fun m!1272991 () Bool)

(assert (=> b!1387346 m!1272991))

(assert (=> b!1387344 m!1272977))

(declare-fun m!1272993 () Bool)

(assert (=> b!1387348 m!1272993))

(check-sat (not start!118772) (not b!1387346) (not b!1387345) (not b!1387350) (not b!1387347) (not b!1387348))
(check-sat)
