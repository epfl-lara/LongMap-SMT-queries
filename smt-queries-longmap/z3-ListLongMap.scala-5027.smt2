; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68840 () Bool)

(assert start!68840)

(declare-fun b!800319 () Bool)

(declare-fun e!443901 () Bool)

(declare-fun e!443902 () Bool)

(assert (=> b!800319 (= e!443901 e!443902)))

(declare-fun res!544295 () Bool)

(assert (=> b!800319 (=> (not res!544295) (not e!443902))))

(declare-datatypes ((SeekEntryResult!8353 0))(
  ( (MissingZero!8353 (index!35780 (_ BitVec 32))) (Found!8353 (index!35781 (_ BitVec 32))) (Intermediate!8353 (undefined!9165 Bool) (index!35782 (_ BitVec 32)) (x!66821 (_ BitVec 32))) (Undefined!8353) (MissingVacant!8353 (index!35783 (_ BitVec 32))) )
))
(declare-fun lt!357343 () SeekEntryResult!8353)

(declare-datatypes ((array!43462 0))(
  ( (array!43463 (arr!20806 (Array (_ BitVec 32) (_ BitVec 64))) (size!21226 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43462)

(declare-fun lt!357349 () SeekEntryResult!8353)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800319 (= res!544295 (and (= lt!357343 lt!357349) (= lt!357349 (Found!8353 j!153)) (not (= (select (arr!20806 a!3170) index!1236) (select (arr!20806 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43462 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!800319 (= lt!357349 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43462 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!800319 (= lt!357343 (seekEntryOrOpen!0 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800320 () Bool)

(declare-fun e!443900 () Bool)

(assert (=> b!800320 (= e!443900 e!443901)))

(declare-fun res!544297 () Bool)

(assert (=> b!800320 (=> (not res!544297) (not e!443901))))

(declare-fun lt!357346 () SeekEntryResult!8353)

(declare-fun lt!357350 () (_ BitVec 64))

(declare-fun lt!357348 () array!43462)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!800320 (= res!544297 (= lt!357346 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357350 lt!357348 mask!3266)))))

(assert (=> b!800320 (= lt!357346 (seekEntryOrOpen!0 lt!357350 lt!357348 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800320 (= lt!357350 (select (store (arr!20806 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800320 (= lt!357348 (array!43463 (store (arr!20806 a!3170) i!1163 k0!2044) (size!21226 a!3170)))))

(declare-fun b!800321 () Bool)

(declare-fun res!544301 () Bool)

(assert (=> b!800321 (=> (not res!544301) (not e!443900))))

(declare-datatypes ((List!14676 0))(
  ( (Nil!14673) (Cons!14672 (h!15807 (_ BitVec 64)) (t!20983 List!14676)) )
))
(declare-fun arrayNoDuplicates!0 (array!43462 (_ BitVec 32) List!14676) Bool)

(assert (=> b!800321 (= res!544301 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14673))))

(declare-fun b!800322 () Bool)

(declare-fun e!443899 () Bool)

(assert (=> b!800322 (= e!443902 e!443899)))

(declare-fun res!544291 () Bool)

(assert (=> b!800322 (=> (not res!544291) (not e!443899))))

(declare-fun lt!357347 () (_ BitVec 32))

(assert (=> b!800322 (= res!544291 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357347 #b00000000000000000000000000000000) (bvslt lt!357347 (size!21226 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800322 (= lt!357347 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800323 () Bool)

(declare-fun res!544302 () Bool)

(declare-fun e!443898 () Bool)

(assert (=> b!800323 (=> (not res!544302) (not e!443898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800323 (= res!544302 (validKeyInArray!0 (select (arr!20806 a!3170) j!153)))))

(declare-fun b!800324 () Bool)

(declare-fun res!544296 () Bool)

(assert (=> b!800324 (=> (not res!544296) (not e!443898))))

(declare-fun arrayContainsKey!0 (array!43462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800324 (= res!544296 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800325 () Bool)

(assert (=> b!800325 (= e!443898 e!443900)))

(declare-fun res!544293 () Bool)

(assert (=> b!800325 (=> (not res!544293) (not e!443900))))

(declare-fun lt!357345 () SeekEntryResult!8353)

(assert (=> b!800325 (= res!544293 (or (= lt!357345 (MissingZero!8353 i!1163)) (= lt!357345 (MissingVacant!8353 i!1163))))))

(assert (=> b!800325 (= lt!357345 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800326 () Bool)

(assert (=> b!800326 (= e!443899 false)))

(declare-fun lt!357344 () SeekEntryResult!8353)

(assert (=> b!800326 (= lt!357344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357347 vacantBefore!23 (select (arr!20806 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800327 () Bool)

(declare-fun res!544294 () Bool)

(assert (=> b!800327 (=> (not res!544294) (not e!443898))))

(assert (=> b!800327 (= res!544294 (and (= (size!21226 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21226 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21226 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800328 () Bool)

(declare-fun res!544300 () Bool)

(assert (=> b!800328 (=> (not res!544300) (not e!443900))))

(assert (=> b!800328 (= res!544300 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21226 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20806 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21226 a!3170)) (= (select (arr!20806 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800329 () Bool)

(declare-fun res!544298 () Bool)

(assert (=> b!800329 (=> (not res!544298) (not e!443898))))

(assert (=> b!800329 (= res!544298 (validKeyInArray!0 k0!2044))))

(declare-fun res!544299 () Bool)

(assert (=> start!68840 (=> (not res!544299) (not e!443898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68840 (= res!544299 (validMask!0 mask!3266))))

(assert (=> start!68840 e!443898))

(assert (=> start!68840 true))

(declare-fun array_inv!16665 (array!43462) Bool)

(assert (=> start!68840 (array_inv!16665 a!3170)))

(declare-fun b!800330 () Bool)

(declare-fun res!544290 () Bool)

(assert (=> b!800330 (=> (not res!544290) (not e!443899))))

(assert (=> b!800330 (= res!544290 (= lt!357346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357347 vacantAfter!23 lt!357350 lt!357348 mask!3266)))))

(declare-fun b!800331 () Bool)

(declare-fun res!544292 () Bool)

(assert (=> b!800331 (=> (not res!544292) (not e!443900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43462 (_ BitVec 32)) Bool)

(assert (=> b!800331 (= res!544292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68840 res!544299) b!800327))

(assert (= (and b!800327 res!544294) b!800323))

(assert (= (and b!800323 res!544302) b!800329))

(assert (= (and b!800329 res!544298) b!800324))

(assert (= (and b!800324 res!544296) b!800325))

(assert (= (and b!800325 res!544293) b!800331))

(assert (= (and b!800331 res!544292) b!800321))

(assert (= (and b!800321 res!544301) b!800328))

(assert (= (and b!800328 res!544300) b!800320))

(assert (= (and b!800320 res!544297) b!800319))

(assert (= (and b!800319 res!544295) b!800322))

(assert (= (and b!800322 res!544291) b!800330))

(assert (= (and b!800330 res!544290) b!800326))

(declare-fun m!741697 () Bool)

(assert (=> b!800330 m!741697))

(declare-fun m!741699 () Bool)

(assert (=> b!800324 m!741699))

(declare-fun m!741701 () Bool)

(assert (=> b!800320 m!741701))

(declare-fun m!741703 () Bool)

(assert (=> b!800320 m!741703))

(declare-fun m!741705 () Bool)

(assert (=> b!800320 m!741705))

(declare-fun m!741707 () Bool)

(assert (=> b!800320 m!741707))

(declare-fun m!741709 () Bool)

(assert (=> b!800326 m!741709))

(assert (=> b!800326 m!741709))

(declare-fun m!741711 () Bool)

(assert (=> b!800326 m!741711))

(declare-fun m!741713 () Bool)

(assert (=> b!800321 m!741713))

(declare-fun m!741715 () Bool)

(assert (=> start!68840 m!741715))

(declare-fun m!741717 () Bool)

(assert (=> start!68840 m!741717))

(declare-fun m!741719 () Bool)

(assert (=> b!800325 m!741719))

(declare-fun m!741721 () Bool)

(assert (=> b!800329 m!741721))

(declare-fun m!741723 () Bool)

(assert (=> b!800319 m!741723))

(assert (=> b!800319 m!741709))

(assert (=> b!800319 m!741709))

(declare-fun m!741725 () Bool)

(assert (=> b!800319 m!741725))

(assert (=> b!800319 m!741709))

(declare-fun m!741727 () Bool)

(assert (=> b!800319 m!741727))

(assert (=> b!800323 m!741709))

(assert (=> b!800323 m!741709))

(declare-fun m!741729 () Bool)

(assert (=> b!800323 m!741729))

(declare-fun m!741731 () Bool)

(assert (=> b!800331 m!741731))

(declare-fun m!741733 () Bool)

(assert (=> b!800328 m!741733))

(declare-fun m!741735 () Bool)

(assert (=> b!800328 m!741735))

(declare-fun m!741737 () Bool)

(assert (=> b!800322 m!741737))

(check-sat (not b!800331) (not b!800319) (not b!800324) (not b!800326) (not start!68840) (not b!800322) (not b!800329) (not b!800330) (not b!800321) (not b!800325) (not b!800320) (not b!800323))
(check-sat)
