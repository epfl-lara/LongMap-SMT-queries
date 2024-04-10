; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64654 () Bool)

(assert start!64654)

(declare-datatypes ((array!41103 0))(
  ( (array!41104 (arr!19671 (Array (_ BitVec 32) (_ BitVec 64))) (size!20092 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41103)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407756 () Bool)

(declare-datatypes ((SeekEntryResult!7271 0))(
  ( (MissingZero!7271 (index!31452 (_ BitVec 32))) (Found!7271 (index!31453 (_ BitVec 32))) (Intermediate!7271 (undefined!8083 Bool) (index!31454 (_ BitVec 32)) (x!62445 (_ BitVec 32))) (Undefined!7271) (MissingVacant!7271 (index!31455 (_ BitVec 32))) )
))
(declare-fun lt!322654 () SeekEntryResult!7271)

(declare-fun b!728416 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41103 (_ BitVec 32)) SeekEntryResult!7271)

(assert (=> b!728416 (= e!407756 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19671 a!3186) j!159) a!3186 mask!3328) lt!322654))))

(declare-fun b!728417 () Bool)

(declare-fun res!488947 () Bool)

(declare-fun e!407753 () Bool)

(assert (=> b!728417 (=> (not res!488947) (not e!407753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41103 (_ BitVec 32)) Bool)

(assert (=> b!728417 (= res!488947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!488942 () Bool)

(declare-fun e!407757 () Bool)

(assert (=> start!64654 (=> (not res!488942) (not e!407757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64654 (= res!488942 (validMask!0 mask!3328))))

(assert (=> start!64654 e!407757))

(assert (=> start!64654 true))

(declare-fun array_inv!15467 (array!41103) Bool)

(assert (=> start!64654 (array_inv!15467 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!407759 () Bool)

(declare-fun b!728418 () Bool)

(declare-fun lt!322658 () SeekEntryResult!7271)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41103 (_ BitVec 32)) SeekEntryResult!7271)

(assert (=> b!728418 (= e!407759 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19671 a!3186) j!159) a!3186 mask!3328) lt!322658))))

(declare-fun b!728419 () Bool)

(declare-fun e!407758 () Bool)

(declare-fun e!407752 () Bool)

(assert (=> b!728419 (= e!407758 e!407752)))

(declare-fun res!488946 () Bool)

(assert (=> b!728419 (=> (not res!488946) (not e!407752))))

(declare-fun lt!322655 () SeekEntryResult!7271)

(declare-fun lt!322652 () SeekEntryResult!7271)

(assert (=> b!728419 (= res!488946 (= lt!322655 lt!322652))))

(declare-fun lt!322653 () (_ BitVec 64))

(declare-fun lt!322657 () array!41103)

(assert (=> b!728419 (= lt!322652 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322653 lt!322657 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728419 (= lt!322655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322653 mask!3328) lt!322653 lt!322657 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!728419 (= lt!322653 (select (store (arr!19671 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728419 (= lt!322657 (array!41104 (store (arr!19671 a!3186) i!1173 k!2102) (size!20092 a!3186)))))

(declare-fun b!728420 () Bool)

(assert (=> b!728420 (= e!407756 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19671 a!3186) j!159) a!3186 mask!3328) (Found!7271 j!159)))))

(declare-fun b!728421 () Bool)

(declare-fun e!407754 () Bool)

(assert (=> b!728421 (= e!407754 e!407759)))

(declare-fun res!488948 () Bool)

(assert (=> b!728421 (=> (not res!488948) (not e!407759))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41103 (_ BitVec 32)) SeekEntryResult!7271)

(assert (=> b!728421 (= res!488948 (= (seekEntryOrOpen!0 (select (arr!19671 a!3186) j!159) a!3186 mask!3328) lt!322658))))

(assert (=> b!728421 (= lt!322658 (Found!7271 j!159))))

(declare-fun b!728422 () Bool)

(declare-fun res!488934 () Bool)

(assert (=> b!728422 (=> (not res!488934) (not e!407757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728422 (= res!488934 (validKeyInArray!0 k!2102))))

(declare-fun b!728423 () Bool)

(declare-fun res!488935 () Bool)

(assert (=> b!728423 (=> (not res!488935) (not e!407753))))

(declare-datatypes ((List!13673 0))(
  ( (Nil!13670) (Cons!13669 (h!14729 (_ BitVec 64)) (t!19988 List!13673)) )
))
(declare-fun arrayNoDuplicates!0 (array!41103 (_ BitVec 32) List!13673) Bool)

(assert (=> b!728423 (= res!488935 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13670))))

(declare-fun b!728424 () Bool)

(declare-fun res!488933 () Bool)

(assert (=> b!728424 (=> (not res!488933) (not e!407757))))

(declare-fun arrayContainsKey!0 (array!41103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728424 (= res!488933 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728425 () Bool)

(declare-fun e!407751 () Bool)

(assert (=> b!728425 (= e!407752 (not e!407751))))

(declare-fun res!488939 () Bool)

(assert (=> b!728425 (=> res!488939 e!407751)))

(assert (=> b!728425 (= res!488939 (or (not (is-Intermediate!7271 lt!322652)) (bvsge x!1131 (x!62445 lt!322652))))))

(assert (=> b!728425 e!407754))

(declare-fun res!488937 () Bool)

(assert (=> b!728425 (=> (not res!488937) (not e!407754))))

(assert (=> b!728425 (= res!488937 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24860 0))(
  ( (Unit!24861) )
))
(declare-fun lt!322651 () Unit!24860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24860)

(assert (=> b!728425 (= lt!322651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728426 () Bool)

(declare-fun res!488941 () Bool)

(assert (=> b!728426 (=> (not res!488941) (not e!407758))))

(assert (=> b!728426 (= res!488941 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19671 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728427 () Bool)

(assert (=> b!728427 (= e!407751 true)))

(declare-fun lt!322650 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728427 (= lt!322650 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728428 () Bool)

(assert (=> b!728428 (= e!407753 e!407758)))

(declare-fun res!488936 () Bool)

(assert (=> b!728428 (=> (not res!488936) (not e!407758))))

(assert (=> b!728428 (= res!488936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19671 a!3186) j!159) mask!3328) (select (arr!19671 a!3186) j!159) a!3186 mask!3328) lt!322654))))

(assert (=> b!728428 (= lt!322654 (Intermediate!7271 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728429 () Bool)

(assert (=> b!728429 (= e!407757 e!407753)))

(declare-fun res!488940 () Bool)

(assert (=> b!728429 (=> (not res!488940) (not e!407753))))

(declare-fun lt!322656 () SeekEntryResult!7271)

(assert (=> b!728429 (= res!488940 (or (= lt!322656 (MissingZero!7271 i!1173)) (= lt!322656 (MissingVacant!7271 i!1173))))))

(assert (=> b!728429 (= lt!322656 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728430 () Bool)

(declare-fun res!488938 () Bool)

(assert (=> b!728430 (=> (not res!488938) (not e!407757))))

(assert (=> b!728430 (= res!488938 (and (= (size!20092 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20092 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20092 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728431 () Bool)

(declare-fun res!488945 () Bool)

(assert (=> b!728431 (=> (not res!488945) (not e!407753))))

(assert (=> b!728431 (= res!488945 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20092 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20092 a!3186))))))

(declare-fun b!728432 () Bool)

(declare-fun res!488944 () Bool)

(assert (=> b!728432 (=> (not res!488944) (not e!407758))))

(assert (=> b!728432 (= res!488944 e!407756)))

(declare-fun c!80116 () Bool)

(assert (=> b!728432 (= c!80116 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728433 () Bool)

(declare-fun res!488943 () Bool)

(assert (=> b!728433 (=> (not res!488943) (not e!407757))))

(assert (=> b!728433 (= res!488943 (validKeyInArray!0 (select (arr!19671 a!3186) j!159)))))

(assert (= (and start!64654 res!488942) b!728430))

(assert (= (and b!728430 res!488938) b!728433))

(assert (= (and b!728433 res!488943) b!728422))

(assert (= (and b!728422 res!488934) b!728424))

(assert (= (and b!728424 res!488933) b!728429))

(assert (= (and b!728429 res!488940) b!728417))

(assert (= (and b!728417 res!488947) b!728423))

(assert (= (and b!728423 res!488935) b!728431))

(assert (= (and b!728431 res!488945) b!728428))

(assert (= (and b!728428 res!488936) b!728426))

(assert (= (and b!728426 res!488941) b!728432))

(assert (= (and b!728432 c!80116) b!728416))

(assert (= (and b!728432 (not c!80116)) b!728420))

(assert (= (and b!728432 res!488944) b!728419))

(assert (= (and b!728419 res!488946) b!728425))

(assert (= (and b!728425 res!488937) b!728421))

(assert (= (and b!728421 res!488948) b!728418))

(assert (= (and b!728425 (not res!488939)) b!728427))

(declare-fun m!682171 () Bool)

(assert (=> b!728429 m!682171))

(declare-fun m!682173 () Bool)

(assert (=> b!728428 m!682173))

(assert (=> b!728428 m!682173))

(declare-fun m!682175 () Bool)

(assert (=> b!728428 m!682175))

(assert (=> b!728428 m!682175))

(assert (=> b!728428 m!682173))

(declare-fun m!682177 () Bool)

(assert (=> b!728428 m!682177))

(assert (=> b!728416 m!682173))

(assert (=> b!728416 m!682173))

(declare-fun m!682179 () Bool)

(assert (=> b!728416 m!682179))

(declare-fun m!682181 () Bool)

(assert (=> b!728423 m!682181))

(declare-fun m!682183 () Bool)

(assert (=> b!728419 m!682183))

(declare-fun m!682185 () Bool)

(assert (=> b!728419 m!682185))

(declare-fun m!682187 () Bool)

(assert (=> b!728419 m!682187))

(declare-fun m!682189 () Bool)

(assert (=> b!728419 m!682189))

(declare-fun m!682191 () Bool)

(assert (=> b!728419 m!682191))

(assert (=> b!728419 m!682183))

(assert (=> b!728418 m!682173))

(assert (=> b!728418 m!682173))

(declare-fun m!682193 () Bool)

(assert (=> b!728418 m!682193))

(assert (=> b!728421 m!682173))

(assert (=> b!728421 m!682173))

(declare-fun m!682195 () Bool)

(assert (=> b!728421 m!682195))

(declare-fun m!682197 () Bool)

(assert (=> start!64654 m!682197))

(declare-fun m!682199 () Bool)

(assert (=> start!64654 m!682199))

(declare-fun m!682201 () Bool)

(assert (=> b!728426 m!682201))

(assert (=> b!728420 m!682173))

(assert (=> b!728420 m!682173))

(declare-fun m!682203 () Bool)

(assert (=> b!728420 m!682203))

(declare-fun m!682205 () Bool)

(assert (=> b!728427 m!682205))

(declare-fun m!682207 () Bool)

(assert (=> b!728425 m!682207))

(declare-fun m!682209 () Bool)

(assert (=> b!728425 m!682209))

(declare-fun m!682211 () Bool)

(assert (=> b!728424 m!682211))

(declare-fun m!682213 () Bool)

(assert (=> b!728422 m!682213))

(assert (=> b!728433 m!682173))

(assert (=> b!728433 m!682173))

(declare-fun m!682215 () Bool)

(assert (=> b!728433 m!682215))

(declare-fun m!682217 () Bool)

(assert (=> b!728417 m!682217))

(push 1)

