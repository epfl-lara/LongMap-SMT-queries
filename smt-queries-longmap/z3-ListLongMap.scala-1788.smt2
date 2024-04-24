; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32414 () Bool)

(assert start!32414)

(declare-fun b!323823 () Bool)

(declare-fun res!177255 () Bool)

(declare-fun e!200066 () Bool)

(assert (=> b!323823 (=> (not res!177255) (not e!200066))))

(declare-datatypes ((array!16566 0))(
  ( (array!16567 (arr!7840 (Array (_ BitVec 32) (_ BitVec 64))) (size!8192 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16566)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323823 (= res!177255 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7840 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323824 () Bool)

(declare-datatypes ((Unit!10029 0))(
  ( (Unit!10030) )
))
(declare-fun e!200064 () Unit!10029)

(declare-fun Unit!10031 () Unit!10029)

(assert (=> b!323824 (= e!200064 Unit!10031)))

(declare-fun b!323825 () Bool)

(declare-fun res!177250 () Bool)

(declare-fun e!200065 () Bool)

(assert (=> b!323825 (=> (not res!177250) (not e!200065))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323825 (= res!177250 (and (= (size!8192 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8192 a!3305))))))

(declare-fun b!323826 () Bool)

(declare-fun res!177247 () Bool)

(assert (=> b!323826 (=> (not res!177247) (not e!200065))))

(declare-fun arrayContainsKey!0 (array!16566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323826 (= res!177247 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323827 () Bool)

(declare-fun res!177252 () Bool)

(assert (=> b!323827 (=> (not res!177252) (not e!200065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16566 (_ BitVec 32)) Bool)

(assert (=> b!323827 (= res!177252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323828 () Bool)

(assert (=> b!323828 false))

(declare-fun e!200063 () Unit!10029)

(declare-fun Unit!10032 () Unit!10029)

(assert (=> b!323828 (= e!200063 Unit!10032)))

(declare-fun b!323829 () Bool)

(assert (=> b!323829 (= e!200066 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323829 (= index!1840 resIndex!58)))

(declare-fun lt!156737 () Unit!10029)

(declare-fun e!200062 () Unit!10029)

(assert (=> b!323829 (= lt!156737 e!200062)))

(declare-fun c!50918 () Bool)

(assert (=> b!323829 (= c!50918 (not (= resIndex!58 index!1840)))))

(declare-fun b!323830 () Bool)

(assert (=> b!323830 (= e!200065 e!200066)))

(declare-fun res!177248 () Bool)

(assert (=> b!323830 (=> (not res!177248) (not e!200066))))

(declare-datatypes ((SeekEntryResult!2936 0))(
  ( (MissingZero!2936 (index!13920 (_ BitVec 32))) (Found!2936 (index!13921 (_ BitVec 32))) (Intermediate!2936 (undefined!3748 Bool) (index!13922 (_ BitVec 32)) (x!32281 (_ BitVec 32))) (Undefined!2936) (MissingVacant!2936 (index!13923 (_ BitVec 32))) )
))
(declare-fun lt!156736 () SeekEntryResult!2936)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16566 (_ BitVec 32)) SeekEntryResult!2936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323830 (= res!177248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156736))))

(assert (=> b!323830 (= lt!156736 (Intermediate!2936 false resIndex!58 resX!58))))

(declare-fun b!323831 () Bool)

(declare-fun res!177246 () Bool)

(assert (=> b!323831 (=> (not res!177246) (not e!200065))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16566 (_ BitVec 32)) SeekEntryResult!2936)

(assert (=> b!323831 (= res!177246 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2936 i!1250)))))

(declare-fun b!323832 () Bool)

(declare-fun Unit!10033 () Unit!10029)

(assert (=> b!323832 (= e!200062 Unit!10033)))

(declare-fun res!177253 () Bool)

(assert (=> start!32414 (=> (not res!177253) (not e!200065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32414 (= res!177253 (validMask!0 mask!3777))))

(assert (=> start!32414 e!200065))

(declare-fun array_inv!5790 (array!16566) Bool)

(assert (=> start!32414 (array_inv!5790 a!3305)))

(assert (=> start!32414 true))

(declare-fun b!323833 () Bool)

(declare-fun res!177249 () Bool)

(assert (=> b!323833 (=> (not res!177249) (not e!200065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323833 (= res!177249 (validKeyInArray!0 k0!2497))))

(declare-fun b!323834 () Bool)

(assert (=> b!323834 (= e!200062 e!200063)))

(declare-fun c!50916 () Bool)

(assert (=> b!323834 (= c!50916 (or (= (select (arr!7840 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7840 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323835 () Bool)

(assert (=> b!323835 false))

(declare-fun lt!156738 () Unit!10029)

(assert (=> b!323835 (= lt!156738 e!200064)))

(declare-fun c!50917 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323835 (= c!50917 ((_ is Intermediate!2936) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10034 () Unit!10029)

(assert (=> b!323835 (= e!200063 Unit!10034)))

(declare-fun b!323836 () Bool)

(declare-fun Unit!10035 () Unit!10029)

(assert (=> b!323836 (= e!200064 Unit!10035)))

(assert (=> b!323836 false))

(declare-fun b!323837 () Bool)

(declare-fun res!177251 () Bool)

(assert (=> b!323837 (=> (not res!177251) (not e!200066))))

(assert (=> b!323837 (= res!177251 (and (= (select (arr!7840 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8192 a!3305))))))

(declare-fun b!323838 () Bool)

(declare-fun res!177254 () Bool)

(assert (=> b!323838 (=> (not res!177254) (not e!200066))))

(assert (=> b!323838 (= res!177254 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156736))))

(assert (= (and start!32414 res!177253) b!323825))

(assert (= (and b!323825 res!177250) b!323833))

(assert (= (and b!323833 res!177249) b!323826))

(assert (= (and b!323826 res!177247) b!323831))

(assert (= (and b!323831 res!177246) b!323827))

(assert (= (and b!323827 res!177252) b!323830))

(assert (= (and b!323830 res!177248) b!323837))

(assert (= (and b!323837 res!177251) b!323838))

(assert (= (and b!323838 res!177254) b!323823))

(assert (= (and b!323823 res!177255) b!323829))

(assert (= (and b!323829 c!50918) b!323834))

(assert (= (and b!323829 (not c!50918)) b!323832))

(assert (= (and b!323834 c!50916) b!323828))

(assert (= (and b!323834 (not c!50916)) b!323835))

(assert (= (and b!323835 c!50917) b!323824))

(assert (= (and b!323835 (not c!50917)) b!323836))

(declare-fun m!331237 () Bool)

(assert (=> b!323823 m!331237))

(declare-fun m!331239 () Bool)

(assert (=> b!323833 m!331239))

(declare-fun m!331241 () Bool)

(assert (=> b!323837 m!331241))

(declare-fun m!331243 () Bool)

(assert (=> b!323838 m!331243))

(declare-fun m!331245 () Bool)

(assert (=> b!323826 m!331245))

(declare-fun m!331247 () Bool)

(assert (=> start!32414 m!331247))

(declare-fun m!331249 () Bool)

(assert (=> start!32414 m!331249))

(declare-fun m!331251 () Bool)

(assert (=> b!323827 m!331251))

(assert (=> b!323834 m!331237))

(declare-fun m!331253 () Bool)

(assert (=> b!323831 m!331253))

(declare-fun m!331255 () Bool)

(assert (=> b!323830 m!331255))

(assert (=> b!323830 m!331255))

(declare-fun m!331257 () Bool)

(assert (=> b!323830 m!331257))

(declare-fun m!331259 () Bool)

(assert (=> b!323835 m!331259))

(assert (=> b!323835 m!331259))

(declare-fun m!331261 () Bool)

(assert (=> b!323835 m!331261))

(check-sat (not start!32414) (not b!323833) (not b!323827) (not b!323830) (not b!323831) (not b!323826) (not b!323835) (not b!323838))
(check-sat)
