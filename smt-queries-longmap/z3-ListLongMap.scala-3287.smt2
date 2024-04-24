; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45656 () Bool)

(assert start!45656)

(declare-fun b!503850 () Bool)

(declare-fun res!305156 () Bool)

(declare-fun e!295041 () Bool)

(assert (=> b!503850 (=> (not res!305156) (not e!295041))))

(declare-datatypes ((array!32413 0))(
  ( (array!32414 (arr!15586 (Array (_ BitVec 32) (_ BitVec 64))) (size!15950 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32413)

(declare-datatypes ((List!9651 0))(
  ( (Nil!9648) (Cons!9647 (h!10524 (_ BitVec 64)) (t!15871 List!9651)) )
))
(declare-fun arrayNoDuplicates!0 (array!32413 (_ BitVec 32) List!9651) Bool)

(assert (=> b!503850 (= res!305156 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9648))))

(declare-fun b!503851 () Bool)

(declare-fun e!295033 () Bool)

(assert (=> b!503851 (= e!295041 (not e!295033))))

(declare-fun res!305159 () Bool)

(assert (=> b!503851 (=> res!305159 e!295033)))

(declare-fun lt!229347 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4009 0))(
  ( (MissingZero!4009 (index!18224 (_ BitVec 32))) (Found!4009 (index!18225 (_ BitVec 32))) (Intermediate!4009 (undefined!4821 Bool) (index!18226 (_ BitVec 32)) (x!47391 (_ BitVec 32))) (Undefined!4009) (MissingVacant!4009 (index!18227 (_ BitVec 32))) )
))
(declare-fun lt!229341 () SeekEntryResult!4009)

(declare-fun lt!229351 () array!32413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32413 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!503851 (= res!305159 (= lt!229341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229347 lt!229348 lt!229351 mask!3524)))))

