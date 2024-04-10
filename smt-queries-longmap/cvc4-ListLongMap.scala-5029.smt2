; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68688 () Bool)

(assert start!68688)

(declare-fun b!799743 () Bool)

(declare-fun e!443471 () Bool)

(assert (=> b!799743 (= e!443471 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43478 0))(
  ( (array!43479 (arr!20819 (Array (_ BitVec 32) (_ BitVec 64))) (size!21240 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43478)

(declare-datatypes ((SeekEntryResult!8410 0))(
  ( (MissingZero!8410 (index!36008 (_ BitVec 32))) (Found!8410 (index!36009 (_ BitVec 32))) (Intermediate!8410 (undefined!9222 Bool) (index!36010 (_ BitVec 32)) (x!66880 (_ BitVec 32))) (Undefined!8410) (MissingVacant!8410 (index!36011 (_ BitVec 32))) )
))
(declare-fun lt!357179 () SeekEntryResult!8410)

(declare-fun lt!357183 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43478 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!799743 (= lt!357179 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357183 vacantBefore!23 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799744 () Bool)

(declare-fun res!544272 () Bool)

(declare-fun e!443470 () Bool)

(assert (=> b!799744 (=> (not res!544272) (not e!443470))))

(declare-datatypes ((List!14782 0))(
  ( (Nil!14779) (Cons!14778 (h!15907 (_ BitVec 64)) (t!21097 List!14782)) )
))
(declare-fun arrayNoDuplicates!0 (array!43478 (_ BitVec 32) List!14782) Bool)

(assert (=> b!799744 (= res!544272 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14779))))

(declare-fun b!799745 () Bool)

(declare-fun e!443473 () Bool)

(assert (=> b!799745 (= e!443473 e!443471)))

(declare-fun res!544270 () Bool)

(assert (=> b!799745 (=> (not res!544270) (not e!443471))))

(assert (=> b!799745 (= res!544270 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357183 #b00000000000000000000000000000000) (bvslt lt!357183 (size!21240 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799745 (= lt!357183 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544265 () Bool)

(declare-fun e!443469 () Bool)

(assert (=> start!68688 (=> (not res!544265) (not e!443469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68688 (= res!544265 (validMask!0 mask!3266))))

(assert (=> start!68688 e!443469))

(assert (=> start!68688 true))

(declare-fun array_inv!16615 (array!43478) Bool)

(assert (=> start!68688 (array_inv!16615 a!3170)))

(declare-fun b!799746 () Bool)

(declare-fun res!544269 () Bool)

(assert (=> b!799746 (=> (not res!544269) (not e!443470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43478 (_ BitVec 32)) Bool)

(assert (=> b!799746 (= res!544269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799747 () Bool)

(declare-fun res!544267 () Bool)

(assert (=> b!799747 (=> (not res!544267) (not e!443470))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799747 (= res!544267 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21240 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20819 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21240 a!3170)) (= (select (arr!20819 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799748 () Bool)

(declare-fun e!443474 () Bool)

(assert (=> b!799748 (= e!443474 e!443473)))

(declare-fun res!544262 () Bool)

(assert (=> b!799748 (=> (not res!544262) (not e!443473))))

(declare-fun lt!357185 () SeekEntryResult!8410)

(declare-fun lt!357182 () SeekEntryResult!8410)

(assert (=> b!799748 (= res!544262 (and (= lt!357182 lt!357185) (= lt!357185 (Found!8410 j!153)) (not (= (select (arr!20819 a!3170) index!1236) (select (arr!20819 a!3170) j!153)))))))

(assert (=> b!799748 (= lt!357185 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43478 (_ BitVec 32)) SeekEntryResult!8410)

(assert (=> b!799748 (= lt!357182 (seekEntryOrOpen!0 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799749 () Bool)

(declare-fun res!544274 () Bool)

(assert (=> b!799749 (=> (not res!544274) (not e!443469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799749 (= res!544274 (validKeyInArray!0 (select (arr!20819 a!3170) j!153)))))

(declare-fun b!799750 () Bool)

(declare-fun res!544268 () Bool)

(assert (=> b!799750 (=> (not res!544268) (not e!443469))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!799750 (= res!544268 (validKeyInArray!0 k!2044))))

(declare-fun b!799751 () Bool)

(assert (=> b!799751 (= e!443469 e!443470)))

(declare-fun res!544271 () Bool)

(assert (=> b!799751 (=> (not res!544271) (not e!443470))))

(declare-fun lt!357178 () SeekEntryResult!8410)

(assert (=> b!799751 (= res!544271 (or (= lt!357178 (MissingZero!8410 i!1163)) (= lt!357178 (MissingVacant!8410 i!1163))))))

(assert (=> b!799751 (= lt!357178 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799752 () Bool)

(assert (=> b!799752 (= e!443470 e!443474)))

(declare-fun res!544264 () Bool)

(assert (=> b!799752 (=> (not res!544264) (not e!443474))))

(declare-fun lt!357184 () (_ BitVec 64))

(declare-fun lt!357180 () array!43478)

(declare-fun lt!357181 () SeekEntryResult!8410)

(assert (=> b!799752 (= res!544264 (= lt!357181 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357184 lt!357180 mask!3266)))))

(assert (=> b!799752 (= lt!357181 (seekEntryOrOpen!0 lt!357184 lt!357180 mask!3266))))

(assert (=> b!799752 (= lt!357184 (select (store (arr!20819 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799752 (= lt!357180 (array!43479 (store (arr!20819 a!3170) i!1163 k!2044) (size!21240 a!3170)))))

(declare-fun b!799753 () Bool)

(declare-fun res!544273 () Bool)

(assert (=> b!799753 (=> (not res!544273) (not e!443469))))

(declare-fun arrayContainsKey!0 (array!43478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799753 (= res!544273 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799754 () Bool)

(declare-fun res!544266 () Bool)

(assert (=> b!799754 (=> (not res!544266) (not e!443469))))

(assert (=> b!799754 (= res!544266 (and (= (size!21240 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21240 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21240 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799755 () Bool)

(declare-fun res!544263 () Bool)

(assert (=> b!799755 (=> (not res!544263) (not e!443471))))

(assert (=> b!799755 (= res!544263 (= lt!357181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357183 vacantAfter!23 lt!357184 lt!357180 mask!3266)))))

(assert (= (and start!68688 res!544265) b!799754))

(assert (= (and b!799754 res!544266) b!799749))

(assert (= (and b!799749 res!544274) b!799750))

(assert (= (and b!799750 res!544268) b!799753))

(assert (= (and b!799753 res!544273) b!799751))

(assert (= (and b!799751 res!544271) b!799746))

(assert (= (and b!799746 res!544269) b!799744))

(assert (= (and b!799744 res!544272) b!799747))

(assert (= (and b!799747 res!544267) b!799752))

(assert (= (and b!799752 res!544264) b!799748))

(assert (= (and b!799748 res!544262) b!799745))

(assert (= (and b!799745 res!544270) b!799755))

(assert (= (and b!799755 res!544263) b!799743))

(declare-fun m!740777 () Bool)

(assert (=> b!799747 m!740777))

(declare-fun m!740779 () Bool)

(assert (=> b!799747 m!740779))

(declare-fun m!740781 () Bool)

(assert (=> start!68688 m!740781))

(declare-fun m!740783 () Bool)

(assert (=> start!68688 m!740783))

(declare-fun m!740785 () Bool)

(assert (=> b!799753 m!740785))

(declare-fun m!740787 () Bool)

(assert (=> b!799755 m!740787))

(declare-fun m!740789 () Bool)

(assert (=> b!799750 m!740789))

(declare-fun m!740791 () Bool)

(assert (=> b!799752 m!740791))

(declare-fun m!740793 () Bool)

(assert (=> b!799752 m!740793))

(declare-fun m!740795 () Bool)

(assert (=> b!799752 m!740795))

(declare-fun m!740797 () Bool)

(assert (=> b!799752 m!740797))

(declare-fun m!740799 () Bool)

(assert (=> b!799743 m!740799))

(assert (=> b!799743 m!740799))

(declare-fun m!740801 () Bool)

(assert (=> b!799743 m!740801))

(declare-fun m!740803 () Bool)

(assert (=> b!799745 m!740803))

(declare-fun m!740805 () Bool)

(assert (=> b!799746 m!740805))

(assert (=> b!799749 m!740799))

(assert (=> b!799749 m!740799))

(declare-fun m!740807 () Bool)

(assert (=> b!799749 m!740807))

(declare-fun m!740809 () Bool)

(assert (=> b!799751 m!740809))

(declare-fun m!740811 () Bool)

(assert (=> b!799744 m!740811))

(declare-fun m!740813 () Bool)

(assert (=> b!799748 m!740813))

(assert (=> b!799748 m!740799))

(assert (=> b!799748 m!740799))

(declare-fun m!740815 () Bool)

(assert (=> b!799748 m!740815))

(assert (=> b!799748 m!740799))

(declare-fun m!740817 () Bool)

(assert (=> b!799748 m!740817))

(push 1)

(assert (not b!799752))

(assert (not b!799753))

(assert (not b!799746))

(assert (not b!799755))

(assert (not b!799745))

(assert (not b!799748))

