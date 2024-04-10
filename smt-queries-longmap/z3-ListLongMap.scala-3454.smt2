; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47918 () Bool)

(assert start!47918)

(declare-fun b!527898 () Bool)

(declare-fun res!324159 () Bool)

(declare-fun e!307640 () Bool)

(assert (=> b!527898 (=> res!324159 e!307640)))

(declare-datatypes ((SeekEntryResult!4560 0))(
  ( (MissingZero!4560 (index!20458 (_ BitVec 32))) (Found!4560 (index!20459 (_ BitVec 32))) (Intermediate!4560 (undefined!5372 Bool) (index!20460 (_ BitVec 32)) (x!49425 (_ BitVec 32))) (Undefined!4560) (MissingVacant!4560 (index!20461 (_ BitVec 32))) )
))
(declare-fun lt!243071 () SeekEntryResult!4560)

(get-info :version)

(assert (=> b!527898 (= res!324159 (or (undefined!5372 lt!243071) (not ((_ is Intermediate!4560) lt!243071))))))

(declare-fun b!527899 () Bool)

(declare-fun res!324168 () Bool)

(declare-fun e!307643 () Bool)

(assert (=> b!527899 (=> (not res!324168) (not e!307643))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33486 0))(
  ( (array!33487 (arr!16093 (Array (_ BitVec 32) (_ BitVec 64))) (size!16457 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33486)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527899 (= res!324168 (and (= (size!16457 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16457 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16457 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527900 () Bool)

(declare-fun res!324170 () Bool)

(declare-fun e!307639 () Bool)

(assert (=> b!527900 (=> (not res!324170) (not e!307639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33486 (_ BitVec 32)) Bool)

(assert (=> b!527900 (= res!324170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!307637 () Bool)

(declare-fun b!527901 () Bool)

(declare-fun lt!243067 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33486 (_ BitVec 32)) SeekEntryResult!4560)

(assert (=> b!527901 (= e!307637 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243067 (index!20460 lt!243071) (select (arr!16093 a!3235) j!176) a!3235 mask!3524) (Found!4560 j!176)))))

(declare-fun b!527902 () Bool)

(declare-fun res!324165 () Bool)

(assert (=> b!527902 (=> (not res!324165) (not e!307643))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527902 (= res!324165 (validKeyInArray!0 k0!2280))))

(declare-fun res!324167 () Bool)

(assert (=> start!47918 (=> (not res!324167) (not e!307643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47918 (= res!324167 (validMask!0 mask!3524))))

(assert (=> start!47918 e!307643))

(assert (=> start!47918 true))

(declare-fun array_inv!11889 (array!33486) Bool)

(assert (=> start!47918 (array_inv!11889 a!3235)))

(declare-fun b!527903 () Bool)

(assert (=> b!527903 (= e!307640 e!307637)))

(declare-fun res!324162 () Bool)

(assert (=> b!527903 (=> res!324162 e!307637)))

(assert (=> b!527903 (= res!324162 (or (bvsgt (x!49425 lt!243071) #b01111111111111111111111111111110) (bvslt lt!243067 #b00000000000000000000000000000000) (bvsge lt!243067 (size!16457 a!3235)) (bvslt (index!20460 lt!243071) #b00000000000000000000000000000000) (bvsge (index!20460 lt!243071) (size!16457 a!3235)) (not (= lt!243071 (Intermediate!4560 false (index!20460 lt!243071) (x!49425 lt!243071)))) (bvsle #b00000000000000000000000000000000 (x!49425 lt!243071))))))

(assert (=> b!527903 (= (index!20460 lt!243071) i!1204)))

(declare-datatypes ((Unit!16692 0))(
  ( (Unit!16693) )
))
(declare-fun lt!243076 () Unit!16692)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!527903 (= lt!243076 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524))))

(assert (=> b!527903 (and (or (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243068 () Unit!16692)

(declare-fun e!307644 () Unit!16692)

(assert (=> b!527903 (= lt!243068 e!307644)))

(declare-fun c!62177 () Bool)

(assert (=> b!527903 (= c!62177 (= (select (arr!16093 a!3235) (index!20460 lt!243071)) (select (arr!16093 a!3235) j!176)))))

(assert (=> b!527903 (and (bvslt (x!49425 lt!243071) #b01111111111111111111111111111110) (or (= (select (arr!16093 a!3235) (index!20460 lt!243071)) (select (arr!16093 a!3235) j!176)) (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16093 a!3235) (index!20460 lt!243071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527904 () Bool)

(assert (=> b!527904 (= e!307639 (not e!307640))))

(declare-fun res!324158 () Bool)

(assert (=> b!527904 (=> res!324158 e!307640)))

(declare-fun lt!243074 () (_ BitVec 64))

(declare-fun lt!243070 () array!33486)

(declare-fun lt!243072 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33486 (_ BitVec 32)) SeekEntryResult!4560)

(assert (=> b!527904 (= res!324158 (= lt!243071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243072 lt!243074 lt!243070 mask!3524)))))

(assert (=> b!527904 (= lt!243071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527904 (= lt!243072 (toIndex!0 lt!243074 mask!3524))))

(assert (=> b!527904 (= lt!243074 (select (store (arr!16093 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527904 (= lt!243067 (toIndex!0 (select (arr!16093 a!3235) j!176) mask!3524))))

(assert (=> b!527904 (= lt!243070 (array!33487 (store (arr!16093 a!3235) i!1204 k0!2280) (size!16457 a!3235)))))

(declare-fun e!307641 () Bool)

(assert (=> b!527904 e!307641))

(declare-fun res!324164 () Bool)

(assert (=> b!527904 (=> (not res!324164) (not e!307641))))

(assert (=> b!527904 (= res!324164 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243069 () Unit!16692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!527904 (= lt!243069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527905 () Bool)

(declare-fun res!324161 () Bool)

(assert (=> b!527905 (=> (not res!324161) (not e!307643))))

(declare-fun arrayContainsKey!0 (array!33486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527905 (= res!324161 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527906 () Bool)

(declare-fun Unit!16694 () Unit!16692)

(assert (=> b!527906 (= e!307644 Unit!16694)))

(declare-fun lt!243075 () Unit!16692)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!527906 (= lt!243075 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524))))

(declare-fun res!324169 () Bool)

(assert (=> b!527906 (= res!324169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 lt!243074 lt!243070 mask!3524) (Intermediate!4560 false (index!20460 lt!243071) (x!49425 lt!243071))))))

(declare-fun e!307642 () Bool)

(assert (=> b!527906 (=> (not res!324169) (not e!307642))))

(assert (=> b!527906 e!307642))

(declare-fun b!527907 () Bool)

(declare-fun res!324166 () Bool)

(assert (=> b!527907 (=> (not res!324166) (not e!307643))))

(assert (=> b!527907 (= res!324166 (validKeyInArray!0 (select (arr!16093 a!3235) j!176)))))

(declare-fun b!527908 () Bool)

(assert (=> b!527908 (= e!307642 false)))

(declare-fun b!527909 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33486 (_ BitVec 32)) SeekEntryResult!4560)

(assert (=> b!527909 (= e!307641 (= (seekEntryOrOpen!0 (select (arr!16093 a!3235) j!176) a!3235 mask!3524) (Found!4560 j!176)))))

(declare-fun b!527910 () Bool)

(assert (=> b!527910 (= e!307643 e!307639)))

(declare-fun res!324163 () Bool)

(assert (=> b!527910 (=> (not res!324163) (not e!307639))))

(declare-fun lt!243073 () SeekEntryResult!4560)

(assert (=> b!527910 (= res!324163 (or (= lt!243073 (MissingZero!4560 i!1204)) (= lt!243073 (MissingVacant!4560 i!1204))))))

(assert (=> b!527910 (= lt!243073 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527911 () Bool)

(declare-fun Unit!16695 () Unit!16692)

(assert (=> b!527911 (= e!307644 Unit!16695)))

(declare-fun b!527912 () Bool)

(declare-fun res!324160 () Bool)

(assert (=> b!527912 (=> (not res!324160) (not e!307639))))

(declare-datatypes ((List!10251 0))(
  ( (Nil!10248) (Cons!10247 (h!11181 (_ BitVec 64)) (t!16479 List!10251)) )
))
(declare-fun arrayNoDuplicates!0 (array!33486 (_ BitVec 32) List!10251) Bool)

(assert (=> b!527912 (= res!324160 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10248))))

(assert (= (and start!47918 res!324167) b!527899))

(assert (= (and b!527899 res!324168) b!527907))

(assert (= (and b!527907 res!324166) b!527902))

(assert (= (and b!527902 res!324165) b!527905))

(assert (= (and b!527905 res!324161) b!527910))

(assert (= (and b!527910 res!324163) b!527900))

(assert (= (and b!527900 res!324170) b!527912))

(assert (= (and b!527912 res!324160) b!527904))

(assert (= (and b!527904 res!324164) b!527909))

(assert (= (and b!527904 (not res!324158)) b!527898))

(assert (= (and b!527898 (not res!324159)) b!527903))

(assert (= (and b!527903 c!62177) b!527906))

(assert (= (and b!527903 (not c!62177)) b!527911))

(assert (= (and b!527906 res!324169) b!527908))

(assert (= (and b!527903 (not res!324162)) b!527901))

(declare-fun m!508567 () Bool)

(assert (=> b!527906 m!508567))

(declare-fun m!508569 () Bool)

(assert (=> b!527906 m!508569))

(declare-fun m!508571 () Bool)

(assert (=> b!527904 m!508571))

(declare-fun m!508573 () Bool)

(assert (=> b!527904 m!508573))

(declare-fun m!508575 () Bool)

(assert (=> b!527904 m!508575))

(declare-fun m!508577 () Bool)

(assert (=> b!527904 m!508577))

(declare-fun m!508579 () Bool)

(assert (=> b!527904 m!508579))

(declare-fun m!508581 () Bool)

(assert (=> b!527904 m!508581))

(assert (=> b!527904 m!508573))

(declare-fun m!508583 () Bool)

(assert (=> b!527904 m!508583))

(assert (=> b!527904 m!508573))

(declare-fun m!508585 () Bool)

(assert (=> b!527904 m!508585))

(declare-fun m!508587 () Bool)

(assert (=> b!527904 m!508587))

(declare-fun m!508589 () Bool)

(assert (=> b!527905 m!508589))

(declare-fun m!508591 () Bool)

(assert (=> b!527910 m!508591))

(declare-fun m!508593 () Bool)

(assert (=> b!527900 m!508593))

(assert (=> b!527907 m!508573))

(assert (=> b!527907 m!508573))

(declare-fun m!508595 () Bool)

(assert (=> b!527907 m!508595))

(assert (=> b!527909 m!508573))

(assert (=> b!527909 m!508573))

(declare-fun m!508597 () Bool)

(assert (=> b!527909 m!508597))

(declare-fun m!508599 () Bool)

(assert (=> b!527902 m!508599))

(declare-fun m!508601 () Bool)

(assert (=> b!527903 m!508601))

(declare-fun m!508603 () Bool)

(assert (=> b!527903 m!508603))

(assert (=> b!527903 m!508573))

(declare-fun m!508605 () Bool)

(assert (=> start!47918 m!508605))

(declare-fun m!508607 () Bool)

(assert (=> start!47918 m!508607))

(assert (=> b!527901 m!508573))

(assert (=> b!527901 m!508573))

(declare-fun m!508609 () Bool)

(assert (=> b!527901 m!508609))

(declare-fun m!508611 () Bool)

(assert (=> b!527912 m!508611))

(check-sat (not b!527900) (not b!527904) (not b!527903) (not b!527912) (not b!527909) (not b!527907) (not b!527906) (not b!527902) (not b!527910) (not b!527905) (not b!527901) (not start!47918))
(check-sat)
(get-model)

(declare-fun d!80889 () Bool)

(declare-fun res!324214 () Bool)

(declare-fun e!307673 () Bool)

(assert (=> d!80889 (=> res!324214 e!307673)))

(assert (=> d!80889 (= res!324214 (= (select (arr!16093 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80889 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307673)))

(declare-fun b!527962 () Bool)

(declare-fun e!307674 () Bool)

(assert (=> b!527962 (= e!307673 e!307674)))

(declare-fun res!324215 () Bool)

(assert (=> b!527962 (=> (not res!324215) (not e!307674))))

(assert (=> b!527962 (= res!324215 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16457 a!3235)))))

(declare-fun b!527963 () Bool)

(assert (=> b!527963 (= e!307674 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80889 (not res!324214)) b!527962))

(assert (= (and b!527962 res!324215) b!527963))

(declare-fun m!508659 () Bool)

(assert (=> d!80889 m!508659))

(declare-fun m!508661 () Bool)

(assert (=> b!527963 m!508661))

(assert (=> b!527905 d!80889))

(declare-fun d!80891 () Bool)

(assert (=> d!80891 (= (validKeyInArray!0 (select (arr!16093 a!3235) j!176)) (and (not (= (select (arr!16093 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16093 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527907 d!80891))

(declare-fun d!80893 () Bool)

(declare-fun e!307677 () Bool)

(assert (=> d!80893 e!307677))

(declare-fun res!324218 () Bool)

(assert (=> d!80893 (=> (not res!324218) (not e!307677))))

(assert (=> d!80893 (= res!324218 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16457 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16457 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16457 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16457 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16457 a!3235))))))

(declare-fun lt!243109 () Unit!16692)

(declare-fun choose!47 (array!33486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> d!80893 (= lt!243109 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524))))

(assert (=> d!80893 (validMask!0 mask!3524)))

(assert (=> d!80893 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524) lt!243109)))

(declare-fun b!527966 () Bool)

(assert (=> b!527966 (= e!307677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 (select (store (arr!16093 a!3235) i!1204 k0!2280) j!176) (array!33487 (store (arr!16093 a!3235) i!1204 k0!2280) (size!16457 a!3235)) mask!3524) (Intermediate!4560 false (index!20460 lt!243071) (x!49425 lt!243071))))))

(assert (= (and d!80893 res!324218) b!527966))

(declare-fun m!508663 () Bool)

(assert (=> d!80893 m!508663))

(assert (=> d!80893 m!508605))

(assert (=> b!527966 m!508577))

(assert (=> b!527966 m!508581))

(assert (=> b!527966 m!508581))

(declare-fun m!508665 () Bool)

(assert (=> b!527966 m!508665))

(assert (=> b!527906 d!80893))

(declare-fun b!527985 () Bool)

(declare-fun lt!243115 () SeekEntryResult!4560)

(assert (=> b!527985 (and (bvsge (index!20460 lt!243115) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243115) (size!16457 lt!243070)))))

(declare-fun res!324225 () Bool)

(assert (=> b!527985 (= res!324225 (= (select (arr!16093 lt!243070) (index!20460 lt!243115)) lt!243074))))

(declare-fun e!307692 () Bool)

(assert (=> b!527985 (=> res!324225 e!307692)))

(declare-fun e!307688 () Bool)

(assert (=> b!527985 (= e!307688 e!307692)))

(declare-fun b!527986 () Bool)

(declare-fun e!307689 () Bool)

(assert (=> b!527986 (= e!307689 e!307688)))

(declare-fun res!324227 () Bool)

(assert (=> b!527986 (= res!324227 (and ((_ is Intermediate!4560) lt!243115) (not (undefined!5372 lt!243115)) (bvslt (x!49425 lt!243115) #b01111111111111111111111111111110) (bvsge (x!49425 lt!243115) #b00000000000000000000000000000000) (bvsge (x!49425 lt!243115) #b00000000000000000000000000000000)))))

(assert (=> b!527986 (=> (not res!324227) (not e!307688))))

(declare-fun b!527987 () Bool)

(declare-fun e!307690 () SeekEntryResult!4560)

(assert (=> b!527987 (= e!307690 (Intermediate!4560 false lt!243067 #b00000000000000000000000000000000))))

(declare-fun b!527988 () Bool)

(assert (=> b!527988 (= e!307689 (bvsge (x!49425 lt!243115) #b01111111111111111111111111111110))))

(declare-fun b!527989 () Bool)

(assert (=> b!527989 (and (bvsge (index!20460 lt!243115) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243115) (size!16457 lt!243070)))))

(declare-fun res!324226 () Bool)

(assert (=> b!527989 (= res!324226 (= (select (arr!16093 lt!243070) (index!20460 lt!243115)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527989 (=> res!324226 e!307692)))

(declare-fun d!80895 () Bool)

(assert (=> d!80895 e!307689))

(declare-fun c!62189 () Bool)

(assert (=> d!80895 (= c!62189 (and ((_ is Intermediate!4560) lt!243115) (undefined!5372 lt!243115)))))

(declare-fun e!307691 () SeekEntryResult!4560)

(assert (=> d!80895 (= lt!243115 e!307691)))

(declare-fun c!62188 () Bool)

(assert (=> d!80895 (= c!62188 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243114 () (_ BitVec 64))

(assert (=> d!80895 (= lt!243114 (select (arr!16093 lt!243070) lt!243067))))

(assert (=> d!80895 (validMask!0 mask!3524)))

(assert (=> d!80895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 lt!243074 lt!243070 mask!3524) lt!243115)))

(declare-fun b!527990 () Bool)

(assert (=> b!527990 (and (bvsge (index!20460 lt!243115) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243115) (size!16457 lt!243070)))))

(assert (=> b!527990 (= e!307692 (= (select (arr!16093 lt!243070) (index!20460 lt!243115)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527991 () Bool)

(assert (=> b!527991 (= e!307691 (Intermediate!4560 true lt!243067 #b00000000000000000000000000000000))))

(declare-fun b!527992 () Bool)

(assert (=> b!527992 (= e!307691 e!307690)))

(declare-fun c!62187 () Bool)

(assert (=> b!527992 (= c!62187 (or (= lt!243114 lt!243074) (= (bvadd lt!243114 lt!243114) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527993 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527993 (= e!307690 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243067 #b00000000000000000000000000000000 mask!3524) lt!243074 lt!243070 mask!3524))))

(assert (= (and d!80895 c!62188) b!527991))

(assert (= (and d!80895 (not c!62188)) b!527992))

(assert (= (and b!527992 c!62187) b!527987))

(assert (= (and b!527992 (not c!62187)) b!527993))

(assert (= (and d!80895 c!62189) b!527988))

(assert (= (and d!80895 (not c!62189)) b!527986))

(assert (= (and b!527986 res!324227) b!527985))

(assert (= (and b!527985 (not res!324225)) b!527989))

(assert (= (and b!527989 (not res!324226)) b!527990))

(declare-fun m!508667 () Bool)

(assert (=> b!527990 m!508667))

(assert (=> b!527985 m!508667))

(declare-fun m!508669 () Bool)

(assert (=> d!80895 m!508669))

(assert (=> d!80895 m!508605))

(assert (=> b!527989 m!508667))

(declare-fun m!508671 () Bool)

(assert (=> b!527993 m!508671))

(assert (=> b!527993 m!508671))

(declare-fun m!508673 () Bool)

(assert (=> b!527993 m!508673))

(assert (=> b!527906 d!80895))

(declare-fun d!80899 () Bool)

(assert (=> d!80899 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47918 d!80899))

(declare-fun d!80901 () Bool)

(assert (=> d!80901 (= (array_inv!11889 a!3235) (bvsge (size!16457 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47918 d!80901))

(declare-fun d!80903 () Bool)

(declare-fun lt!243150 () SeekEntryResult!4560)

(assert (=> d!80903 (and (or ((_ is Undefined!4560) lt!243150) (not ((_ is Found!4560) lt!243150)) (and (bvsge (index!20459 lt!243150) #b00000000000000000000000000000000) (bvslt (index!20459 lt!243150) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243150) ((_ is Found!4560) lt!243150) (not ((_ is MissingZero!4560) lt!243150)) (and (bvsge (index!20458 lt!243150) #b00000000000000000000000000000000) (bvslt (index!20458 lt!243150) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243150) ((_ is Found!4560) lt!243150) ((_ is MissingZero!4560) lt!243150) (not ((_ is MissingVacant!4560) lt!243150)) (and (bvsge (index!20461 lt!243150) #b00000000000000000000000000000000) (bvslt (index!20461 lt!243150) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243150) (ite ((_ is Found!4560) lt!243150) (= (select (arr!16093 a!3235) (index!20459 lt!243150)) (select (arr!16093 a!3235) j!176)) (ite ((_ is MissingZero!4560) lt!243150) (= (select (arr!16093 a!3235) (index!20458 lt!243150)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4560) lt!243150) (= (select (arr!16093 a!3235) (index!20461 lt!243150)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307728 () SeekEntryResult!4560)

(assert (=> d!80903 (= lt!243150 e!307728)))

(declare-fun c!62218 () Bool)

(declare-fun lt!243151 () SeekEntryResult!4560)

(assert (=> d!80903 (= c!62218 (and ((_ is Intermediate!4560) lt!243151) (undefined!5372 lt!243151)))))

(assert (=> d!80903 (= lt!243151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16093 a!3235) j!176) mask!3524) (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80903 (validMask!0 mask!3524)))

(assert (=> d!80903 (= (seekEntryOrOpen!0 (select (arr!16093 a!3235) j!176) a!3235 mask!3524) lt!243150)))

(declare-fun b!528054 () Bool)

(declare-fun c!62217 () Bool)

(declare-fun lt!243149 () (_ BitVec 64))

(assert (=> b!528054 (= c!62217 (= lt!243149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307727 () SeekEntryResult!4560)

(declare-fun e!307726 () SeekEntryResult!4560)

(assert (=> b!528054 (= e!307727 e!307726)))

(declare-fun b!528055 () Bool)

(assert (=> b!528055 (= e!307726 (MissingZero!4560 (index!20460 lt!243151)))))

(declare-fun b!528056 () Bool)

(assert (=> b!528056 (= e!307726 (seekKeyOrZeroReturnVacant!0 (x!49425 lt!243151) (index!20460 lt!243151) (index!20460 lt!243151) (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!528057 () Bool)

(assert (=> b!528057 (= e!307727 (Found!4560 (index!20460 lt!243151)))))

(declare-fun b!528058 () Bool)

(assert (=> b!528058 (= e!307728 e!307727)))

(assert (=> b!528058 (= lt!243149 (select (arr!16093 a!3235) (index!20460 lt!243151)))))

(declare-fun c!62219 () Bool)

(assert (=> b!528058 (= c!62219 (= lt!243149 (select (arr!16093 a!3235) j!176)))))

(declare-fun b!528059 () Bool)

(assert (=> b!528059 (= e!307728 Undefined!4560)))

(assert (= (and d!80903 c!62218) b!528059))

(assert (= (and d!80903 (not c!62218)) b!528058))

(assert (= (and b!528058 c!62219) b!528057))

(assert (= (and b!528058 (not c!62219)) b!528054))

(assert (= (and b!528054 c!62217) b!528055))

(assert (= (and b!528054 (not c!62217)) b!528056))

(assert (=> d!80903 m!508605))

(declare-fun m!508711 () Bool)

(assert (=> d!80903 m!508711))

(declare-fun m!508713 () Bool)

(assert (=> d!80903 m!508713))

(declare-fun m!508715 () Bool)

(assert (=> d!80903 m!508715))

(assert (=> d!80903 m!508583))

(assert (=> d!80903 m!508573))

(declare-fun m!508717 () Bool)

(assert (=> d!80903 m!508717))

(assert (=> d!80903 m!508573))

(assert (=> d!80903 m!508583))

(assert (=> b!528056 m!508573))

(declare-fun m!508719 () Bool)

(assert (=> b!528056 m!508719))

(declare-fun m!508721 () Bool)

(assert (=> b!528058 m!508721))

(assert (=> b!527909 d!80903))

(declare-fun b!528083 () Bool)

(declare-fun e!307748 () Bool)

(declare-fun e!307749 () Bool)

(assert (=> b!528083 (= e!307748 e!307749)))

(declare-fun lt!243159 () (_ BitVec 64))

(assert (=> b!528083 (= lt!243159 (select (arr!16093 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243160 () Unit!16692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33486 (_ BitVec 64) (_ BitVec 32)) Unit!16692)

(assert (=> b!528083 (= lt!243160 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243159 #b00000000000000000000000000000000))))

(assert (=> b!528083 (arrayContainsKey!0 a!3235 lt!243159 #b00000000000000000000000000000000)))

(declare-fun lt!243158 () Unit!16692)

(assert (=> b!528083 (= lt!243158 lt!243160)))

(declare-fun res!324247 () Bool)

(assert (=> b!528083 (= res!324247 (= (seekEntryOrOpen!0 (select (arr!16093 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4560 #b00000000000000000000000000000000)))))

(assert (=> b!528083 (=> (not res!324247) (not e!307749))))

(declare-fun d!80919 () Bool)

(declare-fun res!324248 () Bool)

(declare-fun e!307747 () Bool)

(assert (=> d!80919 (=> res!324248 e!307747)))

(assert (=> d!80919 (= res!324248 (bvsge #b00000000000000000000000000000000 (size!16457 a!3235)))))

(assert (=> d!80919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307747)))

(declare-fun b!528084 () Bool)

(declare-fun call!31901 () Bool)

(assert (=> b!528084 (= e!307748 call!31901)))

(declare-fun b!528085 () Bool)

(assert (=> b!528085 (= e!307749 call!31901)))

(declare-fun b!528086 () Bool)

(assert (=> b!528086 (= e!307747 e!307748)))

(declare-fun c!62225 () Bool)

(assert (=> b!528086 (= c!62225 (validKeyInArray!0 (select (arr!16093 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31898 () Bool)

(assert (=> bm!31898 (= call!31901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80919 (not res!324248)) b!528086))

(assert (= (and b!528086 c!62225) b!528083))

(assert (= (and b!528086 (not c!62225)) b!528084))

(assert (= (and b!528083 res!324247) b!528085))

(assert (= (or b!528085 b!528084) bm!31898))

(assert (=> b!528083 m!508659))

(declare-fun m!508731 () Bool)

(assert (=> b!528083 m!508731))

(declare-fun m!508733 () Bool)

(assert (=> b!528083 m!508733))

(assert (=> b!528083 m!508659))

(declare-fun m!508735 () Bool)

(assert (=> b!528083 m!508735))

(assert (=> b!528086 m!508659))

(assert (=> b!528086 m!508659))

(declare-fun m!508737 () Bool)

(assert (=> b!528086 m!508737))

(declare-fun m!508739 () Bool)

(assert (=> bm!31898 m!508739))

(assert (=> b!527900 d!80919))

(declare-fun d!80923 () Bool)

(declare-fun lt!243162 () SeekEntryResult!4560)

(assert (=> d!80923 (and (or ((_ is Undefined!4560) lt!243162) (not ((_ is Found!4560) lt!243162)) (and (bvsge (index!20459 lt!243162) #b00000000000000000000000000000000) (bvslt (index!20459 lt!243162) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243162) ((_ is Found!4560) lt!243162) (not ((_ is MissingZero!4560) lt!243162)) (and (bvsge (index!20458 lt!243162) #b00000000000000000000000000000000) (bvslt (index!20458 lt!243162) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243162) ((_ is Found!4560) lt!243162) ((_ is MissingZero!4560) lt!243162) (not ((_ is MissingVacant!4560) lt!243162)) (and (bvsge (index!20461 lt!243162) #b00000000000000000000000000000000) (bvslt (index!20461 lt!243162) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243162) (ite ((_ is Found!4560) lt!243162) (= (select (arr!16093 a!3235) (index!20459 lt!243162)) k0!2280) (ite ((_ is MissingZero!4560) lt!243162) (= (select (arr!16093 a!3235) (index!20458 lt!243162)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4560) lt!243162) (= (select (arr!16093 a!3235) (index!20461 lt!243162)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307752 () SeekEntryResult!4560)

(assert (=> d!80923 (= lt!243162 e!307752)))

(declare-fun c!62227 () Bool)

(declare-fun lt!243163 () SeekEntryResult!4560)

(assert (=> d!80923 (= c!62227 (and ((_ is Intermediate!4560) lt!243163) (undefined!5372 lt!243163)))))

(assert (=> d!80923 (= lt!243163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80923 (validMask!0 mask!3524)))

(assert (=> d!80923 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!243162)))

(declare-fun b!528087 () Bool)

(declare-fun c!62226 () Bool)

(declare-fun lt!243161 () (_ BitVec 64))

(assert (=> b!528087 (= c!62226 (= lt!243161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307751 () SeekEntryResult!4560)

(declare-fun e!307750 () SeekEntryResult!4560)

(assert (=> b!528087 (= e!307751 e!307750)))

(declare-fun b!528088 () Bool)

(assert (=> b!528088 (= e!307750 (MissingZero!4560 (index!20460 lt!243163)))))

(declare-fun b!528089 () Bool)

(assert (=> b!528089 (= e!307750 (seekKeyOrZeroReturnVacant!0 (x!49425 lt!243163) (index!20460 lt!243163) (index!20460 lt!243163) k0!2280 a!3235 mask!3524))))

(declare-fun b!528090 () Bool)

(assert (=> b!528090 (= e!307751 (Found!4560 (index!20460 lt!243163)))))

(declare-fun b!528091 () Bool)

(assert (=> b!528091 (= e!307752 e!307751)))

(assert (=> b!528091 (= lt!243161 (select (arr!16093 a!3235) (index!20460 lt!243163)))))

(declare-fun c!62228 () Bool)

(assert (=> b!528091 (= c!62228 (= lt!243161 k0!2280))))

(declare-fun b!528092 () Bool)

(assert (=> b!528092 (= e!307752 Undefined!4560)))

(assert (= (and d!80923 c!62227) b!528092))

(assert (= (and d!80923 (not c!62227)) b!528091))

(assert (= (and b!528091 c!62228) b!528090))

(assert (= (and b!528091 (not c!62228)) b!528087))

(assert (= (and b!528087 c!62226) b!528088))

(assert (= (and b!528087 (not c!62226)) b!528089))

(assert (=> d!80923 m!508605))

(declare-fun m!508741 () Bool)

(assert (=> d!80923 m!508741))

(declare-fun m!508743 () Bool)

(assert (=> d!80923 m!508743))

(declare-fun m!508745 () Bool)

(assert (=> d!80923 m!508745))

(declare-fun m!508747 () Bool)

(assert (=> d!80923 m!508747))

(declare-fun m!508749 () Bool)

(assert (=> d!80923 m!508749))

(assert (=> d!80923 m!508747))

(declare-fun m!508751 () Bool)

(assert (=> b!528089 m!508751))

(declare-fun m!508753 () Bool)

(assert (=> b!528091 m!508753))

(assert (=> b!527910 d!80923))

(declare-fun bm!31901 () Bool)

(declare-fun call!31904 () Bool)

(declare-fun c!62240 () Bool)

(assert (=> bm!31901 (= call!31904 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62240 (Cons!10247 (select (arr!16093 a!3235) #b00000000000000000000000000000000) Nil!10248) Nil!10248)))))

(declare-fun b!528122 () Bool)

(declare-fun e!307772 () Bool)

(declare-fun contains!2776 (List!10251 (_ BitVec 64)) Bool)

(assert (=> b!528122 (= e!307772 (contains!2776 Nil!10248 (select (arr!16093 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528123 () Bool)

(declare-fun e!307773 () Bool)

(declare-fun e!307774 () Bool)

(assert (=> b!528123 (= e!307773 e!307774)))

(declare-fun res!324259 () Bool)

(assert (=> b!528123 (=> (not res!324259) (not e!307774))))

(assert (=> b!528123 (= res!324259 (not e!307772))))

(declare-fun res!324257 () Bool)

(assert (=> b!528123 (=> (not res!324257) (not e!307772))))

(assert (=> b!528123 (= res!324257 (validKeyInArray!0 (select (arr!16093 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528124 () Bool)

(declare-fun e!307775 () Bool)

(assert (=> b!528124 (= e!307775 call!31904)))

(declare-fun b!528125 () Bool)

(assert (=> b!528125 (= e!307774 e!307775)))

(assert (=> b!528125 (= c!62240 (validKeyInArray!0 (select (arr!16093 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528121 () Bool)

(assert (=> b!528121 (= e!307775 call!31904)))

(declare-fun d!80925 () Bool)

(declare-fun res!324258 () Bool)

(assert (=> d!80925 (=> res!324258 e!307773)))

(assert (=> d!80925 (= res!324258 (bvsge #b00000000000000000000000000000000 (size!16457 a!3235)))))

(assert (=> d!80925 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10248) e!307773)))

(assert (= (and d!80925 (not res!324258)) b!528123))

(assert (= (and b!528123 res!324257) b!528122))

(assert (= (and b!528123 res!324259) b!528125))

(assert (= (and b!528125 c!62240) b!528121))

(assert (= (and b!528125 (not c!62240)) b!528124))

(assert (= (or b!528121 b!528124) bm!31901))

(assert (=> bm!31901 m!508659))

(declare-fun m!508767 () Bool)

(assert (=> bm!31901 m!508767))

(assert (=> b!528122 m!508659))

(assert (=> b!528122 m!508659))

(declare-fun m!508769 () Bool)

(assert (=> b!528122 m!508769))

(assert (=> b!528123 m!508659))

(assert (=> b!528123 m!508659))

(assert (=> b!528123 m!508737))

(assert (=> b!528125 m!508659))

(assert (=> b!528125 m!508659))

(assert (=> b!528125 m!508737))

(assert (=> b!527912 d!80925))

(declare-fun b!528166 () Bool)

(declare-fun e!307805 () SeekEntryResult!4560)

(assert (=> b!528166 (= e!307805 (Found!4560 lt!243067))))

(declare-fun b!528167 () Bool)

(declare-fun e!307804 () SeekEntryResult!4560)

(assert (=> b!528167 (= e!307804 Undefined!4560)))

(declare-fun b!528169 () Bool)

(declare-fun c!62252 () Bool)

(declare-fun lt!243190 () (_ BitVec 64))

(assert (=> b!528169 (= c!62252 (= lt!243190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307806 () SeekEntryResult!4560)

(assert (=> b!528169 (= e!307805 e!307806)))

(declare-fun b!528170 () Bool)

(assert (=> b!528170 (= e!307804 e!307805)))

(declare-fun c!62253 () Bool)

(assert (=> b!528170 (= c!62253 (= lt!243190 (select (arr!16093 a!3235) j!176)))))

(declare-fun b!528171 () Bool)

(assert (=> b!528171 (= e!307806 (MissingVacant!4560 (index!20460 lt!243071)))))

(declare-fun d!80929 () Bool)

(declare-fun lt!243189 () SeekEntryResult!4560)

(assert (=> d!80929 (and (or ((_ is Undefined!4560) lt!243189) (not ((_ is Found!4560) lt!243189)) (and (bvsge (index!20459 lt!243189) #b00000000000000000000000000000000) (bvslt (index!20459 lt!243189) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243189) ((_ is Found!4560) lt!243189) (not ((_ is MissingVacant!4560) lt!243189)) (not (= (index!20461 lt!243189) (index!20460 lt!243071))) (and (bvsge (index!20461 lt!243189) #b00000000000000000000000000000000) (bvslt (index!20461 lt!243189) (size!16457 a!3235)))) (or ((_ is Undefined!4560) lt!243189) (ite ((_ is Found!4560) lt!243189) (= (select (arr!16093 a!3235) (index!20459 lt!243189)) (select (arr!16093 a!3235) j!176)) (and ((_ is MissingVacant!4560) lt!243189) (= (index!20461 lt!243189) (index!20460 lt!243071)) (= (select (arr!16093 a!3235) (index!20461 lt!243189)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!80929 (= lt!243189 e!307804)))

(declare-fun c!62251 () Bool)

(assert (=> d!80929 (= c!62251 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80929 (= lt!243190 (select (arr!16093 a!3235) lt!243067))))

(assert (=> d!80929 (validMask!0 mask!3524)))

(assert (=> d!80929 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243067 (index!20460 lt!243071) (select (arr!16093 a!3235) j!176) a!3235 mask!3524) lt!243189)))

(declare-fun b!528168 () Bool)

(assert (=> b!528168 (= e!307806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243067 #b00000000000000000000000000000000 mask!3524) (index!20460 lt!243071) (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80929 c!62251) b!528167))

(assert (= (and d!80929 (not c!62251)) b!528170))

(assert (= (and b!528170 c!62253) b!528166))

(assert (= (and b!528170 (not c!62253)) b!528169))

(assert (= (and b!528169 c!62252) b!528171))

(assert (= (and b!528169 (not c!62252)) b!528168))

(declare-fun m!508787 () Bool)

(assert (=> d!80929 m!508787))

(declare-fun m!508789 () Bool)

(assert (=> d!80929 m!508789))

(declare-fun m!508791 () Bool)

(assert (=> d!80929 m!508791))

(assert (=> d!80929 m!508605))

(assert (=> b!528168 m!508671))

(assert (=> b!528168 m!508671))

(assert (=> b!528168 m!508573))

(declare-fun m!508793 () Bool)

(assert (=> b!528168 m!508793))

(assert (=> b!527901 d!80929))

(declare-fun d!80945 () Bool)

(assert (=> d!80945 (= (index!20460 lt!243071) i!1204)))

(declare-fun lt!243193 () Unit!16692)

(declare-fun choose!104 (array!33486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> d!80945 (= lt!243193 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524))))

(assert (=> d!80945 (validMask!0 mask!3524)))

(assert (=> d!80945 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20460 lt!243071) (x!49425 lt!243071) mask!3524) lt!243193)))

(declare-fun bs!16548 () Bool)

(assert (= bs!16548 d!80945))

(declare-fun m!508795 () Bool)

(assert (=> bs!16548 m!508795))

(assert (=> bs!16548 m!508605))

(assert (=> b!527903 d!80945))

(declare-fun d!80947 () Bool)

(assert (=> d!80947 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527902 d!80947))

(declare-fun d!80949 () Bool)

(assert (=> d!80949 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243203 () Unit!16692)

(declare-fun choose!38 (array!33486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> d!80949 (= lt!243203 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80949 (validMask!0 mask!3524)))

(assert (=> d!80949 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!243203)))

(declare-fun bs!16550 () Bool)

(assert (= bs!16550 d!80949))

(assert (=> bs!16550 m!508585))

(declare-fun m!508799 () Bool)

(assert (=> bs!16550 m!508799))

(assert (=> bs!16550 m!508605))

(assert (=> b!527904 d!80949))

(declare-fun d!80953 () Bool)

(declare-fun lt!243211 () (_ BitVec 32))

(declare-fun lt!243210 () (_ BitVec 32))

(assert (=> d!80953 (= lt!243211 (bvmul (bvxor lt!243210 (bvlshr lt!243210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80953 (= lt!243210 ((_ extract 31 0) (bvand (bvxor (select (arr!16093 a!3235) j!176) (bvlshr (select (arr!16093 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80953 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324285 (let ((h!11184 ((_ extract 31 0) (bvand (bvxor (select (arr!16093 a!3235) j!176) (bvlshr (select (arr!16093 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49438 (bvmul (bvxor h!11184 (bvlshr h!11184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49438 (bvlshr x!49438 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324285 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324285 #b00000000000000000000000000000000))))))

(assert (=> d!80953 (= (toIndex!0 (select (arr!16093 a!3235) j!176) mask!3524) (bvand (bvxor lt!243211 (bvlshr lt!243211 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527904 d!80953))

(declare-fun b!528199 () Bool)

(declare-fun lt!243213 () SeekEntryResult!4560)

(assert (=> b!528199 (and (bvsge (index!20460 lt!243213) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243213) (size!16457 lt!243070)))))

(declare-fun res!324289 () Bool)

(assert (=> b!528199 (= res!324289 (= (select (arr!16093 lt!243070) (index!20460 lt!243213)) lt!243074))))

(declare-fun e!307826 () Bool)

(assert (=> b!528199 (=> res!324289 e!307826)))

(declare-fun e!307822 () Bool)

(assert (=> b!528199 (= e!307822 e!307826)))

(declare-fun b!528200 () Bool)

(declare-fun e!307823 () Bool)

(assert (=> b!528200 (= e!307823 e!307822)))

(declare-fun res!324291 () Bool)

(assert (=> b!528200 (= res!324291 (and ((_ is Intermediate!4560) lt!243213) (not (undefined!5372 lt!243213)) (bvslt (x!49425 lt!243213) #b01111111111111111111111111111110) (bvsge (x!49425 lt!243213) #b00000000000000000000000000000000) (bvsge (x!49425 lt!243213) #b00000000000000000000000000000000)))))

(assert (=> b!528200 (=> (not res!324291) (not e!307822))))

(declare-fun b!528201 () Bool)

(declare-fun e!307824 () SeekEntryResult!4560)

(assert (=> b!528201 (= e!307824 (Intermediate!4560 false lt!243072 #b00000000000000000000000000000000))))

(declare-fun b!528202 () Bool)

(assert (=> b!528202 (= e!307823 (bvsge (x!49425 lt!243213) #b01111111111111111111111111111110))))

(declare-fun b!528203 () Bool)

(assert (=> b!528203 (and (bvsge (index!20460 lt!243213) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243213) (size!16457 lt!243070)))))

(declare-fun res!324290 () Bool)

(assert (=> b!528203 (= res!324290 (= (select (arr!16093 lt!243070) (index!20460 lt!243213)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528203 (=> res!324290 e!307826)))

(declare-fun d!80955 () Bool)

(assert (=> d!80955 e!307823))

(declare-fun c!62265 () Bool)

(assert (=> d!80955 (= c!62265 (and ((_ is Intermediate!4560) lt!243213) (undefined!5372 lt!243213)))))

(declare-fun e!307825 () SeekEntryResult!4560)

(assert (=> d!80955 (= lt!243213 e!307825)))

(declare-fun c!62264 () Bool)

(assert (=> d!80955 (= c!62264 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243212 () (_ BitVec 64))

(assert (=> d!80955 (= lt!243212 (select (arr!16093 lt!243070) lt!243072))))

(assert (=> d!80955 (validMask!0 mask!3524)))

(assert (=> d!80955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243072 lt!243074 lt!243070 mask!3524) lt!243213)))

(declare-fun b!528204 () Bool)

(assert (=> b!528204 (and (bvsge (index!20460 lt!243213) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243213) (size!16457 lt!243070)))))

(assert (=> b!528204 (= e!307826 (= (select (arr!16093 lt!243070) (index!20460 lt!243213)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528205 () Bool)

(assert (=> b!528205 (= e!307825 (Intermediate!4560 true lt!243072 #b00000000000000000000000000000000))))

(declare-fun b!528206 () Bool)

(assert (=> b!528206 (= e!307825 e!307824)))

(declare-fun c!62263 () Bool)

(assert (=> b!528206 (= c!62263 (or (= lt!243212 lt!243074) (= (bvadd lt!243212 lt!243212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528207 () Bool)

(assert (=> b!528207 (= e!307824 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243072 #b00000000000000000000000000000000 mask!3524) lt!243074 lt!243070 mask!3524))))

(assert (= (and d!80955 c!62264) b!528205))

(assert (= (and d!80955 (not c!62264)) b!528206))

(assert (= (and b!528206 c!62263) b!528201))

(assert (= (and b!528206 (not c!62263)) b!528207))

(assert (= (and d!80955 c!62265) b!528202))

(assert (= (and d!80955 (not c!62265)) b!528200))

(assert (= (and b!528200 res!324291) b!528199))

(assert (= (and b!528199 (not res!324289)) b!528203))

(assert (= (and b!528203 (not res!324290)) b!528204))

(declare-fun m!508807 () Bool)

(assert (=> b!528204 m!508807))

(assert (=> b!528199 m!508807))

(declare-fun m!508809 () Bool)

(assert (=> d!80955 m!508809))

(assert (=> d!80955 m!508605))

(assert (=> b!528203 m!508807))

(declare-fun m!508811 () Bool)

(assert (=> b!528207 m!508811))

(assert (=> b!528207 m!508811))

(declare-fun m!508813 () Bool)

(assert (=> b!528207 m!508813))

(assert (=> b!527904 d!80955))

(declare-fun b!528208 () Bool)

(declare-fun e!307828 () Bool)

(declare-fun e!307829 () Bool)

(assert (=> b!528208 (= e!307828 e!307829)))

(declare-fun lt!243215 () (_ BitVec 64))

(assert (=> b!528208 (= lt!243215 (select (arr!16093 a!3235) j!176))))

(declare-fun lt!243216 () Unit!16692)

(assert (=> b!528208 (= lt!243216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243215 j!176))))

(assert (=> b!528208 (arrayContainsKey!0 a!3235 lt!243215 #b00000000000000000000000000000000)))

(declare-fun lt!243214 () Unit!16692)

(assert (=> b!528208 (= lt!243214 lt!243216)))

(declare-fun res!324292 () Bool)

(assert (=> b!528208 (= res!324292 (= (seekEntryOrOpen!0 (select (arr!16093 a!3235) j!176) a!3235 mask!3524) (Found!4560 j!176)))))

(assert (=> b!528208 (=> (not res!324292) (not e!307829))))

(declare-fun d!80959 () Bool)

(declare-fun res!324293 () Bool)

(declare-fun e!307827 () Bool)

(assert (=> d!80959 (=> res!324293 e!307827)))

(assert (=> d!80959 (= res!324293 (bvsge j!176 (size!16457 a!3235)))))

(assert (=> d!80959 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307827)))

(declare-fun b!528209 () Bool)

(declare-fun call!31909 () Bool)

(assert (=> b!528209 (= e!307828 call!31909)))

(declare-fun b!528210 () Bool)

(assert (=> b!528210 (= e!307829 call!31909)))

(declare-fun b!528211 () Bool)

(assert (=> b!528211 (= e!307827 e!307828)))

(declare-fun c!62266 () Bool)

(assert (=> b!528211 (= c!62266 (validKeyInArray!0 (select (arr!16093 a!3235) j!176)))))

(declare-fun bm!31906 () Bool)

(assert (=> bm!31906 (= call!31909 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80959 (not res!324293)) b!528211))

(assert (= (and b!528211 c!62266) b!528208))

(assert (= (and b!528211 (not c!62266)) b!528209))

(assert (= (and b!528208 res!324292) b!528210))

(assert (= (or b!528210 b!528209) bm!31906))

(assert (=> b!528208 m!508573))

(declare-fun m!508815 () Bool)

(assert (=> b!528208 m!508815))

(declare-fun m!508817 () Bool)

(assert (=> b!528208 m!508817))

(assert (=> b!528208 m!508573))

(assert (=> b!528208 m!508597))

(assert (=> b!528211 m!508573))

(assert (=> b!528211 m!508573))

(assert (=> b!528211 m!508595))

(declare-fun m!508819 () Bool)

(assert (=> bm!31906 m!508819))

(assert (=> b!527904 d!80959))

(declare-fun b!528212 () Bool)

(declare-fun lt!243218 () SeekEntryResult!4560)

(assert (=> b!528212 (and (bvsge (index!20460 lt!243218) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243218) (size!16457 a!3235)))))

(declare-fun res!324294 () Bool)

(assert (=> b!528212 (= res!324294 (= (select (arr!16093 a!3235) (index!20460 lt!243218)) (select (arr!16093 a!3235) j!176)))))

(declare-fun e!307834 () Bool)

(assert (=> b!528212 (=> res!324294 e!307834)))

(declare-fun e!307830 () Bool)

(assert (=> b!528212 (= e!307830 e!307834)))

(declare-fun b!528213 () Bool)

(declare-fun e!307831 () Bool)

(assert (=> b!528213 (= e!307831 e!307830)))

(declare-fun res!324296 () Bool)

(assert (=> b!528213 (= res!324296 (and ((_ is Intermediate!4560) lt!243218) (not (undefined!5372 lt!243218)) (bvslt (x!49425 lt!243218) #b01111111111111111111111111111110) (bvsge (x!49425 lt!243218) #b00000000000000000000000000000000) (bvsge (x!49425 lt!243218) #b00000000000000000000000000000000)))))

(assert (=> b!528213 (=> (not res!324296) (not e!307830))))

(declare-fun b!528214 () Bool)

(declare-fun e!307832 () SeekEntryResult!4560)

(assert (=> b!528214 (= e!307832 (Intermediate!4560 false lt!243067 #b00000000000000000000000000000000))))

(declare-fun b!528215 () Bool)

(assert (=> b!528215 (= e!307831 (bvsge (x!49425 lt!243218) #b01111111111111111111111111111110))))

(declare-fun b!528216 () Bool)

(assert (=> b!528216 (and (bvsge (index!20460 lt!243218) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243218) (size!16457 a!3235)))))

(declare-fun res!324295 () Bool)

(assert (=> b!528216 (= res!324295 (= (select (arr!16093 a!3235) (index!20460 lt!243218)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528216 (=> res!324295 e!307834)))

(declare-fun d!80961 () Bool)

(assert (=> d!80961 e!307831))

(declare-fun c!62269 () Bool)

(assert (=> d!80961 (= c!62269 (and ((_ is Intermediate!4560) lt!243218) (undefined!5372 lt!243218)))))

(declare-fun e!307833 () SeekEntryResult!4560)

(assert (=> d!80961 (= lt!243218 e!307833)))

(declare-fun c!62268 () Bool)

(assert (=> d!80961 (= c!62268 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243217 () (_ BitVec 64))

(assert (=> d!80961 (= lt!243217 (select (arr!16093 a!3235) lt!243067))))

(assert (=> d!80961 (validMask!0 mask!3524)))

(assert (=> d!80961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 (select (arr!16093 a!3235) j!176) a!3235 mask!3524) lt!243218)))

(declare-fun b!528217 () Bool)

(assert (=> b!528217 (and (bvsge (index!20460 lt!243218) #b00000000000000000000000000000000) (bvslt (index!20460 lt!243218) (size!16457 a!3235)))))

(assert (=> b!528217 (= e!307834 (= (select (arr!16093 a!3235) (index!20460 lt!243218)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528218 () Bool)

(assert (=> b!528218 (= e!307833 (Intermediate!4560 true lt!243067 #b00000000000000000000000000000000))))

(declare-fun b!528219 () Bool)

(assert (=> b!528219 (= e!307833 e!307832)))

(declare-fun c!62267 () Bool)

(assert (=> b!528219 (= c!62267 (or (= lt!243217 (select (arr!16093 a!3235) j!176)) (= (bvadd lt!243217 lt!243217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528220 () Bool)

(assert (=> b!528220 (= e!307832 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243067 #b00000000000000000000000000000000 mask!3524) (select (arr!16093 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80961 c!62268) b!528218))

(assert (= (and d!80961 (not c!62268)) b!528219))

(assert (= (and b!528219 c!62267) b!528214))

(assert (= (and b!528219 (not c!62267)) b!528220))

(assert (= (and d!80961 c!62269) b!528215))

(assert (= (and d!80961 (not c!62269)) b!528213))

(assert (= (and b!528213 res!324296) b!528212))

(assert (= (and b!528212 (not res!324294)) b!528216))

(assert (= (and b!528216 (not res!324295)) b!528217))

(declare-fun m!508821 () Bool)

(assert (=> b!528217 m!508821))

(assert (=> b!528212 m!508821))

(assert (=> d!80961 m!508791))

(assert (=> d!80961 m!508605))

(assert (=> b!528216 m!508821))

(assert (=> b!528220 m!508671))

(assert (=> b!528220 m!508671))

(assert (=> b!528220 m!508573))

(declare-fun m!508823 () Bool)

(assert (=> b!528220 m!508823))

(assert (=> b!527904 d!80961))

(declare-fun d!80963 () Bool)

(declare-fun lt!243220 () (_ BitVec 32))

(declare-fun lt!243219 () (_ BitVec 32))

(assert (=> d!80963 (= lt!243220 (bvmul (bvxor lt!243219 (bvlshr lt!243219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80963 (= lt!243219 ((_ extract 31 0) (bvand (bvxor lt!243074 (bvlshr lt!243074 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80963 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324285 (let ((h!11184 ((_ extract 31 0) (bvand (bvxor lt!243074 (bvlshr lt!243074 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49438 (bvmul (bvxor h!11184 (bvlshr h!11184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49438 (bvlshr x!49438 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324285 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324285 #b00000000000000000000000000000000))))))

(assert (=> d!80963 (= (toIndex!0 lt!243074 mask!3524) (bvand (bvxor lt!243220 (bvlshr lt!243220 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527904 d!80963))

(check-sat (not b!528123) (not bm!31906) (not b!528168) (not b!528207) (not bm!31901) (not b!528208) (not b!528122) (not b!527966) (not d!80955) (not b!528211) (not d!80893) (not b!528125) (not bm!31898) (not b!528083) (not b!528086) (not d!80895) (not b!527993) (not d!80949) (not d!80929) (not d!80923) (not d!80903) (not b!528220) (not b!527963) (not b!528089) (not d!80945) (not b!528056) (not d!80961))
(check-sat)
