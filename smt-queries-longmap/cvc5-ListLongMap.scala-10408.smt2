; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122610 () Bool)

(assert start!122610)

(declare-fun b!1420129 () Bool)

(declare-fun res!955564 () Bool)

(declare-fun e!803305 () Bool)

(assert (=> b!1420129 (=> (not res!955564) (not e!803305))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96975 0))(
  ( (array!96976 (arr!46805 (Array (_ BitVec 32) (_ BitVec 64))) (size!47355 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96975)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420129 (= res!955564 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47355 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47355 a!2831))))))

(declare-fun b!1420130 () Bool)

(assert (=> b!1420130 (= e!803305 false)))

(declare-datatypes ((SeekEntryResult!11090 0))(
  ( (MissingZero!11090 (index!46752 (_ BitVec 32))) (Found!11090 (index!46753 (_ BitVec 32))) (Intermediate!11090 (undefined!11902 Bool) (index!46754 (_ BitVec 32)) (x!128420 (_ BitVec 32))) (Undefined!11090) (MissingVacant!11090 (index!46755 (_ BitVec 32))) )
))
(declare-fun lt!625884 () SeekEntryResult!11090)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96975 (_ BitVec 32)) SeekEntryResult!11090)

(assert (=> b!1420130 (= lt!625884 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46805 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420131 () Bool)

(declare-fun res!955566 () Bool)

(assert (=> b!1420131 (=> (not res!955566) (not e!803305))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420131 (= res!955566 (and (= (size!47355 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47355 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47355 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420132 () Bool)

(declare-fun res!955563 () Bool)

(assert (=> b!1420132 (=> (not res!955563) (not e!803305))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420132 (= res!955563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46805 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46805 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96976 (store (arr!46805 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47355 a!2831)) mask!2608) (Intermediate!11090 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420133 () Bool)

(declare-fun res!955568 () Bool)

(assert (=> b!1420133 (=> (not res!955568) (not e!803305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420133 (= res!955568 (validKeyInArray!0 (select (arr!46805 a!2831) i!982)))))

(declare-fun b!1420134 () Bool)

(declare-fun res!955569 () Bool)

(assert (=> b!1420134 (=> (not res!955569) (not e!803305))))

(assert (=> b!1420134 (= res!955569 (validKeyInArray!0 (select (arr!46805 a!2831) j!81)))))

(declare-fun res!955562 () Bool)

(assert (=> start!122610 (=> (not res!955562) (not e!803305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122610 (= res!955562 (validMask!0 mask!2608))))

(assert (=> start!122610 e!803305))

(assert (=> start!122610 true))

(declare-fun array_inv!35833 (array!96975) Bool)

(assert (=> start!122610 (array_inv!35833 a!2831)))

(declare-fun b!1420135 () Bool)

(declare-fun res!955565 () Bool)

(assert (=> b!1420135 (=> (not res!955565) (not e!803305))))

(assert (=> b!1420135 (= res!955565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46805 a!2831) j!81) mask!2608) (select (arr!46805 a!2831) j!81) a!2831 mask!2608) (Intermediate!11090 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420136 () Bool)

(declare-fun res!955570 () Bool)

(assert (=> b!1420136 (=> (not res!955570) (not e!803305))))

(declare-datatypes ((List!33315 0))(
  ( (Nil!33312) (Cons!33311 (h!34613 (_ BitVec 64)) (t!48009 List!33315)) )
))
(declare-fun arrayNoDuplicates!0 (array!96975 (_ BitVec 32) List!33315) Bool)

(assert (=> b!1420136 (= res!955570 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33312))))

(declare-fun b!1420137 () Bool)

(declare-fun res!955567 () Bool)

(assert (=> b!1420137 (=> (not res!955567) (not e!803305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96975 (_ BitVec 32)) Bool)

(assert (=> b!1420137 (= res!955567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122610 res!955562) b!1420131))

(assert (= (and b!1420131 res!955566) b!1420133))

(assert (= (and b!1420133 res!955568) b!1420134))

(assert (= (and b!1420134 res!955569) b!1420137))

(assert (= (and b!1420137 res!955567) b!1420136))

(assert (= (and b!1420136 res!955570) b!1420129))

(assert (= (and b!1420129 res!955564) b!1420135))

(assert (= (and b!1420135 res!955565) b!1420132))

(assert (= (and b!1420132 res!955563) b!1420130))

(declare-fun m!1310625 () Bool)

(assert (=> b!1420136 m!1310625))

(declare-fun m!1310627 () Bool)

(assert (=> b!1420137 m!1310627))

(declare-fun m!1310629 () Bool)

(assert (=> b!1420132 m!1310629))

(declare-fun m!1310631 () Bool)

(assert (=> b!1420132 m!1310631))

(assert (=> b!1420132 m!1310631))

(declare-fun m!1310633 () Bool)

(assert (=> b!1420132 m!1310633))

(assert (=> b!1420132 m!1310633))

(assert (=> b!1420132 m!1310631))

(declare-fun m!1310635 () Bool)

(assert (=> b!1420132 m!1310635))

(declare-fun m!1310637 () Bool)

(assert (=> b!1420133 m!1310637))

(assert (=> b!1420133 m!1310637))

(declare-fun m!1310639 () Bool)

(assert (=> b!1420133 m!1310639))

(declare-fun m!1310641 () Bool)

(assert (=> b!1420134 m!1310641))

(assert (=> b!1420134 m!1310641))

(declare-fun m!1310643 () Bool)

(assert (=> b!1420134 m!1310643))

(declare-fun m!1310645 () Bool)

(assert (=> start!122610 m!1310645))

(declare-fun m!1310647 () Bool)

(assert (=> start!122610 m!1310647))

(assert (=> b!1420130 m!1310641))

(assert (=> b!1420130 m!1310641))

(declare-fun m!1310649 () Bool)

(assert (=> b!1420130 m!1310649))

(assert (=> b!1420135 m!1310641))

(assert (=> b!1420135 m!1310641))

(declare-fun m!1310651 () Bool)

(assert (=> b!1420135 m!1310651))

(assert (=> b!1420135 m!1310651))

(assert (=> b!1420135 m!1310641))

(declare-fun m!1310653 () Bool)

(assert (=> b!1420135 m!1310653))

(push 1)

(assert (not b!1420132))

(assert (not b!1420134))

(assert (not b!1420135))

(assert (not b!1420137))

(assert (not start!122610))

(assert (not b!1420136))

(assert (not b!1420133))

(assert (not b!1420130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

