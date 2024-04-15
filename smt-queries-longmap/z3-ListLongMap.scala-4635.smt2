; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64490 () Bool)

(assert start!64490)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41025 0))(
  ( (array!41026 (arr!19634 (Array (_ BitVec 32) (_ BitVec 64))) (size!20055 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41025)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7231 0))(
  ( (MissingZero!7231 (index!31292 (_ BitVec 32))) (Found!7231 (index!31293 (_ BitVec 32))) (Intermediate!7231 (undefined!8043 Bool) (index!31294 (_ BitVec 32)) (x!62292 (_ BitVec 32))) (Undefined!7231) (MissingVacant!7231 (index!31295 (_ BitVec 32))) )
))
(declare-fun lt!321332 () SeekEntryResult!7231)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!406410 () Bool)

(declare-fun b!725839 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41025 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!725839 (= e!406410 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321332))))

(declare-fun b!725840 () Bool)

(declare-fun res!487015 () Bool)

(declare-fun e!406412 () Bool)

(assert (=> b!725840 (=> (not res!487015) (not e!406412))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725840 (= res!487015 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19634 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725841 () Bool)

(declare-fun res!487012 () Bool)

(declare-fun e!406413 () Bool)

(assert (=> b!725841 (=> (not res!487012) (not e!406413))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725841 (= res!487012 (validKeyInArray!0 k0!2102))))

(declare-fun b!725842 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406414 () Bool)

(declare-fun lt!321330 () SeekEntryResult!7231)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41025 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!725842 (= e!406414 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321330))))

(declare-fun res!487013 () Bool)

