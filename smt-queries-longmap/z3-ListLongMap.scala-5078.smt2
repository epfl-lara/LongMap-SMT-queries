; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68980 () Bool)

(assert start!68980)

(declare-fun b!804652 () Bool)

(declare-fun e!445741 () Bool)

(declare-fun e!445740 () Bool)

(assert (=> b!804652 (= e!445741 e!445740)))

(declare-fun res!549171 () Bool)

(assert (=> b!804652 (=> (not res!549171) (not e!445740))))

(declare-datatypes ((SeekEntryResult!8556 0))(
  ( (MissingZero!8556 (index!36592 (_ BitVec 32))) (Found!8556 (index!36593 (_ BitVec 32))) (Intermediate!8556 (undefined!9368 Bool) (index!36594 (_ BitVec 32)) (x!67418 (_ BitVec 32))) (Undefined!8556) (MissingVacant!8556 (index!36595 (_ BitVec 32))) )
))
(declare-fun lt!360228 () SeekEntryResult!8556)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804652 (= res!549171 (or (= lt!360228 (MissingZero!8556 i!1163)) (= lt!360228 (MissingVacant!8556 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43770 0))(
  ( (array!43771 (arr!20965 (Array (_ BitVec 32) (_ BitVec 64))) (size!21386 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43770)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43770 (_ BitVec 32)) SeekEntryResult!8556)

(assert (=> b!804652 (= lt!360228 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804653 () Bool)

(declare-fun res!549178 () Bool)

(assert (=> b!804653 (=> (not res!549178) (not e!445741))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804653 (= res!549178 (validKeyInArray!0 (select (arr!20965 a!3170) j!153)))))

(declare-fun b!804655 () Bool)

(declare-fun res!549172 () Bool)

(assert (=> b!804655 (=> (not res!549172) (not e!445740))))

(declare-datatypes ((List!14928 0))(
  ( (Nil!14925) (Cons!14924 (h!16053 (_ BitVec 64)) (t!21243 List!14928)) )
))
(declare-fun arrayNoDuplicates!0 (array!43770 (_ BitVec 32) List!14928) Bool)

(assert (=> b!804655 (= res!549172 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14925))))

(declare-fun b!804656 () Bool)

(declare-fun res!549177 () Bool)

(assert (=> b!804656 (=> (not res!549177) (not e!445741))))

(assert (=> b!804656 (= res!549177 (and (= (size!21386 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21386 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21386 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804657 () Bool)

(declare-fun res!549179 () Bool)

(assert (=> b!804657 (=> (not res!549179) (not e!445740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43770 (_ BitVec 32)) Bool)

(assert (=> b!804657 (= res!549179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804658 () Bool)

(assert (=> b!804658 (= e!445740 false)))

(declare-fun lt!360227 () array!43770)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360229 () (_ BitVec 64))

(declare-fun lt!360230 () SeekEntryResult!8556)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43770 (_ BitVec 32)) SeekEntryResult!8556)

(assert (=> b!804658 (= lt!360230 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360229 lt!360227 mask!3266))))

(declare-fun lt!360226 () SeekEntryResult!8556)

(assert (=> b!804658 (= lt!360226 (seekEntryOrOpen!0 lt!360229 lt!360227 mask!3266))))

(assert (=> b!804658 (= lt!360229 (select (store (arr!20965 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804658 (= lt!360227 (array!43771 (store (arr!20965 a!3170) i!1163 k0!2044) (size!21386 a!3170)))))

(declare-fun b!804654 () Bool)

(declare-fun res!549173 () Bool)

(assert (=> b!804654 (=> (not res!549173) (not e!445741))))

(assert (=> b!804654 (= res!549173 (validKeyInArray!0 k0!2044))))

(declare-fun res!549174 () Bool)

(assert (=> start!68980 (=> (not res!549174) (not e!445741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68980 (= res!549174 (validMask!0 mask!3266))))

(assert (=> start!68980 e!445741))

(assert (=> start!68980 true))

(declare-fun array_inv!16761 (array!43770) Bool)

(assert (=> start!68980 (array_inv!16761 a!3170)))

(declare-fun b!804659 () Bool)

(declare-fun res!549176 () Bool)

(assert (=> b!804659 (=> (not res!549176) (not e!445740))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804659 (= res!549176 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21386 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20965 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21386 a!3170)) (= (select (arr!20965 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804660 () Bool)

(declare-fun res!549175 () Bool)

(assert (=> b!804660 (=> (not res!549175) (not e!445741))))

(declare-fun arrayContainsKey!0 (array!43770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804660 (= res!549175 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68980 res!549174) b!804656))

(assert (= (and b!804656 res!549177) b!804653))

(assert (= (and b!804653 res!549178) b!804654))

(assert (= (and b!804654 res!549173) b!804660))

(assert (= (and b!804660 res!549175) b!804652))

(assert (= (and b!804652 res!549171) b!804657))

(assert (= (and b!804657 res!549179) b!804655))

(assert (= (and b!804655 res!549172) b!804659))

(assert (= (and b!804659 res!549176) b!804658))

(declare-fun m!746501 () Bool)

(assert (=> b!804657 m!746501))

(declare-fun m!746503 () Bool)

(assert (=> b!804660 m!746503))

(declare-fun m!746505 () Bool)

(assert (=> b!804652 m!746505))

(declare-fun m!746507 () Bool)

(assert (=> start!68980 m!746507))

(declare-fun m!746509 () Bool)

(assert (=> start!68980 m!746509))

(declare-fun m!746511 () Bool)

(assert (=> b!804653 m!746511))

(assert (=> b!804653 m!746511))

(declare-fun m!746513 () Bool)

(assert (=> b!804653 m!746513))

(declare-fun m!746515 () Bool)

(assert (=> b!804658 m!746515))

(declare-fun m!746517 () Bool)

(assert (=> b!804658 m!746517))

(declare-fun m!746519 () Bool)

(assert (=> b!804658 m!746519))

(declare-fun m!746521 () Bool)

(assert (=> b!804658 m!746521))

(declare-fun m!746523 () Bool)

(assert (=> b!804659 m!746523))

(declare-fun m!746525 () Bool)

(assert (=> b!804659 m!746525))

(declare-fun m!746527 () Bool)

(assert (=> b!804654 m!746527))

(declare-fun m!746529 () Bool)

(assert (=> b!804655 m!746529))

(check-sat (not b!804655) (not b!804657) (not start!68980) (not b!804653) (not b!804654) (not b!804658) (not b!804660) (not b!804652))
(check-sat)
