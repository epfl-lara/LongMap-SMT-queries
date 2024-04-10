; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64278 () Bool)

(assert start!64278)

(declare-fun b!721857 () Bool)

(declare-fun e!404719 () Bool)

(declare-fun e!404717 () Bool)

(assert (=> b!721857 (= e!404719 e!404717)))

(declare-fun res!483651 () Bool)

(assert (=> b!721857 (=> (not res!483651) (not e!404717))))

(declare-datatypes ((array!40859 0))(
  ( (array!40860 (arr!19552 (Array (_ BitVec 32) (_ BitVec 64))) (size!19973 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40859)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7152 0))(
  ( (MissingZero!7152 (index!30976 (_ BitVec 32))) (Found!7152 (index!30977 (_ BitVec 32))) (Intermediate!7152 (undefined!7964 Bool) (index!30978 (_ BitVec 32)) (x!61985 (_ BitVec 32))) (Undefined!7152) (MissingVacant!7152 (index!30979 (_ BitVec 32))) )
))
(declare-fun lt!320167 () SeekEntryResult!7152)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40859 (_ BitVec 32)) SeekEntryResult!7152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721857 (= res!483651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19552 a!3186) j!159) mask!3328) (select (arr!19552 a!3186) j!159) a!3186 mask!3328) lt!320167))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721857 (= lt!320167 (Intermediate!7152 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721858 () Bool)

(assert (=> b!721858 (= e!404717 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!721859 () Bool)

(declare-fun res!483661 () Bool)

(declare-fun e!404716 () Bool)

(assert (=> b!721859 (=> (not res!483661) (not e!404716))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721859 (= res!483661 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721860 () Bool)

(declare-fun res!483662 () Bool)

(assert (=> b!721860 (=> (not res!483662) (not e!404719))))

(declare-datatypes ((List!13554 0))(
  ( (Nil!13551) (Cons!13550 (h!14604 (_ BitVec 64)) (t!19869 List!13554)) )
))
(declare-fun arrayNoDuplicates!0 (array!40859 (_ BitVec 32) List!13554) Bool)

(assert (=> b!721860 (= res!483662 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13551))))

(declare-fun b!721861 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!404718 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40859 (_ BitVec 32)) SeekEntryResult!7152)

(assert (=> b!721861 (= e!404718 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19552 a!3186) j!159) a!3186 mask!3328) (Found!7152 j!159)))))

(declare-fun b!721862 () Bool)

(declare-fun res!483654 () Bool)

(assert (=> b!721862 (=> (not res!483654) (not e!404717))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721862 (= res!483654 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19552 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721863 () Bool)

(declare-fun res!483656 () Bool)

(assert (=> b!721863 (=> (not res!483656) (not e!404719))))

(assert (=> b!721863 (= res!483656 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19973 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19973 a!3186))))))

(declare-fun b!721864 () Bool)

(declare-fun res!483657 () Bool)

