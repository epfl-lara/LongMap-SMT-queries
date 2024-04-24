; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119814 () Bool)

(assert start!119814)

(declare-fun b!1394591 () Bool)

(declare-fun res!933320 () Bool)

(declare-fun e!789762 () Bool)

(assert (=> b!1394591 (=> (not res!933320) (not e!789762))))

(declare-datatypes ((array!95418 0))(
  ( (array!95419 (arr!46065 (Array (_ BitVec 32) (_ BitVec 64))) (size!46616 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95418)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95418 (_ BitVec 32)) Bool)

(assert (=> b!1394591 (= res!933320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394592 () Bool)

(declare-fun res!933322 () Bool)

(assert (=> b!1394592 (=> (not res!933322) (not e!789762))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394592 (= res!933322 (and (= (size!46616 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46616 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46616 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394593 () Bool)

(declare-fun res!933317 () Bool)

(assert (=> b!1394593 (=> (not res!933317) (not e!789762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394593 (= res!933317 (validKeyInArray!0 (select (arr!46065 a!2901) i!1037)))))

(declare-fun b!1394594 () Bool)

(declare-fun res!933318 () Bool)

(assert (=> b!1394594 (=> (not res!933318) (not e!789762))))

(assert (=> b!1394594 (= res!933318 (validKeyInArray!0 (select (arr!46065 a!2901) j!112)))))

(declare-fun res!933321 () Bool)

(assert (=> start!119814 (=> (not res!933321) (not e!789762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119814 (= res!933321 (validMask!0 mask!2840))))

(assert (=> start!119814 e!789762))

(assert (=> start!119814 true))

(declare-fun array_inv!35346 (array!95418) Bool)

(assert (=> start!119814 (array_inv!35346 a!2901)))

(declare-fun b!1394595 () Bool)

(declare-fun e!789764 () Bool)

(declare-datatypes ((SeekEntryResult!10285 0))(
  ( (MissingZero!10285 (index!43511 (_ BitVec 32))) (Found!10285 (index!43512 (_ BitVec 32))) (Intermediate!10285 (undefined!11097 Bool) (index!43513 (_ BitVec 32)) (x!125340 (_ BitVec 32))) (Undefined!10285) (MissingVacant!10285 (index!43514 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95418 (_ BitVec 32)) SeekEntryResult!10285)

(assert (=> b!1394595 (= e!789764 (= (seekEntryOrOpen!0 (select (arr!46065 a!2901) j!112) a!2901 mask!2840) (Found!10285 j!112)))))

(declare-fun b!1394596 () Bool)

(declare-fun e!789761 () Bool)

(assert (=> b!1394596 (= e!789761 true)))

(declare-fun lt!612393 () SeekEntryResult!10285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95418 (_ BitVec 32)) SeekEntryResult!10285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394596 (= lt!612393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46065 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46065 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95419 (store (arr!46065 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46616 a!2901)) mask!2840))))

(declare-fun b!1394597 () Bool)

(assert (=> b!1394597 (= e!789762 (not e!789761))))

(declare-fun res!933319 () Bool)

(assert (=> b!1394597 (=> res!933319 e!789761)))

(declare-fun lt!612395 () SeekEntryResult!10285)

(assert (=> b!1394597 (= res!933319 (or (not (is-Intermediate!10285 lt!612395)) (undefined!11097 lt!612395)))))

(assert (=> b!1394597 e!789764))

(declare-fun res!933315 () Bool)

(assert (=> b!1394597 (=> (not res!933315) (not e!789764))))

(assert (=> b!1394597 (= res!933315 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46601 0))(
  ( (Unit!46602) )
))
(declare-fun lt!612394 () Unit!46601)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46601)

(assert (=> b!1394597 (= lt!612394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394597 (= lt!612395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46065 a!2901) j!112) mask!2840) (select (arr!46065 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394598 () Bool)

(declare-fun res!933316 () Bool)

(assert (=> b!1394598 (=> (not res!933316) (not e!789762))))

(declare-datatypes ((List!32571 0))(
  ( (Nil!32568) (Cons!32567 (h!33808 (_ BitVec 64)) (t!47257 List!32571)) )
))
(declare-fun arrayNoDuplicates!0 (array!95418 (_ BitVec 32) List!32571) Bool)

(assert (=> b!1394598 (= res!933316 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32568))))

(assert (= (and start!119814 res!933321) b!1394592))

(assert (= (and b!1394592 res!933322) b!1394593))

(assert (= (and b!1394593 res!933317) b!1394594))

(assert (= (and b!1394594 res!933318) b!1394591))

(assert (= (and b!1394591 res!933320) b!1394598))

(assert (= (and b!1394598 res!933316) b!1394597))

(assert (= (and b!1394597 res!933315) b!1394595))

(assert (= (and b!1394597 (not res!933319)) b!1394596))

(declare-fun m!1280739 () Bool)

(assert (=> b!1394595 m!1280739))

(assert (=> b!1394595 m!1280739))

(declare-fun m!1280741 () Bool)

(assert (=> b!1394595 m!1280741))

(assert (=> b!1394594 m!1280739))

(assert (=> b!1394594 m!1280739))

(declare-fun m!1280743 () Bool)

(assert (=> b!1394594 m!1280743))

(declare-fun m!1280745 () Bool)

(assert (=> b!1394593 m!1280745))

(assert (=> b!1394593 m!1280745))

(declare-fun m!1280747 () Bool)

(assert (=> b!1394593 m!1280747))

(declare-fun m!1280749 () Bool)

(assert (=> b!1394591 m!1280749))

(assert (=> b!1394597 m!1280739))

(declare-fun m!1280751 () Bool)

(assert (=> b!1394597 m!1280751))

(assert (=> b!1394597 m!1280739))

(declare-fun m!1280753 () Bool)

(assert (=> b!1394597 m!1280753))

(assert (=> b!1394597 m!1280751))

(assert (=> b!1394597 m!1280739))

(declare-fun m!1280755 () Bool)

(assert (=> b!1394597 m!1280755))

(declare-fun m!1280757 () Bool)

(assert (=> b!1394597 m!1280757))

(declare-fun m!1280759 () Bool)

(assert (=> b!1394596 m!1280759))

(declare-fun m!1280761 () Bool)

(assert (=> b!1394596 m!1280761))

(assert (=> b!1394596 m!1280761))

(declare-fun m!1280763 () Bool)

(assert (=> b!1394596 m!1280763))

(assert (=> b!1394596 m!1280763))

(assert (=> b!1394596 m!1280761))

(declare-fun m!1280765 () Bool)

(assert (=> b!1394596 m!1280765))

(declare-fun m!1280767 () Bool)

(assert (=> start!119814 m!1280767))

(declare-fun m!1280769 () Bool)

(assert (=> start!119814 m!1280769))

(declare-fun m!1280771 () Bool)

(assert (=> b!1394598 m!1280771))

(push 1)

(assert (not b!1394596))

(assert (not start!119814))

(assert (not b!1394595))

(assert (not b!1394597))

(assert (not b!1394593))

(assert (not b!1394598))

(assert (not b!1394591))

(assert (not b!1394594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

