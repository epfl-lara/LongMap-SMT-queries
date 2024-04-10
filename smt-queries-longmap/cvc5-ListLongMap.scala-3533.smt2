; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48768 () Bool)

(assert start!48768)

(declare-fun b!536456 () Bool)

(declare-fun res!331666 () Bool)

(declare-fun e!311420 () Bool)

(assert (=> b!536456 (=> (not res!331666) (not e!311420))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33980 0))(
  ( (array!33981 (arr!16329 (Array (_ BitVec 32) (_ BitVec 64))) (size!16693 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33980)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536456 (= res!331666 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16693 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16693 a!3154)) (= (select (arr!16329 a!3154) resIndex!32) (select (arr!16329 a!3154) j!147))))))

(declare-fun b!536457 () Bool)

(declare-fun res!331665 () Bool)

(declare-fun e!311422 () Bool)

(assert (=> b!536457 (=> (not res!331665) (not e!311422))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536457 (= res!331665 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536458 () Bool)

(declare-fun res!331671 () Bool)

(declare-fun e!311421 () Bool)

(assert (=> b!536458 (=> (not res!331671) (not e!311421))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4787 0))(
  ( (MissingZero!4787 (index!21372 (_ BitVec 32))) (Found!4787 (index!21373 (_ BitVec 32))) (Intermediate!4787 (undefined!5599 Bool) (index!21374 (_ BitVec 32)) (x!50314 (_ BitVec 32))) (Undefined!4787) (MissingVacant!4787 (index!21375 (_ BitVec 32))) )
))
(declare-fun lt!246101 () SeekEntryResult!4787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33980 (_ BitVec 32)) SeekEntryResult!4787)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536458 (= res!331671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16329 a!3154) j!147) mask!3216) (select (arr!16329 a!3154) j!147) a!3154 mask!3216) lt!246101))))

(declare-fun b!536459 () Bool)

(declare-fun e!311423 () Bool)

(assert (=> b!536459 (= e!311421 e!311423)))

(declare-fun res!331669 () Bool)

(assert (=> b!536459 (=> (not res!331669) (not e!311423))))

(declare-fun lt!246102 () (_ BitVec 32))

