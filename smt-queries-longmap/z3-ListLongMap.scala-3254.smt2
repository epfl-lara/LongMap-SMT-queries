; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45386 () Bool)

(assert start!45386)

(declare-fun b!498812 () Bool)

(declare-fun res!300916 () Bool)

(declare-fun e!292332 () Bool)

(assert (=> b!498812 (=> (not res!300916) (not e!292332))))

(declare-datatypes ((array!32212 0))(
  ( (array!32213 (arr!15487 (Array (_ BitVec 32) (_ BitVec 64))) (size!15851 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32212)

(declare-datatypes ((List!9552 0))(
  ( (Nil!9549) (Cons!9548 (h!10422 (_ BitVec 64)) (t!15772 List!9552)) )
))
(declare-fun arrayNoDuplicates!0 (array!32212 (_ BitVec 32) List!9552) Bool)

(assert (=> b!498812 (= res!300916 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9549))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!498813 () Bool)

(declare-fun e!292335 () Bool)

(declare-datatypes ((SeekEntryResult!3910 0))(
  ( (MissingZero!3910 (index!17822 (_ BitVec 32))) (Found!3910 (index!17823 (_ BitVec 32))) (Intermediate!3910 (undefined!4722 Bool) (index!17824 (_ BitVec 32)) (x!47016 (_ BitVec 32))) (Undefined!3910) (MissingVacant!3910 (index!17825 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32212 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!498813 (= e!292335 (= (seekEntryOrOpen!0 (select (arr!15487 a!3235) j!176) a!3235 mask!3524) (Found!3910 j!176)))))

(declare-fun b!498814 () Bool)

(declare-datatypes ((Unit!14875 0))(
  ( (Unit!14876) )
))
(declare-fun e!292329 () Unit!14875)

(declare-fun Unit!14877 () Unit!14875)

(assert (=> b!498814 (= e!292329 Unit!14877)))

(declare-fun b!498815 () Bool)

(declare-fun e!292328 () Bool)

(assert (=> b!498815 (= e!292328 e!292332)))

(declare-fun res!300913 () Bool)

(assert (=> b!498815 (=> (not res!300913) (not e!292332))))

(declare-fun lt!226083 () SeekEntryResult!3910)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498815 (= res!300913 (or (= lt!226083 (MissingZero!3910 i!1204)) (= lt!226083 (MissingVacant!3910 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!498815 (= lt!226083 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498816 () Bool)

(declare-fun res!300911 () Bool)

(assert (=> b!498816 (=> (not res!300911) (not e!292332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32212 (_ BitVec 32)) Bool)

(assert (=> b!498816 (= res!300911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498817 () Bool)

(declare-fun Unit!14878 () Unit!14875)

(assert (=> b!498817 (= e!292329 Unit!14878)))

(declare-fun lt!226085 () (_ BitVec 32))

(declare-fun lt!226089 () Unit!14875)

(declare-fun lt!226090 () SeekEntryResult!3910)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14875)

(assert (=> b!498817 (= lt!226089 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226085 #b00000000000000000000000000000000 (index!17824 lt!226090) (x!47016 lt!226090) mask!3524))))

(declare-fun lt!226082 () (_ BitVec 64))

(declare-fun lt!226087 () array!32212)

(declare-fun res!300907 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32212 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!498817 (= res!300907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226085 lt!226082 lt!226087 mask!3524) (Intermediate!3910 false (index!17824 lt!226090) (x!47016 lt!226090))))))

(declare-fun e!292333 () Bool)

(assert (=> b!498817 (=> (not res!300907) (not e!292333))))

(assert (=> b!498817 e!292333))

(declare-fun res!300908 () Bool)

(assert (=> start!45386 (=> (not res!300908) (not e!292328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45386 (= res!300908 (validMask!0 mask!3524))))

(assert (=> start!45386 e!292328))

(assert (=> start!45386 true))

(declare-fun array_inv!11346 (array!32212) Bool)

(assert (=> start!45386 (array_inv!11346 a!3235)))

(declare-fun b!498818 () Bool)

(declare-fun e!292334 () Bool)

(assert (=> b!498818 (= e!292334 true)))

(declare-fun lt!226088 () SeekEntryResult!3910)

(assert (=> b!498818 (= lt!226088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226085 lt!226082 lt!226087 mask!3524))))

(declare-fun b!498819 () Bool)

(declare-fun res!300914 () Bool)

(assert (=> b!498819 (=> (not res!300914) (not e!292328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498819 (= res!300914 (validKeyInArray!0 (select (arr!15487 a!3235) j!176)))))

(declare-fun b!498820 () Bool)

(assert (=> b!498820 (= e!292333 false)))

(declare-fun b!498821 () Bool)

(declare-fun res!300915 () Bool)

(assert (=> b!498821 (=> (not res!300915) (not e!292328))))

(assert (=> b!498821 (= res!300915 (and (= (size!15851 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15851 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15851 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498822 () Bool)

(declare-fun res!300909 () Bool)

(assert (=> b!498822 (=> (not res!300909) (not e!292328))))

(declare-fun arrayContainsKey!0 (array!32212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498822 (= res!300909 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498823 () Bool)

(declare-fun res!300910 () Bool)

(declare-fun e!292330 () Bool)

(assert (=> b!498823 (=> res!300910 e!292330)))

(get-info :version)

(assert (=> b!498823 (= res!300910 (or (undefined!4722 lt!226090) (not ((_ is Intermediate!3910) lt!226090))))))

(declare-fun b!498824 () Bool)

(declare-fun res!300912 () Bool)

(assert (=> b!498824 (=> (not res!300912) (not e!292328))))

(assert (=> b!498824 (= res!300912 (validKeyInArray!0 k0!2280))))

(declare-fun b!498825 () Bool)

(assert (=> b!498825 (= e!292332 (not e!292330))))

(declare-fun res!300905 () Bool)

(assert (=> b!498825 (=> res!300905 e!292330)))

(declare-fun lt!226084 () (_ BitVec 32))

(assert (=> b!498825 (= res!300905 (= lt!226090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226084 lt!226082 lt!226087 mask!3524)))))

(assert (=> b!498825 (= lt!226090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226085 (select (arr!15487 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498825 (= lt!226084 (toIndex!0 lt!226082 mask!3524))))

(assert (=> b!498825 (= lt!226082 (select (store (arr!15487 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498825 (= lt!226085 (toIndex!0 (select (arr!15487 a!3235) j!176) mask!3524))))

(assert (=> b!498825 (= lt!226087 (array!32213 (store (arr!15487 a!3235) i!1204 k0!2280) (size!15851 a!3235)))))

(assert (=> b!498825 e!292335))

(declare-fun res!300906 () Bool)

(assert (=> b!498825 (=> (not res!300906) (not e!292335))))

(assert (=> b!498825 (= res!300906 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226086 () Unit!14875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14875)

(assert (=> b!498825 (= lt!226086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498826 () Bool)

(assert (=> b!498826 (= e!292330 e!292334)))

(declare-fun res!300904 () Bool)

(assert (=> b!498826 (=> res!300904 e!292334)))

(assert (=> b!498826 (= res!300904 (or (bvsgt #b00000000000000000000000000000000 (x!47016 lt!226090)) (bvsgt (x!47016 lt!226090) #b01111111111111111111111111111110) (bvslt lt!226085 #b00000000000000000000000000000000) (bvsge lt!226085 (size!15851 a!3235)) (bvslt (index!17824 lt!226090) #b00000000000000000000000000000000) (bvsge (index!17824 lt!226090) (size!15851 a!3235)) (not (= lt!226090 (Intermediate!3910 false (index!17824 lt!226090) (x!47016 lt!226090))))))))

(assert (=> b!498826 (and (or (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226081 () Unit!14875)

(assert (=> b!498826 (= lt!226081 e!292329)))

(declare-fun c!59231 () Bool)

(assert (=> b!498826 (= c!59231 (= (select (arr!15487 a!3235) (index!17824 lt!226090)) (select (arr!15487 a!3235) j!176)))))

(assert (=> b!498826 (and (bvslt (x!47016 lt!226090) #b01111111111111111111111111111110) (or (= (select (arr!15487 a!3235) (index!17824 lt!226090)) (select (arr!15487 a!3235) j!176)) (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15487 a!3235) (index!17824 lt!226090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45386 res!300908) b!498821))

(assert (= (and b!498821 res!300915) b!498819))

(assert (= (and b!498819 res!300914) b!498824))

(assert (= (and b!498824 res!300912) b!498822))

(assert (= (and b!498822 res!300909) b!498815))

(assert (= (and b!498815 res!300913) b!498816))

(assert (= (and b!498816 res!300911) b!498812))

(assert (= (and b!498812 res!300916) b!498825))

(assert (= (and b!498825 res!300906) b!498813))

(assert (= (and b!498825 (not res!300905)) b!498823))

(assert (= (and b!498823 (not res!300910)) b!498826))

(assert (= (and b!498826 c!59231) b!498817))

(assert (= (and b!498826 (not c!59231)) b!498814))

(assert (= (and b!498817 res!300907) b!498820))

(assert (= (and b!498826 (not res!300904)) b!498818))

(declare-fun m!480295 () Bool)

(assert (=> b!498825 m!480295))

(declare-fun m!480297 () Bool)

(assert (=> b!498825 m!480297))

(declare-fun m!480299 () Bool)

(assert (=> b!498825 m!480299))

(declare-fun m!480301 () Bool)

(assert (=> b!498825 m!480301))

(assert (=> b!498825 m!480299))

(declare-fun m!480303 () Bool)

(assert (=> b!498825 m!480303))

(assert (=> b!498825 m!480299))

(declare-fun m!480305 () Bool)

(assert (=> b!498825 m!480305))

(declare-fun m!480307 () Bool)

(assert (=> b!498825 m!480307))

(declare-fun m!480309 () Bool)

(assert (=> b!498825 m!480309))

(declare-fun m!480311 () Bool)

(assert (=> b!498825 m!480311))

(declare-fun m!480313 () Bool)

(assert (=> b!498817 m!480313))

(declare-fun m!480315 () Bool)

(assert (=> b!498817 m!480315))

(declare-fun m!480317 () Bool)

(assert (=> b!498816 m!480317))

(assert (=> b!498818 m!480315))

(declare-fun m!480319 () Bool)

(assert (=> b!498822 m!480319))

(assert (=> b!498819 m!480299))

(assert (=> b!498819 m!480299))

(declare-fun m!480321 () Bool)

(assert (=> b!498819 m!480321))

(assert (=> b!498813 m!480299))

(assert (=> b!498813 m!480299))

(declare-fun m!480323 () Bool)

(assert (=> b!498813 m!480323))

(declare-fun m!480325 () Bool)

(assert (=> b!498812 m!480325))

(declare-fun m!480327 () Bool)

(assert (=> start!45386 m!480327))

(declare-fun m!480329 () Bool)

(assert (=> start!45386 m!480329))

(declare-fun m!480331 () Bool)

(assert (=> b!498815 m!480331))

(declare-fun m!480333 () Bool)

(assert (=> b!498824 m!480333))

(declare-fun m!480335 () Bool)

(assert (=> b!498826 m!480335))

(assert (=> b!498826 m!480299))

(check-sat (not b!498817) (not b!498819) (not b!498822) (not start!45386) (not b!498825) (not b!498815) (not b!498824) (not b!498813) (not b!498816) (not b!498812) (not b!498818))
(check-sat)
