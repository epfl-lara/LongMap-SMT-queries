; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65454 () Bool)

(assert start!65454)

(declare-datatypes ((array!41497 0))(
  ( (array!41498 (arr!19858 (Array (_ BitVec 32) (_ BitVec 64))) (size!20278 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41497)

(declare-fun e!415238 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7414 0))(
  ( (MissingZero!7414 (index!32024 (_ BitVec 32))) (Found!7414 (index!32025 (_ BitVec 32))) (Intermediate!7414 (undefined!8226 Bool) (index!32026 (_ BitVec 32)) (x!63160 (_ BitVec 32))) (Undefined!7414) (MissingVacant!7414 (index!32027 (_ BitVec 32))) )
))
(declare-fun lt!329994 () SeekEntryResult!7414)

(declare-fun b!742851 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!742851 (= e!415238 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329994))))

(declare-fun b!742852 () Bool)

(declare-fun res!499646 () Bool)

(declare-fun e!415243 () Bool)

(assert (=> b!742852 (=> (not res!499646) (not e!415243))))

(declare-datatypes ((List!13767 0))(
  ( (Nil!13764) (Cons!13763 (h!14841 (_ BitVec 64)) (t!20074 List!13767)) )
))
(declare-fun arrayNoDuplicates!0 (array!41497 (_ BitVec 32) List!13767) Bool)

(assert (=> b!742852 (= res!499646 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13764))))

(declare-fun b!742853 () Bool)

(declare-fun e!415245 () Bool)

(assert (=> b!742853 (= e!415245 e!415243)))

(declare-fun res!499653 () Bool)

(assert (=> b!742853 (=> (not res!499653) (not e!415243))))

