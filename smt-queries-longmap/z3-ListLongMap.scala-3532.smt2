; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48764 () Bool)

(assert start!48764)

(declare-fun b!536379 () Bool)

(declare-fun res!331590 () Bool)

(declare-fun e!311393 () Bool)

(assert (=> b!536379 (=> (not res!331590) (not e!311393))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33976 0))(
  ( (array!33977 (arr!16327 (Array (_ BitVec 32) (_ BitVec 64))) (size!16691 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33976)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536379 (= res!331590 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16691 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16691 a!3154)) (= (select (arr!16327 a!3154) resIndex!32) (select (arr!16327 a!3154) j!147))))))

(declare-fun b!536380 () Bool)

(declare-fun res!331589 () Bool)

(declare-fun e!311392 () Bool)

(assert (=> b!536380 (=> (not res!331589) (not e!311392))))

(declare-datatypes ((SeekEntryResult!4785 0))(
  ( (MissingZero!4785 (index!21364 (_ BitVec 32))) (Found!4785 (index!21365 (_ BitVec 32))) (Intermediate!4785 (undefined!5597 Bool) (index!21366 (_ BitVec 32)) (x!50304 (_ BitVec 32))) (Undefined!4785) (MissingVacant!4785 (index!21367 (_ BitVec 32))) )
))
(declare-fun lt!246076 () SeekEntryResult!4785)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33976 (_ BitVec 32)) SeekEntryResult!4785)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536380 (= res!331589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16327 a!3154) j!147) mask!3216) (select (arr!16327 a!3154) j!147) a!3154 mask!3216) lt!246076))))

(declare-fun b!536381 () Bool)

(assert (=> b!536381 (= e!311393 e!311392)))

(declare-fun res!331586 () Bool)

(assert (=> b!536381 (=> (not res!331586) (not e!311392))))

(assert (=> b!536381 (= res!331586 (= lt!246076 (Intermediate!4785 false resIndex!32 resX!32)))))

