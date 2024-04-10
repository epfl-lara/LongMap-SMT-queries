; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65284 () Bool)

(assert start!65284)

(declare-datatypes ((array!41457 0))(
  ( (array!41458 (arr!19842 (Array (_ BitVec 32) (_ BitVec 64))) (size!20263 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41457)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414262 () Bool)

(declare-datatypes ((SeekEntryResult!7442 0))(
  ( (MissingZero!7442 (index!32136 (_ BitVec 32))) (Found!7442 (index!32137 (_ BitVec 32))) (Intermediate!7442 (undefined!8254 Bool) (index!32138 (_ BitVec 32)) (x!63120 (_ BitVec 32))) (Undefined!7442) (MissingVacant!7442 (index!32139 (_ BitVec 32))) )
))
(declare-fun lt!329247 () SeekEntryResult!7442)

(declare-fun b!741035 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41457 (_ BitVec 32)) SeekEntryResult!7442)

(assert (=> b!741035 (= e!414262 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19842 a!3186) j!159) a!3186 mask!3328) lt!329247))))

(declare-fun b!741036 () Bool)

(declare-fun res!498396 () Bool)

(declare-fun e!414263 () Bool)

(assert (=> b!741036 (=> (not res!498396) (not e!414263))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741036 (= res!498396 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741037 () Bool)

(declare-fun e!414260 () Bool)

(declare-fun e!414259 () Bool)

(assert (=> b!741037 (= e!414260 e!414259)))

(declare-fun res!498399 () Bool)

(assert (=> b!741037 (=> (not res!498399) (not e!414259))))

(declare-fun lt!329244 () SeekEntryResult!7442)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41457 (_ BitVec 32)) SeekEntryResult!7442)

(assert (=> b!741037 (= res!498399 (= (seekEntryOrOpen!0 (select (arr!19842 a!3186) j!159) a!3186 mask!3328) lt!329244))))

(assert (=> b!741037 (= lt!329244 (Found!7442 j!159))))

(declare-fun b!741038 () Bool)

(declare-fun e!414256 () Bool)

(assert (=> b!741038 (= e!414263 e!414256)))

(declare-fun res!498397 () Bool)

(assert (=> b!741038 (=> (not res!498397) (not e!414256))))

(declare-fun lt!329248 () SeekEntryResult!7442)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741038 (= res!498397 (or (= lt!329248 (MissingZero!7442 i!1173)) (= lt!329248 (MissingVacant!7442 i!1173))))))

