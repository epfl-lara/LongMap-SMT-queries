; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68536 () Bool)

(assert start!68536)

(declare-fun b!797057 () Bool)

(declare-fun res!541578 () Bool)

(declare-fun e!442224 () Bool)

(assert (=> b!797057 (=> (not res!541578) (not e!442224))))

(declare-datatypes ((array!43326 0))(
  ( (array!43327 (arr!20743 (Array (_ BitVec 32) (_ BitVec 64))) (size!21164 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43326)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797057 (= res!541578 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797058 () Bool)

(declare-fun e!442222 () Bool)

(declare-fun e!442223 () Bool)

(assert (=> b!797058 (= e!442222 e!442223)))

(declare-fun res!541583 () Bool)

(assert (=> b!797058 (=> (not res!541583) (not e!442223))))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8334 0))(
  ( (MissingZero!8334 (index!35704 (_ BitVec 32))) (Found!8334 (index!35705 (_ BitVec 32))) (Intermediate!8334 (undefined!9146 Bool) (index!35706 (_ BitVec 32)) (x!66604 (_ BitVec 32))) (Undefined!8334) (MissingVacant!8334 (index!35707 (_ BitVec 32))) )
))
(declare-fun lt!355520 () SeekEntryResult!8334)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355522 () SeekEntryResult!8334)