(assert (=> b!536381 (= lt!246076 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16327 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536382 () Bool)

(declare-fun res!331587 () Bool)

(declare-fun e!311390 () Bool)

(assert (=> b!536382 (=> (not res!331587) (not e!311390))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536382 (= res!331587 (validKeyInArray!0 k0!1998))))

(declare-fun b!536383 () Bool)

(declare-fun res!331594 () Bool)

(assert (=> b!536383 (=> (not res!331594) (not e!311390))))

(declare-fun arrayContainsKey!0 (array!33976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536383 (= res!331594 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536384 () Bool)

(declare-fun res!331584 () Bool)

(assert (=> b!536384 (=> (not res!331584) (not e!311390))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536384 (= res!331584 (and (= (size!16691 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16691 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16691 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536385 () Bool)

(declare-fun res!331591 () Bool)

(assert (=> b!536385 (=> (not res!331591) (not e!311393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33976 (_ BitVec 32)) Bool)

(assert (=> b!536385 (= res!331591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536386 () Bool)

(declare-fun e!311391 () Bool)

(assert (=> b!536386 (= e!311392 e!311391)))

(declare-fun res!331595 () Bool)

(assert (=> b!536386 (=> (not res!331595) (not e!311391))))

(declare-fun lt!246078 () (_ BitVec 32))

(assert (=> b!536386 (= res!331595 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246078 #b00000000000000000000000000000000) (bvslt lt!246078 (size!16691 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536386 (= lt!246078 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536387 () Bool)

(assert (=> b!536387 (= e!311391 false)))

(declare-fun lt!246079 () SeekEntryResult!4785)

(assert (=> b!536387 (= lt!246079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246078 (select (arr!16327 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536388 () Bool)

(declare-fun res!331593 () Bool)

(assert (=> b!536388 (=> (not res!331593) (not e!311392))))

(assert (=> b!536388 (= res!331593 (and (not (= (select (arr!16327 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16327 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16327 a!3154) index!1177) (select (arr!16327 a!3154) j!147)))))))

(declare-fun res!331585 () Bool)

(assert (=> start!48764 (=> (not res!331585) (not e!311390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48764 (= res!331585 (validMask!0 mask!3216))))

(assert (=> start!48764 e!311390))

(assert (=> start!48764 true))

(declare-fun array_inv!12123 (array!33976) Bool)

(assert (=> start!48764 (array_inv!12123 a!3154)))

(declare-fun b!536378 () Bool)

(declare-fun res!331583 () Bool)

(assert (=> b!536378 (=> (not res!331583) (not e!311393))))

(declare-datatypes ((List!10446 0))(
  ( (Nil!10443) (Cons!10442 (h!11385 (_ BitVec 64)) (t!16674 List!10446)) )
))
(declare-fun arrayNoDuplicates!0 (array!33976 (_ BitVec 32) List!10446) Bool)

(assert (=> b!536378 (= res!331583 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10443))))

(declare-fun b!536389 () Bool)

(declare-fun res!331592 () Bool)

(assert (=> b!536389 (=> (not res!331592) (not e!311390))))

(assert (=> b!536389 (= res!331592 (validKeyInArray!0 (select (arr!16327 a!3154) j!147)))))

(declare-fun b!536390 () Bool)

(assert (=> b!536390 (= e!311390 e!311393)))

(declare-fun res!331588 () Bool)

(assert (=> b!536390 (=> (not res!331588) (not e!311393))))

(declare-fun lt!246077 () SeekEntryResult!4785)

(assert (=> b!536390 (= res!331588 (or (= lt!246077 (MissingZero!4785 i!1153)) (= lt!246077 (MissingVacant!4785 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33976 (_ BitVec 32)) SeekEntryResult!4785)

(assert (=> b!536390 (= lt!246077 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48764 res!331585) b!536384))

(assert (= (and b!536384 res!331584) b!536389))

(assert (= (and b!536389 res!331592) b!536382))

(assert (= (and b!536382 res!331587) b!536383))

(assert (= (and b!536383 res!331594) b!536390))

(assert (= (and b!536390 res!331588) b!536385))

(assert (= (and b!536385 res!331591) b!536378))

(assert (= (and b!536378 res!331583) b!536379))

(assert (= (and b!536379 res!331590) b!536381))

(assert (= (and b!536381 res!331586) b!536380))

(assert (= (and b!536380 res!331589) b!536388))

(assert (= (and b!536388 res!331593) b!536386))

(assert (= (and b!536386 res!331595) b!536387))

(declare-fun m!515801 () Bool)

(assert (=> b!536387 m!515801))

(assert (=> b!536387 m!515801))

(declare-fun m!515803 () Bool)

(assert (=> b!536387 m!515803))

(assert (=> b!536381 m!515801))

(assert (=> b!536381 m!515801))

(declare-fun m!515805 () Bool)

(assert (=> b!536381 m!515805))

(declare-fun m!515807 () Bool)

(assert (=> b!536379 m!515807))

(assert (=> b!536379 m!515801))

(declare-fun m!515809 () Bool)

(assert (=> b!536388 m!515809))

(assert (=> b!536388 m!515801))

(assert (=> b!536389 m!515801))

(assert (=> b!536389 m!515801))

(declare-fun m!515811 () Bool)

(assert (=> b!536389 m!515811))

(declare-fun m!515813 () Bool)

(assert (=> b!536382 m!515813))

(assert (=> b!536380 m!515801))

(assert (=> b!536380 m!515801))

(declare-fun m!515815 () Bool)

(assert (=> b!536380 m!515815))

(assert (=> b!536380 m!515815))

(assert (=> b!536380 m!515801))

(declare-fun m!515817 () Bool)

(assert (=> b!536380 m!515817))

(declare-fun m!515819 () Bool)

(assert (=> b!536383 m!515819))

(declare-fun m!515821 () Bool)

(assert (=> b!536386 m!515821))

(declare-fun m!515823 () Bool)

(assert (=> start!48764 m!515823))

(declare-fun m!515825 () Bool)

(assert (=> start!48764 m!515825))

(declare-fun m!515827 () Bool)

(assert (=> b!536385 m!515827))

(declare-fun m!515829 () Bool)

(assert (=> b!536390 m!515829))

(declare-fun m!515831 () Bool)

(assert (=> b!536378 m!515831))

(check-sat (not b!536390) (not b!536381) (not b!536389) (not b!536387) (not start!48764) (not b!536380) (not b!536386) (not b!536382) (not b!536383) (not b!536385) (not b!536378))
(check-sat)
