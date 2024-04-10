; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65562 () Bool)

(assert start!65562)

(declare-fun b!748927 () Bool)

(declare-fun res!505270 () Bool)

(declare-fun e!417948 () Bool)

(assert (=> b!748927 (=> (not res!505270) (not e!417948))))

(declare-datatypes ((array!41735 0))(
  ( (array!41736 (arr!19981 (Array (_ BitVec 32) (_ BitVec 64))) (size!20402 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41735)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!748927 (= res!505270 (and (= (size!20402 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20402 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20402 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748928 () Bool)

(declare-fun e!417953 () Bool)

(assert (=> b!748928 (= e!417948 e!417953)))

(declare-fun res!505259 () Bool)

(assert (=> b!748928 (=> (not res!505259) (not e!417953))))

(declare-datatypes ((SeekEntryResult!7581 0))(
  ( (MissingZero!7581 (index!32692 (_ BitVec 32))) (Found!7581 (index!32693 (_ BitVec 32))) (Intermediate!7581 (undefined!8393 Bool) (index!32694 (_ BitVec 32)) (x!63627 (_ BitVec 32))) (Undefined!7581) (MissingVacant!7581 (index!32695 (_ BitVec 32))) )
))
(declare-fun lt!332936 () SeekEntryResult!7581)

(assert (=> b!748928 (= res!505259 (or (= lt!332936 (MissingZero!7581 i!1173)) (= lt!332936 (MissingVacant!7581 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41735 (_ BitVec 32)) SeekEntryResult!7581)

(assert (=> b!748928 (= lt!332936 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748930 () Bool)

(declare-fun res!505261 () Bool)

(declare-fun e!417956 () Bool)

(assert (=> b!748930 (=> (not res!505261) (not e!417956))))

(declare-fun e!417949 () Bool)

(assert (=> b!748930 (= res!505261 e!417949)))

(declare-fun c!82215 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748930 (= c!82215 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748931 () Bool)

(declare-fun res!505271 () Bool)

(declare-fun e!417952 () Bool)

(assert (=> b!748931 (=> res!505271 e!417952)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332944 () (_ BitVec 64))

(assert (=> b!748931 (= res!505271 (= (select (store (arr!19981 a!3186) i!1173 k0!2102) index!1321) lt!332944))))

(declare-fun b!748932 () Bool)

(declare-fun res!505272 () Bool)

(assert (=> b!748932 (=> (not res!505272) (not e!417956))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!748932 (= res!505272 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19981 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748933 () Bool)

(declare-fun e!417954 () Bool)

(assert (=> b!748933 (= e!417956 e!417954)))

(declare-fun res!505273 () Bool)

(assert (=> b!748933 (=> (not res!505273) (not e!417954))))

(declare-fun lt!332945 () SeekEntryResult!7581)

(declare-fun lt!332937 () SeekEntryResult!7581)

(assert (=> b!748933 (= res!505273 (= lt!332945 lt!332937))))

(declare-fun lt!332941 () array!41735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41735 (_ BitVec 32)) SeekEntryResult!7581)

(assert (=> b!748933 (= lt!332937 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332944 lt!332941 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748933 (= lt!332945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332944 mask!3328) lt!332944 lt!332941 mask!3328))))

(assert (=> b!748933 (= lt!332944 (select (store (arr!19981 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748933 (= lt!332941 (array!41736 (store (arr!19981 a!3186) i!1173 k0!2102) (size!20402 a!3186)))))

(declare-fun lt!332943 () SeekEntryResult!7581)

(declare-fun e!417951 () Bool)

(declare-fun b!748934 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41735 (_ BitVec 32)) SeekEntryResult!7581)

(assert (=> b!748934 (= e!417951 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!332943))))

(declare-fun b!748935 () Bool)

(declare-fun res!505263 () Bool)

(assert (=> b!748935 (=> (not res!505263) (not e!417953))))

(assert (=> b!748935 (= res!505263 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20402 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20402 a!3186))))))

(declare-fun b!748936 () Bool)

(declare-fun res!505274 () Bool)

(assert (=> b!748936 (=> (not res!505274) (not e!417953))))

(declare-datatypes ((List!13983 0))(
  ( (Nil!13980) (Cons!13979 (h!15051 (_ BitVec 64)) (t!20298 List!13983)) )
))
(declare-fun arrayNoDuplicates!0 (array!41735 (_ BitVec 32) List!13983) Bool)

(assert (=> b!748936 (= res!505274 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13980))))

(declare-fun lt!332942 () SeekEntryResult!7581)

(declare-fun b!748937 () Bool)

(assert (=> b!748937 (= e!417949 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!332942))))

(declare-fun b!748929 () Bool)

(assert (=> b!748929 (= e!417954 (not e!417952))))

(declare-fun res!505269 () Bool)

(assert (=> b!748929 (=> res!505269 e!417952)))

(get-info :version)

(assert (=> b!748929 (= res!505269 (or (not ((_ is Intermediate!7581) lt!332937)) (bvslt x!1131 (x!63627 lt!332937)) (not (= x!1131 (x!63627 lt!332937))) (not (= index!1321 (index!32694 lt!332937)))))))

(assert (=> b!748929 e!417951))

(declare-fun res!505260 () Bool)

(assert (=> b!748929 (=> (not res!505260) (not e!417951))))

(declare-fun lt!332938 () SeekEntryResult!7581)

(assert (=> b!748929 (= res!505260 (= lt!332938 lt!332943))))

(assert (=> b!748929 (= lt!332943 (Found!7581 j!159))))

(assert (=> b!748929 (= lt!332938 (seekEntryOrOpen!0 (select (arr!19981 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41735 (_ BitVec 32)) Bool)

(assert (=> b!748929 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25704 0))(
  ( (Unit!25705) )
))
(declare-fun lt!332940 () Unit!25704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25704)

(assert (=> b!748929 (= lt!332940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!505268 () Bool)

(assert (=> start!65562 (=> (not res!505268) (not e!417948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65562 (= res!505268 (validMask!0 mask!3328))))

(assert (=> start!65562 e!417948))

(assert (=> start!65562 true))

(declare-fun array_inv!15777 (array!41735) Bool)

(assert (=> start!65562 (array_inv!15777 a!3186)))

(declare-fun b!748938 () Bool)

(declare-fun res!505266 () Bool)

(assert (=> b!748938 (=> (not res!505266) (not e!417948))))

(declare-fun arrayContainsKey!0 (array!41735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748938 (= res!505266 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748939 () Bool)

(declare-fun e!417950 () Unit!25704)

(declare-fun Unit!25706 () Unit!25704)

(assert (=> b!748939 (= e!417950 Unit!25706)))

(assert (=> b!748939 false))

(declare-fun b!748940 () Bool)

(declare-fun res!505267 () Bool)

(assert (=> b!748940 (=> res!505267 e!417952)))

(assert (=> b!748940 (= res!505267 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!332943)))))

(declare-fun b!748941 () Bool)

(assert (=> b!748941 (= e!417949 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19981 a!3186) j!159) a!3186 mask!3328) (Found!7581 j!159)))))

(declare-fun b!748942 () Bool)

(assert (=> b!748942 (= e!417952 true)))

(assert (=> b!748942 (= (select (store (arr!19981 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332939 () Unit!25704)

(assert (=> b!748942 (= lt!332939 e!417950)))

(declare-fun c!82216 () Bool)

(assert (=> b!748942 (= c!82216 (= (select (store (arr!19981 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748943 () Bool)

(declare-fun res!505262 () Bool)

(assert (=> b!748943 (=> (not res!505262) (not e!417948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748943 (= res!505262 (validKeyInArray!0 k0!2102))))

(declare-fun b!748944 () Bool)

(assert (=> b!748944 (= e!417953 e!417956)))

(declare-fun res!505265 () Bool)

(assert (=> b!748944 (=> (not res!505265) (not e!417956))))

(assert (=> b!748944 (= res!505265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19981 a!3186) j!159) mask!3328) (select (arr!19981 a!3186) j!159) a!3186 mask!3328) lt!332942))))

(assert (=> b!748944 (= lt!332942 (Intermediate!7581 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748945 () Bool)

(declare-fun res!505264 () Bool)

(assert (=> b!748945 (=> (not res!505264) (not e!417953))))

(assert (=> b!748945 (= res!505264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748946 () Bool)

(declare-fun res!505258 () Bool)

(assert (=> b!748946 (=> (not res!505258) (not e!417948))))

(assert (=> b!748946 (= res!505258 (validKeyInArray!0 (select (arr!19981 a!3186) j!159)))))

(declare-fun b!748947 () Bool)

(declare-fun Unit!25707 () Unit!25704)

(assert (=> b!748947 (= e!417950 Unit!25707)))

(assert (= (and start!65562 res!505268) b!748927))

(assert (= (and b!748927 res!505270) b!748946))

(assert (= (and b!748946 res!505258) b!748943))

(assert (= (and b!748943 res!505262) b!748938))

(assert (= (and b!748938 res!505266) b!748928))

(assert (= (and b!748928 res!505259) b!748945))

(assert (= (and b!748945 res!505264) b!748936))

(assert (= (and b!748936 res!505274) b!748935))

(assert (= (and b!748935 res!505263) b!748944))

(assert (= (and b!748944 res!505265) b!748932))

(assert (= (and b!748932 res!505272) b!748930))

(assert (= (and b!748930 c!82215) b!748937))

(assert (= (and b!748930 (not c!82215)) b!748941))

(assert (= (and b!748930 res!505261) b!748933))

(assert (= (and b!748933 res!505273) b!748929))

(assert (= (and b!748929 res!505260) b!748934))

(assert (= (and b!748929 (not res!505269)) b!748940))

(assert (= (and b!748940 (not res!505267)) b!748931))

(assert (= (and b!748931 (not res!505271)) b!748942))

(assert (= (and b!748942 c!82216) b!748939))

(assert (= (and b!748942 (not c!82216)) b!748947))

(declare-fun m!698653 () Bool)

(assert (=> b!748938 m!698653))

(declare-fun m!698655 () Bool)

(assert (=> b!748936 m!698655))

(declare-fun m!698657 () Bool)

(assert (=> b!748946 m!698657))

(assert (=> b!748946 m!698657))

(declare-fun m!698659 () Bool)

(assert (=> b!748946 m!698659))

(declare-fun m!698661 () Bool)

(assert (=> b!748942 m!698661))

(declare-fun m!698663 () Bool)

(assert (=> b!748942 m!698663))

(declare-fun m!698665 () Bool)

(assert (=> start!65562 m!698665))

(declare-fun m!698667 () Bool)

(assert (=> start!65562 m!698667))

(assert (=> b!748929 m!698657))

(assert (=> b!748929 m!698657))

(declare-fun m!698669 () Bool)

(assert (=> b!748929 m!698669))

(declare-fun m!698671 () Bool)

(assert (=> b!748929 m!698671))

(declare-fun m!698673 () Bool)

(assert (=> b!748929 m!698673))

(assert (=> b!748937 m!698657))

(assert (=> b!748937 m!698657))

(declare-fun m!698675 () Bool)

(assert (=> b!748937 m!698675))

(assert (=> b!748931 m!698661))

(assert (=> b!748931 m!698663))

(declare-fun m!698677 () Bool)

(assert (=> b!748945 m!698677))

(declare-fun m!698679 () Bool)

(assert (=> b!748928 m!698679))

(assert (=> b!748941 m!698657))

(assert (=> b!748941 m!698657))

(declare-fun m!698681 () Bool)

(assert (=> b!748941 m!698681))

(declare-fun m!698683 () Bool)

(assert (=> b!748943 m!698683))

(declare-fun m!698685 () Bool)

(assert (=> b!748932 m!698685))

(declare-fun m!698687 () Bool)

(assert (=> b!748933 m!698687))

(declare-fun m!698689 () Bool)

(assert (=> b!748933 m!698689))

(assert (=> b!748933 m!698661))

(declare-fun m!698691 () Bool)

(assert (=> b!748933 m!698691))

(assert (=> b!748933 m!698687))

(declare-fun m!698693 () Bool)

(assert (=> b!748933 m!698693))

(assert (=> b!748944 m!698657))

(assert (=> b!748944 m!698657))

(declare-fun m!698695 () Bool)

(assert (=> b!748944 m!698695))

(assert (=> b!748944 m!698695))

(assert (=> b!748944 m!698657))

(declare-fun m!698697 () Bool)

(assert (=> b!748944 m!698697))

(assert (=> b!748934 m!698657))

(assert (=> b!748934 m!698657))

(declare-fun m!698699 () Bool)

(assert (=> b!748934 m!698699))

(assert (=> b!748940 m!698657))

(assert (=> b!748940 m!698657))

(assert (=> b!748940 m!698681))

(check-sat (not b!748943) (not b!748944) (not b!748940) (not start!65562) (not b!748929) (not b!748945) (not b!748936) (not b!748933) (not b!748938) (not b!748941) (not b!748946) (not b!748928) (not b!748934) (not b!748937))
(check-sat)
