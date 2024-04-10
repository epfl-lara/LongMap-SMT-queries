; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47718 () Bool)

(assert start!47718)

(declare-fun b!524878 () Bool)

(declare-datatypes ((Unit!16436 0))(
  ( (Unit!16437) )
))
(declare-fun e!306083 () Unit!16436)

(declare-fun Unit!16438 () Unit!16436)

(assert (=> b!524878 (= e!306083 Unit!16438)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241000 () Unit!16436)

(declare-fun lt!241002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4496 0))(
  ( (MissingZero!4496 (index!20196 (_ BitVec 32))) (Found!4496 (index!20197 (_ BitVec 32))) (Intermediate!4496 (undefined!5308 Bool) (index!20198 (_ BitVec 32)) (x!49181 (_ BitVec 32))) (Undefined!4496) (MissingVacant!4496 (index!20199 (_ BitVec 32))) )
))
(declare-fun lt!240996 () SeekEntryResult!4496)

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!33355 0))(
  ( (array!33356 (arr!16029 (Array (_ BitVec 32) (_ BitVec 64))) (size!16393 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33355)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!524878 (= lt!241000 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241002 #b00000000000000000000000000000000 (index!20198 lt!240996) (x!49181 lt!240996) mask!3524))))

(declare-fun lt!240998 () (_ BitVec 64))

(declare-fun lt!240994 () array!33355)

(declare-fun res!321726 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33355 (_ BitVec 32)) SeekEntryResult!4496)

(assert (=> b!524878 (= res!321726 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241002 lt!240998 lt!240994 mask!3524) (Intermediate!4496 false (index!20198 lt!240996) (x!49181 lt!240996))))))

(declare-fun e!306084 () Bool)

(assert (=> b!524878 (=> (not res!321726) (not e!306084))))

(assert (=> b!524878 e!306084))

(declare-fun b!524879 () Bool)

(declare-fun e!306079 () Bool)

(declare-fun e!306081 () Bool)

(assert (=> b!524879 (= e!306079 (not e!306081))))

(declare-fun res!321723 () Bool)

(assert (=> b!524879 (=> res!321723 e!306081)))

(declare-fun lt!241001 () (_ BitVec 32))

(assert (=> b!524879 (= res!321723 (= lt!240996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241001 lt!240998 lt!240994 mask!3524)))))

