; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66344 () Bool)

(assert start!66344)

(declare-datatypes ((array!42127 0))(
  ( (array!42128 (arr!20167 (Array (_ BitVec 32) (_ BitVec 64))) (size!20587 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42127)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425492 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7723 0))(
  ( (MissingZero!7723 (index!33260 (_ BitVec 32))) (Found!7723 (index!33261 (_ BitVec 32))) (Intermediate!7723 (undefined!8535 Bool) (index!33262 (_ BitVec 32)) (x!64330 (_ BitVec 32))) (Undefined!7723) (MissingVacant!7723 (index!33263 (_ BitVec 32))) )
))
(declare-fun lt!339894 () SeekEntryResult!7723)

(declare-fun b!763304 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!763304 (= e!425492 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20167 a!3186) j!159) a!3186 mask!3328) lt!339894)))))

(declare-fun b!763305 () Bool)

(declare-fun e!425495 () Bool)

(declare-fun e!425491 () Bool)

(assert (=> b!763305 (= e!425495 e!425491)))

(declare-fun res!516022 () Bool)

(assert (=> b!763305 (=> (not res!516022) (not e!425491))))

(declare-fun lt!339892 () SeekEntryResult!7723)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763305 (= res!516022 (or (= lt!339892 (MissingZero!7723 i!1173)) (= lt!339892 (MissingVacant!7723 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!763305 (= lt!339892 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763306 () Bool)

(declare-fun res!516026 () Bool)

(assert (=> b!763306 (=> (not res!516026) (not e!425495))))

(declare-fun arrayContainsKey!0 (array!42127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763306 (= res!516026 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763307 () Bool)

(declare-fun res!516020 () Bool)

(assert (=> b!763307 (=> (not res!516020) (not e!425491))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763307 (= res!516020 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20587 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20587 a!3186))))))

(declare-fun b!763308 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42127 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!763308 (= e!425492 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20167 a!3186) j!159) a!3186 mask!3328) (Found!7723 j!159))))))

(declare-fun res!516024 () Bool)

(assert (=> start!66344 (=> (not res!516024) (not e!425495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66344 (= res!516024 (validMask!0 mask!3328))))

(assert (=> start!66344 e!425495))

(assert (=> start!66344 true))

(declare-fun array_inv!16026 (array!42127) Bool)

(assert (=> start!66344 (array_inv!16026 a!3186)))

(declare-fun b!763309 () Bool)

(declare-fun res!516029 () Bool)

(assert (=> b!763309 (=> (not res!516029) (not e!425495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763309 (= res!516029 (validKeyInArray!0 (select (arr!20167 a!3186) j!159)))))

(declare-fun b!763310 () Bool)

(declare-fun e!425494 () Bool)

(assert (=> b!763310 (= e!425494 false)))

(declare-fun lt!339893 () Bool)

(assert (=> b!763310 (= lt!339893 e!425492)))

(declare-fun c!84032 () Bool)

(assert (=> b!763310 (= c!84032 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763311 () Bool)

(assert (=> b!763311 (= e!425491 e!425494)))

(declare-fun res!516025 () Bool)

(assert (=> b!763311 (=> (not res!516025) (not e!425494))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763311 (= res!516025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20167 a!3186) j!159) mask!3328) (select (arr!20167 a!3186) j!159) a!3186 mask!3328) lt!339894))))

(assert (=> b!763311 (= lt!339894 (Intermediate!7723 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763312 () Bool)

(declare-fun res!516023 () Bool)

(assert (=> b!763312 (=> (not res!516023) (not e!425495))))

(assert (=> b!763312 (= res!516023 (validKeyInArray!0 k0!2102))))

(declare-fun b!763313 () Bool)

(declare-fun res!516021 () Bool)

(assert (=> b!763313 (=> (not res!516021) (not e!425491))))

(declare-datatypes ((List!14076 0))(
  ( (Nil!14073) (Cons!14072 (h!15162 (_ BitVec 64)) (t!20383 List!14076)) )
))
(declare-fun arrayNoDuplicates!0 (array!42127 (_ BitVec 32) List!14076) Bool)

(assert (=> b!763313 (= res!516021 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14073))))

(declare-fun b!763314 () Bool)

(declare-fun res!516019 () Bool)

(assert (=> b!763314 (=> (not res!516019) (not e!425494))))

(assert (=> b!763314 (= res!516019 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20167 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763315 () Bool)

(declare-fun res!516027 () Bool)

(assert (=> b!763315 (=> (not res!516027) (not e!425491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42127 (_ BitVec 32)) Bool)

(assert (=> b!763315 (= res!516027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763316 () Bool)

(declare-fun res!516028 () Bool)

(assert (=> b!763316 (=> (not res!516028) (not e!425495))))

(assert (=> b!763316 (= res!516028 (and (= (size!20587 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20587 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20587 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66344 res!516024) b!763316))

(assert (= (and b!763316 res!516028) b!763309))

(assert (= (and b!763309 res!516029) b!763312))

(assert (= (and b!763312 res!516023) b!763306))

(assert (= (and b!763306 res!516026) b!763305))

(assert (= (and b!763305 res!516022) b!763315))

(assert (= (and b!763315 res!516027) b!763313))

(assert (= (and b!763313 res!516021) b!763307))

(assert (= (and b!763307 res!516020) b!763311))

(assert (= (and b!763311 res!516025) b!763314))

(assert (= (and b!763314 res!516019) b!763310))

(assert (= (and b!763310 c!84032) b!763304))

(assert (= (and b!763310 (not c!84032)) b!763308))

(declare-fun m!710371 () Bool)

(assert (=> b!763313 m!710371))

(declare-fun m!710373 () Bool)

(assert (=> b!763304 m!710373))

(assert (=> b!763304 m!710373))

(declare-fun m!710375 () Bool)

(assert (=> b!763304 m!710375))

(declare-fun m!710377 () Bool)

(assert (=> b!763306 m!710377))

(declare-fun m!710379 () Bool)

(assert (=> b!763314 m!710379))

(declare-fun m!710381 () Bool)

(assert (=> b!763315 m!710381))

(declare-fun m!710383 () Bool)

(assert (=> b!763312 m!710383))

(assert (=> b!763308 m!710373))

(assert (=> b!763308 m!710373))

(declare-fun m!710385 () Bool)

(assert (=> b!763308 m!710385))

(assert (=> b!763311 m!710373))

(assert (=> b!763311 m!710373))

(declare-fun m!710387 () Bool)

(assert (=> b!763311 m!710387))

(assert (=> b!763311 m!710387))

(assert (=> b!763311 m!710373))

(declare-fun m!710389 () Bool)

(assert (=> b!763311 m!710389))

(declare-fun m!710391 () Bool)

(assert (=> start!66344 m!710391))

(declare-fun m!710393 () Bool)

(assert (=> start!66344 m!710393))

(declare-fun m!710395 () Bool)

(assert (=> b!763305 m!710395))

(assert (=> b!763309 m!710373))

(assert (=> b!763309 m!710373))

(declare-fun m!710397 () Bool)

(assert (=> b!763309 m!710397))

(check-sat (not start!66344) (not b!763305) (not b!763313) (not b!763304) (not b!763306) (not b!763311) (not b!763309) (not b!763315) (not b!763312) (not b!763308))
(check-sat)
