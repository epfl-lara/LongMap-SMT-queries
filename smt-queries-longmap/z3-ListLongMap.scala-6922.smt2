; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86950 () Bool)

(assert start!86950)

(declare-fun res!677631 () Bool)

(declare-fun e!567536 () Bool)

(assert (=> start!86950 (=> (not res!677631) (not e!567536))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86950 (= res!677631 (validMask!0 mask!3464))))

(assert (=> start!86950 e!567536))

(declare-datatypes ((array!63598 0))(
  ( (array!63599 (arr!30620 (Array (_ BitVec 32) (_ BitVec 64))) (size!31122 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63598)

(declare-fun array_inv!23744 (array!63598) Bool)

(assert (=> start!86950 (array_inv!23744 a!3219)))

(assert (=> start!86950 true))

(declare-fun b!1008725 () Bool)

(declare-fun res!677626 () Bool)

(assert (=> b!1008725 (=> (not res!677626) (not e!567536))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008725 (= res!677626 (and (= (size!31122 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31122 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31122 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008726 () Bool)

(declare-fun e!567539 () Bool)

(declare-fun e!567540 () Bool)

(assert (=> b!1008726 (= e!567539 e!567540)))

(declare-fun res!677630 () Bool)

(assert (=> b!1008726 (=> (not res!677630) (not e!567540))))

(declare-datatypes ((SeekEntryResult!9552 0))(
  ( (MissingZero!9552 (index!40579 (_ BitVec 32))) (Found!9552 (index!40580 (_ BitVec 32))) (Intermediate!9552 (undefined!10364 Bool) (index!40581 (_ BitVec 32)) (x!87966 (_ BitVec 32))) (Undefined!9552) (MissingVacant!9552 (index!40582 (_ BitVec 32))) )
))
(declare-fun lt!445846 () SeekEntryResult!9552)

(declare-fun lt!445842 () SeekEntryResult!9552)

(assert (=> b!1008726 (= res!677630 (= lt!445846 lt!445842))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008726 (= lt!445842 (Intermediate!9552 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63598 (_ BitVec 32)) SeekEntryResult!9552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008726 (= lt!445846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30620 a!3219) j!170) mask!3464) (select (arr!30620 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008727 () Bool)

(declare-fun e!567538 () Bool)

(assert (=> b!1008727 (= e!567538 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445847 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008727 (= lt!445847 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008728 () Bool)

(assert (=> b!1008728 (= e!567536 e!567539)))

(declare-fun res!677620 () Bool)

(assert (=> b!1008728 (=> (not res!677620) (not e!567539))))

(declare-fun lt!445845 () SeekEntryResult!9552)

(assert (=> b!1008728 (= res!677620 (or (= lt!445845 (MissingVacant!9552 i!1194)) (= lt!445845 (MissingZero!9552 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63598 (_ BitVec 32)) SeekEntryResult!9552)

(assert (=> b!1008728 (= lt!445845 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008729 () Bool)

(declare-fun res!677622 () Bool)

(assert (=> b!1008729 (=> (not res!677622) (not e!567539))))

(declare-datatypes ((List!21296 0))(
  ( (Nil!21293) (Cons!21292 (h!22478 (_ BitVec 64)) (t!30297 List!21296)) )
))
(declare-fun arrayNoDuplicates!0 (array!63598 (_ BitVec 32) List!21296) Bool)

(assert (=> b!1008729 (= res!677622 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21293))))

(declare-fun b!1008730 () Bool)

(declare-fun res!677618 () Bool)

(assert (=> b!1008730 (=> (not res!677618) (not e!567536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008730 (= res!677618 (validKeyInArray!0 (select (arr!30620 a!3219) j!170)))))

(declare-fun b!1008731 () Bool)

(declare-fun e!567541 () Bool)

(assert (=> b!1008731 (= e!567540 e!567541)))

(declare-fun res!677628 () Bool)

(assert (=> b!1008731 (=> (not res!677628) (not e!567541))))

(declare-fun lt!445844 () SeekEntryResult!9552)

(assert (=> b!1008731 (= res!677628 (= lt!445844 lt!445842))))

(assert (=> b!1008731 (= lt!445844 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30620 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008732 () Bool)

(assert (=> b!1008732 (= e!567541 e!567538)))

(declare-fun res!677627 () Bool)

(assert (=> b!1008732 (=> (not res!677627) (not e!567538))))

(declare-fun lt!445843 () (_ BitVec 64))

(declare-fun lt!445841 () array!63598)

(assert (=> b!1008732 (= res!677627 (not (= lt!445846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445843 mask!3464) lt!445843 lt!445841 mask!3464))))))

(assert (=> b!1008732 (= lt!445843 (select (store (arr!30620 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008732 (= lt!445841 (array!63599 (store (arr!30620 a!3219) i!1194 k0!2224) (size!31122 a!3219)))))

(declare-fun b!1008733 () Bool)

(declare-fun res!677619 () Bool)

(assert (=> b!1008733 (=> (not res!677619) (not e!567538))))

(assert (=> b!1008733 (= res!677619 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008734 () Bool)

(declare-fun res!677624 () Bool)

(assert (=> b!1008734 (=> (not res!677624) (not e!567536))))

(assert (=> b!1008734 (= res!677624 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008735 () Bool)

(declare-fun res!677629 () Bool)

(assert (=> b!1008735 (=> (not res!677629) (not e!567539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63598 (_ BitVec 32)) Bool)

(assert (=> b!1008735 (= res!677629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008736 () Bool)

(declare-fun res!677621 () Bool)

(assert (=> b!1008736 (=> (not res!677621) (not e!567536))))

(declare-fun arrayContainsKey!0 (array!63598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008736 (= res!677621 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008737 () Bool)

(declare-fun res!677623 () Bool)

(assert (=> b!1008737 (=> (not res!677623) (not e!567538))))

(assert (=> b!1008737 (= res!677623 (not (= lt!445844 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445843 lt!445841 mask!3464))))))

(declare-fun b!1008738 () Bool)

(declare-fun res!677625 () Bool)

(assert (=> b!1008738 (=> (not res!677625) (not e!567539))))

(assert (=> b!1008738 (= res!677625 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31122 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31122 a!3219))))))

(assert (= (and start!86950 res!677631) b!1008725))

(assert (= (and b!1008725 res!677626) b!1008730))

(assert (= (and b!1008730 res!677618) b!1008734))

(assert (= (and b!1008734 res!677624) b!1008736))

(assert (= (and b!1008736 res!677621) b!1008728))

(assert (= (and b!1008728 res!677620) b!1008735))

(assert (= (and b!1008735 res!677629) b!1008729))

(assert (= (and b!1008729 res!677622) b!1008738))

(assert (= (and b!1008738 res!677625) b!1008726))

(assert (= (and b!1008726 res!677630) b!1008731))

(assert (= (and b!1008731 res!677628) b!1008732))

(assert (= (and b!1008732 res!677627) b!1008737))

(assert (= (and b!1008737 res!677623) b!1008733))

(assert (= (and b!1008733 res!677619) b!1008727))

(declare-fun m!933431 () Bool)

(assert (=> b!1008730 m!933431))

(assert (=> b!1008730 m!933431))

(declare-fun m!933433 () Bool)

(assert (=> b!1008730 m!933433))

(assert (=> b!1008726 m!933431))

(assert (=> b!1008726 m!933431))

(declare-fun m!933435 () Bool)

(assert (=> b!1008726 m!933435))

(assert (=> b!1008726 m!933435))

(assert (=> b!1008726 m!933431))

(declare-fun m!933437 () Bool)

(assert (=> b!1008726 m!933437))

(declare-fun m!933439 () Bool)

(assert (=> b!1008737 m!933439))

(declare-fun m!933441 () Bool)

(assert (=> b!1008735 m!933441))

(assert (=> b!1008731 m!933431))

(assert (=> b!1008731 m!933431))

(declare-fun m!933443 () Bool)

(assert (=> b!1008731 m!933443))

(declare-fun m!933445 () Bool)

(assert (=> start!86950 m!933445))

(declare-fun m!933447 () Bool)

(assert (=> start!86950 m!933447))

(declare-fun m!933449 () Bool)

(assert (=> b!1008729 m!933449))

(declare-fun m!933451 () Bool)

(assert (=> b!1008734 m!933451))

(declare-fun m!933453 () Bool)

(assert (=> b!1008736 m!933453))

(declare-fun m!933455 () Bool)

(assert (=> b!1008727 m!933455))

(declare-fun m!933457 () Bool)

(assert (=> b!1008728 m!933457))

(declare-fun m!933459 () Bool)

(assert (=> b!1008732 m!933459))

(assert (=> b!1008732 m!933459))

(declare-fun m!933461 () Bool)

(assert (=> b!1008732 m!933461))

(declare-fun m!933463 () Bool)

(assert (=> b!1008732 m!933463))

(declare-fun m!933465 () Bool)

(assert (=> b!1008732 m!933465))

(check-sat (not b!1008730) (not b!1008735) (not b!1008734) (not b!1008737) (not b!1008728) (not b!1008726) (not b!1008736) (not b!1008731) (not b!1008732) (not b!1008729) (not start!86950) (not b!1008727))
(check-sat)
