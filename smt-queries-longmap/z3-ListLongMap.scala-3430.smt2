; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47702 () Bool)

(assert start!47702)

(declare-fun b!524533 () Bool)

(declare-fun e!305907 () Bool)

(declare-fun e!305901 () Bool)

(assert (=> b!524533 (= e!305907 (not e!305901))))

(declare-fun res!321435 () Bool)

(assert (=> b!524533 (=> res!321435 e!305901)))

(declare-datatypes ((SeekEntryResult!4488 0))(
  ( (MissingZero!4488 (index!20164 (_ BitVec 32))) (Found!4488 (index!20165 (_ BitVec 32))) (Intermediate!4488 (undefined!5300 Bool) (index!20166 (_ BitVec 32)) (x!49149 (_ BitVec 32))) (Undefined!4488) (MissingVacant!4488 (index!20167 (_ BitVec 32))) )
))
(declare-fun lt!240751 () SeekEntryResult!4488)

(declare-fun lt!240752 () (_ BitVec 32))

(declare-fun lt!240757 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33339 0))(
  ( (array!33340 (arr!16021 (Array (_ BitVec 32) (_ BitVec 64))) (size!16385 (_ BitVec 32))) )
))
(declare-fun lt!240754 () array!33339)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33339 (_ BitVec 32)) SeekEntryResult!4488)

(assert (=> b!524533 (= res!321435 (= lt!240751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240752 lt!240757 lt!240754 mask!3524)))))

(declare-fun a!3235 () array!33339)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240756 () (_ BitVec 32))

