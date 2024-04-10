; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29314 () Bool)

(assert start!29314)

(declare-fun res!156530 () Bool)

(declare-fun e!187702 () Bool)

(assert (=> start!29314 (=> (not res!156530) (not e!187702))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29314 (= res!156530 (validMask!0 mask!3809))))

(assert (=> start!29314 e!187702))

(assert (=> start!29314 true))

(declare-datatypes ((array!15027 0))(
  ( (array!15028 (arr!7121 (Array (_ BitVec 32) (_ BitVec 64))) (size!7473 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15027)

(declare-fun array_inv!5084 (array!15027) Bool)

(assert (=> start!29314 (array_inv!5084 a!3312)))

(declare-fun b!296998 () Bool)

(declare-fun e!187704 () Bool)

(declare-fun e!187703 () Bool)

(assert (=> b!296998 (= e!187704 e!187703)))

(declare-fun res!156527 () Bool)

(assert (=> b!296998 (=> (not res!156527) (not e!187703))))

(declare-datatypes ((SeekEntryResult!2270 0))(
  ( (MissingZero!2270 (index!11250 (_ BitVec 32))) (Found!2270 (index!11251 (_ BitVec 32))) (Intermediate!2270 (undefined!3082 Bool) (index!11252 (_ BitVec 32)) (x!29470 (_ BitVec 32))) (Undefined!2270) (MissingVacant!2270 (index!11253 (_ BitVec 32))) )
))
(declare-fun lt!147505 () SeekEntryResult!2270)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!147507 () Bool)

(assert (=> b!296998 (= res!156527 (and (or lt!147507 (not (undefined!3082 lt!147505))) (or lt!147507 (not (= (select (arr!7121 a!3312) (index!11252 lt!147505)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147507 (not (= (select (arr!7121 a!3312) (index!11252 lt!147505)) k!2524))) (not lt!147507)))))

(assert (=> b!296998 (= lt!147507 (not (is-Intermediate!2270 lt!147505)))))

(declare-fun b!296999 () Bool)

(declare-fun res!156524 () Bool)

(assert (=> b!296999 (=> (not res!156524) (not e!187702))))

(declare-fun arrayContainsKey!0 (array!15027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296999 (= res!156524 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297000 () Bool)

(declare-fun res!156531 () Bool)

(assert (=> b!297000 (=> (not res!156531) (not e!187702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297000 (= res!156531 (validKeyInArray!0 k!2524))))

(declare-fun b!297001 () Bool)

(declare-fun res!156529 () Bool)

(declare-fun e!187701 () Bool)

(assert (=> b!297001 (=> (not res!156529) (not e!187701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15027 (_ BitVec 32)) Bool)

(assert (=> b!297001 (= res!156529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297002 () Bool)

(assert (=> b!297002 (= e!187701 e!187704)))

(declare-fun res!156525 () Bool)

(assert (=> b!297002 (=> (not res!156525) (not e!187704))))

(declare-fun lt!147508 () Bool)

(assert (=> b!297002 (= res!156525 lt!147508)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147510 () SeekEntryResult!2270)

(declare-fun lt!147504 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15027 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!297002 (= lt!147510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147504 k!2524 (array!15028 (store (arr!7121 a!3312) i!1256 k!2524) (size!7473 a!3312)) mask!3809))))

(assert (=> b!297002 (= lt!147505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147504 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297002 (= lt!147504 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297003 () Bool)

(assert (=> b!297003 (= e!187703 (not true))))

(assert (=> b!297003 (= lt!147510 lt!147505)))

(declare-datatypes ((Unit!9238 0))(
  ( (Unit!9239) )
))
(declare-fun lt!147509 () Unit!9238)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9238)

(assert (=> b!297003 (= lt!147509 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147504 (index!11252 lt!147505) (x!29470 lt!147505) mask!3809))))

(assert (=> b!297003 (and (= (select (arr!7121 a!3312) (index!11252 lt!147505)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11252 lt!147505) i!1256))))

(declare-fun b!297004 () Bool)

(declare-fun res!156528 () Bool)

(assert (=> b!297004 (=> (not res!156528) (not e!187702))))

(assert (=> b!297004 (= res!156528 (and (= (size!7473 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7473 a!3312))))))

(declare-fun b!297005 () Bool)

(assert (=> b!297005 (= e!187702 e!187701)))

(declare-fun res!156526 () Bool)

(assert (=> b!297005 (=> (not res!156526) (not e!187701))))

(declare-fun lt!147506 () SeekEntryResult!2270)

(assert (=> b!297005 (= res!156526 (or lt!147508 (= lt!147506 (MissingVacant!2270 i!1256))))))

(assert (=> b!297005 (= lt!147508 (= lt!147506 (MissingZero!2270 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15027 (_ BitVec 32)) SeekEntryResult!2270)

(assert (=> b!297005 (= lt!147506 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29314 res!156530) b!297004))

(assert (= (and b!297004 res!156528) b!297000))

(assert (= (and b!297000 res!156531) b!296999))

(assert (= (and b!296999 res!156524) b!297005))

(assert (= (and b!297005 res!156526) b!297001))

(assert (= (and b!297001 res!156529) b!297002))

(assert (= (and b!297002 res!156525) b!296998))

(assert (= (and b!296998 res!156527) b!297003))

(declare-fun m!309819 () Bool)

(assert (=> b!297001 m!309819))

(declare-fun m!309821 () Bool)

(assert (=> b!296999 m!309821))

(declare-fun m!309823 () Bool)

(assert (=> b!297005 m!309823))

(declare-fun m!309825 () Bool)

(assert (=> b!297003 m!309825))

(declare-fun m!309827 () Bool)

(assert (=> b!297003 m!309827))

(assert (=> b!296998 m!309827))

(declare-fun m!309829 () Bool)

(assert (=> b!297002 m!309829))

(declare-fun m!309831 () Bool)

(assert (=> b!297002 m!309831))

(declare-fun m!309833 () Bool)

(assert (=> b!297002 m!309833))

(declare-fun m!309835 () Bool)

(assert (=> b!297002 m!309835))

(declare-fun m!309837 () Bool)

(assert (=> start!29314 m!309837))

(declare-fun m!309839 () Bool)

(assert (=> start!29314 m!309839))

(declare-fun m!309841 () Bool)

(assert (=> b!297000 m!309841))

(push 1)

