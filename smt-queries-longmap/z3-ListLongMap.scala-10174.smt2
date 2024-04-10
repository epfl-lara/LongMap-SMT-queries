; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119972 () Bool)

(assert start!119972)

(declare-fun res!935498 () Bool)

(declare-fun e!790654 () Bool)

(assert (=> start!119972 (=> (not res!935498) (not e!790654))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119972 (= res!935498 (validMask!0 mask!2840))))

(assert (=> start!119972 e!790654))

(assert (=> start!119972 true))

(declare-datatypes ((array!95501 0))(
  ( (array!95502 (arr!46104 (Array (_ BitVec 32) (_ BitVec 64))) (size!46654 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95501)

(declare-fun array_inv!35132 (array!95501) Bool)

(assert (=> start!119972 (array_inv!35132 a!2901)))

(declare-fun b!1396582 () Bool)

(declare-fun res!935503 () Bool)

(assert (=> b!1396582 (=> (not res!935503) (not e!790654))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396582 (= res!935503 (validKeyInArray!0 (select (arr!46104 a!2901) j!112)))))

(declare-fun b!1396583 () Bool)

(declare-fun e!790658 () Bool)

(assert (=> b!1396583 (= e!790658 true)))

(declare-fun lt!613540 () array!95501)

(declare-fun lt!613541 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10421 0))(
  ( (MissingZero!10421 (index!44055 (_ BitVec 32))) (Found!10421 (index!44056 (_ BitVec 32))) (Intermediate!10421 (undefined!11233 Bool) (index!44057 (_ BitVec 32)) (x!125723 (_ BitVec 32))) (Undefined!10421) (MissingVacant!10421 (index!44058 (_ BitVec 32))) )
))
(declare-fun lt!613539 () SeekEntryResult!10421)

(declare-fun lt!613537 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95501 (_ BitVec 32)) SeekEntryResult!10421)

(assert (=> b!1396583 (= lt!613539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613537 lt!613541 lt!613540 mask!2840))))

(declare-fun b!1396584 () Bool)

(declare-fun res!935496 () Bool)

(assert (=> b!1396584 (=> (not res!935496) (not e!790654))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396584 (= res!935496 (validKeyInArray!0 (select (arr!46104 a!2901) i!1037)))))

(declare-fun b!1396585 () Bool)

(declare-fun e!790656 () Bool)

(assert (=> b!1396585 (= e!790656 e!790658)))

(declare-fun res!935500 () Bool)

(assert (=> b!1396585 (=> res!935500 e!790658)))

(declare-fun lt!613536 () SeekEntryResult!10421)

(declare-fun lt!613538 () SeekEntryResult!10421)

(get-info :version)

