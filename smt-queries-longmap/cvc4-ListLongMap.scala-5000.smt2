; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68514 () Bool)

(assert start!68514)

(declare-fun b!796676 () Bool)

(declare-fun e!442040 () Bool)

(declare-fun e!442039 () Bool)

(assert (=> b!796676 (= e!442040 e!442039)))

(declare-fun res!541197 () Bool)

(assert (=> b!796676 (=> (not res!541197) (not e!442039))))

(declare-datatypes ((SeekEntryResult!8323 0))(
  ( (MissingZero!8323 (index!35660 (_ BitVec 32))) (Found!8323 (index!35661 (_ BitVec 32))) (Intermediate!8323 (undefined!9135 Bool) (index!35662 (_ BitVec 32)) (x!66561 (_ BitVec 32))) (Undefined!8323) (MissingVacant!8323 (index!35663 (_ BitVec 32))) )
))
(declare-fun lt!355281 () SeekEntryResult!8323)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796676 (= res!541197 (or (= lt!355281 (MissingZero!8323 i!1163)) (= lt!355281 (MissingVacant!8323 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43304 0))(
  ( (array!43305 (arr!20732 (Array (_ BitVec 32) (_ BitVec 64))) (size!21153 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43304)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43304 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!796676 (= lt!355281 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796677 () Bool)

(declare-fun res!541205 () Bool)

(assert (=> b!796677 (=> (not res!541205) (not e!442040))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796677 (= res!541205 (and (= (size!21153 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21153 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21153 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!541204 () Bool)

(assert (=> start!68514 (=> (not res!541204) (not e!442040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68514 (= res!541204 (validMask!0 mask!3266))))

(assert (=> start!68514 e!442040))

(assert (=> start!68514 true))

(declare-fun array_inv!16528 (array!43304) Bool)

(assert (=> start!68514 (array_inv!16528 a!3170)))

(declare-fun b!796678 () Bool)

(declare-fun e!442042 () Bool)

(declare-fun e!442043 () Bool)

(assert (=> b!796678 (= e!442042 e!442043)))

(declare-fun res!541198 () Bool)

(assert (=> b!796678 (=> (not res!541198) (not e!442043))))

(declare-fun lt!355282 () SeekEntryResult!8323)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355284 () SeekEntryResult!8323)

(assert (=> b!796678 (= res!541198 (and (= lt!355282 lt!355284) (= lt!355284 (Found!8323 j!153)) (= (select (arr!20732 a!3170) index!1236) (select (arr!20732 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43304 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!796678 (= lt!355284 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20732 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796678 (= lt!355282 (seekEntryOrOpen!0 (select (arr!20732 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796679 () Bool)

(declare-fun res!541200 () Bool)

(assert (=> b!796679 (=> (not res!541200) (not e!442039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43304 (_ BitVec 32)) Bool)

(assert (=> b!796679 (= res!541200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796680 () Bool)

(declare-fun res!541196 () Bool)

(assert (=> b!796680 (=> (not res!541196) (not e!442040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796680 (= res!541196 (validKeyInArray!0 (select (arr!20732 a!3170) j!153)))))

(declare-fun b!796681 () Bool)

(declare-fun res!541199 () Bool)

(assert (=> b!796681 (=> (not res!541199) (not e!442040))))

(assert (=> b!796681 (= res!541199 (validKeyInArray!0 k!2044))))

(declare-fun b!796682 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796682 (= e!442043 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20732 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!355285 () SeekEntryResult!8323)

(assert (=> b!796682 (= lt!355285 (Found!8323 index!1236))))

(declare-fun b!796683 () Bool)

(declare-fun res!541195 () Bool)

(assert (=> b!796683 (=> (not res!541195) (not e!442039))))

(assert (=> b!796683 (= res!541195 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21153 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20732 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21153 a!3170)) (= (select (arr!20732 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796684 () Bool)

(declare-fun res!541202 () Bool)

(assert (=> b!796684 (=> (not res!541202) (not e!442040))))

(declare-fun arrayContainsKey!0 (array!43304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796684 (= res!541202 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796685 () Bool)

(assert (=> b!796685 (= e!442039 e!442042)))

(declare-fun res!541203 () Bool)

(assert (=> b!796685 (=> (not res!541203) (not e!442042))))

(declare-fun lt!355286 () SeekEntryResult!8323)

(assert (=> b!796685 (= res!541203 (= lt!355286 lt!355285))))

(declare-fun lt!355280 () array!43304)

(declare-fun lt!355283 () (_ BitVec 64))

(assert (=> b!796685 (= lt!355285 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355283 lt!355280 mask!3266))))

(assert (=> b!796685 (= lt!355286 (seekEntryOrOpen!0 lt!355283 lt!355280 mask!3266))))

(assert (=> b!796685 (= lt!355283 (select (store (arr!20732 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796685 (= lt!355280 (array!43305 (store (arr!20732 a!3170) i!1163 k!2044) (size!21153 a!3170)))))

(declare-fun b!796686 () Bool)

(declare-fun res!541201 () Bool)

(assert (=> b!796686 (=> (not res!541201) (not e!442039))))

(declare-datatypes ((List!14695 0))(
  ( (Nil!14692) (Cons!14691 (h!15820 (_ BitVec 64)) (t!21010 List!14695)) )
))
(declare-fun arrayNoDuplicates!0 (array!43304 (_ BitVec 32) List!14695) Bool)

(assert (=> b!796686 (= res!541201 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14692))))

(assert (= (and start!68514 res!541204) b!796677))

(assert (= (and b!796677 res!541205) b!796680))

(assert (= (and b!796680 res!541196) b!796681))

(assert (= (and b!796681 res!541199) b!796684))

(assert (= (and b!796684 res!541202) b!796676))

(assert (= (and b!796676 res!541197) b!796679))

(assert (= (and b!796679 res!541200) b!796686))

(assert (= (and b!796686 res!541201) b!796683))

(assert (= (and b!796683 res!541195) b!796685))

(assert (= (and b!796685 res!541203) b!796678))

(assert (= (and b!796678 res!541198) b!796682))

(declare-fun m!737487 () Bool)

(assert (=> b!796684 m!737487))

(declare-fun m!737489 () Bool)

(assert (=> b!796685 m!737489))

(declare-fun m!737491 () Bool)

(assert (=> b!796685 m!737491))

(declare-fun m!737493 () Bool)

(assert (=> b!796685 m!737493))

(declare-fun m!737495 () Bool)

(assert (=> b!796685 m!737495))

(declare-fun m!737497 () Bool)

(assert (=> b!796686 m!737497))

(declare-fun m!737499 () Bool)

(assert (=> b!796678 m!737499))

(declare-fun m!737501 () Bool)

(assert (=> b!796678 m!737501))

(assert (=> b!796678 m!737501))

(declare-fun m!737503 () Bool)

(assert (=> b!796678 m!737503))

(assert (=> b!796678 m!737501))

(declare-fun m!737505 () Bool)

(assert (=> b!796678 m!737505))

(declare-fun m!737507 () Bool)

(assert (=> b!796676 m!737507))

(assert (=> b!796682 m!737493))

(declare-fun m!737509 () Bool)

(assert (=> b!796682 m!737509))

(declare-fun m!737511 () Bool)

(assert (=> b!796679 m!737511))

(declare-fun m!737513 () Bool)

(assert (=> start!68514 m!737513))

(declare-fun m!737515 () Bool)

(assert (=> start!68514 m!737515))

(declare-fun m!737517 () Bool)

(assert (=> b!796681 m!737517))

(assert (=> b!796680 m!737501))

(assert (=> b!796680 m!737501))

(declare-fun m!737519 () Bool)

(assert (=> b!796680 m!737519))

(declare-fun m!737521 () Bool)

(assert (=> b!796683 m!737521))

(declare-fun m!737523 () Bool)

(assert (=> b!796683 m!737523))

(push 1)

(assert (not b!796676))

(assert (not b!796679))

(assert (not b!796686))

(assert (not start!68514))

(assert (not b!796684))

(assert (not b!796678))

(assert (not b!796685))

(assert (not b!796680))

(assert (not b!796681))

(check-sat)

