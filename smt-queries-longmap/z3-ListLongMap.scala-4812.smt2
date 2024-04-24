; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66332 () Bool)

(assert start!66332)

(declare-fun b!763098 () Bool)

(declare-fun res!515839 () Bool)

(declare-fun e!425417 () Bool)

(assert (=> b!763098 (=> (not res!515839) (not e!425417))))

(declare-datatypes ((array!42115 0))(
  ( (array!42116 (arr!20161 (Array (_ BitVec 32) (_ BitVec 64))) (size!20581 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42115)

(declare-datatypes ((List!14070 0))(
  ( (Nil!14067) (Cons!14066 (h!15156 (_ BitVec 64)) (t!20377 List!14070)) )
))
(declare-fun arrayNoDuplicates!0 (array!42115 (_ BitVec 32) List!14070) Bool)

(assert (=> b!763098 (= res!515839 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14067))))

(declare-fun b!763099 () Bool)

(declare-fun res!515841 () Bool)

(declare-fun e!425415 () Bool)

(assert (=> b!763099 (=> (not res!515841) (not e!425415))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763099 (= res!515841 (validKeyInArray!0 (select (arr!20161 a!3186) j!159)))))

(declare-fun b!763100 () Bool)

(assert (=> b!763100 (= e!425417 false)))

(declare-datatypes ((SeekEntryResult!7717 0))(
  ( (MissingZero!7717 (index!33236 (_ BitVec 32))) (Found!7717 (index!33237 (_ BitVec 32))) (Intermediate!7717 (undefined!8529 Bool) (index!33238 (_ BitVec 32)) (x!64308 (_ BitVec 32))) (Undefined!7717) (MissingVacant!7717 (index!33239 (_ BitVec 32))) )
))
(declare-fun lt!339845 () SeekEntryResult!7717)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42115 (_ BitVec 32)) SeekEntryResult!7717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763100 (= lt!339845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20161 a!3186) j!159) mask!3328) (select (arr!20161 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!763101 () Bool)

(declare-fun res!515838 () Bool)

(assert (=> b!763101 (=> (not res!515838) (not e!425415))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763101 (= res!515838 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763102 () Bool)

(declare-fun res!515843 () Bool)

(assert (=> b!763102 (=> (not res!515843) (not e!425415))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763102 (= res!515843 (and (= (size!20581 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20581 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20581 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763103 () Bool)

(declare-fun res!515840 () Bool)

(assert (=> b!763103 (=> (not res!515840) (not e!425417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42115 (_ BitVec 32)) Bool)

(assert (=> b!763103 (= res!515840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763105 () Bool)

(assert (=> b!763105 (= e!425415 e!425417)))

(declare-fun res!515835 () Bool)

(assert (=> b!763105 (=> (not res!515835) (not e!425417))))

(declare-fun lt!339846 () SeekEntryResult!7717)

(assert (=> b!763105 (= res!515835 (or (= lt!339846 (MissingZero!7717 i!1173)) (= lt!339846 (MissingVacant!7717 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42115 (_ BitVec 32)) SeekEntryResult!7717)

(assert (=> b!763105 (= lt!339846 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763106 () Bool)

(declare-fun res!515836 () Bool)

(assert (=> b!763106 (=> (not res!515836) (not e!425415))))

(assert (=> b!763106 (= res!515836 (validKeyInArray!0 k0!2102))))

(declare-fun res!515837 () Bool)

(assert (=> start!66332 (=> (not res!515837) (not e!425415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66332 (= res!515837 (validMask!0 mask!3328))))

(assert (=> start!66332 e!425415))

(assert (=> start!66332 true))

(declare-fun array_inv!16020 (array!42115) Bool)

(assert (=> start!66332 (array_inv!16020 a!3186)))

(declare-fun b!763104 () Bool)

(declare-fun res!515842 () Bool)

(assert (=> b!763104 (=> (not res!515842) (not e!425417))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763104 (= res!515842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20581 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20581 a!3186))))))

(assert (= (and start!66332 res!515837) b!763102))

(assert (= (and b!763102 res!515843) b!763099))

(assert (= (and b!763099 res!515841) b!763106))

(assert (= (and b!763106 res!515836) b!763101))

(assert (= (and b!763101 res!515838) b!763105))

(assert (= (and b!763105 res!515835) b!763103))

(assert (= (and b!763103 res!515840) b!763098))

(assert (= (and b!763098 res!515839) b!763104))

(assert (= (and b!763104 res!515842) b!763100))

(declare-fun m!710221 () Bool)

(assert (=> b!763101 m!710221))

(declare-fun m!710223 () Bool)

(assert (=> b!763100 m!710223))

(assert (=> b!763100 m!710223))

(declare-fun m!710225 () Bool)

(assert (=> b!763100 m!710225))

(assert (=> b!763100 m!710225))

(assert (=> b!763100 m!710223))

(declare-fun m!710227 () Bool)

(assert (=> b!763100 m!710227))

(declare-fun m!710229 () Bool)

(assert (=> b!763105 m!710229))

(declare-fun m!710231 () Bool)

(assert (=> start!66332 m!710231))

(declare-fun m!710233 () Bool)

(assert (=> start!66332 m!710233))

(declare-fun m!710235 () Bool)

(assert (=> b!763103 m!710235))

(declare-fun m!710237 () Bool)

(assert (=> b!763106 m!710237))

(assert (=> b!763099 m!710223))

(assert (=> b!763099 m!710223))

(declare-fun m!710239 () Bool)

(assert (=> b!763099 m!710239))

(declare-fun m!710241 () Bool)

(assert (=> b!763098 m!710241))

(check-sat (not b!763105) (not b!763099) (not b!763101) (not b!763106) (not b!763100) (not start!66332) (not b!763098) (not b!763103))
(check-sat)
