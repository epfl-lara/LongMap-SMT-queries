; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48422 () Bool)

(assert start!48422)

(declare-fun b!532116 () Bool)

(declare-fun e!309843 () Bool)

(declare-fun e!309842 () Bool)

(assert (=> b!532116 (= e!309843 e!309842)))

(declare-fun res!327606 () Bool)

(assert (=> b!532116 (=> (not res!327606) (not e!309842))))

(declare-datatypes ((SeekEntryResult!4665 0))(
  ( (MissingZero!4665 (index!20884 (_ BitVec 32))) (Found!4665 (index!20885 (_ BitVec 32))) (Intermediate!4665 (undefined!5477 Bool) (index!20886 (_ BitVec 32)) (x!49855 (_ BitVec 32))) (Undefined!4665) (MissingVacant!4665 (index!20887 (_ BitVec 32))) )
))
(declare-fun lt!245125 () SeekEntryResult!4665)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532116 (= res!327606 (or (= lt!245125 (MissingZero!4665 i!1153)) (= lt!245125 (MissingVacant!4665 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33730 0))(
  ( (array!33731 (arr!16207 (Array (_ BitVec 32) (_ BitVec 64))) (size!16571 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33730)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33730 (_ BitVec 32)) SeekEntryResult!4665)

(assert (=> b!532116 (= lt!245125 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532117 () Bool)

(declare-fun res!327612 () Bool)

(assert (=> b!532117 (=> (not res!327612) (not e!309843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532117 (= res!327612 (validKeyInArray!0 k0!1998))))

(declare-fun b!532118 () Bool)

(declare-fun res!327608 () Bool)

(assert (=> b!532118 (=> (not res!327608) (not e!309842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33730 (_ BitVec 32)) Bool)

(assert (=> b!532118 (= res!327608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532119 () Bool)

(declare-fun res!327610 () Bool)

(assert (=> b!532119 (=> (not res!327610) (not e!309843))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!532119 (= res!327610 (and (= (size!16571 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16571 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16571 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532120 () Bool)

(declare-fun res!327614 () Bool)

(assert (=> b!532120 (=> (not res!327614) (not e!309842))))

(declare-datatypes ((List!10326 0))(
  ( (Nil!10323) (Cons!10322 (h!11262 (_ BitVec 64)) (t!16554 List!10326)) )
))
(declare-fun arrayNoDuplicates!0 (array!33730 (_ BitVec 32) List!10326) Bool)

(assert (=> b!532120 (= res!327614 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10323))))

(declare-fun b!532121 () Bool)

(declare-fun res!327609 () Bool)

(assert (=> b!532121 (=> (not res!327609) (not e!309843))))

(assert (=> b!532121 (= res!327609 (validKeyInArray!0 (select (arr!16207 a!3154) j!147)))))

(declare-fun b!532122 () Bool)

(declare-fun res!327607 () Bool)

(assert (=> b!532122 (=> (not res!327607) (not e!309842))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33730 (_ BitVec 32)) SeekEntryResult!4665)

(assert (=> b!532122 (= res!327607 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16207 a!3154) j!147) a!3154 mask!3216) (Intermediate!4665 false resIndex!32 resX!32)))))

(declare-fun res!327605 () Bool)

(assert (=> start!48422 (=> (not res!327605) (not e!309843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48422 (= res!327605 (validMask!0 mask!3216))))

(assert (=> start!48422 e!309843))

(assert (=> start!48422 true))

(declare-fun array_inv!12003 (array!33730) Bool)

(assert (=> start!48422 (array_inv!12003 a!3154)))

(declare-fun b!532115 () Bool)

(declare-fun res!327611 () Bool)

(assert (=> b!532115 (=> (not res!327611) (not e!309842))))

(assert (=> b!532115 (= res!327611 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16571 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16571 a!3154)) (= (select (arr!16207 a!3154) resIndex!32) (select (arr!16207 a!3154) j!147))))))

(declare-fun b!532123 () Bool)

(declare-fun res!327613 () Bool)

(assert (=> b!532123 (=> (not res!327613) (not e!309843))))

(declare-fun arrayContainsKey!0 (array!33730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532123 (= res!327613 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532124 () Bool)

(assert (=> b!532124 (= e!309842 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsgt mask!3216 #b00111111111111111111111111111111)))))

(assert (= (and start!48422 res!327605) b!532119))

(assert (= (and b!532119 res!327610) b!532121))

(assert (= (and b!532121 res!327609) b!532117))

(assert (= (and b!532117 res!327612) b!532123))

(assert (= (and b!532123 res!327613) b!532116))

(assert (= (and b!532116 res!327606) b!532118))

(assert (= (and b!532118 res!327608) b!532120))

(assert (= (and b!532120 res!327614) b!532115))

(assert (= (and b!532115 res!327611) b!532122))

(assert (= (and b!532122 res!327607) b!532124))

(declare-fun m!512401 () Bool)

(assert (=> b!532117 m!512401))

(declare-fun m!512403 () Bool)

(assert (=> b!532120 m!512403))

(declare-fun m!512405 () Bool)

(assert (=> b!532115 m!512405))

(declare-fun m!512407 () Bool)

(assert (=> b!532115 m!512407))

(declare-fun m!512409 () Bool)

(assert (=> b!532116 m!512409))

(declare-fun m!512411 () Bool)

(assert (=> b!532123 m!512411))

(declare-fun m!512413 () Bool)

(assert (=> start!48422 m!512413))

(declare-fun m!512415 () Bool)

(assert (=> start!48422 m!512415))

(declare-fun m!512417 () Bool)

(assert (=> b!532118 m!512417))

(assert (=> b!532121 m!512407))

(assert (=> b!532121 m!512407))

(declare-fun m!512419 () Bool)

(assert (=> b!532121 m!512419))

(assert (=> b!532122 m!512407))

(assert (=> b!532122 m!512407))

(declare-fun m!512421 () Bool)

(assert (=> b!532122 m!512421))

(check-sat (not b!532120) (not start!48422) (not b!532117) (not b!532118) (not b!532116) (not b!532122) (not b!532123) (not b!532121))
(check-sat)
(get-model)

(declare-fun b!532163 () Bool)

(declare-fun e!309860 () Bool)

(declare-fun e!309861 () Bool)

(assert (=> b!532163 (= e!309860 e!309861)))

(declare-fun lt!245135 () (_ BitVec 64))

(assert (=> b!532163 (= lt!245135 (select (arr!16207 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16836 0))(
  ( (Unit!16837) )
))
(declare-fun lt!245136 () Unit!16836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33730 (_ BitVec 64) (_ BitVec 32)) Unit!16836)

(assert (=> b!532163 (= lt!245136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245135 #b00000000000000000000000000000000))))

(assert (=> b!532163 (arrayContainsKey!0 a!3154 lt!245135 #b00000000000000000000000000000000)))

(declare-fun lt!245137 () Unit!16836)

(assert (=> b!532163 (= lt!245137 lt!245136)))

(declare-fun res!327649 () Bool)

(assert (=> b!532163 (= res!327649 (= (seekEntryOrOpen!0 (select (arr!16207 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4665 #b00000000000000000000000000000000)))))

(assert (=> b!532163 (=> (not res!327649) (not e!309861))))

(declare-fun b!532164 () Bool)

(declare-fun call!31964 () Bool)

(assert (=> b!532164 (= e!309861 call!31964)))

(declare-fun bm!31961 () Bool)

(assert (=> bm!31961 (= call!31964 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81335 () Bool)

(declare-fun res!327650 () Bool)

(declare-fun e!309859 () Bool)

(assert (=> d!81335 (=> res!327650 e!309859)))

(assert (=> d!81335 (= res!327650 (bvsge #b00000000000000000000000000000000 (size!16571 a!3154)))))

(assert (=> d!81335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309859)))

(declare-fun b!532165 () Bool)

(assert (=> b!532165 (= e!309860 call!31964)))

(declare-fun b!532166 () Bool)

(assert (=> b!532166 (= e!309859 e!309860)))

(declare-fun c!62567 () Bool)

(assert (=> b!532166 (= c!62567 (validKeyInArray!0 (select (arr!16207 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81335 (not res!327650)) b!532166))

(assert (= (and b!532166 c!62567) b!532163))

(assert (= (and b!532166 (not c!62567)) b!532165))

(assert (= (and b!532163 res!327649) b!532164))

(assert (= (or b!532164 b!532165) bm!31961))

(declare-fun m!512445 () Bool)

(assert (=> b!532163 m!512445))

(declare-fun m!512447 () Bool)

(assert (=> b!532163 m!512447))

(declare-fun m!512449 () Bool)

(assert (=> b!532163 m!512449))

(assert (=> b!532163 m!512445))

(declare-fun m!512451 () Bool)

(assert (=> b!532163 m!512451))

(declare-fun m!512453 () Bool)

(assert (=> bm!31961 m!512453))

(assert (=> b!532166 m!512445))

(assert (=> b!532166 m!512445))

(declare-fun m!512455 () Bool)

(assert (=> b!532166 m!512455))

(assert (=> b!532118 d!81335))

(declare-fun d!81337 () Bool)

(declare-fun res!327655 () Bool)

(declare-fun e!309866 () Bool)

(assert (=> d!81337 (=> res!327655 e!309866)))

(assert (=> d!81337 (= res!327655 (= (select (arr!16207 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81337 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309866)))

(declare-fun b!532171 () Bool)

(declare-fun e!309867 () Bool)

(assert (=> b!532171 (= e!309866 e!309867)))

(declare-fun res!327656 () Bool)

(assert (=> b!532171 (=> (not res!327656) (not e!309867))))

(assert (=> b!532171 (= res!327656 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16571 a!3154)))))

(declare-fun b!532172 () Bool)

(assert (=> b!532172 (= e!309867 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81337 (not res!327655)) b!532171))

(assert (= (and b!532171 res!327656) b!532172))

(assert (=> d!81337 m!512445))

(declare-fun m!512457 () Bool)

(assert (=> b!532172 m!512457))

(assert (=> b!532123 d!81337))

(declare-fun d!81343 () Bool)

(assert (=> d!81343 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532117 d!81343))

(declare-fun b!532191 () Bool)

(declare-fun e!309882 () Bool)

(declare-fun contains!2787 (List!10326 (_ BitVec 64)) Bool)

(assert (=> b!532191 (= e!309882 (contains!2787 Nil!10323 (select (arr!16207 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81345 () Bool)

(declare-fun res!327667 () Bool)

(declare-fun e!309883 () Bool)

(assert (=> d!81345 (=> res!327667 e!309883)))

(assert (=> d!81345 (= res!327667 (bvsge #b00000000000000000000000000000000 (size!16571 a!3154)))))

(assert (=> d!81345 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10323) e!309883)))

(declare-fun b!532192 () Bool)

(declare-fun e!309885 () Bool)

(declare-fun e!309884 () Bool)

(assert (=> b!532192 (= e!309885 e!309884)))

(declare-fun c!62572 () Bool)

(assert (=> b!532192 (= c!62572 (validKeyInArray!0 (select (arr!16207 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31966 () Bool)

(declare-fun call!31969 () Bool)

(assert (=> bm!31966 (= call!31969 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62572 (Cons!10322 (select (arr!16207 a!3154) #b00000000000000000000000000000000) Nil!10323) Nil!10323)))))

(declare-fun b!532193 () Bool)

(assert (=> b!532193 (= e!309883 e!309885)))

(declare-fun res!327668 () Bool)

(assert (=> b!532193 (=> (not res!327668) (not e!309885))))

(assert (=> b!532193 (= res!327668 (not e!309882))))

(declare-fun res!327669 () Bool)

(assert (=> b!532193 (=> (not res!327669) (not e!309882))))

(assert (=> b!532193 (= res!327669 (validKeyInArray!0 (select (arr!16207 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532194 () Bool)

(assert (=> b!532194 (= e!309884 call!31969)))

(declare-fun b!532195 () Bool)

(assert (=> b!532195 (= e!309884 call!31969)))

(assert (= (and d!81345 (not res!327667)) b!532193))

(assert (= (and b!532193 res!327669) b!532191))

(assert (= (and b!532193 res!327668) b!532192))

(assert (= (and b!532192 c!62572) b!532194))

(assert (= (and b!532192 (not c!62572)) b!532195))

(assert (= (or b!532194 b!532195) bm!31966))

(assert (=> b!532191 m!512445))

(assert (=> b!532191 m!512445))

(declare-fun m!512459 () Bool)

(assert (=> b!532191 m!512459))

(assert (=> b!532192 m!512445))

(assert (=> b!532192 m!512445))

(assert (=> b!532192 m!512455))

(assert (=> bm!31966 m!512445))

(declare-fun m!512461 () Bool)

(assert (=> bm!31966 m!512461))

(assert (=> b!532193 m!512445))

(assert (=> b!532193 m!512445))

(assert (=> b!532193 m!512455))

(assert (=> b!532120 d!81345))

(declare-fun b!532260 () Bool)

(declare-fun e!309924 () Bool)

(declare-fun e!309928 () Bool)

(assert (=> b!532260 (= e!309924 e!309928)))

(declare-fun res!327691 () Bool)

(declare-fun lt!245164 () SeekEntryResult!4665)

(get-info :version)

(assert (=> b!532260 (= res!327691 (and ((_ is Intermediate!4665) lt!245164) (not (undefined!5477 lt!245164)) (bvslt (x!49855 lt!245164) #b01111111111111111111111111111110) (bvsge (x!49855 lt!245164) #b00000000000000000000000000000000) (bvsge (x!49855 lt!245164) x!1030)))))

(assert (=> b!532260 (=> (not res!327691) (not e!309928))))

(declare-fun d!81349 () Bool)

(assert (=> d!81349 e!309924))

(declare-fun c!62597 () Bool)

(assert (=> d!81349 (= c!62597 (and ((_ is Intermediate!4665) lt!245164) (undefined!5477 lt!245164)))))

(declare-fun e!309926 () SeekEntryResult!4665)

(assert (=> d!81349 (= lt!245164 e!309926)))

(declare-fun c!62596 () Bool)

(assert (=> d!81349 (= c!62596 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245165 () (_ BitVec 64))

(assert (=> d!81349 (= lt!245165 (select (arr!16207 a!3154) index!1177))))

(assert (=> d!81349 (validMask!0 mask!3216)))

(assert (=> d!81349 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16207 a!3154) j!147) a!3154 mask!3216) lt!245164)))

(declare-fun b!532261 () Bool)

(assert (=> b!532261 (and (bvsge (index!20886 lt!245164) #b00000000000000000000000000000000) (bvslt (index!20886 lt!245164) (size!16571 a!3154)))))

(declare-fun res!327692 () Bool)

(assert (=> b!532261 (= res!327692 (= (select (arr!16207 a!3154) (index!20886 lt!245164)) (select (arr!16207 a!3154) j!147)))))

(declare-fun e!309925 () Bool)

(assert (=> b!532261 (=> res!327692 e!309925)))

(assert (=> b!532261 (= e!309928 e!309925)))

(declare-fun b!532262 () Bool)

(declare-fun e!309927 () SeekEntryResult!4665)

(assert (=> b!532262 (= e!309926 e!309927)))

(declare-fun c!62595 () Bool)

(assert (=> b!532262 (= c!62595 (or (= lt!245165 (select (arr!16207 a!3154) j!147)) (= (bvadd lt!245165 lt!245165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532263 () Bool)

(assert (=> b!532263 (= e!309927 (Intermediate!4665 false index!1177 x!1030))))

(declare-fun b!532264 () Bool)

(assert (=> b!532264 (= e!309924 (bvsge (x!49855 lt!245164) #b01111111111111111111111111111110))))

(declare-fun b!532265 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532265 (= e!309927 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16207 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532266 () Bool)

(assert (=> b!532266 (and (bvsge (index!20886 lt!245164) #b00000000000000000000000000000000) (bvslt (index!20886 lt!245164) (size!16571 a!3154)))))

(assert (=> b!532266 (= e!309925 (= (select (arr!16207 a!3154) (index!20886 lt!245164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532267 () Bool)

(assert (=> b!532267 (and (bvsge (index!20886 lt!245164) #b00000000000000000000000000000000) (bvslt (index!20886 lt!245164) (size!16571 a!3154)))))

(declare-fun res!327690 () Bool)

(assert (=> b!532267 (= res!327690 (= (select (arr!16207 a!3154) (index!20886 lt!245164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532267 (=> res!327690 e!309925)))

(declare-fun b!532268 () Bool)

(assert (=> b!532268 (= e!309926 (Intermediate!4665 true index!1177 x!1030))))

(assert (= (and d!81349 c!62596) b!532268))

(assert (= (and d!81349 (not c!62596)) b!532262))

(assert (= (and b!532262 c!62595) b!532263))

(assert (= (and b!532262 (not c!62595)) b!532265))

(assert (= (and d!81349 c!62597) b!532264))

(assert (= (and d!81349 (not c!62597)) b!532260))

(assert (= (and b!532260 res!327691) b!532261))

(assert (= (and b!532261 (not res!327692)) b!532267))

(assert (= (and b!532267 (not res!327690)) b!532266))

(declare-fun m!512493 () Bool)

(assert (=> b!532267 m!512493))

(declare-fun m!512495 () Bool)

(assert (=> d!81349 m!512495))

(assert (=> d!81349 m!512413))

(assert (=> b!532261 m!512493))

(declare-fun m!512497 () Bool)

(assert (=> b!532265 m!512497))

(assert (=> b!532265 m!512497))

(assert (=> b!532265 m!512407))

(declare-fun m!512499 () Bool)

(assert (=> b!532265 m!512499))

(assert (=> b!532266 m!512493))

(assert (=> b!532122 d!81349))

(declare-fun d!81359 () Bool)

(declare-fun lt!245191 () SeekEntryResult!4665)

(assert (=> d!81359 (and (or ((_ is Undefined!4665) lt!245191) (not ((_ is Found!4665) lt!245191)) (and (bvsge (index!20885 lt!245191) #b00000000000000000000000000000000) (bvslt (index!20885 lt!245191) (size!16571 a!3154)))) (or ((_ is Undefined!4665) lt!245191) ((_ is Found!4665) lt!245191) (not ((_ is MissingZero!4665) lt!245191)) (and (bvsge (index!20884 lt!245191) #b00000000000000000000000000000000) (bvslt (index!20884 lt!245191) (size!16571 a!3154)))) (or ((_ is Undefined!4665) lt!245191) ((_ is Found!4665) lt!245191) ((_ is MissingZero!4665) lt!245191) (not ((_ is MissingVacant!4665) lt!245191)) (and (bvsge (index!20887 lt!245191) #b00000000000000000000000000000000) (bvslt (index!20887 lt!245191) (size!16571 a!3154)))) (or ((_ is Undefined!4665) lt!245191) (ite ((_ is Found!4665) lt!245191) (= (select (arr!16207 a!3154) (index!20885 lt!245191)) k0!1998) (ite ((_ is MissingZero!4665) lt!245191) (= (select (arr!16207 a!3154) (index!20884 lt!245191)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4665) lt!245191) (= (select (arr!16207 a!3154) (index!20887 lt!245191)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309967 () SeekEntryResult!4665)

(assert (=> d!81359 (= lt!245191 e!309967)))

(declare-fun c!62620 () Bool)

(declare-fun lt!245189 () SeekEntryResult!4665)

(assert (=> d!81359 (= c!62620 (and ((_ is Intermediate!4665) lt!245189) (undefined!5477 lt!245189)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81359 (= lt!245189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81359 (validMask!0 mask!3216)))

(assert (=> d!81359 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245191)))

(declare-fun e!309969 () SeekEntryResult!4665)

(declare-fun b!532329 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33730 (_ BitVec 32)) SeekEntryResult!4665)

(assert (=> b!532329 (= e!309969 (seekKeyOrZeroReturnVacant!0 (x!49855 lt!245189) (index!20886 lt!245189) (index!20886 lt!245189) k0!1998 a!3154 mask!3216))))

(declare-fun b!532330 () Bool)

(declare-fun c!62621 () Bool)

(declare-fun lt!245190 () (_ BitVec 64))

(assert (=> b!532330 (= c!62621 (= lt!245190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309968 () SeekEntryResult!4665)

(assert (=> b!532330 (= e!309968 e!309969)))

(declare-fun b!532331 () Bool)

(assert (=> b!532331 (= e!309969 (MissingZero!4665 (index!20886 lt!245189)))))

(declare-fun b!532332 () Bool)

(assert (=> b!532332 (= e!309967 e!309968)))

(assert (=> b!532332 (= lt!245190 (select (arr!16207 a!3154) (index!20886 lt!245189)))))

(declare-fun c!62619 () Bool)

(assert (=> b!532332 (= c!62619 (= lt!245190 k0!1998))))

(declare-fun b!532333 () Bool)

(assert (=> b!532333 (= e!309967 Undefined!4665)))

(declare-fun b!532334 () Bool)

(assert (=> b!532334 (= e!309968 (Found!4665 (index!20886 lt!245189)))))

(assert (= (and d!81359 c!62620) b!532333))

(assert (= (and d!81359 (not c!62620)) b!532332))

(assert (= (and b!532332 c!62619) b!532334))

(assert (= (and b!532332 (not c!62619)) b!532330))

(assert (= (and b!532330 c!62621) b!532331))

(assert (= (and b!532330 (not c!62621)) b!532329))

(declare-fun m!512523 () Bool)

(assert (=> d!81359 m!512523))

(declare-fun m!512525 () Bool)

(assert (=> d!81359 m!512525))

(declare-fun m!512527 () Bool)

(assert (=> d!81359 m!512527))

(assert (=> d!81359 m!512413))

(declare-fun m!512529 () Bool)

(assert (=> d!81359 m!512529))

(declare-fun m!512531 () Bool)

(assert (=> d!81359 m!512531))

(assert (=> d!81359 m!512525))

(declare-fun m!512533 () Bool)

(assert (=> b!532329 m!512533))

(declare-fun m!512535 () Bool)

(assert (=> b!532332 m!512535))

(assert (=> b!532116 d!81359))

(declare-fun d!81367 () Bool)

(assert (=> d!81367 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48422 d!81367))

(declare-fun d!81377 () Bool)

(assert (=> d!81377 (= (array_inv!12003 a!3154) (bvsge (size!16571 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48422 d!81377))

(declare-fun d!81379 () Bool)

(assert (=> d!81379 (= (validKeyInArray!0 (select (arr!16207 a!3154) j!147)) (and (not (= (select (arr!16207 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16207 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532121 d!81379))

(check-sat (not b!532193) (not b!532163) (not b!532166) (not bm!31961) (not d!81349) (not b!532191) (not d!81359) (not bm!31966) (not b!532265) (not b!532329) (not b!532172) (not b!532192))
(check-sat)
