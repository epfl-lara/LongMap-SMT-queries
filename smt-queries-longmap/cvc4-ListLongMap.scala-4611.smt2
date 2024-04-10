; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64304 () Bool)

(assert start!64304)

(declare-fun res!484119 () Bool)

(declare-fun e!404912 () Bool)

(assert (=> start!64304 (=> (not res!484119) (not e!404912))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64304 (= res!484119 (validMask!0 mask!3328))))

(assert (=> start!64304 e!404912))

(assert (=> start!64304 true))

(declare-datatypes ((array!40885 0))(
  ( (array!40886 (arr!19565 (Array (_ BitVec 32) (_ BitVec 64))) (size!19986 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40885)

(declare-fun array_inv!15361 (array!40885) Bool)

(assert (=> start!64304 (array_inv!15361 a!3186)))

(declare-fun b!722392 () Bool)

(declare-fun res!484117 () Bool)

(declare-fun e!404914 () Bool)

(assert (=> b!722392 (=> (not res!484117) (not e!404914))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722392 (= res!484117 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722393 () Bool)

(declare-fun res!484111 () Bool)

(declare-fun e!404915 () Bool)

(assert (=> b!722393 (=> (not res!484111) (not e!404915))))

(declare-datatypes ((List!13567 0))(
  ( (Nil!13564) (Cons!13563 (h!14617 (_ BitVec 64)) (t!19882 List!13567)) )
))
(declare-fun arrayNoDuplicates!0 (array!40885 (_ BitVec 32) List!13567) Bool)

(assert (=> b!722393 (= res!484111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13564))))

(declare-datatypes ((SeekEntryResult!7165 0))(
  ( (MissingZero!7165 (index!31028 (_ BitVec 32))) (Found!7165 (index!31029 (_ BitVec 32))) (Intermediate!7165 (undefined!7977 Bool) (index!31030 (_ BitVec 32)) (x!62030 (_ BitVec 32))) (Undefined!7165) (MissingVacant!7165 (index!31031 (_ BitVec 32))) )
))
(declare-fun lt!320263 () SeekEntryResult!7165)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!404911 () Bool)

(declare-fun b!722394 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40885 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722394 (= e!404911 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19565 a!3186) j!159) a!3186 mask!3328) lt!320263))))

(declare-fun b!722395 () Bool)

(declare-fun res!484115 () Bool)

(assert (=> b!722395 (=> (not res!484115) (not e!404914))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722395 (= res!484115 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19565 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722396 () Bool)

(declare-fun res!484109 () Bool)

(assert (=> b!722396 (=> (not res!484109) (not e!404912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722396 (= res!484109 (validKeyInArray!0 (select (arr!19565 a!3186) j!159)))))

(declare-fun b!722397 () Bool)

(assert (=> b!722397 (= e!404915 e!404914)))

(declare-fun res!484121 () Bool)

(assert (=> b!722397 (=> (not res!484121) (not e!404914))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722397 (= res!484121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19565 a!3186) j!159) mask!3328) (select (arr!19565 a!3186) j!159) a!3186 mask!3328) lt!320263))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722397 (= lt!320263 (Intermediate!7165 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40885 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722398 (= e!404911 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19565 a!3186) j!159) a!3186 mask!3328) (Found!7165 j!159)))))

(declare-fun b!722399 () Bool)

(declare-fun res!484113 () Bool)

(assert (=> b!722399 (=> (not res!484113) (not e!404912))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!722399 (= res!484113 (validKeyInArray!0 k!2102))))

(declare-fun b!722400 () Bool)

(declare-fun res!484112 () Bool)

