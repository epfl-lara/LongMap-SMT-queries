; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123242 () Bool)

(assert start!123242)

(declare-fun b!1428978 () Bool)

(declare-fun e!806953 () Bool)

(assert (=> b!1428978 (= e!806953 (not true))))

(declare-fun e!806954 () Bool)

(assert (=> b!1428978 e!806954))

(declare-fun res!963660 () Bool)

(assert (=> b!1428978 (=> (not res!963660) (not e!806954))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97356 0))(
  ( (array!97357 (arr!46990 (Array (_ BitVec 32) (_ BitVec 64))) (size!47542 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97356)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97356 (_ BitVec 32)) Bool)

(assert (=> b!1428978 (= res!963660 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48177 0))(
  ( (Unit!48178) )
))
(declare-fun lt!629033 () Unit!48177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48177)

(assert (=> b!1428978 (= lt!629033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428979 () Bool)

(declare-fun res!963668 () Bool)

(assert (=> b!1428979 (=> (not res!963668) (not e!806953))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428979 (= res!963668 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428980 () Bool)

(declare-fun res!963666 () Bool)

(assert (=> b!1428980 (=> (not res!963666) (not e!806953))))

(declare-datatypes ((SeekEntryResult!11296 0))(
  ( (MissingZero!11296 (index!47576 (_ BitVec 32))) (Found!11296 (index!47577 (_ BitVec 32))) (Intermediate!11296 (undefined!12108 Bool) (index!47578 (_ BitVec 32)) (x!129207 (_ BitVec 32))) (Undefined!11296) (MissingVacant!11296 (index!47579 (_ BitVec 32))) )
))
(declare-fun lt!629031 () SeekEntryResult!11296)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97356 (_ BitVec 32)) SeekEntryResult!11296)

(assert (=> b!1428980 (= res!963666 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46990 a!2831) j!81) a!2831 mask!2608) lt!629031))))

(declare-fun b!1428981 () Bool)

(declare-fun res!963665 () Bool)

(declare-fun e!806956 () Bool)

(assert (=> b!1428981 (=> (not res!963665) (not e!806956))))

(assert (=> b!1428981 (= res!963665 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47542 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47542 a!2831))))))

(declare-fun b!1428982 () Bool)

(declare-fun res!963669 () Bool)

(assert (=> b!1428982 (=> (not res!963669) (not e!806953))))

(declare-fun lt!629029 () (_ BitVec 64))

(declare-fun lt!629032 () array!97356)

(declare-fun lt!629030 () SeekEntryResult!11296)

(assert (=> b!1428982 (= res!963669 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629029 lt!629032 mask!2608) lt!629030))))

(declare-fun b!1428983 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97356 (_ BitVec 32)) SeekEntryResult!11296)

(assert (=> b!1428983 (= e!806954 (= (seekEntryOrOpen!0 (select (arr!46990 a!2831) j!81) a!2831 mask!2608) (Found!11296 j!81)))))

(declare-fun res!963662 () Bool)

