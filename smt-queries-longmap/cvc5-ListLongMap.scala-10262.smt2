; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120816 () Bool)

(assert start!120816)

(declare-fun b!1405579 () Bool)

(declare-fun res!943408 () Bool)

(declare-fun e!795779 () Bool)

(assert (=> b!1405579 (=> (not res!943408) (not e!795779))))

(declare-datatypes ((array!96147 0))(
  ( (array!96148 (arr!46422 (Array (_ BitVec 32) (_ BitVec 64))) (size!46973 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96147)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96147 (_ BitVec 32)) Bool)

(assert (=> b!1405579 (= res!943408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405580 () Bool)

(declare-fun res!943409 () Bool)

(assert (=> b!1405580 (=> (not res!943409) (not e!795779))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405580 (= res!943409 (and (= (size!46973 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46973 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46973 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405581 () Bool)

(declare-fun res!943411 () Bool)

(assert (=> b!1405581 (=> (not res!943411) (not e!795779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405581 (= res!943411 (validKeyInArray!0 (select (arr!46422 a!2901) i!1037)))))

(declare-fun b!1405582 () Bool)

(declare-fun res!943410 () Bool)

(assert (=> b!1405582 (=> (not res!943410) (not e!795779))))

(assert (=> b!1405582 (= res!943410 (validKeyInArray!0 (select (arr!46422 a!2901) j!112)))))

(declare-fun res!943406 () Bool)

(assert (=> start!120816 (=> (not res!943406) (not e!795779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120816 (= res!943406 (validMask!0 mask!2840))))

(assert (=> start!120816 e!795779))

(assert (=> start!120816 true))

(declare-fun array_inv!35703 (array!96147) Bool)

(assert (=> start!120816 (array_inv!35703 a!2901)))

(declare-fun b!1405583 () Bool)

(assert (=> b!1405583 (= e!795779 (not true))))

(assert (=> b!1405583 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47273 0))(
  ( (Unit!47274) )
))
(declare-fun lt!619052 () Unit!47273)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47273)

(assert (=> b!1405583 (= lt!619052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10636 0))(
  ( (MissingZero!10636 (index!44921 (_ BitVec 32))) (Found!10636 (index!44922 (_ BitVec 32))) (Intermediate!10636 (undefined!11448 Bool) (index!44923 (_ BitVec 32)) (x!126682 (_ BitVec 32))) (Undefined!10636) (MissingVacant!10636 (index!44924 (_ BitVec 32))) )
))
(declare-fun lt!619051 () SeekEntryResult!10636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96147 (_ BitVec 32)) SeekEntryResult!10636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405583 (= lt!619051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46422 a!2901) j!112) mask!2840) (select (arr!46422 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405584 () Bool)

(declare-fun res!943407 () Bool)

(assert (=> b!1405584 (=> (not res!943407) (not e!795779))))

(declare-datatypes ((List!32928 0))(
  ( (Nil!32925) (Cons!32924 (h!34180 (_ BitVec 64)) (t!47614 List!32928)) )
))
(declare-fun arrayNoDuplicates!0 (array!96147 (_ BitVec 32) List!32928) Bool)

(assert (=> b!1405584 (= res!943407 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32925))))

(assert (= (and start!120816 res!943406) b!1405580))

(assert (= (and b!1405580 res!943409) b!1405581))

(assert (= (and b!1405581 res!943411) b!1405582))

(assert (= (and b!1405582 res!943410) b!1405579))

(assert (= (and b!1405579 res!943408) b!1405584))

(assert (= (and b!1405584 res!943407) b!1405583))

(declare-fun m!1294657 () Bool)

(assert (=> b!1405582 m!1294657))

(assert (=> b!1405582 m!1294657))

(declare-fun m!1294659 () Bool)

(assert (=> b!1405582 m!1294659))

(declare-fun m!1294661 () Bool)

(assert (=> b!1405584 m!1294661))

(assert (=> b!1405583 m!1294657))

(declare-fun m!1294663 () Bool)

(assert (=> b!1405583 m!1294663))

(assert (=> b!1405583 m!1294657))

(declare-fun m!1294665 () Bool)

(assert (=> b!1405583 m!1294665))

(assert (=> b!1405583 m!1294663))

(assert (=> b!1405583 m!1294657))

(declare-fun m!1294667 () Bool)

(assert (=> b!1405583 m!1294667))

(declare-fun m!1294669 () Bool)

(assert (=> b!1405583 m!1294669))

(declare-fun m!1294671 () Bool)

(assert (=> b!1405579 m!1294671))

(declare-fun m!1294673 () Bool)

(assert (=> b!1405581 m!1294673))

(assert (=> b!1405581 m!1294673))

(declare-fun m!1294675 () Bool)

(assert (=> b!1405581 m!1294675))

(declare-fun m!1294677 () Bool)

(assert (=> start!120816 m!1294677))

(declare-fun m!1294679 () Bool)

(assert (=> start!120816 m!1294679))

(push 1)

(assert (not b!1405582))

(assert (not b!1405581))

(assert (not start!120816))

(assert (not b!1405579))

(assert (not b!1405583))

(assert (not b!1405584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

