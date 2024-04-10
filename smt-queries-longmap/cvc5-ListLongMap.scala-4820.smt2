; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66260 () Bool)

(assert start!66260)

(declare-fun b!763379 () Bool)

(declare-fun res!516369 () Bool)

(declare-fun e!425347 () Bool)

(assert (=> b!763379 (=> (not res!516369) (not e!425347))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42165 0))(
  ( (array!42166 (arr!20190 (Array (_ BitVec 32) (_ BitVec 64))) (size!20611 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42165)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763379 (= res!516369 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20611 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20611 a!3186))))))

(declare-fun b!763380 () Bool)

(declare-fun res!516370 () Bool)

(declare-fun e!425346 () Bool)

(assert (=> b!763380 (=> (not res!516370) (not e!425346))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763380 (= res!516370 (and (= (size!20611 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20611 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20611 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763381 () Bool)

(declare-fun res!516363 () Bool)

(assert (=> b!763381 (=> (not res!516363) (not e!425346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763381 (= res!516363 (validKeyInArray!0 (select (arr!20190 a!3186) j!159)))))

(declare-fun b!763382 () Bool)

(declare-fun res!516368 () Bool)

(assert (=> b!763382 (=> (not res!516368) (not e!425346))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!763382 (= res!516368 (validKeyInArray!0 k!2102))))

(declare-fun b!763383 () Bool)

(declare-fun res!516367 () Bool)

(assert (=> b!763383 (=> (not res!516367) (not e!425347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42165 (_ BitVec 32)) Bool)

(assert (=> b!763383 (= res!516367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!425348 () Bool)

(declare-fun b!763384 () Bool)

(declare-datatypes ((SeekEntryResult!7790 0))(
  ( (MissingZero!7790 (index!33528 (_ BitVec 32))) (Found!7790 (index!33529 (_ BitVec 32))) (Intermediate!7790 (undefined!8602 Bool) (index!33530 (_ BitVec 32)) (x!64434 (_ BitVec 32))) (Undefined!7790) (MissingVacant!7790 (index!33531 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42165 (_ BitVec 32)) SeekEntryResult!7790)

(assert (=> b!763384 (= e!425348 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20190 a!3186) j!159) a!3186 mask!3328) (Found!7790 j!159))))))

(declare-fun b!763385 () Bool)

(declare-fun res!516360 () Bool)

(declare-fun e!425345 () Bool)

(assert (=> b!763385 (=> (not res!516360) (not e!425345))))

(assert (=> b!763385 (= res!516360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20190 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!516361 () Bool)

(assert (=> start!66260 (=> (not res!516361) (not e!425346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66260 (= res!516361 (validMask!0 mask!3328))))

(assert (=> start!66260 e!425346))

(assert (=> start!66260 true))

(declare-fun array_inv!15986 (array!42165) Bool)

(assert (=> start!66260 (array_inv!15986 a!3186)))

(declare-fun b!763386 () Bool)

(assert (=> b!763386 (= e!425345 false)))

(declare-fun lt!339784 () Bool)

(assert (=> b!763386 (= lt!339784 e!425348)))

(declare-fun c!83896 () Bool)

(assert (=> b!763386 (= c!83896 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763387 () Bool)

(assert (=> b!763387 (= e!425347 e!425345)))

(declare-fun res!516362 () Bool)

(assert (=> b!763387 (=> (not res!516362) (not e!425345))))

(declare-fun lt!339785 () SeekEntryResult!7790)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42165 (_ BitVec 32)) SeekEntryResult!7790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763387 (= res!516362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20190 a!3186) j!159) mask!3328) (select (arr!20190 a!3186) j!159) a!3186 mask!3328) lt!339785))))

(assert (=> b!763387 (= lt!339785 (Intermediate!7790 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763388 () Bool)

(declare-fun res!516364 () Bool)

(assert (=> b!763388 (=> (not res!516364) (not e!425347))))

(declare-datatypes ((List!14192 0))(
  ( (Nil!14189) (Cons!14188 (h!15272 (_ BitVec 64)) (t!20507 List!14192)) )
))
(declare-fun arrayNoDuplicates!0 (array!42165 (_ BitVec 32) List!14192) Bool)

(assert (=> b!763388 (= res!516364 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14189))))

(declare-fun b!763389 () Bool)

(assert (=> b!763389 (= e!425346 e!425347)))

(declare-fun res!516365 () Bool)

(assert (=> b!763389 (=> (not res!516365) (not e!425347))))

(declare-fun lt!339783 () SeekEntryResult!7790)

(assert (=> b!763389 (= res!516365 (or (= lt!339783 (MissingZero!7790 i!1173)) (= lt!339783 (MissingVacant!7790 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42165 (_ BitVec 32)) SeekEntryResult!7790)

(assert (=> b!763389 (= lt!339783 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763390 () Bool)

(declare-fun res!516366 () Bool)

(assert (=> b!763390 (=> (not res!516366) (not e!425346))))

(declare-fun arrayContainsKey!0 (array!42165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763390 (= res!516366 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763391 () Bool)

(assert (=> b!763391 (= e!425348 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20190 a!3186) j!159) a!3186 mask!3328) lt!339785)))))

(assert (= (and start!66260 res!516361) b!763380))

(assert (= (and b!763380 res!516370) b!763381))

(assert (= (and b!763381 res!516363) b!763382))

(assert (= (and b!763382 res!516368) b!763390))

(assert (= (and b!763390 res!516366) b!763389))

(assert (= (and b!763389 res!516365) b!763383))

(assert (= (and b!763383 res!516367) b!763388))

(assert (= (and b!763388 res!516364) b!763379))

(assert (= (and b!763379 res!516369) b!763387))

(assert (= (and b!763387 res!516362) b!763385))

(assert (= (and b!763385 res!516360) b!763386))

(assert (= (and b!763386 c!83896) b!763391))

(assert (= (and b!763386 (not c!83896)) b!763384))

(declare-fun m!709887 () Bool)

(assert (=> start!66260 m!709887))

(declare-fun m!709889 () Bool)

(assert (=> start!66260 m!709889))

(declare-fun m!709891 () Bool)

(assert (=> b!763382 m!709891))

(declare-fun m!709893 () Bool)

(assert (=> b!763383 m!709893))

(declare-fun m!709895 () Bool)

(assert (=> b!763381 m!709895))

(assert (=> b!763381 m!709895))

(declare-fun m!709897 () Bool)

(assert (=> b!763381 m!709897))

(assert (=> b!763391 m!709895))

(assert (=> b!763391 m!709895))

(declare-fun m!709899 () Bool)

(assert (=> b!763391 m!709899))

(declare-fun m!709901 () Bool)

(assert (=> b!763389 m!709901))

(declare-fun m!709903 () Bool)

(assert (=> b!763390 m!709903))

(assert (=> b!763387 m!709895))

(assert (=> b!763387 m!709895))

(declare-fun m!709905 () Bool)

(assert (=> b!763387 m!709905))

(assert (=> b!763387 m!709905))

(assert (=> b!763387 m!709895))

(declare-fun m!709907 () Bool)

(assert (=> b!763387 m!709907))

(declare-fun m!709909 () Bool)

(assert (=> b!763385 m!709909))

(declare-fun m!709911 () Bool)

(assert (=> b!763388 m!709911))

(assert (=> b!763384 m!709895))

(assert (=> b!763384 m!709895))

(declare-fun m!709913 () Bool)

(assert (=> b!763384 m!709913))

(push 1)

