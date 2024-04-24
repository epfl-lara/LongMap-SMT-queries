; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122840 () Bool)

(assert start!122840)

(declare-fun b!1421883 () Bool)

(declare-fun res!956632 () Bool)

(declare-fun e!804221 () Bool)

(assert (=> b!1421883 (=> (not res!956632) (not e!804221))))

(declare-datatypes ((array!97127 0))(
  ( (array!97128 (arr!46879 (Array (_ BitVec 32) (_ BitVec 64))) (size!47430 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97127)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421883 (= res!956632 (and (= (size!47430 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47430 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47430 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421884 () Bool)

(declare-fun res!956641 () Bool)

(declare-fun e!804218 () Bool)

(assert (=> b!1421884 (=> (not res!956641) (not e!804218))))

(declare-datatypes ((SeekEntryResult!11066 0))(
  ( (MissingZero!11066 (index!46656 (_ BitVec 32))) (Found!11066 (index!46657 (_ BitVec 32))) (Intermediate!11066 (undefined!11878 Bool) (index!46658 (_ BitVec 32)) (x!128471 (_ BitVec 32))) (Undefined!11066) (MissingVacant!11066 (index!46659 (_ BitVec 32))) )
))
(declare-fun lt!626378 () SeekEntryResult!11066)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97127 (_ BitVec 32)) SeekEntryResult!11066)

(assert (=> b!1421884 (= res!956641 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!626378))))

(declare-fun b!1421885 () Bool)

(declare-fun e!804220 () Bool)

(assert (=> b!1421885 (= e!804221 e!804220)))

(declare-fun res!956638 () Bool)

(assert (=> b!1421885 (=> (not res!956638) (not e!804220))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421885 (= res!956638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46879 a!2831) j!81) mask!2608) (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!626378))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421885 (= lt!626378 (Intermediate!11066 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421886 () Bool)

(declare-fun res!956640 () Bool)

(assert (=> b!1421886 (=> (not res!956640) (not e!804221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97127 (_ BitVec 32)) Bool)

(assert (=> b!1421886 (= res!956640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421888 () Bool)

(declare-fun res!956634 () Bool)

(assert (=> b!1421888 (=> (not res!956634) (not e!804221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421888 (= res!956634 (validKeyInArray!0 (select (arr!46879 a!2831) i!982)))))

(declare-fun b!1421889 () Bool)

(declare-fun res!956633 () Bool)

(assert (=> b!1421889 (=> (not res!956633) (not e!804221))))

(assert (=> b!1421889 (= res!956633 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47430 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47430 a!2831))))))

(declare-fun b!1421890 () Bool)

(assert (=> b!1421890 (= e!804220 e!804218)))

(declare-fun res!956635 () Bool)

(assert (=> b!1421890 (=> (not res!956635) (not e!804218))))

(declare-fun lt!626379 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626380 () array!97127)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421890 (= res!956635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626379 mask!2608) lt!626379 lt!626380 mask!2608) (Intermediate!11066 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1421890 (= lt!626379 (select (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421890 (= lt!626380 (array!97128 (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47430 a!2831)))))

(declare-fun res!956636 () Bool)

(assert (=> start!122840 (=> (not res!956636) (not e!804221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122840 (= res!956636 (validMask!0 mask!2608))))

(assert (=> start!122840 e!804221))

(assert (=> start!122840 true))

(declare-fun array_inv!36160 (array!97127) Bool)

(assert (=> start!122840 (array_inv!36160 a!2831)))

(declare-fun b!1421887 () Bool)

(declare-fun res!956637 () Bool)

(assert (=> b!1421887 (=> (not res!956637) (not e!804221))))

(assert (=> b!1421887 (= res!956637 (validKeyInArray!0 (select (arr!46879 a!2831) j!81)))))

(declare-fun b!1421891 () Bool)

(assert (=> b!1421891 (= e!804218 false)))

(declare-fun lt!626381 () SeekEntryResult!11066)

(assert (=> b!1421891 (= lt!626381 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626379 lt!626380 mask!2608))))

(declare-fun b!1421892 () Bool)

(declare-fun res!956639 () Bool)

(assert (=> b!1421892 (=> (not res!956639) (not e!804221))))

(declare-datatypes ((List!33376 0))(
  ( (Nil!33373) (Cons!33372 (h!34682 (_ BitVec 64)) (t!48062 List!33376)) )
))
(declare-fun arrayNoDuplicates!0 (array!97127 (_ BitVec 32) List!33376) Bool)

(assert (=> b!1421892 (= res!956639 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33373))))

(assert (= (and start!122840 res!956636) b!1421883))

(assert (= (and b!1421883 res!956632) b!1421888))

(assert (= (and b!1421888 res!956634) b!1421887))

(assert (= (and b!1421887 res!956637) b!1421886))

(assert (= (and b!1421886 res!956640) b!1421892))

(assert (= (and b!1421892 res!956639) b!1421889))

(assert (= (and b!1421889 res!956633) b!1421885))

(assert (= (and b!1421885 res!956638) b!1421890))

(assert (= (and b!1421890 res!956635) b!1421884))

(assert (= (and b!1421884 res!956641) b!1421891))

(declare-fun m!1312635 () Bool)

(assert (=> start!122840 m!1312635))

(declare-fun m!1312637 () Bool)

(assert (=> start!122840 m!1312637))

(declare-fun m!1312639 () Bool)

(assert (=> b!1421887 m!1312639))

(assert (=> b!1421887 m!1312639))

(declare-fun m!1312641 () Bool)

(assert (=> b!1421887 m!1312641))

(assert (=> b!1421884 m!1312639))

(assert (=> b!1421884 m!1312639))

(declare-fun m!1312643 () Bool)

(assert (=> b!1421884 m!1312643))

(declare-fun m!1312645 () Bool)

(assert (=> b!1421892 m!1312645))

(assert (=> b!1421885 m!1312639))

(assert (=> b!1421885 m!1312639))

(declare-fun m!1312647 () Bool)

(assert (=> b!1421885 m!1312647))

(assert (=> b!1421885 m!1312647))

(assert (=> b!1421885 m!1312639))

(declare-fun m!1312649 () Bool)

(assert (=> b!1421885 m!1312649))

(declare-fun m!1312651 () Bool)

(assert (=> b!1421886 m!1312651))

(declare-fun m!1312653 () Bool)

(assert (=> b!1421891 m!1312653))

(declare-fun m!1312655 () Bool)

(assert (=> b!1421890 m!1312655))

(assert (=> b!1421890 m!1312655))

(declare-fun m!1312657 () Bool)

(assert (=> b!1421890 m!1312657))

(declare-fun m!1312659 () Bool)

(assert (=> b!1421890 m!1312659))

(declare-fun m!1312661 () Bool)

(assert (=> b!1421890 m!1312661))

(declare-fun m!1312663 () Bool)

(assert (=> b!1421888 m!1312663))

(assert (=> b!1421888 m!1312663))

(declare-fun m!1312665 () Bool)

(assert (=> b!1421888 m!1312665))

(check-sat (not b!1421891) (not b!1421890) (not b!1421886) (not b!1421884) (not b!1421892) (not start!122840) (not b!1421888) (not b!1421887) (not b!1421885))
(check-sat)
