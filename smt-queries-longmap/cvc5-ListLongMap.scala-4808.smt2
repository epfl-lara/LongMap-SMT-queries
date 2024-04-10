; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66188 () Bool)

(assert start!66188)

(declare-fun b!762143 () Bool)

(declare-fun e!424891 () Bool)

(assert (=> b!762143 (= e!424891 false)))

(declare-fun lt!339503 () Bool)

(declare-datatypes ((array!42093 0))(
  ( (array!42094 (arr!20154 (Array (_ BitVec 32) (_ BitVec 64))) (size!20575 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42093)

(declare-datatypes ((List!14156 0))(
  ( (Nil!14153) (Cons!14152 (h!15236 (_ BitVec 64)) (t!20471 List!14156)) )
))
(declare-fun arrayNoDuplicates!0 (array!42093 (_ BitVec 32) List!14156) Bool)

(assert (=> b!762143 (= lt!339503 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14153))))

(declare-fun b!762144 () Bool)

(declare-fun res!515257 () Bool)

(assert (=> b!762144 (=> (not res!515257) (not e!424891))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42093 (_ BitVec 32)) Bool)

(assert (=> b!762144 (= res!515257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762145 () Bool)

(declare-fun e!424892 () Bool)

(assert (=> b!762145 (= e!424892 e!424891)))

(declare-fun res!515256 () Bool)

(assert (=> b!762145 (=> (not res!515256) (not e!424891))))

(declare-datatypes ((SeekEntryResult!7754 0))(
  ( (MissingZero!7754 (index!33384 (_ BitVec 32))) (Found!7754 (index!33385 (_ BitVec 32))) (Intermediate!7754 (undefined!8566 Bool) (index!33386 (_ BitVec 32)) (x!64302 (_ BitVec 32))) (Undefined!7754) (MissingVacant!7754 (index!33387 (_ BitVec 32))) )
))
(declare-fun lt!339502 () SeekEntryResult!7754)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762145 (= res!515256 (or (= lt!339502 (MissingZero!7754 i!1173)) (= lt!339502 (MissingVacant!7754 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42093 (_ BitVec 32)) SeekEntryResult!7754)

(assert (=> b!762145 (= lt!339502 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762146 () Bool)

(declare-fun res!515254 () Bool)

(assert (=> b!762146 (=> (not res!515254) (not e!424892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762146 (= res!515254 (validKeyInArray!0 k!2102))))

(declare-fun b!762148 () Bool)

(declare-fun res!515258 () Bool)

(assert (=> b!762148 (=> (not res!515258) (not e!424892))))

(declare-fun arrayContainsKey!0 (array!42093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762148 (= res!515258 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762149 () Bool)

(declare-fun res!515255 () Bool)

(assert (=> b!762149 (=> (not res!515255) (not e!424892))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!762149 (= res!515255 (and (= (size!20575 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20575 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20575 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515259 () Bool)

(assert (=> start!66188 (=> (not res!515259) (not e!424892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66188 (= res!515259 (validMask!0 mask!3328))))

(assert (=> start!66188 e!424892))

(declare-fun array_inv!15950 (array!42093) Bool)

(assert (=> start!66188 (array_inv!15950 a!3186)))

(assert (=> start!66188 true))

(declare-fun b!762147 () Bool)

(declare-fun res!515260 () Bool)

(assert (=> b!762147 (=> (not res!515260) (not e!424892))))

(assert (=> b!762147 (= res!515260 (validKeyInArray!0 (select (arr!20154 a!3186) j!159)))))

(assert (= (and start!66188 res!515259) b!762149))

(assert (= (and b!762149 res!515255) b!762147))

(assert (= (and b!762147 res!515260) b!762146))

(assert (= (and b!762146 res!515254) b!762148))

(assert (= (and b!762148 res!515258) b!762145))

(assert (= (and b!762145 res!515256) b!762144))

(assert (= (and b!762144 res!515257) b!762143))

(declare-fun m!708951 () Bool)

(assert (=> b!762147 m!708951))

(assert (=> b!762147 m!708951))

(declare-fun m!708953 () Bool)

(assert (=> b!762147 m!708953))

(declare-fun m!708955 () Bool)

(assert (=> b!762144 m!708955))

(declare-fun m!708957 () Bool)

(assert (=> b!762146 m!708957))

(declare-fun m!708959 () Bool)

(assert (=> start!66188 m!708959))

(declare-fun m!708961 () Bool)

(assert (=> start!66188 m!708961))

(declare-fun m!708963 () Bool)

(assert (=> b!762145 m!708963))

(declare-fun m!708965 () Bool)

(assert (=> b!762148 m!708965))

(declare-fun m!708967 () Bool)

(assert (=> b!762143 m!708967))

(push 1)

