; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64670 () Bool)

(assert start!64670)

(declare-datatypes ((array!41119 0))(
  ( (array!41120 (arr!19679 (Array (_ BitVec 32) (_ BitVec 64))) (size!20100 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41119)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!407971 () Bool)

(declare-fun b!728848 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7279 0))(
  ( (MissingZero!7279 (index!31484 (_ BitVec 32))) (Found!7279 (index!31485 (_ BitVec 32))) (Intermediate!7279 (undefined!8091 Bool) (index!31486 (_ BitVec 32)) (x!62469 (_ BitVec 32))) (Undefined!7279) (MissingVacant!7279 (index!31487 (_ BitVec 32))) )
))
(declare-fun lt!322868 () SeekEntryResult!7279)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728848 (= e!407971 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322868))))

(declare-fun e!407972 () Bool)

(declare-fun b!728849 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!728849 (= e!407972 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) (Found!7279 j!159)))))

(declare-fun b!728850 () Bool)

(declare-fun e!407973 () Bool)

(declare-fun e!407967 () Bool)

(assert (=> b!728850 (= e!407973 e!407967)))

(declare-fun res!489321 () Bool)

(assert (=> b!728850 (=> (not res!489321) (not e!407967))))

(declare-fun lt!322872 () SeekEntryResult!7279)

(declare-fun lt!322869 () SeekEntryResult!7279)

(assert (=> b!728850 (= res!489321 (= lt!322872 lt!322869))))

(declare-fun lt!322871 () (_ BitVec 64))

(declare-fun lt!322870 () array!41119)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728850 (= lt!322869 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322871 lt!322870 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728850 (= lt!322872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322871 mask!3328) lt!322871 lt!322870 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!728850 (= lt!322871 (select (store (arr!19679 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728850 (= lt!322870 (array!41120 (store (arr!19679 a!3186) i!1173 k!2102) (size!20100 a!3186)))))

(declare-fun b!728851 () Bool)

(declare-fun res!489323 () Bool)

(declare-fun e!407974 () Bool)

(assert (=> b!728851 (=> (not res!489323) (not e!407974))))

(assert (=> b!728851 (= res!489323 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20100 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20100 a!3186))))))

(declare-fun b!728852 () Bool)

(declare-fun e!407969 () Bool)

(assert (=> b!728852 (= e!407967 (not e!407969))))

(declare-fun res!489320 () Bool)

(assert (=> b!728852 (=> res!489320 e!407969)))

(assert (=> b!728852 (= res!489320 (or (not (is-Intermediate!7279 lt!322869)) (bvsge x!1131 (x!62469 lt!322869))))))

(declare-fun e!407968 () Bool)

(assert (=> b!728852 e!407968))

(declare-fun res!489318 () Bool)

