; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120592 () Bool)

(assert start!120592)

(declare-fun b!1404070 () Bool)

(declare-fun res!942632 () Bool)

(declare-fun e!794906 () Bool)

(assert (=> b!1404070 (=> (not res!942632) (not e!794906))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95954 0))(
  ( (array!95955 (arr!46328 (Array (_ BitVec 32) (_ BitVec 64))) (size!46880 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95954)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404070 (= res!942632 (and (= (size!46880 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46880 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46880 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404071 () Bool)

(declare-fun res!942636 () Bool)

(assert (=> b!1404071 (=> (not res!942636) (not e!794906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404071 (= res!942636 (validKeyInArray!0 (select (arr!46328 a!2901) i!1037)))))

(declare-fun b!1404072 () Bool)

(declare-fun res!942637 () Bool)

(assert (=> b!1404072 (=> (not res!942637) (not e!794906))))

(declare-datatypes ((List!32925 0))(
  ( (Nil!32922) (Cons!32921 (h!34169 (_ BitVec 64)) (t!47611 List!32925)) )
))
(declare-fun arrayNoDuplicates!0 (array!95954 (_ BitVec 32) List!32925) Bool)

(assert (=> b!1404072 (= res!942637 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32922))))

(declare-fun b!1404073 () Bool)

(declare-fun res!942635 () Bool)

(assert (=> b!1404073 (=> (not res!942635) (not e!794906))))

(assert (=> b!1404073 (= res!942635 (validKeyInArray!0 (select (arr!46328 a!2901) j!112)))))

(declare-fun b!1404074 () Bool)

(assert (=> b!1404074 (= e!794906 false)))

(declare-datatypes ((SeekEntryResult!10665 0))(
  ( (MissingZero!10665 (index!45037 (_ BitVec 32))) (Found!10665 (index!45038 (_ BitVec 32))) (Intermediate!10665 (undefined!11477 Bool) (index!45039 (_ BitVec 32)) (x!126649 (_ BitVec 32))) (Undefined!10665) (MissingVacant!10665 (index!45040 (_ BitVec 32))) )
))
(declare-fun lt!618407 () SeekEntryResult!10665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95954 (_ BitVec 32)) SeekEntryResult!10665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404074 (= lt!618407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46328 a!2901) j!112) mask!2840) (select (arr!46328 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942633 () Bool)

(assert (=> start!120592 (=> (not res!942633) (not e!794906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120592 (= res!942633 (validMask!0 mask!2840))))

(assert (=> start!120592 e!794906))

(assert (=> start!120592 true))

(declare-fun array_inv!35561 (array!95954) Bool)

(assert (=> start!120592 (array_inv!35561 a!2901)))

(declare-fun b!1404075 () Bool)

(declare-fun res!942634 () Bool)

(assert (=> b!1404075 (=> (not res!942634) (not e!794906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95954 (_ BitVec 32)) Bool)

(assert (=> b!1404075 (= res!942634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120592 res!942633) b!1404070))

(assert (= (and b!1404070 res!942632) b!1404071))

(assert (= (and b!1404071 res!942636) b!1404073))

(assert (= (and b!1404073 res!942635) b!1404075))

(assert (= (and b!1404075 res!942634) b!1404072))

(assert (= (and b!1404072 res!942637) b!1404074))

(declare-fun m!1292421 () Bool)

(assert (=> b!1404072 m!1292421))

(declare-fun m!1292423 () Bool)

(assert (=> b!1404074 m!1292423))

(assert (=> b!1404074 m!1292423))

(declare-fun m!1292425 () Bool)

(assert (=> b!1404074 m!1292425))

(assert (=> b!1404074 m!1292425))

(assert (=> b!1404074 m!1292423))

(declare-fun m!1292427 () Bool)

(assert (=> b!1404074 m!1292427))

(declare-fun m!1292429 () Bool)

(assert (=> b!1404071 m!1292429))

(assert (=> b!1404071 m!1292429))

(declare-fun m!1292431 () Bool)

(assert (=> b!1404071 m!1292431))

(declare-fun m!1292433 () Bool)

(assert (=> b!1404075 m!1292433))

(assert (=> b!1404073 m!1292423))

(assert (=> b!1404073 m!1292423))

(declare-fun m!1292435 () Bool)

(assert (=> b!1404073 m!1292435))

(declare-fun m!1292437 () Bool)

(assert (=> start!120592 m!1292437))

(declare-fun m!1292439 () Bool)

(assert (=> start!120592 m!1292439))

(push 1)

(assert (not b!1404073))

(assert (not b!1404072))

(assert (not b!1404071))

(assert (not b!1404075))

(assert (not start!120592))

(assert (not b!1404074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

