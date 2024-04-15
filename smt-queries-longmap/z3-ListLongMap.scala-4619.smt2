; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64328 () Bool)

(assert start!64328)

(declare-datatypes ((array!40926 0))(
  ( (array!40927 (arr!19586 (Array (_ BitVec 32) (_ BitVec 64))) (size!20007 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40926)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405111 () Bool)

(declare-fun b!723088 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7183 0))(
  ( (MissingZero!7183 (index!31100 (_ BitVec 32))) (Found!7183 (index!31101 (_ BitVec 32))) (Intermediate!7183 (undefined!7995 Bool) (index!31102 (_ BitVec 32)) (x!62107 (_ BitVec 32))) (Undefined!7183) (MissingVacant!7183 (index!31103 (_ BitVec 32))) )
))
(declare-fun lt!320399 () SeekEntryResult!7183)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40926 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!723088 (= e!405111 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320399))))

(declare-fun b!723089 () Bool)

(declare-fun res!484812 () Bool)

(declare-fun e!405108 () Bool)

(assert (=> b!723089 (=> (not res!484812) (not e!405108))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723089 (= res!484812 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723090 () Bool)

(declare-fun res!484817 () Bool)

(assert (=> b!723090 (=> (not res!484817) (not e!405108))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723090 (= res!484817 (and (= (size!20007 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20007 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20007 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723091 () Bool)

(declare-fun e!405110 () Bool)

(declare-fun e!405109 () Bool)

(assert (=> b!723091 (= e!405110 e!405109)))

(declare-fun res!484814 () Bool)

(assert (=> b!723091 (=> (not res!484814) (not e!405109))))

(declare-fun lt!320398 () (_ BitVec 64))

(declare-fun lt!320396 () array!40926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723091 (= res!484814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320398 mask!3328) lt!320398 lt!320396 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320398 lt!320396 mask!3328)))))

(assert (=> b!723091 (= lt!320398 (select (store (arr!19586 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723091 (= lt!320396 (array!40927 (store (arr!19586 a!3186) i!1173 k0!2102) (size!20007 a!3186)))))

(declare-fun b!723092 () Bool)

(declare-fun res!484821 () Bool)

(assert (=> b!723092 (=> (not res!484821) (not e!405108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723092 (= res!484821 (validKeyInArray!0 (select (arr!19586 a!3186) j!159)))))

(declare-fun b!723093 () Bool)

(declare-fun res!484823 () Bool)

(declare-fun e!405112 () Bool)

(assert (=> b!723093 (=> (not res!484823) (not e!405112))))

(declare-datatypes ((List!13627 0))(
  ( (Nil!13624) (Cons!13623 (h!14677 (_ BitVec 64)) (t!19933 List!13627)) )
))
(declare-fun arrayNoDuplicates!0 (array!40926 (_ BitVec 32) List!13627) Bool)

(assert (=> b!723093 (= res!484823 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13624))))

(declare-fun b!723094 () Bool)

(declare-fun res!484824 () Bool)

(assert (=> b!723094 (=> (not res!484824) (not e!405110))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723094 (= res!484824 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19586 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484822 () Bool)

(assert (=> start!64328 (=> (not res!484822) (not e!405108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64328 (= res!484822 (validMask!0 mask!3328))))

(assert (=> start!64328 e!405108))

(assert (=> start!64328 true))

(declare-fun array_inv!15469 (array!40926) Bool)

(assert (=> start!64328 (array_inv!15469 a!3186)))

(declare-fun b!723087 () Bool)

(assert (=> b!723087 (= e!405108 e!405112)))

(declare-fun res!484813 () Bool)

(assert (=> b!723087 (=> (not res!484813) (not e!405112))))

(declare-fun lt!320395 () SeekEntryResult!7183)

(assert (=> b!723087 (= res!484813 (or (= lt!320395 (MissingZero!7183 i!1173)) (= lt!320395 (MissingVacant!7183 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40926 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!723087 (= lt!320395 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723095 () Bool)

(declare-fun res!484815 () Bool)

(assert (=> b!723095 (=> (not res!484815) (not e!405112))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723095 (= res!484815 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20007 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20007 a!3186))))))

(declare-fun b!723096 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40926 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!723096 (= e!405111 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) (Found!7183 j!159)))))

(declare-fun b!723097 () Bool)

(declare-fun res!484818 () Bool)

(assert (=> b!723097 (=> (not res!484818) (not e!405110))))

(assert (=> b!723097 (= res!484818 e!405111)))

(declare-fun c!79509 () Bool)

(assert (=> b!723097 (= c!79509 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723098 () Bool)

(declare-fun res!484816 () Bool)

(assert (=> b!723098 (=> (not res!484816) (not e!405108))))

(assert (=> b!723098 (= res!484816 (validKeyInArray!0 k0!2102))))

(declare-fun b!723099 () Bool)

(assert (=> b!723099 (= e!405112 e!405110)))

(declare-fun res!484820 () Bool)

(assert (=> b!723099 (=> (not res!484820) (not e!405110))))

(assert (=> b!723099 (= res!484820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19586 a!3186) j!159) mask!3328) (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320399))))

(assert (=> b!723099 (= lt!320399 (Intermediate!7183 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723100 () Bool)

(assert (=> b!723100 (= e!405109 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40926 (_ BitVec 32)) Bool)

(assert (=> b!723100 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24656 0))(
  ( (Unit!24657) )
))
(declare-fun lt!320397 () Unit!24656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24656)

(assert (=> b!723100 (= lt!320397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723101 () Bool)

(declare-fun res!484819 () Bool)

(assert (=> b!723101 (=> (not res!484819) (not e!405112))))

(assert (=> b!723101 (= res!484819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64328 res!484822) b!723090))

(assert (= (and b!723090 res!484817) b!723092))

(assert (= (and b!723092 res!484821) b!723098))

(assert (= (and b!723098 res!484816) b!723089))

(assert (= (and b!723089 res!484812) b!723087))

(assert (= (and b!723087 res!484813) b!723101))

(assert (= (and b!723101 res!484819) b!723093))

(assert (= (and b!723093 res!484823) b!723095))

(assert (= (and b!723095 res!484815) b!723099))

(assert (= (and b!723099 res!484820) b!723094))

(assert (= (and b!723094 res!484824) b!723097))

(assert (= (and b!723097 c!79509) b!723088))

(assert (= (and b!723097 (not c!79509)) b!723096))

(assert (= (and b!723097 res!484818) b!723091))

(assert (= (and b!723091 res!484814) b!723100))

(declare-fun m!677027 () Bool)

(assert (=> b!723098 m!677027))

(declare-fun m!677029 () Bool)

(assert (=> b!723091 m!677029))

(declare-fun m!677031 () Bool)

(assert (=> b!723091 m!677031))

(declare-fun m!677033 () Bool)

(assert (=> b!723091 m!677033))

(declare-fun m!677035 () Bool)

(assert (=> b!723091 m!677035))

(assert (=> b!723091 m!677029))

(declare-fun m!677037 () Bool)

(assert (=> b!723091 m!677037))

(declare-fun m!677039 () Bool)

(assert (=> b!723089 m!677039))

(declare-fun m!677041 () Bool)

(assert (=> b!723099 m!677041))

(assert (=> b!723099 m!677041))

(declare-fun m!677043 () Bool)

(assert (=> b!723099 m!677043))

(assert (=> b!723099 m!677043))

(assert (=> b!723099 m!677041))

(declare-fun m!677045 () Bool)

(assert (=> b!723099 m!677045))

(declare-fun m!677047 () Bool)

(assert (=> b!723093 m!677047))

(assert (=> b!723088 m!677041))

(assert (=> b!723088 m!677041))

(declare-fun m!677049 () Bool)

(assert (=> b!723088 m!677049))

(assert (=> b!723092 m!677041))

(assert (=> b!723092 m!677041))

(declare-fun m!677051 () Bool)

(assert (=> b!723092 m!677051))

(assert (=> b!723096 m!677041))

(assert (=> b!723096 m!677041))

(declare-fun m!677053 () Bool)

(assert (=> b!723096 m!677053))

(declare-fun m!677055 () Bool)

(assert (=> start!64328 m!677055))

(declare-fun m!677057 () Bool)

(assert (=> start!64328 m!677057))

(declare-fun m!677059 () Bool)

(assert (=> b!723087 m!677059))

(declare-fun m!677061 () Bool)

(assert (=> b!723101 m!677061))

(declare-fun m!677063 () Bool)

(assert (=> b!723094 m!677063))

(declare-fun m!677065 () Bool)

(assert (=> b!723100 m!677065))

(declare-fun m!677067 () Bool)

(assert (=> b!723100 m!677067))

(check-sat (not b!723089) (not b!723088) (not b!723091) (not b!723100) (not b!723087) (not b!723101) (not b!723098) (not b!723093) (not b!723096) (not start!64328) (not b!723092) (not b!723099))
(check-sat)
