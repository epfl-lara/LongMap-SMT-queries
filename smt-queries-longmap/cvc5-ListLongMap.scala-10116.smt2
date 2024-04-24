; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119382 () Bool)

(assert start!119382)

(declare-fun b!1391553 () Bool)

(declare-fun res!931032 () Bool)

(declare-fun e!788147 () Bool)

(assert (=> b!1391553 (=> (not res!931032) (not e!788147))))

(declare-datatypes ((array!95241 0))(
  ( (array!95242 (arr!45984 (Array (_ BitVec 32) (_ BitVec 64))) (size!46535 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95241)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95241 (_ BitVec 32)) Bool)

(assert (=> b!1391553 (= res!931032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931035 () Bool)

(assert (=> start!119382 (=> (not res!931035) (not e!788147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119382 (= res!931035 (validMask!0 mask!2840))))

(assert (=> start!119382 e!788147))

(assert (=> start!119382 true))

(declare-fun array_inv!35265 (array!95241) Bool)

(assert (=> start!119382 (array_inv!35265 a!2901)))

(declare-fun b!1391554 () Bool)

(declare-fun res!931033 () Bool)

(assert (=> b!1391554 (=> (not res!931033) (not e!788147))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391554 (= res!931033 (and (= (size!46535 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46535 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46535 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391555 () Bool)

(assert (=> b!1391555 (= e!788147 (not true))))

(declare-fun e!788145 () Bool)

(assert (=> b!1391555 e!788145))

(declare-fun res!931031 () Bool)

(assert (=> b!1391555 (=> (not res!931031) (not e!788145))))

(assert (=> b!1391555 (= res!931031 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46439 0))(
  ( (Unit!46440) )
))
(declare-fun lt!611215 () Unit!46439)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46439)

(assert (=> b!1391555 (= lt!611215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10204 0))(
  ( (MissingZero!10204 (index!43187 (_ BitVec 32))) (Found!10204 (index!43188 (_ BitVec 32))) (Intermediate!10204 (undefined!11016 Bool) (index!43189 (_ BitVec 32)) (x!125013 (_ BitVec 32))) (Undefined!10204) (MissingVacant!10204 (index!43190 (_ BitVec 32))) )
))
(declare-fun lt!611216 () SeekEntryResult!10204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95241 (_ BitVec 32)) SeekEntryResult!10204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391555 (= lt!611216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45984 a!2901) j!112) mask!2840) (select (arr!45984 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391556 () Bool)

(declare-fun res!931030 () Bool)

(assert (=> b!1391556 (=> (not res!931030) (not e!788147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391556 (= res!931030 (validKeyInArray!0 (select (arr!45984 a!2901) i!1037)))))

(declare-fun b!1391557 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95241 (_ BitVec 32)) SeekEntryResult!10204)

(assert (=> b!1391557 (= e!788145 (= (seekEntryOrOpen!0 (select (arr!45984 a!2901) j!112) a!2901 mask!2840) (Found!10204 j!112)))))

(declare-fun b!1391558 () Bool)

(declare-fun res!931034 () Bool)

(assert (=> b!1391558 (=> (not res!931034) (not e!788147))))

(assert (=> b!1391558 (= res!931034 (validKeyInArray!0 (select (arr!45984 a!2901) j!112)))))

(declare-fun b!1391559 () Bool)

(declare-fun res!931036 () Bool)

(assert (=> b!1391559 (=> (not res!931036) (not e!788147))))

(declare-datatypes ((List!32490 0))(
  ( (Nil!32487) (Cons!32486 (h!33712 (_ BitVec 64)) (t!47176 List!32490)) )
))
(declare-fun arrayNoDuplicates!0 (array!95241 (_ BitVec 32) List!32490) Bool)

(assert (=> b!1391559 (= res!931036 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32487))))

(assert (= (and start!119382 res!931035) b!1391554))

(assert (= (and b!1391554 res!931033) b!1391556))

(assert (= (and b!1391556 res!931030) b!1391558))

(assert (= (and b!1391558 res!931034) b!1391553))

(assert (= (and b!1391553 res!931032) b!1391559))

(assert (= (and b!1391559 res!931036) b!1391555))

(assert (= (and b!1391555 res!931031) b!1391557))

(declare-fun m!1277627 () Bool)

(assert (=> b!1391559 m!1277627))

(declare-fun m!1277629 () Bool)

(assert (=> start!119382 m!1277629))

(declare-fun m!1277631 () Bool)

(assert (=> start!119382 m!1277631))

(declare-fun m!1277633 () Bool)

(assert (=> b!1391556 m!1277633))

(assert (=> b!1391556 m!1277633))

(declare-fun m!1277635 () Bool)

(assert (=> b!1391556 m!1277635))

(declare-fun m!1277637 () Bool)

(assert (=> b!1391558 m!1277637))

(assert (=> b!1391558 m!1277637))

(declare-fun m!1277639 () Bool)

(assert (=> b!1391558 m!1277639))

(assert (=> b!1391557 m!1277637))

(assert (=> b!1391557 m!1277637))

(declare-fun m!1277641 () Bool)

(assert (=> b!1391557 m!1277641))

(declare-fun m!1277643 () Bool)

(assert (=> b!1391553 m!1277643))

(assert (=> b!1391555 m!1277637))

(declare-fun m!1277645 () Bool)

(assert (=> b!1391555 m!1277645))

(assert (=> b!1391555 m!1277637))

(declare-fun m!1277647 () Bool)

(assert (=> b!1391555 m!1277647))

(assert (=> b!1391555 m!1277645))

(assert (=> b!1391555 m!1277637))

(declare-fun m!1277649 () Bool)

(assert (=> b!1391555 m!1277649))

(declare-fun m!1277651 () Bool)

(assert (=> b!1391555 m!1277651))

(push 1)

(assert (not b!1391555))

(assert (not b!1391557))

(assert (not b!1391553))

(assert (not start!119382))

(assert (not b!1391559))

(assert (not b!1391558))

(assert (not b!1391556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

