; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86626 () Bool)

(assert start!86626)

(declare-fun b!1001789 () Bool)

(declare-fun res!670703 () Bool)

(declare-fun e!564639 () Bool)

(assert (=> b!1001789 (=> (not res!670703) (not e!564639))))

(declare-datatypes ((array!63297 0))(
  ( (array!63298 (arr!30469 (Array (_ BitVec 32) (_ BitVec 64))) (size!30972 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63297)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001789 (= res!670703 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001790 () Bool)

(declare-fun res!670707 () Bool)

(assert (=> b!1001790 (=> (not res!670707) (not e!564639))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001790 (= res!670707 (and (= (size!30972 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30972 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30972 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001791 () Bool)

(declare-fun res!670709 () Bool)

(declare-fun e!564638 () Bool)

(assert (=> b!1001791 (=> (not res!670709) (not e!564638))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001791 (= res!670709 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30972 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30972 a!3219))))))

(declare-fun b!1001792 () Bool)

(declare-fun res!670712 () Bool)

(assert (=> b!1001792 (=> (not res!670712) (not e!564639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001792 (= res!670712 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001793 () Bool)

(declare-fun res!670708 () Bool)

(declare-fun e!564640 () Bool)

(assert (=> b!1001793 (=> (not res!670708) (not e!564640))))

(declare-datatypes ((SeekEntryResult!9337 0))(
  ( (MissingZero!9337 (index!39719 (_ BitVec 32))) (Found!9337 (index!39720 (_ BitVec 32))) (Intermediate!9337 (undefined!10149 Bool) (index!39721 (_ BitVec 32)) (x!87299 (_ BitVec 32))) (Undefined!9337) (MissingVacant!9337 (index!39722 (_ BitVec 32))) )
))
(declare-fun lt!442764 () SeekEntryResult!9337)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63297 (_ BitVec 32)) SeekEntryResult!9337)

(assert (=> b!1001793 (= res!670708 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30469 a!3219) j!170) a!3219 mask!3464) lt!442764))))

(declare-fun b!1001794 () Bool)

(declare-fun res!670711 () Bool)

(assert (=> b!1001794 (=> (not res!670711) (not e!564638))))

(declare-datatypes ((List!21116 0))(
  ( (Nil!21113) (Cons!21112 (h!22295 (_ BitVec 64)) (t!30109 List!21116)) )
))
(declare-fun arrayNoDuplicates!0 (array!63297 (_ BitVec 32) List!21116) Bool)

(assert (=> b!1001794 (= res!670711 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21113))))

(declare-fun b!1001795 () Bool)

(assert (=> b!1001795 (= e!564639 e!564638)))

(declare-fun res!670705 () Bool)

(assert (=> b!1001795 (=> (not res!670705) (not e!564638))))

(declare-fun lt!442767 () SeekEntryResult!9337)

(assert (=> b!1001795 (= res!670705 (or (= lt!442767 (MissingVacant!9337 i!1194)) (= lt!442767 (MissingZero!9337 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63297 (_ BitVec 32)) SeekEntryResult!9337)

(assert (=> b!1001795 (= lt!442767 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001796 () Bool)

(declare-fun e!564641 () Bool)

(assert (=> b!1001796 (= e!564641 false)))

(declare-fun lt!442765 () array!63297)

(declare-fun lt!442769 () SeekEntryResult!9337)

(declare-fun lt!442766 () (_ BitVec 64))

(assert (=> b!1001796 (= lt!442769 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442766 lt!442765 mask!3464))))

(declare-fun b!1001797 () Bool)

(declare-fun res!670706 () Bool)

(assert (=> b!1001797 (=> (not res!670706) (not e!564639))))

(assert (=> b!1001797 (= res!670706 (validKeyInArray!0 (select (arr!30469 a!3219) j!170)))))

(declare-fun b!1001798 () Bool)

(assert (=> b!1001798 (= e!564638 e!564640)))

(declare-fun res!670702 () Bool)

(assert (=> b!1001798 (=> (not res!670702) (not e!564640))))

(declare-fun lt!442768 () SeekEntryResult!9337)

(assert (=> b!1001798 (= res!670702 (= lt!442768 lt!442764))))

(assert (=> b!1001798 (= lt!442764 (Intermediate!9337 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001798 (= lt!442768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30469 a!3219) j!170) mask!3464) (select (arr!30469 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001799 () Bool)

(declare-fun res!670701 () Bool)

(assert (=> b!1001799 (=> (not res!670701) (not e!564638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63297 (_ BitVec 32)) Bool)

(assert (=> b!1001799 (= res!670701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001800 () Bool)

(assert (=> b!1001800 (= e!564640 e!564641)))

(declare-fun res!670704 () Bool)

(assert (=> b!1001800 (=> (not res!670704) (not e!564641))))

(assert (=> b!1001800 (= res!670704 (not (= lt!442768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442766 mask!3464) lt!442766 lt!442765 mask!3464))))))

(assert (=> b!1001800 (= lt!442766 (select (store (arr!30469 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001800 (= lt!442765 (array!63298 (store (arr!30469 a!3219) i!1194 k0!2224) (size!30972 a!3219)))))

(declare-fun res!670710 () Bool)

(assert (=> start!86626 (=> (not res!670710) (not e!564639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86626 (= res!670710 (validMask!0 mask!3464))))

(assert (=> start!86626 e!564639))

(declare-fun array_inv!23605 (array!63297) Bool)

(assert (=> start!86626 (array_inv!23605 a!3219)))

(assert (=> start!86626 true))

(assert (= (and start!86626 res!670710) b!1001790))

(assert (= (and b!1001790 res!670707) b!1001797))

(assert (= (and b!1001797 res!670706) b!1001792))

(assert (= (and b!1001792 res!670712) b!1001789))

(assert (= (and b!1001789 res!670703) b!1001795))

(assert (= (and b!1001795 res!670705) b!1001799))

(assert (= (and b!1001799 res!670701) b!1001794))

(assert (= (and b!1001794 res!670711) b!1001791))

(assert (= (and b!1001791 res!670709) b!1001798))

(assert (= (and b!1001798 res!670702) b!1001793))

(assert (= (and b!1001793 res!670708) b!1001800))

(assert (= (and b!1001800 res!670704) b!1001796))

(declare-fun m!928319 () Bool)

(assert (=> b!1001798 m!928319))

(assert (=> b!1001798 m!928319))

(declare-fun m!928321 () Bool)

(assert (=> b!1001798 m!928321))

(assert (=> b!1001798 m!928321))

(assert (=> b!1001798 m!928319))

(declare-fun m!928323 () Bool)

(assert (=> b!1001798 m!928323))

(declare-fun m!928325 () Bool)

(assert (=> b!1001795 m!928325))

(declare-fun m!928327 () Bool)

(assert (=> b!1001799 m!928327))

(declare-fun m!928329 () Bool)

(assert (=> b!1001796 m!928329))

(declare-fun m!928331 () Bool)

(assert (=> b!1001789 m!928331))

(declare-fun m!928333 () Bool)

(assert (=> start!86626 m!928333))

(declare-fun m!928335 () Bool)

(assert (=> start!86626 m!928335))

(declare-fun m!928337 () Bool)

(assert (=> b!1001794 m!928337))

(declare-fun m!928339 () Bool)

(assert (=> b!1001792 m!928339))

(declare-fun m!928341 () Bool)

(assert (=> b!1001800 m!928341))

(assert (=> b!1001800 m!928341))

(declare-fun m!928343 () Bool)

(assert (=> b!1001800 m!928343))

(declare-fun m!928345 () Bool)

(assert (=> b!1001800 m!928345))

(declare-fun m!928347 () Bool)

(assert (=> b!1001800 m!928347))

(assert (=> b!1001793 m!928319))

(assert (=> b!1001793 m!928319))

(declare-fun m!928349 () Bool)

(assert (=> b!1001793 m!928349))

(assert (=> b!1001797 m!928319))

(assert (=> b!1001797 m!928319))

(declare-fun m!928351 () Bool)

(assert (=> b!1001797 m!928351))

(check-sat (not start!86626) (not b!1001795) (not b!1001800) (not b!1001796) (not b!1001789) (not b!1001794) (not b!1001797) (not b!1001798) (not b!1001799) (not b!1001793) (not b!1001792))
(check-sat)
