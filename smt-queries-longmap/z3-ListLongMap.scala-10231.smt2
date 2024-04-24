; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120626 () Bool)

(assert start!120626)

(declare-fun b!1403373 () Bool)

(declare-fun e!794773 () Bool)

(declare-fun e!794775 () Bool)

(assert (=> b!1403373 (= e!794773 (not e!794775))))

(declare-fun res!941206 () Bool)

(assert (=> b!1403373 (=> res!941206 e!794775)))

(declare-datatypes ((SeekEntryResult!10547 0))(
  ( (MissingZero!10547 (index!44565 (_ BitVec 32))) (Found!10547 (index!44566 (_ BitVec 32))) (Intermediate!10547 (undefined!11359 Bool) (index!44567 (_ BitVec 32)) (x!126345 (_ BitVec 32))) (Undefined!10547) (MissingVacant!10547 (index!44568 (_ BitVec 32))) )
))
(declare-fun lt!617913 () SeekEntryResult!10547)

(get-info :version)

(assert (=> b!1403373 (= res!941206 (or (not ((_ is Intermediate!10547) lt!617913)) (undefined!11359 lt!617913)))))

(declare-fun lt!617919 () SeekEntryResult!10547)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403373 (= lt!617919 (Found!10547 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95957 0))(
  ( (array!95958 (arr!46327 (Array (_ BitVec 32) (_ BitVec 64))) (size!46878 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95957)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95957 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1403373 (= lt!617919 (seekEntryOrOpen!0 (select (arr!46327 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95957 (_ BitVec 32)) Bool)

(assert (=> b!1403373 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47125 0))(
  ( (Unit!47126) )
))
(declare-fun lt!617916 () Unit!47125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47125)

(assert (=> b!1403373 (= lt!617916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617912 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95957 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1403373 (= lt!617913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617912 (select (arr!46327 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403373 (= lt!617912 (toIndex!0 (select (arr!46327 a!2901) j!112) mask!2840))))

(declare-fun b!1403374 () Bool)

(declare-fun e!794774 () Bool)

(assert (=> b!1403374 (= e!794774 true)))

(declare-fun lt!617918 () SeekEntryResult!10547)

(assert (=> b!1403374 (= lt!617919 lt!617918)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!617920 () Unit!47125)

(declare-fun lt!617915 () SeekEntryResult!10547)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47125)

(assert (=> b!1403374 (= lt!617920 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617912 (x!126345 lt!617913) (index!44567 lt!617913) (x!126345 lt!617915) (index!44567 lt!617915) mask!2840))))

(declare-fun b!1403375 () Bool)

(declare-fun res!941200 () Bool)

(assert (=> b!1403375 (=> (not res!941200) (not e!794773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403375 (= res!941200 (validKeyInArray!0 (select (arr!46327 a!2901) i!1037)))))

(declare-fun b!1403376 () Bool)

(declare-fun res!941204 () Bool)

(assert (=> b!1403376 (=> (not res!941204) (not e!794773))))

(assert (=> b!1403376 (= res!941204 (validKeyInArray!0 (select (arr!46327 a!2901) j!112)))))

(declare-fun b!1403377 () Bool)

(declare-fun res!941209 () Bool)

(assert (=> b!1403377 (=> (not res!941209) (not e!794773))))

(declare-datatypes ((List!32833 0))(
  ( (Nil!32830) (Cons!32829 (h!34085 (_ BitVec 64)) (t!47519 List!32833)) )
))
(declare-fun arrayNoDuplicates!0 (array!95957 (_ BitVec 32) List!32833) Bool)

(assert (=> b!1403377 (= res!941209 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32830))))

(declare-fun b!1403378 () Bool)

(declare-fun res!941208 () Bool)

(assert (=> b!1403378 (=> (not res!941208) (not e!794773))))

(assert (=> b!1403378 (= res!941208 (and (= (size!46878 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46878 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46878 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403379 () Bool)

(declare-fun res!941203 () Bool)

(assert (=> b!1403379 (=> res!941203 e!794774)))

(declare-fun lt!617917 () array!95957)

(declare-fun lt!617921 () (_ BitVec 64))

(assert (=> b!1403379 (= res!941203 (not (= lt!617915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617912 lt!617921 lt!617917 mask!2840))))))

(declare-fun b!1403380 () Bool)

(declare-fun e!794776 () Bool)

(assert (=> b!1403380 (= e!794775 e!794776)))

(declare-fun res!941205 () Bool)

(assert (=> b!1403380 (=> res!941205 e!794776)))

(assert (=> b!1403380 (= res!941205 (or (= lt!617913 lt!617915) (not ((_ is Intermediate!10547) lt!617915))))))

(assert (=> b!1403380 (= lt!617915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617921 mask!2840) lt!617921 lt!617917 mask!2840))))

(assert (=> b!1403380 (= lt!617921 (select (store (arr!46327 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403380 (= lt!617917 (array!95958 (store (arr!46327 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46878 a!2901)))))

(declare-fun res!941202 () Bool)

(assert (=> start!120626 (=> (not res!941202) (not e!794773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120626 (= res!941202 (validMask!0 mask!2840))))

(assert (=> start!120626 e!794773))

(assert (=> start!120626 true))

(declare-fun array_inv!35608 (array!95957) Bool)

(assert (=> start!120626 (array_inv!35608 a!2901)))

(declare-fun b!1403381 () Bool)

(assert (=> b!1403381 (= e!794776 e!794774)))

(declare-fun res!941207 () Bool)

(assert (=> b!1403381 (=> res!941207 e!794774)))

(assert (=> b!1403381 (= res!941207 (or (bvslt (x!126345 lt!617913) #b00000000000000000000000000000000) (bvsgt (x!126345 lt!617913) #b01111111111111111111111111111110) (bvslt (x!126345 lt!617915) #b00000000000000000000000000000000) (bvsgt (x!126345 lt!617915) #b01111111111111111111111111111110) (bvslt lt!617912 #b00000000000000000000000000000000) (bvsge lt!617912 (size!46878 a!2901)) (bvslt (index!44567 lt!617913) #b00000000000000000000000000000000) (bvsge (index!44567 lt!617913) (size!46878 a!2901)) (bvslt (index!44567 lt!617915) #b00000000000000000000000000000000) (bvsge (index!44567 lt!617915) (size!46878 a!2901)) (not (= lt!617913 (Intermediate!10547 false (index!44567 lt!617913) (x!126345 lt!617913)))) (not (= lt!617915 (Intermediate!10547 false (index!44567 lt!617915) (x!126345 lt!617915))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95957 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1403381 (= lt!617918 (seekKeyOrZeroReturnVacant!0 (x!126345 lt!617915) (index!44567 lt!617915) (index!44567 lt!617915) (select (arr!46327 a!2901) j!112) lt!617917 mask!2840))))

(assert (=> b!1403381 (= lt!617918 (seekEntryOrOpen!0 lt!617921 lt!617917 mask!2840))))

(assert (=> b!1403381 (and (not (undefined!11359 lt!617915)) (= (index!44567 lt!617915) i!1037) (bvslt (x!126345 lt!617915) (x!126345 lt!617913)) (= (select (store (arr!46327 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44567 lt!617915)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617914 () Unit!47125)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47125)

(assert (=> b!1403381 (= lt!617914 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617912 (x!126345 lt!617913) (index!44567 lt!617913) (x!126345 lt!617915) (index!44567 lt!617915) (undefined!11359 lt!617915) mask!2840))))

(declare-fun b!1403382 () Bool)

(declare-fun res!941201 () Bool)

(assert (=> b!1403382 (=> (not res!941201) (not e!794773))))

(assert (=> b!1403382 (= res!941201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120626 res!941202) b!1403378))

(assert (= (and b!1403378 res!941208) b!1403375))

(assert (= (and b!1403375 res!941200) b!1403376))

(assert (= (and b!1403376 res!941204) b!1403382))

(assert (= (and b!1403382 res!941201) b!1403377))

(assert (= (and b!1403377 res!941209) b!1403373))

(assert (= (and b!1403373 (not res!941206)) b!1403380))

(assert (= (and b!1403380 (not res!941205)) b!1403381))

(assert (= (and b!1403381 (not res!941207)) b!1403379))

(assert (= (and b!1403379 (not res!941203)) b!1403374))

(declare-fun m!1291657 () Bool)

(assert (=> b!1403377 m!1291657))

(declare-fun m!1291659 () Bool)

(assert (=> b!1403380 m!1291659))

(assert (=> b!1403380 m!1291659))

(declare-fun m!1291661 () Bool)

(assert (=> b!1403380 m!1291661))

(declare-fun m!1291663 () Bool)

(assert (=> b!1403380 m!1291663))

(declare-fun m!1291665 () Bool)

(assert (=> b!1403380 m!1291665))

(declare-fun m!1291667 () Bool)

(assert (=> b!1403382 m!1291667))

(declare-fun m!1291669 () Bool)

(assert (=> b!1403373 m!1291669))

(declare-fun m!1291671 () Bool)

(assert (=> b!1403373 m!1291671))

(assert (=> b!1403373 m!1291669))

(declare-fun m!1291673 () Bool)

(assert (=> b!1403373 m!1291673))

(assert (=> b!1403373 m!1291669))

(declare-fun m!1291675 () Bool)

(assert (=> b!1403373 m!1291675))

(declare-fun m!1291677 () Bool)

(assert (=> b!1403373 m!1291677))

(assert (=> b!1403373 m!1291669))

(declare-fun m!1291679 () Bool)

(assert (=> b!1403373 m!1291679))

(declare-fun m!1291681 () Bool)

(assert (=> b!1403379 m!1291681))

(declare-fun m!1291683 () Bool)

(assert (=> b!1403375 m!1291683))

(assert (=> b!1403375 m!1291683))

(declare-fun m!1291685 () Bool)

(assert (=> b!1403375 m!1291685))

(declare-fun m!1291687 () Bool)

(assert (=> start!120626 m!1291687))

(declare-fun m!1291689 () Bool)

(assert (=> start!120626 m!1291689))

(assert (=> b!1403376 m!1291669))

(assert (=> b!1403376 m!1291669))

(declare-fun m!1291691 () Bool)

(assert (=> b!1403376 m!1291691))

(declare-fun m!1291693 () Bool)

(assert (=> b!1403381 m!1291693))

(declare-fun m!1291695 () Bool)

(assert (=> b!1403381 m!1291695))

(assert (=> b!1403381 m!1291669))

(declare-fun m!1291697 () Bool)

(assert (=> b!1403381 m!1291697))

(assert (=> b!1403381 m!1291663))

(declare-fun m!1291699 () Bool)

(assert (=> b!1403381 m!1291699))

(assert (=> b!1403381 m!1291669))

(declare-fun m!1291701 () Bool)

(assert (=> b!1403374 m!1291701))

(check-sat (not b!1403376) (not b!1403380) (not b!1403377) (not start!120626) (not b!1403381) (not b!1403375) (not b!1403379) (not b!1403374) (not b!1403382) (not b!1403373))
(check-sat)
