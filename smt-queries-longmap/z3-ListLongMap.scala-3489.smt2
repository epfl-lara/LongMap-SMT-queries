; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48390 () Bool)

(assert start!48390)

(declare-fun b!531585 () Bool)

(declare-fun res!327217 () Bool)

(declare-fun e!309579 () Bool)

(assert (=> b!531585 (=> (not res!327217) (not e!309579))))

(declare-datatypes ((array!33708 0))(
  ( (array!33709 (arr!16196 (Array (_ BitVec 32) (_ BitVec 64))) (size!16561 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33708)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531585 (= res!327217 (validKeyInArray!0 (select (arr!16196 a!3154) j!147)))))

(declare-fun b!531586 () Bool)

(declare-fun res!327224 () Bool)

(assert (=> b!531586 (=> (not res!327224) (not e!309579))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531586 (= res!327224 (and (= (size!16561 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16561 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16561 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531587 () Bool)

(declare-fun res!327223 () Bool)

(declare-fun e!309578 () Bool)

(assert (=> b!531587 (=> (not res!327223) (not e!309578))))

(declare-datatypes ((List!10354 0))(
  ( (Nil!10351) (Cons!10350 (h!11290 (_ BitVec 64)) (t!16573 List!10354)) )
))
(declare-fun arrayNoDuplicates!0 (array!33708 (_ BitVec 32) List!10354) Bool)

(assert (=> b!531587 (= res!327223 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10351))))

(declare-fun b!531588 () Bool)

(declare-fun res!327221 () Bool)

(assert (=> b!531588 (=> (not res!327221) (not e!309579))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531588 (= res!327221 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531590 () Bool)

(declare-fun res!327220 () Bool)

(assert (=> b!531590 (=> (not res!327220) (not e!309578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33708 (_ BitVec 32)) Bool)

(assert (=> b!531590 (= res!327220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531591 () Bool)

(declare-fun res!327218 () Bool)

(assert (=> b!531591 (=> (not res!327218) (not e!309579))))

(assert (=> b!531591 (= res!327218 (validKeyInArray!0 k0!1998))))

(declare-fun b!531592 () Bool)

(assert (=> b!531592 (= e!309579 e!309578)))

(declare-fun res!327219 () Bool)

(assert (=> b!531592 (=> (not res!327219) (not e!309578))))

(declare-datatypes ((SeekEntryResult!4651 0))(
  ( (MissingZero!4651 (index!20828 (_ BitVec 32))) (Found!4651 (index!20829 (_ BitVec 32))) (Intermediate!4651 (undefined!5463 Bool) (index!20830 (_ BitVec 32)) (x!49812 (_ BitVec 32))) (Undefined!4651) (MissingVacant!4651 (index!20831 (_ BitVec 32))) )
))
(declare-fun lt!244852 () SeekEntryResult!4651)

(assert (=> b!531592 (= res!327219 (or (= lt!244852 (MissingZero!4651 i!1153)) (= lt!244852 (MissingVacant!4651 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33708 (_ BitVec 32)) SeekEntryResult!4651)

(assert (=> b!531592 (= lt!244852 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!327222 () Bool)

(assert (=> start!48390 (=> (not res!327222) (not e!309579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48390 (= res!327222 (validMask!0 mask!3216))))

(assert (=> start!48390 e!309579))

(assert (=> start!48390 true))

(declare-fun array_inv!12079 (array!33708) Bool)

(assert (=> start!48390 (array_inv!12079 a!3154)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun b!531589 () Bool)

(assert (=> b!531589 (= e!309578 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16561 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16561 a!3154)) (= (select (arr!16196 a!3154) resIndex!32) (select (arr!16196 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (= (and start!48390 res!327222) b!531586))

(assert (= (and b!531586 res!327224) b!531585))

(assert (= (and b!531585 res!327217) b!531591))

(assert (= (and b!531591 res!327218) b!531588))

(assert (= (and b!531588 res!327221) b!531592))

(assert (= (and b!531592 res!327219) b!531590))

(assert (= (and b!531590 res!327220) b!531587))

(assert (= (and b!531587 res!327223) b!531589))

(declare-fun m!511447 () Bool)

(assert (=> b!531592 m!511447))

(declare-fun m!511449 () Bool)

(assert (=> b!531585 m!511449))

(assert (=> b!531585 m!511449))

(declare-fun m!511451 () Bool)

(assert (=> b!531585 m!511451))

(declare-fun m!511453 () Bool)

(assert (=> b!531589 m!511453))

(assert (=> b!531589 m!511449))

(declare-fun m!511455 () Bool)

(assert (=> b!531591 m!511455))

(declare-fun m!511457 () Bool)

(assert (=> b!531590 m!511457))

(declare-fun m!511459 () Bool)

(assert (=> start!48390 m!511459))

(declare-fun m!511461 () Bool)

(assert (=> start!48390 m!511461))

(declare-fun m!511463 () Bool)

(assert (=> b!531588 m!511463))

(declare-fun m!511465 () Bool)

(assert (=> b!531587 m!511465))

(check-sat (not b!531592) (not b!531590) (not start!48390) (not b!531585) (not b!531587) (not b!531591) (not b!531588))
(check-sat)
