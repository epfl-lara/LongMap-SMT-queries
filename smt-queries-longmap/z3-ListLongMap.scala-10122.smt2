; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119282 () Bool)

(assert start!119282)

(declare-fun b!1390999 () Bool)

(declare-fun res!931017 () Bool)

(declare-fun e!787706 () Bool)

(assert (=> b!1390999 (=> (not res!931017) (not e!787706))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95168 0))(
  ( (array!95169 (arr!45948 (Array (_ BitVec 32) (_ BitVec 64))) (size!46498 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95168)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390999 (= res!931017 (and (= (size!46498 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46498 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46498 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!787705 () Bool)

(declare-fun b!1391000 () Bool)

(declare-datatypes ((SeekEntryResult!10265 0))(
  ( (MissingZero!10265 (index!43431 (_ BitVec 32))) (Found!10265 (index!43432 (_ BitVec 32))) (Intermediate!10265 (undefined!11077 Bool) (index!43433 (_ BitVec 32)) (x!125109 (_ BitVec 32))) (Undefined!10265) (MissingVacant!10265 (index!43434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95168 (_ BitVec 32)) SeekEntryResult!10265)

(assert (=> b!1391000 (= e!787705 (= (seekEntryOrOpen!0 (select (arr!45948 a!2901) j!112) a!2901 mask!2840) (Found!10265 j!112)))))

(declare-fun b!1391001 () Bool)

(assert (=> b!1391001 (= e!787706 (not true))))

(assert (=> b!1391001 e!787705))

(declare-fun res!931015 () Bool)

(assert (=> b!1391001 (=> (not res!931015) (not e!787705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95168 (_ BitVec 32)) Bool)

(assert (=> b!1391001 (= res!931015 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46534 0))(
  ( (Unit!46535) )
))
(declare-fun lt!611027 () Unit!46534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46534)

(assert (=> b!1391001 (= lt!611027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611028 () SeekEntryResult!10265)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95168 (_ BitVec 32)) SeekEntryResult!10265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391001 (= lt!611028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45948 a!2901) j!112) mask!2840) (select (arr!45948 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391002 () Bool)

(declare-fun res!931016 () Bool)

(assert (=> b!1391002 (=> (not res!931016) (not e!787706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391002 (= res!931016 (validKeyInArray!0 (select (arr!45948 a!2901) j!112)))))

(declare-fun b!1391003 () Bool)

(declare-fun res!931012 () Bool)

(assert (=> b!1391003 (=> (not res!931012) (not e!787706))))

(assert (=> b!1391003 (= res!931012 (validKeyInArray!0 (select (arr!45948 a!2901) i!1037)))))

(declare-fun b!1391004 () Bool)

(declare-fun res!931018 () Bool)

(assert (=> b!1391004 (=> (not res!931018) (not e!787706))))

(assert (=> b!1391004 (= res!931018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931014 () Bool)

(assert (=> start!119282 (=> (not res!931014) (not e!787706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119282 (= res!931014 (validMask!0 mask!2840))))

(assert (=> start!119282 e!787706))

(assert (=> start!119282 true))

(declare-fun array_inv!34976 (array!95168) Bool)

(assert (=> start!119282 (array_inv!34976 a!2901)))

(declare-fun b!1390998 () Bool)

(declare-fun res!931013 () Bool)

(assert (=> b!1390998 (=> (not res!931013) (not e!787706))))

(declare-datatypes ((List!32467 0))(
  ( (Nil!32464) (Cons!32463 (h!33684 (_ BitVec 64)) (t!47161 List!32467)) )
))
(declare-fun arrayNoDuplicates!0 (array!95168 (_ BitVec 32) List!32467) Bool)

(assert (=> b!1390998 (= res!931013 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32464))))

(assert (= (and start!119282 res!931014) b!1390999))

(assert (= (and b!1390999 res!931017) b!1391003))

(assert (= (and b!1391003 res!931012) b!1391002))

(assert (= (and b!1391002 res!931016) b!1391004))

(assert (= (and b!1391004 res!931018) b!1390998))

(assert (= (and b!1390998 res!931013) b!1391001))

(assert (= (and b!1391001 res!931015) b!1391000))

(declare-fun m!1276823 () Bool)

(assert (=> b!1391002 m!1276823))

(assert (=> b!1391002 m!1276823))

(declare-fun m!1276825 () Bool)

(assert (=> b!1391002 m!1276825))

(declare-fun m!1276827 () Bool)

(assert (=> b!1391004 m!1276827))

(declare-fun m!1276829 () Bool)

(assert (=> b!1391003 m!1276829))

(assert (=> b!1391003 m!1276829))

(declare-fun m!1276831 () Bool)

(assert (=> b!1391003 m!1276831))

(assert (=> b!1391000 m!1276823))

(assert (=> b!1391000 m!1276823))

(declare-fun m!1276833 () Bool)

(assert (=> b!1391000 m!1276833))

(assert (=> b!1391001 m!1276823))

(declare-fun m!1276835 () Bool)

(assert (=> b!1391001 m!1276835))

(assert (=> b!1391001 m!1276823))

(declare-fun m!1276837 () Bool)

(assert (=> b!1391001 m!1276837))

(assert (=> b!1391001 m!1276835))

(assert (=> b!1391001 m!1276823))

(declare-fun m!1276839 () Bool)

(assert (=> b!1391001 m!1276839))

(declare-fun m!1276841 () Bool)

(assert (=> b!1391001 m!1276841))

(declare-fun m!1276843 () Bool)

(assert (=> b!1390998 m!1276843))

(declare-fun m!1276845 () Bool)

(assert (=> start!119282 m!1276845))

(declare-fun m!1276847 () Bool)

(assert (=> start!119282 m!1276847))

(check-sat (not b!1391004) (not start!119282) (not b!1391000) (not b!1390998) (not b!1391003) (not b!1391001) (not b!1391002))
(check-sat)