(assert (=> start!64490 (=> (not res!487013) (not e!406413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64490 (= res!487013 (validMask!0 mask!3328))))

(assert (=> start!64490 e!406413))

(assert (=> start!64490 true))

(declare-fun array_inv!15517 (array!41025) Bool)

(assert (=> start!64490 (array_inv!15517 a!3186)))

(declare-fun b!725843 () Bool)

(declare-fun res!487009 () Bool)

(assert (=> b!725843 (=> (not res!487009) (not e!406413))))

(assert (=> b!725843 (= res!487009 (validKeyInArray!0 (select (arr!19634 a!3186) j!159)))))

(declare-fun b!725844 () Bool)

(declare-fun res!487016 () Bool)

(declare-fun e!406408 () Bool)

(assert (=> b!725844 (=> (not res!487016) (not e!406408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41025 (_ BitVec 32)) Bool)

(assert (=> b!725844 (= res!487016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725845 () Bool)

(declare-fun res!487008 () Bool)

(assert (=> b!725845 (=> (not res!487008) (not e!406413))))

(assert (=> b!725845 (= res!487008 (and (= (size!20055 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20055 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20055 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725846 () Bool)

(declare-fun e!406407 () Bool)

(assert (=> b!725846 (= e!406412 e!406407)))

(declare-fun res!487011 () Bool)

(assert (=> b!725846 (=> (not res!487011) (not e!406407))))

(declare-fun lt!321334 () array!41025)

(declare-fun lt!321331 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725846 (= res!487011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321331 mask!3328) lt!321331 lt!321334 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321331 lt!321334 mask!3328)))))

(assert (=> b!725846 (= lt!321331 (select (store (arr!19634 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725846 (= lt!321334 (array!41026 (store (arr!19634 a!3186) i!1173 k0!2102) (size!20055 a!3186)))))

(declare-fun b!725847 () Bool)

(declare-fun e!406409 () Bool)

(assert (=> b!725847 (= e!406409 e!406410)))

(declare-fun res!487007 () Bool)

(assert (=> b!725847 (=> (not res!487007) (not e!406410))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41025 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!725847 (= res!487007 (= (seekEntryOrOpen!0 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321332))))

(assert (=> b!725847 (= lt!321332 (Found!7231 j!159))))

(declare-fun b!725848 () Bool)

(assert (=> b!725848 (= e!406407 (not true))))

(assert (=> b!725848 e!406409))

(declare-fun res!487003 () Bool)

(assert (=> b!725848 (=> (not res!487003) (not e!406409))))

(assert (=> b!725848 (= res!487003 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24752 0))(
  ( (Unit!24753) )
))
(declare-fun lt!321333 () Unit!24752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24752)

(assert (=> b!725848 (= lt!321333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725849 () Bool)

(assert (=> b!725849 (= e!406413 e!406408)))

(declare-fun res!487010 () Bool)

(assert (=> b!725849 (=> (not res!487010) (not e!406408))))

(declare-fun lt!321335 () SeekEntryResult!7231)

(assert (=> b!725849 (= res!487010 (or (= lt!321335 (MissingZero!7231 i!1173)) (= lt!321335 (MissingVacant!7231 i!1173))))))

(assert (=> b!725849 (= lt!321335 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725850 () Bool)

(declare-fun res!487017 () Bool)

(assert (=> b!725850 (=> (not res!487017) (not e!406412))))

(assert (=> b!725850 (= res!487017 e!406414)))

(declare-fun c!79791 () Bool)

(assert (=> b!725850 (= c!79791 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725851 () Bool)

(declare-fun res!487006 () Bool)

(assert (=> b!725851 (=> (not res!487006) (not e!406408))))

(assert (=> b!725851 (= res!487006 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20055 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20055 a!3186))))))

(declare-fun b!725852 () Bool)

(assert (=> b!725852 (= e!406414 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) (Found!7231 j!159)))))

(declare-fun b!725853 () Bool)

(declare-fun res!487004 () Bool)

(assert (=> b!725853 (=> (not res!487004) (not e!406408))))

(declare-datatypes ((List!13675 0))(
  ( (Nil!13672) (Cons!13671 (h!14728 (_ BitVec 64)) (t!19981 List!13675)) )
))
(declare-fun arrayNoDuplicates!0 (array!41025 (_ BitVec 32) List!13675) Bool)

(assert (=> b!725853 (= res!487004 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13672))))

(declare-fun b!725854 () Bool)

(assert (=> b!725854 (= e!406408 e!406412)))

(declare-fun res!487005 () Bool)

(assert (=> b!725854 (=> (not res!487005) (not e!406412))))

(assert (=> b!725854 (= res!487005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19634 a!3186) j!159) mask!3328) (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321330))))

(assert (=> b!725854 (= lt!321330 (Intermediate!7231 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725855 () Bool)

(declare-fun res!487014 () Bool)

(assert (=> b!725855 (=> (not res!487014) (not e!406413))))

(declare-fun arrayContainsKey!0 (array!41025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725855 (= res!487014 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64490 res!487013) b!725845))

(assert (= (and b!725845 res!487008) b!725843))

(assert (= (and b!725843 res!487009) b!725841))

(assert (= (and b!725841 res!487012) b!725855))

(assert (= (and b!725855 res!487014) b!725849))

(assert (= (and b!725849 res!487010) b!725844))

(assert (= (and b!725844 res!487016) b!725853))

(assert (= (and b!725853 res!487004) b!725851))

(assert (= (and b!725851 res!487006) b!725854))

(assert (= (and b!725854 res!487005) b!725840))

(assert (= (and b!725840 res!487015) b!725850))

(assert (= (and b!725850 c!79791) b!725842))

(assert (= (and b!725850 (not c!79791)) b!725852))

(assert (= (and b!725850 res!487017) b!725846))

(assert (= (and b!725846 res!487011) b!725848))

(assert (= (and b!725848 res!487003) b!725847))

(assert (= (and b!725847 res!487007) b!725839))

(declare-fun m!679427 () Bool)

(assert (=> b!725853 m!679427))

(declare-fun m!679429 () Bool)

(assert (=> b!725847 m!679429))

(assert (=> b!725847 m!679429))

(declare-fun m!679431 () Bool)

(assert (=> b!725847 m!679431))

(assert (=> b!725842 m!679429))

(assert (=> b!725842 m!679429))

(declare-fun m!679433 () Bool)

(assert (=> b!725842 m!679433))

(assert (=> b!725839 m!679429))

(assert (=> b!725839 m!679429))

(declare-fun m!679435 () Bool)

(assert (=> b!725839 m!679435))

(declare-fun m!679437 () Bool)

(assert (=> b!725855 m!679437))

(assert (=> b!725852 m!679429))

(assert (=> b!725852 m!679429))

(declare-fun m!679439 () Bool)

(assert (=> b!725852 m!679439))

(declare-fun m!679441 () Bool)

(assert (=> b!725849 m!679441))

(declare-fun m!679443 () Bool)

(assert (=> start!64490 m!679443))

(declare-fun m!679445 () Bool)

(assert (=> start!64490 m!679445))

(declare-fun m!679447 () Bool)

(assert (=> b!725848 m!679447))

(declare-fun m!679449 () Bool)

(assert (=> b!725848 m!679449))

(declare-fun m!679451 () Bool)

(assert (=> b!725844 m!679451))

(declare-fun m!679453 () Bool)

(assert (=> b!725841 m!679453))

(declare-fun m!679455 () Bool)

(assert (=> b!725846 m!679455))

(declare-fun m!679457 () Bool)

(assert (=> b!725846 m!679457))

(declare-fun m!679459 () Bool)

(assert (=> b!725846 m!679459))

(declare-fun m!679461 () Bool)

(assert (=> b!725846 m!679461))

(assert (=> b!725846 m!679457))

(declare-fun m!679463 () Bool)

(assert (=> b!725846 m!679463))

(assert (=> b!725843 m!679429))

(assert (=> b!725843 m!679429))

(declare-fun m!679465 () Bool)

(assert (=> b!725843 m!679465))

(declare-fun m!679467 () Bool)

(assert (=> b!725840 m!679467))

(assert (=> b!725854 m!679429))

(assert (=> b!725854 m!679429))

(declare-fun m!679469 () Bool)

(assert (=> b!725854 m!679469))

(assert (=> b!725854 m!679469))

(assert (=> b!725854 m!679429))

(declare-fun m!679471 () Bool)

(assert (=> b!725854 m!679471))

(check-sat (not b!725848) (not b!725854) (not b!725855) (not b!725846) (not b!725843) (not b!725849) (not start!64490) (not b!725853) (not b!725844) (not b!725847) (not b!725842) (not b!725852) (not b!725841) (not b!725839))
(check-sat)
