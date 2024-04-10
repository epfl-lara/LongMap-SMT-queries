; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47158 () Bool)

(assert start!47158)

(declare-fun b!519463 () Bool)

(declare-fun res!318015 () Bool)

(declare-fun e!303089 () Bool)

(assert (=> b!519463 (=> (not res!318015) (not e!303089))))

(declare-datatypes ((array!33173 0))(
  ( (array!33174 (arr!15947 (Array (_ BitVec 32) (_ BitVec 64))) (size!16311 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33173)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33173 (_ BitVec 32)) Bool)

(assert (=> b!519463 (= res!318015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519464 () Bool)

(declare-fun res!318007 () Bool)

(declare-fun e!303088 () Bool)

(assert (=> b!519464 (=> (not res!318007) (not e!303088))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519464 (= res!318007 (validKeyInArray!0 k!2280))))

(declare-fun res!318013 () Bool)

(assert (=> start!47158 (=> (not res!318013) (not e!303088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47158 (= res!318013 (validMask!0 mask!3524))))

(assert (=> start!47158 e!303088))

(assert (=> start!47158 true))

(declare-fun array_inv!11743 (array!33173) Bool)

(assert (=> start!47158 (array_inv!11743 a!3235)))

(declare-fun b!519465 () Bool)

(declare-datatypes ((Unit!16108 0))(
  ( (Unit!16109) )
))
(declare-fun e!303087 () Unit!16108)

(declare-fun Unit!16110 () Unit!16108)

(assert (=> b!519465 (= e!303087 Unit!16110)))

(declare-fun b!519466 () Bool)

(declare-fun e!303093 () Bool)

(assert (=> b!519466 (= e!303093 false)))

(declare-fun b!519467 () Bool)

(declare-fun res!318006 () Bool)

(assert (=> b!519467 (=> (not res!318006) (not e!303088))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519467 (= res!318006 (and (= (size!16311 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16311 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16311 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519468 () Bool)

(declare-fun e!303092 () Bool)

(declare-datatypes ((SeekEntryResult!4414 0))(
  ( (MissingZero!4414 (index!19850 (_ BitVec 32))) (Found!4414 (index!19851 (_ BitVec 32))) (Intermediate!4414 (undefined!5226 Bool) (index!19852 (_ BitVec 32)) (x!48821 (_ BitVec 32))) (Undefined!4414) (MissingVacant!4414 (index!19853 (_ BitVec 32))) )
))
(declare-fun lt!237887 () SeekEntryResult!4414)

(assert (=> b!519468 (= e!303092 (and (bvsge (index!19852 lt!237887) #b00000000000000000000000000000000) (bvslt (index!19852 lt!237887) (size!16311 a!3235))))))

(assert (=> b!519468 (or (= (select (arr!15947 a!3235) (index!19852 lt!237887)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15947 a!3235) (index!19852 lt!237887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!237894 () Unit!16108)

(assert (=> b!519468 (= lt!237894 e!303087)))

(declare-fun c!61025 () Bool)

(assert (=> b!519468 (= c!61025 (= (select (arr!15947 a!3235) (index!19852 lt!237887)) (select (arr!15947 a!3235) j!176)))))

(assert (=> b!519468 (and (bvslt (x!48821 lt!237887) #b01111111111111111111111111111110) (or (= (select (arr!15947 a!3235) (index!19852 lt!237887)) (select (arr!15947 a!3235) j!176)) (= (select (arr!15947 a!3235) (index!19852 lt!237887)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15947 a!3235) (index!19852 lt!237887)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!303091 () Bool)

(declare-fun b!519469 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33173 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!519469 (= e!303091 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) (Found!4414 j!176)))))

(declare-fun b!519470 () Bool)

(declare-fun res!318017 () Bool)

(assert (=> b!519470 (=> (not res!318017) (not e!303088))))

(declare-fun arrayContainsKey!0 (array!33173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519470 (= res!318017 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519471 () Bool)

(declare-fun res!318012 () Bool)

(assert (=> b!519471 (=> (not res!318012) (not e!303089))))

(declare-datatypes ((List!10105 0))(
  ( (Nil!10102) (Cons!10101 (h!11014 (_ BitVec 64)) (t!16333 List!10105)) )
))
(declare-fun arrayNoDuplicates!0 (array!33173 (_ BitVec 32) List!10105) Bool)

(assert (=> b!519471 (= res!318012 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10102))))

(declare-fun b!519472 () Bool)

(declare-fun Unit!16111 () Unit!16108)

(assert (=> b!519472 (= e!303087 Unit!16111)))

(declare-fun lt!237890 () (_ BitVec 32))

(declare-fun lt!237895 () Unit!16108)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33173 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> b!519472 (= lt!237895 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237890 #b00000000000000000000000000000000 (index!19852 lt!237887) (x!48821 lt!237887) mask!3524))))

(declare-fun lt!237893 () array!33173)

(declare-fun lt!237892 () (_ BitVec 64))

(declare-fun res!318014 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33173 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!519472 (= res!318014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237890 lt!237892 lt!237893 mask!3524) (Intermediate!4414 false (index!19852 lt!237887) (x!48821 lt!237887))))))

(assert (=> b!519472 (=> (not res!318014) (not e!303093))))

(assert (=> b!519472 e!303093))

(declare-fun b!519473 () Bool)

(declare-fun res!318011 () Bool)

(assert (=> b!519473 (=> res!318011 e!303092)))

(assert (=> b!519473 (= res!318011 (or (undefined!5226 lt!237887) (not (is-Intermediate!4414 lt!237887))))))

(declare-fun b!519474 () Bool)

(assert (=> b!519474 (= e!303089 (not e!303092))))

(declare-fun res!318008 () Bool)

(assert (=> b!519474 (=> res!318008 e!303092)))

(declare-fun lt!237891 () (_ BitVec 32))

(assert (=> b!519474 (= res!318008 (= lt!237887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237891 lt!237892 lt!237893 mask!3524)))))

(assert (=> b!519474 (= lt!237887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237890 (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519474 (= lt!237891 (toIndex!0 lt!237892 mask!3524))))

(assert (=> b!519474 (= lt!237892 (select (store (arr!15947 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519474 (= lt!237890 (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524))))

(assert (=> b!519474 (= lt!237893 (array!33174 (store (arr!15947 a!3235) i!1204 k!2280) (size!16311 a!3235)))))

(assert (=> b!519474 e!303091))

(declare-fun res!318016 () Bool)

(assert (=> b!519474 (=> (not res!318016) (not e!303091))))

(assert (=> b!519474 (= res!318016 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237889 () Unit!16108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> b!519474 (= lt!237889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519475 () Bool)

(declare-fun res!318009 () Bool)

(assert (=> b!519475 (=> (not res!318009) (not e!303088))))

(assert (=> b!519475 (= res!318009 (validKeyInArray!0 (select (arr!15947 a!3235) j!176)))))

(declare-fun b!519476 () Bool)

(assert (=> b!519476 (= e!303088 e!303089)))

(declare-fun res!318010 () Bool)

(assert (=> b!519476 (=> (not res!318010) (not e!303089))))

(declare-fun lt!237888 () SeekEntryResult!4414)

(assert (=> b!519476 (= res!318010 (or (= lt!237888 (MissingZero!4414 i!1204)) (= lt!237888 (MissingVacant!4414 i!1204))))))

(assert (=> b!519476 (= lt!237888 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47158 res!318013) b!519467))

(assert (= (and b!519467 res!318006) b!519475))

(assert (= (and b!519475 res!318009) b!519464))

(assert (= (and b!519464 res!318007) b!519470))

(assert (= (and b!519470 res!318017) b!519476))

(assert (= (and b!519476 res!318010) b!519463))

(assert (= (and b!519463 res!318015) b!519471))

(assert (= (and b!519471 res!318012) b!519474))

(assert (= (and b!519474 res!318016) b!519469))

(assert (= (and b!519474 (not res!318008)) b!519473))

(assert (= (and b!519473 (not res!318011)) b!519468))

(assert (= (and b!519468 c!61025) b!519472))

(assert (= (and b!519468 (not c!61025)) b!519465))

(assert (= (and b!519472 res!318014) b!519466))

(declare-fun m!500655 () Bool)

(assert (=> start!47158 m!500655))

(declare-fun m!500657 () Bool)

(assert (=> start!47158 m!500657))

(declare-fun m!500659 () Bool)

(assert (=> b!519468 m!500659))

(declare-fun m!500661 () Bool)

(assert (=> b!519468 m!500661))

(declare-fun m!500663 () Bool)

(assert (=> b!519463 m!500663))

(assert (=> b!519469 m!500661))

(assert (=> b!519469 m!500661))

(declare-fun m!500665 () Bool)

(assert (=> b!519469 m!500665))

(declare-fun m!500667 () Bool)

(assert (=> b!519471 m!500667))

(declare-fun m!500669 () Bool)

(assert (=> b!519464 m!500669))

(declare-fun m!500671 () Bool)

(assert (=> b!519470 m!500671))

(declare-fun m!500673 () Bool)

(assert (=> b!519474 m!500673))

(declare-fun m!500675 () Bool)

(assert (=> b!519474 m!500675))

(declare-fun m!500677 () Bool)

(assert (=> b!519474 m!500677))

(assert (=> b!519474 m!500661))

(declare-fun m!500679 () Bool)

(assert (=> b!519474 m!500679))

(assert (=> b!519474 m!500661))

(declare-fun m!500681 () Bool)

(assert (=> b!519474 m!500681))

(declare-fun m!500683 () Bool)

(assert (=> b!519474 m!500683))

(assert (=> b!519474 m!500661))

(declare-fun m!500685 () Bool)

(assert (=> b!519474 m!500685))

(declare-fun m!500687 () Bool)

(assert (=> b!519474 m!500687))

(assert (=> b!519475 m!500661))

(assert (=> b!519475 m!500661))

(declare-fun m!500689 () Bool)

(assert (=> b!519475 m!500689))

(declare-fun m!500691 () Bool)

(assert (=> b!519476 m!500691))

(declare-fun m!500693 () Bool)

(assert (=> b!519472 m!500693))

(declare-fun m!500695 () Bool)

(assert (=> b!519472 m!500695))

(push 1)

(assert (not b!519475))

(assert (not b!519471))

(assert (not b!519476))

(assert (not b!519463))

(assert (not b!519469))

(assert (not start!47158))

(assert (not b!519470))

(assert (not b!519472))

(assert (not b!519464))

(assert (not b!519474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80081 () Bool)

(declare-fun e!303135 () Bool)

(assert (=> d!80081 e!303135))

(declare-fun res!318045 () Bool)

(assert (=> d!80081 (=> (not res!318045) (not e!303135))))

(assert (=> d!80081 (= res!318045 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16311 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16311 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16311 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16311 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16311 a!3235))))))

(declare-fun lt!237930 () Unit!16108)

(declare-fun choose!47 (array!33173 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> d!80081 (= lt!237930 (choose!47 a!3235 i!1204 k!2280 j!176 lt!237890 #b00000000000000000000000000000000 (index!19852 lt!237887) (x!48821 lt!237887) mask!3524))))

(assert (=> d!80081 (validMask!0 mask!3524)))

(assert (=> d!80081 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237890 #b00000000000000000000000000000000 (index!19852 lt!237887) (x!48821 lt!237887) mask!3524) lt!237930)))

(declare-fun b!519545 () Bool)

(assert (=> b!519545 (= e!303135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237890 (select (store (arr!15947 a!3235) i!1204 k!2280) j!176) (array!33174 (store (arr!15947 a!3235) i!1204 k!2280) (size!16311 a!3235)) mask!3524) (Intermediate!4414 false (index!19852 lt!237887) (x!48821 lt!237887))))))

(assert (= (and d!80081 res!318045) b!519545))

(declare-fun m!500721 () Bool)

(assert (=> d!80081 m!500721))

(assert (=> d!80081 m!500655))

(assert (=> b!519545 m!500673))

(assert (=> b!519545 m!500675))

(assert (=> b!519545 m!500675))

(declare-fun m!500723 () Bool)

(assert (=> b!519545 m!500723))

(assert (=> b!519472 d!80081))

(declare-fun b!519604 () Bool)

(declare-fun e!303172 () SeekEntryResult!4414)

(declare-fun e!303178 () SeekEntryResult!4414)

(assert (=> b!519604 (= e!303172 e!303178)))

(declare-fun c!61070 () Bool)

(declare-fun lt!237956 () (_ BitVec 64))

(assert (=> b!519604 (= c!61070 (or (= lt!237956 lt!237892) (= (bvadd lt!237956 lt!237956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519606 () Bool)

(declare-fun lt!237955 () SeekEntryResult!4414)

(assert (=> b!519606 (and (bvsge (index!19852 lt!237955) #b00000000000000000000000000000000) (bvslt (index!19852 lt!237955) (size!16311 lt!237893)))))

(declare-fun res!318064 () Bool)

(assert (=> b!519606 (= res!318064 (= (select (arr!15947 lt!237893) (index!19852 lt!237955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303169 () Bool)

(assert (=> b!519606 (=> res!318064 e!303169)))

(declare-fun d!80089 () Bool)

(declare-fun e!303176 () Bool)

(assert (=> d!80089 e!303176))

(declare-fun c!61072 () Bool)

(assert (=> d!80089 (= c!61072 (and (is-Intermediate!4414 lt!237955) (undefined!5226 lt!237955)))))

(assert (=> d!80089 (= lt!237955 e!303172)))

(declare-fun c!61068 () Bool)

(assert (=> d!80089 (= c!61068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80089 (= lt!237956 (select (arr!15947 lt!237893) lt!237890))))

(assert (=> d!80089 (validMask!0 mask!3524)))

(assert (=> d!80089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237890 lt!237892 lt!237893 mask!3524) lt!237955)))

(declare-fun b!519608 () Bool)

(declare-fun e!303175 () Bool)

(assert (=> b!519608 (= e!303176 e!303175)))

(declare-fun res!318066 () Bool)

(assert (=> b!519608 (= res!318066 (and (is-Intermediate!4414 lt!237955) (not (undefined!5226 lt!237955)) (bvslt (x!48821 lt!237955) #b01111111111111111111111111111110) (bvsge (x!48821 lt!237955) #b00000000000000000000000000000000) (bvsge (x!48821 lt!237955) #b00000000000000000000000000000000)))))

(assert (=> b!519608 (=> (not res!318066) (not e!303175))))

(declare-fun b!519610 () Bool)

(assert (=> b!519610 (and (bvsge (index!19852 lt!237955) #b00000000000000000000000000000000) (bvslt (index!19852 lt!237955) (size!16311 lt!237893)))))

(assert (=> b!519610 (= e!303169 (= (select (arr!15947 lt!237893) (index!19852 lt!237955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519612 () Bool)

(assert (=> b!519612 (= e!303176 (bvsge (x!48821 lt!237955) #b01111111111111111111111111111110))))

(declare-fun b!519614 () Bool)

(assert (=> b!519614 (= e!303178 (Intermediate!4414 false lt!237890 #b00000000000000000000000000000000))))

(declare-fun b!519616 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519616 (= e!303178 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237890 #b00000000000000000000000000000000 mask!3524) lt!237892 lt!237893 mask!3524))))

(declare-fun b!519618 () Bool)

(assert (=> b!519618 (and (bvsge (index!19852 lt!237955) #b00000000000000000000000000000000) (bvslt (index!19852 lt!237955) (size!16311 lt!237893)))))

(declare-fun res!318063 () Bool)

(assert (=> b!519618 (= res!318063 (= (select (arr!15947 lt!237893) (index!19852 lt!237955)) lt!237892))))

(assert (=> b!519618 (=> res!318063 e!303169)))

(assert (=> b!519618 (= e!303175 e!303169)))

(declare-fun b!519620 () Bool)

(assert (=> b!519620 (= e!303172 (Intermediate!4414 true lt!237890 #b00000000000000000000000000000000))))

(assert (= (and d!80089 c!61068) b!519620))

(assert (= (and d!80089 (not c!61068)) b!519604))

(assert (= (and b!519604 c!61070) b!519614))

(assert (= (and b!519604 (not c!61070)) b!519616))

(assert (= (and d!80089 c!61072) b!519612))

(assert (= (and d!80089 (not c!61072)) b!519608))

(assert (= (and b!519608 res!318066) b!519618))

(assert (= (and b!519618 (not res!318063)) b!519606))

(assert (= (and b!519606 (not res!318064)) b!519610))

(declare-fun m!500753 () Bool)

(assert (=> b!519606 m!500753))

(assert (=> b!519610 m!500753))

(assert (=> b!519618 m!500753))

(declare-fun m!500755 () Bool)

(assert (=> d!80089 m!500755))

(assert (=> d!80089 m!500655))

(declare-fun m!500757 () Bool)

(assert (=> b!519616 m!500757))

(assert (=> b!519616 m!500757))

(declare-fun m!500761 () Bool)

(assert (=> b!519616 m!500761))

(assert (=> b!519472 d!80089))

(declare-fun b!519643 () Bool)

(declare-fun e!303198 () Bool)

(declare-fun e!303197 () Bool)

(assert (=> b!519643 (= e!303198 e!303197)))

(declare-fun c!61079 () Bool)

(assert (=> b!519643 (= c!61079 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519644 () Bool)

(declare-fun call!31754 () Bool)

(assert (=> b!519644 (= e!303197 call!31754)))

(declare-fun b!519645 () Bool)

(assert (=> b!519645 (= e!303197 call!31754)))

(declare-fun b!519646 () Bool)

(declare-fun e!303199 () Bool)

(declare-fun contains!2755 (List!10105 (_ BitVec 64)) Bool)

(assert (=> b!519646 (= e!303199 (contains!2755 Nil!10102 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31751 () Bool)

(assert (=> bm!31751 (= call!31754 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61079 (Cons!10101 (select (arr!15947 a!3235) #b00000000000000000000000000000000) Nil!10102) Nil!10102)))))

(declare-fun d!80099 () Bool)

(declare-fun res!318080 () Bool)

(declare-fun e!303196 () Bool)

(assert (=> d!80099 (=> res!318080 e!303196)))

(assert (=> d!80099 (= res!318080 (bvsge #b00000000000000000000000000000000 (size!16311 a!3235)))))

(assert (=> d!80099 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10102) e!303196)))

(declare-fun b!519647 () Bool)

(assert (=> b!519647 (= e!303196 e!303198)))

(declare-fun res!318079 () Bool)

(assert (=> b!519647 (=> (not res!318079) (not e!303198))))

(assert (=> b!519647 (= res!318079 (not e!303199))))

(declare-fun res!318081 () Bool)

(assert (=> b!519647 (=> (not res!318081) (not e!303199))))

(assert (=> b!519647 (= res!318081 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80099 (not res!318080)) b!519647))

(assert (= (and b!519647 res!318081) b!519646))

(assert (= (and b!519647 res!318079) b!519643))

(assert (= (and b!519643 c!61079) b!519644))

(assert (= (and b!519643 (not c!61079)) b!519645))

(assert (= (or b!519644 b!519645) bm!31751))

(declare-fun m!500787 () Bool)

(assert (=> b!519643 m!500787))

(assert (=> b!519643 m!500787))

(declare-fun m!500789 () Bool)

(assert (=> b!519643 m!500789))

(assert (=> b!519646 m!500787))

(assert (=> b!519646 m!500787))

(declare-fun m!500791 () Bool)

(assert (=> b!519646 m!500791))

(assert (=> bm!31751 m!500787))

(declare-fun m!500793 () Bool)

(assert (=> bm!31751 m!500793))

(assert (=> b!519647 m!500787))

(assert (=> b!519647 m!500787))

(assert (=> b!519647 m!500789))

(assert (=> b!519471 d!80099))

(declare-fun b!519687 () Bool)

(declare-fun e!303226 () SeekEntryResult!4414)

(declare-fun lt!237985 () SeekEntryResult!4414)

(assert (=> b!519687 (= e!303226 (Found!4414 (index!19852 lt!237985)))))

(declare-fun d!80111 () Bool)

(declare-fun lt!237984 () SeekEntryResult!4414)

(assert (=> d!80111 (and (or (is-Undefined!4414 lt!237984) (not (is-Found!4414 lt!237984)) (and (bvsge (index!19851 lt!237984) #b00000000000000000000000000000000) (bvslt (index!19851 lt!237984) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237984) (is-Found!4414 lt!237984) (not (is-MissingZero!4414 lt!237984)) (and (bvsge (index!19850 lt!237984) #b00000000000000000000000000000000) (bvslt (index!19850 lt!237984) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237984) (is-Found!4414 lt!237984) (is-MissingZero!4414 lt!237984) (not (is-MissingVacant!4414 lt!237984)) (and (bvsge (index!19853 lt!237984) #b00000000000000000000000000000000) (bvslt (index!19853 lt!237984) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237984) (ite (is-Found!4414 lt!237984) (= (select (arr!15947 a!3235) (index!19851 lt!237984)) k!2280) (ite (is-MissingZero!4414 lt!237984) (= (select (arr!15947 a!3235) (index!19850 lt!237984)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4414 lt!237984) (= (select (arr!15947 a!3235) (index!19853 lt!237984)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303227 () SeekEntryResult!4414)

(assert (=> d!80111 (= lt!237984 e!303227)))

(declare-fun c!61092 () Bool)

(assert (=> d!80111 (= c!61092 (and (is-Intermediate!4414 lt!237985) (undefined!5226 lt!237985)))))

(assert (=> d!80111 (= lt!237985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80111 (validMask!0 mask!3524)))

(assert (=> d!80111 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237984)))

(declare-fun b!519688 () Bool)

(declare-fun c!61093 () Bool)

(declare-fun lt!237986 () (_ BitVec 64))

(assert (=> b!519688 (= c!61093 (= lt!237986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303228 () SeekEntryResult!4414)

(assert (=> b!519688 (= e!303226 e!303228)))

(declare-fun b!519689 () Bool)

(assert (=> b!519689 (= e!303227 Undefined!4414)))

(declare-fun b!519690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33173 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!519690 (= e!303228 (seekKeyOrZeroReturnVacant!0 (x!48821 lt!237985) (index!19852 lt!237985) (index!19852 lt!237985) k!2280 a!3235 mask!3524))))

(declare-fun b!519691 () Bool)

(assert (=> b!519691 (= e!303228 (MissingZero!4414 (index!19852 lt!237985)))))

(declare-fun b!519692 () Bool)

(assert (=> b!519692 (= e!303227 e!303226)))

(assert (=> b!519692 (= lt!237986 (select (arr!15947 a!3235) (index!19852 lt!237985)))))

(declare-fun c!61094 () Bool)

(assert (=> b!519692 (= c!61094 (= lt!237986 k!2280))))

(assert (= (and d!80111 c!61092) b!519689))

(assert (= (and d!80111 (not c!61092)) b!519692))

(assert (= (and b!519692 c!61094) b!519687))

(assert (= (and b!519692 (not c!61094)) b!519688))

(assert (= (and b!519688 c!61093) b!519691))

(assert (= (and b!519688 (not c!61093)) b!519690))

(declare-fun m!500811 () Bool)

(assert (=> d!80111 m!500811))

(declare-fun m!500813 () Bool)

(assert (=> d!80111 m!500813))

(declare-fun m!500815 () Bool)

(assert (=> d!80111 m!500815))

(assert (=> d!80111 m!500655))

(declare-fun m!500817 () Bool)

(assert (=> d!80111 m!500817))

(declare-fun m!500819 () Bool)

(assert (=> d!80111 m!500819))

(assert (=> d!80111 m!500813))

(declare-fun m!500821 () Bool)

(assert (=> b!519690 m!500821))

(declare-fun m!500823 () Bool)

(assert (=> b!519692 m!500823))

(assert (=> b!519476 d!80111))

(declare-fun d!80127 () Bool)

(assert (=> d!80127 (= (validKeyInArray!0 (select (arr!15947 a!3235) j!176)) (and (not (= (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15947 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519475 d!80127))

(declare-fun d!80129 () Bool)

(assert (=> d!80129 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47158 d!80129))

(declare-fun d!80135 () Bool)

(assert (=> d!80135 (= (array_inv!11743 a!3235) (bvsge (size!16311 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47158 d!80135))

(declare-fun d!80137 () Bool)

(declare-fun res!318104 () Bool)

(declare-fun e!303236 () Bool)

(assert (=> d!80137 (=> res!318104 e!303236)))

(assert (=> d!80137 (= res!318104 (= (select (arr!15947 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80137 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303236)))

(declare-fun b!519701 () Bool)

(declare-fun e!303237 () Bool)

(assert (=> b!519701 (= e!303236 e!303237)))

(declare-fun res!318105 () Bool)

(assert (=> b!519701 (=> (not res!318105) (not e!303237))))

(assert (=> b!519701 (= res!318105 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16311 a!3235)))))

(declare-fun b!519702 () Bool)

(assert (=> b!519702 (= e!303237 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80137 (not res!318104)) b!519701))

(assert (= (and b!519701 res!318105) b!519702))

(assert (=> d!80137 m!500787))

(declare-fun m!500833 () Bool)

(assert (=> b!519702 m!500833))

(assert (=> b!519470 d!80137))

(declare-fun b!519703 () Bool)

(declare-fun e!303238 () SeekEntryResult!4414)

(declare-fun lt!237991 () SeekEntryResult!4414)

(assert (=> b!519703 (= e!303238 (Found!4414 (index!19852 lt!237991)))))

(declare-fun d!80139 () Bool)

(declare-fun lt!237990 () SeekEntryResult!4414)

(assert (=> d!80139 (and (or (is-Undefined!4414 lt!237990) (not (is-Found!4414 lt!237990)) (and (bvsge (index!19851 lt!237990) #b00000000000000000000000000000000) (bvslt (index!19851 lt!237990) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237990) (is-Found!4414 lt!237990) (not (is-MissingZero!4414 lt!237990)) (and (bvsge (index!19850 lt!237990) #b00000000000000000000000000000000) (bvslt (index!19850 lt!237990) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237990) (is-Found!4414 lt!237990) (is-MissingZero!4414 lt!237990) (not (is-MissingVacant!4414 lt!237990)) (and (bvsge (index!19853 lt!237990) #b00000000000000000000000000000000) (bvslt (index!19853 lt!237990) (size!16311 a!3235)))) (or (is-Undefined!4414 lt!237990) (ite (is-Found!4414 lt!237990) (= (select (arr!15947 a!3235) (index!19851 lt!237990)) (select (arr!15947 a!3235) j!176)) (ite (is-MissingZero!4414 lt!237990) (= (select (arr!15947 a!3235) (index!19850 lt!237990)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4414 lt!237990) (= (select (arr!15947 a!3235) (index!19853 lt!237990)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303239 () SeekEntryResult!4414)

(assert (=> d!80139 (= lt!237990 e!303239)))

(declare-fun c!61096 () Bool)

(assert (=> d!80139 (= c!61096 (and (is-Intermediate!4414 lt!237991) (undefined!5226 lt!237991)))))

(assert (=> d!80139 (= lt!237991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80139 (validMask!0 mask!3524)))

(assert (=> d!80139 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) lt!237990)))

(declare-fun b!519704 () Bool)

(declare-fun c!61097 () Bool)

(declare-fun lt!237992 () (_ BitVec 64))

(assert (=> b!519704 (= c!61097 (= lt!237992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303240 () SeekEntryResult!4414)

(assert (=> b!519704 (= e!303238 e!303240)))

(declare-fun b!519705 () Bool)

(assert (=> b!519705 (= e!303239 Undefined!4414)))

(declare-fun b!519706 () Bool)

(assert (=> b!519706 (= e!303240 (seekKeyOrZeroReturnVacant!0 (x!48821 lt!237991) (index!19852 lt!237991) (index!19852 lt!237991) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519707 () Bool)

(assert (=> b!519707 (= e!303240 (MissingZero!4414 (index!19852 lt!237991)))))

(declare-fun b!519708 () Bool)

(assert (=> b!519708 (= e!303239 e!303238)))

(assert (=> b!519708 (= lt!237992 (select (arr!15947 a!3235) (index!19852 lt!237991)))))

(declare-fun c!61098 () Bool)

(assert (=> b!519708 (= c!61098 (= lt!237992 (select (arr!15947 a!3235) j!176)))))

(assert (= (and d!80139 c!61096) b!519705))

(assert (= (and d!80139 (not c!61096)) b!519708))

(assert (= (and b!519708 c!61098) b!519703))

(assert (= (and b!519708 (not c!61098)) b!519704))

(assert (= (and b!519704 c!61097) b!519707))

(assert (= (and b!519704 (not c!61097)) b!519706))

(declare-fun m!500835 () Bool)

(assert (=> d!80139 m!500835))

(assert (=> d!80139 m!500679))

(assert (=> d!80139 m!500661))

(declare-fun m!500837 () Bool)

(assert (=> d!80139 m!500837))

(assert (=> d!80139 m!500655))

(declare-fun m!500839 () Bool)

(assert (=> d!80139 m!500839))

(declare-fun m!500841 () Bool)

(assert (=> d!80139 m!500841))

(assert (=> d!80139 m!500661))

(assert (=> d!80139 m!500679))

(assert (=> b!519706 m!500661))

(declare-fun m!500843 () Bool)

(assert (=> b!519706 m!500843))

(declare-fun m!500845 () Bool)

(assert (=> b!519708 m!500845))

(assert (=> b!519469 d!80139))

(declare-fun d!80141 () Bool)

(assert (=> d!80141 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519464 d!80141))

(declare-fun b!519739 () Bool)

(declare-fun e!303261 () Bool)

(declare-fun call!31762 () Bool)

(assert (=> b!519739 (= e!303261 call!31762)))

(declare-fun d!80143 () Bool)

(declare-fun res!318112 () Bool)

(declare-fun e!303260 () Bool)

(assert (=> d!80143 (=> res!318112 e!303260)))

(assert (=> d!80143 (= res!318112 (bvsge #b00000000000000000000000000000000 (size!16311 a!3235)))))

(assert (=> d!80143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303260)))

(declare-fun b!519740 () Bool)

(declare-fun e!303259 () Bool)

(assert (=> b!519740 (= e!303259 e!303261)))

(declare-fun lt!238011 () (_ BitVec 64))

(assert (=> b!519740 (= lt!238011 (select (arr!15947 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238012 () Unit!16108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33173 (_ BitVec 64) (_ BitVec 32)) Unit!16108)

(assert (=> b!519740 (= lt!238012 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238011 #b00000000000000000000000000000000))))

(assert (=> b!519740 (arrayContainsKey!0 a!3235 lt!238011 #b00000000000000000000000000000000)))

(declare-fun lt!238013 () Unit!16108)

(assert (=> b!519740 (= lt!238013 lt!238012)))

(declare-fun res!318113 () Bool)

(assert (=> b!519740 (= res!318113 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4414 #b00000000000000000000000000000000)))))

(assert (=> b!519740 (=> (not res!318113) (not e!303261))))

(declare-fun bm!31759 () Bool)

(assert (=> bm!31759 (= call!31762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519741 () Bool)

(assert (=> b!519741 (= e!303259 call!31762)))

(declare-fun b!519742 () Bool)

(assert (=> b!519742 (= e!303260 e!303259)))

(declare-fun c!61111 () Bool)

(assert (=> b!519742 (= c!61111 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80143 (not res!318112)) b!519742))

(assert (= (and b!519742 c!61111) b!519740))

(assert (= (and b!519742 (not c!61111)) b!519741))

(assert (= (and b!519740 res!318113) b!519739))

(assert (= (or b!519739 b!519741) bm!31759))

(assert (=> b!519740 m!500787))

(declare-fun m!500871 () Bool)

(assert (=> b!519740 m!500871))

(declare-fun m!500873 () Bool)

(assert (=> b!519740 m!500873))

(assert (=> b!519740 m!500787))

(declare-fun m!500875 () Bool)

(assert (=> b!519740 m!500875))

(declare-fun m!500877 () Bool)

(assert (=> bm!31759 m!500877))

(assert (=> b!519742 m!500787))

(assert (=> b!519742 m!500787))

(assert (=> b!519742 m!500789))

(assert (=> b!519463 d!80143))

(declare-fun d!80149 () Bool)

(declare-fun lt!238022 () (_ BitVec 32))

(declare-fun lt!238021 () (_ BitVec 32))

(assert (=> d!80149 (= lt!238022 (bvmul (bvxor lt!238021 (bvlshr lt!238021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80149 (= lt!238021 ((_ extract 31 0) (bvand (bvxor lt!237892 (bvlshr lt!237892 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80149 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318118 (let ((h!11017 ((_ extract 31 0) (bvand (bvxor lt!237892 (bvlshr lt!237892 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48829 (bvmul (bvxor h!11017 (bvlshr h!11017 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48829 (bvlshr x!48829 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318118 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318118 #b00000000000000000000000000000000))))))

(assert (=> d!80149 (= (toIndex!0 lt!237892 mask!3524) (bvand (bvxor lt!238022 (bvlshr lt!238022 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519474 d!80149))

(declare-fun d!80159 () Bool)

(declare-fun lt!238024 () (_ BitVec 32))

(declare-fun lt!238023 () (_ BitVec 32))

(assert (=> d!80159 (= lt!238024 (bvmul (bvxor lt!238023 (bvlshr lt!238023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80159 (= lt!238023 ((_ extract 31 0) (bvand (bvxor (select (arr!15947 a!3235) j!176) (bvlshr (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80159 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318118 (let ((h!11017 ((_ extract 31 0) (bvand (bvxor (select (arr!15947 a!3235) j!176) (bvlshr (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48829 (bvmul (bvxor h!11017 (bvlshr h!11017 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48829 (bvlshr x!48829 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318118 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318118 #b00000000000000000000000000000000))))))

(assert (=> d!80159 (= (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524) (bvand (bvxor lt!238024 (bvlshr lt!238024 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519474 d!80159))

(declare-fun d!80161 () Bool)

(assert (=> d!80161 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238027 () Unit!16108)

(declare-fun choose!38 (array!33173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> d!80161 (= lt!238027 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80161 (validMask!0 mask!3524)))

(assert (=> d!80161 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238027)))

(declare-fun bs!16377 () Bool)

(assert (= bs!16377 d!80161))

(assert (=> bs!16377 m!500681))

(declare-fun m!500895 () Bool)

(assert (=> bs!16377 m!500895))

(assert (=> bs!16377 m!500655))

(assert (=> b!519474 d!80161))

(declare-fun b!519765 () Bool)

(declare-fun e!303280 () SeekEntryResult!4414)

(declare-fun e!303283 () SeekEntryResult!4414)

(assert (=> b!519765 (= e!303280 e!303283)))

(declare-fun c!61118 () Bool)

(declare-fun lt!238029 () (_ BitVec 64))

(assert (=> b!519765 (= c!61118 (or (= lt!238029 (select (arr!15947 a!3235) j!176)) (= (bvadd lt!238029 lt!238029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519766 () Bool)

(declare-fun lt!238028 () SeekEntryResult!4414)

(assert (=> b!519766 (and (bvsge (index!19852 lt!238028) #b00000000000000000000000000000000) (bvslt (index!19852 lt!238028) (size!16311 a!3235)))))

(declare-fun res!318128 () Bool)

(assert (=> b!519766 (= res!318128 (= (select (arr!15947 a!3235) (index!19852 lt!238028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303279 () Bool)

(assert (=> b!519766 (=> res!318128 e!303279)))

(declare-fun d!80163 () Bool)

(declare-fun e!303282 () Bool)

(assert (=> d!80163 e!303282))

(declare-fun c!61119 () Bool)

(assert (=> d!80163 (= c!61119 (and (is-Intermediate!4414 lt!238028) (undefined!5226 lt!238028)))))

(assert (=> d!80163 (= lt!238028 e!303280)))

(declare-fun c!61117 () Bool)

(assert (=> d!80163 (= c!61117 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80163 (= lt!238029 (select (arr!15947 a!3235) lt!237890))))

(assert (=> d!80163 (validMask!0 mask!3524)))

(assert (=> d!80163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237890 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) lt!238028)))

(declare-fun b!519767 () Bool)

(declare-fun e!303281 () Bool)

(assert (=> b!519767 (= e!303282 e!303281)))

(declare-fun res!318129 () Bool)

(assert (=> b!519767 (= res!318129 (and (is-Intermediate!4414 lt!238028) (not (undefined!5226 lt!238028)) (bvslt (x!48821 lt!238028) #b01111111111111111111111111111110) (bvsge (x!48821 lt!238028) #b00000000000000000000000000000000) (bvsge (x!48821 lt!238028) #b00000000000000000000000000000000)))))

(assert (=> b!519767 (=> (not res!318129) (not e!303281))))

(declare-fun b!519768 () Bool)

(assert (=> b!519768 (and (bvsge (index!19852 lt!238028) #b00000000000000000000000000000000) (bvslt (index!19852 lt!238028) (size!16311 a!3235)))))

(assert (=> b!519768 (= e!303279 (= (select (arr!15947 a!3235) (index!19852 lt!238028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519769 () Bool)

(assert (=> b!519769 (= e!303282 (bvsge (x!48821 lt!238028) #b01111111111111111111111111111110))))

(declare-fun b!519770 () Bool)

(assert (=> b!519770 (= e!303283 (Intermediate!4414 false lt!237890 #b00000000000000000000000000000000))))

(declare-fun b!519771 () Bool)

(assert (=> b!519771 (= e!303283 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237890 #b00000000000000000000000000000000 mask!3524) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519772 () Bool)

(assert (=> b!519772 (and (bvsge (index!19852 lt!238028) #b00000000000000000000000000000000) (bvslt (index!19852 lt!238028) (size!16311 a!3235)))))

(declare-fun res!318127 () Bool)

(assert (=> b!519772 (= res!318127 (= (select (arr!15947 a!3235) (index!19852 lt!238028)) (select (arr!15947 a!3235) j!176)))))

(assert (=> b!519772 (=> res!318127 e!303279)))

(assert (=> b!519772 (= e!303281 e!303279)))

(declare-fun b!519773 () Bool)

(assert (=> b!519773 (= e!303280 (Intermediate!4414 true lt!237890 #b00000000000000000000000000000000))))

(assert (= (and d!80163 c!61117) b!519773))

(assert (= (and d!80163 (not c!61117)) b!519765))

(assert (= (and b!519765 c!61118) b!519770))

(assert (= (and b!519765 (not c!61118)) b!519771))

(assert (= (and d!80163 c!61119) b!519769))

(assert (= (and d!80163 (not c!61119)) b!519767))

(assert (= (and b!519767 res!318129) b!519772))

(assert (= (and b!519772 (not res!318127)) b!519766))

(assert (= (and b!519766 (not res!318128)) b!519768))

(declare-fun m!500897 () Bool)

(assert (=> b!519766 m!500897))

(assert (=> b!519768 m!500897))

(assert (=> b!519772 m!500897))

(declare-fun m!500899 () Bool)

(assert (=> d!80163 m!500899))

(assert (=> d!80163 m!500655))

(assert (=> b!519771 m!500757))

(assert (=> b!519771 m!500757))

(assert (=> b!519771 m!500661))

(declare-fun m!500901 () Bool)

(assert (=> b!519771 m!500901))

(assert (=> b!519474 d!80163))

(declare-fun b!519774 () Bool)

(declare-fun e!303286 () Bool)

(declare-fun call!31765 () Bool)

(assert (=> b!519774 (= e!303286 call!31765)))

(declare-fun d!80165 () Bool)

(declare-fun res!318130 () Bool)

(declare-fun e!303285 () Bool)

(assert (=> d!80165 (=> res!318130 e!303285)))

(assert (=> d!80165 (= res!318130 (bvsge j!176 (size!16311 a!3235)))))

(assert (=> d!80165 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303285)))

(declare-fun b!519775 () Bool)

(declare-fun e!303284 () Bool)

(assert (=> b!519775 (= e!303284 e!303286)))

(declare-fun lt!238030 () (_ BitVec 64))

(assert (=> b!519775 (= lt!238030 (select (arr!15947 a!3235) j!176))))

(declare-fun lt!238031 () Unit!16108)

(assert (=> b!519775 (= lt!238031 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238030 j!176))))

(assert (=> b!519775 (arrayContainsKey!0 a!3235 lt!238030 #b00000000000000000000000000000000)))

(declare-fun lt!238032 () Unit!16108)

(assert (=> b!519775 (= lt!238032 lt!238031)))

(declare-fun res!318131 () Bool)

(assert (=> b!519775 (= res!318131 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) (Found!4414 j!176)))))

(assert (=> b!519775 (=> (not res!318131) (not e!303286))))

(declare-fun bm!31762 () Bool)

(assert (=> bm!31762 (= call!31765 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519776 () Bool)

(assert (=> b!519776 (= e!303284 call!31765)))

(declare-fun b!519777 () Bool)

(assert (=> b!519777 (= e!303285 e!303284)))

(declare-fun c!61120 () Bool)

(assert (=> b!519777 (= c!61120 (validKeyInArray!0 (select (arr!15947 a!3235) j!176)))))

(assert (= (and d!80165 (not res!318130)) b!519777))

(assert (= (and b!519777 c!61120) b!519775))

(assert (= (and b!519777 (not c!61120)) b!519776))

(assert (= (and b!519775 res!318131) b!519774))

(assert (= (or b!519774 b!519776) bm!31762))

(assert (=> b!519775 m!500661))

(declare-fun m!500903 () Bool)

(assert (=> b!519775 m!500903))

(declare-fun m!500905 () Bool)

(assert (=> b!519775 m!500905))

(assert (=> b!519775 m!500661))

(assert (=> b!519775 m!500665))

(declare-fun m!500907 () Bool)

(assert (=> bm!31762 m!500907))

(assert (=> b!519777 m!500661))

(assert (=> 