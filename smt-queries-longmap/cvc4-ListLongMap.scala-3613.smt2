; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49752 () Bool)

(assert start!49752)

(declare-fun b!546832 () Bool)

(declare-fun res!340549 () Bool)

(declare-fun e!316011 () Bool)

(assert (=> b!546832 (=> (not res!340549) (not e!316011))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34490 0))(
  ( (array!34491 (arr!16571 (Array (_ BitVec 32) (_ BitVec 64))) (size!16935 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34490)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546832 (= res!340549 (and (= (size!16935 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16935 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16935 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340550 () Bool)

(assert (=> start!49752 (=> (not res!340550) (not e!316011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49752 (= res!340550 (validMask!0 mask!3119))))

(assert (=> start!49752 e!316011))

(assert (=> start!49752 true))

(declare-fun array_inv!12367 (array!34490) Bool)

(assert (=> start!49752 (array_inv!12367 a!3118)))

(declare-fun b!546833 () Bool)

(assert (=> b!546833 (= e!316011 false)))

(declare-datatypes ((SeekEntryResult!5020 0))(
  ( (MissingZero!5020 (index!22307 (_ BitVec 32))) (Found!5020 (index!22308 (_ BitVec 32))) (Intermediate!5020 (undefined!5832 Bool) (index!22309 (_ BitVec 32)) (x!51256 (_ BitVec 32))) (Undefined!5020) (MissingVacant!5020 (index!22310 (_ BitVec 32))) )
))
(declare-fun lt!249373 () SeekEntryResult!5020)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34490 (_ BitVec 32)) SeekEntryResult!5020)

(assert (=> b!546833 (= lt!249373 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546834 () Bool)

(declare-fun res!340548 () Bool)

(assert (=> b!546834 (=> (not res!340548) (not e!316011))))

(declare-fun arrayContainsKey!0 (array!34490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546834 (= res!340548 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546835 () Bool)

(declare-fun res!340547 () Bool)

(assert (=> b!546835 (=> (not res!340547) (not e!316011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546835 (= res!340547 (validKeyInArray!0 (select (arr!16571 a!3118) j!142)))))

(declare-fun b!546836 () Bool)

(declare-fun res!340546 () Bool)

(assert (=> b!546836 (=> (not res!340546) (not e!316011))))

(assert (=> b!546836 (= res!340546 (validKeyInArray!0 k!1914))))

(assert (= (and start!49752 res!340550) b!546832))

(assert (= (and b!546832 res!340549) b!546835))

(assert (= (and b!546835 res!340547) b!546836))

(assert (= (and b!546836 res!340546) b!546834))

(assert (= (and b!546834 res!340548) b!546833))

(declare-fun m!524221 () Bool)

(assert (=> b!546835 m!524221))

(assert (=> b!546835 m!524221))

(declare-fun m!524223 () Bool)

(assert (=> b!546835 m!524223))

(declare-fun m!524225 () Bool)

(assert (=> b!546836 m!524225))

(declare-fun m!524227 () Bool)

(assert (=> b!546834 m!524227))

(declare-fun m!524229 () Bool)

(assert (=> b!546833 m!524229))

(declare-fun m!524231 () Bool)

(assert (=> start!49752 m!524231))

(declare-fun m!524233 () Bool)

(assert (=> start!49752 m!524233))

(push 1)

(assert (not start!49752))

(assert (not b!546835))

(assert (not b!546836))

(assert (not b!546833))

(assert (not b!546834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

