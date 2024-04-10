; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68562 () Bool)

(assert start!68562)

(declare-fun b!797512 () Bool)

(declare-fun e!442448 () Bool)

(declare-fun e!442445 () Bool)

(assert (=> b!797512 (= e!442448 e!442445)))

(declare-fun res!542040 () Bool)

(assert (=> b!797512 (=> (not res!542040) (not e!442445))))

(declare-datatypes ((SeekEntryResult!8347 0))(
  ( (MissingZero!8347 (index!35756 (_ BitVec 32))) (Found!8347 (index!35757 (_ BitVec 32))) (Intermediate!8347 (undefined!9159 Bool) (index!35758 (_ BitVec 32)) (x!66649 (_ BitVec 32))) (Undefined!8347) (MissingVacant!8347 (index!35759 (_ BitVec 32))) )
))
(declare-fun lt!355824 () SeekEntryResult!8347)

(declare-fun lt!355822 () SeekEntryResult!8347)

(assert (=> b!797512 (= res!542040 (= lt!355824 lt!355822))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43352 0))(
  ( (array!43353 (arr!20756 (Array (_ BitVec 32) (_ BitVec 64))) (size!21177 (_ BitVec 32))) )
))
(declare-fun lt!355825 () array!43352)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355821 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43352 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!797512 (= lt!355822 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355821 lt!355825 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43352 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!797512 (= lt!355824 (seekEntryOrOpen!0 lt!355821 lt!355825 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43352)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797512 (= lt!355821 (select (store (arr!20756 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797512 (= lt!355825 (array!43353 (store (arr!20756 a!3170) i!1163 k!2044) (size!21177 a!3170)))))

(declare-fun b!797513 () Bool)

(declare-fun res!542042 () Bool)

(assert (=> b!797513 (=> (not res!542042) (not e!442448))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797513 (= res!542042 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21177 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20756 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21177 a!3170)) (= (select (arr!20756 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797514 () Bool)

(declare-fun res!542033 () Bool)

(declare-fun e!442447 () Bool)

(assert (=> b!797514 (=> (not res!542033) (not e!442447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797514 (= res!542033 (validKeyInArray!0 k!2044))))

(declare-fun b!797515 () Bool)

(declare-fun e!442446 () Bool)

(declare-fun e!442443 () Bool)

(assert (=> b!797515 (= e!442446 e!442443)))

(declare-fun res!542037 () Bool)

(assert (=> b!797515 (=> (not res!542037) (not e!442443))))

(declare-fun lt!355826 () SeekEntryResult!8347)

(declare-fun lt!355819 () SeekEntryResult!8347)

(assert (=> b!797515 (= res!542037 (and (= lt!355826 lt!355819) (= (select (arr!20756 a!3170) index!1236) (select (arr!20756 a!3170) j!153))))))

(assert (=> b!797515 (= lt!355819 (Found!8347 j!153))))

(declare-fun b!797516 () Bool)

(declare-fun res!542038 () Bool)

(assert (=> b!797516 (=> (not res!542038) (not e!442448))))

(declare-datatypes ((List!14719 0))(
  ( (Nil!14716) (Cons!14715 (h!15844 (_ BitVec 64)) (t!21034 List!14719)) )
))
(declare-fun arrayNoDuplicates!0 (array!43352 (_ BitVec 32) List!14719) Bool)

(assert (=> b!797516 (= res!542038 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14716))))

(declare-fun b!797517 () Bool)

(declare-fun res!542041 () Bool)

(assert (=> b!797517 (=> (not res!542041) (not e!442447))))

(assert (=> b!797517 (= res!542041 (and (= (size!21177 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21177 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21177 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797518 () Bool)

(declare-fun res!542034 () Bool)

(assert (=> b!797518 (=> (not res!542034) (not e!442448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43352 (_ BitVec 32)) Bool)

(assert (=> b!797518 (= res!542034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797519 () Bool)

(assert (=> b!797519 (= e!442445 e!442446)))

(declare-fun res!542036 () Bool)

(assert (=> b!797519 (=> (not res!542036) (not e!442446))))

(declare-fun lt!355820 () SeekEntryResult!8347)

(assert (=> b!797519 (= res!542036 (= lt!355820 lt!355826))))

(assert (=> b!797519 (= lt!355826 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20756 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797519 (= lt!355820 (seekEntryOrOpen!0 (select (arr!20756 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797520 () Bool)

(assert (=> b!797520 (= e!442443 (not (or (not (= lt!355822 lt!355819)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20756 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797520 (= lt!355822 (Found!8347 index!1236))))

(declare-fun b!797521 () Bool)

(declare-fun res!542039 () Bool)

(assert (=> b!797521 (=> (not res!542039) (not e!442447))))

(assert (=> b!797521 (= res!542039 (validKeyInArray!0 (select (arr!20756 a!3170) j!153)))))

(declare-fun b!797522 () Bool)

(declare-fun res!542035 () Bool)

(assert (=> b!797522 (=> (not res!542035) (not e!442447))))

(declare-fun arrayContainsKey!0 (array!43352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797522 (= res!542035 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!542032 () Bool)

(assert (=> start!68562 (=> (not res!542032) (not e!442447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68562 (= res!542032 (validMask!0 mask!3266))))

(assert (=> start!68562 e!442447))

(assert (=> start!68562 true))

(declare-fun array_inv!16552 (array!43352) Bool)

(assert (=> start!68562 (array_inv!16552 a!3170)))

(declare-fun b!797523 () Bool)

(assert (=> b!797523 (= e!442447 e!442448)))

(declare-fun res!542031 () Bool)

(assert (=> b!797523 (=> (not res!542031) (not e!442448))))

(declare-fun lt!355823 () SeekEntryResult!8347)

(assert (=> b!797523 (= res!542031 (or (= lt!355823 (MissingZero!8347 i!1163)) (= lt!355823 (MissingVacant!8347 i!1163))))))

(assert (=> b!797523 (= lt!355823 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68562 res!542032) b!797517))

(assert (= (and b!797517 res!542041) b!797521))

(assert (= (and b!797521 res!542039) b!797514))

(assert (= (and b!797514 res!542033) b!797522))

(assert (= (and b!797522 res!542035) b!797523))

(assert (= (and b!797523 res!542031) b!797518))

(assert (= (and b!797518 res!542034) b!797516))

(assert (= (and b!797516 res!542038) b!797513))

(assert (= (and b!797513 res!542042) b!797512))

(assert (= (and b!797512 res!542040) b!797519))

(assert (= (and b!797519 res!542036) b!797515))

(assert (= (and b!797515 res!542037) b!797520))

(declare-fun m!738369 () Bool)

(assert (=> b!797515 m!738369))

(declare-fun m!738371 () Bool)

(assert (=> b!797515 m!738371))

(declare-fun m!738373 () Bool)

(assert (=> b!797520 m!738373))

(declare-fun m!738375 () Bool)

(assert (=> b!797520 m!738375))

(declare-fun m!738377 () Bool)

(assert (=> b!797512 m!738377))

(declare-fun m!738379 () Bool)

(assert (=> b!797512 m!738379))

(assert (=> b!797512 m!738373))

(declare-fun m!738381 () Bool)

(assert (=> b!797512 m!738381))

(declare-fun m!738383 () Bool)

(assert (=> b!797514 m!738383))

(assert (=> b!797521 m!738371))

(assert (=> b!797521 m!738371))

(declare-fun m!738385 () Bool)

(assert (=> b!797521 m!738385))

(declare-fun m!738387 () Bool)

(assert (=> start!68562 m!738387))

(declare-fun m!738389 () Bool)

(assert (=> start!68562 m!738389))

(declare-fun m!738391 () Bool)

(assert (=> b!797523 m!738391))

(declare-fun m!738393 () Bool)

(assert (=> b!797522 m!738393))

(assert (=> b!797519 m!738371))

(assert (=> b!797519 m!738371))

(declare-fun m!738395 () Bool)

(assert (=> b!797519 m!738395))

(assert (=> b!797519 m!738371))

(declare-fun m!738397 () Bool)

(assert (=> b!797519 m!738397))

(declare-fun m!738399 () Bool)

(assert (=> b!797516 m!738399))

(declare-fun m!738401 () Bool)

(assert (=> b!797518 m!738401))

(declare-fun m!738403 () Bool)

(assert (=> b!797513 m!738403))

(declare-fun m!738405 () Bool)

(assert (=> b!797513 m!738405))

(push 1)

