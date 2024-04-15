; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122180 () Bool)

(assert start!122180)

(declare-fun b!1417365 () Bool)

(declare-fun e!802174 () Bool)

(assert (=> b!1417365 (= e!802174 (not true))))

(declare-fun e!802175 () Bool)

(assert (=> b!1417365 e!802175))

(declare-fun res!953150 () Bool)

(assert (=> b!1417365 (=> (not res!953150) (not e!802175))))

(declare-datatypes ((array!96717 0))(
  ( (array!96718 (arr!46687 (Array (_ BitVec 32) (_ BitVec 64))) (size!47239 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96717)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96717 (_ BitVec 32)) Bool)

(assert (=> b!1417365 (= res!953150 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47865 0))(
  ( (Unit!47866) )
))
(declare-fun lt!625183 () Unit!47865)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47865)

(assert (=> b!1417365 (= lt!625183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11024 0))(
  ( (MissingZero!11024 (index!46488 (_ BitVec 32))) (Found!11024 (index!46489 (_ BitVec 32))) (Intermediate!11024 (undefined!11836 Bool) (index!46490 (_ BitVec 32)) (x!128088 (_ BitVec 32))) (Undefined!11024) (MissingVacant!11024 (index!46491 (_ BitVec 32))) )
))
(declare-fun lt!625184 () SeekEntryResult!11024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96717 (_ BitVec 32)) SeekEntryResult!11024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417365 (= lt!625184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46687 a!2901) j!112) mask!2840) (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417366 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96717 (_ BitVec 32)) SeekEntryResult!11024)

(assert (=> b!1417366 (= e!802175 (= (seekEntryOrOpen!0 (select (arr!46687 a!2901) j!112) a!2901 mask!2840) (Found!11024 j!112)))))

(declare-fun b!1417367 () Bool)

(declare-fun res!953147 () Bool)

(assert (=> b!1417367 (=> (not res!953147) (not e!802174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417367 (= res!953147 (validKeyInArray!0 (select (arr!46687 a!2901) j!112)))))

(declare-fun b!1417368 () Bool)

(declare-fun res!953149 () Bool)

(assert (=> b!1417368 (=> (not res!953149) (not e!802174))))

(assert (=> b!1417368 (= res!953149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417369 () Bool)

(declare-fun res!953152 () Bool)

(assert (=> b!1417369 (=> (not res!953152) (not e!802174))))

(declare-datatypes ((List!33284 0))(
  ( (Nil!33281) (Cons!33280 (h!34573 (_ BitVec 64)) (t!47970 List!33284)) )
))
(declare-fun arrayNoDuplicates!0 (array!96717 (_ BitVec 32) List!33284) Bool)

(assert (=> b!1417369 (= res!953152 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33281))))

(declare-fun b!1417370 () Bool)

(declare-fun res!953146 () Bool)

(assert (=> b!1417370 (=> (not res!953146) (not e!802174))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417370 (= res!953146 (and (= (size!47239 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47239 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47239 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!953151 () Bool)

(assert (=> start!122180 (=> (not res!953151) (not e!802174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122180 (= res!953151 (validMask!0 mask!2840))))

(assert (=> start!122180 e!802174))

(assert (=> start!122180 true))

(declare-fun array_inv!35920 (array!96717) Bool)

(assert (=> start!122180 (array_inv!35920 a!2901)))

(declare-fun b!1417371 () Bool)

(declare-fun res!953148 () Bool)

(assert (=> b!1417371 (=> (not res!953148) (not e!802174))))

(assert (=> b!1417371 (= res!953148 (validKeyInArray!0 (select (arr!46687 a!2901) i!1037)))))

(assert (= (and start!122180 res!953151) b!1417370))

(assert (= (and b!1417370 res!953146) b!1417371))

(assert (= (and b!1417371 res!953148) b!1417367))

(assert (= (and b!1417367 res!953147) b!1417368))

(assert (= (and b!1417368 res!953149) b!1417369))

(assert (= (and b!1417369 res!953152) b!1417365))

(assert (= (and b!1417365 res!953150) b!1417366))

(declare-fun m!1307629 () Bool)

(assert (=> b!1417365 m!1307629))

(declare-fun m!1307631 () Bool)

(assert (=> b!1417365 m!1307631))

(assert (=> b!1417365 m!1307629))

(declare-fun m!1307633 () Bool)

(assert (=> b!1417365 m!1307633))

(assert (=> b!1417365 m!1307631))

(assert (=> b!1417365 m!1307629))

(declare-fun m!1307635 () Bool)

(assert (=> b!1417365 m!1307635))

(declare-fun m!1307637 () Bool)

(assert (=> b!1417365 m!1307637))

(declare-fun m!1307639 () Bool)

(assert (=> b!1417371 m!1307639))

(assert (=> b!1417371 m!1307639))

(declare-fun m!1307641 () Bool)

(assert (=> b!1417371 m!1307641))

(assert (=> b!1417367 m!1307629))

(assert (=> b!1417367 m!1307629))

(declare-fun m!1307643 () Bool)

(assert (=> b!1417367 m!1307643))

(declare-fun m!1307645 () Bool)

(assert (=> b!1417369 m!1307645))

(assert (=> b!1417366 m!1307629))

(assert (=> b!1417366 m!1307629))

(declare-fun m!1307647 () Bool)

(assert (=> b!1417366 m!1307647))

(declare-fun m!1307649 () Bool)

(assert (=> start!122180 m!1307649))

(declare-fun m!1307651 () Bool)

(assert (=> start!122180 m!1307651))

(declare-fun m!1307653 () Bool)

(assert (=> b!1417368 m!1307653))

(check-sat (not b!1417368) (not b!1417365) (not b!1417367) (not b!1417366) (not b!1417371) (not b!1417369) (not start!122180))
(check-sat)
