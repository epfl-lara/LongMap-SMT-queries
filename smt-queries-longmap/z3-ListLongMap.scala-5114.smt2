; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69400 () Bool)

(assert start!69400)

(declare-fun res!552911 () Bool)

(declare-fun e!447931 () Bool)

(assert (=> start!69400 (=> (not res!552911) (not e!447931))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69400 (= res!552911 (validMask!0 mask!3266))))

(assert (=> start!69400 e!447931))

(assert (=> start!69400 true))

(declare-datatypes ((array!43998 0))(
  ( (array!43999 (arr!21073 (Array (_ BitVec 32) (_ BitVec 64))) (size!21494 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43998)

(declare-fun array_inv!16869 (array!43998) Bool)

(assert (=> start!69400 (array_inv!16869 a!3170)))

(declare-fun b!809180 () Bool)

(declare-fun e!447930 () Bool)

(declare-fun e!447932 () Bool)

(assert (=> b!809180 (= e!447930 e!447932)))

(declare-fun res!552907 () Bool)

(assert (=> b!809180 (=> (not res!552907) (not e!447932))))

(declare-datatypes ((SeekEntryResult!8664 0))(
  ( (MissingZero!8664 (index!37024 (_ BitVec 32))) (Found!8664 (index!37025 (_ BitVec 32))) (Intermediate!8664 (undefined!9476 Bool) (index!37026 (_ BitVec 32)) (x!67832 (_ BitVec 32))) (Undefined!8664) (MissingVacant!8664 (index!37027 (_ BitVec 32))) )
))
(declare-fun lt!362604 () SeekEntryResult!8664)

(declare-fun lt!362605 () SeekEntryResult!8664)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809180 (= res!552907 (and (= lt!362605 lt!362604) (= lt!362604 (Found!8664 j!153)) (not (= (select (arr!21073 a!3170) index!1236) (select (arr!21073 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43998 (_ BitVec 32)) SeekEntryResult!8664)

(assert (=> b!809180 (= lt!362604 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21073 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43998 (_ BitVec 32)) SeekEntryResult!8664)

(assert (=> b!809180 (= lt!362605 (seekEntryOrOpen!0 (select (arr!21073 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809181 () Bool)

(declare-fun res!552914 () Bool)

(assert (=> b!809181 (=> (not res!552914) (not e!447931))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809181 (= res!552914 (and (= (size!21494 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21494 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21494 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809182 () Bool)

(declare-fun res!552917 () Bool)

(assert (=> b!809182 (=> (not res!552917) (not e!447931))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809182 (= res!552917 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809183 () Bool)

(declare-fun res!552908 () Bool)

(assert (=> b!809183 (=> (not res!552908) (not e!447931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809183 (= res!552908 (validKeyInArray!0 (select (arr!21073 a!3170) j!153)))))

(declare-fun b!809184 () Bool)

(declare-fun res!552916 () Bool)

(declare-fun e!447928 () Bool)

(assert (=> b!809184 (=> (not res!552916) (not e!447928))))

(declare-datatypes ((List!15036 0))(
  ( (Nil!15033) (Cons!15032 (h!16161 (_ BitVec 64)) (t!21351 List!15036)) )
))
(declare-fun arrayNoDuplicates!0 (array!43998 (_ BitVec 32) List!15036) Bool)

(assert (=> b!809184 (= res!552916 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15033))))

(declare-fun b!809185 () Bool)

(assert (=> b!809185 (= e!447931 e!447928)))

(declare-fun res!552909 () Bool)

(assert (=> b!809185 (=> (not res!552909) (not e!447928))))

(declare-fun lt!362606 () SeekEntryResult!8664)

(assert (=> b!809185 (= res!552909 (or (= lt!362606 (MissingZero!8664 i!1163)) (= lt!362606 (MissingVacant!8664 i!1163))))))

(assert (=> b!809185 (= lt!362606 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809186 () Bool)

(assert (=> b!809186 (= e!447932 false)))

(declare-fun lt!362609 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809186 (= lt!362609 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809187 () Bool)

(declare-fun res!552915 () Bool)

(assert (=> b!809187 (=> (not res!552915) (not e!447928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43998 (_ BitVec 32)) Bool)

(assert (=> b!809187 (= res!552915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809188 () Bool)

(declare-fun res!552910 () Bool)

(assert (=> b!809188 (=> (not res!552910) (not e!447931))))

(assert (=> b!809188 (= res!552910 (validKeyInArray!0 k0!2044))))

(declare-fun b!809189 () Bool)

(declare-fun res!552912 () Bool)

(assert (=> b!809189 (=> (not res!552912) (not e!447928))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809189 (= res!552912 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21494 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21073 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21494 a!3170)) (= (select (arr!21073 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809190 () Bool)

(assert (=> b!809190 (= e!447928 e!447930)))

(declare-fun res!552913 () Bool)

(assert (=> b!809190 (=> (not res!552913) (not e!447930))))

(declare-fun lt!362608 () array!43998)

(declare-fun lt!362607 () (_ BitVec 64))

(assert (=> b!809190 (= res!552913 (= (seekEntryOrOpen!0 lt!362607 lt!362608 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362607 lt!362608 mask!3266)))))

(assert (=> b!809190 (= lt!362607 (select (store (arr!21073 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809190 (= lt!362608 (array!43999 (store (arr!21073 a!3170) i!1163 k0!2044) (size!21494 a!3170)))))

(assert (= (and start!69400 res!552911) b!809181))

(assert (= (and b!809181 res!552914) b!809183))

(assert (= (and b!809183 res!552908) b!809188))

(assert (= (and b!809188 res!552910) b!809182))

(assert (= (and b!809182 res!552917) b!809185))

(assert (= (and b!809185 res!552909) b!809187))

(assert (= (and b!809187 res!552915) b!809184))

(assert (= (and b!809184 res!552916) b!809189))

(assert (= (and b!809189 res!552912) b!809190))

(assert (= (and b!809190 res!552913) b!809180))

(assert (= (and b!809180 res!552907) b!809186))

(declare-fun m!751333 () Bool)

(assert (=> b!809184 m!751333))

(declare-fun m!751335 () Bool)

(assert (=> b!809183 m!751335))

(assert (=> b!809183 m!751335))

(declare-fun m!751337 () Bool)

(assert (=> b!809183 m!751337))

(declare-fun m!751339 () Bool)

(assert (=> start!69400 m!751339))

(declare-fun m!751341 () Bool)

(assert (=> start!69400 m!751341))

(declare-fun m!751343 () Bool)

(assert (=> b!809187 m!751343))

(declare-fun m!751345 () Bool)

(assert (=> b!809190 m!751345))

(declare-fun m!751347 () Bool)

(assert (=> b!809190 m!751347))

(declare-fun m!751349 () Bool)

(assert (=> b!809190 m!751349))

(declare-fun m!751351 () Bool)

(assert (=> b!809190 m!751351))

(declare-fun m!751353 () Bool)

(assert (=> b!809185 m!751353))

(declare-fun m!751355 () Bool)

(assert (=> b!809186 m!751355))

(declare-fun m!751357 () Bool)

(assert (=> b!809182 m!751357))

(declare-fun m!751359 () Bool)

(assert (=> b!809180 m!751359))

(assert (=> b!809180 m!751335))

(assert (=> b!809180 m!751335))

(declare-fun m!751361 () Bool)

(assert (=> b!809180 m!751361))

(assert (=> b!809180 m!751335))

(declare-fun m!751363 () Bool)

(assert (=> b!809180 m!751363))

(declare-fun m!751365 () Bool)

(assert (=> b!809189 m!751365))

(declare-fun m!751367 () Bool)

(assert (=> b!809189 m!751367))

(declare-fun m!751369 () Bool)

(assert (=> b!809188 m!751369))

(check-sat (not b!809186) (not b!809187) (not b!809190) (not b!809182) (not b!809188) (not b!809180) (not b!809184) (not b!809185) (not b!809183) (not start!69400))
(check-sat)
