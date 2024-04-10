; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118612 () Bool)

(assert start!118612)

(declare-fun b!1386688 () Bool)

(declare-fun e!785509 () Bool)

(declare-datatypes ((array!94888 0))(
  ( (array!94889 (arr!45820 (Array (_ BitVec 32) (_ BitVec 64))) (size!46370 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94888)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386688 (= e!785509 (validKeyInArray!0 (select (arr!45820 a!2938) startIndex!16)))))

(declare-fun b!1386689 () Bool)

(declare-fun res!927837 () Bool)

(declare-fun e!785507 () Bool)

(assert (=> b!1386689 (=> (not res!927837) (not e!785507))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386689 (= res!927837 (and (not (= (select (arr!45820 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45820 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386690 () Bool)

(declare-fun res!927834 () Bool)

(assert (=> b!1386690 (=> (not res!927834) (not e!785507))))

(declare-datatypes ((List!32348 0))(
  ( (Nil!32345) (Cons!32344 (h!33553 (_ BitVec 64)) (t!47042 List!32348)) )
))
(declare-fun arrayNoDuplicates!0 (array!94888 (_ BitVec 32) List!32348) Bool)

(assert (=> b!1386690 (= res!927834 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32345))))

(declare-fun b!1386691 () Bool)

(assert (=> b!1386691 (= e!785507 false)))

(declare-datatypes ((Unit!46331 0))(
  ( (Unit!46332) )
))
(declare-fun lt!609548 () Unit!46331)

(declare-fun e!785508 () Unit!46331)

(assert (=> b!1386691 (= lt!609548 e!785508)))

(declare-fun c!128868 () Bool)

(assert (=> b!1386691 (= c!128868 e!785509)))

(declare-fun res!927835 () Bool)

(assert (=> b!1386691 (=> (not res!927835) (not e!785509))))

(assert (=> b!1386691 (= res!927835 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386692 () Bool)

(declare-fun res!927833 () Bool)

(assert (=> b!1386692 (=> (not res!927833) (not e!785507))))

(assert (=> b!1386692 (= res!927833 (validKeyInArray!0 (select (arr!45820 a!2938) i!1065)))))

(declare-fun res!927836 () Bool)

(assert (=> start!118612 (=> (not res!927836) (not e!785507))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118612 (= res!927836 (validMask!0 mask!2987))))

(assert (=> start!118612 e!785507))

(assert (=> start!118612 true))

(declare-fun array_inv!34848 (array!94888) Bool)

(assert (=> start!118612 (array_inv!34848 a!2938)))

(declare-fun b!1386693 () Bool)

(declare-fun lt!609547 () Unit!46331)

(assert (=> b!1386693 (= e!785508 lt!609547)))

(declare-fun lt!609549 () Unit!46331)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46331)

(assert (=> b!1386693 (= lt!609549 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10163 0))(
  ( (MissingZero!10163 (index!43023 (_ BitVec 32))) (Found!10163 (index!43024 (_ BitVec 32))) (Intermediate!10163 (undefined!10975 Bool) (index!43025 (_ BitVec 32)) (x!124636 (_ BitVec 32))) (Undefined!10163) (MissingVacant!10163 (index!43026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94888 (_ BitVec 32)) SeekEntryResult!10163)

(assert (=> b!1386693 (= (seekEntryOrOpen!0 (select (arr!45820 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45820 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94889 (store (arr!45820 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46370 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46331)

(assert (=> b!1386693 (= lt!609547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94888 (_ BitVec 32)) Bool)

(assert (=> b!1386693 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386694 () Bool)

(declare-fun res!927838 () Bool)

(assert (=> b!1386694 (=> (not res!927838) (not e!785507))))

(assert (=> b!1386694 (= res!927838 (and (= (size!46370 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46370 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46370 a!2938))))))

(declare-fun b!1386695 () Bool)

(declare-fun res!927832 () Bool)

(assert (=> b!1386695 (=> (not res!927832) (not e!785507))))

(assert (=> b!1386695 (= res!927832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386696 () Bool)

(declare-fun Unit!46333 () Unit!46331)

(assert (=> b!1386696 (= e!785508 Unit!46333)))

(assert (= (and start!118612 res!927836) b!1386694))

(assert (= (and b!1386694 res!927838) b!1386692))

(assert (= (and b!1386692 res!927833) b!1386690))

(assert (= (and b!1386690 res!927834) b!1386695))

(assert (= (and b!1386695 res!927832) b!1386689))

(assert (= (and b!1386689 res!927837) b!1386691))

(assert (= (and b!1386691 res!927835) b!1386688))

(assert (= (and b!1386691 c!128868) b!1386693))

(assert (= (and b!1386691 (not c!128868)) b!1386696))

(declare-fun m!1272081 () Bool)

(assert (=> b!1386688 m!1272081))

(assert (=> b!1386688 m!1272081))

(declare-fun m!1272083 () Bool)

(assert (=> b!1386688 m!1272083))

(declare-fun m!1272085 () Bool)

(assert (=> b!1386689 m!1272085))

(declare-fun m!1272087 () Bool)

(assert (=> start!118612 m!1272087))

(declare-fun m!1272089 () Bool)

(assert (=> start!118612 m!1272089))

(declare-fun m!1272091 () Bool)

(assert (=> b!1386690 m!1272091))

(declare-fun m!1272093 () Bool)

(assert (=> b!1386695 m!1272093))

(assert (=> b!1386692 m!1272085))

(assert (=> b!1386692 m!1272085))

(declare-fun m!1272095 () Bool)

(assert (=> b!1386692 m!1272095))

(declare-fun m!1272097 () Bool)

(assert (=> b!1386693 m!1272097))

(declare-fun m!1272099 () Bool)

(assert (=> b!1386693 m!1272099))

(assert (=> b!1386693 m!1272099))

(declare-fun m!1272101 () Bool)

(assert (=> b!1386693 m!1272101))

(declare-fun m!1272103 () Bool)

(assert (=> b!1386693 m!1272103))

(declare-fun m!1272105 () Bool)

(assert (=> b!1386693 m!1272105))

(assert (=> b!1386693 m!1272081))

(declare-fun m!1272107 () Bool)

(assert (=> b!1386693 m!1272107))

(assert (=> b!1386693 m!1272081))

(declare-fun m!1272109 () Bool)

(assert (=> b!1386693 m!1272109))

(push 1)

(assert (not start!118612))

(assert (not b!1386692))

(assert (not b!1386690))

(assert (not b!1386693))

(assert (not b!1386695))

(assert (not b!1386688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

