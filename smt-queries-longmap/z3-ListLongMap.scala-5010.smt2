; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68694 () Bool)

(assert start!68694)

(declare-fun b!798314 () Bool)

(declare-fun res!542465 () Bool)

(declare-fun e!442946 () Bool)

(assert (=> b!798314 (=> (not res!542465) (not e!442946))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43358 0))(
  ( (array!43359 (arr!20755 (Array (_ BitVec 32) (_ BitVec 64))) (size!21175 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43358)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798314 (= res!542465 (and (= (size!21175 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21175 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21175 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798315 () Bool)

(declare-fun e!442947 () Bool)

(declare-fun e!442944 () Bool)

(assert (=> b!798315 (= e!442947 e!442944)))

(declare-fun res!542469 () Bool)

(assert (=> b!798315 (=> (not res!542469) (not e!442944))))

(declare-datatypes ((SeekEntryResult!8302 0))(
  ( (MissingZero!8302 (index!35576 (_ BitVec 32))) (Found!8302 (index!35577 (_ BitVec 32))) (Intermediate!8302 (undefined!9114 Bool) (index!35578 (_ BitVec 32)) (x!66631 (_ BitVec 32))) (Undefined!8302) (MissingVacant!8302 (index!35579 (_ BitVec 32))) )
))
(declare-fun lt!356188 () SeekEntryResult!8302)

(declare-fun lt!356190 () SeekEntryResult!8302)

(assert (=> b!798315 (= res!542469 (= lt!356188 lt!356190))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356189 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356187 () array!43358)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43358 (_ BitVec 32)) SeekEntryResult!8302)

(assert (=> b!798315 (= lt!356190 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356189 lt!356187 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43358 (_ BitVec 32)) SeekEntryResult!8302)

(assert (=> b!798315 (= lt!356188 (seekEntryOrOpen!0 lt!356189 lt!356187 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798315 (= lt!356189 (select (store (arr!20755 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798315 (= lt!356187 (array!43359 (store (arr!20755 a!3170) i!1163 k0!2044) (size!21175 a!3170)))))

(declare-fun b!798316 () Bool)

(declare-fun res!542466 () Bool)

(assert (=> b!798316 (=> (not res!542466) (not e!442947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43358 (_ BitVec 32)) Bool)

(assert (=> b!798316 (= res!542466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798317 () Bool)

(declare-fun res!542464 () Bool)

(assert (=> b!798317 (=> (not res!542464) (not e!442946))))

(declare-fun arrayContainsKey!0 (array!43358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798317 (= res!542464 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798318 () Bool)

(declare-fun res!542463 () Bool)

(assert (=> b!798318 (=> (not res!542463) (not e!442946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798318 (= res!542463 (validKeyInArray!0 k0!2044))))

(declare-fun b!798319 () Bool)

(declare-fun res!542462 () Bool)

(assert (=> b!798319 (=> (not res!542462) (not e!442947))))

(declare-datatypes ((List!14625 0))(
  ( (Nil!14622) (Cons!14621 (h!15756 (_ BitVec 64)) (t!20932 List!14625)) )
))
(declare-fun arrayNoDuplicates!0 (array!43358 (_ BitVec 32) List!14625) Bool)

(assert (=> b!798319 (= res!542462 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14622))))

(declare-fun b!798321 () Bool)

(declare-fun e!442948 () Bool)

(assert (=> b!798321 (= e!442944 e!442948)))

(declare-fun res!542467 () Bool)

(assert (=> b!798321 (=> (not res!542467) (not e!442948))))

(declare-fun lt!356185 () SeekEntryResult!8302)

(declare-fun lt!356191 () SeekEntryResult!8302)

(assert (=> b!798321 (= res!542467 (and (= lt!356191 lt!356185) (= lt!356185 (Found!8302 j!153)) (= (select (arr!20755 a!3170) index!1236) (select (arr!20755 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798321 (= lt!356185 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20755 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798321 (= lt!356191 (seekEntryOrOpen!0 (select (arr!20755 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798322 () Bool)

(assert (=> b!798322 (= e!442946 e!442947)))

(declare-fun res!542460 () Bool)

(assert (=> b!798322 (=> (not res!542460) (not e!442947))))

(declare-fun lt!356186 () SeekEntryResult!8302)

(assert (=> b!798322 (= res!542460 (or (= lt!356186 (MissingZero!8302 i!1163)) (= lt!356186 (MissingVacant!8302 i!1163))))))

(assert (=> b!798322 (= lt!356186 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798323 () Bool)

(assert (=> b!798323 (= e!442948 (not true))))

(assert (=> b!798323 (= lt!356190 (Found!8302 index!1236))))

(declare-fun b!798324 () Bool)

(declare-fun res!542461 () Bool)

(assert (=> b!798324 (=> (not res!542461) (not e!442946))))

(assert (=> b!798324 (= res!542461 (validKeyInArray!0 (select (arr!20755 a!3170) j!153)))))

(declare-fun b!798320 () Bool)

(declare-fun res!542459 () Bool)

(assert (=> b!798320 (=> (not res!542459) (not e!442947))))

(assert (=> b!798320 (= res!542459 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21175 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20755 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21175 a!3170)) (= (select (arr!20755 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542468 () Bool)

(assert (=> start!68694 (=> (not res!542468) (not e!442946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68694 (= res!542468 (validMask!0 mask!3266))))

(assert (=> start!68694 e!442946))

(assert (=> start!68694 true))

(declare-fun array_inv!16614 (array!43358) Bool)

(assert (=> start!68694 (array_inv!16614 a!3170)))

(assert (= (and start!68694 res!542468) b!798314))

(assert (= (and b!798314 res!542465) b!798324))

(assert (= (and b!798324 res!542461) b!798318))

(assert (= (and b!798318 res!542463) b!798317))

(assert (= (and b!798317 res!542464) b!798322))

(assert (= (and b!798322 res!542460) b!798316))

(assert (= (and b!798316 res!542466) b!798319))

(assert (= (and b!798319 res!542462) b!798320))

(assert (= (and b!798320 res!542459) b!798315))

(assert (= (and b!798315 res!542469) b!798321))

(assert (= (and b!798321 res!542467) b!798323))

(declare-fun m!739607 () Bool)

(assert (=> b!798317 m!739607))

(declare-fun m!739609 () Bool)

(assert (=> b!798324 m!739609))

(assert (=> b!798324 m!739609))

(declare-fun m!739611 () Bool)

(assert (=> b!798324 m!739611))

(declare-fun m!739613 () Bool)

(assert (=> start!68694 m!739613))

(declare-fun m!739615 () Bool)

(assert (=> start!68694 m!739615))

(declare-fun m!739617 () Bool)

(assert (=> b!798322 m!739617))

(declare-fun m!739619 () Bool)

(assert (=> b!798320 m!739619))

(declare-fun m!739621 () Bool)

(assert (=> b!798320 m!739621))

(declare-fun m!739623 () Bool)

(assert (=> b!798315 m!739623))

(declare-fun m!739625 () Bool)

(assert (=> b!798315 m!739625))

(declare-fun m!739627 () Bool)

(assert (=> b!798315 m!739627))

(declare-fun m!739629 () Bool)

(assert (=> b!798315 m!739629))

(declare-fun m!739631 () Bool)

(assert (=> b!798318 m!739631))

(declare-fun m!739633 () Bool)

(assert (=> b!798321 m!739633))

(assert (=> b!798321 m!739609))

(assert (=> b!798321 m!739609))

(declare-fun m!739635 () Bool)

(assert (=> b!798321 m!739635))

(assert (=> b!798321 m!739609))

(declare-fun m!739637 () Bool)

(assert (=> b!798321 m!739637))

(declare-fun m!739639 () Bool)

(assert (=> b!798319 m!739639))

(declare-fun m!739641 () Bool)

(assert (=> b!798316 m!739641))

(check-sat (not b!798316) (not b!798318) (not b!798324) (not b!798315) (not b!798317) (not b!798319) (not b!798322) (not start!68694) (not b!798321))
(check-sat)
