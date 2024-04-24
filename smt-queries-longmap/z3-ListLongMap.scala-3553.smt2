; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48934 () Bool)

(assert start!48934)

(declare-fun b!538998 () Bool)

(declare-fun res!334103 () Bool)

(declare-fun e!312552 () Bool)

(assert (=> b!538998 (=> (not res!334103) (not e!312552))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538998 (= res!334103 (validKeyInArray!0 k0!1998))))

(declare-fun b!538999 () Bool)

(declare-fun res!334106 () Bool)

(assert (=> b!538999 (=> (not res!334106) (not e!312552))))

(declare-datatypes ((array!34094 0))(
  ( (array!34095 (arr!16384 (Array (_ BitVec 32) (_ BitVec 64))) (size!16748 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34094)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538999 (= res!334106 (validKeyInArray!0 (select (arr!16384 a!3154) j!147)))))

(declare-fun b!539000 () Bool)

(declare-fun res!334098 () Bool)

(assert (=> b!539000 (=> (not res!334098) (not e!312552))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539000 (= res!334098 (and (= (size!16748 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16748 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16748 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539001 () Bool)

(declare-fun e!312545 () Bool)

(declare-fun e!312551 () Bool)

(assert (=> b!539001 (= e!312545 (not e!312551))))

(declare-fun res!334099 () Bool)

(assert (=> b!539001 (=> res!334099 e!312551)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!539001 (= res!334099 (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-datatypes ((SeekEntryResult!4798 0))(
  ( (MissingZero!4798 (index!21416 (_ BitVec 32))) (Found!4798 (index!21417 (_ BitVec 32))) (Intermediate!4798 (undefined!5610 Bool) (index!21418 (_ BitVec 32)) (x!50488 (_ BitVec 32))) (Undefined!4798) (MissingVacant!4798 (index!21419 (_ BitVec 32))) )
))
(declare-fun lt!247074 () SeekEntryResult!4798)

(declare-fun lt!247071 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34094 (_ BitVec 32)) SeekEntryResult!4798)

(assert (=> b!539001 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247071 (select (store (arr!16384 a!3154) i!1153 k0!1998) j!147) (array!34095 (store (arr!16384 a!3154) i!1153 k0!1998) (size!16748 a!3154)) mask!3216) lt!247074)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16853 0))(
  ( (Unit!16854) )
))
(declare-fun lt!247069 () Unit!16853)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16853)

(assert (=> b!539001 (= lt!247069 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!247071 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!539002 () Bool)

(declare-fun e!312549 () Bool)

(assert (=> b!539002 (= e!312552 e!312549)))

(declare-fun res!334104 () Bool)

(assert (=> b!539002 (=> (not res!334104) (not e!312549))))

(declare-fun lt!247075 () SeekEntryResult!4798)

(assert (=> b!539002 (= res!334104 (or (= lt!247075 (MissingZero!4798 i!1153)) (= lt!247075 (MissingVacant!4798 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34094 (_ BitVec 32)) SeekEntryResult!4798)

(assert (=> b!539002 (= lt!247075 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539003 () Bool)

(assert (=> b!539003 (= e!312551 (validKeyInArray!0 (select (store (arr!16384 a!3154) i!1153 k0!1998) j!147)))))

(declare-fun b!539004 () Bool)

(declare-fun res!334102 () Bool)

(assert (=> b!539004 (=> (not res!334102) (not e!312549))))

(declare-datatypes ((List!10410 0))(
  ( (Nil!10407) (Cons!10406 (h!11352 (_ BitVec 64)) (t!16630 List!10410)) )
))
(declare-fun arrayNoDuplicates!0 (array!34094 (_ BitVec 32) List!10410) Bool)

(assert (=> b!539004 (= res!334102 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10407))))

(declare-fun b!539005 () Bool)

(declare-fun e!312550 () Bool)

(declare-fun e!312547 () Bool)

(assert (=> b!539005 (= e!312550 e!312547)))

(declare-fun res!334100 () Bool)

(assert (=> b!539005 (=> (not res!334100) (not e!312547))))

(assert (=> b!539005 (= res!334100 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!247071 #b00000000000000000000000000000000) (bvslt lt!247071 (size!16748 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539005 (= lt!247071 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun res!334107 () Bool)

(assert (=> start!48934 (=> (not res!334107) (not e!312552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48934 (= res!334107 (validMask!0 mask!3216))))

(assert (=> start!48934 e!312552))

(assert (=> start!48934 true))

(declare-fun array_inv!12243 (array!34094) Bool)

(assert (=> start!48934 (array_inv!12243 a!3154)))

(declare-fun b!539006 () Bool)

(declare-fun res!334111 () Bool)

(assert (=> b!539006 (=> (not res!334111) (not e!312552))))

(declare-fun arrayContainsKey!0 (array!34094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539006 (= res!334111 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539007 () Bool)

(declare-fun res!334105 () Bool)

(assert (=> b!539007 (=> (not res!334105) (not e!312549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34094 (_ BitVec 32)) Bool)

(assert (=> b!539007 (= res!334105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539008 () Bool)

(declare-fun e!312548 () Bool)

(assert (=> b!539008 (= e!312549 e!312548)))

(declare-fun res!334109 () Bool)

(assert (=> b!539008 (=> (not res!334109) (not e!312548))))

(declare-fun lt!247070 () SeekEntryResult!4798)

(assert (=> b!539008 (= res!334109 (= lt!247070 lt!247074))))

(assert (=> b!539008 (= lt!247074 (Intermediate!4798 false resIndex!32 resX!32))))

(assert (=> b!539008 (= lt!247070 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539009 () Bool)

(assert (=> b!539009 (= e!312547 e!312545)))

(declare-fun res!334101 () Bool)

(assert (=> b!539009 (=> (not res!334101) (not e!312545))))

(declare-fun lt!247073 () SeekEntryResult!4798)

(declare-fun lt!247072 () SeekEntryResult!4798)

(assert (=> b!539009 (= res!334101 (and (= lt!247072 lt!247074) (= lt!247073 lt!247072)))))

(assert (=> b!539009 (= lt!247072 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247071 (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539010 () Bool)

(assert (=> b!539010 (= e!312548 e!312550)))

(declare-fun res!334110 () Bool)

(assert (=> b!539010 (=> (not res!334110) (not e!312550))))

(assert (=> b!539010 (= res!334110 (and (= lt!247073 lt!247070) (not (= (select (arr!16384 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16384 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16384 a!3154) index!1177) (select (arr!16384 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539010 (= lt!247073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16384 a!3154) j!147) mask!3216) (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539011 () Bool)

(declare-fun res!334108 () Bool)

(assert (=> b!539011 (=> (not res!334108) (not e!312549))))

(assert (=> b!539011 (= res!334108 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16748 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16748 a!3154)) (= (select (arr!16384 a!3154) resIndex!32) (select (arr!16384 a!3154) j!147))))))

(assert (= (and start!48934 res!334107) b!539000))

(assert (= (and b!539000 res!334098) b!538999))

(assert (= (and b!538999 res!334106) b!538998))

(assert (= (and b!538998 res!334103) b!539006))

(assert (= (and b!539006 res!334111) b!539002))

(assert (= (and b!539002 res!334104) b!539007))

(assert (= (and b!539007 res!334105) b!539004))

(assert (= (and b!539004 res!334102) b!539011))

(assert (= (and b!539011 res!334108) b!539008))

(assert (= (and b!539008 res!334109) b!539010))

(assert (= (and b!539010 res!334110) b!539005))

(assert (= (and b!539005 res!334100) b!539009))

(assert (= (and b!539009 res!334101) b!539001))

(assert (= (and b!539001 (not res!334099)) b!539003))

(declare-fun m!518227 () Bool)

(assert (=> b!539008 m!518227))

(assert (=> b!539008 m!518227))

(declare-fun m!518229 () Bool)

(assert (=> b!539008 m!518229))

(declare-fun m!518231 () Bool)

(assert (=> start!48934 m!518231))

(declare-fun m!518233 () Bool)

(assert (=> start!48934 m!518233))

(declare-fun m!518235 () Bool)

(assert (=> b!539011 m!518235))

(assert (=> b!539011 m!518227))

(assert (=> b!539009 m!518227))

(assert (=> b!539009 m!518227))

(declare-fun m!518237 () Bool)

(assert (=> b!539009 m!518237))

(declare-fun m!518239 () Bool)

(assert (=> b!539006 m!518239))

(declare-fun m!518241 () Bool)

(assert (=> b!539007 m!518241))

(declare-fun m!518243 () Bool)

(assert (=> b!539001 m!518243))

(declare-fun m!518245 () Bool)

(assert (=> b!539001 m!518245))

(assert (=> b!539001 m!518245))

(declare-fun m!518247 () Bool)

(assert (=> b!539001 m!518247))

(declare-fun m!518249 () Bool)

(assert (=> b!539001 m!518249))

(assert (=> b!538999 m!518227))

(assert (=> b!538999 m!518227))

(declare-fun m!518251 () Bool)

(assert (=> b!538999 m!518251))

(declare-fun m!518253 () Bool)

(assert (=> b!539005 m!518253))

(assert (=> b!539003 m!518243))

(assert (=> b!539003 m!518245))

(assert (=> b!539003 m!518245))

(declare-fun m!518255 () Bool)

(assert (=> b!539003 m!518255))

(declare-fun m!518257 () Bool)

(assert (=> b!538998 m!518257))

(declare-fun m!518259 () Bool)

(assert (=> b!539002 m!518259))

(declare-fun m!518261 () Bool)

(assert (=> b!539004 m!518261))

(declare-fun m!518263 () Bool)

(assert (=> b!539010 m!518263))

(assert (=> b!539010 m!518227))

(assert (=> b!539010 m!518227))

(declare-fun m!518265 () Bool)

(assert (=> b!539010 m!518265))

(assert (=> b!539010 m!518265))

(assert (=> b!539010 m!518227))

(declare-fun m!518267 () Bool)

(assert (=> b!539010 m!518267))

(check-sat (not b!539008) (not b!539007) (not b!539005) (not b!539004) (not b!538999) (not b!539002) (not b!539001) (not b!539006) (not b!538998) (not b!539009) (not b!539003) (not start!48934) (not b!539010))
(check-sat)
