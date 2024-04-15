; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47376 () Bool)

(assert start!47376)

(declare-fun b!520845 () Bool)

(declare-fun res!318840 () Bool)

(declare-fun e!303879 () Bool)

(assert (=> b!520845 (=> (not res!318840) (not e!303879))))

(declare-datatypes ((array!33212 0))(
  ( (array!33213 (arr!15962 (Array (_ BitVec 32) (_ BitVec 64))) (size!16327 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33212)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520845 (= res!318840 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!520846 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!303881 () Bool)

(declare-datatypes ((SeekEntryResult!4426 0))(
  ( (MissingZero!4426 (index!19907 (_ BitVec 32))) (Found!4426 (index!19908 (_ BitVec 32))) (Intermediate!4426 (undefined!5238 Bool) (index!19909 (_ BitVec 32)) (x!48903 (_ BitVec 32))) (Undefined!4426) (MissingVacant!4426 (index!19910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33212 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!520846 (= e!303881 (= (seekEntryOrOpen!0 (select (arr!15962 a!3235) j!176) a!3235 mask!3524) (Found!4426 j!176)))))

(declare-fun b!520847 () Bool)

(declare-fun res!318835 () Bool)

(assert (=> b!520847 (=> (not res!318835) (not e!303879))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520847 (= res!318835 (and (= (size!16327 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16327 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16327 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520848 () Bool)

(declare-fun res!318837 () Bool)

(declare-fun e!303885 () Bool)

(assert (=> b!520848 (=> (not res!318837) (not e!303885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33212 (_ BitVec 32)) Bool)

(assert (=> b!520848 (= res!318837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520849 () Bool)

(declare-fun res!318834 () Bool)

(assert (=> b!520849 (=> (not res!318834) (not e!303879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520849 (= res!318834 (validKeyInArray!0 (select (arr!15962 a!3235) j!176)))))

(declare-fun b!520850 () Bool)

(declare-fun res!318842 () Bool)

(assert (=> b!520850 (=> (not res!318842) (not e!303885))))

(declare-datatypes ((List!10159 0))(
  ( (Nil!10156) (Cons!10155 (h!11077 (_ BitVec 64)) (t!16378 List!10159)) )
))
(declare-fun arrayNoDuplicates!0 (array!33212 (_ BitVec 32) List!10159) Bool)

(assert (=> b!520850 (= res!318842 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10156))))

(declare-fun b!520851 () Bool)

(declare-fun e!303884 () Bool)

(assert (=> b!520851 (= e!303884 true)))

(declare-fun lt!238524 () SeekEntryResult!4426)

(assert (=> b!520851 (and (or (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16150 0))(
  ( (Unit!16151) )
))
(declare-fun lt!238521 () Unit!16150)

(declare-fun e!303880 () Unit!16150)

(assert (=> b!520851 (= lt!238521 e!303880)))

(declare-fun c!61308 () Bool)

(assert (=> b!520851 (= c!61308 (= (select (arr!15962 a!3235) (index!19909 lt!238524)) (select (arr!15962 a!3235) j!176)))))

(assert (=> b!520851 (and (bvslt (x!48903 lt!238524) #b01111111111111111111111111111110) (or (= (select (arr!15962 a!3235) (index!19909 lt!238524)) (select (arr!15962 a!3235) j!176)) (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15962 a!3235) (index!19909 lt!238524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520852 () Bool)

(declare-fun Unit!16152 () Unit!16150)

(assert (=> b!520852 (= e!303880 Unit!16152)))

(declare-fun b!520853 () Bool)

(declare-fun res!318839 () Bool)

(assert (=> b!520853 (=> res!318839 e!303884)))

(get-info :version)

(assert (=> b!520853 (= res!318839 (or (undefined!5238 lt!238524) (not ((_ is Intermediate!4426) lt!238524))))))

(declare-fun b!520854 () Bool)

(assert (=> b!520854 (= e!303885 (not e!303884))))

(declare-fun res!318838 () Bool)

(assert (=> b!520854 (=> res!318838 e!303884)))

(declare-fun lt!238518 () (_ BitVec 32))

(declare-fun lt!238525 () array!33212)

(declare-fun lt!238522 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33212 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!520854 (= res!318838 (= lt!238524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238518 lt!238522 lt!238525 mask!3524)))))

(declare-fun lt!238517 () (_ BitVec 32))

(assert (=> b!520854 (= lt!238524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238517 (select (arr!15962 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520854 (= lt!238518 (toIndex!0 lt!238522 mask!3524))))

(assert (=> b!520854 (= lt!238522 (select (store (arr!15962 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520854 (= lt!238517 (toIndex!0 (select (arr!15962 a!3235) j!176) mask!3524))))

(assert (=> b!520854 (= lt!238525 (array!33213 (store (arr!15962 a!3235) i!1204 k0!2280) (size!16327 a!3235)))))

(assert (=> b!520854 e!303881))

(declare-fun res!318833 () Bool)

(assert (=> b!520854 (=> (not res!318833) (not e!303881))))

(assert (=> b!520854 (= res!318833 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238520 () Unit!16150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16150)

(assert (=> b!520854 (= lt!238520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!318836 () Bool)

(assert (=> start!47376 (=> (not res!318836) (not e!303879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47376 (= res!318836 (validMask!0 mask!3524))))

(assert (=> start!47376 e!303879))

(assert (=> start!47376 true))

(declare-fun array_inv!11845 (array!33212) Bool)

(assert (=> start!47376 (array_inv!11845 a!3235)))

(declare-fun b!520855 () Bool)

(assert (=> b!520855 (= e!303879 e!303885)))

(declare-fun res!318841 () Bool)

(assert (=> b!520855 (=> (not res!318841) (not e!303885))))

(declare-fun lt!238523 () SeekEntryResult!4426)

(assert (=> b!520855 (= res!318841 (or (= lt!238523 (MissingZero!4426 i!1204)) (= lt!238523 (MissingVacant!4426 i!1204))))))

(assert (=> b!520855 (= lt!238523 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520856 () Bool)

(declare-fun e!303883 () Bool)

(assert (=> b!520856 (= e!303883 false)))

(declare-fun b!520857 () Bool)

(declare-fun res!318832 () Bool)

(assert (=> b!520857 (=> (not res!318832) (not e!303879))))

(assert (=> b!520857 (= res!318832 (validKeyInArray!0 k0!2280))))

(declare-fun b!520858 () Bool)

(declare-fun Unit!16153 () Unit!16150)

(assert (=> b!520858 (= e!303880 Unit!16153)))

(declare-fun lt!238519 () Unit!16150)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16150)

(assert (=> b!520858 (= lt!238519 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238517 #b00000000000000000000000000000000 (index!19909 lt!238524) (x!48903 lt!238524) mask!3524))))

(declare-fun res!318831 () Bool)

(assert (=> b!520858 (= res!318831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238517 lt!238522 lt!238525 mask!3524) (Intermediate!4426 false (index!19909 lt!238524) (x!48903 lt!238524))))))

(assert (=> b!520858 (=> (not res!318831) (not e!303883))))

(assert (=> b!520858 e!303883))

(assert (= (and start!47376 res!318836) b!520847))

(assert (= (and b!520847 res!318835) b!520849))

(assert (= (and b!520849 res!318834) b!520857))

(assert (= (and b!520857 res!318832) b!520845))

(assert (= (and b!520845 res!318840) b!520855))

(assert (= (and b!520855 res!318841) b!520848))

(assert (= (and b!520848 res!318837) b!520850))

(assert (= (and b!520850 res!318842) b!520854))

(assert (= (and b!520854 res!318833) b!520846))

(assert (= (and b!520854 (not res!318838)) b!520853))

(assert (= (and b!520853 (not res!318839)) b!520851))

(assert (= (and b!520851 c!61308) b!520858))

(assert (= (and b!520851 (not c!61308)) b!520852))

(assert (= (and b!520858 res!318831) b!520856))

(declare-fun m!501277 () Bool)

(assert (=> b!520854 m!501277))

(declare-fun m!501279 () Bool)

(assert (=> b!520854 m!501279))

(declare-fun m!501281 () Bool)

(assert (=> b!520854 m!501281))

(declare-fun m!501283 () Bool)

(assert (=> b!520854 m!501283))

(declare-fun m!501285 () Bool)

(assert (=> b!520854 m!501285))

(assert (=> b!520854 m!501283))

(declare-fun m!501287 () Bool)

(assert (=> b!520854 m!501287))

(declare-fun m!501289 () Bool)

(assert (=> b!520854 m!501289))

(declare-fun m!501291 () Bool)

(assert (=> b!520854 m!501291))

(assert (=> b!520854 m!501283))

(declare-fun m!501293 () Bool)

(assert (=> b!520854 m!501293))

(declare-fun m!501295 () Bool)

(assert (=> b!520850 m!501295))

(assert (=> b!520846 m!501283))

(assert (=> b!520846 m!501283))

(declare-fun m!501297 () Bool)

(assert (=> b!520846 m!501297))

(declare-fun m!501299 () Bool)

(assert (=> start!47376 m!501299))

(declare-fun m!501301 () Bool)

(assert (=> start!47376 m!501301))

(declare-fun m!501303 () Bool)

(assert (=> b!520858 m!501303))

(declare-fun m!501305 () Bool)

(assert (=> b!520858 m!501305))

(assert (=> b!520849 m!501283))

(assert (=> b!520849 m!501283))

(declare-fun m!501307 () Bool)

(assert (=> b!520849 m!501307))

(declare-fun m!501309 () Bool)

(assert (=> b!520855 m!501309))

(declare-fun m!501311 () Bool)

(assert (=> b!520857 m!501311))

(declare-fun m!501313 () Bool)

(assert (=> b!520851 m!501313))

(assert (=> b!520851 m!501283))

(declare-fun m!501315 () Bool)

(assert (=> b!520848 m!501315))

(declare-fun m!501317 () Bool)

(assert (=> b!520845 m!501317))

(check-sat (not b!520854) (not b!520846) (not b!520848) (not b!520857) (not b!520845) (not b!520855) (not b!520849) (not b!520850) (not b!520858) (not start!47376))
(check-sat)
