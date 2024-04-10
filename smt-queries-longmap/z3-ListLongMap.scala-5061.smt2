; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68878 () Bool)

(assert start!68878)

(declare-fun b!803224 () Bool)

(declare-fun e!445095 () Bool)

(declare-fun e!445096 () Bool)

(assert (=> b!803224 (= e!445095 e!445096)))

(declare-fun res!547744 () Bool)

(assert (=> b!803224 (=> (not res!547744) (not e!445096))))

(declare-datatypes ((SeekEntryResult!8505 0))(
  ( (MissingZero!8505 (index!36388 (_ BitVec 32))) (Found!8505 (index!36389 (_ BitVec 32))) (Intermediate!8505 (undefined!9317 Bool) (index!36390 (_ BitVec 32)) (x!67231 (_ BitVec 32))) (Undefined!8505) (MissingVacant!8505 (index!36391 (_ BitVec 32))) )
))
(declare-fun lt!359444 () SeekEntryResult!8505)

(declare-datatypes ((array!43668 0))(
  ( (array!43669 (arr!20914 (Array (_ BitVec 32) (_ BitVec 64))) (size!21335 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43668)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359446 () SeekEntryResult!8505)

(assert (=> b!803224 (= res!547744 (and (= lt!359444 lt!359446) (not (= (select (arr!20914 a!3170) index!1236) (select (arr!20914 a!3170) j!153)))))))

(assert (=> b!803224 (= lt!359446 (Found!8505 j!153))))

(declare-fun b!803225 () Bool)

(declare-fun res!547753 () Bool)

(declare-fun e!445098 () Bool)

(assert (=> b!803225 (=> (not res!547753) (not e!445098))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803225 (= res!547753 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21335 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20914 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21335 a!3170)) (= (select (arr!20914 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803226 () Bool)

(declare-fun e!445097 () Bool)

(assert (=> b!803226 (= e!445096 (not e!445097))))

(declare-fun res!547752 () Bool)

(assert (=> b!803226 (=> res!547752 e!445097)))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!359447 () SeekEntryResult!8505)

(assert (=> b!803226 (= res!547752 (or (not (= lt!359447 lt!359446)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20914 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359442 () array!43668)

(declare-fun lt!359448 () (_ BitVec 64))

(declare-fun lt!359445 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43668 (_ BitVec 32)) SeekEntryResult!8505)

(assert (=> b!803226 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359445 vacantAfter!23 lt!359448 lt!359442 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359445 vacantBefore!23 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27550 0))(
  ( (Unit!27551) )
))
(declare-fun lt!359441 () Unit!27550)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27550)

(assert (=> b!803226 (= lt!359441 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359445 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803226 (= lt!359445 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803227 () Bool)

(declare-fun res!547742 () Bool)

(declare-fun e!445094 () Bool)

(assert (=> b!803227 (=> (not res!547742) (not e!445094))))

(declare-fun arrayContainsKey!0 (array!43668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803227 (= res!547742 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803228 () Bool)

(declare-fun res!547748 () Bool)

(assert (=> b!803228 (=> (not res!547748) (not e!445094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803228 (= res!547748 (validKeyInArray!0 k0!2044))))

(declare-fun b!803229 () Bool)

(declare-fun res!547747 () Bool)

(assert (=> b!803229 (=> (not res!547747) (not e!445098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43668 (_ BitVec 32)) Bool)

(assert (=> b!803229 (= res!547747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803230 () Bool)

(declare-fun res!547749 () Bool)

(assert (=> b!803230 (=> (not res!547749) (not e!445098))))

(declare-datatypes ((List!14877 0))(
  ( (Nil!14874) (Cons!14873 (h!16002 (_ BitVec 64)) (t!21192 List!14877)) )
))
(declare-fun arrayNoDuplicates!0 (array!43668 (_ BitVec 32) List!14877) Bool)

(assert (=> b!803230 (= res!547749 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14874))))

(declare-fun b!803231 () Bool)

(declare-fun res!547746 () Bool)

(assert (=> b!803231 (=> (not res!547746) (not e!445094))))

(assert (=> b!803231 (= res!547746 (and (= (size!21335 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21335 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21335 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803223 () Bool)

(declare-fun e!445099 () Bool)

(assert (=> b!803223 (= e!445098 e!445099)))

(declare-fun res!547751 () Bool)

(assert (=> b!803223 (=> (not res!547751) (not e!445099))))

(declare-fun lt!359443 () SeekEntryResult!8505)

(assert (=> b!803223 (= res!547751 (= lt!359443 lt!359447))))

(assert (=> b!803223 (= lt!359447 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359448 lt!359442 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43668 (_ BitVec 32)) SeekEntryResult!8505)

(assert (=> b!803223 (= lt!359443 (seekEntryOrOpen!0 lt!359448 lt!359442 mask!3266))))

(assert (=> b!803223 (= lt!359448 (select (store (arr!20914 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803223 (= lt!359442 (array!43669 (store (arr!20914 a!3170) i!1163 k0!2044) (size!21335 a!3170)))))

(declare-fun res!547754 () Bool)

(assert (=> start!68878 (=> (not res!547754) (not e!445094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68878 (= res!547754 (validMask!0 mask!3266))))

(assert (=> start!68878 e!445094))

(assert (=> start!68878 true))

(declare-fun array_inv!16710 (array!43668) Bool)

(assert (=> start!68878 (array_inv!16710 a!3170)))

(declare-fun b!803232 () Bool)

(assert (=> b!803232 (= e!445097 (validKeyInArray!0 lt!359448))))

(declare-fun b!803233 () Bool)

(assert (=> b!803233 (= e!445099 e!445095)))

(declare-fun res!547750 () Bool)

(assert (=> b!803233 (=> (not res!547750) (not e!445095))))

(declare-fun lt!359450 () SeekEntryResult!8505)

(assert (=> b!803233 (= res!547750 (= lt!359450 lt!359444))))

(assert (=> b!803233 (= lt!359444 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803233 (= lt!359450 (seekEntryOrOpen!0 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803234 () Bool)

(assert (=> b!803234 (= e!445094 e!445098)))

(declare-fun res!547745 () Bool)

(assert (=> b!803234 (=> (not res!547745) (not e!445098))))

(declare-fun lt!359449 () SeekEntryResult!8505)

(assert (=> b!803234 (= res!547745 (or (= lt!359449 (MissingZero!8505 i!1163)) (= lt!359449 (MissingVacant!8505 i!1163))))))

(assert (=> b!803234 (= lt!359449 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803235 () Bool)

(declare-fun res!547743 () Bool)

(assert (=> b!803235 (=> (not res!547743) (not e!445094))))

(assert (=> b!803235 (= res!547743 (validKeyInArray!0 (select (arr!20914 a!3170) j!153)))))

(assert (= (and start!68878 res!547754) b!803231))

(assert (= (and b!803231 res!547746) b!803235))

(assert (= (and b!803235 res!547743) b!803228))

(assert (= (and b!803228 res!547748) b!803227))

(assert (= (and b!803227 res!547742) b!803234))

(assert (= (and b!803234 res!547745) b!803229))

(assert (= (and b!803229 res!547747) b!803230))

(assert (= (and b!803230 res!547749) b!803225))

(assert (= (and b!803225 res!547753) b!803223))

(assert (= (and b!803223 res!547751) b!803233))

(assert (= (and b!803233 res!547750) b!803224))

(assert (= (and b!803224 res!547744) b!803226))

(assert (= (and b!803226 (not res!547752)) b!803232))

(declare-fun m!744887 () Bool)

(assert (=> b!803227 m!744887))

(declare-fun m!744889 () Bool)

(assert (=> b!803226 m!744889))

(declare-fun m!744891 () Bool)

(assert (=> b!803226 m!744891))

(declare-fun m!744893 () Bool)

(assert (=> b!803226 m!744893))

(declare-fun m!744895 () Bool)

(assert (=> b!803226 m!744895))

(assert (=> b!803226 m!744889))

(declare-fun m!744897 () Bool)

(assert (=> b!803226 m!744897))

(declare-fun m!744899 () Bool)

(assert (=> b!803226 m!744899))

(declare-fun m!744901 () Bool)

(assert (=> b!803226 m!744901))

(assert (=> b!803235 m!744889))

(assert (=> b!803235 m!744889))

(declare-fun m!744903 () Bool)

(assert (=> b!803235 m!744903))

(declare-fun m!744905 () Bool)

(assert (=> start!68878 m!744905))

(declare-fun m!744907 () Bool)

(assert (=> start!68878 m!744907))

(declare-fun m!744909 () Bool)

(assert (=> b!803223 m!744909))

(declare-fun m!744911 () Bool)

(assert (=> b!803223 m!744911))

(assert (=> b!803223 m!744901))

(declare-fun m!744913 () Bool)

(assert (=> b!803223 m!744913))

(assert (=> b!803233 m!744889))

(assert (=> b!803233 m!744889))

(declare-fun m!744915 () Bool)

(assert (=> b!803233 m!744915))

(assert (=> b!803233 m!744889))

(declare-fun m!744917 () Bool)

(assert (=> b!803233 m!744917))

(declare-fun m!744919 () Bool)

(assert (=> b!803229 m!744919))

(declare-fun m!744921 () Bool)

(assert (=> b!803232 m!744921))

(declare-fun m!744923 () Bool)

(assert (=> b!803234 m!744923))

(declare-fun m!744925 () Bool)

(assert (=> b!803228 m!744925))

(declare-fun m!744927 () Bool)

(assert (=> b!803225 m!744927))

(declare-fun m!744929 () Bool)

(assert (=> b!803225 m!744929))

(declare-fun m!744931 () Bool)

(assert (=> b!803230 m!744931))

(declare-fun m!744933 () Bool)

(assert (=> b!803224 m!744933))

(assert (=> b!803224 m!744889))

(check-sat (not b!803235) (not start!68878) (not b!803230) (not b!803232) (not b!803226) (not b!803233) (not b!803227) (not b!803228) (not b!803223) (not b!803234) (not b!803229))
(check-sat)
