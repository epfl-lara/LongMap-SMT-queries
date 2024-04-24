; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65772 () Bool)

(assert start!65772)

(declare-fun b!752376 () Bool)

(declare-fun res!507784 () Bool)

(declare-fun e!419764 () Bool)

(assert (=> b!752376 (=> (not res!507784) (not e!419764))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41815 0))(
  ( (array!41816 (arr!20017 (Array (_ BitVec 32) (_ BitVec 64))) (size!20437 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41815)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752376 (= res!507784 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20017 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752377 () Bool)

(declare-fun res!507787 () Bool)

(declare-fun e!419774 () Bool)

(assert (=> b!752377 (=> (not res!507787) (not e!419774))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752377 (= res!507787 (validKeyInArray!0 (select (arr!20017 a!3186) j!159)))))

(declare-fun b!752378 () Bool)

(declare-fun res!507777 () Bool)

(declare-fun e!419766 () Bool)

(assert (=> b!752378 (=> (not res!507777) (not e!419766))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752378 (= res!507777 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20437 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20437 a!3186))))))

(declare-fun b!752379 () Bool)

(declare-fun res!507776 () Bool)

(assert (=> b!752379 (=> (not res!507776) (not e!419764))))

(declare-fun e!419769 () Bool)

(assert (=> b!752379 (= res!507776 e!419769)))

(declare-fun c!82685 () Bool)

