; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45444 () Bool)

(assert start!45444)

(declare-fun res!301962 () Bool)

(declare-fun e!292915 () Bool)

(assert (=> start!45444 (=> (not res!301962) (not e!292915))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45444 (= res!301962 (validMask!0 mask!3524))))

(assert (=> start!45444 e!292915))

(assert (=> start!45444 true))

(declare-datatypes ((array!32279 0))(
  ( (array!32280 (arr!15521 (Array (_ BitVec 32) (_ BitVec 64))) (size!15886 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32279)

(declare-fun array_inv!11404 (array!32279) Bool)

(assert (=> start!45444 (array_inv!11404 a!3235)))

(declare-fun b!499952 () Bool)

(declare-fun e!292913 () Bool)

(assert (=> b!499952 (= e!292915 e!292913)))

(declare-fun res!301955 () Bool)

(assert (=> b!499952 (=> (not res!301955) (not e!292913))))

(declare-datatypes ((SeekEntryResult!3985 0))(
  ( (MissingZero!3985 (index!18122 (_ BitVec 32))) (Found!3985 (index!18123 (_ BitVec 32))) (Intermediate!3985 (undefined!4797 Bool) (index!18124 (_ BitVec 32)) (x!47169 (_ BitVec 32))) (Undefined!3985) (MissingVacant!3985 (index!18125 (_ BitVec 32))) )
))
(declare-fun lt!226744 () SeekEntryResult!3985)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499952 (= res!301955 (or (= lt!226744 (MissingZero!3985 i!1204)) (= lt!226744 (MissingVacant!3985 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32279 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!499952 (= lt!226744 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499953 () Bool)

(declare-fun res!301958 () Bool)

(assert (=> b!499953 (=> (not res!301958) (not e!292913))))

(declare-datatypes ((List!9718 0))(
  ( (Nil!9715) (Cons!9714 (h!10588 (_ BitVec 64)) (t!15937 List!9718)) )
))
(declare-fun arrayNoDuplicates!0 (array!32279 (_ BitVec 32) List!9718) Bool)

(assert (=> b!499953 (= res!301958 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9715))))

(declare-fun b!499954 () Bool)

(declare-datatypes ((Unit!15010 0))(
  ( (Unit!15011) )
))
(declare-fun e!292917 () Unit!15010)

(declare-fun Unit!15012 () Unit!15010)

(assert (=> b!499954 (= e!292917 Unit!15012)))

(declare-fun b!499955 () Bool)

(declare-fun e!292918 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499955 (= e!292918 (= (seekEntryOrOpen!0 (select (arr!15521 a!3235) j!176) a!3235 mask!3524) (Found!3985 j!176)))))

(declare-fun b!499956 () Bool)

(declare-fun e!292916 () Bool)

(assert (=> b!499956 (= e!292916 false)))

(declare-fun b!499957 () Bool)

(declare-fun e!292919 () Bool)

(assert (=> b!499957 (= e!292919 true)))

(declare-fun lt!226742 () SeekEntryResult!3985)

(declare-fun lt!226740 () array!32279)

(declare-fun lt!226736 () (_ BitVec 32))

(declare-fun lt!226743 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32279 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!499957 (= lt!226742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226736 lt!226743 lt!226740 mask!3524))))

(declare-fun b!499958 () Bool)

(declare-fun res!301953 () Bool)

(assert (=> b!499958 (=> (not res!301953) (not e!292915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499958 (= res!301953 (validKeyInArray!0 (select (arr!15521 a!3235) j!176)))))

(declare-fun b!499959 () Bool)

(declare-fun e!292920 () Bool)

(assert (=> b!499959 (= e!292920 e!292919)))

(declare-fun res!301963 () Bool)

(assert (=> b!499959 (=> res!301963 e!292919)))

(declare-fun lt!226738 () SeekEntryResult!3985)

(assert (=> b!499959 (= res!301963 (or (bvsgt #b00000000000000000000000000000000 (x!47169 lt!226738)) (bvsgt (x!47169 lt!226738) #b01111111111111111111111111111110) (bvslt lt!226736 #b00000000000000000000000000000000) (bvsge lt!226736 (size!15886 a!3235)) (bvslt (index!18124 lt!226738) #b00000000000000000000000000000000) (bvsge (index!18124 lt!226738) (size!15886 a!3235)) (not (= lt!226738 (Intermediate!3985 false (index!18124 lt!226738) (x!47169 lt!226738))))))))

(assert (=> b!499959 (and (or (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226741 () Unit!15010)

(assert (=> b!499959 (= lt!226741 e!292917)))

(declare-fun c!59277 () Bool)

(assert (=> b!499959 (= c!59277 (= (select (arr!15521 a!3235) (index!18124 lt!226738)) (select (arr!15521 a!3235) j!176)))))

(assert (=> b!499959 (and (bvslt (x!47169 lt!226738) #b01111111111111111111111111111110) (or (= (select (arr!15521 a!3235) (index!18124 lt!226738)) (select (arr!15521 a!3235) j!176)) (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15521 a!3235) (index!18124 lt!226738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499960 () Bool)

(declare-fun res!301961 () Bool)

(assert (=> b!499960 (=> (not res!301961) (not e!292915))))

(declare-fun arrayContainsKey!0 (array!32279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499960 (= res!301961 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499961 () Bool)

(declare-fun res!301959 () Bool)

(assert (=> b!499961 (=> res!301959 e!292920)))

(get-info :version)

(assert (=> b!499961 (= res!301959 (or (undefined!4797 lt!226738) (not ((_ is Intermediate!3985) lt!226738))))))

(declare-fun b!499962 () Bool)

(declare-fun res!301954 () Bool)

(assert (=> b!499962 (=> (not res!301954) (not e!292913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32279 (_ BitVec 32)) Bool)

(assert (=> b!499962 (= res!301954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499963 () Bool)

(declare-fun Unit!15013 () Unit!15010)

(assert (=> b!499963 (= e!292917 Unit!15013)))

(declare-fun lt!226739 () Unit!15010)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15010)

(assert (=> b!499963 (= lt!226739 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226736 #b00000000000000000000000000000000 (index!18124 lt!226738) (x!47169 lt!226738) mask!3524))))

(declare-fun res!301956 () Bool)

(assert (=> b!499963 (= res!301956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226736 lt!226743 lt!226740 mask!3524) (Intermediate!3985 false (index!18124 lt!226738) (x!47169 lt!226738))))))

(assert (=> b!499963 (=> (not res!301956) (not e!292916))))

(assert (=> b!499963 e!292916))

(declare-fun b!499964 () Bool)

(assert (=> b!499964 (= e!292913 (not e!292920))))

(declare-fun res!301957 () Bool)

(assert (=> b!499964 (=> res!301957 e!292920)))

(declare-fun lt!226735 () (_ BitVec 32))

(assert (=> b!499964 (= res!301957 (= lt!226738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226735 lt!226743 lt!226740 mask!3524)))))

(assert (=> b!499964 (= lt!226738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226736 (select (arr!15521 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499964 (= lt!226735 (toIndex!0 lt!226743 mask!3524))))

(assert (=> b!499964 (= lt!226743 (select (store (arr!15521 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499964 (= lt!226736 (toIndex!0 (select (arr!15521 a!3235) j!176) mask!3524))))

(assert (=> b!499964 (= lt!226740 (array!32280 (store (arr!15521 a!3235) i!1204 k0!2280) (size!15886 a!3235)))))

(assert (=> b!499964 e!292918))

(declare-fun res!301960 () Bool)

(assert (=> b!499964 (=> (not res!301960) (not e!292918))))

(assert (=> b!499964 (= res!301960 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226737 () Unit!15010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15010)

(assert (=> b!499964 (= lt!226737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499965 () Bool)

(declare-fun res!301964 () Bool)

(assert (=> b!499965 (=> (not res!301964) (not e!292915))))

(assert (=> b!499965 (= res!301964 (and (= (size!15886 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15886 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15886 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499966 () Bool)

(declare-fun res!301952 () Bool)

(assert (=> b!499966 (=> (not res!301952) (not e!292915))))

(assert (=> b!499966 (= res!301952 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45444 res!301962) b!499965))

(assert (= (and b!499965 res!301964) b!499958))

(assert (= (and b!499958 res!301953) b!499966))

(assert (= (and b!499966 res!301952) b!499960))

(assert (= (and b!499960 res!301961) b!499952))

(assert (= (and b!499952 res!301955) b!499962))

(assert (= (and b!499962 res!301954) b!499953))

(assert (= (and b!499953 res!301958) b!499964))

(assert (= (and b!499964 res!301960) b!499955))

(assert (= (and b!499964 (not res!301957)) b!499961))

(assert (= (and b!499961 (not res!301959)) b!499959))

(assert (= (and b!499959 c!59277) b!499963))

(assert (= (and b!499959 (not c!59277)) b!499954))

(assert (= (and b!499963 res!301956) b!499956))

(assert (= (and b!499959 (not res!301963)) b!499957))

(declare-fun m!480619 () Bool)

(assert (=> b!499955 m!480619))

(assert (=> b!499955 m!480619))

(declare-fun m!480621 () Bool)

(assert (=> b!499955 m!480621))

(declare-fun m!480623 () Bool)

(assert (=> b!499960 m!480623))

(assert (=> b!499958 m!480619))

(assert (=> b!499958 m!480619))

(declare-fun m!480625 () Bool)

(assert (=> b!499958 m!480625))

(declare-fun m!480627 () Bool)

(assert (=> b!499964 m!480627))

(declare-fun m!480629 () Bool)

(assert (=> b!499964 m!480629))

(declare-fun m!480631 () Bool)

(assert (=> b!499964 m!480631))

(declare-fun m!480633 () Bool)

(assert (=> b!499964 m!480633))

(assert (=> b!499964 m!480619))

(declare-fun m!480635 () Bool)

(assert (=> b!499964 m!480635))

(assert (=> b!499964 m!480619))

(declare-fun m!480637 () Bool)

(assert (=> b!499964 m!480637))

(assert (=> b!499964 m!480619))

(declare-fun m!480639 () Bool)

(assert (=> b!499964 m!480639))

(declare-fun m!480641 () Bool)

(assert (=> b!499964 m!480641))

(declare-fun m!480643 () Bool)

(assert (=> b!499962 m!480643))

(declare-fun m!480645 () Bool)

(assert (=> b!499953 m!480645))

(declare-fun m!480647 () Bool)

(assert (=> b!499957 m!480647))

(declare-fun m!480649 () Bool)

(assert (=> b!499963 m!480649))

(assert (=> b!499963 m!480647))

(declare-fun m!480651 () Bool)

(assert (=> b!499959 m!480651))

(assert (=> b!499959 m!480619))

(declare-fun m!480653 () Bool)

(assert (=> b!499966 m!480653))

(declare-fun m!480655 () Bool)

(assert (=> start!45444 m!480655))

(declare-fun m!480657 () Bool)

(assert (=> start!45444 m!480657))

(declare-fun m!480659 () Bool)

(assert (=> b!499952 m!480659))

(check-sat (not b!499960) (not b!499952) (not b!499953) (not b!499966) (not b!499962) (not b!499964) (not start!45444) (not b!499955) (not b!499957) (not b!499963) (not b!499958))
(check-sat)
