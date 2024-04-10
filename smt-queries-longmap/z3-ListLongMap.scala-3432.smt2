; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47714 () Bool)

(assert start!47714)

(declare-fun b!524794 () Bool)

(declare-fun res!321654 () Bool)

(declare-fun e!306041 () Bool)

(assert (=> b!524794 (=> res!321654 e!306041)))

(declare-datatypes ((SeekEntryResult!4494 0))(
  ( (MissingZero!4494 (index!20188 (_ BitVec 32))) (Found!4494 (index!20189 (_ BitVec 32))) (Intermediate!4494 (undefined!5306 Bool) (index!20190 (_ BitVec 32)) (x!49171 (_ BitVec 32))) (Undefined!4494) (MissingVacant!4494 (index!20191 (_ BitVec 32))) )
))
(declare-fun lt!240942 () SeekEntryResult!4494)

(get-info :version)

(assert (=> b!524794 (= res!321654 (or (undefined!5306 lt!240942) (not ((_ is Intermediate!4494) lt!240942))))))

(declare-fun b!524795 () Bool)

(declare-fun res!321656 () Bool)

(declare-fun e!306039 () Bool)

(assert (=> b!524795 (=> (not res!321656) (not e!306039))))

(declare-datatypes ((array!33351 0))(
  ( (array!33352 (arr!16027 (Array (_ BitVec 32) (_ BitVec 64))) (size!16391 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33351)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524795 (= res!321656 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524796 () Bool)

(declare-fun res!321661 () Bool)

(declare-fun e!306036 () Bool)

(assert (=> b!524796 (=> (not res!321661) (not e!306036))))

(declare-datatypes ((List!10185 0))(
  ( (Nil!10182) (Cons!10181 (h!11112 (_ BitVec 64)) (t!16413 List!10185)) )
))
(declare-fun arrayNoDuplicates!0 (array!33351 (_ BitVec 32) List!10185) Bool)

(assert (=> b!524796 (= res!321661 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10182))))

(declare-fun b!524797 () Bool)

(declare-fun res!321662 () Bool)

(assert (=> b!524797 (=> (not res!321662) (not e!306039))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524797 (= res!321662 (validKeyInArray!0 (select (arr!16027 a!3235) j!176)))))

(declare-fun b!524798 () Bool)

(declare-fun res!321653 () Bool)

(assert (=> b!524798 (=> (not res!321653) (not e!306036))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33351 (_ BitVec 32)) Bool)

(assert (=> b!524798 (= res!321653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524799 () Bool)

(declare-fun res!321658 () Bool)

(assert (=> b!524799 (=> (not res!321658) (not e!306039))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524799 (= res!321658 (and (= (size!16391 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16391 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16391 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524800 () Bool)

(assert (=> b!524800 (= e!306036 (not e!306041))))

(declare-fun res!321651 () Bool)

(assert (=> b!524800 (=> res!321651 e!306041)))

(declare-fun lt!240935 () (_ BitVec 32))

(declare-fun lt!240936 () array!33351)

(declare-fun lt!240937 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33351 (_ BitVec 32)) SeekEntryResult!4494)

(assert (=> b!524800 (= res!321651 (= lt!240942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240935 lt!240937 lt!240936 mask!3524)))))

(declare-fun lt!240943 () (_ BitVec 32))

(assert (=> b!524800 (= lt!240942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240943 (select (arr!16027 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524800 (= lt!240935 (toIndex!0 lt!240937 mask!3524))))

(assert (=> b!524800 (= lt!240937 (select (store (arr!16027 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524800 (= lt!240943 (toIndex!0 (select (arr!16027 a!3235) j!176) mask!3524))))

(assert (=> b!524800 (= lt!240936 (array!33352 (store (arr!16027 a!3235) i!1204 k0!2280) (size!16391 a!3235)))))

(declare-fun e!306037 () Bool)

(assert (=> b!524800 e!306037))

(declare-fun res!321660 () Bool)

(assert (=> b!524800 (=> (not res!321660) (not e!306037))))

(assert (=> b!524800 (= res!321660 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16428 0))(
  ( (Unit!16429) )
))
(declare-fun lt!240934 () Unit!16428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16428)

(assert (=> b!524800 (= lt!240934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524801 () Bool)

(declare-fun e!306042 () Unit!16428)

(declare-fun Unit!16430 () Unit!16428)

(assert (=> b!524801 (= e!306042 Unit!16430)))

(declare-fun lt!240940 () Unit!16428)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33351 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16428)

(assert (=> b!524801 (= lt!240940 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240943 #b00000000000000000000000000000000 (index!20190 lt!240942) (x!49171 lt!240942) mask!3524))))

(declare-fun res!321657 () Bool)

(assert (=> b!524801 (= res!321657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240943 lt!240937 lt!240936 mask!3524) (Intermediate!4494 false (index!20190 lt!240942) (x!49171 lt!240942))))))

(declare-fun e!306038 () Bool)

(assert (=> b!524801 (=> (not res!321657) (not e!306038))))

(assert (=> b!524801 e!306038))

(declare-fun b!524802 () Bool)

(assert (=> b!524802 (= e!306041 true)))

(assert (=> b!524802 (= (index!20190 lt!240942) i!1204)))

(declare-fun lt!240941 () Unit!16428)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33351 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16428)

(assert (=> b!524802 (= lt!240941 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240943 #b00000000000000000000000000000000 (index!20190 lt!240942) (x!49171 lt!240942) mask!3524))))

(assert (=> b!524802 (and (or (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240939 () Unit!16428)

(assert (=> b!524802 (= lt!240939 e!306042)))

(declare-fun c!61877 () Bool)

(assert (=> b!524802 (= c!61877 (= (select (arr!16027 a!3235) (index!20190 lt!240942)) (select (arr!16027 a!3235) j!176)))))

(assert (=> b!524802 (and (bvslt (x!49171 lt!240942) #b01111111111111111111111111111110) (or (= (select (arr!16027 a!3235) (index!20190 lt!240942)) (select (arr!16027 a!3235) j!176)) (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16027 a!3235) (index!20190 lt!240942)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524803 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33351 (_ BitVec 32)) SeekEntryResult!4494)

(assert (=> b!524803 (= e!306037 (= (seekEntryOrOpen!0 (select (arr!16027 a!3235) j!176) a!3235 mask!3524) (Found!4494 j!176)))))

(declare-fun res!321652 () Bool)

(assert (=> start!47714 (=> (not res!321652) (not e!306039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47714 (= res!321652 (validMask!0 mask!3524))))

(assert (=> start!47714 e!306039))

(assert (=> start!47714 true))

(declare-fun array_inv!11823 (array!33351) Bool)

(assert (=> start!47714 (array_inv!11823 a!3235)))

(declare-fun b!524804 () Bool)

(declare-fun Unit!16431 () Unit!16428)

(assert (=> b!524804 (= e!306042 Unit!16431)))

(declare-fun b!524805 () Bool)

(assert (=> b!524805 (= e!306038 false)))

(declare-fun b!524806 () Bool)

(assert (=> b!524806 (= e!306039 e!306036)))

(declare-fun res!321659 () Bool)

(assert (=> b!524806 (=> (not res!321659) (not e!306036))))

(declare-fun lt!240938 () SeekEntryResult!4494)

(assert (=> b!524806 (= res!321659 (or (= lt!240938 (MissingZero!4494 i!1204)) (= lt!240938 (MissingVacant!4494 i!1204))))))

(assert (=> b!524806 (= lt!240938 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524807 () Bool)

(declare-fun res!321655 () Bool)

(assert (=> b!524807 (=> (not res!321655) (not e!306039))))

(assert (=> b!524807 (= res!321655 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47714 res!321652) b!524799))

(assert (= (and b!524799 res!321658) b!524797))

(assert (= (and b!524797 res!321662) b!524807))

(assert (= (and b!524807 res!321655) b!524795))

(assert (= (and b!524795 res!321656) b!524806))

(assert (= (and b!524806 res!321659) b!524798))

(assert (= (and b!524798 res!321653) b!524796))

(assert (= (and b!524796 res!321661) b!524800))

(assert (= (and b!524800 res!321660) b!524803))

(assert (= (and b!524800 (not res!321651)) b!524794))

(assert (= (and b!524794 (not res!321654)) b!524802))

(assert (= (and b!524802 c!61877) b!524801))

(assert (= (and b!524802 (not c!61877)) b!524804))

(assert (= (and b!524801 res!321657) b!524805))

(declare-fun m!505421 () Bool)

(assert (=> b!524803 m!505421))

(assert (=> b!524803 m!505421))

(declare-fun m!505423 () Bool)

(assert (=> b!524803 m!505423))

(declare-fun m!505425 () Bool)

(assert (=> b!524801 m!505425))

(declare-fun m!505427 () Bool)

(assert (=> b!524801 m!505427))

(declare-fun m!505429 () Bool)

(assert (=> b!524798 m!505429))

(declare-fun m!505431 () Bool)

(assert (=> b!524807 m!505431))

(declare-fun m!505433 () Bool)

(assert (=> b!524800 m!505433))

(declare-fun m!505435 () Bool)

(assert (=> b!524800 m!505435))

(declare-fun m!505437 () Bool)

(assert (=> b!524800 m!505437))

(assert (=> b!524800 m!505421))

(declare-fun m!505439 () Bool)

(assert (=> b!524800 m!505439))

(declare-fun m!505441 () Bool)

(assert (=> b!524800 m!505441))

(assert (=> b!524800 m!505421))

(declare-fun m!505443 () Bool)

(assert (=> b!524800 m!505443))

(declare-fun m!505445 () Bool)

(assert (=> b!524800 m!505445))

(assert (=> b!524800 m!505421))

(declare-fun m!505447 () Bool)

(assert (=> b!524800 m!505447))

(declare-fun m!505449 () Bool)

(assert (=> b!524795 m!505449))

(declare-fun m!505451 () Bool)

(assert (=> b!524796 m!505451))

(declare-fun m!505453 () Bool)

(assert (=> b!524806 m!505453))

(declare-fun m!505455 () Bool)

(assert (=> b!524802 m!505455))

(declare-fun m!505457 () Bool)

(assert (=> b!524802 m!505457))

(assert (=> b!524802 m!505421))

(declare-fun m!505459 () Bool)

(assert (=> start!47714 m!505459))

(declare-fun m!505461 () Bool)

(assert (=> start!47714 m!505461))

(assert (=> b!524797 m!505421))

(assert (=> b!524797 m!505421))

(declare-fun m!505463 () Bool)

(assert (=> b!524797 m!505463))

(check-sat (not b!524807) (not b!524800) (not b!524802) (not b!524801) (not b!524797) (not b!524798) (not b!524796) (not b!524806) (not b!524795) (not start!47714) (not b!524803))
(check-sat)
