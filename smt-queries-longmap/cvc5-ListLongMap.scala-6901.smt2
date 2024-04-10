; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86768 () Bool)

(assert start!86768)

(declare-fun b!1005930 () Bool)

(declare-fun res!675026 () Bool)

(declare-fun e!566316 () Bool)

(assert (=> b!1005930 (=> (not res!675026) (not e!566316))))

(declare-datatypes ((array!63467 0))(
  ( (array!63468 (arr!30556 (Array (_ BitVec 32) (_ BitVec 64))) (size!31058 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63467)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005930 (= res!675026 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31058 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31058 a!3219))))))

(declare-fun b!1005931 () Bool)

(declare-fun res!675020 () Bool)

(declare-fun e!566317 () Bool)

(assert (=> b!1005931 (=> (not res!675020) (not e!566317))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005931 (= res!675020 (validKeyInArray!0 (select (arr!30556 a!3219) j!170)))))

(declare-fun res!675025 () Bool)

(assert (=> start!86768 (=> (not res!675025) (not e!566317))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86768 (= res!675025 (validMask!0 mask!3464))))

(assert (=> start!86768 e!566317))

(declare-fun array_inv!23680 (array!63467) Bool)

(assert (=> start!86768 (array_inv!23680 a!3219)))

(assert (=> start!86768 true))

(declare-fun b!1005932 () Bool)

(declare-fun res!675024 () Bool)

(assert (=> b!1005932 (=> (not res!675024) (not e!566316))))

(declare-datatypes ((SeekEntryResult!9488 0))(
  ( (MissingZero!9488 (index!40323 (_ BitVec 32))) (Found!9488 (index!40324 (_ BitVec 32))) (Intermediate!9488 (undefined!10300 Bool) (index!40325 (_ BitVec 32)) (x!87728 (_ BitVec 32))) (Undefined!9488) (MissingVacant!9488 (index!40326 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63467 (_ BitVec 32)) SeekEntryResult!9488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005932 (= res!675024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30556 a!3219) j!170) mask!3464) (select (arr!30556 a!3219) j!170) a!3219 mask!3464) (Intermediate!9488 false resIndex!38 resX!38)))))

(declare-fun b!1005933 () Bool)

(assert (=> b!1005933 (= e!566317 e!566316)))

(declare-fun res!675019 () Bool)

(assert (=> b!1005933 (=> (not res!675019) (not e!566316))))

(declare-fun lt!444652 () SeekEntryResult!9488)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005933 (= res!675019 (or (= lt!444652 (MissingVacant!9488 i!1194)) (= lt!444652 (MissingZero!9488 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63467 (_ BitVec 32)) SeekEntryResult!9488)

(assert (=> b!1005933 (= lt!444652 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005934 () Bool)

(declare-fun res!675018 () Bool)

(assert (=> b!1005934 (=> (not res!675018) (not e!566316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63467 (_ BitVec 32)) Bool)

(assert (=> b!1005934 (= res!675018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005935 () Bool)

(declare-fun res!675022 () Bool)

(assert (=> b!1005935 (=> (not res!675022) (not e!566317))))

(assert (=> b!1005935 (= res!675022 (validKeyInArray!0 k!2224))))

(declare-fun b!1005936 () Bool)

(assert (=> b!1005936 (= e!566316 false)))

(declare-fun lt!444653 () SeekEntryResult!9488)

(assert (=> b!1005936 (= lt!444653 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30556 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005937 () Bool)

(declare-fun res!675027 () Bool)

(assert (=> b!1005937 (=> (not res!675027) (not e!566317))))

(declare-fun arrayContainsKey!0 (array!63467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005937 (= res!675027 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005938 () Bool)

(declare-fun res!675023 () Bool)

(assert (=> b!1005938 (=> (not res!675023) (not e!566316))))

(declare-datatypes ((List!21232 0))(
  ( (Nil!21229) (Cons!21228 (h!22411 (_ BitVec 64)) (t!30233 List!21232)) )
))
(declare-fun arrayNoDuplicates!0 (array!63467 (_ BitVec 32) List!21232) Bool)

(assert (=> b!1005938 (= res!675023 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21229))))

(declare-fun b!1005939 () Bool)

(declare-fun res!675021 () Bool)

(assert (=> b!1005939 (=> (not res!675021) (not e!566317))))

(assert (=> b!1005939 (= res!675021 (and (= (size!31058 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31058 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31058 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86768 res!675025) b!1005939))

(assert (= (and b!1005939 res!675021) b!1005931))

(assert (= (and b!1005931 res!675020) b!1005935))

(assert (= (and b!1005935 res!675022) b!1005937))

(assert (= (and b!1005937 res!675027) b!1005933))

(assert (= (and b!1005933 res!675019) b!1005934))

(assert (= (and b!1005934 res!675018) b!1005938))

(assert (= (and b!1005938 res!675023) b!1005930))

(assert (= (and b!1005930 res!675026) b!1005932))

(assert (= (and b!1005932 res!675024) b!1005936))

(declare-fun m!931073 () Bool)

(assert (=> b!1005935 m!931073))

(declare-fun m!931075 () Bool)

(assert (=> start!86768 m!931075))

(declare-fun m!931077 () Bool)

(assert (=> start!86768 m!931077))

(declare-fun m!931079 () Bool)

(assert (=> b!1005936 m!931079))

(assert (=> b!1005936 m!931079))

(declare-fun m!931081 () Bool)

(assert (=> b!1005936 m!931081))

(declare-fun m!931083 () Bool)

(assert (=> b!1005934 m!931083))

(declare-fun m!931085 () Bool)

(assert (=> b!1005938 m!931085))

(declare-fun m!931087 () Bool)

(assert (=> b!1005933 m!931087))

(assert (=> b!1005931 m!931079))

(assert (=> b!1005931 m!931079))

(declare-fun m!931089 () Bool)

(assert (=> b!1005931 m!931089))

(declare-fun m!931091 () Bool)

(assert (=> b!1005937 m!931091))

(assert (=> b!1005932 m!931079))

(assert (=> b!1005932 m!931079))

(declare-fun m!931093 () Bool)

(assert (=> b!1005932 m!931093))

(assert (=> b!1005932 m!931093))

(assert (=> b!1005932 m!931079))

(declare-fun m!931095 () Bool)

(assert (=> b!1005932 m!931095))

(push 1)

