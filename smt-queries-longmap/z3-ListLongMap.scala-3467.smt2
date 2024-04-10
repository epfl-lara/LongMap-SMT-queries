; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48134 () Bool)

(assert start!48134)

(declare-fun b!530170 () Bool)

(declare-fun res!325881 () Bool)

(declare-fun e!308914 () Bool)

(assert (=> b!530170 (=> (not res!325881) (not e!308914))))

(declare-datatypes ((array!33570 0))(
  ( (array!33571 (arr!16132 (Array (_ BitVec 32) (_ BitVec 64))) (size!16496 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33570)

(declare-datatypes ((List!10290 0))(
  ( (Nil!10287) (Cons!10286 (h!11226 (_ BitVec 64)) (t!16518 List!10290)) )
))
(declare-fun arrayNoDuplicates!0 (array!33570 (_ BitVec 32) List!10290) Bool)

(assert (=> b!530170 (= res!325881 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10287))))

(declare-fun b!530171 () Bool)

(declare-fun res!325880 () Bool)

(assert (=> b!530171 (=> (not res!325880) (not e!308914))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33570 (_ BitVec 32)) Bool)

(assert (=> b!530171 (= res!325880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530172 () Bool)

(declare-fun res!325884 () Bool)

(declare-fun e!308915 () Bool)

(assert (=> b!530172 (=> (not res!325884) (not e!308915))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530172 (= res!325884 (validKeyInArray!0 k0!2280))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!530173 () Bool)

(declare-fun e!308918 () Bool)

(declare-datatypes ((SeekEntryResult!4599 0))(
  ( (MissingZero!4599 (index!20620 (_ BitVec 32))) (Found!4599 (index!20621 (_ BitVec 32))) (Intermediate!4599 (undefined!5411 Bool) (index!20622 (_ BitVec 32)) (x!49589 (_ BitVec 32))) (Undefined!4599) (MissingVacant!4599 (index!20623 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33570 (_ BitVec 32)) SeekEntryResult!4599)

(assert (=> b!530173 (= e!308918 (= (seekEntryOrOpen!0 (select (arr!16132 a!3235) j!176) a!3235 mask!3524) (Found!4599 j!176)))))

(declare-fun b!530174 () Bool)

(assert (=> b!530174 (= e!308915 e!308914)))

(declare-fun res!325885 () Bool)

(assert (=> b!530174 (=> (not res!325885) (not e!308914))))

(declare-fun lt!244564 () SeekEntryResult!4599)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530174 (= res!325885 (or (= lt!244564 (MissingZero!4599 i!1204)) (= lt!244564 (MissingVacant!4599 i!1204))))))

(assert (=> b!530174 (= lt!244564 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530176 () Bool)

(declare-fun e!308917 () Bool)

(assert (=> b!530176 (= e!308914 (not e!308917))))

(declare-fun res!325876 () Bool)

(assert (=> b!530176 (=> res!325876 e!308917)))

(declare-fun lt!244560 () (_ BitVec 64))

(declare-fun lt!244561 () SeekEntryResult!4599)

(declare-fun lt!244562 () (_ BitVec 32))

(declare-fun lt!244563 () array!33570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33570 (_ BitVec 32)) SeekEntryResult!4599)

(assert (=> b!530176 (= res!325876 (= lt!244561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244562 lt!244560 lt!244563 mask!3524)))))

(declare-fun lt!244566 () (_ BitVec 32))

(assert (=> b!530176 (= lt!244561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244566 (select (arr!16132 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530176 (= lt!244562 (toIndex!0 lt!244560 mask!3524))))

(assert (=> b!530176 (= lt!244560 (select (store (arr!16132 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530176 (= lt!244566 (toIndex!0 (select (arr!16132 a!3235) j!176) mask!3524))))

(assert (=> b!530176 (= lt!244563 (array!33571 (store (arr!16132 a!3235) i!1204 k0!2280) (size!16496 a!3235)))))

(assert (=> b!530176 e!308918))

(declare-fun res!325878 () Bool)

(assert (=> b!530176 (=> (not res!325878) (not e!308918))))

(assert (=> b!530176 (= res!325878 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16810 0))(
  ( (Unit!16811) )
))
(declare-fun lt!244567 () Unit!16810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16810)

(assert (=> b!530176 (= lt!244567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530177 () Bool)

(declare-fun e!308919 () Bool)

(assert (=> b!530177 (= e!308919 true)))

(declare-fun lt!244565 () SeekEntryResult!4599)

(assert (=> b!530177 (= lt!244565 (seekEntryOrOpen!0 lt!244560 lt!244563 mask!3524))))

(assert (=> b!530177 false))

(declare-fun b!530178 () Bool)

(declare-fun res!325877 () Bool)

(assert (=> b!530178 (=> (not res!325877) (not e!308915))))

(assert (=> b!530178 (= res!325877 (and (= (size!16496 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16496 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16496 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530179 () Bool)

(assert (=> b!530179 (= e!308917 e!308919)))

(declare-fun res!325879 () Bool)

(assert (=> b!530179 (=> res!325879 e!308919)))

(declare-fun lt!244559 () Bool)

(assert (=> b!530179 (= res!325879 (or (and (not lt!244559) (undefined!5411 lt!244561)) (and (not lt!244559) (not (undefined!5411 lt!244561)))))))

(get-info :version)

(assert (=> b!530179 (= lt!244559 (not ((_ is Intermediate!4599) lt!244561)))))

(declare-fun b!530180 () Bool)

(declare-fun res!325882 () Bool)

(assert (=> b!530180 (=> (not res!325882) (not e!308915))))

(declare-fun arrayContainsKey!0 (array!33570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530180 (= res!325882 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!325883 () Bool)

(assert (=> start!48134 (=> (not res!325883) (not e!308915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48134 (= res!325883 (validMask!0 mask!3524))))

(assert (=> start!48134 e!308915))

(assert (=> start!48134 true))

(declare-fun array_inv!11928 (array!33570) Bool)

(assert (=> start!48134 (array_inv!11928 a!3235)))

(declare-fun b!530175 () Bool)

(declare-fun res!325886 () Bool)

(assert (=> b!530175 (=> (not res!325886) (not e!308915))))

(assert (=> b!530175 (= res!325886 (validKeyInArray!0 (select (arr!16132 a!3235) j!176)))))

(assert (= (and start!48134 res!325883) b!530178))

(assert (= (and b!530178 res!325877) b!530175))

(assert (= (and b!530175 res!325886) b!530172))

(assert (= (and b!530172 res!325884) b!530180))

(assert (= (and b!530180 res!325882) b!530174))

(assert (= (and b!530174 res!325885) b!530171))

(assert (= (and b!530171 res!325880) b!530170))

(assert (= (and b!530170 res!325881) b!530176))

(assert (= (and b!530176 res!325878) b!530173))

(assert (= (and b!530176 (not res!325876)) b!530179))

(assert (= (and b!530179 (not res!325879)) b!530177))

(declare-fun m!510713 () Bool)

(assert (=> b!530172 m!510713))

(declare-fun m!510715 () Bool)

(assert (=> start!48134 m!510715))

(declare-fun m!510717 () Bool)

(assert (=> start!48134 m!510717))

(declare-fun m!510719 () Bool)

(assert (=> b!530176 m!510719))

(declare-fun m!510721 () Bool)

(assert (=> b!530176 m!510721))

(declare-fun m!510723 () Bool)

(assert (=> b!530176 m!510723))

(declare-fun m!510725 () Bool)

(assert (=> b!530176 m!510725))

(declare-fun m!510727 () Bool)

(assert (=> b!530176 m!510727))

(assert (=> b!530176 m!510723))

(declare-fun m!510729 () Bool)

(assert (=> b!530176 m!510729))

(declare-fun m!510731 () Bool)

(assert (=> b!530176 m!510731))

(assert (=> b!530176 m!510723))

(declare-fun m!510733 () Bool)

(assert (=> b!530176 m!510733))

(declare-fun m!510735 () Bool)

(assert (=> b!530176 m!510735))

(assert (=> b!530175 m!510723))

(assert (=> b!530175 m!510723))

(declare-fun m!510737 () Bool)

(assert (=> b!530175 m!510737))

(declare-fun m!510739 () Bool)

(assert (=> b!530177 m!510739))

(declare-fun m!510741 () Bool)

(assert (=> b!530170 m!510741))

(declare-fun m!510743 () Bool)

(assert (=> b!530174 m!510743))

(assert (=> b!530173 m!510723))

(assert (=> b!530173 m!510723))

(declare-fun m!510745 () Bool)

(assert (=> b!530173 m!510745))

(declare-fun m!510747 () Bool)

(assert (=> b!530180 m!510747))

(declare-fun m!510749 () Bool)

(assert (=> b!530171 m!510749))

(check-sat (not b!530175) (not b!530170) (not b!530174) (not b!530180) (not start!48134) (not b!530171) (not b!530173) (not b!530172) (not b!530177) (not b!530176))
(check-sat)
