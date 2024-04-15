; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119652 () Bool)

(assert start!119652)

(declare-fun b!1393730 () Bool)

(declare-fun e!789167 () Bool)

(declare-fun e!789166 () Bool)

(assert (=> b!1393730 (= e!789167 (not e!789166))))

(declare-fun res!933191 () Bool)

(assert (=> b!1393730 (=> res!933191 e!789166)))

(declare-datatypes ((SeekEntryResult!10345 0))(
  ( (MissingZero!10345 (index!43751 (_ BitVec 32))) (Found!10345 (index!43752 (_ BitVec 32))) (Intermediate!10345 (undefined!11157 Bool) (index!43753 (_ BitVec 32)) (x!125418 (_ BitVec 32))) (Undefined!10345) (MissingVacant!10345 (index!43754 (_ BitVec 32))) )
))
(declare-fun lt!611942 () SeekEntryResult!10345)

(assert (=> b!1393730 (= res!933191 (or (not (is-Intermediate!10345 lt!611942)) (undefined!11157 lt!611942)))))

(declare-fun e!789164 () Bool)

(assert (=> b!1393730 e!789164))

(declare-fun res!933194 () Bool)

(assert (=> b!1393730 (=> (not res!933194) (not e!789164))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95287 0))(
  ( (array!95288 (arr!46002 (Array (_ BitVec 32) (_ BitVec 64))) (size!46554 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95287)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95287 (_ BitVec 32)) Bool)

(assert (=> b!1393730 (= res!933194 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46537 0))(
  ( (Unit!46538) )
))
(declare-fun lt!611941 () Unit!46537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46537)

(assert (=> b!1393730 (= lt!611941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95287 (_ BitVec 32)) SeekEntryResult!10345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393730 (= lt!611942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46002 a!2901) j!112) mask!2840) (select (arr!46002 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393731 () Bool)

(declare-fun res!933192 () Bool)

(assert (=> b!1393731 (=> (not res!933192) (not e!789167))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393731 (= res!933192 (and (= (size!46554 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46554 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46554 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393732 () Bool)

(declare-fun res!933193 () Bool)

(assert (=> b!1393732 (=> (not res!933193) (not e!789167))))

(assert (=> b!1393732 (= res!933193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393734 () Bool)

(declare-fun res!933195 () Bool)

(assert (=> b!1393734 (=> (not res!933195) (not e!789167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393734 (= res!933195 (validKeyInArray!0 (select (arr!46002 a!2901) j!112)))))

(declare-fun b!1393735 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95287 (_ BitVec 32)) SeekEntryResult!10345)

(assert (=> b!1393735 (= e!789164 (= (seekEntryOrOpen!0 (select (arr!46002 a!2901) j!112) a!2901 mask!2840) (Found!10345 j!112)))))

(declare-fun b!1393733 () Bool)

(declare-fun res!933196 () Bool)

(assert (=> b!1393733 (=> (not res!933196) (not e!789167))))

(declare-datatypes ((List!32599 0))(
  ( (Nil!32596) (Cons!32595 (h!33828 (_ BitVec 64)) (t!47285 List!32599)) )
))
(declare-fun arrayNoDuplicates!0 (array!95287 (_ BitVec 32) List!32599) Bool)

(assert (=> b!1393733 (= res!933196 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32596))))

(declare-fun res!933189 () Bool)

(assert (=> start!119652 (=> (not res!933189) (not e!789167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119652 (= res!933189 (validMask!0 mask!2840))))

(assert (=> start!119652 e!789167))

(assert (=> start!119652 true))

(declare-fun array_inv!35235 (array!95287) Bool)

(assert (=> start!119652 (array_inv!35235 a!2901)))

(declare-fun b!1393736 () Bool)

(assert (=> b!1393736 (= e!789166 true)))

(declare-fun lt!611940 () SeekEntryResult!10345)

(assert (=> b!1393736 (= lt!611940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95288 (store (arr!46002 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46554 a!2901)) mask!2840))))

(declare-fun b!1393737 () Bool)

(declare-fun res!933190 () Bool)

(assert (=> b!1393737 (=> (not res!933190) (not e!789167))))

(assert (=> b!1393737 (= res!933190 (validKeyInArray!0 (select (arr!46002 a!2901) i!1037)))))

(assert (= (and start!119652 res!933189) b!1393731))

(assert (= (and b!1393731 res!933192) b!1393737))

(assert (= (and b!1393737 res!933190) b!1393734))

(assert (= (and b!1393734 res!933195) b!1393732))

(assert (= (and b!1393732 res!933193) b!1393733))

(assert (= (and b!1393733 res!933196) b!1393730))

(assert (= (and b!1393730 res!933194) b!1393735))

(assert (= (and b!1393730 (not res!933191)) b!1393736))

(declare-fun m!1279341 () Bool)

(assert (=> b!1393734 m!1279341))

(assert (=> b!1393734 m!1279341))

(declare-fun m!1279343 () Bool)

(assert (=> b!1393734 m!1279343))

(assert (=> b!1393730 m!1279341))

(declare-fun m!1279345 () Bool)

(assert (=> b!1393730 m!1279345))

(assert (=> b!1393730 m!1279341))

(declare-fun m!1279347 () Bool)

(assert (=> b!1393730 m!1279347))

(assert (=> b!1393730 m!1279345))

(assert (=> b!1393730 m!1279341))

(declare-fun m!1279349 () Bool)

(assert (=> b!1393730 m!1279349))

(declare-fun m!1279351 () Bool)

(assert (=> b!1393730 m!1279351))

(assert (=> b!1393735 m!1279341))

(assert (=> b!1393735 m!1279341))

(declare-fun m!1279353 () Bool)

(assert (=> b!1393735 m!1279353))

(declare-fun m!1279355 () Bool)

(assert (=> start!119652 m!1279355))

(declare-fun m!1279357 () Bool)

(assert (=> start!119652 m!1279357))

(declare-fun m!1279359 () Bool)

(assert (=> b!1393737 m!1279359))

(assert (=> b!1393737 m!1279359))

(declare-fun m!1279361 () Bool)

(assert (=> b!1393737 m!1279361))

(declare-fun m!1279363 () Bool)

(assert (=> b!1393736 m!1279363))

(declare-fun m!1279365 () Bool)

(assert (=> b!1393736 m!1279365))

(assert (=> b!1393736 m!1279365))

(declare-fun m!1279367 () Bool)

(assert (=> b!1393736 m!1279367))

(assert (=> b!1393736 m!1279367))

(assert (=> b!1393736 m!1279365))

(declare-fun m!1279369 () Bool)

(assert (=> b!1393736 m!1279369))

(declare-fun m!1279371 () Bool)

(assert (=> b!1393733 m!1279371))

(declare-fun m!1279373 () Bool)

(assert (=> b!1393732 m!1279373))

(push 1)

(assert (not b!1393732))

(assert (not b!1393735))

(assert (not b!1393730))

(assert (not b!1393733))

(assert (not b!1393736))

(assert (not b!1393737))

(assert (not start!119652))

(assert (not b!1393734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

