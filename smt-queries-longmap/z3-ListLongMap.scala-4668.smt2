; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64926 () Bool)

(assert start!64926)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41237 0))(
  ( (array!41238 (arr!19735 (Array (_ BitVec 32) (_ BitVec 64))) (size!20156 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41237)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7335 0))(
  ( (MissingZero!7335 (index!31708 (_ BitVec 32))) (Found!7335 (index!31709 (_ BitVec 32))) (Intermediate!7335 (undefined!8147 Bool) (index!31710 (_ BitVec 32)) (x!62701 (_ BitVec 32))) (Undefined!7335) (MissingVacant!7335 (index!31711 (_ BitVec 32))) )
))
(declare-fun lt!324762 () SeekEntryResult!7335)

(declare-fun b!732811 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!410055 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41237 (_ BitVec 32)) SeekEntryResult!7335)

(assert (=> b!732811 (= e!410055 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!324762))))

(declare-fun e!410054 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!732812 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!732812 (= e!410054 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) (Found!7335 j!159)))))

(declare-fun b!732813 () Bool)

(declare-fun res!492373 () Bool)

(declare-fun e!410053 () Bool)

(assert (=> b!732813 (=> (not res!492373) (not e!410053))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732813 (= res!492373 (validKeyInArray!0 k0!2102))))

(declare-fun b!732814 () Bool)

(declare-fun e!410051 () Bool)

(assert (=> b!732814 (= e!410053 e!410051)))

(declare-fun res!492376 () Bool)

(assert (=> b!732814 (=> (not res!492376) (not e!410051))))

(declare-fun lt!324767 () SeekEntryResult!7335)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732814 (= res!492376 (or (= lt!324767 (MissingZero!7335 i!1173)) (= lt!324767 (MissingVacant!7335 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41237 (_ BitVec 32)) SeekEntryResult!7335)

(assert (=> b!732814 (= lt!324767 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732815 () Bool)

(declare-fun res!492363 () Bool)

(assert (=> b!732815 (=> (not res!492363) (not e!410051))))

(declare-datatypes ((List!13737 0))(
  ( (Nil!13734) (Cons!13733 (h!14799 (_ BitVec 64)) (t!20052 List!13737)) )
))
(declare-fun arrayNoDuplicates!0 (array!41237 (_ BitVec 32) List!13737) Bool)

(assert (=> b!732815 (= res!492363 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13734))))

(declare-fun b!732816 () Bool)

(declare-fun e!410060 () Bool)

(assert (=> b!732816 (= e!410060 e!410055)))

(declare-fun res!492367 () Bool)

(assert (=> b!732816 (=> (not res!492367) (not e!410055))))

(assert (=> b!732816 (= res!492367 (= (seekEntryOrOpen!0 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!324762))))

(assert (=> b!732816 (= lt!324762 (Found!7335 j!159))))

(declare-fun b!732817 () Bool)

(declare-fun e!410059 () Bool)

(assert (=> b!732817 (= e!410051 e!410059)))

(declare-fun res!492365 () Bool)

(assert (=> b!732817 (=> (not res!492365) (not e!410059))))

(declare-fun lt!324761 () SeekEntryResult!7335)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41237 (_ BitVec 32)) SeekEntryResult!7335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732817 (= res!492365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19735 a!3186) j!159) mask!3328) (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!324761))))

(assert (=> b!732817 (= lt!324761 (Intermediate!7335 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732818 () Bool)

(declare-fun res!492362 () Bool)

(assert (=> b!732818 (=> (not res!492362) (not e!410051))))

(assert (=> b!732818 (= res!492362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20156 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20156 a!3186))))))

(declare-fun b!732819 () Bool)

(assert (=> b!732819 (= e!410054 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!324761))))

(declare-fun b!732820 () Bool)

(declare-fun e!410056 () Bool)

(assert (=> b!732820 (= e!410059 e!410056)))

(declare-fun res!492369 () Bool)

(assert (=> b!732820 (=> (not res!492369) (not e!410056))))

(declare-fun lt!324760 () SeekEntryResult!7335)

