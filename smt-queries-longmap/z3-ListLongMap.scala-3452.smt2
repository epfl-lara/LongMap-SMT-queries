; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47906 () Bool)

(assert start!47906)

(declare-fun b!527641 () Bool)

(declare-datatypes ((Unit!16668 0))(
  ( (Unit!16669) )
))
(declare-fun e!307507 () Unit!16668)

(declare-fun Unit!16670 () Unit!16668)

(assert (=> b!527641 (= e!307507 Unit!16670)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33474 0))(
  ( (array!33475 (arr!16087 (Array (_ BitVec 32) (_ BitVec 64))) (size!16451 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33474)

(declare-fun lt!242888 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242896 () Unit!16668)

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4554 0))(
  ( (MissingZero!4554 (index!20434 (_ BitVec 32))) (Found!4554 (index!20435 (_ BitVec 32))) (Intermediate!4554 (undefined!5366 Bool) (index!20436 (_ BitVec 32)) (x!49403 (_ BitVec 32))) (Undefined!4554) (MissingVacant!4554 (index!20437 (_ BitVec 32))) )
))
(declare-fun lt!242895 () SeekEntryResult!4554)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16668)

(assert (=> b!527641 (= lt!242896 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242888 #b00000000000000000000000000000000 (index!20436 lt!242895) (x!49403 lt!242895) mask!3524))))

(declare-fun lt!242894 () (_ BitVec 64))

(declare-fun lt!242889 () array!33474)

(declare-fun res!323937 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33474 (_ BitVec 32)) SeekEntryResult!4554)

(assert (=> b!527641 (= res!323937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242888 lt!242894 lt!242889 mask!3524) (Intermediate!4554 false (index!20436 lt!242895) (x!49403 lt!242895))))))

(declare-fun e!307511 () Bool)

(assert (=> b!527641 (=> (not res!323937) (not e!307511))))

(assert (=> b!527641 e!307511))

(declare-fun b!527642 () Bool)

(declare-fun res!323944 () Bool)

(declare-fun e!307512 () Bool)

(assert (=> b!527642 (=> (not res!323944) (not e!307512))))

