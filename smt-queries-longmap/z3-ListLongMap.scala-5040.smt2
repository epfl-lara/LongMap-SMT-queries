; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68752 () Bool)

(assert start!68752)

(declare-fun b!800991 () Bool)

(declare-fun res!545512 () Bool)

(declare-fun e!444045 () Bool)

(assert (=> b!800991 (=> (not res!545512) (not e!444045))))

(declare-datatypes ((array!43542 0))(
  ( (array!43543 (arr!20851 (Array (_ BitVec 32) (_ BitVec 64))) (size!21272 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43542)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800991 (= res!545512 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!545518 () Bool)

(assert (=> start!68752 (=> (not res!545518) (not e!444045))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68752 (= res!545518 (validMask!0 mask!3266))))

(assert (=> start!68752 e!444045))

(assert (=> start!68752 true))

(declare-fun array_inv!16647 (array!43542) Bool)

(assert (=> start!68752 (array_inv!16647 a!3170)))

(declare-fun b!800992 () Bool)

(declare-fun res!545519 () Bool)

(assert (=> b!800992 (=> (not res!545519) (not e!444045))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800992 (= res!545519 (validKeyInArray!0 (select (arr!20851 a!3170) j!153)))))

(declare-fun b!800993 () Bool)

(declare-fun res!545514 () Bool)

(assert (=> b!800993 (=> (not res!545514) (not e!444045))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800993 (= res!545514 (and (= (size!21272 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21272 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21272 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800994 () Bool)

(declare-fun res!545516 () Bool)

(declare-fun e!444050 () Bool)

(assert (=> b!800994 (=> (not res!545516) (not e!444050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43542 (_ BitVec 32)) Bool)

(assert (=> b!800994 (= res!545516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800995 () Bool)

(declare-fun res!545522 () Bool)

(assert (=> b!800995 (=> (not res!545522) (not e!444050))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800995 (= res!545522 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21272 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20851 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21272 a!3170)) (= (select (arr!20851 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800996 () Bool)

(declare-fun e!444046 () Bool)

(assert (=> b!800996 (= e!444050 e!444046)))

(declare-fun res!545511 () Bool)

(assert (=> b!800996 (=> (not res!545511) (not e!444046))))

(declare-fun lt!357951 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8442 0))(
  ( (MissingZero!8442 (index!36136 (_ BitVec 32))) (Found!8442 (index!36137 (_ BitVec 32))) (Intermediate!8442 (undefined!9254 Bool) (index!36138 (_ BitVec 32)) (x!67000 (_ BitVec 32))) (Undefined!8442) (MissingVacant!8442 (index!36139 (_ BitVec 32))) )
))
(declare-fun lt!357948 () SeekEntryResult!8442)

(declare-fun lt!357949 () array!43542)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43542 (_ BitVec 32)) SeekEntryResult!8442)

(assert (=> b!800996 (= res!545511 (= lt!357948 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357951 lt!357949 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43542 (_ BitVec 32)) SeekEntryResult!8442)

(assert (=> b!800996 (= lt!357948 (seekEntryOrOpen!0 lt!357951 lt!357949 mask!3266))))

(assert (=> b!800996 (= lt!357951 (select (store (arr!20851 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800996 (= lt!357949 (array!43543 (store (arr!20851 a!3170) i!1163 k0!2044) (size!21272 a!3170)))))

(declare-fun b!800997 () Bool)

(declare-fun e!444048 () Bool)

(assert (=> b!800997 (= e!444046 e!444048)))

(declare-fun res!545515 () Bool)

(assert (=> b!800997 (=> (not res!545515) (not e!444048))))

(declare-fun lt!357953 () SeekEntryResult!8442)

(declare-fun lt!357947 () SeekEntryResult!8442)

(assert (=> b!800997 (= res!545515 (and (= lt!357947 lt!357953) (= lt!357953 (Found!8442 j!153)) (not (= (select (arr!20851 a!3170) index!1236) (select (arr!20851 a!3170) j!153)))))))

(assert (=> b!800997 (= lt!357953 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800997 (= lt!357947 (seekEntryOrOpen!0 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800998 () Bool)

(declare-fun res!545521 () Bool)

(declare-fun e!444049 () Bool)

(assert (=> b!800998 (=> (not res!545521) (not e!444049))))

(declare-fun lt!357952 () (_ BitVec 32))

(assert (=> b!800998 (= res!545521 (= lt!357948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357952 vacantAfter!23 lt!357951 lt!357949 mask!3266)))))

(declare-fun b!800999 () Bool)

(declare-fun res!545520 () Bool)

(assert (=> b!800999 (=> (not res!545520) (not e!444050))))

(declare-datatypes ((List!14814 0))(
  ( (Nil!14811) (Cons!14810 (h!15939 (_ BitVec 64)) (t!21129 List!14814)) )
))
(declare-fun arrayNoDuplicates!0 (array!43542 (_ BitVec 32) List!14814) Bool)

(assert (=> b!800999 (= res!545520 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14811))))

(declare-fun b!801000 () Bool)

(declare-fun res!545510 () Bool)

(assert (=> b!801000 (=> (not res!545510) (not e!444045))))

(assert (=> b!801000 (= res!545510 (validKeyInArray!0 k0!2044))))

(declare-fun b!801001 () Bool)

(assert (=> b!801001 (= e!444045 e!444050)))

(declare-fun res!545513 () Bool)

(assert (=> b!801001 (=> (not res!545513) (not e!444050))))

(declare-fun lt!357946 () SeekEntryResult!8442)

(assert (=> b!801001 (= res!545513 (or (= lt!357946 (MissingZero!8442 i!1163)) (= lt!357946 (MissingVacant!8442 i!1163))))))

(assert (=> b!801001 (= lt!357946 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801002 () Bool)

(assert (=> b!801002 (= e!444049 false)))

(declare-fun lt!357950 () SeekEntryResult!8442)

(assert (=> b!801002 (= lt!357950 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357952 vacantBefore!23 (select (arr!20851 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801003 () Bool)

(assert (=> b!801003 (= e!444048 e!444049)))

(declare-fun res!545517 () Bool)

(assert (=> b!801003 (=> (not res!545517) (not e!444049))))

(assert (=> b!801003 (= res!545517 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357952 #b00000000000000000000000000000000) (bvslt lt!357952 (size!21272 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801003 (= lt!357952 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68752 res!545518) b!800993))

(assert (= (and b!800993 res!545514) b!800992))

(assert (= (and b!800992 res!545519) b!801000))

(assert (= (and b!801000 res!545510) b!800991))

(assert (= (and b!800991 res!545512) b!801001))

(assert (= (and b!801001 res!545513) b!800994))

(assert (= (and b!800994 res!545516) b!800999))

(assert (= (and b!800999 res!545520) b!800995))

(assert (= (and b!800995 res!545522) b!800996))

(assert (= (and b!800996 res!545511) b!800997))

(assert (= (and b!800997 res!545515) b!801003))

(assert (= (and b!801003 res!545517) b!800998))

(assert (= (and b!800998 res!545521) b!801002))

(declare-fun m!742121 () Bool)

(assert (=> b!800995 m!742121))

(declare-fun m!742123 () Bool)

(assert (=> b!800995 m!742123))

(declare-fun m!742125 () Bool)

(assert (=> b!800999 m!742125))

(declare-fun m!742127 () Bool)

(assert (=> b!800992 m!742127))

(assert (=> b!800992 m!742127))

(declare-fun m!742129 () Bool)

(assert (=> b!800992 m!742129))

(declare-fun m!742131 () Bool)

(assert (=> start!68752 m!742131))

(declare-fun m!742133 () Bool)

(assert (=> start!68752 m!742133))

(declare-fun m!742135 () Bool)

(assert (=> b!801000 m!742135))

(declare-fun m!742137 () Bool)

(assert (=> b!800996 m!742137))

(declare-fun m!742139 () Bool)

(assert (=> b!800996 m!742139))

(declare-fun m!742141 () Bool)

(assert (=> b!800996 m!742141))

(declare-fun m!742143 () Bool)

(assert (=> b!800996 m!742143))

(declare-fun m!742145 () Bool)

(assert (=> b!800997 m!742145))

(assert (=> b!800997 m!742127))

(assert (=> b!800997 m!742127))

(declare-fun m!742147 () Bool)

(assert (=> b!800997 m!742147))

(assert (=> b!800997 m!742127))

(declare-fun m!742149 () Bool)

(assert (=> b!800997 m!742149))

(declare-fun m!742151 () Bool)

(assert (=> b!801001 m!742151))

(declare-fun m!742153 () Bool)

(assert (=> b!800991 m!742153))

(declare-fun m!742155 () Bool)

(assert (=> b!801003 m!742155))

(assert (=> b!801002 m!742127))

(assert (=> b!801002 m!742127))

(declare-fun m!742157 () Bool)

(assert (=> b!801002 m!742157))

(declare-fun m!742159 () Bool)

(assert (=> b!800998 m!742159))

(declare-fun m!742161 () Bool)

(assert (=> b!800994 m!742161))

(check-sat (not b!800992) (not start!68752) (not b!800991) (not b!800999) (not b!800998) (not b!801000) (not b!800997) (not b!800996) (not b!801001) (not b!800994) (not b!801003) (not b!801002))
(check-sat)
