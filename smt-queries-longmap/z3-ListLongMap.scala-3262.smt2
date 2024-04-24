; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45434 () Bool)

(assert start!45434)

(declare-fun b!499892 () Bool)

(declare-fun res!301848 () Bool)

(declare-fun e!292911 () Bool)

(assert (=> b!499892 (=> res!301848 e!292911)))

(declare-datatypes ((SeekEntryResult!3934 0))(
  ( (MissingZero!3934 (index!17918 (_ BitVec 32))) (Found!3934 (index!17919 (_ BitVec 32))) (Intermediate!3934 (undefined!4746 Bool) (index!17920 (_ BitVec 32)) (x!47104 (_ BitVec 32))) (Undefined!3934) (MissingVacant!3934 (index!17921 (_ BitVec 32))) )
))
(declare-fun lt!226804 () SeekEntryResult!3934)

(get-info :version)

(assert (=> b!499892 (= res!301848 (or (undefined!4746 lt!226804) (not ((_ is Intermediate!3934) lt!226804))))))

(declare-fun b!499893 () Bool)

(declare-fun e!292904 () Bool)

(assert (=> b!499893 (= e!292911 e!292904)))

(declare-fun res!301849 () Bool)

(assert (=> b!499893 (=> res!301849 e!292904)))

(declare-datatypes ((array!32260 0))(
  ( (array!32261 (arr!15511 (Array (_ BitVec 32) (_ BitVec 64))) (size!15875 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32260)

(declare-fun lt!226807 () (_ BitVec 32))

(assert (=> b!499893 (= res!301849 (or (bvsgt #b00000000000000000000000000000000 (x!47104 lt!226804)) (bvsgt (x!47104 lt!226804) #b01111111111111111111111111111110) (bvslt lt!226807 #b00000000000000000000000000000000) (bvsge lt!226807 (size!15875 a!3235)) (bvslt (index!17920 lt!226804) #b00000000000000000000000000000000) (bvsge (index!17920 lt!226804) (size!15875 a!3235)) (not (= lt!226804 (Intermediate!3934 false (index!17920 lt!226804) (x!47104 lt!226804))))))))

(assert (=> b!499893 (and (or (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14971 0))(
  ( (Unit!14972) )
))
(declare-fun lt!226810 () Unit!14971)

(declare-fun e!292910 () Unit!14971)

(assert (=> b!499893 (= lt!226810 e!292910)))

(declare-fun c!59303 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499893 (= c!59303 (= (select (arr!15511 a!3235) (index!17920 lt!226804)) (select (arr!15511 a!3235) j!176)))))

(assert (=> b!499893 (and (bvslt (x!47104 lt!226804) #b01111111111111111111111111111110) (or (= (select (arr!15511 a!3235) (index!17920 lt!226804)) (select (arr!15511 a!3235) j!176)) (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15511 a!3235) (index!17920 lt!226804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499894 () Bool)

(declare-fun Unit!14973 () Unit!14971)

(assert (=> b!499894 (= e!292910 Unit!14973)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226808 () Unit!14971)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14971)

(assert (=> b!499894 (= lt!226808 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226807 #b00000000000000000000000000000000 (index!17920 lt!226804) (x!47104 lt!226804) mask!3524))))

(declare-fun lt!226806 () (_ BitVec 64))

(declare-fun lt!226809 () array!32260)

(declare-fun res!301851 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32260 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!499894 (= res!301851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226807 lt!226806 lt!226809 mask!3524) (Intermediate!3934 false (index!17920 lt!226804) (x!47104 lt!226804))))))

(declare-fun e!292909 () Bool)

(assert (=> b!499894 (=> (not res!301851) (not e!292909))))

(assert (=> b!499894 e!292909))

(declare-fun b!499895 () Bool)

(assert (=> b!499895 (= e!292904 true)))

(declare-fun lt!226805 () SeekEntryResult!3934)

(assert (=> b!499895 (= lt!226805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226807 lt!226806 lt!226809 mask!3524))))

(declare-fun b!499896 () Bool)

(declare-fun res!301847 () Bool)

(declare-fun e!292908 () Bool)

(assert (=> b!499896 (=> (not res!301847) (not e!292908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499896 (= res!301847 (validKeyInArray!0 k0!2280))))

(declare-fun b!499897 () Bool)

(declare-fun res!301852 () Bool)

(assert (=> b!499897 (=> (not res!301852) (not e!292908))))

(assert (=> b!499897 (= res!301852 (validKeyInArray!0 (select (arr!15511 a!3235) j!176)))))

(declare-fun b!499898 () Bool)

(declare-fun res!301845 () Bool)

(assert (=> b!499898 (=> (not res!301845) (not e!292908))))

(assert (=> b!499898 (= res!301845 (and (= (size!15875 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15875 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15875 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!292906 () Bool)

(declare-fun b!499899 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32260 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!499899 (= e!292906 (= (seekEntryOrOpen!0 (select (arr!15511 a!3235) j!176) a!3235 mask!3524) (Found!3934 j!176)))))

(declare-fun b!499900 () Bool)

(declare-fun e!292907 () Bool)

(assert (=> b!499900 (= e!292907 (not e!292911))))

(declare-fun res!301842 () Bool)

(assert (=> b!499900 (=> res!301842 e!292911)))

(declare-fun lt!226803 () (_ BitVec 32))

(assert (=> b!499900 (= res!301842 (= lt!226804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226803 lt!226806 lt!226809 mask!3524)))))

(assert (=> b!499900 (= lt!226804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226807 (select (arr!15511 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499900 (= lt!226803 (toIndex!0 lt!226806 mask!3524))))

(assert (=> b!499900 (= lt!226806 (select (store (arr!15511 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499900 (= lt!226807 (toIndex!0 (select (arr!15511 a!3235) j!176) mask!3524))))

(assert (=> b!499900 (= lt!226809 (array!32261 (store (arr!15511 a!3235) i!1204 k0!2280) (size!15875 a!3235)))))

(assert (=> b!499900 e!292906))

(declare-fun res!301840 () Bool)

(assert (=> b!499900 (=> (not res!301840) (not e!292906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32260 (_ BitVec 32)) Bool)

(assert (=> b!499900 (= res!301840 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226801 () Unit!14971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14971)

(assert (=> b!499900 (= lt!226801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499901 () Bool)

(assert (=> b!499901 (= e!292908 e!292907)))

(declare-fun res!301841 () Bool)

(assert (=> b!499901 (=> (not res!301841) (not e!292907))))

(declare-fun lt!226802 () SeekEntryResult!3934)

(assert (=> b!499901 (= res!301841 (or (= lt!226802 (MissingZero!3934 i!1204)) (= lt!226802 (MissingVacant!3934 i!1204))))))

(assert (=> b!499901 (= lt!226802 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499902 () Bool)

(declare-fun res!301846 () Bool)

(assert (=> b!499902 (=> (not res!301846) (not e!292907))))

(declare-datatypes ((List!9576 0))(
  ( (Nil!9573) (Cons!9572 (h!10446 (_ BitVec 64)) (t!15796 List!9576)) )
))
(declare-fun arrayNoDuplicates!0 (array!32260 (_ BitVec 32) List!9576) Bool)

(assert (=> b!499902 (= res!301846 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9573))))

(declare-fun b!499903 () Bool)

(declare-fun Unit!14974 () Unit!14971)

(assert (=> b!499903 (= e!292910 Unit!14974)))

(declare-fun b!499904 () Bool)

(assert (=> b!499904 (= e!292909 false)))

(declare-fun res!301843 () Bool)

(assert (=> start!45434 (=> (not res!301843) (not e!292908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45434 (= res!301843 (validMask!0 mask!3524))))

(assert (=> start!45434 e!292908))

(assert (=> start!45434 true))

(declare-fun array_inv!11370 (array!32260) Bool)

(assert (=> start!45434 (array_inv!11370 a!3235)))

(declare-fun b!499905 () Bool)

(declare-fun res!301850 () Bool)

(assert (=> b!499905 (=> (not res!301850) (not e!292907))))

(assert (=> b!499905 (= res!301850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499906 () Bool)

(declare-fun res!301844 () Bool)

(assert (=> b!499906 (=> (not res!301844) (not e!292908))))

(declare-fun arrayContainsKey!0 (array!32260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499906 (= res!301844 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45434 res!301843) b!499898))

(assert (= (and b!499898 res!301845) b!499897))

(assert (= (and b!499897 res!301852) b!499896))

(assert (= (and b!499896 res!301847) b!499906))

(assert (= (and b!499906 res!301844) b!499901))

(assert (= (and b!499901 res!301841) b!499905))

(assert (= (and b!499905 res!301850) b!499902))

(assert (= (and b!499902 res!301846) b!499900))

(assert (= (and b!499900 res!301840) b!499899))

(assert (= (and b!499900 (not res!301842)) b!499892))

(assert (= (and b!499892 (not res!301848)) b!499893))

(assert (= (and b!499893 c!59303) b!499894))

(assert (= (and b!499893 (not c!59303)) b!499903))

(assert (= (and b!499894 res!301851) b!499904))

(assert (= (and b!499893 (not res!301849)) b!499895))

(declare-fun m!481303 () Bool)

(assert (=> b!499896 m!481303))

(declare-fun m!481305 () Bool)

(assert (=> b!499894 m!481305))

(declare-fun m!481307 () Bool)

(assert (=> b!499894 m!481307))

(declare-fun m!481309 () Bool)

(assert (=> b!499897 m!481309))

(assert (=> b!499897 m!481309))

(declare-fun m!481311 () Bool)

(assert (=> b!499897 m!481311))

(declare-fun m!481313 () Bool)

(assert (=> b!499905 m!481313))

(assert (=> b!499895 m!481307))

(declare-fun m!481315 () Bool)

(assert (=> b!499906 m!481315))

(declare-fun m!481317 () Bool)

(assert (=> b!499901 m!481317))

(declare-fun m!481319 () Bool)

(assert (=> b!499900 m!481319))

(declare-fun m!481321 () Bool)

(assert (=> b!499900 m!481321))

(assert (=> b!499900 m!481309))

(declare-fun m!481323 () Bool)

(assert (=> b!499900 m!481323))

(declare-fun m!481325 () Bool)

(assert (=> b!499900 m!481325))

(assert (=> b!499900 m!481309))

(declare-fun m!481327 () Bool)

(assert (=> b!499900 m!481327))

(assert (=> b!499900 m!481309))

(declare-fun m!481329 () Bool)

(assert (=> b!499900 m!481329))

(declare-fun m!481331 () Bool)

(assert (=> b!499900 m!481331))

(declare-fun m!481333 () Bool)

(assert (=> b!499900 m!481333))

(declare-fun m!481335 () Bool)

(assert (=> b!499893 m!481335))

(assert (=> b!499893 m!481309))

(declare-fun m!481337 () Bool)

(assert (=> b!499902 m!481337))

(declare-fun m!481339 () Bool)

(assert (=> start!45434 m!481339))

(declare-fun m!481341 () Bool)

(assert (=> start!45434 m!481341))

(assert (=> b!499899 m!481309))

(assert (=> b!499899 m!481309))

(declare-fun m!481343 () Bool)

(assert (=> b!499899 m!481343))

(check-sat (not b!499894) (not b!499905) (not b!499906) (not b!499902) (not b!499897) (not b!499896) (not b!499900) (not b!499901) (not start!45434) (not b!499899) (not b!499895))
(check-sat)
