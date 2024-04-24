; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68358 () Bool)

(assert start!68358)

(declare-fun b!793338 () Bool)

(declare-fun e!440890 () Bool)

(declare-fun e!440888 () Bool)

(assert (=> b!793338 (= e!440890 e!440888)))

(declare-fun res!537487 () Bool)

(assert (=> b!793338 (=> (not res!537487) (not e!440888))))

(declare-datatypes ((SeekEntryResult!8134 0))(
  ( (MissingZero!8134 (index!34904 (_ BitVec 32))) (Found!8134 (index!34905 (_ BitVec 32))) (Intermediate!8134 (undefined!8946 Bool) (index!34906 (_ BitVec 32)) (x!66015 (_ BitVec 32))) (Undefined!8134) (MissingVacant!8134 (index!34907 (_ BitVec 32))) )
))
(declare-fun lt!353835 () SeekEntryResult!8134)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793338 (= res!537487 (or (= lt!353835 (MissingZero!8134 i!1163)) (= lt!353835 (MissingVacant!8134 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43022 0))(
  ( (array!43023 (arr!20587 (Array (_ BitVec 32) (_ BitVec 64))) (size!21007 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43022)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43022 (_ BitVec 32)) SeekEntryResult!8134)

(assert (=> b!793338 (= lt!353835 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793339 () Bool)

(declare-fun res!537488 () Bool)

(assert (=> b!793339 (=> (not res!537488) (not e!440890))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793339 (= res!537488 (and (= (size!21007 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21007 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21007 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793340 () Bool)

(declare-fun res!537485 () Bool)

(assert (=> b!793340 (=> (not res!537485) (not e!440890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793340 (= res!537485 (validKeyInArray!0 (select (arr!20587 a!3170) j!153)))))

(declare-fun res!537483 () Bool)

(assert (=> start!68358 (=> (not res!537483) (not e!440890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68358 (= res!537483 (validMask!0 mask!3266))))

(assert (=> start!68358 e!440890))

(assert (=> start!68358 true))

(declare-fun array_inv!16446 (array!43022) Bool)

(assert (=> start!68358 (array_inv!16446 a!3170)))

(declare-fun b!793341 () Bool)

(declare-fun res!537484 () Bool)

(assert (=> b!793341 (=> (not res!537484) (not e!440890))))

(assert (=> b!793341 (= res!537484 (validKeyInArray!0 k0!2044))))

(declare-fun b!793342 () Bool)

(declare-fun res!537486 () Bool)

(assert (=> b!793342 (=> (not res!537486) (not e!440890))))

(declare-fun arrayContainsKey!0 (array!43022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793342 (= res!537486 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793343 () Bool)

(assert (=> b!793343 (= e!440888 false)))

(declare-fun lt!353836 () Bool)

(declare-datatypes ((List!14457 0))(
  ( (Nil!14454) (Cons!14453 (h!15588 (_ BitVec 64)) (t!20764 List!14457)) )
))
(declare-fun arrayNoDuplicates!0 (array!43022 (_ BitVec 32) List!14457) Bool)

(assert (=> b!793343 (= lt!353836 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14454))))

(declare-fun b!793344 () Bool)

(declare-fun res!537489 () Bool)

(assert (=> b!793344 (=> (not res!537489) (not e!440888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43022 (_ BitVec 32)) Bool)

(assert (=> b!793344 (= res!537489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68358 res!537483) b!793339))

(assert (= (and b!793339 res!537488) b!793340))

(assert (= (and b!793340 res!537485) b!793341))

(assert (= (and b!793341 res!537484) b!793342))

(assert (= (and b!793342 res!537486) b!793338))

(assert (= (and b!793338 res!537487) b!793344))

(assert (= (and b!793344 res!537489) b!793343))

(declare-fun m!734297 () Bool)

(assert (=> b!793340 m!734297))

(assert (=> b!793340 m!734297))

(declare-fun m!734299 () Bool)

(assert (=> b!793340 m!734299))

(declare-fun m!734301 () Bool)

(assert (=> b!793342 m!734301))

(declare-fun m!734303 () Bool)

(assert (=> b!793338 m!734303))

(declare-fun m!734305 () Bool)

(assert (=> start!68358 m!734305))

(declare-fun m!734307 () Bool)

(assert (=> start!68358 m!734307))

(declare-fun m!734309 () Bool)

(assert (=> b!793344 m!734309))

(declare-fun m!734311 () Bool)

(assert (=> b!793343 m!734311))

(declare-fun m!734313 () Bool)

(assert (=> b!793341 m!734313))

(check-sat (not b!793338) (not b!793343) (not b!793344) (not start!68358) (not b!793342) (not b!793340) (not b!793341))
(check-sat)
