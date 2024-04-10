; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47894 () Bool)

(assert start!47894)

(declare-fun b!527389 () Bool)

(declare-datatypes ((Unit!16644 0))(
  ( (Unit!16645) )
))
(declare-fun e!307384 () Unit!16644)

(declare-fun Unit!16646 () Unit!16644)

(assert (=> b!527389 (= e!307384 Unit!16646)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33462 0))(
  ( (array!33463 (arr!16081 (Array (_ BitVec 32) (_ BitVec 64))) (size!16445 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33462)

(declare-fun lt!242708 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!242707 () Unit!16644)

(declare-datatypes ((SeekEntryResult!4548 0))(
  ( (MissingZero!4548 (index!20410 (_ BitVec 32))) (Found!4548 (index!20411 (_ BitVec 32))) (Intermediate!4548 (undefined!5360 Bool) (index!20412 (_ BitVec 32)) (x!49381 (_ BitVec 32))) (Undefined!4548) (MissingVacant!4548 (index!20413 (_ BitVec 32))) )
))
(declare-fun lt!242711 () SeekEntryResult!4548)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16644)

(assert (=> b!527389 (= lt!242707 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242708 #b00000000000000000000000000000000 (index!20412 lt!242711) (x!49381 lt!242711) mask!3524))))

(declare-fun lt!242710 () (_ BitVec 64))

(declare-fun lt!242709 () array!33462)

(declare-fun res!323727 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33462 (_ BitVec 32)) SeekEntryResult!4548)

(assert (=> b!527389 (= res!323727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242708 lt!242710 lt!242709 mask!3524) (Intermediate!4548 false (index!20412 lt!242711) (x!49381 lt!242711))))))

(declare-fun e!307383 () Bool)

(assert (=> b!527389 (=> (not res!323727) (not e!307383))))

(assert (=> b!527389 e!307383))

(declare-fun res!323729 () Bool)

(declare-fun e!307382 () Bool)

(assert (=> start!47894 (=> (not res!323729) (not e!307382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47894 (= res!323729 (validMask!0 mask!3524))))

(assert (=> start!47894 e!307382))

(assert (=> start!47894 true))

(declare-fun array_inv!11877 (array!33462) Bool)

(assert (=> start!47894 (array_inv!11877 a!3235)))

(declare-fun b!527390 () Bool)

(declare-fun e!307380 () Bool)

(declare-fun e!307385 () Bool)

(assert (=> b!527390 (= e!307380 (not e!307385))))

(declare-fun res!323722 () Bool)

(assert (=> b!527390 (=> res!323722 e!307385)))

(declare-fun lt!242712 () (_ BitVec 32))

(assert (=> b!527390 (= res!323722 (= lt!242711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242712 lt!242710 lt!242709 mask!3524)))))

(assert (=> b!527390 (= lt!242711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242708 (select (arr!16081 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527390 (= lt!242712 (toIndex!0 lt!242710 mask!3524))))

(assert (=> b!527390 (= lt!242710 (select (store (arr!16081 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527390 (= lt!242708 (toIndex!0 (select (arr!16081 a!3235) j!176) mask!3524))))

(assert (=> b!527390 (= lt!242709 (array!33463 (store (arr!16081 a!3235) i!1204 k0!2280) (size!16445 a!3235)))))

(declare-fun e!307381 () Bool)

(assert (=> b!527390 e!307381))

(declare-fun res!323726 () Bool)

(assert (=> b!527390 (=> (not res!323726) (not e!307381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33462 (_ BitVec 32)) Bool)

(assert (=> b!527390 (= res!323726 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242715 () Unit!16644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16644)

(assert (=> b!527390 (= lt!242715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527391 () Bool)

(declare-fun res!323732 () Bool)

(assert (=> b!527391 (=> (not res!323732) (not e!307382))))

(assert (=> b!527391 (= res!323732 (and (= (size!16445 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16445 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16445 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527392 () Bool)

(assert (=> b!527392 (= e!307385 (or (bvsgt (x!49381 lt!242711) #b01111111111111111111111111111110) (bvslt lt!242708 #b00000000000000000000000000000000) (bvsge lt!242708 (size!16445 a!3235)) (and (bvsge (index!20412 lt!242711) #b00000000000000000000000000000000) (bvslt (index!20412 lt!242711) (size!16445 a!3235)))))))

(assert (=> b!527392 (= (index!20412 lt!242711) i!1204)))

(declare-fun lt!242714 () Unit!16644)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16644)

(assert (=> b!527392 (= lt!242714 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242708 #b00000000000000000000000000000000 (index!20412 lt!242711) (x!49381 lt!242711) mask!3524))))

(assert (=> b!527392 (and (or (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242713 () Unit!16644)

(assert (=> b!527392 (= lt!242713 e!307384)))

(declare-fun c!62141 () Bool)

(assert (=> b!527392 (= c!62141 (= (select (arr!16081 a!3235) (index!20412 lt!242711)) (select (arr!16081 a!3235) j!176)))))

(assert (=> b!527392 (and (bvslt (x!49381 lt!242711) #b01111111111111111111111111111110) (or (= (select (arr!16081 a!3235) (index!20412 lt!242711)) (select (arr!16081 a!3235) j!176)) (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20412 lt!242711)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527393 () Bool)

(declare-fun res!323731 () Bool)

(assert (=> b!527393 (=> (not res!323731) (not e!307382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527393 (= res!323731 (validKeyInArray!0 k0!2280))))

(declare-fun b!527394 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33462 (_ BitVec 32)) SeekEntryResult!4548)

(assert (=> b!527394 (= e!307381 (= (seekEntryOrOpen!0 (select (arr!16081 a!3235) j!176) a!3235 mask!3524) (Found!4548 j!176)))))

(declare-fun b!527395 () Bool)

(declare-fun res!323730 () Bool)

(assert (=> b!527395 (=> (not res!323730) (not e!307380))))

(declare-datatypes ((List!10239 0))(
  ( (Nil!10236) (Cons!10235 (h!11169 (_ BitVec 64)) (t!16467 List!10239)) )
))
(declare-fun arrayNoDuplicates!0 (array!33462 (_ BitVec 32) List!10239) Bool)

(assert (=> b!527395 (= res!323730 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10236))))

(declare-fun b!527396 () Bool)

(assert (=> b!527396 (= e!307382 e!307380)))

(declare-fun res!323725 () Bool)

(assert (=> b!527396 (=> (not res!323725) (not e!307380))))

(declare-fun lt!242716 () SeekEntryResult!4548)

(assert (=> b!527396 (= res!323725 (or (= lt!242716 (MissingZero!4548 i!1204)) (= lt!242716 (MissingVacant!4548 i!1204))))))

(assert (=> b!527396 (= lt!242716 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527397 () Bool)

(declare-fun res!323728 () Bool)

(assert (=> b!527397 (=> (not res!323728) (not e!307382))))

(assert (=> b!527397 (= res!323728 (validKeyInArray!0 (select (arr!16081 a!3235) j!176)))))

(declare-fun b!527398 () Bool)

(declare-fun res!323724 () Bool)

(assert (=> b!527398 (=> (not res!323724) (not e!307382))))

(declare-fun arrayContainsKey!0 (array!33462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527398 (= res!323724 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527399 () Bool)

(declare-fun Unit!16647 () Unit!16644)

(assert (=> b!527399 (= e!307384 Unit!16647)))

(declare-fun b!527400 () Bool)

(assert (=> b!527400 (= e!307383 false)))

(declare-fun b!527401 () Bool)

(declare-fun res!323721 () Bool)

(assert (=> b!527401 (=> res!323721 e!307385)))

(get-info :version)

(assert (=> b!527401 (= res!323721 (or (undefined!5360 lt!242711) (not ((_ is Intermediate!4548) lt!242711))))))

(declare-fun b!527402 () Bool)

(declare-fun res!323723 () Bool)

(assert (=> b!527402 (=> (not res!323723) (not e!307380))))

(assert (=> b!527402 (= res!323723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47894 res!323729) b!527391))

(assert (= (and b!527391 res!323732) b!527397))

(assert (= (and b!527397 res!323728) b!527393))

(assert (= (and b!527393 res!323731) b!527398))

(assert (= (and b!527398 res!323724) b!527396))

(assert (= (and b!527396 res!323725) b!527402))

(assert (= (and b!527402 res!323723) b!527395))

(assert (= (and b!527395 res!323730) b!527390))

(assert (= (and b!527390 res!323726) b!527394))

(assert (= (and b!527390 (not res!323722)) b!527401))

(assert (= (and b!527401 (not res!323721)) b!527392))

(assert (= (and b!527392 c!62141) b!527389))

(assert (= (and b!527392 (not c!62141)) b!527399))

(assert (= (and b!527389 res!323727) b!527400))

(declare-fun m!508037 () Bool)

(assert (=> b!527402 m!508037))

(declare-fun m!508039 () Bool)

(assert (=> b!527396 m!508039))

(declare-fun m!508041 () Bool)

(assert (=> b!527390 m!508041))

(declare-fun m!508043 () Bool)

(assert (=> b!527390 m!508043))

(declare-fun m!508045 () Bool)

(assert (=> b!527390 m!508045))

(declare-fun m!508047 () Bool)

(assert (=> b!527390 m!508047))

(declare-fun m!508049 () Bool)

(assert (=> b!527390 m!508049))

(assert (=> b!527390 m!508047))

(declare-fun m!508051 () Bool)

(assert (=> b!527390 m!508051))

(declare-fun m!508053 () Bool)

(assert (=> b!527390 m!508053))

(assert (=> b!527390 m!508047))

(declare-fun m!508055 () Bool)

(assert (=> b!527390 m!508055))

(declare-fun m!508057 () Bool)

(assert (=> b!527390 m!508057))

(declare-fun m!508059 () Bool)

(assert (=> b!527395 m!508059))

(declare-fun m!508061 () Bool)

(assert (=> b!527389 m!508061))

(declare-fun m!508063 () Bool)

(assert (=> b!527389 m!508063))

(assert (=> b!527397 m!508047))

(assert (=> b!527397 m!508047))

(declare-fun m!508065 () Bool)

(assert (=> b!527397 m!508065))

(declare-fun m!508067 () Bool)

(assert (=> b!527393 m!508067))

(declare-fun m!508069 () Bool)

(assert (=> start!47894 m!508069))

(declare-fun m!508071 () Bool)

(assert (=> start!47894 m!508071))

(assert (=> b!527394 m!508047))

(assert (=> b!527394 m!508047))

(declare-fun m!508073 () Bool)

(assert (=> b!527394 m!508073))

(declare-fun m!508075 () Bool)

(assert (=> b!527392 m!508075))

(declare-fun m!508077 () Bool)

(assert (=> b!527392 m!508077))

(assert (=> b!527392 m!508047))

(declare-fun m!508079 () Bool)

(assert (=> b!527398 m!508079))

(check-sat (not b!527397) (not b!527390) (not b!527389) (not b!527398) (not b!527392) (not b!527394) (not b!527396) (not b!527402) (not b!527395) (not b!527393) (not start!47894))
(check-sat)
