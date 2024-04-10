; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120592 () Bool)

(assert start!120592)

(declare-fun b!1404115 () Bool)

(declare-fun res!942628 () Bool)

(declare-fun e!794933 () Bool)

(assert (=> b!1404115 (=> (not res!942628) (not e!794933))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96001 0))(
  ( (array!96002 (arr!46351 (Array (_ BitVec 32) (_ BitVec 64))) (size!46901 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96001)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404115 (= res!942628 (and (= (size!46901 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46901 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46901 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404116 () Bool)

(assert (=> b!1404116 (= e!794933 false)))

(declare-fun lt!618591 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404116 (= lt!618591 (toIndex!0 (select (arr!46351 a!2901) j!112) mask!2840))))

(declare-fun b!1404118 () Bool)

(declare-fun res!942631 () Bool)

(assert (=> b!1404118 (=> (not res!942631) (not e!794933))))

(declare-datatypes ((List!32870 0))(
  ( (Nil!32867) (Cons!32866 (h!34114 (_ BitVec 64)) (t!47564 List!32870)) )
))
(declare-fun arrayNoDuplicates!0 (array!96001 (_ BitVec 32) List!32870) Bool)

(assert (=> b!1404118 (= res!942631 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32867))))

(declare-fun b!1404119 () Bool)

(declare-fun res!942627 () Bool)

(assert (=> b!1404119 (=> (not res!942627) (not e!794933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96001 (_ BitVec 32)) Bool)

(assert (=> b!1404119 (= res!942627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404120 () Bool)

(declare-fun res!942626 () Bool)

(assert (=> b!1404120 (=> (not res!942626) (not e!794933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404120 (= res!942626 (validKeyInArray!0 (select (arr!46351 a!2901) i!1037)))))

(declare-fun res!942630 () Bool)

(assert (=> start!120592 (=> (not res!942630) (not e!794933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120592 (= res!942630 (validMask!0 mask!2840))))

(assert (=> start!120592 e!794933))

(assert (=> start!120592 true))

(declare-fun array_inv!35379 (array!96001) Bool)

(assert (=> start!120592 (array_inv!35379 a!2901)))

(declare-fun b!1404117 () Bool)

(declare-fun res!942629 () Bool)

(assert (=> b!1404117 (=> (not res!942629) (not e!794933))))

(assert (=> b!1404117 (= res!942629 (validKeyInArray!0 (select (arr!46351 a!2901) j!112)))))

(assert (= (and start!120592 res!942630) b!1404115))

(assert (= (and b!1404115 res!942628) b!1404120))

(assert (= (and b!1404120 res!942626) b!1404117))

(assert (= (and b!1404117 res!942629) b!1404119))

(assert (= (and b!1404119 res!942627) b!1404118))

(assert (= (and b!1404118 res!942631) b!1404116))

(declare-fun m!1292919 () Bool)

(assert (=> b!1404116 m!1292919))

(assert (=> b!1404116 m!1292919))

(declare-fun m!1292921 () Bool)

(assert (=> b!1404116 m!1292921))

(declare-fun m!1292923 () Bool)

(assert (=> b!1404118 m!1292923))

(declare-fun m!1292925 () Bool)

(assert (=> start!120592 m!1292925))

(declare-fun m!1292927 () Bool)

(assert (=> start!120592 m!1292927))

(declare-fun m!1292929 () Bool)

(assert (=> b!1404119 m!1292929))

(assert (=> b!1404117 m!1292919))

(assert (=> b!1404117 m!1292919))

(declare-fun m!1292931 () Bool)

(assert (=> b!1404117 m!1292931))

(declare-fun m!1292933 () Bool)

(assert (=> b!1404120 m!1292933))

(assert (=> b!1404120 m!1292933))

(declare-fun m!1292935 () Bool)

(assert (=> b!1404120 m!1292935))

(push 1)

(assert (not b!1404116))

(assert (not b!1404120))

(assert (not start!120592))

(assert (not b!1404117))

(assert (not b!1404118))

(assert (not b!1404119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

