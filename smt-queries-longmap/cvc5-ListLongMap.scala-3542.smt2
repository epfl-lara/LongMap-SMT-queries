; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48822 () Bool)

(assert start!48822)

(declare-fun b!537509 () Bool)

(declare-fun res!332716 () Bool)

(declare-fun e!311826 () Bool)

(assert (=> b!537509 (=> (not res!332716) (not e!311826))))

(declare-datatypes ((array!34034 0))(
  ( (array!34035 (arr!16356 (Array (_ BitVec 32) (_ BitVec 64))) (size!16720 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34034)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537509 (= res!332716 (validKeyInArray!0 (select (arr!16356 a!3154) j!147)))))

(declare-fun b!537510 () Bool)

(declare-fun e!311828 () Bool)

(assert (=> b!537510 (= e!311826 e!311828)))

(declare-fun res!332726 () Bool)

(assert (=> b!537510 (=> (not res!332726) (not e!311828))))

(declare-datatypes ((SeekEntryResult!4814 0))(
  ( (MissingZero!4814 (index!21480 (_ BitVec 32))) (Found!4814 (index!21481 (_ BitVec 32))) (Intermediate!4814 (undefined!5626 Bool) (index!21482 (_ BitVec 32)) (x!50413 (_ BitVec 32))) (Undefined!4814) (MissingVacant!4814 (index!21483 (_ BitVec 32))) )
))
(declare-fun lt!246424 () SeekEntryResult!4814)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537510 (= res!332726 (or (= lt!246424 (MissingZero!4814 i!1153)) (= lt!246424 (MissingVacant!4814 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34034 (_ BitVec 32)) SeekEntryResult!4814)

(assert (=> b!537510 (= lt!246424 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537511 () Bool)

(declare-fun res!332715 () Bool)

(declare-fun e!311827 () Bool)

(assert (=> b!537511 (=> (not res!332715) (not e!311827))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537511 (= res!332715 (and (not (= (select (arr!16356 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16356 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16356 a!3154) index!1177) (select (arr!16356 a!3154) j!147)))))))

(declare-fun b!537512 () Bool)

(declare-fun res!332714 () Bool)

(assert (=> b!537512 (=> (not res!332714) (not e!311826))))

(assert (=> b!537512 (= res!332714 (and (= (size!16720 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16720 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16720 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!332720 () Bool)

(assert (=> start!48822 (=> (not res!332720) (not e!311826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48822 (= res!332720 (validMask!0 mask!3216))))

(assert (=> start!48822 e!311826))

(assert (=> start!48822 true))

(declare-fun array_inv!12152 (array!34034) Bool)

(assert (=> start!48822 (array_inv!12152 a!3154)))

(declare-fun b!537513 () Bool)

(declare-fun res!332725 () Bool)

(assert (=> b!537513 (=> (not res!332725) (not e!311828))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537513 (= res!332725 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16720 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16720 a!3154)) (= (select (arr!16356 a!3154) resIndex!32) (select (arr!16356 a!3154) j!147))))))

(declare-fun b!537514 () Bool)

(declare-fun res!332719 () Bool)

(assert (=> b!537514 (=> (not res!332719) (not e!311826))))

(declare-fun arrayContainsKey!0 (array!34034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537514 (= res!332719 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537515 () Bool)

(declare-fun res!332721 () Bool)

(assert (=> b!537515 (=> (not res!332721) (not e!311828))))

(declare-datatypes ((List!10475 0))(
  ( (Nil!10472) (Cons!10471 (h!11414 (_ BitVec 64)) (t!16703 List!10475)) )
))
(declare-fun arrayNoDuplicates!0 (array!34034 (_ BitVec 32) List!10475) Bool)

(assert (=> b!537515 (= res!332721 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10472))))

(declare-fun b!537516 () Bool)

(declare-fun e!311825 () Bool)

(assert (=> b!537516 (= e!311827 e!311825)))

(declare-fun res!332723 () Bool)

(assert (=> b!537516 (=> (not res!332723) (not e!311825))))

(declare-fun lt!246427 () (_ BitVec 32))

(assert (=> b!537516 (= res!332723 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246427 #b00000000000000000000000000000000) (bvslt lt!246427 (size!16720 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537516 (= lt!246427 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537517 () Bool)

(declare-fun res!332724 () Bool)

(assert (=> b!537517 (=> (not res!332724) (not e!311827))))

(declare-fun lt!246425 () SeekEntryResult!4814)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34034 (_ BitVec 32)) SeekEntryResult!4814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537517 (= res!332724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16356 a!3154) j!147) mask!3216) (select (arr!16356 a!3154) j!147) a!3154 mask!3216) lt!246425))))

(declare-fun b!537518 () Bool)

(declare-fun res!332718 () Bool)

(assert (=> b!537518 (=> (not res!332718) (not e!311826))))

(assert (=> b!537518 (= res!332718 (validKeyInArray!0 k!1998))))

(declare-fun b!537519 () Bool)

(declare-fun res!332717 () Bool)

(assert (=> b!537519 (=> (not res!332717) (not e!311828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34034 (_ BitVec 32)) Bool)

(assert (=> b!537519 (= res!332717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537520 () Bool)

(assert (=> b!537520 (= e!311825 false)))

(declare-fun lt!246426 () SeekEntryResult!4814)

(assert (=> b!537520 (= lt!246426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246427 (select (arr!16356 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537521 () Bool)

(assert (=> b!537521 (= e!311828 e!311827)))

(declare-fun res!332722 () Bool)

(assert (=> b!537521 (=> (not res!332722) (not e!311827))))

(assert (=> b!537521 (= res!332722 (= lt!246425 (Intermediate!4814 false resIndex!32 resX!32)))))

(assert (=> b!537521 (= lt!246425 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16356 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48822 res!332720) b!537512))

(assert (= (and b!537512 res!332714) b!537509))

(assert (= (and b!537509 res!332716) b!537518))

(assert (= (and b!537518 res!332718) b!537514))

(assert (= (and b!537514 res!332719) b!537510))

(assert (= (and b!537510 res!332726) b!537519))

(assert (= (and b!537519 res!332717) b!537515))

(assert (= (and b!537515 res!332721) b!537513))

(assert (= (and b!537513 res!332725) b!537521))

(assert (= (and b!537521 res!332722) b!537517))

(assert (= (and b!537517 res!332724) b!537511))

(assert (= (and b!537511 res!332715) b!537516))

(assert (= (and b!537516 res!332723) b!537520))

(declare-fun m!516729 () Bool)

(assert (=> b!537521 m!516729))

(assert (=> b!537521 m!516729))

(declare-fun m!516731 () Bool)

(assert (=> b!537521 m!516731))

(declare-fun m!516733 () Bool)

(assert (=> b!537518 m!516733))

(assert (=> b!537517 m!516729))

(assert (=> b!537517 m!516729))

(declare-fun m!516735 () Bool)

(assert (=> b!537517 m!516735))

(assert (=> b!537517 m!516735))

(assert (=> b!537517 m!516729))

(declare-fun m!516737 () Bool)

(assert (=> b!537517 m!516737))

(declare-fun m!516739 () Bool)

(assert (=> b!537514 m!516739))

(assert (=> b!537509 m!516729))

(assert (=> b!537509 m!516729))

(declare-fun m!516741 () Bool)

(assert (=> b!537509 m!516741))

(declare-fun m!516743 () Bool)

(assert (=> b!537510 m!516743))

(declare-fun m!516745 () Bool)

(assert (=> b!537516 m!516745))

(declare-fun m!516747 () Bool)

(assert (=> start!48822 m!516747))

(declare-fun m!516749 () Bool)

(assert (=> start!48822 m!516749))

(declare-fun m!516751 () Bool)

(assert (=> b!537511 m!516751))

(assert (=> b!537511 m!516729))

(declare-fun m!516753 () Bool)

(assert (=> b!537513 m!516753))

(assert (=> b!537513 m!516729))

(assert (=> b!537520 m!516729))

(assert (=> b!537520 m!516729))

(declare-fun m!516755 () Bool)

(assert (=> b!537520 m!516755))

(declare-fun m!516757 () Bool)

(assert (=> b!537515 m!516757))

(declare-fun m!516759 () Bool)

(assert (=> b!537519 m!516759))

(push 1)

