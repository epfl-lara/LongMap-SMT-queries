; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49266 () Bool)

(assert start!49266)

(declare-fun b!542231 () Bool)

(declare-fun res!336935 () Bool)

(declare-fun e!313812 () Bool)

(assert (=> b!542231 (=> (not res!336935) (not e!313812))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34284 0))(
  ( (array!34285 (arr!16475 (Array (_ BitVec 32) (_ BitVec 64))) (size!16840 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34284)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542231 (= res!336935 (and (= (size!16840 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16840 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16840 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542232 () Bool)

(declare-fun res!336927 () Bool)

(declare-fun e!313813 () Bool)

(assert (=> b!542232 (=> (not res!336927) (not e!313813))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!542232 (= res!336927 (and (not (= (select (arr!16475 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16475 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16475 a!3154) index!1177) (select (arr!16475 a!3154) j!147)))))))

(declare-fun b!542233 () Bool)

(declare-fun res!336926 () Bool)

(declare-fun e!313814 () Bool)

(assert (=> b!542233 (=> (not res!336926) (not e!313814))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!542233 (= res!336926 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16840 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16840 a!3154)) (= (select (arr!16475 a!3154) resIndex!32) (select (arr!16475 a!3154) j!147))))))

(declare-fun res!336929 () Bool)

(assert (=> start!49266 (=> (not res!336929) (not e!313812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49266 (= res!336929 (validMask!0 mask!3216))))

(assert (=> start!49266 e!313812))

(assert (=> start!49266 true))

(declare-fun array_inv!12358 (array!34284) Bool)

(assert (=> start!49266 (array_inv!12358 a!3154)))

(declare-fun b!542234 () Bool)

(assert (=> b!542234 (= e!313813 false)))

(declare-fun lt!247703 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542234 (= lt!247703 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542235 () Bool)

(declare-fun res!336928 () Bool)

(assert (=> b!542235 (=> (not res!336928) (not e!313812))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542235 (= res!336928 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542236 () Bool)

(declare-fun res!336934 () Bool)

(assert (=> b!542236 (=> (not res!336934) (not e!313813))))

(declare-datatypes ((SeekEntryResult!4930 0))(
  ( (MissingZero!4930 (index!21944 (_ BitVec 32))) (Found!4930 (index!21945 (_ BitVec 32))) (Intermediate!4930 (undefined!5742 Bool) (index!21946 (_ BitVec 32)) (x!50868 (_ BitVec 32))) (Undefined!4930) (MissingVacant!4930 (index!21947 (_ BitVec 32))) )
))
(declare-fun lt!247705 () SeekEntryResult!4930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34284 (_ BitVec 32)) SeekEntryResult!4930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542236 (= res!336934 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16475 a!3154) j!147) mask!3216) (select (arr!16475 a!3154) j!147) a!3154 mask!3216) lt!247705))))

(declare-fun b!542237 () Bool)

(declare-fun res!336924 () Bool)

(assert (=> b!542237 (=> (not res!336924) (not e!313812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542237 (= res!336924 (validKeyInArray!0 k0!1998))))

(declare-fun b!542238 () Bool)

(assert (=> b!542238 (= e!313812 e!313814)))

(declare-fun res!336933 () Bool)

(assert (=> b!542238 (=> (not res!336933) (not e!313814))))

(declare-fun lt!247704 () SeekEntryResult!4930)

(assert (=> b!542238 (= res!336933 (or (= lt!247704 (MissingZero!4930 i!1153)) (= lt!247704 (MissingVacant!4930 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34284 (_ BitVec 32)) SeekEntryResult!4930)

(assert (=> b!542238 (= lt!247704 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542239 () Bool)

(declare-fun res!336932 () Bool)

(assert (=> b!542239 (=> (not res!336932) (not e!313812))))

(assert (=> b!542239 (= res!336932 (validKeyInArray!0 (select (arr!16475 a!3154) j!147)))))

(declare-fun b!542240 () Bool)

(assert (=> b!542240 (= e!313814 e!313813)))

(declare-fun res!336930 () Bool)

(assert (=> b!542240 (=> (not res!336930) (not e!313813))))

(assert (=> b!542240 (= res!336930 (= lt!247705 (Intermediate!4930 false resIndex!32 resX!32)))))

(assert (=> b!542240 (= lt!247705 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16475 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542241 () Bool)

(declare-fun res!336925 () Bool)

(assert (=> b!542241 (=> (not res!336925) (not e!313814))))

(declare-datatypes ((List!10633 0))(
  ( (Nil!10630) (Cons!10629 (h!11584 (_ BitVec 64)) (t!16852 List!10633)) )
))
(declare-fun arrayNoDuplicates!0 (array!34284 (_ BitVec 32) List!10633) Bool)

(assert (=> b!542241 (= res!336925 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10630))))

(declare-fun b!542242 () Bool)

(declare-fun res!336931 () Bool)

(assert (=> b!542242 (=> (not res!336931) (not e!313814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34284 (_ BitVec 32)) Bool)

(assert (=> b!542242 (= res!336931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49266 res!336929) b!542231))

(assert (= (and b!542231 res!336935) b!542239))

(assert (= (and b!542239 res!336932) b!542237))

(assert (= (and b!542237 res!336924) b!542235))

(assert (= (and b!542235 res!336928) b!542238))

(assert (= (and b!542238 res!336933) b!542242))

(assert (= (and b!542242 res!336931) b!542241))

(assert (= (and b!542241 res!336925) b!542233))

(assert (= (and b!542233 res!336926) b!542240))

(assert (= (and b!542240 res!336930) b!542236))

(assert (= (and b!542236 res!336934) b!542232))

(assert (= (and b!542232 res!336927) b!542234))

(declare-fun m!519997 () Bool)

(assert (=> b!542238 m!519997))

(declare-fun m!519999 () Bool)

(assert (=> b!542240 m!519999))

(assert (=> b!542240 m!519999))

(declare-fun m!520001 () Bool)

(assert (=> b!542240 m!520001))

(declare-fun m!520003 () Bool)

(assert (=> b!542237 m!520003))

(declare-fun m!520005 () Bool)

(assert (=> b!542242 m!520005))

(assert (=> b!542239 m!519999))

(assert (=> b!542239 m!519999))

(declare-fun m!520007 () Bool)

(assert (=> b!542239 m!520007))

(declare-fun m!520009 () Bool)

(assert (=> b!542241 m!520009))

(assert (=> b!542236 m!519999))

(assert (=> b!542236 m!519999))

(declare-fun m!520011 () Bool)

(assert (=> b!542236 m!520011))

(assert (=> b!542236 m!520011))

(assert (=> b!542236 m!519999))

(declare-fun m!520013 () Bool)

(assert (=> b!542236 m!520013))

(declare-fun m!520015 () Bool)

(assert (=> b!542233 m!520015))

(assert (=> b!542233 m!519999))

(declare-fun m!520017 () Bool)

(assert (=> b!542234 m!520017))

(declare-fun m!520019 () Bool)

(assert (=> b!542235 m!520019))

(declare-fun m!520021 () Bool)

(assert (=> b!542232 m!520021))

(assert (=> b!542232 m!519999))

(declare-fun m!520023 () Bool)

(assert (=> start!49266 m!520023))

(declare-fun m!520025 () Bool)

(assert (=> start!49266 m!520025))

(check-sat (not start!49266) (not b!542235) (not b!542238) (not b!542242) (not b!542234) (not b!542239) (not b!542237) (not b!542241) (not b!542236) (not b!542240))
(check-sat)
