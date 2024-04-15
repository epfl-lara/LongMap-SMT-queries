; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118612 () Bool)

(assert start!118612)

(declare-fun res!927854 () Bool)

(declare-fun e!785501 () Bool)

(assert (=> start!118612 (=> (not res!927854) (not e!785501))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118612 (= res!927854 (validMask!0 mask!2987))))

(assert (=> start!118612 e!785501))

(assert (=> start!118612 true))

(declare-datatypes ((array!94841 0))(
  ( (array!94842 (arr!45797 (Array (_ BitVec 32) (_ BitVec 64))) (size!46349 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94841)

(declare-fun array_inv!35030 (array!94841) Bool)

(assert (=> start!118612 (array_inv!35030 a!2938)))

(declare-fun b!1386673 () Bool)

(declare-datatypes ((Unit!46182 0))(
  ( (Unit!46183) )
))
(declare-fun e!785500 () Unit!46182)

(declare-fun lt!609382 () Unit!46182)

(assert (=> b!1386673 (= e!785500 lt!609382)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609383 () Unit!46182)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46182)

(assert (=> b!1386673 (= lt!609383 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10166 0))(
  ( (MissingZero!10166 (index!43035 (_ BitVec 32))) (Found!10166 (index!43036 (_ BitVec 32))) (Intermediate!10166 (undefined!10978 Bool) (index!43037 (_ BitVec 32)) (x!124644 (_ BitVec 32))) (Undefined!10166) (MissingVacant!10166 (index!43038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94841 (_ BitVec 32)) SeekEntryResult!10166)

(assert (=> b!1386673 (= (seekEntryOrOpen!0 (select (arr!45797 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45797 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94842 (store (arr!45797 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46349 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46182)

(assert (=> b!1386673 (= lt!609382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94841 (_ BitVec 32)) Bool)

(assert (=> b!1386673 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386674 () Bool)

(declare-fun res!927849 () Bool)

(assert (=> b!1386674 (=> (not res!927849) (not e!785501))))

(declare-datatypes ((List!32403 0))(
  ( (Nil!32400) (Cons!32399 (h!33608 (_ BitVec 64)) (t!47089 List!32403)) )
))
(declare-fun arrayNoDuplicates!0 (array!94841 (_ BitVec 32) List!32403) Bool)

(assert (=> b!1386674 (= res!927849 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32400))))

(declare-fun b!1386675 () Bool)

(declare-fun res!927853 () Bool)

(assert (=> b!1386675 (=> (not res!927853) (not e!785501))))

(assert (=> b!1386675 (= res!927853 (and (not (= (select (arr!45797 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45797 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386676 () Bool)

(declare-fun e!785502 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386676 (= e!785502 (validKeyInArray!0 (select (arr!45797 a!2938) startIndex!16)))))

(declare-fun b!1386677 () Bool)

(assert (=> b!1386677 (= e!785501 false)))

(declare-fun lt!609381 () Unit!46182)

(assert (=> b!1386677 (= lt!609381 e!785500)))

(declare-fun c!128855 () Bool)

(assert (=> b!1386677 (= c!128855 e!785502)))

(declare-fun res!927848 () Bool)

(assert (=> b!1386677 (=> (not res!927848) (not e!785502))))

(assert (=> b!1386677 (= res!927848 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386678 () Bool)

(declare-fun res!927851 () Bool)

(assert (=> b!1386678 (=> (not res!927851) (not e!785501))))

(assert (=> b!1386678 (= res!927851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386679 () Bool)

(declare-fun Unit!46184 () Unit!46182)

(assert (=> b!1386679 (= e!785500 Unit!46184)))

(declare-fun b!1386680 () Bool)

(declare-fun res!927850 () Bool)

(assert (=> b!1386680 (=> (not res!927850) (not e!785501))))

(assert (=> b!1386680 (= res!927850 (and (= (size!46349 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46349 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46349 a!2938))))))

(declare-fun b!1386681 () Bool)

(declare-fun res!927852 () Bool)

(assert (=> b!1386681 (=> (not res!927852) (not e!785501))))

(assert (=> b!1386681 (= res!927852 (validKeyInArray!0 (select (arr!45797 a!2938) i!1065)))))

(assert (= (and start!118612 res!927854) b!1386680))

(assert (= (and b!1386680 res!927850) b!1386681))

(assert (= (and b!1386681 res!927852) b!1386674))

(assert (= (and b!1386674 res!927849) b!1386678))

(assert (= (and b!1386678 res!927851) b!1386675))

(assert (= (and b!1386675 res!927853) b!1386677))

(assert (= (and b!1386677 res!927848) b!1386676))

(assert (= (and b!1386677 c!128855) b!1386673))

(assert (= (and b!1386677 (not c!128855)) b!1386679))

(declare-fun m!1271637 () Bool)

(assert (=> start!118612 m!1271637))

(declare-fun m!1271639 () Bool)

(assert (=> start!118612 m!1271639))

(declare-fun m!1271641 () Bool)

(assert (=> b!1386676 m!1271641))

(assert (=> b!1386676 m!1271641))

(declare-fun m!1271643 () Bool)

(assert (=> b!1386676 m!1271643))

(declare-fun m!1271645 () Bool)

(assert (=> b!1386681 m!1271645))

(assert (=> b!1386681 m!1271645))

(declare-fun m!1271647 () Bool)

(assert (=> b!1386681 m!1271647))

(declare-fun m!1271649 () Bool)

(assert (=> b!1386674 m!1271649))

(declare-fun m!1271651 () Bool)

(assert (=> b!1386678 m!1271651))

(declare-fun m!1271653 () Bool)

(assert (=> b!1386673 m!1271653))

(declare-fun m!1271655 () Bool)

(assert (=> b!1386673 m!1271655))

(assert (=> b!1386673 m!1271655))

(declare-fun m!1271657 () Bool)

(assert (=> b!1386673 m!1271657))

(declare-fun m!1271659 () Bool)

(assert (=> b!1386673 m!1271659))

(declare-fun m!1271661 () Bool)

(assert (=> b!1386673 m!1271661))

(assert (=> b!1386673 m!1271641))

(declare-fun m!1271663 () Bool)

(assert (=> b!1386673 m!1271663))

(assert (=> b!1386673 m!1271641))

(declare-fun m!1271665 () Bool)

(assert (=> b!1386673 m!1271665))

(assert (=> b!1386675 m!1271645))

(push 1)

(assert (not b!1386674))

(assert (not b!1386676))

(assert (not start!118612))

(assert (not b!1386678))

(assert (not b!1386681))

(assert (not b!1386673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

