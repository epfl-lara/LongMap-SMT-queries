; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68598 () Bool)

(assert start!68598)

(declare-fun b!798230 () Bool)

(declare-fun e!442756 () Bool)

(declare-fun e!442755 () Bool)

(assert (=> b!798230 (= e!442756 e!442755)))

(declare-fun res!542889 () Bool)

(assert (=> b!798230 (=> (not res!542889) (not e!442755))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43405 0))(
  ( (array!43406 (arr!20783 (Array (_ BitVec 32) (_ BitVec 64))) (size!21204 (_ BitVec 32))) )
))
(declare-fun lt!356204 () array!43405)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356202 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8371 0))(
  ( (MissingZero!8371 (index!35852 (_ BitVec 32))) (Found!8371 (index!35853 (_ BitVec 32))) (Intermediate!8371 (undefined!9183 Bool) (index!35854 (_ BitVec 32)) (x!66748 (_ BitVec 32))) (Undefined!8371) (MissingVacant!8371 (index!35855 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43405 (_ BitVec 32)) SeekEntryResult!8371)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43405 (_ BitVec 32)) SeekEntryResult!8371)

(assert (=> b!798230 (= res!542889 (= (seekEntryOrOpen!0 lt!356202 lt!356204 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356202 lt!356204 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!43405)

(assert (=> b!798230 (= lt!356202 (select (store (arr!20783 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798230 (= lt!356204 (array!43406 (store (arr!20783 a!3170) i!1163 k0!2044) (size!21204 a!3170)))))

(declare-fun b!798231 () Bool)

(declare-fun e!442753 () Bool)

(assert (=> b!798231 (= e!442753 e!442756)))

(declare-fun res!542890 () Bool)

(assert (=> b!798231 (=> (not res!542890) (not e!442756))))

(declare-fun lt!356203 () SeekEntryResult!8371)

(assert (=> b!798231 (= res!542890 (or (= lt!356203 (MissingZero!8371 i!1163)) (= lt!356203 (MissingVacant!8371 i!1163))))))

(assert (=> b!798231 (= lt!356203 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798232 () Bool)

(declare-fun res!542894 () Bool)

(assert (=> b!798232 (=> (not res!542894) (not e!442753))))

(declare-fun arrayContainsKey!0 (array!43405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798232 (= res!542894 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798233 () Bool)

(declare-fun res!542897 () Bool)

(assert (=> b!798233 (=> (not res!542897) (not e!442753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798233 (= res!542897 (validKeyInArray!0 (select (arr!20783 a!3170) j!153)))))

(declare-fun b!798234 () Bool)

(declare-fun res!542893 () Bool)

(assert (=> b!798234 (=> (not res!542893) (not e!442756))))

(declare-datatypes ((List!14785 0))(
  ( (Nil!14782) (Cons!14781 (h!15910 (_ BitVec 64)) (t!21091 List!14785)) )
))
(declare-fun arrayNoDuplicates!0 (array!43405 (_ BitVec 32) List!14785) Bool)

(assert (=> b!798234 (= res!542893 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14782))))

(declare-fun res!542891 () Bool)

(assert (=> start!68598 (=> (not res!542891) (not e!442753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68598 (= res!542891 (validMask!0 mask!3266))))

(assert (=> start!68598 e!442753))

(assert (=> start!68598 true))

(declare-fun array_inv!16666 (array!43405) Bool)

(assert (=> start!68598 (array_inv!16666 a!3170)))

(declare-fun b!798235 () Bool)

(declare-fun res!542895 () Bool)

(assert (=> b!798235 (=> (not res!542895) (not e!442753))))

(assert (=> b!798235 (= res!542895 (and (= (size!21204 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21204 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21204 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798236 () Bool)

(declare-fun res!542896 () Bool)

(assert (=> b!798236 (=> (not res!542896) (not e!442756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43405 (_ BitVec 32)) Bool)

(assert (=> b!798236 (= res!542896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798237 () Bool)

(assert (=> b!798237 (= e!442755 false)))

(declare-fun lt!356200 () SeekEntryResult!8371)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798237 (= lt!356200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20783 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356201 () SeekEntryResult!8371)

(assert (=> b!798237 (= lt!356201 (seekEntryOrOpen!0 (select (arr!20783 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798238 () Bool)

(declare-fun res!542898 () Bool)

(assert (=> b!798238 (=> (not res!542898) (not e!442753))))

(assert (=> b!798238 (= res!542898 (validKeyInArray!0 k0!2044))))

(declare-fun b!798239 () Bool)

(declare-fun res!542892 () Bool)

(assert (=> b!798239 (=> (not res!542892) (not e!442756))))

(assert (=> b!798239 (= res!542892 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21204 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20783 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21204 a!3170)) (= (select (arr!20783 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68598 res!542891) b!798235))

(assert (= (and b!798235 res!542895) b!798233))

(assert (= (and b!798233 res!542897) b!798238))

(assert (= (and b!798238 res!542898) b!798232))

(assert (= (and b!798232 res!542894) b!798231))

(assert (= (and b!798231 res!542890) b!798236))

(assert (= (and b!798236 res!542896) b!798234))

(assert (= (and b!798234 res!542893) b!798239))

(assert (= (and b!798239 res!542892) b!798230))

(assert (= (and b!798230 res!542889) b!798237))

(declare-fun m!738649 () Bool)

(assert (=> b!798237 m!738649))

(assert (=> b!798237 m!738649))

(declare-fun m!738651 () Bool)

(assert (=> b!798237 m!738651))

(assert (=> b!798237 m!738649))

(declare-fun m!738653 () Bool)

(assert (=> b!798237 m!738653))

(declare-fun m!738655 () Bool)

(assert (=> b!798239 m!738655))

(declare-fun m!738657 () Bool)

(assert (=> b!798239 m!738657))

(declare-fun m!738659 () Bool)

(assert (=> b!798232 m!738659))

(declare-fun m!738661 () Bool)

(assert (=> b!798231 m!738661))

(declare-fun m!738663 () Bool)

(assert (=> b!798234 m!738663))

(declare-fun m!738665 () Bool)

(assert (=> b!798230 m!738665))

(declare-fun m!738667 () Bool)

(assert (=> b!798230 m!738667))

(declare-fun m!738669 () Bool)

(assert (=> b!798230 m!738669))

(declare-fun m!738671 () Bool)

(assert (=> b!798230 m!738671))

(declare-fun m!738673 () Bool)

(assert (=> start!68598 m!738673))

(declare-fun m!738675 () Bool)

(assert (=> start!68598 m!738675))

(assert (=> b!798233 m!738649))

(assert (=> b!798233 m!738649))

(declare-fun m!738677 () Bool)

(assert (=> b!798233 m!738677))

(declare-fun m!738679 () Bool)

(assert (=> b!798238 m!738679))

(declare-fun m!738681 () Bool)

(assert (=> b!798236 m!738681))

(check-sat (not b!798232) (not b!798236) (not start!68598) (not b!798231) (not b!798230) (not b!798238) (not b!798233) (not b!798237) (not b!798234))
(check-sat)
