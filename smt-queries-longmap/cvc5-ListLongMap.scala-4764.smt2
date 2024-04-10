; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65644 () Bool)

(assert start!65644)

(declare-fun b!751631 () Bool)

(declare-fun res!507485 () Bool)

(declare-fun e!419291 () Bool)

(assert (=> b!751631 (=> (not res!507485) (not e!419291))))

(declare-datatypes ((array!41817 0))(
  ( (array!41818 (arr!20022 (Array (_ BitVec 32) (_ BitVec 64))) (size!20443 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41817)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41817 (_ BitVec 32)) Bool)

(assert (=> b!751631 (= res!507485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751632 () Bool)

(declare-fun res!507472 () Bool)

(declare-fun e!419297 () Bool)

(assert (=> b!751632 (=> (not res!507472) (not e!419297))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751632 (= res!507472 (validKeyInArray!0 (select (arr!20022 a!3186) j!159)))))

(declare-fun b!751633 () Bool)

(declare-fun res!507474 () Bool)

(assert (=> b!751633 (=> (not res!507474) (not e!419291))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751633 (= res!507474 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20443 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20443 a!3186))))))

(declare-fun b!751634 () Bool)

(assert (=> b!751634 (= e!419297 e!419291)))

(declare-fun res!507470 () Bool)

(assert (=> b!751634 (=> (not res!507470) (not e!419291))))

(declare-datatypes ((SeekEntryResult!7622 0))(
  ( (MissingZero!7622 (index!32856 (_ BitVec 32))) (Found!7622 (index!32857 (_ BitVec 32))) (Intermediate!7622 (undefined!8434 Bool) (index!32858 (_ BitVec 32)) (x!63780 (_ BitVec 32))) (Undefined!7622) (MissingVacant!7622 (index!32859 (_ BitVec 32))) )
))
(declare-fun lt!334283 () SeekEntryResult!7622)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751634 (= res!507470 (or (= lt!334283 (MissingZero!7622 i!1173)) (= lt!334283 (MissingVacant!7622 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41817 (_ BitVec 32)) SeekEntryResult!7622)

(assert (=> b!751634 (= lt!334283 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!419286 () Bool)

(declare-fun lt!334289 () SeekEntryResult!7622)

(declare-fun b!751635 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41817 (_ BitVec 32)) SeekEntryResult!7622)

(assert (=> b!751635 (= e!419286 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20022 a!3186) j!159) a!3186 mask!3328) lt!334289))))

(declare-fun b!751636 () Bool)

(declare-datatypes ((Unit!25868 0))(
  ( (Unit!25869) )
))
(declare-fun e!419292 () Unit!25868)

(declare-fun Unit!25870 () Unit!25868)

(assert (=> b!751636 (= e!419292 Unit!25870)))

(assert (=> b!751636 false))

(declare-fun b!751637 () Bool)

(declare-fun res!507473 () Bool)

(declare-fun e!419294 () Bool)

(assert (=> b!751637 (=> (not res!507473) (not e!419294))))

(declare-fun e!419290 () Bool)

(assert (=> b!751637 (= res!507473 e!419290)))

(declare-fun c!82461 () Bool)

(assert (=> b!751637 (= c!82461 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751638 () Bool)

(declare-fun e!419293 () Bool)

(declare-fun e!419289 () Bool)

(assert (=> b!751638 (= e!419293 e!419289)))

(declare-fun res!507475 () Bool)

(assert (=> b!751638 (=> res!507475 e!419289)))

(declare-fun lt!334285 () (_ BitVec 64))

(declare-fun lt!334280 () (_ BitVec 64))

(assert (=> b!751638 (= res!507475 (= lt!334285 lt!334280))))

(assert (=> b!751638 (= lt!334285 (select (store (arr!20022 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751639 () Bool)

(assert (=> b!751639 (= e!419290 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20022 a!3186) j!159) a!3186 mask!3328) (Found!7622 j!159)))))

(declare-fun res!507471 () Bool)

(assert (=> start!65644 (=> (not res!507471) (not e!419297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65644 (= res!507471 (validMask!0 mask!3328))))

(assert (=> start!65644 e!419297))

(assert (=> start!65644 true))

(declare-fun array_inv!15818 (array!41817) Bool)

(assert (=> start!65644 (array_inv!15818 a!3186)))

(declare-fun b!751640 () Bool)

(declare-fun res!507476 () Bool)

(assert (=> b!751640 (=> (not res!507476) (not e!419297))))

(declare-fun arrayContainsKey!0 (array!41817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751640 (= res!507476 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751641 () Bool)

(assert (=> b!751641 (= e!419291 e!419294)))

(declare-fun res!507488 () Bool)

(assert (=> b!751641 (=> (not res!507488) (not e!419294))))

(declare-fun lt!334287 () SeekEntryResult!7622)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41817 (_ BitVec 32)) SeekEntryResult!7622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751641 (= res!507488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20022 a!3186) j!159) mask!3328) (select (arr!20022 a!3186) j!159) a!3186 mask!3328) lt!334287))))

