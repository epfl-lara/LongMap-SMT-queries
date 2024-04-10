; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123526 () Bool)

(assert start!123526)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97498 0))(
  ( (array!97499 (arr!47056 (Array (_ BitVec 32) (_ BitVec 64))) (size!47606 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97498)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun e!808371 () Bool)

(declare-fun b!1431899 () Bool)

(declare-datatypes ((SeekEntryResult!11335 0))(
  ( (MissingZero!11335 (index!47732 (_ BitVec 32))) (Found!11335 (index!47733 (_ BitVec 32))) (Intermediate!11335 (undefined!12147 Bool) (index!47734 (_ BitVec 32)) (x!129377 (_ BitVec 32))) (Undefined!11335) (MissingVacant!11335 (index!47735 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97498 (_ BitVec 32)) SeekEntryResult!11335)

(assert (=> b!1431899 (= e!808371 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) (Found!11335 j!81)))))

(declare-fun b!1431900 () Bool)

(declare-fun e!808368 () Bool)

(assert (=> b!1431900 (= e!808368 true)))

(declare-fun lt!630361 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431900 (= lt!630361 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431901 () Bool)

(declare-fun e!808370 () Bool)

(declare-fun e!808373 () Bool)

(assert (=> b!1431901 (= e!808370 e!808373)))

(declare-fun res!965766 () Bool)

(assert (=> b!1431901 (=> (not res!965766) (not e!808373))))

(declare-fun lt!630365 () array!97498)

(declare-fun lt!630362 () SeekEntryResult!11335)

(declare-fun lt!630363 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97498 (_ BitVec 32)) SeekEntryResult!11335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431901 (= res!965766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630363 mask!2608) lt!630363 lt!630365 mask!2608) lt!630362))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431901 (= lt!630362 (Intermediate!11335 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431901 (= lt!630363 (select (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431901 (= lt!630365 (array!97499 (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47606 a!2831)))))

(declare-fun b!1431902 () Bool)

(declare-fun e!808372 () Bool)

(assert (=> b!1431902 (= e!808372 e!808370)))

(declare-fun res!965773 () Bool)

(assert (=> b!1431902 (=> (not res!965773) (not e!808370))))

(declare-fun lt!630366 () SeekEntryResult!11335)

(assert (=> b!1431902 (= res!965773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630366))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431902 (= lt!630366 (Intermediate!11335 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431903 () Bool)

(declare-fun res!965776 () Bool)

(assert (=> b!1431903 (=> (not res!965776) (not e!808372))))

(assert (=> b!1431903 (= res!965776 (and (= (size!47606 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47606 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47606 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431905 () Bool)

(declare-fun res!965772 () Bool)

(assert (=> b!1431905 (=> (not res!965772) (not e!808373))))

(assert (=> b!1431905 (= res!965772 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431906 () Bool)

(declare-fun res!965774 () Bool)

(assert (=> b!1431906 (=> (not res!965774) (not e!808372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97498 (_ BitVec 32)) Bool)

(assert (=> b!1431906 (= res!965774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431907 () Bool)

(declare-fun res!965770 () Bool)

(assert (=> b!1431907 (=> (not res!965770) (not e!808372))))

(assert (=> b!1431907 (= res!965770 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47606 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47606 a!2831))))))

(declare-fun b!1431908 () Bool)

(declare-fun res!965771 () Bool)

(assert (=> b!1431908 (=> (not res!965771) (not e!808373))))

(assert (=> b!1431908 (= res!965771 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!630366))))

(declare-fun b!1431909 () Bool)

(declare-fun res!965768 () Bool)

(assert (=> b!1431909 (=> (not res!965768) (not e!808373))))

(assert (=> b!1431909 (= res!965768 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630363 lt!630365 mask!2608) lt!630362))))

(declare-fun b!1431910 () Bool)

(declare-fun res!965765 () Bool)

(assert (=> b!1431910 (=> (not res!965765) (not e!808372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431910 (= res!965765 (validKeyInArray!0 (select (arr!47056 a!2831) j!81)))))

(declare-fun b!1431904 () Bool)

(declare-fun res!965764 () Bool)

(assert (=> b!1431904 (=> (not res!965764) (not e!808372))))

(assert (=> b!1431904 (= res!965764 (validKeyInArray!0 (select (arr!47056 a!2831) i!982)))))

(declare-fun res!965767 () Bool)

(assert (=> start!123526 (=> (not res!965767) (not e!808372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123526 (= res!965767 (validMask!0 mask!2608))))

(assert (=> start!123526 e!808372))

(assert (=> start!123526 true))

(declare-fun array_inv!36084 (array!97498) Bool)

(assert (=> start!123526 (array_inv!36084 a!2831)))

(declare-fun b!1431911 () Bool)

(assert (=> b!1431911 (= e!808373 (not e!808368))))

(declare-fun res!965769 () Bool)

(assert (=> b!1431911 (=> res!965769 e!808368)))

(assert (=> b!1431911 (= res!965769 (or (= (select (arr!47056 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47056 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47056 a!2831) index!585) (select (arr!47056 a!2831) j!81)) (= (select (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1431911 e!808371))

(declare-fun res!965763 () Bool)

(assert (=> b!1431911 (=> (not res!965763) (not e!808371))))

(assert (=> b!1431911 (= res!965763 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48416 0))(
  ( (Unit!48417) )
))
(declare-fun lt!630364 () Unit!48416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48416)

(assert (=> b!1431911 (= lt!630364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431912 () Bool)

(declare-fun res!965775 () Bool)

(assert (=> b!1431912 (=> (not res!965775) (not e!808372))))

(declare-datatypes ((List!33566 0))(
  ( (Nil!33563) (Cons!33562 (h!34885 (_ BitVec 64)) (t!48260 List!33566)) )
))
(declare-fun arrayNoDuplicates!0 (array!97498 (_ BitVec 32) List!33566) Bool)

(assert (=> b!1431912 (= res!965775 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33563))))

(assert (= (and start!123526 res!965767) b!1431903))

(assert (= (and b!1431903 res!965776) b!1431904))

(assert (= (and b!1431904 res!965764) b!1431910))

(assert (= (and b!1431910 res!965765) b!1431906))

(assert (= (and b!1431906 res!965774) b!1431912))

(assert (= (and b!1431912 res!965775) b!1431907))

(assert (= (and b!1431907 res!965770) b!1431902))

(assert (= (and b!1431902 res!965773) b!1431901))

(assert (= (and b!1431901 res!965766) b!1431908))

(assert (= (and b!1431908 res!965771) b!1431909))

(assert (= (and b!1431909 res!965768) b!1431905))

(assert (= (and b!1431905 res!965772) b!1431911))

(assert (= (and b!1431911 res!965763) b!1431899))

(assert (= (and b!1431911 (not res!965769)) b!1431900))

(declare-fun m!1321681 () Bool)

(assert (=> b!1431900 m!1321681))

(declare-fun m!1321683 () Bool)

(assert (=> b!1431899 m!1321683))

(assert (=> b!1431899 m!1321683))

(declare-fun m!1321685 () Bool)

(assert (=> b!1431899 m!1321685))

(assert (=> b!1431902 m!1321683))

(assert (=> b!1431902 m!1321683))

(declare-fun m!1321687 () Bool)

(assert (=> b!1431902 m!1321687))

(assert (=> b!1431902 m!1321687))

(assert (=> b!1431902 m!1321683))

(declare-fun m!1321689 () Bool)

(assert (=> b!1431902 m!1321689))

(declare-fun m!1321691 () Bool)

(assert (=> b!1431901 m!1321691))

(assert (=> b!1431901 m!1321691))

(declare-fun m!1321693 () Bool)

(assert (=> b!1431901 m!1321693))

(declare-fun m!1321695 () Bool)

(assert (=> b!1431901 m!1321695))

(declare-fun m!1321697 () Bool)

(assert (=> b!1431901 m!1321697))

(declare-fun m!1321699 () Bool)

(assert (=> b!1431904 m!1321699))

(assert (=> b!1431904 m!1321699))

(declare-fun m!1321701 () Bool)

(assert (=> b!1431904 m!1321701))

(declare-fun m!1321703 () Bool)

(assert (=> b!1431906 m!1321703))

(assert (=> b!1431910 m!1321683))

(assert (=> b!1431910 m!1321683))

(declare-fun m!1321705 () Bool)

(assert (=> b!1431910 m!1321705))

(declare-fun m!1321707 () Bool)

(assert (=> b!1431909 m!1321707))

(assert (=> b!1431908 m!1321683))

(assert (=> b!1431908 m!1321683))

(declare-fun m!1321709 () Bool)

(assert (=> b!1431908 m!1321709))

(assert (=> b!1431911 m!1321695))

(declare-fun m!1321711 () Bool)

(assert (=> b!1431911 m!1321711))

(declare-fun m!1321713 () Bool)

(assert (=> b!1431911 m!1321713))

(declare-fun m!1321715 () Bool)

(assert (=> b!1431911 m!1321715))

(assert (=> b!1431911 m!1321683))

(declare-fun m!1321717 () Bool)

(assert (=> b!1431911 m!1321717))

(declare-fun m!1321719 () Bool)

(assert (=> b!1431912 m!1321719))

(declare-fun m!1321721 () Bool)

(assert (=> start!123526 m!1321721))

(declare-fun m!1321723 () Bool)

(assert (=> start!123526 m!1321723))

(push 1)

