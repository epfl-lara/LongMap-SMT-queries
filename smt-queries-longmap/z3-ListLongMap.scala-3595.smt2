; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49486 () Bool)

(assert start!49486)

(declare-fun b!544577 () Bool)

(declare-fun e!314883 () Bool)

(declare-fun e!314886 () Bool)

(assert (=> b!544577 (= e!314883 e!314886)))

(declare-fun res!338743 () Bool)

(assert (=> b!544577 (=> (not res!338743) (not e!314886))))

(declare-datatypes ((SeekEntryResult!4924 0))(
  ( (MissingZero!4924 (index!21920 (_ BitVec 32))) (Found!4924 (index!21921 (_ BitVec 32))) (Intermediate!4924 (undefined!5736 Bool) (index!21922 (_ BitVec 32)) (x!50989 (_ BitVec 32))) (Undefined!4924) (MissingVacant!4924 (index!21923 (_ BitVec 32))) )
))
(declare-fun lt!248585 () SeekEntryResult!4924)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544577 (= res!338743 (or (= lt!248585 (MissingZero!4924 i!1153)) (= lt!248585 (MissingVacant!4924 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34361 0))(
  ( (array!34362 (arr!16510 (Array (_ BitVec 32) (_ BitVec 64))) (size!16874 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34361)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34361 (_ BitVec 32)) SeekEntryResult!4924)

(assert (=> b!544577 (= lt!248585 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544578 () Bool)

(declare-fun res!338745 () Bool)

(assert (=> b!544578 (=> (not res!338745) (not e!314886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34361 (_ BitVec 32)) Bool)

(assert (=> b!544578 (= res!338745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544579 () Bool)

(declare-fun res!338737 () Bool)

(assert (=> b!544579 (=> (not res!338737) (not e!314886))))

(declare-datatypes ((List!10536 0))(
  ( (Nil!10533) (Cons!10532 (h!11493 (_ BitVec 64)) (t!16756 List!10536)) )
))
(declare-fun arrayNoDuplicates!0 (array!34361 (_ BitVec 32) List!10536) Bool)

(assert (=> b!544579 (= res!338737 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10533))))

(declare-fun b!544580 () Bool)

(declare-fun res!338738 () Bool)

(declare-fun e!314885 () Bool)

(assert (=> b!544580 (=> (not res!338738) (not e!314885))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!544580 (= res!338738 (and (not (= (select (arr!16510 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16510 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16510 a!3154) index!1177) (select (arr!16510 a!3154) j!147)))))))

(declare-fun b!544581 () Bool)

(declare-fun res!338739 () Bool)

(assert (=> b!544581 (=> (not res!338739) (not e!314883))))

(assert (=> b!544581 (= res!338739 (and (= (size!16874 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16874 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16874 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544582 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544582 (= e!314885 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000)))))

(declare-fun lt!248587 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544582 (= lt!248587 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!544583 () Bool)

(declare-fun res!338742 () Bool)

(assert (=> b!544583 (=> (not res!338742) (not e!314883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544583 (= res!338742 (validKeyInArray!0 k0!1998))))

(declare-fun b!544584 () Bool)

(declare-fun res!338746 () Bool)

(assert (=> b!544584 (=> (not res!338746) (not e!314883))))

(declare-fun arrayContainsKey!0 (array!34361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544584 (= res!338746 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544586 () Bool)

(declare-fun res!338740 () Bool)

(assert (=> b!544586 (=> (not res!338740) (not e!314886))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!544586 (= res!338740 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16874 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16874 a!3154)) (= (select (arr!16510 a!3154) resIndex!32) (select (arr!16510 a!3154) j!147))))))

(declare-fun b!544587 () Bool)

(declare-fun res!338736 () Bool)

(assert (=> b!544587 (=> (not res!338736) (not e!314885))))

(declare-fun lt!248586 () SeekEntryResult!4924)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34361 (_ BitVec 32)) SeekEntryResult!4924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544587 (= res!338736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16510 a!3154) j!147) mask!3216) (select (arr!16510 a!3154) j!147) a!3154 mask!3216) lt!248586))))

(declare-fun b!544588 () Bool)

(assert (=> b!544588 (= e!314886 e!314885)))

(declare-fun res!338744 () Bool)

(assert (=> b!544588 (=> (not res!338744) (not e!314885))))

(assert (=> b!544588 (= res!338744 (= lt!248586 (Intermediate!4924 false resIndex!32 resX!32)))))

(assert (=> b!544588 (= lt!248586 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16510 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544585 () Bool)

(declare-fun res!338741 () Bool)

(assert (=> b!544585 (=> (not res!338741) (not e!314883))))

(assert (=> b!544585 (= res!338741 (validKeyInArray!0 (select (arr!16510 a!3154) j!147)))))

(declare-fun res!338735 () Bool)

(assert (=> start!49486 (=> (not res!338735) (not e!314883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49486 (= res!338735 (validMask!0 mask!3216))))

(assert (=> start!49486 e!314883))

(assert (=> start!49486 true))

(declare-fun array_inv!12369 (array!34361) Bool)

(assert (=> start!49486 (array_inv!12369 a!3154)))

(assert (= (and start!49486 res!338735) b!544581))

(assert (= (and b!544581 res!338739) b!544585))

(assert (= (and b!544585 res!338741) b!544583))

(assert (= (and b!544583 res!338742) b!544584))

(assert (= (and b!544584 res!338746) b!544577))

(assert (= (and b!544577 res!338743) b!544578))

(assert (= (and b!544578 res!338745) b!544579))

(assert (= (and b!544579 res!338737) b!544586))

(assert (= (and b!544586 res!338740) b!544588))

(assert (= (and b!544588 res!338744) b!544587))

(assert (= (and b!544587 res!338736) b!544580))

(assert (= (and b!544580 res!338738) b!544582))

(declare-fun m!522619 () Bool)

(assert (=> b!544577 m!522619))

(declare-fun m!522621 () Bool)

(assert (=> b!544588 m!522621))

(assert (=> b!544588 m!522621))

(declare-fun m!522623 () Bool)

(assert (=> b!544588 m!522623))

(declare-fun m!522625 () Bool)

(assert (=> b!544582 m!522625))

(declare-fun m!522627 () Bool)

(assert (=> b!544584 m!522627))

(assert (=> b!544587 m!522621))

(assert (=> b!544587 m!522621))

(declare-fun m!522629 () Bool)

(assert (=> b!544587 m!522629))

(assert (=> b!544587 m!522629))

(assert (=> b!544587 m!522621))

(declare-fun m!522631 () Bool)

(assert (=> b!544587 m!522631))

(assert (=> b!544585 m!522621))

(assert (=> b!544585 m!522621))

(declare-fun m!522633 () Bool)

(assert (=> b!544585 m!522633))

(declare-fun m!522635 () Bool)

(assert (=> b!544586 m!522635))

(assert (=> b!544586 m!522621))

(declare-fun m!522637 () Bool)

(assert (=> b!544578 m!522637))

(declare-fun m!522639 () Bool)

(assert (=> b!544579 m!522639))

(declare-fun m!522641 () Bool)

(assert (=> start!49486 m!522641))

(declare-fun m!522643 () Bool)

(assert (=> start!49486 m!522643))

(declare-fun m!522645 () Bool)

(assert (=> b!544580 m!522645))

(assert (=> b!544580 m!522621))

(declare-fun m!522647 () Bool)

(assert (=> b!544583 m!522647))

(check-sat (not b!544578) (not b!544583) (not b!544577) (not b!544579) (not b!544588) (not b!544587) (not b!544584) (not b!544582) (not start!49486) (not b!544585))
(check-sat)
