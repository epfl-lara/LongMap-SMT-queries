; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120580 () Bool)

(assert start!120580)

(declare-fun b!1403966 () Bool)

(declare-fun res!942531 () Bool)

(declare-fun e!794870 () Bool)

(assert (=> b!1403966 (=> (not res!942531) (not e!794870))))

(declare-datatypes ((array!95942 0))(
  ( (array!95943 (arr!46322 (Array (_ BitVec 32) (_ BitVec 64))) (size!46874 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95942)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403966 (= res!942531 (validKeyInArray!0 (select (arr!46322 a!2901) i!1037)))))

(declare-fun b!1403967 () Bool)

(declare-fun res!942529 () Bool)

(assert (=> b!1403967 (=> (not res!942529) (not e!794870))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403967 (= res!942529 (and (= (size!46874 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46874 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46874 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403969 () Bool)

(assert (=> b!1403969 (= e!794870 false)))

(declare-fun lt!618389 () Bool)

(declare-datatypes ((List!32919 0))(
  ( (Nil!32916) (Cons!32915 (h!34163 (_ BitVec 64)) (t!47605 List!32919)) )
))
(declare-fun arrayNoDuplicates!0 (array!95942 (_ BitVec 32) List!32919) Bool)

(assert (=> b!1403969 (= lt!618389 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32916))))

(declare-fun b!1403970 () Bool)

(declare-fun res!942530 () Bool)

(assert (=> b!1403970 (=> (not res!942530) (not e!794870))))

(assert (=> b!1403970 (= res!942530 (validKeyInArray!0 (select (arr!46322 a!2901) j!112)))))

(declare-fun res!942528 () Bool)

(assert (=> start!120580 (=> (not res!942528) (not e!794870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120580 (= res!942528 (validMask!0 mask!2840))))

(assert (=> start!120580 e!794870))

(assert (=> start!120580 true))

(declare-fun array_inv!35555 (array!95942) Bool)

(assert (=> start!120580 (array_inv!35555 a!2901)))

(declare-fun b!1403968 () Bool)

(declare-fun res!942532 () Bool)

(assert (=> b!1403968 (=> (not res!942532) (not e!794870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95942 (_ BitVec 32)) Bool)

(assert (=> b!1403968 (= res!942532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120580 res!942528) b!1403967))

(assert (= (and b!1403967 res!942529) b!1403966))

(assert (= (and b!1403966 res!942531) b!1403970))

(assert (= (and b!1403970 res!942530) b!1403968))

(assert (= (and b!1403968 res!942532) b!1403969))

(declare-fun m!1292315 () Bool)

(assert (=> b!1403968 m!1292315))

(declare-fun m!1292317 () Bool)

(assert (=> b!1403969 m!1292317))

(declare-fun m!1292319 () Bool)

(assert (=> b!1403970 m!1292319))

(assert (=> b!1403970 m!1292319))

(declare-fun m!1292321 () Bool)

(assert (=> b!1403970 m!1292321))

(declare-fun m!1292323 () Bool)

(assert (=> b!1403966 m!1292323))

(assert (=> b!1403966 m!1292323))

(declare-fun m!1292325 () Bool)

(assert (=> b!1403966 m!1292325))

(declare-fun m!1292327 () Bool)

(assert (=> start!120580 m!1292327))

(declare-fun m!1292329 () Bool)

(assert (=> start!120580 m!1292329))

(push 1)

(assert (not b!1403969))

(assert (not b!1403968))

(assert (not start!120580))

(assert (not b!1403970))

(assert (not b!1403966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

