; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68736 () Bool)

(assert start!68736)

(declare-fun b!800819 () Bool)

(declare-fun res!545484 () Bool)

(declare-fun e!443930 () Bool)

(assert (=> b!800819 (=> (not res!545484) (not e!443930))))

(declare-datatypes ((array!43543 0))(
  ( (array!43544 (arr!20852 (Array (_ BitVec 32) (_ BitVec 64))) (size!21273 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43543)

(declare-datatypes ((List!14854 0))(
  ( (Nil!14851) (Cons!14850 (h!15979 (_ BitVec 64)) (t!21160 List!14854)) )
))
(declare-fun arrayNoDuplicates!0 (array!43543 (_ BitVec 32) List!14854) Bool)

(assert (=> b!800819 (= res!545484 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14851))))

(declare-fun res!545483 () Bool)

(declare-fun e!443932 () Bool)

(assert (=> start!68736 (=> (not res!545483) (not e!443932))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68736 (= res!545483 (validMask!0 mask!3266))))

(assert (=> start!68736 e!443932))

(assert (=> start!68736 true))

(declare-fun array_inv!16735 (array!43543) Bool)

(assert (=> start!68736 (array_inv!16735 a!3170)))

(declare-fun b!800820 () Bool)

(declare-fun e!443929 () Bool)

(declare-fun e!443931 () Bool)

(assert (=> b!800820 (= e!443929 e!443931)))

(declare-fun res!545478 () Bool)

(assert (=> b!800820 (=> (not res!545478) (not e!443931))))

(declare-datatypes ((SeekEntryResult!8440 0))(
  ( (MissingZero!8440 (index!36128 (_ BitVec 32))) (Found!8440 (index!36129 (_ BitVec 32))) (Intermediate!8440 (undefined!9252 Bool) (index!36130 (_ BitVec 32)) (x!67001 (_ BitVec 32))) (Undefined!8440) (MissingVacant!8440 (index!36131 (_ BitVec 32))) )
))
(declare-fun lt!357761 () SeekEntryResult!8440)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357757 () SeekEntryResult!8440)

(assert (=> b!800820 (= res!545478 (and (= lt!357757 lt!357761) (= lt!357761 (Found!8440 j!153)) (not (= (select (arr!20852 a!3170) index!1236) (select (arr!20852 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43543 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!800820 (= lt!357761 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43543 (_ BitVec 32)) SeekEntryResult!8440)

(assert (=> b!800820 (= lt!357757 (seekEntryOrOpen!0 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800821 () Bool)

(declare-fun res!545490 () Bool)

(assert (=> b!800821 (=> (not res!545490) (not e!443932))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800821 (= res!545490 (and (= (size!21273 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21273 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21273 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800822 () Bool)

(declare-fun res!545485 () Bool)

(assert (=> b!800822 (=> (not res!545485) (not e!443930))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!800822 (= res!545485 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21273 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20852 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21273 a!3170)) (= (select (arr!20852 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800823 () Bool)

(declare-fun res!545489 () Bool)

(declare-fun e!443928 () Bool)

(assert (=> b!800823 (=> (not res!545489) (not e!443928))))

(declare-fun lt!357754 () array!43543)

(declare-fun lt!357760 () SeekEntryResult!8440)

(declare-fun lt!357758 () (_ BitVec 64))

(declare-fun lt!357756 () (_ BitVec 32))

(assert (=> b!800823 (= res!545489 (= lt!357760 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357756 vacantAfter!23 lt!357758 lt!357754 mask!3266)))))

(declare-fun b!800824 () Bool)

(assert (=> b!800824 (= e!443930 e!443929)))

(declare-fun res!545486 () Bool)

(assert (=> b!800824 (=> (not res!545486) (not e!443929))))

(assert (=> b!800824 (= res!545486 (= lt!357760 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357758 lt!357754 mask!3266)))))

(assert (=> b!800824 (= lt!357760 (seekEntryOrOpen!0 lt!357758 lt!357754 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!800824 (= lt!357758 (select (store (arr!20852 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800824 (= lt!357754 (array!43544 (store (arr!20852 a!3170) i!1163 k0!2044) (size!21273 a!3170)))))

(declare-fun b!800825 () Bool)

(declare-fun res!545482 () Bool)

(assert (=> b!800825 (=> (not res!545482) (not e!443932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800825 (= res!545482 (validKeyInArray!0 k0!2044))))

(declare-fun b!800826 () Bool)

(assert (=> b!800826 (= e!443928 false)))

(declare-fun lt!357759 () SeekEntryResult!8440)

(assert (=> b!800826 (= lt!357759 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357756 vacantBefore!23 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800827 () Bool)

(assert (=> b!800827 (= e!443931 e!443928)))

(declare-fun res!545487 () Bool)

(assert (=> b!800827 (=> (not res!545487) (not e!443928))))

(assert (=> b!800827 (= res!545487 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357756 #b00000000000000000000000000000000) (bvslt lt!357756 (size!21273 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800827 (= lt!357756 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800828 () Bool)

(declare-fun res!545488 () Bool)

(assert (=> b!800828 (=> (not res!545488) (not e!443932))))

(declare-fun arrayContainsKey!0 (array!43543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800828 (= res!545488 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800829 () Bool)

(assert (=> b!800829 (= e!443932 e!443930)))

(declare-fun res!545479 () Bool)

(assert (=> b!800829 (=> (not res!545479) (not e!443930))))

(declare-fun lt!357755 () SeekEntryResult!8440)

(assert (=> b!800829 (= res!545479 (or (= lt!357755 (MissingZero!8440 i!1163)) (= lt!357755 (MissingVacant!8440 i!1163))))))

(assert (=> b!800829 (= lt!357755 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800830 () Bool)

(declare-fun res!545480 () Bool)

(assert (=> b!800830 (=> (not res!545480) (not e!443930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43543 (_ BitVec 32)) Bool)

(assert (=> b!800830 (= res!545480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800831 () Bool)

(declare-fun res!545481 () Bool)

(assert (=> b!800831 (=> (not res!545481) (not e!443932))))

(assert (=> b!800831 (= res!545481 (validKeyInArray!0 (select (arr!20852 a!3170) j!153)))))

(assert (= (and start!68736 res!545483) b!800821))

(assert (= (and b!800821 res!545490) b!800831))

(assert (= (and b!800831 res!545481) b!800825))

(assert (= (and b!800825 res!545482) b!800828))

(assert (= (and b!800828 res!545488) b!800829))

(assert (= (and b!800829 res!545479) b!800830))

(assert (= (and b!800830 res!545480) b!800819))

(assert (= (and b!800819 res!545484) b!800822))

(assert (= (and b!800822 res!545485) b!800824))

(assert (= (and b!800824 res!545486) b!800820))

(assert (= (and b!800820 res!545478) b!800827))

(assert (= (and b!800827 res!545487) b!800823))

(assert (= (and b!800823 res!545489) b!800826))

(declare-fun m!741463 () Bool)

(assert (=> b!800830 m!741463))

(declare-fun m!741465 () Bool)

(assert (=> b!800819 m!741465))

(declare-fun m!741467 () Bool)

(assert (=> b!800827 m!741467))

(declare-fun m!741469 () Bool)

(assert (=> b!800823 m!741469))

(declare-fun m!741471 () Bool)

(assert (=> b!800828 m!741471))

(declare-fun m!741473 () Bool)

(assert (=> b!800822 m!741473))

(declare-fun m!741475 () Bool)

(assert (=> b!800822 m!741475))

(declare-fun m!741477 () Bool)

(assert (=> b!800826 m!741477))

(assert (=> b!800826 m!741477))

(declare-fun m!741479 () Bool)

(assert (=> b!800826 m!741479))

(assert (=> b!800831 m!741477))

(assert (=> b!800831 m!741477))

(declare-fun m!741481 () Bool)

(assert (=> b!800831 m!741481))

(declare-fun m!741483 () Bool)

(assert (=> start!68736 m!741483))

(declare-fun m!741485 () Bool)

(assert (=> start!68736 m!741485))

(declare-fun m!741487 () Bool)

(assert (=> b!800825 m!741487))

(declare-fun m!741489 () Bool)

(assert (=> b!800820 m!741489))

(assert (=> b!800820 m!741477))

(assert (=> b!800820 m!741477))

(declare-fun m!741491 () Bool)

(assert (=> b!800820 m!741491))

(assert (=> b!800820 m!741477))

(declare-fun m!741493 () Bool)

(assert (=> b!800820 m!741493))

(declare-fun m!741495 () Bool)

(assert (=> b!800824 m!741495))

(declare-fun m!741497 () Bool)

(assert (=> b!800824 m!741497))

(declare-fun m!741499 () Bool)

(assert (=> b!800824 m!741499))

(declare-fun m!741501 () Bool)

(assert (=> b!800824 m!741501))

(declare-fun m!741503 () Bool)

(assert (=> b!800829 m!741503))

(check-sat (not b!800823) (not b!800819) (not b!800826) (not b!800829) (not b!800827) (not b!800828) (not b!800825) (not b!800820) (not start!68736) (not b!800831) (not b!800824) (not b!800830))
(check-sat)
