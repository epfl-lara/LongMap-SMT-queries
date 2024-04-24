; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68846 () Bool)

(assert start!68846)

(declare-fun b!800436 () Bool)

(declare-fun res!544408 () Bool)

(declare-fun e!443953 () Bool)

(assert (=> b!800436 (=> (not res!544408) (not e!443953))))

(declare-datatypes ((array!43468 0))(
  ( (array!43469 (arr!20809 (Array (_ BitVec 32) (_ BitVec 64))) (size!21229 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43468)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800436 (= res!544408 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800437 () Bool)

(declare-fun res!544409 () Bool)

(declare-fun e!443951 () Bool)

(assert (=> b!800437 (=> (not res!544409) (not e!443951))))

(declare-datatypes ((List!14679 0))(
  ( (Nil!14676) (Cons!14675 (h!15810 (_ BitVec 64)) (t!20986 List!14679)) )
))
(declare-fun arrayNoDuplicates!0 (array!43468 (_ BitVec 32) List!14679) Bool)

(assert (=> b!800437 (= res!544409 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14676))))

(declare-fun b!800438 () Bool)

(declare-fun res!544418 () Bool)

(assert (=> b!800438 (=> (not res!544418) (not e!443953))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800438 (= res!544418 (and (= (size!21229 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21229 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21229 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800439 () Bool)

(declare-fun res!544413 () Bool)

(assert (=> b!800439 (=> (not res!544413) (not e!443951))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800439 (= res!544413 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21229 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20809 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21229 a!3170)) (= (select (arr!20809 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800440 () Bool)

(declare-fun res!544416 () Bool)

(declare-fun e!443954 () Bool)

(assert (=> b!800440 (=> (not res!544416) (not e!443954))))

(declare-datatypes ((SeekEntryResult!8356 0))(
  ( (MissingZero!8356 (index!35792 (_ BitVec 32))) (Found!8356 (index!35793 (_ BitVec 32))) (Intermediate!8356 (undefined!9168 Bool) (index!35794 (_ BitVec 32)) (x!66832 (_ BitVec 32))) (Undefined!8356) (MissingVacant!8356 (index!35795 (_ BitVec 32))) )
))
(declare-fun lt!357417 () SeekEntryResult!8356)

(declare-fun lt!357415 () (_ BitVec 64))

(declare-fun lt!357420 () (_ BitVec 32))

(declare-fun lt!357418 () array!43468)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43468 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!800440 (= res!544416 (= lt!357417 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357420 vacantAfter!23 lt!357415 lt!357418 mask!3266)))))

(declare-fun b!800441 () Bool)

(declare-fun res!544407 () Bool)

(assert (=> b!800441 (=> (not res!544407) (not e!443953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800441 (= res!544407 (validKeyInArray!0 (select (arr!20809 a!3170) j!153)))))

(declare-fun b!800442 () Bool)

(declare-fun res!544417 () Bool)

(assert (=> b!800442 (=> (not res!544417) (not e!443951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43468 (_ BitVec 32)) Bool)

(assert (=> b!800442 (= res!544417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!544411 () Bool)

(assert (=> start!68846 (=> (not res!544411) (not e!443953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68846 (= res!544411 (validMask!0 mask!3266))))

(assert (=> start!68846 e!443953))

(assert (=> start!68846 true))

(declare-fun array_inv!16668 (array!43468) Bool)

(assert (=> start!68846 (array_inv!16668 a!3170)))

(declare-fun b!800443 () Bool)

(declare-fun res!544410 () Bool)

(assert (=> b!800443 (=> (not res!544410) (not e!443953))))

(assert (=> b!800443 (= res!544410 (validKeyInArray!0 k0!2044))))

(declare-fun b!800444 () Bool)

(assert (=> b!800444 (= e!443954 false)))

(declare-fun lt!357421 () SeekEntryResult!8356)

(assert (=> b!800444 (= lt!357421 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357420 vacantBefore!23 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800445 () Bool)

(declare-fun e!443955 () Bool)

(assert (=> b!800445 (= e!443951 e!443955)))

(declare-fun res!544419 () Bool)

(assert (=> b!800445 (=> (not res!544419) (not e!443955))))

(assert (=> b!800445 (= res!544419 (= lt!357417 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357415 lt!357418 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43468 (_ BitVec 32)) SeekEntryResult!8356)

(assert (=> b!800445 (= lt!357417 (seekEntryOrOpen!0 lt!357415 lt!357418 mask!3266))))

(assert (=> b!800445 (= lt!357415 (select (store (arr!20809 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800445 (= lt!357418 (array!43469 (store (arr!20809 a!3170) i!1163 k0!2044) (size!21229 a!3170)))))

(declare-fun b!800446 () Bool)

(declare-fun e!443952 () Bool)

(assert (=> b!800446 (= e!443952 e!443954)))

(declare-fun res!544414 () Bool)

(assert (=> b!800446 (=> (not res!544414) (not e!443954))))

(assert (=> b!800446 (= res!544414 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357420 #b00000000000000000000000000000000) (bvslt lt!357420 (size!21229 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800446 (= lt!357420 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800447 () Bool)

(assert (=> b!800447 (= e!443953 e!443951)))

(declare-fun res!544415 () Bool)

(assert (=> b!800447 (=> (not res!544415) (not e!443951))))

(declare-fun lt!357422 () SeekEntryResult!8356)

(assert (=> b!800447 (= res!544415 (or (= lt!357422 (MissingZero!8356 i!1163)) (= lt!357422 (MissingVacant!8356 i!1163))))))

(assert (=> b!800447 (= lt!357422 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800448 () Bool)

(assert (=> b!800448 (= e!443955 e!443952)))

(declare-fun res!544412 () Bool)

(assert (=> b!800448 (=> (not res!544412) (not e!443952))))

(declare-fun lt!357419 () SeekEntryResult!8356)

(declare-fun lt!357416 () SeekEntryResult!8356)

(assert (=> b!800448 (= res!544412 (and (= lt!357416 lt!357419) (= lt!357419 (Found!8356 j!153)) (not (= (select (arr!20809 a!3170) index!1236) (select (arr!20809 a!3170) j!153)))))))

(assert (=> b!800448 (= lt!357419 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800448 (= lt!357416 (seekEntryOrOpen!0 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68846 res!544411) b!800438))

(assert (= (and b!800438 res!544418) b!800441))

(assert (= (and b!800441 res!544407) b!800443))

(assert (= (and b!800443 res!544410) b!800436))

(assert (= (and b!800436 res!544408) b!800447))

(assert (= (and b!800447 res!544415) b!800442))

(assert (= (and b!800442 res!544417) b!800437))

(assert (= (and b!800437 res!544409) b!800439))

(assert (= (and b!800439 res!544413) b!800445))

(assert (= (and b!800445 res!544419) b!800448))

(assert (= (and b!800448 res!544412) b!800446))

(assert (= (and b!800446 res!544414) b!800440))

(assert (= (and b!800440 res!544416) b!800444))

(declare-fun m!741823 () Bool)

(assert (=> b!800444 m!741823))

(assert (=> b!800444 m!741823))

(declare-fun m!741825 () Bool)

(assert (=> b!800444 m!741825))

(declare-fun m!741827 () Bool)

(assert (=> b!800437 m!741827))

(declare-fun m!741829 () Bool)

(assert (=> b!800439 m!741829))

(declare-fun m!741831 () Bool)

(assert (=> b!800439 m!741831))

(declare-fun m!741833 () Bool)

(assert (=> b!800448 m!741833))

(assert (=> b!800448 m!741823))

(assert (=> b!800448 m!741823))

(declare-fun m!741835 () Bool)

(assert (=> b!800448 m!741835))

(assert (=> b!800448 m!741823))

(declare-fun m!741837 () Bool)

(assert (=> b!800448 m!741837))

(declare-fun m!741839 () Bool)

(assert (=> b!800446 m!741839))

(declare-fun m!741841 () Bool)

(assert (=> b!800436 m!741841))

(declare-fun m!741843 () Bool)

(assert (=> start!68846 m!741843))

(declare-fun m!741845 () Bool)

(assert (=> start!68846 m!741845))

(declare-fun m!741847 () Bool)

(assert (=> b!800442 m!741847))

(declare-fun m!741849 () Bool)

(assert (=> b!800443 m!741849))

(declare-fun m!741851 () Bool)

(assert (=> b!800440 m!741851))

(assert (=> b!800441 m!741823))

(assert (=> b!800441 m!741823))

(declare-fun m!741853 () Bool)

(assert (=> b!800441 m!741853))

(declare-fun m!741855 () Bool)

(assert (=> b!800447 m!741855))

(declare-fun m!741857 () Bool)

(assert (=> b!800445 m!741857))

(declare-fun m!741859 () Bool)

(assert (=> b!800445 m!741859))

(declare-fun m!741861 () Bool)

(assert (=> b!800445 m!741861))

(declare-fun m!741863 () Bool)

(assert (=> b!800445 m!741863))

(check-sat (not b!800447) (not b!800446) (not b!800443) (not start!68846) (not b!800437) (not b!800445) (not b!800442) (not b!800448) (not b!800436) (not b!800444) (not b!800440) (not b!800441))
(check-sat)
