; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47360 () Bool)

(assert start!47360)

(declare-fun b!520677 () Bool)

(declare-fun res!318631 () Bool)

(declare-fun e!303829 () Bool)

(assert (=> b!520677 (=> res!318631 e!303829)))

(declare-datatypes ((SeekEntryResult!4372 0))(
  ( (MissingZero!4372 (index!19691 (_ BitVec 32))) (Found!4372 (index!19692 (_ BitVec 32))) (Intermediate!4372 (undefined!5184 Bool) (index!19693 (_ BitVec 32)) (x!48827 (_ BitVec 32))) (Undefined!4372) (MissingVacant!4372 (index!19694 (_ BitVec 32))) )
))
(declare-fun lt!238521 () SeekEntryResult!4372)

(get-info :version)

(assert (=> b!520677 (= res!318631 (or (undefined!5184 lt!238521) (not ((_ is Intermediate!4372) lt!238521))))))

(declare-fun b!520678 () Bool)

(declare-fun e!303825 () Bool)

(declare-fun e!303830 () Bool)

(assert (=> b!520678 (= e!303825 e!303830)))

(declare-fun res!318636 () Bool)

(assert (=> b!520678 (=> (not res!318636) (not e!303830))))

(declare-fun lt!238523 () SeekEntryResult!4372)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520678 (= res!318636 (or (= lt!238523 (MissingZero!4372 i!1204)) (= lt!238523 (MissingVacant!4372 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33187 0))(
  ( (array!33188 (arr!15949 (Array (_ BitVec 32) (_ BitVec 64))) (size!16313 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33187)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33187 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!520678 (= lt!238523 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520679 () Bool)

(declare-fun res!318629 () Bool)

(assert (=> b!520679 (=> (not res!318629) (not e!303825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520679 (= res!318629 (validKeyInArray!0 k0!2280))))

(declare-fun b!520680 () Bool)

(declare-datatypes ((Unit!16099 0))(
  ( (Unit!16100) )
))
(declare-fun e!303827 () Unit!16099)

(declare-fun Unit!16101 () Unit!16099)

(assert (=> b!520680 (= e!303827 Unit!16101)))

(declare-fun lt!238527 () (_ BitVec 32))

(declare-fun lt!238525 () Unit!16099)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16099)

(assert (=> b!520680 (= lt!238525 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238527 #b00000000000000000000000000000000 (index!19693 lt!238521) (x!48827 lt!238521) mask!3524))))

(declare-fun res!318633 () Bool)

(declare-fun lt!238524 () array!33187)

(declare-fun lt!238528 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33187 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!520680 (= res!318633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238527 lt!238528 lt!238524 mask!3524) (Intermediate!4372 false (index!19693 lt!238521) (x!48827 lt!238521))))))

(declare-fun e!303828 () Bool)

(assert (=> b!520680 (=> (not res!318633) (not e!303828))))

(assert (=> b!520680 e!303828))

(declare-fun b!520681 () Bool)

(assert (=> b!520681 (= e!303829 (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520681 (and (or (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238522 () Unit!16099)

(assert (=> b!520681 (= lt!238522 e!303827)))

(declare-fun c!61325 () Bool)

(assert (=> b!520681 (= c!61325 (= (select (arr!15949 a!3235) (index!19693 lt!238521)) (select (arr!15949 a!3235) j!176)))))

(assert (=> b!520681 (and (bvslt (x!48827 lt!238521) #b01111111111111111111111111111110) (or (= (select (arr!15949 a!3235) (index!19693 lt!238521)) (select (arr!15949 a!3235) j!176)) (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15949 a!3235) (index!19693 lt!238521)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520682 () Bool)

(declare-fun res!318635 () Bool)

(assert (=> b!520682 (=> (not res!318635) (not e!303830))))

(declare-datatypes ((List!10014 0))(
  ( (Nil!10011) (Cons!10010 (h!10932 (_ BitVec 64)) (t!16234 List!10014)) )
))
(declare-fun arrayNoDuplicates!0 (array!33187 (_ BitVec 32) List!10014) Bool)

(assert (=> b!520682 (= res!318635 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10011))))

(declare-fun b!520683 () Bool)

(declare-fun res!318638 () Bool)

(assert (=> b!520683 (=> (not res!318638) (not e!303830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33187 (_ BitVec 32)) Bool)

(assert (=> b!520683 (= res!318638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520684 () Bool)

(declare-fun Unit!16102 () Unit!16099)

(assert (=> b!520684 (= e!303827 Unit!16102)))

(declare-fun res!318640 () Bool)

(assert (=> start!47360 (=> (not res!318640) (not e!303825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47360 (= res!318640 (validMask!0 mask!3524))))

(assert (=> start!47360 e!303825))

(assert (=> start!47360 true))

(declare-fun array_inv!11808 (array!33187) Bool)

(assert (=> start!47360 (array_inv!11808 a!3235)))

(declare-fun b!520685 () Bool)

(assert (=> b!520685 (= e!303830 (not e!303829))))

(declare-fun res!318634 () Bool)

(assert (=> b!520685 (=> res!318634 e!303829)))

(declare-fun lt!238526 () (_ BitVec 32))

(assert (=> b!520685 (= res!318634 (= lt!238521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238526 lt!238528 lt!238524 mask!3524)))))

(assert (=> b!520685 (= lt!238521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238527 (select (arr!15949 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520685 (= lt!238526 (toIndex!0 lt!238528 mask!3524))))

(assert (=> b!520685 (= lt!238528 (select (store (arr!15949 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520685 (= lt!238527 (toIndex!0 (select (arr!15949 a!3235) j!176) mask!3524))))

(assert (=> b!520685 (= lt!238524 (array!33188 (store (arr!15949 a!3235) i!1204 k0!2280) (size!16313 a!3235)))))

(declare-fun e!303826 () Bool)

(assert (=> b!520685 e!303826))

(declare-fun res!318637 () Bool)

(assert (=> b!520685 (=> (not res!318637) (not e!303826))))

(assert (=> b!520685 (= res!318637 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238520 () Unit!16099)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16099)

(assert (=> b!520685 (= lt!238520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520686 () Bool)

(declare-fun res!318639 () Bool)

(assert (=> b!520686 (=> (not res!318639) (not e!303825))))

(assert (=> b!520686 (= res!318639 (and (= (size!16313 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16313 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16313 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520687 () Bool)

(declare-fun res!318630 () Bool)

(assert (=> b!520687 (=> (not res!318630) (not e!303825))))

(assert (=> b!520687 (= res!318630 (validKeyInArray!0 (select (arr!15949 a!3235) j!176)))))

(declare-fun b!520688 () Bool)

(assert (=> b!520688 (= e!303828 false)))

(declare-fun b!520689 () Bool)

(declare-fun res!318632 () Bool)

(assert (=> b!520689 (=> (not res!318632) (not e!303825))))

(declare-fun arrayContainsKey!0 (array!33187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520689 (= res!318632 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520690 () Bool)

(assert (=> b!520690 (= e!303826 (= (seekEntryOrOpen!0 (select (arr!15949 a!3235) j!176) a!3235 mask!3524) (Found!4372 j!176)))))

(assert (= (and start!47360 res!318640) b!520686))

(assert (= (and b!520686 res!318639) b!520687))

(assert (= (and b!520687 res!318630) b!520679))

(assert (= (and b!520679 res!318629) b!520689))

(assert (= (and b!520689 res!318632) b!520678))

(assert (= (and b!520678 res!318636) b!520683))

(assert (= (and b!520683 res!318638) b!520682))

(assert (= (and b!520682 res!318635) b!520685))

(assert (= (and b!520685 res!318637) b!520690))

(assert (= (and b!520685 (not res!318634)) b!520677))

(assert (= (and b!520677 (not res!318631)) b!520681))

(assert (= (and b!520681 c!61325) b!520680))

(assert (= (and b!520681 (not c!61325)) b!520684))

(assert (= (and b!520680 res!318633) b!520688))

(declare-fun m!501835 () Bool)

(assert (=> b!520685 m!501835))

(declare-fun m!501837 () Bool)

(assert (=> b!520685 m!501837))

(declare-fun m!501839 () Bool)

(assert (=> b!520685 m!501839))

(declare-fun m!501841 () Bool)

(assert (=> b!520685 m!501841))

(declare-fun m!501843 () Bool)

(assert (=> b!520685 m!501843))

(declare-fun m!501845 () Bool)

(assert (=> b!520685 m!501845))

(declare-fun m!501847 () Bool)

(assert (=> b!520685 m!501847))

(assert (=> b!520685 m!501845))

(declare-fun m!501849 () Bool)

(assert (=> b!520685 m!501849))

(assert (=> b!520685 m!501845))

(declare-fun m!501851 () Bool)

(assert (=> b!520685 m!501851))

(assert (=> b!520687 m!501845))

(assert (=> b!520687 m!501845))

(declare-fun m!501853 () Bool)

(assert (=> b!520687 m!501853))

(declare-fun m!501855 () Bool)

(assert (=> start!47360 m!501855))

(declare-fun m!501857 () Bool)

(assert (=> start!47360 m!501857))

(declare-fun m!501859 () Bool)

(assert (=> b!520678 m!501859))

(declare-fun m!501861 () Bool)

(assert (=> b!520680 m!501861))

(declare-fun m!501863 () Bool)

(assert (=> b!520680 m!501863))

(declare-fun m!501865 () Bool)

(assert (=> b!520683 m!501865))

(declare-fun m!501867 () Bool)

(assert (=> b!520689 m!501867))

(declare-fun m!501869 () Bool)

(assert (=> b!520682 m!501869))

(assert (=> b!520690 m!501845))

(assert (=> b!520690 m!501845))

(declare-fun m!501871 () Bool)

(assert (=> b!520690 m!501871))

(declare-fun m!501873 () Bool)

(assert (=> b!520679 m!501873))

(declare-fun m!501875 () Bool)

(assert (=> b!520681 m!501875))

(assert (=> b!520681 m!501845))

(check-sat (not b!520683) (not b!520689) (not b!520680) (not b!520678) (not start!47360) (not b!520685) (not b!520682) (not b!520690) (not b!520679) (not b!520687))
(check-sat)
