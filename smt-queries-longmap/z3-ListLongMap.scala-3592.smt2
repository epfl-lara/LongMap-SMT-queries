; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49326 () Bool)

(assert start!49326)

(declare-fun b!543311 () Bool)

(declare-fun res!338005 () Bool)

(declare-fun e!314175 () Bool)

(assert (=> b!543311 (=> (not res!338005) (not e!314175))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543311 (= res!338005 (validKeyInArray!0 k0!1998))))

(declare-fun b!543312 () Bool)

(declare-fun res!338010 () Bool)

(declare-fun e!314173 () Bool)

(assert (=> b!543312 (=> (not res!338010) (not e!314173))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34344 0))(
  ( (array!34345 (arr!16505 (Array (_ BitVec 32) (_ BitVec 64))) (size!16870 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34344)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543312 (= res!338010 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16870 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16870 a!3154)) (= (select (arr!16505 a!3154) resIndex!32) (select (arr!16505 a!3154) j!147))))))

(declare-fun b!543313 () Bool)

(declare-fun res!338015 () Bool)

(assert (=> b!543313 (=> (not res!338015) (not e!314175))))

(declare-fun arrayContainsKey!0 (array!34344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543313 (= res!338015 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338006 () Bool)

(assert (=> start!49326 (=> (not res!338006) (not e!314175))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49326 (= res!338006 (validMask!0 mask!3216))))

(assert (=> start!49326 e!314175))

(assert (=> start!49326 true))

(declare-fun array_inv!12388 (array!34344) Bool)

(assert (=> start!49326 (array_inv!12388 a!3154)))

(declare-fun b!543314 () Bool)

(declare-fun res!338007 () Bool)

(assert (=> b!543314 (=> (not res!338007) (not e!314173))))

(declare-datatypes ((List!10663 0))(
  ( (Nil!10660) (Cons!10659 (h!11614 (_ BitVec 64)) (t!16882 List!10663)) )
))
(declare-fun arrayNoDuplicates!0 (array!34344 (_ BitVec 32) List!10663) Bool)

(assert (=> b!543314 (= res!338007 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10660))))

(declare-fun b!543315 () Bool)

(declare-fun res!338008 () Bool)

(declare-fun e!314172 () Bool)

(assert (=> b!543315 (=> (not res!338008) (not e!314172))))

(assert (=> b!543315 (= res!338008 (and (not (= (select (arr!16505 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16505 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16505 a!3154) index!1177) (select (arr!16505 a!3154) j!147)))))))

(declare-fun b!543316 () Bool)

(assert (=> b!543316 (= e!314175 e!314173)))

(declare-fun res!338004 () Bool)

(assert (=> b!543316 (=> (not res!338004) (not e!314173))))

(declare-datatypes ((SeekEntryResult!4960 0))(
  ( (MissingZero!4960 (index!22064 (_ BitVec 32))) (Found!4960 (index!22065 (_ BitVec 32))) (Intermediate!4960 (undefined!5772 Bool) (index!22066 (_ BitVec 32)) (x!50978 (_ BitVec 32))) (Undefined!4960) (MissingVacant!4960 (index!22067 (_ BitVec 32))) )
))
(declare-fun lt!247974 () SeekEntryResult!4960)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543316 (= res!338004 (or (= lt!247974 (MissingZero!4960 i!1153)) (= lt!247974 (MissingVacant!4960 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34344 (_ BitVec 32)) SeekEntryResult!4960)

(assert (=> b!543316 (= lt!247974 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543317 () Bool)

(declare-fun res!338013 () Bool)

(assert (=> b!543317 (=> (not res!338013) (not e!314172))))

(declare-fun lt!247973 () SeekEntryResult!4960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34344 (_ BitVec 32)) SeekEntryResult!4960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543317 (= res!338013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16505 a!3154) j!147) mask!3216) (select (arr!16505 a!3154) j!147) a!3154 mask!3216) lt!247973))))

