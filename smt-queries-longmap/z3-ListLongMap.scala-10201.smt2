; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120188 () Bool)

(assert start!120188)

(declare-fun b!1398925 () Bool)

(declare-fun e!791983 () Bool)

(declare-fun e!791986 () Bool)

(assert (=> b!1398925 (= e!791983 e!791986)))

(declare-fun res!937725 () Bool)

(assert (=> b!1398925 (=> res!937725 e!791986)))

(declare-datatypes ((SeekEntryResult!10502 0))(
  ( (MissingZero!10502 (index!44382 (_ BitVec 32))) (Found!10502 (index!44383 (_ BitVec 32))) (Intermediate!10502 (undefined!11314 Bool) (index!44384 (_ BitVec 32)) (x!126026 (_ BitVec 32))) (Undefined!10502) (MissingVacant!10502 (index!44385 (_ BitVec 32))) )
))
(declare-fun lt!615073 () SeekEntryResult!10502)

(declare-fun lt!615075 () SeekEntryResult!10502)

(get-info :version)

(assert (=> b!1398925 (= res!937725 (or (= lt!615073 lt!615075) (not ((_ is Intermediate!10502) lt!615075))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95613 0))(
  ( (array!95614 (arr!46159 (Array (_ BitVec 32) (_ BitVec 64))) (size!46711 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95613)

(declare-fun lt!615076 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95613 (_ BitVec 32)) SeekEntryResult!10502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398925 (= lt!615075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615076 mask!2840) lt!615076 (array!95614 (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46711 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398925 (= lt!615076 (select (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398926 () Bool)

(declare-fun res!937729 () Bool)

(declare-fun e!791984 () Bool)

(assert (=> b!1398926 (=> (not res!937729) (not e!791984))))

(declare-datatypes ((List!32756 0))(
  ( (Nil!32753) (Cons!32752 (h!33997 (_ BitVec 64)) (t!47442 List!32756)) )
))
(declare-fun arrayNoDuplicates!0 (array!95613 (_ BitVec 32) List!32756) Bool)

(assert (=> b!1398926 (= res!937729 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32753))))

(declare-fun b!1398927 () Bool)

(declare-fun res!937724 () Bool)

(assert (=> b!1398927 (=> (not res!937724) (not e!791984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398927 (= res!937724 (validKeyInArray!0 (select (arr!46159 a!2901) j!112)))))

(declare-fun b!1398928 () Bool)

(declare-fun res!937728 () Bool)

(assert (=> b!1398928 (=> (not res!937728) (not e!791984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95613 (_ BitVec 32)) Bool)

(assert (=> b!1398928 (= res!937728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!937732 () Bool)

(assert (=> start!120188 (=> (not res!937732) (not e!791984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120188 (= res!937732 (validMask!0 mask!2840))))

(assert (=> start!120188 e!791984))

(assert (=> start!120188 true))

(declare-fun array_inv!35392 (array!95613) Bool)

(assert (=> start!120188 (array_inv!35392 a!2901)))

(declare-fun e!791985 () Bool)

(declare-fun b!1398929 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95613 (_ BitVec 32)) SeekEntryResult!10502)

(assert (=> b!1398929 (= e!791985 (= (seekEntryOrOpen!0 (select (arr!46159 a!2901) j!112) a!2901 mask!2840) (Found!10502 j!112)))))

(declare-fun b!1398930 () Bool)

(assert (=> b!1398930 (= e!791984 (not e!791983))))

(declare-fun res!937731 () Bool)

(assert (=> b!1398930 (=> res!937731 e!791983)))

(assert (=> b!1398930 (= res!937731 (or (not ((_ is Intermediate!10502) lt!615073)) (undefined!11314 lt!615073)))))

(assert (=> b!1398930 e!791985))

(declare-fun res!937726 () Bool)

(assert (=> b!1398930 (=> (not res!937726) (not e!791985))))

(assert (=> b!1398930 (= res!937726 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46851 0))(
  ( (Unit!46852) )
))
(declare-fun lt!615077 () Unit!46851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46851)

(assert (=> b!1398930 (= lt!615077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615074 () (_ BitVec 32))

(assert (=> b!1398930 (= lt!615073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615074 (select (arr!46159 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398930 (= lt!615074 (toIndex!0 (select (arr!46159 a!2901) j!112) mask!2840))))

(declare-fun b!1398931 () Bool)

(declare-fun res!937730 () Bool)

(assert (=> b!1398931 (=> (not res!937730) (not e!791984))))

(assert (=> b!1398931 (= res!937730 (and (= (size!46711 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46711 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46711 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398932 () Bool)

(assert (=> b!1398932 (= e!791986 true)))

(assert (=> b!1398932 (and (not (undefined!11314 lt!615075)) (= (index!44384 lt!615075) i!1037) (bvslt (x!126026 lt!615075) (x!126026 lt!615073)) (= (select (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44384 lt!615075)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615072 () Unit!46851)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46851)

(assert (=> b!1398932 (= lt!615072 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615074 (x!126026 lt!615073) (index!44384 lt!615073) (x!126026 lt!615075) (index!44384 lt!615075) (undefined!11314 lt!615075) mask!2840))))

(declare-fun b!1398933 () Bool)

(declare-fun res!937727 () Bool)

(assert (=> b!1398933 (=> (not res!937727) (not e!791984))))

(assert (=> b!1398933 (= res!937727 (validKeyInArray!0 (select (arr!46159 a!2901) i!1037)))))

(assert (= (and start!120188 res!937732) b!1398931))

(assert (= (and b!1398931 res!937730) b!1398933))

(assert (= (and b!1398933 res!937727) b!1398927))

(assert (= (and b!1398927 res!937724) b!1398928))

(assert (= (and b!1398928 res!937728) b!1398926))

(assert (= (and b!1398926 res!937729) b!1398930))

(assert (= (and b!1398930 res!937726) b!1398929))

(assert (= (and b!1398930 (not res!937731)) b!1398925))

(assert (= (and b!1398925 (not res!937725)) b!1398932))

(declare-fun m!1285633 () Bool)

(assert (=> b!1398925 m!1285633))

(declare-fun m!1285635 () Bool)

(assert (=> b!1398925 m!1285635))

(assert (=> b!1398925 m!1285633))

(declare-fun m!1285637 () Bool)

(assert (=> b!1398925 m!1285637))

(declare-fun m!1285639 () Bool)

(assert (=> b!1398925 m!1285639))

(declare-fun m!1285641 () Bool)

(assert (=> start!120188 m!1285641))

(declare-fun m!1285643 () Bool)

(assert (=> start!120188 m!1285643))

(declare-fun m!1285645 () Bool)

(assert (=> b!1398927 m!1285645))

(assert (=> b!1398927 m!1285645))

(declare-fun m!1285647 () Bool)

(assert (=> b!1398927 m!1285647))

(assert (=> b!1398929 m!1285645))

(assert (=> b!1398929 m!1285645))

(declare-fun m!1285649 () Bool)

(assert (=> b!1398929 m!1285649))

(declare-fun m!1285651 () Bool)

(assert (=> b!1398926 m!1285651))

(declare-fun m!1285653 () Bool)

(assert (=> b!1398928 m!1285653))

(assert (=> b!1398932 m!1285635))

(declare-fun m!1285655 () Bool)

(assert (=> b!1398932 m!1285655))

(declare-fun m!1285657 () Bool)

(assert (=> b!1398932 m!1285657))

(assert (=> b!1398930 m!1285645))

(declare-fun m!1285659 () Bool)

(assert (=> b!1398930 m!1285659))

(assert (=> b!1398930 m!1285645))

(declare-fun m!1285661 () Bool)

(assert (=> b!1398930 m!1285661))

(assert (=> b!1398930 m!1285645))

(declare-fun m!1285663 () Bool)

(assert (=> b!1398930 m!1285663))

(declare-fun m!1285665 () Bool)

(assert (=> b!1398930 m!1285665))

(declare-fun m!1285667 () Bool)

(assert (=> b!1398933 m!1285667))

(assert (=> b!1398933 m!1285667))

(declare-fun m!1285669 () Bool)

(assert (=> b!1398933 m!1285669))

(check-sat (not b!1398933) (not b!1398925) (not b!1398927) (not b!1398929) (not b!1398930) (not b!1398932) (not b!1398926) (not b!1398928) (not start!120188))
(check-sat)
