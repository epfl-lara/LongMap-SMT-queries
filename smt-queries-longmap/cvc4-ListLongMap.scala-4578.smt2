; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63938 () Bool)

(assert start!63938)

(declare-fun b!718276 () Bool)

(declare-fun res!480759 () Bool)

(declare-fun e!403263 () Bool)

(assert (=> b!718276 (=> (not res!480759) (not e!403263))))

(declare-datatypes ((array!40678 0))(
  ( (array!40679 (arr!19466 (Array (_ BitVec 32) (_ BitVec 64))) (size!19887 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40678)

(declare-datatypes ((List!13468 0))(
  ( (Nil!13465) (Cons!13464 (h!14509 (_ BitVec 64)) (t!19783 List!13468)) )
))
(declare-fun arrayNoDuplicates!0 (array!40678 (_ BitVec 32) List!13468) Bool)

(assert (=> b!718276 (= res!480759 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13465))))

(declare-fun b!718277 () Bool)

(declare-fun res!480756 () Bool)

(declare-fun e!403264 () Bool)

(assert (=> b!718277 (=> (not res!480756) (not e!403264))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718277 (= res!480756 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718278 () Bool)

(assert (=> b!718278 (= e!403264 e!403263)))

(declare-fun res!480761 () Bool)

(assert (=> b!718278 (=> (not res!480761) (not e!403263))))

(declare-datatypes ((SeekEntryResult!7066 0))(
  ( (MissingZero!7066 (index!30632 (_ BitVec 32))) (Found!7066 (index!30633 (_ BitVec 32))) (Intermediate!7066 (undefined!7878 Bool) (index!30634 (_ BitVec 32)) (x!61646 (_ BitVec 32))) (Undefined!7066) (MissingVacant!7066 (index!30635 (_ BitVec 32))) )
))
(declare-fun lt!319328 () SeekEntryResult!7066)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718278 (= res!480761 (or (= lt!319328 (MissingZero!7066 i!1173)) (= lt!319328 (MissingVacant!7066 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40678 (_ BitVec 32)) SeekEntryResult!7066)

(assert (=> b!718278 (= lt!319328 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!480764 () Bool)

(assert (=> start!63938 (=> (not res!480764) (not e!403264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63938 (= res!480764 (validMask!0 mask!3328))))

(assert (=> start!63938 e!403264))

(assert (=> start!63938 true))

(declare-fun array_inv!15262 (array!40678) Bool)

(assert (=> start!63938 (array_inv!15262 a!3186)))

(declare-fun b!718279 () Bool)

(declare-fun res!480762 () Bool)

(assert (=> b!718279 (=> (not res!480762) (not e!403263))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!718279 (= res!480762 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19887 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19887 a!3186))))))

(declare-fun b!718280 () Bool)

(assert (=> b!718280 (= e!403263 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319327 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718280 (= lt!319327 (toIndex!0 (select (arr!19466 a!3186) j!159) mask!3328))))

(declare-fun b!718281 () Bool)

(declare-fun res!480760 () Bool)

(assert (=> b!718281 (=> (not res!480760) (not e!403264))))

(assert (=> b!718281 (= res!480760 (and (= (size!19887 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19887 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19887 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718282 () Bool)

(declare-fun res!480763 () Bool)

(assert (=> b!718282 (=> (not res!480763) (not e!403264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718282 (= res!480763 (validKeyInArray!0 k!2102))))

(declare-fun b!718283 () Bool)

(declare-fun res!480757 () Bool)

(assert (=> b!718283 (=> (not res!480757) (not e!403264))))

(assert (=> b!718283 (= res!480757 (validKeyInArray!0 (select (arr!19466 a!3186) j!159)))))

(declare-fun b!718284 () Bool)

(declare-fun res!480758 () Bool)

(assert (=> b!718284 (=> (not res!480758) (not e!403263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40678 (_ BitVec 32)) Bool)

(assert (=> b!718284 (= res!480758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63938 res!480764) b!718281))

(assert (= (and b!718281 res!480760) b!718283))

(assert (= (and b!718283 res!480757) b!718282))

(assert (= (and b!718282 res!480763) b!718277))

(assert (= (and b!718277 res!480756) b!718278))

(assert (= (and b!718278 res!480761) b!718284))

(assert (= (and b!718284 res!480758) b!718276))

(assert (= (and b!718276 res!480759) b!718279))

(assert (= (and b!718279 res!480762) b!718280))

(declare-fun m!673961 () Bool)

(assert (=> b!718280 m!673961))

(assert (=> b!718280 m!673961))

(declare-fun m!673963 () Bool)

(assert (=> b!718280 m!673963))

(declare-fun m!673965 () Bool)

(assert (=> b!718278 m!673965))

(declare-fun m!673967 () Bool)

(assert (=> start!63938 m!673967))

(declare-fun m!673969 () Bool)

(assert (=> start!63938 m!673969))

(declare-fun m!673971 () Bool)

(assert (=> b!718277 m!673971))

(declare-fun m!673973 () Bool)

(assert (=> b!718284 m!673973))

(declare-fun m!673975 () Bool)

(assert (=> b!718276 m!673975))

(assert (=> b!718283 m!673961))

(assert (=> b!718283 m!673961))

(declare-fun m!673977 () Bool)

(assert (=> b!718283 m!673977))

(declare-fun m!673979 () Bool)

(assert (=> b!718282 m!673979))

(push 1)

(assert (not b!718278))

(assert (not b!718284))

(assert (not b!718282))

(assert (not b!718280))

(assert (not start!63938))

(assert (not b!718283))

(assert (not b!718276))

(assert (not b!718277))