(assert (=> b!751641 (= lt!334287 (Intermediate!7622 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751642 () Bool)

(declare-fun e!419287 () Bool)

(assert (=> b!751642 (= e!419287 e!419293)))

(declare-fun res!507487 () Bool)

(assert (=> b!751642 (=> res!507487 e!419293)))

(declare-fun lt!334284 () SeekEntryResult!7622)

(assert (=> b!751642 (= res!507487 (not (= lt!334284 lt!334289)))))

(assert (=> b!751642 (= lt!334284 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20022 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751643 () Bool)

(assert (=> b!751643 (= e!419290 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20022 a!3186) j!159) a!3186 mask!3328) lt!334287))))

(declare-fun b!751644 () Bool)

(declare-fun e!419288 () Bool)

(assert (=> b!751644 (= e!419288 (not e!419287))))

(declare-fun res!507484 () Bool)

(assert (=> b!751644 (=> res!507484 e!419287)))

(declare-fun lt!334281 () SeekEntryResult!7622)

(assert (=> b!751644 (= res!507484 (or (not (is-Intermediate!7622 lt!334281)) (bvslt x!1131 (x!63780 lt!334281)) (not (= x!1131 (x!63780 lt!334281))) (not (= index!1321 (index!32858 lt!334281)))))))

(assert (=> b!751644 e!419286))

(declare-fun res!507478 () Bool)

(assert (=> b!751644 (=> (not res!507478) (not e!419286))))

(declare-fun lt!334279 () SeekEntryResult!7622)

(assert (=> b!751644 (= res!507478 (= lt!334279 lt!334289))))

(assert (=> b!751644 (= lt!334289 (Found!7622 j!159))))

(assert (=> b!751644 (= lt!334279 (seekEntryOrOpen!0 (select (arr!20022 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751644 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334288 () Unit!25868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25868)

(assert (=> b!751644 (= lt!334288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751645 () Bool)

(assert (=> b!751645 (= e!419289 true)))

(declare-fun e!419295 () Bool)

(assert (=> b!751645 e!419295))

(declare-fun res!507481 () Bool)

(assert (=> b!751645 (=> (not res!507481) (not e!419295))))

(assert (=> b!751645 (= res!507481 (= lt!334285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334286 () Unit!25868)

(assert (=> b!751645 (= lt!334286 e!419292)))

(declare-fun c!82462 () Bool)

(assert (=> b!751645 (= c!82462 (= lt!334285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751646 () Bool)

(assert (=> b!751646 (= e!419294 e!419288)))

(declare-fun res!507486 () Bool)

(assert (=> b!751646 (=> (not res!507486) (not e!419288))))

(declare-fun lt!334278 () SeekEntryResult!7622)

(assert (=> b!751646 (= res!507486 (= lt!334278 lt!334281))))

(declare-fun lt!334282 () array!41817)

(assert (=> b!751646 (= lt!334281 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334280 lt!334282 mask!3328))))

(assert (=> b!751646 (= lt!334278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334280 mask!3328) lt!334280 lt!334282 mask!3328))))

(assert (=> b!751646 (= lt!334280 (select (store (arr!20022 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751646 (= lt!334282 (array!41818 (store (arr!20022 a!3186) i!1173 k!2102) (size!20443 a!3186)))))

(declare-fun b!751647 () Bool)

(declare-fun res!507477 () Bool)

(assert (=> b!751647 (=> (not res!507477) (not e!419295))))

(assert (=> b!751647 (= res!507477 (= (seekEntryOrOpen!0 lt!334280 lt!334282 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334280 lt!334282 mask!3328)))))

(declare-fun b!751648 () Bool)

(declare-fun res!507479 () Bool)

(assert (=> b!751648 (=> (not res!507479) (not e!419291))))

(declare-datatypes ((List!14024 0))(
  ( (Nil!14021) (Cons!14020 (h!15092 (_ BitVec 64)) (t!20339 List!14024)) )
))
(declare-fun arrayNoDuplicates!0 (array!41817 (_ BitVec 32) List!14024) Bool)

(assert (=> b!751648 (= res!507479 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14021))))

(declare-fun b!751649 () Bool)

(declare-fun res!507482 () Bool)

(assert (=> b!751649 (=> (not res!507482) (not e!419297))))

(assert (=> b!751649 (= res!507482 (validKeyInArray!0 k!2102))))

(declare-fun b!751650 () Bool)

(declare-fun res!507483 () Bool)

(assert (=> b!751650 (=> (not res!507483) (not e!419297))))

(assert (=> b!751650 (= res!507483 (and (= (size!20443 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20443 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20443 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751651 () Bool)

(declare-fun res!507480 () Bool)

(assert (=> b!751651 (=> (not res!507480) (not e!419294))))

(assert (=> b!751651 (= res!507480 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20022 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751652 () Bool)

(declare-fun Unit!25871 () Unit!25868)

(assert (=> b!751652 (= e!419292 Unit!25871)))

(declare-fun b!751653 () Bool)

(assert (=> b!751653 (= e!419295 (= lt!334279 lt!334284))))

(assert (= (and start!65644 res!507471) b!751650))

(assert (= (and b!751650 res!507483) b!751632))

(assert (= (and b!751632 res!507472) b!751649))

(assert (= (and b!751649 res!507482) b!751640))

(assert (= (and b!751640 res!507476) b!751634))

(assert (= (and b!751634 res!507470) b!751631))

(assert (= (and b!751631 res!507485) b!751648))

(assert (= (and b!751648 res!507479) b!751633))

(assert (= (and b!751633 res!507474) b!751641))

(assert (= (and b!751641 res!507488) b!751651))

(assert (= (and b!751651 res!507480) b!751637))

(assert (= (and b!751637 c!82461) b!751643))

(assert (= (and b!751637 (not c!82461)) b!751639))

(assert (= (and b!751637 res!507473) b!751646))

(assert (= (and b!751646 res!507486) b!751644))

(assert (= (and b!751644 res!507478) b!751635))

(assert (= (and b!751644 (not res!507484)) b!751642))

(assert (= (and b!751642 (not res!507487)) b!751638))

(assert (= (and b!751638 (not res!507475)) b!751645))

(assert (= (and b!751645 c!82462) b!751636))

(assert (= (and b!751645 (not c!82462)) b!751652))

(assert (= (and b!751645 res!507481) b!751647))

(assert (= (and b!751647 res!507477) b!751653))

(declare-fun m!700771 () Bool)

(assert (=> b!751639 m!700771))

(assert (=> b!751639 m!700771))

(declare-fun m!700773 () Bool)

(assert (=> b!751639 m!700773))

(declare-fun m!700775 () Bool)

(assert (=> b!751640 m!700775))

(assert (=> b!751641 m!700771))

(assert (=> b!751641 m!700771))

(declare-fun m!700777 () Bool)

(assert (=> b!751641 m!700777))

(assert (=> b!751641 m!700777))

(assert (=> b!751641 m!700771))

(declare-fun m!700779 () Bool)

(assert (=> b!751641 m!700779))

(assert (=> b!751642 m!700771))

(assert (=> b!751642 m!700771))

(assert (=> b!751642 m!700773))

(declare-fun m!700781 () Bool)

(assert (=> b!751646 m!700781))

(declare-fun m!700783 () Bool)

(assert (=> b!751646 m!700783))

(assert (=> b!751646 m!700781))

(declare-fun m!700785 () Bool)

(assert (=> b!751646 m!700785))

(declare-fun m!700787 () Bool)

(assert (=> b!751646 m!700787))

(declare-fun m!700789 () Bool)

(assert (=> b!751646 m!700789))

(declare-fun m!700791 () Bool)

(assert (=> b!751648 m!700791))

(declare-fun m!700793 () Bool)

(assert (=> b!751631 m!700793))

(declare-fun m!700795 () Bool)

(assert (=> b!751649 m!700795))

(assert (=> b!751638 m!700785))

(declare-fun m!700797 () Bool)

(assert (=> b!751638 m!700797))

(declare-fun m!700799 () Bool)

(assert (=> b!751651 m!700799))

(declare-fun m!700801 () Bool)

(assert (=> b!751647 m!700801))

(declare-fun m!700803 () Bool)

(assert (=> b!751647 m!700803))

(declare-fun m!700805 () Bool)

(assert (=> start!65644 m!700805))

(declare-fun m!700807 () Bool)

(assert (=> start!65644 m!700807))

(declare-fun m!700809 () Bool)

(assert (=> b!751634 m!700809))

(assert (=> b!751635 m!700771))

(assert (=> b!751635 m!700771))

(declare-fun m!700811 () Bool)

(assert (=> b!751635 m!700811))

(assert (=> b!751643 m!700771))

(assert (=> b!751643 m!700771))

(declare-fun m!700813 () Bool)

(assert (=> b!751643 m!700813))

(assert (=> b!751632 m!700771))

(assert (=> b!751632 m!700771))

(declare-fun m!700815 () Bool)

(assert (=> b!751632 m!700815))

(assert (=> b!751644 m!700771))

(assert (=> b!751644 m!700771))

(declare-fun m!700817 () Bool)

(assert (=> b!751644 m!700817))

(declare-fun m!700819 () Bool)

(assert (=> b!751644 m!700819))

(declare-fun m!700821 () Bool)

(assert (=> b!751644 m!700821))

(push 1)

