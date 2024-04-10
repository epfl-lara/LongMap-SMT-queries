; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123642 () Bool)

(assert start!123642)

(declare-fun b!1433384 () Bool)

(declare-fun e!809065 () Bool)

(assert (=> b!1433384 (= e!809065 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!631010 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433384 (= lt!631010 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433385 () Bool)

(declare-fun res!967048 () Bool)

(declare-fun e!809062 () Bool)

(assert (=> b!1433385 (=> (not res!967048) (not e!809062))))

(declare-datatypes ((array!97557 0))(
  ( (array!97558 (arr!47084 (Array (_ BitVec 32) (_ BitVec 64))) (size!47634 (_ BitVec 32))) )
))
(declare-fun lt!631006 () array!97557)

(declare-datatypes ((SeekEntryResult!11363 0))(
  ( (MissingZero!11363 (index!47844 (_ BitVec 32))) (Found!11363 (index!47845 (_ BitVec 32))) (Intermediate!11363 (undefined!12175 Bool) (index!47846 (_ BitVec 32)) (x!129494 (_ BitVec 32))) (Undefined!11363) (MissingVacant!11363 (index!47847 (_ BitVec 32))) )
))
(declare-fun lt!631007 () SeekEntryResult!11363)

(declare-fun lt!631011 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97557 (_ BitVec 32)) SeekEntryResult!11363)

(assert (=> b!1433385 (= res!967048 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631011 lt!631006 mask!2608) lt!631007))))

(declare-fun b!1433387 () Bool)

(declare-fun e!809064 () Bool)

(declare-fun e!809063 () Bool)

(assert (=> b!1433387 (= e!809064 e!809063)))

(declare-fun res!967054 () Bool)

(assert (=> b!1433387 (=> (not res!967054) (not e!809063))))

(declare-fun lt!631009 () SeekEntryResult!11363)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433387 (= res!967054 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47084 a!2831) j!81) mask!2608) (select (arr!47084 a!2831) j!81) a!2831 mask!2608) lt!631009))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433387 (= lt!631009 (Intermediate!11363 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433388 () Bool)

(declare-fun res!967059 () Bool)

(assert (=> b!1433388 (=> (not res!967059) (not e!809064))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433388 (= res!967059 (validKeyInArray!0 (select (arr!47084 a!2831) i!982)))))

(declare-fun e!809066 () Bool)

(declare-fun b!1433389 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97557 (_ BitVec 32)) SeekEntryResult!11363)

(assert (=> b!1433389 (= e!809066 (= (seekEntryOrOpen!0 (select (arr!47084 a!2831) j!81) a!2831 mask!2608) (Found!11363 j!81)))))

(declare-fun b!1433390 () Bool)

(declare-fun res!967050 () Bool)

(assert (=> b!1433390 (=> (not res!967050) (not e!809064))))

(declare-datatypes ((List!33594 0))(
  ( (Nil!33591) (Cons!33590 (h!34916 (_ BitVec 64)) (t!48288 List!33594)) )
))
(declare-fun arrayNoDuplicates!0 (array!97557 (_ BitVec 32) List!33594) Bool)

(assert (=> b!1433390 (= res!967050 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33591))))

(declare-fun b!1433391 () Bool)

(declare-fun res!967057 () Bool)

(assert (=> b!1433391 (=> (not res!967057) (not e!809064))))

(assert (=> b!1433391 (= res!967057 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47634 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47634 a!2831))))))

(declare-fun b!1433392 () Bool)

(declare-fun res!967053 () Bool)

(assert (=> b!1433392 (=> (not res!967053) (not e!809062))))

(assert (=> b!1433392 (= res!967053 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47084 a!2831) j!81) a!2831 mask!2608) lt!631009))))

(declare-fun b!1433393 () Bool)

(declare-fun res!967056 () Bool)

