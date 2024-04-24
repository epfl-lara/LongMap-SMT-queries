; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46688 () Bool)

(assert start!46688)

(declare-fun b!515319 () Bool)

(declare-fun e!300881 () Bool)

(assert (=> b!515319 (= e!300881 true)))

(declare-datatypes ((SeekEntryResult!4291 0))(
  ( (MissingZero!4291 (index!19352 (_ BitVec 32))) (Found!4291 (index!19353 (_ BitVec 32))) (Intermediate!4291 (undefined!5103 Bool) (index!19354 (_ BitVec 32)) (x!48467 (_ BitVec 32))) (Undefined!4291) (MissingVacant!4291 (index!19355 (_ BitVec 32))) )
))
(declare-fun lt!235950 () SeekEntryResult!4291)

(declare-datatypes ((array!33001 0))(
  ( (array!33002 (arr!15868 (Array (_ BitVec 32) (_ BitVec 64))) (size!16232 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33001)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515319 (and (bvslt (x!48467 lt!235950) #b01111111111111111111111111111110) (or (= (select (arr!15868 a!3235) (index!19354 lt!235950)) (select (arr!15868 a!3235) j!176)) (= (select (arr!15868 a!3235) (index!19354 lt!235950)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15868 a!3235) (index!19354 lt!235950)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515320 () Bool)

(declare-fun res!314946 () Bool)

(assert (=> b!515320 (=> res!314946 e!300881)))

(get-info :version)

(assert (=> b!515320 (= res!314946 (or (undefined!5103 lt!235950) (not ((_ is Intermediate!4291) lt!235950))))))

(declare-fun res!314938 () Bool)

(declare-fun e!300883 () Bool)

(assert (=> start!46688 (=> (not res!314938) (not e!300883))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46688 (= res!314938 (validMask!0 mask!3524))))

(assert (=> start!46688 e!300883))

(assert (=> start!46688 true))

(declare-fun array_inv!11727 (array!33001) Bool)

(assert (=> start!46688 (array_inv!11727 a!3235)))

(declare-fun b!515321 () Bool)

(declare-fun res!314944 () Bool)

(assert (=> b!515321 (=> (not res!314944) (not e!300883))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515321 (= res!314944 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515322 () Bool)

(declare-fun res!314943 () Bool)

(declare-fun e!300885 () Bool)

(assert (=> b!515322 (=> (not res!314943) (not e!300885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33001 (_ BitVec 32)) Bool)

(assert (=> b!515322 (= res!314943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!300882 () Bool)

(declare-fun b!515323 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33001 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!515323 (= e!300882 (= (seekEntryOrOpen!0 (select (arr!15868 a!3235) j!176) a!3235 mask!3524) (Found!4291 j!176)))))

(declare-fun b!515324 () Bool)

(assert (=> b!515324 (= e!300883 e!300885)))

(declare-fun res!314947 () Bool)

(assert (=> b!515324 (=> (not res!314947) (not e!300885))))

(declare-fun lt!235949 () SeekEntryResult!4291)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515324 (= res!314947 (or (= lt!235949 (MissingZero!4291 i!1204)) (= lt!235949 (MissingVacant!4291 i!1204))))))

(assert (=> b!515324 (= lt!235949 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515325 () Bool)

(declare-fun res!314940 () Bool)

(assert (=> b!515325 (=> (not res!314940) (not e!300883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515325 (= res!314940 (validKeyInArray!0 k0!2280))))

(declare-fun b!515326 () Bool)

(declare-fun res!314937 () Bool)

(assert (=> b!515326 (=> (not res!314937) (not e!300883))))

(assert (=> b!515326 (= res!314937 (and (= (size!16232 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16232 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16232 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515327 () Bool)

(assert (=> b!515327 (= e!300885 (not e!300881))))

(declare-fun res!314945 () Bool)

(assert (=> b!515327 (=> res!314945 e!300881)))

(declare-fun lt!235951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33001 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!515327 (= res!314945 (= lt!235950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235951 (select (store (arr!15868 a!3235) i!1204 k0!2280) j!176) (array!33002 (store (arr!15868 a!3235) i!1204 k0!2280) (size!16232 a!3235)) mask!3524)))))

(declare-fun lt!235948 () (_ BitVec 32))

(assert (=> b!515327 (= lt!235950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235948 (select (arr!15868 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515327 (= lt!235951 (toIndex!0 (select (store (arr!15868 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515327 (= lt!235948 (toIndex!0 (select (arr!15868 a!3235) j!176) mask!3524))))

(assert (=> b!515327 e!300882))

(declare-fun res!314942 () Bool)

(assert (=> b!515327 (=> (not res!314942) (not e!300882))))

(assert (=> b!515327 (= res!314942 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15901 0))(
  ( (Unit!15902) )
))
(declare-fun lt!235947 () Unit!15901)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15901)

(assert (=> b!515327 (= lt!235947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515328 () Bool)

(declare-fun res!314939 () Bool)

(assert (=> b!515328 (=> (not res!314939) (not e!300885))))

(declare-datatypes ((List!9933 0))(
  ( (Nil!9930) (Cons!9929 (h!10827 (_ BitVec 64)) (t!16153 List!9933)) )
))
(declare-fun arrayNoDuplicates!0 (array!33001 (_ BitVec 32) List!9933) Bool)

(assert (=> b!515328 (= res!314939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9930))))

(declare-fun b!515329 () Bool)

(declare-fun res!314941 () Bool)

(assert (=> b!515329 (=> (not res!314941) (not e!300883))))

(assert (=> b!515329 (= res!314941 (validKeyInArray!0 (select (arr!15868 a!3235) j!176)))))

(assert (= (and start!46688 res!314938) b!515326))

(assert (= (and b!515326 res!314937) b!515329))

(assert (= (and b!515329 res!314941) b!515325))

(assert (= (and b!515325 res!314940) b!515321))

(assert (= (and b!515321 res!314944) b!515324))

(assert (= (and b!515324 res!314947) b!515322))

(assert (= (and b!515322 res!314943) b!515328))

(assert (= (and b!515328 res!314939) b!515327))

(assert (= (and b!515327 res!314942) b!515323))

(assert (= (and b!515327 (not res!314945)) b!515320))

(assert (= (and b!515320 (not res!314946)) b!515319))

(declare-fun m!496891 () Bool)

(assert (=> b!515322 m!496891))

(declare-fun m!496893 () Bool)

(assert (=> b!515325 m!496893))

(declare-fun m!496895 () Bool)

(assert (=> b!515323 m!496895))

(assert (=> b!515323 m!496895))

(declare-fun m!496897 () Bool)

(assert (=> b!515323 m!496897))

(declare-fun m!496899 () Bool)

(assert (=> b!515321 m!496899))

(assert (=> b!515329 m!496895))

(assert (=> b!515329 m!496895))

(declare-fun m!496901 () Bool)

(assert (=> b!515329 m!496901))

(declare-fun m!496903 () Bool)

(assert (=> start!46688 m!496903))

(declare-fun m!496905 () Bool)

(assert (=> start!46688 m!496905))

(declare-fun m!496907 () Bool)

(assert (=> b!515319 m!496907))

(assert (=> b!515319 m!496895))

(declare-fun m!496909 () Bool)

(assert (=> b!515327 m!496909))

(declare-fun m!496911 () Bool)

(assert (=> b!515327 m!496911))

(assert (=> b!515327 m!496895))

(declare-fun m!496913 () Bool)

(assert (=> b!515327 m!496913))

(assert (=> b!515327 m!496895))

(assert (=> b!515327 m!496911))

(declare-fun m!496915 () Bool)

(assert (=> b!515327 m!496915))

(declare-fun m!496917 () Bool)

(assert (=> b!515327 m!496917))

(assert (=> b!515327 m!496895))

(declare-fun m!496919 () Bool)

(assert (=> b!515327 m!496919))

(declare-fun m!496921 () Bool)

(assert (=> b!515327 m!496921))

(assert (=> b!515327 m!496911))

(declare-fun m!496923 () Bool)

(assert (=> b!515327 m!496923))

(declare-fun m!496925 () Bool)

(assert (=> b!515328 m!496925))

(declare-fun m!496927 () Bool)

(assert (=> b!515324 m!496927))

(check-sat (not b!515327) (not b!515324) (not b!515322) (not b!515325) (not start!46688) (not b!515328) (not b!515321) (not b!515323) (not b!515329))
(check-sat)
