; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68616 () Bool)

(assert start!68616)

(declare-fun b!798500 () Bool)

(declare-fun e!442863 () Bool)

(declare-fun e!442861 () Bool)

(assert (=> b!798500 (= e!442863 e!442861)))

(declare-fun res!543160 () Bool)

(assert (=> b!798500 (=> (not res!543160) (not e!442861))))

(declare-datatypes ((SeekEntryResult!8380 0))(
  ( (MissingZero!8380 (index!35888 (_ BitVec 32))) (Found!8380 (index!35889 (_ BitVec 32))) (Intermediate!8380 (undefined!9192 Bool) (index!35890 (_ BitVec 32)) (x!66781 (_ BitVec 32))) (Undefined!8380) (MissingVacant!8380 (index!35891 (_ BitVec 32))) )
))
(declare-fun lt!356339 () SeekEntryResult!8380)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798500 (= res!543160 (or (= lt!356339 (MissingZero!8380 i!1163)) (= lt!356339 (MissingVacant!8380 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43423 0))(
  ( (array!43424 (arr!20792 (Array (_ BitVec 32) (_ BitVec 64))) (size!21213 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43423)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43423 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!798500 (= lt!356339 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798501 () Bool)

(declare-fun res!543163 () Bool)

(assert (=> b!798501 (=> (not res!543163) (not e!442861))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798501 (= res!543163 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21213 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20792 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21213 a!3170)) (= (select (arr!20792 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798502 () Bool)

(declare-fun res!543167 () Bool)

(assert (=> b!798502 (=> (not res!543167) (not e!442863))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798502 (= res!543167 (and (= (size!21213 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21213 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21213 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798503 () Bool)

(declare-fun res!543162 () Bool)

(assert (=> b!798503 (=> (not res!543162) (not e!442863))))

(declare-fun arrayContainsKey!0 (array!43423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798503 (= res!543162 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798504 () Bool)

(declare-fun res!543159 () Bool)

(assert (=> b!798504 (=> (not res!543159) (not e!442863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798504 (= res!543159 (validKeyInArray!0 (select (arr!20792 a!3170) j!153)))))

(declare-fun b!798505 () Bool)

(declare-fun e!442864 () Bool)

(assert (=> b!798505 (= e!442861 e!442864)))

(declare-fun res!543165 () Bool)

(assert (=> b!798505 (=> (not res!543165) (not e!442864))))

(declare-fun lt!356337 () (_ BitVec 64))

(declare-fun lt!356336 () array!43423)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43423 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!798505 (= res!543165 (= (seekEntryOrOpen!0 lt!356337 lt!356336 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356337 lt!356336 mask!3266)))))

(assert (=> b!798505 (= lt!356337 (select (store (arr!20792 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798505 (= lt!356336 (array!43424 (store (arr!20792 a!3170) i!1163 k0!2044) (size!21213 a!3170)))))

(declare-fun b!798506 () Bool)

(declare-fun res!543166 () Bool)

(assert (=> b!798506 (=> (not res!543166) (not e!442861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43423 (_ BitVec 32)) Bool)

(assert (=> b!798506 (= res!543166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798507 () Bool)

(declare-fun res!543164 () Bool)

(assert (=> b!798507 (=> (not res!543164) (not e!442863))))

(assert (=> b!798507 (= res!543164 (validKeyInArray!0 k0!2044))))

(declare-fun b!798508 () Bool)

(declare-fun res!543168 () Bool)

(assert (=> b!798508 (=> (not res!543168) (not e!442861))))

(declare-datatypes ((List!14794 0))(
  ( (Nil!14791) (Cons!14790 (h!15919 (_ BitVec 64)) (t!21100 List!14794)) )
))
(declare-fun arrayNoDuplicates!0 (array!43423 (_ BitVec 32) List!14794) Bool)

(assert (=> b!798508 (= res!543168 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14791))))

(declare-fun b!798509 () Bool)

(assert (=> b!798509 (= e!442864 false)))

(declare-fun lt!356335 () SeekEntryResult!8380)

(assert (=> b!798509 (= lt!356335 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20792 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356338 () SeekEntryResult!8380)

(assert (=> b!798509 (= lt!356338 (seekEntryOrOpen!0 (select (arr!20792 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543161 () Bool)

(assert (=> start!68616 (=> (not res!543161) (not e!442863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68616 (= res!543161 (validMask!0 mask!3266))))

(assert (=> start!68616 e!442863))

(assert (=> start!68616 true))

(declare-fun array_inv!16675 (array!43423) Bool)

(assert (=> start!68616 (array_inv!16675 a!3170)))

(assert (= (and start!68616 res!543161) b!798502))

(assert (= (and b!798502 res!543167) b!798504))

(assert (= (and b!798504 res!543159) b!798507))

(assert (= (and b!798507 res!543164) b!798503))

(assert (= (and b!798503 res!543162) b!798500))

(assert (= (and b!798500 res!543160) b!798506))

(assert (= (and b!798506 res!543166) b!798508))

(assert (= (and b!798508 res!543168) b!798501))

(assert (= (and b!798501 res!543163) b!798505))

(assert (= (and b!798505 res!543165) b!798509))

(declare-fun m!738967 () Bool)

(assert (=> b!798504 m!738967))

(assert (=> b!798504 m!738967))

(declare-fun m!738969 () Bool)

(assert (=> b!798504 m!738969))

(declare-fun m!738971 () Bool)

(assert (=> b!798500 m!738971))

(declare-fun m!738973 () Bool)

(assert (=> b!798508 m!738973))

(declare-fun m!738975 () Bool)

(assert (=> b!798505 m!738975))

(declare-fun m!738977 () Bool)

(assert (=> b!798505 m!738977))

(declare-fun m!738979 () Bool)

(assert (=> b!798505 m!738979))

(declare-fun m!738981 () Bool)

(assert (=> b!798505 m!738981))

(declare-fun m!738983 () Bool)

(assert (=> b!798501 m!738983))

(declare-fun m!738985 () Bool)

(assert (=> b!798501 m!738985))

(declare-fun m!738987 () Bool)

(assert (=> b!798507 m!738987))

(declare-fun m!738989 () Bool)

(assert (=> start!68616 m!738989))

(declare-fun m!738991 () Bool)

(assert (=> start!68616 m!738991))

(declare-fun m!738993 () Bool)

(assert (=> b!798503 m!738993))

(declare-fun m!738995 () Bool)

(assert (=> b!798506 m!738995))

(assert (=> b!798509 m!738967))

(assert (=> b!798509 m!738967))

(declare-fun m!738997 () Bool)

(assert (=> b!798509 m!738997))

(assert (=> b!798509 m!738967))

(declare-fun m!738999 () Bool)

(assert (=> b!798509 m!738999))

(check-sat (not b!798504) (not b!798507) (not b!798508) (not b!798506) (not b!798505) (not b!798509) (not b!798500) (not b!798503) (not start!68616))
(check-sat)
