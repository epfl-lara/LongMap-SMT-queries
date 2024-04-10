; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49702 () Bool)

(assert start!49702)

(declare-fun b!546556 () Bool)

(declare-fun res!340271 () Bool)

(declare-fun e!315903 () Bool)

(assert (=> b!546556 (=> (not res!340271) (not e!315903))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546556 (= res!340271 (validKeyInArray!0 k!1914))))

(declare-fun b!546557 () Bool)

(declare-datatypes ((array!34452 0))(
  ( (array!34453 (arr!16553 (Array (_ BitVec 32) (_ BitVec 64))) (size!16917 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34452)

(assert (=> b!546557 (= e!315903 (and (bvslt #b00000000000000000000000000000000 (size!16917 a!3118)) (bvsge (size!16917 a!3118) #b01111111111111111111111111111111)))))

(declare-fun res!340268 () Bool)

(assert (=> start!49702 (=> (not res!340268) (not e!315903))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49702 (= res!340268 (validMask!0 mask!3119))))

(assert (=> start!49702 e!315903))

(assert (=> start!49702 true))

(declare-fun array_inv!12349 (array!34452) Bool)

(assert (=> start!49702 (array_inv!12349 a!3118)))

(declare-fun b!546555 () Bool)

(declare-fun res!340270 () Bool)

(assert (=> b!546555 (=> (not res!340270) (not e!315903))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546555 (= res!340270 (validKeyInArray!0 (select (arr!16553 a!3118) j!142)))))

(declare-fun b!546554 () Bool)

(declare-fun res!340269 () Bool)

(assert (=> b!546554 (=> (not res!340269) (not e!315903))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546554 (= res!340269 (and (= (size!16917 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16917 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16917 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49702 res!340268) b!546554))

(assert (= (and b!546554 res!340269) b!546555))

(assert (= (and b!546555 res!340270) b!546556))

(assert (= (and b!546556 res!340271) b!546557))

(declare-fun m!523979 () Bool)

(assert (=> b!546556 m!523979))

(declare-fun m!523981 () Bool)

(assert (=> start!49702 m!523981))

(declare-fun m!523983 () Bool)

(assert (=> start!49702 m!523983))

(declare-fun m!523985 () Bool)

(assert (=> b!546555 m!523985))

(assert (=> b!546555 m!523985))

(declare-fun m!523987 () Bool)

(assert (=> b!546555 m!523987))

(push 1)

(assert (not start!49702))

(assert (not b!546556))

(assert (not b!546555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

