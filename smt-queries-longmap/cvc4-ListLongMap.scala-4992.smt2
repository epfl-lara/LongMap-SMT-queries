; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68466 () Bool)

(assert start!68466)

(declare-fun b!795885 () Bool)

(declare-fun res!540405 () Bool)

(declare-fun e!441683 () Bool)

(assert (=> b!795885 (=> (not res!540405) (not e!441683))))

(declare-datatypes ((array!43256 0))(
  ( (array!43257 (arr!20708 (Array (_ BitVec 32) (_ BitVec 64))) (size!21129 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43256)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43256 (_ BitVec 32)) Bool)

(assert (=> b!795885 (= res!540405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795886 () Bool)

(declare-fun e!441680 () Bool)

(assert (=> b!795886 (= e!441680 e!441683)))

(declare-fun res!540408 () Bool)

(assert (=> b!795886 (=> (not res!540408) (not e!441683))))

(declare-datatypes ((SeekEntryResult!8299 0))(
  ( (MissingZero!8299 (index!35564 (_ BitVec 32))) (Found!8299 (index!35565 (_ BitVec 32))) (Intermediate!8299 (undefined!9111 Bool) (index!35566 (_ BitVec 32)) (x!66473 (_ BitVec 32))) (Undefined!8299) (MissingVacant!8299 (index!35567 (_ BitVec 32))) )
))
(declare-fun lt!354798 () SeekEntryResult!8299)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795886 (= res!540408 (or (= lt!354798 (MissingZero!8299 i!1163)) (= lt!354798 (MissingVacant!8299 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43256 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!795886 (= lt!354798 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795887 () Bool)

(declare-fun res!540407 () Bool)

(assert (=> b!795887 (=> (not res!540407) (not e!441680))))

(declare-fun arrayContainsKey!0 (array!43256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795887 (= res!540407 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795888 () Bool)

(declare-fun e!441682 () Bool)

(assert (=> b!795888 (= e!441683 e!441682)))

(declare-fun res!540404 () Bool)

(assert (=> b!795888 (=> (not res!540404) (not e!441682))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354800 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354797 () array!43256)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43256 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!795888 (= res!540404 (= (seekEntryOrOpen!0 lt!354800 lt!354797 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354800 lt!354797 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795888 (= lt!354800 (select (store (arr!20708 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795888 (= lt!354797 (array!43257 (store (arr!20708 a!3170) i!1163 k!2044) (size!21129 a!3170)))))

(declare-fun b!795889 () Bool)

(declare-fun res!540412 () Bool)

(assert (=> b!795889 (=> (not res!540412) (not e!441680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795889 (= res!540412 (validKeyInArray!0 k!2044))))

(declare-fun b!795891 () Bool)

(declare-fun res!540406 () Bool)

(assert (=> b!795891 (=> (not res!540406) (not e!441680))))

(assert (=> b!795891 (= res!540406 (validKeyInArray!0 (select (arr!20708 a!3170) j!153)))))

(declare-fun b!795892 () Bool)

(declare-fun res!540410 () Bool)

(assert (=> b!795892 (=> (not res!540410) (not e!441683))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795892 (= res!540410 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21129 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20708 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21129 a!3170)) (= (select (arr!20708 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795893 () Bool)

(declare-fun res!540409 () Bool)

(assert (=> b!795893 (=> (not res!540409) (not e!441683))))

(declare-datatypes ((List!14671 0))(
  ( (Nil!14668) (Cons!14667 (h!15796 (_ BitVec 64)) (t!20986 List!14671)) )
))
(declare-fun arrayNoDuplicates!0 (array!43256 (_ BitVec 32) List!14671) Bool)

(assert (=> b!795893 (= res!540409 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14668))))

(declare-fun lt!354796 () SeekEntryResult!8299)

(declare-fun b!795894 () Bool)

(declare-fun lt!354799 () SeekEntryResult!8299)

(assert (=> b!795894 (= e!441682 (and (= lt!354796 lt!354799) (= lt!354799 (Found!8299 j!153)) (= (select (arr!20708 a!3170) index!1236) (select (arr!20708 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20708 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!795894 (= lt!354799 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20708 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795894 (= lt!354796 (seekEntryOrOpen!0 (select (arr!20708 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!540411 () Bool)

(assert (=> start!68466 (=> (not res!540411) (not e!441680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68466 (= res!540411 (validMask!0 mask!3266))))

(assert (=> start!68466 e!441680))

(assert (=> start!68466 true))

(declare-fun array_inv!16504 (array!43256) Bool)

(assert (=> start!68466 (array_inv!16504 a!3170)))

(declare-fun b!795890 () Bool)

(declare-fun res!540413 () Bool)

(assert (=> b!795890 (=> (not res!540413) (not e!441680))))

(assert (=> b!795890 (= res!540413 (and (= (size!21129 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21129 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21129 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68466 res!540411) b!795890))

(assert (= (and b!795890 res!540413) b!795891))

(assert (= (and b!795891 res!540406) b!795889))

(assert (= (and b!795889 res!540412) b!795887))

(assert (= (and b!795887 res!540407) b!795886))

(assert (= (and b!795886 res!540408) b!795885))

(assert (= (and b!795885 res!540405) b!795893))

(assert (= (and b!795893 res!540409) b!795892))

(assert (= (and b!795892 res!540410) b!795888))

(assert (= (and b!795888 res!540404) b!795894))

(declare-fun m!736605 () Bool)

(assert (=> b!795891 m!736605))

(assert (=> b!795891 m!736605))

(declare-fun m!736607 () Bool)

(assert (=> b!795891 m!736607))

(declare-fun m!736609 () Bool)

(assert (=> b!795893 m!736609))

(declare-fun m!736611 () Bool)

(assert (=> b!795892 m!736611))

(declare-fun m!736613 () Bool)

(assert (=> b!795892 m!736613))

(declare-fun m!736615 () Bool)

(assert (=> b!795889 m!736615))

(declare-fun m!736617 () Bool)

(assert (=> b!795885 m!736617))

(declare-fun m!736619 () Bool)

(assert (=> start!68466 m!736619))

(declare-fun m!736621 () Bool)

(assert (=> start!68466 m!736621))

(declare-fun m!736623 () Bool)

(assert (=> b!795886 m!736623))

(declare-fun m!736625 () Bool)

(assert (=> b!795887 m!736625))

(assert (=> b!795894 m!736605))

(declare-fun m!736627 () Bool)

(assert (=> b!795894 m!736627))

(declare-fun m!736629 () Bool)

(assert (=> b!795894 m!736629))

(assert (=> b!795894 m!736605))

(declare-fun m!736631 () Bool)

(assert (=> b!795894 m!736631))

(assert (=> b!795894 m!736605))

(declare-fun m!736633 () Bool)

(assert (=> b!795894 m!736633))

(declare-fun m!736635 () Bool)

(assert (=> b!795894 m!736635))

(declare-fun m!736637 () Bool)

(assert (=> b!795888 m!736637))

(declare-fun m!736639 () Bool)

(assert (=> b!795888 m!736639))

(assert (=> b!795888 m!736635))

(declare-fun m!736641 () Bool)

(assert (=> b!795888 m!736641))

(push 1)

