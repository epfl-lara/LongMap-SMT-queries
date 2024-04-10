; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128938 () Bool)

(assert start!128938)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100794 0))(
  ( (array!100795 (arr!48634 (Array (_ BitVec 32) (_ BitVec 64))) (size!49184 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100794)

(declare-fun b!1511467 () Bool)

(declare-fun e!843832 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12805 0))(
  ( (MissingZero!12805 (index!53615 (_ BitVec 32))) (Found!12805 (index!53616 (_ BitVec 32))) (Intermediate!12805 (undefined!13617 Bool) (index!53617 (_ BitVec 32)) (x!135347 (_ BitVec 32))) (Undefined!12805) (MissingVacant!12805 (index!53618 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100794 (_ BitVec 32)) SeekEntryResult!12805)

(assert (=> b!1511467 (= e!843832 (= (seekEntry!0 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) (Found!12805 j!70)))))

(declare-fun b!1511468 () Bool)

(declare-fun res!1031380 () Bool)

(declare-fun e!843833 () Bool)

(assert (=> b!1511468 (=> (not res!1031380) (not e!843833))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!655450 () SeekEntryResult!12805)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100794 (_ BitVec 32)) SeekEntryResult!12805)

(assert (=> b!1511468 (= res!1031380 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) lt!655450))))

(declare-fun b!1511470 () Bool)

(declare-fun res!1031370 () Bool)

(declare-fun e!843834 () Bool)

(assert (=> b!1511470 (=> (not res!1031370) (not e!843834))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511470 (= res!1031370 (and (= (size!49184 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49184 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49184 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511471 () Bool)

(declare-fun res!1031378 () Bool)

(assert (=> b!1511471 (=> (not res!1031378) (not e!843833))))

(declare-fun lt!655448 () SeekEntryResult!12805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511471 (= res!1031378 (= lt!655448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100795 (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49184 a!2804)) mask!2512)))))

(declare-fun b!1511472 () Bool)

(assert (=> b!1511472 (= e!843833 (not true))))

(assert (=> b!1511472 e!843832))

(declare-fun res!1031374 () Bool)

(assert (=> b!1511472 (=> (not res!1031374) (not e!843832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100794 (_ BitVec 32)) Bool)

(assert (=> b!1511472 (= res!1031374 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50478 0))(
  ( (Unit!50479) )
))
(declare-fun lt!655449 () Unit!50478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50478)

(assert (=> b!1511472 (= lt!655449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511473 () Bool)

(declare-fun res!1031373 () Bool)

(assert (=> b!1511473 (=> (not res!1031373) (not e!843834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511473 (= res!1031373 (validKeyInArray!0 (select (arr!48634 a!2804) i!961)))))

(declare-fun b!1511474 () Bool)

(declare-fun res!1031375 () Bool)

(assert (=> b!1511474 (=> (not res!1031375) (not e!843834))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511474 (= res!1031375 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49184 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49184 a!2804))))))

(declare-fun b!1511475 () Bool)

(declare-fun res!1031372 () Bool)

(assert (=> b!1511475 (=> (not res!1031372) (not e!843834))))

(assert (=> b!1511475 (= res!1031372 (validKeyInArray!0 (select (arr!48634 a!2804) j!70)))))

(declare-fun res!1031377 () Bool)

(assert (=> start!128938 (=> (not res!1031377) (not e!843834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128938 (= res!1031377 (validMask!0 mask!2512))))

(assert (=> start!128938 e!843834))

(assert (=> start!128938 true))

(declare-fun array_inv!37662 (array!100794) Bool)

(assert (=> start!128938 (array_inv!37662 a!2804)))

(declare-fun b!1511469 () Bool)

(declare-fun res!1031371 () Bool)

(assert (=> b!1511469 (=> (not res!1031371) (not e!843834))))

(declare-datatypes ((List!35117 0))(
  ( (Nil!35114) (Cons!35113 (h!36525 (_ BitVec 64)) (t!49811 List!35117)) )
))
(declare-fun arrayNoDuplicates!0 (array!100794 (_ BitVec 32) List!35117) Bool)

(assert (=> b!1511469 (= res!1031371 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35114))))

(declare-fun b!1511476 () Bool)

(assert (=> b!1511476 (= e!843834 e!843833)))

(declare-fun res!1031379 () Bool)

(assert (=> b!1511476 (=> (not res!1031379) (not e!843833))))

(assert (=> b!1511476 (= res!1031379 (= lt!655448 lt!655450))))

(assert (=> b!1511476 (= lt!655450 (Intermediate!12805 false resIndex!21 resX!21))))

(assert (=> b!1511476 (= lt!655448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48634 a!2804) j!70) mask!2512) (select (arr!48634 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511477 () Bool)

(declare-fun res!1031376 () Bool)

(assert (=> b!1511477 (=> (not res!1031376) (not e!843834))))

(assert (=> b!1511477 (= res!1031376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128938 res!1031377) b!1511470))

(assert (= (and b!1511470 res!1031370) b!1511473))

(assert (= (and b!1511473 res!1031373) b!1511475))

(assert (= (and b!1511475 res!1031372) b!1511477))

(assert (= (and b!1511477 res!1031376) b!1511469))

(assert (= (and b!1511469 res!1031371) b!1511474))

(assert (= (and b!1511474 res!1031375) b!1511476))

(assert (= (and b!1511476 res!1031379) b!1511468))

(assert (= (and b!1511468 res!1031380) b!1511471))

(assert (= (and b!1511471 res!1031378) b!1511472))

(assert (= (and b!1511472 res!1031374) b!1511467))

(declare-fun m!1394167 () Bool)

(assert (=> b!1511477 m!1394167))

(declare-fun m!1394169 () Bool)

(assert (=> b!1511471 m!1394169))

(declare-fun m!1394171 () Bool)

(assert (=> b!1511471 m!1394171))

(assert (=> b!1511471 m!1394171))

(declare-fun m!1394173 () Bool)

(assert (=> b!1511471 m!1394173))

(assert (=> b!1511471 m!1394173))

(assert (=> b!1511471 m!1394171))

(declare-fun m!1394175 () Bool)

(assert (=> b!1511471 m!1394175))

(declare-fun m!1394177 () Bool)

(assert (=> b!1511472 m!1394177))

(declare-fun m!1394179 () Bool)

(assert (=> b!1511472 m!1394179))

(declare-fun m!1394181 () Bool)

(assert (=> b!1511467 m!1394181))

(assert (=> b!1511467 m!1394181))

(declare-fun m!1394183 () Bool)

(assert (=> b!1511467 m!1394183))

(assert (=> b!1511468 m!1394181))

(assert (=> b!1511468 m!1394181))

(declare-fun m!1394185 () Bool)

(assert (=> b!1511468 m!1394185))

(declare-fun m!1394187 () Bool)

(assert (=> b!1511469 m!1394187))

(assert (=> b!1511476 m!1394181))

(assert (=> b!1511476 m!1394181))

(declare-fun m!1394189 () Bool)

(assert (=> b!1511476 m!1394189))

(assert (=> b!1511476 m!1394189))

(assert (=> b!1511476 m!1394181))

(declare-fun m!1394191 () Bool)

(assert (=> b!1511476 m!1394191))

(assert (=> b!1511475 m!1394181))

(assert (=> b!1511475 m!1394181))

(declare-fun m!1394193 () Bool)

(assert (=> b!1511475 m!1394193))

(declare-fun m!1394195 () Bool)

(assert (=> start!128938 m!1394195))

(declare-fun m!1394197 () Bool)

(assert (=> start!128938 m!1394197))

(declare-fun m!1394199 () Bool)

(assert (=> b!1511473 m!1394199))

(assert (=> b!1511473 m!1394199))

(declare-fun m!1394201 () Bool)

(assert (=> b!1511473 m!1394201))

(push 1)

(assert (not b!1511472))

(assert (not b!1511471))

