; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49764 () Bool)

(assert start!49764)

(declare-fun b!546922 () Bool)

(declare-fun res!340640 () Bool)

(declare-fun e!316047 () Bool)

(assert (=> b!546922 (=> (not res!340640) (not e!316047))))

(declare-datatypes ((array!34502 0))(
  ( (array!34503 (arr!16577 (Array (_ BitVec 32) (_ BitVec 64))) (size!16941 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34502)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546922 (= res!340640 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546923 () Bool)

(assert (=> b!546923 (= e!316047 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5026 0))(
  ( (MissingZero!5026 (index!22331 (_ BitVec 32))) (Found!5026 (index!22332 (_ BitVec 32))) (Intermediate!5026 (undefined!5838 Bool) (index!22333 (_ BitVec 32)) (x!51278 (_ BitVec 32))) (Undefined!5026) (MissingVacant!5026 (index!22334 (_ BitVec 32))) )
))
(declare-fun lt!249391 () SeekEntryResult!5026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34502 (_ BitVec 32)) SeekEntryResult!5026)

(assert (=> b!546923 (= lt!249391 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546924 () Bool)

(declare-fun res!340639 () Bool)

(assert (=> b!546924 (=> (not res!340639) (not e!316047))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546924 (= res!340639 (validKeyInArray!0 (select (arr!16577 a!3118) j!142)))))

(declare-fun b!546925 () Bool)

(declare-fun res!340636 () Bool)

(assert (=> b!546925 (=> (not res!340636) (not e!316047))))

(assert (=> b!546925 (= res!340636 (validKeyInArray!0 k!1914))))

(declare-fun b!546926 () Bool)

(declare-fun res!340638 () Bool)

(assert (=> b!546926 (=> (not res!340638) (not e!316047))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546926 (= res!340638 (and (= (size!16941 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16941 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16941 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340637 () Bool)

(assert (=> start!49764 (=> (not res!340637) (not e!316047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49764 (= res!340637 (validMask!0 mask!3119))))

(assert (=> start!49764 e!316047))

(assert (=> start!49764 true))

(declare-fun array_inv!12373 (array!34502) Bool)

(assert (=> start!49764 (array_inv!12373 a!3118)))

(assert (= (and start!49764 res!340637) b!546926))

(assert (= (and b!546926 res!340638) b!546924))

(assert (= (and b!546924 res!340639) b!546925))

(assert (= (and b!546925 res!340636) b!546922))

(assert (= (and b!546922 res!340640) b!546923))

(declare-fun m!524305 () Bool)

(assert (=> b!546924 m!524305))

(assert (=> b!546924 m!524305))

(declare-fun m!524307 () Bool)

(assert (=> b!546924 m!524307))

(declare-fun m!524309 () Bool)

(assert (=> b!546923 m!524309))

(declare-fun m!524311 () Bool)

(assert (=> b!546925 m!524311))

(declare-fun m!524313 () Bool)

(assert (=> b!546922 m!524313))

(declare-fun m!524315 () Bool)

(assert (=> start!49764 m!524315))

(declare-fun m!524317 () Bool)

(assert (=> start!49764 m!524317))

(push 1)

(assert (not b!546924))

(assert (not b!546922))

(assert (not b!546923))

(assert (not b!546925))

(assert (not start!49764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

