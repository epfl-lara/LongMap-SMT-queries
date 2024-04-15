; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65822 () Bool)

(assert start!65822)

(declare-fun b!758201 () Bool)

(declare-fun res!512998 () Bool)

(declare-fun e!422706 () Bool)

(assert (=> b!758201 (=> (not res!512998) (not e!422706))))

(declare-datatypes ((array!42012 0))(
  ( (array!42013 (arr!20120 (Array (_ BitVec 32) (_ BitVec 64))) (size!20541 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42012)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758201 (= res!512998 (validKeyInArray!0 (select (arr!20120 a!3186) j!159)))))

(declare-fun b!758202 () Bool)

(declare-fun res!512993 () Bool)

(declare-fun e!422707 () Bool)

(assert (=> b!758202 (=> (not res!512993) (not e!422707))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42012 (_ BitVec 32)) Bool)

(assert (=> b!758202 (= res!512993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758203 () Bool)

(assert (=> b!758203 (= e!422706 e!422707)))

(declare-fun res!513005 () Bool)

(assert (=> b!758203 (=> (not res!513005) (not e!422707))))

(declare-datatypes ((SeekEntryResult!7717 0))(
  ( (MissingZero!7717 (index!33236 (_ BitVec 32))) (Found!7717 (index!33237 (_ BitVec 32))) (Intermediate!7717 (undefined!8529 Bool) (index!33238 (_ BitVec 32)) (x!64134 (_ BitVec 32))) (Undefined!7717) (MissingVacant!7717 (index!33239 (_ BitVec 32))) )
))
(declare-fun lt!337643 () SeekEntryResult!7717)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758203 (= res!513005 (or (= lt!337643 (MissingZero!7717 i!1173)) (= lt!337643 (MissingVacant!7717 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42012 (_ BitVec 32)) SeekEntryResult!7717)

(assert (=> b!758203 (= lt!337643 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758204 () Bool)

(declare-fun e!422703 () Bool)

(assert (=> b!758204 (= e!422707 e!422703)))

(declare-fun res!513006 () Bool)

(assert (=> b!758204 (=> (not res!513006) (not e!422703))))

(declare-fun lt!337639 () SeekEntryResult!7717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42012 (_ BitVec 32)) SeekEntryResult!7717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758204 (= res!513006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20120 a!3186) j!159) mask!3328) (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337639))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758204 (= lt!337639 (Intermediate!7717 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!422704 () Bool)

(declare-fun b!758205 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42012 (_ BitVec 32)) SeekEntryResult!7717)

(assert (=> b!758205 (= e!422704 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) (Found!7717 j!159)))))

(declare-fun b!758206 () Bool)

(assert (=> b!758206 (= e!422704 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337639))))

(declare-fun b!758207 () Bool)

(declare-fun e!422697 () Bool)

(declare-fun e!422698 () Bool)

(assert (=> b!758207 (= e!422697 e!422698)))

(declare-fun res!513007 () Bool)

(assert (=> b!758207 (=> res!513007 e!422698)))

(declare-fun lt!337638 () SeekEntryResult!7717)

(declare-fun lt!337646 () SeekEntryResult!7717)

(assert (=> b!758207 (= res!513007 (not (= lt!337638 lt!337646)))))

(assert (=> b!758207 (= lt!337638 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758208 () Bool)

(declare-fun res!513003 () Bool)

(assert (=> b!758208 (=> (not res!513003) (not e!422706))))

(declare-fun arrayContainsKey!0 (array!42012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758208 (= res!513003 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758210 () Bool)

(declare-fun e!422701 () Bool)

(assert (=> b!758210 (= e!422703 e!422701)))

(declare-fun res!512997 () Bool)

(assert (=> b!758210 (=> (not res!512997) (not e!422701))))

(declare-fun lt!337640 () SeekEntryResult!7717)

(declare-fun lt!337647 () SeekEntryResult!7717)

(assert (=> b!758210 (= res!512997 (= lt!337640 lt!337647))))

(declare-fun lt!337635 () (_ BitVec 64))

(declare-fun lt!337645 () array!42012)

(assert (=> b!758210 (= lt!337647 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337635 lt!337645 mask!3328))))

(assert (=> b!758210 (= lt!337640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337635 mask!3328) lt!337635 lt!337645 mask!3328))))

(assert (=> b!758210 (= lt!337635 (select (store (arr!20120 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758210 (= lt!337645 (array!42013 (store (arr!20120 a!3186) i!1173 k0!2102) (size!20541 a!3186)))))

(declare-fun b!758211 () Bool)

(declare-fun res!513001 () Bool)

(assert (=> b!758211 (=> (not res!513001) (not e!422703))))

(assert (=> b!758211 (= res!513001 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20120 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758212 () Bool)

(declare-fun res!512999 () Bool)

(assert (=> b!758212 (=> (not res!512999) (not e!422703))))

(assert (=> b!758212 (= res!512999 e!422704)))

(declare-fun c!82985 () Bool)

(assert (=> b!758212 (= c!82985 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758213 () Bool)

(declare-fun res!513004 () Bool)

(assert (=> b!758213 (=> (not res!513004) (not e!422706))))

(assert (=> b!758213 (= res!513004 (validKeyInArray!0 k0!2102))))

(declare-fun b!758214 () Bool)

(declare-datatypes ((Unit!26228 0))(
  ( (Unit!26229) )
))
(declare-fun e!422702 () Unit!26228)

(declare-fun Unit!26230 () Unit!26228)

(assert (=> b!758214 (= e!422702 Unit!26230)))

(assert (=> b!758214 false))

(declare-fun b!758215 () Bool)

(declare-fun e!422696 () Bool)

(declare-fun e!422705 () Bool)

(assert (=> b!758215 (= e!422696 e!422705)))

(declare-fun res!512995 () Bool)

(assert (=> b!758215 (=> res!512995 e!422705)))

(assert (=> b!758215 (= res!512995 (or (not (= (select (arr!20120 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337648 () SeekEntryResult!7717)

(declare-fun lt!337637 () SeekEntryResult!7717)

(declare-fun lt!337642 () SeekEntryResult!7717)

(assert (=> b!758215 (and (= lt!337637 lt!337648) (= lt!337642 lt!337638))))

(assert (=> b!758215 (= lt!337648 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337635 lt!337645 mask!3328))))

(assert (=> b!758215 (= lt!337637 (seekEntryOrOpen!0 lt!337635 lt!337645 mask!3328))))

(declare-fun lt!337641 () (_ BitVec 64))

(assert (=> b!758215 (= lt!337641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337649 () Unit!26228)

(assert (=> b!758215 (= lt!337649 e!422702)))

(declare-fun c!82986 () Bool)

(assert (=> b!758215 (= c!82986 (= lt!337641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758216 () Bool)

(assert (=> b!758216 (= e!422698 e!422696)))

(declare-fun res!512996 () Bool)

(assert (=> b!758216 (=> res!512996 e!422696)))

(assert (=> b!758216 (= res!512996 (= lt!337641 lt!337635))))

(assert (=> b!758216 (= lt!337641 (select (store (arr!20120 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758217 () Bool)

(declare-fun res!512994 () Bool)

(assert (=> b!758217 (=> (not res!512994) (not e!422706))))

(assert (=> b!758217 (= res!512994 (and (= (size!20541 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20541 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20541 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758218 () Bool)

(assert (=> b!758218 (= e!422705 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!758218 (= lt!337648 lt!337638)))

(declare-fun lt!337636 () Unit!26228)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42012 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26228)

(assert (=> b!758218 (= lt!337636 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun e!422699 () Bool)

(declare-fun b!758219 () Bool)

(assert (=> b!758219 (= e!422699 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337646))))

(declare-fun b!758220 () Bool)

(declare-fun res!512992 () Bool)

(assert (=> b!758220 (=> (not res!512992) (not e!422707))))

(declare-datatypes ((List!14161 0))(
  ( (Nil!14158) (Cons!14157 (h!15229 (_ BitVec 64)) (t!20467 List!14161)) )
))
(declare-fun arrayNoDuplicates!0 (array!42012 (_ BitVec 32) List!14161) Bool)

(assert (=> b!758220 (= res!512992 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14158))))

(declare-fun b!758221 () Bool)

(declare-fun res!513009 () Bool)

(assert (=> b!758221 (=> (not res!513009) (not e!422707))))

(assert (=> b!758221 (= res!513009 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20541 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20541 a!3186))))))

(declare-fun b!758222 () Bool)

(assert (=> b!758222 (= e!422701 (not e!422697))))

(declare-fun res!513000 () Bool)

(assert (=> b!758222 (=> res!513000 e!422697)))

(get-info :version)

(assert (=> b!758222 (= res!513000 (or (not ((_ is Intermediate!7717) lt!337647)) (bvslt x!1131 (x!64134 lt!337647)) (not (= x!1131 (x!64134 lt!337647))) (not (= index!1321 (index!33238 lt!337647)))))))

(assert (=> b!758222 e!422699))

(declare-fun res!513002 () Bool)

(assert (=> b!758222 (=> (not res!513002) (not e!422699))))

(assert (=> b!758222 (= res!513002 (= lt!337642 lt!337646))))

(assert (=> b!758222 (= lt!337646 (Found!7717 j!159))))

(assert (=> b!758222 (= lt!337642 (seekEntryOrOpen!0 (select (arr!20120 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758222 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337644 () Unit!26228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26228)

(assert (=> b!758222 (= lt!337644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!513008 () Bool)

(assert (=> start!65822 (=> (not res!513008) (not e!422706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65822 (= res!513008 (validMask!0 mask!3328))))

(assert (=> start!65822 e!422706))

(assert (=> start!65822 true))

(declare-fun array_inv!16003 (array!42012) Bool)

(assert (=> start!65822 (array_inv!16003 a!3186)))

(declare-fun b!758209 () Bool)

(declare-fun Unit!26231 () Unit!26228)

(assert (=> b!758209 (= e!422702 Unit!26231)))

(assert (= (and start!65822 res!513008) b!758217))

(assert (= (and b!758217 res!512994) b!758201))

(assert (= (and b!758201 res!512998) b!758213))

(assert (= (and b!758213 res!513004) b!758208))

(assert (= (and b!758208 res!513003) b!758203))

(assert (= (and b!758203 res!513005) b!758202))

(assert (= (and b!758202 res!512993) b!758220))

(assert (= (and b!758220 res!512992) b!758221))

(assert (= (and b!758221 res!513009) b!758204))

(assert (= (and b!758204 res!513006) b!758211))

(assert (= (and b!758211 res!513001) b!758212))

(assert (= (and b!758212 c!82985) b!758206))

(assert (= (and b!758212 (not c!82985)) b!758205))

(assert (= (and b!758212 res!512999) b!758210))

(assert (= (and b!758210 res!512997) b!758222))

(assert (= (and b!758222 res!513002) b!758219))

(assert (= (and b!758222 (not res!513000)) b!758207))

(assert (= (and b!758207 (not res!513007)) b!758216))

(assert (= (and b!758216 (not res!512996)) b!758215))

(assert (= (and b!758215 c!82986) b!758214))

(assert (= (and b!758215 (not c!82986)) b!758209))

(assert (= (and b!758215 (not res!512995)) b!758218))

(declare-fun m!705173 () Bool)

(assert (=> b!758203 m!705173))

(declare-fun m!705175 () Bool)

(assert (=> b!758204 m!705175))

(assert (=> b!758204 m!705175))

(declare-fun m!705177 () Bool)

(assert (=> b!758204 m!705177))

(assert (=> b!758204 m!705177))

(assert (=> b!758204 m!705175))

(declare-fun m!705179 () Bool)

(assert (=> b!758204 m!705179))

(assert (=> b!758222 m!705175))

(assert (=> b!758222 m!705175))

(declare-fun m!705181 () Bool)

(assert (=> b!758222 m!705181))

(declare-fun m!705183 () Bool)

(assert (=> b!758222 m!705183))

(declare-fun m!705185 () Bool)

(assert (=> b!758222 m!705185))

(assert (=> b!758201 m!705175))

(assert (=> b!758201 m!705175))

(declare-fun m!705187 () Bool)

(assert (=> b!758201 m!705187))

(declare-fun m!705189 () Bool)

(assert (=> b!758210 m!705189))

(declare-fun m!705191 () Bool)

(assert (=> b!758210 m!705191))

(declare-fun m!705193 () Bool)

(assert (=> b!758210 m!705193))

(declare-fun m!705195 () Bool)

(assert (=> b!758210 m!705195))

(assert (=> b!758210 m!705191))

(declare-fun m!705197 () Bool)

(assert (=> b!758210 m!705197))

(declare-fun m!705199 () Bool)

(assert (=> b!758220 m!705199))

(assert (=> b!758207 m!705175))

(assert (=> b!758207 m!705175))

(declare-fun m!705201 () Bool)

(assert (=> b!758207 m!705201))

(assert (=> b!758219 m!705175))

(assert (=> b!758219 m!705175))

(declare-fun m!705203 () Bool)

(assert (=> b!758219 m!705203))

(declare-fun m!705205 () Bool)

(assert (=> b!758202 m!705205))

(assert (=> b!758216 m!705195))

(declare-fun m!705207 () Bool)

(assert (=> b!758216 m!705207))

(declare-fun m!705209 () Bool)

(assert (=> start!65822 m!705209))

(declare-fun m!705211 () Bool)

(assert (=> start!65822 m!705211))

(declare-fun m!705213 () Bool)

(assert (=> b!758208 m!705213))

(assert (=> b!758205 m!705175))

(assert (=> b!758205 m!705175))

(assert (=> b!758205 m!705201))

(declare-fun m!705215 () Bool)

(assert (=> b!758211 m!705215))

(declare-fun m!705217 () Bool)

(assert (=> b!758215 m!705217))

(declare-fun m!705219 () Bool)

(assert (=> b!758215 m!705219))

(declare-fun m!705221 () Bool)

(assert (=> b!758215 m!705221))

(assert (=> b!758206 m!705175))

(assert (=> b!758206 m!705175))

(declare-fun m!705223 () Bool)

(assert (=> b!758206 m!705223))

(declare-fun m!705225 () Bool)

(assert (=> b!758218 m!705225))

(declare-fun m!705227 () Bool)

(assert (=> b!758213 m!705227))

(check-sat (not b!758219) (not b!758207) (not b!758213) (not b!758206) (not b!758215) (not b!758218) (not start!65822) (not b!758208) (not b!758220) (not b!758202) (not b!758222) (not b!758203) (not b!758210) (not b!758204) (not b!758201) (not b!758205))
(check-sat)
