; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68684 () Bool)

(assert start!68684)

(declare-fun b!799665 () Bool)

(declare-fun res!544186 () Bool)

(declare-fun e!443436 () Bool)

(assert (=> b!799665 (=> (not res!544186) (not e!443436))))

(declare-datatypes ((array!43474 0))(
  ( (array!43475 (arr!20817 (Array (_ BitVec 32) (_ BitVec 64))) (size!21238 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43474)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799665 (= res!544186 (validKeyInArray!0 (select (arr!20817 a!3170) j!153)))))

(declare-fun b!799666 () Bool)

(declare-fun e!443435 () Bool)

(declare-fun e!443433 () Bool)

(assert (=> b!799666 (= e!443435 e!443433)))

(declare-fun res!544185 () Bool)

(assert (=> b!799666 (=> (not res!544185) (not e!443433))))

(declare-datatypes ((SeekEntryResult!8408 0))(
  ( (MissingZero!8408 (index!36000 (_ BitVec 32))) (Found!8408 (index!36001 (_ BitVec 32))) (Intermediate!8408 (undefined!9220 Bool) (index!36002 (_ BitVec 32)) (x!66878 (_ BitVec 32))) (Undefined!8408) (MissingVacant!8408 (index!36003 (_ BitVec 32))) )
))
(declare-fun lt!357130 () SeekEntryResult!8408)

(declare-fun lt!357132 () SeekEntryResult!8408)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799666 (= res!544185 (and (= lt!357132 lt!357130) (= lt!357130 (Found!8408 j!153)) (not (= (select (arr!20817 a!3170) index!1236) (select (arr!20817 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43474 (_ BitVec 32)) SeekEntryResult!8408)

(assert (=> b!799666 (= lt!357130 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20817 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43474 (_ BitVec 32)) SeekEntryResult!8408)

(assert (=> b!799666 (= lt!357132 (seekEntryOrOpen!0 (select (arr!20817 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799667 () Bool)

(declare-fun res!544193 () Bool)

(assert (=> b!799667 (=> (not res!544193) (not e!443436))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!799667 (= res!544193 (validKeyInArray!0 k!2044))))

(declare-fun b!799668 () Bool)

(declare-fun e!443438 () Bool)

(assert (=> b!799668 (= e!443433 e!443438)))

(declare-fun res!544187 () Bool)

(assert (=> b!799668 (=> (not res!544187) (not e!443438))))

(declare-fun lt!357131 () (_ BitVec 32))

(assert (=> b!799668 (= res!544187 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357131 #b00000000000000000000000000000000) (bvslt lt!357131 (size!21238 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799668 (= lt!357131 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799669 () Bool)

(declare-fun res!544192 () Bool)

(declare-fun e!443434 () Bool)

(assert (=> b!799669 (=> (not res!544192) (not e!443434))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799669 (= res!544192 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21238 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20817 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21238 a!3170)) (= (select (arr!20817 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799670 () Bool)

(declare-fun res!544191 () Bool)

(assert (=> b!799670 (=> (not res!544191) (not e!443438))))

(declare-fun lt!357137 () SeekEntryResult!8408)

(declare-fun lt!357134 () array!43474)

(declare-fun lt!357133 () (_ BitVec 64))

(assert (=> b!799670 (= res!544191 (= lt!357137 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357131 vacantAfter!23 lt!357133 lt!357134 mask!3266)))))

(declare-fun b!799671 () Bool)

(assert (=> b!799671 (= e!443438 false)))

(declare-fun lt!357136 () SeekEntryResult!8408)

(assert (=> b!799671 (= lt!357136 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357131 vacantBefore!23 (select (arr!20817 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544188 () Bool)

(assert (=> start!68684 (=> (not res!544188) (not e!443436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68684 (= res!544188 (validMask!0 mask!3266))))

(assert (=> start!68684 e!443436))

(assert (=> start!68684 true))

(declare-fun array_inv!16613 (array!43474) Bool)

(assert (=> start!68684 (array_inv!16613 a!3170)))

(declare-fun b!799672 () Bool)

(declare-fun res!544189 () Bool)

(assert (=> b!799672 (=> (not res!544189) (not e!443436))))

(assert (=> b!799672 (= res!544189 (and (= (size!21238 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21238 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21238 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799673 () Bool)

(declare-fun res!544194 () Bool)

(assert (=> b!799673 (=> (not res!544194) (not e!443434))))

(declare-datatypes ((List!14780 0))(
  ( (Nil!14777) (Cons!14776 (h!15905 (_ BitVec 64)) (t!21095 List!14780)) )
))
(declare-fun arrayNoDuplicates!0 (array!43474 (_ BitVec 32) List!14780) Bool)

(assert (=> b!799673 (= res!544194 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14777))))

(declare-fun b!799674 () Bool)

(assert (=> b!799674 (= e!443436 e!443434)))

(declare-fun res!544184 () Bool)

(assert (=> b!799674 (=> (not res!544184) (not e!443434))))

(declare-fun lt!357135 () SeekEntryResult!8408)

(assert (=> b!799674 (= res!544184 (or (= lt!357135 (MissingZero!8408 i!1163)) (= lt!357135 (MissingVacant!8408 i!1163))))))

(assert (=> b!799674 (= lt!357135 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799675 () Bool)

(declare-fun res!544196 () Bool)

(assert (=> b!799675 (=> (not res!544196) (not e!443436))))

(declare-fun arrayContainsKey!0 (array!43474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799675 (= res!544196 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799676 () Bool)

(assert (=> b!799676 (= e!443434 e!443435)))

(declare-fun res!544195 () Bool)

(assert (=> b!799676 (=> (not res!544195) (not e!443435))))

(assert (=> b!799676 (= res!544195 (= lt!357137 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357133 lt!357134 mask!3266)))))

(assert (=> b!799676 (= lt!357137 (seekEntryOrOpen!0 lt!357133 lt!357134 mask!3266))))

(assert (=> b!799676 (= lt!357133 (select (store (arr!20817 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799676 (= lt!357134 (array!43475 (store (arr!20817 a!3170) i!1163 k!2044) (size!21238 a!3170)))))

(declare-fun b!799677 () Bool)

(declare-fun res!544190 () Bool)

(assert (=> b!799677 (=> (not res!544190) (not e!443434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43474 (_ BitVec 32)) Bool)

(assert (=> b!799677 (= res!544190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68684 res!544188) b!799672))

(assert (= (and b!799672 res!544189) b!799665))

(assert (= (and b!799665 res!544186) b!799667))

(assert (= (and b!799667 res!544193) b!799675))

(assert (= (and b!799675 res!544196) b!799674))

(assert (= (and b!799674 res!544184) b!799677))

(assert (= (and b!799677 res!544190) b!799673))

(assert (= (and b!799673 res!544194) b!799669))

(assert (= (and b!799669 res!544192) b!799676))

(assert (= (and b!799676 res!544195) b!799666))

(assert (= (and b!799666 res!544185) b!799668))

(assert (= (and b!799668 res!544187) b!799670))

(assert (= (and b!799670 res!544191) b!799671))

(declare-fun m!740693 () Bool)

(assert (=> b!799667 m!740693))

(declare-fun m!740695 () Bool)

(assert (=> b!799665 m!740695))

(assert (=> b!799665 m!740695))

(declare-fun m!740697 () Bool)

(assert (=> b!799665 m!740697))

(assert (=> b!799671 m!740695))

(assert (=> b!799671 m!740695))

(declare-fun m!740699 () Bool)

(assert (=> b!799671 m!740699))

(declare-fun m!740701 () Bool)

(assert (=> b!799677 m!740701))

(declare-fun m!740703 () Bool)

(assert (=> b!799670 m!740703))

(declare-fun m!740705 () Bool)

(assert (=> b!799675 m!740705))

(declare-fun m!740707 () Bool)

(assert (=> b!799674 m!740707))

(declare-fun m!740709 () Bool)

(assert (=> b!799673 m!740709))

(declare-fun m!740711 () Bool)

(assert (=> b!799669 m!740711))

(declare-fun m!740713 () Bool)

(assert (=> b!799669 m!740713))

(declare-fun m!740715 () Bool)

(assert (=> start!68684 m!740715))

(declare-fun m!740717 () Bool)

(assert (=> start!68684 m!740717))

(declare-fun m!740719 () Bool)

(assert (=> b!799668 m!740719))

(declare-fun m!740721 () Bool)

(assert (=> b!799676 m!740721))

(declare-fun m!740723 () Bool)

(assert (=> b!799676 m!740723))

(declare-fun m!740725 () Bool)

(assert (=> b!799676 m!740725))

(declare-fun m!740727 () Bool)

(assert (=> b!799676 m!740727))

(declare-fun m!740729 () Bool)

(assert (=> b!799666 m!740729))

(assert (=> b!799666 m!740695))

(assert (=> b!799666 m!740695))

(declare-fun m!740731 () Bool)

(assert (=> b!799666 m!740731))

(assert (=> b!799666 m!740695))

(declare-fun m!740733 () Bool)

(assert (=> b!799666 m!740733))

(push 1)

