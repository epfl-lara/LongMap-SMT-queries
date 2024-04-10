; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119620 () Bool)

(assert start!119620)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1393379 () Bool)

(declare-fun e!788989 () Bool)

(declare-datatypes ((array!95302 0))(
  ( (array!95303 (arr!46009 (Array (_ BitVec 32) (_ BitVec 64))) (size!46559 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95302)

(declare-datatypes ((SeekEntryResult!10326 0))(
  ( (MissingZero!10326 (index!43675 (_ BitVec 32))) (Found!10326 (index!43676 (_ BitVec 32))) (Intermediate!10326 (undefined!11138 Bool) (index!43677 (_ BitVec 32)) (x!125354 (_ BitVec 32))) (Undefined!10326) (MissingVacant!10326 (index!43678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95302 (_ BitVec 32)) SeekEntryResult!10326)

(assert (=> b!1393379 (= e!788989 (= (seekEntryOrOpen!0 (select (arr!46009 a!2901) j!112) a!2901 mask!2840) (Found!10326 j!112)))))

(declare-fun b!1393380 () Bool)

(declare-fun res!932790 () Bool)

(declare-fun e!788988 () Bool)

(assert (=> b!1393380 (=> (not res!932790) (not e!788988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95302 (_ BitVec 32)) Bool)

(assert (=> b!1393380 (= res!932790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393381 () Bool)

(declare-fun res!932789 () Bool)

(assert (=> b!1393381 (=> (not res!932789) (not e!788988))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393381 (= res!932789 (and (= (size!46559 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46559 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46559 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393382 () Bool)

(declare-fun e!788990 () Bool)

(assert (=> b!1393382 (= e!788990 true)))

(declare-fun lt!611969 () SeekEntryResult!10326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95302 (_ BitVec 32)) SeekEntryResult!10326)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393382 (= lt!611969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46009 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46009 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95303 (store (arr!46009 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46559 a!2901)) mask!2840))))

(declare-fun res!932794 () Bool)

(assert (=> start!119620 (=> (not res!932794) (not e!788988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119620 (= res!932794 (validMask!0 mask!2840))))

(assert (=> start!119620 e!788988))

(assert (=> start!119620 true))

(declare-fun array_inv!35037 (array!95302) Bool)

(assert (=> start!119620 (array_inv!35037 a!2901)))

(declare-fun b!1393383 () Bool)

(declare-fun res!932793 () Bool)

(assert (=> b!1393383 (=> (not res!932793) (not e!788988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393383 (= res!932793 (validKeyInArray!0 (select (arr!46009 a!2901) j!112)))))

(declare-fun b!1393384 () Bool)

(assert (=> b!1393384 (= e!788988 (not e!788990))))

(declare-fun res!932791 () Bool)

(assert (=> b!1393384 (=> res!932791 e!788990)))

(declare-fun lt!611970 () SeekEntryResult!10326)

(assert (=> b!1393384 (= res!932791 (or (not (is-Intermediate!10326 lt!611970)) (undefined!11138 lt!611970)))))

(assert (=> b!1393384 e!788989))

(declare-fun res!932787 () Bool)

(assert (=> b!1393384 (=> (not res!932787) (not e!788989))))

(assert (=> b!1393384 (= res!932787 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46656 0))(
  ( (Unit!46657) )
))
(declare-fun lt!611968 () Unit!46656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46656)

(assert (=> b!1393384 (= lt!611968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393384 (= lt!611970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46009 a!2901) j!112) mask!2840) (select (arr!46009 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393385 () Bool)

(declare-fun res!932788 () Bool)

(assert (=> b!1393385 (=> (not res!932788) (not e!788988))))

(assert (=> b!1393385 (= res!932788 (validKeyInArray!0 (select (arr!46009 a!2901) i!1037)))))

(declare-fun b!1393386 () Bool)

(declare-fun res!932792 () Bool)

(assert (=> b!1393386 (=> (not res!932792) (not e!788988))))

(declare-datatypes ((List!32528 0))(
  ( (Nil!32525) (Cons!32524 (h!33757 (_ BitVec 64)) (t!47222 List!32528)) )
))
(declare-fun arrayNoDuplicates!0 (array!95302 (_ BitVec 32) List!32528) Bool)

(assert (=> b!1393386 (= res!932792 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32525))))

(assert (= (and start!119620 res!932794) b!1393381))

(assert (= (and b!1393381 res!932789) b!1393385))

(assert (= (and b!1393385 res!932788) b!1393383))

(assert (= (and b!1393383 res!932793) b!1393380))

(assert (= (and b!1393380 res!932790) b!1393386))

(assert (= (and b!1393386 res!932792) b!1393384))

(assert (= (and b!1393384 res!932787) b!1393379))

(assert (= (and b!1393384 (not res!932791)) b!1393382))

(declare-fun m!1279265 () Bool)

(assert (=> b!1393385 m!1279265))

(assert (=> b!1393385 m!1279265))

(declare-fun m!1279267 () Bool)

(assert (=> b!1393385 m!1279267))

(declare-fun m!1279269 () Bool)

(assert (=> start!119620 m!1279269))

(declare-fun m!1279271 () Bool)

(assert (=> start!119620 m!1279271))

(declare-fun m!1279273 () Bool)

(assert (=> b!1393379 m!1279273))

(assert (=> b!1393379 m!1279273))

(declare-fun m!1279275 () Bool)

(assert (=> b!1393379 m!1279275))

(declare-fun m!1279277 () Bool)

(assert (=> b!1393382 m!1279277))

(declare-fun m!1279279 () Bool)

(assert (=> b!1393382 m!1279279))

(assert (=> b!1393382 m!1279279))

(declare-fun m!1279281 () Bool)

(assert (=> b!1393382 m!1279281))

(assert (=> b!1393382 m!1279281))

(assert (=> b!1393382 m!1279279))

(declare-fun m!1279283 () Bool)

(assert (=> b!1393382 m!1279283))

(declare-fun m!1279285 () Bool)

(assert (=> b!1393380 m!1279285))

(declare-fun m!1279287 () Bool)

(assert (=> b!1393386 m!1279287))

(assert (=> b!1393383 m!1279273))

(assert (=> b!1393383 m!1279273))

(declare-fun m!1279289 () Bool)

(assert (=> b!1393383 m!1279289))

(assert (=> b!1393384 m!1279273))

(declare-fun m!1279291 () Bool)

(assert (=> b!1393384 m!1279291))

(assert (=> b!1393384 m!1279273))

(declare-fun m!1279293 () Bool)

(assert (=> b!1393384 m!1279293))

(assert (=> b!1393384 m!1279291))

(assert (=> b!1393384 m!1279273))

(declare-fun m!1279295 () Bool)

(assert (=> b!1393384 m!1279295))

(declare-fun m!1279297 () Bool)

(assert (=> b!1393384 m!1279297))

(push 1)

(assert (not b!1393380))

(assert (not b!1393385))

(assert (not start!119620))

(assert (not b!1393383))

(assert (not b!1393384))

(assert (not b!1393379))

(assert (not b!1393386))

(assert (not b!1393382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

