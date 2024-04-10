; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119106 () Bool)

(assert start!119106)

(declare-fun b!1389559 () Bool)

(declare-fun res!929724 () Bool)

(declare-fun e!787082 () Bool)

(assert (=> b!1389559 (=> (not res!929724) (not e!787082))))

(declare-datatypes ((array!95043 0))(
  ( (array!95044 (arr!45887 (Array (_ BitVec 32) (_ BitVec 64))) (size!46437 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95043)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389559 (= res!929724 (validKeyInArray!0 (select (arr!45887 a!2901) i!1037)))))

(declare-fun b!1389560 () Bool)

(declare-fun res!929725 () Bool)

(assert (=> b!1389560 (=> (not res!929725) (not e!787082))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389560 (= res!929725 (validKeyInArray!0 (select (arr!45887 a!2901) j!112)))))

(declare-fun res!929722 () Bool)

(assert (=> start!119106 (=> (not res!929722) (not e!787082))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119106 (= res!929722 (validMask!0 mask!2840))))

(assert (=> start!119106 e!787082))

(assert (=> start!119106 true))

(declare-fun array_inv!34915 (array!95043) Bool)

(assert (=> start!119106 (array_inv!34915 a!2901)))

(declare-fun b!1389561 () Bool)

(assert (=> b!1389561 (= e!787082 false)))

(declare-datatypes ((SeekEntryResult!10204 0))(
  ( (MissingZero!10204 (index!43187 (_ BitVec 32))) (Found!10204 (index!43188 (_ BitVec 32))) (Intermediate!10204 (undefined!11016 Bool) (index!43189 (_ BitVec 32)) (x!124882 (_ BitVec 32))) (Undefined!10204) (MissingVacant!10204 (index!43190 (_ BitVec 32))) )
))
(declare-fun lt!610587 () SeekEntryResult!10204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95043 (_ BitVec 32)) SeekEntryResult!10204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389561 (= lt!610587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45887 a!2901) j!112) mask!2840) (select (arr!45887 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389562 () Bool)

(declare-fun res!929723 () Bool)

(assert (=> b!1389562 (=> (not res!929723) (not e!787082))))

(declare-datatypes ((List!32406 0))(
  ( (Nil!32403) (Cons!32402 (h!33620 (_ BitVec 64)) (t!47100 List!32406)) )
))
(declare-fun arrayNoDuplicates!0 (array!95043 (_ BitVec 32) List!32406) Bool)

(assert (=> b!1389562 (= res!929723 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32403))))

(declare-fun b!1389563 () Bool)

(declare-fun res!929720 () Bool)

(assert (=> b!1389563 (=> (not res!929720) (not e!787082))))

(assert (=> b!1389563 (= res!929720 (and (= (size!46437 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46437 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46437 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389564 () Bool)

(declare-fun res!929721 () Bool)

(assert (=> b!1389564 (=> (not res!929721) (not e!787082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95043 (_ BitVec 32)) Bool)

(assert (=> b!1389564 (= res!929721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119106 res!929722) b!1389563))

(assert (= (and b!1389563 res!929720) b!1389559))

(assert (= (and b!1389559 res!929724) b!1389560))

(assert (= (and b!1389560 res!929725) b!1389564))

(assert (= (and b!1389564 res!929721) b!1389562))

(assert (= (and b!1389562 res!929723) b!1389561))

(declare-fun m!1275207 () Bool)

(assert (=> b!1389559 m!1275207))

(assert (=> b!1389559 m!1275207))

(declare-fun m!1275209 () Bool)

(assert (=> b!1389559 m!1275209))

(declare-fun m!1275211 () Bool)

(assert (=> b!1389562 m!1275211))

(declare-fun m!1275213 () Bool)

(assert (=> start!119106 m!1275213))

(declare-fun m!1275215 () Bool)

(assert (=> start!119106 m!1275215))

(declare-fun m!1275217 () Bool)

(assert (=> b!1389561 m!1275217))

(assert (=> b!1389561 m!1275217))

(declare-fun m!1275219 () Bool)

(assert (=> b!1389561 m!1275219))

(assert (=> b!1389561 m!1275219))

(assert (=> b!1389561 m!1275217))

(declare-fun m!1275221 () Bool)

(assert (=> b!1389561 m!1275221))

(assert (=> b!1389560 m!1275217))

(assert (=> b!1389560 m!1275217))

(declare-fun m!1275223 () Bool)

(assert (=> b!1389560 m!1275223))

(declare-fun m!1275225 () Bool)

(assert (=> b!1389564 m!1275225))

(push 1)

(assert (not b!1389564))

(assert (not b!1389560))

(assert (not b!1389561))

(assert (not start!119106))

(assert (not b!1389559))

(assert (not b!1389562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

