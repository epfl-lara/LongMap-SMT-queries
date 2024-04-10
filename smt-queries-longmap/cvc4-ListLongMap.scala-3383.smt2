; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46714 () Bool)

(assert start!46714)

(declare-fun b!515644 () Bool)

(declare-fun e!301044 () Bool)

(declare-fun e!301040 () Bool)

(assert (=> b!515644 (= e!301044 e!301040)))

(declare-fun res!315211 () Bool)

(assert (=> b!515644 (=> (not res!315211) (not e!301040))))

(declare-datatypes ((SeekEntryResult!4348 0))(
  ( (MissingZero!4348 (index!19580 (_ BitVec 32))) (Found!4348 (index!19581 (_ BitVec 32))) (Intermediate!4348 (undefined!5160 Bool) (index!19582 (_ BitVec 32)) (x!48543 (_ BitVec 32))) (Undefined!4348) (MissingVacant!4348 (index!19583 (_ BitVec 32))) )
))
(declare-fun lt!236059 () SeekEntryResult!4348)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515644 (= res!315211 (or (= lt!236059 (MissingZero!4348 i!1204)) (= lt!236059 (MissingVacant!4348 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33026 0))(
  ( (array!33027 (arr!15881 (Array (_ BitVec 32) (_ BitVec 64))) (size!16245 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33026 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!515644 (= lt!236059 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515645 () Bool)

(declare-fun res!315218 () Bool)

(assert (=> b!515645 (=> (not res!315218) (not e!301040))))

(declare-datatypes ((List!10039 0))(
  ( (Nil!10036) (Cons!10035 (h!10933 (_ BitVec 64)) (t!16267 List!10039)) )
))
(declare-fun arrayNoDuplicates!0 (array!33026 (_ BitVec 32) List!10039) Bool)

(assert (=> b!515645 (= res!315218 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10036))))

(declare-fun b!515646 () Bool)

(declare-fun res!315210 () Bool)

(assert (=> b!515646 (=> (not res!315210) (not e!301040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33026 (_ BitVec 32)) Bool)

(assert (=> b!515646 (= res!315210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515647 () Bool)

(declare-fun res!315209 () Bool)

(assert (=> b!515647 (=> (not res!315209) (not e!301044))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515647 (= res!315209 (validKeyInArray!0 (select (arr!15881 a!3235) j!176)))))

(declare-fun b!515648 () Bool)

(declare-fun e!301043 () Bool)

(assert (=> b!515648 (= e!301040 (not e!301043))))

(declare-fun res!315212 () Bool)

(assert (=> b!515648 (=> res!315212 e!301043)))

(declare-fun lt!236057 () (_ BitVec 32))

(declare-fun lt!236058 () SeekEntryResult!4348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33026 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!515648 (= res!315212 (= lt!236058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236057 (select (store (arr!15881 a!3235) i!1204 k!2280) j!176) (array!33027 (store (arr!15881 a!3235) i!1204 k!2280) (size!16245 a!3235)) mask!3524)))))

(declare-fun lt!236055 () (_ BitVec 32))

(assert (=> b!515648 (= lt!236058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236055 (select (arr!15881 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515648 (= lt!236057 (toIndex!0 (select (store (arr!15881 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515648 (= lt!236055 (toIndex!0 (select (arr!15881 a!3235) j!176) mask!3524))))

(declare-fun e!301042 () Bool)

(assert (=> b!515648 e!301042))

(declare-fun res!315208 () Bool)

(assert (=> b!515648 (=> (not res!315208) (not e!301042))))

(assert (=> b!515648 (= res!315208 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15954 0))(
  ( (Unit!15955) )
))
(declare-fun lt!236056 () Unit!15954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15954)

(assert (=> b!515648 (= lt!236056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515649 () Bool)

(declare-fun res!315216 () Bool)

(assert (=> b!515649 (=> (not res!315216) (not e!301044))))

(assert (=> b!515649 (= res!315216 (and (= (size!16245 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16245 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16245 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515650 () Bool)

(assert (=> b!515650 (= e!301043 true)))

(assert (=> b!515650 (and (bvslt (x!48543 lt!236058) #b01111111111111111111111111111110) (or (= (select (arr!15881 a!3235) (index!19582 lt!236058)) (select (arr!15881 a!3235) j!176)) (= (select (arr!15881 a!3235) (index!19582 lt!236058)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15881 a!3235) (index!19582 lt!236058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515651 () Bool)

(assert (=> b!515651 (= e!301042 (= (seekEntryOrOpen!0 (select (arr!15881 a!3235) j!176) a!3235 mask!3524) (Found!4348 j!176)))))

(declare-fun b!515652 () Bool)

(declare-fun res!315213 () Bool)

(assert (=> b!515652 (=> (not res!315213) (not e!301044))))

(assert (=> b!515652 (= res!315213 (validKeyInArray!0 k!2280))))

(declare-fun b!515653 () Bool)

(declare-fun res!315217 () Bool)

(assert (=> b!515653 (=> (not res!315217) (not e!301044))))

(declare-fun arrayContainsKey!0 (array!33026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515653 (= res!315217 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!315214 () Bool)

(assert (=> start!46714 (=> (not res!315214) (not e!301044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46714 (= res!315214 (validMask!0 mask!3524))))

(assert (=> start!46714 e!301044))

(assert (=> start!46714 true))

(declare-fun array_inv!11677 (array!33026) Bool)

(assert (=> start!46714 (array_inv!11677 a!3235)))

(declare-fun b!515654 () Bool)

(declare-fun res!315215 () Bool)

(assert (=> b!515654 (=> res!315215 e!301043)))

(assert (=> b!515654 (= res!315215 (or (undefined!5160 lt!236058) (not (is-Intermediate!4348 lt!236058))))))

(assert (= (and start!46714 res!315214) b!515649))

(assert (= (and b!515649 res!315216) b!515647))

(assert (= (and b!515647 res!315209) b!515652))

(assert (= (and b!515652 res!315213) b!515653))

(assert (= (and b!515653 res!315217) b!515644))

(assert (= (and b!515644 res!315211) b!515646))

(assert (= (and b!515646 res!315210) b!515645))

(assert (= (and b!515645 res!315218) b!515648))

(assert (= (and b!515648 res!315208) b!515651))

(assert (= (and b!515648 (not res!315212)) b!515654))

(assert (= (and b!515654 (not res!315215)) b!515650))

(declare-fun m!497011 () Bool)

(assert (=> b!515652 m!497011))

(declare-fun m!497013 () Bool)

(assert (=> start!46714 m!497013))

(declare-fun m!497015 () Bool)

(assert (=> start!46714 m!497015))

(declare-fun m!497017 () Bool)

(assert (=> b!515651 m!497017))

(assert (=> b!515651 m!497017))

(declare-fun m!497019 () Bool)

(assert (=> b!515651 m!497019))

(declare-fun m!497021 () Bool)

(assert (=> b!515644 m!497021))

(declare-fun m!497023 () Bool)

(assert (=> b!515650 m!497023))

(assert (=> b!515650 m!497017))

(assert (=> b!515647 m!497017))

(assert (=> b!515647 m!497017))

(declare-fun m!497025 () Bool)

(assert (=> b!515647 m!497025))

(declare-fun m!497027 () Bool)

(assert (=> b!515646 m!497027))

(declare-fun m!497029 () Bool)

(assert (=> b!515653 m!497029))

(declare-fun m!497031 () Bool)

(assert (=> b!515648 m!497031))

(declare-fun m!497033 () Bool)

(assert (=> b!515648 m!497033))

(declare-fun m!497035 () Bool)

(assert (=> b!515648 m!497035))

(declare-fun m!497037 () Bool)

(assert (=> b!515648 m!497037))

(assert (=> b!515648 m!497031))

(assert (=> b!515648 m!497017))

(declare-fun m!497039 () Bool)

(assert (=> b!515648 m!497039))

(assert (=> b!515648 m!497017))

(declare-fun m!497041 () Bool)

(assert (=> b!515648 m!497041))

(assert (=> b!515648 m!497017))

(declare-fun m!497043 () Bool)

(assert (=> b!515648 m!497043))

(assert (=> b!515648 m!497031))

(declare-fun m!497045 () Bool)

(assert (=> b!515648 m!497045))

(declare-fun m!497047 () Bool)

(assert (=> b!515645 m!497047))

(push 1)

