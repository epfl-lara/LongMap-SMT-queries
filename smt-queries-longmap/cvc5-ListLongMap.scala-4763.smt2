; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65638 () Bool)

(assert start!65638)

(declare-datatypes ((array!41811 0))(
  ( (array!41812 (arr!20019 (Array (_ BitVec 32) (_ BitVec 64))) (size!20440 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41811)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!419187 () Bool)

(declare-datatypes ((SeekEntryResult!7619 0))(
  ( (MissingZero!7619 (index!32844 (_ BitVec 32))) (Found!7619 (index!32845 (_ BitVec 32))) (Intermediate!7619 (undefined!8431 Bool) (index!32846 (_ BitVec 32)) (x!63769 (_ BitVec 32))) (Undefined!7619) (MissingVacant!7619 (index!32847 (_ BitVec 32))) )
))
(declare-fun lt!334177 () SeekEntryResult!7619)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!751431 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41811 (_ BitVec 32)) SeekEntryResult!7619)

(assert (=> b!751431 (= e!419187 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20019 a!3186) j!159) a!3186 mask!3328) lt!334177))))

(declare-fun b!751432 () Bool)

(declare-fun res!507320 () Bool)

(declare-fun e!419193 () Bool)

(assert (=> b!751432 (=> res!507320 e!419193)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!334185 () SeekEntryResult!7619)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41811 (_ BitVec 32)) SeekEntryResult!7619)

(assert (=> b!751432 (= res!507320 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20019 a!3186) j!159) a!3186 mask!3328) lt!334185)))))

(declare-fun b!751433 () Bool)

(assert (=> b!751433 (= e!419187 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20019 a!3186) j!159) a!3186 mask!3328) (Found!7619 j!159)))))

(declare-fun b!751434 () Bool)

(declare-fun e!419194 () Bool)

(declare-fun e!419186 () Bool)

(assert (=> b!751434 (= e!419194 e!419186)))

(declare-fun res!507318 () Bool)

(assert (=> b!751434 (=> (not res!507318) (not e!419186))))

(declare-fun lt!334183 () SeekEntryResult!7619)

(declare-fun lt!334178 () SeekEntryResult!7619)

(assert (=> b!751434 (= res!507318 (= lt!334183 lt!334178))))

(declare-fun lt!334186 () (_ BitVec 64))

(declare-fun lt!334187 () array!41811)

