; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65462 () Bool)

(assert start!65462)

(declare-fun b!745933 () Bool)

(declare-fun res!502767 () Bool)

(declare-fun e!416597 () Bool)

(assert (=> b!745933 (=> (not res!502767) (not e!416597))))

(declare-datatypes ((array!41635 0))(
  ( (array!41636 (arr!19931 (Array (_ BitVec 32) (_ BitVec 64))) (size!20352 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41635)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745933 (= res!502767 (validKeyInArray!0 (select (arr!19931 a!3186) j!159)))))

(declare-fun b!745934 () Bool)

(declare-fun e!416591 () Bool)

(assert (=> b!745934 (= e!416597 e!416591)))

(declare-fun res!502756 () Bool)

(assert (=> b!745934 (=> (not res!502756) (not e!416591))))

(declare-datatypes ((SeekEntryResult!7531 0))(
  ( (MissingZero!7531 (index!32492 (_ BitVec 32))) (Found!7531 (index!32493 (_ BitVec 32))) (Intermediate!7531 (undefined!8343 Bool) (index!32494 (_ BitVec 32)) (x!63441 (_ BitVec 32))) (Undefined!7531) (MissingVacant!7531 (index!32495 (_ BitVec 32))) )
))
(declare-fun lt!331436 () SeekEntryResult!7531)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745934 (= res!502756 (or (= lt!331436 (MissingZero!7531 i!1173)) (= lt!331436 (MissingVacant!7531 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!745934 (= lt!331436 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745935 () Bool)

(declare-fun e!416596 () Bool)

(declare-fun e!416593 () Bool)

(assert (=> b!745935 (= e!416596 (not e!416593))))

(declare-fun res!502755 () Bool)

(assert (=> b!745935 (=> res!502755 e!416593)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331438 () SeekEntryResult!7531)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745935 (= res!502755 (or (not (is-Intermediate!7531 lt!331438)) (bvslt x!1131 (x!63441 lt!331438)) (not (= x!1131 (x!63441 lt!331438))) (not (= index!1321 (index!32494 lt!331438)))))))

(declare-fun e!416589 () Bool)

(assert (=> b!745935 e!416589))

(declare-fun res!502764 () Bool)

(assert (=> b!745935 (=> (not res!502764) (not e!416589))))

(declare-fun lt!331442 () SeekEntryResult!7531)

(declare-fun lt!331444 () SeekEntryResult!7531)

(assert (=> b!745935 (= res!502764 (= lt!331442 lt!331444))))

(assert (=> b!745935 (= lt!331444 (Found!7531 j!159))))

(assert (=> b!745935 (= lt!331442 (seekEntryOrOpen!0 (select (arr!19931 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41635 (_ BitVec 32)) Bool)

(assert (=> b!745935 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25542 0))(
  ( (Unit!25543) )
))
(declare-fun lt!331439 () Unit!25542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25542)

(assert (=> b!745935 (= lt!331439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745936 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!745936 (= e!416589 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331444))))

(declare-fun b!745937 () Bool)

(declare-fun res!502762 () Bool)

(assert (=> b!745937 (=> (not res!502762) (not e!416597))))

(assert (=> b!745937 (= res!502762 (and (= (size!20352 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20352 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20352 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745938 () Bool)

(declare-fun e!416592 () Bool)

(assert (=> b!745938 (= e!416591 e!416592)))

(declare-fun res!502769 () Bool)

(assert (=> b!745938 (=> (not res!502769) (not e!416592))))

(declare-fun lt!331437 () SeekEntryResult!7531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745938 (= res!502769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19931 a!3186) j!159) mask!3328) (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331437))))

(assert (=> b!745938 (= lt!331437 (Intermediate!7531 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745939 () Bool)

(declare-fun res!502759 () Bool)

(assert (=> b!745939 (=> (not res!502759) (not e!416591))))

(assert (=> b!745939 (= res!502759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745940 () Bool)

(declare-fun res!502768 () Bool)

(assert (=> b!745940 (=> (not res!502768) (not e!416592))))

(assert (=> b!745940 (= res!502768 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19931 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745942 () Bool)

(declare-fun res!502765 () Bool)

(assert (=> b!745942 (=> (not res!502765) (not e!416597))))

(assert (=> b!745942 (= res!502765 (validKeyInArray!0 k!2102))))

(declare-fun b!745943 () Bool)

(declare-fun e!416595 () Bool)

(assert (=> b!745943 (= e!416595 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) lt!331437))))

(declare-fun b!745944 () Bool)

(declare-fun res!502766 () Bool)

(assert (=> b!745944 (=> (not res!502766) (not e!416591))))

(declare-datatypes ((List!13933 0))(
  ( (Nil!13930) (Cons!13929 (h!15001 (_ BitVec 64)) (t!20248 List!13933)) )
))
(declare-fun arrayNoDuplicates!0 (array!41635 (_ BitVec 32) List!13933) Bool)

(assert (=> b!745944 (= res!502766 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13930))))

(declare-fun b!745945 () Bool)

(declare-fun res!502761 () Bool)

(assert (=> b!745945 (=> (not res!502761) (not e!416592))))

(assert (=> b!745945 (= res!502761 e!416595)))

(declare-fun c!81970 () Bool)

(assert (=> b!745945 (= c!81970 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745946 () Bool)

(declare-fun res!502760 () Bool)

(assert (=> b!745946 (=> (not res!502760) (not e!416597))))

(declare-fun arrayContainsKey!0 (array!41635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745946 (= res!502760 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745947 () Bool)

(declare-fun e!416594 () Bool)

(assert (=> b!745947 (= e!416593 e!416594)))

(declare-fun res!502758 () Bool)

(assert (=> b!745947 (=> res!502758 e!416594)))

(declare-fun lt!331440 () (_ BitVec 64))

(declare-fun lt!331443 () SeekEntryResult!7531)

(assert (=> b!745947 (= res!502758 (or (not (= lt!331443 lt!331444)) (= (select (store (arr!19931 a!3186) i!1173 k!2102) index!1321) lt!331440) (not (= (select (store (arr!19931 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745947 (= lt!331443 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745948 () Bool)

(declare-fun res!502763 () Bool)

(assert (=> b!745948 (=> (not res!502763) (not e!416591))))

(assert (=> b!745948 (= res!502763 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20352 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20352 a!3186))))))

(declare-fun b!745949 () Bool)

(assert (=> b!745949 (= e!416595 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19931 a!3186) j!159) a!3186 mask!3328) (Found!7531 j!159)))))

(declare-fun b!745950 () Bool)

(assert (=> b!745950 (= e!416592 e!416596)))

(declare-fun res!502754 () Bool)

(assert (=> b!745950 (=> (not res!502754) (not e!416596))))

(declare-fun lt!331445 () SeekEntryResult!7531)

(assert (=> b!745950 (= res!502754 (= lt!331445 lt!331438))))

(declare-fun lt!331441 () array!41635)

(assert (=> b!745950 (= lt!331438 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331440 lt!331441 mask!3328))))

(assert (=> b!745950 (= lt!331445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331440 mask!3328) lt!331440 lt!331441 mask!3328))))

(assert (=> b!745950 (= lt!331440 (select (store (arr!19931 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745950 (= lt!331441 (array!41636 (store (arr!19931 a!3186) i!1173 k!2102) (size!20352 a!3186)))))

(declare-fun b!745941 () Bool)

(assert (=> b!745941 (= e!416594 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!745941 (= lt!331442 lt!331443)))

(declare-fun res!502757 () Bool)

(assert (=> start!65462 (=> (not res!502757) (not e!416597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65462 (= res!502757 (validMask!0 mask!3328))))

(assert (=> start!65462 e!416597))

(assert (=> start!65462 true))

(declare-fun array_inv!15727 (array!41635) Bool)

(assert (=> start!65462 (array_inv!15727 a!3186)))

(assert (= (and start!65462 res!502757) b!745937))

(assert (= (and b!745937 res!502762) b!745933))

(assert (= (and b!745933 res!502767) b!745942))

(assert (= (and b!745942 res!502765) b!745946))

(assert (= (and b!745946 res!502760) b!745934))

(assert (= (and b!745934 res!502756) b!745939))

(assert (= (and b!745939 res!502759) b!745944))

(assert (= (and b!745944 res!502766) b!745948))

(assert (= (and b!745948 res!502763) b!745938))

(assert (= (and b!745938 res!502769) b!745940))

(assert (= (and b!745940 res!502768) b!745945))

(assert (= (and b!745945 c!81970) b!745943))

(assert (= (and b!745945 (not c!81970)) b!745949))

(assert (= (and b!745945 res!502761) b!745950))

(assert (= (and b!745950 res!502754) b!745935))

(assert (= (and b!745935 res!502764) b!745936))

(assert (= (and b!745935 (not res!502755)) b!745947))

(assert (= (and b!745947 (not res!502758)) b!745941))

(declare-fun m!696247 () Bool)

(assert (=> b!745940 m!696247))

(declare-fun m!696249 () Bool)

(assert (=> b!745949 m!696249))

(assert (=> b!745949 m!696249))

(declare-fun m!696251 () Bool)

(assert (=> b!745949 m!696251))

(declare-fun m!696253 () Bool)

(assert (=> b!745939 m!696253))

(declare-fun m!696255 () Bool)

(assert (=> b!745942 m!696255))

(declare-fun m!696257 () Bool)

(assert (=> start!65462 m!696257))

(declare-fun m!696259 () Bool)

(assert (=> start!65462 m!696259))

(assert (=> b!745936 m!696249))

(assert (=> b!745936 m!696249))

(declare-fun m!696261 () Bool)

(assert (=> b!745936 m!696261))

(declare-fun m!696263 () Bool)

(assert (=> b!745950 m!696263))

(declare-fun m!696265 () Bool)

(assert (=> b!745950 m!696265))

(declare-fun m!696267 () Bool)

(assert (=> b!745950 m!696267))

(declare-fun m!696269 () Bool)

(assert (=> b!745950 m!696269))

(assert (=> b!745950 m!696263))

(declare-fun m!696271 () Bool)

(assert (=> b!745950 m!696271))

(assert (=> b!745935 m!696249))

(assert (=> b!745935 m!696249))

(declare-fun m!696273 () Bool)

(assert (=> b!745935 m!696273))

(declare-fun m!696275 () Bool)

(assert (=> b!745935 m!696275))

(declare-fun m!696277 () Bool)

(assert (=> b!745935 m!696277))

(assert (=> b!745947 m!696267))

(declare-fun m!696279 () Bool)

(assert (=> b!745947 m!696279))

(assert (=> b!745947 m!696249))

(assert (=> b!745947 m!696249))

(assert (=> b!745947 m!696251))

(assert (=> b!745933 m!696249))

(assert (=> b!745933 m!696249))

(declare-fun m!696281 () Bool)

(assert (=> b!745933 m!696281))

(declare-fun m!696283 () Bool)

(assert (=> b!745944 m!696283))

(assert (=> b!745938 m!696249))

(assert (=> b!745938 m!696249))

(declare-fun m!696285 () Bool)

(assert (=> b!745938 m!696285))

(assert (=> b!745938 m!696285))

(assert (=> b!745938 m!696249))

(declare-fun m!696287 () Bool)

(assert (=> b!745938 m!696287))

(declare-fun m!696289 () Bool)

(assert (=> b!745934 m!696289))

(declare-fun m!696291 () Bool)

(assert (=> b!745946 m!696291))

(assert (=> b!745943 m!696249))

(assert (=> b!745943 m!696249))

(declare-fun m!696293 () Bool)

(assert (=> b!745943 m!696293))

(push 1)

