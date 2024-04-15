; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48762 () Bool)

(assert start!48762)

(declare-fun b!536302 () Bool)

(declare-fun res!331653 () Bool)

(declare-fun e!311295 () Bool)

(assert (=> b!536302 (=> (not res!331653) (not e!311295))))

(declare-datatypes ((array!33984 0))(
  ( (array!33985 (arr!16331 (Array (_ BitVec 32) (_ BitVec 64))) (size!16696 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33984)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536302 (= res!331653 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536303 () Bool)

(declare-fun e!311291 () Bool)

(declare-fun e!311292 () Bool)

(assert (=> b!536303 (= e!311291 e!311292)))

(declare-fun res!331649 () Bool)

(assert (=> b!536303 (=> (not res!331649) (not e!311292))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245905 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536303 (= res!331649 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245905 #b00000000000000000000000000000000) (bvslt lt!245905 (size!16696 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536303 (= lt!245905 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536304 () Bool)

(declare-fun res!331658 () Bool)

(assert (=> b!536304 (=> (not res!331658) (not e!311295))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536304 (= res!331658 (and (= (size!16696 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16696 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16696 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536305 () Bool)

(declare-fun res!331651 () Bool)

(assert (=> b!536305 (=> (not res!331651) (not e!311291))))

(assert (=> b!536305 (= res!331651 (and (not (= (select (arr!16331 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16331 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16331 a!3154) index!1177) (select (arr!16331 a!3154) j!147)))))))

(declare-fun b!536306 () Bool)

(declare-fun e!311293 () Bool)

(assert (=> b!536306 (= e!311293 e!311291)))

(declare-fun res!331652 () Bool)

(assert (=> b!536306 (=> (not res!331652) (not e!311291))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4786 0))(
  ( (MissingZero!4786 (index!21368 (_ BitVec 32))) (Found!4786 (index!21369 (_ BitVec 32))) (Intermediate!4786 (undefined!5598 Bool) (index!21370 (_ BitVec 32)) (x!50316 (_ BitVec 32))) (Undefined!4786) (MissingVacant!4786 (index!21371 (_ BitVec 32))) )
))
(declare-fun lt!245903 () SeekEntryResult!4786)

(assert (=> b!536306 (= res!331652 (= lt!245903 (Intermediate!4786 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33984 (_ BitVec 32)) SeekEntryResult!4786)

(assert (=> b!536306 (= lt!245903 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16331 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536307 () Bool)

(declare-fun res!331657 () Bool)

(assert (=> b!536307 (=> (not res!331657) (not e!311291))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536307 (= res!331657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16331 a!3154) j!147) mask!3216) (select (arr!16331 a!3154) j!147) a!3154 mask!3216) lt!245903))))

(declare-fun b!536308 () Bool)

(declare-fun res!331656 () Bool)

(assert (=> b!536308 (=> (not res!331656) (not e!311293))))

(assert (=> b!536308 (= res!331656 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16696 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16696 a!3154)) (= (select (arr!16331 a!3154) resIndex!32) (select (arr!16331 a!3154) j!147))))))

(declare-fun b!536309 () Bool)

(declare-fun res!331655 () Bool)

(assert (=> b!536309 (=> (not res!331655) (not e!311293))))

(declare-datatypes ((List!10489 0))(
  ( (Nil!10486) (Cons!10485 (h!11428 (_ BitVec 64)) (t!16708 List!10489)) )
))
(declare-fun arrayNoDuplicates!0 (array!33984 (_ BitVec 32) List!10489) Bool)

(assert (=> b!536309 (= res!331655 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10486))))

(declare-fun b!536310 () Bool)

(assert (=> b!536310 (= e!311292 false)))

(declare-fun lt!245904 () SeekEntryResult!4786)

(assert (=> b!536310 (= lt!245904 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245905 (select (arr!16331 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331660 () Bool)

(assert (=> start!48762 (=> (not res!331660) (not e!311295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48762 (= res!331660 (validMask!0 mask!3216))))

(assert (=> start!48762 e!311295))

(assert (=> start!48762 true))

(declare-fun array_inv!12214 (array!33984) Bool)

(assert (=> start!48762 (array_inv!12214 a!3154)))

(declare-fun b!536311 () Bool)

(declare-fun res!331654 () Bool)

(assert (=> b!536311 (=> (not res!331654) (not e!311295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536311 (= res!331654 (validKeyInArray!0 (select (arr!16331 a!3154) j!147)))))

(declare-fun b!536312 () Bool)

(declare-fun res!331661 () Bool)

(assert (=> b!536312 (=> (not res!331661) (not e!311295))))

(assert (=> b!536312 (= res!331661 (validKeyInArray!0 k0!1998))))

(declare-fun b!536313 () Bool)

(declare-fun res!331659 () Bool)

(assert (=> b!536313 (=> (not res!331659) (not e!311293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33984 (_ BitVec 32)) Bool)

(assert (=> b!536313 (= res!331659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536314 () Bool)

(assert (=> b!536314 (= e!311295 e!311293)))

(declare-fun res!331650 () Bool)

(assert (=> b!536314 (=> (not res!331650) (not e!311293))))

(declare-fun lt!245902 () SeekEntryResult!4786)

(assert (=> b!536314 (= res!331650 (or (= lt!245902 (MissingZero!4786 i!1153)) (= lt!245902 (MissingVacant!4786 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33984 (_ BitVec 32)) SeekEntryResult!4786)

(assert (=> b!536314 (= lt!245902 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48762 res!331660) b!536304))

(assert (= (and b!536304 res!331658) b!536311))

(assert (= (and b!536311 res!331654) b!536312))

(assert (= (and b!536312 res!331661) b!536302))

(assert (= (and b!536302 res!331653) b!536314))

(assert (= (and b!536314 res!331650) b!536313))

(assert (= (and b!536313 res!331659) b!536309))

(assert (= (and b!536309 res!331655) b!536308))

(assert (= (and b!536308 res!331656) b!536306))

(assert (= (and b!536306 res!331652) b!536307))

(assert (= (and b!536307 res!331657) b!536305))

(assert (= (and b!536305 res!331651) b!536303))

(assert (= (and b!536303 res!331649) b!536310))

(declare-fun m!515209 () Bool)

(assert (=> b!536307 m!515209))

(assert (=> b!536307 m!515209))

(declare-fun m!515211 () Bool)

(assert (=> b!536307 m!515211))

(assert (=> b!536307 m!515211))

(assert (=> b!536307 m!515209))

(declare-fun m!515213 () Bool)

(assert (=> b!536307 m!515213))

(declare-fun m!515215 () Bool)

(assert (=> b!536305 m!515215))

(assert (=> b!536305 m!515209))

(declare-fun m!515217 () Bool)

(assert (=> start!48762 m!515217))

(declare-fun m!515219 () Bool)

(assert (=> start!48762 m!515219))

(declare-fun m!515221 () Bool)

(assert (=> b!536303 m!515221))

(declare-fun m!515223 () Bool)

(assert (=> b!536313 m!515223))

(declare-fun m!515225 () Bool)

(assert (=> b!536308 m!515225))

(assert (=> b!536308 m!515209))

(declare-fun m!515227 () Bool)

(assert (=> b!536302 m!515227))

(declare-fun m!515229 () Bool)

(assert (=> b!536312 m!515229))

(assert (=> b!536310 m!515209))

(assert (=> b!536310 m!515209))

(declare-fun m!515231 () Bool)

(assert (=> b!536310 m!515231))

(assert (=> b!536306 m!515209))

(assert (=> b!536306 m!515209))

(declare-fun m!515233 () Bool)

(assert (=> b!536306 m!515233))

(declare-fun m!515235 () Bool)

(assert (=> b!536309 m!515235))

(assert (=> b!536311 m!515209))

(assert (=> b!536311 m!515209))

(declare-fun m!515237 () Bool)

(assert (=> b!536311 m!515237))

(declare-fun m!515239 () Bool)

(assert (=> b!536314 m!515239))

(check-sat (not start!48762) (not b!536314) (not b!536302) (not b!536307) (not b!536313) (not b!536310) (not b!536312) (not b!536309) (not b!536311) (not b!536306) (not b!536303))
(check-sat)
