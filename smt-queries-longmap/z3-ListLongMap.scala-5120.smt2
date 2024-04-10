; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69544 () Bool)

(assert start!69544)

(declare-fun b!810392 () Bool)

(declare-fun res!553680 () Bool)

(declare-fun e!448577 () Bool)

(assert (=> b!810392 (=> (not res!553680) (not e!448577))))

(declare-datatypes ((SeekEntryResult!8682 0))(
  ( (MissingZero!8682 (index!37096 (_ BitVec 32))) (Found!8682 (index!37097 (_ BitVec 32))) (Intermediate!8682 (undefined!9494 Bool) (index!37098 (_ BitVec 32)) (x!67910 (_ BitVec 32))) (Undefined!8682) (MissingVacant!8682 (index!37099 (_ BitVec 32))) )
))
(declare-fun lt!363194 () SeekEntryResult!8682)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363193 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363191 () (_ BitVec 64))

(declare-datatypes ((array!44040 0))(
  ( (array!44041 (arr!21091 (Array (_ BitVec 32) (_ BitVec 64))) (size!21512 (_ BitVec 32))) )
))
(declare-fun lt!363195 () array!44040)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44040 (_ BitVec 32)) SeekEntryResult!8682)

(assert (=> b!810392 (= res!553680 (= lt!363194 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363193 vacantAfter!23 lt!363191 lt!363195 mask!3266)))))

(declare-fun b!810393 () Bool)

(declare-fun res!553673 () Bool)

(declare-fun e!448581 () Bool)

(assert (=> b!810393 (=> (not res!553673) (not e!448581))))

(declare-fun a!3170 () array!44040)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810393 (= res!553673 (validKeyInArray!0 (select (arr!21091 a!3170) j!153)))))

(declare-fun b!810394 () Bool)

(declare-fun res!553682 () Bool)

(assert (=> b!810394 (=> (not res!553682) (not e!448581))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810394 (= res!553682 (validKeyInArray!0 k0!2044))))

(declare-fun b!810395 () Bool)

(declare-fun res!553677 () Bool)

(declare-fun e!448580 () Bool)

(assert (=> b!810395 (=> (not res!553677) (not e!448580))))

(declare-datatypes ((List!15054 0))(
  ( (Nil!15051) (Cons!15050 (h!16179 (_ BitVec 64)) (t!21369 List!15054)) )
))
(declare-fun arrayNoDuplicates!0 (array!44040 (_ BitVec 32) List!15054) Bool)

(assert (=> b!810395 (= res!553677 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15051))))

(declare-fun b!810396 () Bool)

(declare-fun res!553671 () Bool)