(assert (=> b!752379 (= c!82685 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752380 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7573 0))(
  ( (MissingZero!7573 (index!32660 (_ BitVec 32))) (Found!7573 (index!32661 (_ BitVec 32))) (Intermediate!7573 (undefined!8385 Bool) (index!32662 (_ BitVec 32)) (x!63743 (_ BitVec 32))) (Undefined!7573) (MissingVacant!7573 (index!32663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!752380 (= e!419769 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) (Found!7573 j!159)))))

(declare-fun b!752381 () Bool)

(declare-fun e!419770 () Bool)

(declare-fun lt!334592 () SeekEntryResult!7573)

(declare-fun lt!334593 () SeekEntryResult!7573)

(assert (=> b!752381 (= e!419770 (= lt!334592 lt!334593))))

(declare-fun b!752382 () Bool)

(declare-fun e!419775 () Bool)

(assert (=> b!752382 (= e!419775 true)))

(assert (=> b!752382 e!419770))

(declare-fun res!507778 () Bool)

(assert (=> b!752382 (=> (not res!507778) (not e!419770))))

(declare-fun lt!334599 () (_ BitVec 64))

(assert (=> b!752382 (= res!507778 (= lt!334599 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25849 0))(
  ( (Unit!25850) )
))
(declare-fun lt!334594 () Unit!25849)

(declare-fun e!419772 () Unit!25849)

(assert (=> b!752382 (= lt!334594 e!419772)))

(declare-fun c!82684 () Bool)

(assert (=> b!752382 (= c!82684 (= lt!334599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752383 () Bool)

(declare-fun res!507791 () Bool)

(assert (=> b!752383 (=> (not res!507791) (not e!419774))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752383 (= res!507791 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752384 () Bool)

(declare-fun res!507785 () Bool)

(assert (=> b!752384 (=> (not res!507785) (not e!419774))))

(assert (=> b!752384 (= res!507785 (validKeyInArray!0 k0!2102))))

(declare-fun b!752385 () Bool)

(assert (=> b!752385 (= e!419774 e!419766)))

(declare-fun res!507782 () Bool)

(assert (=> b!752385 (=> (not res!507782) (not e!419766))))

(declare-fun lt!334601 () SeekEntryResult!7573)

(assert (=> b!752385 (= res!507782 (or (= lt!334601 (MissingZero!7573 i!1173)) (= lt!334601 (MissingVacant!7573 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!752385 (= lt!334601 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752386 () Bool)

(declare-fun res!507792 () Bool)

(assert (=> b!752386 (=> (not res!507792) (not e!419766))))

(declare-datatypes ((List!13926 0))(
  ( (Nil!13923) (Cons!13922 (h!15000 (_ BitVec 64)) (t!20233 List!13926)) )
))
(declare-fun arrayNoDuplicates!0 (array!41815 (_ BitVec 32) List!13926) Bool)

(assert (=> b!752386 (= res!507792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13923))))

(declare-fun b!752387 () Bool)

(declare-fun Unit!25851 () Unit!25849)

(assert (=> b!752387 (= e!419772 Unit!25851)))

(assert (=> b!752387 false))

(declare-fun b!752388 () Bool)

(declare-fun lt!334596 () SeekEntryResult!7573)

(declare-fun e!419767 () Bool)

(assert (=> b!752388 (= e!419767 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334596))))

(declare-fun b!752389 () Bool)

(declare-fun e!419771 () Bool)

(declare-fun e!419768 () Bool)

(assert (=> b!752389 (= e!419771 e!419768)))

(declare-fun res!507790 () Bool)

(assert (=> b!752389 (=> res!507790 e!419768)))

(assert (=> b!752389 (= res!507790 (not (= lt!334593 lt!334596)))))

(assert (=> b!752389 (= lt!334593 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20017 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752390 () Bool)

(assert (=> b!752390 (= e!419766 e!419764)))

(declare-fun res!507779 () Bool)

(assert (=> b!752390 (=> (not res!507779) (not e!419764))))

(declare-fun lt!334597 () SeekEntryResult!7573)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752390 (= res!507779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20017 a!3186) j!159) mask!3328) (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334597))))

(assert (=> b!752390 (= lt!334597 (Intermediate!7573 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!507780 () Bool)

(assert (=> start!65772 (=> (not res!507780) (not e!419774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65772 (= res!507780 (validMask!0 mask!3328))))

(assert (=> start!65772 e!419774))

(assert (=> start!65772 true))

(declare-fun array_inv!15876 (array!41815) Bool)

(assert (=> start!65772 (array_inv!15876 a!3186)))

(declare-fun b!752391 () Bool)

(declare-fun res!507793 () Bool)

(assert (=> b!752391 (=> (not res!507793) (not e!419774))))

(assert (=> b!752391 (= res!507793 (and (= (size!20437 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20437 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20437 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752392 () Bool)

(declare-fun res!507781 () Bool)

(assert (=> b!752392 (=> (not res!507781) (not e!419770))))

(declare-fun lt!334598 () (_ BitVec 64))

(declare-fun lt!334602 () array!41815)

(assert (=> b!752392 (= res!507781 (= (seekEntryOrOpen!0 lt!334598 lt!334602 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334598 lt!334602 mask!3328)))))

(declare-fun b!752393 () Bool)

(assert (=> b!752393 (= e!419769 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20017 a!3186) j!159) a!3186 mask!3328) lt!334597))))

(declare-fun b!752394 () Bool)

(declare-fun res!507788 () Bool)

(assert (=> b!752394 (=> (not res!507788) (not e!419766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41815 (_ BitVec 32)) Bool)

(assert (=> b!752394 (= res!507788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752395 () Bool)

(declare-fun e!419773 () Bool)

(assert (=> b!752395 (= e!419764 e!419773)))

(declare-fun res!507789 () Bool)

(assert (=> b!752395 (=> (not res!507789) (not e!419773))))

(declare-fun lt!334600 () SeekEntryResult!7573)

(declare-fun lt!334595 () SeekEntryResult!7573)

(assert (=> b!752395 (= res!507789 (= lt!334600 lt!334595))))

(assert (=> b!752395 (= lt!334595 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334598 lt!334602 mask!3328))))

(assert (=> b!752395 (= lt!334600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334598 mask!3328) lt!334598 lt!334602 mask!3328))))

(assert (=> b!752395 (= lt!334598 (select (store (arr!20017 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752395 (= lt!334602 (array!41816 (store (arr!20017 a!3186) i!1173 k0!2102) (size!20437 a!3186)))))

(declare-fun b!752396 () Bool)

(declare-fun Unit!25852 () Unit!25849)

(assert (=> b!752396 (= e!419772 Unit!25852)))

(declare-fun b!752397 () Bool)

(assert (=> b!752397 (= e!419768 e!419775)))

(declare-fun res!507783 () Bool)

(assert (=> b!752397 (=> res!507783 e!419775)))

(assert (=> b!752397 (= res!507783 (= lt!334599 lt!334598))))

(assert (=> b!752397 (= lt!334599 (select (store (arr!20017 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752398 () Bool)

(assert (=> b!752398 (= e!419773 (not e!419771))))

(declare-fun res!507775 () Bool)

(assert (=> b!752398 (=> res!507775 e!419771)))

(get-info :version)

(assert (=> b!752398 (= res!507775 (or (not ((_ is Intermediate!7573) lt!334595)) (bvslt x!1131 (x!63743 lt!334595)) (not (= x!1131 (x!63743 lt!334595))) (not (= index!1321 (index!32662 lt!334595)))))))

(assert (=> b!752398 e!419767))

(declare-fun res!507786 () Bool)

(assert (=> b!752398 (=> (not res!507786) (not e!419767))))

(assert (=> b!752398 (= res!507786 (= lt!334592 lt!334596))))

(assert (=> b!752398 (= lt!334596 (Found!7573 j!159))))

(assert (=> b!752398 (= lt!334592 (seekEntryOrOpen!0 (select (arr!20017 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752398 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334591 () Unit!25849)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25849)

(assert (=> b!752398 (= lt!334591 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65772 res!507780) b!752391))

(assert (= (and b!752391 res!507793) b!752377))

(assert (= (and b!752377 res!507787) b!752384))

(assert (= (and b!752384 res!507785) b!752383))

(assert (= (and b!752383 res!507791) b!752385))

(assert (= (and b!752385 res!507782) b!752394))

(assert (= (and b!752394 res!507788) b!752386))

(assert (= (and b!752386 res!507792) b!752378))

(assert (= (and b!752378 res!507777) b!752390))

(assert (= (and b!752390 res!507779) b!752376))

(assert (= (and b!752376 res!507784) b!752379))

(assert (= (and b!752379 c!82685) b!752393))

(assert (= (and b!752379 (not c!82685)) b!752380))

(assert (= (and b!752379 res!507776) b!752395))

(assert (= (and b!752395 res!507789) b!752398))

(assert (= (and b!752398 res!507786) b!752388))

(assert (= (and b!752398 (not res!507775)) b!752389))

(assert (= (and b!752389 (not res!507790)) b!752397))

(assert (= (and b!752397 (not res!507783)) b!752382))

(assert (= (and b!752382 c!82684) b!752387))

(assert (= (and b!752382 (not c!82684)) b!752396))

(assert (= (and b!752382 res!507778) b!752392))

(assert (= (and b!752392 res!507781) b!752381))

(declare-fun m!701931 () Bool)

(assert (=> b!752386 m!701931))

(declare-fun m!701933 () Bool)

(assert (=> b!752392 m!701933))

(declare-fun m!701935 () Bool)

(assert (=> b!752392 m!701935))

(declare-fun m!701937 () Bool)

(assert (=> b!752395 m!701937))

(declare-fun m!701939 () Bool)

(assert (=> b!752395 m!701939))

(assert (=> b!752395 m!701937))

(declare-fun m!701941 () Bool)

(assert (=> b!752395 m!701941))

(declare-fun m!701943 () Bool)

(assert (=> b!752395 m!701943))

(declare-fun m!701945 () Bool)

(assert (=> b!752395 m!701945))

(declare-fun m!701947 () Bool)

(assert (=> b!752383 m!701947))

(declare-fun m!701949 () Bool)

(assert (=> b!752377 m!701949))

(assert (=> b!752377 m!701949))

(declare-fun m!701951 () Bool)

(assert (=> b!752377 m!701951))

(assert (=> b!752397 m!701943))

(declare-fun m!701953 () Bool)

(assert (=> b!752397 m!701953))

(assert (=> b!752390 m!701949))

(assert (=> b!752390 m!701949))

(declare-fun m!701955 () Bool)

(assert (=> b!752390 m!701955))

(assert (=> b!752390 m!701955))

(assert (=> b!752390 m!701949))

(declare-fun m!701957 () Bool)

(assert (=> b!752390 m!701957))

(assert (=> b!752398 m!701949))

(assert (=> b!752398 m!701949))

(declare-fun m!701959 () Bool)

(assert (=> b!752398 m!701959))

(declare-fun m!701961 () Bool)

(assert (=> b!752398 m!701961))

(declare-fun m!701963 () Bool)

(assert (=> b!752398 m!701963))

(declare-fun m!701965 () Bool)

(assert (=> b!752376 m!701965))

(assert (=> b!752389 m!701949))

(assert (=> b!752389 m!701949))

(declare-fun m!701967 () Bool)

(assert (=> b!752389 m!701967))

(declare-fun m!701969 () Bool)

(assert (=> b!752384 m!701969))

(declare-fun m!701971 () Bool)

(assert (=> b!752394 m!701971))

(assert (=> b!752380 m!701949))

(assert (=> b!752380 m!701949))

(assert (=> b!752380 m!701967))

(assert (=> b!752388 m!701949))

(assert (=> b!752388 m!701949))

(declare-fun m!701973 () Bool)

(assert (=> b!752388 m!701973))

(declare-fun m!701975 () Bool)

(assert (=> start!65772 m!701975))

(declare-fun m!701977 () Bool)

(assert (=> start!65772 m!701977))

(assert (=> b!752393 m!701949))

(assert (=> b!752393 m!701949))

(declare-fun m!701979 () Bool)

(assert (=> b!752393 m!701979))

(declare-fun m!701981 () Bool)

(assert (=> b!752385 m!701981))

(check-sat (not b!752393) (not b!752392) (not b!752383) (not b!752394) (not b!752390) (not b!752398) (not b!752384) (not start!65772) (not b!752389) (not b!752395) (not b!752386) (not b!752380) (not b!752388) (not b!752385) (not b!752377))
(check-sat)
