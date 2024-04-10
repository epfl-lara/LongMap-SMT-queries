; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119124 () Bool)

(assert start!119124)

(declare-fun res!929886 () Bool)

(declare-fun e!787136 () Bool)

(assert (=> start!119124 (=> (not res!929886) (not e!787136))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119124 (= res!929886 (validMask!0 mask!2840))))

(assert (=> start!119124 e!787136))

(assert (=> start!119124 true))

(declare-datatypes ((array!95061 0))(
  ( (array!95062 (arr!45896 (Array (_ BitVec 32) (_ BitVec 64))) (size!46446 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95061)

(declare-fun array_inv!34924 (array!95061) Bool)

(assert (=> start!119124 (array_inv!34924 a!2901)))

(declare-fun b!1389721 () Bool)

(declare-fun res!929887 () Bool)

(assert (=> b!1389721 (=> (not res!929887) (not e!787136))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389721 (= res!929887 (and (= (size!46446 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46446 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46446 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389722 () Bool)

(assert (=> b!1389722 (= e!787136 false)))

(declare-datatypes ((SeekEntryResult!10213 0))(
  ( (MissingZero!10213 (index!43223 (_ BitVec 32))) (Found!10213 (index!43224 (_ BitVec 32))) (Intermediate!10213 (undefined!11025 Bool) (index!43225 (_ BitVec 32)) (x!124915 (_ BitVec 32))) (Undefined!10213) (MissingVacant!10213 (index!43226 (_ BitVec 32))) )
))
(declare-fun lt!610614 () SeekEntryResult!10213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95061 (_ BitVec 32)) SeekEntryResult!10213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389722 (= lt!610614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45896 a!2901) j!112) mask!2840) (select (arr!45896 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389723 () Bool)

(declare-fun res!929882 () Bool)

(assert (=> b!1389723 (=> (not res!929882) (not e!787136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389723 (= res!929882 (validKeyInArray!0 (select (arr!45896 a!2901) j!112)))))

(declare-fun b!1389724 () Bool)

(declare-fun res!929883 () Bool)

(assert (=> b!1389724 (=> (not res!929883) (not e!787136))))

(assert (=> b!1389724 (= res!929883 (validKeyInArray!0 (select (arr!45896 a!2901) i!1037)))))

(declare-fun b!1389725 () Bool)

(declare-fun res!929884 () Bool)

(assert (=> b!1389725 (=> (not res!929884) (not e!787136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95061 (_ BitVec 32)) Bool)

(assert (=> b!1389725 (= res!929884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389726 () Bool)

(declare-fun res!929885 () Bool)

(assert (=> b!1389726 (=> (not res!929885) (not e!787136))))

(declare-datatypes ((List!32415 0))(
  ( (Nil!32412) (Cons!32411 (h!33629 (_ BitVec 64)) (t!47109 List!32415)) )
))
(declare-fun arrayNoDuplicates!0 (array!95061 (_ BitVec 32) List!32415) Bool)

(assert (=> b!1389726 (= res!929885 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32412))))

(assert (= (and start!119124 res!929886) b!1389721))

(assert (= (and b!1389721 res!929887) b!1389724))

(assert (= (and b!1389724 res!929883) b!1389723))

(assert (= (and b!1389723 res!929882) b!1389725))

(assert (= (and b!1389725 res!929884) b!1389726))

(assert (= (and b!1389726 res!929885) b!1389722))

(declare-fun m!1275387 () Bool)

(assert (=> b!1389724 m!1275387))

(assert (=> b!1389724 m!1275387))

(declare-fun m!1275389 () Bool)

(assert (=> b!1389724 m!1275389))

(declare-fun m!1275391 () Bool)

(assert (=> start!119124 m!1275391))

(declare-fun m!1275393 () Bool)

(assert (=> start!119124 m!1275393))

(declare-fun m!1275395 () Bool)

(assert (=> b!1389722 m!1275395))

(assert (=> b!1389722 m!1275395))

(declare-fun m!1275397 () Bool)

(assert (=> b!1389722 m!1275397))

(assert (=> b!1389722 m!1275397))

(assert (=> b!1389722 m!1275395))

(declare-fun m!1275399 () Bool)

(assert (=> b!1389722 m!1275399))

(declare-fun m!1275401 () Bool)

(assert (=> b!1389725 m!1275401))

(assert (=> b!1389723 m!1275395))

(assert (=> b!1389723 m!1275395))

(declare-fun m!1275403 () Bool)

(assert (=> b!1389723 m!1275403))

(declare-fun m!1275405 () Bool)

(assert (=> b!1389726 m!1275405))

(push 1)

(assert (not b!1389724))

(assert (not start!119124))

(assert (not b!1389725))

(assert (not b!1389722))

(assert (not b!1389726))

(assert (not b!1389723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

