; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46064 () Bool)

(assert start!46064)

(declare-fun b!510163 () Bool)

(declare-fun e!298242 () Bool)

(assert (=> b!510163 (= e!298242 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4233 0))(
  ( (MissingZero!4233 (index!19120 (_ BitVec 32))) (Found!4233 (index!19121 (_ BitVec 32))) (Intermediate!4233 (undefined!5045 Bool) (index!19122 (_ BitVec 32)) (x!48082 (_ BitVec 32))) (Undefined!4233) (MissingVacant!4233 (index!19123 (_ BitVec 32))) )
))
(declare-fun lt!233199 () SeekEntryResult!4233)

(declare-fun lt!233201 () (_ BitVec 64))

(declare-datatypes ((array!32775 0))(
  ( (array!32776 (arr!15766 (Array (_ BitVec 32) (_ BitVec 64))) (size!16130 (_ BitVec 32))) )
))
(declare-fun lt!233200 () array!32775)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32775 (_ BitVec 32)) SeekEntryResult!4233)

(assert (=> b!510163 (= lt!233199 (seekEntryOrOpen!0 lt!233201 lt!233200 mask!3524))))

(declare-datatypes ((Unit!15724 0))(
  ( (Unit!15725) )
))
(declare-fun lt!233198 () Unit!15724)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32775)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32775 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15724)

(assert (=> b!510163 (= lt!233198 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510164 () Bool)

(declare-fun res!311011 () Bool)

(declare-fun e!298244 () Bool)

(assert (=> b!510164 (=> (not res!311011) (not e!298244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32775 (_ BitVec 32)) Bool)

(assert (=> b!510164 (= res!311011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510165 () Bool)

(assert (=> b!510165 (= e!298244 (not e!298242))))

(declare-fun res!311009 () Bool)

(assert (=> b!510165 (=> res!311009 e!298242)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32775 (_ BitVec 32)) SeekEntryResult!4233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510165 (= res!311009 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15766 a!3235) j!176) mask!3524) (select (arr!15766 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233201 mask!3524) lt!233201 lt!233200 mask!3524))))))

(assert (=> b!510165 (= lt!233201 (select (store (arr!15766 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510165 (= lt!233200 (array!32776 (store (arr!15766 a!3235) i!1204 k0!2280) (size!16130 a!3235)))))

(assert (=> b!510165 (= lt!233199 (Found!4233 j!176))))

(assert (=> b!510165 (= lt!233199 (seekEntryOrOpen!0 (select (arr!15766 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510165 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233203 () Unit!15724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15724)

(assert (=> b!510165 (= lt!233203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510166 () Bool)

(declare-fun res!311008 () Bool)

(assert (=> b!510166 (=> (not res!311008) (not e!298244))))

(declare-datatypes ((List!9924 0))(
  ( (Nil!9921) (Cons!9920 (h!10797 (_ BitVec 64)) (t!16152 List!9924)) )
))
(declare-fun arrayNoDuplicates!0 (array!32775 (_ BitVec 32) List!9924) Bool)

(assert (=> b!510166 (= res!311008 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9921))))

(declare-fun b!510162 () Bool)

(declare-fun res!311012 () Bool)

(declare-fun e!298243 () Bool)

(assert (=> b!510162 (=> (not res!311012) (not e!298243))))

(declare-fun arrayContainsKey!0 (array!32775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510162 (= res!311012 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311010 () Bool)

(assert (=> start!46064 (=> (not res!311010) (not e!298243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46064 (= res!311010 (validMask!0 mask!3524))))

(assert (=> start!46064 e!298243))

(assert (=> start!46064 true))

(declare-fun array_inv!11562 (array!32775) Bool)

(assert (=> start!46064 (array_inv!11562 a!3235)))

(declare-fun b!510167 () Bool)

(declare-fun res!311013 () Bool)

(assert (=> b!510167 (=> (not res!311013) (not e!298243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510167 (= res!311013 (validKeyInArray!0 k0!2280))))

(declare-fun b!510168 () Bool)

(declare-fun res!311007 () Bool)

(assert (=> b!510168 (=> (not res!311007) (not e!298243))))

(assert (=> b!510168 (= res!311007 (and (= (size!16130 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16130 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16130 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510169 () Bool)

(assert (=> b!510169 (= e!298243 e!298244)))

(declare-fun res!311015 () Bool)

(assert (=> b!510169 (=> (not res!311015) (not e!298244))))

(declare-fun lt!233202 () SeekEntryResult!4233)

(assert (=> b!510169 (= res!311015 (or (= lt!233202 (MissingZero!4233 i!1204)) (= lt!233202 (MissingVacant!4233 i!1204))))))

(assert (=> b!510169 (= lt!233202 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510170 () Bool)

(declare-fun res!311014 () Bool)

(assert (=> b!510170 (=> (not res!311014) (not e!298243))))

(assert (=> b!510170 (= res!311014 (validKeyInArray!0 (select (arr!15766 a!3235) j!176)))))

(assert (= (and start!46064 res!311010) b!510168))

(assert (= (and b!510168 res!311007) b!510170))

(assert (= (and b!510170 res!311014) b!510167))

(assert (= (and b!510167 res!311013) b!510162))

(assert (= (and b!510162 res!311012) b!510169))

(assert (= (and b!510169 res!311015) b!510164))

(assert (= (and b!510164 res!311011) b!510166))

(assert (= (and b!510166 res!311008) b!510165))

(assert (= (and b!510165 (not res!311009)) b!510163))

(declare-fun m!491293 () Bool)

(assert (=> b!510164 m!491293))

(declare-fun m!491295 () Bool)

(assert (=> b!510166 m!491295))

(declare-fun m!491297 () Bool)

(assert (=> b!510165 m!491297))

(declare-fun m!491299 () Bool)

(assert (=> b!510165 m!491299))

(declare-fun m!491301 () Bool)

(assert (=> b!510165 m!491301))

(declare-fun m!491303 () Bool)

(assert (=> b!510165 m!491303))

(declare-fun m!491305 () Bool)

(assert (=> b!510165 m!491305))

(declare-fun m!491307 () Bool)

(assert (=> b!510165 m!491307))

(declare-fun m!491309 () Bool)

(assert (=> b!510165 m!491309))

(assert (=> b!510165 m!491307))

(declare-fun m!491311 () Bool)

(assert (=> b!510165 m!491311))

(assert (=> b!510165 m!491307))

(declare-fun m!491313 () Bool)

(assert (=> b!510165 m!491313))

(assert (=> b!510165 m!491297))

(assert (=> b!510165 m!491309))

(assert (=> b!510165 m!491307))

(declare-fun m!491315 () Bool)

(assert (=> b!510165 m!491315))

(declare-fun m!491317 () Bool)

(assert (=> b!510169 m!491317))

(declare-fun m!491319 () Bool)

(assert (=> start!46064 m!491319))

(declare-fun m!491321 () Bool)

(assert (=> start!46064 m!491321))

(declare-fun m!491323 () Bool)

(assert (=> b!510167 m!491323))

(assert (=> b!510170 m!491307))

(assert (=> b!510170 m!491307))

(declare-fun m!491325 () Bool)

(assert (=> b!510170 m!491325))

(declare-fun m!491327 () Bool)

(assert (=> b!510163 m!491327))

(declare-fun m!491329 () Bool)

(assert (=> b!510163 m!491329))

(declare-fun m!491331 () Bool)

(assert (=> b!510162 m!491331))

(check-sat (not b!510170) (not b!510169) (not b!510162) (not b!510164) (not start!46064) (not b!510165) (not b!510163) (not b!510167) (not b!510166))
(check-sat)
