; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47428 () Bool)

(assert start!47428)

(declare-fun b!521956 () Bool)

(declare-fun res!319687 () Bool)

(declare-fun e!304474 () Bool)

(assert (=> b!521956 (=> (not res!319687) (not e!304474))))

(declare-datatypes ((array!33254 0))(
  ( (array!33255 (arr!15983 (Array (_ BitVec 32) (_ BitVec 64))) (size!16347 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33254)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521956 (= res!319687 (validKeyInArray!0 (select (arr!15983 a!3235) j!176)))))

(declare-fun b!521957 () Bool)

(declare-fun e!304479 () Bool)

(assert (=> b!521957 (= e!304479 false)))

(declare-fun b!521958 () Bool)

(declare-fun e!304475 () Bool)

(assert (=> b!521958 (= e!304475 true)))

(declare-datatypes ((SeekEntryResult!4450 0))(
  ( (MissingZero!4450 (index!20003 (_ BitVec 32))) (Found!4450 (index!20004 (_ BitVec 32))) (Intermediate!4450 (undefined!5262 Bool) (index!20005 (_ BitVec 32)) (x!48980 (_ BitVec 32))) (Undefined!4450) (MissingVacant!4450 (index!20006 (_ BitVec 32))) )
))
(declare-fun lt!239299 () SeekEntryResult!4450)

(assert (=> b!521958 (and (or (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16252 0))(
  ( (Unit!16253) )
))
(declare-fun lt!239296 () Unit!16252)

(declare-fun e!304478 () Unit!16252)

(assert (=> b!521958 (= lt!239296 e!304478)))

(declare-fun c!61439 () Bool)

(assert (=> b!521958 (= c!61439 (= (select (arr!15983 a!3235) (index!20005 lt!239299)) (select (arr!15983 a!3235) j!176)))))

(assert (=> b!521958 (and (bvslt (x!48980 lt!239299) #b01111111111111111111111111111110) (or (= (select (arr!15983 a!3235) (index!20005 lt!239299)) (select (arr!15983 a!3235) j!176)) (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15983 a!3235) (index!20005 lt!239299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521959 () Bool)

(declare-fun Unit!16254 () Unit!16252)

(assert (=> b!521959 (= e!304478 Unit!16254)))

(declare-fun lt!239291 () Unit!16252)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239295 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16252)

(assert (=> b!521959 (= lt!239291 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239295 #b00000000000000000000000000000000 (index!20005 lt!239299) (x!48980 lt!239299) mask!3524))))

(declare-fun lt!239292 () (_ BitVec 64))

(declare-fun lt!239294 () array!33254)

(declare-fun res!319689 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33254 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!521959 (= res!319689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239295 lt!239292 lt!239294 mask!3524) (Intermediate!4450 false (index!20005 lt!239299) (x!48980 lt!239299))))))

(assert (=> b!521959 (=> (not res!319689) (not e!304479))))

(assert (=> b!521959 e!304479))

(declare-fun res!319684 () Bool)

(assert (=> start!47428 (=> (not res!319684) (not e!304474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47428 (= res!319684 (validMask!0 mask!3524))))

(assert (=> start!47428 e!304474))

(assert (=> start!47428 true))

(declare-fun array_inv!11779 (array!33254) Bool)

(assert (=> start!47428 (array_inv!11779 a!3235)))

(declare-fun b!521960 () Bool)

(declare-fun res!319685 () Bool)

(declare-fun e!304476 () Bool)

(assert (=> b!521960 (=> (not res!319685) (not e!304476))))

(declare-datatypes ((List!10141 0))(
  ( (Nil!10138) (Cons!10137 (h!11059 (_ BitVec 64)) (t!16369 List!10141)) )
))
(declare-fun arrayNoDuplicates!0 (array!33254 (_ BitVec 32) List!10141) Bool)

(assert (=> b!521960 (= res!319685 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10138))))

(declare-fun e!304477 () Bool)

(declare-fun b!521961 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33254 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!521961 (= e!304477 (= (seekEntryOrOpen!0 (select (arr!15983 a!3235) j!176) a!3235 mask!3524) (Found!4450 j!176)))))

(declare-fun b!521962 () Bool)

(declare-fun res!319680 () Bool)

(assert (=> b!521962 (=> (not res!319680) (not e!304474))))

(declare-fun arrayContainsKey!0 (array!33254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521962 (= res!319680 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521963 () Bool)

(assert (=> b!521963 (= e!304476 (not e!304475))))

(declare-fun res!319688 () Bool)

(assert (=> b!521963 (=> res!319688 e!304475)))

(declare-fun lt!239297 () (_ BitVec 32))

(assert (=> b!521963 (= res!319688 (= lt!239299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239297 lt!239292 lt!239294 mask!3524)))))

(assert (=> b!521963 (= lt!239299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239295 (select (arr!15983 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521963 (= lt!239297 (toIndex!0 lt!239292 mask!3524))))

(assert (=> b!521963 (= lt!239292 (select (store (arr!15983 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521963 (= lt!239295 (toIndex!0 (select (arr!15983 a!3235) j!176) mask!3524))))

(assert (=> b!521963 (= lt!239294 (array!33255 (store (arr!15983 a!3235) i!1204 k!2280) (size!16347 a!3235)))))

(assert (=> b!521963 e!304477))

(declare-fun res!319691 () Bool)

(assert (=> b!521963 (=> (not res!319691) (not e!304477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33254 (_ BitVec 32)) Bool)

(assert (=> b!521963 (= res!319691 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239293 () Unit!16252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16252)

(assert (=> b!521963 (= lt!239293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521964 () Bool)

(declare-fun res!319682 () Bool)

(assert (=> b!521964 (=> (not res!319682) (not e!304474))))

(assert (=> b!521964 (= res!319682 (and (= (size!16347 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16347 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16347 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521965 () Bool)

(declare-fun Unit!16255 () Unit!16252)

(assert (=> b!521965 (= e!304478 Unit!16255)))

(declare-fun b!521966 () Bool)

(assert (=> b!521966 (= e!304474 e!304476)))

(declare-fun res!319686 () Bool)

(assert (=> b!521966 (=> (not res!319686) (not e!304476))))

(declare-fun lt!239298 () SeekEntryResult!4450)

(assert (=> b!521966 (= res!319686 (or (= lt!239298 (MissingZero!4450 i!1204)) (= lt!239298 (MissingVacant!4450 i!1204))))))

(assert (=> b!521966 (= lt!239298 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521967 () Bool)

(declare-fun res!319683 () Bool)

(assert (=> b!521967 (=> (not res!319683) (not e!304474))))

(assert (=> b!521967 (= res!319683 (validKeyInArray!0 k!2280))))

(declare-fun b!521968 () Bool)

(declare-fun res!319690 () Bool)

(assert (=> b!521968 (=> res!319690 e!304475)))

(assert (=> b!521968 (= res!319690 (or (undefined!5262 lt!239299) (not (is-Intermediate!4450 lt!239299))))))

(declare-fun b!521969 () Bool)

(declare-fun res!319681 () Bool)

(assert (=> b!521969 (=> (not res!319681) (not e!304476))))

(assert (=> b!521969 (= res!319681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47428 res!319684) b!521964))

(assert (= (and b!521964 res!319682) b!521956))

(assert (= (and b!521956 res!319687) b!521967))

(assert (= (and b!521967 res!319683) b!521962))

(assert (= (and b!521962 res!319680) b!521966))

(assert (= (and b!521966 res!319686) b!521969))

(assert (= (and b!521969 res!319681) b!521960))

(assert (= (and b!521960 res!319685) b!521963))

(assert (= (and b!521963 res!319691) b!521961))

(assert (= (and b!521963 (not res!319688)) b!521968))

(assert (= (and b!521968 (not res!319690)) b!521958))

(assert (= (and b!521958 c!61439) b!521959))

(assert (= (and b!521958 (not c!61439)) b!521965))

(assert (= (and b!521959 res!319689) b!521957))

(declare-fun m!502869 () Bool)

(assert (=> b!521956 m!502869))

(assert (=> b!521956 m!502869))

(declare-fun m!502871 () Bool)

(assert (=> b!521956 m!502871))

(declare-fun m!502873 () Bool)

(assert (=> b!521967 m!502873))

(assert (=> b!521963 m!502869))

(declare-fun m!502875 () Bool)

(assert (=> b!521963 m!502875))

(declare-fun m!502877 () Bool)

(assert (=> b!521963 m!502877))

(declare-fun m!502879 () Bool)

(assert (=> b!521963 m!502879))

(declare-fun m!502881 () Bool)

(assert (=> b!521963 m!502881))

(assert (=> b!521963 m!502869))

(declare-fun m!502883 () Bool)

(assert (=> b!521963 m!502883))

(assert (=> b!521963 m!502869))

(declare-fun m!502885 () Bool)

(assert (=> b!521963 m!502885))

(declare-fun m!502887 () Bool)

(assert (=> b!521963 m!502887))

(declare-fun m!502889 () Bool)

(assert (=> b!521963 m!502889))

(declare-fun m!502891 () Bool)

(assert (=> start!47428 m!502891))

(declare-fun m!502893 () Bool)

(assert (=> start!47428 m!502893))

(declare-fun m!502895 () Bool)

(assert (=> b!521958 m!502895))

(assert (=> b!521958 m!502869))

(declare-fun m!502897 () Bool)

(assert (=> b!521959 m!502897))

(declare-fun m!502899 () Bool)

(assert (=> b!521959 m!502899))

(declare-fun m!502901 () Bool)

(assert (=> b!521962 m!502901))

(declare-fun m!502903 () Bool)

(assert (=> b!521966 m!502903))

(declare-fun m!502905 () Bool)

(assert (=> b!521969 m!502905))

(declare-fun m!502907 () Bool)

(assert (=> b!521960 m!502907))

(assert (=> b!521961 m!502869))

(assert (=> b!521961 m!502869))

(declare-fun m!502909 () Bool)

(assert (=> b!521961 m!502909))

(push 1)

