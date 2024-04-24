; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120578 () Bool)

(assert start!120578)

(declare-fun b!1402583 () Bool)

(declare-fun e!794277 () Bool)

(assert (=> b!1402583 (= e!794277 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10523 0))(
  ( (MissingZero!10523 (index!44469 (_ BitVec 32))) (Found!10523 (index!44470 (_ BitVec 32))) (Intermediate!10523 (undefined!11335 Bool) (index!44471 (_ BitVec 32)) (x!126257 (_ BitVec 32))) (Undefined!10523) (MissingVacant!10523 (index!44472 (_ BitVec 32))) )
))
(declare-fun lt!617338 () SeekEntryResult!10523)

(declare-fun lt!617335 () (_ BitVec 64))

(declare-datatypes ((array!95909 0))(
  ( (array!95910 (arr!46303 (Array (_ BitVec 32) (_ BitVec 64))) (size!46854 (_ BitVec 32))) )
))
(declare-fun lt!617337 () array!95909)

(declare-fun lt!617336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95909 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1402583 (= lt!617338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617336 lt!617335 lt!617337 mask!2840))))

(declare-fun a!2901 () array!95909)

(declare-fun b!1402584 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!617339 () SeekEntryResult!10523)

(declare-fun e!794273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95909 (_ BitVec 32)) SeekEntryResult!10523)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95909 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1402584 (= e!794273 (= (seekEntryOrOpen!0 lt!617335 lt!617337 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126257 lt!617339) (index!44471 lt!617339) (index!44471 lt!617339) (select (arr!46303 a!2901) j!112) lt!617337 mask!2840)))))

(declare-fun b!1402585 () Bool)

(declare-fun res!940418 () Bool)

(declare-fun e!794279 () Bool)

