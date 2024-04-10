; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66198 () Bool)

(assert start!66198)

(declare-fun b!762264 () Bool)

(declare-fun e!424937 () Bool)

(assert (=> b!762264 (= e!424937 false)))

(declare-datatypes ((array!42103 0))(
  ( (array!42104 (arr!20159 (Array (_ BitVec 32) (_ BitVec 64))) (size!20580 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42103)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!339532 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762264 (= lt!339532 (toIndex!0 (select (arr!20159 a!3186) j!159) mask!3328))))

(declare-fun b!762265 () Bool)

(declare-fun res!515377 () Bool)

(declare-fun e!424938 () Bool)

(assert (=> b!762265 (=> (not res!515377) (not e!424938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762265 (= res!515377 (validKeyInArray!0 (select (arr!20159 a!3186) j!159)))))

(declare-fun res!515380 () Bool)

(assert (=> start!66198 (=> (not res!515380) (not e!424938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66198 (= res!515380 (validMask!0 mask!3328))))

(assert (=> start!66198 e!424938))

(assert (=> start!66198 true))

(declare-fun array_inv!15955 (array!42103) Bool)

(assert (=> start!66198 (array_inv!15955 a!3186)))

(declare-fun b!762266 () Bool)

(declare-fun res!515376 () Bool)

(assert (=> b!762266 (=> (not res!515376) (not e!424938))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!762266 (= res!515376 (validKeyInArray!0 k!2102))))

(declare-fun b!762267 () Bool)

(declare-fun res!515381 () Bool)

(assert (=> b!762267 (=> (not res!515381) (not e!424937))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762267 (= res!515381 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20580 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20580 a!3186))))))

(declare-fun b!762268 () Bool)

(declare-fun res!515382 () Bool)

(assert (=> b!762268 (=> (not res!515382) (not e!424938))))

(declare-fun arrayContainsKey!0 (array!42103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762268 (= res!515382 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762269 () Bool)

(declare-fun res!515375 () Bool)

(assert (=> b!762269 (=> (not res!515375) (not e!424937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42103 (_ BitVec 32)) Bool)

(assert (=> b!762269 (= res!515375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762270 () Bool)

(assert (=> b!762270 (= e!424938 e!424937)))

(declare-fun res!515383 () Bool)

(assert (=> b!762270 (=> (not res!515383) (not e!424937))))

(declare-datatypes ((SeekEntryResult!7759 0))(
  ( (MissingZero!7759 (index!33404 (_ BitVec 32))) (Found!7759 (index!33405 (_ BitVec 32))) (Intermediate!7759 (undefined!8571 Bool) (index!33406 (_ BitVec 32)) (x!64315 (_ BitVec 32))) (Undefined!7759) (MissingVacant!7759 (index!33407 (_ BitVec 32))) )
))
(declare-fun lt!339533 () SeekEntryResult!7759)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762270 (= res!515383 (or (= lt!339533 (MissingZero!7759 i!1173)) (= lt!339533 (MissingVacant!7759 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42103 (_ BitVec 32)) SeekEntryResult!7759)

(assert (=> b!762270 (= lt!339533 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762271 () Bool)

(declare-fun res!515378 () Bool)

(assert (=> b!762271 (=> (not res!515378) (not e!424938))))

(assert (=> b!762271 (= res!515378 (and (= (size!20580 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20580 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20580 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762272 () Bool)

(declare-fun res!515379 () Bool)

(assert (=> b!762272 (=> (not res!515379) (not e!424937))))

(declare-datatypes ((List!14161 0))(
  ( (Nil!14158) (Cons!14157 (h!15241 (_ BitVec 64)) (t!20476 List!14161)) )
))
(declare-fun arrayNoDuplicates!0 (array!42103 (_ BitVec 32) List!14161) Bool)

(assert (=> b!762272 (= res!515379 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14158))))

(assert (= (and start!66198 res!515380) b!762271))

(assert (= (and b!762271 res!515378) b!762265))

(assert (= (and b!762265 res!515377) b!762266))

(assert (= (and b!762266 res!515376) b!762268))

(assert (= (and b!762268 res!515382) b!762270))

(assert (= (and b!762270 res!515383) b!762269))

(assert (= (and b!762269 res!515375) b!762272))

(assert (= (and b!762272 res!515379) b!762267))

(assert (= (and b!762267 res!515381) b!762264))

(declare-fun m!709045 () Bool)

(assert (=> b!762269 m!709045))

(declare-fun m!709047 () Bool)

(assert (=> b!762268 m!709047))

(declare-fun m!709049 () Bool)

(assert (=> b!762272 m!709049))

(declare-fun m!709051 () Bool)

(assert (=> b!762270 m!709051))

(declare-fun m!709053 () Bool)

(assert (=> b!762266 m!709053))

(declare-fun m!709055 () Bool)

(assert (=> start!66198 m!709055))

(declare-fun m!709057 () Bool)

(assert (=> start!66198 m!709057))

(declare-fun m!709059 () Bool)

(assert (=> b!762265 m!709059))

(assert (=> b!762265 m!709059))

(declare-fun m!709061 () Bool)

(assert (=> b!762265 m!709061))

(assert (=> b!762264 m!709059))

(assert (=> b!762264 m!709059))

(declare-fun m!709063 () Bool)

(assert (=> b!762264 m!709063))

(push 1)

(assert (not start!66198))

(assert (not b!762265))

(assert (not b!762264))

(assert (not b!762268))

(assert (not b!762270))

