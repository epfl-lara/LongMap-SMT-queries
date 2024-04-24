; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121682 () Bool)

(assert start!121682)

(declare-fun b!1412854 () Bool)

(declare-fun e!799615 () Bool)

(assert (=> b!1412854 (= e!799615 true)))

(declare-datatypes ((array!96605 0))(
  ( (array!96606 (arr!46639 (Array (_ BitVec 32) (_ BitVec 64))) (size!47190 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96605)

(declare-datatypes ((SeekEntryResult!10853 0))(
  ( (MissingZero!10853 (index!45789 (_ BitVec 32))) (Found!10853 (index!45790 (_ BitVec 32))) (Intermediate!10853 (undefined!11665 Bool) (index!45791 (_ BitVec 32)) (x!127531 (_ BitVec 32))) (Undefined!10853) (MissingVacant!10853 (index!45792 (_ BitVec 32))) )
))
(declare-fun lt!622301 () SeekEntryResult!10853)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622299 () SeekEntryResult!10853)

(assert (=> b!1412854 (and (not (undefined!11665 lt!622299)) (= (index!45791 lt!622299) i!1037) (bvslt (x!127531 lt!622299) (x!127531 lt!622301)) (= (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45791 lt!622299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622300 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47707 0))(
  ( (Unit!47708) )
))
(declare-fun lt!622296 () Unit!47707)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47707)

(assert (=> b!1412854 (= lt!622296 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622300 (x!127531 lt!622301) (index!45791 lt!622301) (x!127531 lt!622299) (index!45791 lt!622299) (undefined!11665 lt!622299) mask!2840))))

(declare-fun b!1412855 () Bool)

(declare-fun res!949399 () Bool)

(declare-fun e!799617 () Bool)

(assert (=> b!1412855 (=> (not res!949399) (not e!799617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412855 (= res!949399 (validKeyInArray!0 (select (arr!46639 a!2901) j!112)))))

(declare-fun b!1412856 () Bool)

(declare-fun res!949401 () Bool)

(assert (=> b!1412856 (=> (not res!949401) (not e!799617))))

(assert (=> b!1412856 (= res!949401 (and (= (size!47190 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47190 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47190 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412857 () Bool)

(declare-fun e!799618 () Bool)

(assert (=> b!1412857 (= e!799618 e!799615)))

(declare-fun res!949397 () Bool)

(assert (=> b!1412857 (=> res!949397 e!799615)))

(get-info :version)

(assert (=> b!1412857 (= res!949397 (or (= lt!622301 lt!622299) (not ((_ is Intermediate!10853) lt!622299))))))

(declare-fun lt!622298 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96605 (_ BitVec 32)) SeekEntryResult!10853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412857 (= lt!622299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622298 mask!2840) lt!622298 (array!96606 (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47190 a!2901)) mask!2840))))

(assert (=> b!1412857 (= lt!622298 (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun e!799616 () Bool)

(declare-fun b!1412859 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96605 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1412859 (= e!799616 (= (seekEntryOrOpen!0 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) (Found!10853 j!112)))))

(declare-fun b!1412860 () Bool)

(assert (=> b!1412860 (= e!799617 (not e!799618))))

(declare-fun res!949405 () Bool)

(assert (=> b!1412860 (=> res!949405 e!799618)))

(assert (=> b!1412860 (= res!949405 (or (not ((_ is Intermediate!10853) lt!622301)) (undefined!11665 lt!622301)))))

(assert (=> b!1412860 e!799616))

(declare-fun res!949402 () Bool)

(assert (=> b!1412860 (=> (not res!949402) (not e!799616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96605 (_ BitVec 32)) Bool)

(assert (=> b!1412860 (= res!949402 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622297 () Unit!47707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47707)

(assert (=> b!1412860 (= lt!622297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412860 (= lt!622301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622300 (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412860 (= lt!622300 (toIndex!0 (select (arr!46639 a!2901) j!112) mask!2840))))

(declare-fun b!1412861 () Bool)

(declare-fun res!949398 () Bool)

(assert (=> b!1412861 (=> (not res!949398) (not e!799617))))

(assert (=> b!1412861 (= res!949398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412862 () Bool)

(declare-fun res!949404 () Bool)

(assert (=> b!1412862 (=> (not res!949404) (not e!799617))))

(assert (=> b!1412862 (= res!949404 (validKeyInArray!0 (select (arr!46639 a!2901) i!1037)))))

(declare-fun b!1412858 () Bool)

(declare-fun res!949403 () Bool)

(assert (=> b!1412858 (=> (not res!949403) (not e!799617))))

(declare-datatypes ((List!33145 0))(
  ( (Nil!33142) (Cons!33141 (h!34421 (_ BitVec 64)) (t!47831 List!33145)) )
))
(declare-fun arrayNoDuplicates!0 (array!96605 (_ BitVec 32) List!33145) Bool)

(assert (=> b!1412858 (= res!949403 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33142))))

(declare-fun res!949400 () Bool)

(assert (=> start!121682 (=> (not res!949400) (not e!799617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121682 (= res!949400 (validMask!0 mask!2840))))

(assert (=> start!121682 e!799617))

(assert (=> start!121682 true))

(declare-fun array_inv!35920 (array!96605) Bool)

(assert (=> start!121682 (array_inv!35920 a!2901)))

(assert (= (and start!121682 res!949400) b!1412856))

(assert (= (and b!1412856 res!949401) b!1412862))

(assert (= (and b!1412862 res!949404) b!1412855))

(assert (= (and b!1412855 res!949399) b!1412861))

(assert (= (and b!1412861 res!949398) b!1412858))

(assert (= (and b!1412858 res!949403) b!1412860))

(assert (= (and b!1412860 res!949402) b!1412859))

(assert (= (and b!1412860 (not res!949405)) b!1412857))

(assert (= (and b!1412857 (not res!949397)) b!1412854))

(declare-fun m!1303045 () Bool)

(assert (=> b!1412858 m!1303045))

(declare-fun m!1303047 () Bool)

(assert (=> b!1412861 m!1303047))

(declare-fun m!1303049 () Bool)

(assert (=> b!1412857 m!1303049))

(declare-fun m!1303051 () Bool)

(assert (=> b!1412857 m!1303051))

(assert (=> b!1412857 m!1303049))

(declare-fun m!1303053 () Bool)

(assert (=> b!1412857 m!1303053))

(declare-fun m!1303055 () Bool)

(assert (=> b!1412857 m!1303055))

(declare-fun m!1303057 () Bool)

(assert (=> start!121682 m!1303057))

(declare-fun m!1303059 () Bool)

(assert (=> start!121682 m!1303059))

(assert (=> b!1412854 m!1303051))

(declare-fun m!1303061 () Bool)

(assert (=> b!1412854 m!1303061))

(declare-fun m!1303063 () Bool)

(assert (=> b!1412854 m!1303063))

(declare-fun m!1303065 () Bool)

(assert (=> b!1412855 m!1303065))

(assert (=> b!1412855 m!1303065))

(declare-fun m!1303067 () Bool)

(assert (=> b!1412855 m!1303067))

(declare-fun m!1303069 () Bool)

(assert (=> b!1412862 m!1303069))

(assert (=> b!1412862 m!1303069))

(declare-fun m!1303071 () Bool)

(assert (=> b!1412862 m!1303071))

(assert (=> b!1412860 m!1303065))

(declare-fun m!1303073 () Bool)

(assert (=> b!1412860 m!1303073))

(assert (=> b!1412860 m!1303065))

(declare-fun m!1303075 () Bool)

(assert (=> b!1412860 m!1303075))

(declare-fun m!1303077 () Bool)

(assert (=> b!1412860 m!1303077))

(assert (=> b!1412860 m!1303065))

(declare-fun m!1303079 () Bool)

(assert (=> b!1412860 m!1303079))

(assert (=> b!1412859 m!1303065))

(assert (=> b!1412859 m!1303065))

(declare-fun m!1303081 () Bool)

(assert (=> b!1412859 m!1303081))

(check-sat (not b!1412859) (not b!1412860) (not start!121682) (not b!1412862) (not b!1412855) (not b!1412854) (not b!1412857) (not b!1412861) (not b!1412858))
(check-sat)