(assert (=> start!123242 (=> (not res!963662) (not e!806956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123242 (= res!963662 (validMask!0 mask!2608))))

(assert (=> start!123242 e!806956))

(assert (=> start!123242 true))

(declare-fun array_inv!36223 (array!97356) Bool)

(assert (=> start!123242 (array_inv!36223 a!2831)))

(declare-fun b!1428984 () Bool)

(declare-fun res!963661 () Bool)

(assert (=> b!1428984 (=> (not res!963661) (not e!806956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428984 (= res!963661 (validKeyInArray!0 (select (arr!46990 a!2831) j!81)))))

(declare-fun b!1428985 () Bool)

(declare-fun e!806955 () Bool)

(assert (=> b!1428985 (= e!806955 e!806953)))

(declare-fun res!963670 () Bool)

(assert (=> b!1428985 (=> (not res!963670) (not e!806953))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428985 (= res!963670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629029 mask!2608) lt!629029 lt!629032 mask!2608) lt!629030))))

(assert (=> b!1428985 (= lt!629030 (Intermediate!11296 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428985 (= lt!629029 (select (store (arr!46990 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428985 (= lt!629032 (array!97357 (store (arr!46990 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47542 a!2831)))))

(declare-fun b!1428986 () Bool)

(declare-fun res!963663 () Bool)

(assert (=> b!1428986 (=> (not res!963663) (not e!806956))))

(assert (=> b!1428986 (= res!963663 (and (= (size!47542 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47542 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47542 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428987 () Bool)

(declare-fun res!963659 () Bool)

(assert (=> b!1428987 (=> (not res!963659) (not e!806956))))

(assert (=> b!1428987 (= res!963659 (validKeyInArray!0 (select (arr!46990 a!2831) i!982)))))

(declare-fun b!1428988 () Bool)

(declare-fun res!963664 () Bool)

(assert (=> b!1428988 (=> (not res!963664) (not e!806956))))

(assert (=> b!1428988 (= res!963664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428989 () Bool)

(declare-fun res!963658 () Bool)

(assert (=> b!1428989 (=> (not res!963658) (not e!806956))))

(declare-datatypes ((List!33578 0))(
  ( (Nil!33575) (Cons!33574 (h!34888 (_ BitVec 64)) (t!48264 List!33578)) )
))
(declare-fun arrayNoDuplicates!0 (array!97356 (_ BitVec 32) List!33578) Bool)

(assert (=> b!1428989 (= res!963658 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33575))))

(declare-fun b!1428990 () Bool)

(assert (=> b!1428990 (= e!806956 e!806955)))

(declare-fun res!963667 () Bool)

(assert (=> b!1428990 (=> (not res!963667) (not e!806955))))

(assert (=> b!1428990 (= res!963667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46990 a!2831) j!81) mask!2608) (select (arr!46990 a!2831) j!81) a!2831 mask!2608) lt!629031))))

(assert (=> b!1428990 (= lt!629031 (Intermediate!11296 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123242 res!963662) b!1428986))

(assert (= (and b!1428986 res!963663) b!1428987))

(assert (= (and b!1428987 res!963659) b!1428984))

(assert (= (and b!1428984 res!963661) b!1428988))

(assert (= (and b!1428988 res!963664) b!1428989))

(assert (= (and b!1428989 res!963658) b!1428981))

(assert (= (and b!1428981 res!963665) b!1428990))

(assert (= (and b!1428990 res!963667) b!1428985))

(assert (= (and b!1428985 res!963670) b!1428980))

(assert (= (and b!1428980 res!963666) b!1428982))

(assert (= (and b!1428982 res!963669) b!1428979))

(assert (= (and b!1428979 res!963668) b!1428978))

(assert (= (and b!1428978 res!963660) b!1428983))

(declare-fun m!1318617 () Bool)

(assert (=> b!1428978 m!1318617))

(declare-fun m!1318619 () Bool)

(assert (=> b!1428978 m!1318619))

(declare-fun m!1318621 () Bool)

(assert (=> b!1428985 m!1318621))

(assert (=> b!1428985 m!1318621))

(declare-fun m!1318623 () Bool)

(assert (=> b!1428985 m!1318623))

(declare-fun m!1318625 () Bool)

(assert (=> b!1428985 m!1318625))

(declare-fun m!1318627 () Bool)

(assert (=> b!1428985 m!1318627))

(declare-fun m!1318629 () Bool)

(assert (=> b!1428980 m!1318629))

(assert (=> b!1428980 m!1318629))

(declare-fun m!1318631 () Bool)

(assert (=> b!1428980 m!1318631))

(declare-fun m!1318633 () Bool)

(assert (=> start!123242 m!1318633))

(declare-fun m!1318635 () Bool)

(assert (=> start!123242 m!1318635))

(declare-fun m!1318637 () Bool)

(assert (=> b!1428988 m!1318637))

(assert (=> b!1428984 m!1318629))

(assert (=> b!1428984 m!1318629))

(declare-fun m!1318639 () Bool)

(assert (=> b!1428984 m!1318639))

(assert (=> b!1428990 m!1318629))

(assert (=> b!1428990 m!1318629))

(declare-fun m!1318641 () Bool)

(assert (=> b!1428990 m!1318641))

(assert (=> b!1428990 m!1318641))

(assert (=> b!1428990 m!1318629))

(declare-fun m!1318643 () Bool)

(assert (=> b!1428990 m!1318643))

(declare-fun m!1318645 () Bool)

(assert (=> b!1428987 m!1318645))

(assert (=> b!1428987 m!1318645))

(declare-fun m!1318647 () Bool)

(assert (=> b!1428987 m!1318647))

(declare-fun m!1318649 () Bool)

(assert (=> b!1428989 m!1318649))

(declare-fun m!1318651 () Bool)

(assert (=> b!1428982 m!1318651))

(assert (=> b!1428983 m!1318629))

(assert (=> b!1428983 m!1318629))

(declare-fun m!1318653 () Bool)

(assert (=> b!1428983 m!1318653))

(check-sat (not b!1428978) (not start!123242) (not b!1428985) (not b!1428989) (not b!1428982) (not b!1428984) (not b!1428983) (not b!1428987) (not b!1428990) (not b!1428980) (not b!1428988))
(check-sat)