(declare-fun lt!229350 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503851 (= lt!229341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229350 (select (arr!15586 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503851 (= lt!229347 (toIndex!0 lt!229348 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503851 (= lt!229348 (select (store (arr!15586 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503851 (= lt!229350 (toIndex!0 (select (arr!15586 a!3235) j!176) mask!3524))))

(assert (=> b!503851 (= lt!229351 (array!32414 (store (arr!15586 a!3235) i!1204 k0!2280) (size!15950 a!3235)))))

(declare-fun e!295040 () Bool)

(assert (=> b!503851 e!295040))

(declare-fun res!305155 () Bool)

(assert (=> b!503851 (=> (not res!305155) (not e!295040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32413 (_ BitVec 32)) Bool)

(assert (=> b!503851 (= res!305155 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15271 0))(
  ( (Unit!15272) )
))
(declare-fun lt!229342 () Unit!15271)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15271)

(assert (=> b!503851 (= lt!229342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503852 () Bool)

(declare-fun e!295038 () Bool)

(assert (=> b!503852 (= e!295033 e!295038)))

(declare-fun res!305149 () Bool)

(assert (=> b!503852 (=> res!305149 e!295038)))

(assert (=> b!503852 (= res!305149 (or (bvsgt (x!47391 lt!229341) #b01111111111111111111111111111110) (bvslt lt!229350 #b00000000000000000000000000000000) (bvsge lt!229350 (size!15950 a!3235)) (bvslt (index!18226 lt!229341) #b00000000000000000000000000000000) (bvsge (index!18226 lt!229341) (size!15950 a!3235)) (not (= lt!229341 (Intermediate!4009 false (index!18226 lt!229341) (x!47391 lt!229341))))))))

(assert (=> b!503852 (= (index!18226 lt!229341) i!1204)))

(declare-fun lt!229343 () Unit!15271)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15271)

(assert (=> b!503852 (= lt!229343 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229350 #b00000000000000000000000000000000 (index!18226 lt!229341) (x!47391 lt!229341) mask!3524))))

(assert (=> b!503852 (and (or (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229344 () Unit!15271)

(declare-fun e!295037 () Unit!15271)

(assert (=> b!503852 (= lt!229344 e!295037)))

(declare-fun c!59630 () Bool)

(assert (=> b!503852 (= c!59630 (= (select (arr!15586 a!3235) (index!18226 lt!229341)) (select (arr!15586 a!3235) j!176)))))

(assert (=> b!503852 (and (bvslt (x!47391 lt!229341) #b01111111111111111111111111111110) (or (= (select (arr!15586 a!3235) (index!18226 lt!229341)) (select (arr!15586 a!3235) j!176)) (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15586 a!3235) (index!18226 lt!229341)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503853 () Bool)

(declare-fun res!305154 () Bool)

(declare-fun e!295035 () Bool)

(assert (=> b!503853 (=> (not res!305154) (not e!295035))))

(assert (=> b!503853 (= res!305154 (and (= (size!15950 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15950 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15950 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503854 () Bool)

(assert (=> b!503854 (= e!295038 true)))

(declare-fun lt!229345 () SeekEntryResult!4009)

(assert (=> b!503854 (= lt!229345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229350 lt!229348 lt!229351 mask!3524))))

(declare-fun b!503855 () Bool)

(declare-fun res!305150 () Bool)

(assert (=> b!503855 (=> res!305150 e!295033)))

(get-info :version)

(assert (=> b!503855 (= res!305150 (or (undefined!4821 lt!229341) (not ((_ is Intermediate!4009) lt!229341))))))

(declare-fun b!503856 () Bool)

(declare-fun e!295039 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32413 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!503856 (= e!295039 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229350 (index!18226 lt!229341) (select (arr!15586 a!3235) j!176) a!3235 mask!3524) (Found!4009 j!176))))))

(declare-fun b!503857 () Bool)

(declare-fun res!305152 () Bool)

(assert (=> b!503857 (=> (not res!305152) (not e!295035))))

(declare-fun arrayContainsKey!0 (array!32413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503857 (= res!305152 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503858 () Bool)

(declare-fun res!305147 () Bool)

(assert (=> b!503858 (=> res!305147 e!295038)))

(assert (=> b!503858 (= res!305147 e!295039)))

(declare-fun res!305160 () Bool)

(assert (=> b!503858 (=> (not res!305160) (not e!295039))))

(assert (=> b!503858 (= res!305160 (bvsgt #b00000000000000000000000000000000 (x!47391 lt!229341)))))

(declare-fun res!305158 () Bool)

(assert (=> start!45656 (=> (not res!305158) (not e!295035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45656 (= res!305158 (validMask!0 mask!3524))))

(assert (=> start!45656 e!295035))

(assert (=> start!45656 true))

(declare-fun array_inv!11445 (array!32413) Bool)

(assert (=> start!45656 (array_inv!11445 a!3235)))

(declare-fun b!503859 () Bool)

(declare-fun Unit!15273 () Unit!15271)

(assert (=> b!503859 (= e!295037 Unit!15273)))

(declare-fun b!503860 () Bool)

(declare-fun res!305161 () Bool)

(assert (=> b!503860 (=> (not res!305161) (not e!295035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503860 (= res!305161 (validKeyInArray!0 (select (arr!15586 a!3235) j!176)))))

(declare-fun b!503861 () Bool)

(assert (=> b!503861 (= e!295035 e!295041)))

(declare-fun res!305157 () Bool)

(assert (=> b!503861 (=> (not res!305157) (not e!295041))))

(declare-fun lt!229349 () SeekEntryResult!4009)

(assert (=> b!503861 (= res!305157 (or (= lt!229349 (MissingZero!4009 i!1204)) (= lt!229349 (MissingVacant!4009 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32413 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!503861 (= lt!229349 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503862 () Bool)

(declare-fun e!295036 () Bool)

(assert (=> b!503862 (= e!295036 false)))

(declare-fun b!503863 () Bool)

(declare-fun res!305151 () Bool)

(assert (=> b!503863 (=> (not res!305151) (not e!295041))))

(assert (=> b!503863 (= res!305151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503864 () Bool)

(declare-fun res!305153 () Bool)

(assert (=> b!503864 (=> (not res!305153) (not e!295035))))

(assert (=> b!503864 (= res!305153 (validKeyInArray!0 k0!2280))))

(declare-fun b!503865 () Bool)

(assert (=> b!503865 (= e!295040 (= (seekEntryOrOpen!0 (select (arr!15586 a!3235) j!176) a!3235 mask!3524) (Found!4009 j!176)))))

(declare-fun b!503866 () Bool)

(declare-fun Unit!15274 () Unit!15271)

(assert (=> b!503866 (= e!295037 Unit!15274)))

(declare-fun lt!229346 () Unit!15271)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15271)

(assert (=> b!503866 (= lt!229346 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229350 #b00000000000000000000000000000000 (index!18226 lt!229341) (x!47391 lt!229341) mask!3524))))

(declare-fun res!305148 () Bool)

(assert (=> b!503866 (= res!305148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229350 lt!229348 lt!229351 mask!3524) (Intermediate!4009 false (index!18226 lt!229341) (x!47391 lt!229341))))))

(assert (=> b!503866 (=> (not res!305148) (not e!295036))))

(assert (=> b!503866 e!295036))

(assert (= (and start!45656 res!305158) b!503853))

(assert (= (and b!503853 res!305154) b!503860))

(assert (= (and b!503860 res!305161) b!503864))

(assert (= (and b!503864 res!305153) b!503857))

(assert (= (and b!503857 res!305152) b!503861))

(assert (= (and b!503861 res!305157) b!503863))

(assert (= (and b!503863 res!305151) b!503850))

(assert (= (and b!503850 res!305156) b!503851))

(assert (= (and b!503851 res!305155) b!503865))

(assert (= (and b!503851 (not res!305159)) b!503855))

(assert (= (and b!503855 (not res!305150)) b!503852))

(assert (= (and b!503852 c!59630) b!503866))

(assert (= (and b!503852 (not c!59630)) b!503859))

(assert (= (and b!503866 res!305148) b!503862))

(assert (= (and b!503852 (not res!305149)) b!503858))

(assert (= (and b!503858 res!305160) b!503856))

(assert (= (and b!503858 (not res!305147)) b!503854))

(declare-fun m!484885 () Bool)

(assert (=> b!503854 m!484885))

(declare-fun m!484887 () Bool)

(assert (=> b!503856 m!484887))

(assert (=> b!503856 m!484887))

(declare-fun m!484889 () Bool)

(assert (=> b!503856 m!484889))

(declare-fun m!484891 () Bool)

(assert (=> b!503864 m!484891))

(declare-fun m!484893 () Bool)

(assert (=> b!503851 m!484893))

(declare-fun m!484895 () Bool)

(assert (=> b!503851 m!484895))

(declare-fun m!484897 () Bool)

(assert (=> b!503851 m!484897))

(assert (=> b!503851 m!484887))

(declare-fun m!484899 () Bool)

(assert (=> b!503851 m!484899))

(declare-fun m!484901 () Bool)

(assert (=> b!503851 m!484901))

(assert (=> b!503851 m!484887))

(declare-fun m!484903 () Bool)

(assert (=> b!503851 m!484903))

(assert (=> b!503851 m!484887))

(declare-fun m!484905 () Bool)

(assert (=> b!503851 m!484905))

(declare-fun m!484907 () Bool)

(assert (=> b!503851 m!484907))

(declare-fun m!484909 () Bool)

(assert (=> b!503850 m!484909))

(declare-fun m!484911 () Bool)

(assert (=> b!503861 m!484911))

(assert (=> b!503865 m!484887))

(assert (=> b!503865 m!484887))

(declare-fun m!484913 () Bool)

(assert (=> b!503865 m!484913))

(declare-fun m!484915 () Bool)

(assert (=> start!45656 m!484915))

(declare-fun m!484917 () Bool)

(assert (=> start!45656 m!484917))

(declare-fun m!484919 () Bool)

(assert (=> b!503857 m!484919))

(assert (=> b!503860 m!484887))

(assert (=> b!503860 m!484887))

(declare-fun m!484921 () Bool)

(assert (=> b!503860 m!484921))

(declare-fun m!484923 () Bool)

(assert (=> b!503866 m!484923))

(assert (=> b!503866 m!484885))

(declare-fun m!484925 () Bool)

(assert (=> b!503852 m!484925))

(declare-fun m!484927 () Bool)

(assert (=> b!503852 m!484927))

(assert (=> b!503852 m!484887))

(declare-fun m!484929 () Bool)

(assert (=> b!503863 m!484929))

(check-sat (not b!503852) (not start!45656) (not b!503863) (not b!503864) (not b!503851) (not b!503856) (not b!503865) (not b!503857) (not b!503860) (not b!503866) (not b!503854) (not b!503850) (not b!503861))
(check-sat)
