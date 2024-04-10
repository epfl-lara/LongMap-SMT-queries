; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119154 () Bool)

(assert start!119154)

(declare-fun b!1389993 () Bool)

(declare-fun e!787227 () Bool)

(assert (=> b!1389993 (= e!787227 (not true))))

(declare-fun e!787229 () Bool)

(assert (=> b!1389993 e!787229))

(declare-fun res!930157 () Bool)

(assert (=> b!1389993 (=> (not res!930157) (not e!787229))))

(declare-datatypes ((array!95091 0))(
  ( (array!95092 (arr!45911 (Array (_ BitVec 32) (_ BitVec 64))) (size!46461 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95091)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95091 (_ BitVec 32)) Bool)

(assert (=> b!1389993 (= res!930157 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46460 0))(
  ( (Unit!46461) )
))
(declare-fun lt!610698 () Unit!46460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46460)

(assert (=> b!1389993 (= lt!610698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10228 0))(
  ( (MissingZero!10228 (index!43283 (_ BitVec 32))) (Found!10228 (index!43284 (_ BitVec 32))) (Intermediate!10228 (undefined!11040 Bool) (index!43285 (_ BitVec 32)) (x!124970 (_ BitVec 32))) (Undefined!10228) (MissingVacant!10228 (index!43286 (_ BitVec 32))) )
))
(declare-fun lt!610697 () SeekEntryResult!10228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95091 (_ BitVec 32)) SeekEntryResult!10228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389993 (= lt!610697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45911 a!2901) j!112) mask!2840) (select (arr!45911 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389994 () Bool)

(declare-fun res!930159 () Bool)

(assert (=> b!1389994 (=> (not res!930159) (not e!787227))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389994 (= res!930159 (and (= (size!46461 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46461 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46461 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389995 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95091 (_ BitVec 32)) SeekEntryResult!10228)

(assert (=> b!1389995 (= e!787229 (= (seekEntryOrOpen!0 (select (arr!45911 a!2901) j!112) a!2901 mask!2840) (Found!10228 j!112)))))

(declare-fun b!1389996 () Bool)

(declare-fun res!930158 () Bool)

(assert (=> b!1389996 (=> (not res!930158) (not e!787227))))

(assert (=> b!1389996 (= res!930158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389997 () Bool)

(declare-fun res!930160 () Bool)

(assert (=> b!1389997 (=> (not res!930160) (not e!787227))))

(declare-datatypes ((List!32430 0))(
  ( (Nil!32427) (Cons!32426 (h!33644 (_ BitVec 64)) (t!47124 List!32430)) )
))
(declare-fun arrayNoDuplicates!0 (array!95091 (_ BitVec 32) List!32430) Bool)

(assert (=> b!1389997 (= res!930160 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32427))))

(declare-fun res!930156 () Bool)

(assert (=> start!119154 (=> (not res!930156) (not e!787227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119154 (= res!930156 (validMask!0 mask!2840))))

(assert (=> start!119154 e!787227))

(assert (=> start!119154 true))

(declare-fun array_inv!34939 (array!95091) Bool)

(assert (=> start!119154 (array_inv!34939 a!2901)))

(declare-fun b!1389998 () Bool)

(declare-fun res!930154 () Bool)

(assert (=> b!1389998 (=> (not res!930154) (not e!787227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389998 (= res!930154 (validKeyInArray!0 (select (arr!45911 a!2901) i!1037)))))

(declare-fun b!1389999 () Bool)

(declare-fun res!930155 () Bool)

(assert (=> b!1389999 (=> (not res!930155) (not e!787227))))

(assert (=> b!1389999 (= res!930155 (validKeyInArray!0 (select (arr!45911 a!2901) j!112)))))

(assert (= (and start!119154 res!930156) b!1389994))

(assert (= (and b!1389994 res!930159) b!1389998))

(assert (= (and b!1389998 res!930154) b!1389999))

(assert (= (and b!1389999 res!930155) b!1389996))

(assert (= (and b!1389996 res!930158) b!1389997))

(assert (= (and b!1389997 res!930160) b!1389993))

(assert (= (and b!1389993 res!930157) b!1389995))

(declare-fun m!1275735 () Bool)

(assert (=> b!1389993 m!1275735))

(declare-fun m!1275737 () Bool)

(assert (=> b!1389993 m!1275737))

(assert (=> b!1389993 m!1275735))

(declare-fun m!1275739 () Bool)

(assert (=> b!1389993 m!1275739))

(assert (=> b!1389993 m!1275737))

(assert (=> b!1389993 m!1275735))

(declare-fun m!1275741 () Bool)

(assert (=> b!1389993 m!1275741))

(declare-fun m!1275743 () Bool)

(assert (=> b!1389993 m!1275743))

(declare-fun m!1275745 () Bool)

(assert (=> b!1389998 m!1275745))

(assert (=> b!1389998 m!1275745))

(declare-fun m!1275747 () Bool)

(assert (=> b!1389998 m!1275747))

(assert (=> b!1389995 m!1275735))

(assert (=> b!1389995 m!1275735))

(declare-fun m!1275749 () Bool)

(assert (=> b!1389995 m!1275749))

(declare-fun m!1275751 () Bool)

(assert (=> start!119154 m!1275751))

(declare-fun m!1275753 () Bool)

(assert (=> start!119154 m!1275753))

(declare-fun m!1275755 () Bool)

(assert (=> b!1389996 m!1275755))

(assert (=> b!1389999 m!1275735))

(assert (=> b!1389999 m!1275735))

(declare-fun m!1275757 () Bool)

(assert (=> b!1389999 m!1275757))

(declare-fun m!1275759 () Bool)

(assert (=> b!1389997 m!1275759))

(push 1)

(assert (not b!1389995))

(assert (not b!1389999))

(assert (not b!1389997))

(assert (not b!1389996))

(assert (not b!1389998))

(assert (not b!1389993))

(assert (not start!119154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

