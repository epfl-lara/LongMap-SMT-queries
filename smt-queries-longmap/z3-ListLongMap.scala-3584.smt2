; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49336 () Bool)

(assert start!49336)

(declare-fun b!542918 () Bool)

(declare-fun res!337368 () Bool)

(declare-fun e!314189 () Bool)

(assert (=> b!542918 (=> (not res!337368) (not e!314189))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34292 0))(
  ( (array!34293 (arr!16477 (Array (_ BitVec 32) (_ BitVec 64))) (size!16841 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34292)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542918 (= res!337368 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16841 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16841 a!3154)) (= (select (arr!16477 a!3154) resIndex!32) (select (arr!16477 a!3154) j!147))))))

(declare-fun b!542919 () Bool)

(declare-fun e!314190 () Bool)

(assert (=> b!542919 (= e!314189 e!314190)))

(declare-fun res!337364 () Bool)

(assert (=> b!542919 (=> (not res!337364) (not e!314190))))

(declare-datatypes ((SeekEntryResult!4891 0))(
  ( (MissingZero!4891 (index!21788 (_ BitVec 32))) (Found!4891 (index!21789 (_ BitVec 32))) (Intermediate!4891 (undefined!5703 Bool) (index!21790 (_ BitVec 32)) (x!50853 (_ BitVec 32))) (Undefined!4891) (MissingVacant!4891 (index!21791 (_ BitVec 32))) )
))
(declare-fun lt!248099 () SeekEntryResult!4891)

