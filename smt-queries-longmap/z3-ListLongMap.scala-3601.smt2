; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49642 () Bool)

(assert start!49642)

(declare-fun b!545783 () Bool)

(declare-fun e!315484 () Bool)

(declare-fun e!315481 () Bool)

(assert (=> b!545783 (= e!315484 e!315481)))

(declare-fun res!339605 () Bool)

(assert (=> b!545783 (=> (not res!339605) (not e!315481))))

(declare-datatypes ((SeekEntryResult!4942 0))(
  ( (MissingZero!4942 (index!21992 (_ BitVec 32))) (Found!4942 (index!21993 (_ BitVec 32))) (Intermediate!4942 (undefined!5754 Bool) (index!21994 (_ BitVec 32)) (x!51073 (_ BitVec 32))) (Undefined!4942) (MissingVacant!4942 (index!21995 (_ BitVec 32))) )
))
(declare-fun lt!249008 () SeekEntryResult!4942)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545783 (= res!339605 (or (= lt!249008 (MissingZero!4942 i!1153)) (= lt!249008 (MissingVacant!4942 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34403 0))(
  ( (array!34404 (arr!16528 (Array (_ BitVec 32) (_ BitVec 64))) (size!16892 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34403)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34403 (_ BitVec 32)) SeekEntryResult!4942)

(assert (=> b!545783 (= lt!249008 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545784 () Bool)

(declare-fun e!315485 () Bool)

(declare-fun e!315482 () Bool)

(assert (=> b!545784 (= e!315485 e!315482)))

(declare-fun res!339614 () Bool)

(assert (=> b!545784 (=> (not res!339614) (not e!315482))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!249009 () (_ BitVec 32))

(assert (=> b!545784 (= res!339614 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249009 #b00000000000000000000000000000000) (bvslt lt!249009 (size!16892 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545784 (= lt!249009 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!545785 () Bool)

(declare-fun res!339608 () Bool)

(assert (=> b!545785 (=> (not res!339608) (not e!315481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34403 (_ BitVec 32)) Bool)

(assert (=> b!545785 (= res!339608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545786 () Bool)

(declare-fun res!339611 () Bool)

(assert (=> b!545786 (=> (not res!339611) (not e!315484))))

(declare-fun arrayContainsKey!0 (array!34403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545786 (= res!339611 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545787 () Bool)

(declare-fun res!339610 () Bool)

(assert (=> b!545787 (=> (not res!339610) (not e!315481))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545787 (= res!339610 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16892 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16892 a!3154)) (= (select (arr!16528 a!3154) resIndex!32) (select (arr!16528 a!3154) j!147))))))

(declare-fun b!545788 () Bool)

(declare-fun res!339606 () Bool)

(assert (=> b!545788 (=> (not res!339606) (not e!315481))))

(declare-datatypes ((List!10554 0))(
  ( (Nil!10551) (Cons!10550 (h!11517 (_ BitVec 64)) (t!16774 List!10554)) )
))
(declare-fun arrayNoDuplicates!0 (array!34403 (_ BitVec 32) List!10554) Bool)

(assert (=> b!545788 (= res!339606 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10551))))

(declare-fun b!545789 () Bool)

(declare-fun res!339613 () Bool)

(assert (=> b!545789 (=> (not res!339613) (not e!315484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545789 (= res!339613 (validKeyInArray!0 (select (arr!16528 a!3154) j!147)))))

(declare-fun b!545790 () Bool)

(declare-fun res!339609 () Bool)

(assert (=> b!545790 (=> (not res!339609) (not e!315484))))

(assert (=> b!545790 (= res!339609 (and (= (size!16892 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16892 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16892 a!3154)) (not (= i!1153 j!147))))))

(declare-fun lt!249005 () SeekEntryResult!4942)

(declare-fun b!545791 () Bool)

(declare-fun lt!249006 () SeekEntryResult!4942)

(declare-fun lt!249010 () SeekEntryResult!4942)

(assert (=> b!545791 (= e!315482 (and (= lt!249006 lt!249010) (= lt!249005 lt!249006) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1030)) (bvsub #b01111111111111111111111111111110 x!1030))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34403 (_ BitVec 32)) SeekEntryResult!4942)

(assert (=> b!545791 (= lt!249006 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249009 (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545792 () Bool)

(declare-fun e!315483 () Bool)

(assert (=> b!545792 (= e!315481 e!315483)))

(declare-fun res!339615 () Bool)

(assert (=> b!545792 (=> (not res!339615) (not e!315483))))

(declare-fun lt!249007 () SeekEntryResult!4942)

(assert (=> b!545792 (= res!339615 (= lt!249007 lt!249010))))

(assert (=> b!545792 (= lt!249010 (Intermediate!4942 false resIndex!32 resX!32))))

(assert (=> b!545792 (= lt!249007 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545793 () Bool)

(declare-fun res!339616 () Bool)

(assert (=> b!545793 (=> (not res!339616) (not e!315484))))

(assert (=> b!545793 (= res!339616 (validKeyInArray!0 k0!1998))))

(declare-fun res!339612 () Bool)

(assert (=> start!49642 (=> (not res!339612) (not e!315484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49642 (= res!339612 (validMask!0 mask!3216))))

(assert (=> start!49642 e!315484))

(assert (=> start!49642 true))

(declare-fun array_inv!12387 (array!34403) Bool)

(assert (=> start!49642 (array_inv!12387 a!3154)))

(declare-fun b!545794 () Bool)

(assert (=> b!545794 (= e!315483 e!315485)))

(declare-fun res!339607 () Bool)

(assert (=> b!545794 (=> (not res!339607) (not e!315485))))

(assert (=> b!545794 (= res!339607 (and (= lt!249005 lt!249007) (not (= (select (arr!16528 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16528 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16528 a!3154) index!1177) (select (arr!16528 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545794 (= lt!249005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16528 a!3154) j!147) mask!3216) (select (arr!16528 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49642 res!339612) b!545790))

(assert (= (and b!545790 res!339609) b!545789))

(assert (= (and b!545789 res!339613) b!545793))

(assert (= (and b!545793 res!339616) b!545786))

(assert (= (and b!545786 res!339611) b!545783))

(assert (= (and b!545783 res!339605) b!545785))

(assert (= (and b!545785 res!339608) b!545788))

(assert (= (and b!545788 res!339606) b!545787))

(assert (= (and b!545787 res!339610) b!545792))

(assert (= (and b!545792 res!339615) b!545794))

(assert (= (and b!545794 res!339607) b!545784))

(assert (= (and b!545784 res!339614) b!545791))

(declare-fun m!523483 () Bool)

(assert (=> b!545784 m!523483))

(declare-fun m!523485 () Bool)

(assert (=> b!545791 m!523485))

(assert (=> b!545791 m!523485))

(declare-fun m!523487 () Bool)

(assert (=> b!545791 m!523487))

(assert (=> b!545789 m!523485))

(assert (=> b!545789 m!523485))

(declare-fun m!523489 () Bool)

(assert (=> b!545789 m!523489))

(declare-fun m!523491 () Bool)

(assert (=> b!545783 m!523491))

(declare-fun m!523493 () Bool)

(assert (=> b!545793 m!523493))

(declare-fun m!523495 () Bool)

(assert (=> b!545786 m!523495))

(declare-fun m!523497 () Bool)

(assert (=> b!545794 m!523497))

(assert (=> b!545794 m!523485))

(assert (=> b!545794 m!523485))

(declare-fun m!523499 () Bool)

(assert (=> b!545794 m!523499))

(assert (=> b!545794 m!523499))

(assert (=> b!545794 m!523485))

(declare-fun m!523501 () Bool)

(assert (=> b!545794 m!523501))

(declare-fun m!523503 () Bool)

(assert (=> start!49642 m!523503))

(declare-fun m!523505 () Bool)

(assert (=> start!49642 m!523505))

(declare-fun m!523507 () Bool)

(assert (=> b!545787 m!523507))

(assert (=> b!545787 m!523485))

(declare-fun m!523509 () Bool)

(assert (=> b!545788 m!523509))

(assert (=> b!545792 m!523485))

(assert (=> b!545792 m!523485))

(declare-fun m!523511 () Bool)

(assert (=> b!545792 m!523511))

(declare-fun m!523513 () Bool)

(assert (=> b!545785 m!523513))

(check-sat (not b!545786) (not b!545783) (not b!545789) (not b!545793) (not start!49642) (not b!545792) (not b!545791) (not b!545785) (not b!545784) (not b!545788) (not b!545794))
(check-sat)
