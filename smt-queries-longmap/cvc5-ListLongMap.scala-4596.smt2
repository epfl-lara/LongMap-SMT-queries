; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64090 () Bool)

(assert start!64090)

(declare-fun b!719878 () Bool)

(declare-fun res!482272 () Bool)

(declare-fun e!403841 () Bool)

(assert (=> b!719878 (=> (not res!482272) (not e!403841))))

(declare-datatypes ((array!40785 0))(
  ( (array!40786 (arr!19518 (Array (_ BitVec 32) (_ BitVec 64))) (size!19939 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40785)

(declare-datatypes ((List!13520 0))(
  ( (Nil!13517) (Cons!13516 (h!14564 (_ BitVec 64)) (t!19835 List!13520)) )
))
(declare-fun arrayNoDuplicates!0 (array!40785 (_ BitVec 32) List!13520) Bool)

(assert (=> b!719878 (= res!482272 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13517))))

(declare-fun b!719879 () Bool)

(declare-fun res!482279 () Bool)

(declare-fun e!403839 () Bool)

(assert (=> b!719879 (=> (not res!482279) (not e!403839))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719879 (= res!482279 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719880 () Bool)

(assert (=> b!719880 (= e!403839 e!403841)))

(declare-fun res!482278 () Bool)

(assert (=> b!719880 (=> (not res!482278) (not e!403841))))

(declare-datatypes ((SeekEntryResult!7118 0))(
  ( (MissingZero!7118 (index!30840 (_ BitVec 32))) (Found!7118 (index!30841 (_ BitVec 32))) (Intermediate!7118 (undefined!7930 Bool) (index!30842 (_ BitVec 32)) (x!61845 (_ BitVec 32))) (Undefined!7118) (MissingVacant!7118 (index!30843 (_ BitVec 32))) )
))
(declare-fun lt!319667 () SeekEntryResult!7118)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719880 (= res!482278 (or (= lt!319667 (MissingZero!7118 i!1173)) (= lt!319667 (MissingVacant!7118 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40785 (_ BitVec 32)) SeekEntryResult!7118)

(assert (=> b!719880 (= lt!319667 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!482276 () Bool)

(assert (=> start!64090 (=> (not res!482276) (not e!403839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64090 (= res!482276 (validMask!0 mask!3328))))

(assert (=> start!64090 e!403839))

(assert (=> start!64090 true))

(declare-fun array_inv!15314 (array!40785) Bool)

(assert (=> start!64090 (array_inv!15314 a!3186)))

(declare-fun b!719881 () Bool)

(declare-fun res!482275 () Bool)

(assert (=> b!719881 (=> (not res!482275) (not e!403839))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719881 (= res!482275 (and (= (size!19939 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19939 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19939 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719882 () Bool)

(declare-fun res!482274 () Bool)

(assert (=> b!719882 (=> (not res!482274) (not e!403839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719882 (= res!482274 (validKeyInArray!0 (select (arr!19518 a!3186) j!159)))))

(declare-fun b!719883 () Bool)

(assert (=> b!719883 (= e!403841 false)))

(declare-fun lt!319666 () SeekEntryResult!7118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40785 (_ BitVec 32)) SeekEntryResult!7118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719883 (= lt!319666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19518 a!3186) j!159) mask!3328) (select (arr!19518 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719884 () Bool)

(declare-fun res!482273 () Bool)

(assert (=> b!719884 (=> (not res!482273) (not e!403839))))

(assert (=> b!719884 (= res!482273 (validKeyInArray!0 k!2102))))

(declare-fun b!719885 () Bool)

(declare-fun res!482277 () Bool)

(assert (=> b!719885 (=> (not res!482277) (not e!403841))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719885 (= res!482277 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19939 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19939 a!3186))))))

(declare-fun b!719886 () Bool)

(declare-fun res!482271 () Bool)

(assert (=> b!719886 (=> (not res!482271) (not e!403841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40785 (_ BitVec 32)) Bool)

(assert (=> b!719886 (= res!482271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64090 res!482276) b!719881))

(assert (= (and b!719881 res!482275) b!719882))

(assert (= (and b!719882 res!482274) b!719884))

(assert (= (and b!719884 res!482273) b!719879))

(assert (= (and b!719879 res!482279) b!719880))

(assert (= (and b!719880 res!482278) b!719886))

(assert (= (and b!719886 res!482271) b!719878))

(assert (= (and b!719878 res!482272) b!719885))

(assert (= (and b!719885 res!482277) b!719883))

(declare-fun m!675199 () Bool)

(assert (=> b!719882 m!675199))

(assert (=> b!719882 m!675199))

(declare-fun m!675201 () Bool)

(assert (=> b!719882 m!675201))

(declare-fun m!675203 () Bool)

(assert (=> b!719878 m!675203))

(declare-fun m!675205 () Bool)

(assert (=> b!719879 m!675205))

(declare-fun m!675207 () Bool)

(assert (=> b!719884 m!675207))

(declare-fun m!675209 () Bool)

(assert (=> b!719880 m!675209))

(declare-fun m!675211 () Bool)

(assert (=> b!719886 m!675211))

(assert (=> b!719883 m!675199))

(assert (=> b!719883 m!675199))

(declare-fun m!675213 () Bool)

(assert (=> b!719883 m!675213))

(assert (=> b!719883 m!675213))

(assert (=> b!719883 m!675199))

(declare-fun m!675215 () Bool)

(assert (=> b!719883 m!675215))

(declare-fun m!675217 () Bool)

(assert (=> start!64090 m!675217))

(declare-fun m!675219 () Bool)

(assert (=> start!64090 m!675219))

(push 1)