(declare-fun lt!329992 () SeekEntryResult!7414)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742853 (= res!499653 (or (= lt!329992 (MissingZero!7414 i!1173)) (= lt!329992 (MissingVacant!7414 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!742853 (= lt!329992 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742854 () Bool)

(declare-fun res!499652 () Bool)

(declare-fun e!415241 () Bool)

(assert (=> b!742854 (=> (not res!499652) (not e!415241))))

(assert (=> b!742854 (= res!499652 e!415238)))

(declare-fun c!81989 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742854 (= c!81989 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742855 () Bool)

(declare-fun e!415239 () Bool)

(assert (=> b!742855 (= e!415239 (not true))))

(declare-fun e!415242 () Bool)

(assert (=> b!742855 e!415242))

(declare-fun res!499643 () Bool)

(assert (=> b!742855 (=> (not res!499643) (not e!415242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41497 (_ BitVec 32)) Bool)

(assert (=> b!742855 (= res!499643 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25387 0))(
  ( (Unit!25388) )
))
(declare-fun lt!329991 () Unit!25387)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25387)

(assert (=> b!742855 (= lt!329991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742856 () Bool)

(declare-fun res!499647 () Bool)

(assert (=> b!742856 (=> (not res!499647) (not e!415245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742856 (= res!499647 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!329993 () SeekEntryResult!7414)

(declare-fun b!742857 () Bool)

(declare-fun e!415244 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!742857 (= e!415244 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329993))))

(declare-fun b!742859 () Bool)

(declare-fun res!499641 () Bool)

(assert (=> b!742859 (=> (not res!499641) (not e!415245))))

(assert (=> b!742859 (= res!499641 (validKeyInArray!0 (select (arr!19858 a!3186) j!159)))))

(declare-fun b!742860 () Bool)

(assert (=> b!742860 (= e!415242 e!415244)))

(declare-fun res!499645 () Bool)

(assert (=> b!742860 (=> (not res!499645) (not e!415244))))

(assert (=> b!742860 (= res!499645 (= (seekEntryOrOpen!0 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329993))))

(assert (=> b!742860 (= lt!329993 (Found!7414 j!159))))

(declare-fun b!742861 () Bool)

(declare-fun res!499649 () Bool)

(assert (=> b!742861 (=> (not res!499649) (not e!415243))))

(assert (=> b!742861 (= res!499649 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20278 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20278 a!3186))))))

(declare-fun b!742862 () Bool)

(declare-fun res!499644 () Bool)

(assert (=> b!742862 (=> (not res!499644) (not e!415245))))

(assert (=> b!742862 (= res!499644 (and (= (size!20278 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20278 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20278 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742863 () Bool)

(assert (=> b!742863 (= e!415238 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) (Found!7414 j!159)))))

(declare-fun res!499651 () Bool)

(assert (=> start!65454 (=> (not res!499651) (not e!415245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65454 (= res!499651 (validMask!0 mask!3328))))

(assert (=> start!65454 e!415245))

(assert (=> start!65454 true))

(declare-fun array_inv!15717 (array!41497) Bool)

(assert (=> start!65454 (array_inv!15717 a!3186)))

(declare-fun b!742858 () Bool)

(declare-fun res!499654 () Bool)

(assert (=> b!742858 (=> (not res!499654) (not e!415243))))

(assert (=> b!742858 (= res!499654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742864 () Bool)

(assert (=> b!742864 (= e!415241 e!415239)))

(declare-fun res!499650 () Bool)

(assert (=> b!742864 (=> (not res!499650) (not e!415239))))

(declare-fun lt!329990 () array!41497)

(declare-fun lt!329989 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742864 (= res!499650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329989 mask!3328) lt!329989 lt!329990 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329989 lt!329990 mask!3328)))))

(assert (=> b!742864 (= lt!329989 (select (store (arr!19858 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742864 (= lt!329990 (array!41498 (store (arr!19858 a!3186) i!1173 k0!2102) (size!20278 a!3186)))))

(declare-fun b!742865 () Bool)

(declare-fun res!499648 () Bool)

(assert (=> b!742865 (=> (not res!499648) (not e!415245))))

(declare-fun arrayContainsKey!0 (array!41497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742865 (= res!499648 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742866 () Bool)

(assert (=> b!742866 (= e!415243 e!415241)))

(declare-fun res!499640 () Bool)

(assert (=> b!742866 (=> (not res!499640) (not e!415241))))

(assert (=> b!742866 (= res!499640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19858 a!3186) j!159) mask!3328) (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329994))))

(assert (=> b!742866 (= lt!329994 (Intermediate!7414 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742867 () Bool)

(declare-fun res!499642 () Bool)

(assert (=> b!742867 (=> (not res!499642) (not e!415241))))

(assert (=> b!742867 (= res!499642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19858 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65454 res!499651) b!742862))

(assert (= (and b!742862 res!499644) b!742859))

(assert (= (and b!742859 res!499641) b!742856))

(assert (= (and b!742856 res!499647) b!742865))

(assert (= (and b!742865 res!499648) b!742853))

(assert (= (and b!742853 res!499653) b!742858))

(assert (= (and b!742858 res!499654) b!742852))

(assert (= (and b!742852 res!499646) b!742861))

(assert (= (and b!742861 res!499649) b!742866))

(assert (= (and b!742866 res!499640) b!742867))

(assert (= (and b!742867 res!499642) b!742854))

(assert (= (and b!742854 c!81989) b!742851))

(assert (= (and b!742854 (not c!81989)) b!742863))

(assert (= (and b!742854 res!499652) b!742864))

(assert (= (and b!742864 res!499650) b!742855))

(assert (= (and b!742855 res!499643) b!742860))

(assert (= (and b!742860 res!499645) b!742857))

(declare-fun m!694173 () Bool)

(assert (=> b!742859 m!694173))

(assert (=> b!742859 m!694173))

(declare-fun m!694175 () Bool)

(assert (=> b!742859 m!694175))

(assert (=> b!742863 m!694173))

(assert (=> b!742863 m!694173))

(declare-fun m!694177 () Bool)

(assert (=> b!742863 m!694177))

(assert (=> b!742866 m!694173))

(assert (=> b!742866 m!694173))

(declare-fun m!694179 () Bool)

(assert (=> b!742866 m!694179))

(assert (=> b!742866 m!694179))

(assert (=> b!742866 m!694173))

(declare-fun m!694181 () Bool)

(assert (=> b!742866 m!694181))

(declare-fun m!694183 () Bool)

(assert (=> b!742858 m!694183))

(assert (=> b!742857 m!694173))

(assert (=> b!742857 m!694173))

(declare-fun m!694185 () Bool)

(assert (=> b!742857 m!694185))

(assert (=> b!742851 m!694173))

(assert (=> b!742851 m!694173))

(declare-fun m!694187 () Bool)

(assert (=> b!742851 m!694187))

(declare-fun m!694189 () Bool)

(assert (=> start!65454 m!694189))

(declare-fun m!694191 () Bool)

(assert (=> start!65454 m!694191))

(declare-fun m!694193 () Bool)

(assert (=> b!742856 m!694193))

(declare-fun m!694195 () Bool)

(assert (=> b!742853 m!694195))

(declare-fun m!694197 () Bool)

(assert (=> b!742867 m!694197))

(declare-fun m!694199 () Bool)

(assert (=> b!742855 m!694199))

(declare-fun m!694201 () Bool)

(assert (=> b!742855 m!694201))

(declare-fun m!694203 () Bool)

(assert (=> b!742852 m!694203))

(assert (=> b!742860 m!694173))

(assert (=> b!742860 m!694173))

(declare-fun m!694205 () Bool)

(assert (=> b!742860 m!694205))

(declare-fun m!694207 () Bool)

(assert (=> b!742865 m!694207))

(declare-fun m!694209 () Bool)

(assert (=> b!742864 m!694209))

(declare-fun m!694211 () Bool)

(assert (=> b!742864 m!694211))

(declare-fun m!694213 () Bool)

(assert (=> b!742864 m!694213))

(declare-fun m!694215 () Bool)

(assert (=> b!742864 m!694215))

(declare-fun m!694217 () Bool)

(assert (=> b!742864 m!694217))

(assert (=> b!742864 m!694211))

(check-sat (not start!65454) (not b!742863) (not b!742851) (not b!742853) (not b!742857) (not b!742864) (not b!742852) (not b!742858) (not b!742855) (not b!742860) (not b!742856) (not b!742859) (not b!742865) (not b!742866))
(check-sat)
