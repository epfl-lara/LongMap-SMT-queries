; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46724 () Bool)

(assert start!46724)

(declare-fun b!515913 () Bool)

(declare-fun res!315536 () Bool)

(declare-fun e!301152 () Bool)

(assert (=> b!515913 (=> (not res!315536) (not e!301152))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33037 0))(
  ( (array!33038 (arr!15886 (Array (_ BitVec 32) (_ BitVec 64))) (size!16250 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33037)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515913 (= res!315536 (and (= (size!16250 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16250 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16250 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515914 () Bool)

(declare-fun e!301151 () Bool)

(assert (=> b!515914 (= e!301151 true)))

(declare-datatypes ((SeekEntryResult!4309 0))(
  ( (MissingZero!4309 (index!19424 (_ BitVec 32))) (Found!4309 (index!19425 (_ BitVec 32))) (Intermediate!4309 (undefined!5121 Bool) (index!19426 (_ BitVec 32)) (x!48533 (_ BitVec 32))) (Undefined!4309) (MissingVacant!4309 (index!19427 (_ BitVec 32))) )
))
(declare-fun lt!236218 () SeekEntryResult!4309)

(assert (=> b!515914 (and (bvslt (x!48533 lt!236218) #b01111111111111111111111111111110) (or (= (select (arr!15886 a!3235) (index!19426 lt!236218)) (select (arr!15886 a!3235) j!176)) (= (select (arr!15886 a!3235) (index!19426 lt!236218)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15886 a!3235) (index!19426 lt!236218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!315533 () Bool)

(assert (=> start!46724 (=> (not res!315533) (not e!301152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46724 (= res!315533 (validMask!0 mask!3524))))

(assert (=> start!46724 e!301152))

(assert (=> start!46724 true))

(declare-fun array_inv!11745 (array!33037) Bool)

(assert (=> start!46724 (array_inv!11745 a!3235)))

(declare-fun b!515915 () Bool)

(declare-fun e!301154 () Bool)

(assert (=> b!515915 (= e!301154 (not e!301151))))

(declare-fun res!315534 () Bool)

(assert (=> b!515915 (=> res!315534 e!301151)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!236220 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33037 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!515915 (= res!315534 (= lt!236218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236220 (select (store (arr!15886 a!3235) i!1204 k0!2280) j!176) (array!33038 (store (arr!15886 a!3235) i!1204 k0!2280) (size!16250 a!3235)) mask!3524)))))

(declare-fun lt!236221 () (_ BitVec 32))

(assert (=> b!515915 (= lt!236218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236221 (select (arr!15886 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515915 (= lt!236220 (toIndex!0 (select (store (arr!15886 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515915 (= lt!236221 (toIndex!0 (select (arr!15886 a!3235) j!176) mask!3524))))

(declare-fun e!301155 () Bool)

(assert (=> b!515915 e!301155))

(declare-fun res!315539 () Bool)

(assert (=> b!515915 (=> (not res!315539) (not e!301155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33037 (_ BitVec 32)) Bool)

(assert (=> b!515915 (= res!315539 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15937 0))(
  ( (Unit!15938) )
))
(declare-fun lt!236219 () Unit!15937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15937)

(assert (=> b!515915 (= lt!236219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515916 () Bool)

(declare-fun res!315537 () Bool)

(assert (=> b!515916 (=> res!315537 e!301151)))

(get-info :version)

(assert (=> b!515916 (= res!315537 (or (undefined!5121 lt!236218) (not ((_ is Intermediate!4309) lt!236218))))))

(declare-fun b!515917 () Bool)

(declare-fun res!315540 () Bool)

(assert (=> b!515917 (=> (not res!315540) (not e!301154))))

(declare-datatypes ((List!9951 0))(
  ( (Nil!9948) (Cons!9947 (h!10845 (_ BitVec 64)) (t!16171 List!9951)) )
))
(declare-fun arrayNoDuplicates!0 (array!33037 (_ BitVec 32) List!9951) Bool)

(assert (=> b!515917 (= res!315540 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9948))))

(declare-fun b!515918 () Bool)

(declare-fun res!315532 () Bool)

(assert (=> b!515918 (=> (not res!315532) (not e!301154))))

(assert (=> b!515918 (= res!315532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515919 () Bool)

(declare-fun res!315535 () Bool)

(assert (=> b!515919 (=> (not res!315535) (not e!301152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515919 (= res!315535 (validKeyInArray!0 (select (arr!15886 a!3235) j!176)))))

(declare-fun b!515920 () Bool)

(declare-fun res!315541 () Bool)

(assert (=> b!515920 (=> (not res!315541) (not e!301152))))

(assert (=> b!515920 (= res!315541 (validKeyInArray!0 k0!2280))))

(declare-fun b!515921 () Bool)

(declare-fun res!315531 () Bool)

(assert (=> b!515921 (=> (not res!315531) (not e!301152))))

(declare-fun arrayContainsKey!0 (array!33037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515921 (= res!315531 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515922 () Bool)

(assert (=> b!515922 (= e!301152 e!301154)))

(declare-fun res!315538 () Bool)

(assert (=> b!515922 (=> (not res!315538) (not e!301154))))

(declare-fun lt!236217 () SeekEntryResult!4309)

(assert (=> b!515922 (= res!315538 (or (= lt!236217 (MissingZero!4309 i!1204)) (= lt!236217 (MissingVacant!4309 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33037 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!515922 (= lt!236217 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515923 () Bool)

(assert (=> b!515923 (= e!301155 (= (seekEntryOrOpen!0 (select (arr!15886 a!3235) j!176) a!3235 mask!3524) (Found!4309 j!176)))))

(assert (= (and start!46724 res!315533) b!515913))

(assert (= (and b!515913 res!315536) b!515919))

(assert (= (and b!515919 res!315535) b!515920))

(assert (= (and b!515920 res!315541) b!515921))

(assert (= (and b!515921 res!315531) b!515922))

(assert (= (and b!515922 res!315538) b!515918))

(assert (= (and b!515918 res!315532) b!515917))

(assert (= (and b!515917 res!315540) b!515915))

(assert (= (and b!515915 res!315539) b!515923))

(assert (= (and b!515915 (not res!315534)) b!515916))

(assert (= (and b!515916 (not res!315537)) b!515914))

(declare-fun m!497575 () Bool)

(assert (=> b!515920 m!497575))

(declare-fun m!497577 () Bool)

(assert (=> b!515922 m!497577))

(declare-fun m!497579 () Bool)

(assert (=> start!46724 m!497579))

(declare-fun m!497581 () Bool)

(assert (=> start!46724 m!497581))

(declare-fun m!497583 () Bool)

(assert (=> b!515914 m!497583))

(declare-fun m!497585 () Bool)

(assert (=> b!515914 m!497585))

(assert (=> b!515919 m!497585))

(assert (=> b!515919 m!497585))

(declare-fun m!497587 () Bool)

(assert (=> b!515919 m!497587))

(declare-fun m!497589 () Bool)

(assert (=> b!515917 m!497589))

(declare-fun m!497591 () Bool)

(assert (=> b!515921 m!497591))

(declare-fun m!497593 () Bool)

(assert (=> b!515915 m!497593))

(declare-fun m!497595 () Bool)

(assert (=> b!515915 m!497595))

(declare-fun m!497597 () Bool)

(assert (=> b!515915 m!497597))

(assert (=> b!515915 m!497585))

(declare-fun m!497599 () Bool)

(assert (=> b!515915 m!497599))

(assert (=> b!515915 m!497585))

(declare-fun m!497601 () Bool)

(assert (=> b!515915 m!497601))

(assert (=> b!515915 m!497585))

(declare-fun m!497603 () Bool)

(assert (=> b!515915 m!497603))

(assert (=> b!515915 m!497597))

(declare-fun m!497605 () Bool)

(assert (=> b!515915 m!497605))

(assert (=> b!515915 m!497597))

(declare-fun m!497607 () Bool)

(assert (=> b!515915 m!497607))

(assert (=> b!515923 m!497585))

(assert (=> b!515923 m!497585))

(declare-fun m!497609 () Bool)

(assert (=> b!515923 m!497609))

(declare-fun m!497611 () Bool)

(assert (=> b!515918 m!497611))

(check-sat (not b!515921) (not b!515917) (not b!515915) (not b!515922) (not b!515923) (not b!515918) (not b!515920) (not b!515919) (not start!46724))
(check-sat)