(assert (=> b!728852 (=> (not res!489318) (not e!407968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41119 (_ BitVec 32)) Bool)

(assert (=> b!728852 (= res!489318 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24876 0))(
  ( (Unit!24877) )
))
(declare-fun lt!322866 () Unit!24876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24876)

(assert (=> b!728852 (= lt!322866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728853 () Bool)

(declare-fun res!489317 () Bool)

(declare-fun e!407970 () Bool)

(assert (=> b!728853 (=> (not res!489317) (not e!407970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728853 (= res!489317 (validKeyInArray!0 k!2102))))

(declare-fun b!728854 () Bool)

(declare-fun res!489322 () Bool)

(assert (=> b!728854 (=> (not res!489322) (not e!407973))))

(assert (=> b!728854 (= res!489322 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19679 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728855 () Bool)

(declare-fun res!489324 () Bool)

(assert (=> b!728855 (=> (not res!489324) (not e!407970))))

(declare-fun arrayContainsKey!0 (array!41119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728855 (= res!489324 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728856 () Bool)

(declare-fun res!489331 () Bool)

(assert (=> b!728856 (=> (not res!489331) (not e!407974))))

(assert (=> b!728856 (= res!489331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728857 () Bool)

(declare-fun res!489328 () Bool)

(assert (=> b!728857 (=> (not res!489328) (not e!407970))))

(assert (=> b!728857 (= res!489328 (and (= (size!20100 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20100 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20100 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728858 () Bool)

(assert (=> b!728858 (= e!407969 true)))

(declare-fun lt!322873 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728858 (= lt!322873 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!489332 () Bool)

(assert (=> start!64670 (=> (not res!489332) (not e!407970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64670 (= res!489332 (validMask!0 mask!3328))))

(assert (=> start!64670 e!407970))

(assert (=> start!64670 true))

(declare-fun array_inv!15475 (array!41119) Bool)

(assert (=> start!64670 (array_inv!15475 a!3186)))

(declare-fun b!728859 () Bool)

(declare-fun res!489327 () Bool)

(assert (=> b!728859 (=> (not res!489327) (not e!407970))))

(assert (=> b!728859 (= res!489327 (validKeyInArray!0 (select (arr!19679 a!3186) j!159)))))

(declare-fun b!728860 () Bool)

(declare-fun res!489330 () Bool)

(assert (=> b!728860 (=> (not res!489330) (not e!407973))))

(assert (=> b!728860 (= res!489330 e!407972)))

(declare-fun c!80140 () Bool)

(assert (=> b!728860 (= c!80140 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728861 () Bool)

(assert (=> b!728861 (= e!407974 e!407973)))

(declare-fun res!489329 () Bool)

(assert (=> b!728861 (=> (not res!489329) (not e!407973))))

(declare-fun lt!322867 () SeekEntryResult!7279)

(assert (=> b!728861 (= res!489329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19679 a!3186) j!159) mask!3328) (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322867))))

(assert (=> b!728861 (= lt!322867 (Intermediate!7279 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728862 () Bool)

(assert (=> b!728862 (= e!407972 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322867))))

(declare-fun b!728863 () Bool)

(assert (=> b!728863 (= e!407968 e!407971)))

(declare-fun res!489319 () Bool)

(assert (=> b!728863 (=> (not res!489319) (not e!407971))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41119 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!728863 (= res!489319 (= (seekEntryOrOpen!0 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322868))))

(assert (=> b!728863 (= lt!322868 (Found!7279 j!159))))

(declare-fun b!728864 () Bool)

(assert (=> b!728864 (= e!407970 e!407974)))

(declare-fun res!489326 () Bool)

(assert (=> b!728864 (=> (not res!489326) (not e!407974))))

(declare-fun lt!322874 () SeekEntryResult!7279)

(assert (=> b!728864 (= res!489326 (or (= lt!322874 (MissingZero!7279 i!1173)) (= lt!322874 (MissingVacant!7279 i!1173))))))

(assert (=> b!728864 (= lt!322874 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728865 () Bool)

(declare-fun res!489325 () Bool)

(assert (=> b!728865 (=> (not res!489325) (not e!407974))))

(declare-datatypes ((List!13681 0))(
  ( (Nil!13678) (Cons!13677 (h!14737 (_ BitVec 64)) (t!19996 List!13681)) )
))
(declare-fun arrayNoDuplicates!0 (array!41119 (_ BitVec 32) List!13681) Bool)

(assert (=> b!728865 (= res!489325 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13678))))

(assert (= (and start!64670 res!489332) b!728857))

(assert (= (and b!728857 res!489328) b!728859))

(assert (= (and b!728859 res!489327) b!728853))

(assert (= (and b!728853 res!489317) b!728855))

(assert (= (and b!728855 res!489324) b!728864))

(assert (= (and b!728864 res!489326) b!728856))

(assert (= (and b!728856 res!489331) b!728865))

(assert (= (and b!728865 res!489325) b!728851))

(assert (= (and b!728851 res!489323) b!728861))

(assert (= (and b!728861 res!489329) b!728854))

(assert (= (and b!728854 res!489322) b!728860))

(assert (= (and b!728860 c!80140) b!728862))

(assert (= (and b!728860 (not c!80140)) b!728849))

(assert (= (and b!728860 res!489330) b!728850))

(assert (= (and b!728850 res!489321) b!728852))

(assert (= (and b!728852 res!489318) b!728863))

(assert (= (and b!728863 res!489319) b!728848))

(assert (= (and b!728852 (not res!489320)) b!728858))

(declare-fun m!682555 () Bool)

(assert (=> b!728853 m!682555))

(declare-fun m!682557 () Bool)

(assert (=> b!728858 m!682557))

(declare-fun m!682559 () Bool)

(assert (=> b!728855 m!682559))

(declare-fun m!682561 () Bool)

(assert (=> b!728862 m!682561))

(assert (=> b!728862 m!682561))

(declare-fun m!682563 () Bool)

(assert (=> b!728862 m!682563))

(declare-fun m!682565 () Bool)

(assert (=> start!64670 m!682565))

(declare-fun m!682567 () Bool)

(assert (=> start!64670 m!682567))

(declare-fun m!682569 () Bool)

(assert (=> b!728865 m!682569))

(assert (=> b!728861 m!682561))

(assert (=> b!728861 m!682561))

(declare-fun m!682571 () Bool)

(assert (=> b!728861 m!682571))

(assert (=> b!728861 m!682571))

(assert (=> b!728861 m!682561))

(declare-fun m!682573 () Bool)

(assert (=> b!728861 m!682573))

(assert (=> b!728859 m!682561))

(assert (=> b!728859 m!682561))

(declare-fun m!682575 () Bool)

(assert (=> b!728859 m!682575))

(declare-fun m!682577 () Bool)

(assert (=> b!728856 m!682577))

(declare-fun m!682579 () Bool)

(assert (=> b!728854 m!682579))

(assert (=> b!728848 m!682561))

(assert (=> b!728848 m!682561))

(declare-fun m!682581 () Bool)

(assert (=> b!728848 m!682581))

(declare-fun m!682583 () Bool)

(assert (=> b!728864 m!682583))

(assert (=> b!728863 m!682561))

(assert (=> b!728863 m!682561))

(declare-fun m!682585 () Bool)

(assert (=> b!728863 m!682585))

(declare-fun m!682587 () Bool)

(assert (=> b!728852 m!682587))

(declare-fun m!682589 () Bool)

(assert (=> b!728852 m!682589))

(declare-fun m!682591 () Bool)

(assert (=> b!728850 m!682591))

(declare-fun m!682593 () Bool)

(assert (=> b!728850 m!682593))

(declare-fun m!682595 () Bool)

(assert (=> b!728850 m!682595))

(declare-fun m!682597 () Bool)

(assert (=> b!728850 m!682597))

(declare-fun m!682599 () Bool)

(assert (=> b!728850 m!682599))

(assert (=> b!728850 m!682597))

(assert (=> b!728849 m!682561))

(assert (=> b!728849 m!682561))

(declare-fun m!682601 () Bool)

(assert (=> b!728849 m!682601))

(push 1)

