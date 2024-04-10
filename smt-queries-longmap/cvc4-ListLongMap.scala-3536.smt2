; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48790 () Bool)

(assert start!48790)

(declare-fun res!332100 () Bool)

(declare-fun e!311589 () Bool)

(assert (=> start!48790 (=> (not res!332100) (not e!311589))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48790 (= res!332100 (validMask!0 mask!3216))))

(assert (=> start!48790 e!311589))

(assert (=> start!48790 true))

(declare-datatypes ((array!34002 0))(
  ( (array!34003 (arr!16340 (Array (_ BitVec 32) (_ BitVec 64))) (size!16704 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34002)

(declare-fun array_inv!12136 (array!34002) Bool)

(assert (=> start!48790 (array_inv!12136 a!3154)))

(declare-fun b!536885 () Bool)

(declare-fun res!332102 () Bool)

(declare-fun e!311585 () Bool)

(assert (=> b!536885 (=> (not res!332102) (not e!311585))))

(declare-datatypes ((SeekEntryResult!4798 0))(
  ( (MissingZero!4798 (index!21416 (_ BitVec 32))) (Found!4798 (index!21417 (_ BitVec 32))) (Intermediate!4798 (undefined!5610 Bool) (index!21418 (_ BitVec 32)) (x!50349 (_ BitVec 32))) (Undefined!4798) (MissingVacant!4798 (index!21419 (_ BitVec 32))) )
))
(declare-fun lt!246235 () SeekEntryResult!4798)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34002 (_ BitVec 32)) SeekEntryResult!4798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536885 (= res!332102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16340 a!3154) j!147) mask!3216) (select (arr!16340 a!3154) j!147) a!3154 mask!3216) lt!246235))))

(declare-fun b!536886 () Bool)

(declare-fun res!332094 () Bool)

(assert (=> b!536886 (=> (not res!332094) (not e!311585))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536886 (= res!332094 (and (not (= (select (arr!16340 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16340 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16340 a!3154) index!1177) (select (arr!16340 a!3154) j!147)))))))

(declare-fun b!536887 () Bool)

(declare-fun res!332090 () Bool)

(declare-fun e!311588 () Bool)

(assert (=> b!536887 (=> (not res!332090) (not e!311588))))

(declare-datatypes ((List!10459 0))(
  ( (Nil!10456) (Cons!10455 (h!11398 (_ BitVec 64)) (t!16687 List!10459)) )
))
(declare-fun arrayNoDuplicates!0 (array!34002 (_ BitVec 32) List!10459) Bool)

(assert (=> b!536887 (= res!332090 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10456))))

(declare-fun b!536888 () Bool)

(declare-fun res!332091 () Bool)