(assert (=> b!524533 (= lt!240751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240756 (select (arr!16021 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524533 (= lt!240752 (toIndex!0 lt!240757 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524533 (= lt!240757 (select (store (arr!16021 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524533 (= lt!240756 (toIndex!0 (select (arr!16021 a!3235) j!176) mask!3524))))

(assert (=> b!524533 (= lt!240754 (array!33340 (store (arr!16021 a!3235) i!1204 k0!2280) (size!16385 a!3235)))))

(declare-fun e!305906 () Bool)

(assert (=> b!524533 e!305906))

(declare-fun res!321429 () Bool)

(assert (=> b!524533 (=> (not res!321429) (not e!305906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33339 (_ BitVec 32)) Bool)

(assert (=> b!524533 (= res!321429 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16404 0))(
  ( (Unit!16405) )
))
(declare-fun lt!240749 () Unit!16404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16404)

(assert (=> b!524533 (= lt!240749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524534 () Bool)

(declare-fun res!321430 () Bool)

(assert (=> b!524534 (=> (not res!321430) (not e!305907))))

(assert (=> b!524534 (= res!321430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524535 () Bool)

(declare-fun res!321426 () Bool)

(assert (=> b!524535 (=> res!321426 e!305901)))

(get-info :version)

(assert (=> b!524535 (= res!321426 (or (undefined!5300 lt!240751) (not ((_ is Intermediate!4488) lt!240751))))))

(declare-fun res!321434 () Bool)

(declare-fun e!305902 () Bool)

(assert (=> start!47702 (=> (not res!321434) (not e!305902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47702 (= res!321434 (validMask!0 mask!3524))))

(assert (=> start!47702 e!305902))

(assert (=> start!47702 true))

(declare-fun array_inv!11817 (array!33339) Bool)

(assert (=> start!47702 (array_inv!11817 a!3235)))

(declare-fun b!524536 () Bool)

(declare-fun e!305905 () Unit!16404)

(declare-fun Unit!16406 () Unit!16404)

(assert (=> b!524536 (= e!305905 Unit!16406)))

(declare-fun lt!240750 () Unit!16404)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16404)

(assert (=> b!524536 (= lt!240750 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240756 #b00000000000000000000000000000000 (index!20166 lt!240751) (x!49149 lt!240751) mask!3524))))

(declare-fun res!321436 () Bool)

(assert (=> b!524536 (= res!321436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240756 lt!240757 lt!240754 mask!3524) (Intermediate!4488 false (index!20166 lt!240751) (x!49149 lt!240751))))))

(declare-fun e!305904 () Bool)

(assert (=> b!524536 (=> (not res!321436) (not e!305904))))

(assert (=> b!524536 e!305904))

(declare-fun b!524537 () Bool)

(declare-fun res!321433 () Bool)

(assert (=> b!524537 (=> (not res!321433) (not e!305902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524537 (= res!321433 (validKeyInArray!0 k0!2280))))

(declare-fun b!524538 () Bool)

(declare-fun res!321428 () Bool)

(assert (=> b!524538 (=> (not res!321428) (not e!305902))))

(declare-fun arrayContainsKey!0 (array!33339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524538 (= res!321428 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524539 () Bool)

(assert (=> b!524539 (= e!305904 false)))

(declare-fun b!524540 () Bool)

(declare-fun res!321432 () Bool)

(assert (=> b!524540 (=> (not res!321432) (not e!305907))))

(declare-datatypes ((List!10179 0))(
  ( (Nil!10176) (Cons!10175 (h!11106 (_ BitVec 64)) (t!16407 List!10179)) )
))
(declare-fun arrayNoDuplicates!0 (array!33339 (_ BitVec 32) List!10179) Bool)

(assert (=> b!524540 (= res!321432 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10176))))

(declare-fun b!524541 () Bool)

(declare-fun Unit!16407 () Unit!16404)

(assert (=> b!524541 (= e!305905 Unit!16407)))

(declare-fun b!524542 () Bool)

(declare-fun res!321427 () Bool)

(assert (=> b!524542 (=> (not res!321427) (not e!305902))))

(assert (=> b!524542 (= res!321427 (and (= (size!16385 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16385 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16385 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524543 () Bool)

(assert (=> b!524543 (= e!305902 e!305907)))

(declare-fun res!321437 () Bool)

(assert (=> b!524543 (=> (not res!321437) (not e!305907))))

(declare-fun lt!240753 () SeekEntryResult!4488)

(assert (=> b!524543 (= res!321437 (or (= lt!240753 (MissingZero!4488 i!1204)) (= lt!240753 (MissingVacant!4488 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33339 (_ BitVec 32)) SeekEntryResult!4488)

(assert (=> b!524543 (= lt!240753 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524544 () Bool)

(assert (=> b!524544 (= e!305906 (= (seekEntryOrOpen!0 (select (arr!16021 a!3235) j!176) a!3235 mask!3524) (Found!4488 j!176)))))

(declare-fun b!524545 () Bool)

(declare-fun res!321431 () Bool)

(assert (=> b!524545 (=> (not res!321431) (not e!305902))))

(assert (=> b!524545 (= res!321431 (validKeyInArray!0 (select (arr!16021 a!3235) j!176)))))

(declare-fun b!524546 () Bool)

(assert (=> b!524546 (= e!305901 true)))

(assert (=> b!524546 (and (or (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240755 () Unit!16404)

(assert (=> b!524546 (= lt!240755 e!305905)))

(declare-fun c!61859 () Bool)

(assert (=> b!524546 (= c!61859 (= (select (arr!16021 a!3235) (index!20166 lt!240751)) (select (arr!16021 a!3235) j!176)))))

(assert (=> b!524546 (and (bvslt (x!49149 lt!240751) #b01111111111111111111111111111110) (or (= (select (arr!16021 a!3235) (index!20166 lt!240751)) (select (arr!16021 a!3235) j!176)) (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16021 a!3235) (index!20166 lt!240751)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47702 res!321434) b!524542))

(assert (= (and b!524542 res!321427) b!524545))

(assert (= (and b!524545 res!321431) b!524537))

(assert (= (and b!524537 res!321433) b!524538))

(assert (= (and b!524538 res!321428) b!524543))

(assert (= (and b!524543 res!321437) b!524534))

(assert (= (and b!524534 res!321430) b!524540))

(assert (= (and b!524540 res!321432) b!524533))

(assert (= (and b!524533 res!321429) b!524544))

(assert (= (and b!524533 (not res!321435)) b!524535))

(assert (= (and b!524535 (not res!321426)) b!524546))

(assert (= (and b!524546 c!61859) b!524536))

(assert (= (and b!524546 (not c!61859)) b!524541))

(assert (= (and b!524536 res!321436) b!524539))

(declare-fun m!505167 () Bool)

(assert (=> start!47702 m!505167))

(declare-fun m!505169 () Bool)

(assert (=> start!47702 m!505169))

(declare-fun m!505171 () Bool)

(assert (=> b!524544 m!505171))

(assert (=> b!524544 m!505171))

(declare-fun m!505173 () Bool)

(assert (=> b!524544 m!505173))

(declare-fun m!505175 () Bool)

(assert (=> b!524538 m!505175))

(declare-fun m!505177 () Bool)

(assert (=> b!524536 m!505177))

(declare-fun m!505179 () Bool)

(assert (=> b!524536 m!505179))

(assert (=> b!524545 m!505171))

(assert (=> b!524545 m!505171))

(declare-fun m!505181 () Bool)

(assert (=> b!524545 m!505181))

(declare-fun m!505183 () Bool)

(assert (=> b!524540 m!505183))

(declare-fun m!505185 () Bool)

(assert (=> b!524546 m!505185))

(assert (=> b!524546 m!505171))

(declare-fun m!505187 () Bool)

(assert (=> b!524533 m!505187))

(declare-fun m!505189 () Bool)

(assert (=> b!524533 m!505189))

(declare-fun m!505191 () Bool)

(assert (=> b!524533 m!505191))

(declare-fun m!505193 () Bool)

(assert (=> b!524533 m!505193))

(assert (=> b!524533 m!505171))

(declare-fun m!505195 () Bool)

(assert (=> b!524533 m!505195))

(assert (=> b!524533 m!505171))

(declare-fun m!505197 () Bool)

(assert (=> b!524533 m!505197))

(declare-fun m!505199 () Bool)

(assert (=> b!524533 m!505199))

(assert (=> b!524533 m!505171))

(declare-fun m!505201 () Bool)

(assert (=> b!524533 m!505201))

(declare-fun m!505203 () Bool)

(assert (=> b!524534 m!505203))

(declare-fun m!505205 () Bool)

(assert (=> b!524537 m!505205))

(declare-fun m!505207 () Bool)

(assert (=> b!524543 m!505207))

(check-sat (not b!524536) (not b!524545) (not b!524533) (not b!524540) (not b!524537) (not b!524534) (not start!47702) (not b!524543) (not b!524538) (not b!524544))
(check-sat)
