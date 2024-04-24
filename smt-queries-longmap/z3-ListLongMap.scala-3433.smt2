; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47708 () Bool)

(assert start!47708)

(declare-fun b!524817 () Bool)

(declare-fun res!321725 () Bool)

(declare-fun e!306042 () Bool)

(assert (=> b!524817 (=> (not res!321725) (not e!306042))))

(declare-datatypes ((array!33346 0))(
  ( (array!33347 (arr!16024 (Array (_ BitVec 32) (_ BitVec 64))) (size!16388 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33346)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524817 (= res!321725 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524818 () Bool)

(declare-fun res!321723 () Bool)

(assert (=> b!524818 (=> (not res!321723) (not e!306042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524818 (= res!321723 (validKeyInArray!0 k0!2280))))

(declare-fun res!321726 () Bool)

(assert (=> start!47708 (=> (not res!321726) (not e!306042))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47708 (= res!321726 (validMask!0 mask!3524))))

(assert (=> start!47708 e!306042))

(assert (=> start!47708 true))

(declare-fun array_inv!11883 (array!33346) Bool)

(assert (=> start!47708 (array_inv!11883 a!3235)))

(declare-fun b!524819 () Bool)

(declare-datatypes ((Unit!16399 0))(
  ( (Unit!16400) )
))
(declare-fun e!306044 () Unit!16399)

(declare-fun Unit!16401 () Unit!16399)

(assert (=> b!524819 (= e!306044 Unit!16401)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!306040 () Bool)

(declare-fun b!524820 () Bool)

(declare-datatypes ((SeekEntryResult!4447 0))(
  ( (MissingZero!4447 (index!20000 (_ BitVec 32))) (Found!4447 (index!20001 (_ BitVec 32))) (Intermediate!4447 (undefined!5259 Bool) (index!20002 (_ BitVec 32)) (x!49129 (_ BitVec 32))) (Undefined!4447) (MissingVacant!4447 (index!20003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33346 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!524820 (= e!306040 (= (seekEntryOrOpen!0 (select (arr!16024 a!3235) j!176) a!3235 mask!3524) (Found!4447 j!176)))))

(declare-fun b!524821 () Bool)

(declare-fun res!321724 () Bool)

(assert (=> b!524821 (=> (not res!321724) (not e!306042))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524821 (= res!321724 (and (= (size!16388 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16388 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16388 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524822 () Bool)

(declare-fun e!306043 () Bool)

(assert (=> b!524822 (= e!306043 true)))

(declare-fun lt!241008 () SeekEntryResult!4447)

(assert (=> b!524822 (= (index!20002 lt!241008) i!1204)))

(declare-fun lt!241012 () Unit!16399)

(declare-fun lt!241014 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33346 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!524822 (= lt!241012 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241014 #b00000000000000000000000000000000 (index!20002 lt!241008) (x!49129 lt!241008) mask!3524))))

(assert (=> b!524822 (and (or (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241009 () Unit!16399)

(assert (=> b!524822 (= lt!241009 e!306044)))

(declare-fun c!61856 () Bool)

(assert (=> b!524822 (= c!61856 (= (select (arr!16024 a!3235) (index!20002 lt!241008)) (select (arr!16024 a!3235) j!176)))))

(assert (=> b!524822 (and (bvslt (x!49129 lt!241008) #b01111111111111111111111111111110) (or (= (select (arr!16024 a!3235) (index!20002 lt!241008)) (select (arr!16024 a!3235) j!176)) (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16024 a!3235) (index!20002 lt!241008)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524823 () Bool)

(declare-fun e!306045 () Bool)

(assert (=> b!524823 (= e!306045 (not e!306043))))

(declare-fun res!321719 () Bool)

(assert (=> b!524823 (=> res!321719 e!306043)))

(declare-fun lt!241010 () array!33346)

(declare-fun lt!241006 () (_ BitVec 64))

(declare-fun lt!241007 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33346 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!524823 (= res!321719 (= lt!241008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241007 lt!241006 lt!241010 mask!3524)))))

(assert (=> b!524823 (= lt!241008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241014 (select (arr!16024 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524823 (= lt!241007 (toIndex!0 lt!241006 mask!3524))))

(assert (=> b!524823 (= lt!241006 (select (store (arr!16024 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524823 (= lt!241014 (toIndex!0 (select (arr!16024 a!3235) j!176) mask!3524))))

(assert (=> b!524823 (= lt!241010 (array!33347 (store (arr!16024 a!3235) i!1204 k0!2280) (size!16388 a!3235)))))

(assert (=> b!524823 e!306040))

(declare-fun res!321720 () Bool)

(assert (=> b!524823 (=> (not res!321720) (not e!306040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33346 (_ BitVec 32)) Bool)

(assert (=> b!524823 (= res!321720 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241015 () Unit!16399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!524823 (= lt!241015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524824 () Bool)

(declare-fun res!321716 () Bool)

(assert (=> b!524824 (=> (not res!321716) (not e!306045))))

(declare-datatypes ((List!10089 0))(
  ( (Nil!10086) (Cons!10085 (h!11016 (_ BitVec 64)) (t!16309 List!10089)) )
))
(declare-fun arrayNoDuplicates!0 (array!33346 (_ BitVec 32) List!10089) Bool)

(assert (=> b!524824 (= res!321716 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10086))))

(declare-fun b!524825 () Bool)

(declare-fun res!321727 () Bool)

(assert (=> b!524825 (=> (not res!321727) (not e!306042))))

(assert (=> b!524825 (= res!321727 (validKeyInArray!0 (select (arr!16024 a!3235) j!176)))))

(declare-fun b!524826 () Bool)

(declare-fun e!306041 () Bool)

(assert (=> b!524826 (= e!306041 false)))

(declare-fun b!524827 () Bool)

(declare-fun res!321722 () Bool)

(assert (=> b!524827 (=> (not res!321722) (not e!306045))))

(assert (=> b!524827 (= res!321722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524828 () Bool)

(assert (=> b!524828 (= e!306042 e!306045)))

(declare-fun res!321718 () Bool)

(assert (=> b!524828 (=> (not res!321718) (not e!306045))))

(declare-fun lt!241011 () SeekEntryResult!4447)

(assert (=> b!524828 (= res!321718 (or (= lt!241011 (MissingZero!4447 i!1204)) (= lt!241011 (MissingVacant!4447 i!1204))))))

(assert (=> b!524828 (= lt!241011 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524829 () Bool)

(declare-fun res!321721 () Bool)

(assert (=> b!524829 (=> res!321721 e!306043)))

(get-info :version)

(assert (=> b!524829 (= res!321721 (or (undefined!5259 lt!241008) (not ((_ is Intermediate!4447) lt!241008))))))

(declare-fun b!524830 () Bool)

(declare-fun Unit!16402 () Unit!16399)

(assert (=> b!524830 (= e!306044 Unit!16402)))

(declare-fun lt!241013 () Unit!16399)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33346 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16399)

(assert (=> b!524830 (= lt!241013 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241014 #b00000000000000000000000000000000 (index!20002 lt!241008) (x!49129 lt!241008) mask!3524))))

(declare-fun res!321717 () Bool)

(assert (=> b!524830 (= res!321717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241014 lt!241006 lt!241010 mask!3524) (Intermediate!4447 false (index!20002 lt!241008) (x!49129 lt!241008))))))

(assert (=> b!524830 (=> (not res!321717) (not e!306041))))

(assert (=> b!524830 e!306041))

(assert (= (and start!47708 res!321726) b!524821))

(assert (= (and b!524821 res!321724) b!524825))

(assert (= (and b!524825 res!321727) b!524818))

(assert (= (and b!524818 res!321723) b!524817))

(assert (= (and b!524817 res!321725) b!524828))

(assert (= (and b!524828 res!321718) b!524827))

(assert (= (and b!524827 res!321722) b!524824))

(assert (= (and b!524824 res!321716) b!524823))

(assert (= (and b!524823 res!321720) b!524820))

(assert (= (and b!524823 (not res!321719)) b!524829))

(assert (= (and b!524829 (not res!321721)) b!524822))

(assert (= (and b!524822 c!61856) b!524830))

(assert (= (and b!524822 (not c!61856)) b!524819))

(assert (= (and b!524830 res!321717) b!524826))

(declare-fun m!505693 () Bool)

(assert (=> b!524822 m!505693))

(declare-fun m!505695 () Bool)

(assert (=> b!524822 m!505695))

(declare-fun m!505697 () Bool)

(assert (=> b!524822 m!505697))

(declare-fun m!505699 () Bool)

(assert (=> start!47708 m!505699))

(declare-fun m!505701 () Bool)

(assert (=> start!47708 m!505701))

(declare-fun m!505703 () Bool)

(assert (=> b!524817 m!505703))

(assert (=> b!524825 m!505697))

(assert (=> b!524825 m!505697))

(declare-fun m!505705 () Bool)

(assert (=> b!524825 m!505705))

(declare-fun m!505707 () Bool)

(assert (=> b!524818 m!505707))

(declare-fun m!505709 () Bool)

(assert (=> b!524828 m!505709))

(declare-fun m!505711 () Bool)

(assert (=> b!524827 m!505711))

(declare-fun m!505713 () Bool)

(assert (=> b!524824 m!505713))

(assert (=> b!524820 m!505697))

(assert (=> b!524820 m!505697))

(declare-fun m!505715 () Bool)

(assert (=> b!524820 m!505715))

(declare-fun m!505717 () Bool)

(assert (=> b!524823 m!505717))

(declare-fun m!505719 () Bool)

(assert (=> b!524823 m!505719))

(declare-fun m!505721 () Bool)

(assert (=> b!524823 m!505721))

(declare-fun m!505723 () Bool)

(assert (=> b!524823 m!505723))

(assert (=> b!524823 m!505697))

(declare-fun m!505725 () Bool)

(assert (=> b!524823 m!505725))

(assert (=> b!524823 m!505697))

(declare-fun m!505727 () Bool)

(assert (=> b!524823 m!505727))

(assert (=> b!524823 m!505697))

(declare-fun m!505729 () Bool)

(assert (=> b!524823 m!505729))

(declare-fun m!505731 () Bool)

(assert (=> b!524823 m!505731))

(declare-fun m!505733 () Bool)

(assert (=> b!524830 m!505733))

(declare-fun m!505735 () Bool)

(assert (=> b!524830 m!505735))

(check-sat (not b!524830) (not b!524825) (not b!524827) (not b!524828) (not b!524824) (not start!47708) (not b!524823) (not b!524818) (not b!524822) (not b!524817) (not b!524820))
(check-sat)
