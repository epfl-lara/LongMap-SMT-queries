; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66194 () Bool)

(assert start!66194)

(declare-fun b!762210 () Bool)

(declare-fun res!515322 () Bool)

(declare-fun e!424918 () Bool)

(assert (=> b!762210 (=> (not res!515322) (not e!424918))))

(declare-datatypes ((array!42099 0))(
  ( (array!42100 (arr!20157 (Array (_ BitVec 32) (_ BitVec 64))) (size!20578 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42099)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762210 (= res!515322 (and (= (size!20578 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20578 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20578 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762211 () Bool)

(declare-fun e!424919 () Bool)

(assert (=> b!762211 (= e!424918 e!424919)))

(declare-fun res!515326 () Bool)

(assert (=> b!762211 (=> (not res!515326) (not e!424919))))

(declare-datatypes ((SeekEntryResult!7757 0))(
  ( (MissingZero!7757 (index!33396 (_ BitVec 32))) (Found!7757 (index!33397 (_ BitVec 32))) (Intermediate!7757 (undefined!8569 Bool) (index!33398 (_ BitVec 32)) (x!64313 (_ BitVec 32))) (Undefined!7757) (MissingVacant!7757 (index!33399 (_ BitVec 32))) )
))
(declare-fun lt!339521 () SeekEntryResult!7757)

(assert (=> b!762211 (= res!515326 (or (= lt!339521 (MissingZero!7757 i!1173)) (= lt!339521 (MissingVacant!7757 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42099 (_ BitVec 32)) SeekEntryResult!7757)

(assert (=> b!762211 (= lt!339521 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762212 () Bool)

(declare-fun res!515329 () Bool)

(assert (=> b!762212 (=> (not res!515329) (not e!424918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762212 (= res!515329 (validKeyInArray!0 (select (arr!20157 a!3186) j!159)))))

(declare-fun b!762213 () Bool)

(declare-fun res!515321 () Bool)

(assert (=> b!762213 (=> (not res!515321) (not e!424919))))

(declare-datatypes ((List!14159 0))(
  ( (Nil!14156) (Cons!14155 (h!15239 (_ BitVec 64)) (t!20474 List!14159)) )
))
(declare-fun arrayNoDuplicates!0 (array!42099 (_ BitVec 32) List!14159) Bool)

(assert (=> b!762213 (= res!515321 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14156))))

(declare-fun res!515325 () Bool)

(assert (=> start!66194 (=> (not res!515325) (not e!424918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66194 (= res!515325 (validMask!0 mask!3328))))

(assert (=> start!66194 e!424918))

(assert (=> start!66194 true))

(declare-fun array_inv!15953 (array!42099) Bool)

(assert (=> start!66194 (array_inv!15953 a!3186)))

(declare-fun b!762214 () Bool)

(declare-fun res!515323 () Bool)

(assert (=> b!762214 (=> (not res!515323) (not e!424919))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762214 (= res!515323 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20578 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20578 a!3186))))))

(declare-fun b!762215 () Bool)

(declare-fun res!515328 () Bool)

(assert (=> b!762215 (=> (not res!515328) (not e!424919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42099 (_ BitVec 32)) Bool)

(assert (=> b!762215 (= res!515328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762216 () Bool)

(declare-fun res!515327 () Bool)

(assert (=> b!762216 (=> (not res!515327) (not e!424918))))

(declare-fun arrayContainsKey!0 (array!42099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762216 (= res!515327 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762217 () Bool)

(declare-fun res!515324 () Bool)

(assert (=> b!762217 (=> (not res!515324) (not e!424918))))

(assert (=> b!762217 (= res!515324 (validKeyInArray!0 k!2102))))

(declare-fun b!762218 () Bool)

(assert (=> b!762218 (= e!424919 false)))

(declare-fun lt!339520 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762218 (= lt!339520 (toIndex!0 (select (arr!20157 a!3186) j!159) mask!3328))))

(assert (= (and start!66194 res!515325) b!762210))

(assert (= (and b!762210 res!515322) b!762212))

(assert (= (and b!762212 res!515329) b!762217))

(assert (= (and b!762217 res!515324) b!762216))

(assert (= (and b!762216 res!515327) b!762211))

(assert (= (and b!762211 res!515326) b!762215))

(assert (= (and b!762215 res!515328) b!762213))

(assert (= (and b!762213 res!515321) b!762214))

(assert (= (and b!762214 res!515323) b!762218))

(declare-fun m!709005 () Bool)

(assert (=> b!762211 m!709005))

(declare-fun m!709007 () Bool)

(assert (=> b!762212 m!709007))

(assert (=> b!762212 m!709007))

(declare-fun m!709009 () Bool)

(assert (=> b!762212 m!709009))

(declare-fun m!709011 () Bool)

(assert (=> b!762213 m!709011))

(declare-fun m!709013 () Bool)

(assert (=> b!762215 m!709013))

(declare-fun m!709015 () Bool)

(assert (=> b!762216 m!709015))

(assert (=> b!762218 m!709007))

(assert (=> b!762218 m!709007))

(declare-fun m!709017 () Bool)

(assert (=> b!762218 m!709017))

(declare-fun m!709019 () Bool)

(assert (=> b!762217 m!709019))

(declare-fun m!709021 () Bool)

(assert (=> start!66194 m!709021))

(declare-fun m!709023 () Bool)

(assert (=> start!66194 m!709023))

(push 1)

