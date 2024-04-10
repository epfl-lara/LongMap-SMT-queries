; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69192 () Bool)

(assert start!69192)

(declare-fun b!807008 () Bool)

(declare-fun res!551131 () Bool)

(declare-fun e!446855 () Bool)

(assert (=> b!807008 (=> (not res!551131) (not e!446855))))

(declare-datatypes ((array!43892 0))(
  ( (array!43893 (arr!21023 (Array (_ BitVec 32) (_ BitVec 64))) (size!21444 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43892)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807008 (= res!551131 (validKeyInArray!0 (select (arr!21023 a!3170) j!153)))))

(declare-fun res!551133 () Bool)

(assert (=> start!69192 (=> (not res!551133) (not e!446855))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69192 (= res!551133 (validMask!0 mask!3266))))

(assert (=> start!69192 e!446855))

(assert (=> start!69192 true))

(declare-fun array_inv!16819 (array!43892) Bool)

(assert (=> start!69192 (array_inv!16819 a!3170)))

(declare-fun b!807009 () Bool)

(declare-fun res!551139 () Bool)

(declare-fun e!446854 () Bool)

(assert (=> b!807009 (=> (not res!551139) (not e!446854))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807009 (= res!551139 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21444 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21023 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21444 a!3170)) (= (select (arr!21023 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807010 () Bool)

(declare-fun e!446858 () Bool)

(assert (=> b!807010 (= e!446854 e!446858)))

(declare-fun res!551140 () Bool)

(assert (=> b!807010 (=> (not res!551140) (not e!446858))))

(declare-fun lt!361494 () (_ BitVec 64))

(declare-fun lt!361498 () array!43892)

(declare-datatypes ((SeekEntryResult!8614 0))(
  ( (MissingZero!8614 (index!36824 (_ BitVec 32))) (Found!8614 (index!36825 (_ BitVec 32))) (Intermediate!8614 (undefined!9426 Bool) (index!36826 (_ BitVec 32)) (x!67634 (_ BitVec 32))) (Undefined!8614) (MissingVacant!8614 (index!36827 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43892 (_ BitVec 32)) SeekEntryResult!8614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43892 (_ BitVec 32)) SeekEntryResult!8614)

(assert (=> b!807010 (= res!551140 (= (seekEntryOrOpen!0 lt!361494 lt!361498 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361494 lt!361498 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!807010 (= lt!361494 (select (store (arr!21023 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807010 (= lt!361498 (array!43893 (store (arr!21023 a!3170) i!1163 k!2044) (size!21444 a!3170)))))

(declare-fun b!807011 () Bool)

(declare-fun res!551134 () Bool)

(assert (=> b!807011 (=> (not res!551134) (not e!446855))))

(assert (=> b!807011 (= res!551134 (validKeyInArray!0 k!2044))))

(declare-fun b!807012 () Bool)

(assert (=> b!807012 (= e!446855 e!446854)))

(declare-fun res!551141 () Bool)

(assert (=> b!807012 (=> (not res!551141) (not e!446854))))

(declare-fun lt!361495 () SeekEntryResult!8614)

(assert (=> b!807012 (= res!551141 (or (= lt!361495 (MissingZero!8614 i!1163)) (= lt!361495 (MissingVacant!8614 i!1163))))))

(assert (=> b!807012 (= lt!361495 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807013 () Bool)

(declare-fun res!551136 () Bool)

(assert (=> b!807013 (=> (not res!551136) (not e!446855))))

(declare-fun arrayContainsKey!0 (array!43892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807013 (= res!551136 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807014 () Bool)

(declare-fun res!551135 () Bool)

(assert (=> b!807014 (=> (not res!551135) (not e!446854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43892 (_ BitVec 32)) Bool)

(assert (=> b!807014 (= res!551135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807015 () Bool)

(declare-fun res!551137 () Bool)

(assert (=> b!807015 (=> (not res!551137) (not e!446855))))

(assert (=> b!807015 (= res!551137 (and (= (size!21444 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21444 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21444 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807016 () Bool)

(declare-fun e!446856 () Bool)

(assert (=> b!807016 (= e!446858 e!446856)))

(declare-fun res!551138 () Bool)

(assert (=> b!807016 (=> (not res!551138) (not e!446856))))

(declare-fun lt!361496 () SeekEntryResult!8614)

(declare-fun lt!361499 () SeekEntryResult!8614)

(assert (=> b!807016 (= res!551138 (and (= lt!361499 lt!361496) (= lt!361496 (Found!8614 j!153)) (not (= (select (arr!21023 a!3170) index!1236) (select (arr!21023 a!3170) j!153)))))))

(assert (=> b!807016 (= lt!361496 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21023 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807016 (= lt!361499 (seekEntryOrOpen!0 (select (arr!21023 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807017 () Bool)

(declare-fun res!551132 () Bool)

(assert (=> b!807017 (=> (not res!551132) (not e!446854))))

(declare-datatypes ((List!14986 0))(
  ( (Nil!14983) (Cons!14982 (h!16111 (_ BitVec 64)) (t!21301 List!14986)) )
))
(declare-fun arrayNoDuplicates!0 (array!43892 (_ BitVec 32) List!14986) Bool)

(assert (=> b!807017 (= res!551132 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14983))))

(declare-fun b!807018 () Bool)

(assert (=> b!807018 (= e!446856 false)))

(declare-fun lt!361497 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807018 (= lt!361497 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69192 res!551133) b!807015))

(assert (= (and b!807015 res!551137) b!807008))

(assert (= (and b!807008 res!551131) b!807011))

(assert (= (and b!807011 res!551134) b!807013))

(assert (= (and b!807013 res!551136) b!807012))

(assert (= (and b!807012 res!551141) b!807014))

(assert (= (and b!807014 res!551135) b!807017))

(assert (= (and b!807017 res!551132) b!807009))

(assert (= (and b!807009 res!551139) b!807010))

(assert (= (and b!807010 res!551140) b!807016))

(assert (= (and b!807016 res!551138) b!807018))

(declare-fun m!748977 () Bool)

(assert (=> b!807013 m!748977))

(declare-fun m!748979 () Bool)

(assert (=> b!807008 m!748979))

(assert (=> b!807008 m!748979))

(declare-fun m!748981 () Bool)

(assert (=> b!807008 m!748981))

(declare-fun m!748983 () Bool)

(assert (=> b!807009 m!748983))

(declare-fun m!748985 () Bool)

(assert (=> b!807009 m!748985))

(declare-fun m!748987 () Bool)

(assert (=> b!807018 m!748987))

(declare-fun m!748989 () Bool)

(assert (=> b!807014 m!748989))

(declare-fun m!748991 () Bool)

(assert (=> b!807010 m!748991))

(declare-fun m!748993 () Bool)

(assert (=> b!807010 m!748993))

(declare-fun m!748995 () Bool)

(assert (=> b!807010 m!748995))

(declare-fun m!748997 () Bool)

(assert (=> b!807010 m!748997))

(declare-fun m!748999 () Bool)

(assert (=> b!807011 m!748999))

(declare-fun m!749001 () Bool)

(assert (=> b!807012 m!749001))

(declare-fun m!749003 () Bool)

(assert (=> b!807016 m!749003))

(assert (=> b!807016 m!748979))

(assert (=> b!807016 m!748979))

(declare-fun m!749005 () Bool)

(assert (=> b!807016 m!749005))

(assert (=> b!807016 m!748979))

(declare-fun m!749007 () Bool)

(assert (=> b!807016 m!749007))

(declare-fun m!749009 () Bool)

(assert (=> b!807017 m!749009))

(declare-fun m!749011 () Bool)

(assert (=> start!69192 m!749011))

(declare-fun m!749013 () Bool)

(assert (=> start!69192 m!749013))

(push 1)

(assert (not b!807008))

(assert (not b!807016))

(assert (not b!807013))

(assert (not start!69192))

