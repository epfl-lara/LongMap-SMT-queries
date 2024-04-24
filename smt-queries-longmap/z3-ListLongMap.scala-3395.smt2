; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46832 () Bool)

(assert start!46832)

(declare-fun b!516996 () Bool)

(declare-fun res!316439 () Bool)

(declare-fun e!301701 () Bool)

(assert (=> b!516996 (=> (not res!316439) (not e!301701))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33088 0))(
  ( (array!33089 (arr!15910 (Array (_ BitVec 32) (_ BitVec 64))) (size!16274 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33088)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516996 (= res!316439 (and (= (size!16274 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16274 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16274 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516997 () Bool)

(declare-fun res!316434 () Bool)

(assert (=> b!516997 (=> (not res!316434) (not e!301701))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516997 (= res!316434 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516998 () Bool)

(declare-fun res!316435 () Bool)

(declare-fun e!301700 () Bool)

(assert (=> b!516998 (=> res!316435 e!301700)))

(declare-datatypes ((SeekEntryResult!4333 0))(
  ( (MissingZero!4333 (index!19520 (_ BitVec 32))) (Found!4333 (index!19521 (_ BitVec 32))) (Intermediate!4333 (undefined!5145 Bool) (index!19522 (_ BitVec 32)) (x!48627 (_ BitVec 32))) (Undefined!4333) (MissingVacant!4333 (index!19523 (_ BitVec 32))) )
))
(declare-fun lt!236706 () SeekEntryResult!4333)

(get-info :version)

(assert (=> b!516998 (= res!316435 (or (undefined!5145 lt!236706) (not ((_ is Intermediate!4333) lt!236706))))))

(declare-fun b!516999 () Bool)

(assert (=> b!516999 (= e!301700 true)))

(assert (=> b!516999 (and (bvslt (x!48627 lt!236706) #b01111111111111111111111111111110) (or (= (select (arr!15910 a!3235) (index!19522 lt!236706)) (select (arr!15910 a!3235) j!176)) (= (select (arr!15910 a!3235) (index!19522 lt!236706)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15910 a!3235) (index!19522 lt!236706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517000 () Bool)

(declare-fun e!301699 () Bool)

(assert (=> b!517000 (= e!301699 (not e!301700))))

(declare-fun res!316436 () Bool)

(assert (=> b!517000 (=> res!316436 e!301700)))

(declare-fun lt!236710 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33088 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!517000 (= res!316436 (= lt!236706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236710 (select (store (arr!15910 a!3235) i!1204 k0!2280) j!176) (array!33089 (store (arr!15910 a!3235) i!1204 k0!2280) (size!16274 a!3235)) mask!3524)))))

(declare-fun lt!236707 () (_ BitVec 32))

(assert (=> b!517000 (= lt!236706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236707 (select (arr!15910 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517000 (= lt!236710 (toIndex!0 (select (store (arr!15910 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517000 (= lt!236707 (toIndex!0 (select (arr!15910 a!3235) j!176) mask!3524))))

(declare-fun e!301698 () Bool)

(assert (=> b!517000 e!301698))

(declare-fun res!316441 () Bool)

(assert (=> b!517000 (=> (not res!316441) (not e!301698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33088 (_ BitVec 32)) Bool)

(assert (=> b!517000 (= res!316441 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15985 0))(
  ( (Unit!15986) )
))
(declare-fun lt!236709 () Unit!15985)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15985)

(assert (=> b!517000 (= lt!236709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517001 () Bool)

(declare-fun res!316431 () Bool)

(assert (=> b!517001 (=> (not res!316431) (not e!301699))))

(declare-datatypes ((List!9975 0))(
  ( (Nil!9972) (Cons!9971 (h!10872 (_ BitVec 64)) (t!16195 List!9975)) )
))
(declare-fun arrayNoDuplicates!0 (array!33088 (_ BitVec 32) List!9975) Bool)

(assert (=> b!517001 (= res!316431 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9972))))

(declare-fun b!517002 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33088 (_ BitVec 32)) SeekEntryResult!4333)

(assert (=> b!517002 (= e!301698 (= (seekEntryOrOpen!0 (select (arr!15910 a!3235) j!176) a!3235 mask!3524) (Found!4333 j!176)))))

(declare-fun b!517003 () Bool)

(declare-fun res!316432 () Bool)

(assert (=> b!517003 (=> (not res!316432) (not e!301701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517003 (= res!316432 (validKeyInArray!0 k0!2280))))

(declare-fun b!517004 () Bool)

(declare-fun res!316437 () Bool)

(assert (=> b!517004 (=> (not res!316437) (not e!301699))))

(assert (=> b!517004 (= res!316437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!316440 () Bool)

(assert (=> start!46832 (=> (not res!316440) (not e!301701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46832 (= res!316440 (validMask!0 mask!3524))))

(assert (=> start!46832 e!301701))

(assert (=> start!46832 true))

(declare-fun array_inv!11769 (array!33088) Bool)

(assert (=> start!46832 (array_inv!11769 a!3235)))

(declare-fun b!517005 () Bool)

(declare-fun res!316433 () Bool)

(assert (=> b!517005 (=> (not res!316433) (not e!301701))))

(assert (=> b!517005 (= res!316433 (validKeyInArray!0 (select (arr!15910 a!3235) j!176)))))

(declare-fun b!517006 () Bool)

(assert (=> b!517006 (= e!301701 e!301699)))

(declare-fun res!316438 () Bool)

(assert (=> b!517006 (=> (not res!316438) (not e!301699))))

(declare-fun lt!236708 () SeekEntryResult!4333)

(assert (=> b!517006 (= res!316438 (or (= lt!236708 (MissingZero!4333 i!1204)) (= lt!236708 (MissingVacant!4333 i!1204))))))

(assert (=> b!517006 (= lt!236708 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46832 res!316440) b!516996))

(assert (= (and b!516996 res!316439) b!517005))

(assert (= (and b!517005 res!316433) b!517003))

(assert (= (and b!517003 res!316432) b!516997))

(assert (= (and b!516997 res!316434) b!517006))

(assert (= (and b!517006 res!316438) b!517004))

(assert (= (and b!517004 res!316437) b!517001))

(assert (= (and b!517001 res!316431) b!517000))

(assert (= (and b!517000 res!316441) b!517002))

(assert (= (and b!517000 (not res!316436)) b!516998))

(assert (= (and b!516998 (not res!316435)) b!516999))

(declare-fun m!498691 () Bool)

(assert (=> b!516999 m!498691))

(declare-fun m!498693 () Bool)

(assert (=> b!516999 m!498693))

(declare-fun m!498695 () Bool)

(assert (=> b!517004 m!498695))

(declare-fun m!498697 () Bool)

(assert (=> b!517006 m!498697))

(declare-fun m!498699 () Bool)

(assert (=> b!517003 m!498699))

(declare-fun m!498701 () Bool)

(assert (=> start!46832 m!498701))

(declare-fun m!498703 () Bool)

(assert (=> start!46832 m!498703))

(declare-fun m!498705 () Bool)

(assert (=> b!517001 m!498705))

(assert (=> b!517002 m!498693))

(assert (=> b!517002 m!498693))

(declare-fun m!498707 () Bool)

(assert (=> b!517002 m!498707))

(declare-fun m!498709 () Bool)

(assert (=> b!517000 m!498709))

(declare-fun m!498711 () Bool)

(assert (=> b!517000 m!498711))

(declare-fun m!498713 () Bool)

(assert (=> b!517000 m!498713))

(assert (=> b!517000 m!498713))

(declare-fun m!498715 () Bool)

(assert (=> b!517000 m!498715))

(assert (=> b!517000 m!498693))

(declare-fun m!498717 () Bool)

(assert (=> b!517000 m!498717))

(assert (=> b!517000 m!498693))

(assert (=> b!517000 m!498693))

(declare-fun m!498719 () Bool)

(assert (=> b!517000 m!498719))

(declare-fun m!498721 () Bool)

(assert (=> b!517000 m!498721))

(assert (=> b!517000 m!498713))

(declare-fun m!498723 () Bool)

(assert (=> b!517000 m!498723))

(assert (=> b!517005 m!498693))

(assert (=> b!517005 m!498693))

(declare-fun m!498725 () Bool)

(assert (=> b!517005 m!498725))

(declare-fun m!498727 () Bool)

(assert (=> b!516997 m!498727))

(check-sat (not b!517000) (not b!517002) (not b!517006) (not b!516997) (not b!517003) (not b!517004) (not b!517005) (not start!46832) (not b!517001))
(check-sat)
