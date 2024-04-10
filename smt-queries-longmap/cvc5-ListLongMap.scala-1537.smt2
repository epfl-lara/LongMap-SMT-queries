; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29152 () Bool)

(assert start!29152)

(declare-fun res!155589 () Bool)

(declare-fun e!186943 () Bool)

(assert (=> start!29152 (=> (not res!155589) (not e!186943))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29152 (= res!155589 (validMask!0 mask!3809))))

(assert (=> start!29152 e!186943))

(assert (=> start!29152 true))

(declare-datatypes ((array!14955 0))(
  ( (array!14956 (arr!7088 (Array (_ BitVec 32) (_ BitVec 64))) (size!7440 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14955)

(declare-fun array_inv!5051 (array!14955) Bool)

(assert (=> start!29152 (array_inv!5051 a!3312)))

(declare-fun b!295774 () Bool)

(declare-fun res!155587 () Bool)

(assert (=> b!295774 (=> (not res!155587) (not e!186943))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295774 (= res!155587 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295775 () Bool)

(declare-fun e!186942 () Bool)

(declare-fun e!186946 () Bool)

(assert (=> b!295775 (= e!186942 e!186946)))

(declare-fun res!155588 () Bool)

(assert (=> b!295775 (=> (not res!155588) (not e!186946))))

(declare-datatypes ((SeekEntryResult!2237 0))(
  ( (MissingZero!2237 (index!11118 (_ BitVec 32))) (Found!2237 (index!11119 (_ BitVec 32))) (Intermediate!2237 (undefined!3049 Bool) (index!11120 (_ BitVec 32)) (x!29337 (_ BitVec 32))) (Undefined!2237) (MissingVacant!2237 (index!11121 (_ BitVec 32))) )
))
(declare-fun lt!146719 () SeekEntryResult!2237)

(declare-fun lt!146716 () Bool)

(assert (=> b!295775 (= res!155588 (and (or lt!146716 (not (undefined!3049 lt!146719))) (or lt!146716 (not (= (select (arr!7088 a!3312) (index!11120 lt!146719)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146716 (not (= (select (arr!7088 a!3312) (index!11120 lt!146719)) k!2524))) (not lt!146716)))))

(assert (=> b!295775 (= lt!146716 (not (is-Intermediate!2237 lt!146719)))))

(declare-fun b!295776 () Bool)

(declare-fun e!186945 () Bool)

(assert (=> b!295776 (= e!186943 e!186945)))

(declare-fun res!155586 () Bool)

(assert (=> b!295776 (=> (not res!155586) (not e!186945))))

(declare-fun lt!146718 () Bool)

(declare-fun lt!146720 () SeekEntryResult!2237)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295776 (= res!155586 (or lt!146718 (= lt!146720 (MissingVacant!2237 i!1256))))))

(assert (=> b!295776 (= lt!146718 (= lt!146720 (MissingZero!2237 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14955 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!295776 (= lt!146720 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295777 () Bool)

(declare-fun res!155584 () Bool)

(assert (=> b!295777 (=> (not res!155584) (not e!186945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14955 (_ BitVec 32)) Bool)

(assert (=> b!295777 (= res!155584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295778 () Bool)

(declare-fun res!155583 () Bool)

(assert (=> b!295778 (=> (not res!155583) (not e!186943))))

(assert (=> b!295778 (= res!155583 (and (= (size!7440 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7440 a!3312))))))

(declare-fun b!295779 () Bool)

(assert (=> b!295779 (= e!186945 e!186942)))

(declare-fun res!155585 () Bool)

(assert (=> b!295779 (=> (not res!155585) (not e!186942))))

(assert (=> b!295779 (= res!155585 lt!146718)))

(declare-fun lt!146717 () SeekEntryResult!2237)

(declare-fun lt!146721 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14955 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!295779 (= lt!146717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146721 k!2524 (array!14956 (store (arr!7088 a!3312) i!1256 k!2524) (size!7440 a!3312)) mask!3809))))

(assert (=> b!295779 (= lt!146719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146721 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295779 (= lt!146721 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295780 () Bool)

(assert (=> b!295780 (= e!186946 (not true))))

(assert (=> b!295780 (and (= (select (arr!7088 a!3312) (index!11120 lt!146719)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11120 lt!146719) i!1256))))

(declare-fun b!295781 () Bool)

(declare-fun res!155582 () Bool)

(assert (=> b!295781 (=> (not res!155582) (not e!186943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295781 (= res!155582 (validKeyInArray!0 k!2524))))

(assert (= (and start!29152 res!155589) b!295778))

(assert (= (and b!295778 res!155583) b!295781))

(assert (= (and b!295781 res!155582) b!295774))

(assert (= (and b!295774 res!155587) b!295776))

(assert (= (and b!295776 res!155586) b!295777))

(assert (= (and b!295777 res!155584) b!295779))

(assert (= (and b!295779 res!155585) b!295775))

(assert (= (and b!295775 res!155588) b!295780))

(declare-fun m!308853 () Bool)

(assert (=> b!295777 m!308853))

(declare-fun m!308855 () Bool)

(assert (=> b!295779 m!308855))

(declare-fun m!308857 () Bool)

(assert (=> b!295779 m!308857))

(declare-fun m!308859 () Bool)

(assert (=> b!295779 m!308859))

(declare-fun m!308861 () Bool)

(assert (=> b!295779 m!308861))

(declare-fun m!308863 () Bool)

(assert (=> b!295780 m!308863))

(declare-fun m!308865 () Bool)

(assert (=> b!295781 m!308865))

(declare-fun m!308867 () Bool)

(assert (=> b!295776 m!308867))

(assert (=> b!295775 m!308863))

(declare-fun m!308869 () Bool)

(assert (=> start!29152 m!308869))

(declare-fun m!308871 () Bool)

(assert (=> start!29152 m!308871))

(declare-fun m!308873 () Bool)

(assert (=> b!295774 m!308873))

(push 1)

