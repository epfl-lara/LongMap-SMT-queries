; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68724 () Bool)

(assert start!68724)

(declare-fun b!800585 () Bool)

(declare-fun res!545252 () Bool)

(declare-fun e!443822 () Bool)

(assert (=> b!800585 (=> (not res!545252) (not e!443822))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800585 (= res!545252 (validKeyInArray!0 k0!2044))))

(declare-fun b!800586 () Bool)

(declare-fun e!443819 () Bool)

(declare-fun e!443820 () Bool)

(assert (=> b!800586 (= e!443819 e!443820)))

(declare-fun res!545253 () Bool)

(assert (=> b!800586 (=> (not res!545253) (not e!443820))))

(declare-datatypes ((SeekEntryResult!8434 0))(
  ( (MissingZero!8434 (index!36104 (_ BitVec 32))) (Found!8434 (index!36105 (_ BitVec 32))) (Intermediate!8434 (undefined!9246 Bool) (index!36106 (_ BitVec 32)) (x!66979 (_ BitVec 32))) (Undefined!8434) (MissingVacant!8434 (index!36107 (_ BitVec 32))) )
))
(declare-fun lt!357610 () SeekEntryResult!8434)

(declare-fun lt!357615 () SeekEntryResult!8434)

(declare-datatypes ((array!43531 0))(
  ( (array!43532 (arr!20846 (Array (_ BitVec 32) (_ BitVec 64))) (size!21267 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43531)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800586 (= res!545253 (and (= lt!357615 lt!357610) (= lt!357610 (Found!8434 j!153)) (not (= (select (arr!20846 a!3170) index!1236) (select (arr!20846 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43531 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!800586 (= lt!357610 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43531 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!800586 (= lt!357615 (seekEntryOrOpen!0 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800587 () Bool)

(declare-fun e!443821 () Bool)

(assert (=> b!800587 (= e!443822 e!443821)))

(declare-fun res!545248 () Bool)

(assert (=> b!800587 (=> (not res!545248) (not e!443821))))

(declare-fun lt!357617 () SeekEntryResult!8434)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800587 (= res!545248 (or (= lt!357617 (MissingZero!8434 i!1163)) (= lt!357617 (MissingVacant!8434 i!1163))))))

(assert (=> b!800587 (= lt!357617 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800588 () Bool)

(declare-fun res!545244 () Bool)

(assert (=> b!800588 (=> (not res!545244) (not e!443822))))

(declare-fun arrayContainsKey!0 (array!43531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800588 (= res!545244 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800589 () Bool)

(declare-fun e!443823 () Bool)

(assert (=> b!800589 (= e!443820 e!443823)))

(declare-fun res!545256 () Bool)

(assert (=> b!800589 (=> (not res!545256) (not e!443823))))

(declare-fun lt!357612 () (_ BitVec 32))

(assert (=> b!800589 (= res!545256 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357612 #b00000000000000000000000000000000) (bvslt lt!357612 (size!21267 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800589 (= lt!357612 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!545250 () Bool)

(assert (=> start!68724 (=> (not res!545250) (not e!443822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68724 (= res!545250 (validMask!0 mask!3266))))

(assert (=> start!68724 e!443822))

(assert (=> start!68724 true))

(declare-fun array_inv!16729 (array!43531) Bool)

(assert (=> start!68724 (array_inv!16729 a!3170)))

(declare-fun b!800590 () Bool)

(declare-fun res!545251 () Bool)

(assert (=> b!800590 (=> (not res!545251) (not e!443823))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357611 () SeekEntryResult!8434)

(declare-fun lt!357614 () (_ BitVec 64))

(declare-fun lt!357616 () array!43531)

(assert (=> b!800590 (= res!545251 (= lt!357611 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357612 vacantAfter!23 lt!357614 lt!357616 mask!3266)))))

(declare-fun b!800591 () Bool)

(declare-fun res!545247 () Bool)

(assert (=> b!800591 (=> (not res!545247) (not e!443822))))

(assert (=> b!800591 (= res!545247 (and (= (size!21267 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21267 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21267 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800592 () Bool)

(assert (=> b!800592 (= e!443821 e!443819)))

(declare-fun res!545249 () Bool)

(assert (=> b!800592 (=> (not res!545249) (not e!443819))))

(assert (=> b!800592 (= res!545249 (= lt!357611 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357614 lt!357616 mask!3266)))))

(assert (=> b!800592 (= lt!357611 (seekEntryOrOpen!0 lt!357614 lt!357616 mask!3266))))

(assert (=> b!800592 (= lt!357614 (select (store (arr!20846 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800592 (= lt!357616 (array!43532 (store (arr!20846 a!3170) i!1163 k0!2044) (size!21267 a!3170)))))

(declare-fun b!800593 () Bool)

(assert (=> b!800593 (= e!443823 false)))

(declare-fun lt!357613 () SeekEntryResult!8434)

(assert (=> b!800593 (= lt!357613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357612 vacantBefore!23 (select (arr!20846 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800594 () Bool)

(declare-fun res!545254 () Bool)

(assert (=> b!800594 (=> (not res!545254) (not e!443822))))

(assert (=> b!800594 (= res!545254 (validKeyInArray!0 (select (arr!20846 a!3170) j!153)))))

(declare-fun b!800595 () Bool)

(declare-fun res!545245 () Bool)

(assert (=> b!800595 (=> (not res!545245) (not e!443821))))

(declare-datatypes ((List!14848 0))(
  ( (Nil!14845) (Cons!14844 (h!15973 (_ BitVec 64)) (t!21154 List!14848)) )
))
(declare-fun arrayNoDuplicates!0 (array!43531 (_ BitVec 32) List!14848) Bool)

(assert (=> b!800595 (= res!545245 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14845))))

(declare-fun b!800596 () Bool)

(declare-fun res!545246 () Bool)

(assert (=> b!800596 (=> (not res!545246) (not e!443821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43531 (_ BitVec 32)) Bool)

(assert (=> b!800596 (= res!545246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800597 () Bool)

(declare-fun res!545255 () Bool)

(assert (=> b!800597 (=> (not res!545255) (not e!443821))))

(assert (=> b!800597 (= res!545255 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21267 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20846 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21267 a!3170)) (= (select (arr!20846 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68724 res!545250) b!800591))

(assert (= (and b!800591 res!545247) b!800594))

(assert (= (and b!800594 res!545254) b!800585))

(assert (= (and b!800585 res!545252) b!800588))

(assert (= (and b!800588 res!545244) b!800587))

(assert (= (and b!800587 res!545248) b!800596))

(assert (= (and b!800596 res!545246) b!800595))

(assert (= (and b!800595 res!545245) b!800597))

(assert (= (and b!800597 res!545255) b!800592))

(assert (= (and b!800592 res!545249) b!800586))

(assert (= (and b!800586 res!545253) b!800589))

(assert (= (and b!800589 res!545256) b!800590))

(assert (= (and b!800590 res!545251) b!800593))

(declare-fun m!741211 () Bool)

(assert (=> b!800594 m!741211))

(assert (=> b!800594 m!741211))

(declare-fun m!741213 () Bool)

(assert (=> b!800594 m!741213))

(declare-fun m!741215 () Bool)

(assert (=> start!68724 m!741215))

(declare-fun m!741217 () Bool)

(assert (=> start!68724 m!741217))

(declare-fun m!741219 () Bool)

(assert (=> b!800592 m!741219))

(declare-fun m!741221 () Bool)

(assert (=> b!800592 m!741221))

(declare-fun m!741223 () Bool)

(assert (=> b!800592 m!741223))

(declare-fun m!741225 () Bool)

(assert (=> b!800592 m!741225))

(assert (=> b!800593 m!741211))

(assert (=> b!800593 m!741211))

(declare-fun m!741227 () Bool)

(assert (=> b!800593 m!741227))

(declare-fun m!741229 () Bool)

(assert (=> b!800590 m!741229))

(declare-fun m!741231 () Bool)

(assert (=> b!800585 m!741231))

(declare-fun m!741233 () Bool)

(assert (=> b!800586 m!741233))

(assert (=> b!800586 m!741211))

(assert (=> b!800586 m!741211))

(declare-fun m!741235 () Bool)

(assert (=> b!800586 m!741235))

(assert (=> b!800586 m!741211))

(declare-fun m!741237 () Bool)

(assert (=> b!800586 m!741237))

(declare-fun m!741239 () Bool)

(assert (=> b!800597 m!741239))

(declare-fun m!741241 () Bool)

(assert (=> b!800597 m!741241))

(declare-fun m!741243 () Bool)

(assert (=> b!800589 m!741243))

(declare-fun m!741245 () Bool)

(assert (=> b!800588 m!741245))

(declare-fun m!741247 () Bool)

(assert (=> b!800596 m!741247))

(declare-fun m!741249 () Bool)

(assert (=> b!800595 m!741249))

(declare-fun m!741251 () Bool)

(assert (=> b!800587 m!741251))

(check-sat (not b!800586) (not b!800588) (not start!68724) (not b!800585) (not b!800589) (not b!800596) (not b!800590) (not b!800592) (not b!800593) (not b!800587) (not b!800595) (not b!800594))
(check-sat)