(assert (=> b!1396585 (= res!935500 (or (= lt!613538 lt!613536) (not ((_ is Intermediate!10421) lt!613536)) (bvslt (x!125723 lt!613538) #b00000000000000000000000000000000) (bvsgt (x!125723 lt!613538) #b01111111111111111111111111111110) (bvslt lt!613537 #b00000000000000000000000000000000) (bvsge lt!613537 (size!46654 a!2901)) (bvslt (index!44057 lt!613538) #b00000000000000000000000000000000) (bvsge (index!44057 lt!613538) (size!46654 a!2901)) (not (= lt!613538 (Intermediate!10421 false (index!44057 lt!613538) (x!125723 lt!613538)))) (not (= lt!613536 (Intermediate!10421 (undefined!11233 lt!613536) (index!44057 lt!613536) (x!125723 lt!613536))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396585 (= lt!613536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613541 mask!2840) lt!613541 lt!613540 mask!2840))))

(assert (=> b!1396585 (= lt!613541 (select (store (arr!46104 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396585 (= lt!613540 (array!95502 (store (arr!46104 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46654 a!2901)))))

(declare-fun b!1396586 () Bool)

(declare-fun e!790655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95501 (_ BitVec 32)) SeekEntryResult!10421)

(assert (=> b!1396586 (= e!790655 (= (seekEntryOrOpen!0 (select (arr!46104 a!2901) j!112) a!2901 mask!2840) (Found!10421 j!112)))))

(declare-fun b!1396587 () Bool)

(declare-fun res!935499 () Bool)

(assert (=> b!1396587 (=> (not res!935499) (not e!790654))))

(declare-datatypes ((List!32623 0))(
  ( (Nil!32620) (Cons!32619 (h!33861 (_ BitVec 64)) (t!47317 List!32623)) )
))
(declare-fun arrayNoDuplicates!0 (array!95501 (_ BitVec 32) List!32623) Bool)

(assert (=> b!1396587 (= res!935499 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32620))))

(declare-fun b!1396588 () Bool)

(declare-fun res!935495 () Bool)

(assert (=> b!1396588 (=> (not res!935495) (not e!790654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95501 (_ BitVec 32)) Bool)

(assert (=> b!1396588 (= res!935495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396589 () Bool)

(assert (=> b!1396589 (= e!790654 (not e!790656))))

(declare-fun res!935497 () Bool)

(assert (=> b!1396589 (=> res!935497 e!790656)))

(assert (=> b!1396589 (= res!935497 (or (not ((_ is Intermediate!10421) lt!613538)) (undefined!11233 lt!613538)))))

(assert (=> b!1396589 e!790655))

(declare-fun res!935501 () Bool)

(assert (=> b!1396589 (=> (not res!935501) (not e!790655))))

(assert (=> b!1396589 (= res!935501 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46846 0))(
  ( (Unit!46847) )
))
(declare-fun lt!613542 () Unit!46846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46846)

(assert (=> b!1396589 (= lt!613542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396589 (= lt!613538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613537 (select (arr!46104 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396589 (= lt!613537 (toIndex!0 (select (arr!46104 a!2901) j!112) mask!2840))))

(declare-fun b!1396590 () Bool)

(declare-fun res!935502 () Bool)

(assert (=> b!1396590 (=> (not res!935502) (not e!790654))))

(assert (=> b!1396590 (= res!935502 (and (= (size!46654 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46654 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46654 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119972 res!935498) b!1396590))

(assert (= (and b!1396590 res!935502) b!1396584))

(assert (= (and b!1396584 res!935496) b!1396582))

(assert (= (and b!1396582 res!935503) b!1396588))

(assert (= (and b!1396588 res!935495) b!1396587))

(assert (= (and b!1396587 res!935499) b!1396589))

(assert (= (and b!1396589 res!935501) b!1396586))

(assert (= (and b!1396589 (not res!935497)) b!1396585))

(assert (= (and b!1396585 (not res!935500)) b!1396583))

(declare-fun m!1283067 () Bool)

(assert (=> b!1396589 m!1283067))

(declare-fun m!1283069 () Bool)

(assert (=> b!1396589 m!1283069))

(declare-fun m!1283071 () Bool)

(assert (=> b!1396589 m!1283071))

(assert (=> b!1396589 m!1283067))

(declare-fun m!1283073 () Bool)

(assert (=> b!1396589 m!1283073))

(assert (=> b!1396589 m!1283067))

(declare-fun m!1283075 () Bool)

(assert (=> b!1396589 m!1283075))

(assert (=> b!1396586 m!1283067))

(assert (=> b!1396586 m!1283067))

(declare-fun m!1283077 () Bool)

(assert (=> b!1396586 m!1283077))

(declare-fun m!1283079 () Bool)

(assert (=> b!1396587 m!1283079))

(assert (=> b!1396582 m!1283067))

(assert (=> b!1396582 m!1283067))

(declare-fun m!1283081 () Bool)

(assert (=> b!1396582 m!1283081))

(declare-fun m!1283083 () Bool)

(assert (=> start!119972 m!1283083))

(declare-fun m!1283085 () Bool)

(assert (=> start!119972 m!1283085))

(declare-fun m!1283087 () Bool)

(assert (=> b!1396585 m!1283087))

(assert (=> b!1396585 m!1283087))

(declare-fun m!1283089 () Bool)

(assert (=> b!1396585 m!1283089))

(declare-fun m!1283091 () Bool)

(assert (=> b!1396585 m!1283091))

(declare-fun m!1283093 () Bool)

(assert (=> b!1396585 m!1283093))

(declare-fun m!1283095 () Bool)

(assert (=> b!1396583 m!1283095))

(declare-fun m!1283097 () Bool)

(assert (=> b!1396584 m!1283097))

(assert (=> b!1396584 m!1283097))

(declare-fun m!1283099 () Bool)

(assert (=> b!1396584 m!1283099))

(declare-fun m!1283101 () Bool)

(assert (=> b!1396588 m!1283101))

(check-sat (not start!119972) (not b!1396586) (not b!1396582) (not b!1396585) (not b!1396588) (not b!1396584) (not b!1396589) (not b!1396587) (not b!1396583))
(check-sat)
