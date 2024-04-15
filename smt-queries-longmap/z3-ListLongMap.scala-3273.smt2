; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45570 () Bool)

(assert start!45570)

(declare-fun b!501498 () Bool)

(declare-datatypes ((Unit!15118 0))(
  ( (Unit!15119) )
))
(declare-fun e!293771 () Unit!15118)

(declare-fun Unit!15120 () Unit!15118)

(assert (=> b!501498 (= e!293771 Unit!15120)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!501500 () Bool)

(declare-datatypes ((array!32336 0))(
  ( (array!32337 (arr!15548 (Array (_ BitVec 32) (_ BitVec 64))) (size!15913 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32336)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!293769 () Bool)

(declare-datatypes ((SeekEntryResult!4012 0))(
  ( (MissingZero!4012 (index!18236 (_ BitVec 32))) (Found!4012 (index!18237 (_ BitVec 32))) (Intermediate!4012 (undefined!4824 Bool) (index!18238 (_ BitVec 32)) (x!47280 (_ BitVec 32))) (Undefined!4012) (MissingVacant!4012 (index!18239 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501500 (= e!293769 (= (seekEntryOrOpen!0 (select (arr!15548 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176)))))

(declare-fun b!501501 () Bool)

(declare-fun Unit!15121 () Unit!15118)

(assert (=> b!501501 (= e!293771 Unit!15121)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!227712 () (_ BitVec 32))

(declare-fun lt!227719 () Unit!15118)

(declare-fun lt!227713 () SeekEntryResult!4012)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32336 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15118)

(assert (=> b!501501 (= lt!227719 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227712 #b00000000000000000000000000000000 (index!18238 lt!227713) (x!47280 lt!227713) mask!3524))))

(declare-fun lt!227714 () (_ BitVec 64))

(declare-fun lt!227711 () array!32336)

(declare-fun res!303141 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501501 (= res!303141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227712 lt!227714 lt!227711 mask!3524) (Intermediate!4012 false (index!18238 lt!227713) (x!47280 lt!227713))))))

(declare-fun e!293766 () Bool)

(assert (=> b!501501 (=> (not res!303141) (not e!293766))))

(assert (=> b!501501 e!293766))

(declare-fun b!501502 () Bool)

(declare-fun res!303140 () Bool)

(declare-fun e!293770 () Bool)

(assert (=> b!501502 (=> (not res!303140) (not e!293770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501502 (= res!303140 (validKeyInArray!0 (select (arr!15548 a!3235) j!176)))))

(declare-fun b!501503 () Bool)

(declare-fun res!303145 () Bool)

(declare-fun e!293772 () Bool)

(assert (=> b!501503 (=> (not res!303145) (not e!293772))))

(declare-datatypes ((List!9745 0))(
  ( (Nil!9742) (Cons!9741 (h!10618 (_ BitVec 64)) (t!15964 List!9745)) )
))
(declare-fun arrayNoDuplicates!0 (array!32336 (_ BitVec 32) List!9745) Bool)

(assert (=> b!501503 (= res!303145 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9742))))

(declare-fun b!501504 () Bool)

(assert (=> b!501504 (= e!293770 e!293772)))

(declare-fun res!303148 () Bool)

(assert (=> b!501504 (=> (not res!303148) (not e!293772))))

(declare-fun lt!227716 () SeekEntryResult!4012)

(assert (=> b!501504 (= res!303148 (or (= lt!227716 (MissingZero!4012 i!1204)) (= lt!227716 (MissingVacant!4012 i!1204))))))

(assert (=> b!501504 (= lt!227716 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501505 () Bool)

(declare-fun res!303136 () Bool)

(assert (=> b!501505 (=> (not res!303136) (not e!293770))))

(assert (=> b!501505 (= res!303136 (validKeyInArray!0 k0!2280))))

(declare-fun b!501506 () Bool)

(declare-fun res!303144 () Bool)

(declare-fun e!293768 () Bool)

(assert (=> b!501506 (=> res!303144 e!293768)))

(get-info :version)

(assert (=> b!501506 (= res!303144 (or (undefined!4824 lt!227713) (not ((_ is Intermediate!4012) lt!227713))))))

(declare-fun e!293764 () Bool)

(declare-fun b!501499 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32336 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!501499 (= e!293764 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227712 (index!18238 lt!227713) (select (arr!15548 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176))))))

(declare-fun res!303137 () Bool)

(assert (=> start!45570 (=> (not res!303137) (not e!293770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45570 (= res!303137 (validMask!0 mask!3524))))

(assert (=> start!45570 e!293770))

(assert (=> start!45570 true))

(declare-fun array_inv!11431 (array!32336) Bool)

(assert (=> start!45570 (array_inv!11431 a!3235)))

(declare-fun b!501507 () Bool)

(declare-fun e!293767 () Bool)

(assert (=> b!501507 (= e!293768 e!293767)))

(declare-fun res!303143 () Bool)

(assert (=> b!501507 (=> res!303143 e!293767)))

(assert (=> b!501507 (= res!303143 (or (bvsgt (x!47280 lt!227713) #b01111111111111111111111111111110) (bvslt lt!227712 #b00000000000000000000000000000000) (bvsge lt!227712 (size!15913 a!3235)) (bvslt (index!18238 lt!227713) #b00000000000000000000000000000000) (bvsge (index!18238 lt!227713) (size!15913 a!3235)) (not (= lt!227713 (Intermediate!4012 false (index!18238 lt!227713) (x!47280 lt!227713))))))))

(assert (=> b!501507 (= (index!18238 lt!227713) i!1204)))

(declare-fun lt!227715 () Unit!15118)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32336 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15118)

(assert (=> b!501507 (= lt!227715 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227712 #b00000000000000000000000000000000 (index!18238 lt!227713) (x!47280 lt!227713) mask!3524))))

(assert (=> b!501507 (and (or (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227717 () Unit!15118)

(assert (=> b!501507 (= lt!227717 e!293771)))

(declare-fun c!59460 () Bool)

(assert (=> b!501507 (= c!59460 (= (select (arr!15548 a!3235) (index!18238 lt!227713)) (select (arr!15548 a!3235) j!176)))))

(assert (=> b!501507 (and (bvslt (x!47280 lt!227713) #b01111111111111111111111111111110) (or (= (select (arr!15548 a!3235) (index!18238 lt!227713)) (select (arr!15548 a!3235) j!176)) (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15548 a!3235) (index!18238 lt!227713)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501508 () Bool)

(declare-fun res!303139 () Bool)

(assert (=> b!501508 (=> res!303139 e!293767)))

(assert (=> b!501508 (= res!303139 e!293764)))

(declare-fun res!303149 () Bool)

(assert (=> b!501508 (=> (not res!303149) (not e!293764))))

(assert (=> b!501508 (= res!303149 (bvsgt #b00000000000000000000000000000000 (x!47280 lt!227713)))))

(declare-fun b!501509 () Bool)

(assert (=> b!501509 (= e!293772 (not e!293768))))

(declare-fun res!303147 () Bool)

(assert (=> b!501509 (=> res!303147 e!293768)))

(declare-fun lt!227709 () (_ BitVec 32))

(assert (=> b!501509 (= res!303147 (= lt!227713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227709 lt!227714 lt!227711 mask!3524)))))

(assert (=> b!501509 (= lt!227713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227712 (select (arr!15548 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501509 (= lt!227709 (toIndex!0 lt!227714 mask!3524))))

(assert (=> b!501509 (= lt!227714 (select (store (arr!15548 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501509 (= lt!227712 (toIndex!0 (select (arr!15548 a!3235) j!176) mask!3524))))

(assert (=> b!501509 (= lt!227711 (array!32337 (store (arr!15548 a!3235) i!1204 k0!2280) (size!15913 a!3235)))))

(assert (=> b!501509 e!293769))

(declare-fun res!303135 () Bool)

(assert (=> b!501509 (=> (not res!303135) (not e!293769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32336 (_ BitVec 32)) Bool)

(assert (=> b!501509 (= res!303135 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227718 () Unit!15118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15118)

(assert (=> b!501509 (= lt!227718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501510 () Bool)

(declare-fun res!303142 () Bool)

(assert (=> b!501510 (=> (not res!303142) (not e!293770))))

(declare-fun arrayContainsKey!0 (array!32336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501510 (= res!303142 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501511 () Bool)

(assert (=> b!501511 (= e!293767 true)))

(declare-fun lt!227710 () SeekEntryResult!4012)

(assert (=> b!501511 (= lt!227710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227712 lt!227714 lt!227711 mask!3524))))

(declare-fun b!501512 () Bool)

(declare-fun res!303146 () Bool)

(assert (=> b!501512 (=> (not res!303146) (not e!293770))))

(assert (=> b!501512 (= res!303146 (and (= (size!15913 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15913 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15913 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501513 () Bool)

(assert (=> b!501513 (= e!293766 false)))

(declare-fun b!501514 () Bool)

(declare-fun res!303138 () Bool)

(assert (=> b!501514 (=> (not res!303138) (not e!293772))))

(assert (=> b!501514 (= res!303138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45570 res!303137) b!501512))

(assert (= (and b!501512 res!303146) b!501502))

(assert (= (and b!501502 res!303140) b!501505))

(assert (= (and b!501505 res!303136) b!501510))

(assert (= (and b!501510 res!303142) b!501504))

(assert (= (and b!501504 res!303148) b!501514))

(assert (= (and b!501514 res!303138) b!501503))

(assert (= (and b!501503 res!303145) b!501509))

(assert (= (and b!501509 res!303135) b!501500))

(assert (= (and b!501509 (not res!303147)) b!501506))

(assert (= (and b!501506 (not res!303144)) b!501507))

(assert (= (and b!501507 c!59460) b!501501))

(assert (= (and b!501507 (not c!59460)) b!501498))

(assert (= (and b!501501 res!303141) b!501513))

(assert (= (and b!501507 (not res!303143)) b!501508))

(assert (= (and b!501508 res!303149) b!501499))

(assert (= (and b!501508 (not res!303139)) b!501511))

(declare-fun m!482017 () Bool)

(assert (=> b!501505 m!482017))

(declare-fun m!482019 () Bool)

(assert (=> start!45570 m!482019))

(declare-fun m!482021 () Bool)

(assert (=> start!45570 m!482021))

(declare-fun m!482023 () Bool)

(assert (=> b!501500 m!482023))

(assert (=> b!501500 m!482023))

(declare-fun m!482025 () Bool)

(assert (=> b!501500 m!482025))

(declare-fun m!482027 () Bool)

(assert (=> b!501514 m!482027))

(declare-fun m!482029 () Bool)

(assert (=> b!501501 m!482029))

(declare-fun m!482031 () Bool)

(assert (=> b!501501 m!482031))

(declare-fun m!482033 () Bool)

(assert (=> b!501510 m!482033))

(assert (=> b!501502 m!482023))

(assert (=> b!501502 m!482023))

(declare-fun m!482035 () Bool)

(assert (=> b!501502 m!482035))

(declare-fun m!482037 () Bool)

(assert (=> b!501507 m!482037))

(declare-fun m!482039 () Bool)

(assert (=> b!501507 m!482039))

(assert (=> b!501507 m!482023))

(declare-fun m!482041 () Bool)

(assert (=> b!501504 m!482041))

(assert (=> b!501511 m!482031))

(declare-fun m!482043 () Bool)

(assert (=> b!501503 m!482043))

(assert (=> b!501499 m!482023))

(assert (=> b!501499 m!482023))

(declare-fun m!482045 () Bool)

(assert (=> b!501499 m!482045))

(declare-fun m!482047 () Bool)

(assert (=> b!501509 m!482047))

(declare-fun m!482049 () Bool)

(assert (=> b!501509 m!482049))

(declare-fun m!482051 () Bool)

(assert (=> b!501509 m!482051))

(assert (=> b!501509 m!482023))

(declare-fun m!482053 () Bool)

(assert (=> b!501509 m!482053))

(declare-fun m!482055 () Bool)

(assert (=> b!501509 m!482055))

(assert (=> b!501509 m!482023))

(declare-fun m!482057 () Bool)

(assert (=> b!501509 m!482057))

(declare-fun m!482059 () Bool)

(assert (=> b!501509 m!482059))

(assert (=> b!501509 m!482023))

(declare-fun m!482061 () Bool)

(assert (=> b!501509 m!482061))

(check-sat (not b!501503) (not b!501500) (not b!501511) (not b!501505) (not b!501514) (not b!501510) (not b!501499) (not b!501504) (not b!501502) (not b!501509) (not b!501507) (not b!501501) (not start!45570))
(check-sat)
