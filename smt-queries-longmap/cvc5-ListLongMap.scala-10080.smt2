; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118830 () Bool)

(assert start!118830)

(declare-fun b!1388077 () Bool)

(declare-fun res!928418 () Bool)

(declare-fun e!786394 () Bool)

(assert (=> b!1388077 (=> (not res!928418) (not e!786394))))

(declare-datatypes ((array!95004 0))(
  ( (array!95005 (arr!45876 (Array (_ BitVec 32) (_ BitVec 64))) (size!46427 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95004)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1388077 (= res!928418 (and (not (= (select (arr!45876 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45876 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388078 () Bool)

(declare-fun res!928414 () Bool)

(assert (=> b!1388078 (=> (not res!928414) (not e!786394))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95004 (_ BitVec 32)) Bool)

(assert (=> b!1388078 (= res!928414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388079 () Bool)

(declare-datatypes ((Unit!46281 0))(
  ( (Unit!46282) )
))
(declare-fun e!786392 () Unit!46281)

(declare-fun lt!610054 () Unit!46281)

(assert (=> b!1388079 (= e!786392 lt!610054)))

(declare-fun lt!610056 () Unit!46281)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46281)

(assert (=> b!1388079 (= lt!610056 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10123 0))(
  ( (MissingZero!10123 (index!42863 (_ BitVec 32))) (Found!10123 (index!42864 (_ BitVec 32))) (Intermediate!10123 (undefined!10935 Bool) (index!42865 (_ BitVec 32)) (x!124626 (_ BitVec 32))) (Undefined!10123) (MissingVacant!10123 (index!42866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95004 (_ BitVec 32)) SeekEntryResult!10123)

(assert (=> b!1388079 (= (seekEntryOrOpen!0 (select (arr!45876 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45876 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95005 (store (arr!45876 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46427 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46281)

(assert (=> b!1388079 (= lt!610054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1388079 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1388080 () Bool)

(declare-fun Unit!46283 () Unit!46281)

(assert (=> b!1388080 (= e!786392 Unit!46283)))

(declare-fun b!1388081 () Bool)

(declare-fun res!928415 () Bool)

(assert (=> b!1388081 (=> (not res!928415) (not e!786394))))

(assert (=> b!1388081 (= res!928415 (and (= (size!46427 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46427 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46427 a!2938))))))

(declare-fun res!928417 () Bool)

(assert (=> start!118830 (=> (not res!928417) (not e!786394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118830 (= res!928417 (validMask!0 mask!2987))))

(assert (=> start!118830 e!786394))

(assert (=> start!118830 true))

(declare-fun array_inv!35157 (array!95004) Bool)

(assert (=> start!118830 (array_inv!35157 a!2938)))

(declare-fun b!1388082 () Bool)

(assert (=> b!1388082 (= e!786394 false)))

(declare-fun lt!610055 () Unit!46281)

(assert (=> b!1388082 (= lt!610055 e!786392)))

(declare-fun c!129279 () Bool)

(declare-fun e!786393 () Bool)

(assert (=> b!1388082 (= c!129279 e!786393)))

(declare-fun res!928416 () Bool)

(assert (=> b!1388082 (=> (not res!928416) (not e!786393))))

(assert (=> b!1388082 (= res!928416 (not (= startIndex!16 i!1065)))))

(declare-fun b!1388083 () Bool)

(declare-fun res!928420 () Bool)

(assert (=> b!1388083 (=> (not res!928420) (not e!786394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388083 (= res!928420 (validKeyInArray!0 (select (arr!45876 a!2938) i!1065)))))

(declare-fun b!1388084 () Bool)

(assert (=> b!1388084 (= e!786393 (validKeyInArray!0 (select (arr!45876 a!2938) startIndex!16)))))

(declare-fun b!1388085 () Bool)

(declare-fun res!928419 () Bool)

(assert (=> b!1388085 (=> (not res!928419) (not e!786394))))

(declare-datatypes ((List!32391 0))(
  ( (Nil!32388) (Cons!32387 (h!33605 (_ BitVec 64)) (t!47077 List!32391)) )
))
(declare-fun arrayNoDuplicates!0 (array!95004 (_ BitVec 32) List!32391) Bool)

(assert (=> b!1388085 (= res!928419 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32388))))

(assert (= (and start!118830 res!928417) b!1388081))

(assert (= (and b!1388081 res!928415) b!1388083))

(assert (= (and b!1388083 res!928420) b!1388085))

(assert (= (and b!1388085 res!928419) b!1388078))

(assert (= (and b!1388078 res!928414) b!1388077))

(assert (= (and b!1388077 res!928418) b!1388082))

(assert (= (and b!1388082 res!928416) b!1388084))

(assert (= (and b!1388082 c!129279) b!1388079))

(assert (= (and b!1388082 (not c!129279)) b!1388080))

(declare-fun m!1273803 () Bool)

(assert (=> b!1388085 m!1273803))

(declare-fun m!1273805 () Bool)

(assert (=> b!1388083 m!1273805))

(assert (=> b!1388083 m!1273805))

(declare-fun m!1273807 () Bool)

(assert (=> b!1388083 m!1273807))

(declare-fun m!1273809 () Bool)

(assert (=> b!1388079 m!1273809))

(declare-fun m!1273811 () Bool)

(assert (=> b!1388079 m!1273811))

(assert (=> b!1388079 m!1273811))

(declare-fun m!1273813 () Bool)

(assert (=> b!1388079 m!1273813))

(declare-fun m!1273815 () Bool)

(assert (=> b!1388079 m!1273815))

(declare-fun m!1273817 () Bool)

(assert (=> b!1388079 m!1273817))

(declare-fun m!1273819 () Bool)

(assert (=> b!1388079 m!1273819))

(declare-fun m!1273821 () Bool)

(assert (=> b!1388079 m!1273821))

(assert (=> b!1388079 m!1273819))

(declare-fun m!1273823 () Bool)

(assert (=> b!1388079 m!1273823))

(assert (=> b!1388077 m!1273805))

(declare-fun m!1273825 () Bool)

(assert (=> start!118830 m!1273825))

(declare-fun m!1273827 () Bool)

(assert (=> start!118830 m!1273827))

(assert (=> b!1388084 m!1273819))

(assert (=> b!1388084 m!1273819))

(declare-fun m!1273829 () Bool)

(assert (=> b!1388084 m!1273829))

(declare-fun m!1273831 () Bool)

(assert (=> b!1388078 m!1273831))

(push 1)

(assert (not b!1388085))

(assert (not b!1388078))

(assert (not b!1388079))

(assert (not b!1388084))

(assert (not b!1388083))

(assert (not start!118830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

