; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47766 () Bool)

(assert start!47766)

(declare-fun b!525886 () Bool)

(declare-fun res!322595 () Bool)

(declare-fun e!306583 () Bool)

(assert (=> b!525886 (=> res!322595 e!306583)))

(declare-datatypes ((SeekEntryResult!4520 0))(
  ( (MissingZero!4520 (index!20292 (_ BitVec 32))) (Found!4520 (index!20293 (_ BitVec 32))) (Intermediate!4520 (undefined!5332 Bool) (index!20294 (_ BitVec 32)) (x!49269 (_ BitVec 32))) (Undefined!4520) (MissingVacant!4520 (index!20295 (_ BitVec 32))) )
))
(declare-fun lt!241723 () SeekEntryResult!4520)

(assert (=> b!525886 (= res!322595 (or (undefined!5332 lt!241723) (not (is-Intermediate!4520 lt!241723))))))

(declare-fun b!525887 () Bool)

(declare-fun res!322590 () Bool)

(declare-fun e!306586 () Bool)

(assert (=> b!525887 (=> (not res!322590) (not e!306586))))

(declare-datatypes ((array!33403 0))(
  ( (array!33404 (arr!16053 (Array (_ BitVec 32) (_ BitVec 64))) (size!16417 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33403)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525887 (= res!322590 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525888 () Bool)

(declare-fun res!322591 () Bool)

(assert (=> b!525888 (=> (not res!322591) (not e!306586))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525888 (= res!322591 (and (= (size!16417 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16417 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16417 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525889 () Bool)

(declare-fun res!322589 () Bool)

(declare-fun e!306585 () Bool)

(assert (=> b!525889 (=> (not res!322589) (not e!306585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33403 (_ BitVec 32)) Bool)

(assert (=> b!525889 (= res!322589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525890 () Bool)

(declare-fun res!322594 () Bool)

(assert (=> b!525890 (=> (not res!322594) (not e!306585))))

(declare-datatypes ((List!10211 0))(
  ( (Nil!10208) (Cons!10207 (h!11138 (_ BitVec 64)) (t!16439 List!10211)) )
))
(declare-fun arrayNoDuplicates!0 (array!33403 (_ BitVec 32) List!10211) Bool)

(assert (=> b!525890 (= res!322594 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10208))))

(declare-fun b!525891 () Bool)

(declare-datatypes ((Unit!16532 0))(
  ( (Unit!16533) )
))
(declare-fun e!306582 () Unit!16532)

(declare-fun Unit!16534 () Unit!16532)

(assert (=> b!525891 (= e!306582 Unit!16534)))

(declare-fun b!525892 () Bool)

(assert (=> b!525892 (= e!306583 true)))

(assert (=> b!525892 (= (index!20294 lt!241723) i!1204)))

(declare-fun lt!241716 () Unit!16532)

(declare-fun lt!241720 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16532)

(assert (=> b!525892 (= lt!241716 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241720 #b00000000000000000000000000000000 (index!20294 lt!241723) (x!49269 lt!241723) mask!3524))))

(assert (=> b!525892 (and (or (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241718 () Unit!16532)

(assert (=> b!525892 (= lt!241718 e!306582)))

(declare-fun c!61955 () Bool)

(assert (=> b!525892 (= c!61955 (= (select (arr!16053 a!3235) (index!20294 lt!241723)) (select (arr!16053 a!3235) j!176)))))

(assert (=> b!525892 (and (bvslt (x!49269 lt!241723) #b01111111111111111111111111111110) (or (= (select (arr!16053 a!3235) (index!20294 lt!241723)) (select (arr!16053 a!3235) j!176)) (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16053 a!3235) (index!20294 lt!241723)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525893 () Bool)

(declare-fun e!306588 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33403 (_ BitVec 32)) SeekEntryResult!4520)

(assert (=> b!525893 (= e!306588 (= (seekEntryOrOpen!0 (select (arr!16053 a!3235) j!176) a!3235 mask!3524) (Found!4520 j!176)))))

(declare-fun b!525894 () Bool)

(assert (=> b!525894 (= e!306585 (not e!306583))))

(declare-fun res!322588 () Bool)

(assert (=> b!525894 (=> res!322588 e!306583)))

(declare-fun lt!241719 () (_ BitVec 32))

(declare-fun lt!241721 () (_ BitVec 64))

(declare-fun lt!241717 () array!33403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33403 (_ BitVec 32)) SeekEntryResult!4520)

(assert (=> b!525894 (= res!322588 (= lt!241723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241719 lt!241721 lt!241717 mask!3524)))))

(assert (=> b!525894 (= lt!241723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241720 (select (arr!16053 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525894 (= lt!241719 (toIndex!0 lt!241721 mask!3524))))

(assert (=> b!525894 (= lt!241721 (select (store (arr!16053 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525894 (= lt!241720 (toIndex!0 (select (arr!16053 a!3235) j!176) mask!3524))))

(assert (=> b!525894 (= lt!241717 (array!33404 (store (arr!16053 a!3235) i!1204 k!2280) (size!16417 a!3235)))))

(assert (=> b!525894 e!306588))

(declare-fun res!322598 () Bool)

(assert (=> b!525894 (=> (not res!322598) (not e!306588))))

(assert (=> b!525894 (= res!322598 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241714 () Unit!16532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16532)

(assert (=> b!525894 (= lt!241714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525895 () Bool)

(declare-fun Unit!16535 () Unit!16532)

(assert (=> b!525895 (= e!306582 Unit!16535)))

(declare-fun lt!241715 () Unit!16532)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16532)

(assert (=> b!525895 (= lt!241715 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241720 #b00000000000000000000000000000000 (index!20294 lt!241723) (x!49269 lt!241723) mask!3524))))

(declare-fun res!322592 () Bool)

(assert (=> b!525895 (= res!322592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241720 lt!241721 lt!241717 mask!3524) (Intermediate!4520 false (index!20294 lt!241723) (x!49269 lt!241723))))))

(declare-fun e!306587 () Bool)

(assert (=> b!525895 (=> (not res!322592) (not e!306587))))

(assert (=> b!525895 e!306587))

(declare-fun res!322596 () Bool)

(assert (=> start!47766 (=> (not res!322596) (not e!306586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47766 (= res!322596 (validMask!0 mask!3524))))

(assert (=> start!47766 e!306586))

(assert (=> start!47766 true))

(declare-fun array_inv!11849 (array!33403) Bool)

(assert (=> start!47766 (array_inv!11849 a!3235)))

(declare-fun b!525896 () Bool)

(assert (=> b!525896 (= e!306587 false)))

(declare-fun b!525897 () Bool)

(declare-fun res!322597 () Bool)

(assert (=> b!525897 (=> (not res!322597) (not e!306586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525897 (= res!322597 (validKeyInArray!0 (select (arr!16053 a!3235) j!176)))))

(declare-fun b!525898 () Bool)

(declare-fun res!322593 () Bool)

(assert (=> b!525898 (=> (not res!322593) (not e!306586))))

(assert (=> b!525898 (= res!322593 (validKeyInArray!0 k!2280))))

(declare-fun b!525899 () Bool)

(assert (=> b!525899 (= e!306586 e!306585)))

(declare-fun res!322587 () Bool)

(assert (=> b!525899 (=> (not res!322587) (not e!306585))))

(declare-fun lt!241722 () SeekEntryResult!4520)

(assert (=> b!525899 (= res!322587 (or (= lt!241722 (MissingZero!4520 i!1204)) (= lt!241722 (MissingVacant!4520 i!1204))))))

(assert (=> b!525899 (= lt!241722 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47766 res!322596) b!525888))

(assert (= (and b!525888 res!322591) b!525897))

(assert (= (and b!525897 res!322597) b!525898))

(assert (= (and b!525898 res!322593) b!525887))

(assert (= (and b!525887 res!322590) b!525899))

(assert (= (and b!525899 res!322587) b!525889))

(assert (= (and b!525889 res!322589) b!525890))

(assert (= (and b!525890 res!322594) b!525894))

(assert (= (and b!525894 res!322598) b!525893))

(assert (= (and b!525894 (not res!322588)) b!525886))

(assert (= (and b!525886 (not res!322595)) b!525892))

(assert (= (and b!525892 c!61955) b!525895))

(assert (= (and b!525892 (not c!61955)) b!525891))

(assert (= (and b!525895 res!322592) b!525896))

(declare-fun m!506565 () Bool)

(assert (=> b!525898 m!506565))

(declare-fun m!506567 () Bool)

(assert (=> b!525893 m!506567))

(assert (=> b!525893 m!506567))

(declare-fun m!506569 () Bool)

(assert (=> b!525893 m!506569))

(declare-fun m!506571 () Bool)

(assert (=> b!525894 m!506571))

(declare-fun m!506573 () Bool)

(assert (=> b!525894 m!506573))

(declare-fun m!506575 () Bool)

(assert (=> b!525894 m!506575))

(assert (=> b!525894 m!506567))

(declare-fun m!506577 () Bool)

(assert (=> b!525894 m!506577))

(assert (=> b!525894 m!506567))

(declare-fun m!506579 () Bool)

(assert (=> b!525894 m!506579))

(assert (=> b!525894 m!506567))

(declare-fun m!506581 () Bool)

(assert (=> b!525894 m!506581))

(declare-fun m!506583 () Bool)

(assert (=> b!525894 m!506583))

(declare-fun m!506585 () Bool)

(assert (=> b!525894 m!506585))

(declare-fun m!506587 () Bool)

(assert (=> start!47766 m!506587))

(declare-fun m!506589 () Bool)

(assert (=> start!47766 m!506589))

(declare-fun m!506591 () Bool)

(assert (=> b!525899 m!506591))

(declare-fun m!506593 () Bool)

(assert (=> b!525890 m!506593))

(declare-fun m!506595 () Bool)

(assert (=> b!525892 m!506595))

(declare-fun m!506597 () Bool)

(assert (=> b!525892 m!506597))

(assert (=> b!525892 m!506567))

(declare-fun m!506599 () Bool)

(assert (=> b!525895 m!506599))

(declare-fun m!506601 () Bool)

(assert (=> b!525895 m!506601))

(declare-fun m!506603 () Bool)

(assert (=> b!525889 m!506603))

(assert (=> b!525897 m!506567))

(assert (=> b!525897 m!506567))

(declare-fun m!506605 () Bool)

(assert (=> b!525897 m!506605))

(declare-fun m!506607 () Bool)

(assert (=> b!525887 m!506607))

(push 1)

