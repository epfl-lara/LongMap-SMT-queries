; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47762 () Bool)

(assert start!47762)

(declare-fun b!525951 () Bool)

(declare-fun e!306606 () Bool)

(assert (=> b!525951 (= e!306606 false)))

(declare-fun b!525952 () Bool)

(declare-fun e!306611 () Bool)

(declare-fun e!306612 () Bool)

(assert (=> b!525952 (= e!306611 (not e!306612))))

(declare-fun res!322698 () Bool)

(assert (=> b!525952 (=> res!322698 e!306612)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4474 0))(
  ( (MissingZero!4474 (index!20108 (_ BitVec 32))) (Found!4474 (index!20109 (_ BitVec 32))) (Intermediate!4474 (undefined!5286 Bool) (index!20110 (_ BitVec 32)) (x!49228 (_ BitVec 32))) (Undefined!4474) (MissingVacant!4474 (index!20111 (_ BitVec 32))) )
))
(declare-fun lt!241824 () SeekEntryResult!4474)

(declare-fun lt!241817 () (_ BitVec 64))

(declare-datatypes ((array!33400 0))(
  ( (array!33401 (arr!16051 (Array (_ BitVec 32) (_ BitVec 64))) (size!16415 (_ BitVec 32))) )
))
(declare-fun lt!241822 () array!33400)

(declare-fun lt!241820 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33400 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!525952 (= res!322698 (= lt!241824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241820 lt!241817 lt!241822 mask!3524)))))

(declare-fun lt!241818 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun a!3235 () array!33400)