(assert (=> b!536459 (= res!331669 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246102 #b00000000000000000000000000000000) (bvslt lt!246102 (size!16693 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536459 (= lt!246102 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536460 () Bool)

(declare-fun res!331662 () Bool)

(assert (=> b!536460 (=> (not res!331662) (not e!311422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536460 (= res!331662 (validKeyInArray!0 (select (arr!16329 a!3154) j!147)))))

(declare-fun res!331664 () Bool)

(assert (=> start!48768 (=> (not res!331664) (not e!311422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48768 (= res!331664 (validMask!0 mask!3216))))

(assert (=> start!48768 e!311422))

(assert (=> start!48768 true))

(declare-fun array_inv!12125 (array!33980) Bool)

(assert (=> start!48768 (array_inv!12125 a!3154)))

(declare-fun b!536461 () Bool)

(declare-fun res!331670 () Bool)

(assert (=> b!536461 (=> (not res!331670) (not e!311420))))

(declare-datatypes ((List!10448 0))(
  ( (Nil!10445) (Cons!10444 (h!11387 (_ BitVec 64)) (t!16676 List!10448)) )
))
(declare-fun arrayNoDuplicates!0 (array!33980 (_ BitVec 32) List!10448) Bool)

(assert (=> b!536461 (= res!331670 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10445))))

(declare-fun b!536462 () Bool)

(declare-fun res!331661 () Bool)

(assert (=> b!536462 (=> (not res!331661) (not e!311421))))

(assert (=> b!536462 (= res!331661 (and (not (= (select (arr!16329 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16329 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16329 a!3154) index!1177) (select (arr!16329 a!3154) j!147)))))))

(declare-fun b!536463 () Bool)

(declare-fun res!331672 () Bool)

(assert (=> b!536463 (=> (not res!331672) (not e!311422))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536463 (= res!331672 (and (= (size!16693 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16693 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16693 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536464 () Bool)

(declare-fun res!331663 () Bool)

(assert (=> b!536464 (=> (not res!331663) (not e!311422))))

(assert (=> b!536464 (= res!331663 (validKeyInArray!0 k!1998))))

(declare-fun b!536465 () Bool)

(declare-fun res!331673 () Bool)

(assert (=> b!536465 (=> (not res!331673) (not e!311420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33980 (_ BitVec 32)) Bool)

(assert (=> b!536465 (= res!331673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536466 () Bool)

(assert (=> b!536466 (= e!311423 false)))

(declare-fun lt!246100 () SeekEntryResult!4787)

(assert (=> b!536466 (= lt!246100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246102 (select (arr!16329 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536467 () Bool)

(assert (=> b!536467 (= e!311422 e!311420)))

(declare-fun res!331668 () Bool)

(assert (=> b!536467 (=> (not res!331668) (not e!311420))))

(declare-fun lt!246103 () SeekEntryResult!4787)

(assert (=> b!536467 (= res!331668 (or (= lt!246103 (MissingZero!4787 i!1153)) (= lt!246103 (MissingVacant!4787 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33980 (_ BitVec 32)) SeekEntryResult!4787)

(assert (=> b!536467 (= lt!246103 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536468 () Bool)

(assert (=> b!536468 (= e!311420 e!311421)))

(declare-fun res!331667 () Bool)

(assert (=> b!536468 (=> (not res!331667) (not e!311421))))

(assert (=> b!536468 (= res!331667 (= lt!246101 (Intermediate!4787 false resIndex!32 resX!32)))))

(assert (=> b!536468 (= lt!246101 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16329 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48768 res!331664) b!536463))

(assert (= (and b!536463 res!331672) b!536460))

(assert (= (and b!536460 res!331662) b!536464))

(assert (= (and b!536464 res!331663) b!536457))

(assert (= (and b!536457 res!331665) b!536467))

(assert (= (and b!536467 res!331668) b!536465))

(assert (= (and b!536465 res!331673) b!536461))

(assert (= (and b!536461 res!331670) b!536456))

(assert (= (and b!536456 res!331666) b!536468))

(assert (= (and b!536468 res!331667) b!536458))

(assert (= (and b!536458 res!331671) b!536462))

(assert (= (and b!536462 res!331661) b!536459))

(assert (= (and b!536459 res!331669) b!536466))

(declare-fun m!515865 () Bool)

(assert (=> b!536467 m!515865))

(declare-fun m!515867 () Bool)

(assert (=> b!536466 m!515867))

(assert (=> b!536466 m!515867))

(declare-fun m!515869 () Bool)

(assert (=> b!536466 m!515869))

(assert (=> b!536468 m!515867))

(assert (=> b!536468 m!515867))

(declare-fun m!515871 () Bool)

(assert (=> b!536468 m!515871))

(declare-fun m!515873 () Bool)

(assert (=> b!536464 m!515873))

(declare-fun m!515875 () Bool)

(assert (=> b!536457 m!515875))

(assert (=> b!536460 m!515867))

(assert (=> b!536460 m!515867))

(declare-fun m!515877 () Bool)

(assert (=> b!536460 m!515877))

(declare-fun m!515879 () Bool)

(assert (=> b!536462 m!515879))

(assert (=> b!536462 m!515867))

(declare-fun m!515881 () Bool)

(assert (=> b!536461 m!515881))

(declare-fun m!515883 () Bool)

(assert (=> b!536456 m!515883))

(assert (=> b!536456 m!515867))

(declare-fun m!515885 () Bool)

(assert (=> b!536465 m!515885))

(declare-fun m!515887 () Bool)

(assert (=> start!48768 m!515887))

(declare-fun m!515889 () Bool)

(assert (=> start!48768 m!515889))

(declare-fun m!515891 () Bool)

(assert (=> b!536459 m!515891))

(assert (=> b!536458 m!515867))

(assert (=> b!536458 m!515867))

(declare-fun m!515893 () Bool)

(assert (=> b!536458 m!515893))

(assert (=> b!536458 m!515893))

(assert (=> b!536458 m!515867))

(declare-fun m!515895 () Bool)

(assert (=> b!536458 m!515895))

(push 1)

