; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65648 () Bool)

(assert start!65648)

(declare-fun b!751769 () Bool)

(declare-fun e!419367 () Bool)

(declare-fun e!419366 () Bool)

(assert (=> b!751769 (= e!419367 (not e!419366))))

(declare-fun res!507588 () Bool)

(assert (=> b!751769 (=> res!507588 e!419366)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7624 0))(
  ( (MissingZero!7624 (index!32864 (_ BitVec 32))) (Found!7624 (index!32865 (_ BitVec 32))) (Intermediate!7624 (undefined!8436 Bool) (index!32866 (_ BitVec 32)) (x!63782 (_ BitVec 32))) (Undefined!7624) (MissingVacant!7624 (index!32867 (_ BitVec 32))) )
))
(declare-fun lt!334351 () SeekEntryResult!7624)

(assert (=> b!751769 (= res!507588 (or (not (is-Intermediate!7624 lt!334351)) (bvslt x!1131 (x!63782 lt!334351)) (not (= x!1131 (x!63782 lt!334351))) (not (= index!1321 (index!32866 lt!334351)))))))

(declare-fun e!419359 () Bool)

(assert (=> b!751769 e!419359))

(declare-fun res!507596 () Bool)

(assert (=> b!751769 (=> (not res!507596) (not e!419359))))

(declare-fun lt!334358 () SeekEntryResult!7624)

(declare-fun lt!334356 () SeekEntryResult!7624)

(assert (=> b!751769 (= res!507596 (= lt!334358 lt!334356))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!751769 (= lt!334356 (Found!7624 j!159))))

