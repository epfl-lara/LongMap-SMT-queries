; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68574 () Bool)

(assert start!68574)

(declare-fun b!796296 () Bool)

(declare-fun res!540443 () Bool)

(declare-fun e!442007 () Bool)

(assert (=> b!796296 (=> (not res!540443) (not e!442007))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43238 0))(
  ( (array!43239 (arr!20695 (Array (_ BitVec 32) (_ BitVec 64))) (size!21115 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43238)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796296 (= res!540443 (and (= (size!21115 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21115 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21115 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796297 () Bool)

(declare-fun e!442009 () Bool)

(assert (=> b!796297 (= e!442009 false)))

(declare-datatypes ((SeekEntryResult!8242 0))(
  ( (MissingZero!8242 (index!35336 (_ BitVec 32))) (Found!8242 (index!35337 (_ BitVec 32))) (Intermediate!8242 (undefined!9054 Bool) (index!35338 (_ BitVec 32)) (x!66411 (_ BitVec 32))) (Undefined!8242) (MissingVacant!8242 (index!35339 (_ BitVec 32))) )
))
(declare-fun lt!354949 () SeekEntryResult!8242)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43238 (_ BitVec 32)) SeekEntryResult!8242)

(assert (=> b!796297 (= lt!354949 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20695 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354948 () SeekEntryResult!8242)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43238 (_ BitVec 32)) SeekEntryResult!8242)

(assert (=> b!796297 (= lt!354948 (seekEntryOrOpen!0 (select (arr!20695 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796298 () Bool)

(declare-fun res!540445 () Bool)

(declare-fun e!442008 () Bool)

(assert (=> b!796298 (=> (not res!540445) (not e!442008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43238 (_ BitVec 32)) Bool)

(assert (=> b!796298 (= res!540445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796299 () Bool)

(declare-fun res!540442 () Bool)

(assert (=> b!796299 (=> (not res!540442) (not e!442007))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796299 (= res!540442 (validKeyInArray!0 k0!2044))))

(declare-fun b!796300 () Bool)

(declare-fun res!540449 () Bool)

(assert (=> b!796300 (=> (not res!540449) (not e!442008))))

(declare-datatypes ((List!14565 0))(
  ( (Nil!14562) (Cons!14561 (h!15696 (_ BitVec 64)) (t!20872 List!14565)) )
))
(declare-fun arrayNoDuplicates!0 (array!43238 (_ BitVec 32) List!14565) Bool)

(assert (=> b!796300 (= res!540449 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14562))))

(declare-fun b!796301 () Bool)

(declare-fun res!540447 () Bool)

(assert (=> b!796301 (=> (not res!540447) (not e!442008))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796301 (= res!540447 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21115 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20695 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21115 a!3170)) (= (select (arr!20695 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!540444 () Bool)

(assert (=> start!68574 (=> (not res!540444) (not e!442007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68574 (= res!540444 (validMask!0 mask!3266))))

(assert (=> start!68574 e!442007))

(assert (=> start!68574 true))

(declare-fun array_inv!16554 (array!43238) Bool)

(assert (=> start!68574 (array_inv!16554 a!3170)))

(declare-fun b!796302 () Bool)

(assert (=> b!796302 (= e!442008 e!442009)))

(declare-fun res!540441 () Bool)

(assert (=> b!796302 (=> (not res!540441) (not e!442009))))

(declare-fun lt!354952 () (_ BitVec 64))

(declare-fun lt!354951 () array!43238)

(assert (=> b!796302 (= res!540441 (= (seekEntryOrOpen!0 lt!354952 lt!354951 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354952 lt!354951 mask!3266)))))

(assert (=> b!796302 (= lt!354952 (select (store (arr!20695 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796302 (= lt!354951 (array!43239 (store (arr!20695 a!3170) i!1163 k0!2044) (size!21115 a!3170)))))

(declare-fun b!796303 () Bool)

(assert (=> b!796303 (= e!442007 e!442008)))

(declare-fun res!540450 () Bool)

(assert (=> b!796303 (=> (not res!540450) (not e!442008))))

(declare-fun lt!354950 () SeekEntryResult!8242)

(assert (=> b!796303 (= res!540450 (or (= lt!354950 (MissingZero!8242 i!1163)) (= lt!354950 (MissingVacant!8242 i!1163))))))

(assert (=> b!796303 (= lt!354950 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796304 () Bool)

(declare-fun res!540446 () Bool)

(assert (=> b!796304 (=> (not res!540446) (not e!442007))))

(declare-fun arrayContainsKey!0 (array!43238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796304 (= res!540446 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796305 () Bool)

(declare-fun res!540448 () Bool)

(assert (=> b!796305 (=> (not res!540448) (not e!442007))))

(assert (=> b!796305 (= res!540448 (validKeyInArray!0 (select (arr!20695 a!3170) j!153)))))

(assert (= (and start!68574 res!540444) b!796296))

(assert (= (and b!796296 res!540443) b!796305))

(assert (= (and b!796305 res!540448) b!796299))

(assert (= (and b!796299 res!540442) b!796304))

(assert (= (and b!796304 res!540446) b!796303))

(assert (= (and b!796303 res!540450) b!796298))

(assert (= (and b!796298 res!540445) b!796300))

(assert (= (and b!796300 res!540449) b!796301))

(assert (= (and b!796301 res!540447) b!796302))

(assert (= (and b!796302 res!540441) b!796297))

(declare-fun m!737399 () Bool)

(assert (=> b!796303 m!737399))

(declare-fun m!737401 () Bool)

(assert (=> b!796301 m!737401))

(declare-fun m!737403 () Bool)

(assert (=> b!796301 m!737403))

(declare-fun m!737405 () Bool)

(assert (=> b!796298 m!737405))

(declare-fun m!737407 () Bool)

(assert (=> b!796304 m!737407))

(declare-fun m!737409 () Bool)

(assert (=> b!796299 m!737409))

(declare-fun m!737411 () Bool)

(assert (=> start!68574 m!737411))

(declare-fun m!737413 () Bool)

(assert (=> start!68574 m!737413))

(declare-fun m!737415 () Bool)

(assert (=> b!796302 m!737415))

(declare-fun m!737417 () Bool)

(assert (=> b!796302 m!737417))

(declare-fun m!737419 () Bool)

(assert (=> b!796302 m!737419))

(declare-fun m!737421 () Bool)

(assert (=> b!796302 m!737421))

(declare-fun m!737423 () Bool)

(assert (=> b!796297 m!737423))

(assert (=> b!796297 m!737423))

(declare-fun m!737425 () Bool)

(assert (=> b!796297 m!737425))

(assert (=> b!796297 m!737423))

(declare-fun m!737427 () Bool)

(assert (=> b!796297 m!737427))

(declare-fun m!737429 () Bool)

(assert (=> b!796300 m!737429))

(assert (=> b!796305 m!737423))

(assert (=> b!796305 m!737423))

(declare-fun m!737431 () Bool)

(assert (=> b!796305 m!737431))

(check-sat (not b!796305) (not b!796297) (not b!796303) (not start!68574) (not b!796302) (not b!796304) (not b!796300) (not b!796299) (not b!796298))
(check-sat)