(assert (=> b!536888 (=> (not res!332091) (not e!311589))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536888 (= res!332091 (and (= (size!16704 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16704 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16704 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536889 () Bool)

(declare-fun res!332096 () Bool)

(assert (=> b!536889 (=> (not res!332096) (not e!311589))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536889 (= res!332096 (validKeyInArray!0 k!1998))))

(declare-fun b!536890 () Bool)

(declare-fun res!332095 () Bool)

(assert (=> b!536890 (=> (not res!332095) (not e!311588))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536890 (= res!332095 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16704 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16704 a!3154)) (= (select (arr!16340 a!3154) resIndex!32) (select (arr!16340 a!3154) j!147))))))

(declare-fun b!536891 () Bool)

(declare-fun res!332098 () Bool)

(assert (=> b!536891 (=> (not res!332098) (not e!311589))))

(declare-fun arrayContainsKey!0 (array!34002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536891 (= res!332098 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536892 () Bool)

(declare-fun e!311587 () Bool)

(assert (=> b!536892 (= e!311587 false)))

(declare-fun lt!246233 () (_ BitVec 32))

(declare-fun lt!246234 () SeekEntryResult!4798)

(assert (=> b!536892 (= lt!246234 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246233 (select (arr!16340 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536893 () Bool)

(declare-fun res!332099 () Bool)

(assert (=> b!536893 (=> (not res!332099) (not e!311588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34002 (_ BitVec 32)) Bool)

(assert (=> b!536893 (= res!332099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536894 () Bool)

(assert (=> b!536894 (= e!311588 e!311585)))

(declare-fun res!332092 () Bool)

(assert (=> b!536894 (=> (not res!332092) (not e!311585))))

(assert (=> b!536894 (= res!332092 (= lt!246235 (Intermediate!4798 false resIndex!32 resX!32)))))

(assert (=> b!536894 (= lt!246235 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16340 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536895 () Bool)

(assert (=> b!536895 (= e!311589 e!311588)))

(declare-fun res!332093 () Bool)

(assert (=> b!536895 (=> (not res!332093) (not e!311588))))

(declare-fun lt!246232 () SeekEntryResult!4798)

(assert (=> b!536895 (= res!332093 (or (= lt!246232 (MissingZero!4798 i!1153)) (= lt!246232 (MissingVacant!4798 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34002 (_ BitVec 32)) SeekEntryResult!4798)

(assert (=> b!536895 (= lt!246232 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536896 () Bool)

(declare-fun res!332097 () Bool)

(assert (=> b!536896 (=> (not res!332097) (not e!311589))))

(assert (=> b!536896 (= res!332097 (validKeyInArray!0 (select (arr!16340 a!3154) j!147)))))

(declare-fun b!536897 () Bool)

(assert (=> b!536897 (= e!311585 e!311587)))

(declare-fun res!332101 () Bool)

(assert (=> b!536897 (=> (not res!332101) (not e!311587))))

(assert (=> b!536897 (= res!332101 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246233 #b00000000000000000000000000000000) (bvslt lt!246233 (size!16704 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536897 (= lt!246233 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!48790 res!332100) b!536888))

(assert (= (and b!536888 res!332091) b!536896))

(assert (= (and b!536896 res!332097) b!536889))

(assert (= (and b!536889 res!332096) b!536891))

(assert (= (and b!536891 res!332098) b!536895))

(assert (= (and b!536895 res!332093) b!536893))

(assert (= (and b!536893 res!332099) b!536887))

(assert (= (and b!536887 res!332090) b!536890))

(assert (= (and b!536890 res!332095) b!536894))

(assert (= (and b!536894 res!332092) b!536885))

(assert (= (and b!536885 res!332102) b!536886))

(assert (= (and b!536886 res!332094) b!536897))

(assert (= (and b!536897 res!332101) b!536892))

(declare-fun m!516217 () Bool)

(assert (=> b!536893 m!516217))

(declare-fun m!516219 () Bool)

(assert (=> start!48790 m!516219))

(declare-fun m!516221 () Bool)

(assert (=> start!48790 m!516221))

(declare-fun m!516223 () Bool)

(assert (=> b!536887 m!516223))

(declare-fun m!516225 () Bool)

(assert (=> b!536894 m!516225))

(assert (=> b!536894 m!516225))

(declare-fun m!516227 () Bool)

(assert (=> b!536894 m!516227))

(assert (=> b!536896 m!516225))

(assert (=> b!536896 m!516225))

(declare-fun m!516229 () Bool)

(assert (=> b!536896 m!516229))

(declare-fun m!516231 () Bool)

(assert (=> b!536890 m!516231))

(assert (=> b!536890 m!516225))

(declare-fun m!516233 () Bool)

(assert (=> b!536897 m!516233))

(declare-fun m!516235 () Bool)

(assert (=> b!536889 m!516235))

(assert (=> b!536892 m!516225))

(assert (=> b!536892 m!516225))

(declare-fun m!516237 () Bool)

(assert (=> b!536892 m!516237))

(declare-fun m!516239 () Bool)

(assert (=> b!536886 m!516239))

(assert (=> b!536886 m!516225))

(assert (=> b!536885 m!516225))

(assert (=> b!536885 m!516225))

(declare-fun m!516241 () Bool)

(assert (=> b!536885 m!516241))

(assert (=> b!536885 m!516241))

(assert (=> b!536885 m!516225))

(declare-fun m!516243 () Bool)

(assert (=> b!536885 m!516243))

(declare-fun m!516245 () Bool)

(assert (=> b!536891 m!516245))

(declare-fun m!516247 () Bool)

(assert (=> b!536895 m!516247))

(push 1)

(assert (not b!536897))

(assert (not b!536892))

(assert (not b!536895))

(assert (not start!48790))

(assert (not b!536887))

(assert (not b!536896))

