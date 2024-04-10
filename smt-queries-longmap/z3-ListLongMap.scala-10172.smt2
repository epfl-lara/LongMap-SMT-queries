; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119960 () Bool)

(assert start!119960)

(declare-fun b!1396420 () Bool)

(declare-fun res!935334 () Bool)

(declare-fun e!790566 () Bool)

(assert (=> b!1396420 (=> (not res!935334) (not e!790566))))

(declare-datatypes ((array!95489 0))(
  ( (array!95490 (arr!46098 (Array (_ BitVec 32) (_ BitVec 64))) (size!46648 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95489)

(declare-datatypes ((List!32617 0))(
  ( (Nil!32614) (Cons!32613 (h!33855 (_ BitVec 64)) (t!47311 List!32617)) )
))
(declare-fun arrayNoDuplicates!0 (array!95489 (_ BitVec 32) List!32617) Bool)

(assert (=> b!1396420 (= res!935334 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32614))))

(declare-fun b!1396421 () Bool)

(declare-fun e!790568 () Bool)

(assert (=> b!1396421 (= e!790566 (not e!790568))))

(declare-fun res!935338 () Bool)

(assert (=> b!1396421 (=> res!935338 e!790568)))

(declare-datatypes ((SeekEntryResult!10415 0))(
  ( (MissingZero!10415 (index!44031 (_ BitVec 32))) (Found!10415 (index!44032 (_ BitVec 32))) (Intermediate!10415 (undefined!11227 Bool) (index!44033 (_ BitVec 32)) (x!125701 (_ BitVec 32))) (Undefined!10415) (MissingVacant!10415 (index!44034 (_ BitVec 32))) )
))
(declare-fun lt!613415 () SeekEntryResult!10415)

(get-info :version)

(assert (=> b!1396421 (= res!935338 (or (not ((_ is Intermediate!10415) lt!613415)) (undefined!11227 lt!613415)))))

(declare-fun e!790565 () Bool)

(assert (=> b!1396421 e!790565))

(declare-fun res!935336 () Bool)

(assert (=> b!1396421 (=> (not res!935336) (not e!790565))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95489 (_ BitVec 32)) Bool)

(assert (=> b!1396421 (= res!935336 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46834 0))(
  ( (Unit!46835) )
))
(declare-fun lt!613410 () Unit!46834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46834)

(assert (=> b!1396421 (= lt!613410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613413 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95489 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1396421 (= lt!613415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613413 (select (arr!46098 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396421 (= lt!613413 (toIndex!0 (select (arr!46098 a!2901) j!112) mask!2840))))

(declare-fun b!1396422 () Bool)

(declare-fun res!935337 () Bool)

(assert (=> b!1396422 (=> (not res!935337) (not e!790566))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396422 (= res!935337 (and (= (size!46648 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46648 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46648 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!935335 () Bool)

(assert (=> start!119960 (=> (not res!935335) (not e!790566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119960 (= res!935335 (validMask!0 mask!2840))))

(assert (=> start!119960 e!790566))

(assert (=> start!119960 true))

(declare-fun array_inv!35126 (array!95489) Bool)

(assert (=> start!119960 (array_inv!35126 a!2901)))

(declare-fun b!1396423 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95489 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1396423 (= e!790565 (= (seekEntryOrOpen!0 (select (arr!46098 a!2901) j!112) a!2901 mask!2840) (Found!10415 j!112)))))

(declare-fun b!1396424 () Bool)

(declare-fun res!935340 () Bool)

(assert (=> b!1396424 (=> (not res!935340) (not e!790566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396424 (= res!935340 (validKeyInArray!0 (select (arr!46098 a!2901) j!112)))))

(declare-fun b!1396425 () Bool)

(declare-fun res!935341 () Bool)

(assert (=> b!1396425 (=> (not res!935341) (not e!790566))))

(assert (=> b!1396425 (= res!935341 (validKeyInArray!0 (select (arr!46098 a!2901) i!1037)))))

(declare-fun b!1396426 () Bool)

(declare-fun e!790567 () Bool)

(assert (=> b!1396426 (= e!790568 e!790567)))

(declare-fun res!935333 () Bool)

(assert (=> b!1396426 (=> res!935333 e!790567)))

(declare-fun lt!613416 () SeekEntryResult!10415)

(assert (=> b!1396426 (= res!935333 (or (= lt!613415 lt!613416) (not ((_ is Intermediate!10415) lt!613416)) (bvslt (x!125701 lt!613415) #b00000000000000000000000000000000) (bvsgt (x!125701 lt!613415) #b01111111111111111111111111111110) (bvslt lt!613413 #b00000000000000000000000000000000) (bvsge lt!613413 (size!46648 a!2901)) (bvslt (index!44033 lt!613415) #b00000000000000000000000000000000) (bvsge (index!44033 lt!613415) (size!46648 a!2901)) (not (= lt!613415 (Intermediate!10415 false (index!44033 lt!613415) (x!125701 lt!613415)))) (not (= lt!613416 (Intermediate!10415 (undefined!11227 lt!613416) (index!44033 lt!613416) (x!125701 lt!613416))))))))

(declare-fun lt!613412 () (_ BitVec 64))

(declare-fun lt!613411 () array!95489)

(assert (=> b!1396426 (= lt!613416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613412 mask!2840) lt!613412 lt!613411 mask!2840))))

(assert (=> b!1396426 (= lt!613412 (select (store (arr!46098 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396426 (= lt!613411 (array!95490 (store (arr!46098 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46648 a!2901)))))

(declare-fun b!1396427 () Bool)

(assert (=> b!1396427 (= e!790567 true)))

(declare-fun lt!613414 () SeekEntryResult!10415)

(assert (=> b!1396427 (= lt!613414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613413 lt!613412 lt!613411 mask!2840))))

(declare-fun b!1396428 () Bool)

(declare-fun res!935339 () Bool)

(assert (=> b!1396428 (=> (not res!935339) (not e!790566))))

(assert (=> b!1396428 (= res!935339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119960 res!935335) b!1396422))

(assert (= (and b!1396422 res!935337) b!1396425))

(assert (= (and b!1396425 res!935341) b!1396424))

(assert (= (and b!1396424 res!935340) b!1396428))

(assert (= (and b!1396428 res!935339) b!1396420))

(assert (= (and b!1396420 res!935334) b!1396421))

(assert (= (and b!1396421 res!935336) b!1396423))

(assert (= (and b!1396421 (not res!935338)) b!1396426))

(assert (= (and b!1396426 (not res!935333)) b!1396427))

(declare-fun m!1282851 () Bool)

(assert (=> start!119960 m!1282851))

(declare-fun m!1282853 () Bool)

(assert (=> start!119960 m!1282853))

(declare-fun m!1282855 () Bool)

(assert (=> b!1396427 m!1282855))

(declare-fun m!1282857 () Bool)

(assert (=> b!1396420 m!1282857))

(declare-fun m!1282859 () Bool)

(assert (=> b!1396425 m!1282859))

(assert (=> b!1396425 m!1282859))

(declare-fun m!1282861 () Bool)

(assert (=> b!1396425 m!1282861))

(declare-fun m!1282863 () Bool)

(assert (=> b!1396428 m!1282863))

(declare-fun m!1282865 () Bool)

(assert (=> b!1396421 m!1282865))

(declare-fun m!1282867 () Bool)

(assert (=> b!1396421 m!1282867))

(assert (=> b!1396421 m!1282865))

(declare-fun m!1282869 () Bool)

(assert (=> b!1396421 m!1282869))

(assert (=> b!1396421 m!1282865))

(declare-fun m!1282871 () Bool)

(assert (=> b!1396421 m!1282871))

(declare-fun m!1282873 () Bool)

(assert (=> b!1396421 m!1282873))

(assert (=> b!1396423 m!1282865))

(assert (=> b!1396423 m!1282865))

(declare-fun m!1282875 () Bool)

(assert (=> b!1396423 m!1282875))

(declare-fun m!1282877 () Bool)

(assert (=> b!1396426 m!1282877))

(assert (=> b!1396426 m!1282877))

(declare-fun m!1282879 () Bool)

(assert (=> b!1396426 m!1282879))

(declare-fun m!1282881 () Bool)

(assert (=> b!1396426 m!1282881))

(declare-fun m!1282883 () Bool)

(assert (=> b!1396426 m!1282883))

(assert (=> b!1396424 m!1282865))

(assert (=> b!1396424 m!1282865))

(declare-fun m!1282885 () Bool)

(assert (=> b!1396424 m!1282885))

(check-sat (not start!119960) (not b!1396425) (not b!1396420) (not b!1396428) (not b!1396426) (not b!1396424) (not b!1396427) (not b!1396423) (not b!1396421))
(check-sat)
