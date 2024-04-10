; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67888 () Bool)

(assert start!67888)

(declare-fun b!789524 () Bool)

(declare-fun res!534798 () Bool)

(declare-fun e!438826 () Bool)

(assert (=> b!789524 (=> (not res!534798) (not e!438826))))

(declare-datatypes ((array!42865 0))(
  ( (array!42866 (arr!20519 (Array (_ BitVec 32) (_ BitVec 64))) (size!20940 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42865)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789524 (= res!534798 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789525 () Bool)

(declare-fun e!438820 () Bool)

(declare-fun e!438822 () Bool)

(assert (=> b!789525 (= e!438820 (not e!438822))))

(declare-fun res!534790 () Bool)

(assert (=> b!789525 (=> res!534790 e!438822)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8119 0))(
  ( (MissingZero!8119 (index!34844 (_ BitVec 32))) (Found!8119 (index!34845 (_ BitVec 32))) (Intermediate!8119 (undefined!8931 Bool) (index!34846 (_ BitVec 32)) (x!65780 (_ BitVec 32))) (Undefined!8119) (MissingVacant!8119 (index!34847 (_ BitVec 32))) )
))
(declare-fun lt!352283 () SeekEntryResult!8119)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!789525 (= res!534790 (or (not (is-Intermediate!8119 lt!352283)) (bvslt x!1131 (x!65780 lt!352283)) (not (= x!1131 (x!65780 lt!352283))) (not (= index!1321 (index!34846 lt!352283)))))))

(declare-fun e!438825 () Bool)

(assert (=> b!789525 e!438825))

(declare-fun res!534806 () Bool)

(assert (=> b!789525 (=> (not res!534806) (not e!438825))))

(declare-fun lt!352287 () SeekEntryResult!8119)

(declare-fun lt!352281 () SeekEntryResult!8119)

(assert (=> b!789525 (= res!534806 (= lt!352287 lt!352281))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!789525 (= lt!352281 (Found!8119 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8119)

(assert (=> b!789525 (= lt!352287 (seekEntryOrOpen!0 (select (arr!20519 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42865 (_ BitVec 32)) Bool)

(assert (=> b!789525 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27364 0))(
  ( (Unit!27365) )
))
(declare-fun lt!352284 () Unit!27364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27364)

(assert (=> b!789525 (= lt!352284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789526 () Bool)

(declare-fun e!438829 () Bool)

(declare-fun e!438823 () Bool)

(assert (=> b!789526 (= e!438829 e!438823)))

(declare-fun res!534802 () Bool)

(assert (=> b!789526 (=> res!534802 e!438823)))

(declare-fun lt!352291 () (_ BitVec 64))

(declare-fun lt!352289 () (_ BitVec 64))

(assert (=> b!789526 (= res!534802 (= lt!352291 lt!352289))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789526 (= lt!352291 (select (store (arr!20519 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789527 () Bool)

(declare-fun e!438828 () Unit!27364)

(declare-fun Unit!27366 () Unit!27364)

(assert (=> b!789527 (= e!438828 Unit!27366)))

(assert (=> b!789527 false))

(declare-fun b!789528 () Bool)

(declare-fun res!534789 () Bool)

(declare-fun e!438819 () Bool)

(assert (=> b!789528 (=> (not res!534789) (not e!438819))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!789528 (= res!534789 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20519 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789529 () Bool)

(declare-fun e!438827 () Bool)

(assert (=> b!789529 (= e!438827 e!438819)))

(declare-fun res!534793 () Bool)

(assert (=> b!789529 (=> (not res!534793) (not e!438819))))

(declare-fun lt!352292 () SeekEntryResult!8119)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789529 (= res!534793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20519 a!3186) j!159) mask!3328) (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352292))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789529 (= lt!352292 (Intermediate!8119 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789530 () Bool)

(declare-fun e!438821 () Bool)

(assert (=> b!789530 (= e!438821 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352292))))

(declare-fun b!789531 () Bool)

(assert (=> b!789531 (= e!438819 e!438820)))

(declare-fun res!534792 () Bool)

(assert (=> b!789531 (=> (not res!534792) (not e!438820))))

(declare-fun lt!352288 () SeekEntryResult!8119)

(assert (=> b!789531 (= res!534792 (= lt!352288 lt!352283))))

(declare-fun lt!352285 () array!42865)

(assert (=> b!789531 (= lt!352283 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352289 lt!352285 mask!3328))))

(assert (=> b!789531 (= lt!352288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352289 mask!3328) lt!352289 lt!352285 mask!3328))))

(assert (=> b!789531 (= lt!352289 (select (store (arr!20519 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789531 (= lt!352285 (array!42866 (store (arr!20519 a!3186) i!1173 k!2102) (size!20940 a!3186)))))

(declare-fun b!789532 () Bool)

(declare-fun res!534797 () Bool)

(assert (=> b!789532 (=> (not res!534797) (not e!438826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789532 (= res!534797 (validKeyInArray!0 k!2102))))

(declare-fun b!789534 () Bool)

(declare-fun e!438830 () Bool)

(declare-fun lt!352290 () SeekEntryResult!8119)

(assert (=> b!789534 (= e!438830 (= lt!352287 lt!352290))))

(declare-fun b!789535 () Bool)

(declare-fun res!534805 () Bool)

(assert (=> b!789535 (=> (not res!534805) (not e!438826))))

(assert (=> b!789535 (= res!534805 (and (= (size!20940 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20940 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20940 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789536 () Bool)

(declare-fun res!534788 () Bool)

(assert (=> b!789536 (=> (not res!534788) (not e!438826))))

(assert (=> b!789536 (= res!534788 (validKeyInArray!0 (select (arr!20519 a!3186) j!159)))))

(declare-fun b!789537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8119)

(assert (=> b!789537 (= e!438825 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) lt!352281))))

(declare-fun b!789538 () Bool)

(declare-fun res!534803 () Bool)

(assert (=> b!789538 (=> (not res!534803) (not e!438827))))

(assert (=> b!789538 (= res!534803 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20940 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20940 a!3186))))))

(declare-fun b!789539 () Bool)

(declare-fun res!534794 () Bool)

(assert (=> b!789539 (=> (not res!534794) (not e!438830))))

(assert (=> b!789539 (= res!534794 (= (seekEntryOrOpen!0 lt!352289 lt!352285 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352289 lt!352285 mask!3328)))))

(declare-fun b!789540 () Bool)

(assert (=> b!789540 (= e!438821 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328) (Found!8119 j!159)))))

(declare-fun b!789541 () Bool)

(assert (=> b!789541 (= e!438822 e!438829)))

(declare-fun res!534796 () Bool)

(assert (=> b!789541 (=> res!534796 e!438829)))

(assert (=> b!789541 (= res!534796 (not (= lt!352290 lt!352281)))))

(assert (=> b!789541 (= lt!352290 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20519 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789542 () Bool)

(assert (=> b!789542 (= e!438823 true)))

(assert (=> b!789542 e!438830))

(declare-fun res!534800 () Bool)

(assert (=> b!789542 (=> (not res!534800) (not e!438830))))

(assert (=> b!789542 (= res!534800 (= lt!352291 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352286 () Unit!27364)

(assert (=> b!789542 (= lt!352286 e!438828)))

(declare-fun c!87777 () Bool)

(assert (=> b!789542 (= c!87777 (= lt!352291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789543 () Bool)

(assert (=> b!789543 (= e!438826 e!438827)))

(declare-fun res!534804 () Bool)

(assert (=> b!789543 (=> (not res!534804) (not e!438827))))

(declare-fun lt!352282 () SeekEntryResult!8119)

(assert (=> b!789543 (= res!534804 (or (= lt!352282 (MissingZero!8119 i!1173)) (= lt!352282 (MissingVacant!8119 i!1173))))))

(assert (=> b!789543 (= lt!352282 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789544 () Bool)

(declare-fun Unit!27367 () Unit!27364)

(assert (=> b!789544 (= e!438828 Unit!27367)))

(declare-fun b!789545 () Bool)

(declare-fun res!534801 () Bool)

(assert (=> b!789545 (=> (not res!534801) (not e!438827))))

(declare-datatypes ((List!14521 0))(
  ( (Nil!14518) (Cons!14517 (h!15643 (_ BitVec 64)) (t!20836 List!14521)) )
))
(declare-fun arrayNoDuplicates!0 (array!42865 (_ BitVec 32) List!14521) Bool)

(assert (=> b!789545 (= res!534801 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14518))))

(declare-fun b!789546 () Bool)

(declare-fun res!534795 () Bool)

(assert (=> b!789546 (=> (not res!534795) (not e!438819))))

(assert (=> b!789546 (= res!534795 e!438821)))

(declare-fun c!87778 () Bool)

(assert (=> b!789546 (= c!87778 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!534799 () Bool)

(assert (=> start!67888 (=> (not res!534799) (not e!438826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67888 (= res!534799 (validMask!0 mask!3328))))

(assert (=> start!67888 e!438826))

(assert (=> start!67888 true))

(declare-fun array_inv!16315 (array!42865) Bool)

(assert (=> start!67888 (array_inv!16315 a!3186)))

(declare-fun b!789533 () Bool)

(declare-fun res!534791 () Bool)

(assert (=> b!789533 (=> (not res!534791) (not e!438827))))

(assert (=> b!789533 (= res!534791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67888 res!534799) b!789535))

(assert (= (and b!789535 res!534805) b!789536))

(assert (= (and b!789536 res!534788) b!789532))

(assert (= (and b!789532 res!534797) b!789524))

(assert (= (and b!789524 res!534798) b!789543))

(assert (= (and b!789543 res!534804) b!789533))

(assert (= (and b!789533 res!534791) b!789545))

(assert (= (and b!789545 res!534801) b!789538))

(assert (= (and b!789538 res!534803) b!789529))

(assert (= (and b!789529 res!534793) b!789528))

(assert (= (and b!789528 res!534789) b!789546))

(assert (= (and b!789546 c!87778) b!789530))

(assert (= (and b!789546 (not c!87778)) b!789540))

(assert (= (and b!789546 res!534795) b!789531))

(assert (= (and b!789531 res!534792) b!789525))

(assert (= (and b!789525 res!534806) b!789537))

(assert (= (and b!789525 (not res!534790)) b!789541))

(assert (= (and b!789541 (not res!534796)) b!789526))

(assert (= (and b!789526 (not res!534802)) b!789542))

(assert (= (and b!789542 c!87777) b!789527))

(assert (= (and b!789542 (not c!87777)) b!789544))

(assert (= (and b!789542 res!534800) b!789539))

(assert (= (and b!789539 res!534794) b!789534))

(declare-fun m!730585 () Bool)

(assert (=> b!789529 m!730585))

(assert (=> b!789529 m!730585))

(declare-fun m!730587 () Bool)

(assert (=> b!789529 m!730587))

(assert (=> b!789529 m!730587))

(assert (=> b!789529 m!730585))

(declare-fun m!730589 () Bool)

(assert (=> b!789529 m!730589))

(declare-fun m!730591 () Bool)

(assert (=> b!789531 m!730591))

(declare-fun m!730593 () Bool)

(assert (=> b!789531 m!730593))

(assert (=> b!789531 m!730591))

(declare-fun m!730595 () Bool)

(assert (=> b!789531 m!730595))

(declare-fun m!730597 () Bool)

(assert (=> b!789531 m!730597))

(declare-fun m!730599 () Bool)

(assert (=> b!789531 m!730599))

(declare-fun m!730601 () Bool)

(assert (=> b!789528 m!730601))

(assert (=> b!789540 m!730585))

(assert (=> b!789540 m!730585))

(declare-fun m!730603 () Bool)

(assert (=> b!789540 m!730603))

(declare-fun m!730605 () Bool)

(assert (=> b!789545 m!730605))

(declare-fun m!730607 () Bool)

(assert (=> b!789524 m!730607))

(assert (=> b!789530 m!730585))

(assert (=> b!789530 m!730585))

(declare-fun m!730609 () Bool)

(assert (=> b!789530 m!730609))

(declare-fun m!730611 () Bool)

(assert (=> b!789532 m!730611))

(declare-fun m!730613 () Bool)

(assert (=> b!789539 m!730613))

(declare-fun m!730615 () Bool)

(assert (=> b!789539 m!730615))

(declare-fun m!730617 () Bool)

(assert (=> start!67888 m!730617))

(declare-fun m!730619 () Bool)

(assert (=> start!67888 m!730619))

(assert (=> b!789541 m!730585))

(assert (=> b!789541 m!730585))

(assert (=> b!789541 m!730603))

(declare-fun m!730621 () Bool)

(assert (=> b!789533 m!730621))

(assert (=> b!789525 m!730585))

(assert (=> b!789525 m!730585))

(declare-fun m!730623 () Bool)

(assert (=> b!789525 m!730623))

(declare-fun m!730625 () Bool)

(assert (=> b!789525 m!730625))

(declare-fun m!730627 () Bool)

(assert (=> b!789525 m!730627))

(assert (=> b!789537 m!730585))

(assert (=> b!789537 m!730585))

(declare-fun m!730629 () Bool)

(assert (=> b!789537 m!730629))

(assert (=> b!789536 m!730585))

(assert (=> b!789536 m!730585))

(declare-fun m!730631 () Bool)

(assert (=> b!789536 m!730631))

(assert (=> b!789526 m!730593))

(declare-fun m!730633 () Bool)

(assert (=> b!789526 m!730633))

(declare-fun m!730635 () Bool)

(assert (=> b!789543 m!730635))

(push 1)