(declare-fun lt!324765 () SeekEntryResult!7335)

(assert (=> b!732820 (= res!492369 (= lt!324760 lt!324765))))

(declare-fun lt!324766 () array!41237)

(declare-fun lt!324759 () (_ BitVec 64))

(assert (=> b!732820 (= lt!324765 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324759 lt!324766 mask!3328))))

(assert (=> b!732820 (= lt!324760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324759 mask!3328) lt!324759 lt!324766 mask!3328))))

(assert (=> b!732820 (= lt!324759 (select (store (arr!19735 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732820 (= lt!324766 (array!41238 (store (arr!19735 a!3186) i!1173 k0!2102) (size!20156 a!3186)))))

(declare-fun b!732821 () Bool)

(declare-fun e!410052 () Bool)

(declare-fun e!410058 () Bool)

(assert (=> b!732821 (= e!410052 e!410058)))

(declare-fun res!492370 () Bool)

(assert (=> b!732821 (=> res!492370 e!410058)))

(assert (=> b!732821 (= res!492370 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324764 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732821 (= lt!324764 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732822 () Bool)

(declare-fun res!492377 () Bool)

(assert (=> b!732822 (=> (not res!492377) (not e!410053))))

(assert (=> b!732822 (= res!492377 (validKeyInArray!0 (select (arr!19735 a!3186) j!159)))))

(declare-fun b!732823 () Bool)

(assert (=> b!732823 (= e!410058 true)))

(declare-fun lt!324763 () SeekEntryResult!7335)

(assert (=> b!732823 (= lt!324763 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!492368 () Bool)

(assert (=> start!64926 (=> (not res!492368) (not e!410053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64926 (= res!492368 (validMask!0 mask!3328))))

(assert (=> start!64926 e!410053))

(assert (=> start!64926 true))

(declare-fun array_inv!15531 (array!41237) Bool)

(assert (=> start!64926 (array_inv!15531 a!3186)))

(declare-fun b!732810 () Bool)

(declare-fun res!492374 () Bool)

(assert (=> b!732810 (=> (not res!492374) (not e!410051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41237 (_ BitVec 32)) Bool)

(assert (=> b!732810 (= res!492374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732824 () Bool)

(declare-fun res!492372 () Bool)

(assert (=> b!732824 (=> (not res!492372) (not e!410053))))

(assert (=> b!732824 (= res!492372 (and (= (size!20156 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20156 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20156 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732825 () Bool)

(declare-fun res!492364 () Bool)

(assert (=> b!732825 (=> (not res!492364) (not e!410059))))

(assert (=> b!732825 (= res!492364 e!410054)))

(declare-fun c!80602 () Bool)

(assert (=> b!732825 (= c!80602 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732826 () Bool)

(assert (=> b!732826 (= e!410056 (not e!410052))))

(declare-fun res!492366 () Bool)

(assert (=> b!732826 (=> res!492366 e!410052)))

(get-info :version)

(assert (=> b!732826 (= res!492366 (or (not ((_ is Intermediate!7335) lt!324765)) (bvsge x!1131 (x!62701 lt!324765))))))

(assert (=> b!732826 e!410060))

(declare-fun res!492361 () Bool)

(assert (=> b!732826 (=> (not res!492361) (not e!410060))))

(assert (=> b!732826 (= res!492361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24988 0))(
  ( (Unit!24989) )
))
(declare-fun lt!324758 () Unit!24988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24988)

(assert (=> b!732826 (= lt!324758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732827 () Bool)

(declare-fun res!492375 () Bool)

(assert (=> b!732827 (=> (not res!492375) (not e!410059))))

(assert (=> b!732827 (= res!492375 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19735 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732828 () Bool)

(declare-fun res!492371 () Bool)

(assert (=> b!732828 (=> (not res!492371) (not e!410053))))

(declare-fun arrayContainsKey!0 (array!41237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732828 (= res!492371 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64926 res!492368) b!732824))

(assert (= (and b!732824 res!492372) b!732822))

(assert (= (and b!732822 res!492377) b!732813))

(assert (= (and b!732813 res!492373) b!732828))

(assert (= (and b!732828 res!492371) b!732814))

(assert (= (and b!732814 res!492376) b!732810))

(assert (= (and b!732810 res!492374) b!732815))

(assert (= (and b!732815 res!492363) b!732818))

(assert (= (and b!732818 res!492362) b!732817))

(assert (= (and b!732817 res!492365) b!732827))

(assert (= (and b!732827 res!492375) b!732825))

(assert (= (and b!732825 c!80602) b!732819))

(assert (= (and b!732825 (not c!80602)) b!732812))

(assert (= (and b!732825 res!492364) b!732820))

(assert (= (and b!732820 res!492369) b!732826))

(assert (= (and b!732826 res!492361) b!732816))

(assert (= (and b!732816 res!492367) b!732811))

(assert (= (and b!732826 (not res!492366)) b!732821))

(assert (= (and b!732821 (not res!492370)) b!732823))

(declare-fun m!685807 () Bool)

(assert (=> b!732817 m!685807))

(assert (=> b!732817 m!685807))

(declare-fun m!685809 () Bool)

(assert (=> b!732817 m!685809))

(assert (=> b!732817 m!685809))

(assert (=> b!732817 m!685807))

(declare-fun m!685811 () Bool)

(assert (=> b!732817 m!685811))

(declare-fun m!685813 () Bool)

(assert (=> b!732820 m!685813))

(declare-fun m!685815 () Bool)

(assert (=> b!732820 m!685815))

(declare-fun m!685817 () Bool)

(assert (=> b!732820 m!685817))

(assert (=> b!732820 m!685813))

(declare-fun m!685819 () Bool)

(assert (=> b!732820 m!685819))

(declare-fun m!685821 () Bool)

(assert (=> b!732820 m!685821))

(assert (=> b!732811 m!685807))

(assert (=> b!732811 m!685807))

(declare-fun m!685823 () Bool)

(assert (=> b!732811 m!685823))

(assert (=> b!732816 m!685807))

(assert (=> b!732816 m!685807))

(declare-fun m!685825 () Bool)

(assert (=> b!732816 m!685825))

(declare-fun m!685827 () Bool)

(assert (=> b!732828 m!685827))

(declare-fun m!685829 () Bool)

(assert (=> b!732827 m!685829))

(declare-fun m!685831 () Bool)

(assert (=> b!732814 m!685831))

(assert (=> b!732822 m!685807))

(assert (=> b!732822 m!685807))

(declare-fun m!685833 () Bool)

(assert (=> b!732822 m!685833))

(declare-fun m!685835 () Bool)

(assert (=> b!732813 m!685835))

(assert (=> b!732823 m!685807))

(assert (=> b!732823 m!685807))

(declare-fun m!685837 () Bool)

(assert (=> b!732823 m!685837))

(assert (=> b!732819 m!685807))

(assert (=> b!732819 m!685807))

(declare-fun m!685839 () Bool)

(assert (=> b!732819 m!685839))

(declare-fun m!685841 () Bool)

(assert (=> b!732826 m!685841))

(declare-fun m!685843 () Bool)

(assert (=> b!732826 m!685843))

(declare-fun m!685845 () Bool)

(assert (=> start!64926 m!685845))

(declare-fun m!685847 () Bool)

(assert (=> start!64926 m!685847))

(declare-fun m!685849 () Bool)

(assert (=> b!732815 m!685849))

(assert (=> b!732812 m!685807))

(assert (=> b!732812 m!685807))

(assert (=> b!732812 m!685837))

(declare-fun m!685851 () Bool)

(assert (=> b!732810 m!685851))

(declare-fun m!685853 () Bool)

(assert (=> b!732821 m!685853))

(check-sat (not b!732811) (not b!732822) (not start!64926) (not b!732815) (not b!732816) (not b!732828) (not b!732810) (not b!732814) (not b!732817) (not b!732819) (not b!732823) (not b!732820) (not b!732813) (not b!732821) (not b!732812) (not b!732826))
(check-sat)
