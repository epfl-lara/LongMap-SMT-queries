; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64316 () Bool)

(assert start!64316)

(declare-fun b!722645 () Bool)

(declare-fun res!484335 () Bool)

(declare-fun e!405001 () Bool)

(assert (=> b!722645 (=> (not res!484335) (not e!405001))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722645 (= res!484335 (validKeyInArray!0 k!2102))))

(declare-fun b!722646 () Bool)

(declare-fun res!484337 () Bool)

(assert (=> b!722646 (=> (not res!484337) (not e!405001))))

(declare-datatypes ((array!40897 0))(
  ( (array!40898 (arr!19571 (Array (_ BitVec 32) (_ BitVec 64))) (size!19992 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40897)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722646 (= res!484337 (validKeyInArray!0 (select (arr!19571 a!3186) j!159)))))

(declare-fun b!722647 () Bool)

(declare-fun res!484330 () Bool)

(declare-fun e!405004 () Bool)

(assert (=> b!722647 (=> (not res!484330) (not e!405004))))

(declare-datatypes ((List!13573 0))(
  ( (Nil!13570) (Cons!13569 (h!14623 (_ BitVec 64)) (t!19888 List!13573)) )
))
(declare-fun arrayNoDuplicates!0 (array!40897 (_ BitVec 32) List!13573) Bool)

(assert (=> b!722647 (= res!484330 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13570))))

(declare-fun b!722648 () Bool)

(declare-fun res!484333 () Bool)

(declare-fun e!405005 () Bool)

(assert (=> b!722648 (=> (not res!484333) (not e!405005))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722648 (= res!484333 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19571 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722649 () Bool)

(assert (=> b!722649 (= e!405004 e!405005)))

(declare-fun res!484328 () Bool)

(assert (=> b!722649 (=> (not res!484328) (not e!405005))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7171 0))(
  ( (MissingZero!7171 (index!31052 (_ BitVec 32))) (Found!7171 (index!31053 (_ BitVec 32))) (Intermediate!7171 (undefined!7983 Bool) (index!31054 (_ BitVec 32)) (x!62052 (_ BitVec 32))) (Undefined!7171) (MissingVacant!7171 (index!31055 (_ BitVec 32))) )
))
(declare-fun lt!320370 () SeekEntryResult!7171)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40897 (_ BitVec 32)) SeekEntryResult!7171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722649 (= res!484328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19571 a!3186) j!159) mask!3328) (select (arr!19571 a!3186) j!159) a!3186 mask!3328) lt!320370))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722649 (= lt!320370 (Intermediate!7171 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722650 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!405002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40897 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!722650 (= e!405002 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19571 a!3186) j!159) a!3186 mask!3328) (Found!7171 j!159)))))

(declare-fun b!722651 () Bool)

(declare-fun res!484331 () Bool)

(assert (=> b!722651 (=> (not res!484331) (not e!405001))))

