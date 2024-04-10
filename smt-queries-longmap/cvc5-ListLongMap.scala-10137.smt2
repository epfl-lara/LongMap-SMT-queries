; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119586 () Bool)

(assert start!119586)

(declare-fun b!1392971 () Bool)

(declare-fun res!932381 () Bool)

(declare-fun e!788785 () Bool)

(assert (=> b!1392971 (=> (not res!932381) (not e!788785))))

(declare-datatypes ((array!95268 0))(
  ( (array!95269 (arr!45992 (Array (_ BitVec 32) (_ BitVec 64))) (size!46542 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95268)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392971 (= res!932381 (validKeyInArray!0 (select (arr!45992 a!2901) j!112)))))

(declare-fun b!1392972 () Bool)

(declare-fun res!932383 () Bool)

(assert (=> b!1392972 (=> (not res!932383) (not e!788785))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392972 (= res!932383 (validKeyInArray!0 (select (arr!45992 a!2901) i!1037)))))

(declare-fun b!1392973 () Bool)

(declare-fun res!932382 () Bool)

(assert (=> b!1392973 (=> (not res!932382) (not e!788785))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95268 (_ BitVec 32)) Bool)

(assert (=> b!1392973 (= res!932382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392974 () Bool)

(declare-fun e!788783 () Bool)

(assert (=> b!1392974 (= e!788785 (not e!788783))))

(declare-fun res!932385 () Bool)

(assert (=> b!1392974 (=> res!932385 e!788783)))

(declare-datatypes ((SeekEntryResult!10309 0))(
  ( (MissingZero!10309 (index!43607 (_ BitVec 32))) (Found!10309 (index!43608 (_ BitVec 32))) (Intermediate!10309 (undefined!11121 Bool) (index!43609 (_ BitVec 32)) (x!125297 (_ BitVec 32))) (Undefined!10309) (MissingVacant!10309 (index!43610 (_ BitVec 32))) )
))
(declare-fun lt!611816 () SeekEntryResult!10309)

(assert (=> b!1392974 (= res!932385 (or (not (is-Intermediate!10309 lt!611816)) (undefined!11121 lt!611816)))))

(declare-fun e!788786 () Bool)

(assert (=> b!1392974 e!788786))

(declare-fun res!932380 () Bool)

(assert (=> b!1392974 (=> (not res!932380) (not e!788786))))

(assert (=> b!1392974 (= res!932380 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46622 0))(
  ( (Unit!46623) )
))
(declare-fun lt!611815 () Unit!46622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46622)

(assert (=> b!1392974 (= lt!611815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95268 (_ BitVec 32)) SeekEntryResult!10309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392974 (= lt!611816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45992 a!2901) j!112) mask!2840) (select (arr!45992 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392975 () Bool)

(assert (=> b!1392975 (= e!788783 true)))

(declare-fun lt!611817 () SeekEntryResult!10309)

(assert (=> b!1392975 (= lt!611817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45992 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45992 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95269 (store (arr!45992 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46542 a!2901)) mask!2840))))

(declare-fun b!1392976 () Bool)

(declare-fun res!932379 () Bool)

(assert (=> b!1392976 (=> (not res!932379) (not e!788785))))

(assert (=> b!1392976 (= res!932379 (and (= (size!46542 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46542 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46542 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!932384 () Bool)

(assert (=> start!119586 (=> (not res!932384) (not e!788785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119586 (= res!932384 (validMask!0 mask!2840))))

(assert (=> start!119586 e!788785))

(assert (=> start!119586 true))

(declare-fun array_inv!35020 (array!95268) Bool)

(assert (=> start!119586 (array_inv!35020 a!2901)))

(declare-fun b!1392977 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95268 (_ BitVec 32)) SeekEntryResult!10309)

(assert (=> b!1392977 (= e!788786 (= (seekEntryOrOpen!0 (select (arr!45992 a!2901) j!112) a!2901 mask!2840) (Found!10309 j!112)))))

(declare-fun b!1392978 () Bool)

(declare-fun res!932386 () Bool)

(assert (=> b!1392978 (=> (not res!932386) (not e!788785))))

(declare-datatypes ((List!32511 0))(
  ( (Nil!32508) (Cons!32507 (h!33740 (_ BitVec 64)) (t!47205 List!32511)) )
))
(declare-fun arrayNoDuplicates!0 (array!95268 (_ BitVec 32) List!32511) Bool)

(assert (=> b!1392978 (= res!932386 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32508))))

(assert (= (and start!119586 res!932384) b!1392976))

(assert (= (and b!1392976 res!932379) b!1392972))

(assert (= (and b!1392972 res!932383) b!1392971))

(assert (= (and b!1392971 res!932381) b!1392973))

(assert (= (and b!1392973 res!932382) b!1392978))

(assert (= (and b!1392978 res!932386) b!1392974))

(assert (= (and b!1392974 res!932380) b!1392977))

(assert (= (and b!1392974 (not res!932385)) b!1392975))

(declare-fun m!1278687 () Bool)

(assert (=> b!1392978 m!1278687))

(declare-fun m!1278689 () Bool)

(assert (=> b!1392973 m!1278689))

(declare-fun m!1278691 () Bool)

(assert (=> b!1392974 m!1278691))

(declare-fun m!1278693 () Bool)

(assert (=> b!1392974 m!1278693))

(assert (=> b!1392974 m!1278691))

(declare-fun m!1278695 () Bool)

(assert (=> b!1392974 m!1278695))

(assert (=> b!1392974 m!1278693))

(assert (=> b!1392974 m!1278691))

(declare-fun m!1278697 () Bool)

(assert (=> b!1392974 m!1278697))

(declare-fun m!1278699 () Bool)

(assert (=> b!1392974 m!1278699))

(declare-fun m!1278701 () Bool)

(assert (=> start!119586 m!1278701))

(declare-fun m!1278703 () Bool)

(assert (=> start!119586 m!1278703))

(declare-fun m!1278705 () Bool)

(assert (=> b!1392972 m!1278705))

(assert (=> b!1392972 m!1278705))

(declare-fun m!1278707 () Bool)

(assert (=> b!1392972 m!1278707))

(declare-fun m!1278709 () Bool)

(assert (=> b!1392975 m!1278709))

(declare-fun m!1278711 () Bool)

(assert (=> b!1392975 m!1278711))

(assert (=> b!1392975 m!1278711))

(declare-fun m!1278713 () Bool)

(assert (=> b!1392975 m!1278713))

(assert (=> b!1392975 m!1278713))

(assert (=> b!1392975 m!1278711))

(declare-fun m!1278715 () Bool)

(assert (=> b!1392975 m!1278715))

(assert (=> b!1392977 m!1278691))

(assert (=> b!1392977 m!1278691))

(declare-fun m!1278717 () Bool)

(assert (=> b!1392977 m!1278717))

(assert (=> b!1392971 m!1278691))

(assert (=> b!1392971 m!1278691))

(declare-fun m!1278719 () Bool)

(assert (=> b!1392971 m!1278719))

(push 1)

(assert (not b!1392973))

(assert (not b!1392978))

(assert (not b!1392974))

(assert (not start!119586))

(assert (not b!1392977))

(assert (not b!1392971))

(assert (not b!1392972))

(assert (not b!1392975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

