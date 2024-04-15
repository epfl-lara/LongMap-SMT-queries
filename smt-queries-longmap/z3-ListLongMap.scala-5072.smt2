; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68922 () Bool)

(assert start!68922)

(declare-fun b!803993 () Bool)

(declare-fun e!445415 () Bool)

(assert (=> b!803993 (= e!445415 false)))

(declare-fun lt!359857 () Bool)

(declare-datatypes ((array!43729 0))(
  ( (array!43730 (arr!20945 (Array (_ BitVec 32) (_ BitVec 64))) (size!21366 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43729)

(declare-datatypes ((List!14947 0))(
  ( (Nil!14944) (Cons!14943 (h!16072 (_ BitVec 64)) (t!21253 List!14947)) )
))
(declare-fun arrayNoDuplicates!0 (array!43729 (_ BitVec 32) List!14947) Bool)

(assert (=> b!803993 (= lt!359857 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14944))))

(declare-fun b!803994 () Bool)

(declare-fun e!445416 () Bool)

(assert (=> b!803994 (= e!445416 e!445415)))

(declare-fun res!548654 () Bool)

(assert (=> b!803994 (=> (not res!548654) (not e!445415))))

(declare-datatypes ((SeekEntryResult!8533 0))(
  ( (MissingZero!8533 (index!36500 (_ BitVec 32))) (Found!8533 (index!36501 (_ BitVec 32))) (Intermediate!8533 (undefined!9345 Bool) (index!36502 (_ BitVec 32)) (x!67342 (_ BitVec 32))) (Undefined!8533) (MissingVacant!8533 (index!36503 (_ BitVec 32))) )
))
(declare-fun lt!359858 () SeekEntryResult!8533)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803994 (= res!548654 (or (= lt!359858 (MissingZero!8533 i!1163)) (= lt!359858 (MissingVacant!8533 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43729 (_ BitVec 32)) SeekEntryResult!8533)

(assert (=> b!803994 (= lt!359858 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!548653 () Bool)

(assert (=> start!68922 (=> (not res!548653) (not e!445416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68922 (= res!548653 (validMask!0 mask!3266))))

(assert (=> start!68922 e!445416))

(assert (=> start!68922 true))

(declare-fun array_inv!16828 (array!43729) Bool)

(assert (=> start!68922 (array_inv!16828 a!3170)))

(declare-fun b!803995 () Bool)

(declare-fun res!548655 () Bool)

(assert (=> b!803995 (=> (not res!548655) (not e!445416))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803995 (= res!548655 (and (= (size!21366 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21366 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21366 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803996 () Bool)

(declare-fun res!548656 () Bool)

(assert (=> b!803996 (=> (not res!548656) (not e!445415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43729 (_ BitVec 32)) Bool)

(assert (=> b!803996 (= res!548656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803997 () Bool)

(declare-fun res!548658 () Bool)

(assert (=> b!803997 (=> (not res!548658) (not e!445416))))

(declare-fun arrayContainsKey!0 (array!43729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803997 (= res!548658 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803998 () Bool)

(declare-fun res!548657 () Bool)

(assert (=> b!803998 (=> (not res!548657) (not e!445416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803998 (= res!548657 (validKeyInArray!0 (select (arr!20945 a!3170) j!153)))))

(declare-fun b!803999 () Bool)

(declare-fun res!548652 () Bool)

(assert (=> b!803999 (=> (not res!548652) (not e!445416))))

(assert (=> b!803999 (= res!548652 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68922 res!548653) b!803995))

(assert (= (and b!803995 res!548655) b!803998))

(assert (= (and b!803998 res!548657) b!803999))

(assert (= (and b!803999 res!548652) b!803997))

(assert (= (and b!803997 res!548658) b!803994))

(assert (= (and b!803994 res!548654) b!803996))

(assert (= (and b!803996 res!548656) b!803993))

(declare-fun m!745405 () Bool)

(assert (=> b!803994 m!745405))

(declare-fun m!745407 () Bool)

(assert (=> b!803996 m!745407))

(declare-fun m!745409 () Bool)

(assert (=> start!68922 m!745409))

(declare-fun m!745411 () Bool)

(assert (=> start!68922 m!745411))

(declare-fun m!745413 () Bool)

(assert (=> b!803997 m!745413))

(declare-fun m!745415 () Bool)

(assert (=> b!803998 m!745415))

(assert (=> b!803998 m!745415))

(declare-fun m!745417 () Bool)

(assert (=> b!803998 m!745417))

(declare-fun m!745419 () Bool)

(assert (=> b!803999 m!745419))

(declare-fun m!745421 () Bool)

(assert (=> b!803993 m!745421))

(check-sat (not b!803996) (not b!803997) (not b!803999) (not start!68922) (not b!803994) (not b!803998) (not b!803993))
(check-sat)
