; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48372 () Bool)

(assert start!48372)

(declare-fun b!531378 () Bool)

(declare-fun res!327016 () Bool)

(declare-fun e!309496 () Bool)

(assert (=> b!531378 (=> (not res!327016) (not e!309496))))

(declare-datatypes ((array!33690 0))(
  ( (array!33691 (arr!16187 (Array (_ BitVec 32) (_ BitVec 64))) (size!16552 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33690)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531378 (= res!327016 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327015 () Bool)

(assert (=> start!48372 (=> (not res!327015) (not e!309496))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48372 (= res!327015 (validMask!0 mask!3216))))

(assert (=> start!48372 e!309496))

(assert (=> start!48372 true))

(declare-fun array_inv!12070 (array!33690) Bool)

(assert (=> start!48372 (array_inv!12070 a!3154)))

(declare-fun b!531379 () Bool)

(declare-fun e!309498 () Bool)

(assert (=> b!531379 (= e!309496 e!309498)))

(declare-fun res!327014 () Bool)

(assert (=> b!531379 (=> (not res!327014) (not e!309498))))

(declare-datatypes ((SeekEntryResult!4642 0))(
  ( (MissingZero!4642 (index!20792 (_ BitVec 32))) (Found!4642 (index!20793 (_ BitVec 32))) (Intermediate!4642 (undefined!5454 Bool) (index!20794 (_ BitVec 32)) (x!49779 (_ BitVec 32))) (Undefined!4642) (MissingVacant!4642 (index!20795 (_ BitVec 32))) )
))
(declare-fun lt!244816 () SeekEntryResult!4642)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531379 (= res!327014 (or (= lt!244816 (MissingZero!4642 i!1153)) (= lt!244816 (MissingVacant!4642 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33690 (_ BitVec 32)) SeekEntryResult!4642)

(assert (=> b!531379 (= lt!244816 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531380 () Bool)

(declare-fun res!327010 () Bool)

(assert (=> b!531380 (=> (not res!327010) (not e!309498))))

(declare-datatypes ((List!10345 0))(
  ( (Nil!10342) (Cons!10341 (h!11281 (_ BitVec 64)) (t!16564 List!10345)) )
))
(declare-fun arrayNoDuplicates!0 (array!33690 (_ BitVec 32) List!10345) Bool)

(assert (=> b!531380 (= res!327010 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10342))))

(declare-fun b!531381 () Bool)

(declare-fun res!327011 () Bool)

(assert (=> b!531381 (=> (not res!327011) (not e!309496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531381 (= res!327011 (validKeyInArray!0 k0!1998))))

(declare-fun b!531382 () Bool)

(declare-fun res!327012 () Bool)

(assert (=> b!531382 (=> (not res!327012) (not e!309498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33690 (_ BitVec 32)) Bool)

(assert (=> b!531382 (= res!327012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531383 () Bool)

(declare-fun res!327013 () Bool)

(assert (=> b!531383 (=> (not res!327013) (not e!309496))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531383 (= res!327013 (validKeyInArray!0 (select (arr!16187 a!3154) j!147)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun b!531384 () Bool)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531384 (= e!309498 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16552 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16552 a!3154)) (= (select (arr!16187 a!3154) resIndex!32) (select (arr!16187 a!3154) j!147)) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!531385 () Bool)

(declare-fun res!327017 () Bool)

(assert (=> b!531385 (=> (not res!327017) (not e!309496))))

(assert (=> b!531385 (= res!327017 (and (= (size!16552 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16552 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16552 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48372 res!327015) b!531385))

(assert (= (and b!531385 res!327017) b!531383))

(assert (= (and b!531383 res!327013) b!531381))

(assert (= (and b!531381 res!327011) b!531378))

(assert (= (and b!531378 res!327016) b!531379))

(assert (= (and b!531379 res!327014) b!531382))

(assert (= (and b!531382 res!327012) b!531380))

(assert (= (and b!531380 res!327010) b!531384))

(declare-fun m!511273 () Bool)

(assert (=> b!531378 m!511273))

(declare-fun m!511275 () Bool)

(assert (=> b!531383 m!511275))

(assert (=> b!531383 m!511275))

(declare-fun m!511277 () Bool)

(assert (=> b!531383 m!511277))

(declare-fun m!511279 () Bool)

(assert (=> b!531379 m!511279))

(declare-fun m!511281 () Bool)

(assert (=> b!531384 m!511281))

(assert (=> b!531384 m!511275))

(declare-fun m!511283 () Bool)

(assert (=> start!48372 m!511283))

(declare-fun m!511285 () Bool)

(assert (=> start!48372 m!511285))

(declare-fun m!511287 () Bool)

(assert (=> b!531380 m!511287))

(declare-fun m!511289 () Bool)

(assert (=> b!531382 m!511289))

(declare-fun m!511291 () Bool)

(assert (=> b!531381 m!511291))

(check-sat (not b!531380) (not b!531382) (not b!531383) (not b!531379) (not start!48372) (not b!531378) (not b!531381))
(check-sat)
