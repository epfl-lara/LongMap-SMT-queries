; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120500 () Bool)

(assert start!120500)

(declare-fun b!1403126 () Bool)

(declare-fun res!941643 () Bool)

(declare-fun e!794486 () Bool)

(assert (=> b!1403126 (=> (not res!941643) (not e!794486))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95909 0))(
  ( (array!95910 (arr!46305 (Array (_ BitVec 32) (_ BitVec 64))) (size!46855 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95909)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403126 (= res!941643 (and (= (size!46855 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46855 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46855 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403127 () Bool)

(declare-fun res!941638 () Bool)

(assert (=> b!1403127 (=> (not res!941638) (not e!794486))))

(declare-datatypes ((List!32824 0))(
  ( (Nil!32821) (Cons!32820 (h!34068 (_ BitVec 64)) (t!47518 List!32824)) )
))
(declare-fun arrayNoDuplicates!0 (array!95909 (_ BitVec 32) List!32824) Bool)

(assert (=> b!1403127 (= res!941638 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32821))))

(declare-fun b!1403128 () Bool)

(declare-fun res!941640 () Bool)

(assert (=> b!1403128 (=> (not res!941640) (not e!794486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403128 (= res!941640 (validKeyInArray!0 (select (arr!46305 a!2901) i!1037)))))

(declare-fun e!794487 () Bool)

(declare-fun b!1403129 () Bool)

(declare-datatypes ((SeekEntryResult!10622 0))(
  ( (MissingZero!10622 (index!44865 (_ BitVec 32))) (Found!10622 (index!44866 (_ BitVec 32))) (Intermediate!10622 (undefined!11434 Bool) (index!44867 (_ BitVec 32)) (x!126481 (_ BitVec 32))) (Undefined!10622) (MissingVacant!10622 (index!44868 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95909 (_ BitVec 32)) SeekEntryResult!10622)

(assert (=> b!1403129 (= e!794487 (= (seekEntryOrOpen!0 (select (arr!46305 a!2901) j!112) a!2901 mask!2840) (Found!10622 j!112)))))

(declare-fun res!941637 () Bool)

(assert (=> start!120500 (=> (not res!941637) (not e!794486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120500 (= res!941637 (validMask!0 mask!2840))))

(assert (=> start!120500 e!794486))

(assert (=> start!120500 true))

(declare-fun array_inv!35333 (array!95909) Bool)

(assert (=> start!120500 (array_inv!35333 a!2901)))

(declare-fun b!1403130 () Bool)

(declare-fun res!941641 () Bool)

(assert (=> b!1403130 (=> (not res!941641) (not e!794486))))

(assert (=> b!1403130 (= res!941641 (validKeyInArray!0 (select (arr!46305 a!2901) j!112)))))

(declare-fun b!1403131 () Bool)

(declare-fun e!794488 () Bool)

(assert (=> b!1403131 (= e!794488 true)))

(declare-fun lt!618284 () SeekEntryResult!10622)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95909 (_ BitVec 32)) SeekEntryResult!10622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403131 (= lt!618284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46305 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46305 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95910 (store (arr!46305 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46855 a!2901)) mask!2840))))

(declare-fun b!1403132 () Bool)

(assert (=> b!1403132 (= e!794486 (not e!794488))))

(declare-fun res!941642 () Bool)

(assert (=> b!1403132 (=> res!941642 e!794488)))

(declare-fun lt!618283 () SeekEntryResult!10622)

(get-info :version)

(assert (=> b!1403132 (= res!941642 (or (not ((_ is Intermediate!10622) lt!618283)) (undefined!11434 lt!618283)))))

(assert (=> b!1403132 e!794487))

(declare-fun res!941639 () Bool)

(assert (=> b!1403132 (=> (not res!941639) (not e!794487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95909 (_ BitVec 32)) Bool)

(assert (=> b!1403132 (= res!941639 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47248 0))(
  ( (Unit!47249) )
))
(declare-fun lt!618285 () Unit!47248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47248)

(assert (=> b!1403132 (= lt!618285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403132 (= lt!618283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46305 a!2901) j!112) mask!2840) (select (arr!46305 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403133 () Bool)

(declare-fun res!941644 () Bool)

(assert (=> b!1403133 (=> (not res!941644) (not e!794486))))

(assert (=> b!1403133 (= res!941644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120500 res!941637) b!1403126))

(assert (= (and b!1403126 res!941643) b!1403128))

(assert (= (and b!1403128 res!941640) b!1403130))

(assert (= (and b!1403130 res!941641) b!1403133))

(assert (= (and b!1403133 res!941644) b!1403127))

(assert (= (and b!1403127 res!941638) b!1403132))

(assert (= (and b!1403132 res!941639) b!1403129))

(assert (= (and b!1403132 (not res!941642)) b!1403131))

(declare-fun m!1291633 () Bool)

(assert (=> b!1403129 m!1291633))

(assert (=> b!1403129 m!1291633))

(declare-fun m!1291635 () Bool)

(assert (=> b!1403129 m!1291635))

(declare-fun m!1291637 () Bool)

(assert (=> b!1403131 m!1291637))

(declare-fun m!1291639 () Bool)

(assert (=> b!1403131 m!1291639))

(assert (=> b!1403131 m!1291639))

(declare-fun m!1291641 () Bool)

(assert (=> b!1403131 m!1291641))

(assert (=> b!1403131 m!1291641))

(assert (=> b!1403131 m!1291639))

(declare-fun m!1291643 () Bool)

(assert (=> b!1403131 m!1291643))

(assert (=> b!1403132 m!1291633))

(declare-fun m!1291645 () Bool)

(assert (=> b!1403132 m!1291645))

(assert (=> b!1403132 m!1291633))

(declare-fun m!1291647 () Bool)

(assert (=> b!1403132 m!1291647))

(assert (=> b!1403132 m!1291645))

(assert (=> b!1403132 m!1291633))

(declare-fun m!1291649 () Bool)

(assert (=> b!1403132 m!1291649))

(declare-fun m!1291651 () Bool)

(assert (=> b!1403132 m!1291651))

(declare-fun m!1291653 () Bool)

(assert (=> b!1403128 m!1291653))

(assert (=> b!1403128 m!1291653))

(declare-fun m!1291655 () Bool)

(assert (=> b!1403128 m!1291655))

(assert (=> b!1403130 m!1291633))

(assert (=> b!1403130 m!1291633))

(declare-fun m!1291657 () Bool)

(assert (=> b!1403130 m!1291657))

(declare-fun m!1291659 () Bool)

(assert (=> b!1403133 m!1291659))

(declare-fun m!1291661 () Bool)

(assert (=> b!1403127 m!1291661))

(declare-fun m!1291663 () Bool)

(assert (=> start!120500 m!1291663))

(declare-fun m!1291665 () Bool)

(assert (=> start!120500 m!1291665))

(check-sat (not b!1403132) (not b!1403133) (not start!120500) (not b!1403127) (not b!1403131) (not b!1403130) (not b!1403128) (not b!1403129))