(assert (=> b!722651 (= res!484331 (and (= (size!19992 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19992 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19992 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722652 () Bool)

(assert (=> b!722652 (= e!405001 e!405004)))

(declare-fun res!484329 () Bool)

(assert (=> b!722652 (=> (not res!484329) (not e!405004))))

(declare-fun lt!320372 () SeekEntryResult!7171)

(assert (=> b!722652 (= res!484329 (or (= lt!320372 (MissingZero!7171 i!1173)) (= lt!320372 (MissingVacant!7171 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40897 (_ BitVec 32)) SeekEntryResult!7171)

(assert (=> b!722652 (= lt!320372 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722653 () Bool)

(declare-fun res!484336 () Bool)

(assert (=> b!722653 (=> (not res!484336) (not e!405004))))

(assert (=> b!722653 (= res!484336 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19992 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19992 a!3186))))))

(declare-fun b!722654 () Bool)

(assert (=> b!722654 (= e!405005 false)))

(declare-fun lt!320368 () array!40897)

(declare-fun lt!320367 () SeekEntryResult!7171)

(declare-fun lt!320369 () (_ BitVec 64))

(assert (=> b!722654 (= lt!320367 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320369 lt!320368 mask!3328))))

(declare-fun lt!320371 () SeekEntryResult!7171)

(assert (=> b!722654 (= lt!320371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320369 mask!3328) lt!320369 lt!320368 mask!3328))))

(assert (=> b!722654 (= lt!320369 (select (store (arr!19571 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722654 (= lt!320368 (array!40898 (store (arr!19571 a!3186) i!1173 k!2102) (size!19992 a!3186)))))

(declare-fun b!722655 () Bool)

(declare-fun res!484332 () Bool)

(assert (=> b!722655 (=> (not res!484332) (not e!405004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40897 (_ BitVec 32)) Bool)

(assert (=> b!722655 (= res!484332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722656 () Bool)

(declare-fun res!484334 () Bool)

(assert (=> b!722656 (=> (not res!484334) (not e!405001))))

(declare-fun arrayContainsKey!0 (array!40897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722656 (= res!484334 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!484327 () Bool)

(assert (=> start!64316 (=> (not res!484327) (not e!405001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64316 (= res!484327 (validMask!0 mask!3328))))

(assert (=> start!64316 e!405001))

(assert (=> start!64316 true))

(declare-fun array_inv!15367 (array!40897) Bool)

(assert (=> start!64316 (array_inv!15367 a!3186)))

(declare-fun b!722657 () Bool)

(declare-fun res!484326 () Bool)

(assert (=> b!722657 (=> (not res!484326) (not e!405005))))

(assert (=> b!722657 (= res!484326 e!405002)))

(declare-fun c!79531 () Bool)

(assert (=> b!722657 (= c!79531 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722658 () Bool)

(assert (=> b!722658 (= e!405002 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19571 a!3186) j!159) a!3186 mask!3328) lt!320370))))

(assert (= (and start!64316 res!484327) b!722651))

(assert (= (and b!722651 res!484331) b!722646))

(assert (= (and b!722646 res!484337) b!722645))

(assert (= (and b!722645 res!484335) b!722656))

(assert (= (and b!722656 res!484334) b!722652))

(assert (= (and b!722652 res!484329) b!722655))

(assert (= (and b!722655 res!484332) b!722647))

(assert (= (and b!722647 res!484330) b!722653))

(assert (= (and b!722653 res!484336) b!722649))

(assert (= (and b!722649 res!484328) b!722648))

(assert (= (and b!722648 res!484333) b!722657))

(assert (= (and b!722657 c!79531) b!722658))

(assert (= (and b!722657 (not c!79531)) b!722650))

(assert (= (and b!722657 res!484326) b!722654))

(declare-fun m!677153 () Bool)

(assert (=> b!722658 m!677153))

(assert (=> b!722658 m!677153))

(declare-fun m!677155 () Bool)

(assert (=> b!722658 m!677155))

(declare-fun m!677157 () Bool)

(assert (=> b!722652 m!677157))

(declare-fun m!677159 () Bool)

(assert (=> b!722655 m!677159))

(assert (=> b!722646 m!677153))

(assert (=> b!722646 m!677153))

(declare-fun m!677161 () Bool)

(assert (=> b!722646 m!677161))

(declare-fun m!677163 () Bool)

(assert (=> b!722656 m!677163))

(declare-fun m!677165 () Bool)

(assert (=> b!722645 m!677165))

(assert (=> b!722649 m!677153))

(assert (=> b!722649 m!677153))

(declare-fun m!677167 () Bool)

(assert (=> b!722649 m!677167))

(assert (=> b!722649 m!677167))

(assert (=> b!722649 m!677153))

(declare-fun m!677169 () Bool)

(assert (=> b!722649 m!677169))

(declare-fun m!677171 () Bool)

(assert (=> b!722647 m!677171))

(declare-fun m!677173 () Bool)

(assert (=> start!64316 m!677173))

(declare-fun m!677175 () Bool)

(assert (=> start!64316 m!677175))

(declare-fun m!677177 () Bool)

(assert (=> b!722654 m!677177))

(declare-fun m!677179 () Bool)

(assert (=> b!722654 m!677179))

(declare-fun m!677181 () Bool)

(assert (=> b!722654 m!677181))

(declare-fun m!677183 () Bool)

(assert (=> b!722654 m!677183))

(assert (=> b!722654 m!677179))

(declare-fun m!677185 () Bool)

(assert (=> b!722654 m!677185))

(declare-fun m!677187 () Bool)

(assert (=> b!722648 m!677187))

(assert (=> b!722650 m!677153))

(assert (=> b!722650 m!677153))

(declare-fun m!677189 () Bool)

(assert (=> b!722650 m!677189))

(push 1)

