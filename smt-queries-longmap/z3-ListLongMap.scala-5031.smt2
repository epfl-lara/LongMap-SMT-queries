; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68676 () Bool)

(assert start!68676)

(declare-fun b!799649 () Bool)

(declare-fun e!443392 () Bool)

(assert (=> b!799649 (= e!443392 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357037 () (_ BitVec 32))

(declare-datatypes ((array!43483 0))(
  ( (array!43484 (arr!20822 (Array (_ BitVec 32) (_ BitVec 64))) (size!21243 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43483)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8410 0))(
  ( (MissingZero!8410 (index!36008 (_ BitVec 32))) (Found!8410 (index!36009 (_ BitVec 32))) (Intermediate!8410 (undefined!9222 Bool) (index!36010 (_ BitVec 32)) (x!66891 (_ BitVec 32))) (Undefined!8410) (MissingVacant!8410 (index!36011 (_ BitVec 32))) )
))
(declare-fun lt!357040 () SeekEntryResult!8410)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43483 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!799649 (= lt!357040 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357037 vacantBefore!23 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799650 () Bool)

(declare-fun e!443387 () Bool)

(declare-fun e!443388 () Bool)

(assert (=> b!799650 (= e!443387 e!443388)))

(declare-fun res!544314 () Bool)

(assert (=> b!799650 (=> (not res!544314) (not e!443388))))

(declare-fun lt!357034 () SeekEntryResult!8410)

(declare-fun lt!357041 () SeekEntryResult!8410)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799650 (= res!544314 (and (= lt!357034 lt!357041) (= lt!357041 (Found!8410 j!153)) (not (= (select (arr!20822 a!3170) index!1236) (select (arr!20822 a!3170) j!153)))))))

(assert (=> b!799650 (= lt!357041 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43483 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!799650 (= lt!357034 (seekEntryOrOpen!0 (select (arr!20822 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799651 () Bool)

(declare-fun res!544312 () Bool)

(declare-fun e!443389 () Bool)

(assert (=> b!799651 (=> (not res!544312) (not e!443389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799651 (= res!544312 (validKeyInArray!0 (select (arr!20822 a!3170) j!153)))))

(declare-fun b!799652 () Bool)

(declare-fun res!544319 () Bool)

(assert (=> b!799652 (=> (not res!544319) (not e!443389))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!799652 (= res!544319 (validKeyInArray!0 k0!2044))))

(declare-fun b!799653 () Bool)

(declare-fun res!544317 () Bool)

(declare-fun e!443391 () Bool)

(assert (=> b!799653 (=> (not res!544317) (not e!443391))))

(declare-datatypes ((List!14824 0))(
  ( (Nil!14821) (Cons!14820 (h!15949 (_ BitVec 64)) (t!21130 List!14824)) )
))
(declare-fun arrayNoDuplicates!0 (array!43483 (_ BitVec 32) List!14824) Bool)

(assert (=> b!799653 (= res!544317 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14821))))

(declare-fun b!799654 () Bool)

(declare-fun res!544311 () Bool)

(assert (=> b!799654 (=> (not res!544311) (not e!443391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43483 (_ BitVec 32)) Bool)

(assert (=> b!799654 (= res!544311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799655 () Bool)

(assert (=> b!799655 (= e!443388 e!443392)))

(declare-fun res!544316 () Bool)

(assert (=> b!799655 (=> (not res!544316) (not e!443392))))

(assert (=> b!799655 (= res!544316 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357037 #b00000000000000000000000000000000) (bvslt lt!357037 (size!21243 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799655 (= lt!357037 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799657 () Bool)

(declare-fun res!544310 () Bool)

(assert (=> b!799657 (=> (not res!544310) (not e!443391))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799657 (= res!544310 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21243 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20822 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21243 a!3170)) (= (select (arr!20822 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799658 () Bool)

(declare-fun res!544308 () Bool)

(assert (=> b!799658 (=> (not res!544308) (not e!443389))))

(declare-fun arrayContainsKey!0 (array!43483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799658 (= res!544308 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799659 () Bool)

(declare-fun res!544315 () Bool)

(assert (=> b!799659 (=> (not res!544315) (not e!443392))))

(declare-fun lt!357036 () array!43483)

(declare-fun lt!357038 () SeekEntryResult!8410)

(declare-fun lt!357035 () (_ BitVec 64))

(assert (=> b!799659 (= res!544315 (= lt!357038 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357037 vacantAfter!23 lt!357035 lt!357036 mask!3266)))))

(declare-fun b!799660 () Bool)

(assert (=> b!799660 (= e!443391 e!443387)))

(declare-fun res!544313 () Bool)

(assert (=> b!799660 (=> (not res!544313) (not e!443387))))

(assert (=> b!799660 (= res!544313 (= lt!357038 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357035 lt!357036 mask!3266)))))

(assert (=> b!799660 (= lt!357038 (seekEntryOrOpen!0 lt!357035 lt!357036 mask!3266))))

(assert (=> b!799660 (= lt!357035 (select (store (arr!20822 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799660 (= lt!357036 (array!43484 (store (arr!20822 a!3170) i!1163 k0!2044) (size!21243 a!3170)))))

(declare-fun b!799661 () Bool)

(declare-fun res!544318 () Bool)

(assert (=> b!799661 (=> (not res!544318) (not e!443389))))

(assert (=> b!799661 (= res!544318 (and (= (size!21243 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21243 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21243 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!544309 () Bool)

(assert (=> start!68676 (=> (not res!544309) (not e!443389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68676 (= res!544309 (validMask!0 mask!3266))))

(assert (=> start!68676 e!443389))

(assert (=> start!68676 true))

(declare-fun array_inv!16705 (array!43483) Bool)

(assert (=> start!68676 (array_inv!16705 a!3170)))

(declare-fun b!799656 () Bool)

(assert (=> b!799656 (= e!443389 e!443391)))

(declare-fun res!544320 () Bool)

(assert (=> b!799656 (=> (not res!544320) (not e!443391))))

(declare-fun lt!357039 () SeekEntryResult!8410)

(assert (=> b!799656 (= res!544320 (or (= lt!357039 (MissingZero!8410 i!1163)) (= lt!357039 (MissingVacant!8410 i!1163))))))

(assert (=> b!799656 (= lt!357039 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68676 res!544309) b!799661))

(assert (= (and b!799661 res!544318) b!799651))

(assert (= (and b!799651 res!544312) b!799652))

(assert (= (and b!799652 res!544319) b!799658))

(assert (= (and b!799658 res!544308) b!799656))

(assert (= (and b!799656 res!544320) b!799654))

(assert (= (and b!799654 res!544311) b!799653))

(assert (= (and b!799653 res!544317) b!799657))

(assert (= (and b!799657 res!544310) b!799660))

(assert (= (and b!799660 res!544313) b!799650))

(assert (= (and b!799650 res!544314) b!799655))

(assert (= (and b!799655 res!544316) b!799659))

(assert (= (and b!799659 res!544315) b!799649))

(declare-fun m!740203 () Bool)

(assert (=> b!799658 m!740203))

(declare-fun m!740205 () Bool)

(assert (=> b!799660 m!740205))

(declare-fun m!740207 () Bool)

(assert (=> b!799660 m!740207))

(declare-fun m!740209 () Bool)

(assert (=> b!799660 m!740209))

(declare-fun m!740211 () Bool)

(assert (=> b!799660 m!740211))

(declare-fun m!740213 () Bool)

(assert (=> b!799650 m!740213))

(declare-fun m!740215 () Bool)

(assert (=> b!799650 m!740215))

(assert (=> b!799650 m!740215))

(declare-fun m!740217 () Bool)

(assert (=> b!799650 m!740217))

(assert (=> b!799650 m!740215))

(declare-fun m!740219 () Bool)

(assert (=> b!799650 m!740219))

(declare-fun m!740221 () Bool)

(assert (=> b!799654 m!740221))

(declare-fun m!740223 () Bool)

(assert (=> b!799656 m!740223))

(declare-fun m!740225 () Bool)

(assert (=> b!799659 m!740225))

(declare-fun m!740227 () Bool)

(assert (=> start!68676 m!740227))

(declare-fun m!740229 () Bool)

(assert (=> start!68676 m!740229))

(declare-fun m!740231 () Bool)

(assert (=> b!799652 m!740231))

(declare-fun m!740233 () Bool)

(assert (=> b!799655 m!740233))

(assert (=> b!799649 m!740215))

(assert (=> b!799649 m!740215))

(declare-fun m!740235 () Bool)

(assert (=> b!799649 m!740235))

(declare-fun m!740237 () Bool)

(assert (=> b!799653 m!740237))

(assert (=> b!799651 m!740215))

(assert (=> b!799651 m!740215))

(declare-fun m!740239 () Bool)

(assert (=> b!799651 m!740239))

(declare-fun m!740241 () Bool)

(assert (=> b!799657 m!740241))

(declare-fun m!740243 () Bool)

(assert (=> b!799657 m!740243))

(check-sat (not b!799649) (not b!799650) (not b!799658) (not b!799653) (not b!799659) (not start!68676) (not b!799652) (not b!799660) (not b!799656) (not b!799654) (not b!799651) (not b!799655))
(check-sat)
