; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66182 () Bool)

(assert start!66182)

(declare-fun b!762068 () Bool)

(declare-fun res!515323 () Bool)

(declare-fun e!424800 () Bool)

(assert (=> b!762068 (=> (not res!515323) (not e!424800))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762068 (= res!515323 (validKeyInArray!0 k!2102))))

(declare-fun b!762069 () Bool)

(declare-fun res!515324 () Bool)

(declare-fun e!424801 () Bool)

(assert (=> b!762069 (=> (not res!515324) (not e!424801))))

(declare-datatypes ((array!42104 0))(
  ( (array!42105 (arr!20160 (Array (_ BitVec 32) (_ BitVec 64))) (size!20581 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42104)

(declare-datatypes ((List!14201 0))(
  ( (Nil!14198) (Cons!14197 (h!15281 (_ BitVec 64)) (t!20507 List!14201)) )
))
(declare-fun arrayNoDuplicates!0 (array!42104 (_ BitVec 32) List!14201) Bool)

(assert (=> b!762069 (= res!515324 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14198))))

(declare-fun res!515319 () Bool)

(assert (=> start!66182 (=> (not res!515319) (not e!424800))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66182 (= res!515319 (validMask!0 mask!3328))))

(assert (=> start!66182 e!424800))

(assert (=> start!66182 true))

(declare-fun array_inv!16043 (array!42104) Bool)

(assert (=> start!66182 (array_inv!16043 a!3186)))

(declare-fun b!762070 () Bool)

(declare-fun res!515326 () Bool)

(assert (=> b!762070 (=> (not res!515326) (not e!424800))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762070 (= res!515326 (and (= (size!20581 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20581 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20581 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762071 () Bool)

(declare-fun res!515322 () Bool)

(assert (=> b!762071 (=> (not res!515322) (not e!424801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42104 (_ BitVec 32)) Bool)

(assert (=> b!762071 (= res!515322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762072 () Bool)

(declare-fun res!515325 () Bool)

(assert (=> b!762072 (=> (not res!515325) (not e!424800))))

(declare-fun arrayContainsKey!0 (array!42104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762072 (= res!515325 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762073 () Bool)

(assert (=> b!762073 (= e!424801 false)))

(declare-datatypes ((SeekEntryResult!7757 0))(
  ( (MissingZero!7757 (index!33396 (_ BitVec 32))) (Found!7757 (index!33397 (_ BitVec 32))) (Intermediate!7757 (undefined!8569 Bool) (index!33398 (_ BitVec 32)) (x!64316 (_ BitVec 32))) (Undefined!7757) (MissingVacant!7757 (index!33399 (_ BitVec 32))) )
))
(declare-fun lt!339305 () SeekEntryResult!7757)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42104 (_ BitVec 32)) SeekEntryResult!7757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762073 (= lt!339305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20160 a!3186) j!159) mask!3328) (select (arr!20160 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762074 () Bool)

(declare-fun res!515321 () Bool)

(assert (=> b!762074 (=> (not res!515321) (not e!424801))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762074 (= res!515321 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20581 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20581 a!3186))))))

(declare-fun b!762075 () Bool)

(declare-fun res!515320 () Bool)

(assert (=> b!762075 (=> (not res!515320) (not e!424800))))

(assert (=> b!762075 (= res!515320 (validKeyInArray!0 (select (arr!20160 a!3186) j!159)))))

(declare-fun b!762076 () Bool)

(assert (=> b!762076 (= e!424800 e!424801)))

(declare-fun res!515327 () Bool)

(assert (=> b!762076 (=> (not res!515327) (not e!424801))))

(declare-fun lt!339304 () SeekEntryResult!7757)

(assert (=> b!762076 (= res!515327 (or (= lt!339304 (MissingZero!7757 i!1173)) (= lt!339304 (MissingVacant!7757 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42104 (_ BitVec 32)) SeekEntryResult!7757)

(assert (=> b!762076 (= lt!339304 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66182 res!515319) b!762070))

(assert (= (and b!762070 res!515326) b!762075))

(assert (= (and b!762075 res!515320) b!762068))

(assert (= (and b!762068 res!515323) b!762072))

(assert (= (and b!762072 res!515325) b!762076))

(assert (= (and b!762076 res!515327) b!762071))

(assert (= (and b!762071 res!515322) b!762069))

(assert (= (and b!762069 res!515324) b!762074))

(assert (= (and b!762074 res!515321) b!762073))

(declare-fun m!708329 () Bool)

(assert (=> b!762075 m!708329))

(assert (=> b!762075 m!708329))

(declare-fun m!708331 () Bool)

(assert (=> b!762075 m!708331))

(declare-fun m!708333 () Bool)

(assert (=> b!762072 m!708333))

(declare-fun m!708335 () Bool)

(assert (=> start!66182 m!708335))

(declare-fun m!708337 () Bool)

(assert (=> start!66182 m!708337))

(declare-fun m!708339 () Bool)

(assert (=> b!762069 m!708339))

(assert (=> b!762073 m!708329))

(assert (=> b!762073 m!708329))

(declare-fun m!708341 () Bool)

(assert (=> b!762073 m!708341))

(assert (=> b!762073 m!708341))

(assert (=> b!762073 m!708329))

(declare-fun m!708343 () Bool)

(assert (=> b!762073 m!708343))

(declare-fun m!708345 () Bool)

(assert (=> b!762076 m!708345))

(declare-fun m!708347 () Bool)

(assert (=> b!762068 m!708347))

(declare-fun m!708349 () Bool)

(assert (=> b!762071 m!708349))

(push 1)

(assert (not b!762073))

(assert (not b!762072))

(assert (not b!762076))

(assert (not b!762069))

(assert (not start!66182))

(assert (not b!762071))

(assert (not b!762075))

(assert (not b!762068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

