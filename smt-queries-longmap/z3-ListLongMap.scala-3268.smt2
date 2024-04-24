; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45470 () Bool)

(assert start!45470)

(declare-fun b!500702 () Bool)

(declare-fun e!293337 () Bool)

(assert (=> b!500702 (= e!293337 true)))

(declare-fun lt!227343 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227349 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3952 0))(
  ( (MissingZero!3952 (index!17990 (_ BitVec 32))) (Found!3952 (index!17991 (_ BitVec 32))) (Intermediate!3952 (undefined!4764 Bool) (index!17992 (_ BitVec 32)) (x!47170 (_ BitVec 32))) (Undefined!3952) (MissingVacant!3952 (index!17993 (_ BitVec 32))) )
))
(declare-fun lt!227345 () SeekEntryResult!3952)

(declare-datatypes ((array!32296 0))(
  ( (array!32297 (arr!15529 (Array (_ BitVec 32) (_ BitVec 64))) (size!15893 (_ BitVec 32))) )
))
(declare-fun lt!227346 () array!32296)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32296 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!500702 (= lt!227345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227349 lt!227343 lt!227346 mask!3524))))

(declare-fun b!500704 () Bool)

(declare-fun res!302544 () Bool)

(declare-fun e!293341 () Bool)

(assert (=> b!500704 (=> (not res!302544) (not e!293341))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500704 (= res!302544 (validKeyInArray!0 k0!2280))))

(declare-fun b!500705 () Bool)

(declare-fun res!302543 () Bool)

