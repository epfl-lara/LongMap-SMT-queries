; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64934 () Bool)

(assert start!64934)

(declare-fun b!733038 () Bool)

(declare-fun res!492569 () Bool)

(declare-fun e!410179 () Bool)

(assert (=> b!733038 (=> (not res!492569) (not e!410179))))

(declare-datatypes ((array!41245 0))(
  ( (array!41246 (arr!19739 (Array (_ BitVec 32) (_ BitVec 64))) (size!20160 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41245)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733038 (= res!492569 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19739 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733039 () Bool)

(declare-fun e!410178 () Bool)

(declare-fun e!410175 () Bool)

(assert (=> b!733039 (= e!410178 (not e!410175))))

(declare-fun res!492575 () Bool)

(assert (=> b!733039 (=> res!492575 e!410175)))

(declare-datatypes ((SeekEntryResult!7339 0))(
  ( (MissingZero!7339 (index!31724 (_ BitVec 32))) (Found!7339 (index!31725 (_ BitVec 32))) (Intermediate!7339 (undefined!8151 Bool) (index!31726 (_ BitVec 32)) (x!62713 (_ BitVec 32))) (Undefined!7339) (MissingVacant!7339 (index!31727 (_ BitVec 32))) )
))
(declare-fun lt!324883 () SeekEntryResult!7339)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!733039 (= res!492575 (or (not (is-Intermediate!7339 lt!324883)) (bvsge x!1131 (x!62713 lt!324883))))))

(declare-fun e!410171 () Bool)

(assert (=> b!733039 e!410171))

(declare-fun res!492577 () Bool)

(assert (=> b!733039 (=> (not res!492577) (not e!410171))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41245 (_ BitVec 32)) Bool)

(assert (=> b!733039 (= res!492577 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24996 0))(
  ( (Unit!24997) )
))
(declare-fun lt!324884 () Unit!24996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24996)

(assert (=> b!733039 (= lt!324884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!492572 () Bool)

(declare-fun e!410180 () Bool)

(assert (=> start!64934 (=> (not res!492572) (not e!410180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64934 (= res!492572 (validMask!0 mask!3328))))

(assert (=> start!64934 e!410180))

(assert (=> start!64934 true))

(declare-fun array_inv!15535 (array!41245) Bool)

(assert (=> start!64934 (array_inv!15535 a!3186)))

(declare-fun b!733040 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!324881 () SeekEntryResult!7339)

(declare-fun e!410173 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733040 (= e!410173 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324881))))

(declare-fun b!733041 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733041 (= e!410173 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) (Found!7339 j!159)))))

(declare-fun e!410172 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!324882 () SeekEntryResult!7339)

(declare-fun b!733042 () Bool)

(assert (=> b!733042 (= e!410172 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324882))))

(declare-fun b!733043 () Bool)

(declare-fun e!410177 () Bool)

(assert (=> b!733043 (= e!410177 true)))

(declare-fun lt!324886 () SeekEntryResult!7339)

