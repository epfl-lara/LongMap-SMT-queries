; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52406 () Bool)

(assert start!52406)

(declare-fun b!571843 () Bool)

(declare-fun e!328903 () Bool)

(declare-fun e!328908 () Bool)

(assert (=> b!571843 (= e!328903 e!328908)))

(declare-fun res!361496 () Bool)

(assert (=> b!571843 (=> (not res!361496) (not e!328908))))

(declare-datatypes ((SeekEntryResult!5641 0))(
  ( (MissingZero!5641 (index!24791 (_ BitVec 32))) (Found!5641 (index!24792 (_ BitVec 32))) (Intermediate!5641 (undefined!6453 Bool) (index!24793 (_ BitVec 32)) (x!53673 (_ BitVec 32))) (Undefined!5641) (MissingVacant!5641 (index!24794 (_ BitVec 32))) )
))
(declare-fun lt!260784 () SeekEntryResult!5641)

(declare-fun lt!260779 () (_ BitVec 32))

(declare-datatypes ((array!35812 0))(
  ( (array!35813 (arr!17195 (Array (_ BitVec 32) (_ BitVec 64))) (size!17560 (_ BitVec 32))) )
))
(declare-fun lt!260781 () array!35812)

(declare-fun lt!260780 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35812 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571843 (= res!361496 (= lt!260784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260779 lt!260780 lt!260781 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260777 () (_ BitVec 32))

(declare-fun a!3118 () array!35812)

(assert (=> b!571843 (= lt!260784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260777 (select (arr!17195 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571843 (= lt!260779 (toIndex!0 lt!260780 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571843 (= lt!260780 (select (store (arr!17195 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571843 (= lt!260777 (toIndex!0 (select (arr!17195 a!3118) j!142) mask!3119))))

(assert (=> b!571843 (= lt!260781 (array!35813 (store (arr!17195 a!3118) i!1132 k0!1914) (size!17560 a!3118)))))

(declare-fun b!571844 () Bool)

(declare-fun e!328901 () Bool)

(declare-fun e!328904 () Bool)

(assert (=> b!571844 (= e!328901 e!328904)))

(declare-fun res!361499 () Bool)

(assert (=> b!571844 (=> res!361499 e!328904)))

(get-info :version)

(assert (=> b!571844 (= res!361499 (or (undefined!6453 lt!260784) (not ((_ is Intermediate!5641) lt!260784))))))

(declare-fun b!571845 () Bool)

(assert (=> b!571845 (= e!328908 (not true))))

(assert (=> b!571845 e!328901))

(declare-fun res!361500 () Bool)

(assert (=> b!571845 (=> (not res!361500) (not e!328901))))

(declare-fun lt!260783 () SeekEntryResult!5641)

(assert (=> b!571845 (= res!361500 (= lt!260783 (Found!5641 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35812 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571845 (= lt!260783 (seekEntryOrOpen!0 (select (arr!17195 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35812 (_ BitVec 32)) Bool)

(assert (=> b!571845 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17970 0))(
  ( (Unit!17971) )
))
(declare-fun lt!260778 () Unit!17970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17970)

(assert (=> b!571845 (= lt!260778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571846 () Bool)

(declare-fun e!328905 () Bool)

(declare-fun e!328907 () Bool)

(assert (=> b!571846 (= e!328905 e!328907)))

(declare-fun res!361494 () Bool)

(assert (=> b!571846 (=> (not res!361494) (not e!328907))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35812 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571846 (= res!361494 (= lt!260783 (seekKeyOrZeroReturnVacant!0 (x!53673 lt!260784) (index!24793 lt!260784) (index!24793 lt!260784) (select (arr!17195 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571847 () Bool)

(declare-fun res!361493 () Bool)

(declare-fun e!328906 () Bool)

(assert (=> b!571847 (=> (not res!361493) (not e!328906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571847 (= res!361493 (validKeyInArray!0 (select (arr!17195 a!3118) j!142)))))

(declare-fun b!571848 () Bool)

(declare-fun res!361497 () Bool)

(assert (=> b!571848 (=> (not res!361497) (not e!328906))))

(assert (=> b!571848 (= res!361497 (and (= (size!17560 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17560 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17560 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571849 () Bool)

(assert (=> b!571849 (= e!328904 e!328905)))

(declare-fun res!361498 () Bool)

(assert (=> b!571849 (=> res!361498 e!328905)))

(declare-fun lt!260782 () (_ BitVec 64))

(assert (=> b!571849 (= res!361498 (or (= lt!260782 (select (arr!17195 a!3118) j!142)) (= lt!260782 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571849 (= lt!260782 (select (arr!17195 a!3118) (index!24793 lt!260784)))))

(declare-fun b!571851 () Bool)

(assert (=> b!571851 (= e!328906 e!328903)))

(declare-fun res!361504 () Bool)

(assert (=> b!571851 (=> (not res!361504) (not e!328903))))

(declare-fun lt!260785 () SeekEntryResult!5641)

(assert (=> b!571851 (= res!361504 (or (= lt!260785 (MissingZero!5641 i!1132)) (= lt!260785 (MissingVacant!5641 i!1132))))))

(assert (=> b!571851 (= lt!260785 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571852 () Bool)

(assert (=> b!571852 (= e!328907 (= (seekEntryOrOpen!0 lt!260780 lt!260781 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53673 lt!260784) (index!24793 lt!260784) (index!24793 lt!260784) lt!260780 lt!260781 mask!3119)))))

(declare-fun b!571853 () Bool)

(declare-fun res!361502 () Bool)

(assert (=> b!571853 (=> (not res!361502) (not e!328906))))

(declare-fun arrayContainsKey!0 (array!35812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571853 (= res!361502 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!361505 () Bool)

(assert (=> start!52406 (=> (not res!361505) (not e!328906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52406 (= res!361505 (validMask!0 mask!3119))))

(assert (=> start!52406 e!328906))

(assert (=> start!52406 true))

(declare-fun array_inv!13078 (array!35812) Bool)

(assert (=> start!52406 (array_inv!13078 a!3118)))

(declare-fun b!571850 () Bool)

(declare-fun res!361501 () Bool)

(assert (=> b!571850 (=> (not res!361501) (not e!328906))))

(assert (=> b!571850 (= res!361501 (validKeyInArray!0 k0!1914))))

(declare-fun b!571854 () Bool)

(declare-fun res!361495 () Bool)

(assert (=> b!571854 (=> (not res!361495) (not e!328903))))

(assert (=> b!571854 (= res!361495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571855 () Bool)

(declare-fun res!361503 () Bool)

(assert (=> b!571855 (=> (not res!361503) (not e!328903))))

(declare-datatypes ((List!11314 0))(
  ( (Nil!11311) (Cons!11310 (h!12337 (_ BitVec 64)) (t!17533 List!11314)) )
))
(declare-fun arrayNoDuplicates!0 (array!35812 (_ BitVec 32) List!11314) Bool)

(assert (=> b!571855 (= res!361503 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11311))))

(assert (= (and start!52406 res!361505) b!571848))

(assert (= (and b!571848 res!361497) b!571847))

(assert (= (and b!571847 res!361493) b!571850))

(assert (= (and b!571850 res!361501) b!571853))

(assert (= (and b!571853 res!361502) b!571851))

(assert (= (and b!571851 res!361504) b!571854))

(assert (= (and b!571854 res!361495) b!571855))

(assert (= (and b!571855 res!361503) b!571843))

(assert (= (and b!571843 res!361496) b!571845))

(assert (= (and b!571845 res!361500) b!571844))

(assert (= (and b!571844 (not res!361499)) b!571849))

(assert (= (and b!571849 (not res!361498)) b!571846))

(assert (= (and b!571846 res!361494) b!571852))

(declare-fun m!550277 () Bool)

(assert (=> b!571851 m!550277))

(declare-fun m!550279 () Bool)

(assert (=> b!571854 m!550279))

(declare-fun m!550281 () Bool)

(assert (=> b!571843 m!550281))

(declare-fun m!550283 () Bool)

(assert (=> b!571843 m!550283))

(declare-fun m!550285 () Bool)

(assert (=> b!571843 m!550285))

(declare-fun m!550287 () Bool)

(assert (=> b!571843 m!550287))

(assert (=> b!571843 m!550283))

(declare-fun m!550289 () Bool)

(assert (=> b!571843 m!550289))

(assert (=> b!571843 m!550283))

(declare-fun m!550291 () Bool)

(assert (=> b!571843 m!550291))

(declare-fun m!550293 () Bool)

(assert (=> b!571843 m!550293))

(assert (=> b!571847 m!550283))

(assert (=> b!571847 m!550283))

(declare-fun m!550295 () Bool)

(assert (=> b!571847 m!550295))

(declare-fun m!550297 () Bool)

(assert (=> b!571853 m!550297))

(declare-fun m!550299 () Bool)

(assert (=> b!571850 m!550299))

(declare-fun m!550301 () Bool)

(assert (=> b!571852 m!550301))

(declare-fun m!550303 () Bool)

(assert (=> b!571852 m!550303))

(assert (=> b!571845 m!550283))

(assert (=> b!571845 m!550283))

(declare-fun m!550305 () Bool)

(assert (=> b!571845 m!550305))

(declare-fun m!550307 () Bool)

(assert (=> b!571845 m!550307))

(declare-fun m!550309 () Bool)

(assert (=> b!571845 m!550309))

(assert (=> b!571846 m!550283))

(assert (=> b!571846 m!550283))

(declare-fun m!550311 () Bool)

(assert (=> b!571846 m!550311))

(declare-fun m!550313 () Bool)

(assert (=> start!52406 m!550313))

(declare-fun m!550315 () Bool)

(assert (=> start!52406 m!550315))

(declare-fun m!550317 () Bool)

(assert (=> b!571855 m!550317))

(assert (=> b!571849 m!550283))

(declare-fun m!550319 () Bool)

(assert (=> b!571849 m!550319))

(check-sat (not b!571852) (not b!571851) (not b!571843) (not b!571846) (not b!571854) (not b!571855) (not b!571850) (not b!571847) (not b!571853) (not b!571845) (not start!52406))
(check-sat)
