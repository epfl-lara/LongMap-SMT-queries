; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66264 () Bool)

(assert start!66264)

(declare-datatypes ((SeekEntryResult!7792 0))(
  ( (MissingZero!7792 (index!33536 (_ BitVec 32))) (Found!7792 (index!33537 (_ BitVec 32))) (Intermediate!7792 (undefined!8604 Bool) (index!33538 (_ BitVec 32)) (x!64436 (_ BitVec 32))) (Undefined!7792) (MissingVacant!7792 (index!33539 (_ BitVec 32))) )
))
(declare-fun lt!339801 () SeekEntryResult!7792)

(declare-datatypes ((array!42169 0))(
  ( (array!42170 (arr!20192 (Array (_ BitVec 32) (_ BitVec 64))) (size!20613 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42169)

(declare-fun e!425378 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!763457 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763457 (= e!425378 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!339801)))))

(declare-fun res!516434 () Bool)

(declare-fun e!425379 () Bool)

(assert (=> start!66264 (=> (not res!516434) (not e!425379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66264 (= res!516434 (validMask!0 mask!3328))))

(assert (=> start!66264 e!425379))

(assert (=> start!66264 true))

(declare-fun array_inv!15988 (array!42169) Bool)

(assert (=> start!66264 (array_inv!15988 a!3186)))

(declare-fun b!763458 () Bool)

(declare-fun res!516436 () Bool)

(assert (=> b!763458 (=> (not res!516436) (not e!425379))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763458 (= res!516436 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763459 () Bool)

(declare-fun e!425375 () Bool)

(declare-fun e!425377 () Bool)

(assert (=> b!763459 (= e!425375 e!425377)))

(declare-fun res!516426 () Bool)

(assert (=> b!763459 (=> (not res!516426) (not e!425377))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763459 (= res!516426 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20192 a!3186) j!159) mask!3328) (select (arr!20192 a!3186) j!159) a!3186 mask!3328) lt!339801))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763459 (= lt!339801 (Intermediate!7792 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763460 (= e!425378 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20192 a!3186) j!159) a!3186 mask!3328) (Found!7792 j!159))))))

(declare-fun b!763461 () Bool)

(declare-fun res!516427 () Bool)

(assert (=> b!763461 (=> (not res!516427) (not e!425379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763461 (= res!516427 (validKeyInArray!0 (select (arr!20192 a!3186) j!159)))))

(declare-fun b!763462 () Bool)

(declare-fun res!516430 () Bool)

(assert (=> b!763462 (=> (not res!516430) (not e!425375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42169 (_ BitVec 32)) Bool)

(assert (=> b!763462 (= res!516430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763463 () Bool)

(declare-fun res!516432 () Bool)

(assert (=> b!763463 (=> (not res!516432) (not e!425379))))

(assert (=> b!763463 (= res!516432 (validKeyInArray!0 k!2102))))

(declare-fun b!763464 () Bool)

(declare-fun res!516433 () Bool)

(assert (=> b!763464 (=> (not res!516433) (not e!425377))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763464 (= res!516433 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20192 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763465 () Bool)

(declare-fun res!516435 () Bool)

(assert (=> b!763465 (=> (not res!516435) (not e!425379))))

(assert (=> b!763465 (= res!516435 (and (= (size!20613 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20613 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20613 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763466 () Bool)

(declare-fun res!516431 () Bool)

(assert (=> b!763466 (=> (not res!516431) (not e!425375))))

(assert (=> b!763466 (= res!516431 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20613 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20613 a!3186))))))

(declare-fun b!763467 () Bool)

(declare-fun res!516428 () Bool)

(assert (=> b!763467 (=> (not res!516428) (not e!425375))))

(declare-datatypes ((List!14194 0))(
  ( (Nil!14191) (Cons!14190 (h!15274 (_ BitVec 64)) (t!20509 List!14194)) )
))
(declare-fun arrayNoDuplicates!0 (array!42169 (_ BitVec 32) List!14194) Bool)

(assert (=> b!763467 (= res!516428 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14191))))

(declare-fun b!763468 () Bool)

(assert (=> b!763468 (= e!425377 false)))

(declare-fun lt!339802 () Bool)

(assert (=> b!763468 (= lt!339802 e!425378)))

(declare-fun c!83902 () Bool)

(assert (=> b!763468 (= c!83902 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763469 () Bool)

(assert (=> b!763469 (= e!425379 e!425375)))

(declare-fun res!516429 () Bool)

(assert (=> b!763469 (=> (not res!516429) (not e!425375))))

(declare-fun lt!339803 () SeekEntryResult!7792)

(assert (=> b!763469 (= res!516429 (or (= lt!339803 (MissingZero!7792 i!1173)) (= lt!339803 (MissingVacant!7792 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763469 (= lt!339803 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66264 res!516434) b!763465))

(assert (= (and b!763465 res!516435) b!763461))

(assert (= (and b!763461 res!516427) b!763463))

(assert (= (and b!763463 res!516432) b!763458))

(assert (= (and b!763458 res!516436) b!763469))

(assert (= (and b!763469 res!516429) b!763462))

(assert (= (and b!763462 res!516430) b!763467))

(assert (= (and b!763467 res!516428) b!763466))

(assert (= (and b!763466 res!516431) b!763459))

(assert (= (and b!763459 res!516426) b!763464))

(assert (= (and b!763464 res!516433) b!763468))

(assert (= (and b!763468 c!83902) b!763457))

(assert (= (and b!763468 (not c!83902)) b!763460))

(declare-fun m!709943 () Bool)

(assert (=> b!763458 m!709943))

(declare-fun m!709945 () Bool)

(assert (=> b!763469 m!709945))

(declare-fun m!709947 () Bool)

(assert (=> b!763464 m!709947))

(declare-fun m!709949 () Bool)

(assert (=> b!763460 m!709949))

(assert (=> b!763460 m!709949))

(declare-fun m!709951 () Bool)

(assert (=> b!763460 m!709951))

(declare-fun m!709953 () Bool)

(assert (=> b!763467 m!709953))

(declare-fun m!709955 () Bool)

(assert (=> b!763462 m!709955))

(assert (=> b!763461 m!709949))

(assert (=> b!763461 m!709949))

(declare-fun m!709957 () Bool)

(assert (=> b!763461 m!709957))

(declare-fun m!709959 () Bool)

(assert (=> b!763463 m!709959))

(assert (=> b!763457 m!709949))

(assert (=> b!763457 m!709949))

(declare-fun m!709961 () Bool)

(assert (=> b!763457 m!709961))

(assert (=> b!763459 m!709949))

(assert (=> b!763459 m!709949))

(declare-fun m!709963 () Bool)

(assert (=> b!763459 m!709963))

(assert (=> b!763459 m!709963))

(assert (=> b!763459 m!709949))

(declare-fun m!709965 () Bool)

(assert (=> b!763459 m!709965))

(declare-fun m!709967 () Bool)

(assert (=> start!66264 m!709967))

(declare-fun m!709969 () Bool)

(assert (=> start!66264 m!709969))

(push 1)

(assert (not b!763461))