(declare-fun arrayContainsKey!0 (array!33474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527642 (= res!323944 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527643 () Bool)

(declare-fun e!307508 () Bool)

(assert (=> b!527643 (= e!307508 true)))

(assert (=> b!527643 (= (index!20436 lt!242895) i!1204)))

(declare-fun lt!242893 () Unit!16668)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16668)

(assert (=> b!527643 (= lt!242893 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242888 #b00000000000000000000000000000000 (index!20436 lt!242895) (x!49403 lt!242895) mask!3524))))

(assert (=> b!527643 (and (or (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242887 () Unit!16668)

(assert (=> b!527643 (= lt!242887 e!307507)))

(declare-fun c!62159 () Bool)

(assert (=> b!527643 (= c!62159 (= (select (arr!16087 a!3235) (index!20436 lt!242895)) (select (arr!16087 a!3235) j!176)))))

(assert (=> b!527643 (and (bvslt (x!49403 lt!242895) #b01111111111111111111111111111110) (or (= (select (arr!16087 a!3235) (index!20436 lt!242895)) (select (arr!16087 a!3235) j!176)) (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16087 a!3235) (index!20436 lt!242895)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527644 () Bool)

(declare-fun res!323942 () Bool)

(assert (=> b!527644 (=> (not res!323942) (not e!307512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527644 (= res!323942 (validKeyInArray!0 k0!2280))))

(declare-fun b!527645 () Bool)

(declare-fun res!323938 () Bool)

(declare-fun e!307509 () Bool)

(assert (=> b!527645 (=> (not res!323938) (not e!307509))))

(declare-datatypes ((List!10245 0))(
  ( (Nil!10242) (Cons!10241 (h!11175 (_ BitVec 64)) (t!16473 List!10245)) )
))
(declare-fun arrayNoDuplicates!0 (array!33474 (_ BitVec 32) List!10245) Bool)

(assert (=> b!527645 (= res!323938 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10242))))

(declare-fun b!527646 () Bool)

(declare-fun res!323945 () Bool)

(assert (=> b!527646 (=> (not res!323945) (not e!307512))))

(assert (=> b!527646 (= res!323945 (validKeyInArray!0 (select (arr!16087 a!3235) j!176)))))

(declare-fun b!527647 () Bool)

(declare-fun res!323947 () Bool)

(assert (=> b!527647 (=> (not res!323947) (not e!307512))))

(assert (=> b!527647 (= res!323947 (and (= (size!16451 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16451 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16451 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527648 () Bool)

(assert (=> b!527648 (= e!307509 (not e!307508))))

(declare-fun res!323941 () Bool)

(assert (=> b!527648 (=> res!323941 e!307508)))

(declare-fun lt!242892 () (_ BitVec 32))

(assert (=> b!527648 (= res!323941 (= lt!242895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242892 lt!242894 lt!242889 mask!3524)))))

(assert (=> b!527648 (= lt!242895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242888 (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527648 (= lt!242892 (toIndex!0 lt!242894 mask!3524))))

(assert (=> b!527648 (= lt!242894 (select (store (arr!16087 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527648 (= lt!242888 (toIndex!0 (select (arr!16087 a!3235) j!176) mask!3524))))

(assert (=> b!527648 (= lt!242889 (array!33475 (store (arr!16087 a!3235) i!1204 k0!2280) (size!16451 a!3235)))))

(declare-fun e!307506 () Bool)

(assert (=> b!527648 e!307506))

(declare-fun res!323943 () Bool)

(assert (=> b!527648 (=> (not res!323943) (not e!307506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33474 (_ BitVec 32)) Bool)

(assert (=> b!527648 (= res!323943 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242890 () Unit!16668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16668)

(assert (=> b!527648 (= lt!242890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!323940 () Bool)

(assert (=> start!47906 (=> (not res!323940) (not e!307512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47906 (= res!323940 (validMask!0 mask!3524))))

(assert (=> start!47906 e!307512))

(assert (=> start!47906 true))

(declare-fun array_inv!11883 (array!33474) Bool)

(assert (=> start!47906 (array_inv!11883 a!3235)))

(declare-fun b!527649 () Bool)

(declare-fun Unit!16671 () Unit!16668)

(assert (=> b!527649 (= e!307507 Unit!16671)))

(declare-fun b!527650 () Bool)

(declare-fun res!323946 () Bool)

(assert (=> b!527650 (=> (not res!323946) (not e!307509))))

(assert (=> b!527650 (= res!323946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527651 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33474 (_ BitVec 32)) SeekEntryResult!4554)

(assert (=> b!527651 (= e!307506 (= (seekEntryOrOpen!0 (select (arr!16087 a!3235) j!176) a!3235 mask!3524) (Found!4554 j!176)))))

(declare-fun b!527652 () Bool)

(declare-fun res!323948 () Bool)

(assert (=> b!527652 (=> res!323948 e!307508)))

(get-info :version)

(assert (=> b!527652 (= res!323948 (or (undefined!5366 lt!242895) (not ((_ is Intermediate!4554) lt!242895))))))

(declare-fun b!527653 () Bool)

(assert (=> b!527653 (= e!307512 e!307509)))

(declare-fun res!323939 () Bool)

(assert (=> b!527653 (=> (not res!323939) (not e!307509))))

(declare-fun lt!242891 () SeekEntryResult!4554)

(assert (=> b!527653 (= res!323939 (or (= lt!242891 (MissingZero!4554 i!1204)) (= lt!242891 (MissingVacant!4554 i!1204))))))

(assert (=> b!527653 (= lt!242891 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527654 () Bool)

(assert (=> b!527654 (= e!307511 false)))

(assert (= (and start!47906 res!323940) b!527647))

(assert (= (and b!527647 res!323947) b!527646))

(assert (= (and b!527646 res!323945) b!527644))

(assert (= (and b!527644 res!323942) b!527642))

(assert (= (and b!527642 res!323944) b!527653))

(assert (= (and b!527653 res!323939) b!527650))

(assert (= (and b!527650 res!323946) b!527645))

(assert (= (and b!527645 res!323938) b!527648))

(assert (= (and b!527648 res!323943) b!527651))

(assert (= (and b!527648 (not res!323941)) b!527652))

(assert (= (and b!527652 (not res!323948)) b!527643))

(assert (= (and b!527643 c!62159) b!527641))

(assert (= (and b!527643 (not c!62159)) b!527649))

(assert (= (and b!527641 res!323937) b!527654))

(declare-fun m!508301 () Bool)

(assert (=> b!527644 m!508301))

(declare-fun m!508303 () Bool)

(assert (=> b!527642 m!508303))

(declare-fun m!508305 () Bool)

(assert (=> b!527650 m!508305))

(declare-fun m!508307 () Bool)

(assert (=> b!527653 m!508307))

(declare-fun m!508309 () Bool)

(assert (=> b!527645 m!508309))

(declare-fun m!508311 () Bool)

(assert (=> start!47906 m!508311))

(declare-fun m!508313 () Bool)

(assert (=> start!47906 m!508313))

(declare-fun m!508315 () Bool)

(assert (=> b!527641 m!508315))

(declare-fun m!508317 () Bool)

(assert (=> b!527641 m!508317))

(declare-fun m!508319 () Bool)

(assert (=> b!527646 m!508319))

(assert (=> b!527646 m!508319))

(declare-fun m!508321 () Bool)

(assert (=> b!527646 m!508321))

(assert (=> b!527651 m!508319))

(assert (=> b!527651 m!508319))

(declare-fun m!508323 () Bool)

(assert (=> b!527651 m!508323))

(declare-fun m!508325 () Bool)

(assert (=> b!527648 m!508325))

(declare-fun m!508327 () Bool)

(assert (=> b!527648 m!508327))

(declare-fun m!508329 () Bool)

(assert (=> b!527648 m!508329))

(declare-fun m!508331 () Bool)

(assert (=> b!527648 m!508331))

(assert (=> b!527648 m!508319))

(declare-fun m!508333 () Bool)

(assert (=> b!527648 m!508333))

(assert (=> b!527648 m!508319))

(declare-fun m!508335 () Bool)

(assert (=> b!527648 m!508335))

(declare-fun m!508337 () Bool)

(assert (=> b!527648 m!508337))

(declare-fun m!508339 () Bool)

(assert (=> b!527648 m!508339))

(assert (=> b!527648 m!508319))

(declare-fun m!508341 () Bool)

(assert (=> b!527643 m!508341))

(declare-fun m!508343 () Bool)

(assert (=> b!527643 m!508343))

(assert (=> b!527643 m!508319))

(check-sat (not b!527645) (not b!527646) (not b!527643) (not start!47906) (not b!527641) (not b!527653) (not b!527642) (not b!527644) (not b!527651) (not b!527650) (not b!527648))
(check-sat)
