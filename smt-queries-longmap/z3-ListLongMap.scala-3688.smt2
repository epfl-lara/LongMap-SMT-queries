; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50790 () Bool)

(assert start!50790)

(declare-fun b!555236 () Bool)

(declare-fun res!347548 () Bool)

(declare-fun e!320087 () Bool)

(assert (=> b!555236 (=> (not res!347548) (not e!320087))))

(declare-datatypes ((array!34962 0))(
  ( (array!34963 (arr!16789 (Array (_ BitVec 32) (_ BitVec 64))) (size!17153 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34962)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555236 (= res!347548 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555237 () Bool)

(declare-fun res!347543 () Bool)

(assert (=> b!555237 (=> (not res!347543) (not e!320087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555237 (= res!347543 (validKeyInArray!0 k0!1914))))

(declare-fun b!555238 () Bool)

(declare-fun e!320086 () Bool)

(assert (=> b!555238 (= e!320086 (not true))))

(declare-datatypes ((SeekEntryResult!5194 0))(
  ( (MissingZero!5194 (index!23003 (_ BitVec 32))) (Found!5194 (index!23004 (_ BitVec 32))) (Intermediate!5194 (undefined!6006 Bool) (index!23005 (_ BitVec 32)) (x!52063 (_ BitVec 32))) (Undefined!5194) (MissingVacant!5194 (index!23006 (_ BitVec 32))) )
))
(declare-fun lt!252259 () SeekEntryResult!5194)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252258 () SeekEntryResult!5194)

(get-info :version)

(assert (=> b!555238 (and (= lt!252258 (Found!5194 j!142)) (or (undefined!6006 lt!252259) (not ((_ is Intermediate!5194) lt!252259)) (= (select (arr!16789 a!3118) (index!23005 lt!252259)) (select (arr!16789 a!3118) j!142)) (not (= (select (arr!16789 a!3118) (index!23005 lt!252259)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252258 (MissingZero!5194 (index!23005 lt!252259)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34962 (_ BitVec 32)) SeekEntryResult!5194)

(assert (=> b!555238 (= lt!252258 (seekEntryOrOpen!0 (select (arr!16789 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34962 (_ BitVec 32)) Bool)

(assert (=> b!555238 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17233 0))(
  ( (Unit!17234) )
))
(declare-fun lt!252260 () Unit!17233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17233)

(assert (=> b!555238 (= lt!252260 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555239 () Bool)

(declare-fun res!347545 () Bool)

(assert (=> b!555239 (=> (not res!347545) (not e!320087))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555239 (= res!347545 (and (= (size!17153 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17153 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17153 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555240 () Bool)

(declare-fun res!347551 () Bool)

(declare-fun e!320085 () Bool)

(assert (=> b!555240 (=> (not res!347551) (not e!320085))))

(assert (=> b!555240 (= res!347551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555241 () Bool)

(declare-fun res!347550 () Bool)

(assert (=> b!555241 (=> (not res!347550) (not e!320085))))

(declare-datatypes ((List!10776 0))(
  ( (Nil!10773) (Cons!10772 (h!11760 (_ BitVec 64)) (t!16996 List!10776)) )
))
(declare-fun arrayNoDuplicates!0 (array!34962 (_ BitVec 32) List!10776) Bool)

(assert (=> b!555241 (= res!347550 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10773))))

(declare-fun b!555242 () Bool)

(assert (=> b!555242 (= e!320087 e!320085)))

(declare-fun res!347544 () Bool)

(assert (=> b!555242 (=> (not res!347544) (not e!320085))))

(declare-fun lt!252257 () SeekEntryResult!5194)

(assert (=> b!555242 (= res!347544 (or (= lt!252257 (MissingZero!5194 i!1132)) (= lt!252257 (MissingVacant!5194 i!1132))))))

(assert (=> b!555242 (= lt!252257 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555243 () Bool)

(declare-fun res!347549 () Bool)

(assert (=> b!555243 (=> (not res!347549) (not e!320087))))

(assert (=> b!555243 (= res!347549 (validKeyInArray!0 (select (arr!16789 a!3118) j!142)))))

(declare-fun res!347546 () Bool)

(assert (=> start!50790 (=> (not res!347546) (not e!320087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50790 (= res!347546 (validMask!0 mask!3119))))

(assert (=> start!50790 e!320087))

(assert (=> start!50790 true))

(declare-fun array_inv!12648 (array!34962) Bool)

(assert (=> start!50790 (array_inv!12648 a!3118)))

(declare-fun b!555244 () Bool)

(assert (=> b!555244 (= e!320085 e!320086)))

(declare-fun res!347547 () Bool)

(assert (=> b!555244 (=> (not res!347547) (not e!320086))))

(declare-fun lt!252262 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34962 (_ BitVec 32)) SeekEntryResult!5194)

(assert (=> b!555244 (= res!347547 (= lt!252259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252262 (select (store (arr!16789 a!3118) i!1132 k0!1914) j!142) (array!34963 (store (arr!16789 a!3118) i!1132 k0!1914) (size!17153 a!3118)) mask!3119)))))

(declare-fun lt!252261 () (_ BitVec 32))

(assert (=> b!555244 (= lt!252259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252261 (select (arr!16789 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555244 (= lt!252262 (toIndex!0 (select (store (arr!16789 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555244 (= lt!252261 (toIndex!0 (select (arr!16789 a!3118) j!142) mask!3119))))

(assert (= (and start!50790 res!347546) b!555239))

(assert (= (and b!555239 res!347545) b!555243))

(assert (= (and b!555243 res!347549) b!555237))

(assert (= (and b!555237 res!347543) b!555236))

(assert (= (and b!555236 res!347548) b!555242))

(assert (= (and b!555242 res!347544) b!555240))

(assert (= (and b!555240 res!347551) b!555241))

(assert (= (and b!555241 res!347550) b!555244))

(assert (= (and b!555244 res!347547) b!555238))

(declare-fun m!532895 () Bool)

(assert (=> b!555244 m!532895))

(declare-fun m!532897 () Bool)

(assert (=> b!555244 m!532897))

(assert (=> b!555244 m!532895))

(declare-fun m!532899 () Bool)

(assert (=> b!555244 m!532899))

(assert (=> b!555244 m!532895))

(declare-fun m!532901 () Bool)

(assert (=> b!555244 m!532901))

(declare-fun m!532903 () Bool)

(assert (=> b!555244 m!532903))

(assert (=> b!555244 m!532901))

(declare-fun m!532905 () Bool)

(assert (=> b!555244 m!532905))

(assert (=> b!555244 m!532901))

(declare-fun m!532907 () Bool)

(assert (=> b!555244 m!532907))

(declare-fun m!532909 () Bool)

(assert (=> b!555236 m!532909))

(declare-fun m!532911 () Bool)

(assert (=> b!555242 m!532911))

(declare-fun m!532913 () Bool)

(assert (=> b!555240 m!532913))

(declare-fun m!532915 () Bool)

(assert (=> start!50790 m!532915))

(declare-fun m!532917 () Bool)

(assert (=> start!50790 m!532917))

(declare-fun m!532919 () Bool)

(assert (=> b!555241 m!532919))

(assert (=> b!555243 m!532895))

(assert (=> b!555243 m!532895))

(declare-fun m!532921 () Bool)

(assert (=> b!555243 m!532921))

(declare-fun m!532923 () Bool)

(assert (=> b!555237 m!532923))

(declare-fun m!532925 () Bool)

(assert (=> b!555238 m!532925))

(declare-fun m!532927 () Bool)

(assert (=> b!555238 m!532927))

(assert (=> b!555238 m!532895))

(declare-fun m!532929 () Bool)

(assert (=> b!555238 m!532929))

(declare-fun m!532931 () Bool)

(assert (=> b!555238 m!532931))

(assert (=> b!555238 m!532895))

(check-sat (not b!555236) (not b!555241) (not b!555240) (not b!555237) (not start!50790) (not b!555238) (not b!555242) (not b!555244) (not b!555243))
(check-sat)