(assert (=> b!810396 (=> (not res!553671) (not e!448580))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810396 (= res!553671 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21512 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21091 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21512 a!3170)) (= (select (arr!21091 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810398 () Bool)

(declare-fun e!448582 () Bool)

(declare-fun e!448579 () Bool)

(assert (=> b!810398 (= e!448582 e!448579)))

(declare-fun res!553672 () Bool)

(assert (=> b!810398 (=> (not res!553672) (not e!448579))))

(declare-fun lt!363197 () SeekEntryResult!8682)

(declare-fun lt!363192 () SeekEntryResult!8682)

(assert (=> b!810398 (= res!553672 (and (= lt!363192 lt!363197) (not (= (select (arr!21091 a!3170) index!1236) (select (arr!21091 a!3170) j!153)))))))

(assert (=> b!810398 (= lt!363197 (Found!8682 j!153))))

(declare-fun b!810399 () Bool)

(assert (=> b!810399 (= e!448581 e!448580)))

(declare-fun res!553670 () Bool)

(assert (=> b!810399 (=> (not res!553670) (not e!448580))))

(declare-fun lt!363190 () SeekEntryResult!8682)

(assert (=> b!810399 (= res!553670 (or (= lt!363190 (MissingZero!8682 i!1163)) (= lt!363190 (MissingVacant!8682 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44040 (_ BitVec 32)) SeekEntryResult!8682)

(assert (=> b!810399 (= lt!363190 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810400 () Bool)

(declare-fun res!553676 () Bool)

(assert (=> b!810400 (=> (not res!553676) (not e!448581))))

(declare-fun arrayContainsKey!0 (array!44040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810400 (= res!553676 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!363189 () SeekEntryResult!8682)

(declare-fun lt!363196 () SeekEntryResult!8682)

(declare-fun b!810401 () Bool)

(assert (=> b!810401 (= e!448577 (and (= lt!363189 lt!363196) (not (= lt!363196 lt!363197))))))

(assert (=> b!810401 (= lt!363196 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363193 vacantBefore!23 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810402 () Bool)

(declare-fun e!448578 () Bool)

(assert (=> b!810402 (= e!448578 e!448582)))

(declare-fun res!553679 () Bool)

(assert (=> b!810402 (=> (not res!553679) (not e!448582))))

(assert (=> b!810402 (= res!553679 (= lt!363189 lt!363192))))

(assert (=> b!810402 (= lt!363192 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810402 (= lt!363189 (seekEntryOrOpen!0 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810403 () Bool)

(declare-fun res!553669 () Bool)

(assert (=> b!810403 (=> (not res!553669) (not e!448580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44040 (_ BitVec 32)) Bool)

(assert (=> b!810403 (= res!553669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!553674 () Bool)

(assert (=> start!69544 (=> (not res!553674) (not e!448581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69544 (= res!553674 (validMask!0 mask!3266))))

(assert (=> start!69544 e!448581))

(assert (=> start!69544 true))

(declare-fun array_inv!16887 (array!44040) Bool)

(assert (=> start!69544 (array_inv!16887 a!3170)))

(declare-fun b!810397 () Bool)

(declare-fun res!553678 () Bool)

(assert (=> b!810397 (=> (not res!553678) (not e!448581))))

(assert (=> b!810397 (= res!553678 (and (= (size!21512 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21512 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21512 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810404 () Bool)

(assert (=> b!810404 (= e!448580 e!448578)))

(declare-fun res!553675 () Bool)

(assert (=> b!810404 (=> (not res!553675) (not e!448578))))

(assert (=> b!810404 (= res!553675 (= lt!363194 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363191 lt!363195 mask!3266)))))

(assert (=> b!810404 (= lt!363194 (seekEntryOrOpen!0 lt!363191 lt!363195 mask!3266))))

(assert (=> b!810404 (= lt!363191 (select (store (arr!21091 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810404 (= lt!363195 (array!44041 (store (arr!21091 a!3170) i!1163 k0!2044) (size!21512 a!3170)))))

(declare-fun b!810405 () Bool)

(assert (=> b!810405 (= e!448579 e!448577)))

(declare-fun res!553681 () Bool)

(assert (=> b!810405 (=> (not res!553681) (not e!448577))))

(assert (=> b!810405 (= res!553681 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363193 #b00000000000000000000000000000000) (bvslt lt!363193 (size!21512 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810405 (= lt!363193 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69544 res!553674) b!810397))

(assert (= (and b!810397 res!553678) b!810393))

(assert (= (and b!810393 res!553673) b!810394))

(assert (= (and b!810394 res!553682) b!810400))

(assert (= (and b!810400 res!553676) b!810399))

(assert (= (and b!810399 res!553670) b!810403))

(assert (= (and b!810403 res!553669) b!810395))

(assert (= (and b!810395 res!553677) b!810396))

(assert (= (and b!810396 res!553671) b!810404))

(assert (= (and b!810404 res!553675) b!810402))

(assert (= (and b!810402 res!553679) b!810398))

(assert (= (and b!810398 res!553672) b!810405))

(assert (= (and b!810405 res!553681) b!810392))

(assert (= (and b!810392 res!553680) b!810401))

(declare-fun m!752579 () Bool)

(assert (=> b!810395 m!752579))

(declare-fun m!752581 () Bool)

(assert (=> b!810401 m!752581))

(assert (=> b!810401 m!752581))

(declare-fun m!752583 () Bool)

(assert (=> b!810401 m!752583))

(declare-fun m!752585 () Bool)

(assert (=> start!69544 m!752585))

(declare-fun m!752587 () Bool)

(assert (=> start!69544 m!752587))

(assert (=> b!810393 m!752581))

(assert (=> b!810393 m!752581))

(declare-fun m!752589 () Bool)

(assert (=> b!810393 m!752589))

(declare-fun m!752591 () Bool)

(assert (=> b!810396 m!752591))

(declare-fun m!752593 () Bool)

(assert (=> b!810396 m!752593))

(declare-fun m!752595 () Bool)

(assert (=> b!810394 m!752595))

(declare-fun m!752597 () Bool)

(assert (=> b!810400 m!752597))

(declare-fun m!752599 () Bool)

(assert (=> b!810398 m!752599))

(assert (=> b!810398 m!752581))

(assert (=> b!810402 m!752581))

(assert (=> b!810402 m!752581))

(declare-fun m!752601 () Bool)

(assert (=> b!810402 m!752601))

(assert (=> b!810402 m!752581))

(declare-fun m!752603 () Bool)

(assert (=> b!810402 m!752603))

(declare-fun m!752605 () Bool)

(assert (=> b!810403 m!752605))

(declare-fun m!752607 () Bool)

(assert (=> b!810404 m!752607))

(declare-fun m!752609 () Bool)

(assert (=> b!810404 m!752609))

(declare-fun m!752611 () Bool)

(assert (=> b!810404 m!752611))

(declare-fun m!752613 () Bool)

(assert (=> b!810404 m!752613))

(declare-fun m!752615 () Bool)

(assert (=> b!810399 m!752615))

(declare-fun m!752617 () Bool)

(assert (=> b!810405 m!752617))

(declare-fun m!752619 () Bool)

(assert (=> b!810392 m!752619))

(check-sat (not b!810392) (not b!810393) (not b!810403) (not b!810399) (not b!810401) (not b!810394) (not b!810404) (not start!69544) (not b!810395) (not b!810405) (not b!810400) (not b!810402))
(check-sat)
