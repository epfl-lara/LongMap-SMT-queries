; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49760 () Bool)

(assert start!49760)

(declare-fun res!340576 () Bool)

(declare-fun e!315899 () Bool)

(assert (=> start!49760 (=> (not res!340576) (not e!315899))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49760 (= res!340576 (validMask!0 mask!3119))))

(assert (=> start!49760 e!315899))

(assert (=> start!49760 true))

(declare-datatypes ((array!34507 0))(
  ( (array!34508 (arr!16580 (Array (_ BitVec 32) (_ BitVec 64))) (size!16945 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34507)

(declare-fun array_inv!12463 (array!34507) Bool)

(assert (=> start!49760 (array_inv!12463 a!3118)))

(declare-fun b!546715 () Bool)

(declare-fun res!340572 () Bool)

(assert (=> b!546715 (=> (not res!340572) (not e!315899))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546715 (= res!340572 (and (= (size!16945 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16945 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16945 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546716 () Bool)

(declare-fun res!340575 () Bool)

(declare-fun e!315900 () Bool)

(assert (=> b!546716 (=> (not res!340575) (not e!315900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34507 (_ BitVec 32)) Bool)

(assert (=> b!546716 (= res!340575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!546717 () Bool)

(declare-fun res!340574 () Bool)

(assert (=> b!546717 (=> (not res!340574) (not e!315899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546717 (= res!340574 (validKeyInArray!0 (select (arr!16580 a!3118) j!142)))))

(declare-fun b!546718 () Bool)

(declare-fun res!340573 () Bool)

(assert (=> b!546718 (=> (not res!340573) (not e!315899))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546718 (= res!340573 (validKeyInArray!0 k0!1914))))

(declare-fun b!546719 () Bool)

(declare-fun res!340577 () Bool)

(assert (=> b!546719 (=> (not res!340577) (not e!315899))))

(declare-fun arrayContainsKey!0 (array!34507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546719 (= res!340577 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546720 () Bool)

(assert (=> b!546720 (= e!315899 e!315900)))

(declare-fun res!340571 () Bool)

(assert (=> b!546720 (=> (not res!340571) (not e!315900))))

(declare-datatypes ((SeekEntryResult!5026 0))(
  ( (MissingZero!5026 (index!22331 (_ BitVec 32))) (Found!5026 (index!22332 (_ BitVec 32))) (Intermediate!5026 (undefined!5838 Bool) (index!22333 (_ BitVec 32)) (x!51289 (_ BitVec 32))) (Undefined!5026) (MissingVacant!5026 (index!22334 (_ BitVec 32))) )
))
(declare-fun lt!249169 () SeekEntryResult!5026)

(assert (=> b!546720 (= res!340571 (or (= lt!249169 (MissingZero!5026 i!1132)) (= lt!249169 (MissingVacant!5026 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34507 (_ BitVec 32)) SeekEntryResult!5026)

(assert (=> b!546720 (= lt!249169 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546721 () Bool)

(assert (=> b!546721 (= e!315900 (bvsgt #b00000000000000000000000000000000 (size!16945 a!3118)))))

(assert (= (and start!49760 res!340576) b!546715))

(assert (= (and b!546715 res!340572) b!546717))

(assert (= (and b!546717 res!340574) b!546718))

(assert (= (and b!546718 res!340573) b!546719))

(assert (= (and b!546719 res!340577) b!546720))

(assert (= (and b!546720 res!340571) b!546716))

(assert (= (and b!546716 res!340575) b!546721))

(declare-fun m!523609 () Bool)

(assert (=> b!546718 m!523609))

(declare-fun m!523611 () Bool)

(assert (=> b!546720 m!523611))

(declare-fun m!523613 () Bool)

(assert (=> b!546717 m!523613))

(assert (=> b!546717 m!523613))

(declare-fun m!523615 () Bool)

(assert (=> b!546717 m!523615))

(declare-fun m!523617 () Bool)

(assert (=> b!546716 m!523617))

(declare-fun m!523619 () Bool)

(assert (=> b!546719 m!523619))

(declare-fun m!523621 () Bool)

(assert (=> start!49760 m!523621))

(declare-fun m!523623 () Bool)

(assert (=> start!49760 m!523623))

(check-sat (not b!546716) (not b!546720) (not b!546718) (not b!546717) (not start!49760) (not b!546719))
(check-sat)
