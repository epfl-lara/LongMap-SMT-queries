; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47898 () Bool)

(assert start!47898)

(declare-fun b!527473 () Bool)

(declare-fun res!323798 () Bool)

(declare-fun e!307423 () Bool)

(assert (=> b!527473 (=> (not res!323798) (not e!307423))))

(declare-datatypes ((array!33466 0))(
  ( (array!33467 (arr!16083 (Array (_ BitVec 32) (_ BitVec 64))) (size!16447 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33466)

(declare-datatypes ((List!10241 0))(
  ( (Nil!10238) (Cons!10237 (h!11171 (_ BitVec 64)) (t!16469 List!10241)) )
))
(declare-fun arrayNoDuplicates!0 (array!33466 (_ BitVec 32) List!10241) Bool)

(assert (=> b!527473 (= res!323798 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10238))))

(declare-fun b!527474 () Bool)

(declare-datatypes ((Unit!16652 0))(
  ( (Unit!16653) )
))
(declare-fun e!307424 () Unit!16652)

(declare-fun Unit!16654 () Unit!16652)

(assert (=> b!527474 (= e!307424 Unit!16654)))

(declare-fun b!527475 () Bool)

(declare-fun res!323797 () Bool)

(declare-fun e!307425 () Bool)

(assert (=> b!527475 (=> (not res!323797) (not e!307425))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527475 (= res!323797 (validKeyInArray!0 k!2280))))

(declare-fun b!527476 () Bool)

(declare-fun Unit!16655 () Unit!16652)

(assert (=> b!527476 (= e!307424 Unit!16655)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4550 0))(
  ( (MissingZero!4550 (index!20418 (_ BitVec 32))) (Found!4550 (index!20419 (_ BitVec 32))) (Intermediate!4550 (undefined!5362 Bool) (index!20420 (_ BitVec 32)) (x!49391 (_ BitVec 32))) (Undefined!4550) (MissingVacant!4550 (index!20421 (_ BitVec 32))) )
))
(declare-fun lt!242768 () SeekEntryResult!4550)

(declare-fun lt!242770 () Unit!16652)

(declare-fun lt!242773 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16652)

(assert (=> b!527476 (= lt!242770 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242773 #b00000000000000000000000000000000 (index!20420 lt!242768) (x!49391 lt!242768) mask!3524))))

(declare-fun lt!242771 () array!33466)

(declare-fun lt!242769 () (_ BitVec 64))

(declare-fun res!323800 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33466 (_ BitVec 32)) SeekEntryResult!4550)

(assert (=> b!527476 (= res!323800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242773 lt!242769 lt!242771 mask!3524) (Intermediate!4550 false (index!20420 lt!242768) (x!49391 lt!242768))))))

(declare-fun e!307428 () Bool)

(assert (=> b!527476 (=> (not res!323800) (not e!307428))))

(assert (=> b!527476 e!307428))

(declare-fun b!527477 () Bool)

(declare-fun e!307422 () Bool)

(assert (=> b!527477 (= e!307423 (not e!307422))))

(declare-fun res!323795 () Bool)

(assert (=> b!527477 (=> res!323795 e!307422)))

(declare-fun lt!242776 () (_ BitVec 32))

(assert (=> b!527477 (= res!323795 (= lt!242768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242776 lt!242769 lt!242771 mask!3524)))))

(assert (=> b!527477 (= lt!242768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242773 (select (arr!16083 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527477 (= lt!242776 (toIndex!0 lt!242769 mask!3524))))

(assert (=> b!527477 (= lt!242769 (select (store (arr!16083 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527477 (= lt!242773 (toIndex!0 (select (arr!16083 a!3235) j!176) mask!3524))))

(assert (=> b!527477 (= lt!242771 (array!33467 (store (arr!16083 a!3235) i!1204 k!2280) (size!16447 a!3235)))))

(declare-fun e!307427 () Bool)

(assert (=> b!527477 e!307427))

(declare-fun res!323801 () Bool)

(assert (=> b!527477 (=> (not res!323801) (not e!307427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33466 (_ BitVec 32)) Bool)

(assert (=> b!527477 (= res!323801 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242774 () Unit!16652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16652)

(assert (=> b!527477 (= lt!242774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527478 () Bool)

(declare-fun res!323802 () Bool)

(assert (=> b!527478 (=> (not res!323802) (not e!307423))))

(assert (=> b!527478 (= res!323802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527479 () Bool)

(declare-fun res!323793 () Bool)

(assert (=> b!527479 (=> (not res!323793) (not e!307425))))

(assert (=> b!527479 (= res!323793 (and (= (size!16447 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16447 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16447 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527480 () Bool)

(assert (=> b!527480 (= e!307422 (or (bvsgt (x!49391 lt!242768) #b01111111111111111111111111111110) (bvslt lt!242773 #b00000000000000000000000000000000) (bvsge lt!242773 (size!16447 a!3235)) (bvslt (index!20420 lt!242768) #b00000000000000000000000000000000) (bvsge (index!20420 lt!242768) (size!16447 a!3235)) (= lt!242768 (Intermediate!4550 false (index!20420 lt!242768) (x!49391 lt!242768)))))))

(assert (=> b!527480 (= (index!20420 lt!242768) i!1204)))

(declare-fun lt!242767 () Unit!16652)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16652)

(assert (=> b!527480 (= lt!242767 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242773 #b00000000000000000000000000000000 (index!20420 lt!242768) (x!49391 lt!242768) mask!3524))))

(assert (=> b!527480 (and (or (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242775 () Unit!16652)

(assert (=> b!527480 (= lt!242775 e!307424)))

(declare-fun c!62147 () Bool)

(assert (=> b!527480 (= c!62147 (= (select (arr!16083 a!3235) (index!20420 lt!242768)) (select (arr!16083 a!3235) j!176)))))

(assert (=> b!527480 (and (bvslt (x!49391 lt!242768) #b01111111111111111111111111111110) (or (= (select (arr!16083 a!3235) (index!20420 lt!242768)) (select (arr!16083 a!3235) j!176)) (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16083 a!3235) (index!20420 lt!242768)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527481 () Bool)

(declare-fun res!323799 () Bool)

(assert (=> b!527481 (=> res!323799 e!307422)))

(assert (=> b!527481 (= res!323799 (or (undefined!5362 lt!242768) (not (is-Intermediate!4550 lt!242768))))))

(declare-fun b!527482 () Bool)

(assert (=> b!527482 (= e!307428 false)))

(declare-fun b!527484 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33466 (_ BitVec 32)) SeekEntryResult!4550)

(assert (=> b!527484 (= e!307427 (= (seekEntryOrOpen!0 (select (arr!16083 a!3235) j!176) a!3235 mask!3524) (Found!4550 j!176)))))

(declare-fun b!527485 () Bool)

(declare-fun res!323803 () Bool)

(assert (=> b!527485 (=> (not res!323803) (not e!307425))))

(assert (=> b!527485 (= res!323803 (validKeyInArray!0 (select (arr!16083 a!3235) j!176)))))

(declare-fun b!527486 () Bool)

(assert (=> b!527486 (= e!307425 e!307423)))

(declare-fun res!323804 () Bool)

(assert (=> b!527486 (=> (not res!323804) (not e!307423))))

(declare-fun lt!242772 () SeekEntryResult!4550)

(assert (=> b!527486 (= res!323804 (or (= lt!242772 (MissingZero!4550 i!1204)) (= lt!242772 (MissingVacant!4550 i!1204))))))

(assert (=> b!527486 (= lt!242772 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!323794 () Bool)

(assert (=> start!47898 (=> (not res!323794) (not e!307425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47898 (= res!323794 (validMask!0 mask!3524))))

(assert (=> start!47898 e!307425))

(assert (=> start!47898 true))

(declare-fun array_inv!11879 (array!33466) Bool)

(assert (=> start!47898 (array_inv!11879 a!3235)))

(declare-fun b!527483 () Bool)

(declare-fun res!323796 () Bool)

(assert (=> b!527483 (=> (not res!323796) (not e!307425))))

(declare-fun arrayContainsKey!0 (array!33466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527483 (= res!323796 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47898 res!323794) b!527479))

(assert (= (and b!527479 res!323793) b!527485))

(assert (= (and b!527485 res!323803) b!527475))

(assert (= (and b!527475 res!323797) b!527483))

(assert (= (and b!527483 res!323796) b!527486))

(assert (= (and b!527486 res!323804) b!527478))

(assert (= (and b!527478 res!323802) b!527473))

(assert (= (and b!527473 res!323798) b!527477))

(assert (= (and b!527477 res!323801) b!527484))

(assert (= (and b!527477 (not res!323795)) b!527481))

(assert (= (and b!527481 (not res!323799)) b!527480))

(assert (= (and b!527480 c!62147) b!527476))

(assert (= (and b!527480 (not c!62147)) b!527474))

(assert (= (and b!527476 res!323800) b!527482))

(declare-fun m!508125 () Bool)

(assert (=> b!527484 m!508125))

(assert (=> b!527484 m!508125))

(declare-fun m!508127 () Bool)

(assert (=> b!527484 m!508127))

(assert (=> b!527485 m!508125))

(assert (=> b!527485 m!508125))

(declare-fun m!508129 () Bool)

(assert (=> b!527485 m!508129))

(declare-fun m!508131 () Bool)

(assert (=> b!527478 m!508131))

(declare-fun m!508133 () Bool)

(assert (=> b!527473 m!508133))

(declare-fun m!508135 () Bool)

(assert (=> b!527480 m!508135))

(declare-fun m!508137 () Bool)

(assert (=> b!527480 m!508137))

(assert (=> b!527480 m!508125))

(declare-fun m!508139 () Bool)

(assert (=> b!527476 m!508139))

(declare-fun m!508141 () Bool)

(assert (=> b!527476 m!508141))

(declare-fun m!508143 () Bool)

(assert (=> b!527486 m!508143))

(declare-fun m!508145 () Bool)

(assert (=> b!527475 m!508145))

(declare-fun m!508147 () Bool)

(assert (=> b!527483 m!508147))

(declare-fun m!508149 () Bool)

(assert (=> b!527477 m!508149))

(declare-fun m!508151 () Bool)

(assert (=> b!527477 m!508151))

(assert (=> b!527477 m!508125))

(declare-fun m!508153 () Bool)

(assert (=> b!527477 m!508153))

(assert (=> b!527477 m!508125))

(declare-fun m!508155 () Bool)

(assert (=> b!527477 m!508155))

(declare-fun m!508157 () Bool)

(assert (=> b!527477 m!508157))

(assert (=> b!527477 m!508125))

(declare-fun m!508159 () Bool)

(assert (=> b!527477 m!508159))

(declare-fun m!508161 () Bool)

(assert (=> b!527477 m!508161))

(declare-fun m!508163 () Bool)

(assert (=> b!527477 m!508163))

(declare-fun m!508165 () Bool)

(assert (=> start!47898 m!508165))

(declare-fun m!508167 () Bool)

(assert (=> start!47898 m!508167))

(push 1)

