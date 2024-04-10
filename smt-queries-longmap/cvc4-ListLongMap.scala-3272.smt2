; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45580 () Bool)

(assert start!45580)

(declare-fun e!293917 () Bool)

(declare-datatypes ((array!32336 0))(
  ( (array!32337 (arr!15548 (Array (_ BitVec 32) (_ BitVec 64))) (size!15912 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32336)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4015 0))(
  ( (MissingZero!4015 (index!18248 (_ BitVec 32))) (Found!4015 (index!18249 (_ BitVec 32))) (Intermediate!4015 (undefined!4827 Bool) (index!18250 (_ BitVec 32)) (x!47280 (_ BitVec 32))) (Undefined!4015) (MissingVacant!4015 (index!18251 (_ BitVec 32))) )
))
(declare-fun lt!227918 () SeekEntryResult!4015)

(declare-fun b!501718 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227912 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501718 (= e!293917 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227912 (index!18250 lt!227918) (select (arr!15548 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176))))))

(declare-fun res!303219 () Bool)

(declare-fun e!293911 () Bool)

(assert (=> start!45580 (=> (not res!303219) (not e!293911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45580 (= res!303219 (validMask!0 mask!3524))))

(assert (=> start!45580 e!293911))

(assert (=> start!45580 true))

(declare-fun array_inv!11344 (array!32336) Bool)

(assert (=> start!45580 (array_inv!11344 a!3235)))

(declare-fun b!501719 () Bool)

(declare-fun e!293912 () Bool)

(declare-fun e!293916 () Bool)

(assert (=> b!501719 (= e!293912 e!293916)))

(declare-fun res!303224 () Bool)

(assert (=> b!501719 (=> res!303224 e!293916)))

(assert (=> b!501719 (= res!303224 (or (bvsgt (x!47280 lt!227918) #b01111111111111111111111111111110) (bvslt lt!227912 #b00000000000000000000000000000000) (bvsge lt!227912 (size!15912 a!3235)) (bvslt (index!18250 lt!227918) #b00000000000000000000000000000000) (bvsge (index!18250 lt!227918) (size!15912 a!3235)) (not (= lt!227918 (Intermediate!4015 false (index!18250 lt!227918) (x!47280 lt!227918))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501719 (= (index!18250 lt!227918) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!15136 0))(
  ( (Unit!15137) )
))
(declare-fun lt!227919 () Unit!15136)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32336 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15136)

(assert (=> b!501719 (= lt!227919 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227912 #b00000000000000000000000000000000 (index!18250 lt!227918) (x!47280 lt!227918) mask!3524))))

(assert (=> b!501719 (and (or (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227913 () Unit!15136)

(declare-fun e!293913 () Unit!15136)

(assert (=> b!501719 (= lt!227913 e!293913)))

(declare-fun c!59528 () Bool)

(assert (=> b!501719 (= c!59528 (= (select (arr!15548 a!3235) (index!18250 lt!227918)) (select (arr!15548 a!3235) j!176)))))

(assert (=> b!501719 (and (bvslt (x!47280 lt!227918) #b01111111111111111111111111111110) (or (= (select (arr!15548 a!3235) (index!18250 lt!227918)) (select (arr!15548 a!3235) j!176)) (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15548 a!3235) (index!18250 lt!227918)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501720 () Bool)

(declare-fun e!293918 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501720 (= e!293918 (= (seekEntryOrOpen!0 (select (arr!15548 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176)))))

(declare-fun b!501721 () Bool)

(declare-fun e!293915 () Bool)

(assert (=> b!501721 (= e!293911 e!293915)))

(declare-fun res!303231 () Bool)

(assert (=> b!501721 (=> (not res!303231) (not e!293915))))

(declare-fun lt!227910 () SeekEntryResult!4015)

(assert (=> b!501721 (= res!303231 (or (= lt!227910 (MissingZero!4015 i!1204)) (= lt!227910 (MissingVacant!4015 i!1204))))))

(assert (=> b!501721 (= lt!227910 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501722 () Bool)

(declare-fun res!303226 () Bool)

(assert (=> b!501722 (=> (not res!303226) (not e!293911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501722 (= res!303226 (validKeyInArray!0 k!2280))))

(declare-fun b!501723 () Bool)

(declare-fun res!303230 () Bool)

(assert (=> b!501723 (=> res!303230 e!293916)))

(assert (=> b!501723 (= res!303230 e!293917)))

(declare-fun res!303222 () Bool)

(assert (=> b!501723 (=> (not res!303222) (not e!293917))))

(assert (=> b!501723 (= res!303222 (bvsgt #b00000000000000000000000000000000 (x!47280 lt!227918)))))

(declare-fun b!501724 () Bool)

(declare-fun res!303233 () Bool)

(assert (=> b!501724 (=> (not res!303233) (not e!293915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32336 (_ BitVec 32)) Bool)

(assert (=> b!501724 (= res!303233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501725 () Bool)

(declare-fun Unit!15138 () Unit!15136)

(assert (=> b!501725 (= e!293913 Unit!15138)))

(declare-fun lt!227920 () Unit!15136)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32336 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15136)

(assert (=> b!501725 (= lt!227920 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227912 #b00000000000000000000000000000000 (index!18250 lt!227918) (x!47280 lt!227918) mask!3524))))

(declare-fun lt!227915 () array!32336)

(declare-fun lt!227911 () (_ BitVec 64))

(declare-fun res!303229 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501725 (= res!303229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227912 lt!227911 lt!227915 mask!3524) (Intermediate!4015 false (index!18250 lt!227918) (x!47280 lt!227918))))))

(declare-fun e!293919 () Bool)

(assert (=> b!501725 (=> (not res!303229) (not e!293919))))

(assert (=> b!501725 e!293919))

(declare-fun b!501726 () Bool)

(declare-fun res!303223 () Bool)

(assert (=> b!501726 (=> (not res!303223) (not e!293911))))

(assert (=> b!501726 (= res!303223 (and (= (size!15912 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15912 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15912 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501727 () Bool)

(assert (=> b!501727 (= e!293916 true)))

(declare-fun lt!227916 () SeekEntryResult!4015)

(assert (=> b!501727 (= lt!227916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227912 lt!227911 lt!227915 mask!3524))))

(declare-fun b!501728 () Bool)

(assert (=> b!501728 (= e!293915 (not e!293912))))

(declare-fun res!303232 () Bool)

(assert (=> b!501728 (=> res!303232 e!293912)))

(declare-fun lt!227914 () (_ BitVec 32))

(assert (=> b!501728 (= res!303232 (= lt!227918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227914 lt!227911 lt!227915 mask!3524)))))

(assert (=> b!501728 (= lt!227918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227912 (select (arr!15548 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501728 (= lt!227914 (toIndex!0 lt!227911 mask!3524))))

(assert (=> b!501728 (= lt!227911 (select (store (arr!15548 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501728 (= lt!227912 (toIndex!0 (select (arr!15548 a!3235) j!176) mask!3524))))

(assert (=> b!501728 (= lt!227915 (array!32337 (store (arr!15548 a!3235) i!1204 k!2280) (size!15912 a!3235)))))

(assert (=> b!501728 e!293918))

(declare-fun res!303220 () Bool)

(assert (=> b!501728 (=> (not res!303220) (not e!293918))))

(assert (=> b!501728 (= res!303220 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227917 () Unit!15136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15136)

(assert (=> b!501728 (= lt!227917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501729 () Bool)

(declare-fun Unit!15139 () Unit!15136)

(assert (=> b!501729 (= e!293913 Unit!15139)))

(declare-fun b!501730 () Bool)

(declare-fun res!303221 () Bool)

(assert (=> b!501730 (=> (not res!303221) (not e!293915))))

(declare-datatypes ((List!9706 0))(
  ( (Nil!9703) (Cons!9702 (h!10579 (_ BitVec 64)) (t!15934 List!9706)) )
))
(declare-fun arrayNoDuplicates!0 (array!32336 (_ BitVec 32) List!9706) Bool)

(assert (=> b!501730 (= res!303221 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9703))))

(declare-fun b!501731 () Bool)

(declare-fun res!303225 () Bool)

(assert (=> b!501731 (=> res!303225 e!293912)))

(assert (=> b!501731 (= res!303225 (or (undefined!4827 lt!227918) (not (is-Intermediate!4015 lt!227918))))))

(declare-fun b!501732 () Bool)

(declare-fun res!303227 () Bool)

(assert (=> b!501732 (=> (not res!303227) (not e!293911))))

(assert (=> b!501732 (= res!303227 (validKeyInArray!0 (select (arr!15548 a!3235) j!176)))))

(declare-fun b!501733 () Bool)

(declare-fun res!303228 () Bool)

(assert (=> b!501733 (=> (not res!303228) (not e!293911))))

(declare-fun arrayContainsKey!0 (array!32336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501733 (= res!303228 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501734 () Bool)

(assert (=> b!501734 (= e!293919 false)))

(assert (= (and start!45580 res!303219) b!501726))

(assert (= (and b!501726 res!303223) b!501732))

(assert (= (and b!501732 res!303227) b!501722))

(assert (= (and b!501722 res!303226) b!501733))

(assert (= (and b!501733 res!303228) b!501721))

(assert (= (and b!501721 res!303231) b!501724))

(assert (= (and b!501724 res!303233) b!501730))

(assert (= (and b!501730 res!303221) b!501728))

(assert (= (and b!501728 res!303220) b!501720))

(assert (= (and b!501728 (not res!303232)) b!501731))

(assert (= (and b!501731 (not res!303225)) b!501719))

(assert (= (and b!501719 c!59528) b!501725))

(assert (= (and b!501719 (not c!59528)) b!501729))

(assert (= (and b!501725 res!303229) b!501734))

(assert (= (and b!501719 (not res!303224)) b!501723))

(assert (= (and b!501723 res!303222) b!501718))

(assert (= (and b!501723 (not res!303230)) b!501727))

(declare-fun m!482723 () Bool)

(assert (=> b!501724 m!482723))

(declare-fun m!482725 () Bool)

(assert (=> b!501733 m!482725))

(declare-fun m!482727 () Bool)

(assert (=> b!501720 m!482727))

(assert (=> b!501720 m!482727))

(declare-fun m!482729 () Bool)

(assert (=> b!501720 m!482729))

(declare-fun m!482731 () Bool)

(assert (=> start!45580 m!482731))

(declare-fun m!482733 () Bool)

(assert (=> start!45580 m!482733))

(assert (=> b!501732 m!482727))

(assert (=> b!501732 m!482727))

(declare-fun m!482735 () Bool)

(assert (=> b!501732 m!482735))

(declare-fun m!482737 () Bool)

(assert (=> b!501727 m!482737))

(declare-fun m!482739 () Bool)

(assert (=> b!501730 m!482739))

(assert (=> b!501728 m!482727))

(declare-fun m!482741 () Bool)

(assert (=> b!501728 m!482741))

(declare-fun m!482743 () Bool)

(assert (=> b!501728 m!482743))

(declare-fun m!482745 () Bool)

(assert (=> b!501728 m!482745))

(declare-fun m!482747 () Bool)

(assert (=> b!501728 m!482747))

(assert (=> b!501728 m!482727))

(declare-fun m!482749 () Bool)

(assert (=> b!501728 m!482749))

(declare-fun m!482751 () Bool)

(assert (=> b!501728 m!482751))

(assert (=> b!501728 m!482727))

(declare-fun m!482753 () Bool)

(assert (=> b!501728 m!482753))

(declare-fun m!482755 () Bool)

(assert (=> b!501728 m!482755))

(declare-fun m!482757 () Bool)

(assert (=> b!501721 m!482757))

(declare-fun m!482759 () Bool)

(assert (=> b!501725 m!482759))

(assert (=> b!501725 m!482737))

(declare-fun m!482761 () Bool)

(assert (=> b!501719 m!482761))

(declare-fun m!482763 () Bool)

(assert (=> b!501719 m!482763))

(assert (=> b!501719 m!482727))

(assert (=> b!501718 m!482727))

(assert (=> b!501718 m!482727))

(declare-fun m!482765 () Bool)

(assert (=> b!501718 m!482765))

(declare-fun m!482767 () Bool)

(assert (=> b!501722 m!482767))

(push 1)