(assert (=> b!797058 (= res!541583 (and (= lt!355522 lt!355520) (= lt!355520 (Found!8334 j!153)) (= (select (arr!20743 a!3170) index!1236) (select (arr!20743 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43326 (_ BitVec 32)) SeekEntryResult!8334)

(assert (=> b!797058 (= lt!355520 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20743 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43326 (_ BitVec 32)) SeekEntryResult!8334)

(assert (=> b!797058 (= lt!355522 (seekEntryOrOpen!0 (select (arr!20743 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797059 () Bool)

(declare-fun res!541576 () Bool)

(declare-fun e!442226 () Bool)

(assert (=> b!797059 (=> (not res!541576) (not e!442226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43326 (_ BitVec 32)) Bool)

(assert (=> b!797059 (= res!541576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797060 () Bool)

(assert (=> b!797060 (= e!442223 (not true))))

(declare-fun lt!355523 () SeekEntryResult!8334)

(assert (=> b!797060 (= lt!355523 (Found!8334 index!1236))))

(declare-fun res!541581 () Bool)

(assert (=> start!68536 (=> (not res!541581) (not e!442224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68536 (= res!541581 (validMask!0 mask!3266))))

(assert (=> start!68536 e!442224))

(assert (=> start!68536 true))

(declare-fun array_inv!16539 (array!43326) Bool)

(assert (=> start!68536 (array_inv!16539 a!3170)))

(declare-fun b!797061 () Bool)

(declare-fun res!541582 () Bool)

(assert (=> b!797061 (=> (not res!541582) (not e!442226))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797061 (= res!541582 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21164 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20743 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21164 a!3170)) (= (select (arr!20743 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797062 () Bool)

(declare-fun res!541585 () Bool)

(assert (=> b!797062 (=> (not res!541585) (not e!442224))))

(assert (=> b!797062 (= res!541585 (and (= (size!21164 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21164 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21164 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797063 () Bool)

(declare-fun res!541584 () Bool)

(assert (=> b!797063 (=> (not res!541584) (not e!442226))))

(declare-datatypes ((List!14706 0))(
  ( (Nil!14703) (Cons!14702 (h!15831 (_ BitVec 64)) (t!21021 List!14706)) )
))
(declare-fun arrayNoDuplicates!0 (array!43326 (_ BitVec 32) List!14706) Bool)

(assert (=> b!797063 (= res!541584 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14703))))

(declare-fun b!797064 () Bool)

(assert (=> b!797064 (= e!442226 e!442222)))

(declare-fun res!541580 () Bool)

(assert (=> b!797064 (=> (not res!541580) (not e!442222))))

(declare-fun lt!355525 () SeekEntryResult!8334)

(assert (=> b!797064 (= res!541580 (= lt!355525 lt!355523))))

(declare-fun lt!355521 () (_ BitVec 64))

(declare-fun lt!355526 () array!43326)

(assert (=> b!797064 (= lt!355523 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355521 lt!355526 mask!3266))))

(assert (=> b!797064 (= lt!355525 (seekEntryOrOpen!0 lt!355521 lt!355526 mask!3266))))

(assert (=> b!797064 (= lt!355521 (select (store (arr!20743 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797064 (= lt!355526 (array!43327 (store (arr!20743 a!3170) i!1163 k0!2044) (size!21164 a!3170)))))

(declare-fun b!797065 () Bool)

(declare-fun res!541579 () Bool)

(assert (=> b!797065 (=> (not res!541579) (not e!442224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797065 (= res!541579 (validKeyInArray!0 (select (arr!20743 a!3170) j!153)))))

(declare-fun b!797066 () Bool)

(declare-fun res!541577 () Bool)

(assert (=> b!797066 (=> (not res!541577) (not e!442224))))

(assert (=> b!797066 (= res!541577 (validKeyInArray!0 k0!2044))))

(declare-fun b!797067 () Bool)

(assert (=> b!797067 (= e!442224 e!442226)))

(declare-fun res!541586 () Bool)

(assert (=> b!797067 (=> (not res!541586) (not e!442226))))

(declare-fun lt!355524 () SeekEntryResult!8334)

(assert (=> b!797067 (= res!541586 (or (= lt!355524 (MissingZero!8334 i!1163)) (= lt!355524 (MissingVacant!8334 i!1163))))))

(assert (=> b!797067 (= lt!355524 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68536 res!541581) b!797062))

(assert (= (and b!797062 res!541585) b!797065))

(assert (= (and b!797065 res!541579) b!797066))

(assert (= (and b!797066 res!541577) b!797057))

(assert (= (and b!797057 res!541578) b!797067))

(assert (= (and b!797067 res!541586) b!797059))

(assert (= (and b!797059 res!541576) b!797063))

(assert (= (and b!797063 res!541584) b!797061))

(assert (= (and b!797061 res!541582) b!797064))

(assert (= (and b!797064 res!541580) b!797058))

(assert (= (and b!797058 res!541583) b!797060))

(declare-fun m!737897 () Bool)

(assert (=> b!797063 m!737897))

(declare-fun m!737899 () Bool)

(assert (=> b!797064 m!737899))

(declare-fun m!737901 () Bool)

(assert (=> b!797064 m!737901))

(declare-fun m!737903 () Bool)

(assert (=> b!797064 m!737903))

(declare-fun m!737905 () Bool)

(assert (=> b!797064 m!737905))

(declare-fun m!737907 () Bool)

(assert (=> b!797065 m!737907))

(assert (=> b!797065 m!737907))

(declare-fun m!737909 () Bool)

(assert (=> b!797065 m!737909))

(declare-fun m!737911 () Bool)

(assert (=> b!797066 m!737911))

(declare-fun m!737913 () Bool)

(assert (=> b!797067 m!737913))

(declare-fun m!737915 () Bool)

(assert (=> b!797057 m!737915))

(declare-fun m!737917 () Bool)

(assert (=> b!797061 m!737917))

(declare-fun m!737919 () Bool)

(assert (=> b!797061 m!737919))

(declare-fun m!737921 () Bool)

(assert (=> b!797058 m!737921))

(assert (=> b!797058 m!737907))

(assert (=> b!797058 m!737907))

(declare-fun m!737923 () Bool)

(assert (=> b!797058 m!737923))

(assert (=> b!797058 m!737907))

(declare-fun m!737925 () Bool)

(assert (=> b!797058 m!737925))

(declare-fun m!737927 () Bool)

(assert (=> b!797059 m!737927))

(declare-fun m!737929 () Bool)

(assert (=> start!68536 m!737929))

(declare-fun m!737931 () Bool)

(assert (=> start!68536 m!737931))

(check-sat (not b!797059) (not b!797057) (not b!797066) (not b!797067) (not b!797065) (not start!68536) (not b!797063) (not b!797058) (not b!797064))
(check-sat)
