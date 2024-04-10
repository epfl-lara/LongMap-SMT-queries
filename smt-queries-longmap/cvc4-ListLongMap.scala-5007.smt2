; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68556 () Bool)

(assert start!68556)

(declare-fun b!797404 () Bool)

(declare-fun e!442390 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8344 0))(
  ( (MissingZero!8344 (index!35744 (_ BitVec 32))) (Found!8344 (index!35745 (_ BitVec 32))) (Intermediate!8344 (undefined!9156 Bool) (index!35746 (_ BitVec 32)) (x!66638 (_ BitVec 32))) (Undefined!8344) (MissingVacant!8344 (index!35747 (_ BitVec 32))) )
))
(declare-fun lt!355750 () SeekEntryResult!8344)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355753 () SeekEntryResult!8344)

(assert (=> b!797404 (= e!442390 (not (or (not (= lt!355753 lt!355750)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797404 (= lt!355753 (Found!8344 index!1236))))

(declare-fun b!797405 () Bool)

(declare-fun e!442394 () Bool)

(assert (=> b!797405 (= e!442394 e!442390)))

(declare-fun res!541924 () Bool)

(assert (=> b!797405 (=> (not res!541924) (not e!442390))))

(declare-fun lt!355752 () SeekEntryResult!8344)

(declare-datatypes ((array!43346 0))(
  ( (array!43347 (arr!20753 (Array (_ BitVec 32) (_ BitVec 64))) (size!21174 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43346)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797405 (= res!541924 (and (= lt!355752 lt!355750) (= (select (arr!20753 a!3170) index!1236) (select (arr!20753 a!3170) j!153))))))

(assert (=> b!797405 (= lt!355750 (Found!8344 j!153))))

(declare-fun b!797406 () Bool)

(declare-fun e!442393 () Bool)

(assert (=> b!797406 (= e!442393 e!442394)))

(declare-fun res!541933 () Bool)

(assert (=> b!797406 (=> (not res!541933) (not e!442394))))

(declare-fun lt!355748 () SeekEntryResult!8344)

(assert (=> b!797406 (= res!541933 (= lt!355748 lt!355752))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43346 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!797406 (= lt!355752 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20753 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43346 (_ BitVec 32)) SeekEntryResult!8344)

(assert (=> b!797406 (= lt!355748 (seekEntryOrOpen!0 (select (arr!20753 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797408 () Bool)

(declare-fun res!541929 () Bool)

(declare-fun e!442392 () Bool)

(assert (=> b!797408 (=> (not res!541929) (not e!442392))))

(declare-datatypes ((List!14716 0))(
  ( (Nil!14713) (Cons!14712 (h!15841 (_ BitVec 64)) (t!21031 List!14716)) )
))
(declare-fun arrayNoDuplicates!0 (array!43346 (_ BitVec 32) List!14716) Bool)

(assert (=> b!797408 (= res!541929 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14713))))

(declare-fun b!797409 () Bool)

(declare-fun res!541926 () Bool)

(declare-fun e!442389 () Bool)

(assert (=> b!797409 (=> (not res!541926) (not e!442389))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797409 (= res!541926 (and (= (size!21174 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21174 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21174 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797410 () Bool)

(declare-fun res!541927 () Bool)

(assert (=> b!797410 (=> (not res!541927) (not e!442392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43346 (_ BitVec 32)) Bool)

(assert (=> b!797410 (= res!541927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797411 () Bool)

(assert (=> b!797411 (= e!442392 e!442393)))

(declare-fun res!541932 () Bool)

(assert (=> b!797411 (=> (not res!541932) (not e!442393))))

(declare-fun lt!355751 () SeekEntryResult!8344)

(assert (=> b!797411 (= res!541932 (= lt!355751 lt!355753))))

(declare-fun lt!355749 () (_ BitVec 64))

(declare-fun lt!355747 () array!43346)

(assert (=> b!797411 (= lt!355753 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355749 lt!355747 mask!3266))))

(assert (=> b!797411 (= lt!355751 (seekEntryOrOpen!0 lt!355749 lt!355747 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797411 (= lt!355749 (select (store (arr!20753 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797411 (= lt!355747 (array!43347 (store (arr!20753 a!3170) i!1163 k!2044) (size!21174 a!3170)))))

(declare-fun b!797412 () Bool)

(declare-fun res!541930 () Bool)

(assert (=> b!797412 (=> (not res!541930) (not e!442389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797412 (= res!541930 (validKeyInArray!0 (select (arr!20753 a!3170) j!153)))))

(declare-fun res!541934 () Bool)

(assert (=> start!68556 (=> (not res!541934) (not e!442389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68556 (= res!541934 (validMask!0 mask!3266))))

(assert (=> start!68556 e!442389))

(assert (=> start!68556 true))

(declare-fun array_inv!16549 (array!43346) Bool)

(assert (=> start!68556 (array_inv!16549 a!3170)))

(declare-fun b!797407 () Bool)

(declare-fun res!541923 () Bool)

(assert (=> b!797407 (=> (not res!541923) (not e!442392))))

(assert (=> b!797407 (= res!541923 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21174 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20753 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21174 a!3170)) (= (select (arr!20753 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797413 () Bool)

(assert (=> b!797413 (= e!442389 e!442392)))

(declare-fun res!541928 () Bool)

(assert (=> b!797413 (=> (not res!541928) (not e!442392))))

(declare-fun lt!355754 () SeekEntryResult!8344)

(assert (=> b!797413 (= res!541928 (or (= lt!355754 (MissingZero!8344 i!1163)) (= lt!355754 (MissingVacant!8344 i!1163))))))

(assert (=> b!797413 (= lt!355754 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797414 () Bool)

(declare-fun res!541931 () Bool)

(assert (=> b!797414 (=> (not res!541931) (not e!442389))))

(declare-fun arrayContainsKey!0 (array!43346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797414 (= res!541931 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797415 () Bool)

(declare-fun res!541925 () Bool)

(assert (=> b!797415 (=> (not res!541925) (not e!442389))))

(assert (=> b!797415 (= res!541925 (validKeyInArray!0 k!2044))))

(assert (= (and start!68556 res!541934) b!797409))

(assert (= (and b!797409 res!541926) b!797412))

(assert (= (and b!797412 res!541930) b!797415))

(assert (= (and b!797415 res!541925) b!797414))

(assert (= (and b!797414 res!541931) b!797413))

(assert (= (and b!797413 res!541928) b!797410))

(assert (= (and b!797410 res!541927) b!797408))

(assert (= (and b!797408 res!541929) b!797407))

(assert (= (and b!797407 res!541923) b!797411))

(assert (= (and b!797411 res!541932) b!797406))

(assert (= (and b!797406 res!541933) b!797405))

(assert (= (and b!797405 res!541924) b!797404))

(declare-fun m!738257 () Bool)

(assert (=> b!797410 m!738257))

(declare-fun m!738259 () Bool)

(assert (=> b!797415 m!738259))

(declare-fun m!738261 () Bool)

(assert (=> b!797408 m!738261))

(declare-fun m!738263 () Bool)

(assert (=> b!797411 m!738263))

(declare-fun m!738265 () Bool)

(assert (=> b!797411 m!738265))

(declare-fun m!738267 () Bool)

(assert (=> b!797411 m!738267))

(declare-fun m!738269 () Bool)

(assert (=> b!797411 m!738269))

(declare-fun m!738271 () Bool)

(assert (=> b!797405 m!738271))

(declare-fun m!738273 () Bool)

(assert (=> b!797405 m!738273))

(declare-fun m!738275 () Bool)

(assert (=> b!797413 m!738275))

(assert (=> b!797406 m!738273))

(assert (=> b!797406 m!738273))

(declare-fun m!738277 () Bool)

(assert (=> b!797406 m!738277))

(assert (=> b!797406 m!738273))

(declare-fun m!738279 () Bool)

(assert (=> b!797406 m!738279))

(declare-fun m!738281 () Bool)

(assert (=> b!797407 m!738281))

(declare-fun m!738283 () Bool)

(assert (=> b!797407 m!738283))

(declare-fun m!738285 () Bool)

(assert (=> b!797414 m!738285))

(declare-fun m!738287 () Bool)

(assert (=> start!68556 m!738287))

(declare-fun m!738289 () Bool)

(assert (=> start!68556 m!738289))

(assert (=> b!797412 m!738273))

(assert (=> b!797412 m!738273))

(declare-fun m!738291 () Bool)

(assert (=> b!797412 m!738291))

(push 1)

(assert (not b!797411))

(assert (not b!797413))

(assert (not b!797415))

(assert (not b!797410))

(assert (not b!797412))

(assert (not b!797408))

(assert (not start!68556))

(assert (not b!797406))

(assert (not b!797414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

