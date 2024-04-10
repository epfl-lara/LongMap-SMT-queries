; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46692 () Bool)

(assert start!46692)

(declare-fun b!515282 () Bool)

(declare-fun res!314851 () Bool)

(declare-fun e!300875 () Bool)

(assert (=> b!515282 (=> (not res!314851) (not e!300875))))

(declare-datatypes ((array!33004 0))(
  ( (array!33005 (arr!15870 (Array (_ BitVec 32) (_ BitVec 64))) (size!16234 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33004)

(declare-datatypes ((List!10028 0))(
  ( (Nil!10025) (Cons!10024 (h!10922 (_ BitVec 64)) (t!16256 List!10028)) )
))
(declare-fun arrayNoDuplicates!0 (array!33004 (_ BitVec 32) List!10028) Bool)

(assert (=> b!515282 (= res!314851 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10025))))

(declare-fun b!515283 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!300879 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4337 0))(
  ( (MissingZero!4337 (index!19536 (_ BitVec 32))) (Found!4337 (index!19537 (_ BitVec 32))) (Intermediate!4337 (undefined!5149 Bool) (index!19538 (_ BitVec 32)) (x!48508 (_ BitVec 32))) (Undefined!4337) (MissingVacant!4337 (index!19539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33004 (_ BitVec 32)) SeekEntryResult!4337)

(assert (=> b!515283 (= e!300879 (= (seekEntryOrOpen!0 (select (arr!15870 a!3235) j!176) a!3235 mask!3524) (Found!4337 j!176)))))

(declare-fun b!515284 () Bool)

(declare-fun e!300876 () Bool)

(assert (=> b!515284 (= e!300876 e!300875)))

(declare-fun res!314854 () Bool)

(assert (=> b!515284 (=> (not res!314854) (not e!300875))))

(declare-fun lt!235893 () SeekEntryResult!4337)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515284 (= res!314854 (or (= lt!235893 (MissingZero!4337 i!1204)) (= lt!235893 (MissingVacant!4337 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!515284 (= lt!235893 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515285 () Bool)

(declare-fun res!314855 () Bool)

(assert (=> b!515285 (=> (not res!314855) (not e!300876))))

(assert (=> b!515285 (= res!314855 (and (= (size!16234 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16234 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16234 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515286 () Bool)

(declare-fun res!314846 () Bool)

(assert (=> b!515286 (=> (not res!314846) (not e!300875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33004 (_ BitVec 32)) Bool)

(assert (=> b!515286 (= res!314846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515287 () Bool)

(declare-fun e!300878 () Bool)

(assert (=> b!515287 (= e!300878 true)))

(declare-fun lt!235891 () SeekEntryResult!4337)

(assert (=> b!515287 (and (bvslt (x!48508 lt!235891) #b01111111111111111111111111111110) (or (= (select (arr!15870 a!3235) (index!19538 lt!235891)) (select (arr!15870 a!3235) j!176)) (= (select (arr!15870 a!3235) (index!19538 lt!235891)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15870 a!3235) (index!19538 lt!235891)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515288 () Bool)

(declare-fun res!314848 () Bool)

(assert (=> b!515288 (=> (not res!314848) (not e!300876))))

(declare-fun arrayContainsKey!0 (array!33004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515288 (= res!314848 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515289 () Bool)

(declare-fun res!314849 () Bool)

(assert (=> b!515289 (=> res!314849 e!300878)))

(assert (=> b!515289 (= res!314849 (or (undefined!5149 lt!235891) (not (is-Intermediate!4337 lt!235891))))))

(declare-fun b!515281 () Bool)

(declare-fun res!314852 () Bool)

(assert (=> b!515281 (=> (not res!314852) (not e!300876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515281 (= res!314852 (validKeyInArray!0 k!2280))))

(declare-fun res!314850 () Bool)

(assert (=> start!46692 (=> (not res!314850) (not e!300876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46692 (= res!314850 (validMask!0 mask!3524))))

(assert (=> start!46692 e!300876))

(assert (=> start!46692 true))

(declare-fun array_inv!11666 (array!33004) Bool)

(assert (=> start!46692 (array_inv!11666 a!3235)))

(declare-fun b!515290 () Bool)

(declare-fun res!314853 () Bool)

(assert (=> b!515290 (=> (not res!314853) (not e!300876))))

(assert (=> b!515290 (= res!314853 (validKeyInArray!0 (select (arr!15870 a!3235) j!176)))))

(declare-fun b!515291 () Bool)

(assert (=> b!515291 (= e!300875 (not e!300878))))

(declare-fun res!314847 () Bool)

(assert (=> b!515291 (=> res!314847 e!300878)))

(declare-fun lt!235892 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33004 (_ BitVec 32)) SeekEntryResult!4337)

(assert (=> b!515291 (= res!314847 (= lt!235891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235892 (select (store (arr!15870 a!3235) i!1204 k!2280) j!176) (array!33005 (store (arr!15870 a!3235) i!1204 k!2280) (size!16234 a!3235)) mask!3524)))))

(declare-fun lt!235890 () (_ BitVec 32))

(assert (=> b!515291 (= lt!235891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235890 (select (arr!15870 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515291 (= lt!235892 (toIndex!0 (select (store (arr!15870 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515291 (= lt!235890 (toIndex!0 (select (arr!15870 a!3235) j!176) mask!3524))))

(assert (=> b!515291 e!300879))

(declare-fun res!314845 () Bool)

(assert (=> b!515291 (=> (not res!314845) (not e!300879))))

(assert (=> b!515291 (= res!314845 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15932 0))(
  ( (Unit!15933) )
))
(declare-fun lt!235894 () Unit!15932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15932)

(assert (=> b!515291 (= lt!235894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46692 res!314850) b!515285))

(assert (= (and b!515285 res!314855) b!515290))

(assert (= (and b!515290 res!314853) b!515281))

(assert (= (and b!515281 res!314852) b!515288))

(assert (= (and b!515288 res!314848) b!515284))

(assert (= (and b!515284 res!314854) b!515286))

(assert (= (and b!515286 res!314846) b!515282))

(assert (= (and b!515282 res!314851) b!515291))

(assert (= (and b!515291 res!314845) b!515283))

(assert (= (and b!515291 (not res!314847)) b!515289))

(assert (= (and b!515289 (not res!314849)) b!515287))

(declare-fun m!496593 () Bool)

(assert (=> b!515284 m!496593))

(declare-fun m!496595 () Bool)

(assert (=> b!515287 m!496595))

(declare-fun m!496597 () Bool)

(assert (=> b!515287 m!496597))

(declare-fun m!496599 () Bool)

(assert (=> b!515286 m!496599))

(declare-fun m!496601 () Bool)

(assert (=> start!46692 m!496601))

(declare-fun m!496603 () Bool)

(assert (=> start!46692 m!496603))

(assert (=> b!515290 m!496597))

(assert (=> b!515290 m!496597))

(declare-fun m!496605 () Bool)

(assert (=> b!515290 m!496605))

(declare-fun m!496607 () Bool)

(assert (=> b!515288 m!496607))

(declare-fun m!496609 () Bool)

(assert (=> b!515282 m!496609))

(declare-fun m!496611 () Bool)

(assert (=> b!515291 m!496611))

(declare-fun m!496613 () Bool)

(assert (=> b!515291 m!496613))

(declare-fun m!496615 () Bool)

(assert (=> b!515291 m!496615))

(assert (=> b!515291 m!496597))

(declare-fun m!496617 () Bool)

(assert (=> b!515291 m!496617))

(assert (=> b!515291 m!496597))

(declare-fun m!496619 () Bool)

(assert (=> b!515291 m!496619))

(declare-fun m!496621 () Bool)

(assert (=> b!515291 m!496621))

(assert (=> b!515291 m!496615))

(declare-fun m!496623 () Bool)

(assert (=> b!515291 m!496623))

(assert (=> b!515291 m!496615))

(declare-fun m!496625 () Bool)

(assert (=> b!515291 m!496625))

(assert (=> b!515291 m!496597))

(declare-fun m!496627 () Bool)

(assert (=> b!515281 m!496627))

(assert (=> b!515283 m!496597))

(assert (=> b!515283 m!496597))

(declare-fun m!496629 () Bool)

(assert (=> b!515283 m!496629))

(push 1)

