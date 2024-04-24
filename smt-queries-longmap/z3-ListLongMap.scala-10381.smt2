; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122396 () Bool)

(assert start!122396)

(declare-fun b!1418833 () Bool)

(declare-fun res!953881 () Bool)

(declare-fun e!803056 () Bool)

(assert (=> b!1418833 (=> (not res!953881) (not e!803056))))

(declare-datatypes ((array!96902 0))(
  ( (array!96903 (arr!46777 (Array (_ BitVec 32) (_ BitVec 64))) (size!47328 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96902)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418833 (= res!953881 (validKeyInArray!0 (select (arr!46777 a!2831) i!982)))))

(declare-fun res!953880 () Bool)

(assert (=> start!122396 (=> (not res!953880) (not e!803056))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122396 (= res!953880 (validMask!0 mask!2608))))

(assert (=> start!122396 e!803056))

(assert (=> start!122396 true))

(declare-fun array_inv!36058 (array!96902) Bool)

(assert (=> start!122396 (array_inv!36058 a!2831)))

(declare-fun b!1418834 () Bool)

(declare-fun res!953878 () Bool)

(assert (=> b!1418834 (=> (not res!953878) (not e!803056))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418834 (= res!953878 (validKeyInArray!0 (select (arr!46777 a!2831) j!81)))))

(declare-fun b!1418835 () Bool)

(assert (=> b!1418835 (= e!803056 (bvsgt #b00000000000000000000000000000000 (size!47328 a!2831)))))

(declare-fun b!1418832 () Bool)

(declare-fun res!953879 () Bool)

(assert (=> b!1418832 (=> (not res!953879) (not e!803056))))

(assert (=> b!1418832 (= res!953879 (and (= (size!47328 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47328 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47328 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122396 res!953880) b!1418832))

(assert (= (and b!1418832 res!953879) b!1418833))

(assert (= (and b!1418833 res!953881) b!1418834))

(assert (= (and b!1418834 res!953878) b!1418835))

(declare-fun m!1309849 () Bool)

(assert (=> b!1418833 m!1309849))

(assert (=> b!1418833 m!1309849))

(declare-fun m!1309851 () Bool)

(assert (=> b!1418833 m!1309851))

(declare-fun m!1309853 () Bool)

(assert (=> start!122396 m!1309853))

(declare-fun m!1309855 () Bool)

(assert (=> start!122396 m!1309855))

(declare-fun m!1309857 () Bool)

(assert (=> b!1418834 m!1309857))

(assert (=> b!1418834 m!1309857))

(declare-fun m!1309859 () Bool)

(assert (=> b!1418834 m!1309859))

(check-sat (not b!1418834) (not b!1418833) (not start!122396))
(check-sat)