(assert (=> b!500705 (=> (not res!302543) (not e!293341))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32296)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500705 (= res!302543 (and (= (size!15893 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15893 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15893 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500706 () Bool)

(declare-fun e!293340 () Bool)

(assert (=> b!500706 (= e!293341 e!293340)))

(declare-fun res!302546 () Bool)

(assert (=> b!500706 (=> (not res!302546) (not e!293340))))

(declare-fun lt!227347 () SeekEntryResult!3952)

(assert (=> b!500706 (= res!302546 (or (= lt!227347 (MissingZero!3952 i!1204)) (= lt!227347 (MissingVacant!3952 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32296 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!500706 (= lt!227347 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500707 () Bool)

(declare-fun res!302549 () Bool)

(assert (=> b!500707 (=> (not res!302549) (not e!293340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32296 (_ BitVec 32)) Bool)

(assert (=> b!500707 (= res!302549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500708 () Bool)

(declare-fun res!302548 () Bool)

(declare-fun e!293339 () Bool)

(assert (=> b!500708 (=> res!302548 e!293339)))

(declare-fun lt!227344 () SeekEntryResult!3952)

(get-info :version)

(assert (=> b!500708 (= res!302548 (or (undefined!4764 lt!227344) (not ((_ is Intermediate!3952) lt!227344))))))

(declare-fun b!500709 () Bool)

(assert (=> b!500709 (= e!293340 (not e!293339))))

(declare-fun res!302553 () Bool)

(assert (=> b!500709 (=> res!302553 e!293339)))

(declare-fun lt!227348 () (_ BitVec 32))

(assert (=> b!500709 (= res!302553 (= lt!227344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227348 lt!227343 lt!227346 mask!3524)))))

(assert (=> b!500709 (= lt!227344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227349 (select (arr!15529 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500709 (= lt!227348 (toIndex!0 lt!227343 mask!3524))))

(assert (=> b!500709 (= lt!227343 (select (store (arr!15529 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500709 (= lt!227349 (toIndex!0 (select (arr!15529 a!3235) j!176) mask!3524))))

(assert (=> b!500709 (= lt!227346 (array!32297 (store (arr!15529 a!3235) i!1204 k0!2280) (size!15893 a!3235)))))

(declare-fun e!293342 () Bool)

(assert (=> b!500709 e!293342))

(declare-fun res!302542 () Bool)

(assert (=> b!500709 (=> (not res!302542) (not e!293342))))

(assert (=> b!500709 (= res!302542 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15043 0))(
  ( (Unit!15044) )
))
(declare-fun lt!227341 () Unit!15043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15043)

(assert (=> b!500709 (= lt!227341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500710 () Bool)

(assert (=> b!500710 (= e!293339 e!293337)))

(declare-fun res!302547 () Bool)

(assert (=> b!500710 (=> res!302547 e!293337)))

(assert (=> b!500710 (= res!302547 (or (bvsgt #b00000000000000000000000000000000 (x!47170 lt!227344)) (bvsgt (x!47170 lt!227344) #b01111111111111111111111111111110) (bvslt lt!227349 #b00000000000000000000000000000000) (bvsge lt!227349 (size!15893 a!3235)) (bvslt (index!17992 lt!227344) #b00000000000000000000000000000000) (bvsge (index!17992 lt!227344) (size!15893 a!3235)) (not (= lt!227344 (Intermediate!3952 false (index!17992 lt!227344) (x!47170 lt!227344))))))))

(assert (=> b!500710 (and (or (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227350 () Unit!15043)

(declare-fun e!293336 () Unit!15043)

(assert (=> b!500710 (= lt!227350 e!293336)))

(declare-fun c!59357 () Bool)

(assert (=> b!500710 (= c!59357 (= (select (arr!15529 a!3235) (index!17992 lt!227344)) (select (arr!15529 a!3235) j!176)))))

(assert (=> b!500710 (and (bvslt (x!47170 lt!227344) #b01111111111111111111111111111110) (or (= (select (arr!15529 a!3235) (index!17992 lt!227344)) (select (arr!15529 a!3235) j!176)) (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15529 a!3235) (index!17992 lt!227344)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500711 () Bool)

(declare-fun Unit!15045 () Unit!15043)

(assert (=> b!500711 (= e!293336 Unit!15045)))

(declare-fun lt!227342 () Unit!15043)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32296 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15043)

(assert (=> b!500711 (= lt!227342 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227349 #b00000000000000000000000000000000 (index!17992 lt!227344) (x!47170 lt!227344) mask!3524))))

(declare-fun res!302550 () Bool)

(assert (=> b!500711 (= res!302550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227349 lt!227343 lt!227346 mask!3524) (Intermediate!3952 false (index!17992 lt!227344) (x!47170 lt!227344))))))

(declare-fun e!293343 () Bool)

(assert (=> b!500711 (=> (not res!302550) (not e!293343))))

(assert (=> b!500711 e!293343))

(declare-fun b!500712 () Bool)

(assert (=> b!500712 (= e!293343 false)))

(declare-fun b!500713 () Bool)

(declare-fun res!302554 () Bool)

(assert (=> b!500713 (=> (not res!302554) (not e!293341))))

(assert (=> b!500713 (= res!302554 (validKeyInArray!0 (select (arr!15529 a!3235) j!176)))))

(declare-fun b!500703 () Bool)

(assert (=> b!500703 (= e!293342 (= (seekEntryOrOpen!0 (select (arr!15529 a!3235) j!176) a!3235 mask!3524) (Found!3952 j!176)))))

(declare-fun res!302551 () Bool)

(assert (=> start!45470 (=> (not res!302551) (not e!293341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45470 (= res!302551 (validMask!0 mask!3524))))

(assert (=> start!45470 e!293341))

(assert (=> start!45470 true))

(declare-fun array_inv!11388 (array!32296) Bool)

(assert (=> start!45470 (array_inv!11388 a!3235)))

(declare-fun b!500714 () Bool)

(declare-fun res!302545 () Bool)

(assert (=> b!500714 (=> (not res!302545) (not e!293341))))

(declare-fun arrayContainsKey!0 (array!32296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500714 (= res!302545 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500715 () Bool)

(declare-fun Unit!15046 () Unit!15043)

(assert (=> b!500715 (= e!293336 Unit!15046)))

(declare-fun b!500716 () Bool)

(declare-fun res!302552 () Bool)

(assert (=> b!500716 (=> (not res!302552) (not e!293340))))

(declare-datatypes ((List!9594 0))(
  ( (Nil!9591) (Cons!9590 (h!10464 (_ BitVec 64)) (t!15814 List!9594)) )
))
(declare-fun arrayNoDuplicates!0 (array!32296 (_ BitVec 32) List!9594) Bool)

(assert (=> b!500716 (= res!302552 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9591))))

(assert (= (and start!45470 res!302551) b!500705))

(assert (= (and b!500705 res!302543) b!500713))

(assert (= (and b!500713 res!302554) b!500704))

(assert (= (and b!500704 res!302544) b!500714))

(assert (= (and b!500714 res!302545) b!500706))

(assert (= (and b!500706 res!302546) b!500707))

(assert (= (and b!500707 res!302549) b!500716))

(assert (= (and b!500716 res!302552) b!500709))

(assert (= (and b!500709 res!302542) b!500703))

(assert (= (and b!500709 (not res!302553)) b!500708))

(assert (= (and b!500708 (not res!302548)) b!500710))

(assert (= (and b!500710 c!59357) b!500711))

(assert (= (and b!500710 (not c!59357)) b!500715))

(assert (= (and b!500711 res!302550) b!500712))

(assert (= (and b!500710 (not res!302547)) b!500702))

(declare-fun m!482059 () Bool)

(assert (=> b!500711 m!482059))

(declare-fun m!482061 () Bool)

(assert (=> b!500711 m!482061))

(declare-fun m!482063 () Bool)

(assert (=> b!500716 m!482063))

(declare-fun m!482065 () Bool)

(assert (=> b!500709 m!482065))

(declare-fun m!482067 () Bool)

(assert (=> b!500709 m!482067))

(declare-fun m!482069 () Bool)

(assert (=> b!500709 m!482069))

(declare-fun m!482071 () Bool)

(assert (=> b!500709 m!482071))

(declare-fun m!482073 () Bool)

(assert (=> b!500709 m!482073))

(declare-fun m!482075 () Bool)

(assert (=> b!500709 m!482075))

(assert (=> b!500709 m!482073))

(assert (=> b!500709 m!482073))

(declare-fun m!482077 () Bool)

(assert (=> b!500709 m!482077))

(declare-fun m!482079 () Bool)

(assert (=> b!500709 m!482079))

(declare-fun m!482081 () Bool)

(assert (=> b!500709 m!482081))

(declare-fun m!482083 () Bool)

(assert (=> b!500706 m!482083))

(declare-fun m!482085 () Bool)

(assert (=> start!45470 m!482085))

(declare-fun m!482087 () Bool)

(assert (=> start!45470 m!482087))

(assert (=> b!500702 m!482061))

(declare-fun m!482089 () Bool)

(assert (=> b!500714 m!482089))

(assert (=> b!500703 m!482073))

(assert (=> b!500703 m!482073))

(declare-fun m!482091 () Bool)

(assert (=> b!500703 m!482091))

(declare-fun m!482093 () Bool)

(assert (=> b!500704 m!482093))

(declare-fun m!482095 () Bool)

(assert (=> b!500710 m!482095))

(assert (=> b!500710 m!482073))

(assert (=> b!500713 m!482073))

(assert (=> b!500713 m!482073))

(declare-fun m!482097 () Bool)

(assert (=> b!500713 m!482097))

(declare-fun m!482099 () Bool)

(assert (=> b!500707 m!482099))

(check-sat (not b!500704) (not start!45470) (not b!500707) (not b!500716) (not b!500713) (not b!500714) (not b!500702) (not b!500709) (not b!500706) (not b!500711) (not b!500703))
(check-sat)
