; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68508 () Bool)

(assert start!68508)

(declare-fun e!442004 () Bool)

(declare-datatypes ((SeekEntryResult!8326 0))(
  ( (MissingZero!8326 (index!35672 (_ BitVec 32))) (Found!8326 (index!35673 (_ BitVec 32))) (Intermediate!8326 (undefined!9138 Bool) (index!35674 (_ BitVec 32)) (x!66583 (_ BitVec 32))) (Undefined!8326) (MissingVacant!8326 (index!35675 (_ BitVec 32))) )
))
(declare-fun lt!355190 () SeekEntryResult!8326)

(declare-fun b!796668 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355192 () SeekEntryResult!8326)

(assert (=> b!796668 (= e!442004 (not (or (not (= lt!355190 lt!355192)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796668 (= lt!355190 (Found!8326 index!1236))))

(declare-fun b!796669 () Bool)

(declare-fun res!541328 () Bool)

(declare-fun e!442005 () Bool)

(assert (=> b!796669 (=> (not res!541328) (not e!442005))))

(declare-datatypes ((array!43315 0))(
  ( (array!43316 (arr!20738 (Array (_ BitVec 32) (_ BitVec 64))) (size!21159 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43315)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796669 (= res!541328 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796670 () Bool)

(declare-fun e!442003 () Bool)

(declare-fun e!442006 () Bool)

(assert (=> b!796670 (= e!442003 e!442006)))

(declare-fun res!541327 () Bool)

(assert (=> b!796670 (=> (not res!541327) (not e!442006))))

(declare-fun lt!355193 () SeekEntryResult!8326)

(assert (=> b!796670 (= res!541327 (= lt!355193 lt!355190))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355189 () (_ BitVec 64))

(declare-fun lt!355195 () array!43315)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43315 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!796670 (= lt!355190 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355189 lt!355195 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43315 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!796670 (= lt!355193 (seekEntryOrOpen!0 lt!355189 lt!355195 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796670 (= lt!355189 (select (store (arr!20738 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796670 (= lt!355195 (array!43316 (store (arr!20738 a!3170) i!1163 k0!2044) (size!21159 a!3170)))))

(declare-fun b!796671 () Bool)

(declare-fun res!541334 () Bool)

(assert (=> b!796671 (=> (not res!541334) (not e!442005))))

(assert (=> b!796671 (= res!541334 (and (= (size!21159 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21159 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21159 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796672 () Bool)

(declare-fun res!541338 () Bool)

(assert (=> b!796672 (=> (not res!541338) (not e!442003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43315 (_ BitVec 32)) Bool)

(assert (=> b!796672 (= res!541338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796673 () Bool)

(declare-fun res!541337 () Bool)

(assert (=> b!796673 (=> (not res!541337) (not e!442005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796673 (= res!541337 (validKeyInArray!0 k0!2044))))

(declare-fun b!796674 () Bool)

(declare-fun res!541336 () Bool)

(assert (=> b!796674 (=> (not res!541336) (not e!442005))))

(assert (=> b!796674 (= res!541336 (validKeyInArray!0 (select (arr!20738 a!3170) j!153)))))

(declare-fun b!796676 () Bool)

(assert (=> b!796676 (= e!442005 e!442003)))

(declare-fun res!541329 () Bool)

(assert (=> b!796676 (=> (not res!541329) (not e!442003))))

(declare-fun lt!355191 () SeekEntryResult!8326)

(assert (=> b!796676 (= res!541329 (or (= lt!355191 (MissingZero!8326 i!1163)) (= lt!355191 (MissingVacant!8326 i!1163))))))

(assert (=> b!796676 (= lt!355191 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796677 () Bool)

(declare-fun res!541335 () Bool)

(assert (=> b!796677 (=> (not res!541335) (not e!442003))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796677 (= res!541335 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21159 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20738 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21159 a!3170)) (= (select (arr!20738 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!541333 () Bool)

(assert (=> start!68508 (=> (not res!541333) (not e!442005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68508 (= res!541333 (validMask!0 mask!3266))))

(assert (=> start!68508 e!442005))

(assert (=> start!68508 true))

(declare-fun array_inv!16621 (array!43315) Bool)

(assert (=> start!68508 (array_inv!16621 a!3170)))

(declare-fun b!796675 () Bool)

(declare-fun res!541331 () Bool)

(assert (=> b!796675 (=> (not res!541331) (not e!442003))))

(declare-datatypes ((List!14740 0))(
  ( (Nil!14737) (Cons!14736 (h!15865 (_ BitVec 64)) (t!21046 List!14740)) )
))
(declare-fun arrayNoDuplicates!0 (array!43315 (_ BitVec 32) List!14740) Bool)

(assert (=> b!796675 (= res!541331 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14737))))

(declare-fun b!796678 () Bool)

(declare-fun e!442002 () Bool)

(assert (=> b!796678 (= e!442006 e!442002)))

(declare-fun res!541330 () Bool)

(assert (=> b!796678 (=> (not res!541330) (not e!442002))))

(declare-fun lt!355196 () SeekEntryResult!8326)

(declare-fun lt!355194 () SeekEntryResult!8326)

(assert (=> b!796678 (= res!541330 (= lt!355196 lt!355194))))

(assert (=> b!796678 (= lt!355194 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20738 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796678 (= lt!355196 (seekEntryOrOpen!0 (select (arr!20738 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796679 () Bool)

(assert (=> b!796679 (= e!442002 e!442004)))

(declare-fun res!541332 () Bool)

(assert (=> b!796679 (=> (not res!541332) (not e!442004))))

(assert (=> b!796679 (= res!541332 (and (= lt!355194 lt!355192) (= (select (arr!20738 a!3170) index!1236) (select (arr!20738 a!3170) j!153))))))

(assert (=> b!796679 (= lt!355192 (Found!8326 j!153))))

(assert (= (and start!68508 res!541333) b!796671))

(assert (= (and b!796671 res!541334) b!796674))

(assert (= (and b!796674 res!541336) b!796673))

(assert (= (and b!796673 res!541337) b!796669))

(assert (= (and b!796669 res!541328) b!796676))

(assert (= (and b!796676 res!541329) b!796672))

(assert (= (and b!796672 res!541338) b!796675))

(assert (= (and b!796675 res!541331) b!796677))

(assert (= (and b!796677 res!541335) b!796670))

(assert (= (and b!796670 res!541327) b!796678))

(assert (= (and b!796678 res!541330) b!796679))

(assert (= (and b!796679 res!541332) b!796668))

(declare-fun m!737011 () Bool)

(assert (=> b!796673 m!737011))

(declare-fun m!737013 () Bool)

(assert (=> start!68508 m!737013))

(declare-fun m!737015 () Bool)

(assert (=> start!68508 m!737015))

(declare-fun m!737017 () Bool)

(assert (=> b!796670 m!737017))

(declare-fun m!737019 () Bool)

(assert (=> b!796670 m!737019))

(declare-fun m!737021 () Bool)

(assert (=> b!796670 m!737021))

(declare-fun m!737023 () Bool)

(assert (=> b!796670 m!737023))

(declare-fun m!737025 () Bool)

(assert (=> b!796678 m!737025))

(assert (=> b!796678 m!737025))

(declare-fun m!737027 () Bool)

(assert (=> b!796678 m!737027))

(assert (=> b!796678 m!737025))

(declare-fun m!737029 () Bool)

(assert (=> b!796678 m!737029))

(declare-fun m!737031 () Bool)

(assert (=> b!796679 m!737031))

(assert (=> b!796679 m!737025))

(assert (=> b!796674 m!737025))

(assert (=> b!796674 m!737025))

(declare-fun m!737033 () Bool)

(assert (=> b!796674 m!737033))

(declare-fun m!737035 () Bool)

(assert (=> b!796676 m!737035))

(declare-fun m!737037 () Bool)

(assert (=> b!796669 m!737037))

(declare-fun m!737039 () Bool)

(assert (=> b!796672 m!737039))

(declare-fun m!737041 () Bool)

(assert (=> b!796677 m!737041))

(declare-fun m!737043 () Bool)

(assert (=> b!796677 m!737043))

(declare-fun m!737045 () Bool)

(assert (=> b!796675 m!737045))

(check-sat (not b!796673) (not b!796674) (not b!796678) (not start!68508) (not b!796669) (not b!796672) (not b!796670) (not b!796675) (not b!796676))
(check-sat)
