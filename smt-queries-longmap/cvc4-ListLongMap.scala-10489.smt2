; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123514 () Bool)

(assert start!123514)

(declare-fun b!1431647 () Bool)

(declare-fun res!965522 () Bool)

(declare-fun e!808263 () Bool)

(assert (=> b!1431647 (=> (not res!965522) (not e!808263))))

(declare-datatypes ((array!97486 0))(
  ( (array!97487 (arr!47050 (Array (_ BitVec 32) (_ BitVec 64))) (size!47600 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97486)

(declare-datatypes ((List!33560 0))(
  ( (Nil!33557) (Cons!33556 (h!34879 (_ BitVec 64)) (t!48254 List!33560)) )
))
(declare-fun arrayNoDuplicates!0 (array!97486 (_ BitVec 32) List!33560) Bool)

(assert (=> b!1431647 (= res!965522 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33557))))

(declare-fun b!1431648 () Bool)

(declare-fun res!965513 () Bool)

(assert (=> b!1431648 (=> (not res!965513) (not e!808263))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431648 (= res!965513 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47600 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47600 a!2831))))))

(declare-fun b!1431649 () Bool)

(declare-fun e!808260 () Bool)

(assert (=> b!1431649 (= e!808263 e!808260)))

(declare-fun res!965524 () Bool)

(assert (=> b!1431649 (=> (not res!965524) (not e!808260))))

(declare-datatypes ((SeekEntryResult!11329 0))(
  ( (MissingZero!11329 (index!47708 (_ BitVec 32))) (Found!11329 (index!47709 (_ BitVec 32))) (Intermediate!11329 (undefined!12141 Bool) (index!47710 (_ BitVec 32)) (x!129355 (_ BitVec 32))) (Undefined!11329) (MissingVacant!11329 (index!47711 (_ BitVec 32))) )
))
(declare-fun lt!630256 () SeekEntryResult!11329)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97486 (_ BitVec 32)) SeekEntryResult!11329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431649 (= res!965524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47050 a!2831) j!81) mask!2608) (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!630256))))

