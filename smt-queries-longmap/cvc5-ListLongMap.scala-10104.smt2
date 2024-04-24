; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119310 () Bool)

(assert start!119310)

(declare-fun b!1390843 () Bool)

(declare-fun res!930324 () Bool)

(declare-fun e!787868 () Bool)

(assert (=> b!1390843 (=> (not res!930324) (not e!787868))))

(declare-datatypes ((array!95169 0))(
  ( (array!95170 (arr!45948 (Array (_ BitVec 32) (_ BitVec 64))) (size!46499 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95169)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95169 (_ BitVec 32)) Bool)

(assert (=> b!1390843 (= res!930324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930321 () Bool)

(assert (=> start!119310 (=> (not res!930321) (not e!787868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119310 (= res!930321 (validMask!0 mask!2840))))

(assert (=> start!119310 e!787868))

(assert (=> start!119310 true))

(declare-fun array_inv!35229 (array!95169) Bool)

(assert (=> start!119310 (array_inv!35229 a!2901)))

(declare-fun b!1390844 () Bool)

(declare-fun res!930325 () Bool)

(assert (=> b!1390844 (=> (not res!930325) (not e!787868))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390844 (= res!930325 (and (= (size!46499 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46499 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46499 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390845 () Bool)

(assert (=> b!1390845 (= e!787868 false)))

(declare-datatypes ((SeekEntryResult!10168 0))(
  ( (MissingZero!10168 (index!43043 (_ BitVec 32))) (Found!10168 (index!43044 (_ BitVec 32))) (Intermediate!10168 (undefined!10980 Bool) (index!43045 (_ BitVec 32)) (x!124881 (_ BitVec 32))) (Undefined!10168) (MissingVacant!10168 (index!43046 (_ BitVec 32))) )
))
(declare-fun lt!611009 () SeekEntryResult!10168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95169 (_ BitVec 32)) SeekEntryResult!10168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390845 (= lt!611009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45948 a!2901) j!112) mask!2840) (select (arr!45948 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390846 () Bool)

(declare-fun res!930320 () Bool)

(assert (=> b!1390846 (=> (not res!930320) (not e!787868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390846 (= res!930320 (validKeyInArray!0 (select (arr!45948 a!2901) i!1037)))))

(declare-fun b!1390847 () Bool)

(declare-fun res!930323 () Bool)

(assert (=> b!1390847 (=> (not res!930323) (not e!787868))))

(declare-datatypes ((List!32454 0))(
  ( (Nil!32451) (Cons!32450 (h!33676 (_ BitVec 64)) (t!47140 List!32454)) )
))
(declare-fun arrayNoDuplicates!0 (array!95169 (_ BitVec 32) List!32454) Bool)

(assert (=> b!1390847 (= res!930323 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32451))))

(declare-fun b!1390848 () Bool)

(declare-fun res!930322 () Bool)

(assert (=> b!1390848 (=> (not res!930322) (not e!787868))))

(assert (=> b!1390848 (= res!930322 (validKeyInArray!0 (select (arr!45948 a!2901) j!112)))))

(assert (= (and start!119310 res!930321) b!1390844))

(assert (= (and b!1390844 res!930325) b!1390846))

(assert (= (and b!1390846 res!930320) b!1390848))

(assert (= (and b!1390848 res!930322) b!1390843))

(assert (= (and b!1390843 res!930324) b!1390847))

(assert (= (and b!1390847 res!930323) b!1390845))

(declare-fun m!1276739 () Bool)

(assert (=> b!1390848 m!1276739))

(assert (=> b!1390848 m!1276739))

(declare-fun m!1276741 () Bool)

(assert (=> b!1390848 m!1276741))

(declare-fun m!1276743 () Bool)

(assert (=> b!1390843 m!1276743))

(assert (=> b!1390845 m!1276739))

(assert (=> b!1390845 m!1276739))

(declare-fun m!1276745 () Bool)

(assert (=> b!1390845 m!1276745))

(assert (=> b!1390845 m!1276745))

(assert (=> b!1390845 m!1276739))

(declare-fun m!1276747 () Bool)

(assert (=> b!1390845 m!1276747))

(declare-fun m!1276749 () Bool)

(assert (=> b!1390846 m!1276749))

(assert (=> b!1390846 m!1276749))

(declare-fun m!1276751 () Bool)

(assert (=> b!1390846 m!1276751))

(declare-fun m!1276753 () Bool)

(assert (=> start!119310 m!1276753))

(declare-fun m!1276755 () Bool)

(assert (=> start!119310 m!1276755))

(declare-fun m!1276757 () Bool)

(assert (=> b!1390847 m!1276757))

(push 1)

(assert (not b!1390846))

(assert (not b!1390843))

(assert (not b!1390848))

(assert (not b!1390847))

(assert (not b!1390845))

(assert (not start!119310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

