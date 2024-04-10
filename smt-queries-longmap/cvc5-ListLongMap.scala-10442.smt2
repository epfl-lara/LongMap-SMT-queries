; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122814 () Bool)

(assert start!122814)

(declare-fun b!1424175 () Bool)

(declare-fun res!959617 () Bool)

(declare-fun e!804905 () Bool)

(assert (=> b!1424175 (=> (not res!959617) (not e!804905))))

(declare-datatypes ((SeekEntryResult!11192 0))(
  ( (MissingZero!11192 (index!47160 (_ BitVec 32))) (Found!11192 (index!47161 (_ BitVec 32))) (Intermediate!11192 (undefined!12004 Bool) (index!47162 (_ BitVec 32)) (x!128794 (_ BitVec 32))) (Undefined!11192) (MissingVacant!11192 (index!47163 (_ BitVec 32))) )
))
(declare-fun lt!627436 () SeekEntryResult!11192)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97179 0))(
  ( (array!97180 (arr!46907 (Array (_ BitVec 32) (_ BitVec 64))) (size!47457 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97179)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97179 (_ BitVec 32)) SeekEntryResult!11192)

(assert (=> b!1424175 (= res!959617 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46907 a!2831) j!81) a!2831 mask!2608) lt!627436))))

(declare-fun b!1424176 () Bool)

(declare-fun res!959609 () Bool)

(declare-fun e!804899 () Bool)

(assert (=> b!1424176 (=> (not res!959609) (not e!804899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97179 (_ BitVec 32)) Bool)

(assert (=> b!1424176 (= res!959609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424177 () Bool)

(declare-fun res!959618 () Bool)

(declare-fun e!804904 () Bool)

(assert (=> b!1424177 (=> res!959618 e!804904)))

(declare-fun lt!627441 () (_ BitVec 32))

(assert (=> b!1424177 (= res!959618 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627441 (select (arr!46907 a!2831) j!81) a!2831 mask!2608) lt!627436)))))

(declare-fun b!1424178 () Bool)

(declare-fun res!959620 () Bool)

(assert (=> b!1424178 (=> (not res!959620) (not e!804899))))

(declare-datatypes ((List!33417 0))(
  ( (Nil!33414) (Cons!33413 (h!34715 (_ BitVec 64)) (t!48111 List!33417)) )
))
(declare-fun arrayNoDuplicates!0 (array!97179 (_ BitVec 32) List!33417) Bool)

(assert (=> b!1424178 (= res!959620 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33414))))

(declare-fun b!1424180 () Bool)

(declare-fun e!804903 () Bool)

(assert (=> b!1424180 (= e!804903 e!804904)))

(declare-fun res!959623 () Bool)

(assert (=> b!1424180 (=> res!959623 e!804904)))

