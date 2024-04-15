; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86212 () Bool)

(assert start!86212)

(declare-fun b!998023 () Bool)

(declare-fun e!562824 () Bool)

(assert (=> b!998023 (= e!562824 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9316 0))(
  ( (MissingZero!9316 (index!39635 (_ BitVec 32))) (Found!9316 (index!39636 (_ BitVec 32))) (Intermediate!9316 (undefined!10128 Bool) (index!39637 (_ BitVec 32)) (x!87079 (_ BitVec 32))) (Undefined!9316) (MissingVacant!9316 (index!39638 (_ BitVec 32))) )
))
(declare-fun lt!441432 () SeekEntryResult!9316)

(declare-datatypes ((array!63062 0))(
  ( (array!63063 (arr!30359 (Array (_ BitVec 32) (_ BitVec 64))) (size!30863 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63062)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63062 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!998023 (= lt!441432 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30359 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998024 () Bool)

(declare-fun res!667947 () Bool)

(assert (=> b!998024 (=> (not res!667947) (not e!562824))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998024 (= res!667947 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30863 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30863 a!3219))))))

(declare-fun b!998025 () Bool)

(declare-fun res!667945 () Bool)

(assert (=> b!998025 (=> (not res!667945) (not e!562824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63062 (_ BitVec 32)) Bool)

(assert (=> b!998025 (= res!667945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998026 () Bool)

(declare-fun res!667950 () Bool)

(declare-fun e!562826 () Bool)

(assert (=> b!998026 (=> (not res!667950) (not e!562826))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998026 (= res!667950 (and (= (size!30863 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30863 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30863 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998027 () Bool)

(declare-fun res!667952 () Bool)

(assert (=> b!998027 (=> (not res!667952) (not e!562826))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998027 (= res!667952 (validKeyInArray!0 k!2224))))

(declare-fun b!998028 () Bool)

(assert (=> b!998028 (= e!562826 e!562824)))

(declare-fun res!667943 () Bool)

(assert (=> b!998028 (=> (not res!667943) (not e!562824))))

(declare-fun lt!441433 () SeekEntryResult!9316)

(assert (=> b!998028 (= res!667943 (or (= lt!441433 (MissingVacant!9316 i!1194)) (= lt!441433 (MissingZero!9316 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63062 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!998028 (= lt!441433 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998029 () Bool)

(declare-fun res!667948 () Bool)

(assert (=> b!998029 (=> (not res!667948) (not e!562826))))

(declare-fun arrayContainsKey!0 (array!63062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998029 (= res!667948 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998030 () Bool)

(declare-fun res!667946 () Bool)

(assert (=> b!998030 (=> (not res!667946) (not e!562824))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998030 (= res!667946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30359 a!3219) j!170) mask!3464) (select (arr!30359 a!3219) j!170) a!3219 mask!3464) (Intermediate!9316 false resIndex!38 resX!38)))))

(declare-fun res!667949 () Bool)

(assert (=> start!86212 (=> (not res!667949) (not e!562826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86212 (= res!667949 (validMask!0 mask!3464))))

(assert (=> start!86212 e!562826))

(declare-fun array_inv!23502 (array!63062) Bool)

(assert (=> start!86212 (array_inv!23502 a!3219)))

(assert (=> start!86212 true))

(declare-fun b!998031 () Bool)

(declare-fun res!667951 () Bool)

(assert (=> b!998031 (=> (not res!667951) (not e!562826))))

(assert (=> b!998031 (= res!667951 (validKeyInArray!0 (select (arr!30359 a!3219) j!170)))))

(declare-fun b!998032 () Bool)

(declare-fun res!667944 () Bool)

(assert (=> b!998032 (=> (not res!667944) (not e!562824))))

(declare-datatypes ((List!21101 0))(
  ( (Nil!21098) (Cons!21097 (h!22268 (_ BitVec 64)) (t!30093 List!21101)) )
))
(declare-fun arrayNoDuplicates!0 (array!63062 (_ BitVec 32) List!21101) Bool)

(assert (=> b!998032 (= res!667944 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21098))))

(assert (= (and start!86212 res!667949) b!998026))

(assert (= (and b!998026 res!667950) b!998031))

(assert (= (and b!998031 res!667951) b!998027))

(assert (= (and b!998027 res!667952) b!998029))

(assert (= (and b!998029 res!667948) b!998028))

(assert (= (and b!998028 res!667943) b!998025))

(assert (= (and b!998025 res!667945) b!998032))

(assert (= (and b!998032 res!667944) b!998024))

(assert (= (and b!998024 res!667947) b!998030))

(assert (= (and b!998030 res!667946) b!998023))

(declare-fun m!924091 () Bool)

(assert (=> b!998028 m!924091))

(declare-fun m!924093 () Bool)

(assert (=> b!998031 m!924093))

(assert (=> b!998031 m!924093))

(declare-fun m!924095 () Bool)

(assert (=> b!998031 m!924095))

(declare-fun m!924097 () Bool)

(assert (=> b!998027 m!924097))

(declare-fun m!924099 () Bool)

(assert (=> b!998032 m!924099))

(assert (=> b!998023 m!924093))

(assert (=> b!998023 m!924093))

(declare-fun m!924101 () Bool)

(assert (=> b!998023 m!924101))

(declare-fun m!924103 () Bool)

(assert (=> start!86212 m!924103))

(declare-fun m!924105 () Bool)

(assert (=> start!86212 m!924105))

(assert (=> b!998030 m!924093))

(assert (=> b!998030 m!924093))

(declare-fun m!924107 () Bool)

(assert (=> b!998030 m!924107))

(assert (=> b!998030 m!924107))

(assert (=> b!998030 m!924093))

(declare-fun m!924109 () Bool)

(assert (=> b!998030 m!924109))

(declare-fun m!924111 () Bool)

(assert (=> b!998029 m!924111))

(declare-fun m!924113 () Bool)

(assert (=> b!998025 m!924113))

(push 1)

(assert (not b!998031))

(assert (not b!998027))

(assert (not b!998030))

(assert (not b!998025))

(assert (not start!86212))

(assert (not b!998029))

(assert (not b!998023))

(assert (not b!998032))

(assert (not b!998028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

