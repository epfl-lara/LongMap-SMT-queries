; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69010 () Bool)

(assert start!69010)

(declare-fun b!805089 () Bool)

(declare-fun res!549610 () Bool)

(declare-fun e!445910 () Bool)

(assert (=> b!805089 (=> (not res!549610) (not e!445910))))

(declare-datatypes ((array!43800 0))(
  ( (array!43801 (arr!20980 (Array (_ BitVec 32) (_ BitVec 64))) (size!21401 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43800)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805089 (= res!549610 (validKeyInArray!0 (select (arr!20980 a!3170) j!153)))))

(declare-fun b!805090 () Bool)

(declare-fun res!549613 () Bool)

(declare-fun e!445908 () Bool)

(assert (=> b!805090 (=> (not res!549613) (not e!445908))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805090 (= res!549613 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21401 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20980 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21401 a!3170)) (= (select (arr!20980 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805091 () Bool)

(declare-fun e!445909 () Bool)

(assert (=> b!805091 (= e!445908 e!445909)))

(declare-fun res!549612 () Bool)

(assert (=> b!805091 (=> (not res!549612) (not e!445909))))

(declare-fun lt!360452 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360453 () array!43800)

(declare-datatypes ((SeekEntryResult!8571 0))(
  ( (MissingZero!8571 (index!36652 (_ BitVec 32))) (Found!8571 (index!36653 (_ BitVec 32))) (Intermediate!8571 (undefined!9383 Bool) (index!36654 (_ BitVec 32)) (x!67473 (_ BitVec 32))) (Undefined!8571) (MissingVacant!8571 (index!36655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43800 (_ BitVec 32)) SeekEntryResult!8571)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43800 (_ BitVec 32)) SeekEntryResult!8571)

(assert (=> b!805091 (= res!549612 (= (seekEntryOrOpen!0 lt!360452 lt!360453 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360452 lt!360453 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805091 (= lt!360452 (select (store (arr!20980 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805091 (= lt!360453 (array!43801 (store (arr!20980 a!3170) i!1163 k0!2044) (size!21401 a!3170)))))

(declare-fun b!805092 () Bool)

(assert (=> b!805092 (= e!445910 e!445908)))

(declare-fun res!549609 () Bool)

(assert (=> b!805092 (=> (not res!549609) (not e!445908))))

(declare-fun lt!360454 () SeekEntryResult!8571)

(assert (=> b!805092 (= res!549609 (or (= lt!360454 (MissingZero!8571 i!1163)) (= lt!360454 (MissingVacant!8571 i!1163))))))

(assert (=> b!805092 (= lt!360454 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805093 () Bool)

(declare-fun res!549611 () Bool)

(assert (=> b!805093 (=> (not res!549611) (not e!445908))))

(declare-datatypes ((List!14943 0))(
  ( (Nil!14940) (Cons!14939 (h!16068 (_ BitVec 64)) (t!21258 List!14943)) )
))
(declare-fun arrayNoDuplicates!0 (array!43800 (_ BitVec 32) List!14943) Bool)

(assert (=> b!805093 (= res!549611 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14940))))

(declare-fun res!549616 () Bool)

(assert (=> start!69010 (=> (not res!549616) (not e!445910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69010 (= res!549616 (validMask!0 mask!3266))))

(assert (=> start!69010 e!445910))

(assert (=> start!69010 true))

(declare-fun array_inv!16776 (array!43800) Bool)

(assert (=> start!69010 (array_inv!16776 a!3170)))

(declare-fun b!805094 () Bool)

(declare-fun res!549608 () Bool)

(assert (=> b!805094 (=> (not res!549608) (not e!445910))))

(assert (=> b!805094 (= res!549608 (validKeyInArray!0 k0!2044))))

(declare-fun b!805095 () Bool)

(declare-fun res!549615 () Bool)

(assert (=> b!805095 (=> (not res!549615) (not e!445910))))

(declare-fun arrayContainsKey!0 (array!43800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805095 (= res!549615 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805096 () Bool)

(assert (=> b!805096 (= e!445909 false)))

(declare-fun lt!360451 () SeekEntryResult!8571)

(assert (=> b!805096 (= lt!360451 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20980 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360455 () SeekEntryResult!8571)

(assert (=> b!805096 (= lt!360455 (seekEntryOrOpen!0 (select (arr!20980 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805097 () Bool)

(declare-fun res!549614 () Bool)

(assert (=> b!805097 (=> (not res!549614) (not e!445910))))

(assert (=> b!805097 (= res!549614 (and (= (size!21401 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21401 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21401 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805098 () Bool)

(declare-fun res!549617 () Bool)

(assert (=> b!805098 (=> (not res!549617) (not e!445908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43800 (_ BitVec 32)) Bool)

(assert (=> b!805098 (= res!549617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69010 res!549616) b!805097))

(assert (= (and b!805097 res!549614) b!805089))

(assert (= (and b!805089 res!549610) b!805094))

(assert (= (and b!805094 res!549608) b!805095))

(assert (= (and b!805095 res!549615) b!805092))

(assert (= (and b!805092 res!549609) b!805098))

(assert (= (and b!805098 res!549617) b!805093))

(assert (= (and b!805093 res!549611) b!805090))

(assert (= (and b!805090 res!549613) b!805091))

(assert (= (and b!805091 res!549612) b!805096))

(declare-fun m!746991 () Bool)

(assert (=> b!805090 m!746991))

(declare-fun m!746993 () Bool)

(assert (=> b!805090 m!746993))

(declare-fun m!746995 () Bool)

(assert (=> b!805096 m!746995))

(assert (=> b!805096 m!746995))

(declare-fun m!746997 () Bool)

(assert (=> b!805096 m!746997))

(assert (=> b!805096 m!746995))

(declare-fun m!746999 () Bool)

(assert (=> b!805096 m!746999))

(declare-fun m!747001 () Bool)

(assert (=> b!805093 m!747001))

(declare-fun m!747003 () Bool)

(assert (=> b!805094 m!747003))

(assert (=> b!805089 m!746995))

(assert (=> b!805089 m!746995))

(declare-fun m!747005 () Bool)

(assert (=> b!805089 m!747005))

(declare-fun m!747007 () Bool)

(assert (=> b!805091 m!747007))

(declare-fun m!747009 () Bool)

(assert (=> b!805091 m!747009))

(declare-fun m!747011 () Bool)

(assert (=> b!805091 m!747011))

(declare-fun m!747013 () Bool)

(assert (=> b!805091 m!747013))

(declare-fun m!747015 () Bool)

(assert (=> b!805092 m!747015))

(declare-fun m!747017 () Bool)

(assert (=> b!805098 m!747017))

(declare-fun m!747019 () Bool)

(assert (=> start!69010 m!747019))

(declare-fun m!747021 () Bool)

(assert (=> start!69010 m!747021))

(declare-fun m!747023 () Bool)

(assert (=> b!805095 m!747023))

(check-sat (not b!805096) (not b!805089) (not b!805092) (not b!805091) (not b!805093) (not b!805094) (not start!69010) (not b!805098) (not b!805095))
(check-sat)