(assert (=> b!524879 (= lt!240996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241002 (select (arr!16029 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524879 (= lt!241001 (toIndex!0 lt!240998 mask!3524))))

(assert (=> b!524879 (= lt!240998 (select (store (arr!16029 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524879 (= lt!241002 (toIndex!0 (select (arr!16029 a!3235) j!176) mask!3524))))

(assert (=> b!524879 (= lt!240994 (array!33356 (store (arr!16029 a!3235) i!1204 k!2280) (size!16393 a!3235)))))

(declare-fun e!306078 () Bool)

(assert (=> b!524879 e!306078))

(declare-fun res!321730 () Bool)

(assert (=> b!524879 (=> (not res!321730) (not e!306078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33355 (_ BitVec 32)) Bool)

(assert (=> b!524879 (= res!321730 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241003 () Unit!16436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!524879 (= lt!241003 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524880 () Bool)

(assert (=> b!524880 (= e!306081 true)))

(assert (=> b!524880 (= (index!20198 lt!240996) i!1204)))

(declare-fun lt!240997 () Unit!16436)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!524880 (= lt!240997 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241002 #b00000000000000000000000000000000 (index!20198 lt!240996) (x!49181 lt!240996) mask!3524))))

(assert (=> b!524880 (and (or (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240999 () Unit!16436)

(assert (=> b!524880 (= lt!240999 e!306083)))

(declare-fun c!61883 () Bool)

(assert (=> b!524880 (= c!61883 (= (select (arr!16029 a!3235) (index!20198 lt!240996)) (select (arr!16029 a!3235) j!176)))))

(assert (=> b!524880 (and (bvslt (x!49181 lt!240996) #b01111111111111111111111111111110) (or (= (select (arr!16029 a!3235) (index!20198 lt!240996)) (select (arr!16029 a!3235) j!176)) (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16029 a!3235) (index!20198 lt!240996)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524882 () Bool)

(declare-fun e!306082 () Bool)

(assert (=> b!524882 (= e!306082 e!306079)))

(declare-fun res!321733 () Bool)

(assert (=> b!524882 (=> (not res!321733) (not e!306079))))

(declare-fun lt!240995 () SeekEntryResult!4496)

(assert (=> b!524882 (= res!321733 (or (= lt!240995 (MissingZero!4496 i!1204)) (= lt!240995 (MissingVacant!4496 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33355 (_ BitVec 32)) SeekEntryResult!4496)

(assert (=> b!524882 (= lt!240995 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524883 () Bool)

(declare-fun res!321732 () Bool)

(assert (=> b!524883 (=> (not res!321732) (not e!306079))))

(assert (=> b!524883 (= res!321732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524884 () Bool)

(declare-fun res!321728 () Bool)

(assert (=> b!524884 (=> (not res!321728) (not e!306082))))

(assert (=> b!524884 (= res!321728 (and (= (size!16393 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16393 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16393 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524885 () Bool)

(declare-fun res!321731 () Bool)

(assert (=> b!524885 (=> res!321731 e!306081)))

(assert (=> b!524885 (= res!321731 (or (undefined!5308 lt!240996) (not (is-Intermediate!4496 lt!240996))))))

(declare-fun b!524886 () Bool)

(assert (=> b!524886 (= e!306078 (= (seekEntryOrOpen!0 (select (arr!16029 a!3235) j!176) a!3235 mask!3524) (Found!4496 j!176)))))

(declare-fun b!524887 () Bool)

(declare-fun res!321725 () Bool)

(assert (=> b!524887 (=> (not res!321725) (not e!306082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524887 (= res!321725 (validKeyInArray!0 (select (arr!16029 a!3235) j!176)))))

(declare-fun b!524888 () Bool)

(declare-fun res!321727 () Bool)

(assert (=> b!524888 (=> (not res!321727) (not e!306079))))

(declare-datatypes ((List!10187 0))(
  ( (Nil!10184) (Cons!10183 (h!11114 (_ BitVec 64)) (t!16415 List!10187)) )
))
(declare-fun arrayNoDuplicates!0 (array!33355 (_ BitVec 32) List!10187) Bool)

(assert (=> b!524888 (= res!321727 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10184))))

(declare-fun b!524889 () Bool)

(declare-fun res!321724 () Bool)

(assert (=> b!524889 (=> (not res!321724) (not e!306082))))

(assert (=> b!524889 (= res!321724 (validKeyInArray!0 k!2280))))

(declare-fun res!321734 () Bool)

(assert (=> start!47718 (=> (not res!321734) (not e!306082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47718 (= res!321734 (validMask!0 mask!3524))))

(assert (=> start!47718 e!306082))

(assert (=> start!47718 true))

(declare-fun array_inv!11825 (array!33355) Bool)

(assert (=> start!47718 (array_inv!11825 a!3235)))

(declare-fun b!524881 () Bool)

(assert (=> b!524881 (= e!306084 false)))

(declare-fun b!524890 () Bool)

(declare-fun Unit!16439 () Unit!16436)

(assert (=> b!524890 (= e!306083 Unit!16439)))

(declare-fun b!524891 () Bool)

(declare-fun res!321729 () Bool)

(assert (=> b!524891 (=> (not res!321729) (not e!306082))))

(declare-fun arrayContainsKey!0 (array!33355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524891 (= res!321729 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47718 res!321734) b!524884))

(assert (= (and b!524884 res!321728) b!524887))

(assert (= (and b!524887 res!321725) b!524889))

(assert (= (and b!524889 res!321724) b!524891))

(assert (= (and b!524891 res!321729) b!524882))

(assert (= (and b!524882 res!321733) b!524883))

(assert (= (and b!524883 res!321732) b!524888))

(assert (= (and b!524888 res!321727) b!524879))

(assert (= (and b!524879 res!321730) b!524886))

(assert (= (and b!524879 (not res!321723)) b!524885))

(assert (= (and b!524885 (not res!321731)) b!524880))

(assert (= (and b!524880 c!61883) b!524878))

(assert (= (and b!524880 (not c!61883)) b!524890))

(assert (= (and b!524878 res!321726) b!524881))

(declare-fun m!505509 () Bool)

(assert (=> b!524888 m!505509))

(declare-fun m!505511 () Bool)

(assert (=> b!524880 m!505511))

(declare-fun m!505513 () Bool)

(assert (=> b!524880 m!505513))

(declare-fun m!505515 () Bool)

(assert (=> b!524880 m!505515))

(declare-fun m!505517 () Bool)

(assert (=> b!524882 m!505517))

(declare-fun m!505519 () Bool)

(assert (=> b!524878 m!505519))

(declare-fun m!505521 () Bool)

(assert (=> b!524878 m!505521))

(declare-fun m!505523 () Bool)

(assert (=> start!47718 m!505523))

(declare-fun m!505525 () Bool)

(assert (=> start!47718 m!505525))

(declare-fun m!505527 () Bool)

(assert (=> b!524883 m!505527))

(declare-fun m!505529 () Bool)

(assert (=> b!524879 m!505529))

(declare-fun m!505531 () Bool)

(assert (=> b!524879 m!505531))

(declare-fun m!505533 () Bool)

(assert (=> b!524879 m!505533))

(declare-fun m!505535 () Bool)

(assert (=> b!524879 m!505535))

(assert (=> b!524879 m!505515))

(declare-fun m!505537 () Bool)

(assert (=> b!524879 m!505537))

(assert (=> b!524879 m!505515))

(declare-fun m!505539 () Bool)

(assert (=> b!524879 m!505539))

(assert (=> b!524879 m!505515))

(declare-fun m!505541 () Bool)

(assert (=> b!524879 m!505541))

(declare-fun m!505543 () Bool)

(assert (=> b!524879 m!505543))

(assert (=> b!524886 m!505515))

(assert (=> b!524886 m!505515))

(declare-fun m!505545 () Bool)

(assert (=> b!524886 m!505545))

(declare-fun m!505547 () Bool)

(assert (=> b!524889 m!505547))

(assert (=> b!524887 m!505515))

(assert (=> b!524887 m!505515))

(declare-fun m!505549 () Bool)

(assert (=> b!524887 m!505549))

(declare-fun m!505551 () Bool)

(assert (=> b!524891 m!505551))

(push 1)