(declare-datatypes ((array!41821 0))(
  ( (array!41822 (arr!20024 (Array (_ BitVec 32) (_ BitVec 64))) (size!20445 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41821)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751769 (= lt!334358 (seekEntryOrOpen!0 (select (arr!20024 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41821 (_ BitVec 32)) Bool)

(assert (=> b!751769 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25876 0))(
  ( (Unit!25877) )
))
(declare-fun lt!334355 () Unit!25876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25876)

(assert (=> b!751769 (= lt!334355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751770 () Bool)

(declare-fun res!507594 () Bool)

(declare-fun e!419362 () Bool)

(assert (=> b!751770 (=> (not res!507594) (not e!419362))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751770 (= res!507594 (validKeyInArray!0 k!2102))))

(declare-fun b!751771 () Bool)

(declare-fun res!507592 () Bool)

(assert (=> b!751771 (=> (not res!507592) (not e!419362))))

(declare-fun arrayContainsKey!0 (array!41821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751771 (= res!507592 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751772 () Bool)

(declare-fun res!507584 () Bool)

(declare-fun e!419358 () Bool)

(assert (=> b!751772 (=> (not res!507584) (not e!419358))))

(assert (=> b!751772 (= res!507584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751773 () Bool)

(declare-fun res!507586 () Bool)

(assert (=> b!751773 (=> (not res!507586) (not e!419358))))

(declare-datatypes ((List!14026 0))(
  ( (Nil!14023) (Cons!14022 (h!15094 (_ BitVec 64)) (t!20341 List!14026)) )
))
(declare-fun arrayNoDuplicates!0 (array!41821 (_ BitVec 32) List!14026) Bool)

(assert (=> b!751773 (= res!507586 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14023))))

(declare-fun e!419365 () Bool)

(declare-fun b!751774 () Bool)

(declare-fun lt!334360 () SeekEntryResult!7624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751774 (= e!419365 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334360))))

(declare-fun b!751775 () Bool)

(declare-fun e!419369 () Bool)

(declare-fun e!419368 () Bool)

(assert (=> b!751775 (= e!419369 e!419368)))

(declare-fun res!507593 () Bool)

(assert (=> b!751775 (=> res!507593 e!419368)))

(declare-fun lt!334361 () (_ BitVec 64))

(declare-fun lt!334359 () (_ BitVec 64))

(assert (=> b!751775 (= res!507593 (= lt!334361 lt!334359))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751775 (= lt!334361 (select (store (arr!20024 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751776 () Bool)

(declare-fun e!419363 () Bool)

(assert (=> b!751776 (= e!419358 e!419363)))

(declare-fun res!507590 () Bool)

(assert (=> b!751776 (=> (not res!507590) (not e!419363))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751776 (= res!507590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20024 a!3186) j!159) mask!3328) (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334360))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751776 (= lt!334360 (Intermediate!7624 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751777 (= e!419365 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) (Found!7624 j!159)))))

(declare-fun b!751778 () Bool)

(declare-fun res!507589 () Bool)

(assert (=> b!751778 (=> (not res!507589) (not e!419358))))

(assert (=> b!751778 (= res!507589 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20445 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20445 a!3186))))))

(declare-fun b!751779 () Bool)

(declare-fun res!507587 () Bool)

(assert (=> b!751779 (=> (not res!507587) (not e!419362))))

(assert (=> b!751779 (= res!507587 (and (= (size!20445 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20445 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20445 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751780 () Bool)

(declare-fun res!507585 () Bool)

(assert (=> b!751780 (=> (not res!507585) (not e!419363))))

(assert (=> b!751780 (= res!507585 e!419365)))

(declare-fun c!82474 () Bool)

(assert (=> b!751780 (= c!82474 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751781 () Bool)

(assert (=> b!751781 (= e!419362 e!419358)))

(declare-fun res!507600 () Bool)

(assert (=> b!751781 (=> (not res!507600) (not e!419358))))

(declare-fun lt!334352 () SeekEntryResult!7624)

(assert (=> b!751781 (= res!507600 (or (= lt!334352 (MissingZero!7624 i!1173)) (= lt!334352 (MissingVacant!7624 i!1173))))))

(assert (=> b!751781 (= lt!334352 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751782 () Bool)

(declare-fun res!507599 () Bool)

(declare-fun e!419360 () Bool)

(assert (=> b!751782 (=> (not res!507599) (not e!419360))))

(declare-fun lt!334350 () array!41821)

(assert (=> b!751782 (= res!507599 (= (seekEntryOrOpen!0 lt!334359 lt!334350 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334359 lt!334350 mask!3328)))))

(declare-fun b!751783 () Bool)

(assert (=> b!751783 (= e!419366 e!419369)))

(declare-fun res!507591 () Bool)

(assert (=> b!751783 (=> res!507591 e!419369)))

(declare-fun lt!334353 () SeekEntryResult!7624)

(assert (=> b!751783 (= res!507591 (not (= lt!334353 lt!334356)))))

(assert (=> b!751783 (= lt!334353 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751784 () Bool)

(declare-fun e!419361 () Unit!25876)

(declare-fun Unit!25878 () Unit!25876)

(assert (=> b!751784 (= e!419361 Unit!25878)))

(declare-fun b!751785 () Bool)

(declare-fun res!507597 () Bool)

(assert (=> b!751785 (=> (not res!507597) (not e!419362))))

(assert (=> b!751785 (= res!507597 (validKeyInArray!0 (select (arr!20024 a!3186) j!159)))))

(declare-fun res!507602 () Bool)

(assert (=> start!65648 (=> (not res!507602) (not e!419362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65648 (= res!507602 (validMask!0 mask!3328))))

(assert (=> start!65648 e!419362))

(assert (=> start!65648 true))

(declare-fun array_inv!15820 (array!41821) Bool)

(assert (=> start!65648 (array_inv!15820 a!3186)))

(declare-fun b!751786 () Bool)

(assert (=> b!751786 (= e!419359 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20024 a!3186) j!159) a!3186 mask!3328) lt!334356))))

(declare-fun b!751787 () Bool)

(assert (=> b!751787 (= e!419360 (= lt!334358 lt!334353))))

(declare-fun b!751788 () Bool)

(declare-fun Unit!25879 () Unit!25876)

(assert (=> b!751788 (= e!419361 Unit!25879)))

(assert (=> b!751788 false))

(declare-fun b!751789 () Bool)

(declare-fun res!507598 () Bool)

(assert (=> b!751789 (=> (not res!507598) (not e!419363))))

(assert (=> b!751789 (= res!507598 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20024 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751790 () Bool)

(assert (=> b!751790 (= e!419363 e!419367)))

(declare-fun res!507595 () Bool)

(assert (=> b!751790 (=> (not res!507595) (not e!419367))))

(declare-fun lt!334357 () SeekEntryResult!7624)

(assert (=> b!751790 (= res!507595 (= lt!334357 lt!334351))))

(assert (=> b!751790 (= lt!334351 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334359 lt!334350 mask!3328))))

(assert (=> b!751790 (= lt!334357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334359 mask!3328) lt!334359 lt!334350 mask!3328))))

(assert (=> b!751790 (= lt!334359 (select (store (arr!20024 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751790 (= lt!334350 (array!41822 (store (arr!20024 a!3186) i!1173 k!2102) (size!20445 a!3186)))))

(declare-fun b!751791 () Bool)

(assert (=> b!751791 (= e!419368 true)))

(assert (=> b!751791 e!419360))

(declare-fun res!507601 () Bool)

(assert (=> b!751791 (=> (not res!507601) (not e!419360))))

(assert (=> b!751791 (= res!507601 (= lt!334361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334354 () Unit!25876)

(assert (=> b!751791 (= lt!334354 e!419361)))

(declare-fun c!82473 () Bool)

(assert (=> b!751791 (= c!82473 (= lt!334361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65648 res!507602) b!751779))

(assert (= (and b!751779 res!507587) b!751785))

(assert (= (and b!751785 res!507597) b!751770))

(assert (= (and b!751770 res!507594) b!751771))

(assert (= (and b!751771 res!507592) b!751781))

(assert (= (and b!751781 res!507600) b!751772))

(assert (= (and b!751772 res!507584) b!751773))

(assert (= (and b!751773 res!507586) b!751778))

(assert (= (and b!751778 res!507589) b!751776))

(assert (= (and b!751776 res!507590) b!751789))

(assert (= (and b!751789 res!507598) b!751780))

(assert (= (and b!751780 c!82474) b!751774))

(assert (= (and b!751780 (not c!82474)) b!751777))

(assert (= (and b!751780 res!507585) b!751790))

(assert (= (and b!751790 res!507595) b!751769))

(assert (= (and b!751769 res!507596) b!751786))

(assert (= (and b!751769 (not res!507588)) b!751783))

(assert (= (and b!751783 (not res!507591)) b!751775))

(assert (= (and b!751775 (not res!507593)) b!751791))

(assert (= (and b!751791 c!82473) b!751788))

(assert (= (and b!751791 (not c!82473)) b!751784))

(assert (= (and b!751791 res!507601) b!751782))

(assert (= (and b!751782 res!507599) b!751787))

(declare-fun m!700875 () Bool)

(assert (=> b!751782 m!700875))

(declare-fun m!700877 () Bool)

(assert (=> b!751782 m!700877))

(declare-fun m!700879 () Bool)

(assert (=> start!65648 m!700879))

(declare-fun m!700881 () Bool)

(assert (=> start!65648 m!700881))

(declare-fun m!700883 () Bool)

(assert (=> b!751781 m!700883))

(declare-fun m!700885 () Bool)

(assert (=> b!751770 m!700885))

(declare-fun m!700887 () Bool)

(assert (=> b!751776 m!700887))

(assert (=> b!751776 m!700887))

(declare-fun m!700889 () Bool)

(assert (=> b!751776 m!700889))

(assert (=> b!751776 m!700889))

(assert (=> b!751776 m!700887))

(declare-fun m!700891 () Bool)

(assert (=> b!751776 m!700891))

(declare-fun m!700893 () Bool)

(assert (=> b!751773 m!700893))

(declare-fun m!700895 () Bool)

(assert (=> b!751772 m!700895))

(assert (=> b!751769 m!700887))

(assert (=> b!751769 m!700887))

(declare-fun m!700897 () Bool)

(assert (=> b!751769 m!700897))

(declare-fun m!700899 () Bool)

(assert (=> b!751769 m!700899))

(declare-fun m!700901 () Bool)

(assert (=> b!751769 m!700901))

(declare-fun m!700903 () Bool)

(assert (=> b!751771 m!700903))

(declare-fun m!700905 () Bool)

(assert (=> b!751775 m!700905))

(declare-fun m!700907 () Bool)

(assert (=> b!751775 m!700907))

(declare-fun m!700909 () Bool)

(assert (=> b!751790 m!700909))

(assert (=> b!751790 m!700905))

(declare-fun m!700911 () Bool)

(assert (=> b!751790 m!700911))

(declare-fun m!700913 () Bool)

(assert (=> b!751790 m!700913))

(assert (=> b!751790 m!700909))

(declare-fun m!700915 () Bool)

(assert (=> b!751790 m!700915))

(assert (=> b!751774 m!700887))

(assert (=> b!751774 m!700887))

(declare-fun m!700917 () Bool)

(assert (=> b!751774 m!700917))

(assert (=> b!751786 m!700887))

(assert (=> b!751786 m!700887))

(declare-fun m!700919 () Bool)

(assert (=> b!751786 m!700919))

(assert (=> b!751785 m!700887))

(assert (=> b!751785 m!700887))

(declare-fun m!700921 () Bool)

(assert (=> b!751785 m!700921))

(declare-fun m!700923 () Bool)

(assert (=> b!751789 m!700923))

(assert (=> b!751777 m!700887))

(assert (=> b!751777 m!700887))

(declare-fun m!700925 () Bool)

(assert (=> b!751777 m!700925))

(assert (=> b!751783 m!700887))

(assert (=> b!751783 m!700887))

(assert (=> b!751783 m!700925))

(push 1)