(assert (=> b!1402585 (=> (not res!940418) (not e!794279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95909 (_ BitVec 32)) Bool)

(assert (=> b!1402585 (= res!940418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402586 () Bool)

(declare-fun e!794275 () Bool)

(assert (=> b!1402586 (= e!794279 (not e!794275))))

(declare-fun res!940414 () Bool)

(assert (=> b!1402586 (=> res!940414 e!794275)))

(declare-fun lt!617332 () SeekEntryResult!10523)

(get-info :version)

(assert (=> b!1402586 (= res!940414 (or (not ((_ is Intermediate!10523) lt!617332)) (undefined!11335 lt!617332)))))

(declare-fun e!794276 () Bool)

(assert (=> b!1402586 e!794276))

(declare-fun res!940411 () Bool)

(assert (=> b!1402586 (=> (not res!940411) (not e!794276))))

(assert (=> b!1402586 (= res!940411 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47077 0))(
  ( (Unit!47078) )
))
(declare-fun lt!617334 () Unit!47077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47077)

(assert (=> b!1402586 (= lt!617334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402586 (= lt!617332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617336 (select (arr!46303 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402586 (= lt!617336 (toIndex!0 (select (arr!46303 a!2901) j!112) mask!2840))))

(declare-fun b!1402587 () Bool)

(declare-fun res!940415 () Bool)

(assert (=> b!1402587 (=> (not res!940415) (not e!794279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402587 (= res!940415 (validKeyInArray!0 (select (arr!46303 a!2901) j!112)))))

(declare-fun b!1402588 () Bool)

(declare-fun e!794278 () Bool)

(assert (=> b!1402588 (= e!794278 e!794277)))

(declare-fun res!940416 () Bool)

(assert (=> b!1402588 (=> res!940416 e!794277)))

(assert (=> b!1402588 (= res!940416 (or (bvslt (x!126257 lt!617332) #b00000000000000000000000000000000) (bvsgt (x!126257 lt!617332) #b01111111111111111111111111111110) (bvslt (x!126257 lt!617339) #b00000000000000000000000000000000) (bvsgt (x!126257 lt!617339) #b01111111111111111111111111111110) (bvslt lt!617336 #b00000000000000000000000000000000) (bvsge lt!617336 (size!46854 a!2901)) (bvslt (index!44471 lt!617332) #b00000000000000000000000000000000) (bvsge (index!44471 lt!617332) (size!46854 a!2901)) (bvslt (index!44471 lt!617339) #b00000000000000000000000000000000) (bvsge (index!44471 lt!617339) (size!46854 a!2901)) (not (= lt!617332 (Intermediate!10523 false (index!44471 lt!617332) (x!126257 lt!617332)))) (not (= lt!617339 (Intermediate!10523 false (index!44471 lt!617339) (x!126257 lt!617339))))))))

(assert (=> b!1402588 e!794273))

(declare-fun res!940410 () Bool)

(assert (=> b!1402588 (=> (not res!940410) (not e!794273))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402588 (= res!940410 (and (not (undefined!11335 lt!617339)) (= (index!44471 lt!617339) i!1037) (bvslt (x!126257 lt!617339) (x!126257 lt!617332)) (= (select (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44471 lt!617339)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617333 () Unit!47077)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47077)

(assert (=> b!1402588 (= lt!617333 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617336 (x!126257 lt!617332) (index!44471 lt!617332) (x!126257 lt!617339) (index!44471 lt!617339) (undefined!11335 lt!617339) mask!2840))))

(declare-fun res!940417 () Bool)

(assert (=> start!120578 (=> (not res!940417) (not e!794279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120578 (= res!940417 (validMask!0 mask!2840))))

(assert (=> start!120578 e!794279))

(assert (=> start!120578 true))

(declare-fun array_inv!35584 (array!95909) Bool)

(assert (=> start!120578 (array_inv!35584 a!2901)))

(declare-fun b!1402589 () Bool)

(declare-fun res!940413 () Bool)

(assert (=> b!1402589 (=> (not res!940413) (not e!794279))))

(declare-datatypes ((List!32809 0))(
  ( (Nil!32806) (Cons!32805 (h!34061 (_ BitVec 64)) (t!47495 List!32809)) )
))
(declare-fun arrayNoDuplicates!0 (array!95909 (_ BitVec 32) List!32809) Bool)

(assert (=> b!1402589 (= res!940413 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32806))))

(declare-fun b!1402590 () Bool)

(assert (=> b!1402590 (= e!794275 e!794278)))

(declare-fun res!940412 () Bool)

(assert (=> b!1402590 (=> res!940412 e!794278)))

(assert (=> b!1402590 (= res!940412 (or (= lt!617332 lt!617339) (not ((_ is Intermediate!10523) lt!617339))))))

(assert (=> b!1402590 (= lt!617339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617335 mask!2840) lt!617335 lt!617337 mask!2840))))

(assert (=> b!1402590 (= lt!617335 (select (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402590 (= lt!617337 (array!95910 (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46854 a!2901)))))

(declare-fun b!1402591 () Bool)

(assert (=> b!1402591 (= e!794276 (= (seekEntryOrOpen!0 (select (arr!46303 a!2901) j!112) a!2901 mask!2840) (Found!10523 j!112)))))

(declare-fun b!1402592 () Bool)

(declare-fun res!940420 () Bool)

(assert (=> b!1402592 (=> (not res!940420) (not e!794279))))

(assert (=> b!1402592 (= res!940420 (validKeyInArray!0 (select (arr!46303 a!2901) i!1037)))))

(declare-fun b!1402593 () Bool)

(declare-fun res!940419 () Bool)

(assert (=> b!1402593 (=> (not res!940419) (not e!794279))))

(assert (=> b!1402593 (= res!940419 (and (= (size!46854 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46854 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46854 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120578 res!940417) b!1402593))

(assert (= (and b!1402593 res!940419) b!1402592))

(assert (= (and b!1402592 res!940420) b!1402587))

(assert (= (and b!1402587 res!940415) b!1402585))

(assert (= (and b!1402585 res!940418) b!1402589))

(assert (= (and b!1402589 res!940413) b!1402586))

(assert (= (and b!1402586 res!940411) b!1402591))

(assert (= (and b!1402586 (not res!940414)) b!1402590))

(assert (= (and b!1402590 (not res!940412)) b!1402588))

(assert (= (and b!1402588 res!940410) b!1402584))

(assert (= (and b!1402588 (not res!940416)) b!1402583))

(declare-fun m!1290601 () Bool)

(assert (=> b!1402587 m!1290601))

(assert (=> b!1402587 m!1290601))

(declare-fun m!1290603 () Bool)

(assert (=> b!1402587 m!1290603))

(assert (=> b!1402591 m!1290601))

(assert (=> b!1402591 m!1290601))

(declare-fun m!1290605 () Bool)

(assert (=> b!1402591 m!1290605))

(declare-fun m!1290607 () Bool)

(assert (=> b!1402590 m!1290607))

(assert (=> b!1402590 m!1290607))

(declare-fun m!1290609 () Bool)

(assert (=> b!1402590 m!1290609))

(declare-fun m!1290611 () Bool)

(assert (=> b!1402590 m!1290611))

(declare-fun m!1290613 () Bool)

(assert (=> b!1402590 m!1290613))

(declare-fun m!1290615 () Bool)

(assert (=> b!1402583 m!1290615))

(declare-fun m!1290617 () Bool)

(assert (=> b!1402584 m!1290617))

(assert (=> b!1402584 m!1290601))

(assert (=> b!1402584 m!1290601))

(declare-fun m!1290619 () Bool)

(assert (=> b!1402584 m!1290619))

(declare-fun m!1290621 () Bool)

(assert (=> b!1402585 m!1290621))

(assert (=> b!1402588 m!1290611))

(declare-fun m!1290623 () Bool)

(assert (=> b!1402588 m!1290623))

(declare-fun m!1290625 () Bool)

(assert (=> b!1402588 m!1290625))

(declare-fun m!1290627 () Bool)

(assert (=> b!1402589 m!1290627))

(declare-fun m!1290629 () Bool)

(assert (=> b!1402592 m!1290629))

(assert (=> b!1402592 m!1290629))

(declare-fun m!1290631 () Bool)

(assert (=> b!1402592 m!1290631))

(assert (=> b!1402586 m!1290601))

(declare-fun m!1290633 () Bool)

(assert (=> b!1402586 m!1290633))

(assert (=> b!1402586 m!1290601))

(declare-fun m!1290635 () Bool)

(assert (=> b!1402586 m!1290635))

(assert (=> b!1402586 m!1290601))

(declare-fun m!1290637 () Bool)

(assert (=> b!1402586 m!1290637))

(declare-fun m!1290639 () Bool)

(assert (=> b!1402586 m!1290639))

(declare-fun m!1290641 () Bool)

(assert (=> start!120578 m!1290641))

(declare-fun m!1290643 () Bool)

(assert (=> start!120578 m!1290643))

(check-sat (not b!1402591) (not b!1402586) (not b!1402588) (not start!120578) (not b!1402584) (not b!1402592) (not b!1402587) (not b!1402583) (not b!1402585) (not b!1402589) (not b!1402590))
(check-sat)
