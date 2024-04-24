; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49060 () Bool)

(assert start!49060)

(declare-fun b!540286 () Bool)

(declare-fun res!335228 () Bool)

(declare-fun e!313090 () Bool)

(assert (=> b!540286 (=> (not res!335228) (not e!313090))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540286 (= res!335228 (validKeyInArray!0 k0!1998))))

(declare-fun b!540287 () Bool)

(declare-fun res!335229 () Bool)

(declare-fun e!313091 () Bool)

(assert (=> b!540287 (=> (not res!335229) (not e!313091))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34169 0))(
  ( (array!34170 (arr!16420 (Array (_ BitVec 32) (_ BitVec 64))) (size!16784 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34169)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4834 0))(
  ( (MissingZero!4834 (index!21560 (_ BitVec 32))) (Found!4834 (index!21561 (_ BitVec 32))) (Intermediate!4834 (undefined!5646 Bool) (index!21562 (_ BitVec 32)) (x!50626 (_ BitVec 32))) (Undefined!4834) (MissingVacant!4834 (index!21563 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34169 (_ BitVec 32)) SeekEntryResult!4834)

(assert (=> b!540287 (= res!335229 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16420 a!3154) j!147) a!3154 mask!3216) (Intermediate!4834 false resIndex!32 resX!32)))))

(declare-fun b!540289 () Bool)

(assert (=> b!540289 (= e!313091 false)))

(declare-fun lt!247416 () SeekEntryResult!4834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540289 (= lt!247416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16420 a!3154) j!147) mask!3216) (select (arr!16420 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540290 () Bool)

(declare-fun res!335232 () Bool)

(assert (=> b!540290 (=> (not res!335232) (not e!313091))))

(declare-datatypes ((List!10446 0))(
  ( (Nil!10443) (Cons!10442 (h!11391 (_ BitVec 64)) (t!16666 List!10446)) )
))
(declare-fun arrayNoDuplicates!0 (array!34169 (_ BitVec 32) List!10446) Bool)

(assert (=> b!540290 (= res!335232 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10443))))

(declare-fun b!540291 () Bool)

(declare-fun res!335231 () Bool)

(assert (=> b!540291 (=> (not res!335231) (not e!313090))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540291 (= res!335231 (and (= (size!16784 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16784 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16784 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540292 () Bool)

(declare-fun res!335234 () Bool)

(assert (=> b!540292 (=> (not res!335234) (not e!313090))))

(assert (=> b!540292 (= res!335234 (validKeyInArray!0 (select (arr!16420 a!3154) j!147)))))

(declare-fun b!540293 () Bool)

(declare-fun res!335236 () Bool)

(assert (=> b!540293 (=> (not res!335236) (not e!313091))))

(assert (=> b!540293 (= res!335236 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16784 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16784 a!3154)) (= (select (arr!16420 a!3154) resIndex!32) (select (arr!16420 a!3154) j!147))))))

(declare-fun b!540288 () Bool)

(declare-fun res!335230 () Bool)

(assert (=> b!540288 (=> (not res!335230) (not e!313090))))

(declare-fun arrayContainsKey!0 (array!34169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540288 (= res!335230 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!335233 () Bool)

(assert (=> start!49060 (=> (not res!335233) (not e!313090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49060 (= res!335233 (validMask!0 mask!3216))))

(assert (=> start!49060 e!313090))

(assert (=> start!49060 true))

(declare-fun array_inv!12279 (array!34169) Bool)

(assert (=> start!49060 (array_inv!12279 a!3154)))

(declare-fun b!540294 () Bool)

(assert (=> b!540294 (= e!313090 e!313091)))

(declare-fun res!335235 () Bool)

(assert (=> b!540294 (=> (not res!335235) (not e!313091))))

(declare-fun lt!247417 () SeekEntryResult!4834)

(assert (=> b!540294 (= res!335235 (or (= lt!247417 (MissingZero!4834 i!1153)) (= lt!247417 (MissingVacant!4834 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34169 (_ BitVec 32)) SeekEntryResult!4834)

(assert (=> b!540294 (= lt!247417 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540295 () Bool)

(declare-fun res!335227 () Bool)

(assert (=> b!540295 (=> (not res!335227) (not e!313091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34169 (_ BitVec 32)) Bool)

(assert (=> b!540295 (= res!335227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49060 res!335233) b!540291))

(assert (= (and b!540291 res!335231) b!540292))

(assert (= (and b!540292 res!335234) b!540286))

(assert (= (and b!540286 res!335228) b!540288))

(assert (= (and b!540288 res!335230) b!540294))

(assert (= (and b!540294 res!335235) b!540295))

(assert (= (and b!540295 res!335227) b!540290))

(assert (= (and b!540290 res!335232) b!540293))

(assert (= (and b!540293 res!335236) b!540287))

(assert (= (and b!540287 res!335229) b!540289))

(declare-fun m!519253 () Bool)

(assert (=> b!540293 m!519253))

(declare-fun m!519255 () Bool)

(assert (=> b!540293 m!519255))

(assert (=> b!540289 m!519255))

(assert (=> b!540289 m!519255))

(declare-fun m!519257 () Bool)

(assert (=> b!540289 m!519257))

(assert (=> b!540289 m!519257))

(assert (=> b!540289 m!519255))

(declare-fun m!519259 () Bool)

(assert (=> b!540289 m!519259))

(declare-fun m!519261 () Bool)

(assert (=> b!540295 m!519261))

(declare-fun m!519263 () Bool)

(assert (=> b!540294 m!519263))

(assert (=> b!540292 m!519255))

(assert (=> b!540292 m!519255))

(declare-fun m!519265 () Bool)

(assert (=> b!540292 m!519265))

(declare-fun m!519267 () Bool)

(assert (=> b!540288 m!519267))

(assert (=> b!540287 m!519255))

(assert (=> b!540287 m!519255))

(declare-fun m!519269 () Bool)

(assert (=> b!540287 m!519269))

(declare-fun m!519271 () Bool)

(assert (=> b!540286 m!519271))

(declare-fun m!519273 () Bool)

(assert (=> b!540290 m!519273))

(declare-fun m!519275 () Bool)

(assert (=> start!49060 m!519275))

(declare-fun m!519277 () Bool)

(assert (=> start!49060 m!519277))

(check-sat (not b!540288) (not b!540286) (not b!540290) (not b!540292) (not b!540294) (not b!540295) (not b!540289) (not b!540287) (not start!49060))
(check-sat)
