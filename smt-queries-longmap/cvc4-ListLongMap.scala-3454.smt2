; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47920 () Bool)

(assert start!47920)

(declare-fun b!527943 () Bool)

(declare-fun res!324200 () Bool)

(declare-fun e!307662 () Bool)

(assert (=> b!527943 (=> (not res!324200) (not e!307662))))

(declare-datatypes ((array!33488 0))(
  ( (array!33489 (arr!16094 (Array (_ BitVec 32) (_ BitVec 64))) (size!16458 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33488)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33488 (_ BitVec 32)) Bool)

(assert (=> b!527943 (= res!324200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527944 () Bool)

(declare-fun e!307667 () Bool)

(assert (=> b!527944 (= e!307667 e!307662)))

(declare-fun res!324202 () Bool)

(assert (=> b!527944 (=> (not res!324202) (not e!307662))))

(declare-datatypes ((SeekEntryResult!4561 0))(
  ( (MissingZero!4561 (index!20462 (_ BitVec 32))) (Found!4561 (index!20463 (_ BitVec 32))) (Intermediate!4561 (undefined!5373 Bool) (index!20464 (_ BitVec 32)) (x!49426 (_ BitVec 32))) (Undefined!4561) (MissingVacant!4561 (index!20465 (_ BitVec 32))) )
))
(declare-fun lt!243100 () SeekEntryResult!4561)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527944 (= res!324202 (or (= lt!243100 (MissingZero!4561 i!1204)) (= lt!243100 (MissingVacant!4561 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33488 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!527944 (= lt!243100 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527945 () Bool)

(declare-fun res!324207 () Bool)

(assert (=> b!527945 (=> (not res!324207) (not e!307667))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527945 (= res!324207 (validKeyInArray!0 (select (arr!16094 a!3235) j!176)))))

(declare-fun b!527947 () Bool)

(declare-fun res!324205 () Bool)

(assert (=> b!527947 (=> (not res!324205) (not e!307667))))

(assert (=> b!527947 (= res!324205 (validKeyInArray!0 k!2280))))

(declare-fun b!527948 () Bool)

(declare-fun e!307666 () Bool)

(declare-fun e!307663 () Bool)

(assert (=> b!527948 (= e!307666 e!307663)))

(declare-fun res!324203 () Bool)

(assert (=> b!527948 (=> res!324203 e!307663)))

(declare-fun lt!243098 () (_ BitVec 32))

(declare-fun lt!243104 () SeekEntryResult!4561)

(assert (=> b!527948 (= res!324203 (or (bvsgt (x!49426 lt!243104) #b01111111111111111111111111111110) (bvslt lt!243098 #b00000000000000000000000000000000) (bvsge lt!243098 (size!16458 a!3235)) (bvslt (index!20464 lt!243104) #b00000000000000000000000000000000) (bvsge (index!20464 lt!243104) (size!16458 a!3235)) (not (= lt!243104 (Intermediate!4561 false (index!20464 lt!243104) (x!49426 lt!243104)))) (bvsle #b00000000000000000000000000000000 (x!49426 lt!243104))))))

(assert (=> b!527948 (= (index!20464 lt!243104) i!1204)))

(declare-datatypes ((Unit!16696 0))(
  ( (Unit!16697) )
))
(declare-fun lt!243099 () Unit!16696)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!527948 (= lt!243099 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524))))

(assert (=> b!527948 (and (or (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243097 () Unit!16696)

(declare-fun e!307668 () Unit!16696)

(assert (=> b!527948 (= lt!243097 e!307668)))

(declare-fun c!62180 () Bool)

(assert (=> b!527948 (= c!62180 (= (select (arr!16094 a!3235) (index!20464 lt!243104)) (select (arr!16094 a!3235) j!176)))))

(assert (=> b!527948 (and (bvslt (x!49426 lt!243104) #b01111111111111111111111111111110) (or (= (select (arr!16094 a!3235) (index!20464 lt!243104)) (select (arr!16094 a!3235) j!176)) (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16094 a!3235) (index!20464 lt!243104)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527949 () Bool)

(declare-fun res!324208 () Bool)

(assert (=> b!527949 (=> res!324208 e!307666)))

(assert (=> b!527949 (= res!324208 (or (undefined!5373 lt!243104) (not (is-Intermediate!4561 lt!243104))))))

(declare-fun b!527950 () Bool)

(declare-fun res!324199 () Bool)

(assert (=> b!527950 (=> (not res!324199) (not e!307662))))

(declare-datatypes ((List!10252 0))(
  ( (Nil!10249) (Cons!10248 (h!11182 (_ BitVec 64)) (t!16480 List!10252)) )
))
(declare-fun arrayNoDuplicates!0 (array!33488 (_ BitVec 32) List!10252) Bool)

(assert (=> b!527950 (= res!324199 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10249))))

(declare-fun b!527951 () Bool)

(declare-fun Unit!16698 () Unit!16696)

(assert (=> b!527951 (= e!307668 Unit!16698)))

(declare-fun b!527952 () Bool)

(declare-fun Unit!16699 () Unit!16696)

(assert (=> b!527952 (= e!307668 Unit!16699)))

(declare-fun lt!243105 () Unit!16696)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!527952 (= lt!243105 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524))))

(declare-fun lt!243106 () array!33488)

(declare-fun lt!243101 () (_ BitVec 64))

(declare-fun res!324197 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33488 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!527952 (= res!324197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243098 lt!243101 lt!243106 mask!3524) (Intermediate!4561 false (index!20464 lt!243104) (x!49426 lt!243104))))))

(declare-fun e!307664 () Bool)

(assert (=> b!527952 (=> (not res!324197) (not e!307664))))

(assert (=> b!527952 e!307664))

(declare-fun b!527953 () Bool)

(assert (=> b!527953 (= e!307664 false)))

(declare-fun b!527946 () Bool)

(declare-fun res!324209 () Bool)

(assert (=> b!527946 (=> (not res!324209) (not e!307667))))

(assert (=> b!527946 (= res!324209 (and (= (size!16458 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16458 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16458 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!324198 () Bool)

(assert (=> start!47920 (=> (not res!324198) (not e!307667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47920 (= res!324198 (validMask!0 mask!3524))))

(assert (=> start!47920 e!307667))

(assert (=> start!47920 true))

(declare-fun array_inv!11890 (array!33488) Bool)

(assert (=> start!47920 (array_inv!11890 a!3235)))

(declare-fun b!527954 () Bool)

(declare-fun res!324204 () Bool)

(assert (=> b!527954 (=> (not res!324204) (not e!307667))))

(declare-fun arrayContainsKey!0 (array!33488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527954 (= res!324204 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527955 () Bool)

(assert (=> b!527955 (= e!307662 (not e!307666))))

(declare-fun res!324201 () Bool)

(assert (=> b!527955 (=> res!324201 e!307666)))

(declare-fun lt!243102 () (_ BitVec 32))

(assert (=> b!527955 (= res!324201 (= lt!243104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243102 lt!243101 lt!243106 mask!3524)))))

(assert (=> b!527955 (= lt!243104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243098 (select (arr!16094 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527955 (= lt!243102 (toIndex!0 lt!243101 mask!3524))))

(assert (=> b!527955 (= lt!243101 (select (store (arr!16094 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527955 (= lt!243098 (toIndex!0 (select (arr!16094 a!3235) j!176) mask!3524))))

(assert (=> b!527955 (= lt!243106 (array!33489 (store (arr!16094 a!3235) i!1204 k!2280) (size!16458 a!3235)))))

(declare-fun e!307665 () Bool)

(assert (=> b!527955 e!307665))

(declare-fun res!324206 () Bool)

(assert (=> b!527955 (=> (not res!324206) (not e!307665))))

(assert (=> b!527955 (= res!324206 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243103 () Unit!16696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!527955 (= lt!243103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527956 () Bool)

(assert (=> b!527956 (= e!307665 (= (seekEntryOrOpen!0 (select (arr!16094 a!3235) j!176) a!3235 mask!3524) (Found!4561 j!176)))))

(declare-fun b!527957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33488 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!527957 (= e!307663 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243098 (index!20464 lt!243104) (select (arr!16094 a!3235) j!176) a!3235 mask!3524) (Found!4561 j!176)))))

(assert (= (and start!47920 res!324198) b!527946))

(assert (= (and b!527946 res!324209) b!527945))

(assert (= (and b!527945 res!324207) b!527947))

(assert (= (and b!527947 res!324205) b!527954))

(assert (= (and b!527954 res!324204) b!527944))

(assert (= (and b!527944 res!324202) b!527943))

(assert (= (and b!527943 res!324200) b!527950))

(assert (= (and b!527950 res!324199) b!527955))

(assert (= (and b!527955 res!324206) b!527956))

(assert (= (and b!527955 (not res!324201)) b!527949))

(assert (= (and b!527949 (not res!324208)) b!527948))

(assert (= (and b!527948 c!62180) b!527952))

(assert (= (and b!527948 (not c!62180)) b!527951))

(assert (= (and b!527952 res!324197) b!527953))

(assert (= (and b!527948 (not res!324203)) b!527957))

(declare-fun m!508613 () Bool)

(assert (=> b!527948 m!508613))

(declare-fun m!508615 () Bool)

(assert (=> b!527948 m!508615))

(declare-fun m!508617 () Bool)

(assert (=> b!527948 m!508617))

(declare-fun m!508619 () Bool)

(assert (=> b!527950 m!508619))

(declare-fun m!508621 () Bool)

(assert (=> b!527944 m!508621))

(declare-fun m!508623 () Bool)

(assert (=> start!47920 m!508623))

(declare-fun m!508625 () Bool)

(assert (=> start!47920 m!508625))

(assert (=> b!527945 m!508617))

(assert (=> b!527945 m!508617))

(declare-fun m!508627 () Bool)

(assert (=> b!527945 m!508627))

(declare-fun m!508629 () Bool)

(assert (=> b!527947 m!508629))

(assert (=> b!527955 m!508617))

(declare-fun m!508631 () Bool)

(assert (=> b!527955 m!508631))

(declare-fun m!508633 () Bool)

(assert (=> b!527955 m!508633))

(declare-fun m!508635 () Bool)

(assert (=> b!527955 m!508635))

(declare-fun m!508637 () Bool)

(assert (=> b!527955 m!508637))

(declare-fun m!508639 () Bool)

(assert (=> b!527955 m!508639))

(assert (=> b!527955 m!508617))

(declare-fun m!508641 () Bool)

(assert (=> b!527955 m!508641))

(assert (=> b!527955 m!508617))

(declare-fun m!508643 () Bool)

(assert (=> b!527955 m!508643))

(declare-fun m!508645 () Bool)

(assert (=> b!527955 m!508645))

(declare-fun m!508647 () Bool)

(assert (=> b!527943 m!508647))

(assert (=> b!527956 m!508617))

(assert (=> b!527956 m!508617))

(declare-fun m!508649 () Bool)

(assert (=> b!527956 m!508649))

(declare-fun m!508651 () Bool)

(assert (=> b!527952 m!508651))

(declare-fun m!508653 () Bool)

(assert (=> b!527952 m!508653))

(declare-fun m!508655 () Bool)

(assert (=> b!527954 m!508655))

(assert (=> b!527957 m!508617))

(assert (=> b!527957 m!508617))

(declare-fun m!508657 () Bool)

(assert (=> b!527957 m!508657))

(push 1)

(assert (not b!527950))

(assert (not b!527947))

(assert (not b!527955))

(assert (not b!527944))

(assert (not start!47920))

(assert (not b!527954))

(assert (not b!527956))

(assert (not b!527945))

(assert (not b!527957))

(assert (not b!527943))

(assert (not b!527952))

(assert (not b!527948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80905 () Bool)

(assert (=> d!80905 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527947 d!80905))

(declare-fun b!528045 () Bool)

(declare-fun e!307721 () SeekEntryResult!4561)

(declare-fun e!307720 () SeekEntryResult!4561)

(assert (=> b!528045 (= e!307721 e!307720)))

(declare-fun c!62214 () Bool)

(declare-fun lt!243141 () (_ BitVec 64))

(assert (=> b!528045 (= c!62214 (= lt!243141 (select (arr!16094 a!3235) j!176)))))

(declare-fun b!528046 () Bool)

(declare-fun e!307722 () SeekEntryResult!4561)

(assert (=> b!528046 (= e!307722 (MissingVacant!4561 (index!20464 lt!243104)))))

(declare-fun b!528047 () Bool)

(assert (=> b!528047 (= e!307721 Undefined!4561)))

(declare-fun lt!243142 () SeekEntryResult!4561)

(declare-fun d!80907 () Bool)

(assert (=> d!80907 (and (or (is-Undefined!4561 lt!243142) (not (is-Found!4561 lt!243142)) (and (bvsge (index!20463 lt!243142) #b00000000000000000000000000000000) (bvslt (index!20463 lt!243142) (size!16458 a!3235)))) (or (is-Undefined!4561 lt!243142) (is-Found!4561 lt!243142) (not (is-MissingVacant!4561 lt!243142)) (not (= (index!20465 lt!243142) (index!20464 lt!243104))) (and (bvsge (index!20465 lt!243142) #b00000000000000000000000000000000) (bvslt (index!20465 lt!243142) (size!16458 a!3235)))) (or (is-Undefined!4561 lt!243142) (ite (is-Found!4561 lt!243142) (= (select (arr!16094 a!3235) (index!20463 lt!243142)) (select (arr!16094 a!3235) j!176)) (and (is-MissingVacant!4561 lt!243142) (= (index!20465 lt!243142) (index!20464 lt!243104)) (= (select (arr!16094 a!3235) (index!20465 lt!243142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!80907 (= lt!243142 e!307721)))

(declare-fun c!62215 () Bool)

(assert (=> d!80907 (= c!62215 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80907 (= lt!243141 (select (arr!16094 a!3235) lt!243098))))

(assert (=> d!80907 (validMask!0 mask!3524)))

(assert (=> d!80907 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243098 (index!20464 lt!243104) (select (arr!16094 a!3235) j!176) a!3235 mask!3524) lt!243142)))

(declare-fun b!528044 () Bool)

(assert (=> b!528044 (= e!307720 (Found!4561 lt!243098))))

(declare-fun b!528048 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528048 (= e!307722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243098 #b00000000000000000000000000000000 mask!3524) (index!20464 lt!243104) (select (arr!16094 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!528049 () Bool)

(declare-fun c!62213 () Bool)

(assert (=> b!528049 (= c!62213 (= lt!243141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528049 (= e!307720 e!307722)))

(assert (= (and d!80907 c!62215) b!528047))

(assert (= (and d!80907 (not c!62215)) b!528045))

(assert (= (and b!528045 c!62214) b!528044))

(assert (= (and b!528045 (not c!62214)) b!528049))

(assert (= (and b!528049 c!62213) b!528046))

(assert (= (and b!528049 (not c!62213)) b!528048))

(declare-fun m!508687 () Bool)

(assert (=> d!80907 m!508687))

(declare-fun m!508691 () Bool)

(assert (=> d!80907 m!508691))

(declare-fun m!508693 () Bool)

(assert (=> d!80907 m!508693))

(assert (=> d!80907 m!508623))

(declare-fun m!508697 () Bool)

(assert (=> b!528048 m!508697))

(assert (=> b!528048 m!508697))

(assert (=> b!528048 m!508617))

(declare-fun m!508703 () Bool)

(assert (=> b!528048 m!508703))

(assert (=> b!527957 d!80907))

(declare-fun d!80913 () Bool)

(assert (=> d!80913 (= (index!20464 lt!243104) i!1204)))

(declare-fun lt!243148 () Unit!16696)

(declare-fun choose!104 (array!33488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> d!80913 (= lt!243148 (choose!104 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524))))

(assert (=> d!80913 (validMask!0 mask!3524)))

(assert (=> d!80913 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524) lt!243148)))

(declare-fun bs!16547 () Bool)

(assert (= bs!16547 d!80913))

(declare-fun m!508709 () Bool)

(assert (=> bs!16547 m!508709))

(assert (=> bs!16547 m!508623))

(assert (=> b!527948 d!80913))

(declare-fun b!528071 () Bool)

(declare-fun e!307738 () Bool)

(declare-fun call!31898 () Bool)

(assert (=> b!528071 (= e!307738 call!31898)))

(declare-fun b!528072 () Bool)

(declare-fun e!307737 () Bool)

(declare-fun contains!2777 (List!10252 (_ BitVec 64)) Bool)

(assert (=> b!528072 (= e!307737 (contains!2777 Nil!10249 (select (arr!16094 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31895 () Bool)

(declare-fun c!62222 () Bool)

(assert (=> bm!31895 (= call!31898 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62222 (Cons!10248 (select (arr!16094 a!3235) #b00000000000000000000000000000000) Nil!10249) Nil!10249)))))

(declare-fun d!80917 () Bool)

(declare-fun res!324242 () Bool)

(declare-fun e!307739 () Bool)

(assert (=> d!80917 (=> res!324242 e!307739)))

(assert (=> d!80917 (= res!324242 (bvsge #b00000000000000000000000000000000 (size!16458 a!3235)))))

(assert (=> d!80917 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10249) e!307739)))

(declare-fun b!528070 () Bool)

(declare-fun e!307740 () Bool)

(assert (=> b!528070 (= e!307740 e!307738)))

(assert (=> b!528070 (= c!62222 (validKeyInArray!0 (select (arr!16094 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528073 () Bool)

(assert (=> b!528073 (= e!307738 call!31898)))

(declare-fun b!528074 () Bool)

(assert (=> b!528074 (= e!307739 e!307740)))

(declare-fun res!324240 () Bool)

(assert (=> b!528074 (=> (not res!324240) (not e!307740))))

(assert (=> b!528074 (= res!324240 (not e!307737))))

(declare-fun res!324241 () Bool)

(assert (=> b!528074 (=> (not res!324241) (not e!307737))))

(assert (=> b!528074 (= res!324241 (validKeyInArray!0 (select (arr!16094 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80917 (not res!324242)) b!528074))

(assert (= (and b!528074 res!324241) b!528072))

(assert (= (and b!528074 res!324240) b!528070))

(assert (= (and b!528070 c!62222) b!528071))

(assert (= (and b!528070 (not c!62222)) b!528073))

(assert (= (or b!528071 b!528073) bm!31895))

(declare-fun m!508723 () Bool)

(assert (=> b!528072 m!508723))

(assert (=> b!528072 m!508723))

(declare-fun m!508725 () Bool)

(assert (=> b!528072 m!508725))

(assert (=> bm!31895 m!508723))

(declare-fun m!508727 () Bool)

(assert (=> bm!31895 m!508727))

(assert (=> b!528070 m!508723))

(assert (=> b!528070 m!508723))

(declare-fun m!508729 () Bool)

(assert (=> b!528070 m!508729))

(assert (=> b!528074 m!508723))

(assert (=> b!528074 m!508723))

(assert (=> b!528074 m!508729))

(assert (=> b!527950 d!80917))

(declare-fun d!80921 () Bool)

(declare-fun e!307776 () Bool)

(assert (=> d!80921 e!307776))

(declare-fun res!324260 () Bool)

(assert (=> d!80921 (=> (not res!324260) (not e!307776))))

(assert (=> d!80921 (= res!324260 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16458 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16458 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16458 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16458 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16458 a!3235))))))

(declare-fun lt!243175 () Unit!16696)

(declare-fun choose!47 (array!33488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> d!80921 (= lt!243175 (choose!47 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524))))

(assert (=> d!80921 (validMask!0 mask!3524)))

(assert (=> d!80921 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243098 #b00000000000000000000000000000000 (index!20464 lt!243104) (x!49426 lt!243104) mask!3524) lt!243175)))

(declare-fun b!528128 () Bool)

(assert (=> b!528128 (= e!307776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243098 (select (store (arr!16094 a!3235) i!1204 k!2280) j!176) (array!33489 (store (arr!16094 a!3235) i!1204 k!2280) (size!16458 a!3235)) mask!3524) (Intermediate!4561 false (index!20464 lt!243104) (x!49426 lt!243104))))))

(assert (= (and d!80921 res!324260) b!528128))

(declare-fun m!508771 () Bool)

(assert (=> d!80921 m!508771))

(assert (=> d!80921 m!508623))

(assert (=> b!528128 m!508633))

(assert (=> b!528128 m!508637))

(assert (=> b!528128 m!508637))

(declare-fun m!508773 () Bool)

(assert (=> b!528128 m!508773))

(assert (=> b!527952 d!80921))

(declare-fun b!528190 () Bool)

(declare-fun e!307821 () SeekEntryResult!4561)

(assert (=> b!528190 (= e!307821 (Intermediate!4561 false lt!243098 #b00000000000000000000000000000000))))

(declare-fun b!528191 () Bool)

(declare-fun lt!243208 () SeekEntryResult!4561)

(assert (=> b!528191 (and (bvsge (index!20464 lt!243208) #b00000000000000000000000000000000) (bvslt (index!20464 lt!243208) (size!16458 lt!243106)))))

(declare-fun e!307818 () Bool)

(assert (=> b!528191 (= e!307818 (= (select (arr!16094 lt!243106) (index!20464 lt!243208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528192 () Bool)

(declare-fun e!307817 () SeekEntryResult!4561)

(assert (=> b!528192 (= e!307817 e!307821)))

(declare-fun c!62261 () Bool)

(declare-fun lt!243209 () (_ BitVec 64))

(assert (=> b!528192 (= c!62261 (or (= lt!243209 lt!243101) (= (bvadd lt!243209 lt!243209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528193 () Bool)

(assert (=> b!528193 (= e!307821 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243098 #b00000000000000000000000000000000 mask!3524) lt!243101 lt!243106 mask!3524))))

(declare-fun b!528195 () Bool)

(assert (=> b!528195 (= e!307817 (Intermediate!4561 true lt!243098 #b00000000000000000000000000000000))))

(declare-fun b!528196 () Bool)

(assert (=> b!528196 (and (bvsge (index!20464 lt!243208) #b00000000000000000000000000000000) (bvslt (index!20464 lt!243208) (size!16458 lt!243106)))))

(declare-fun res!324288 () Bool)

(assert (=> b!528196 (= res!324288 (= (select (arr!16094 lt!243106) (index!20464 lt!243208)) lt!243101))))

(assert (=> b!528196 (=> res!324288 e!307818)))

(declare-fun e!307819 () Bool)

(assert (=> b!528196 (= e!307819 e!307818)))

(declare-fun b!528197 () Bool)

(declare-fun e!307820 () Bool)

(assert (=> b!528197 (= e!307820 e!307819)))

(declare-fun res!324286 () Bool)

(assert (=> b!528197 (= res!324286 (and (is-Intermediate!4561 lt!243208) (not (undefined!5373 lt!243208)) (bvslt (x!49426 lt!243208) #b01111111111111111111111111111110) (bvsge (x!49426 lt!243208) #b00000000000000000000000000000000) (bvsge (x!49426 lt!243208) #b00000000000000000000000000000000)))))

(assert (=> b!528197 (=> (not res!324286) (not e!307819))))

(declare-fun b!528198 () Bool)

(assert (=> b!528198 (= e!307820 (bvsge (x!49426 lt!243208) #b01111111111111111111111111111110))))

(declare-fun d!80931 () Bool)

(assert (=> d!80931 e!307820))

(declare-fun c!62262 () Bool)

(assert (=> d!80931 (= c!62262 (and (is-Intermediate!4561 lt!243208) (undefined!5373 lt!243208)))))

(assert (=> d!80931 (= lt!243208 e!307817)))

(declare-fun c!62260 () Bool)

(assert (=> d!80931 (= c!62260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80931 (= lt!243209 (select (arr!16094 lt!243106) lt!243098))))

(assert (=> d!80931 (validMask!0 mask!3524)))

(assert (=> d!80931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243098 lt!243101 lt!243106 mask!3524) lt!243208)))

(declare-fun b!528194 () Bool)

(assert (=> b!528194 (and (bvsge (index!20464 lt!243208) #b00000000000000000000000000000000) (bvslt (index!20464 lt!243208) (size!16458 lt!243106)))))

(declare-fun res!324287 () Bool)

(assert (=> b!528194 (= res!324287 (= (select (arr!16094 lt!243106) (index!20464 lt!243208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528194 (=> res!324287 e!307818)))

(assert (= (and d!80931 c!62260) b!528195))

(assert (= (and d!80931 (not c!62260)) b!528192))

(assert (= (and b!528192 c!62261) b!528190))

(assert (= (and b!528192 (not c!62261)) b!528193))

(assert (= (and d!80931 c!62262) b!528198))

(assert (= (and d!80931 (not c!62262)) b!528197))

(assert (= (and b!528197 res!324286) b!528196))

(assert (= (and b!528196 (not res!324288)) b!528194))

(assert (= (and b!528194 (not res!324287)) b!528191))

(declare-fun m!508801 () Bool)

(assert (=> b!528194 m!508801))

(assert (=> b!528196 m!508801))

(declare-fun m!508803 () Bool)

(assert (=> d!80931 m!508803))

(assert (=> d!80931 m!508623))

(assert (=> b!528191 m!508801))

(assert (=> b!528193 m!508697))

(assert (=> b!528193 m!508697))

(declare-fun m!508805 () Bool)

(assert (=> b!528193 m!508805))

(assert (=> b!527952 d!80931))

(declare-fun bm!31909 () Bool)

(declare-fun call!31912 () Bool)

(assert (=> bm!31909 (= call!31912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!528247 () Bool)

(declare-fun e!307851 () Bool)

(declare-fun e!307852 () Bool)

(assert (=> b!528247 (= e!307851 e!307852)))

(declare-fun lt!243232 () (_ BitVec 64))

(assert (=> b!528247 (= lt!243232 (select (arr!16094 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243233 () Unit!16696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33488 (_ BitVec 64) (_ BitVec 32)) Unit!16696)

(assert (=> b!528247 (= lt!243233 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243232 #b00000000000000000000000000000000))))

(assert (=> b!528247 (arrayContainsKey!0 a!3235 lt!243232 #b00000000000000000000000000000000)))

(declare-fun lt!243231 () Unit!16696)

(assert (=> b!528247 (= lt!243231 lt!243233)))

(declare-fun res!324307 () Bool)

(assert (=> b!528247 (= res!324307 (= (seekEntryOrOpen!0 (select (arr!16094 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4561 #b00000000000000000000000000000000)))))

(assert (=> b!528247 (=> (not res!324307) (not e!307852))))

(declare-fun b!528248 () Bool)

(assert (=> b!528248 (= e!307852 call!31912)))

(declare-fun b!528250 () Bool)

(declare-fun e!307853 () Bool)

(assert (=> b!528250 (= e!307853 e!307851)))

(declare-fun c!62278 () Bool)

(assert (=> b!528250 (= c!62278 (validKeyInArray!0 (select (arr!16094 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80957 () Bool)

(declare-fun res!324308 () Bool)

(assert (=> d!80957 (=> res!324308 e!307853)))

(assert (=> d!80957 (= res!324308 (bvsge #b00000000000000000000000000000000 (size!16458 a!3235)))))

(assert (=> d!80957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307853)))

(declare-fun b!528249 () Bool)

(assert (=> b!528249 (= e!307851 call!31912)))

(assert (= (and d!80957 (not res!324308)) b!528250))

(assert (= (and b!528250 c!62278) b!528247))

(assert (= (and b!528250 (not c!62278)) b!528249))

(assert (= (and b!528247 res!324307) b!528248))

(assert (= (or b!528248 b!528249) bm!31909))

(declare-fun m!508825 () Bool)

(assert (=> bm!31909 m!508825))

(assert (=> b!528247 m!508723))

(declare-fun m!508827 () Bool)

(assert (=> b!528247 m!508827))

(declare-fun m!508829 () Bool)

(assert (=> b!528247 m!508829))

(assert (=> b!528247 m!508723))

(declare-fun m!508831 () Bool)

(assert (=> b!528247 m!508831))

(assert (=> b!528250 m!508723))

(assert (=> b!528250 m!508723))

(assert (=> b!528250 m!508729))

(assert (=> b!527943 d!80957))

(declare-fun d!80965 () Bool)

(assert (=> d!80965 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47920 d!80965))

(declare-fun d!80973 () Bool)

(assert (=> d!80973 (= (array_inv!11890 a!3235) (bvsge (size!16458 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47920 d!80973))

(declare-fun b!528293 () Bool)

(declare-fun e!307878 () SeekEntryResult!4561)

(declare-fun lt!243252 () SeekEntryResult!4561)

(assert (=> b!528293 (= e!307878 (Found!4561 (index!20464 lt!243252)))))

(declare-fun d!80975 () Bool)

(declare-fun lt!243253 () SeekEntryResult!4561)

(assert (=> d!80975 (and (or (is-Undefined!4561 lt!243253) (not (is-Found!4561 lt!243253)) (and (bvsge (index!20463 lt!243253) #b00000000000000000000000000000000) (bvslt (index!20463 lt!243253) (size!16458 a!3235)))) (or (is-Undefined!4561 lt!243253) (is-Found!4561 lt!243253) (not (is-MissingZero!4561 lt!243253)) (and (bvsge (index!20462 lt!243253) #b00000000000000000000000000000000) (bvslt (index!20462 lt!243253) (size!16458 a!3235)))) (or (is-Undefined!4561 lt!243253) (is-Found!4561 lt!243253) (is-MissingZero!4561 lt!243253) (not (is-MissingVacant!4561 lt!243253)) (and (bvsge (index!20465 lt!243253) #b00000000000000000000000000000000) (bvslt (index!20465 lt!243253) (size!16458 a!3235)))) (or (is-Undefined!4561 lt!243253) (ite (is-Found!4561 lt!243253) (= (select (arr!16094 a!3235) (index!20463 lt!243253)) k!2280) (ite (is-MissingZero!4561 lt!243253) (= (select (arr!16094 a!3235) (index!20462 lt!243253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4561 lt!243253) (= (select (arr!16094 a!3235) (index!20465 lt!243253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307880 () SeekEntryResult!4561)

(assert (=> d!80975 (= lt!243253 e!307880)))

(declare-fun c!62296 () Bool)

(assert (=> d!80975 (= c!62296 (and (is-Intermediate!4561 lt!243252) (undefined!5373 lt!243252)))))

(assert (=> d!80975 (= lt!243252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80975 (validMask!0 mask!3524)))

(assert (=> d!80975 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!243253)))

(declare-fun b!528294 () Bool)

(declare-fun c!62295 () Bool)

(declare-fun lt!243251 () (_ BitVec 64))

(assert (=> b!528294 (= c!62295 (= lt!243251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307879 () SeekEntryResult!4561)

(assert (=> b!528294 (= e!307878 e!307879)))

(declare-fun b!528295 () Bool)

(assert (=> b!528295 (= e!307879 (seekKeyOrZeroReturnVacant!0 (x!49426 lt!243252) (index!20464 lt!243252) (index!20464 lt!243252) k!2280 a!3235 mask!3524))))

(declare-fun b!528296 () Bool)

(assert (=> b!528296 (= e!307880 Undefined!4561)))

(declare-fun b!528297 () Bool)

(assert (=> b!528297 (= e!307880 e!307878)))

(assert (=> b!528297 (= lt!243251 (select (arr!16094 a!3235) (index!20464 lt!243252)))))

(declare-fun c!62294 () Bool)

(assert (=> b!528297 (= c!62294 (= lt!243251 k!2280))))

(declare-fun b!528298 () Bool)

(assert (=> b!528298 (= e!307879 (MissingZero!4561 (index!20464 lt!243252)))))

(assert (= (and d!80975 c!62296) b!528296))

(assert (= (and d!80975 (not c!62296)) b!528297))

(assert (= (and b!528297 c!62294) b!528293))

(assert (= (and b!528297 (not c!62294)) b!528294))

(assert (= (and b!528294 c!62295) b!528298))

(assert (= (and b!528294 (not c!62295)) b!528295))

(declare-fun m!508855 () Bool)

(assert (=> d!80975 m!508855))

(assert (=> d!80975 m!508623))

(declare-fun m!508857 () Bool)

(assert (=> d!80975 m!508857))

(assert (=> d!80975 m!508857))

(declare-fun m!508859 () Bool)

(assert (=> d!80975 m!508859))

(declare-fun m!508861 () Bool)

(assert (=> d!80975 m!508861))

(declare-fun m!508863 () Bool)

(assert (=> d!80975 m!508863))

(declare-fun m!508865 () Bool)

(assert (=> b!528295 m!508865))

(declare-fun m!508867 () Bool)

(assert (=> b!528297 m!508867))

(assert (=> b!527944 d!80975))

(declare-fun b!528299 () Bool)

(declare-fun e!307885 () SeekEntryResult!4561)

(assert (=> b!528299 (= e!307885 (Intermediate!4561 false lt!243102 #b00000000000000000000000000000000))))

(declare-fun b!528300 () Bool)

(declare-fun lt!243254 () SeekEntryResult!4561)

(assert (=> b!528300 (and (bvsge (index!20464 lt!243254) #b00000000000000000000000000000000) (bvslt (index!20464 lt!243254) (size!16458 lt!243106)))))

(declare-fun e!307882 () Bool)

(assert (=> b!528300 (= e!307882 (= (select (arr!16094 lt!243106) (index!20464 lt!243254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528301 () Bool)

(declare-fun e!307881 () SeekEntryResult!4561)

(assert (=> b!528301 (= e!307881 e!307885)))

(declare-fun c!62298 () Bool)

