; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49762 () Bool)

(assert start!49762)

(declare-fun b!546907 () Bool)

(declare-fun e!316041 () Bool)

(assert (=> b!546907 (= e!316041 false)))

(declare-datatypes ((SeekEntryResult!5025 0))(
  ( (MissingZero!5025 (index!22327 (_ BitVec 32))) (Found!5025 (index!22328 (_ BitVec 32))) (Intermediate!5025 (undefined!5837 Bool) (index!22329 (_ BitVec 32)) (x!51277 (_ BitVec 32))) (Undefined!5025) (MissingVacant!5025 (index!22330 (_ BitVec 32))) )
))
(declare-fun lt!249388 () SeekEntryResult!5025)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34500 0))(
  ( (array!34501 (arr!16576 (Array (_ BitVec 32) (_ BitVec 64))) (size!16940 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34500)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34500 (_ BitVec 32)) SeekEntryResult!5025)

(assert (=> b!546907 (= lt!249388 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546908 () Bool)

(declare-fun res!340623 () Bool)

(assert (=> b!546908 (=> (not res!340623) (not e!316041))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546908 (= res!340623 (validKeyInArray!0 (select (arr!16576 a!3118) j!142)))))

(declare-fun res!340625 () Bool)

(assert (=> start!49762 (=> (not res!340625) (not e!316041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49762 (= res!340625 (validMask!0 mask!3119))))

(assert (=> start!49762 e!316041))

(assert (=> start!49762 true))

(declare-fun array_inv!12372 (array!34500) Bool)

(assert (=> start!49762 (array_inv!12372 a!3118)))

(declare-fun b!546909 () Bool)

(declare-fun res!340622 () Bool)

(assert (=> b!546909 (=> (not res!340622) (not e!316041))))

(assert (=> b!546909 (= res!340622 (validKeyInArray!0 k0!1914))))

(declare-fun b!546910 () Bool)

(declare-fun res!340621 () Bool)

(assert (=> b!546910 (=> (not res!340621) (not e!316041))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546910 (= res!340621 (and (= (size!16940 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16940 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16940 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546911 () Bool)

(declare-fun res!340624 () Bool)

(assert (=> b!546911 (=> (not res!340624) (not e!316041))))

(declare-fun arrayContainsKey!0 (array!34500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546911 (= res!340624 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49762 res!340625) b!546910))

(assert (= (and b!546910 res!340621) b!546908))

(assert (= (and b!546908 res!340623) b!546909))

(assert (= (and b!546909 res!340622) b!546911))

(assert (= (and b!546911 res!340624) b!546907))

(declare-fun m!524291 () Bool)

(assert (=> b!546911 m!524291))

(declare-fun m!524293 () Bool)

(assert (=> b!546909 m!524293))

(declare-fun m!524295 () Bool)

(assert (=> b!546908 m!524295))

(assert (=> b!546908 m!524295))

(declare-fun m!524297 () Bool)

(assert (=> b!546908 m!524297))

(declare-fun m!524299 () Bool)

(assert (=> b!546907 m!524299))

(declare-fun m!524301 () Bool)

(assert (=> start!49762 m!524301))

(declare-fun m!524303 () Bool)

(assert (=> start!49762 m!524303))

(check-sat (not b!546908) (not start!49762) (not b!546911) (not b!546907) (not b!546909))
