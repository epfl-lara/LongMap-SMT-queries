; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63684 () Bool)

(assert start!63684)

(declare-fun b!716752 () Bool)

(declare-fun res!479678 () Bool)

(declare-fun e!402445 () Bool)

(assert (=> b!716752 (=> (not res!479678) (not e!402445))))

(declare-datatypes ((array!40590 0))(
  ( (array!40591 (arr!19428 (Array (_ BitVec 32) (_ BitVec 64))) (size!19849 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40590)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716752 (= res!479678 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716753 () Bool)

(declare-fun res!479682 () Bool)

(assert (=> b!716753 (=> (not res!479682) (not e!402445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716753 (= res!479682 (validKeyInArray!0 k!2102))))

(declare-fun b!716754 () Bool)

(declare-fun res!479679 () Bool)

(assert (=> b!716754 (=> (not res!479679) (not e!402445))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716754 (= res!479679 (and (= (size!19849 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19849 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19849 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479681 () Bool)

(assert (=> start!63684 (=> (not res!479681) (not e!402445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63684 (= res!479681 (validMask!0 mask!3328))))

(assert (=> start!63684 e!402445))

(declare-fun array_inv!15311 (array!40590) Bool)

(assert (=> start!63684 (array_inv!15311 a!3186)))

(assert (=> start!63684 true))

(declare-fun b!716755 () Bool)

(declare-fun res!479680 () Bool)

(assert (=> b!716755 (=> (not res!479680) (not e!402445))))

(assert (=> b!716755 (= res!479680 (validKeyInArray!0 (select (arr!19428 a!3186) j!159)))))

(declare-fun b!716756 () Bool)

(assert (=> b!716756 (= e!402445 false)))

(declare-datatypes ((SeekEntryResult!7025 0))(
  ( (MissingZero!7025 (index!30468 (_ BitVec 32))) (Found!7025 (index!30469 (_ BitVec 32))) (Intermediate!7025 (undefined!7837 Bool) (index!30470 (_ BitVec 32)) (x!61504 (_ BitVec 32))) (Undefined!7025) (MissingVacant!7025 (index!30471 (_ BitVec 32))) )
))
(declare-fun lt!318740 () SeekEntryResult!7025)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40590 (_ BitVec 32)) SeekEntryResult!7025)

(assert (=> b!716756 (= lt!318740 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63684 res!479681) b!716754))

(assert (= (and b!716754 res!479679) b!716755))

(assert (= (and b!716755 res!479680) b!716753))

(assert (= (and b!716753 res!479682) b!716752))

(assert (= (and b!716752 res!479678) b!716756))

(declare-fun m!672257 () Bool)

(assert (=> start!63684 m!672257))

(declare-fun m!672259 () Bool)

(assert (=> start!63684 m!672259))

(declare-fun m!672261 () Bool)

(assert (=> b!716752 m!672261))

(declare-fun m!672263 () Bool)

(assert (=> b!716753 m!672263))

(declare-fun m!672265 () Bool)

(assert (=> b!716756 m!672265))

(declare-fun m!672267 () Bool)

(assert (=> b!716755 m!672267))

(assert (=> b!716755 m!672267))

(declare-fun m!672269 () Bool)

(assert (=> b!716755 m!672269))

(push 1)

(assert (not b!716752))

(assert (not b!716755))

(assert (not b!716753))

(assert (not start!63684))

(assert (not b!716756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