(declare-fun b!543318 () Bool)

(declare-fun res!338014 () Bool)

(assert (=> b!543318 (=> (not res!338014) (not e!314173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34344 (_ BitVec 32)) Bool)

(assert (=> b!543318 (= res!338014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543319 () Bool)

(declare-fun res!338012 () Bool)

(assert (=> b!543319 (=> (not res!338012) (not e!314175))))

(assert (=> b!543319 (= res!338012 (and (= (size!16870 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16870 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16870 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543320 () Bool)

(assert (=> b!543320 (= e!314173 e!314172)))

(declare-fun res!338009 () Bool)

(assert (=> b!543320 (=> (not res!338009) (not e!314172))))

(assert (=> b!543320 (= res!338009 (= lt!247973 (Intermediate!4960 false resIndex!32 resX!32)))))

(assert (=> b!543320 (= lt!247973 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16505 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543321 () Bool)

(declare-fun res!338011 () Bool)

(assert (=> b!543321 (=> (not res!338011) (not e!314175))))

(assert (=> b!543321 (= res!338011 (validKeyInArray!0 (select (arr!16505 a!3154) j!147)))))

(declare-fun b!543322 () Bool)

(assert (=> b!543322 (= e!314172 false)))

(declare-fun lt!247975 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543322 (= lt!247975 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!49326 res!338006) b!543319))

(assert (= (and b!543319 res!338012) b!543321))

(assert (= (and b!543321 res!338011) b!543311))

(assert (= (and b!543311 res!338005) b!543313))

(assert (= (and b!543313 res!338015) b!543316))

(assert (= (and b!543316 res!338004) b!543318))

(assert (= (and b!543318 res!338014) b!543314))

(assert (= (and b!543314 res!338007) b!543312))

(assert (= (and b!543312 res!338010) b!543320))

(assert (= (and b!543320 res!338009) b!543317))

(assert (= (and b!543317 res!338013) b!543315))

(assert (= (and b!543315 res!338008) b!543322))

(declare-fun m!520897 () Bool)

(assert (=> start!49326 m!520897))

(declare-fun m!520899 () Bool)

(assert (=> start!49326 m!520899))

(declare-fun m!520901 () Bool)

(assert (=> b!543313 m!520901))

(declare-fun m!520903 () Bool)

(assert (=> b!543312 m!520903))

(declare-fun m!520905 () Bool)

(assert (=> b!543312 m!520905))

(declare-fun m!520907 () Bool)

(assert (=> b!543315 m!520907))

(assert (=> b!543315 m!520905))

(assert (=> b!543317 m!520905))

(assert (=> b!543317 m!520905))

(declare-fun m!520909 () Bool)

(assert (=> b!543317 m!520909))

(assert (=> b!543317 m!520909))

(assert (=> b!543317 m!520905))

(declare-fun m!520911 () Bool)

(assert (=> b!543317 m!520911))

(assert (=> b!543321 m!520905))

(assert (=> b!543321 m!520905))

(declare-fun m!520913 () Bool)

(assert (=> b!543321 m!520913))

(declare-fun m!520915 () Bool)

(assert (=> b!543311 m!520915))

(declare-fun m!520917 () Bool)

(assert (=> b!543316 m!520917))

(declare-fun m!520919 () Bool)

(assert (=> b!543318 m!520919))

(assert (=> b!543320 m!520905))

(assert (=> b!543320 m!520905))

(declare-fun m!520921 () Bool)

(assert (=> b!543320 m!520921))

(declare-fun m!520923 () Bool)

(assert (=> b!543322 m!520923))

(declare-fun m!520925 () Bool)

(assert (=> b!543314 m!520925))

(check-sat (not b!543321) (not b!543318) (not start!49326) (not b!543322) (not b!543313) (not b!543311) (not b!543320) (not b!543317) (not b!543314) (not b!543316))
(check-sat)
