; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49728 () Bool)

(assert start!49728)

(declare-fun b!546471 () Bool)

(declare-fun e!315801 () Bool)

(assert (=> b!546471 (= e!315801 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5010 0))(
  ( (MissingZero!5010 (index!22267 (_ BitVec 32))) (Found!5010 (index!22268 (_ BitVec 32))) (Intermediate!5010 (undefined!5822 Bool) (index!22269 (_ BitVec 32)) (x!51225 (_ BitVec 32))) (Undefined!5010) (MissingVacant!5010 (index!22270 (_ BitVec 32))) )
))
(declare-fun lt!249121 () SeekEntryResult!5010)

(declare-datatypes ((array!34475 0))(
  ( (array!34476 (arr!16564 (Array (_ BitVec 32) (_ BitVec 64))) (size!16929 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34475)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34475 (_ BitVec 32)) SeekEntryResult!5010)

(assert (=> b!546471 (= lt!249121 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546472 () Bool)

(declare-fun res!340327 () Bool)

(assert (=> b!546472 (=> (not res!340327) (not e!315801))))

(declare-fun arrayContainsKey!0 (array!34475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546472 (= res!340327 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340330 () Bool)

(assert (=> start!49728 (=> (not res!340330) (not e!315801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49728 (= res!340330 (validMask!0 mask!3119))))

(assert (=> start!49728 e!315801))

(assert (=> start!49728 true))

(declare-fun array_inv!12447 (array!34475) Bool)

(assert (=> start!49728 (array_inv!12447 a!3118)))

(declare-fun b!546473 () Bool)

(declare-fun res!340329 () Bool)

(assert (=> b!546473 (=> (not res!340329) (not e!315801))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546473 (= res!340329 (and (= (size!16929 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16929 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16929 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546474 () Bool)

(declare-fun res!340328 () Bool)

(assert (=> b!546474 (=> (not res!340328) (not e!315801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546474 (= res!340328 (validKeyInArray!0 (select (arr!16564 a!3118) j!142)))))

(declare-fun b!546475 () Bool)

(declare-fun res!340331 () Bool)

(assert (=> b!546475 (=> (not res!340331) (not e!315801))))

(assert (=> b!546475 (= res!340331 (validKeyInArray!0 k!1914))))

(assert (= (and start!49728 res!340330) b!546473))

(assert (= (and b!546473 res!340329) b!546474))

(assert (= (and b!546474 res!340328) b!546475))

(assert (= (and b!546475 res!340331) b!546472))

(assert (= (and b!546472 res!340327) b!546471))

(declare-fun m!523385 () Bool)

(assert (=> b!546471 m!523385))

(declare-fun m!523387 () Bool)

(assert (=> b!546474 m!523387))

(assert (=> b!546474 m!523387))

(declare-fun m!523389 () Bool)

(assert (=> b!546474 m!523389))

(declare-fun m!523391 () Bool)

(assert (=> b!546472 m!523391))

(declare-fun m!523393 () Bool)

(assert (=> b!546475 m!523393))

(declare-fun m!523395 () Bool)

(assert (=> start!49728 m!523395))

(declare-fun m!523397 () Bool)

(assert (=> start!49728 m!523397))

(push 1)

(assert (not b!546474))

(assert (not b!546475))

(assert (not start!49728))

(assert (not b!546472))

(assert (not b!546471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

