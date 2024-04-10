; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120314 () Bool)

(assert start!120314)

(declare-fun b!1400189 () Bool)

(declare-fun e!792739 () Bool)

(assert (=> b!1400189 (= e!792739 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95723 0))(
  ( (array!95724 (arr!46212 (Array (_ BitVec 32) (_ BitVec 64))) (size!46762 (_ BitVec 32))) )
))
(declare-fun lt!616029 () array!95723)

(declare-fun lt!616024 () (_ BitVec 32))

(declare-fun lt!616026 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10529 0))(
  ( (MissingZero!10529 (index!44493 (_ BitVec 32))) (Found!10529 (index!44494 (_ BitVec 32))) (Intermediate!10529 (undefined!11341 Bool) (index!44495 (_ BitVec 32)) (x!126140 (_ BitVec 32))) (Undefined!10529) (MissingVacant!10529 (index!44496 (_ BitVec 32))) )
))
(declare-fun lt!616023 () SeekEntryResult!10529)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95723 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1400189 (= lt!616023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616024 lt!616026 lt!616029 mask!2840))))

(declare-fun b!1400190 () Bool)

(declare-fun res!938700 () Bool)

(declare-fun e!792738 () Bool)

(assert (=> b!1400190 (=> (not res!938700) (not e!792738))))

(declare-fun a!2901 () array!95723)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400190 (= res!938700 (validKeyInArray!0 (select (arr!46212 a!2901) j!112)))))

(declare-fun b!1400191 () Bool)

(declare-fun e!792743 () Bool)

(assert (=> b!1400191 (= e!792738 (not e!792743))))

(declare-fun res!938709 () Bool)

(assert (=> b!1400191 (=> res!938709 e!792743)))

(declare-fun lt!616028 () SeekEntryResult!10529)

(get-info :version)

(assert (=> b!1400191 (= res!938709 (or (not ((_ is Intermediate!10529) lt!616028)) (undefined!11341 lt!616028)))))

(declare-fun e!792740 () Bool)

(assert (=> b!1400191 e!792740))

(declare-fun res!938707 () Bool)