(assert (=> b!525952 (= lt!241824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241818 (select (arr!16051 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525952 (= lt!241820 (toIndex!0 lt!241817 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525952 (= lt!241817 (select (store (arr!16051 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525952 (= lt!241818 (toIndex!0 (select (arr!16051 a!3235) j!176) mask!3524))))

(assert (=> b!525952 (= lt!241822 (array!33401 (store (arr!16051 a!3235) i!1204 k0!2280) (size!16415 a!3235)))))

(declare-fun e!306609 () Bool)

(assert (=> b!525952 e!306609))

(declare-fun res!322693 () Bool)

(assert (=> b!525952 (=> (not res!322693) (not e!306609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33400 (_ BitVec 32)) Bool)

(assert (=> b!525952 (= res!322693 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16507 0))(
  ( (Unit!16508) )
))
(declare-fun lt!241825 () Unit!16507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16507)

(assert (=> b!525952 (= lt!241825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525953 () Bool)

(declare-fun res!322692 () Bool)

(assert (=> b!525953 (=> (not res!322692) (not e!306611))))

(assert (=> b!525953 (= res!322692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525954 () Bool)

(declare-fun res!322695 () Bool)

(declare-fun e!306610 () Bool)

(assert (=> b!525954 (=> (not res!322695) (not e!306610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525954 (= res!322695 (validKeyInArray!0 (select (arr!16051 a!3235) j!176)))))

(declare-fun b!525955 () Bool)

(declare-fun res!322694 () Bool)

(assert (=> b!525955 (=> (not res!322694) (not e!306610))))

(assert (=> b!525955 (= res!322694 (validKeyInArray!0 k0!2280))))

(declare-fun b!525956 () Bool)

(declare-fun res!322689 () Bool)

(assert (=> b!525956 (=> res!322689 e!306612)))

(get-info :version)

(assert (=> b!525956 (= res!322689 (or (undefined!5286 lt!241824) (not ((_ is Intermediate!4474) lt!241824))))))

(declare-fun res!322690 () Bool)

(assert (=> start!47762 (=> (not res!322690) (not e!306610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47762 (= res!322690 (validMask!0 mask!3524))))

(assert (=> start!47762 e!306610))

(assert (=> start!47762 true))

(declare-fun array_inv!11910 (array!33400) Bool)

(assert (=> start!47762 (array_inv!11910 a!3235)))

(declare-fun b!525957 () Bool)

(declare-fun res!322691 () Bool)

(assert (=> b!525957 (=> (not res!322691) (not e!306611))))

(declare-datatypes ((List!10116 0))(
  ( (Nil!10113) (Cons!10112 (h!11043 (_ BitVec 64)) (t!16336 List!10116)) )
))
(declare-fun arrayNoDuplicates!0 (array!33400 (_ BitVec 32) List!10116) Bool)

(assert (=> b!525957 (= res!322691 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10113))))

(declare-fun b!525958 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33400 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!525958 (= e!306609 (= (seekEntryOrOpen!0 (select (arr!16051 a!3235) j!176) a!3235 mask!3524) (Found!4474 j!176)))))

(declare-fun b!525959 () Bool)

(declare-fun res!322699 () Bool)

(assert (=> b!525959 (=> (not res!322699) (not e!306610))))

(declare-fun arrayContainsKey!0 (array!33400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525959 (= res!322699 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525960 () Bool)

(assert (=> b!525960 (= e!306612 true)))

(assert (=> b!525960 (= (index!20110 lt!241824) i!1204)))

(declare-fun lt!241823 () Unit!16507)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16507)

(assert (=> b!525960 (= lt!241823 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241818 #b00000000000000000000000000000000 (index!20110 lt!241824) (x!49228 lt!241824) mask!3524))))

(assert (=> b!525960 (and (or (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241821 () Unit!16507)

(declare-fun e!306608 () Unit!16507)

(assert (=> b!525960 (= lt!241821 e!306608)))

(declare-fun c!61937 () Bool)

(assert (=> b!525960 (= c!61937 (= (select (arr!16051 a!3235) (index!20110 lt!241824)) (select (arr!16051 a!3235) j!176)))))

(assert (=> b!525960 (and (bvslt (x!49228 lt!241824) #b01111111111111111111111111111110) (or (= (select (arr!16051 a!3235) (index!20110 lt!241824)) (select (arr!16051 a!3235) j!176)) (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16051 a!3235) (index!20110 lt!241824)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525961 () Bool)

(assert (=> b!525961 (= e!306610 e!306611)))

(declare-fun res!322697 () Bool)

(assert (=> b!525961 (=> (not res!322697) (not e!306611))))

(declare-fun lt!241819 () SeekEntryResult!4474)

(assert (=> b!525961 (= res!322697 (or (= lt!241819 (MissingZero!4474 i!1204)) (= lt!241819 (MissingVacant!4474 i!1204))))))

(assert (=> b!525961 (= lt!241819 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525962 () Bool)

(declare-fun Unit!16509 () Unit!16507)

(assert (=> b!525962 (= e!306608 Unit!16509)))

(declare-fun lt!241816 () Unit!16507)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16507)

(assert (=> b!525962 (= lt!241816 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241818 #b00000000000000000000000000000000 (index!20110 lt!241824) (x!49228 lt!241824) mask!3524))))

(declare-fun res!322696 () Bool)

(assert (=> b!525962 (= res!322696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241818 lt!241817 lt!241822 mask!3524) (Intermediate!4474 false (index!20110 lt!241824) (x!49228 lt!241824))))))

(assert (=> b!525962 (=> (not res!322696) (not e!306606))))

(assert (=> b!525962 e!306606))

(declare-fun b!525963 () Bool)

(declare-fun res!322688 () Bool)

(assert (=> b!525963 (=> (not res!322688) (not e!306610))))

(assert (=> b!525963 (= res!322688 (and (= (size!16415 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16415 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16415 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525964 () Bool)

(declare-fun Unit!16510 () Unit!16507)

(assert (=> b!525964 (= e!306608 Unit!16510)))

(assert (= (and start!47762 res!322690) b!525963))

(assert (= (and b!525963 res!322688) b!525954))

(assert (= (and b!525954 res!322695) b!525955))

(assert (= (and b!525955 res!322694) b!525959))

(assert (= (and b!525959 res!322699) b!525961))

(assert (= (and b!525961 res!322697) b!525953))

(assert (= (and b!525953 res!322692) b!525957))

(assert (= (and b!525957 res!322691) b!525952))

(assert (= (and b!525952 res!322693) b!525958))

(assert (= (and b!525952 (not res!322698)) b!525956))

(assert (= (and b!525956 (not res!322689)) b!525960))

(assert (= (and b!525960 c!61937) b!525962))

(assert (= (and b!525960 (not c!61937)) b!525964))

(assert (= (and b!525962 res!322696) b!525951))

(declare-fun m!506881 () Bool)

(assert (=> b!525962 m!506881))

(declare-fun m!506883 () Bool)

(assert (=> b!525962 m!506883))

(declare-fun m!506885 () Bool)

(assert (=> b!525961 m!506885))

(declare-fun m!506887 () Bool)

(assert (=> b!525960 m!506887))

(declare-fun m!506889 () Bool)

(assert (=> b!525960 m!506889))

(declare-fun m!506891 () Bool)

(assert (=> b!525960 m!506891))

(assert (=> b!525954 m!506891))

(assert (=> b!525954 m!506891))

(declare-fun m!506893 () Bool)

(assert (=> b!525954 m!506893))

(assert (=> b!525958 m!506891))

(assert (=> b!525958 m!506891))

(declare-fun m!506895 () Bool)

(assert (=> b!525958 m!506895))

(declare-fun m!506897 () Bool)

(assert (=> b!525959 m!506897))

(declare-fun m!506899 () Bool)

(assert (=> start!47762 m!506899))

(declare-fun m!506901 () Bool)

(assert (=> start!47762 m!506901))

(declare-fun m!506903 () Bool)

(assert (=> b!525953 m!506903))

(declare-fun m!506905 () Bool)

(assert (=> b!525955 m!506905))

(declare-fun m!506907 () Bool)

(assert (=> b!525952 m!506907))

(declare-fun m!506909 () Bool)

(assert (=> b!525952 m!506909))

(declare-fun m!506911 () Bool)

(assert (=> b!525952 m!506911))

(assert (=> b!525952 m!506891))

(declare-fun m!506913 () Bool)

(assert (=> b!525952 m!506913))

(assert (=> b!525952 m!506891))

(declare-fun m!506915 () Bool)

(assert (=> b!525952 m!506915))

(declare-fun m!506917 () Bool)

(assert (=> b!525952 m!506917))

(assert (=> b!525952 m!506891))

(declare-fun m!506919 () Bool)

(assert (=> b!525952 m!506919))

(declare-fun m!506921 () Bool)

(assert (=> b!525952 m!506921))

(declare-fun m!506923 () Bool)

(assert (=> b!525957 m!506923))

(check-sat (not b!525961) (not b!525955) (not b!525959) (not b!525952) (not b!525953) (not b!525962) (not b!525954) (not b!525960) (not start!47762) (not b!525957) (not b!525958))
(check-sat)
