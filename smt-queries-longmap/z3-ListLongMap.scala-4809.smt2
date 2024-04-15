; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66174 () Bool)

(assert start!66174)

(declare-fun b!761960 () Bool)

(declare-fun res!515217 () Bool)

(declare-fun e!424765 () Bool)

(assert (=> b!761960 (=> (not res!515217) (not e!424765))))

(declare-datatypes ((array!42096 0))(
  ( (array!42097 (arr!20156 (Array (_ BitVec 32) (_ BitVec 64))) (size!20577 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42096)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761960 (= res!515217 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!761961 () Bool)

(declare-fun res!515216 () Bool)

(assert (=> b!761961 (=> (not res!515216) (not e!424765))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!761961 (= res!515216 (validKeyInArray!0 (select (arr!20156 a!3186) j!159)))))

(declare-fun b!761962 () Bool)

(declare-fun res!515219 () Bool)

(declare-fun e!424766 () Bool)

(assert (=> b!761962 (=> (not res!515219) (not e!424766))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42096 (_ BitVec 32)) Bool)

(assert (=> b!761962 (= res!515219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!761963 () Bool)

(declare-fun res!515215 () Bool)

(assert (=> b!761963 (=> (not res!515215) (not e!424765))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761963 (= res!515215 (and (= (size!20577 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20577 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20577 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!761964 () Bool)

(declare-fun res!515213 () Bool)

(assert (=> b!761964 (=> (not res!515213) (not e!424766))))

(declare-datatypes ((List!14197 0))(
  ( (Nil!14194) (Cons!14193 (h!15277 (_ BitVec 64)) (t!20503 List!14197)) )
))
(declare-fun arrayNoDuplicates!0 (array!42096 (_ BitVec 32) List!14197) Bool)

(assert (=> b!761964 (= res!515213 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14194))))

(declare-fun b!761965 () Bool)

(declare-fun res!515211 () Bool)

(assert (=> b!761965 (=> (not res!515211) (not e!424765))))

(assert (=> b!761965 (= res!515211 (validKeyInArray!0 k0!2102))))

(declare-fun b!761966 () Bool)

(declare-fun res!515214 () Bool)

(assert (=> b!761966 (=> (not res!515214) (not e!424766))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!761966 (= res!515214 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20577 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20577 a!3186))))))

(declare-fun b!761967 () Bool)

(assert (=> b!761967 (= e!424765 e!424766)))

(declare-fun res!515218 () Bool)

(assert (=> b!761967 (=> (not res!515218) (not e!424766))))

(declare-datatypes ((SeekEntryResult!7753 0))(
  ( (MissingZero!7753 (index!33380 (_ BitVec 32))) (Found!7753 (index!33381 (_ BitVec 32))) (Intermediate!7753 (undefined!8565 Bool) (index!33382 (_ BitVec 32)) (x!64304 (_ BitVec 32))) (Undefined!7753) (MissingVacant!7753 (index!33383 (_ BitVec 32))) )
))
(declare-fun lt!339281 () SeekEntryResult!7753)

(assert (=> b!761967 (= res!515218 (or (= lt!339281 (MissingZero!7753 i!1173)) (= lt!339281 (MissingVacant!7753 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42096 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!761967 (= lt!339281 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!515212 () Bool)

(assert (=> start!66174 (=> (not res!515212) (not e!424765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66174 (= res!515212 (validMask!0 mask!3328))))

(assert (=> start!66174 e!424765))

(assert (=> start!66174 true))

(declare-fun array_inv!16039 (array!42096) Bool)

(assert (=> start!66174 (array_inv!16039 a!3186)))

(declare-fun b!761968 () Bool)

(assert (=> b!761968 (= e!424766 false)))

(declare-fun lt!339280 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761968 (= lt!339280 (toIndex!0 (select (arr!20156 a!3186) j!159) mask!3328))))

(assert (= (and start!66174 res!515212) b!761963))

(assert (= (and b!761963 res!515215) b!761961))

(assert (= (and b!761961 res!515216) b!761965))

(assert (= (and b!761965 res!515211) b!761960))

(assert (= (and b!761960 res!515217) b!761967))

(assert (= (and b!761967 res!515218) b!761962))

(assert (= (and b!761962 res!515219) b!761964))

(assert (= (and b!761964 res!515213) b!761966))

(assert (= (and b!761966 res!515214) b!761968))

(declare-fun m!708247 () Bool)

(assert (=> b!761965 m!708247))

(declare-fun m!708249 () Bool)

(assert (=> b!761962 m!708249))

(declare-fun m!708251 () Bool)

(assert (=> b!761968 m!708251))

(assert (=> b!761968 m!708251))

(declare-fun m!708253 () Bool)

(assert (=> b!761968 m!708253))

(declare-fun m!708255 () Bool)

(assert (=> start!66174 m!708255))

(declare-fun m!708257 () Bool)

(assert (=> start!66174 m!708257))

(declare-fun m!708259 () Bool)

(assert (=> b!761960 m!708259))

(assert (=> b!761961 m!708251))

(assert (=> b!761961 m!708251))

(declare-fun m!708261 () Bool)

(assert (=> b!761961 m!708261))

(declare-fun m!708263 () Bool)

(assert (=> b!761964 m!708263))

(declare-fun m!708265 () Bool)

(assert (=> b!761967 m!708265))

(check-sat (not b!761965) (not start!66174) (not b!761967) (not b!761962) (not b!761961) (not b!761960) (not b!761968) (not b!761964))
(check-sat)