(assert (=> b!741038 (= lt!329248 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!498398 () Bool)

(assert (=> start!65284 (=> (not res!498398) (not e!414263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65284 (= res!498398 (validMask!0 mask!3328))))

(assert (=> start!65284 e!414263))

(assert (=> start!65284 true))

(declare-fun array_inv!15638 (array!41457) Bool)

(assert (=> start!65284 (array_inv!15638 a!3186)))

(declare-fun b!741039 () Bool)

(declare-fun res!498394 () Bool)

(declare-fun e!414257 () Bool)

(assert (=> b!741039 (=> (not res!498394) (not e!414257))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741039 (= res!498394 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19842 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741040 () Bool)

(declare-fun res!498403 () Bool)

(assert (=> b!741040 (=> (not res!498403) (not e!414263))))

(assert (=> b!741040 (= res!498403 (and (= (size!20263 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20263 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20263 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741041 () Bool)

(declare-fun res!498393 () Bool)

(assert (=> b!741041 (=> (not res!498393) (not e!414256))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741041 (= res!498393 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20263 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20263 a!3186))))))

(declare-fun b!741042 () Bool)

(declare-fun res!498401 () Bool)

(assert (=> b!741042 (=> (not res!498401) (not e!414263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741042 (= res!498401 (validKeyInArray!0 (select (arr!19842 a!3186) j!159)))))

(declare-fun b!741043 () Bool)

(declare-fun res!498402 () Bool)

(assert (=> b!741043 (=> (not res!498402) (not e!414257))))

(assert (=> b!741043 (= res!498402 e!414262)))

(declare-fun c!81703 () Bool)

(assert (=> b!741043 (= c!81703 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741044 () Bool)

(declare-fun e!414258 () Bool)

(assert (=> b!741044 (= e!414258 (not true))))

(assert (=> b!741044 e!414260))

(declare-fun res!498391 () Bool)

(assert (=> b!741044 (=> (not res!498391) (not e!414260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41457 (_ BitVec 32)) Bool)

(assert (=> b!741044 (= res!498391 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25364 0))(
  ( (Unit!25365) )
))
(declare-fun lt!329245 () Unit!25364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25364)

(assert (=> b!741044 (= lt!329245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741045 () Bool)

(declare-fun res!498395 () Bool)

(assert (=> b!741045 (=> (not res!498395) (not e!414256))))

(assert (=> b!741045 (= res!498395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741046 () Bool)

(assert (=> b!741046 (= e!414256 e!414257)))

(declare-fun res!498404 () Bool)

(assert (=> b!741046 (=> (not res!498404) (not e!414257))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741046 (= res!498404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19842 a!3186) j!159) mask!3328) (select (arr!19842 a!3186) j!159) a!3186 mask!3328) lt!329247))))

(assert (=> b!741046 (= lt!329247 (Intermediate!7442 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41457 (_ BitVec 32)) SeekEntryResult!7442)

(assert (=> b!741047 (= e!414262 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19842 a!3186) j!159) a!3186 mask!3328) (Found!7442 j!159)))))

(declare-fun b!741048 () Bool)

(assert (=> b!741048 (= e!414259 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19842 a!3186) j!159) a!3186 mask!3328) lt!329244))))

(declare-fun b!741049 () Bool)

(declare-fun res!498392 () Bool)

(assert (=> b!741049 (=> (not res!498392) (not e!414256))))

(declare-datatypes ((List!13844 0))(
  ( (Nil!13841) (Cons!13840 (h!14912 (_ BitVec 64)) (t!20159 List!13844)) )
))
(declare-fun arrayNoDuplicates!0 (array!41457 (_ BitVec 32) List!13844) Bool)

(assert (=> b!741049 (= res!498392 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13841))))

(declare-fun b!741050 () Bool)

(assert (=> b!741050 (= e!414257 e!414258)))

(declare-fun res!498390 () Bool)

(assert (=> b!741050 (=> (not res!498390) (not e!414258))))

(declare-fun lt!329249 () array!41457)

(declare-fun lt!329246 () (_ BitVec 64))

(assert (=> b!741050 (= res!498390 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329246 mask!3328) lt!329246 lt!329249 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329246 lt!329249 mask!3328)))))

(assert (=> b!741050 (= lt!329246 (select (store (arr!19842 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741050 (= lt!329249 (array!41458 (store (arr!19842 a!3186) i!1173 k!2102) (size!20263 a!3186)))))

(declare-fun b!741051 () Bool)

(declare-fun res!498400 () Bool)

(assert (=> b!741051 (=> (not res!498400) (not e!414263))))

(assert (=> b!741051 (= res!498400 (validKeyInArray!0 k!2102))))

(assert (= (and start!65284 res!498398) b!741040))

(assert (= (and b!741040 res!498403) b!741042))

(assert (= (and b!741042 res!498401) b!741051))

(assert (= (and b!741051 res!498400) b!741036))

(assert (= (and b!741036 res!498396) b!741038))

(assert (= (and b!741038 res!498397) b!741045))

(assert (= (and b!741045 res!498395) b!741049))

(assert (= (and b!741049 res!498392) b!741041))

(assert (= (and b!741041 res!498393) b!741046))

(assert (= (and b!741046 res!498404) b!741039))

(assert (= (and b!741039 res!498394) b!741043))

(assert (= (and b!741043 c!81703) b!741035))

(assert (= (and b!741043 (not c!81703)) b!741047))

(assert (= (and b!741043 res!498402) b!741050))

(assert (= (and b!741050 res!498390) b!741044))

(assert (= (and b!741044 res!498391) b!741037))

(assert (= (and b!741037 res!498399) b!741048))

(declare-fun m!692047 () Bool)

(assert (=> b!741036 m!692047))

(declare-fun m!692049 () Bool)

(assert (=> b!741049 m!692049))

(declare-fun m!692051 () Bool)

(assert (=> b!741035 m!692051))

(assert (=> b!741035 m!692051))

(declare-fun m!692053 () Bool)

(assert (=> b!741035 m!692053))

(declare-fun m!692055 () Bool)

(assert (=> b!741039 m!692055))

(assert (=> b!741037 m!692051))

(assert (=> b!741037 m!692051))

(declare-fun m!692057 () Bool)

(assert (=> b!741037 m!692057))

(declare-fun m!692059 () Bool)

(assert (=> b!741038 m!692059))

(declare-fun m!692061 () Bool)

(assert (=> b!741044 m!692061))

(declare-fun m!692063 () Bool)

(assert (=> b!741044 m!692063))

(declare-fun m!692065 () Bool)

(assert (=> b!741050 m!692065))

(assert (=> b!741050 m!692065))

(declare-fun m!692067 () Bool)

(assert (=> b!741050 m!692067))

(declare-fun m!692069 () Bool)

(assert (=> b!741050 m!692069))

(declare-fun m!692071 () Bool)

(assert (=> b!741050 m!692071))

(declare-fun m!692073 () Bool)

(assert (=> b!741050 m!692073))

(declare-fun m!692075 () Bool)

(assert (=> b!741051 m!692075))

(declare-fun m!692077 () Bool)

(assert (=> start!65284 m!692077))

(declare-fun m!692079 () Bool)

(assert (=> start!65284 m!692079))

(assert (=> b!741046 m!692051))

(assert (=> b!741046 m!692051))

(declare-fun m!692081 () Bool)

(assert (=> b!741046 m!692081))

(assert (=> b!741046 m!692081))

(assert (=> b!741046 m!692051))

(declare-fun m!692083 () Bool)

(assert (=> b!741046 m!692083))

(declare-fun m!692085 () Bool)

(assert (=> b!741045 m!692085))

(assert (=> b!741042 m!692051))

(assert (=> b!741042 m!692051))

(declare-fun m!692087 () Bool)

(assert (=> b!741042 m!692087))

(assert (=> b!741047 m!692051))

(assert (=> b!741047 m!692051))

(declare-fun m!692089 () Bool)

(assert (=> b!741047 m!692089))

(assert (=> b!741048 m!692051))

(assert (=> b!741048 m!692051))

(declare-fun m!692091 () Bool)

(assert (=> b!741048 m!692091))

(push 1)

