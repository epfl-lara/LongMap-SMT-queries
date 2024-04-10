; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47720 () Bool)

(assert start!47720)

(declare-fun b!524921 () Bool)

(declare-fun e!306105 () Bool)

(declare-fun e!306103 () Bool)

(assert (=> b!524921 (= e!306105 e!306103)))

(declare-fun res!321762 () Bool)

(assert (=> b!524921 (=> (not res!321762) (not e!306103))))

(declare-datatypes ((SeekEntryResult!4497 0))(
  ( (MissingZero!4497 (index!20200 (_ BitVec 32))) (Found!4497 (index!20201 (_ BitVec 32))) (Intermediate!4497 (undefined!5309 Bool) (index!20202 (_ BitVec 32)) (x!49182 (_ BitVec 32))) (Undefined!4497) (MissingVacant!4497 (index!20203 (_ BitVec 32))) )
))
(declare-fun lt!241032 () SeekEntryResult!4497)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524921 (= res!321762 (or (= lt!241032 (MissingZero!4497 i!1204)) (= lt!241032 (MissingVacant!4497 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33357 0))(
  ( (array!33358 (arr!16030 (Array (_ BitVec 32) (_ BitVec 64))) (size!16394 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33357)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33357 (_ BitVec 32)) SeekEntryResult!4497)

(assert (=> b!524921 (= lt!241032 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524922 () Bool)

(declare-fun res!321769 () Bool)

(assert (=> b!524922 (=> (not res!321769) (not e!306105))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524922 (= res!321769 (and (= (size!16394 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16394 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16394 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524923 () Bool)

(declare-fun e!306099 () Bool)

(assert (=> b!524923 (= e!306103 (not e!306099))))

(declare-fun res!321760 () Bool)

(assert (=> b!524923 (=> res!321760 e!306099)))

(declare-fun lt!241031 () (_ BitVec 64))

(declare-fun lt!241024 () (_ BitVec 32))

(declare-fun lt!241030 () SeekEntryResult!4497)

(declare-fun lt!241029 () array!33357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33357 (_ BitVec 32)) SeekEntryResult!4497)

(assert (=> b!524923 (= res!321760 (= lt!241030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241024 lt!241031 lt!241029 mask!3524)))))

(declare-fun lt!241027 () (_ BitVec 32))

(assert (=> b!524923 (= lt!241030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241027 (select (arr!16030 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524923 (= lt!241024 (toIndex!0 lt!241031 mask!3524))))

(assert (=> b!524923 (= lt!241031 (select (store (arr!16030 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524923 (= lt!241027 (toIndex!0 (select (arr!16030 a!3235) j!176) mask!3524))))

(assert (=> b!524923 (= lt!241029 (array!33358 (store (arr!16030 a!3235) i!1204 k0!2280) (size!16394 a!3235)))))

(declare-fun e!306100 () Bool)

(assert (=> b!524923 e!306100))

(declare-fun res!321761 () Bool)

(assert (=> b!524923 (=> (not res!321761) (not e!306100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33357 (_ BitVec 32)) Bool)

(assert (=> b!524923 (= res!321761 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16440 0))(
  ( (Unit!16441) )
))
(declare-fun lt!241026 () Unit!16440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16440)

(assert (=> b!524923 (= lt!241026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524924 () Bool)

(declare-fun e!306104 () Unit!16440)

(declare-fun Unit!16442 () Unit!16440)

(assert (=> b!524924 (= e!306104 Unit!16442)))

(declare-fun lt!241028 () Unit!16440)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16440)

(assert (=> b!524924 (= lt!241028 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241027 #b00000000000000000000000000000000 (index!20202 lt!241030) (x!49182 lt!241030) mask!3524))))

(declare-fun res!321767 () Bool)

(assert (=> b!524924 (= res!321767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241027 lt!241031 lt!241029 mask!3524) (Intermediate!4497 false (index!20202 lt!241030) (x!49182 lt!241030))))))

(declare-fun e!306101 () Bool)

(assert (=> b!524924 (=> (not res!321767) (not e!306101))))

(assert (=> b!524924 e!306101))

(declare-fun b!524925 () Bool)

(declare-fun res!321766 () Bool)

(assert (=> b!524925 (=> (not res!321766) (not e!306105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524925 (= res!321766 (validKeyInArray!0 (select (arr!16030 a!3235) j!176)))))

(declare-fun b!524926 () Bool)

(declare-fun res!321765 () Bool)

(assert (=> b!524926 (=> (not res!321765) (not e!306103))))

(assert (=> b!524926 (= res!321765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524927 () Bool)

(assert (=> b!524927 (= e!306100 (= (seekEntryOrOpen!0 (select (arr!16030 a!3235) j!176) a!3235 mask!3524) (Found!4497 j!176)))))

(declare-fun b!524928 () Bool)

(declare-fun res!321764 () Bool)

(assert (=> b!524928 (=> (not res!321764) (not e!306105))))

(declare-fun arrayContainsKey!0 (array!33357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524928 (= res!321764 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524929 () Bool)

(declare-fun Unit!16443 () Unit!16440)

(assert (=> b!524929 (= e!306104 Unit!16443)))

(declare-fun b!524930 () Bool)

(declare-fun res!321759 () Bool)

(assert (=> b!524930 (=> (not res!321759) (not e!306103))))

(declare-datatypes ((List!10188 0))(
  ( (Nil!10185) (Cons!10184 (h!11115 (_ BitVec 64)) (t!16416 List!10188)) )
))
(declare-fun arrayNoDuplicates!0 (array!33357 (_ BitVec 32) List!10188) Bool)

(assert (=> b!524930 (= res!321759 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10185))))

(declare-fun b!524931 () Bool)

(declare-fun res!321763 () Bool)

(assert (=> b!524931 (=> (not res!321763) (not e!306105))))

(assert (=> b!524931 (= res!321763 (validKeyInArray!0 k0!2280))))

(declare-fun b!524920 () Bool)

(assert (=> b!524920 (= e!306099 true)))

(assert (=> b!524920 (= (index!20202 lt!241030) i!1204)))

(declare-fun lt!241025 () Unit!16440)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16440)

(assert (=> b!524920 (= lt!241025 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241027 #b00000000000000000000000000000000 (index!20202 lt!241030) (x!49182 lt!241030) mask!3524))))

(assert (=> b!524920 (and (or (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241033 () Unit!16440)

(assert (=> b!524920 (= lt!241033 e!306104)))

(declare-fun c!61886 () Bool)

(assert (=> b!524920 (= c!61886 (= (select (arr!16030 a!3235) (index!20202 lt!241030)) (select (arr!16030 a!3235) j!176)))))

(assert (=> b!524920 (and (bvslt (x!49182 lt!241030) #b01111111111111111111111111111110) (or (= (select (arr!16030 a!3235) (index!20202 lt!241030)) (select (arr!16030 a!3235) j!176)) (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16030 a!3235) (index!20202 lt!241030)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!321770 () Bool)

(assert (=> start!47720 (=> (not res!321770) (not e!306105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47720 (= res!321770 (validMask!0 mask!3524))))

(assert (=> start!47720 e!306105))

(assert (=> start!47720 true))

(declare-fun array_inv!11826 (array!33357) Bool)

(assert (=> start!47720 (array_inv!11826 a!3235)))

(declare-fun b!524932 () Bool)

(declare-fun res!321768 () Bool)

(assert (=> b!524932 (=> res!321768 e!306099)))

(get-info :version)

(assert (=> b!524932 (= res!321768 (or (undefined!5309 lt!241030) (not ((_ is Intermediate!4497) lt!241030))))))

(declare-fun b!524933 () Bool)

(assert (=> b!524933 (= e!306101 false)))

(assert (= (and start!47720 res!321770) b!524922))

(assert (= (and b!524922 res!321769) b!524925))

(assert (= (and b!524925 res!321766) b!524931))

(assert (= (and b!524931 res!321763) b!524928))

(assert (= (and b!524928 res!321764) b!524921))

(assert (= (and b!524921 res!321762) b!524926))

(assert (= (and b!524926 res!321765) b!524930))

(assert (= (and b!524930 res!321759) b!524923))

(assert (= (and b!524923 res!321761) b!524927))

(assert (= (and b!524923 (not res!321760)) b!524932))

(assert (= (and b!524932 (not res!321768)) b!524920))

(assert (= (and b!524920 c!61886) b!524924))

(assert (= (and b!524920 (not c!61886)) b!524929))

(assert (= (and b!524924 res!321767) b!524933))

(declare-fun m!505553 () Bool)

(assert (=> b!524928 m!505553))

(declare-fun m!505555 () Bool)

(assert (=> start!47720 m!505555))

(declare-fun m!505557 () Bool)

(assert (=> start!47720 m!505557))

(declare-fun m!505559 () Bool)

(assert (=> b!524931 m!505559))

(declare-fun m!505561 () Bool)

(assert (=> b!524924 m!505561))

(declare-fun m!505563 () Bool)

(assert (=> b!524924 m!505563))

(declare-fun m!505565 () Bool)

(assert (=> b!524927 m!505565))

(assert (=> b!524927 m!505565))

(declare-fun m!505567 () Bool)

(assert (=> b!524927 m!505567))

(declare-fun m!505569 () Bool)

(assert (=> b!524930 m!505569))

(declare-fun m!505571 () Bool)

(assert (=> b!524920 m!505571))

(declare-fun m!505573 () Bool)

(assert (=> b!524920 m!505573))

(assert (=> b!524920 m!505565))

(declare-fun m!505575 () Bool)

(assert (=> b!524926 m!505575))

(declare-fun m!505577 () Bool)

(assert (=> b!524921 m!505577))

(assert (=> b!524925 m!505565))

(assert (=> b!524925 m!505565))

(declare-fun m!505579 () Bool)

(assert (=> b!524925 m!505579))

(declare-fun m!505581 () Bool)

(assert (=> b!524923 m!505581))

(declare-fun m!505583 () Bool)

(assert (=> b!524923 m!505583))

(assert (=> b!524923 m!505565))

(declare-fun m!505585 () Bool)

(assert (=> b!524923 m!505585))

(declare-fun m!505587 () Bool)

(assert (=> b!524923 m!505587))

(declare-fun m!505589 () Bool)

(assert (=> b!524923 m!505589))

(declare-fun m!505591 () Bool)

(assert (=> b!524923 m!505591))

(assert (=> b!524923 m!505565))

(declare-fun m!505593 () Bool)

(assert (=> b!524923 m!505593))

(assert (=> b!524923 m!505565))

(declare-fun m!505595 () Bool)

(assert (=> b!524923 m!505595))

(check-sat (not start!47720) (not b!524926) (not b!524924) (not b!524931) (not b!524925) (not b!524920) (not b!524928) (not b!524921) (not b!524930) (not b!524927) (not b!524923))
(check-sat)
