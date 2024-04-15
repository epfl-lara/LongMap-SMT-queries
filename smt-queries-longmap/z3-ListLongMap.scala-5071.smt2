; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68916 () Bool)

(assert start!68916)

(declare-fun b!803930 () Bool)

(declare-fun e!445388 () Bool)

(assert (=> b!803930 (= e!445388 false)))

(declare-fun lt!359839 () Bool)

(declare-datatypes ((array!43723 0))(
  ( (array!43724 (arr!20942 (Array (_ BitVec 32) (_ BitVec 64))) (size!21363 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43723)

(declare-datatypes ((List!14944 0))(
  ( (Nil!14941) (Cons!14940 (h!16069 (_ BitVec 64)) (t!21250 List!14944)) )
))
(declare-fun arrayNoDuplicates!0 (array!43723 (_ BitVec 32) List!14944) Bool)

(assert (=> b!803930 (= lt!359839 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14941))))

(declare-fun b!803931 () Bool)

(declare-fun res!548594 () Bool)

(declare-fun e!445390 () Bool)

(assert (=> b!803931 (=> (not res!548594) (not e!445390))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803931 (= res!548594 (validKeyInArray!0 k0!2044))))

(declare-fun b!803932 () Bool)

(declare-fun res!548589 () Bool)

(assert (=> b!803932 (=> (not res!548589) (not e!445388))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43723 (_ BitVec 32)) Bool)

(assert (=> b!803932 (= res!548589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803933 () Bool)

(assert (=> b!803933 (= e!445390 e!445388)))

(declare-fun res!548590 () Bool)

(assert (=> b!803933 (=> (not res!548590) (not e!445388))))

(declare-datatypes ((SeekEntryResult!8530 0))(
  ( (MissingZero!8530 (index!36488 (_ BitVec 32))) (Found!8530 (index!36489 (_ BitVec 32))) (Intermediate!8530 (undefined!9342 Bool) (index!36490 (_ BitVec 32)) (x!67331 (_ BitVec 32))) (Undefined!8530) (MissingVacant!8530 (index!36491 (_ BitVec 32))) )
))
(declare-fun lt!359840 () SeekEntryResult!8530)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803933 (= res!548590 (or (= lt!359840 (MissingZero!8530 i!1163)) (= lt!359840 (MissingVacant!8530 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43723 (_ BitVec 32)) SeekEntryResult!8530)

(assert (=> b!803933 (= lt!359840 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803934 () Bool)

(declare-fun res!548592 () Bool)

(assert (=> b!803934 (=> (not res!548592) (not e!445390))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803934 (= res!548592 (and (= (size!21363 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21363 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21363 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!548591 () Bool)

(assert (=> start!68916 (=> (not res!548591) (not e!445390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68916 (= res!548591 (validMask!0 mask!3266))))

(assert (=> start!68916 e!445390))

(assert (=> start!68916 true))

(declare-fun array_inv!16825 (array!43723) Bool)

(assert (=> start!68916 (array_inv!16825 a!3170)))

(declare-fun b!803935 () Bool)

(declare-fun res!548595 () Bool)

(assert (=> b!803935 (=> (not res!548595) (not e!445390))))

(assert (=> b!803935 (= res!548595 (validKeyInArray!0 (select (arr!20942 a!3170) j!153)))))

(declare-fun b!803936 () Bool)

(declare-fun res!548593 () Bool)

(assert (=> b!803936 (=> (not res!548593) (not e!445390))))

(declare-fun arrayContainsKey!0 (array!43723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803936 (= res!548593 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68916 res!548591) b!803934))

(assert (= (and b!803934 res!548592) b!803935))

(assert (= (and b!803935 res!548595) b!803931))

(assert (= (and b!803931 res!548594) b!803936))

(assert (= (and b!803936 res!548593) b!803933))

(assert (= (and b!803933 res!548590) b!803932))

(assert (= (and b!803932 res!548589) b!803930))

(declare-fun m!745351 () Bool)

(assert (=> b!803936 m!745351))

(declare-fun m!745353 () Bool)

(assert (=> b!803935 m!745353))

(assert (=> b!803935 m!745353))

(declare-fun m!745355 () Bool)

(assert (=> b!803935 m!745355))

(declare-fun m!745357 () Bool)

(assert (=> start!68916 m!745357))

(declare-fun m!745359 () Bool)

(assert (=> start!68916 m!745359))

(declare-fun m!745361 () Bool)

(assert (=> b!803931 m!745361))

(declare-fun m!745363 () Bool)

(assert (=> b!803933 m!745363))

(declare-fun m!745365 () Bool)

(assert (=> b!803932 m!745365))

(declare-fun m!745367 () Bool)

(assert (=> b!803930 m!745367))

(check-sat (not b!803930) (not b!803936) (not b!803933) (not b!803931) (not b!803935) (not b!803932) (not start!68916))
(check-sat)
