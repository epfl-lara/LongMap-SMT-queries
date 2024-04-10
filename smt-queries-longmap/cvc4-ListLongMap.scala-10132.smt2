; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119506 () Bool)

(assert start!119506)

(declare-fun b!1392377 () Bool)

(declare-fun res!931954 () Bool)

(declare-fun e!788462 () Bool)

(assert (=> b!1392377 (=> (not res!931954) (not e!788462))))

(declare-datatypes ((array!95239 0))(
  ( (array!95240 (arr!45979 (Array (_ BitVec 32) (_ BitVec 64))) (size!46529 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95239)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392377 (= res!931954 (validKeyInArray!0 (select (arr!45979 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1392379 () Bool)

(declare-fun e!788460 () Bool)

(declare-datatypes ((SeekEntryResult!10296 0))(
  ( (MissingZero!10296 (index!43555 (_ BitVec 32))) (Found!10296 (index!43556 (_ BitVec 32))) (Intermediate!10296 (undefined!11108 Bool) (index!43557 (_ BitVec 32)) (x!125238 (_ BitVec 32))) (Undefined!10296) (MissingVacant!10296 (index!43558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95239 (_ BitVec 32)) SeekEntryResult!10296)

(assert (=> b!1392379 (= e!788460 (= (seekEntryOrOpen!0 (select (arr!45979 a!2901) j!112) a!2901 mask!2840) (Found!10296 j!112)))))

(declare-fun b!1392380 () Bool)

(declare-fun e!788461 () Bool)

(assert (=> b!1392380 (= e!788461 true)))

(declare-fun lt!611597 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392380 (= lt!611597 (toIndex!0 (select (store (arr!45979 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392381 () Bool)

(declare-fun res!931957 () Bool)

(assert (=> b!1392381 (=> (not res!931957) (not e!788462))))

(declare-datatypes ((List!32498 0))(
  ( (Nil!32495) (Cons!32494 (h!33724 (_ BitVec 64)) (t!47192 List!32498)) )
))
(declare-fun arrayNoDuplicates!0 (array!95239 (_ BitVec 32) List!32498) Bool)

(assert (=> b!1392381 (= res!931957 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32495))))

(declare-fun b!1392382 () Bool)

(declare-fun res!931952 () Bool)

(assert (=> b!1392382 (=> (not res!931952) (not e!788462))))

(assert (=> b!1392382 (= res!931952 (and (= (size!46529 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46529 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46529 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392383 () Bool)

(assert (=> b!1392383 (= e!788462 (not e!788461))))

(declare-fun res!931951 () Bool)

(assert (=> b!1392383 (=> res!931951 e!788461)))

(declare-fun lt!611598 () SeekEntryResult!10296)

(assert (=> b!1392383 (= res!931951 (or (not (is-Intermediate!10296 lt!611598)) (undefined!11108 lt!611598)))))

(assert (=> b!1392383 e!788460))

(declare-fun res!931953 () Bool)

(assert (=> b!1392383 (=> (not res!931953) (not e!788460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95239 (_ BitVec 32)) Bool)

(assert (=> b!1392383 (= res!931953 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46596 0))(
  ( (Unit!46597) )
))
(declare-fun lt!611596 () Unit!46596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46596)

(assert (=> b!1392383 (= lt!611596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95239 (_ BitVec 32)) SeekEntryResult!10296)

(assert (=> b!1392383 (= lt!611598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45979 a!2901) j!112) mask!2840) (select (arr!45979 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392384 () Bool)

(declare-fun res!931956 () Bool)

(assert (=> b!1392384 (=> (not res!931956) (not e!788462))))

(assert (=> b!1392384 (= res!931956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931955 () Bool)

(assert (=> start!119506 (=> (not res!931955) (not e!788462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119506 (= res!931955 (validMask!0 mask!2840))))

(assert (=> start!119506 e!788462))

(assert (=> start!119506 true))

(declare-fun array_inv!35007 (array!95239) Bool)

(assert (=> start!119506 (array_inv!35007 a!2901)))

(declare-fun b!1392378 () Bool)

(declare-fun res!931950 () Bool)

(assert (=> b!1392378 (=> (not res!931950) (not e!788462))))

(assert (=> b!1392378 (= res!931950 (validKeyInArray!0 (select (arr!45979 a!2901) i!1037)))))

(assert (= (and start!119506 res!931955) b!1392382))

(assert (= (and b!1392382 res!931952) b!1392378))

(assert (= (and b!1392378 res!931950) b!1392377))

(assert (= (and b!1392377 res!931954) b!1392384))

(assert (= (and b!1392384 res!931956) b!1392381))

(assert (= (and b!1392381 res!931957) b!1392383))

(assert (= (and b!1392383 res!931953) b!1392379))

(assert (= (and b!1392383 (not res!931951)) b!1392380))

(declare-fun m!1278097 () Bool)

(assert (=> start!119506 m!1278097))

(declare-fun m!1278099 () Bool)

(assert (=> start!119506 m!1278099))

(declare-fun m!1278101 () Bool)

(assert (=> b!1392378 m!1278101))

(assert (=> b!1392378 m!1278101))

(declare-fun m!1278103 () Bool)

(assert (=> b!1392378 m!1278103))

(declare-fun m!1278105 () Bool)

(assert (=> b!1392377 m!1278105))

(assert (=> b!1392377 m!1278105))

(declare-fun m!1278107 () Bool)

(assert (=> b!1392377 m!1278107))

(declare-fun m!1278109 () Bool)

(assert (=> b!1392381 m!1278109))

(assert (=> b!1392379 m!1278105))

(assert (=> b!1392379 m!1278105))

(declare-fun m!1278111 () Bool)

(assert (=> b!1392379 m!1278111))

(declare-fun m!1278113 () Bool)

(assert (=> b!1392380 m!1278113))

(declare-fun m!1278115 () Bool)

(assert (=> b!1392380 m!1278115))

(assert (=> b!1392380 m!1278115))

(declare-fun m!1278117 () Bool)

(assert (=> b!1392380 m!1278117))

(declare-fun m!1278119 () Bool)

(assert (=> b!1392384 m!1278119))

(assert (=> b!1392383 m!1278105))

(declare-fun m!1278121 () Bool)

(assert (=> b!1392383 m!1278121))

(assert (=> b!1392383 m!1278105))

(declare-fun m!1278123 () Bool)

(assert (=> b!1392383 m!1278123))

(assert (=> b!1392383 m!1278121))

(assert (=> b!1392383 m!1278105))

(declare-fun m!1278125 () Bool)

(assert (=> b!1392383 m!1278125))

(declare-fun m!1278127 () Bool)

(assert (=> b!1392383 m!1278127))

(push 1)

(assert (not b!1392378))

(assert (not b!1392379))

(assert (not b!1392384))

(assert (not b!1392383))

(assert (not b!1392381))

(assert (not start!119506))

(assert (not b!1392380))

(assert (not b!1392377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

