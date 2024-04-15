; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45396 () Bool)

(assert start!45396)

(declare-fun b!498872 () Bool)

(declare-fun res!301016 () Bool)

(declare-fun e!292337 () Bool)

(assert (=> b!498872 (=> (not res!301016) (not e!292337))))

(declare-datatypes ((array!32231 0))(
  ( (array!32232 (arr!15497 (Array (_ BitVec 32) (_ BitVec 64))) (size!15862 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32231)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498872 (= res!301016 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!301025 () Bool)

(assert (=> start!45396 (=> (not res!301025) (not e!292337))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45396 (= res!301025 (validMask!0 mask!3524))))

(assert (=> start!45396 e!292337))

(assert (=> start!45396 true))

(declare-fun array_inv!11380 (array!32231) Bool)

(assert (=> start!45396 (array_inv!11380 a!3235)))

(declare-fun b!498873 () Bool)

(declare-fun res!301027 () Bool)

(assert (=> b!498873 (=> (not res!301027) (not e!292337))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498873 (= res!301027 (validKeyInArray!0 (select (arr!15497 a!3235) j!176)))))

(declare-fun b!498874 () Bool)

(declare-fun res!301019 () Bool)

(declare-fun e!292342 () Bool)

(assert (=> b!498874 (=> (not res!301019) (not e!292342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32231 (_ BitVec 32)) Bool)

(assert (=> b!498874 (= res!301019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498875 () Bool)

(declare-fun res!301020 () Bool)

(declare-fun e!292339 () Bool)

(assert (=> b!498875 (=> res!301020 e!292339)))

(declare-datatypes ((SeekEntryResult!3961 0))(
  ( (MissingZero!3961 (index!18026 (_ BitVec 32))) (Found!3961 (index!18027 (_ BitVec 32))) (Intermediate!3961 (undefined!4773 Bool) (index!18028 (_ BitVec 32)) (x!47081 (_ BitVec 32))) (Undefined!3961) (MissingVacant!3961 (index!18029 (_ BitVec 32))) )
))
(declare-fun lt!226020 () SeekEntryResult!3961)

(get-info :version)

(assert (=> b!498875 (= res!301020 (or (undefined!4773 lt!226020) (not ((_ is Intermediate!3961) lt!226020))))))

(declare-fun b!498876 () Bool)

(declare-datatypes ((Unit!14914 0))(
  ( (Unit!14915) )
))
(declare-fun e!292341 () Unit!14914)

(declare-fun Unit!14916 () Unit!14914)

(assert (=> b!498876 (= e!292341 Unit!14916)))

(declare-fun lt!226021 () Unit!14914)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226019 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14914)

(assert (=> b!498876 (= lt!226021 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226019 #b00000000000000000000000000000000 (index!18028 lt!226020) (x!47081 lt!226020) mask!3524))))

(declare-fun res!301018 () Bool)

(declare-fun lt!226024 () array!32231)

(declare-fun lt!226017 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32231 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!498876 (= res!301018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226019 lt!226017 lt!226024 mask!3524) (Intermediate!3961 false (index!18028 lt!226020) (x!47081 lt!226020))))))

(declare-fun e!292344 () Bool)

(assert (=> b!498876 (=> (not res!301018) (not e!292344))))

(assert (=> b!498876 e!292344))

(declare-fun b!498877 () Bool)

(assert (=> b!498877 (= e!292344 false)))

(declare-fun b!498878 () Bool)

(declare-fun res!301024 () Bool)

(assert (=> b!498878 (=> (not res!301024) (not e!292337))))

(assert (=> b!498878 (= res!301024 (and (= (size!15862 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15862 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15862 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498879 () Bool)

(assert (=> b!498879 (= e!292337 e!292342)))

(declare-fun res!301026 () Bool)

(assert (=> b!498879 (=> (not res!301026) (not e!292342))))

(declare-fun lt!226016 () SeekEntryResult!3961)

(assert (=> b!498879 (= res!301026 (or (= lt!226016 (MissingZero!3961 i!1204)) (= lt!226016 (MissingVacant!3961 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32231 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!498879 (= lt!226016 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498880 () Bool)

(declare-fun res!301023 () Bool)

(assert (=> b!498880 (=> (not res!301023) (not e!292342))))

(declare-datatypes ((List!9694 0))(
  ( (Nil!9691) (Cons!9690 (h!10564 (_ BitVec 64)) (t!15913 List!9694)) )
))
(declare-fun arrayNoDuplicates!0 (array!32231 (_ BitVec 32) List!9694) Bool)

(assert (=> b!498880 (= res!301023 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9691))))

(declare-fun b!498881 () Bool)

(declare-fun e!292338 () Bool)

(assert (=> b!498881 (= e!292338 true)))

(declare-fun lt!226018 () SeekEntryResult!3961)

(assert (=> b!498881 (= lt!226018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226019 lt!226017 lt!226024 mask!3524))))

(declare-fun b!498882 () Bool)

(declare-fun Unit!14917 () Unit!14914)

(assert (=> b!498882 (= e!292341 Unit!14917)))

(declare-fun b!498883 () Bool)

(declare-fun res!301021 () Bool)

(assert (=> b!498883 (=> (not res!301021) (not e!292337))))

(assert (=> b!498883 (= res!301021 (validKeyInArray!0 k0!2280))))

(declare-fun b!498884 () Bool)

(assert (=> b!498884 (= e!292339 e!292338)))

(declare-fun res!301022 () Bool)

(assert (=> b!498884 (=> res!301022 e!292338)))

(assert (=> b!498884 (= res!301022 (or (bvsgt #b00000000000000000000000000000000 (x!47081 lt!226020)) (bvsgt (x!47081 lt!226020) #b01111111111111111111111111111110) (bvslt lt!226019 #b00000000000000000000000000000000) (bvsge lt!226019 (size!15862 a!3235)) (bvslt (index!18028 lt!226020) #b00000000000000000000000000000000) (bvsge (index!18028 lt!226020) (size!15862 a!3235)) (not (= lt!226020 (Intermediate!3961 false (index!18028 lt!226020) (x!47081 lt!226020))))))))

(assert (=> b!498884 (and (or (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226015 () Unit!14914)

(assert (=> b!498884 (= lt!226015 e!292341)))

(declare-fun c!59205 () Bool)

(assert (=> b!498884 (= c!59205 (= (select (arr!15497 a!3235) (index!18028 lt!226020)) (select (arr!15497 a!3235) j!176)))))

(assert (=> b!498884 (and (bvslt (x!47081 lt!226020) #b01111111111111111111111111111110) (or (= (select (arr!15497 a!3235) (index!18028 lt!226020)) (select (arr!15497 a!3235) j!176)) (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15497 a!3235) (index!18028 lt!226020)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!292343 () Bool)

(declare-fun b!498885 () Bool)

(assert (=> b!498885 (= e!292343 (= (seekEntryOrOpen!0 (select (arr!15497 a!3235) j!176) a!3235 mask!3524) (Found!3961 j!176)))))

(declare-fun b!498886 () Bool)

(assert (=> b!498886 (= e!292342 (not e!292339))))

(declare-fun res!301028 () Bool)

(assert (=> b!498886 (=> res!301028 e!292339)))

(declare-fun lt!226022 () (_ BitVec 32))

(assert (=> b!498886 (= res!301028 (= lt!226020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226022 lt!226017 lt!226024 mask!3524)))))

(assert (=> b!498886 (= lt!226020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226019 (select (arr!15497 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498886 (= lt!226022 (toIndex!0 lt!226017 mask!3524))))

(assert (=> b!498886 (= lt!226017 (select (store (arr!15497 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498886 (= lt!226019 (toIndex!0 (select (arr!15497 a!3235) j!176) mask!3524))))

(assert (=> b!498886 (= lt!226024 (array!32232 (store (arr!15497 a!3235) i!1204 k0!2280) (size!15862 a!3235)))))

(assert (=> b!498886 e!292343))

(declare-fun res!301017 () Bool)

(assert (=> b!498886 (=> (not res!301017) (not e!292343))))

(assert (=> b!498886 (= res!301017 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226023 () Unit!14914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14914)

(assert (=> b!498886 (= lt!226023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45396 res!301025) b!498878))

(assert (= (and b!498878 res!301024) b!498873))

(assert (= (and b!498873 res!301027) b!498883))

(assert (= (and b!498883 res!301021) b!498872))

(assert (= (and b!498872 res!301016) b!498879))

(assert (= (and b!498879 res!301026) b!498874))

(assert (= (and b!498874 res!301019) b!498880))

(assert (= (and b!498880 res!301023) b!498886))

(assert (= (and b!498886 res!301017) b!498885))

(assert (= (and b!498886 (not res!301028)) b!498875))

(assert (= (and b!498875 (not res!301020)) b!498884))

(assert (= (and b!498884 c!59205) b!498876))

(assert (= (and b!498884 (not c!59205)) b!498882))

(assert (= (and b!498876 res!301018) b!498877))

(assert (= (and b!498884 (not res!301022)) b!498881))

(declare-fun m!479611 () Bool)

(assert (=> b!498879 m!479611))

(declare-fun m!479613 () Bool)

(assert (=> b!498874 m!479613))

(declare-fun m!479615 () Bool)

(assert (=> b!498884 m!479615))

(declare-fun m!479617 () Bool)

(assert (=> b!498884 m!479617))

(declare-fun m!479619 () Bool)

(assert (=> b!498872 m!479619))

(declare-fun m!479621 () Bool)

(assert (=> b!498886 m!479621))

(declare-fun m!479623 () Bool)

(assert (=> b!498886 m!479623))

(declare-fun m!479625 () Bool)

(assert (=> b!498886 m!479625))

(declare-fun m!479627 () Bool)

(assert (=> b!498886 m!479627))

(assert (=> b!498886 m!479617))

(declare-fun m!479629 () Bool)

(assert (=> b!498886 m!479629))

(assert (=> b!498886 m!479617))

(declare-fun m!479631 () Bool)

(assert (=> b!498886 m!479631))

(assert (=> b!498886 m!479617))

(declare-fun m!479633 () Bool)

(assert (=> b!498886 m!479633))

(declare-fun m!479635 () Bool)

(assert (=> b!498886 m!479635))

(declare-fun m!479637 () Bool)

(assert (=> b!498881 m!479637))

(assert (=> b!498885 m!479617))

(assert (=> b!498885 m!479617))

(declare-fun m!479639 () Bool)

(assert (=> b!498885 m!479639))

(declare-fun m!479641 () Bool)

(assert (=> b!498876 m!479641))

(assert (=> b!498876 m!479637))

(declare-fun m!479643 () Bool)

(assert (=> start!45396 m!479643))

(declare-fun m!479645 () Bool)

(assert (=> start!45396 m!479645))

(declare-fun m!479647 () Bool)

(assert (=> b!498883 m!479647))

(declare-fun m!479649 () Bool)

(assert (=> b!498880 m!479649))

(assert (=> b!498873 m!479617))

(assert (=> b!498873 m!479617))

(declare-fun m!479651 () Bool)

(assert (=> b!498873 m!479651))

(check-sat (not b!498872) (not b!498880) (not b!498879) (not b!498881) (not start!45396) (not b!498883) (not b!498874) (not b!498876) (not b!498873) (not b!498886) (not b!498885))
(check-sat)
