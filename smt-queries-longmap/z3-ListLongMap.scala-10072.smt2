; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118778 () Bool)

(assert start!118778)

(declare-fun b!1387407 () Bool)

(declare-fun res!927870 () Bool)

(declare-fun e!786111 () Bool)

(assert (=> b!1387407 (=> (not res!927870) (not e!786111))))

(declare-datatypes ((array!94952 0))(
  ( (array!94953 (arr!45850 (Array (_ BitVec 32) (_ BitVec 64))) (size!46401 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94952)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387407 (= res!927870 (validKeyInArray!0 (select (arr!45850 a!2938) i!1065)))))

(declare-fun b!1387408 () Bool)

(declare-fun res!927868 () Bool)

(assert (=> b!1387408 (=> (not res!927868) (not e!786111))))

(declare-datatypes ((List!32365 0))(
  ( (Nil!32362) (Cons!32361 (h!33579 (_ BitVec 64)) (t!47051 List!32365)) )
))
(declare-fun arrayNoDuplicates!0 (array!94952 (_ BitVec 32) List!32365) Bool)

(assert (=> b!1387408 (= res!927868 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32362))))

(declare-fun b!1387409 () Bool)

(declare-fun res!927873 () Bool)

(assert (=> b!1387409 (=> (not res!927873) (not e!786111))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94952 (_ BitVec 32)) Bool)

(assert (=> b!1387409 (= res!927873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387410 () Bool)

(declare-fun res!927871 () Bool)

(assert (=> b!1387410 (=> (not res!927871) (not e!786111))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387410 (= res!927871 (validKeyInArray!0 (select (arr!45850 a!2938) startIndex!16)))))

(declare-fun b!1387411 () Bool)

(declare-fun res!927874 () Bool)

(assert (=> b!1387411 (=> (not res!927874) (not e!786111))))

(assert (=> b!1387411 (= res!927874 (and (= (size!46401 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46401 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46401 a!2938))))))

(declare-fun b!1387412 () Bool)

(assert (=> b!1387412 (= e!786111 (not (or (bvsgt #b00000000000000000000000000000000 (size!46401 a!2938)) (bvsle startIndex!16 (size!46401 a!2938)))))))

(declare-datatypes ((SeekEntryResult!10097 0))(
  ( (MissingZero!10097 (index!42759 (_ BitVec 32))) (Found!10097 (index!42760 (_ BitVec 32))) (Intermediate!10097 (undefined!10909 Bool) (index!42761 (_ BitVec 32)) (x!124536 (_ BitVec 32))) (Undefined!10097) (MissingVacant!10097 (index!42762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94952 (_ BitVec 32)) SeekEntryResult!10097)

(assert (=> b!1387412 (= (seekEntryOrOpen!0 (select (arr!45850 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45850 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94953 (store (arr!45850 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46401 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46209 0))(
  ( (Unit!46210) )
))
(declare-fun lt!609852 () Unit!46209)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46209)

(assert (=> b!1387412 (= lt!609852 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun res!927872 () Bool)

(assert (=> start!118778 (=> (not res!927872) (not e!786111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118778 (= res!927872 (validMask!0 mask!2987))))

(assert (=> start!118778 e!786111))

(assert (=> start!118778 true))

(declare-fun array_inv!35131 (array!94952) Bool)

(assert (=> start!118778 (array_inv!35131 a!2938)))

(declare-fun b!1387413 () Bool)

(declare-fun res!927869 () Bool)

(assert (=> b!1387413 (=> (not res!927869) (not e!786111))))

(assert (=> b!1387413 (= res!927869 (and (not (= (select (arr!45850 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45850 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118778 res!927872) b!1387411))

(assert (= (and b!1387411 res!927874) b!1387407))

(assert (= (and b!1387407 res!927870) b!1387408))

(assert (= (and b!1387408 res!927868) b!1387409))

(assert (= (and b!1387409 res!927873) b!1387413))

(assert (= (and b!1387413 res!927869) b!1387410))

(assert (= (and b!1387410 res!927871) b!1387412))

(declare-fun m!1273047 () Bool)

(assert (=> b!1387413 m!1273047))

(declare-fun m!1273049 () Bool)

(assert (=> b!1387410 m!1273049))

(assert (=> b!1387410 m!1273049))

(declare-fun m!1273051 () Bool)

(assert (=> b!1387410 m!1273051))

(declare-fun m!1273053 () Bool)

(assert (=> b!1387409 m!1273053))

(declare-fun m!1273055 () Bool)

(assert (=> b!1387408 m!1273055))

(declare-fun m!1273057 () Bool)

(assert (=> start!118778 m!1273057))

(declare-fun m!1273059 () Bool)

(assert (=> start!118778 m!1273059))

(assert (=> b!1387407 m!1273047))

(assert (=> b!1387407 m!1273047))

(declare-fun m!1273061 () Bool)

(assert (=> b!1387407 m!1273061))

(declare-fun m!1273063 () Bool)

(assert (=> b!1387412 m!1273063))

(assert (=> b!1387412 m!1273063))

(declare-fun m!1273065 () Bool)

(assert (=> b!1387412 m!1273065))

(declare-fun m!1273067 () Bool)

(assert (=> b!1387412 m!1273067))

(declare-fun m!1273069 () Bool)

(assert (=> b!1387412 m!1273069))

(assert (=> b!1387412 m!1273049))

(assert (=> b!1387412 m!1273049))

(declare-fun m!1273071 () Bool)

(assert (=> b!1387412 m!1273071))

(check-sat (not b!1387412) (not start!118778) (not b!1387409) (not b!1387407) (not b!1387408) (not b!1387410))
(check-sat)
