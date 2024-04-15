; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45576 () Bool)

(assert start!45576)

(declare-fun b!501651 () Bool)

(declare-fun res!303272 () Bool)

(declare-fun e!293852 () Bool)

(assert (=> b!501651 (=> (not res!303272) (not e!293852))))

(declare-datatypes ((array!32342 0))(
  ( (array!32343 (arr!15551 (Array (_ BitVec 32) (_ BitVec 64))) (size!15916 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32342)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32342 (_ BitVec 32)) Bool)

(assert (=> b!501651 (= res!303272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501652 () Bool)

(declare-fun res!303279 () Bool)

(declare-fun e!293848 () Bool)

(assert (=> b!501652 (=> (not res!303279) (not e!293848))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501652 (= res!303279 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501653 () Bool)

(declare-fun e!293850 () Bool)

(assert (=> b!501653 (= e!293852 (not e!293850))))

(declare-fun res!303275 () Bool)

(assert (=> b!501653 (=> res!303275 e!293850)))

(declare-datatypes ((SeekEntryResult!4015 0))(
  ( (MissingZero!4015 (index!18248 (_ BitVec 32))) (Found!4015 (index!18249 (_ BitVec 32))) (Intermediate!4015 (undefined!4827 Bool) (index!18250 (_ BitVec 32)) (x!47291 (_ BitVec 32))) (Undefined!4015) (MissingVacant!4015 (index!18251 (_ BitVec 32))) )
))
(declare-fun lt!227812 () SeekEntryResult!4015)

(declare-fun lt!227814 () (_ BitVec 32))

(declare-fun lt!227818 () array!32342)

(declare-fun lt!227815 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501653 (= res!303275 (= lt!227812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227814 lt!227815 lt!227818 mask!3524)))))

(declare-fun lt!227816 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501653 (= lt!227812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227816 (select (arr!15551 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501653 (= lt!227814 (toIndex!0 lt!227815 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501653 (= lt!227815 (select (store (arr!15551 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501653 (= lt!227816 (toIndex!0 (select (arr!15551 a!3235) j!176) mask!3524))))

(assert (=> b!501653 (= lt!227818 (array!32343 (store (arr!15551 a!3235) i!1204 k0!2280) (size!15916 a!3235)))))

(declare-fun e!293847 () Bool)

(assert (=> b!501653 e!293847))

(declare-fun res!303284 () Bool)

(assert (=> b!501653 (=> (not res!303284) (not e!293847))))

(assert (=> b!501653 (= res!303284 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15130 0))(
  ( (Unit!15131) )
))
(declare-fun lt!227810 () Unit!15130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15130)

(assert (=> b!501653 (= lt!227810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501654 () Bool)

(declare-fun res!303278 () Bool)

(assert (=> b!501654 (=> (not res!303278) (not e!293848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501654 (= res!303278 (validKeyInArray!0 (select (arr!15551 a!3235) j!176)))))

(declare-fun b!501655 () Bool)

(declare-fun e!293849 () Bool)

(assert (=> b!501655 (= e!293849 false)))

(declare-fun e!293845 () Bool)

(declare-fun b!501656 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501656 (= e!293845 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227816 (index!18250 lt!227812) (select (arr!15551 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176))))))

(declare-fun res!303277 () Bool)

(assert (=> start!45576 (=> (not res!303277) (not e!293848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45576 (= res!303277 (validMask!0 mask!3524))))

(assert (=> start!45576 e!293848))

(assert (=> start!45576 true))

(declare-fun array_inv!11434 (array!32342) Bool)

(assert (=> start!45576 (array_inv!11434 a!3235)))

(declare-fun b!501657 () Bool)

(declare-fun res!303282 () Bool)

(assert (=> b!501657 (=> (not res!303282) (not e!293848))))

(assert (=> b!501657 (= res!303282 (and (= (size!15916 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15916 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15916 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501658 () Bool)

(declare-fun e!293853 () Unit!15130)

(declare-fun Unit!15132 () Unit!15130)

(assert (=> b!501658 (= e!293853 Unit!15132)))

(declare-fun lt!227809 () Unit!15130)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32342 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15130)

(assert (=> b!501658 (= lt!227809 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227816 #b00000000000000000000000000000000 (index!18250 lt!227812) (x!47291 lt!227812) mask!3524))))

(declare-fun res!303276 () Bool)

(assert (=> b!501658 (= res!303276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227816 lt!227815 lt!227818 mask!3524) (Intermediate!4015 false (index!18250 lt!227812) (x!47291 lt!227812))))))

(assert (=> b!501658 (=> (not res!303276) (not e!293849))))

(assert (=> b!501658 e!293849))

(declare-fun b!501659 () Bool)

(declare-fun res!303280 () Bool)

(assert (=> b!501659 (=> (not res!303280) (not e!293852))))

(declare-datatypes ((List!9748 0))(
  ( (Nil!9745) (Cons!9744 (h!10621 (_ BitVec 64)) (t!15967 List!9748)) )
))
(declare-fun arrayNoDuplicates!0 (array!32342 (_ BitVec 32) List!9748) Bool)

(assert (=> b!501659 (= res!303280 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9745))))

(declare-fun b!501660 () Bool)

(declare-fun Unit!15133 () Unit!15130)

(assert (=> b!501660 (= e!293853 Unit!15133)))

(declare-fun b!501661 () Bool)

(declare-fun res!303273 () Bool)

(assert (=> b!501661 (=> res!303273 e!293850)))

(get-info :version)

(assert (=> b!501661 (= res!303273 (or (undefined!4827 lt!227812) (not ((_ is Intermediate!4015) lt!227812))))))

(declare-fun b!501662 () Bool)

(assert (=> b!501662 (= e!293848 e!293852)))

(declare-fun res!303270 () Bool)

(assert (=> b!501662 (=> (not res!303270) (not e!293852))))

(declare-fun lt!227813 () SeekEntryResult!4015)

(assert (=> b!501662 (= res!303270 (or (= lt!227813 (MissingZero!4015 i!1204)) (= lt!227813 (MissingVacant!4015 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32342 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!501662 (= lt!227813 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501663 () Bool)

(declare-fun res!303281 () Bool)

(declare-fun e!293846 () Bool)

(assert (=> b!501663 (=> res!303281 e!293846)))

(assert (=> b!501663 (= res!303281 e!293845)))

(declare-fun res!303283 () Bool)

(assert (=> b!501663 (=> (not res!303283) (not e!293845))))

(assert (=> b!501663 (= res!303283 (bvsgt #b00000000000000000000000000000000 (x!47291 lt!227812)))))

(declare-fun b!501664 () Bool)

(assert (=> b!501664 (= e!293846 true)))

(declare-fun lt!227817 () SeekEntryResult!4015)

(assert (=> b!501664 (= lt!227817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227816 lt!227815 lt!227818 mask!3524))))

(declare-fun b!501665 () Bool)

(declare-fun res!303271 () Bool)

(assert (=> b!501665 (=> (not res!303271) (not e!293848))))

(assert (=> b!501665 (= res!303271 (validKeyInArray!0 k0!2280))))

(declare-fun b!501666 () Bool)

(assert (=> b!501666 (= e!293850 e!293846)))

(declare-fun res!303274 () Bool)

(assert (=> b!501666 (=> res!303274 e!293846)))

(assert (=> b!501666 (= res!303274 (or (bvsgt (x!47291 lt!227812) #b01111111111111111111111111111110) (bvslt lt!227816 #b00000000000000000000000000000000) (bvsge lt!227816 (size!15916 a!3235)) (bvslt (index!18250 lt!227812) #b00000000000000000000000000000000) (bvsge (index!18250 lt!227812) (size!15916 a!3235)) (not (= lt!227812 (Intermediate!4015 false (index!18250 lt!227812) (x!47291 lt!227812))))))))

(assert (=> b!501666 (= (index!18250 lt!227812) i!1204)))

(declare-fun lt!227811 () Unit!15130)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32342 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15130)

(assert (=> b!501666 (= lt!227811 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227816 #b00000000000000000000000000000000 (index!18250 lt!227812) (x!47291 lt!227812) mask!3524))))

(assert (=> b!501666 (and (or (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227808 () Unit!15130)

(assert (=> b!501666 (= lt!227808 e!293853)))

(declare-fun c!59469 () Bool)

(assert (=> b!501666 (= c!59469 (= (select (arr!15551 a!3235) (index!18250 lt!227812)) (select (arr!15551 a!3235) j!176)))))

(assert (=> b!501666 (and (bvslt (x!47291 lt!227812) #b01111111111111111111111111111110) (or (= (select (arr!15551 a!3235) (index!18250 lt!227812)) (select (arr!15551 a!3235) j!176)) (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15551 a!3235) (index!18250 lt!227812)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501667 () Bool)

(assert (=> b!501667 (= e!293847 (= (seekEntryOrOpen!0 (select (arr!15551 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176)))))

(assert (= (and start!45576 res!303277) b!501657))

(assert (= (and b!501657 res!303282) b!501654))

(assert (= (and b!501654 res!303278) b!501665))

(assert (= (and b!501665 res!303271) b!501652))

(assert (= (and b!501652 res!303279) b!501662))

(assert (= (and b!501662 res!303270) b!501651))

(assert (= (and b!501651 res!303272) b!501659))

(assert (= (and b!501659 res!303280) b!501653))

(assert (= (and b!501653 res!303284) b!501667))

(assert (= (and b!501653 (not res!303275)) b!501661))

(assert (= (and b!501661 (not res!303273)) b!501666))

(assert (= (and b!501666 c!59469) b!501658))

(assert (= (and b!501666 (not c!59469)) b!501660))

(assert (= (and b!501658 res!303276) b!501655))

(assert (= (and b!501666 (not res!303274)) b!501663))

(assert (= (and b!501663 res!303283) b!501656))

(assert (= (and b!501663 (not res!303281)) b!501664))

(declare-fun m!482155 () Bool)

(assert (=> b!501658 m!482155))

(declare-fun m!482157 () Bool)

(assert (=> b!501658 m!482157))

(declare-fun m!482159 () Bool)

(assert (=> b!501653 m!482159))

(declare-fun m!482161 () Bool)

(assert (=> b!501653 m!482161))

(declare-fun m!482163 () Bool)

(assert (=> b!501653 m!482163))

(declare-fun m!482165 () Bool)

(assert (=> b!501653 m!482165))

(declare-fun m!482167 () Bool)

(assert (=> b!501653 m!482167))

(declare-fun m!482169 () Bool)

(assert (=> b!501653 m!482169))

(assert (=> b!501653 m!482161))

(declare-fun m!482171 () Bool)

(assert (=> b!501653 m!482171))

(assert (=> b!501653 m!482161))

(declare-fun m!482173 () Bool)

(assert (=> b!501653 m!482173))

(declare-fun m!482175 () Bool)

(assert (=> b!501653 m!482175))

(declare-fun m!482177 () Bool)

(assert (=> b!501652 m!482177))

(assert (=> b!501667 m!482161))

(assert (=> b!501667 m!482161))

(declare-fun m!482179 () Bool)

(assert (=> b!501667 m!482179))

(assert (=> b!501656 m!482161))

(assert (=> b!501656 m!482161))

(declare-fun m!482181 () Bool)

(assert (=> b!501656 m!482181))

(declare-fun m!482183 () Bool)

(assert (=> b!501659 m!482183))

(declare-fun m!482185 () Bool)

(assert (=> start!45576 m!482185))

(declare-fun m!482187 () Bool)

(assert (=> start!45576 m!482187))

(declare-fun m!482189 () Bool)

(assert (=> b!501651 m!482189))

(assert (=> b!501664 m!482157))

(declare-fun m!482191 () Bool)

(assert (=> b!501666 m!482191))

(declare-fun m!482193 () Bool)

(assert (=> b!501666 m!482193))

(assert (=> b!501666 m!482161))

(declare-fun m!482195 () Bool)

(assert (=> b!501665 m!482195))

(assert (=> b!501654 m!482161))

(assert (=> b!501654 m!482161))

(declare-fun m!482197 () Bool)

(assert (=> b!501654 m!482197))

(declare-fun m!482199 () Bool)

(assert (=> b!501662 m!482199))

(check-sat (not b!501662) (not b!501652) (not b!501656) (not b!501664) (not b!501658) (not start!45576) (not b!501659) (not b!501654) (not b!501666) (not b!501651) (not b!501665) (not b!501667) (not b!501653))
(check-sat)
