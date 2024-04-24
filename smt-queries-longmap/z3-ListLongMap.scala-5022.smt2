; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68810 () Bool)

(assert start!68810)

(declare-fun res!543708 () Bool)

(declare-fun e!443630 () Bool)

(assert (=> start!68810 (=> (not res!543708) (not e!443630))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68810 (= res!543708 (validMask!0 mask!3266))))

(assert (=> start!68810 e!443630))

(assert (=> start!68810 true))

(declare-datatypes ((array!43432 0))(
  ( (array!43433 (arr!20791 (Array (_ BitVec 32) (_ BitVec 64))) (size!21211 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43432)

(declare-fun array_inv!16650 (array!43432) Bool)

(assert (=> start!68810 (array_inv!16650 a!3170)))

(declare-fun b!799734 () Bool)

(declare-fun res!543714 () Bool)

(assert (=> b!799734 (=> (not res!543714) (not e!443630))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799734 (= res!543714 (validKeyInArray!0 (select (arr!20791 a!3170) j!153)))))

(declare-fun b!799735 () Bool)

(declare-fun res!543712 () Bool)

(declare-fun e!443628 () Bool)

(assert (=> b!799735 (=> (not res!543712) (not e!443628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43432 (_ BitVec 32)) Bool)

(assert (=> b!799735 (= res!543712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799736 () Bool)

(declare-fun res!543709 () Bool)

(assert (=> b!799736 (=> (not res!543709) (not e!443628))))

(declare-datatypes ((List!14661 0))(
  ( (Nil!14658) (Cons!14657 (h!15792 (_ BitVec 64)) (t!20968 List!14661)) )
))
(declare-fun arrayNoDuplicates!0 (array!43432 (_ BitVec 32) List!14661) Bool)

(assert (=> b!799736 (= res!543709 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14658))))

(declare-fun b!799737 () Bool)

(declare-fun e!443631 () Bool)

(declare-fun e!443627 () Bool)

(assert (=> b!799737 (= e!443631 e!443627)))

(declare-fun res!543705 () Bool)

(assert (=> b!799737 (=> (not res!543705) (not e!443627))))

(declare-fun lt!356989 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!799737 (= res!543705 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356989 #b00000000000000000000000000000000) (bvslt lt!356989 (size!21211 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799737 (= lt!356989 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!799738 () Bool)

(declare-fun res!543716 () Bool)

(assert (=> b!799738 (=> (not res!543716) (not e!443628))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799738 (= res!543716 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21211 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20791 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21211 a!3170)) (= (select (arr!20791 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799739 () Bool)

(assert (=> b!799739 (= e!443627 false)))

(declare-datatypes ((SeekEntryResult!8338 0))(
  ( (MissingZero!8338 (index!35720 (_ BitVec 32))) (Found!8338 (index!35721 (_ BitVec 32))) (Intermediate!8338 (undefined!9150 Bool) (index!35722 (_ BitVec 32)) (x!66766 (_ BitVec 32))) (Undefined!8338) (MissingVacant!8338 (index!35723 (_ BitVec 32))) )
))
(declare-fun lt!356985 () SeekEntryResult!8338)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43432 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!799739 (= lt!356985 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356989 vacantBefore!23 (select (arr!20791 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799740 () Bool)

(declare-fun res!543710 () Bool)

(assert (=> b!799740 (=> (not res!543710) (not e!443630))))

(assert (=> b!799740 (= res!543710 (and (= (size!21211 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21211 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21211 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799741 () Bool)

(assert (=> b!799741 (= e!443630 e!443628)))

(declare-fun res!543717 () Bool)

(assert (=> b!799741 (=> (not res!543717) (not e!443628))))

(declare-fun lt!356986 () SeekEntryResult!8338)

(assert (=> b!799741 (= res!543717 (or (= lt!356986 (MissingZero!8338 i!1163)) (= lt!356986 (MissingVacant!8338 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43432 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!799741 (= lt!356986 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799742 () Bool)

(declare-fun res!543713 () Bool)

(assert (=> b!799742 (=> (not res!543713) (not e!443630))))

(assert (=> b!799742 (= res!543713 (validKeyInArray!0 k0!2044))))

(declare-fun b!799743 () Bool)

(declare-fun e!443632 () Bool)

(assert (=> b!799743 (= e!443628 e!443632)))

(declare-fun res!543707 () Bool)

(assert (=> b!799743 (=> (not res!543707) (not e!443632))))

(declare-fun lt!356988 () array!43432)

(declare-fun lt!356983 () SeekEntryResult!8338)

(declare-fun lt!356984 () (_ BitVec 64))

(assert (=> b!799743 (= res!543707 (= lt!356983 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356984 lt!356988 mask!3266)))))

(assert (=> b!799743 (= lt!356983 (seekEntryOrOpen!0 lt!356984 lt!356988 mask!3266))))

(assert (=> b!799743 (= lt!356984 (select (store (arr!20791 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799743 (= lt!356988 (array!43433 (store (arr!20791 a!3170) i!1163 k0!2044) (size!21211 a!3170)))))

(declare-fun b!799744 () Bool)

(declare-fun res!543715 () Bool)

(assert (=> b!799744 (=> (not res!543715) (not e!443627))))

(assert (=> b!799744 (= res!543715 (= lt!356983 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356989 vacantAfter!23 lt!356984 lt!356988 mask!3266)))))

(declare-fun b!799745 () Bool)

(assert (=> b!799745 (= e!443632 e!443631)))

(declare-fun res!543706 () Bool)

(assert (=> b!799745 (=> (not res!543706) (not e!443631))))

(declare-fun lt!356990 () SeekEntryResult!8338)

(declare-fun lt!356987 () SeekEntryResult!8338)

(assert (=> b!799745 (= res!543706 (and (= lt!356987 lt!356990) (= lt!356990 (Found!8338 j!153)) (not (= (select (arr!20791 a!3170) index!1236) (select (arr!20791 a!3170) j!153)))))))

(assert (=> b!799745 (= lt!356990 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20791 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799745 (= lt!356987 (seekEntryOrOpen!0 (select (arr!20791 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799746 () Bool)

(declare-fun res!543711 () Bool)

(assert (=> b!799746 (=> (not res!543711) (not e!443630))))

(declare-fun arrayContainsKey!0 (array!43432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799746 (= res!543711 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68810 res!543708) b!799740))

(assert (= (and b!799740 res!543710) b!799734))

(assert (= (and b!799734 res!543714) b!799742))

(assert (= (and b!799742 res!543713) b!799746))

(assert (= (and b!799746 res!543711) b!799741))

(assert (= (and b!799741 res!543717) b!799735))

(assert (= (and b!799735 res!543712) b!799736))

(assert (= (and b!799736 res!543709) b!799738))

(assert (= (and b!799738 res!543716) b!799743))

(assert (= (and b!799743 res!543707) b!799745))

(assert (= (and b!799745 res!543706) b!799737))

(assert (= (and b!799737 res!543705) b!799744))

(assert (= (and b!799744 res!543715) b!799739))

(declare-fun m!741067 () Bool)

(assert (=> b!799734 m!741067))

(assert (=> b!799734 m!741067))

(declare-fun m!741069 () Bool)

(assert (=> b!799734 m!741069))

(declare-fun m!741071 () Bool)

(assert (=> b!799736 m!741071))

(declare-fun m!741073 () Bool)

(assert (=> b!799735 m!741073))

(assert (=> b!799739 m!741067))

(assert (=> b!799739 m!741067))

(declare-fun m!741075 () Bool)

(assert (=> b!799739 m!741075))

(declare-fun m!741077 () Bool)

(assert (=> b!799741 m!741077))

(declare-fun m!741079 () Bool)

(assert (=> start!68810 m!741079))

(declare-fun m!741081 () Bool)

(assert (=> start!68810 m!741081))

(declare-fun m!741083 () Bool)

(assert (=> b!799745 m!741083))

(assert (=> b!799745 m!741067))

(assert (=> b!799745 m!741067))

(declare-fun m!741085 () Bool)

(assert (=> b!799745 m!741085))

(assert (=> b!799745 m!741067))

(declare-fun m!741087 () Bool)

(assert (=> b!799745 m!741087))

(declare-fun m!741089 () Bool)

(assert (=> b!799743 m!741089))

(declare-fun m!741091 () Bool)

(assert (=> b!799743 m!741091))

(declare-fun m!741093 () Bool)

(assert (=> b!799743 m!741093))

(declare-fun m!741095 () Bool)

(assert (=> b!799743 m!741095))

(declare-fun m!741097 () Bool)

(assert (=> b!799737 m!741097))

(declare-fun m!741099 () Bool)

(assert (=> b!799746 m!741099))

(declare-fun m!741101 () Bool)

(assert (=> b!799744 m!741101))

(declare-fun m!741103 () Bool)

(assert (=> b!799742 m!741103))

(declare-fun m!741105 () Bool)

(assert (=> b!799738 m!741105))

(declare-fun m!741107 () Bool)

(assert (=> b!799738 m!741107))

(check-sat (not b!799745) (not b!799741) (not start!68810) (not b!799736) (not b!799735) (not b!799734) (not b!799739) (not b!799746) (not b!799742) (not b!799744) (not b!799737) (not b!799743))
(check-sat)