(assert (=> b!722400 (=> (not res!484112) (not e!404915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40885 (_ BitVec 32)) Bool)

(assert (=> b!722400 (= res!484112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722401 () Bool)

(declare-fun res!484116 () Bool)

(assert (=> b!722401 (=> (not res!484116) (not e!404912))))

(assert (=> b!722401 (= res!484116 (and (= (size!19986 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19986 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19986 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722402 () Bool)

(declare-fun res!484118 () Bool)

(assert (=> b!722402 (=> (not res!484118) (not e!404915))))

(assert (=> b!722402 (= res!484118 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19986 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19986 a!3186))))))

(declare-fun b!722403 () Bool)

(assert (=> b!722403 (= e!404914 (not (validKeyInArray!0 (select (store (arr!19565 a!3186) i!1173 k!2102) j!159))))))

(declare-fun b!722404 () Bool)

(assert (=> b!722404 (= e!404912 e!404915)))

(declare-fun res!484120 () Bool)

(assert (=> b!722404 (=> (not res!484120) (not e!404915))))

(declare-fun lt!320264 () SeekEntryResult!7165)

(assert (=> b!722404 (= res!484120 (or (= lt!320264 (MissingZero!7165 i!1173)) (= lt!320264 (MissingVacant!7165 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40885 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722404 (= lt!320264 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722405 () Bool)

(declare-fun res!484114 () Bool)

(assert (=> b!722405 (=> (not res!484114) (not e!404912))))

(declare-fun arrayContainsKey!0 (array!40885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722405 (= res!484114 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722406 () Bool)

(declare-fun res!484110 () Bool)

(assert (=> b!722406 (=> (not res!484110) (not e!404914))))

(assert (=> b!722406 (= res!484110 e!404911)))

(declare-fun c!79513 () Bool)

(assert (=> b!722406 (= c!79513 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64304 res!484119) b!722401))

(assert (= (and b!722401 res!484116) b!722396))

(assert (= (and b!722396 res!484109) b!722399))

(assert (= (and b!722399 res!484113) b!722405))

(assert (= (and b!722405 res!484114) b!722404))

(assert (= (and b!722404 res!484120) b!722400))

(assert (= (and b!722400 res!484112) b!722393))

(assert (= (and b!722393 res!484111) b!722402))

(assert (= (and b!722402 res!484118) b!722397))

(assert (= (and b!722397 res!484121) b!722395))

(assert (= (and b!722395 res!484115) b!722406))

(assert (= (and b!722406 c!79513) b!722394))

(assert (= (and b!722406 (not c!79513)) b!722398))

(assert (= (and b!722406 res!484110) b!722392))

(assert (= (and b!722392 res!484117) b!722403))

(declare-fun m!676929 () Bool)

(assert (=> start!64304 m!676929))

(declare-fun m!676931 () Bool)

(assert (=> start!64304 m!676931))

(declare-fun m!676933 () Bool)

(assert (=> b!722400 m!676933))

(declare-fun m!676935 () Bool)

(assert (=> b!722396 m!676935))

(assert (=> b!722396 m!676935))

(declare-fun m!676937 () Bool)

(assert (=> b!722396 m!676937))

(declare-fun m!676939 () Bool)

(assert (=> b!722405 m!676939))

(declare-fun m!676941 () Bool)

(assert (=> b!722403 m!676941))

(declare-fun m!676943 () Bool)

(assert (=> b!722403 m!676943))

(assert (=> b!722403 m!676943))

(declare-fun m!676945 () Bool)

(assert (=> b!722403 m!676945))

(assert (=> b!722397 m!676935))

(assert (=> b!722397 m!676935))

(declare-fun m!676947 () Bool)

(assert (=> b!722397 m!676947))

(assert (=> b!722397 m!676947))

(assert (=> b!722397 m!676935))

(declare-fun m!676949 () Bool)

(assert (=> b!722397 m!676949))

(declare-fun m!676951 () Bool)

(assert (=> b!722393 m!676951))

(assert (=> b!722398 m!676935))

(assert (=> b!722398 m!676935))

(declare-fun m!676953 () Bool)

(assert (=> b!722398 m!676953))

(assert (=> b!722394 m!676935))

(assert (=> b!722394 m!676935))

(declare-fun m!676955 () Bool)

(assert (=> b!722394 m!676955))

(declare-fun m!676957 () Bool)

(assert (=> b!722399 m!676957))

(declare-fun m!676959 () Bool)

(assert (=> b!722395 m!676959))

(declare-fun m!676961 () Bool)

(assert (=> b!722404 m!676961))

(push 1)

(assert (not b!722396))

(assert (not b!722399))

(assert (not b!722394))

(assert (not b!722400))

(assert (not b!722405))

(assert (not b!722393))

(assert (not start!64304))

(assert (not b!722404))

(assert (not b!722403))

(assert (not b!722398))

(assert (not b!722397))

(check-sat)

