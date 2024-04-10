; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47806 () Bool)

(assert start!47806)

(declare-fun b!526726 () Bool)

(declare-fun res!323316 () Bool)

(declare-fun e!307004 () Bool)

(assert (=> b!526726 (=> res!323316 e!307004)))

(declare-datatypes ((SeekEntryResult!4540 0))(
  ( (MissingZero!4540 (index!20372 (_ BitVec 32))) (Found!4540 (index!20373 (_ BitVec 32))) (Intermediate!4540 (undefined!5352 Bool) (index!20374 (_ BitVec 32)) (x!49337 (_ BitVec 32))) (Undefined!4540) (MissingVacant!4540 (index!20375 (_ BitVec 32))) )
))
(declare-fun lt!242317 () SeekEntryResult!4540)

(assert (=> b!526726 (= res!323316 (or (undefined!5352 lt!242317) (not (is-Intermediate!4540 lt!242317))))))

(declare-fun b!526727 () Bool)

(declare-fun res!323310 () Bool)

(declare-fun e!307007 () Bool)

(assert (=> b!526727 (=> (not res!323310) (not e!307007))))

(declare-datatypes ((array!33443 0))(
  ( (array!33444 (arr!16073 (Array (_ BitVec 32) (_ BitVec 64))) (size!16437 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33443)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526727 (= res!323310 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526728 () Bool)

(declare-datatypes ((Unit!16612 0))(
  ( (Unit!16613) )
))
(declare-fun e!307006 () Unit!16612)

(declare-fun Unit!16614 () Unit!16612)

(assert (=> b!526728 (= e!307006 Unit!16614)))

(declare-fun b!526729 () Bool)

(declare-fun res!323313 () Bool)

(assert (=> b!526729 (=> (not res!323313) (not e!307007))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526729 (= res!323313 (and (= (size!16437 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16437 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16437 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526731 () Bool)

(declare-fun e!307008 () Bool)

(assert (=> b!526731 (= e!307008 (not e!307004))))

(declare-fun res!323311 () Bool)

(assert (=> b!526731 (=> res!323311 e!307004)))

(declare-fun lt!242316 () (_ BitVec 64))

(declare-fun lt!242321 () array!33443)

(declare-fun lt!242318 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33443 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!526731 (= res!323311 (= lt!242317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242318 lt!242316 lt!242321 mask!3524)))))

(declare-fun lt!242315 () (_ BitVec 32))

(assert (=> b!526731 (= lt!242317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242315 (select (arr!16073 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526731 (= lt!242318 (toIndex!0 lt!242316 mask!3524))))

(assert (=> b!526731 (= lt!242316 (select (store (arr!16073 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526731 (= lt!242315 (toIndex!0 (select (arr!16073 a!3235) j!176) mask!3524))))

(assert (=> b!526731 (= lt!242321 (array!33444 (store (arr!16073 a!3235) i!1204 k!2280) (size!16437 a!3235)))))

(declare-fun e!307005 () Bool)

(assert (=> b!526731 e!307005))

(declare-fun res!323312 () Bool)

(assert (=> b!526731 (=> (not res!323312) (not e!307005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33443 (_ BitVec 32)) Bool)

(assert (=> b!526731 (= res!323312 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242320 () Unit!16612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16612)

(assert (=> b!526731 (= lt!242320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526732 () Bool)

(declare-fun Unit!16615 () Unit!16612)

(assert (=> b!526732 (= e!307006 Unit!16615)))

(declare-fun lt!242322 () Unit!16612)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16612)

(assert (=> b!526732 (= lt!242322 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242315 #b00000000000000000000000000000000 (index!20374 lt!242317) (x!49337 lt!242317) mask!3524))))

(declare-fun res!323318 () Bool)

(assert (=> b!526732 (= res!323318 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242315 lt!242316 lt!242321 mask!3524) (Intermediate!4540 false (index!20374 lt!242317) (x!49337 lt!242317))))))

(declare-fun e!307002 () Bool)

(assert (=> b!526732 (=> (not res!323318) (not e!307002))))

(assert (=> b!526732 e!307002))

(declare-fun b!526733 () Bool)

(declare-fun res!323309 () Bool)

(assert (=> b!526733 (=> (not res!323309) (not e!307008))))

(declare-datatypes ((List!10231 0))(
  ( (Nil!10228) (Cons!10227 (h!11158 (_ BitVec 64)) (t!16459 List!10231)) )
))
(declare-fun arrayNoDuplicates!0 (array!33443 (_ BitVec 32) List!10231) Bool)

(assert (=> b!526733 (= res!323309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10228))))

(declare-fun b!526734 () Bool)

(declare-fun res!323308 () Bool)

(assert (=> b!526734 (=> (not res!323308) (not e!307008))))

(assert (=> b!526734 (= res!323308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!323314 () Bool)

(assert (=> start!47806 (=> (not res!323314) (not e!307007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47806 (= res!323314 (validMask!0 mask!3524))))

(assert (=> start!47806 e!307007))

(assert (=> start!47806 true))

(declare-fun array_inv!11869 (array!33443) Bool)

(assert (=> start!47806 (array_inv!11869 a!3235)))

(declare-fun b!526730 () Bool)

(declare-fun res!323315 () Bool)

(assert (=> b!526730 (=> (not res!323315) (not e!307007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526730 (= res!323315 (validKeyInArray!0 k!2280))))

(declare-fun b!526735 () Bool)

(declare-fun res!323317 () Bool)

(assert (=> b!526735 (=> (not res!323317) (not e!307007))))

(assert (=> b!526735 (= res!323317 (validKeyInArray!0 (select (arr!16073 a!3235) j!176)))))

(declare-fun b!526736 () Bool)

(assert (=> b!526736 (= e!307002 false)))

(declare-fun b!526737 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33443 (_ BitVec 32)) SeekEntryResult!4540)

(assert (=> b!526737 (= e!307005 (= (seekEntryOrOpen!0 (select (arr!16073 a!3235) j!176) a!3235 mask!3524) (Found!4540 j!176)))))

(declare-fun b!526738 () Bool)

(assert (=> b!526738 (= e!307004 true)))

(assert (=> b!526738 (= (index!20374 lt!242317) i!1204)))

(declare-fun lt!242323 () Unit!16612)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16612)

(assert (=> b!526738 (= lt!242323 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242315 #b00000000000000000000000000000000 (index!20374 lt!242317) (x!49337 lt!242317) mask!3524))))

(assert (=> b!526738 (and (or (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242319 () Unit!16612)

(assert (=> b!526738 (= lt!242319 e!307006)))

(declare-fun c!62015 () Bool)

(assert (=> b!526738 (= c!62015 (= (select (arr!16073 a!3235) (index!20374 lt!242317)) (select (arr!16073 a!3235) j!176)))))

(assert (=> b!526738 (and (bvslt (x!49337 lt!242317) #b01111111111111111111111111111110) (or (= (select (arr!16073 a!3235) (index!20374 lt!242317)) (select (arr!16073 a!3235) j!176)) (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16073 a!3235) (index!20374 lt!242317)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526739 () Bool)

(assert (=> b!526739 (= e!307007 e!307008)))

(declare-fun res!323307 () Bool)

(assert (=> b!526739 (=> (not res!323307) (not e!307008))))

(declare-fun lt!242314 () SeekEntryResult!4540)

(assert (=> b!526739 (= res!323307 (or (= lt!242314 (MissingZero!4540 i!1204)) (= lt!242314 (MissingVacant!4540 i!1204))))))

(assert (=> b!526739 (= lt!242314 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47806 res!323314) b!526729))

(assert (= (and b!526729 res!323313) b!526735))

(assert (= (and b!526735 res!323317) b!526730))

(assert (= (and b!526730 res!323315) b!526727))

(assert (= (and b!526727 res!323310) b!526739))

(assert (= (and b!526739 res!323307) b!526734))

(assert (= (and b!526734 res!323308) b!526733))

(assert (= (and b!526733 res!323309) b!526731))

(assert (= (and b!526731 res!323312) b!526737))

(assert (= (and b!526731 (not res!323311)) b!526726))

(assert (= (and b!526726 (not res!323316)) b!526738))

(assert (= (and b!526738 c!62015) b!526732))

(assert (= (and b!526738 (not c!62015)) b!526728))

(assert (= (and b!526732 res!323318) b!526736))

(declare-fun m!507445 () Bool)

(assert (=> b!526734 m!507445))

(declare-fun m!507447 () Bool)

(assert (=> b!526732 m!507447))

(declare-fun m!507449 () Bool)

(assert (=> b!526732 m!507449))

(declare-fun m!507451 () Bool)

(assert (=> b!526739 m!507451))

(declare-fun m!507453 () Bool)

(assert (=> b!526727 m!507453))

(declare-fun m!507455 () Bool)

(assert (=> b!526738 m!507455))

(declare-fun m!507457 () Bool)

(assert (=> b!526738 m!507457))

(declare-fun m!507459 () Bool)

(assert (=> b!526738 m!507459))

(declare-fun m!507461 () Bool)

(assert (=> b!526731 m!507461))

(declare-fun m!507463 () Bool)

(assert (=> b!526731 m!507463))

(declare-fun m!507465 () Bool)

(assert (=> b!526731 m!507465))

(declare-fun m!507467 () Bool)

(assert (=> b!526731 m!507467))

(assert (=> b!526731 m!507459))

(declare-fun m!507469 () Bool)

(assert (=> b!526731 m!507469))

(assert (=> b!526731 m!507459))

(declare-fun m!507471 () Bool)

(assert (=> b!526731 m!507471))

(assert (=> b!526731 m!507459))

(declare-fun m!507473 () Bool)

(assert (=> b!526731 m!507473))

(declare-fun m!507475 () Bool)

(assert (=> b!526731 m!507475))

(declare-fun m!507477 () Bool)

(assert (=> start!47806 m!507477))

(declare-fun m!507479 () Bool)

(assert (=> start!47806 m!507479))

(assert (=> b!526735 m!507459))

(assert (=> b!526735 m!507459))

(declare-fun m!507481 () Bool)

(assert (=> b!526735 m!507481))

(assert (=> b!526737 m!507459))

(assert (=> b!526737 m!507459))

(declare-fun m!507483 () Bool)

(assert (=> b!526737 m!507483))

(declare-fun m!507485 () Bool)

(assert (=> b!526730 m!507485))

(declare-fun m!507487 () Bool)

(assert (=> b!526733 m!507487))

(push 1)

