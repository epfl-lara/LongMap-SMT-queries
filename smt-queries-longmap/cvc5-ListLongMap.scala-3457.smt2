; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48012 () Bool)

(assert start!48012)

(declare-fun b!528671 () Bool)

(declare-fun e!308094 () Bool)

(declare-fun e!308090 () Bool)

(assert (=> b!528671 (= e!308094 e!308090)))

(declare-fun res!324630 () Bool)

(assert (=> b!528671 (=> (not res!324630) (not e!308090))))

(declare-datatypes ((SeekEntryResult!4568 0))(
  ( (MissingZero!4568 (index!20496 (_ BitVec 32))) (Found!4568 (index!20497 (_ BitVec 32))) (Intermediate!4568 (undefined!5380 Bool) (index!20498 (_ BitVec 32)) (x!49472 (_ BitVec 32))) (Undefined!4568) (MissingVacant!4568 (index!20499 (_ BitVec 32))) )
))
(declare-fun lt!243532 () SeekEntryResult!4568)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528671 (= res!324630 (or (= lt!243532 (MissingZero!4568 i!1204)) (= lt!243532 (MissingVacant!4568 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33505 0))(
  ( (array!33506 (arr!16101 (Array (_ BitVec 32) (_ BitVec 64))) (size!16465 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33505)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33505 (_ BitVec 32)) SeekEntryResult!4568)

(assert (=> b!528671 (= lt!243532 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528672 () Bool)

(declare-fun res!324629 () Bool)

(assert (=> b!528672 (=> (not res!324629) (not e!308094))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528672 (= res!324629 (validKeyInArray!0 (select (arr!16101 a!3235) j!176)))))

(declare-fun b!528673 () Bool)

(declare-datatypes ((Unit!16724 0))(
  ( (Unit!16725) )
))
(declare-fun e!308093 () Unit!16724)

(declare-fun Unit!16726 () Unit!16724)

(assert (=> b!528673 (= e!308093 Unit!16726)))

(declare-fun lt!243529 () SeekEntryResult!4568)

(declare-fun lt!243524 () (_ BitVec 32))

(declare-fun lt!243528 () Unit!16724)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16724)

(assert (=> b!528673 (= lt!243528 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243524 #b00000000000000000000000000000000 (index!20498 lt!243529) (x!49472 lt!243529) mask!3524))))

(declare-fun lt!243531 () (_ BitVec 64))

(declare-fun res!324637 () Bool)

(declare-fun lt!243530 () array!33505)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33505 (_ BitVec 32)) SeekEntryResult!4568)

(assert (=> b!528673 (= res!324637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243524 lt!243531 lt!243530 mask!3524) (Intermediate!4568 false (index!20498 lt!243529) (x!49472 lt!243529))))))

(declare-fun e!308087 () Bool)

(assert (=> b!528673 (=> (not res!324637) (not e!308087))))

(assert (=> b!528673 e!308087))

(declare-fun b!528674 () Bool)

(declare-fun res!324631 () Bool)

(assert (=> b!528674 (=> (not res!324631) (not e!308094))))

(declare-fun arrayContainsKey!0 (array!33505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528674 (= res!324631 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528675 () Bool)

(declare-fun e!308092 () Bool)

(declare-fun e!308088 () Bool)

(assert (=> b!528675 (= e!308092 e!308088)))

(declare-fun res!324641 () Bool)

(assert (=> b!528675 (=> res!324641 e!308088)))

(assert (=> b!528675 (= res!324641 (or (bvsgt (x!49472 lt!243529) #b01111111111111111111111111111110) (bvslt lt!243524 #b00000000000000000000000000000000) (bvsge lt!243524 (size!16465 a!3235)) (bvslt (index!20498 lt!243529) #b00000000000000000000000000000000) (bvsge (index!20498 lt!243529) (size!16465 a!3235)) (not (= lt!243529 (Intermediate!4568 false (index!20498 lt!243529) (x!49472 lt!243529))))))))

(assert (=> b!528675 (= (index!20498 lt!243529) i!1204)))

(declare-fun lt!243523 () Unit!16724)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16724)

(assert (=> b!528675 (= lt!243523 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243524 #b00000000000000000000000000000000 (index!20498 lt!243529) (x!49472 lt!243529) mask!3524))))

(assert (=> b!528675 (and (or (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243525 () Unit!16724)

(assert (=> b!528675 (= lt!243525 e!308093)))

(declare-fun c!62330 () Bool)

(assert (=> b!528675 (= c!62330 (= (select (arr!16101 a!3235) (index!20498 lt!243529)) (select (arr!16101 a!3235) j!176)))))

(assert (=> b!528675 (and (bvslt (x!49472 lt!243529) #b01111111111111111111111111111110) (or (= (select (arr!16101 a!3235) (index!20498 lt!243529)) (select (arr!16101 a!3235) j!176)) (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16101 a!3235) (index!20498 lt!243529)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528676 () Bool)

(declare-fun res!324627 () Bool)

(assert (=> b!528676 (=> res!324627 e!308088)))

(declare-fun e!308091 () Bool)

(assert (=> b!528676 (= res!324627 e!308091)))

(declare-fun res!324628 () Bool)

(assert (=> b!528676 (=> (not res!324628) (not e!308091))))

(assert (=> b!528676 (= res!324628 (bvsgt #b00000000000000000000000000000000 (x!49472 lt!243529)))))

(declare-fun b!528677 () Bool)

(declare-fun res!324640 () Bool)

(assert (=> b!528677 (=> (not res!324640) (not e!308090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33505 (_ BitVec 32)) Bool)

(assert (=> b!528677 (= res!324640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528678 () Bool)

(declare-fun res!324638 () Bool)

(assert (=> b!528678 (=> (not res!324638) (not e!308090))))

(declare-datatypes ((List!10259 0))(
  ( (Nil!10256) (Cons!10255 (h!11192 (_ BitVec 64)) (t!16487 List!10259)) )
))
(declare-fun arrayNoDuplicates!0 (array!33505 (_ BitVec 32) List!10259) Bool)

(assert (=> b!528678 (= res!324638 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10256))))

(declare-fun b!528670 () Bool)

(declare-fun res!324634 () Bool)

(assert (=> b!528670 (=> (not res!324634) (not e!308094))))

(assert (=> b!528670 (= res!324634 (validKeyInArray!0 k!2280))))

(declare-fun res!324632 () Bool)

(assert (=> start!48012 (=> (not res!324632) (not e!308094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48012 (= res!324632 (validMask!0 mask!3524))))

(assert (=> start!48012 e!308094))

(assert (=> start!48012 true))

(declare-fun array_inv!11897 (array!33505) Bool)

(assert (=> start!48012 (array_inv!11897 a!3235)))

(declare-fun b!528679 () Bool)

(declare-fun Unit!16727 () Unit!16724)

(assert (=> b!528679 (= e!308093 Unit!16727)))

(declare-fun b!528680 () Bool)

(declare-fun res!324639 () Bool)

(assert (=> b!528680 (=> (not res!324639) (not e!308094))))

(assert (=> b!528680 (= res!324639 (and (= (size!16465 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16465 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16465 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528681 () Bool)

(assert (=> b!528681 (= e!308090 (not e!308092))))

(declare-fun res!324636 () Bool)

(assert (=> b!528681 (=> res!324636 e!308092)))

(declare-fun lt!243521 () SeekEntryResult!4568)

(assert (=> b!528681 (= res!324636 (or (= lt!243529 lt!243521) (undefined!5380 lt!243529) (not (is-Intermediate!4568 lt!243529))))))

(declare-fun lt!243526 () (_ BitVec 32))

(assert (=> b!528681 (= lt!243521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243526 lt!243531 lt!243530 mask!3524))))

(assert (=> b!528681 (= lt!243529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243524 (select (arr!16101 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528681 (= lt!243526 (toIndex!0 lt!243531 mask!3524))))

(assert (=> b!528681 (= lt!243531 (select (store (arr!16101 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528681 (= lt!243524 (toIndex!0 (select (arr!16101 a!3235) j!176) mask!3524))))

(assert (=> b!528681 (= lt!243530 (array!33506 (store (arr!16101 a!3235) i!1204 k!2280) (size!16465 a!3235)))))

(declare-fun lt!243522 () SeekEntryResult!4568)

(assert (=> b!528681 (= lt!243522 (Found!4568 j!176))))

(declare-fun e!308086 () Bool)

(assert (=> b!528681 e!308086))

(declare-fun res!324633 () Bool)

(assert (=> b!528681 (=> (not res!324633) (not e!308086))))

(assert (=> b!528681 (= res!324633 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243520 () Unit!16724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16724)

(assert (=> b!528681 (= lt!243520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528682 () Bool)

(assert (=> b!528682 (= e!308086 (= (seekEntryOrOpen!0 (select (arr!16101 a!3235) j!176) a!3235 mask!3524) (Found!4568 j!176)))))

(declare-fun b!528683 () Bool)

(declare-fun res!324635 () Bool)

(assert (=> b!528683 (=> res!324635 e!308088)))

(assert (=> b!528683 (= res!324635 (not (= lt!243521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243524 lt!243531 lt!243530 mask!3524))))))

(declare-fun b!528684 () Bool)

(assert (=> b!528684 (= e!308088 true)))

(assert (=> b!528684 (= (seekEntryOrOpen!0 lt!243531 lt!243530 mask!3524) lt!243522)))

(declare-fun lt!243527 () Unit!16724)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16724)

(assert (=> b!528684 (= lt!243527 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243524 #b00000000000000000000000000000000 (index!20498 lt!243529) (x!49472 lt!243529) mask!3524))))

(declare-fun b!528685 () Bool)

(assert (=> b!528685 (= e!308087 false)))

(declare-fun b!528686 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33505 (_ BitVec 32)) SeekEntryResult!4568)

(assert (=> b!528686 (= e!308091 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243524 (index!20498 lt!243529) (select (arr!16101 a!3235) j!176) a!3235 mask!3524) lt!243522)))))

(assert (= (and start!48012 res!324632) b!528680))

(assert (= (and b!528680 res!324639) b!528672))

(assert (= (and b!528672 res!324629) b!528670))

(assert (= (and b!528670 res!324634) b!528674))

(assert (= (and b!528674 res!324631) b!528671))

(assert (= (and b!528671 res!324630) b!528677))

(assert (= (and b!528677 res!324640) b!528678))

(assert (= (and b!528678 res!324638) b!528681))

(assert (= (and b!528681 res!324633) b!528682))

(assert (= (and b!528681 (not res!324636)) b!528675))

(assert (= (and b!528675 c!62330) b!528673))

(assert (= (and b!528675 (not c!62330)) b!528679))

(assert (= (and b!528673 res!324637) b!528685))

(assert (= (and b!528675 (not res!324641)) b!528676))

(assert (= (and b!528676 res!324628) b!528686))

(assert (= (and b!528676 (not res!324627)) b!528683))

(assert (= (and b!528683 (not res!324635)) b!528684))

(declare-fun m!509205 () Bool)

(assert (=> b!528672 m!509205))

(assert (=> b!528672 m!509205))

(declare-fun m!509207 () Bool)

(assert (=> b!528672 m!509207))

(declare-fun m!509209 () Bool)

(assert (=> b!528677 m!509209))

(declare-fun m!509211 () Bool)

(assert (=> b!528671 m!509211))

(declare-fun m!509213 () Bool)

(assert (=> b!528670 m!509213))

(declare-fun m!509215 () Bool)

(assert (=> b!528674 m!509215))

(declare-fun m!509217 () Bool)

(assert (=> b!528681 m!509217))

(declare-fun m!509219 () Bool)

(assert (=> b!528681 m!509219))

(declare-fun m!509221 () Bool)

(assert (=> b!528681 m!509221))

(declare-fun m!509223 () Bool)

(assert (=> b!528681 m!509223))

(assert (=> b!528681 m!509205))

(declare-fun m!509225 () Bool)

(assert (=> b!528681 m!509225))

(declare-fun m!509227 () Bool)

(assert (=> b!528681 m!509227))

(assert (=> b!528681 m!509205))

(declare-fun m!509229 () Bool)

(assert (=> b!528681 m!509229))

(assert (=> b!528681 m!509205))

(declare-fun m!509231 () Bool)

(assert (=> b!528681 m!509231))

(declare-fun m!509233 () Bool)

(assert (=> b!528678 m!509233))

(declare-fun m!509235 () Bool)

(assert (=> b!528684 m!509235))

(declare-fun m!509237 () Bool)

(assert (=> b!528684 m!509237))

(declare-fun m!509239 () Bool)

(assert (=> b!528673 m!509239))

(declare-fun m!509241 () Bool)

(assert (=> b!528673 m!509241))

(assert (=> b!528682 m!509205))

(assert (=> b!528682 m!509205))

(declare-fun m!509243 () Bool)

(assert (=> b!528682 m!509243))

(assert (=> b!528686 m!509205))

(assert (=> b!528686 m!509205))

(declare-fun m!509245 () Bool)

(assert (=> b!528686 m!509245))

(declare-fun m!509247 () Bool)

(assert (=> start!48012 m!509247))

(declare-fun m!509249 () Bool)

(assert (=> start!48012 m!509249))

(assert (=> b!528683 m!509241))

(declare-fun m!509251 () Bool)

(assert (=> b!528675 m!509251))

(declare-fun m!509253 () Bool)

(assert (=> b!528675 m!509253))

(assert (=> b!528675 m!509205))

(push 1)

