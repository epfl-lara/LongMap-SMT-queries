; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68718 () Bool)

(assert start!68718)

(declare-fun b!798728 () Bool)

(declare-fun res!542874 () Bool)

(declare-fun e!443142 () Bool)

(assert (=> b!798728 (=> (not res!542874) (not e!443142))))

(declare-datatypes ((array!43382 0))(
  ( (array!43383 (arr!20767 (Array (_ BitVec 32) (_ BitVec 64))) (size!21187 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43382)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798728 (= res!542874 (validKeyInArray!0 (select (arr!20767 a!3170) j!153)))))

(declare-fun b!798729 () Bool)

(declare-fun res!542881 () Bool)

(declare-fun e!443145 () Bool)

(assert (=> b!798729 (=> (not res!542881) (not e!443145))))

(declare-datatypes ((List!14637 0))(
  ( (Nil!14634) (Cons!14633 (h!15768 (_ BitVec 64)) (t!20944 List!14637)) )
))
(declare-fun arrayNoDuplicates!0 (array!43382 (_ BitVec 32) List!14637) Bool)

(assert (=> b!798729 (= res!542881 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14634))))

(declare-fun b!798730 () Bool)

(declare-fun res!542878 () Bool)

(assert (=> b!798730 (=> (not res!542878) (not e!443145))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43382 (_ BitVec 32)) Bool)

(assert (=> b!798730 (= res!542878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798731 () Bool)

(declare-fun e!443146 () Bool)

(declare-fun e!443143 () Bool)

(assert (=> b!798731 (= e!443146 e!443143)))

(declare-fun res!542882 () Bool)

(assert (=> b!798731 (=> (not res!542882) (not e!443143))))

(declare-datatypes ((SeekEntryResult!8314 0))(
  ( (MissingZero!8314 (index!35624 (_ BitVec 32))) (Found!8314 (index!35625 (_ BitVec 32))) (Intermediate!8314 (undefined!9126 Bool) (index!35626 (_ BitVec 32)) (x!66675 (_ BitVec 32))) (Undefined!8314) (MissingVacant!8314 (index!35627 (_ BitVec 32))) )
))
(declare-fun lt!356461 () SeekEntryResult!8314)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356455 () SeekEntryResult!8314)

(assert (=> b!798731 (= res!542882 (and (= lt!356461 lt!356455) (= lt!356455 (Found!8314 j!153)) (= (select (arr!20767 a!3170) index!1236) (select (arr!20767 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43382 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!798731 (= lt!356455 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20767 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43382 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!798731 (= lt!356461 (seekEntryOrOpen!0 (select (arr!20767 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798732 () Bool)

(assert (=> b!798732 (= e!443142 e!443145)))

(declare-fun res!542877 () Bool)

(assert (=> b!798732 (=> (not res!542877) (not e!443145))))

(declare-fun lt!356456 () SeekEntryResult!8314)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798732 (= res!542877 (or (= lt!356456 (MissingZero!8314 i!1163)) (= lt!356456 (MissingVacant!8314 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798732 (= lt!356456 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!542880 () Bool)

(assert (=> start!68718 (=> (not res!542880) (not e!443142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68718 (= res!542880 (validMask!0 mask!3266))))

(assert (=> start!68718 e!443142))

(assert (=> start!68718 true))

(declare-fun array_inv!16626 (array!43382) Bool)

(assert (=> start!68718 (array_inv!16626 a!3170)))

(declare-fun b!798733 () Bool)

(assert (=> b!798733 (= e!443145 e!443146)))

(declare-fun res!542883 () Bool)

(assert (=> b!798733 (=> (not res!542883) (not e!443146))))

(declare-fun lt!356458 () SeekEntryResult!8314)

(declare-fun lt!356460 () SeekEntryResult!8314)

(assert (=> b!798733 (= res!542883 (= lt!356458 lt!356460))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356457 () (_ BitVec 64))

(declare-fun lt!356459 () array!43382)

(assert (=> b!798733 (= lt!356460 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356457 lt!356459 mask!3266))))

(assert (=> b!798733 (= lt!356458 (seekEntryOrOpen!0 lt!356457 lt!356459 mask!3266))))

(assert (=> b!798733 (= lt!356457 (select (store (arr!20767 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798733 (= lt!356459 (array!43383 (store (arr!20767 a!3170) i!1163 k0!2044) (size!21187 a!3170)))))

(declare-fun b!798734 () Bool)

(declare-fun res!542875 () Bool)

(assert (=> b!798734 (=> (not res!542875) (not e!443142))))

(assert (=> b!798734 (= res!542875 (validKeyInArray!0 k0!2044))))

(declare-fun b!798735 () Bool)

(declare-fun res!542873 () Bool)

(assert (=> b!798735 (=> (not res!542873) (not e!443142))))

(declare-fun arrayContainsKey!0 (array!43382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798735 (= res!542873 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798736 () Bool)

(declare-fun res!542879 () Bool)

(assert (=> b!798736 (=> (not res!542879) (not e!443142))))

(assert (=> b!798736 (= res!542879 (and (= (size!21187 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21187 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21187 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798737 () Bool)

(declare-fun res!542876 () Bool)

(assert (=> b!798737 (=> (not res!542876) (not e!443145))))

(assert (=> b!798737 (= res!542876 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21187 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20767 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21187 a!3170)) (= (select (arr!20767 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798738 () Bool)

(assert (=> b!798738 (= e!443143 (not true))))

(assert (=> b!798738 (= lt!356460 (Found!8314 index!1236))))

(assert (= (and start!68718 res!542880) b!798736))

(assert (= (and b!798736 res!542879) b!798728))

(assert (= (and b!798728 res!542874) b!798734))

(assert (= (and b!798734 res!542875) b!798735))

(assert (= (and b!798735 res!542873) b!798732))

(assert (= (and b!798732 res!542877) b!798730))

(assert (= (and b!798730 res!542878) b!798729))

(assert (= (and b!798729 res!542881) b!798737))

(assert (= (and b!798737 res!542876) b!798733))

(assert (= (and b!798733 res!542883) b!798731))

(assert (= (and b!798731 res!542882) b!798738))

(declare-fun m!740039 () Bool)

(assert (=> b!798737 m!740039))

(declare-fun m!740041 () Bool)

(assert (=> b!798737 m!740041))

(declare-fun m!740043 () Bool)

(assert (=> b!798732 m!740043))

(declare-fun m!740045 () Bool)

(assert (=> b!798729 m!740045))

(declare-fun m!740047 () Bool)

(assert (=> b!798734 m!740047))

(declare-fun m!740049 () Bool)

(assert (=> b!798735 m!740049))

(declare-fun m!740051 () Bool)

(assert (=> b!798730 m!740051))

(declare-fun m!740053 () Bool)

(assert (=> b!798733 m!740053))

(declare-fun m!740055 () Bool)

(assert (=> b!798733 m!740055))

(declare-fun m!740057 () Bool)

(assert (=> b!798733 m!740057))

(declare-fun m!740059 () Bool)

(assert (=> b!798733 m!740059))

(declare-fun m!740061 () Bool)

(assert (=> b!798728 m!740061))

(assert (=> b!798728 m!740061))

(declare-fun m!740063 () Bool)

(assert (=> b!798728 m!740063))

(declare-fun m!740065 () Bool)

(assert (=> start!68718 m!740065))

(declare-fun m!740067 () Bool)

(assert (=> start!68718 m!740067))

(declare-fun m!740069 () Bool)

(assert (=> b!798731 m!740069))

(assert (=> b!798731 m!740061))

(assert (=> b!798731 m!740061))

(declare-fun m!740071 () Bool)

(assert (=> b!798731 m!740071))

(assert (=> b!798731 m!740061))

(declare-fun m!740073 () Bool)

(assert (=> b!798731 m!740073))

(check-sat (not b!798735) (not b!798734) (not b!798729) (not b!798730) (not b!798731) (not start!68718) (not b!798728) (not b!798732) (not b!798733))
(check-sat)
