; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120052 () Bool)

(assert start!120052)

(declare-fun b!1397662 () Bool)

(declare-fun res!936581 () Bool)

(declare-fun e!791254 () Bool)

(assert (=> b!1397662 (=> (not res!936581) (not e!791254))))

(declare-datatypes ((array!95581 0))(
  ( (array!95582 (arr!46144 (Array (_ BitVec 32) (_ BitVec 64))) (size!46694 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95581)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397662 (= res!936581 (validKeyInArray!0 (select (arr!46144 a!2901) j!112)))))

(declare-fun b!1397663 () Bool)

(declare-fun res!936577 () Bool)

(assert (=> b!1397663 (=> (not res!936577) (not e!791254))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397663 (= res!936577 (and (= (size!46694 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46694 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46694 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397664 () Bool)

(declare-fun e!791257 () Bool)

(declare-datatypes ((SeekEntryResult!10461 0))(
  ( (MissingZero!10461 (index!44215 (_ BitVec 32))) (Found!10461 (index!44216 (_ BitVec 32))) (Intermediate!10461 (undefined!11273 Bool) (index!44217 (_ BitVec 32)) (x!125867 (_ BitVec 32))) (Undefined!10461) (MissingVacant!10461 (index!44218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95581 (_ BitVec 32)) SeekEntryResult!10461)

(assert (=> b!1397664 (= e!791257 (= (seekEntryOrOpen!0 (select (arr!46144 a!2901) j!112) a!2901 mask!2840) (Found!10461 j!112)))))

(declare-fun b!1397665 () Bool)

(declare-fun res!936579 () Bool)

(assert (=> b!1397665 (=> (not res!936579) (not e!791254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95581 (_ BitVec 32)) Bool)

(assert (=> b!1397665 (= res!936579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397667 () Bool)

(declare-fun e!791258 () Bool)

(assert (=> b!1397667 (= e!791254 (not e!791258))))

(declare-fun res!936578 () Bool)

(assert (=> b!1397667 (=> res!936578 e!791258)))

(declare-fun lt!614379 () SeekEntryResult!10461)

(assert (=> b!1397667 (= res!936578 (or (not (is-Intermediate!10461 lt!614379)) (undefined!11273 lt!614379)))))

(assert (=> b!1397667 e!791257))

(declare-fun res!936576 () Bool)

(assert (=> b!1397667 (=> (not res!936576) (not e!791257))))

(assert (=> b!1397667 (= res!936576 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46926 0))(
  ( (Unit!46927) )
))
(declare-fun lt!614381 () Unit!46926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46926)

(assert (=> b!1397667 (= lt!614381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614378 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95581 (_ BitVec 32)) SeekEntryResult!10461)

(assert (=> b!1397667 (= lt!614379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614378 (select (arr!46144 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397667 (= lt!614378 (toIndex!0 (select (arr!46144 a!2901) j!112) mask!2840))))

(declare-fun b!1397668 () Bool)

(declare-fun e!791255 () Bool)

(assert (=> b!1397668 (= e!791258 e!791255)))

(declare-fun res!936580 () Bool)

(assert (=> b!1397668 (=> res!936580 e!791255)))

(declare-fun lt!614376 () SeekEntryResult!10461)

(assert (=> b!1397668 (= res!936580 (or (= lt!614379 lt!614376) (not (is-Intermediate!10461 lt!614376)) (bvslt (x!125867 lt!614379) #b00000000000000000000000000000000) (bvsgt (x!125867 lt!614379) #b01111111111111111111111111111110) (bvslt lt!614378 #b00000000000000000000000000000000) (bvsge lt!614378 (size!46694 a!2901)) (bvslt (index!44217 lt!614379) #b00000000000000000000000000000000) (bvsge (index!44217 lt!614379) (size!46694 a!2901)) (not (= lt!614379 (Intermediate!10461 false (index!44217 lt!614379) (x!125867 lt!614379)))) (not (= lt!614376 (Intermediate!10461 (undefined!11273 lt!614376) (index!44217 lt!614376) (x!125867 lt!614376))))))))

(declare-fun lt!614380 () array!95581)

(declare-fun lt!614377 () (_ BitVec 64))

(assert (=> b!1397668 (= lt!614376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614377 mask!2840) lt!614377 lt!614380 mask!2840))))

(assert (=> b!1397668 (= lt!614377 (select (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397668 (= lt!614380 (array!95582 (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46694 a!2901)))))

(declare-fun b!1397666 () Bool)

(declare-fun res!936583 () Bool)

(assert (=> b!1397666 (=> (not res!936583) (not e!791254))))

(declare-datatypes ((List!32663 0))(
  ( (Nil!32660) (Cons!32659 (h!33901 (_ BitVec 64)) (t!47357 List!32663)) )
))
(declare-fun arrayNoDuplicates!0 (array!95581 (_ BitVec 32) List!32663) Bool)

(assert (=> b!1397666 (= res!936583 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32660))))

(declare-fun res!936575 () Bool)

(assert (=> start!120052 (=> (not res!936575) (not e!791254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120052 (= res!936575 (validMask!0 mask!2840))))

(assert (=> start!120052 e!791254))

(assert (=> start!120052 true))

(declare-fun array_inv!35172 (array!95581) Bool)

(assert (=> start!120052 (array_inv!35172 a!2901)))

(declare-fun b!1397669 () Bool)

(assert (=> b!1397669 (= e!791255 true)))

(declare-fun lt!614382 () SeekEntryResult!10461)

(assert (=> b!1397669 (= lt!614382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614378 lt!614377 lt!614380 mask!2840))))

(declare-fun b!1397670 () Bool)

(declare-fun res!936582 () Bool)

(assert (=> b!1397670 (=> (not res!936582) (not e!791254))))

(assert (=> b!1397670 (= res!936582 (validKeyInArray!0 (select (arr!46144 a!2901) i!1037)))))

(assert (= (and start!120052 res!936575) b!1397663))

(assert (= (and b!1397663 res!936577) b!1397670))

(assert (= (and b!1397670 res!936582) b!1397662))

(assert (= (and b!1397662 res!936581) b!1397665))

(assert (= (and b!1397665 res!936579) b!1397666))

(assert (= (and b!1397666 res!936583) b!1397667))

(assert (= (and b!1397667 res!936576) b!1397664))

(assert (= (and b!1397667 (not res!936578)) b!1397668))

(assert (= (and b!1397668 (not res!936580)) b!1397669))

(declare-fun m!1284507 () Bool)

(assert (=> b!1397667 m!1284507))

(declare-fun m!1284509 () Bool)

(assert (=> b!1397667 m!1284509))

(assert (=> b!1397667 m!1284507))

(assert (=> b!1397667 m!1284507))

(declare-fun m!1284511 () Bool)

(assert (=> b!1397667 m!1284511))

(declare-fun m!1284513 () Bool)

(assert (=> b!1397667 m!1284513))

(declare-fun m!1284515 () Bool)

(assert (=> b!1397667 m!1284515))

(declare-fun m!1284517 () Bool)

(assert (=> b!1397665 m!1284517))

(declare-fun m!1284519 () Bool)

(assert (=> b!1397670 m!1284519))

(assert (=> b!1397670 m!1284519))

(declare-fun m!1284521 () Bool)

(assert (=> b!1397670 m!1284521))

(declare-fun m!1284523 () Bool)

(assert (=> b!1397666 m!1284523))

(assert (=> b!1397664 m!1284507))

(assert (=> b!1397664 m!1284507))

(declare-fun m!1284525 () Bool)

(assert (=> b!1397664 m!1284525))

(declare-fun m!1284527 () Bool)

(assert (=> b!1397668 m!1284527))

(assert (=> b!1397668 m!1284527))

(declare-fun m!1284529 () Bool)

(assert (=> b!1397668 m!1284529))

(declare-fun m!1284531 () Bool)

(assert (=> b!1397668 m!1284531))

(declare-fun m!1284533 () Bool)

(assert (=> b!1397668 m!1284533))

(declare-fun m!1284535 () Bool)

(assert (=> start!120052 m!1284535))

(declare-fun m!1284537 () Bool)

(assert (=> start!120052 m!1284537))

(assert (=> b!1397662 m!1284507))

(assert (=> b!1397662 m!1284507))

(declare-fun m!1284539 () Bool)

(assert (=> b!1397662 m!1284539))

(declare-fun m!1284541 () Bool)

(assert (=> b!1397669 m!1284541))

(push 1)