(assert (=> b!721864 (=> (not res!483657) (not e!404719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40859 (_ BitVec 32)) Bool)

(assert (=> b!721864 (= res!483657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721865 () Bool)

(assert (=> b!721865 (= e!404716 e!404719)))

(declare-fun res!483653 () Bool)

(assert (=> b!721865 (=> (not res!483653) (not e!404719))))

(declare-fun lt!320168 () SeekEntryResult!7152)

(assert (=> b!721865 (= res!483653 (or (= lt!320168 (MissingZero!7152 i!1173)) (= lt!320168 (MissingVacant!7152 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40859 (_ BitVec 32)) SeekEntryResult!7152)

(assert (=> b!721865 (= lt!320168 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721866 () Bool)

(declare-fun res!483655 () Bool)

(assert (=> b!721866 (=> (not res!483655) (not e!404716))))

(assert (=> b!721866 (= res!483655 (and (= (size!19973 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19973 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19973 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721867 () Bool)

(declare-fun res!483658 () Bool)

(assert (=> b!721867 (=> (not res!483658) (not e!404717))))

(assert (=> b!721867 (= res!483658 e!404718)))

(declare-fun c!79474 () Bool)

(assert (=> b!721867 (= c!79474 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!483659 () Bool)

(assert (=> start!64278 (=> (not res!483659) (not e!404716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64278 (= res!483659 (validMask!0 mask!3328))))

(assert (=> start!64278 e!404716))

(assert (=> start!64278 true))

(declare-fun array_inv!15348 (array!40859) Bool)

(assert (=> start!64278 (array_inv!15348 a!3186)))

(declare-fun b!721856 () Bool)

(assert (=> b!721856 (= e!404718 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19552 a!3186) j!159) a!3186 mask!3328) lt!320167))))

(declare-fun b!721868 () Bool)

(declare-fun res!483652 () Bool)

(assert (=> b!721868 (=> (not res!483652) (not e!404716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721868 (= res!483652 (validKeyInArray!0 k0!2102))))

(declare-fun b!721869 () Bool)

(declare-fun res!483660 () Bool)

(assert (=> b!721869 (=> (not res!483660) (not e!404716))))

(assert (=> b!721869 (= res!483660 (validKeyInArray!0 (select (arr!19552 a!3186) j!159)))))

(assert (= (and start!64278 res!483659) b!721866))

(assert (= (and b!721866 res!483655) b!721869))

(assert (= (and b!721869 res!483660) b!721868))

(assert (= (and b!721868 res!483652) b!721859))

(assert (= (and b!721859 res!483661) b!721865))

(assert (= (and b!721865 res!483653) b!721864))

(assert (= (and b!721864 res!483657) b!721860))

(assert (= (and b!721860 res!483662) b!721863))

(assert (= (and b!721863 res!483656) b!721857))

(assert (= (and b!721857 res!483651) b!721862))

(assert (= (and b!721862 res!483654) b!721867))

(assert (= (and b!721867 c!79474) b!721856))

(assert (= (and b!721867 (not c!79474)) b!721861))

(assert (= (and b!721867 res!483658) b!721858))

(declare-fun m!676553 () Bool)

(assert (=> b!721860 m!676553))

(declare-fun m!676555 () Bool)

(assert (=> b!721856 m!676555))

(assert (=> b!721856 m!676555))

(declare-fun m!676557 () Bool)

(assert (=> b!721856 m!676557))

(assert (=> b!721861 m!676555))

(assert (=> b!721861 m!676555))

(declare-fun m!676559 () Bool)

(assert (=> b!721861 m!676559))

(assert (=> b!721869 m!676555))

(assert (=> b!721869 m!676555))

(declare-fun m!676561 () Bool)

(assert (=> b!721869 m!676561))

(declare-fun m!676563 () Bool)

(assert (=> b!721868 m!676563))

(assert (=> b!721857 m!676555))

(assert (=> b!721857 m!676555))

(declare-fun m!676565 () Bool)

(assert (=> b!721857 m!676565))

(assert (=> b!721857 m!676565))

(assert (=> b!721857 m!676555))

(declare-fun m!676567 () Bool)

(assert (=> b!721857 m!676567))

(declare-fun m!676569 () Bool)

(assert (=> b!721862 m!676569))

(declare-fun m!676571 () Bool)

(assert (=> b!721864 m!676571))

(declare-fun m!676573 () Bool)

(assert (=> start!64278 m!676573))

(declare-fun m!676575 () Bool)

(assert (=> start!64278 m!676575))

(declare-fun m!676577 () Bool)

(assert (=> b!721865 m!676577))

(declare-fun m!676579 () Bool)

(assert (=> b!721859 m!676579))

(check-sat (not b!721859) (not b!721860) (not b!721865) (not b!721856) (not b!721868) (not start!64278) (not b!721861) (not b!721864) (not b!721869) (not b!721857))
(check-sat)
