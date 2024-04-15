; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68574 () Bool)

(assert start!68574)

(declare-fun b!797827 () Bool)

(declare-fun res!542492 () Bool)

(declare-fun e!442569 () Bool)

(assert (=> b!797827 (=> (not res!542492) (not e!442569))))

(declare-datatypes ((array!43381 0))(
  ( (array!43382 (arr!20771 (Array (_ BitVec 32) (_ BitVec 64))) (size!21192 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43381)

(declare-datatypes ((List!14773 0))(
  ( (Nil!14770) (Cons!14769 (h!15898 (_ BitVec 64)) (t!21079 List!14773)) )
))
(declare-fun arrayNoDuplicates!0 (array!43381 (_ BitVec 32) List!14773) Bool)

(assert (=> b!797827 (= res!542492 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14770))))

(declare-fun b!797828 () Bool)

(declare-fun res!542495 () Bool)

(declare-fun e!442570 () Bool)

(assert (=> b!797828 (=> (not res!542495) (not e!442570))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797828 (= res!542495 (validKeyInArray!0 (select (arr!20771 a!3170) j!153)))))

(declare-fun b!797829 () Bool)

(declare-fun e!442568 () Bool)

(assert (=> b!797829 (= e!442568 (not true))))

(declare-datatypes ((SeekEntryResult!8359 0))(
  ( (MissingZero!8359 (index!35804 (_ BitVec 32))) (Found!8359 (index!35805 (_ BitVec 32))) (Intermediate!8359 (undefined!9171 Bool) (index!35806 (_ BitVec 32)) (x!66704 (_ BitVec 32))) (Undefined!8359) (MissingVacant!8359 (index!35807 (_ BitVec 32))) )
))
(declare-fun lt!355943 () SeekEntryResult!8359)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797829 (= lt!355943 (Found!8359 index!1236))))

(declare-fun b!797830 () Bool)

(declare-fun res!542491 () Bool)

(assert (=> b!797830 (=> (not res!542491) (not e!442569))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43381 (_ BitVec 32)) Bool)

(assert (=> b!797830 (= res!542491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!542496 () Bool)

(assert (=> start!68574 (=> (not res!542496) (not e!442570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68574 (= res!542496 (validMask!0 mask!3266))))

(assert (=> start!68574 e!442570))

(assert (=> start!68574 true))

(declare-fun array_inv!16654 (array!43381) Bool)

(assert (=> start!68574 (array_inv!16654 a!3170)))

(declare-fun b!797831 () Bool)

(declare-fun res!542494 () Bool)

(assert (=> b!797831 (=> (not res!542494) (not e!442569))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797831 (= res!542494 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21192 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20771 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21192 a!3170)) (= (select (arr!20771 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797832 () Bool)

(declare-fun res!542487 () Bool)

(assert (=> b!797832 (=> (not res!542487) (not e!442570))))

(assert (=> b!797832 (= res!542487 (and (= (size!21192 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21192 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21192 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797833 () Bool)

(declare-fun e!442567 () Bool)

(assert (=> b!797833 (= e!442569 e!442567)))

(declare-fun res!542489 () Bool)

(assert (=> b!797833 (=> (not res!542489) (not e!442567))))

(declare-fun lt!355945 () SeekEntryResult!8359)

(assert (=> b!797833 (= res!542489 (= lt!355945 lt!355943))))

(declare-fun lt!355949 () array!43381)

(declare-fun lt!355948 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43381 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!797833 (= lt!355943 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355948 lt!355949 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43381 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!797833 (= lt!355945 (seekEntryOrOpen!0 lt!355948 lt!355949 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!797833 (= lt!355948 (select (store (arr!20771 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797833 (= lt!355949 (array!43382 (store (arr!20771 a!3170) i!1163 k0!2044) (size!21192 a!3170)))))

(declare-fun b!797834 () Bool)

(assert (=> b!797834 (= e!442567 e!442568)))

(declare-fun res!542486 () Bool)

(assert (=> b!797834 (=> (not res!542486) (not e!442568))))

(declare-fun lt!355947 () SeekEntryResult!8359)

(declare-fun lt!355946 () SeekEntryResult!8359)

(assert (=> b!797834 (= res!542486 (and (= lt!355947 lt!355946) (= lt!355946 (Found!8359 j!153)) (= (select (arr!20771 a!3170) index!1236) (select (arr!20771 a!3170) j!153))))))

(assert (=> b!797834 (= lt!355946 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20771 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797834 (= lt!355947 (seekEntryOrOpen!0 (select (arr!20771 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797835 () Bool)

(assert (=> b!797835 (= e!442570 e!442569)))

(declare-fun res!542493 () Bool)

(assert (=> b!797835 (=> (not res!542493) (not e!442569))))

(declare-fun lt!355944 () SeekEntryResult!8359)

(assert (=> b!797835 (= res!542493 (or (= lt!355944 (MissingZero!8359 i!1163)) (= lt!355944 (MissingVacant!8359 i!1163))))))

(assert (=> b!797835 (= lt!355944 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797836 () Bool)

(declare-fun res!542490 () Bool)

(assert (=> b!797836 (=> (not res!542490) (not e!442570))))

(declare-fun arrayContainsKey!0 (array!43381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797836 (= res!542490 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797837 () Bool)

(declare-fun res!542488 () Bool)

(assert (=> b!797837 (=> (not res!542488) (not e!442570))))

(assert (=> b!797837 (= res!542488 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68574 res!542496) b!797832))

(assert (= (and b!797832 res!542487) b!797828))

(assert (= (and b!797828 res!542495) b!797837))

(assert (= (and b!797837 res!542488) b!797836))

(assert (= (and b!797836 res!542490) b!797835))

(assert (= (and b!797835 res!542493) b!797830))

(assert (= (and b!797830 res!542491) b!797827))

(assert (= (and b!797827 res!542492) b!797831))

(assert (= (and b!797831 res!542494) b!797833))

(assert (= (and b!797833 res!542489) b!797834))

(assert (= (and b!797834 res!542486) b!797829))

(declare-fun m!738217 () Bool)

(assert (=> b!797837 m!738217))

(declare-fun m!738219 () Bool)

(assert (=> b!797827 m!738219))

(declare-fun m!738221 () Bool)

(assert (=> b!797831 m!738221))

(declare-fun m!738223 () Bool)

(assert (=> b!797831 m!738223))

(declare-fun m!738225 () Bool)

(assert (=> b!797834 m!738225))

(declare-fun m!738227 () Bool)

(assert (=> b!797834 m!738227))

(assert (=> b!797834 m!738227))

(declare-fun m!738229 () Bool)

(assert (=> b!797834 m!738229))

(assert (=> b!797834 m!738227))

(declare-fun m!738231 () Bool)

(assert (=> b!797834 m!738231))

(declare-fun m!738233 () Bool)

(assert (=> b!797830 m!738233))

(declare-fun m!738235 () Bool)

(assert (=> b!797833 m!738235))

(declare-fun m!738237 () Bool)

(assert (=> b!797833 m!738237))

(declare-fun m!738239 () Bool)

(assert (=> b!797833 m!738239))

(declare-fun m!738241 () Bool)

(assert (=> b!797833 m!738241))

(declare-fun m!738243 () Bool)

(assert (=> b!797835 m!738243))

(assert (=> b!797828 m!738227))

(assert (=> b!797828 m!738227))

(declare-fun m!738245 () Bool)

(assert (=> b!797828 m!738245))

(declare-fun m!738247 () Bool)

(assert (=> start!68574 m!738247))

(declare-fun m!738249 () Bool)

(assert (=> start!68574 m!738249))

(declare-fun m!738251 () Bool)

(assert (=> b!797836 m!738251))

(check-sat (not b!797837) (not b!797827) (not b!797834) (not b!797830) (not b!797828) (not b!797833) (not b!797835) (not b!797836) (not start!68574))
(check-sat)