(assert (=> b!1424180 (= res!959623 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627441 #b00000000000000000000000000000000) (bvsge lt!627441 (size!47457 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424180 (= lt!627441 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424181 () Bool)

(assert (=> b!1424181 (= e!804905 (not e!804903))))

(declare-fun res!959610 () Bool)

(assert (=> b!1424181 (=> res!959610 e!804903)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424181 (= res!959610 (or (= (select (arr!46907 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46907 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46907 a!2831) index!585) (select (arr!46907 a!2831) j!81)) (= (select (store (arr!46907 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804902 () Bool)

(assert (=> b!1424181 e!804902))

(declare-fun res!959622 () Bool)

(assert (=> b!1424181 (=> (not res!959622) (not e!804902))))

(assert (=> b!1424181 (= res!959622 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48220 0))(
  ( (Unit!48221) )
))
(declare-fun lt!627439 () Unit!48220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48220)

(assert (=> b!1424181 (= lt!627439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424182 () Bool)

(declare-fun res!959612 () Bool)

(assert (=> b!1424182 (=> (not res!959612) (not e!804899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424182 (= res!959612 (validKeyInArray!0 (select (arr!46907 a!2831) i!982)))))

(declare-fun b!1424183 () Bool)

(declare-fun res!959621 () Bool)

(assert (=> b!1424183 (=> (not res!959621) (not e!804899))))

(assert (=> b!1424183 (= res!959621 (and (= (size!47457 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47457 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47457 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424184 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97179 (_ BitVec 32)) SeekEntryResult!11192)

(assert (=> b!1424184 (= e!804902 (= (seekEntryOrOpen!0 (select (arr!46907 a!2831) j!81) a!2831 mask!2608) (Found!11192 j!81)))))

(declare-fun b!1424185 () Bool)

(assert (=> b!1424185 (= e!804904 true)))

(declare-fun lt!627437 () SeekEntryResult!11192)

(declare-fun lt!627440 () array!97179)

(declare-fun lt!627435 () (_ BitVec 64))

(assert (=> b!1424185 (= lt!627437 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627441 lt!627435 lt!627440 mask!2608))))

(declare-fun b!1424186 () Bool)

(declare-fun e!804901 () Bool)

(assert (=> b!1424186 (= e!804901 e!804905)))

(declare-fun res!959613 () Bool)

(assert (=> b!1424186 (=> (not res!959613) (not e!804905))))

(declare-fun lt!627438 () SeekEntryResult!11192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424186 (= res!959613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627435 mask!2608) lt!627435 lt!627440 mask!2608) lt!627438))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1424186 (= lt!627438 (Intermediate!11192 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424186 (= lt!627435 (select (store (arr!46907 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424186 (= lt!627440 (array!97180 (store (arr!46907 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47457 a!2831)))))

(declare-fun b!1424179 () Bool)

(declare-fun res!959614 () Bool)

(assert (=> b!1424179 (=> (not res!959614) (not e!804899))))

(assert (=> b!1424179 (= res!959614 (validKeyInArray!0 (select (arr!46907 a!2831) j!81)))))

(declare-fun res!959619 () Bool)

(assert (=> start!122814 (=> (not res!959619) (not e!804899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122814 (= res!959619 (validMask!0 mask!2608))))

(assert (=> start!122814 e!804899))

(assert (=> start!122814 true))

(declare-fun array_inv!35935 (array!97179) Bool)

(assert (=> start!122814 (array_inv!35935 a!2831)))

(declare-fun b!1424187 () Bool)

(assert (=> b!1424187 (= e!804899 e!804901)))

(declare-fun res!959615 () Bool)

(assert (=> b!1424187 (=> (not res!959615) (not e!804901))))

(assert (=> b!1424187 (= res!959615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46907 a!2831) j!81) mask!2608) (select (arr!46907 a!2831) j!81) a!2831 mask!2608) lt!627436))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424187 (= lt!627436 (Intermediate!11192 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424188 () Bool)

(declare-fun res!959608 () Bool)

(assert (=> b!1424188 (=> (not res!959608) (not e!804905))))

(assert (=> b!1424188 (= res!959608 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424189 () Bool)

(declare-fun res!959616 () Bool)

(assert (=> b!1424189 (=> (not res!959616) (not e!804905))))

(assert (=> b!1424189 (= res!959616 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627435 lt!627440 mask!2608) lt!627438))))

(declare-fun b!1424190 () Bool)

(declare-fun res!959611 () Bool)

(assert (=> b!1424190 (=> (not res!959611) (not e!804899))))

(assert (=> b!1424190 (= res!959611 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47457 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47457 a!2831))))))

(assert (= (and start!122814 res!959619) b!1424183))

(assert (= (and b!1424183 res!959621) b!1424182))

(assert (= (and b!1424182 res!959612) b!1424179))

(assert (= (and b!1424179 res!959614) b!1424176))

(assert (= (and b!1424176 res!959609) b!1424178))

(assert (= (and b!1424178 res!959620) b!1424190))

(assert (= (and b!1424190 res!959611) b!1424187))

(assert (= (and b!1424187 res!959615) b!1424186))

(assert (= (and b!1424186 res!959613) b!1424175))

(assert (= (and b!1424175 res!959617) b!1424189))

(assert (= (and b!1424189 res!959616) b!1424188))

(assert (= (and b!1424188 res!959608) b!1424181))

(assert (= (and b!1424181 res!959622) b!1424184))

(assert (= (and b!1424181 (not res!959610)) b!1424180))

(assert (= (and b!1424180 (not res!959623)) b!1424177))

(assert (= (and b!1424177 (not res!959618)) b!1424185))

(declare-fun m!1314723 () Bool)

(assert (=> b!1424189 m!1314723))

(declare-fun m!1314725 () Bool)

(assert (=> b!1424186 m!1314725))

(assert (=> b!1424186 m!1314725))

(declare-fun m!1314727 () Bool)

(assert (=> b!1424186 m!1314727))

(declare-fun m!1314729 () Bool)

(assert (=> b!1424186 m!1314729))

(declare-fun m!1314731 () Bool)

(assert (=> b!1424186 m!1314731))

(declare-fun m!1314733 () Bool)

(assert (=> start!122814 m!1314733))

(declare-fun m!1314735 () Bool)

(assert (=> start!122814 m!1314735))

(declare-fun m!1314737 () Bool)

(assert (=> b!1424175 m!1314737))

(assert (=> b!1424175 m!1314737))

(declare-fun m!1314739 () Bool)

(assert (=> b!1424175 m!1314739))

(declare-fun m!1314741 () Bool)

(assert (=> b!1424178 m!1314741))

(assert (=> b!1424184 m!1314737))

(assert (=> b!1424184 m!1314737))

(declare-fun m!1314743 () Bool)

(assert (=> b!1424184 m!1314743))

(declare-fun m!1314745 () Bool)

(assert (=> b!1424182 m!1314745))

(assert (=> b!1424182 m!1314745))

(declare-fun m!1314747 () Bool)

(assert (=> b!1424182 m!1314747))

(assert (=> b!1424181 m!1314729))

(declare-fun m!1314749 () Bool)

(assert (=> b!1424181 m!1314749))

(declare-fun m!1314751 () Bool)

(assert (=> b!1424181 m!1314751))

(declare-fun m!1314753 () Bool)

(assert (=> b!1424181 m!1314753))

(assert (=> b!1424181 m!1314737))

(declare-fun m!1314755 () Bool)

(assert (=> b!1424181 m!1314755))

(declare-fun m!1314757 () Bool)

(assert (=> b!1424180 m!1314757))

(declare-fun m!1314759 () Bool)

(assert (=> b!1424176 m!1314759))

(assert (=> b!1424177 m!1314737))

(assert (=> b!1424177 m!1314737))

(declare-fun m!1314761 () Bool)

(assert (=> b!1424177 m!1314761))

(assert (=> b!1424187 m!1314737))

(assert (=> b!1424187 m!1314737))

(declare-fun m!1314763 () Bool)

(assert (=> b!1424187 m!1314763))

(assert (=> b!1424187 m!1314763))

(assert (=> b!1424187 m!1314737))

(declare-fun m!1314765 () Bool)

(assert (=> b!1424187 m!1314765))

(declare-fun m!1314767 () Bool)

(assert (=> b!1424185 m!1314767))

(assert (=> b!1424179 m!1314737))

(assert (=> b!1424179 m!1314737))

(declare-fun m!1314769 () Bool)

(assert (=> b!1424179 m!1314769))

(push 1)

