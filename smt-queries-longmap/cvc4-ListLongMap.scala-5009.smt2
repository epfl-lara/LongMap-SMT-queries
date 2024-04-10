; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68568 () Bool)

(assert start!68568)

(declare-fun b!797628 () Bool)

(declare-fun res!542150 () Bool)

(declare-fun e!442509 () Bool)

(assert (=> b!797628 (=> (not res!542150) (not e!442509))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797628 (= res!542150 (validKeyInArray!0 k!2044))))

(declare-fun b!797629 () Bool)

(declare-fun e!442510 () Bool)

(declare-fun e!442508 () Bool)

(assert (=> b!797629 (= e!442510 (not e!442508))))

(declare-fun res!542149 () Bool)

(assert (=> b!797629 (=> res!542149 e!442508)))

(declare-datatypes ((SeekEntryResult!8350 0))(
  ( (MissingZero!8350 (index!35768 (_ BitVec 32))) (Found!8350 (index!35769 (_ BitVec 32))) (Intermediate!8350 (undefined!9162 Bool) (index!35770 (_ BitVec 32)) (x!66660 (_ BitVec 32))) (Undefined!8350) (MissingVacant!8350 (index!35771 (_ BitVec 32))) )
))
(declare-fun lt!355896 () SeekEntryResult!8350)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43358 0))(
  ( (array!43359 (arr!20759 (Array (_ BitVec 32) (_ BitVec 64))) (size!21180 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43358)

(declare-fun lt!355891 () SeekEntryResult!8350)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797629 (= res!542149 (or (not (= lt!355891 lt!355896)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20759 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797629 (= lt!355891 (Found!8350 index!1236))))

(declare-fun b!797630 () Bool)

(declare-fun res!542152 () Bool)

(declare-fun e!442505 () Bool)

(assert (=> b!797630 (=> (not res!542152) (not e!442505))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797630 (= res!542152 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21180 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20759 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21180 a!3170)) (= (select (arr!20759 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797631 () Bool)

(declare-fun res!542156 () Bool)

(assert (=> b!797631 (=> (not res!542156) (not e!442509))))

(declare-fun arrayContainsKey!0 (array!43358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797631 (= res!542156 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797632 () Bool)

(declare-fun e!442511 () Bool)

(declare-fun e!442507 () Bool)

(assert (=> b!797632 (= e!442511 e!442507)))

(declare-fun res!542157 () Bool)

(assert (=> b!797632 (=> (not res!542157) (not e!442507))))

(declare-fun lt!355893 () SeekEntryResult!8350)

(declare-fun lt!355897 () SeekEntryResult!8350)

(assert (=> b!797632 (= res!542157 (= lt!355893 lt!355897))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43358 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!797632 (= lt!355897 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20759 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43358 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!797632 (= lt!355893 (seekEntryOrOpen!0 (select (arr!20759 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797634 () Bool)

(declare-fun res!542153 () Bool)

(assert (=> b!797634 (=> (not res!542153) (not e!442505))))

(declare-datatypes ((List!14722 0))(
  ( (Nil!14719) (Cons!14718 (h!15847 (_ BitVec 64)) (t!21037 List!14722)) )
))
(declare-fun arrayNoDuplicates!0 (array!43358 (_ BitVec 32) List!14722) Bool)

(assert (=> b!797634 (= res!542153 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14719))))

(declare-fun b!797635 () Bool)

(assert (=> b!797635 (= e!442505 e!442511)))

(declare-fun res!542151 () Bool)

(assert (=> b!797635 (=> (not res!542151) (not e!442511))))

(declare-fun lt!355892 () SeekEntryResult!8350)

(assert (=> b!797635 (= res!542151 (= lt!355892 lt!355891))))

(declare-fun lt!355895 () (_ BitVec 64))

(declare-fun lt!355894 () array!43358)

(assert (=> b!797635 (= lt!355891 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355895 lt!355894 mask!3266))))

(assert (=> b!797635 (= lt!355892 (seekEntryOrOpen!0 lt!355895 lt!355894 mask!3266))))

(assert (=> b!797635 (= lt!355895 (select (store (arr!20759 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797635 (= lt!355894 (array!43359 (store (arr!20759 a!3170) i!1163 k!2044) (size!21180 a!3170)))))

(declare-fun b!797636 () Bool)

(declare-fun res!542158 () Bool)

(assert (=> b!797636 (=> (not res!542158) (not e!442509))))

(assert (=> b!797636 (= res!542158 (validKeyInArray!0 (select (arr!20759 a!3170) j!153)))))

(declare-fun b!797637 () Bool)

(assert (=> b!797637 (= e!442507 e!442510)))

(declare-fun res!542154 () Bool)

(assert (=> b!797637 (=> (not res!542154) (not e!442510))))

(assert (=> b!797637 (= res!542154 (and (= lt!355897 lt!355896) (= (select (arr!20759 a!3170) index!1236) (select (arr!20759 a!3170) j!153))))))

(assert (=> b!797637 (= lt!355896 (Found!8350 j!153))))

(declare-fun b!797638 () Bool)

(declare-fun res!542147 () Bool)

(assert (=> b!797638 (=> (not res!542147) (not e!442505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43358 (_ BitVec 32)) Bool)

(assert (=> b!797638 (= res!542147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!542159 () Bool)

(assert (=> start!68568 (=> (not res!542159) (not e!442509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68568 (= res!542159 (validMask!0 mask!3266))))

(assert (=> start!68568 e!442509))

(assert (=> start!68568 true))

(declare-fun array_inv!16555 (array!43358) Bool)

(assert (=> start!68568 (array_inv!16555 a!3170)))

(declare-fun b!797633 () Bool)

(assert (=> b!797633 (= e!442508 (validKeyInArray!0 lt!355895))))

(declare-fun b!797639 () Bool)

(assert (=> b!797639 (= e!442509 e!442505)))

(declare-fun res!542148 () Bool)

(assert (=> b!797639 (=> (not res!542148) (not e!442505))))

(declare-fun lt!355898 () SeekEntryResult!8350)

(assert (=> b!797639 (= res!542148 (or (= lt!355898 (MissingZero!8350 i!1163)) (= lt!355898 (MissingVacant!8350 i!1163))))))

(assert (=> b!797639 (= lt!355898 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797640 () Bool)

(declare-fun res!542155 () Bool)

(assert (=> b!797640 (=> (not res!542155) (not e!442509))))

(assert (=> b!797640 (= res!542155 (and (= (size!21180 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21180 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21180 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68568 res!542159) b!797640))

(assert (= (and b!797640 res!542155) b!797636))

(assert (= (and b!797636 res!542158) b!797628))

(assert (= (and b!797628 res!542150) b!797631))

(assert (= (and b!797631 res!542156) b!797639))

(assert (= (and b!797639 res!542148) b!797638))

(assert (= (and b!797638 res!542147) b!797634))

(assert (= (and b!797634 res!542153) b!797630))

(assert (= (and b!797630 res!542152) b!797635))

(assert (= (and b!797635 res!542151) b!797632))

(assert (= (and b!797632 res!542157) b!797637))

(assert (= (and b!797637 res!542154) b!797629))

(assert (= (and b!797629 (not res!542149)) b!797633))

(declare-fun m!738487 () Bool)

(assert (=> b!797638 m!738487))

(declare-fun m!738489 () Bool)

(assert (=> b!797629 m!738489))

(declare-fun m!738491 () Bool)

(assert (=> b!797629 m!738491))

(declare-fun m!738493 () Bool)

(assert (=> b!797632 m!738493))

(assert (=> b!797632 m!738493))

(declare-fun m!738495 () Bool)

(assert (=> b!797632 m!738495))

(assert (=> b!797632 m!738493))

(declare-fun m!738497 () Bool)

(assert (=> b!797632 m!738497))

(declare-fun m!738499 () Bool)

(assert (=> b!797639 m!738499))

(declare-fun m!738501 () Bool)

(assert (=> b!797637 m!738501))

(assert (=> b!797637 m!738493))

(declare-fun m!738503 () Bool)

(assert (=> b!797631 m!738503))

(declare-fun m!738505 () Bool)

(assert (=> b!797634 m!738505))

(declare-fun m!738507 () Bool)

(assert (=> b!797630 m!738507))

(declare-fun m!738509 () Bool)

(assert (=> b!797630 m!738509))

(declare-fun m!738511 () Bool)

(assert (=> b!797628 m!738511))

(declare-fun m!738513 () Bool)

(assert (=> b!797633 m!738513))

(assert (=> b!797636 m!738493))

(assert (=> b!797636 m!738493))

(declare-fun m!738515 () Bool)

(assert (=> b!797636 m!738515))

(declare-fun m!738517 () Bool)

(assert (=> b!797635 m!738517))

(declare-fun m!738519 () Bool)

(assert (=> b!797635 m!738519))

(assert (=> b!797635 m!738489))

(declare-fun m!738521 () Bool)

(assert (=> b!797635 m!738521))

(declare-fun m!738523 () Bool)

(assert (=> start!68568 m!738523))

(declare-fun m!738525 () Bool)

(assert (=> start!68568 m!738525))

(push 1)

(assert (not b!797639))

(assert (not b!797633))

(assert (not b!797635))