(assert (=> b!733043 (= lt!324886 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19739 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733044 () Bool)

(declare-fun res!492581 () Bool)

(assert (=> b!733044 (=> (not res!492581) (not e!410180))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733044 (= res!492581 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733045 () Bool)

(assert (=> b!733045 (= e!410179 e!410178)))

(declare-fun res!492566 () Bool)

(assert (=> b!733045 (=> (not res!492566) (not e!410178))))

(declare-fun lt!324887 () SeekEntryResult!7339)

(assert (=> b!733045 (= res!492566 (= lt!324887 lt!324883))))

(declare-fun lt!324880 () (_ BitVec 64))

(declare-fun lt!324879 () array!41245)

(assert (=> b!733045 (= lt!324883 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324880 lt!324879 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733045 (= lt!324887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324880 mask!3328) lt!324880 lt!324879 mask!3328))))

(assert (=> b!733045 (= lt!324880 (select (store (arr!19739 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733045 (= lt!324879 (array!41246 (store (arr!19739 a!3186) i!1173 k!2102) (size!20160 a!3186)))))

(declare-fun b!733046 () Bool)

(declare-fun e!410174 () Bool)

(assert (=> b!733046 (= e!410180 e!410174)))

(declare-fun res!492576 () Bool)

(assert (=> b!733046 (=> (not res!492576) (not e!410174))))

(declare-fun lt!324885 () SeekEntryResult!7339)

(assert (=> b!733046 (= res!492576 (or (= lt!324885 (MissingZero!7339 i!1173)) (= lt!324885 (MissingVacant!7339 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733046 (= lt!324885 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733047 () Bool)

(declare-fun res!492568 () Bool)

(assert (=> b!733047 (=> (not res!492568) (not e!410174))))

(declare-datatypes ((List!13741 0))(
  ( (Nil!13738) (Cons!13737 (h!14803 (_ BitVec 64)) (t!20056 List!13741)) )
))
(declare-fun arrayNoDuplicates!0 (array!41245 (_ BitVec 32) List!13741) Bool)

(assert (=> b!733047 (= res!492568 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13738))))

(declare-fun b!733048 () Bool)

(declare-fun res!492579 () Bool)

(assert (=> b!733048 (=> (not res!492579) (not e!410174))))

(assert (=> b!733048 (= res!492579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733049 () Bool)

(declare-fun res!492574 () Bool)

(assert (=> b!733049 (=> (not res!492574) (not e!410180))))

(assert (=> b!733049 (= res!492574 (and (= (size!20160 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20160 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20160 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733050 () Bool)

(assert (=> b!733050 (= e!410174 e!410179)))

(declare-fun res!492580 () Bool)

(assert (=> b!733050 (=> (not res!492580) (not e!410179))))

(assert (=> b!733050 (= res!492580 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19739 a!3186) j!159) mask!3328) (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324881))))

(assert (=> b!733050 (= lt!324881 (Intermediate!7339 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733051 () Bool)

(declare-fun res!492565 () Bool)

(assert (=> b!733051 (=> (not res!492565) (not e!410180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733051 (= res!492565 (validKeyInArray!0 k!2102))))

(declare-fun b!733052 () Bool)

(declare-fun res!492571 () Bool)

(assert (=> b!733052 (=> (not res!492571) (not e!410174))))

(assert (=> b!733052 (= res!492571 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20160 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20160 a!3186))))))

(declare-fun b!733053 () Bool)

(assert (=> b!733053 (= e!410175 e!410177)))

(declare-fun res!492567 () Bool)

(assert (=> b!733053 (=> res!492567 e!410177)))

(assert (=> b!733053 (= res!492567 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324878 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733053 (= lt!324878 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733054 () Bool)

(declare-fun res!492570 () Bool)

(assert (=> b!733054 (=> (not res!492570) (not e!410180))))

(assert (=> b!733054 (= res!492570 (validKeyInArray!0 (select (arr!19739 a!3186) j!159)))))

(declare-fun b!733055 () Bool)

(assert (=> b!733055 (= e!410171 e!410172)))

(declare-fun res!492573 () Bool)

(assert (=> b!733055 (=> (not res!492573) (not e!410172))))

(assert (=> b!733055 (= res!492573 (= (seekEntryOrOpen!0 (select (arr!19739 a!3186) j!159) a!3186 mask!3328) lt!324882))))

(assert (=> b!733055 (= lt!324882 (Found!7339 j!159))))

(declare-fun b!733056 () Bool)

(declare-fun res!492578 () Bool)

(assert (=> b!733056 (=> (not res!492578) (not e!410179))))

(assert (=> b!733056 (= res!492578 e!410173)))

(declare-fun c!80614 () Bool)

(assert (=> b!733056 (= c!80614 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64934 res!492572) b!733049))

(assert (= (and b!733049 res!492574) b!733054))

(assert (= (and b!733054 res!492570) b!733051))

(assert (= (and b!733051 res!492565) b!733044))

(assert (= (and b!733044 res!492581) b!733046))

(assert (= (and b!733046 res!492576) b!733048))

(assert (= (and b!733048 res!492579) b!733047))

(assert (= (and b!733047 res!492568) b!733052))

(assert (= (and b!733052 res!492571) b!733050))

(assert (= (and b!733050 res!492580) b!733038))

(assert (= (and b!733038 res!492569) b!733056))

(assert (= (and b!733056 c!80614) b!733040))

(assert (= (and b!733056 (not c!80614)) b!733041))

(assert (= (and b!733056 res!492578) b!733045))

(assert (= (and b!733045 res!492566) b!733039))

(assert (= (and b!733039 res!492577) b!733055))

(assert (= (and b!733055 res!492573) b!733042))

(assert (= (and b!733039 (not res!492575)) b!733053))

(assert (= (and b!733053 (not res!492567)) b!733043))

(declare-fun m!685999 () Bool)

(assert (=> b!733055 m!685999))

(assert (=> b!733055 m!685999))

(declare-fun m!686001 () Bool)

(assert (=> b!733055 m!686001))

(declare-fun m!686003 () Bool)

(assert (=> b!733038 m!686003))

(declare-fun m!686005 () Bool)

(assert (=> b!733046 m!686005))

(assert (=> b!733041 m!685999))

(assert (=> b!733041 m!685999))

(declare-fun m!686007 () Bool)

(assert (=> b!733041 m!686007))

(assert (=> b!733042 m!685999))

(assert (=> b!733042 m!685999))

(declare-fun m!686009 () Bool)

(assert (=> b!733042 m!686009))

(declare-fun m!686011 () Bool)

(assert (=> b!733051 m!686011))

(assert (=> b!733054 m!685999))

(assert (=> b!733054 m!685999))

(declare-fun m!686013 () Bool)

(assert (=> b!733054 m!686013))

(declare-fun m!686015 () Bool)

(assert (=> b!733045 m!686015))

(declare-fun m!686017 () Bool)

(assert (=> b!733045 m!686017))

(declare-fun m!686019 () Bool)

(assert (=> b!733045 m!686019))

(declare-fun m!686021 () Bool)

(assert (=> b!733045 m!686021))

(assert (=> b!733045 m!686017))

(declare-fun m!686023 () Bool)

(assert (=> b!733045 m!686023))

(assert (=> b!733043 m!685999))

(assert (=> b!733043 m!685999))

(assert (=> b!733043 m!686007))

(declare-fun m!686025 () Bool)

(assert (=> b!733053 m!686025))

(declare-fun m!686027 () Bool)

(assert (=> b!733039 m!686027))

(declare-fun m!686029 () Bool)

(assert (=> b!733039 m!686029))

(assert (=> b!733040 m!685999))

(assert (=> b!733040 m!685999))

(declare-fun m!686031 () Bool)

(assert (=> b!733040 m!686031))

(declare-fun m!686033 () Bool)

(assert (=> b!733047 m!686033))

(declare-fun m!686035 () Bool)

(assert (=> b!733048 m!686035))

(declare-fun m!686037 () Bool)

(assert (=> b!733044 m!686037))

(assert (=> b!733050 m!685999))

(assert (=> b!733050 m!685999))

(declare-fun m!686039 () Bool)

(assert (=> b!733050 m!686039))

(assert (=> b!733050 m!686039))

(assert (=> b!733050 m!685999))

(declare-fun m!686041 () Bool)

(assert (=> b!733050 m!686041))

(declare-fun m!686043 () Bool)

(assert (=> start!64934 m!686043))

(declare-fun m!686045 () Bool)

(assert (=> start!64934 m!686045))

(push 1)

(assert (not b!733055))

(assert (not b!733048))

(assert (not b!733047))

(assert (not b!733041))

(assert (not b!733044))

(assert (not b!733046))

(assert (not b!733039))

(assert (not b!733042))

(assert (not b!733045))

(assert (not b!733050))

(assert (not b!733040))

(assert (not b!733051))

(assert (not b!733054))

(assert (not b!733043))

(assert (not b!733053))

(assert (not start!64934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