(assert (=> b!1400191 (=> (not res!938707) (not e!792740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95723 (_ BitVec 32)) Bool)

(assert (=> b!1400191 (= res!938707 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47062 0))(
  ( (Unit!47063) )
))
(declare-fun lt!616027 () Unit!47062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47062)

(assert (=> b!1400191 (= lt!616027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400191 (= lt!616028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616024 (select (arr!46212 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400191 (= lt!616024 (toIndex!0 (select (arr!46212 a!2901) j!112) mask!2840))))

(declare-fun b!1400192 () Bool)

(declare-fun e!792737 () Bool)

(assert (=> b!1400192 (= e!792743 e!792737)))

(declare-fun res!938704 () Bool)

(assert (=> b!1400192 (=> res!938704 e!792737)))

(declare-fun lt!616025 () SeekEntryResult!10529)

(assert (=> b!1400192 (= res!938704 (or (= lt!616028 lt!616025) (not ((_ is Intermediate!10529) lt!616025))))))

(assert (=> b!1400192 (= lt!616025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616026 mask!2840) lt!616026 lt!616029 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400192 (= lt!616026 (select (store (arr!46212 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400192 (= lt!616029 (array!95724 (store (arr!46212 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46762 a!2901)))))

(declare-fun b!1400193 () Bool)

(declare-fun res!938708 () Bool)

(assert (=> b!1400193 (=> (not res!938708) (not e!792738))))

(assert (=> b!1400193 (= res!938708 (and (= (size!46762 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46762 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46762 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!938710 () Bool)

(assert (=> start!120314 (=> (not res!938710) (not e!792738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120314 (= res!938710 (validMask!0 mask!2840))))

(assert (=> start!120314 e!792738))

(assert (=> start!120314 true))

(declare-fun array_inv!35240 (array!95723) Bool)

(assert (=> start!120314 (array_inv!35240 a!2901)))

(declare-fun b!1400194 () Bool)

(declare-fun res!938705 () Bool)

(assert (=> b!1400194 (=> (not res!938705) (not e!792738))))

(assert (=> b!1400194 (= res!938705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!792741 () Bool)

(declare-fun b!1400195 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95723 (_ BitVec 32)) SeekEntryResult!10529)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95723 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1400195 (= e!792741 (= (seekEntryOrOpen!0 lt!616026 lt!616029 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126140 lt!616025) (index!44495 lt!616025) (index!44495 lt!616025) (select (arr!46212 a!2901) j!112) lt!616029 mask!2840)))))

(declare-fun b!1400196 () Bool)

(declare-fun res!938701 () Bool)

(assert (=> b!1400196 (=> (not res!938701) (not e!792738))))

(declare-datatypes ((List!32731 0))(
  ( (Nil!32728) (Cons!32727 (h!33975 (_ BitVec 64)) (t!47425 List!32731)) )
))
(declare-fun arrayNoDuplicates!0 (array!95723 (_ BitVec 32) List!32731) Bool)

(assert (=> b!1400196 (= res!938701 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32728))))

(declare-fun b!1400197 () Bool)

(assert (=> b!1400197 (= e!792737 e!792739)))

(declare-fun res!938706 () Bool)

(assert (=> b!1400197 (=> res!938706 e!792739)))

(assert (=> b!1400197 (= res!938706 (or (bvslt (x!126140 lt!616028) #b00000000000000000000000000000000) (bvsgt (x!126140 lt!616028) #b01111111111111111111111111111110) (bvslt (x!126140 lt!616025) #b00000000000000000000000000000000) (bvsgt (x!126140 lt!616025) #b01111111111111111111111111111110) (bvslt lt!616024 #b00000000000000000000000000000000) (bvsge lt!616024 (size!46762 a!2901)) (bvslt (index!44495 lt!616028) #b00000000000000000000000000000000) (bvsge (index!44495 lt!616028) (size!46762 a!2901)) (bvslt (index!44495 lt!616025) #b00000000000000000000000000000000) (bvsge (index!44495 lt!616025) (size!46762 a!2901)) (not (= lt!616028 (Intermediate!10529 false (index!44495 lt!616028) (x!126140 lt!616028)))) (not (= lt!616025 (Intermediate!10529 false (index!44495 lt!616025) (x!126140 lt!616025))))))))

(assert (=> b!1400197 e!792741))

(declare-fun res!938703 () Bool)

(assert (=> b!1400197 (=> (not res!938703) (not e!792741))))

(assert (=> b!1400197 (= res!938703 (and (not (undefined!11341 lt!616025)) (= (index!44495 lt!616025) i!1037) (bvslt (x!126140 lt!616025) (x!126140 lt!616028)) (= (select (store (arr!46212 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44495 lt!616025)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616022 () Unit!47062)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47062)

(assert (=> b!1400197 (= lt!616022 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616024 (x!126140 lt!616028) (index!44495 lt!616028) (x!126140 lt!616025) (index!44495 lt!616025) (undefined!11341 lt!616025) mask!2840))))

(declare-fun b!1400198 () Bool)

(declare-fun res!938702 () Bool)

(assert (=> b!1400198 (=> (not res!938702) (not e!792738))))

(assert (=> b!1400198 (= res!938702 (validKeyInArray!0 (select (arr!46212 a!2901) i!1037)))))

(declare-fun b!1400199 () Bool)

(assert (=> b!1400199 (= e!792740 (= (seekEntryOrOpen!0 (select (arr!46212 a!2901) j!112) a!2901 mask!2840) (Found!10529 j!112)))))

(assert (= (and start!120314 res!938710) b!1400193))

(assert (= (and b!1400193 res!938708) b!1400198))

(assert (= (and b!1400198 res!938702) b!1400190))

(assert (= (and b!1400190 res!938700) b!1400194))

(assert (= (and b!1400194 res!938705) b!1400196))

(assert (= (and b!1400196 res!938701) b!1400191))

(assert (= (and b!1400191 res!938707) b!1400199))

(assert (= (and b!1400191 (not res!938709)) b!1400192))

(assert (= (and b!1400192 (not res!938704)) b!1400197))

(assert (= (and b!1400197 res!938703) b!1400195))

(assert (= (and b!1400197 (not res!938706)) b!1400189))

(declare-fun m!1287557 () Bool)

(assert (=> b!1400194 m!1287557))

(declare-fun m!1287559 () Bool)

(assert (=> b!1400189 m!1287559))

(declare-fun m!1287561 () Bool)

(assert (=> b!1400195 m!1287561))

(declare-fun m!1287563 () Bool)

(assert (=> b!1400195 m!1287563))

(assert (=> b!1400195 m!1287563))

(declare-fun m!1287565 () Bool)

(assert (=> b!1400195 m!1287565))

(declare-fun m!1287567 () Bool)

(assert (=> b!1400197 m!1287567))

(declare-fun m!1287569 () Bool)

(assert (=> b!1400197 m!1287569))

(declare-fun m!1287571 () Bool)

(assert (=> b!1400197 m!1287571))

(declare-fun m!1287573 () Bool)

(assert (=> b!1400198 m!1287573))

(assert (=> b!1400198 m!1287573))

(declare-fun m!1287575 () Bool)

(assert (=> b!1400198 m!1287575))

(declare-fun m!1287577 () Bool)

(assert (=> start!120314 m!1287577))

(declare-fun m!1287579 () Bool)

(assert (=> start!120314 m!1287579))

(assert (=> b!1400199 m!1287563))

(assert (=> b!1400199 m!1287563))

(declare-fun m!1287581 () Bool)

(assert (=> b!1400199 m!1287581))

(declare-fun m!1287583 () Bool)

(assert (=> b!1400196 m!1287583))

(assert (=> b!1400191 m!1287563))

(declare-fun m!1287585 () Bool)

(assert (=> b!1400191 m!1287585))

(assert (=> b!1400191 m!1287563))

(declare-fun m!1287587 () Bool)

(assert (=> b!1400191 m!1287587))

(declare-fun m!1287589 () Bool)

(assert (=> b!1400191 m!1287589))

(assert (=> b!1400191 m!1287563))

(declare-fun m!1287591 () Bool)

(assert (=> b!1400191 m!1287591))

(assert (=> b!1400190 m!1287563))

(assert (=> b!1400190 m!1287563))

(declare-fun m!1287593 () Bool)

(assert (=> b!1400190 m!1287593))

(declare-fun m!1287595 () Bool)

(assert (=> b!1400192 m!1287595))

(assert (=> b!1400192 m!1287595))

(declare-fun m!1287597 () Bool)

(assert (=> b!1400192 m!1287597))

(assert (=> b!1400192 m!1287567))

(declare-fun m!1287599 () Bool)

(assert (=> b!1400192 m!1287599))

(check-sat (not start!120314) (not b!1400192) (not b!1400195) (not b!1400197) (not b!1400194) (not b!1400198) (not b!1400189) (not b!1400190) (not b!1400191) (not b!1400196) (not b!1400199))
(check-sat)
