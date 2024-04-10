; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119958 () Bool)

(assert start!119958)

(declare-fun b!1396393 () Bool)

(declare-fun e!790552 () Bool)

(declare-fun e!790550 () Bool)

(assert (=> b!1396393 (= e!790552 (not e!790550))))

(declare-fun res!935308 () Bool)

(assert (=> b!1396393 (=> res!935308 e!790550)))

(declare-datatypes ((SeekEntryResult!10414 0))(
  ( (MissingZero!10414 (index!44027 (_ BitVec 32))) (Found!10414 (index!44028 (_ BitVec 32))) (Intermediate!10414 (undefined!11226 Bool) (index!44029 (_ BitVec 32)) (x!125700 (_ BitVec 32))) (Undefined!10414) (MissingVacant!10414 (index!44030 (_ BitVec 32))) )
))
(declare-fun lt!613393 () SeekEntryResult!10414)

(assert (=> b!1396393 (= res!935308 (or (not (is-Intermediate!10414 lt!613393)) (undefined!11226 lt!613393)))))

(declare-fun e!790551 () Bool)

(assert (=> b!1396393 e!790551))

(declare-fun res!935312 () Bool)

(assert (=> b!1396393 (=> (not res!935312) (not e!790551))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95487 0))(
  ( (array!95488 (arr!46097 (Array (_ BitVec 32) (_ BitVec 64))) (size!46647 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95487)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95487 (_ BitVec 32)) Bool)

(assert (=> b!1396393 (= res!935312 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46832 0))(
  ( (Unit!46833) )
))
(declare-fun lt!613394 () Unit!46832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46832)

(assert (=> b!1396393 (= lt!613394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613392 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95487 (_ BitVec 32)) SeekEntryResult!10414)

(assert (=> b!1396393 (= lt!613393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613392 (select (arr!46097 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396393 (= lt!613392 (toIndex!0 (select (arr!46097 a!2901) j!112) mask!2840))))

(declare-fun b!1396394 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95487 (_ BitVec 32)) SeekEntryResult!10414)

(assert (=> b!1396394 (= e!790551 (= (seekEntryOrOpen!0 (select (arr!46097 a!2901) j!112) a!2901 mask!2840) (Found!10414 j!112)))))

(declare-fun b!1396395 () Bool)

(declare-fun res!935309 () Bool)

(assert (=> b!1396395 (=> (not res!935309) (not e!790552))))

(declare-datatypes ((List!32616 0))(
  ( (Nil!32613) (Cons!32612 (h!33854 (_ BitVec 64)) (t!47310 List!32616)) )
))
(declare-fun arrayNoDuplicates!0 (array!95487 (_ BitVec 32) List!32616) Bool)

(assert (=> b!1396395 (= res!935309 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32613))))

(declare-fun b!1396396 () Bool)

(declare-fun e!790553 () Bool)

(assert (=> b!1396396 (= e!790550 e!790553)))

(declare-fun res!935307 () Bool)

(assert (=> b!1396396 (=> res!935307 e!790553)))

(declare-fun lt!613395 () SeekEntryResult!10414)

(assert (=> b!1396396 (= res!935307 (or (= lt!613393 lt!613395) (not (is-Intermediate!10414 lt!613395)) (bvslt (x!125700 lt!613393) #b00000000000000000000000000000000) (bvsgt (x!125700 lt!613393) #b01111111111111111111111111111110) (bvslt lt!613392 #b00000000000000000000000000000000) (bvsge lt!613392 (size!46647 a!2901)) (bvslt (index!44029 lt!613393) #b00000000000000000000000000000000) (bvsge (index!44029 lt!613393) (size!46647 a!2901)) (not (= lt!613393 (Intermediate!10414 false (index!44029 lt!613393) (x!125700 lt!613393)))) (not (= lt!613395 (Intermediate!10414 (undefined!11226 lt!613395) (index!44029 lt!613395) (x!125700 lt!613395))))))))

(declare-fun lt!613391 () (_ BitVec 64))

(declare-fun lt!613389 () array!95487)

(assert (=> b!1396396 (= lt!613395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613391 mask!2840) lt!613391 lt!613389 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396396 (= lt!613391 (select (store (arr!46097 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396396 (= lt!613389 (array!95488 (store (arr!46097 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46647 a!2901)))))

(declare-fun b!1396397 () Bool)

(declare-fun res!935313 () Bool)

(assert (=> b!1396397 (=> (not res!935313) (not e!790552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396397 (= res!935313 (validKeyInArray!0 (select (arr!46097 a!2901) i!1037)))))

(declare-fun res!935314 () Bool)

(assert (=> start!119958 (=> (not res!935314) (not e!790552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119958 (= res!935314 (validMask!0 mask!2840))))

(assert (=> start!119958 e!790552))

(assert (=> start!119958 true))

(declare-fun array_inv!35125 (array!95487) Bool)

(assert (=> start!119958 (array_inv!35125 a!2901)))

(declare-fun b!1396398 () Bool)

(declare-fun res!935311 () Bool)

(assert (=> b!1396398 (=> (not res!935311) (not e!790552))))

(assert (=> b!1396398 (= res!935311 (and (= (size!46647 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46647 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46647 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396399 () Bool)

(assert (=> b!1396399 (= e!790553 true)))

(declare-fun lt!613390 () SeekEntryResult!10414)

(assert (=> b!1396399 (= lt!613390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613392 lt!613391 lt!613389 mask!2840))))

(declare-fun b!1396400 () Bool)

(declare-fun res!935310 () Bool)

(assert (=> b!1396400 (=> (not res!935310) (not e!790552))))

(assert (=> b!1396400 (= res!935310 (validKeyInArray!0 (select (arr!46097 a!2901) j!112)))))

(declare-fun b!1396401 () Bool)

(declare-fun res!935306 () Bool)

(assert (=> b!1396401 (=> (not res!935306) (not e!790552))))

(assert (=> b!1396401 (= res!935306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119958 res!935314) b!1396398))

(assert (= (and b!1396398 res!935311) b!1396397))

(assert (= (and b!1396397 res!935313) b!1396400))

(assert (= (and b!1396400 res!935310) b!1396401))

(assert (= (and b!1396401 res!935306) b!1396395))

(assert (= (and b!1396395 res!935309) b!1396393))

(assert (= (and b!1396393 res!935312) b!1396394))

(assert (= (and b!1396393 (not res!935308)) b!1396396))

(assert (= (and b!1396396 (not res!935307)) b!1396399))

(declare-fun m!1282815 () Bool)

(assert (=> b!1396400 m!1282815))

(assert (=> b!1396400 m!1282815))

(declare-fun m!1282817 () Bool)

(assert (=> b!1396400 m!1282817))

(assert (=> b!1396393 m!1282815))

(declare-fun m!1282819 () Bool)

(assert (=> b!1396393 m!1282819))

(assert (=> b!1396393 m!1282815))

(declare-fun m!1282821 () Bool)

(assert (=> b!1396393 m!1282821))

(declare-fun m!1282823 () Bool)

(assert (=> b!1396393 m!1282823))

(assert (=> b!1396393 m!1282815))

(declare-fun m!1282825 () Bool)

(assert (=> b!1396393 m!1282825))

(declare-fun m!1282827 () Bool)

(assert (=> b!1396399 m!1282827))

(declare-fun m!1282829 () Bool)

(assert (=> b!1396401 m!1282829))

(declare-fun m!1282831 () Bool)

(assert (=> b!1396395 m!1282831))

(declare-fun m!1282833 () Bool)

(assert (=> b!1396396 m!1282833))

(assert (=> b!1396396 m!1282833))

(declare-fun m!1282835 () Bool)

(assert (=> b!1396396 m!1282835))

(declare-fun m!1282837 () Bool)

(assert (=> b!1396396 m!1282837))

(declare-fun m!1282839 () Bool)

(assert (=> b!1396396 m!1282839))

(assert (=> b!1396394 m!1282815))

(assert (=> b!1396394 m!1282815))

(declare-fun m!1282841 () Bool)

(assert (=> b!1396394 m!1282841))

(declare-fun m!1282843 () Bool)

(assert (=> start!119958 m!1282843))

(declare-fun m!1282845 () Bool)

(assert (=> start!119958 m!1282845))

(declare-fun m!1282847 () Bool)

(assert (=> b!1396397 m!1282847))

(assert (=> b!1396397 m!1282847))

(declare-fun m!1282849 () Bool)

(assert (=> b!1396397 m!1282849))

(push 1)