(assert (=> b!751434 (= lt!334178 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334186 lt!334187 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751434 (= lt!334183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334186 mask!3328) lt!334186 lt!334187 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!751434 (= lt!334186 (select (store (arr!20019 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751434 (= lt!334187 (array!41812 (store (arr!20019 a!3186) i!1173 k!2102) (size!20440 a!3186)))))

(declare-fun b!751435 () Bool)

(assert (=> b!751435 (= e!419186 (not e!419193))))

(declare-fun res!507310 () Bool)

(assert (=> b!751435 (=> res!507310 e!419193)))

(assert (=> b!751435 (= res!507310 (or (not (is-Intermediate!7619 lt!334178)) (bvslt x!1131 (x!63769 lt!334178)) (not (= x!1131 (x!63769 lt!334178))) (not (= index!1321 (index!32846 lt!334178)))))))

(declare-fun e!419188 () Bool)

(assert (=> b!751435 e!419188))

(declare-fun res!507321 () Bool)

(assert (=> b!751435 (=> (not res!507321) (not e!419188))))

(declare-fun lt!334184 () SeekEntryResult!7619)

(assert (=> b!751435 (= res!507321 (= lt!334184 lt!334185))))

(assert (=> b!751435 (= lt!334185 (Found!7619 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41811 (_ BitVec 32)) SeekEntryResult!7619)

(assert (=> b!751435 (= lt!334184 (seekEntryOrOpen!0 (select (arr!20019 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41811 (_ BitVec 32)) Bool)

(assert (=> b!751435 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25856 0))(
  ( (Unit!25857) )
))
(declare-fun lt!334179 () Unit!25856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25856)

(assert (=> b!751435 (= lt!334179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!751436 () Bool)

(assert (=> b!751436 (= e!419188 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20019 a!3186) j!159) a!3186 mask!3328) lt!334185))))

(declare-fun b!751437 () Bool)

(declare-fun res!507317 () Bool)

(assert (=> b!751437 (=> (not res!507317) (not e!419194))))

(assert (=> b!751437 (= res!507317 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20019 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751438 () Bool)

(declare-fun res!507306 () Bool)

(declare-fun e!419195 () Bool)

(assert (=> b!751438 (=> (not res!507306) (not e!419195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751438 (= res!507306 (validKeyInArray!0 (select (arr!20019 a!3186) j!159)))))

(declare-fun b!751439 () Bool)

(declare-fun res!507308 () Bool)

(declare-fun e!419185 () Bool)

(assert (=> b!751439 (=> (not res!507308) (not e!419185))))

(assert (=> b!751439 (= res!507308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751440 () Bool)

(assert (=> b!751440 (= e!419185 e!419194)))

(declare-fun res!507316 () Bool)

(assert (=> b!751440 (=> (not res!507316) (not e!419194))))

(assert (=> b!751440 (= res!507316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20019 a!3186) j!159) mask!3328) (select (arr!20019 a!3186) j!159) a!3186 mask!3328) lt!334177))))

(assert (=> b!751440 (= lt!334177 (Intermediate!7619 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!419190 () Bool)

(declare-fun b!751441 () Bool)

(assert (=> b!751441 (= e!419190 (= (seekEntryOrOpen!0 lt!334186 lt!334187 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334186 lt!334187 mask!3328)))))

(declare-fun b!751442 () Bool)

(declare-fun e!419192 () Unit!25856)

(declare-fun Unit!25858 () Unit!25856)

(assert (=> b!751442 (= e!419192 Unit!25858)))

(declare-fun res!507322 () Bool)

(assert (=> start!65638 (=> (not res!507322) (not e!419195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65638 (= res!507322 (validMask!0 mask!3328))))

(assert (=> start!65638 e!419195))

(assert (=> start!65638 true))

(declare-fun array_inv!15815 (array!41811) Bool)

(assert (=> start!65638 (array_inv!15815 a!3186)))

(declare-fun b!751443 () Bool)

(declare-fun res!507315 () Bool)

(assert (=> b!751443 (=> (not res!507315) (not e!419185))))

(assert (=> b!751443 (= res!507315 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20440 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20440 a!3186))))))

(declare-fun b!751444 () Bool)

(declare-fun res!507314 () Bool)

(assert (=> b!751444 (=> (not res!507314) (not e!419195))))

(assert (=> b!751444 (= res!507314 (validKeyInArray!0 k!2102))))

(declare-fun b!751445 () Bool)

(assert (=> b!751445 (= e!419195 e!419185)))

(declare-fun res!507309 () Bool)

(assert (=> b!751445 (=> (not res!507309) (not e!419185))))

(declare-fun lt!334181 () SeekEntryResult!7619)

(assert (=> b!751445 (= res!507309 (or (= lt!334181 (MissingZero!7619 i!1173)) (= lt!334181 (MissingVacant!7619 i!1173))))))

(assert (=> b!751445 (= lt!334181 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751446 () Bool)

(declare-fun res!507313 () Bool)

(assert (=> b!751446 (=> (not res!507313) (not e!419195))))

(assert (=> b!751446 (= res!507313 (and (= (size!20440 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20440 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20440 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751447 () Bool)

(declare-fun e!419191 () Bool)

(assert (=> b!751447 (= e!419191 true)))

(assert (=> b!751447 e!419190))

(declare-fun res!507311 () Bool)

(assert (=> b!751447 (=> (not res!507311) (not e!419190))))

(declare-fun lt!334180 () (_ BitVec 64))

(assert (=> b!751447 (= res!507311 (= lt!334180 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334182 () Unit!25856)

(assert (=> b!751447 (= lt!334182 e!419192)))

(declare-fun c!82444 () Bool)

(assert (=> b!751447 (= c!82444 (= lt!334180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751448 () Bool)

(assert (=> b!751448 (= e!419193 e!419191)))

(declare-fun res!507323 () Bool)

(assert (=> b!751448 (=> res!507323 e!419191)))

(assert (=> b!751448 (= res!507323 (= lt!334180 lt!334186))))

(assert (=> b!751448 (= lt!334180 (select (store (arr!20019 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751449 () Bool)

(declare-fun Unit!25859 () Unit!25856)

(assert (=> b!751449 (= e!419192 Unit!25859)))

(assert (=> b!751449 false))

(declare-fun b!751450 () Bool)

(declare-fun res!507312 () Bool)

(assert (=> b!751450 (=> (not res!507312) (not e!419185))))

(declare-datatypes ((List!14021 0))(
  ( (Nil!14018) (Cons!14017 (h!15089 (_ BitVec 64)) (t!20336 List!14021)) )
))
(declare-fun arrayNoDuplicates!0 (array!41811 (_ BitVec 32) List!14021) Bool)

(assert (=> b!751450 (= res!507312 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14018))))

(declare-fun b!751451 () Bool)

(declare-fun res!507307 () Bool)

(assert (=> b!751451 (=> (not res!507307) (not e!419195))))

(declare-fun arrayContainsKey!0 (array!41811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751451 (= res!507307 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751452 () Bool)

(declare-fun res!507319 () Bool)

(assert (=> b!751452 (=> (not res!507319) (not e!419194))))

(assert (=> b!751452 (= res!507319 e!419187)))

(declare-fun c!82443 () Bool)

(assert (=> b!751452 (= c!82443 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65638 res!507322) b!751446))

(assert (= (and b!751446 res!507313) b!751438))

(assert (= (and b!751438 res!507306) b!751444))

(assert (= (and b!751444 res!507314) b!751451))

(assert (= (and b!751451 res!507307) b!751445))

(assert (= (and b!751445 res!507309) b!751439))

(assert (= (and b!751439 res!507308) b!751450))

(assert (= (and b!751450 res!507312) b!751443))

(assert (= (and b!751443 res!507315) b!751440))

(assert (= (and b!751440 res!507316) b!751437))

(assert (= (and b!751437 res!507317) b!751452))

(assert (= (and b!751452 c!82443) b!751431))

(assert (= (and b!751452 (not c!82443)) b!751433))

(assert (= (and b!751452 res!507319) b!751434))

(assert (= (and b!751434 res!507318) b!751435))

(assert (= (and b!751435 res!507321) b!751436))

(assert (= (and b!751435 (not res!507310)) b!751432))

(assert (= (and b!751432 (not res!507320)) b!751448))

(assert (= (and b!751448 (not res!507323)) b!751447))

(assert (= (and b!751447 c!82444) b!751449))

(assert (= (and b!751447 (not c!82444)) b!751442))

(assert (= (and b!751447 res!507311) b!751441))

(declare-fun m!700615 () Bool)

(assert (=> b!751440 m!700615))

(assert (=> b!751440 m!700615))

(declare-fun m!700617 () Bool)

(assert (=> b!751440 m!700617))

(assert (=> b!751440 m!700617))

(assert (=> b!751440 m!700615))

(declare-fun m!700619 () Bool)

(assert (=> b!751440 m!700619))

(declare-fun m!700621 () Bool)

(assert (=> b!751451 m!700621))

(declare-fun m!700623 () Bool)

(assert (=> b!751439 m!700623))

(assert (=> b!751435 m!700615))

(assert (=> b!751435 m!700615))

(declare-fun m!700625 () Bool)

(assert (=> b!751435 m!700625))

(declare-fun m!700627 () Bool)

(assert (=> b!751435 m!700627))

(declare-fun m!700629 () Bool)

(assert (=> b!751435 m!700629))

(declare-fun m!700631 () Bool)

(assert (=> b!751450 m!700631))

(assert (=> b!751436 m!700615))

(assert (=> b!751436 m!700615))

(declare-fun m!700633 () Bool)

(assert (=> b!751436 m!700633))

(assert (=> b!751438 m!700615))

(assert (=> b!751438 m!700615))

(declare-fun m!700635 () Bool)

(assert (=> b!751438 m!700635))

(declare-fun m!700637 () Bool)

(assert (=> b!751448 m!700637))

(declare-fun m!700639 () Bool)

(assert (=> b!751448 m!700639))

(assert (=> b!751432 m!700615))

(assert (=> b!751432 m!700615))

(declare-fun m!700641 () Bool)

(assert (=> b!751432 m!700641))

(declare-fun m!700643 () Bool)

(assert (=> start!65638 m!700643))

(declare-fun m!700645 () Bool)

(assert (=> start!65638 m!700645))

(declare-fun m!700647 () Bool)

(assert (=> b!751437 m!700647))

(declare-fun m!700649 () Bool)

(assert (=> b!751445 m!700649))

(declare-fun m!700651 () Bool)

(assert (=> b!751434 m!700651))

(assert (=> b!751434 m!700637))

(declare-fun m!700653 () Bool)

(assert (=> b!751434 m!700653))

(declare-fun m!700655 () Bool)

(assert (=> b!751434 m!700655))

(assert (=> b!751434 m!700655))

(declare-fun m!700657 () Bool)

(assert (=> b!751434 m!700657))

(declare-fun m!700659 () Bool)

(assert (=> b!751441 m!700659))

(declare-fun m!700661 () Bool)

(assert (=> b!751441 m!700661))

(assert (=> b!751431 m!700615))

(assert (=> b!751431 m!700615))

(declare-fun m!700663 () Bool)

(assert (=> b!751431 m!700663))

(assert (=> b!751433 m!700615))

(assert (=> b!751433 m!700615))

(assert (=> b!751433 m!700641))

(declare-fun m!700665 () Bool)

(assert (=> b!751444 m!700665))

(push 1)