(assert (=> b!1433393 (=> (not res!967056) (not e!809064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97557 (_ BitVec 32)) Bool)

(assert (=> b!1433393 (= res!967056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433386 () Bool)

(declare-fun res!967051 () Bool)

(assert (=> b!1433386 (=> (not res!967051) (not e!809064))))

(assert (=> b!1433386 (= res!967051 (validKeyInArray!0 (select (arr!47084 a!2831) j!81)))))

(declare-fun res!967055 () Bool)

(assert (=> start!123642 (=> (not res!967055) (not e!809064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123642 (= res!967055 (validMask!0 mask!2608))))

(assert (=> start!123642 e!809064))

(assert (=> start!123642 true))

(declare-fun array_inv!36112 (array!97557) Bool)

(assert (=> start!123642 (array_inv!36112 a!2831)))

(declare-fun b!1433394 () Bool)

(declare-fun res!967049 () Bool)

(assert (=> b!1433394 (=> (not res!967049) (not e!809064))))

(assert (=> b!1433394 (= res!967049 (and (= (size!47634 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47634 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47634 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433395 () Bool)

(declare-fun res!967047 () Bool)

(assert (=> b!1433395 (=> (not res!967047) (not e!809062))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433395 (= res!967047 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433396 () Bool)

(assert (=> b!1433396 (= e!809062 (not e!809065))))

(declare-fun res!967058 () Bool)

(assert (=> b!1433396 (=> res!967058 e!809065)))

(assert (=> b!1433396 (= res!967058 (or (= (select (arr!47084 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47084 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47084 a!2831) index!585) (select (arr!47084 a!2831) j!81)) (= (select (store (arr!47084 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433396 e!809066))

(declare-fun res!967060 () Bool)

(assert (=> b!1433396 (=> (not res!967060) (not e!809066))))

(assert (=> b!1433396 (= res!967060 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48472 0))(
  ( (Unit!48473) )
))
(declare-fun lt!631008 () Unit!48472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48472)

(assert (=> b!1433396 (= lt!631008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433397 () Bool)

(assert (=> b!1433397 (= e!809063 e!809062)))

(declare-fun res!967052 () Bool)

(assert (=> b!1433397 (=> (not res!967052) (not e!809062))))

(assert (=> b!1433397 (= res!967052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631011 mask!2608) lt!631011 lt!631006 mask!2608) lt!631007))))

(assert (=> b!1433397 (= lt!631007 (Intermediate!11363 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433397 (= lt!631011 (select (store (arr!47084 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433397 (= lt!631006 (array!97558 (store (arr!47084 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47634 a!2831)))))

(assert (= (and start!123642 res!967055) b!1433394))

(assert (= (and b!1433394 res!967049) b!1433388))

(assert (= (and b!1433388 res!967059) b!1433386))

(assert (= (and b!1433386 res!967051) b!1433393))

(assert (= (and b!1433393 res!967056) b!1433390))

(assert (= (and b!1433390 res!967050) b!1433391))

(assert (= (and b!1433391 res!967057) b!1433387))

(assert (= (and b!1433387 res!967054) b!1433397))

(assert (= (and b!1433397 res!967052) b!1433392))

(assert (= (and b!1433392 res!967053) b!1433385))

(assert (= (and b!1433385 res!967048) b!1433395))

(assert (= (and b!1433395 res!967047) b!1433396))

(assert (= (and b!1433396 res!967060) b!1433389))

(assert (= (and b!1433396 (not res!967058)) b!1433384))

(declare-fun m!1323099 () Bool)

(assert (=> b!1433386 m!1323099))

(assert (=> b!1433386 m!1323099))

(declare-fun m!1323101 () Bool)

(assert (=> b!1433386 m!1323101))

(declare-fun m!1323103 () Bool)

(assert (=> b!1433385 m!1323103))

(assert (=> b!1433389 m!1323099))

(assert (=> b!1433389 m!1323099))

(declare-fun m!1323105 () Bool)

(assert (=> b!1433389 m!1323105))

(declare-fun m!1323107 () Bool)

(assert (=> start!123642 m!1323107))

(declare-fun m!1323109 () Bool)

(assert (=> start!123642 m!1323109))

(assert (=> b!1433392 m!1323099))

(assert (=> b!1433392 m!1323099))

(declare-fun m!1323111 () Bool)

(assert (=> b!1433392 m!1323111))

(declare-fun m!1323113 () Bool)

(assert (=> b!1433388 m!1323113))

(assert (=> b!1433388 m!1323113))

(declare-fun m!1323115 () Bool)

(assert (=> b!1433388 m!1323115))

(assert (=> b!1433387 m!1323099))

(assert (=> b!1433387 m!1323099))

(declare-fun m!1323117 () Bool)

(assert (=> b!1433387 m!1323117))

(assert (=> b!1433387 m!1323117))

(assert (=> b!1433387 m!1323099))

(declare-fun m!1323119 () Bool)

(assert (=> b!1433387 m!1323119))

(declare-fun m!1323121 () Bool)

(assert (=> b!1433397 m!1323121))

(assert (=> b!1433397 m!1323121))

(declare-fun m!1323123 () Bool)

(assert (=> b!1433397 m!1323123))

(declare-fun m!1323125 () Bool)

(assert (=> b!1433397 m!1323125))

(declare-fun m!1323127 () Bool)

(assert (=> b!1433397 m!1323127))

(assert (=> b!1433396 m!1323125))

(declare-fun m!1323129 () Bool)

(assert (=> b!1433396 m!1323129))

(declare-fun m!1323131 () Bool)

(assert (=> b!1433396 m!1323131))

(declare-fun m!1323133 () Bool)

(assert (=> b!1433396 m!1323133))

(assert (=> b!1433396 m!1323099))

(declare-fun m!1323135 () Bool)

(assert (=> b!1433396 m!1323135))

(declare-fun m!1323137 () Bool)

(assert (=> b!1433384 m!1323137))

(declare-fun m!1323139 () Bool)

(assert (=> b!1433390 m!1323139))

(declare-fun m!1323141 () Bool)

(assert (=> b!1433393 m!1323141))

(push 1)

