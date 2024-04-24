; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48874 () Bool)

(assert start!48874)

(declare-fun b!537826 () Bool)

(declare-fun res!332927 () Bool)

(declare-fun e!311999 () Bool)

(assert (=> b!537826 (=> (not res!332927) (not e!311999))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34034 0))(
  ( (array!34035 (arr!16354 (Array (_ BitVec 32) (_ BitVec 64))) (size!16718 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34034)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537826 (= res!332927 (and (= (size!16718 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16718 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16718 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537827 () Bool)

(declare-fun res!332938 () Bool)

(assert (=> b!537827 (=> (not res!332938) (not e!311999))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537827 (= res!332938 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537828 () Bool)

(declare-fun e!312001 () Bool)

(assert (=> b!537828 (= e!312001 false)))

(declare-fun lt!246569 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4768 0))(
  ( (MissingZero!4768 (index!21296 (_ BitVec 32))) (Found!4768 (index!21297 (_ BitVec 32))) (Intermediate!4768 (undefined!5580 Bool) (index!21298 (_ BitVec 32)) (x!50378 (_ BitVec 32))) (Undefined!4768) (MissingVacant!4768 (index!21299 (_ BitVec 32))) )
))
(declare-fun lt!246568 () SeekEntryResult!4768)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34034 (_ BitVec 32)) SeekEntryResult!4768)

(assert (=> b!537828 (= lt!246568 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246569 (select (arr!16354 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537829 () Bool)

(declare-fun e!312003 () Bool)

(assert (=> b!537829 (= e!311999 e!312003)))

(declare-fun res!332933 () Bool)

(assert (=> b!537829 (=> (not res!332933) (not e!312003))))

(declare-fun lt!246570 () SeekEntryResult!4768)

(assert (=> b!537829 (= res!332933 (or (= lt!246570 (MissingZero!4768 i!1153)) (= lt!246570 (MissingVacant!4768 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34034 (_ BitVec 32)) SeekEntryResult!4768)

(assert (=> b!537829 (= lt!246570 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537830 () Bool)

(declare-fun res!332932 () Bool)

(assert (=> b!537830 (=> (not res!332932) (not e!312003))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537830 (= res!332932 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16718 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16718 a!3154)) (= (select (arr!16354 a!3154) resIndex!32) (select (arr!16354 a!3154) j!147))))))

(declare-fun b!537831 () Bool)

(declare-fun e!312002 () Bool)

(assert (=> b!537831 (= e!312003 e!312002)))

(declare-fun res!332930 () Bool)

(assert (=> b!537831 (=> (not res!332930) (not e!312002))))

(declare-fun lt!246571 () SeekEntryResult!4768)

(assert (=> b!537831 (= res!332930 (= lt!246571 (Intermediate!4768 false resIndex!32 resX!32)))))

(assert (=> b!537831 (= lt!246571 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16354 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537832 () Bool)

(assert (=> b!537832 (= e!312002 e!312001)))

(declare-fun res!332934 () Bool)

(assert (=> b!537832 (=> (not res!332934) (not e!312001))))

(assert (=> b!537832 (= res!332934 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246569 #b00000000000000000000000000000000) (bvslt lt!246569 (size!16718 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537832 (= lt!246569 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537833 () Bool)

(declare-fun res!332937 () Bool)

(assert (=> b!537833 (=> (not res!332937) (not e!312002))))

(assert (=> b!537833 (= res!332937 (and (not (= (select (arr!16354 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16354 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16354 a!3154) index!1177) (select (arr!16354 a!3154) j!147)))))))

(declare-fun res!332929 () Bool)

(assert (=> start!48874 (=> (not res!332929) (not e!311999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48874 (= res!332929 (validMask!0 mask!3216))))

(assert (=> start!48874 e!311999))

(assert (=> start!48874 true))

(declare-fun array_inv!12213 (array!34034) Bool)

(assert (=> start!48874 (array_inv!12213 a!3154)))

(declare-fun b!537834 () Bool)

(declare-fun res!332926 () Bool)

(assert (=> b!537834 (=> (not res!332926) (not e!311999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537834 (= res!332926 (validKeyInArray!0 k0!1998))))

(declare-fun b!537835 () Bool)

(declare-fun res!332931 () Bool)

(assert (=> b!537835 (=> (not res!332931) (not e!312003))))

(declare-datatypes ((List!10380 0))(
  ( (Nil!10377) (Cons!10376 (h!11322 (_ BitVec 64)) (t!16600 List!10380)) )
))
(declare-fun arrayNoDuplicates!0 (array!34034 (_ BitVec 32) List!10380) Bool)

(assert (=> b!537835 (= res!332931 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10377))))

(declare-fun b!537836 () Bool)

(declare-fun res!332935 () Bool)

(assert (=> b!537836 (=> (not res!332935) (not e!312002))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537836 (= res!332935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16354 a!3154) j!147) mask!3216) (select (arr!16354 a!3154) j!147) a!3154 mask!3216) lt!246571))))

(declare-fun b!537837 () Bool)

(declare-fun res!332936 () Bool)

(assert (=> b!537837 (=> (not res!332936) (not e!311999))))

(assert (=> b!537837 (= res!332936 (validKeyInArray!0 (select (arr!16354 a!3154) j!147)))))

(declare-fun b!537838 () Bool)

(declare-fun res!332928 () Bool)

(assert (=> b!537838 (=> (not res!332928) (not e!312003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34034 (_ BitVec 32)) Bool)

(assert (=> b!537838 (= res!332928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48874 res!332929) b!537826))

(assert (= (and b!537826 res!332927) b!537837))

(assert (= (and b!537837 res!332936) b!537834))

(assert (= (and b!537834 res!332926) b!537827))

(assert (= (and b!537827 res!332938) b!537829))

(assert (= (and b!537829 res!332933) b!537838))

(assert (= (and b!537838 res!332928) b!537835))

(assert (= (and b!537835 res!332931) b!537830))

(assert (= (and b!537830 res!332932) b!537831))

(assert (= (and b!537831 res!332930) b!537836))

(assert (= (and b!537836 res!332935) b!537833))

(assert (= (and b!537833 res!332937) b!537832))

(assert (= (and b!537832 res!332934) b!537828))

(declare-fun m!517147 () Bool)

(assert (=> b!537838 m!517147))

(declare-fun m!517149 () Bool)

(assert (=> b!537836 m!517149))

(assert (=> b!537836 m!517149))

(declare-fun m!517151 () Bool)

(assert (=> b!537836 m!517151))

(assert (=> b!537836 m!517151))

(assert (=> b!537836 m!517149))

(declare-fun m!517153 () Bool)

(assert (=> b!537836 m!517153))

(assert (=> b!537831 m!517149))

(assert (=> b!537831 m!517149))

(declare-fun m!517155 () Bool)

(assert (=> b!537831 m!517155))

(declare-fun m!517157 () Bool)

(assert (=> b!537834 m!517157))

(declare-fun m!517159 () Bool)

(assert (=> start!48874 m!517159))

(declare-fun m!517161 () Bool)

(assert (=> start!48874 m!517161))

(declare-fun m!517163 () Bool)

(assert (=> b!537829 m!517163))

(declare-fun m!517165 () Bool)

(assert (=> b!537827 m!517165))

(declare-fun m!517167 () Bool)

(assert (=> b!537830 m!517167))

(assert (=> b!537830 m!517149))

(declare-fun m!517169 () Bool)

(assert (=> b!537833 m!517169))

(assert (=> b!537833 m!517149))

(assert (=> b!537837 m!517149))

(assert (=> b!537837 m!517149))

(declare-fun m!517171 () Bool)

(assert (=> b!537837 m!517171))

(declare-fun m!517173 () Bool)

(assert (=> b!537832 m!517173))

(declare-fun m!517175 () Bool)

(assert (=> b!537835 m!517175))

(assert (=> b!537828 m!517149))

(assert (=> b!537828 m!517149))

(declare-fun m!517177 () Bool)

(assert (=> b!537828 m!517177))

(check-sat (not b!537827) (not b!537829) (not b!537832) (not start!48874) (not b!537837) (not b!537831) (not b!537838) (not b!537834) (not b!537828) (not b!537836) (not b!537835))
(check-sat)
