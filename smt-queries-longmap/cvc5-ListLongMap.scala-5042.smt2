; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68762 () Bool)

(assert start!68762)

(declare-fun b!801186 () Bool)

(declare-fun e!444139 () Bool)

(declare-fun e!444138 () Bool)

(assert (=> b!801186 (= e!444139 e!444138)))

(declare-fun res!545708 () Bool)

(assert (=> b!801186 (=> (not res!545708) (not e!444138))))

(declare-datatypes ((SeekEntryResult!8447 0))(
  ( (MissingZero!8447 (index!36156 (_ BitVec 32))) (Found!8447 (index!36157 (_ BitVec 32))) (Intermediate!8447 (undefined!9259 Bool) (index!36158 (_ BitVec 32)) (x!67021 (_ BitVec 32))) (Undefined!8447) (MissingVacant!8447 (index!36159 (_ BitVec 32))) )
))
(declare-fun lt!358070 () SeekEntryResult!8447)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801186 (= res!545708 (or (= lt!358070 (MissingZero!8447 i!1163)) (= lt!358070 (MissingVacant!8447 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43552 0))(
  ( (array!43553 (arr!20856 (Array (_ BitVec 32) (_ BitVec 64))) (size!21277 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43552)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43552 (_ BitVec 32)) SeekEntryResult!8447)

(assert (=> b!801186 (= lt!358070 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801187 () Bool)

(declare-fun e!444135 () Bool)

(assert (=> b!801187 (= e!444138 e!444135)))

(declare-fun res!545709 () Bool)

(assert (=> b!801187 (=> (not res!545709) (not e!444135))))

(declare-fun lt!358072 () SeekEntryResult!8447)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358068 () array!43552)

(declare-fun lt!358069 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43552 (_ BitVec 32)) SeekEntryResult!8447)

(assert (=> b!801187 (= res!545709 (= lt!358072 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358069 lt!358068 mask!3266)))))

(assert (=> b!801187 (= lt!358072 (seekEntryOrOpen!0 lt!358069 lt!358068 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801187 (= lt!358069 (select (store (arr!20856 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801187 (= lt!358068 (array!43553 (store (arr!20856 a!3170) i!1163 k!2044) (size!21277 a!3170)))))

(declare-fun b!801188 () Bool)

(declare-fun res!545706 () Bool)

(assert (=> b!801188 (=> (not res!545706) (not e!444139))))

(assert (=> b!801188 (= res!545706 (and (= (size!21277 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21277 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21277 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801189 () Bool)

(declare-fun res!545714 () Bool)

(assert (=> b!801189 (=> (not res!545714) (not e!444139))))

(declare-fun arrayContainsKey!0 (array!43552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801189 (= res!545714 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801190 () Bool)

(declare-fun res!545715 () Bool)

(declare-fun e!444137 () Bool)

(assert (=> b!801190 (=> (not res!545715) (not e!444137))))

(declare-fun lt!358073 () (_ BitVec 32))

(assert (=> b!801190 (= res!545715 (= lt!358072 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358073 vacantAfter!23 lt!358069 lt!358068 mask!3266)))))

(declare-fun b!801191 () Bool)

(declare-fun res!545712 () Bool)

(assert (=> b!801191 (=> (not res!545712) (not e!444139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801191 (= res!545712 (validKeyInArray!0 k!2044))))

(declare-fun b!801192 () Bool)

(assert (=> b!801192 (= e!444137 false)))

(declare-fun lt!358066 () SeekEntryResult!8447)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801192 (= lt!358066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358073 vacantBefore!23 (select (arr!20856 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801193 () Bool)

(declare-fun res!545707 () Bool)

(assert (=> b!801193 (=> (not res!545707) (not e!444138))))

(assert (=> b!801193 (= res!545707 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21277 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20856 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21277 a!3170)) (= (select (arr!20856 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801194 () Bool)

(declare-fun res!545716 () Bool)

(assert (=> b!801194 (=> (not res!545716) (not e!444138))))

(declare-datatypes ((List!14819 0))(
  ( (Nil!14816) (Cons!14815 (h!15944 (_ BitVec 64)) (t!21134 List!14819)) )
))
(declare-fun arrayNoDuplicates!0 (array!43552 (_ BitVec 32) List!14819) Bool)

(assert (=> b!801194 (= res!545716 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14816))))

(declare-fun b!801195 () Bool)

(declare-fun e!444140 () Bool)

(assert (=> b!801195 (= e!444135 e!444140)))

(declare-fun res!545717 () Bool)

(assert (=> b!801195 (=> (not res!545717) (not e!444140))))

(declare-fun lt!358067 () SeekEntryResult!8447)

(declare-fun lt!358071 () SeekEntryResult!8447)

(assert (=> b!801195 (= res!545717 (and (= lt!358067 lt!358071) (= lt!358071 (Found!8447 j!153)) (not (= (select (arr!20856 a!3170) index!1236) (select (arr!20856 a!3170) j!153)))))))

(assert (=> b!801195 (= lt!358071 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20856 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801195 (= lt!358067 (seekEntryOrOpen!0 (select (arr!20856 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801196 () Bool)

(assert (=> b!801196 (= e!444140 e!444137)))

(declare-fun res!545710 () Bool)

(assert (=> b!801196 (=> (not res!545710) (not e!444137))))

(assert (=> b!801196 (= res!545710 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358073 #b00000000000000000000000000000000) (bvslt lt!358073 (size!21277 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801196 (= lt!358073 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!545711 () Bool)

(assert (=> start!68762 (=> (not res!545711) (not e!444139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68762 (= res!545711 (validMask!0 mask!3266))))

(assert (=> start!68762 e!444139))

(assert (=> start!68762 true))

(declare-fun array_inv!16652 (array!43552) Bool)

(assert (=> start!68762 (array_inv!16652 a!3170)))

(declare-fun b!801197 () Bool)

(declare-fun res!545705 () Bool)

(assert (=> b!801197 (=> (not res!545705) (not e!444139))))

(assert (=> b!801197 (= res!545705 (validKeyInArray!0 (select (arr!20856 a!3170) j!153)))))

(declare-fun b!801198 () Bool)

(declare-fun res!545713 () Bool)

(assert (=> b!801198 (=> (not res!545713) (not e!444138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43552 (_ BitVec 32)) Bool)

(assert (=> b!801198 (= res!545713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68762 res!545711) b!801188))

(assert (= (and b!801188 res!545706) b!801197))

(assert (= (and b!801197 res!545705) b!801191))

(assert (= (and b!801191 res!545712) b!801189))

(assert (= (and b!801189 res!545714) b!801186))

(assert (= (and b!801186 res!545708) b!801198))

(assert (= (and b!801198 res!545713) b!801194))

(assert (= (and b!801194 res!545716) b!801193))

(assert (= (and b!801193 res!545707) b!801187))

(assert (= (and b!801187 res!545709) b!801195))

(assert (= (and b!801195 res!545717) b!801196))

(assert (= (and b!801196 res!545710) b!801190))

(assert (= (and b!801190 res!545715) b!801192))

(declare-fun m!742331 () Bool)

(assert (=> b!801192 m!742331))

(assert (=> b!801192 m!742331))

(declare-fun m!742333 () Bool)

(assert (=> b!801192 m!742333))

(declare-fun m!742335 () Bool)

(assert (=> b!801186 m!742335))

(declare-fun m!742337 () Bool)

(assert (=> b!801189 m!742337))

(declare-fun m!742339 () Bool)

(assert (=> b!801193 m!742339))

(declare-fun m!742341 () Bool)

(assert (=> b!801193 m!742341))

(assert (=> b!801197 m!742331))

(assert (=> b!801197 m!742331))

(declare-fun m!742343 () Bool)

(assert (=> b!801197 m!742343))

(declare-fun m!742345 () Bool)

(assert (=> b!801198 m!742345))

(declare-fun m!742347 () Bool)

(assert (=> b!801187 m!742347))

(declare-fun m!742349 () Bool)

(assert (=> b!801187 m!742349))

(declare-fun m!742351 () Bool)

(assert (=> b!801187 m!742351))

(declare-fun m!742353 () Bool)

(assert (=> b!801187 m!742353))

(declare-fun m!742355 () Bool)

(assert (=> b!801196 m!742355))

(declare-fun m!742357 () Bool)

(assert (=> start!68762 m!742357))

(declare-fun m!742359 () Bool)

(assert (=> start!68762 m!742359))

(declare-fun m!742361 () Bool)

(assert (=> b!801191 m!742361))

(declare-fun m!742363 () Bool)

(assert (=> b!801195 m!742363))

(assert (=> b!801195 m!742331))

(assert (=> b!801195 m!742331))

(declare-fun m!742365 () Bool)

(assert (=> b!801195 m!742365))

(assert (=> b!801195 m!742331))

(declare-fun m!742367 () Bool)

(assert (=> b!801195 m!742367))

(declare-fun m!742369 () Bool)

(assert (=> b!801190 m!742369))

(declare-fun m!742371 () Bool)

(assert (=> b!801194 m!742371))

(push 1)

