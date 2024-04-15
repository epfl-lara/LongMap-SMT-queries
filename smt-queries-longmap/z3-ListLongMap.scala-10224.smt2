; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120392 () Bool)

(assert start!120392)

(declare-fun res!940032 () Bool)

(declare-fun e!793561 () Bool)

(assert (=> start!120392 (=> (not res!940032) (not e!793561))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120392 (= res!940032 (validMask!0 mask!2840))))

(assert (=> start!120392 e!793561))

(assert (=> start!120392 true))

(declare-datatypes ((array!95754 0))(
  ( (array!95755 (arr!46228 (Array (_ BitVec 32) (_ BitVec 64))) (size!46780 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95754)

(declare-fun array_inv!35461 (array!95754) Bool)

(assert (=> start!120392 (array_inv!35461 a!2901)))

(declare-fun b!1401461 () Bool)

(declare-fun res!940024 () Bool)

(assert (=> b!1401461 (=> (not res!940024) (not e!793561))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401461 (= res!940024 (validKeyInArray!0 (select (arr!46228 a!2901) j!112)))))

(declare-fun b!1401462 () Bool)

(declare-fun res!940033 () Bool)

(assert (=> b!1401462 (=> (not res!940033) (not e!793561))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401462 (= res!940033 (validKeyInArray!0 (select (arr!46228 a!2901) i!1037)))))

(declare-fun b!1401463 () Bool)

(declare-fun res!940023 () Bool)

(assert (=> b!1401463 (=> (not res!940023) (not e!793561))))

(assert (=> b!1401463 (= res!940023 (and (= (size!46780 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46780 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46780 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401464 () Bool)

(declare-fun e!793565 () Bool)

(declare-fun e!793559 () Bool)

(assert (=> b!1401464 (= e!793565 e!793559)))

(declare-fun res!940030 () Bool)

(assert (=> b!1401464 (=> res!940030 e!793559)))

(declare-datatypes ((SeekEntryResult!10571 0))(
  ( (MissingZero!10571 (index!44661 (_ BitVec 32))) (Found!10571 (index!44662 (_ BitVec 32))) (Intermediate!10571 (undefined!11383 Bool) (index!44663 (_ BitVec 32)) (x!126291 (_ BitVec 32))) (Undefined!10571) (MissingVacant!10571 (index!44664 (_ BitVec 32))) )
))
(declare-fun lt!616822 () SeekEntryResult!10571)

(declare-fun lt!616817 () SeekEntryResult!10571)

(get-info :version)

(assert (=> b!1401464 (= res!940030 (or (= lt!616822 lt!616817) (not ((_ is Intermediate!10571) lt!616817))))))

(declare-fun lt!616818 () array!95754)

(declare-fun lt!616823 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95754 (_ BitVec 32)) SeekEntryResult!10571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401464 (= lt!616817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616823 mask!2840) lt!616823 lt!616818 mask!2840))))

(assert (=> b!1401464 (= lt!616823 (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401464 (= lt!616818 (array!95755 (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46780 a!2901)))))

(declare-fun b!1401465 () Bool)

(assert (=> b!1401465 (= e!793561 (not e!793565))))

(declare-fun res!940026 () Bool)

(assert (=> b!1401465 (=> res!940026 e!793565)))

(assert (=> b!1401465 (= res!940026 (or (not ((_ is Intermediate!10571) lt!616822)) (undefined!11383 lt!616822)))))

(declare-fun e!793560 () Bool)

(assert (=> b!1401465 e!793560))

(declare-fun res!940029 () Bool)

(assert (=> b!1401465 (=> (not res!940029) (not e!793560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95754 (_ BitVec 32)) Bool)

(assert (=> b!1401465 (= res!940029 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46989 0))(
  ( (Unit!46990) )
))
(declare-fun lt!616819 () Unit!46989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46989)

(assert (=> b!1401465 (= lt!616819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616816 () (_ BitVec 32))

(assert (=> b!1401465 (= lt!616822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616816 (select (arr!46228 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401465 (= lt!616816 (toIndex!0 (select (arr!46228 a!2901) j!112) mask!2840))))

(declare-fun b!1401466 () Bool)

(declare-fun e!793564 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95754 (_ BitVec 32)) SeekEntryResult!10571)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95754 (_ BitVec 32)) SeekEntryResult!10571)

(assert (=> b!1401466 (= e!793564 (= (seekEntryOrOpen!0 lt!616823 lt!616818 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126291 lt!616817) (index!44663 lt!616817) (index!44663 lt!616817) (select (arr!46228 a!2901) j!112) lt!616818 mask!2840)))))

(declare-fun b!1401467 () Bool)

(declare-fun res!940028 () Bool)

(assert (=> b!1401467 (=> (not res!940028) (not e!793561))))

(assert (=> b!1401467 (= res!940028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401468 () Bool)

(declare-fun e!793562 () Bool)

(assert (=> b!1401468 (= e!793562 true)))

(declare-fun lt!616820 () SeekEntryResult!10571)

(assert (=> b!1401468 (= lt!616820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616816 lt!616823 lt!616818 mask!2840))))

(declare-fun b!1401469 () Bool)

(assert (=> b!1401469 (= e!793560 (= (seekEntryOrOpen!0 (select (arr!46228 a!2901) j!112) a!2901 mask!2840) (Found!10571 j!112)))))

(declare-fun b!1401470 () Bool)

(assert (=> b!1401470 (= e!793559 e!793562)))

(declare-fun res!940031 () Bool)

(assert (=> b!1401470 (=> res!940031 e!793562)))

(assert (=> b!1401470 (= res!940031 (or (bvslt (x!126291 lt!616822) #b00000000000000000000000000000000) (bvsgt (x!126291 lt!616822) #b01111111111111111111111111111110) (bvslt (x!126291 lt!616817) #b00000000000000000000000000000000) (bvsgt (x!126291 lt!616817) #b01111111111111111111111111111110) (bvslt lt!616816 #b00000000000000000000000000000000) (bvsge lt!616816 (size!46780 a!2901)) (bvslt (index!44663 lt!616822) #b00000000000000000000000000000000) (bvsge (index!44663 lt!616822) (size!46780 a!2901)) (bvslt (index!44663 lt!616817) #b00000000000000000000000000000000) (bvsge (index!44663 lt!616817) (size!46780 a!2901)) (not (= lt!616822 (Intermediate!10571 false (index!44663 lt!616822) (x!126291 lt!616822)))) (not (= lt!616817 (Intermediate!10571 false (index!44663 lt!616817) (x!126291 lt!616817))))))))

(assert (=> b!1401470 e!793564))

(declare-fun res!940025 () Bool)

(assert (=> b!1401470 (=> (not res!940025) (not e!793564))))

(assert (=> b!1401470 (= res!940025 (and (not (undefined!11383 lt!616817)) (= (index!44663 lt!616817) i!1037) (bvslt (x!126291 lt!616817) (x!126291 lt!616822)) (= (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44663 lt!616817)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616821 () Unit!46989)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46989)

(assert (=> b!1401470 (= lt!616821 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616816 (x!126291 lt!616822) (index!44663 lt!616822) (x!126291 lt!616817) (index!44663 lt!616817) (undefined!11383 lt!616817) mask!2840))))

(declare-fun b!1401471 () Bool)

(declare-fun res!940027 () Bool)

(assert (=> b!1401471 (=> (not res!940027) (not e!793561))))

(declare-datatypes ((List!32825 0))(
  ( (Nil!32822) (Cons!32821 (h!34069 (_ BitVec 64)) (t!47511 List!32825)) )
))
(declare-fun arrayNoDuplicates!0 (array!95754 (_ BitVec 32) List!32825) Bool)

(assert (=> b!1401471 (= res!940027 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32822))))

(assert (= (and start!120392 res!940032) b!1401463))

(assert (= (and b!1401463 res!940023) b!1401462))

(assert (= (and b!1401462 res!940033) b!1401461))

(assert (= (and b!1401461 res!940024) b!1401467))

(assert (= (and b!1401467 res!940028) b!1401471))

(assert (= (and b!1401471 res!940027) b!1401465))

(assert (= (and b!1401465 res!940029) b!1401469))

(assert (= (and b!1401465 (not res!940026)) b!1401464))

(assert (= (and b!1401464 (not res!940030)) b!1401470))

(assert (= (and b!1401470 res!940025) b!1401466))

(assert (= (and b!1401470 (not res!940031)) b!1401468))

(declare-fun m!1288825 () Bool)

(assert (=> b!1401470 m!1288825))

(declare-fun m!1288827 () Bool)

(assert (=> b!1401470 m!1288827))

(declare-fun m!1288829 () Bool)

(assert (=> b!1401470 m!1288829))

(declare-fun m!1288831 () Bool)

(assert (=> start!120392 m!1288831))

(declare-fun m!1288833 () Bool)

(assert (=> start!120392 m!1288833))

(declare-fun m!1288835 () Bool)

(assert (=> b!1401466 m!1288835))

(declare-fun m!1288837 () Bool)

(assert (=> b!1401466 m!1288837))

(assert (=> b!1401466 m!1288837))

(declare-fun m!1288839 () Bool)

(assert (=> b!1401466 m!1288839))

(declare-fun m!1288841 () Bool)

(assert (=> b!1401464 m!1288841))

(assert (=> b!1401464 m!1288841))

(declare-fun m!1288843 () Bool)

(assert (=> b!1401464 m!1288843))

(assert (=> b!1401464 m!1288825))

(declare-fun m!1288845 () Bool)

(assert (=> b!1401464 m!1288845))

(declare-fun m!1288847 () Bool)

(assert (=> b!1401462 m!1288847))

(assert (=> b!1401462 m!1288847))

(declare-fun m!1288849 () Bool)

(assert (=> b!1401462 m!1288849))

(assert (=> b!1401465 m!1288837))

(declare-fun m!1288851 () Bool)

(assert (=> b!1401465 m!1288851))

(declare-fun m!1288853 () Bool)

(assert (=> b!1401465 m!1288853))

(assert (=> b!1401465 m!1288837))

(declare-fun m!1288855 () Bool)

(assert (=> b!1401465 m!1288855))

(assert (=> b!1401465 m!1288837))

(declare-fun m!1288857 () Bool)

(assert (=> b!1401465 m!1288857))

(declare-fun m!1288859 () Bool)

(assert (=> b!1401471 m!1288859))

(assert (=> b!1401461 m!1288837))

(assert (=> b!1401461 m!1288837))

(declare-fun m!1288861 () Bool)

(assert (=> b!1401461 m!1288861))

(declare-fun m!1288863 () Bool)

(assert (=> b!1401468 m!1288863))

(assert (=> b!1401469 m!1288837))

(assert (=> b!1401469 m!1288837))

(declare-fun m!1288865 () Bool)

(assert (=> b!1401469 m!1288865))

(declare-fun m!1288867 () Bool)

(assert (=> b!1401467 m!1288867))

(check-sat (not b!1401466) (not b!1401469) (not b!1401467) (not start!120392) (not b!1401465) (not b!1401468) (not b!1401462) (not b!1401470) (not b!1401464) (not b!1401471) (not b!1401461))
(check-sat)
