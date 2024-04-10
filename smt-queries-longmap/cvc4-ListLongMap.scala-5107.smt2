; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69252 () Bool)

(assert start!69252)

(declare-fun b!807998 () Bool)

(declare-fun res!552124 () Bool)

(declare-fun e!447305 () Bool)

(assert (=> b!807998 (=> (not res!552124) (not e!447305))))

(declare-datatypes ((array!43952 0))(
  ( (array!43953 (arr!21053 (Array (_ BitVec 32) (_ BitVec 64))) (size!21474 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43952)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43952 (_ BitVec 32)) Bool)

(assert (=> b!807998 (= res!552124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807999 () Bool)

(declare-fun res!552123 () Bool)

(declare-fun e!447304 () Bool)

(assert (=> b!807999 (=> (not res!552123) (not e!447304))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807999 (= res!552123 (validKeyInArray!0 (select (arr!21053 a!3170) j!153)))))

(declare-fun b!808000 () Bool)

(assert (=> b!808000 (= e!447304 e!447305)))

(declare-fun res!552128 () Bool)

(assert (=> b!808000 (=> (not res!552128) (not e!447305))))

(declare-datatypes ((SeekEntryResult!8644 0))(
  ( (MissingZero!8644 (index!36944 (_ BitVec 32))) (Found!8644 (index!36945 (_ BitVec 32))) (Intermediate!8644 (undefined!9456 Bool) (index!36946 (_ BitVec 32)) (x!67744 (_ BitVec 32))) (Undefined!8644) (MissingVacant!8644 (index!36947 (_ BitVec 32))) )
))
(declare-fun lt!362038 () SeekEntryResult!8644)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808000 (= res!552128 (or (= lt!362038 (MissingZero!8644 i!1163)) (= lt!362038 (MissingVacant!8644 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43952 (_ BitVec 32)) SeekEntryResult!8644)

(assert (=> b!808000 (= lt!362038 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808001 () Bool)

(declare-fun res!552125 () Bool)

(assert (=> b!808001 (=> (not res!552125) (not e!447304))))

(assert (=> b!808001 (= res!552125 (and (= (size!21474 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21474 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21474 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808002 () Bool)

(declare-fun e!447308 () Bool)

(assert (=> b!808002 (= e!447305 e!447308)))

(declare-fun res!552126 () Bool)

(assert (=> b!808002 (=> (not res!552126) (not e!447308))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362035 () array!43952)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362037 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43952 (_ BitVec 32)) SeekEntryResult!8644)

(assert (=> b!808002 (= res!552126 (= (seekEntryOrOpen!0 lt!362037 lt!362035 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362037 lt!362035 mask!3266)))))

(assert (=> b!808002 (= lt!362037 (select (store (arr!21053 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808002 (= lt!362035 (array!43953 (store (arr!21053 a!3170) i!1163 k!2044) (size!21474 a!3170)))))

(declare-fun b!808003 () Bool)

(declare-fun e!447306 () Bool)

(assert (=> b!808003 (= e!447308 e!447306)))

(declare-fun res!552130 () Bool)

(assert (=> b!808003 (=> (not res!552130) (not e!447306))))

(declare-fun lt!362034 () SeekEntryResult!8644)

(declare-fun lt!362036 () SeekEntryResult!8644)

(assert (=> b!808003 (= res!552130 (and (= lt!362034 lt!362036) (= lt!362036 (Found!8644 j!153)) (not (= (select (arr!21053 a!3170) index!1236) (select (arr!21053 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808003 (= lt!362036 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21053 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808003 (= lt!362034 (seekEntryOrOpen!0 (select (arr!21053 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808004 () Bool)

(assert (=> b!808004 (= e!447306 false)))

(declare-fun lt!362039 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808004 (= lt!362039 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808005 () Bool)

(declare-fun res!552131 () Bool)

(assert (=> b!808005 (=> (not res!552131) (not e!447305))))

(declare-datatypes ((List!15016 0))(
  ( (Nil!15013) (Cons!15012 (h!16141 (_ BitVec 64)) (t!21331 List!15016)) )
))
(declare-fun arrayNoDuplicates!0 (array!43952 (_ BitVec 32) List!15016) Bool)

(assert (=> b!808005 (= res!552131 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15013))))

(declare-fun b!808006 () Bool)

(declare-fun res!552129 () Bool)

(assert (=> b!808006 (=> (not res!552129) (not e!447304))))

(declare-fun arrayContainsKey!0 (array!43952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808006 (= res!552129 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808007 () Bool)

(declare-fun res!552127 () Bool)

(assert (=> b!808007 (=> (not res!552127) (not e!447304))))

(assert (=> b!808007 (= res!552127 (validKeyInArray!0 k!2044))))

(declare-fun res!552121 () Bool)

(assert (=> start!69252 (=> (not res!552121) (not e!447304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69252 (= res!552121 (validMask!0 mask!3266))))

(assert (=> start!69252 e!447304))

(assert (=> start!69252 true))

(declare-fun array_inv!16849 (array!43952) Bool)

(assert (=> start!69252 (array_inv!16849 a!3170)))

(declare-fun b!808008 () Bool)

(declare-fun res!552122 () Bool)

(assert (=> b!808008 (=> (not res!552122) (not e!447305))))

(assert (=> b!808008 (= res!552122 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21474 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21053 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21474 a!3170)) (= (select (arr!21053 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69252 res!552121) b!808001))

(assert (= (and b!808001 res!552125) b!807999))

(assert (= (and b!807999 res!552123) b!808007))

(assert (= (and b!808007 res!552127) b!808006))

(assert (= (and b!808006 res!552129) b!808000))

(assert (= (and b!808000 res!552128) b!807998))

(assert (= (and b!807998 res!552124) b!808005))

(assert (= (and b!808005 res!552131) b!808008))

(assert (= (and b!808008 res!552122) b!808002))

(assert (= (and b!808002 res!552126) b!808003))

(assert (= (and b!808003 res!552130) b!808004))

(declare-fun m!750117 () Bool)

(assert (=> b!807998 m!750117))

(declare-fun m!750119 () Bool)

(assert (=> b!808004 m!750119))

(declare-fun m!750121 () Bool)

(assert (=> start!69252 m!750121))

(declare-fun m!750123 () Bool)

(assert (=> start!69252 m!750123))

(declare-fun m!750125 () Bool)

(assert (=> b!808007 m!750125))

(declare-fun m!750127 () Bool)

(assert (=> b!808008 m!750127))

(declare-fun m!750129 () Bool)

(assert (=> b!808008 m!750129))

(declare-fun m!750131 () Bool)

(assert (=> b!808000 m!750131))

(declare-fun m!750133 () Bool)

(assert (=> b!808002 m!750133))

(declare-fun m!750135 () Bool)

(assert (=> b!808002 m!750135))

(declare-fun m!750137 () Bool)

(assert (=> b!808002 m!750137))

(declare-fun m!750139 () Bool)

(assert (=> b!808002 m!750139))

(declare-fun m!750141 () Bool)

(assert (=> b!808006 m!750141))

(declare-fun m!750143 () Bool)

(assert (=> b!808005 m!750143))

(declare-fun m!750145 () Bool)

(assert (=> b!808003 m!750145))

(declare-fun m!750147 () Bool)

(assert (=> b!808003 m!750147))

(assert (=> b!808003 m!750147))

(declare-fun m!750149 () Bool)

(assert (=> b!808003 m!750149))

(assert (=> b!808003 m!750147))

(declare-fun m!750151 () Bool)

(assert (=> b!808003 m!750151))

(assert (=> b!807999 m!750147))

(assert (=> b!807999 m!750147))

(declare-fun m!750153 () Bool)

(assert (=> b!807999 m!750153))

(push 1)

