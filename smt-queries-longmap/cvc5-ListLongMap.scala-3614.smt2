; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49806 () Bool)

(assert start!49806)

(declare-fun b!547077 () Bool)

(declare-fun res!340689 () Bool)

(declare-fun e!316157 () Bool)

(assert (=> b!547077 (=> (not res!340689) (not e!316157))))

(declare-datatypes ((array!34490 0))(
  ( (array!34491 (arr!16569 (Array (_ BitVec 32) (_ BitVec 64))) (size!16933 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34490)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547077 (= res!340689 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340687 () Bool)

(assert (=> start!49806 (=> (not res!340687) (not e!316157))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49806 (= res!340687 (validMask!0 mask!3119))))

(assert (=> start!49806 e!316157))

(assert (=> start!49806 true))

(declare-fun array_inv!12428 (array!34490) Bool)

(assert (=> start!49806 (array_inv!12428 a!3118)))

(declare-fun b!547078 () Bool)

(declare-fun res!340688 () Bool)

(assert (=> b!547078 (=> (not res!340688) (not e!316157))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547078 (= res!340688 (and (= (size!16933 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16933 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16933 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547079 () Bool)

(declare-fun res!340690 () Bool)

(assert (=> b!547079 (=> (not res!340690) (not e!316157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547079 (= res!340690 (validKeyInArray!0 (select (arr!16569 a!3118) j!142)))))

(declare-fun b!547080 () Bool)

(declare-fun res!340686 () Bool)

(assert (=> b!547080 (=> (not res!340686) (not e!316157))))

(assert (=> b!547080 (= res!340686 (validKeyInArray!0 k!1914))))

(declare-fun b!547081 () Bool)

(assert (=> b!547081 (= e!316157 false)))

(declare-datatypes ((SeekEntryResult!4974 0))(
  ( (MissingZero!4974 (index!22123 (_ BitVec 32))) (Found!4974 (index!22124 (_ BitVec 32))) (Intermediate!4974 (undefined!5786 Bool) (index!22125 (_ BitVec 32)) (x!51221 (_ BitVec 32))) (Undefined!4974) (MissingVacant!4974 (index!22126 (_ BitVec 32))) )
))
(declare-fun lt!249493 () SeekEntryResult!4974)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34490 (_ BitVec 32)) SeekEntryResult!4974)

(assert (=> b!547081 (= lt!249493 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49806 res!340687) b!547078))

(assert (= (and b!547078 res!340688) b!547079))

(assert (= (and b!547079 res!340690) b!547080))

(assert (= (and b!547080 res!340686) b!547077))

(assert (= (and b!547077 res!340689) b!547081))

(declare-fun m!524615 () Bool)

(assert (=> start!49806 m!524615))

(declare-fun m!524617 () Bool)

(assert (=> start!49806 m!524617))

(declare-fun m!524619 () Bool)

(assert (=> b!547081 m!524619))

(declare-fun m!524621 () Bool)

(assert (=> b!547077 m!524621))

(declare-fun m!524623 () Bool)

(assert (=> b!547080 m!524623))

(declare-fun m!524625 () Bool)

(assert (=> b!547079 m!524625))

(assert (=> b!547079 m!524625))

(declare-fun m!524627 () Bool)

(assert (=> b!547079 m!524627))

(push 1)

(assert (not b!547079))

(assert (not b!547077))

(assert (not b!547081))

(assert (not b!547080))

(assert (not start!49806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

