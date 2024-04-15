; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68604 () Bool)

(assert start!68604)

(declare-fun b!798320 () Bool)

(declare-fun res!542981 () Bool)

(declare-fun e!442792 () Bool)

(assert (=> b!798320 (=> (not res!542981) (not e!442792))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798320 (= res!542981 (validKeyInArray!0 k0!2044))))

(declare-fun b!798322 () Bool)

(declare-fun res!542986 () Bool)

(assert (=> b!798322 (=> (not res!542986) (not e!442792))))

(declare-datatypes ((array!43411 0))(
  ( (array!43412 (arr!20786 (Array (_ BitVec 32) (_ BitVec 64))) (size!21207 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43411)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798322 (= res!542986 (validKeyInArray!0 (select (arr!20786 a!3170) j!153)))))

(declare-fun b!798323 () Bool)

(declare-fun e!442789 () Bool)

(declare-fun e!442790 () Bool)

(assert (=> b!798323 (= e!442789 e!442790)))

(declare-fun res!542988 () Bool)

(assert (=> b!798323 (=> (not res!542988) (not e!442790))))

(declare-fun lt!356248 () array!43411)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356246 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8374 0))(
  ( (MissingZero!8374 (index!35864 (_ BitVec 32))) (Found!8374 (index!35865 (_ BitVec 32))) (Intermediate!8374 (undefined!9186 Bool) (index!35866 (_ BitVec 32)) (x!66759 (_ BitVec 32))) (Undefined!8374) (MissingVacant!8374 (index!35867 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43411 (_ BitVec 32)) SeekEntryResult!8374)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43411 (_ BitVec 32)) SeekEntryResult!8374)

(assert (=> b!798323 (= res!542988 (= (seekEntryOrOpen!0 lt!356246 lt!356248 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356246 lt!356248 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798323 (= lt!356246 (select (store (arr!20786 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798323 (= lt!356248 (array!43412 (store (arr!20786 a!3170) i!1163 k0!2044) (size!21207 a!3170)))))

(declare-fun b!798324 () Bool)

(declare-fun lt!356249 () SeekEntryResult!8374)

(declare-fun lt!356247 () SeekEntryResult!8374)

(assert (=> b!798324 (= e!442790 (and (= lt!356249 lt!356247) (= lt!356247 (Found!8374 j!153)) (not (= (select (arr!20786 a!3170) index!1236) (select (arr!20786 a!3170) j!153))) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798324 (= lt!356247 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20786 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798324 (= lt!356249 (seekEntryOrOpen!0 (select (arr!20786 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798325 () Bool)

(declare-fun res!542979 () Bool)

(assert (=> b!798325 (=> (not res!542979) (not e!442789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43411 (_ BitVec 32)) Bool)

(assert (=> b!798325 (= res!542979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798326 () Bool)

(declare-fun res!542987 () Bool)

(assert (=> b!798326 (=> (not res!542987) (not e!442789))))

(declare-datatypes ((List!14788 0))(
  ( (Nil!14785) (Cons!14784 (h!15913 (_ BitVec 64)) (t!21094 List!14788)) )
))
(declare-fun arrayNoDuplicates!0 (array!43411 (_ BitVec 32) List!14788) Bool)

(assert (=> b!798326 (= res!542987 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14785))))

(declare-fun b!798327 () Bool)

(declare-fun res!542985 () Bool)

(assert (=> b!798327 (=> (not res!542985) (not e!442789))))

(assert (=> b!798327 (= res!542985 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21207 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20786 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21207 a!3170)) (= (select (arr!20786 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798328 () Bool)

(declare-fun res!542980 () Bool)

(assert (=> b!798328 (=> (not res!542980) (not e!442792))))

(declare-fun arrayContainsKey!0 (array!43411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798328 (= res!542980 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798329 () Bool)

(declare-fun res!542983 () Bool)

(assert (=> b!798329 (=> (not res!542983) (not e!442792))))

(assert (=> b!798329 (= res!542983 (and (= (size!21207 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21207 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21207 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!542984 () Bool)

(assert (=> start!68604 (=> (not res!542984) (not e!442792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68604 (= res!542984 (validMask!0 mask!3266))))

(assert (=> start!68604 e!442792))

(assert (=> start!68604 true))

(declare-fun array_inv!16669 (array!43411) Bool)

(assert (=> start!68604 (array_inv!16669 a!3170)))

(declare-fun b!798321 () Bool)

(assert (=> b!798321 (= e!442792 e!442789)))

(declare-fun res!542982 () Bool)

(assert (=> b!798321 (=> (not res!542982) (not e!442789))))

(declare-fun lt!356245 () SeekEntryResult!8374)

(assert (=> b!798321 (= res!542982 (or (= lt!356245 (MissingZero!8374 i!1163)) (= lt!356245 (MissingVacant!8374 i!1163))))))

(assert (=> b!798321 (= lt!356245 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68604 res!542984) b!798329))

(assert (= (and b!798329 res!542983) b!798322))

(assert (= (and b!798322 res!542986) b!798320))

(assert (= (and b!798320 res!542981) b!798328))

(assert (= (and b!798328 res!542980) b!798321))

(assert (= (and b!798321 res!542982) b!798325))

(assert (= (and b!798325 res!542979) b!798326))

(assert (= (and b!798326 res!542987) b!798327))

(assert (= (and b!798327 res!542985) b!798323))

(assert (= (and b!798323 res!542988) b!798324))

(declare-fun m!738751 () Bool)

(assert (=> b!798323 m!738751))

(declare-fun m!738753 () Bool)

(assert (=> b!798323 m!738753))

(declare-fun m!738755 () Bool)

(assert (=> b!798323 m!738755))

(declare-fun m!738757 () Bool)

(assert (=> b!798323 m!738757))

(declare-fun m!738759 () Bool)

(assert (=> b!798324 m!738759))

(declare-fun m!738761 () Bool)

(assert (=> b!798324 m!738761))

(assert (=> b!798324 m!738761))

(declare-fun m!738763 () Bool)

(assert (=> b!798324 m!738763))

(assert (=> b!798324 m!738761))

(declare-fun m!738765 () Bool)

(assert (=> b!798324 m!738765))

(declare-fun m!738767 () Bool)

(assert (=> b!798326 m!738767))

(assert (=> b!798322 m!738761))

(assert (=> b!798322 m!738761))

(declare-fun m!738769 () Bool)

(assert (=> b!798322 m!738769))

(declare-fun m!738771 () Bool)

(assert (=> b!798328 m!738771))

(declare-fun m!738773 () Bool)

(assert (=> b!798321 m!738773))

(declare-fun m!738775 () Bool)

(assert (=> start!68604 m!738775))

(declare-fun m!738777 () Bool)

(assert (=> start!68604 m!738777))

(declare-fun m!738779 () Bool)

(assert (=> b!798327 m!738779))

(declare-fun m!738781 () Bool)

(assert (=> b!798327 m!738781))

(declare-fun m!738783 () Bool)

(assert (=> b!798325 m!738783))

(declare-fun m!738785 () Bool)

(assert (=> b!798320 m!738785))

(check-sat (not b!798326) (not b!798320) (not b!798322) (not b!798321) (not b!798328) (not b!798324) (not b!798323) (not start!68604) (not b!798325))
(check-sat)
