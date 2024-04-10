; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66190 () Bool)

(assert start!66190)

(declare-fun b!762164 () Bool)

(declare-fun res!515278 () Bool)

(declare-fun e!424902 () Bool)

(assert (=> b!762164 (=> (not res!515278) (not e!424902))))

(declare-datatypes ((array!42095 0))(
  ( (array!42096 (arr!20155 (Array (_ BitVec 32) (_ BitVec 64))) (size!20576 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42095)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762164 (= res!515278 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762165 () Bool)

(declare-fun res!515279 () Bool)

(declare-fun e!424901 () Bool)

(assert (=> b!762165 (=> (not res!515279) (not e!424901))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42095 (_ BitVec 32)) Bool)

(assert (=> b!762165 (= res!515279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762166 () Bool)

(declare-fun res!515276 () Bool)

(assert (=> b!762166 (=> (not res!515276) (not e!424902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762166 (= res!515276 (validKeyInArray!0 k0!2102))))

(declare-fun b!762167 () Bool)

(assert (=> b!762167 (= e!424902 e!424901)))

(declare-fun res!515275 () Bool)

(assert (=> b!762167 (=> (not res!515275) (not e!424901))))

(declare-datatypes ((SeekEntryResult!7755 0))(
  ( (MissingZero!7755 (index!33388 (_ BitVec 32))) (Found!7755 (index!33389 (_ BitVec 32))) (Intermediate!7755 (undefined!8567 Bool) (index!33390 (_ BitVec 32)) (x!64303 (_ BitVec 32))) (Undefined!7755) (MissingVacant!7755 (index!33391 (_ BitVec 32))) )
))
(declare-fun lt!339509 () SeekEntryResult!7755)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762167 (= res!515275 (or (= lt!339509 (MissingZero!7755 i!1173)) (= lt!339509 (MissingVacant!7755 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42095 (_ BitVec 32)) SeekEntryResult!7755)

(assert (=> b!762167 (= lt!339509 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!515277 () Bool)

(assert (=> start!66190 (=> (not res!515277) (not e!424902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66190 (= res!515277 (validMask!0 mask!3328))))

(assert (=> start!66190 e!424902))

(declare-fun array_inv!15951 (array!42095) Bool)

(assert (=> start!66190 (array_inv!15951 a!3186)))

(assert (=> start!66190 true))

(declare-fun b!762168 () Bool)

(declare-fun res!515281 () Bool)

(assert (=> b!762168 (=> (not res!515281) (not e!424902))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!762168 (= res!515281 (and (= (size!20576 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20576 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20576 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762169 () Bool)

(declare-fun res!515280 () Bool)

(assert (=> b!762169 (=> (not res!515280) (not e!424902))))

(assert (=> b!762169 (= res!515280 (validKeyInArray!0 (select (arr!20155 a!3186) j!159)))))

(declare-fun b!762170 () Bool)

(assert (=> b!762170 (= e!424901 false)))

(declare-fun lt!339508 () Bool)

(declare-datatypes ((List!14157 0))(
  ( (Nil!14154) (Cons!14153 (h!15237 (_ BitVec 64)) (t!20472 List!14157)) )
))
(declare-fun arrayNoDuplicates!0 (array!42095 (_ BitVec 32) List!14157) Bool)

(assert (=> b!762170 (= lt!339508 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14154))))

(assert (= (and start!66190 res!515277) b!762168))

(assert (= (and b!762168 res!515281) b!762169))

(assert (= (and b!762169 res!515280) b!762166))

(assert (= (and b!762166 res!515276) b!762164))

(assert (= (and b!762164 res!515278) b!762167))

(assert (= (and b!762167 res!515275) b!762165))

(assert (= (and b!762165 res!515279) b!762170))

(declare-fun m!708969 () Bool)

(assert (=> b!762166 m!708969))

(declare-fun m!708971 () Bool)

(assert (=> b!762170 m!708971))

(declare-fun m!708973 () Bool)

(assert (=> b!762165 m!708973))

(declare-fun m!708975 () Bool)

(assert (=> b!762169 m!708975))

(assert (=> b!762169 m!708975))

(declare-fun m!708977 () Bool)

(assert (=> b!762169 m!708977))

(declare-fun m!708979 () Bool)

(assert (=> b!762164 m!708979))

(declare-fun m!708981 () Bool)

(assert (=> start!66190 m!708981))

(declare-fun m!708983 () Bool)

(assert (=> start!66190 m!708983))

(declare-fun m!708985 () Bool)

(assert (=> b!762167 m!708985))

(check-sat (not b!762170) (not b!762164) (not start!66190) (not b!762169) (not b!762165) (not b!762166) (not b!762167))
(check-sat)
