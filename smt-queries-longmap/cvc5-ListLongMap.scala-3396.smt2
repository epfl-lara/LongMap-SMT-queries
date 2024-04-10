; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46848 () Bool)

(assert start!46848)

(declare-fun res!316540 () Bool)

(declare-fun e!301781 () Bool)

(assert (=> start!46848 (=> (not res!316540) (not e!301781))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46848 (= res!316540 (validMask!0 mask!3524))))

(assert (=> start!46848 e!301781))

(assert (=> start!46848 true))

(declare-datatypes ((array!33103 0))(
  ( (array!33104 (arr!15918 (Array (_ BitVec 32) (_ BitVec 64))) (size!16282 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33103)

(declare-fun array_inv!11714 (array!33103) Bool)

(assert (=> start!46848 (array_inv!11714 a!3235)))

(declare-fun b!517156 () Bool)

(declare-fun res!316545 () Bool)

(assert (=> b!517156 (=> (not res!316545) (not e!301781))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517156 (= res!316545 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517157 () Bool)

(declare-fun res!316541 () Bool)

(declare-fun e!301784 () Bool)

(assert (=> b!517157 (=> (not res!316541) (not e!301784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33103 (_ BitVec 32)) Bool)

(assert (=> b!517157 (= res!316541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517158 () Bool)

(declare-fun res!316543 () Bool)

(assert (=> b!517158 (=> (not res!316543) (not e!301781))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517158 (= res!316543 (validKeyInArray!0 (select (arr!15918 a!3235) j!176)))))

(declare-datatypes ((SeekEntryResult!4385 0))(
  ( (MissingZero!4385 (index!19728 (_ BitVec 32))) (Found!4385 (index!19729 (_ BitVec 32))) (Intermediate!4385 (undefined!5197 Bool) (index!19730 (_ BitVec 32)) (x!48690 (_ BitVec 32))) (Undefined!4385) (MissingVacant!4385 (index!19731 (_ BitVec 32))) )
))
(declare-fun lt!236739 () SeekEntryResult!4385)

(declare-fun lt!236741 () (_ BitVec 32))

(declare-fun b!517159 () Bool)

(declare-fun e!301782 () Bool)

(assert (=> b!517159 (= e!301782 (or (not (= (select (arr!15918 a!3235) (index!19730 lt!236739)) (select (arr!15918 a!3235) j!176))) (bvsgt (x!48690 lt!236739) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48690 lt!236739)) (and (bvsge lt!236741 #b00000000000000000000000000000000) (bvslt lt!236741 (size!16282 a!3235)))))))

(assert (=> b!517159 (and (bvslt (x!48690 lt!236739) #b01111111111111111111111111111110) (or (= (select (arr!15918 a!3235) (index!19730 lt!236739)) (select (arr!15918 a!3235) j!176)) (= (select (arr!15918 a!3235) (index!19730 lt!236739)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15918 a!3235) (index!19730 lt!236739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517160 () Bool)

(declare-fun res!316539 () Bool)

(assert (=> b!517160 (=> (not res!316539) (not e!301784))))

(declare-datatypes ((List!10076 0))(
  ( (Nil!10073) (Cons!10072 (h!10973 (_ BitVec 64)) (t!16304 List!10076)) )
))
(declare-fun arrayNoDuplicates!0 (array!33103 (_ BitVec 32) List!10076) Bool)

(assert (=> b!517160 (= res!316539 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10073))))

(declare-fun b!517161 () Bool)

(assert (=> b!517161 (= e!301781 e!301784)))

(declare-fun res!316546 () Bool)

(assert (=> b!517161 (=> (not res!316546) (not e!301784))))

(declare-fun lt!236740 () SeekEntryResult!4385)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517161 (= res!316546 (or (= lt!236740 (MissingZero!4385 i!1204)) (= lt!236740 (MissingVacant!4385 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4385)

(assert (=> b!517161 (= lt!236740 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517162 () Bool)

(declare-fun res!316538 () Bool)

(assert (=> b!517162 (=> (not res!316538) (not e!301781))))

(assert (=> b!517162 (= res!316538 (and (= (size!16282 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16282 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16282 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517163 () Bool)

(declare-fun res!316542 () Bool)

(assert (=> b!517163 (=> (not res!316542) (not e!301781))))

(assert (=> b!517163 (= res!316542 (validKeyInArray!0 k!2280))))

(declare-fun b!517164 () Bool)

(assert (=> b!517164 (= e!301784 (not e!301782))))

(declare-fun res!316537 () Bool)

(assert (=> b!517164 (=> res!316537 e!301782)))

(declare-fun lt!236743 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4385)

(assert (=> b!517164 (= res!316537 (= lt!236739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236743 (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)) mask!3524)))))

(assert (=> b!517164 (= lt!236739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236741 (select (arr!15918 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517164 (= lt!236743 (toIndex!0 (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517164 (= lt!236741 (toIndex!0 (select (arr!15918 a!3235) j!176) mask!3524))))

(declare-fun e!301783 () Bool)

(assert (=> b!517164 e!301783))

(declare-fun res!316544 () Bool)

(assert (=> b!517164 (=> (not res!316544) (not e!301783))))

(assert (=> b!517164 (= res!316544 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16028 0))(
  ( (Unit!16029) )
))
(declare-fun lt!236742 () Unit!16028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16028)

(assert (=> b!517164 (= lt!236742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517165 () Bool)

(declare-fun res!316547 () Bool)

(assert (=> b!517165 (=> res!316547 e!301782)))

(assert (=> b!517165 (= res!316547 (or (undefined!5197 lt!236739) (not (is-Intermediate!4385 lt!236739))))))

(declare-fun b!517166 () Bool)

(assert (=> b!517166 (= e!301783 (= (seekEntryOrOpen!0 (select (arr!15918 a!3235) j!176) a!3235 mask!3524) (Found!4385 j!176)))))

(assert (= (and start!46848 res!316540) b!517162))

(assert (= (and b!517162 res!316538) b!517158))

(assert (= (and b!517158 res!316543) b!517163))

(assert (= (and b!517163 res!316542) b!517156))

(assert (= (and b!517156 res!316545) b!517161))

(assert (= (and b!517161 res!316546) b!517157))

(assert (= (and b!517157 res!316541) b!517160))

(assert (= (and b!517160 res!316539) b!517164))

(assert (= (and b!517164 res!316544) b!517166))

(assert (= (and b!517164 (not res!316537)) b!517165))

(assert (= (and b!517165 (not res!316547)) b!517159))

(declare-fun m!498621 () Bool)

(assert (=> b!517161 m!498621))

(declare-fun m!498623 () Bool)

(assert (=> b!517160 m!498623))

(declare-fun m!498625 () Bool)

(assert (=> start!46848 m!498625))

(declare-fun m!498627 () Bool)

(assert (=> start!46848 m!498627))

(declare-fun m!498629 () Bool)

(assert (=> b!517163 m!498629))

(declare-fun m!498631 () Bool)

(assert (=> b!517156 m!498631))

(declare-fun m!498633 () Bool)

(assert (=> b!517158 m!498633))

(assert (=> b!517158 m!498633))

(declare-fun m!498635 () Bool)

(assert (=> b!517158 m!498635))

(assert (=> b!517166 m!498633))

(assert (=> b!517166 m!498633))

(declare-fun m!498637 () Bool)

(assert (=> b!517166 m!498637))

(declare-fun m!498639 () Bool)

(assert (=> b!517159 m!498639))

(assert (=> b!517159 m!498633))

(declare-fun m!498641 () Bool)

(assert (=> b!517164 m!498641))

(declare-fun m!498643 () Bool)

(assert (=> b!517164 m!498643))

(declare-fun m!498645 () Bool)

(assert (=> b!517164 m!498645))

(assert (=> b!517164 m!498633))

(declare-fun m!498647 () Bool)

(assert (=> b!517164 m!498647))

(assert (=> b!517164 m!498633))

(declare-fun m!498649 () Bool)

(assert (=> b!517164 m!498649))

(assert (=> b!517164 m!498633))

(declare-fun m!498651 () Bool)

(assert (=> b!517164 m!498651))

(assert (=> b!517164 m!498645))

(declare-fun m!498653 () Bool)

(assert (=> b!517164 m!498653))

(assert (=> b!517164 m!498645))

(declare-fun m!498655 () Bool)

(assert (=> b!517164 m!498655))

(declare-fun m!498657 () Bool)

(assert (=> b!517157 m!498657))

(push 1)

(assert (not b!517156))

(assert (not b!517163))

(assert (not b!517161))

(assert (not b!517164))

(assert (not b!517160))

(assert (not b!517158))

(assert (not b!517157))

(assert (not start!46848))

(assert (not b!517166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!517284 () Bool)

(declare-fun e!301847 () SeekEntryResult!4385)

(declare-fun e!301848 () SeekEntryResult!4385)

(assert (=> b!517284 (= e!301847 e!301848)))

(declare-fun lt!236798 () (_ BitVec 64))

(declare-fun lt!236799 () SeekEntryResult!4385)

(assert (=> b!517284 (= lt!236798 (select (arr!15918 a!3235) (index!19730 lt!236799)))))

(declare-fun c!60619 () Bool)

(assert (=> b!517284 (= c!60619 (= lt!236798 (select (arr!15918 a!3235) j!176)))))

(declare-fun b!517285 () Bool)

(declare-fun e!301846 () SeekEntryResult!4385)

(assert (=> b!517285 (= e!301846 (MissingZero!4385 (index!19730 lt!236799)))))

(declare-fun b!517286 () Bool)

(declare-fun c!60618 () Bool)

(assert (=> b!517286 (= c!60618 (= lt!236798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517286 (= e!301848 e!301846)))

(declare-fun b!517287 () Bool)

(assert (=> b!517287 (= e!301848 (Found!4385 (index!19730 lt!236799)))))

(declare-fun b!517288 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4385)

(assert (=> b!517288 (= e!301846 (seekKeyOrZeroReturnVacant!0 (x!48690 lt!236799) (index!19730 lt!236799) (index!19730 lt!236799) (select (arr!15918 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517289 () Bool)

(assert (=> b!517289 (= e!301847 Undefined!4385)))

(declare-fun d!79671 () Bool)

(declare-fun lt!236797 () SeekEntryResult!4385)

(assert (=> d!79671 (and (or (is-Undefined!4385 lt!236797) (not (is-Found!4385 lt!236797)) (and (bvsge (index!19729 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19729 lt!236797) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236797) (is-Found!4385 lt!236797) (not (is-MissingZero!4385 lt!236797)) (and (bvsge (index!19728 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19728 lt!236797) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236797) (is-Found!4385 lt!236797) (is-MissingZero!4385 lt!236797) (not (is-MissingVacant!4385 lt!236797)) (and (bvsge (index!19731 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19731 lt!236797) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236797) (ite (is-Found!4385 lt!236797) (= (select (arr!15918 a!3235) (index!19729 lt!236797)) (select (arr!15918 a!3235) j!176)) (ite (is-MissingZero!4385 lt!236797) (= (select (arr!15918 a!3235) (index!19728 lt!236797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4385 lt!236797) (= (select (arr!15918 a!3235) (index!19731 lt!236797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79671 (= lt!236797 e!301847)))

(declare-fun c!60620 () Bool)

(assert (=> d!79671 (= c!60620 (and (is-Intermediate!4385 lt!236799) (undefined!5197 lt!236799)))))

(assert (=> d!79671 (= lt!236799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15918 a!3235) j!176) mask!3524) (select (arr!15918 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79671 (validMask!0 mask!3524)))

(assert (=> d!79671 (= (seekEntryOrOpen!0 (select (arr!15918 a!3235) j!176) a!3235 mask!3524) lt!236797)))

(assert (= (and d!79671 c!60620) b!517289))

(assert (= (and d!79671 (not c!60620)) b!517284))

(assert (= (and b!517284 c!60619) b!517287))

(assert (= (and b!517284 (not c!60619)) b!517286))

(assert (= (and b!517286 c!60618) b!517285))

(assert (= (and b!517286 (not c!60618)) b!517288))

(declare-fun m!498751 () Bool)

(assert (=> b!517284 m!498751))

(assert (=> b!517288 m!498633))

(declare-fun m!498753 () Bool)

(assert (=> b!517288 m!498753))

(assert (=> d!79671 m!498625))

(declare-fun m!498755 () Bool)

(assert (=> d!79671 m!498755))

(assert (=> d!79671 m!498649))

(assert (=> d!79671 m!498633))

(declare-fun m!498757 () Bool)

(assert (=> d!79671 m!498757))

(declare-fun m!498759 () Bool)

(assert (=> d!79671 m!498759))

(assert (=> d!79671 m!498633))

(assert (=> d!79671 m!498649))

(declare-fun m!498761 () Bool)

(assert (=> d!79671 m!498761))

(assert (=> b!517166 d!79671))

(declare-fun d!79679 () Bool)

(assert (=> d!79679 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46848 d!79679))

(declare-fun d!79691 () Bool)

(assert (=> d!79691 (= (array_inv!11714 a!3235) (bvsge (size!16282 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46848 d!79691))

(declare-fun b!517299 () Bool)

(declare-fun e!301855 () SeekEntryResult!4385)

(declare-fun e!301856 () SeekEntryResult!4385)

(assert (=> b!517299 (= e!301855 e!301856)))

(declare-fun lt!236812 () (_ BitVec 64))

(declare-fun lt!236813 () SeekEntryResult!4385)

(assert (=> b!517299 (= lt!236812 (select (arr!15918 a!3235) (index!19730 lt!236813)))))

(declare-fun c!60625 () Bool)

(assert (=> b!517299 (= c!60625 (= lt!236812 k!2280))))

(declare-fun b!517300 () Bool)

(declare-fun e!301854 () SeekEntryResult!4385)

(assert (=> b!517300 (= e!301854 (MissingZero!4385 (index!19730 lt!236813)))))

(declare-fun b!517301 () Bool)

(declare-fun c!60624 () Bool)

(assert (=> b!517301 (= c!60624 (= lt!236812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517301 (= e!301856 e!301854)))

(declare-fun b!517302 () Bool)

(assert (=> b!517302 (= e!301856 (Found!4385 (index!19730 lt!236813)))))

(declare-fun b!517303 () Bool)

(assert (=> b!517303 (= e!301854 (seekKeyOrZeroReturnVacant!0 (x!48690 lt!236813) (index!19730 lt!236813) (index!19730 lt!236813) k!2280 a!3235 mask!3524))))

(declare-fun b!517304 () Bool)

(assert (=> b!517304 (= e!301855 Undefined!4385)))

(declare-fun d!79693 () Bool)

(declare-fun lt!236811 () SeekEntryResult!4385)

(assert (=> d!79693 (and (or (is-Undefined!4385 lt!236811) (not (is-Found!4385 lt!236811)) (and (bvsge (index!19729 lt!236811) #b00000000000000000000000000000000) (bvslt (index!19729 lt!236811) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236811) (is-Found!4385 lt!236811) (not (is-MissingZero!4385 lt!236811)) (and (bvsge (index!19728 lt!236811) #b00000000000000000000000000000000) (bvslt (index!19728 lt!236811) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236811) (is-Found!4385 lt!236811) (is-MissingZero!4385 lt!236811) (not (is-MissingVacant!4385 lt!236811)) (and (bvsge (index!19731 lt!236811) #b00000000000000000000000000000000) (bvslt (index!19731 lt!236811) (size!16282 a!3235)))) (or (is-Undefined!4385 lt!236811) (ite (is-Found!4385 lt!236811) (= (select (arr!15918 a!3235) (index!19729 lt!236811)) k!2280) (ite (is-MissingZero!4385 lt!236811) (= (select (arr!15918 a!3235) (index!19728 lt!236811)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4385 lt!236811) (= (select (arr!15918 a!3235) (index!19731 lt!236811)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79693 (= lt!236811 e!301855)))

(declare-fun c!60626 () Bool)

(assert (=> d!79693 (= c!60626 (and (is-Intermediate!4385 lt!236813) (undefined!5197 lt!236813)))))

(assert (=> d!79693 (= lt!236813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79693 (validMask!0 mask!3524)))

(assert (=> d!79693 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!236811)))

(assert (= (and d!79693 c!60626) b!517304))

(assert (= (and d!79693 (not c!60626)) b!517299))

(assert (= (and b!517299 c!60625) b!517302))

(assert (= (and b!517299 (not c!60625)) b!517301))

(assert (= (and b!517301 c!60624) b!517300))

(assert (= (and b!517301 (not c!60624)) b!517303))

(declare-fun m!498771 () Bool)

(assert (=> b!517299 m!498771))

(declare-fun m!498773 () Bool)

(assert (=> b!517303 m!498773))

(assert (=> d!79693 m!498625))

(declare-fun m!498775 () Bool)

(assert (=> d!79693 m!498775))

(declare-fun m!498777 () Bool)

(assert (=> d!79693 m!498777))

(declare-fun m!498779 () Bool)

(assert (=> d!79693 m!498779))

(declare-fun m!498781 () Bool)

(assert (=> d!79693 m!498781))

(assert (=> d!79693 m!498777))

(declare-fun m!498783 () Bool)

(assert (=> d!79693 m!498783))

(assert (=> b!517161 d!79693))

(declare-fun b!517315 () Bool)

(declare-fun e!301866 () Bool)

(declare-fun contains!2743 (List!10076 (_ BitVec 64)) Bool)

(assert (=> b!517315 (= e!301866 (contains!2743 Nil!10073 (select (arr!15918 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517316 () Bool)

(declare-fun e!301865 () Bool)

(declare-fun call!31667 () Bool)

(assert (=> b!517316 (= e!301865 call!31667)))

(declare-fun b!517317 () Bool)

(declare-fun e!301867 () Bool)

(declare-fun e!301868 () Bool)

(assert (=> b!517317 (= e!301867 e!301868)))

(declare-fun res!316641 () Bool)

(assert (=> b!517317 (=> (not res!316641) (not e!301868))))

(assert (=> b!517317 (= res!316641 (not e!301866))))

(declare-fun res!316639 () Bool)

(assert (=> b!517317 (=> (not res!316639) (not e!301866))))

(assert (=> b!517317 (= res!316639 (validKeyInArray!0 (select (arr!15918 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79695 () Bool)

(declare-fun res!316640 () Bool)

(assert (=> d!79695 (=> res!316640 e!301867)))

(assert (=> d!79695 (= res!316640 (bvsge #b00000000000000000000000000000000 (size!16282 a!3235)))))

(assert (=> d!79695 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10073) e!301867)))

(declare-fun bm!31664 () Bool)

(declare-fun c!60629 () Bool)

(assert (=> bm!31664 (= call!31667 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60629 (Cons!10072 (select (arr!15918 a!3235) #b00000000000000000000000000000000) Nil!10073) Nil!10073)))))

(declare-fun b!517318 () Bool)

(assert (=> b!517318 (= e!301865 call!31667)))

(declare-fun b!517319 () Bool)

(assert (=> b!517319 (= e!301868 e!301865)))

(assert (=> b!517319 (= c!60629 (validKeyInArray!0 (select (arr!15918 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79695 (not res!316640)) b!517317))

(assert (= (and b!517317 res!316639) b!517315))

(assert (= (and b!517317 res!316641) b!517319))

(assert (= (and b!517319 c!60629) b!517316))

(assert (= (and b!517319 (not c!60629)) b!517318))

(assert (= (or b!517316 b!517318) bm!31664))

(declare-fun m!498785 () Bool)

(assert (=> b!517315 m!498785))

(assert (=> b!517315 m!498785))

(declare-fun m!498787 () Bool)

(assert (=> b!517315 m!498787))

(assert (=> b!517317 m!498785))

(assert (=> b!517317 m!498785))

(declare-fun m!498789 () Bool)

(assert (=> b!517317 m!498789))

(assert (=> bm!31664 m!498785))

(declare-fun m!498791 () Bool)

(assert (=> bm!31664 m!498791))

(assert (=> b!517319 m!498785))

(assert (=> b!517319 m!498785))

(assert (=> b!517319 m!498789))

(assert (=> b!517160 d!79695))

(declare-fun bm!31671 () Bool)

(declare-fun call!31674 () Bool)

(assert (=> bm!31671 (= call!31674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517347 () Bool)

(declare-fun e!301890 () Bool)

(assert (=> b!517347 (= e!301890 call!31674)))

(declare-fun b!517348 () Bool)

(declare-fun e!301891 () Bool)

(assert (=> b!517348 (= e!301891 e!301890)))

(declare-fun lt!236823 () (_ BitVec 64))

(assert (=> b!517348 (= lt!236823 (select (arr!15918 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236824 () Unit!16028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33103 (_ BitVec 64) (_ BitVec 32)) Unit!16028)

(assert (=> b!517348 (= lt!236824 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236823 #b00000000000000000000000000000000))))

(assert (=> b!517348 (arrayContainsKey!0 a!3235 lt!236823 #b00000000000000000000000000000000)))

(declare-fun lt!236825 () Unit!16028)

(assert (=> b!517348 (= lt!236825 lt!236824)))

(declare-fun res!316658 () Bool)

(assert (=> b!517348 (= res!316658 (= (seekEntryOrOpen!0 (select (arr!15918 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4385 #b00000000000000000000000000000000)))))

(assert (=> b!517348 (=> (not res!316658) (not e!301890))))

(declare-fun d!79705 () Bool)

(declare-fun res!316657 () Bool)

(declare-fun e!301892 () Bool)

(assert (=> d!79705 (=> res!316657 e!301892)))

(assert (=> d!79705 (= res!316657 (bvsge #b00000000000000000000000000000000 (size!16282 a!3235)))))

(assert (=> d!79705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301892)))

(declare-fun b!517349 () Bool)

(assert (=> b!517349 (= e!301891 call!31674)))

(declare-fun b!517350 () Bool)

(assert (=> b!517350 (= e!301892 e!301891)))

(declare-fun c!60636 () Bool)

(assert (=> b!517350 (= c!60636 (validKeyInArray!0 (select (arr!15918 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79705 (not res!316657)) b!517350))

(assert (= (and b!517350 c!60636) b!517348))

(assert (= (and b!517350 (not c!60636)) b!517349))

(assert (= (and b!517348 res!316658) b!517347))

(assert (= (or b!517347 b!517349) bm!31671))

(declare-fun m!498809 () Bool)

(assert (=> bm!31671 m!498809))

(assert (=> b!517348 m!498785))

(declare-fun m!498811 () Bool)

(assert (=> b!517348 m!498811))

(declare-fun m!498813 () Bool)

(assert (=> b!517348 m!498813))

(assert (=> b!517348 m!498785))

(declare-fun m!498815 () Bool)

(assert (=> b!517348 m!498815))

(assert (=> b!517350 m!498785))

(assert (=> b!517350 m!498785))

(assert (=> b!517350 m!498789))

(assert (=> b!517157 d!79705))

(declare-fun d!79713 () Bool)

(declare-fun res!316663 () Bool)

(declare-fun e!301903 () Bool)

(assert (=> d!79713 (=> res!316663 e!301903)))

(assert (=> d!79713 (= res!316663 (= (select (arr!15918 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79713 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!301903)))

(declare-fun b!517367 () Bool)

(declare-fun e!301904 () Bool)

(assert (=> b!517367 (= e!301903 e!301904)))

(declare-fun res!316664 () Bool)

(assert (=> b!517367 (=> (not res!316664) (not e!301904))))

(assert (=> b!517367 (= res!316664 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16282 a!3235)))))

(declare-fun b!517368 () Bool)

(assert (=> b!517368 (= e!301904 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79713 (not res!316663)) b!517367))

(assert (= (and b!517367 res!316664) b!517368))

(assert (=> d!79713 m!498785))

(declare-fun m!498817 () Bool)

(assert (=> b!517368 m!498817))

(assert (=> b!517156 d!79713))

(declare-fun d!79715 () Bool)

(assert (=> d!79715 (= (validKeyInArray!0 (select (arr!15918 a!3235) j!176)) (and (not (= (select (arr!15918 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15918 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517158 d!79715))

(declare-fun d!79717 () Bool)

(assert (=> d!79717 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517163 d!79717))

(declare-fun b!517447 () Bool)

(declare-fun e!301958 () SeekEntryResult!4385)

(declare-fun e!301955 () SeekEntryResult!4385)

(assert (=> b!517447 (= e!301958 e!301955)))

(declare-fun lt!236863 () (_ BitVec 64))

(declare-fun c!60671 () Bool)

(assert (=> b!517447 (= c!60671 (or (= lt!236863 (select (arr!15918 a!3235) j!176)) (= (bvadd lt!236863 lt!236863) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517448 () Bool)

(declare-fun e!301954 () Bool)

(declare-fun lt!236864 () SeekEntryResult!4385)

(assert (=> b!517448 (= e!301954 (bvsge (x!48690 lt!236864) #b01111111111111111111111111111110))))

(declare-fun b!517449 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517449 (= e!301955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236741 #b00000000000000000000000000000000 mask!3524) (select (arr!15918 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79719 () Bool)

(assert (=> d!79719 e!301954))

(declare-fun c!60672 () Bool)

(assert (=> d!79719 (= c!60672 (and (is-Intermediate!4385 lt!236864) (undefined!5197 lt!236864)))))

(assert (=> d!79719 (= lt!236864 e!301958)))

(declare-fun c!60670 () Bool)

(assert (=> d!79719 (= c!60670 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79719 (= lt!236863 (select (arr!15918 a!3235) lt!236741))))

(assert (=> d!79719 (validMask!0 mask!3524)))

(assert (=> d!79719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236741 (select (arr!15918 a!3235) j!176) a!3235 mask!3524) lt!236864)))

(declare-fun b!517450 () Bool)

(declare-fun e!301957 () Bool)

(assert (=> b!517450 (= e!301954 e!301957)))

(declare-fun res!316689 () Bool)

(assert (=> b!517450 (= res!316689 (and (is-Intermediate!4385 lt!236864) (not (undefined!5197 lt!236864)) (bvslt (x!48690 lt!236864) #b01111111111111111111111111111110) (bvsge (x!48690 lt!236864) #b00000000000000000000000000000000) (bvsge (x!48690 lt!236864) #b00000000000000000000000000000000)))))

(assert (=> b!517450 (=> (not res!316689) (not e!301957))))

(declare-fun b!517451 () Bool)

(assert (=> b!517451 (and (bvsge (index!19730 lt!236864) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236864) (size!16282 a!3235)))))

(declare-fun res!316691 () Bool)

(assert (=> b!517451 (= res!316691 (= (select (arr!15918 a!3235) (index!19730 lt!236864)) (select (arr!15918 a!3235) j!176)))))

(declare-fun e!301956 () Bool)

(assert (=> b!517451 (=> res!316691 e!301956)))

(assert (=> b!517451 (= e!301957 e!301956)))

(declare-fun b!517452 () Bool)

(assert (=> b!517452 (and (bvsge (index!19730 lt!236864) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236864) (size!16282 a!3235)))))

(assert (=> b!517452 (= e!301956 (= (select (arr!15918 a!3235) (index!19730 lt!236864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517453 () Bool)

(assert (=> b!517453 (= e!301958 (Intermediate!4385 true lt!236741 #b00000000000000000000000000000000))))

(declare-fun b!517454 () Bool)

(assert (=> b!517454 (and (bvsge (index!19730 lt!236864) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236864) (size!16282 a!3235)))))

(declare-fun res!316690 () Bool)

(assert (=> b!517454 (= res!316690 (= (select (arr!15918 a!3235) (index!19730 lt!236864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517454 (=> res!316690 e!301956)))

(declare-fun b!517455 () Bool)

(assert (=> b!517455 (= e!301955 (Intermediate!4385 false lt!236741 #b00000000000000000000000000000000))))

(assert (= (and d!79719 c!60670) b!517453))

(assert (= (and d!79719 (not c!60670)) b!517447))

(assert (= (and b!517447 c!60671) b!517455))

(assert (= (and b!517447 (not c!60671)) b!517449))

(assert (= (and d!79719 c!60672) b!517448))

(assert (= (and d!79719 (not c!60672)) b!517450))

(assert (= (and b!517450 res!316689) b!517451))

(assert (= (and b!517451 (not res!316691)) b!517454))

(assert (= (and b!517454 (not res!316690)) b!517452))

(declare-fun m!498887 () Bool)

(assert (=> b!517454 m!498887))

(declare-fun m!498889 () Bool)

(assert (=> d!79719 m!498889))

(assert (=> d!79719 m!498625))

(assert (=> b!517451 m!498887))

(assert (=> b!517452 m!498887))

(declare-fun m!498891 () Bool)

(assert (=> b!517449 m!498891))

(assert (=> b!517449 m!498891))

(assert (=> b!517449 m!498633))

(declare-fun m!498893 () Bool)

(assert (=> b!517449 m!498893))

(assert (=> b!517164 d!79719))

(declare-fun d!79737 () Bool)

(declare-fun lt!236870 () (_ BitVec 32))

(declare-fun lt!236869 () (_ BitVec 32))

(assert (=> d!79737 (= lt!236870 (bvmul (bvxor lt!236869 (bvlshr lt!236869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79737 (= lt!236869 ((_ extract 31 0) (bvand (bvxor (select (arr!15918 a!3235) j!176) (bvlshr (select (arr!15918 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79737 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316698 (let ((h!10977 ((_ extract 31 0) (bvand (bvxor (select (arr!15918 a!3235) j!176) (bvlshr (select (arr!15918 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48696 (bvmul (bvxor h!10977 (bvlshr h!10977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48696 (bvlshr x!48696 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316698 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316698 #b00000000000000000000000000000000))))))

(assert (=> d!79737 (= (toIndex!0 (select (arr!15918 a!3235) j!176) mask!3524) (bvand (bvxor lt!236870 (bvlshr lt!236870 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517164 d!79737))

(declare-fun b!517471 () Bool)

(declare-fun e!301975 () SeekEntryResult!4385)

(declare-fun e!301972 () SeekEntryResult!4385)

(assert (=> b!517471 (= e!301975 e!301972)))

(declare-fun c!60677 () Bool)

(declare-fun lt!236871 () (_ BitVec 64))

(assert (=> b!517471 (= c!60677 (or (= lt!236871 (select (store (arr!15918 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!236871 lt!236871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517472 () Bool)

(declare-fun e!301971 () Bool)

(declare-fun lt!236872 () SeekEntryResult!4385)

(assert (=> b!517472 (= e!301971 (bvsge (x!48690 lt!236872) #b01111111111111111111111111111110))))

(declare-fun b!517473 () Bool)

(assert (=> b!517473 (= e!301972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236743 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)) mask!3524))))

(declare-fun d!79741 () Bool)

(assert (=> d!79741 e!301971))

(declare-fun c!60678 () Bool)

(assert (=> d!79741 (= c!60678 (and (is-Intermediate!4385 lt!236872) (undefined!5197 lt!236872)))))

(assert (=> d!79741 (= lt!236872 e!301975)))

(declare-fun c!60676 () Bool)

(assert (=> d!79741 (= c!60676 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79741 (= lt!236871 (select (arr!15918 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235))) lt!236743))))

(assert (=> d!79741 (validMask!0 mask!3524)))

(assert (=> d!79741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236743 (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)) mask!3524) lt!236872)))

(declare-fun b!517474 () Bool)

(declare-fun e!301974 () Bool)

(assert (=> b!517474 (= e!301971 e!301974)))

(declare-fun res!316703 () Bool)

(assert (=> b!517474 (= res!316703 (and (is-Intermediate!4385 lt!236872) (not (undefined!5197 lt!236872)) (bvslt (x!48690 lt!236872) #b01111111111111111111111111111110) (bvsge (x!48690 lt!236872) #b00000000000000000000000000000000) (bvsge (x!48690 lt!236872) #b00000000000000000000000000000000)))))

(assert (=> b!517474 (=> (not res!316703) (not e!301974))))

(declare-fun b!517475 () Bool)

(assert (=> b!517475 (and (bvsge (index!19730 lt!236872) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236872) (size!16282 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)))))))

(declare-fun res!316705 () Bool)

(assert (=> b!517475 (= res!316705 (= (select (arr!15918 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235))) (index!19730 lt!236872)) (select (store (arr!15918 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!301973 () Bool)

(assert (=> b!517475 (=> res!316705 e!301973)))

(assert (=> b!517475 (= e!301974 e!301973)))

(declare-fun b!517476 () Bool)

(assert (=> b!517476 (and (bvsge (index!19730 lt!236872) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236872) (size!16282 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)))))))

(assert (=> b!517476 (= e!301973 (= (select (arr!15918 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235))) (index!19730 lt!236872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517477 () Bool)

(assert (=> b!517477 (= e!301975 (Intermediate!4385 true lt!236743 #b00000000000000000000000000000000))))

(declare-fun b!517478 () Bool)

(assert (=> b!517478 (and (bvsge (index!19730 lt!236872) #b00000000000000000000000000000000) (bvslt (index!19730 lt!236872) (size!16282 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235)))))))

(declare-fun res!316704 () Bool)

(assert (=> b!517478 (= res!316704 (= (select (arr!15918 (array!33104 (store (arr!15918 a!3235) i!1204 k!2280) (size!16282 a!3235))) (index!19730 lt!236872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517478 (=> res!316704 e!301973)))

(declare-fun b!517479 () Bool)

(assert (=> b!517479 (= e!301972 (Intermediate!4385 false lt!236743 #b00000000000000000000000000000000))))

(assert (= (and d!79741 c!60676) b!517477))

(assert (= (and d!79741 (not c!60676)) b!517471))

(assert (= (and b!517471 c!60677) b!517479))

(assert (= (and b!517471 (not c!60677)) b!517473))

(assert (= (and d!79741 c!60678) b!517472))

(assert (= (and d!79741 (not c!60678)) b!517474))

(assert (= (and b!517474 res!316703) b!517475))

(assert (= (and b!517475 (not res!316705)) b!517478))

(assert (= (and b!517478 (not res!316704)) b!517476))

(declare-fun m!498899 () Bool)

(assert (=> b!517478 m!498899))

(declare-fun m!498901 () Bool)

(assert (=> d!79741 m!498901))

(assert (=> d!79741 m!498625))

(assert (=> b!517475 m!498899))

(assert (=> b!517476 m!498899))

(declare-fun m!498903 () Bool)

(assert (=> b!517473 m!498903))

(assert (=> b!517473 m!498903))

(assert (=> b!517473 m!498645))

(declare-fun m!498905 () Bool)

(assert (=> b!517473 m!498905))

(assert (=> b!517164 d!79741))

(declare-fun bm!31678 () Bool)

(declare-fun call!31681 () Bool)

(assert (=> bm!31678 (= call!31681 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517480 () Bool)

(declare-fun e!301976 () Bool)

(assert (=> b!517480 (= e!301976 call!31681)))

(declare-fun b!517481 () Bool)

(declare-fun e!301977 () Bool)

(assert (=> b!517481 (= e!301977 e!301976)))

(declare-fun lt!236873 () (_ BitVec 64))

(assert (=> b!517481 (= lt!236873 (select (arr!15918 a!3235) j!176))))

(declare-fun lt!236874 () Unit!16028)

(assert (=> b!517481 (= lt!236874 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236873 j!176))))

(assert (=> b!517481 (arrayContainsKey!0 a!3235 lt!236873 #b00000000000000000000000000000000)))

(declare-fun lt!236875 () Unit!16028)

(assert (=> b!517481 (= lt!236875 lt!236874)))

(declare-fun res!316707 () Bool)

(assert (=> b!517481 (= res!316707 (= (seekEntryOrOpen!0 (select (arr!15918 a!3235) j!176) a!3235 mask!3524) (Found!4385 j!176)))))

(assert (=> b!517481 (=> (not res!316707) (not e!301976))))

(declare-fun d!79743 () Bool)

(declare-fun res!316706 () Bool)

(declare-fun e!301978 () Bool)

(assert (=> d!79743 (=> res!316706 e!301978)))

(assert (=> d!79743 (= res!316706 (bvsge j!176 (size!16282 a!3235)))))

(assert (=> d!79743 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301978)))

(declare-fun b!517482 () Bool)

(assert (=> b!517482 (= e!301977 call!31681)))

(declare-fun b!517483 () Bool)

(assert (=> b!517483 (= e!301978 e!301977)))

(declare-fun c!60679 () Bool)

(assert (=> b!517483 (= c!60679 (validKeyInArray!0 (select (arr!15918 a!3235) j!176)))))

(assert (= (and d!79743 (not res!316706)) b!517483))

(assert (= (and b!517483 c!60679) b!517481))

(assert (= (and b!517483 (not c!60679)) b!517482))

(assert (= (and b!517481 res!316707) b!517480))

(assert (= (or b!517480 b!517482) bm!31678))

(declare-fun m!498907 () Bool)

(assert (=> bm!31678 m!498907))

(assert (=> b!517481 m!498633))

(declare-fun m!498909 () Bool)

(assert (=> b!517481 m!498909))

(declare-fun m!498911 () Bool)

(assert (=> b!517481 m!498911))

(assert (=> b!517481 m!498633))

(assert (=> b!517481 m!498637))

(assert (=> b!517483 m!498633))

(assert (=> b!517483 m!498633))

(assert (=> b!517483 m!498635))

(assert (=> b!517164 d!79743))

(declare-fun d!79745 () Bool)

(assert (=> d!79745 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236884 () Unit!16028)

(declare-fun choose!38 (array!33103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16028)

(assert (=> d!79745 (= lt!236884 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79745 (validMask!0 mask!3524)))

(assert (=> d!79745 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236884)))

(declare-fun bs!16337 () Bool)

(assert (= bs!16337 d!79745))

(assert (=> bs!16337 m!498651))

(declare-fun m!498913 () Bool)

(assert (=> bs!16337 m!498913))

(assert (=> bs!16337 m!498625))

(assert (=> b!517164 d!79745))

(declare-fun d!79749 () Bool)

(declare-fun lt!236886 () (_ BitVec 32))

(declare-fun lt!236885 () (_ BitVec 32))

(assert (=> d!79749 (= lt!236886 (bvmul (bvxor lt!236885 (bvlshr lt!236885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79749 (= lt!236885 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79749 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316698 (let ((h!10977 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48696 (bvmul (bvxor h!10977 (bvlshr h!10977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48696 (bvlshr x!48696 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316698 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316698 #b00000000000000000000000000000000))))))

(assert (=> d!79749 (= (toIndex!0 (select (store (arr!15918 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!236886 (bvlshr lt!236886 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517164 d!79749))

(push 1)

(assert (not b!517317))

(assert (not b!517315))

(assert (not b!517288))

(assert (not bm!31664))

(assert (not d!79719))

(assert (not b!517303))

(assert (not b!517368))

(assert (not b!517449))

(assert (not b!517481))

(assert (not bm!31671))

(assert (not b!517348))

(assert (not b!517473))

(assert (not d!79671))

(assert (not b!517319))

(assert (not b!517483))

(assert (not d!79741))

(assert (not b!517350))

(assert (not d!79745))

(assert (not bm!31678))

(assert (not d!79693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

