; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49578 () Bool)

(assert start!49578)

(declare-fun b!545204 () Bool)

(declare-fun e!315129 () Bool)

(declare-fun e!315125 () Bool)

(assert (=> b!545204 (= e!315129 e!315125)))

(declare-fun res!339282 () Bool)

(assert (=> b!545204 (=> (not res!339282) (not e!315125))))

(declare-datatypes ((SeekEntryResult!4984 0))(
  ( (MissingZero!4984 (index!22160 (_ BitVec 32))) (Found!4984 (index!22161 (_ BitVec 32))) (Intermediate!4984 (undefined!5796 Bool) (index!22162 (_ BitVec 32)) (x!51099 (_ BitVec 32))) (Undefined!4984) (MissingVacant!4984 (index!22163 (_ BitVec 32))) )
))
(declare-fun lt!248608 () SeekEntryResult!4984)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545204 (= res!339282 (or (= lt!248608 (MissingZero!4984 i!1153)) (= lt!248608 (MissingVacant!4984 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34401 0))(
  ( (array!34402 (arr!16529 (Array (_ BitVec 32) (_ BitVec 64))) (size!16894 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34401)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34401 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!545204 (= lt!248608 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545205 () Bool)

(declare-fun res!339273 () Bool)

(assert (=> b!545205 (=> (not res!339273) (not e!315129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545205 (= res!339273 (validKeyInArray!0 k0!1998))))

(declare-fun b!545207 () Bool)

(declare-fun e!315124 () Bool)

(assert (=> b!545207 (= e!315125 e!315124)))

(declare-fun res!339281 () Bool)

(assert (=> b!545207 (=> (not res!339281) (not e!315124))))

(declare-fun lt!248609 () SeekEntryResult!4984)

(declare-fun lt!248606 () SeekEntryResult!4984)

(assert (=> b!545207 (= res!339281 (= lt!248609 lt!248606))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545207 (= lt!248606 (Intermediate!4984 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34401 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!545207 (= lt!248609 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545208 () Bool)

(declare-fun res!339280 () Bool)

(assert (=> b!545208 (=> (not res!339280) (not e!315129))))

(assert (=> b!545208 (= res!339280 (and (= (size!16894 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16894 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16894 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545209 () Bool)

(declare-fun res!339276 () Bool)

(assert (=> b!545209 (=> (not res!339276) (not e!315125))))

(declare-datatypes ((List!10687 0))(
  ( (Nil!10684) (Cons!10683 (h!11647 (_ BitVec 64)) (t!16906 List!10687)) )
))
(declare-fun arrayNoDuplicates!0 (array!34401 (_ BitVec 32) List!10687) Bool)

(assert (=> b!545209 (= res!339276 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10684))))

(declare-fun b!545210 () Bool)

(declare-fun res!339284 () Bool)

(assert (=> b!545210 (=> (not res!339284) (not e!315129))))

(declare-fun arrayContainsKey!0 (array!34401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545210 (= res!339284 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545211 () Bool)

(declare-fun res!339274 () Bool)

(assert (=> b!545211 (=> (not res!339274) (not e!315129))))

(assert (=> b!545211 (= res!339274 (validKeyInArray!0 (select (arr!16529 a!3154) j!147)))))

(declare-fun res!339283 () Bool)

(assert (=> start!49578 (=> (not res!339283) (not e!315129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49578 (= res!339283 (validMask!0 mask!3216))))

(assert (=> start!49578 e!315129))

(assert (=> start!49578 true))

(declare-fun array_inv!12412 (array!34401) Bool)

(assert (=> start!49578 (array_inv!12412 a!3154)))

(declare-fun b!545206 () Bool)

(declare-fun res!339278 () Bool)

(assert (=> b!545206 (=> (not res!339278) (not e!315125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34401 (_ BitVec 32)) Bool)

(assert (=> b!545206 (= res!339278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545212 () Bool)

(declare-fun res!339279 () Bool)

(assert (=> b!545212 (=> (not res!339279) (not e!315125))))

(assert (=> b!545212 (= res!339279 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16894 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16894 a!3154)) (= (select (arr!16529 a!3154) resIndex!32) (select (arr!16529 a!3154) j!147))))))

(declare-fun lt!248611 () SeekEntryResult!4984)

(declare-fun lt!248607 () SeekEntryResult!4984)

(declare-fun b!545213 () Bool)

(declare-fun e!315126 () Bool)

(assert (=> b!545213 (= e!315126 (and (= lt!248607 lt!248606) (not (= lt!248611 lt!248607))))))

(declare-fun lt!248610 () (_ BitVec 32))

(assert (=> b!545213 (= lt!248607 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248610 (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545214 () Bool)

(declare-fun e!315127 () Bool)

(assert (=> b!545214 (= e!315127 e!315126)))

(declare-fun res!339275 () Bool)

(assert (=> b!545214 (=> (not res!339275) (not e!315126))))

(assert (=> b!545214 (= res!339275 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248610 #b00000000000000000000000000000000) (bvslt lt!248610 (size!16894 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545214 (= lt!248610 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545215 () Bool)

(assert (=> b!545215 (= e!315124 e!315127)))

(declare-fun res!339277 () Bool)

(assert (=> b!545215 (=> (not res!339277) (not e!315127))))

(assert (=> b!545215 (= res!339277 (and (= lt!248611 lt!248609) (not (= (select (arr!16529 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16529 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16529 a!3154) index!1177) (select (arr!16529 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545215 (= lt!248611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49578 res!339283) b!545208))

(assert (= (and b!545208 res!339280) b!545211))

(assert (= (and b!545211 res!339274) b!545205))

(assert (= (and b!545205 res!339273) b!545210))

(assert (= (and b!545210 res!339284) b!545204))

(assert (= (and b!545204 res!339282) b!545206))

(assert (= (and b!545206 res!339278) b!545209))

(assert (= (and b!545209 res!339276) b!545212))

(assert (= (and b!545212 res!339279) b!545207))

(assert (= (and b!545207 res!339281) b!545215))

(assert (= (and b!545215 res!339277) b!545214))

(assert (= (and b!545214 res!339275) b!545213))

(declare-fun m!522289 () Bool)

(assert (=> b!545211 m!522289))

(assert (=> b!545211 m!522289))

(declare-fun m!522291 () Bool)

(assert (=> b!545211 m!522291))

(declare-fun m!522293 () Bool)

(assert (=> b!545206 m!522293))

(declare-fun m!522295 () Bool)

(assert (=> b!545214 m!522295))

(declare-fun m!522297 () Bool)

(assert (=> b!545204 m!522297))

(assert (=> b!545207 m!522289))

(assert (=> b!545207 m!522289))

(declare-fun m!522299 () Bool)

(assert (=> b!545207 m!522299))

(declare-fun m!522301 () Bool)

(assert (=> b!545212 m!522301))

(assert (=> b!545212 m!522289))

(declare-fun m!522303 () Bool)

(assert (=> b!545210 m!522303))

(assert (=> b!545213 m!522289))

(assert (=> b!545213 m!522289))

(declare-fun m!522305 () Bool)

(assert (=> b!545213 m!522305))

(declare-fun m!522307 () Bool)

(assert (=> start!49578 m!522307))

(declare-fun m!522309 () Bool)

(assert (=> start!49578 m!522309))

(declare-fun m!522311 () Bool)

(assert (=> b!545215 m!522311))

(assert (=> b!545215 m!522289))

(assert (=> b!545215 m!522289))

(declare-fun m!522313 () Bool)

(assert (=> b!545215 m!522313))

(assert (=> b!545215 m!522313))

(assert (=> b!545215 m!522289))

(declare-fun m!522315 () Bool)

(assert (=> b!545215 m!522315))

(declare-fun m!522317 () Bool)

(assert (=> b!545205 m!522317))

(declare-fun m!522319 () Bool)

(assert (=> b!545209 m!522319))

(check-sat (not b!545215) (not b!545205) (not b!545207) (not b!545211) (not b!545210) (not b!545214) (not b!545213) (not start!49578) (not b!545209) (not b!545206) (not b!545204))
(check-sat)
