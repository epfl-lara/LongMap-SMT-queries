; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49718 () Bool)

(assert start!49718)

(declare-fun b!546568 () Bool)

(declare-fun res!340282 () Bool)

(declare-fun e!315908 () Bool)

(assert (=> b!546568 (=> (not res!340282) (not e!315908))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546568 (= res!340282 (validKeyInArray!0 k!1914))))

(declare-fun res!340286 () Bool)

(assert (=> start!49718 (=> (not res!340286) (not e!315908))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49718 (= res!340286 (validMask!0 mask!3119))))

(assert (=> start!49718 e!315908))

(assert (=> start!49718 true))

(declare-datatypes ((array!34456 0))(
  ( (array!34457 (arr!16554 (Array (_ BitVec 32) (_ BitVec 64))) (size!16918 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34456)

(declare-fun array_inv!12350 (array!34456) Bool)

(assert (=> start!49718 (array_inv!12350 a!3118)))

(declare-fun b!546569 () Bool)

(declare-fun res!340285 () Bool)

(assert (=> b!546569 (=> (not res!340285) (not e!315908))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546569 (= res!340285 (and (= (size!16918 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16918 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16918 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546570 () Bool)

(assert (=> b!546570 (= e!315908 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546571 () Bool)

(declare-fun res!340283 () Bool)

(assert (=> b!546571 (=> (not res!340283) (not e!315908))))

(assert (=> b!546571 (= res!340283 (validKeyInArray!0 (select (arr!16554 a!3118) j!142)))))

(declare-fun b!546572 () Bool)

(declare-fun res!340284 () Bool)

(assert (=> b!546572 (=> (not res!340284) (not e!315908))))

(declare-fun arrayContainsKey!0 (array!34456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546572 (= res!340284 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49718 res!340286) b!546569))

(assert (= (and b!546569 res!340285) b!546571))

(assert (= (and b!546571 res!340283) b!546568))

(assert (= (and b!546568 res!340282) b!546572))

(assert (= (and b!546572 res!340284) b!546570))

(declare-fun m!523989 () Bool)

(assert (=> b!546568 m!523989))

(declare-fun m!523991 () Bool)

(assert (=> start!49718 m!523991))

(declare-fun m!523993 () Bool)

(assert (=> start!49718 m!523993))

(declare-fun m!523995 () Bool)

(assert (=> b!546571 m!523995))

(assert (=> b!546571 m!523995))

(declare-fun m!523997 () Bool)

(assert (=> b!546571 m!523997))

(declare-fun m!523999 () Bool)

(assert (=> b!546572 m!523999))

(push 1)

(assert (not start!49718))

(assert (not b!546568))

(assert (not b!546571))

(assert (not b!546572))

(check-sat)