(assert (=> b!1431649 (= lt!630256 (Intermediate!11329 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!965518 () Bool)

(assert (=> start!123514 (=> (not res!965518) (not e!808263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123514 (= res!965518 (validMask!0 mask!2608))))

(assert (=> start!123514 e!808263))

(assert (=> start!123514 true))

(declare-fun array_inv!36078 (array!97486) Bool)

(assert (=> start!123514 (array_inv!36078 a!2831)))

(declare-fun b!1431650 () Bool)

(declare-fun res!965521 () Bool)

(assert (=> b!1431650 (=> (not res!965521) (not e!808263))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431650 (= res!965521 (and (= (size!47600 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47600 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47600 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431651 () Bool)

(declare-fun e!808262 () Bool)

(assert (=> b!1431651 (= e!808260 e!808262)))

(declare-fun res!965516 () Bool)

(assert (=> b!1431651 (=> (not res!965516) (not e!808262))))

(declare-fun lt!630258 () SeekEntryResult!11329)

(declare-fun lt!630254 () (_ BitVec 64))

(declare-fun lt!630253 () array!97486)

(assert (=> b!1431651 (= res!965516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630254 mask!2608) lt!630254 lt!630253 mask!2608) lt!630258))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431651 (= lt!630258 (Intermediate!11329 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431651 (= lt!630254 (select (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431651 (= lt!630253 (array!97487 (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47600 a!2831)))))

(declare-fun b!1431652 () Bool)

(declare-fun res!965517 () Bool)

(assert (=> b!1431652 (=> (not res!965517) (not e!808263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431652 (= res!965517 (validKeyInArray!0 (select (arr!47050 a!2831) j!81)))))

(declare-fun b!1431653 () Bool)

(declare-fun e!808265 () Bool)

(assert (=> b!1431653 (= e!808265 true)))

(declare-fun lt!630255 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431653 (= lt!630255 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431654 () Bool)

(declare-fun res!965523 () Bool)

(assert (=> b!1431654 (=> (not res!965523) (not e!808262))))

(assert (=> b!1431654 (= res!965523 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431655 () Bool)

(assert (=> b!1431655 (= e!808262 (not e!808265))))

(declare-fun res!965520 () Bool)

(assert (=> b!1431655 (=> res!965520 e!808265)))

(assert (=> b!1431655 (= res!965520 (or (= (select (arr!47050 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47050 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47050 a!2831) index!585) (select (arr!47050 a!2831) j!81)) (= (select (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808264 () Bool)

(assert (=> b!1431655 e!808264))

(declare-fun res!965512 () Bool)

(assert (=> b!1431655 (=> (not res!965512) (not e!808264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97486 (_ BitVec 32)) Bool)

(assert (=> b!1431655 (= res!965512 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48404 0))(
  ( (Unit!48405) )
))
(declare-fun lt!630257 () Unit!48404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48404)

(assert (=> b!1431655 (= lt!630257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431656 () Bool)

(declare-fun res!965519 () Bool)

(assert (=> b!1431656 (=> (not res!965519) (not e!808263))))

(assert (=> b!1431656 (= res!965519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431657 () Bool)

(declare-fun res!965514 () Bool)

(assert (=> b!1431657 (=> (not res!965514) (not e!808262))))

(assert (=> b!1431657 (= res!965514 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630254 lt!630253 mask!2608) lt!630258))))

(declare-fun b!1431658 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97486 (_ BitVec 32)) SeekEntryResult!11329)

(assert (=> b!1431658 (= e!808264 (= (seekEntryOrOpen!0 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) (Found!11329 j!81)))))

(declare-fun b!1431659 () Bool)

(declare-fun res!965515 () Bool)

(assert (=> b!1431659 (=> (not res!965515) (not e!808263))))

(assert (=> b!1431659 (= res!965515 (validKeyInArray!0 (select (arr!47050 a!2831) i!982)))))

(declare-fun b!1431660 () Bool)

(declare-fun res!965511 () Bool)

(assert (=> b!1431660 (=> (not res!965511) (not e!808262))))

(assert (=> b!1431660 (= res!965511 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!630256))))

(assert (= (and start!123514 res!965518) b!1431650))

(assert (= (and b!1431650 res!965521) b!1431659))

(assert (= (and b!1431659 res!965515) b!1431652))

(assert (= (and b!1431652 res!965517) b!1431656))

(assert (= (and b!1431656 res!965519) b!1431647))

(assert (= (and b!1431647 res!965522) b!1431648))

(assert (= (and b!1431648 res!965513) b!1431649))

(assert (= (and b!1431649 res!965524) b!1431651))

(assert (= (and b!1431651 res!965516) b!1431660))

(assert (= (and b!1431660 res!965511) b!1431657))

(assert (= (and b!1431657 res!965514) b!1431654))

(assert (= (and b!1431654 res!965523) b!1431655))

(assert (= (and b!1431655 res!965512) b!1431658))

(assert (= (and b!1431655 (not res!965520)) b!1431653))

(declare-fun m!1321417 () Bool)

(assert (=> b!1431651 m!1321417))

(assert (=> b!1431651 m!1321417))

(declare-fun m!1321419 () Bool)

(assert (=> b!1431651 m!1321419))

(declare-fun m!1321421 () Bool)

(assert (=> b!1431651 m!1321421))

(declare-fun m!1321423 () Bool)

(assert (=> b!1431651 m!1321423))

(declare-fun m!1321425 () Bool)

(assert (=> start!123514 m!1321425))

(declare-fun m!1321427 () Bool)

(assert (=> start!123514 m!1321427))

(declare-fun m!1321429 () Bool)

(assert (=> b!1431658 m!1321429))

(assert (=> b!1431658 m!1321429))

(declare-fun m!1321431 () Bool)

(assert (=> b!1431658 m!1321431))

(declare-fun m!1321433 () Bool)

(assert (=> b!1431656 m!1321433))

(assert (=> b!1431655 m!1321421))

(declare-fun m!1321435 () Bool)

(assert (=> b!1431655 m!1321435))

(declare-fun m!1321437 () Bool)

(assert (=> b!1431655 m!1321437))

(declare-fun m!1321439 () Bool)

(assert (=> b!1431655 m!1321439))

(assert (=> b!1431655 m!1321429))

(declare-fun m!1321441 () Bool)

(assert (=> b!1431655 m!1321441))

(assert (=> b!1431649 m!1321429))

(assert (=> b!1431649 m!1321429))

(declare-fun m!1321443 () Bool)

(assert (=> b!1431649 m!1321443))

(assert (=> b!1431649 m!1321443))

(assert (=> b!1431649 m!1321429))

(declare-fun m!1321445 () Bool)

(assert (=> b!1431649 m!1321445))

(declare-fun m!1321447 () Bool)

(assert (=> b!1431659 m!1321447))

(assert (=> b!1431659 m!1321447))

(declare-fun m!1321449 () Bool)

(assert (=> b!1431659 m!1321449))

(declare-fun m!1321451 () Bool)

(assert (=> b!1431657 m!1321451))

(assert (=> b!1431652 m!1321429))

(assert (=> b!1431652 m!1321429))

(declare-fun m!1321453 () Bool)

(assert (=> b!1431652 m!1321453))

(declare-fun m!1321455 () Bool)

(assert (=> b!1431647 m!1321455))

(assert (=> b!1431660 m!1321429))

(assert (=> b!1431660 m!1321429))

(declare-fun m!1321457 () Bool)

(assert (=> b!1431660 m!1321457))

(declare-fun m!1321459 () Bool)

(assert (=> b!1431653 m!1321459))

(push 1)