(assert (=> b!542919 (= res!337364 (= lt!248099 (Intermediate!4891 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34292 (_ BitVec 32)) SeekEntryResult!4891)

(assert (=> b!542919 (= lt!248099 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16477 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!337365 () Bool)

(declare-fun e!314188 () Bool)

(assert (=> start!49336 (=> (not res!337365) (not e!314188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49336 (= res!337365 (validMask!0 mask!3216))))

(assert (=> start!49336 e!314188))

(assert (=> start!49336 true))

(declare-fun array_inv!12336 (array!34292) Bool)

(assert (=> start!49336 (array_inv!12336 a!3154)))

(declare-fun b!542920 () Bool)

(declare-fun res!337370 () Bool)

(assert (=> b!542920 (=> (not res!337370) (not e!314188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542920 (= res!337370 (validKeyInArray!0 (select (arr!16477 a!3154) j!147)))))

(declare-fun b!542921 () Bool)

(declare-fun res!337374 () Bool)

(assert (=> b!542921 (=> (not res!337374) (not e!314188))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542921 (= res!337374 (and (= (size!16841 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16841 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16841 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542922 () Bool)

(declare-fun res!337371 () Bool)

(assert (=> b!542922 (=> (not res!337371) (not e!314190))))

(assert (=> b!542922 (= res!337371 (and (not (= (select (arr!16477 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16477 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16477 a!3154) index!1177) (select (arr!16477 a!3154) j!147)))))))

(declare-fun b!542923 () Bool)

(assert (=> b!542923 (= e!314188 e!314189)))

(declare-fun res!337367 () Bool)

(assert (=> b!542923 (=> (not res!337367) (not e!314189))))

(declare-fun lt!248100 () SeekEntryResult!4891)

(assert (=> b!542923 (= res!337367 (or (= lt!248100 (MissingZero!4891 i!1153)) (= lt!248100 (MissingVacant!4891 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34292 (_ BitVec 32)) SeekEntryResult!4891)

(assert (=> b!542923 (= lt!248100 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542924 () Bool)

(declare-fun res!337373 () Bool)

(assert (=> b!542924 (=> (not res!337373) (not e!314189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34292 (_ BitVec 32)) Bool)

(assert (=> b!542924 (= res!337373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542925 () Bool)

(declare-fun res!337366 () Bool)

(assert (=> b!542925 (=> (not res!337366) (not e!314188))))

(declare-fun arrayContainsKey!0 (array!34292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542925 (= res!337366 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542926 () Bool)

(declare-fun res!337369 () Bool)

(assert (=> b!542926 (=> (not res!337369) (not e!314189))))

(declare-datatypes ((List!10503 0))(
  ( (Nil!10500) (Cons!10499 (h!11457 (_ BitVec 64)) (t!16723 List!10503)) )
))
(declare-fun arrayNoDuplicates!0 (array!34292 (_ BitVec 32) List!10503) Bool)

(assert (=> b!542926 (= res!337369 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10500))))

(declare-fun b!542927 () Bool)

(declare-fun res!337372 () Bool)

(assert (=> b!542927 (=> (not res!337372) (not e!314188))))

(assert (=> b!542927 (= res!337372 (validKeyInArray!0 k0!1998))))

(declare-fun b!542928 () Bool)

(declare-fun res!337375 () Bool)

(assert (=> b!542928 (=> (not res!337375) (not e!314190))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542928 (= res!337375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16477 a!3154) j!147) mask!3216) (select (arr!16477 a!3154) j!147) a!3154 mask!3216) lt!248099))))

(declare-fun b!542929 () Bool)

(assert (=> b!542929 (= e!314190 false)))

(declare-fun lt!248101 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542929 (= lt!248101 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!49336 res!337365) b!542921))

(assert (= (and b!542921 res!337374) b!542920))

(assert (= (and b!542920 res!337370) b!542927))

(assert (= (and b!542927 res!337372) b!542925))

(assert (= (and b!542925 res!337366) b!542923))

(assert (= (and b!542923 res!337367) b!542924))

(assert (= (and b!542924 res!337373) b!542926))

(assert (= (and b!542926 res!337369) b!542918))

(assert (= (and b!542918 res!337368) b!542919))

(assert (= (and b!542919 res!337364) b!542928))

(assert (= (and b!542928 res!337375) b!542922))

(assert (= (and b!542922 res!337371) b!542929))

(declare-fun m!521251 () Bool)

(assert (=> b!542925 m!521251))

(declare-fun m!521253 () Bool)

(assert (=> b!542929 m!521253))

(declare-fun m!521255 () Bool)

(assert (=> b!542924 m!521255))

(declare-fun m!521257 () Bool)

(assert (=> b!542928 m!521257))

(assert (=> b!542928 m!521257))

(declare-fun m!521259 () Bool)

(assert (=> b!542928 m!521259))

(assert (=> b!542928 m!521259))

(assert (=> b!542928 m!521257))

(declare-fun m!521261 () Bool)

(assert (=> b!542928 m!521261))

(declare-fun m!521263 () Bool)

(assert (=> b!542918 m!521263))

(assert (=> b!542918 m!521257))

(declare-fun m!521265 () Bool)

(assert (=> b!542926 m!521265))

(declare-fun m!521267 () Bool)

(assert (=> b!542927 m!521267))

(assert (=> b!542920 m!521257))

(assert (=> b!542920 m!521257))

(declare-fun m!521269 () Bool)

(assert (=> b!542920 m!521269))

(declare-fun m!521271 () Bool)

(assert (=> b!542923 m!521271))

(declare-fun m!521273 () Bool)

(assert (=> start!49336 m!521273))

(declare-fun m!521275 () Bool)

(assert (=> start!49336 m!521275))

(declare-fun m!521277 () Bool)

(assert (=> b!542922 m!521277))

(assert (=> b!542922 m!521257))

(assert (=> b!542919 m!521257))

(assert (=> b!542919 m!521257))

(declare-fun m!521279 () Bool)

(assert (=> b!542919 m!521279))

(check-sat (not b!542926) (not b!542928) (not b!542923) (not b!542924) (not b!542927) (not b!542919) (not b!542929) (not start!49336) (not b!542920) (not b!542925))
(check-sat)
