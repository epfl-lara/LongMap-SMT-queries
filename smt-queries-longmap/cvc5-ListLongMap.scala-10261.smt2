; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120618 () Bool)

(assert start!120618)

(declare-fun b!1404304 () Bool)

(declare-fun res!942867 () Bool)

(declare-fun e!794984 () Bool)

(assert (=> b!1404304 (=> (not res!942867) (not e!794984))))

(declare-datatypes ((array!95980 0))(
  ( (array!95981 (arr!46341 (Array (_ BitVec 32) (_ BitVec 64))) (size!46893 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95980)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404304 (= res!942867 (validKeyInArray!0 (select (arr!46341 a!2901) i!1037)))))

(declare-fun b!1404305 () Bool)

(declare-fun res!942870 () Bool)

(assert (=> b!1404305 (=> (not res!942870) (not e!794984))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95980 (_ BitVec 32)) Bool)

(assert (=> b!1404305 (= res!942870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404306 () Bool)

(declare-fun res!942869 () Bool)

(assert (=> b!1404306 (=> (not res!942869) (not e!794984))))

(declare-datatypes ((List!32938 0))(
  ( (Nil!32935) (Cons!32934 (h!34182 (_ BitVec 64)) (t!47624 List!32938)) )
))
(declare-fun arrayNoDuplicates!0 (array!95980 (_ BitVec 32) List!32938) Bool)

(assert (=> b!1404306 (= res!942869 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32935))))

(declare-fun b!1404307 () Bool)

(declare-fun res!942866 () Bool)

(assert (=> b!1404307 (=> (not res!942866) (not e!794984))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404307 (= res!942866 (validKeyInArray!0 (select (arr!46341 a!2901) j!112)))))

(declare-fun b!1404308 () Bool)

(declare-fun res!942868 () Bool)

(assert (=> b!1404308 (=> (not res!942868) (not e!794984))))

(assert (=> b!1404308 (= res!942868 (and (= (size!46893 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46893 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46893 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942871 () Bool)

(assert (=> start!120618 (=> (not res!942871) (not e!794984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120618 (= res!942871 (validMask!0 mask!2840))))

(assert (=> start!120618 e!794984))

(assert (=> start!120618 true))

(declare-fun array_inv!35574 (array!95980) Bool)

(assert (=> start!120618 (array_inv!35574 a!2901)))

(declare-fun b!1404309 () Bool)

(assert (=> b!1404309 (= e!794984 false)))

(declare-datatypes ((SeekEntryResult!10678 0))(
  ( (MissingZero!10678 (index!45089 (_ BitVec 32))) (Found!10678 (index!45090 (_ BitVec 32))) (Intermediate!10678 (undefined!11490 Bool) (index!45091 (_ BitVec 32)) (x!126694 (_ BitVec 32))) (Undefined!10678) (MissingVacant!10678 (index!45092 (_ BitVec 32))) )
))
(declare-fun lt!618446 () SeekEntryResult!10678)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95980 (_ BitVec 32)) SeekEntryResult!10678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404309 (= lt!618446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46341 a!2901) j!112) mask!2840) (select (arr!46341 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120618 res!942871) b!1404308))

(assert (= (and b!1404308 res!942868) b!1404304))

(assert (= (and b!1404304 res!942867) b!1404307))

(assert (= (and b!1404307 res!942866) b!1404305))

(assert (= (and b!1404305 res!942870) b!1404306))

(assert (= (and b!1404306 res!942869) b!1404309))

(declare-fun m!1292681 () Bool)

(assert (=> b!1404304 m!1292681))

(assert (=> b!1404304 m!1292681))

(declare-fun m!1292683 () Bool)

(assert (=> b!1404304 m!1292683))

(declare-fun m!1292685 () Bool)

(assert (=> b!1404305 m!1292685))

(declare-fun m!1292687 () Bool)

(assert (=> b!1404307 m!1292687))

(assert (=> b!1404307 m!1292687))

(declare-fun m!1292689 () Bool)

(assert (=> b!1404307 m!1292689))

(declare-fun m!1292691 () Bool)

(assert (=> start!120618 m!1292691))

(declare-fun m!1292693 () Bool)

(assert (=> start!120618 m!1292693))

(assert (=> b!1404309 m!1292687))

(assert (=> b!1404309 m!1292687))

(declare-fun m!1292695 () Bool)

(assert (=> b!1404309 m!1292695))

(assert (=> b!1404309 m!1292695))

(assert (=> b!1404309 m!1292687))

(declare-fun m!1292697 () Bool)

(assert (=> b!1404309 m!1292697))

(declare-fun m!1292699 () Bool)

(assert (=> b!1404306 m!1292699))

(push 1)

(assert (not b!1404309))

(assert (not b!1404304))

(assert (not b!1404307))

(assert (not start!120618))

(assert (not b!1404305))

(assert (not b!1404306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

