; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120620 () Bool)

(assert start!120620)

(declare-fun b!1404367 () Bool)

(declare-fun res!942880 () Bool)

(declare-fun e!795017 () Bool)

(assert (=> b!1404367 (=> (not res!942880) (not e!795017))))

(declare-datatypes ((array!96029 0))(
  ( (array!96030 (arr!46365 (Array (_ BitVec 32) (_ BitVec 64))) (size!46915 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96029)

(declare-datatypes ((List!32884 0))(
  ( (Nil!32881) (Cons!32880 (h!34128 (_ BitVec 64)) (t!47578 List!32884)) )
))
(declare-fun arrayNoDuplicates!0 (array!96029 (_ BitVec 32) List!32884) Bool)

(assert (=> b!1404367 (= res!942880 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32881))))

(declare-fun b!1404368 () Bool)

(declare-fun res!942883 () Bool)

(assert (=> b!1404368 (=> (not res!942883) (not e!795017))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96029 (_ BitVec 32)) Bool)

(assert (=> b!1404368 (= res!942883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404370 () Bool)

(assert (=> b!1404370 (= e!795017 false)))

(declare-datatypes ((SeekEntryResult!10676 0))(
  ( (MissingZero!10676 (index!45081 (_ BitVec 32))) (Found!10676 (index!45082 (_ BitVec 32))) (Intermediate!10676 (undefined!11488 Bool) (index!45083 (_ BitVec 32)) (x!126695 (_ BitVec 32))) (Undefined!10676) (MissingVacant!10676 (index!45084 (_ BitVec 32))) )
))
(declare-fun lt!618633 () SeekEntryResult!10676)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96029 (_ BitVec 32)) SeekEntryResult!10676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404370 (= lt!618633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46365 a!2901) j!112) mask!2840) (select (arr!46365 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404371 () Bool)

(declare-fun res!942878 () Bool)

(assert (=> b!1404371 (=> (not res!942878) (not e!795017))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404371 (= res!942878 (validKeyInArray!0 (select (arr!46365 a!2901) i!1037)))))

(declare-fun b!1404372 () Bool)

(declare-fun res!942881 () Bool)

(assert (=> b!1404372 (=> (not res!942881) (not e!795017))))

(assert (=> b!1404372 (= res!942881 (validKeyInArray!0 (select (arr!46365 a!2901) j!112)))))

(declare-fun res!942882 () Bool)

(assert (=> start!120620 (=> (not res!942882) (not e!795017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120620 (= res!942882 (validMask!0 mask!2840))))

(assert (=> start!120620 e!795017))

(assert (=> start!120620 true))

(declare-fun array_inv!35393 (array!96029) Bool)

(assert (=> start!120620 (array_inv!35393 a!2901)))

(declare-fun b!1404369 () Bool)

(declare-fun res!942879 () Bool)

(assert (=> b!1404369 (=> (not res!942879) (not e!795017))))

(assert (=> b!1404369 (= res!942879 (and (= (size!46915 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46915 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46915 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120620 res!942882) b!1404369))

(assert (= (and b!1404369 res!942879) b!1404371))

(assert (= (and b!1404371 res!942878) b!1404372))

(assert (= (and b!1404372 res!942881) b!1404368))

(assert (= (and b!1404368 res!942883) b!1404367))

(assert (= (and b!1404367 res!942880) b!1404370))

(declare-fun m!1293197 () Bool)

(assert (=> b!1404372 m!1293197))

(assert (=> b!1404372 m!1293197))

(declare-fun m!1293199 () Bool)

(assert (=> b!1404372 m!1293199))

(declare-fun m!1293201 () Bool)

(assert (=> start!120620 m!1293201))

(declare-fun m!1293203 () Bool)

(assert (=> start!120620 m!1293203))

(declare-fun m!1293205 () Bool)

(assert (=> b!1404367 m!1293205))

(declare-fun m!1293207 () Bool)

(assert (=> b!1404368 m!1293207))

(declare-fun m!1293209 () Bool)

(assert (=> b!1404371 m!1293209))

(assert (=> b!1404371 m!1293209))

(declare-fun m!1293211 () Bool)

(assert (=> b!1404371 m!1293211))

(assert (=> b!1404370 m!1293197))

(assert (=> b!1404370 m!1293197))

(declare-fun m!1293213 () Bool)

(assert (=> b!1404370 m!1293213))

(assert (=> b!1404370 m!1293213))

(assert (=> b!1404370 m!1293197))

(declare-fun m!1293215 () Bool)

(assert (=> b!1404370 m!1293215))

(check-sat (not start!120620) (not b!1404370) (not b!1404368) (not b!1404371) (not b!1404372) (not b!1404367))
