; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25428 () Bool)

(assert start!25428)

(declare-fun b!264826 () Bool)

(declare-fun e!171538 () Bool)

(assert (=> b!264826 (= e!171538 false)))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1174 0))(
  ( (MissingZero!1174 (index!6866 (_ BitVec 32))) (Found!1174 (index!6867 (_ BitVec 32))) (Intermediate!1174 (undefined!1986 Bool) (index!6868 (_ BitVec 32)) (x!25299 (_ BitVec 32))) (Undefined!1174) (MissingVacant!1174 (index!6869 (_ BitVec 32))) )
))
(declare-fun lt!133962 () SeekEntryResult!1174)

(declare-datatypes ((array!12719 0))(
  ( (array!12720 (arr!6018 (Array (_ BitVec 32) (_ BitVec 64))) (size!6370 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12719)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12719 (_ BitVec 32)) SeekEntryResult!1174)

(assert (=> b!264826 (= lt!133962 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264825 () Bool)

(declare-fun res!129310 () Bool)

(assert (=> b!264825 (=> (not res!129310) (not e!171538))))

(declare-fun arrayContainsKey!0 (array!12719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264825 (= res!129310 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129309 () Bool)

(assert (=> start!25428 (=> (not res!129309) (not e!171538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25428 (= res!129309 (validMask!0 mask!4002))))

(assert (=> start!25428 e!171538))

(assert (=> start!25428 true))

(declare-fun array_inv!3968 (array!12719) Bool)

(assert (=> start!25428 (array_inv!3968 a!3436)))

(declare-fun b!264823 () Bool)

(declare-fun res!129311 () Bool)

(assert (=> b!264823 (=> (not res!129311) (not e!171538))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264823 (= res!129311 (and (= (size!6370 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6370 a!3436))))))

(declare-fun b!264824 () Bool)

(declare-fun res!129312 () Bool)

(assert (=> b!264824 (=> (not res!129312) (not e!171538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264824 (= res!129312 (validKeyInArray!0 k!2698))))

(assert (= (and start!25428 res!129309) b!264823))

(assert (= (and b!264823 res!129311) b!264824))

(assert (= (and b!264824 res!129312) b!264825))

(assert (= (and b!264825 res!129310) b!264826))

(declare-fun m!281947 () Bool)

(assert (=> b!264826 m!281947))

(declare-fun m!281949 () Bool)

(assert (=> b!264825 m!281949))

(declare-fun m!281951 () Bool)

(assert (=> start!25428 m!281951))

(declare-fun m!281953 () Bool)

(assert (=> start!25428 m!281953))

(declare-fun m!281955 () Bool)

(assert (=> b!264824 m!281955))

(push 1)

(assert (not b!264826))

(assert (not b!264824))

(assert (not start!25428))

(assert (not b!264825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

