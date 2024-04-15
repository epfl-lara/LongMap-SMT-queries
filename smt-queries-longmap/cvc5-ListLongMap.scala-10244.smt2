; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120516 () Bool)

(assert start!120516)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95878 0))(
  ( (array!95879 (arr!46290 (Array (_ BitVec 32) (_ BitVec 64))) (size!46842 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95878)

(declare-fun e!794570 () Bool)

(declare-fun b!1403285 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10633 0))(
  ( (MissingZero!10633 (index!44909 (_ BitVec 32))) (Found!10633 (index!44910 (_ BitVec 32))) (Intermediate!10633 (undefined!11445 Bool) (index!44911 (_ BitVec 32)) (x!126513 (_ BitVec 32))) (Undefined!10633) (MissingVacant!10633 (index!44912 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95878 (_ BitVec 32)) SeekEntryResult!10633)

(assert (=> b!1403285 (= e!794570 (= (seekEntryOrOpen!0 (select (arr!46290 a!2901) j!112) a!2901 mask!2840) (Found!10633 j!112)))))

(declare-fun b!1403287 () Bool)

(declare-fun res!941847 () Bool)

(declare-fun e!794567 () Bool)

(assert (=> b!1403287 (=> (not res!941847) (not e!794567))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403287 (= res!941847 (and (= (size!46842 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46842 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46842 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403288 () Bool)

(declare-fun e!794569 () Bool)

(assert (=> b!1403288 (= e!794569 true)))

(declare-fun lt!618185 () SeekEntryResult!10633)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95878 (_ BitVec 32)) SeekEntryResult!10633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403288 (= lt!618185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95879 (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46842 a!2901)) mask!2840))))

(declare-fun b!1403289 () Bool)

(declare-fun res!941853 () Bool)

(assert (=> b!1403289 (=> (not res!941853) (not e!794567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403289 (= res!941853 (validKeyInArray!0 (select (arr!46290 a!2901) i!1037)))))

(declare-fun b!1403290 () Bool)

(declare-fun res!941850 () Bool)

(assert (=> b!1403290 (=> (not res!941850) (not e!794567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95878 (_ BitVec 32)) Bool)

(assert (=> b!1403290 (= res!941850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!941854 () Bool)

(assert (=> start!120516 (=> (not res!941854) (not e!794567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120516 (= res!941854 (validMask!0 mask!2840))))

(assert (=> start!120516 e!794567))

(assert (=> start!120516 true))

(declare-fun array_inv!35523 (array!95878) Bool)

(assert (=> start!120516 (array_inv!35523 a!2901)))

(declare-fun b!1403286 () Bool)

(declare-fun res!941851 () Bool)

(assert (=> b!1403286 (=> (not res!941851) (not e!794567))))

(assert (=> b!1403286 (= res!941851 (validKeyInArray!0 (select (arr!46290 a!2901) j!112)))))

(declare-fun b!1403291 () Bool)

(declare-fun res!941852 () Bool)

(assert (=> b!1403291 (=> (not res!941852) (not e!794567))))

(declare-datatypes ((List!32887 0))(
  ( (Nil!32884) (Cons!32883 (h!34131 (_ BitVec 64)) (t!47573 List!32887)) )
))
(declare-fun arrayNoDuplicates!0 (array!95878 (_ BitVec 32) List!32887) Bool)

(assert (=> b!1403291 (= res!941852 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32884))))

(declare-fun b!1403292 () Bool)

(assert (=> b!1403292 (= e!794567 (not e!794569))))

(declare-fun res!941849 () Bool)

(assert (=> b!1403292 (=> res!941849 e!794569)))

(declare-fun lt!618184 () SeekEntryResult!10633)

(assert (=> b!1403292 (= res!941849 (or (not (is-Intermediate!10633 lt!618184)) (undefined!11445 lt!618184)))))

(assert (=> b!1403292 e!794570))

(declare-fun res!941848 () Bool)

(assert (=> b!1403292 (=> (not res!941848) (not e!794570))))

(assert (=> b!1403292 (= res!941848 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47113 0))(
  ( (Unit!47114) )
))
(declare-fun lt!618183 () Unit!47113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47113)

(assert (=> b!1403292 (= lt!618183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403292 (= lt!618184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46290 a!2901) j!112) mask!2840) (select (arr!46290 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120516 res!941854) b!1403287))

(assert (= (and b!1403287 res!941847) b!1403289))

(assert (= (and b!1403289 res!941853) b!1403286))

(assert (= (and b!1403286 res!941851) b!1403290))

(assert (= (and b!1403290 res!941850) b!1403291))

(assert (= (and b!1403291 res!941852) b!1403292))

(assert (= (and b!1403292 res!941848) b!1403285))

(assert (= (and b!1403292 (not res!941849)) b!1403288))

(declare-fun m!1291437 () Bool)

(assert (=> start!120516 m!1291437))

(declare-fun m!1291439 () Bool)

(assert (=> start!120516 m!1291439))

(declare-fun m!1291441 () Bool)

(assert (=> b!1403289 m!1291441))

(assert (=> b!1403289 m!1291441))

(declare-fun m!1291443 () Bool)

(assert (=> b!1403289 m!1291443))

(declare-fun m!1291445 () Bool)

(assert (=> b!1403285 m!1291445))

(assert (=> b!1403285 m!1291445))

(declare-fun m!1291447 () Bool)

(assert (=> b!1403285 m!1291447))

(declare-fun m!1291449 () Bool)

(assert (=> b!1403290 m!1291449))

(assert (=> b!1403286 m!1291445))

(assert (=> b!1403286 m!1291445))

(declare-fun m!1291451 () Bool)

(assert (=> b!1403286 m!1291451))

(declare-fun m!1291453 () Bool)

(assert (=> b!1403288 m!1291453))

(declare-fun m!1291455 () Bool)

(assert (=> b!1403288 m!1291455))

(assert (=> b!1403288 m!1291455))

(declare-fun m!1291457 () Bool)

(assert (=> b!1403288 m!1291457))

(assert (=> b!1403288 m!1291457))

(assert (=> b!1403288 m!1291455))

(declare-fun m!1291459 () Bool)

(assert (=> b!1403288 m!1291459))

(declare-fun m!1291461 () Bool)

(assert (=> b!1403291 m!1291461))

(assert (=> b!1403292 m!1291445))

(declare-fun m!1291463 () Bool)

(assert (=> b!1403292 m!1291463))

(assert (=> b!1403292 m!1291445))

(declare-fun m!1291465 () Bool)

(assert (=> b!1403292 m!1291465))

(assert (=> b!1403292 m!1291463))

(assert (=> b!1403292 m!1291445))

(declare-fun m!1291467 () Bool)

(assert (=> b!1403292 m!1291467))

(declare-fun m!1291469 () Bool)

(assert (=> b!1403292 m!1291469))

(push 1)

(assert (not b!1403288))

(assert (not b!1403290))

(assert (not b!1403286))

(assert (not b!1403291))

(assert (not b!1403285))

(assert (not start!120516))

(assert (not b!1403289))

(assert (not b!1403292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

