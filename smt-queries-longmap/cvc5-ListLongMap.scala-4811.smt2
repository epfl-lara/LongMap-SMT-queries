; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66206 () Bool)

(assert start!66206)

(declare-fun b!762372 () Bool)

(declare-fun res!515491 () Bool)

(declare-fun e!424973 () Bool)

(assert (=> b!762372 (=> (not res!515491) (not e!424973))))

(declare-datatypes ((array!42111 0))(
  ( (array!42112 (arr!20163 (Array (_ BitVec 32) (_ BitVec 64))) (size!20584 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42111)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42111 (_ BitVec 32)) Bool)

(assert (=> b!762372 (= res!515491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762373 () Bool)

(declare-fun e!424974 () Bool)

(assert (=> b!762373 (= e!424974 e!424973)))

(declare-fun res!515489 () Bool)

(assert (=> b!762373 (=> (not res!515489) (not e!424973))))

(declare-datatypes ((SeekEntryResult!7763 0))(
  ( (MissingZero!7763 (index!33420 (_ BitVec 32))) (Found!7763 (index!33421 (_ BitVec 32))) (Intermediate!7763 (undefined!8575 Bool) (index!33422 (_ BitVec 32)) (x!64335 (_ BitVec 32))) (Undefined!7763) (MissingVacant!7763 (index!33423 (_ BitVec 32))) )
))
(declare-fun lt!339557 () SeekEntryResult!7763)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762373 (= res!515489 (or (= lt!339557 (MissingZero!7763 i!1173)) (= lt!339557 (MissingVacant!7763 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42111 (_ BitVec 32)) SeekEntryResult!7763)

(assert (=> b!762373 (= lt!339557 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762374 () Bool)

(declare-fun res!515484 () Bool)

(assert (=> b!762374 (=> (not res!515484) (not e!424974))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!762374 (= res!515484 (and (= (size!20584 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20584 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20584 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762376 () Bool)

(declare-fun res!515483 () Bool)

(assert (=> b!762376 (=> (not res!515483) (not e!424973))))

(declare-datatypes ((List!14165 0))(
  ( (Nil!14162) (Cons!14161 (h!15245 (_ BitVec 64)) (t!20480 List!14165)) )
))
(declare-fun arrayNoDuplicates!0 (array!42111 (_ BitVec 32) List!14165) Bool)

(assert (=> b!762376 (= res!515483 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14162))))

(declare-fun b!762377 () Bool)

(assert (=> b!762377 (= e!424973 false)))

(declare-fun lt!339556 () SeekEntryResult!7763)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42111 (_ BitVec 32)) SeekEntryResult!7763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762377 (= lt!339556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20163 a!3186) j!159) mask!3328) (select (arr!20163 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762378 () Bool)

(declare-fun res!515487 () Bool)

(assert (=> b!762378 (=> (not res!515487) (not e!424974))))

(declare-fun arrayContainsKey!0 (array!42111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762378 (= res!515487 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762379 () Bool)

(declare-fun res!515486 () Bool)

(assert (=> b!762379 (=> (not res!515486) (not e!424974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762379 (= res!515486 (validKeyInArray!0 k!2102))))

(declare-fun b!762380 () Bool)

(declare-fun res!515488 () Bool)

(assert (=> b!762380 (=> (not res!515488) (not e!424974))))

(assert (=> b!762380 (= res!515488 (validKeyInArray!0 (select (arr!20163 a!3186) j!159)))))

(declare-fun res!515490 () Bool)

(assert (=> start!66206 (=> (not res!515490) (not e!424974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66206 (= res!515490 (validMask!0 mask!3328))))

(assert (=> start!66206 e!424974))

(assert (=> start!66206 true))

(declare-fun array_inv!15959 (array!42111) Bool)

(assert (=> start!66206 (array_inv!15959 a!3186)))

(declare-fun b!762375 () Bool)

(declare-fun res!515485 () Bool)

(assert (=> b!762375 (=> (not res!515485) (not e!424973))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762375 (= res!515485 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20584 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20584 a!3186))))))

(assert (= (and start!66206 res!515490) b!762374))

(assert (= (and b!762374 res!515484) b!762380))

(assert (= (and b!762380 res!515488) b!762379))

(assert (= (and b!762379 res!515486) b!762378))

(assert (= (and b!762378 res!515487) b!762373))

(assert (= (and b!762373 res!515489) b!762372))

(assert (= (and b!762372 res!515491) b!762376))

(assert (= (and b!762376 res!515483) b!762375))

(assert (= (and b!762375 res!515485) b!762377))

(declare-fun m!709131 () Bool)

(assert (=> start!66206 m!709131))

(declare-fun m!709133 () Bool)

(assert (=> start!66206 m!709133))

(declare-fun m!709135 () Bool)

(assert (=> b!762376 m!709135))

(declare-fun m!709137 () Bool)

(assert (=> b!762372 m!709137))

(declare-fun m!709139 () Bool)

(assert (=> b!762379 m!709139))

(declare-fun m!709141 () Bool)

(assert (=> b!762380 m!709141))

(assert (=> b!762380 m!709141))

(declare-fun m!709143 () Bool)

(assert (=> b!762380 m!709143))

(declare-fun m!709145 () Bool)

(assert (=> b!762373 m!709145))

(declare-fun m!709147 () Bool)

(assert (=> b!762378 m!709147))

(assert (=> b!762377 m!709141))

(assert (=> b!762377 m!709141))

(declare-fun m!709149 () Bool)

(assert (=> b!762377 m!709149))

(assert (=> b!762377 m!709149))

(assert (=> b!762377 m!709141))

(declare-fun m!709151 () Bool)

(assert (=> b!762377 m!709151))

(push 1)

