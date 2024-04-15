; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49752 () Bool)

(assert start!49752)

(declare-fun b!546651 () Bool)

(declare-fun res!340510 () Bool)

(declare-fun e!315873 () Bool)

(assert (=> b!546651 (=> (not res!340510) (not e!315873))))

(declare-datatypes ((array!34499 0))(
  ( (array!34500 (arr!16576 (Array (_ BitVec 32) (_ BitVec 64))) (size!16941 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34499)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546651 (= res!340510 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340508 () Bool)

(assert (=> start!49752 (=> (not res!340508) (not e!315873))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49752 (= res!340508 (validMask!0 mask!3119))))

(assert (=> start!49752 e!315873))

(assert (=> start!49752 true))

(declare-fun array_inv!12459 (array!34499) Bool)

(assert (=> start!49752 (array_inv!12459 a!3118)))

(declare-fun b!546652 () Bool)

(declare-fun res!340511 () Bool)

(assert (=> b!546652 (=> (not res!340511) (not e!315873))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546652 (= res!340511 (and (= (size!16941 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16941 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16941 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546653 () Bool)

(declare-fun res!340509 () Bool)

(assert (=> b!546653 (=> (not res!340509) (not e!315873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546653 (= res!340509 (validKeyInArray!0 (select (arr!16576 a!3118) j!142)))))

(declare-fun b!546654 () Bool)

(declare-fun res!340507 () Bool)

(assert (=> b!546654 (=> (not res!340507) (not e!315873))))

(assert (=> b!546654 (= res!340507 (validKeyInArray!0 k!1914))))

(declare-fun b!546655 () Bool)

(assert (=> b!546655 (= e!315873 false)))

(declare-datatypes ((SeekEntryResult!5022 0))(
  ( (MissingZero!5022 (index!22315 (_ BitVec 32))) (Found!5022 (index!22316 (_ BitVec 32))) (Intermediate!5022 (undefined!5834 Bool) (index!22317 (_ BitVec 32)) (x!51269 (_ BitVec 32))) (Undefined!5022) (MissingVacant!5022 (index!22318 (_ BitVec 32))) )
))
(declare-fun lt!249157 () SeekEntryResult!5022)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34499 (_ BitVec 32)) SeekEntryResult!5022)

(assert (=> b!546655 (= lt!249157 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49752 res!340508) b!546652))

(assert (= (and b!546652 res!340511) b!546653))

(assert (= (and b!546653 res!340509) b!546654))

(assert (= (and b!546654 res!340507) b!546651))

(assert (= (and b!546651 res!340510) b!546655))

(declare-fun m!523553 () Bool)

(assert (=> b!546653 m!523553))

(assert (=> b!546653 m!523553))

(declare-fun m!523555 () Bool)

(assert (=> b!546653 m!523555))

(declare-fun m!523557 () Bool)

(assert (=> b!546655 m!523557))

(declare-fun m!523559 () Bool)

(assert (=> b!546654 m!523559))

(declare-fun m!523561 () Bool)

(assert (=> b!546651 m!523561))

(declare-fun m!523563 () Bool)

(assert (=> start!49752 m!523563))

(declare-fun m!523565 () Bool)

(assert (=> start!49752 m!523565))

(push 1)

(assert (not b!546654))

(assert (not b!546651))

(assert (not b!546653))

(assert (not b!546655))

(assert (not start!49752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

