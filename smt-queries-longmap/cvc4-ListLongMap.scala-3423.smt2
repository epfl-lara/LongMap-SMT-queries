; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47464 () Bool)

(assert start!47464)

(declare-fun b!522712 () Bool)

(declare-fun res!320337 () Bool)

(declare-fun e!304856 () Bool)

(assert (=> b!522712 (=> (not res!320337) (not e!304856))))

(declare-datatypes ((array!33290 0))(
  ( (array!33291 (arr!16001 (Array (_ BitVec 32) (_ BitVec 64))) (size!16365 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33290)

(declare-datatypes ((List!10159 0))(
  ( (Nil!10156) (Cons!10155 (h!11077 (_ BitVec 64)) (t!16387 List!10159)) )
))
(declare-fun arrayNoDuplicates!0 (array!33290 (_ BitVec 32) List!10159) Bool)

(assert (=> b!522712 (= res!320337 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10156))))

(declare-fun b!522713 () Bool)

(declare-fun e!304851 () Bool)

(declare-datatypes ((SeekEntryResult!4468 0))(
  ( (MissingZero!4468 (index!20075 (_ BitVec 32))) (Found!4468 (index!20076 (_ BitVec 32))) (Intermediate!4468 (undefined!5280 Bool) (index!20077 (_ BitVec 32)) (x!49046 (_ BitVec 32))) (Undefined!4468) (MissingVacant!4468 (index!20078 (_ BitVec 32))) )
))
(declare-fun lt!239784 () SeekEntryResult!4468)

(assert (=> b!522713 (= e!304851 (bvsle #b00000000000000000000000000000000 (x!49046 lt!239784)))))

(assert (=> b!522713 (and (or (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16324 0))(
  ( (Unit!16325) )
))
(declare-fun lt!239783 () Unit!16324)

(declare-fun e!304854 () Unit!16324)

(assert (=> b!522713 (= lt!239783 e!304854)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61493 () Bool)

(assert (=> b!522713 (= c!61493 (= (select (arr!16001 a!3235) (index!20077 lt!239784)) (select (arr!16001 a!3235) j!176)))))

(assert (=> b!522713 (and (bvslt (x!49046 lt!239784) #b01111111111111111111111111111110) (or (= (select (arr!16001 a!3235) (index!20077 lt!239784)) (select (arr!16001 a!3235) j!176)) (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16001 a!3235) (index!20077 lt!239784)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522714 () Bool)

(declare-fun res!320339 () Bool)

(declare-fun e!304857 () Bool)

(assert (=> b!522714 (=> (not res!320339) (not e!304857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522714 (= res!320339 (validKeyInArray!0 (select (arr!16001 a!3235) j!176)))))

(declare-fun b!522715 () Bool)

(declare-fun res!320338 () Bool)

(assert (=> b!522715 (=> (not res!320338) (not e!304857))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522715 (= res!320338 (and (= (size!16365 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16365 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16365 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522716 () Bool)

(assert (=> b!522716 (= e!304856 (not e!304851))))

(declare-fun res!320328 () Bool)

(assert (=> b!522716 (=> res!320328 e!304851)))

(declare-fun lt!239785 () array!33290)

(declare-fun lt!239782 () (_ BitVec 32))

(declare-fun lt!239781 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33290 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!522716 (= res!320328 (= lt!239784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239782 lt!239781 lt!239785 mask!3524)))))

(declare-fun lt!239779 () (_ BitVec 32))

(assert (=> b!522716 (= lt!239784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239779 (select (arr!16001 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522716 (= lt!239782 (toIndex!0 lt!239781 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!522716 (= lt!239781 (select (store (arr!16001 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522716 (= lt!239779 (toIndex!0 (select (arr!16001 a!3235) j!176) mask!3524))))

(assert (=> b!522716 (= lt!239785 (array!33291 (store (arr!16001 a!3235) i!1204 k!2280) (size!16365 a!3235)))))

(declare-fun e!304852 () Bool)

(assert (=> b!522716 e!304852))

(declare-fun res!320331 () Bool)

(assert (=> b!522716 (=> (not res!320331) (not e!304852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33290 (_ BitVec 32)) Bool)

(assert (=> b!522716 (= res!320331 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239780 () Unit!16324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16324)

(assert (=> b!522716 (= lt!239780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522717 () Bool)

(declare-fun Unit!16326 () Unit!16324)

(assert (=> b!522717 (= e!304854 Unit!16326)))

(declare-fun b!522718 () Bool)

(assert (=> b!522718 (= e!304857 e!304856)))

(declare-fun res!320332 () Bool)

(assert (=> b!522718 (=> (not res!320332) (not e!304856))))

(declare-fun lt!239778 () SeekEntryResult!4468)

(assert (=> b!522718 (= res!320332 (or (= lt!239778 (MissingZero!4468 i!1204)) (= lt!239778 (MissingVacant!4468 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33290 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!522718 (= lt!239778 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!320336 () Bool)

(assert (=> start!47464 (=> (not res!320336) (not e!304857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47464 (= res!320336 (validMask!0 mask!3524))))

(assert (=> start!47464 e!304857))

(assert (=> start!47464 true))

(declare-fun array_inv!11797 (array!33290) Bool)

(assert (=> start!47464 (array_inv!11797 a!3235)))

(declare-fun b!522719 () Bool)

(declare-fun res!320329 () Bool)

(assert (=> b!522719 (=> (not res!320329) (not e!304856))))

(assert (=> b!522719 (= res!320329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522720 () Bool)

(declare-fun res!320335 () Bool)

(assert (=> b!522720 (=> (not res!320335) (not e!304857))))

(declare-fun arrayContainsKey!0 (array!33290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522720 (= res!320335 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522721 () Bool)

(declare-fun res!320334 () Bool)

(assert (=> b!522721 (=> res!320334 e!304851)))

(assert (=> b!522721 (= res!320334 (or (undefined!5280 lt!239784) (not (is-Intermediate!4468 lt!239784))))))

(declare-fun b!522722 () Bool)

(declare-fun res!320333 () Bool)

(assert (=> b!522722 (=> (not res!320333) (not e!304857))))

(assert (=> b!522722 (= res!320333 (validKeyInArray!0 k!2280))))

(declare-fun b!522723 () Bool)

(declare-fun Unit!16327 () Unit!16324)

(assert (=> b!522723 (= e!304854 Unit!16327)))

(declare-fun lt!239777 () Unit!16324)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33290 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16324)

(assert (=> b!522723 (= lt!239777 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239779 #b00000000000000000000000000000000 (index!20077 lt!239784) (x!49046 lt!239784) mask!3524))))

(declare-fun res!320330 () Bool)

(assert (=> b!522723 (= res!320330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239779 lt!239781 lt!239785 mask!3524) (Intermediate!4468 false (index!20077 lt!239784) (x!49046 lt!239784))))))

(declare-fun e!304855 () Bool)

(assert (=> b!522723 (=> (not res!320330) (not e!304855))))

(assert (=> b!522723 e!304855))

(declare-fun b!522724 () Bool)

(assert (=> b!522724 (= e!304855 false)))

(declare-fun b!522725 () Bool)

(assert (=> b!522725 (= e!304852 (= (seekEntryOrOpen!0 (select (arr!16001 a!3235) j!176) a!3235 mask!3524) (Found!4468 j!176)))))

(assert (= (and start!47464 res!320336) b!522715))

(assert (= (and b!522715 res!320338) b!522714))

(assert (= (and b!522714 res!320339) b!522722))

(assert (= (and b!522722 res!320333) b!522720))

(assert (= (and b!522720 res!320335) b!522718))

(assert (= (and b!522718 res!320332) b!522719))

(assert (= (and b!522719 res!320329) b!522712))

(assert (= (and b!522712 res!320337) b!522716))

(assert (= (and b!522716 res!320331) b!522725))

(assert (= (and b!522716 (not res!320328)) b!522721))

(assert (= (and b!522721 (not res!320334)) b!522713))

(assert (= (and b!522713 c!61493) b!522723))

(assert (= (and b!522713 (not c!61493)) b!522717))

(assert (= (and b!522723 res!320330) b!522724))

(declare-fun m!503625 () Bool)

(assert (=> b!522720 m!503625))

(declare-fun m!503627 () Bool)

(assert (=> b!522723 m!503627))

(declare-fun m!503629 () Bool)

(assert (=> b!522723 m!503629))

(declare-fun m!503631 () Bool)

(assert (=> b!522713 m!503631))

(declare-fun m!503633 () Bool)

(assert (=> b!522713 m!503633))

(declare-fun m!503635 () Bool)

(assert (=> b!522719 m!503635))

(assert (=> b!522714 m!503633))

(assert (=> b!522714 m!503633))

(declare-fun m!503637 () Bool)

(assert (=> b!522714 m!503637))

(declare-fun m!503639 () Bool)

(assert (=> b!522712 m!503639))

(declare-fun m!503641 () Bool)

(assert (=> b!522716 m!503641))

(declare-fun m!503643 () Bool)

(assert (=> b!522716 m!503643))

(declare-fun m!503645 () Bool)

(assert (=> b!522716 m!503645))

(declare-fun m!503647 () Bool)

(assert (=> b!522716 m!503647))

(assert (=> b!522716 m!503633))

(declare-fun m!503649 () Bool)

(assert (=> b!522716 m!503649))

(assert (=> b!522716 m!503633))

(declare-fun m!503651 () Bool)

(assert (=> b!522716 m!503651))

(assert (=> b!522716 m!503633))

(declare-fun m!503653 () Bool)

(assert (=> b!522716 m!503653))

(declare-fun m!503655 () Bool)

(assert (=> b!522716 m!503655))

(declare-fun m!503657 () Bool)

(assert (=> b!522718 m!503657))

(declare-fun m!503659 () Bool)

(assert (=> start!47464 m!503659))

(declare-fun m!503661 () Bool)

(assert (=> start!47464 m!503661))

(assert (=> b!522725 m!503633))

(assert (=> b!522725 m!503633))

(declare-fun m!503663 () Bool)

(assert (=> b!522725 m!503663))

(declare-fun m!503665 () Bool)

(assert (=> b!522722 m!503665))

(push 1)

(assert (not b!522723))

(assert (not b!522714))

(assert (not b!522719))

(assert (not b!522722))

(assert (not b!522725))

(assert (not b!522718))

(assert (not b!522716))

(assert (not start!47464))

(assert (not b!522712))

(assert (not b!522720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!522774 () Bool)

(declare-fun e!304889 () Bool)

(declare-fun e!304890 () Bool)

(assert (=> b!522774 (= e!304889 e!304890)))

(declare-fun c!61512 () Bool)

(assert (=> b!522774 (= c!61512 (validKeyInArray!0 (select (arr!16001 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522775 () Bool)

(declare-fun call!31813 () Bool)

(assert (=> b!522775 (= e!304890 call!31813)))

(declare-fun b!522776 () Bool)

(declare-fun e!304888 () Bool)

(assert (=> b!522776 (= e!304890 e!304888)))

(declare-fun lt!239830 () (_ BitVec 64))

(assert (=> b!522776 (= lt!239830 (select (arr!16001 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!239829 () Unit!16324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33290 (_ BitVec 64) (_ BitVec 32)) Unit!16324)

(assert (=> b!522776 (= lt!239829 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239830 #b00000000000000000000000000000000))))

(assert (=> b!522776 (arrayContainsKey!0 a!3235 lt!239830 #b00000000000000000000000000000000)))

(declare-fun lt!239828 () Unit!16324)

(assert (=> b!522776 (= lt!239828 lt!239829)))

(declare-fun res!320354 () Bool)

(assert (=> b!522776 (= res!320354 (= (seekEntryOrOpen!0 (select (arr!16001 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4468 #b00000000000000000000000000000000)))))

(assert (=> b!522776 (=> (not res!320354) (not e!304888))))

(declare-fun d!80429 () Bool)

(declare-fun res!320355 () Bool)

(assert (=> d!80429 (=> res!320355 e!304889)))

(assert (=> d!80429 (= res!320355 (bvsge #b00000000000000000000000000000000 (size!16365 a!3235)))))

(assert (=> d!80429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!304889)))

(declare-fun bm!31810 () Bool)

(assert (=> bm!31810 (= call!31813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!522777 () Bool)

(assert (=> b!522777 (= e!304888 call!31813)))

(assert (= (and d!80429 (not res!320355)) b!522774))

(assert (= (and b!522774 c!61512) b!522776))

(assert (= (and b!522774 (not c!61512)) b!522775))

(assert (= (and b!522776 res!320354) b!522777))

(assert (= (or b!522777 b!522775) bm!31810))

(declare-fun m!503693 () Bool)

(assert (=> b!522774 m!503693))

(assert (=> b!522774 m!503693))

(declare-fun m!503695 () Bool)

(assert (=> b!522774 m!503695))

(assert (=> b!522776 m!503693))

(declare-fun m!503697 () Bool)

(assert (=> b!522776 m!503697))

(declare-fun m!503699 () Bool)

(assert (=> b!522776 m!503699))

(assert (=> b!522776 m!503693))

(declare-fun m!503701 () Bool)

(assert (=> b!522776 m!503701))

(declare-fun m!503703 () Bool)

(assert (=> bm!31810 m!503703))

(assert (=> b!522719 d!80429))

(declare-fun d!80433 () Bool)

(assert (=> d!80433 (= (validKeyInArray!0 (select (arr!16001 a!3235) j!176)) (and (not (= (select (arr!16001 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16001 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522714 d!80433))

(declare-fun d!80435 () Bool)

(declare-fun e!304899 () Bool)

(assert (=> d!80435 e!304899))

(declare-fun res!320362 () Bool)

(assert (=> d!80435 (=> (not res!320362) (not e!304899))))

(assert (=> d!80435 (= res!320362 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16365 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16365 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16365 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16365 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16365 a!3235))))))

(declare-fun lt!239839 () Unit!16324)

(declare-fun choose!47 (array!33290 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16324)

(assert (=> d!80435 (= lt!239839 (choose!47 a!3235 i!1204 k!2280 j!176 lt!239779 #b00000000000000000000000000000000 (index!20077 lt!239784) (x!49046 lt!239784) mask!3524))))

(assert (=> d!80435 (validMask!0 mask!3524)))

(assert (=> d!80435 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239779 #b00000000000000000000000000000000 (index!20077 lt!239784) (x!49046 lt!239784) mask!3524) lt!239839)))

(declare-fun b!522788 () Bool)

(assert (=> b!522788 (= e!304899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239779 (select (store (arr!16001 a!3235) i!1204 k!2280) j!176) (array!33291 (store (arr!16001 a!3235) i!1204 k!2280) (size!16365 a!3235)) mask!3524) (Intermediate!4468 false (index!20077 lt!239784) (x!49046 lt!239784))))))

(assert (= (and d!80435 res!320362) b!522788))

(declare-fun m!503717 () Bool)

(assert (=> d!80435 m!503717))

(assert (=> d!80435 m!503659))

(assert (=> b!522788 m!503641))

(assert (=> b!522788 m!503647))

(assert (=> b!522788 m!503647))

(declare-fun m!503719 () Bool)

(assert (=> b!522788 m!503719))

(assert (=> b!522723 d!80435))

(declare-fun b!522879 () Bool)

(declare-fun e!304952 () SeekEntryResult!4468)

(assert (=> b!522879 (= e!304952 (Intermediate!4468 true lt!239779 #b00000000000000000000000000000000))))

(declare-fun d!80441 () Bool)

(declare-fun e!304950 () Bool)

(assert (=> d!80441 e!304950))

(declare-fun c!61545 () Bool)

(declare-fun lt!239871 () SeekEntryResult!4468)

(assert (=> d!80441 (= c!61545 (and (is-Intermediate!4468 lt!239871) (undefined!5280 lt!239871)))))

(assert (=> d!80441 (= lt!239871 e!304952)))

(declare-fun c!61546 () Bool)

(assert (=> d!80441 (= c!61546 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239870 () (_ BitVec 64))

(assert (=> d!80441 (= lt!239870 (select (arr!16001 lt!239785) lt!239779))))

(assert (=> d!80441 (validMask!0 mask!3524)))

(assert (=> d!80441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239779 lt!239781 lt!239785 mask!3524) lt!239871)))

(declare-fun b!522880 () Bool)

(declare-fun e!304953 () Bool)

(assert (=> b!522880 (= e!304950 e!304953)))

(declare-fun res!320395 () Bool)

(assert (=> b!522880 (= res!320395 (and (is-Intermediate!4468 lt!239871) (not (undefined!5280 lt!239871)) (bvslt (x!49046 lt!239871) #b01111111111111111111111111111110) (bvsge (x!49046 lt!239871) #b00000000000000000000000000000000) (bvsge (x!49046 lt!239871) #b00000000000000000000000000000000)))))

(assert (=> b!522880 (=> (not res!320395) (not e!304953))))

(declare-fun b!522881 () Bool)

(assert (=> b!522881 (and (bvsge (index!20077 lt!239871) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239871) (size!16365 lt!239785)))))

(declare-fun res!320394 () Bool)

(assert (=> b!522881 (= res!320394 (= (select (arr!16001 lt!239785) (index!20077 lt!239871)) lt!239781))))

(declare-fun e!304954 () Bool)

(assert (=> b!522881 (=> res!320394 e!304954)))

(assert (=> b!522881 (= e!304953 e!304954)))

(declare-fun b!522882 () Bool)

(assert (=> b!522882 (= e!304950 (bvsge (x!49046 lt!239871) #b01111111111111111111111111111110))))

(declare-fun b!522883 () Bool)

(declare-fun e!304951 () SeekEntryResult!4468)

(assert (=> b!522883 (= e!304951 (Intermediate!4468 false lt!239779 #b00000000000000000000000000000000))))

(declare-fun b!522884 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522884 (= e!304951 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239779 #b00000000000000000000000000000000 mask!3524) lt!239781 lt!239785 mask!3524))))

(declare-fun b!522885 () Bool)

(assert (=> b!522885 (= e!304952 e!304951)))

(declare-fun c!61547 () Bool)

(assert (=> b!522885 (= c!61547 (or (= lt!239870 lt!239781) (= (bvadd lt!239870 lt!239870) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522886 () Bool)

(assert (=> b!522886 (and (bvsge (index!20077 lt!239871) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239871) (size!16365 lt!239785)))))

(assert (=> b!522886 (= e!304954 (= (select (arr!16001 lt!239785) (index!20077 lt!239871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522887 () Bool)

(assert (=> b!522887 (and (bvsge (index!20077 lt!239871) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239871) (size!16365 lt!239785)))))

(declare-fun res!320393 () Bool)

(assert (=> b!522887 (= res!320393 (= (select (arr!16001 lt!239785) (index!20077 lt!239871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522887 (=> res!320393 e!304954)))

(assert (= (and d!80441 c!61546) b!522879))

(assert (= (and d!80441 (not c!61546)) b!522885))

(assert (= (and b!522885 c!61547) b!522883))

(assert (= (and b!522885 (not c!61547)) b!522884))

(assert (= (and d!80441 c!61545) b!522882))

(assert (= (and d!80441 (not c!61545)) b!522880))

(assert (= (and b!522880 res!320395) b!522881))

(assert (= (and b!522881 (not res!320394)) b!522887))

(assert (= (and b!522887 (not res!320393)) b!522886))

(declare-fun m!503757 () Bool)

(assert (=> d!80441 m!503757))

(assert (=> d!80441 m!503659))

(declare-fun m!503759 () Bool)

(assert (=> b!522881 m!503759))

(assert (=> b!522886 m!503759))

(declare-fun m!503761 () Bool)

(assert (=> b!522884 m!503761))

(assert (=> b!522884 m!503761))

(declare-fun m!503763 () Bool)

(assert (=> b!522884 m!503763))

(assert (=> b!522887 m!503759))

(assert (=> b!522723 d!80441))

(declare-fun d!80459 () Bool)

(assert (=> d!80459 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47464 d!80459))

(declare-fun d!80471 () Bool)

(assert (=> d!80471 (= (array_inv!11797 a!3235) (bvsge (size!16365 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47464 d!80471))

(declare-fun b!522964 () Bool)

(declare-fun e!305009 () SeekEntryResult!4468)

(declare-fun lt!239892 () SeekEntryResult!4468)

(assert (=> b!522964 (= e!305009 (MissingZero!4468 (index!20077 lt!239892)))))

(declare-fun b!522965 () Bool)

(declare-fun e!305008 () SeekEntryResult!4468)

(assert (=> b!522965 (= e!305008 Undefined!4468)))

(declare-fun b!522966 () Bool)

(declare-fun e!305010 () SeekEntryResult!4468)

(assert (=> b!522966 (= e!305008 e!305010)))

(declare-fun lt!239893 () (_ BitVec 64))

(assert (=> b!522966 (= lt!239893 (select (arr!16001 a!3235) (index!20077 lt!239892)))))

(declare-fun c!61571 () Bool)

(assert (=> b!522966 (= c!61571 (= lt!239893 k!2280))))

(declare-fun b!522967 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33290 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!522967 (= e!305009 (seekKeyOrZeroReturnVacant!0 (x!49046 lt!239892) (index!20077 lt!239892) (index!20077 lt!239892) k!2280 a!3235 mask!3524))))

(declare-fun d!80475 () Bool)

(declare-fun lt!239894 () SeekEntryResult!4468)

(assert (=> d!80475 (and (or (is-Undefined!4468 lt!239894) (not (is-Found!4468 lt!239894)) (and (bvsge (index!20076 lt!239894) #b00000000000000000000000000000000) (bvslt (index!20076 lt!239894) (size!16365 a!3235)))) (or (is-Undefined!4468 lt!239894) (is-Found!4468 lt!239894) (not (is-MissingZero!4468 lt!239894)) (and (bvsge (index!20075 lt!239894) #b00000000000000000000000000000000) (bvslt (index!20075 lt!239894) (size!16365 a!3235)))) (or (is-Undefined!4468 lt!239894) (is-Found!4468 lt!239894) (is-MissingZero!4468 lt!239894) (not (is-MissingVacant!4468 lt!239894)) (and (bvsge (index!20078 lt!239894) #b00000000000000000000000000000000) (bvslt (index!20078 lt!239894) (size!16365 a!3235)))) (or (is-Undefined!4468 lt!239894) (ite (is-Found!4468 lt!239894) (= (select (arr!16001 a!3235) (index!20076 lt!239894)) k!2280) (ite (is-MissingZero!4468 lt!239894) (= (select (arr!16001 a!3235) (index!20075 lt!239894)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4468 lt!239894) (= (select (arr!16001 a!3235) (index!20078 lt!239894)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80475 (= lt!239894 e!305008)))

(declare-fun c!61572 () Bool)

(assert (=> d!80475 (= c!61572 (and (is-Intermediate!4468 lt!239892) (undefined!5280 lt!239892)))))

(assert (=> d!80475 (= lt!239892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80475 (validMask!0 mask!3524)))

(assert (=> d!80475 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!239894)))

(declare-fun b!522968 () Bool)

(declare-fun c!61570 () Bool)

(assert (=> b!522968 (= c!61570 (= lt!239893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522968 (= e!305010 e!305009)))

(declare-fun b!522969 () Bool)

(assert (=> b!522969 (= e!305010 (Found!4468 (index!20077 lt!239892)))))

(assert (= (and d!80475 c!61572) b!522965))

(assert (= (and d!80475 (not c!61572)) b!522966))

(assert (= (and b!522966 c!61571) b!522969))

(assert (= (and b!522966 (not c!61571)) b!522968))

(assert (= (and b!522968 c!61570) b!522964))

(assert (= (and b!522968 (not c!61570)) b!522967))

(declare-fun m!503801 () Bool)

(assert (=> b!522966 m!503801))

(declare-fun m!503803 () Bool)

(assert (=> b!522967 m!503803))

(declare-fun m!503805 () Bool)

(assert (=> d!80475 m!503805))

(declare-fun m!503807 () Bool)

(assert (=> d!80475 m!503807))

(assert (=> d!80475 m!503807))

(declare-fun m!503809 () Bool)

(assert (=> d!80475 m!503809))

(declare-fun m!503811 () Bool)

(assert (=> d!80475 m!503811))

(assert (=> d!80475 m!503659))

(declare-fun m!503813 () Bool)

(assert (=> d!80475 m!503813))

(assert (=> b!522718 d!80475))

(declare-fun b!522986 () Bool)

(declare-fun e!305022 () Bool)

(declare-fun call!31827 () Bool)

(assert (=> b!522986 (= e!305022 call!31827)))

(declare-fun b!522987 () Bool)

(declare-fun e!305023 () Bool)

(declare-fun e!305024 () Bool)

(assert (=> b!522987 (= e!305023 e!305024)))

(declare-fun res!320436 () Bool)

(assert (=> b!522987 (=> (not res!320436) (not e!305024))))

(declare-fun e!305025 () Bool)

(assert (=> b!522987 (= res!320436 (not e!305025))))

(declare-fun res!320434 () Bool)

(assert (=> b!522987 (=> (not res!320434) (not e!305025))))

(assert (=> b!522987 (= res!320434 (validKeyInArray!0 (select (arr!16001 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522988 () Bool)

(declare-fun contains!2766 (List!10159 (_ BitVec 64)) Bool)

(assert (=> b!522988 (= e!305025 (contains!2766 Nil!10156 (select (arr!16001 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31824 () Bool)

(declare-fun c!61578 () Bool)

(assert (=> bm!31824 (= call!31827 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61578 (Cons!10155 (select (arr!16001 a!3235) #b00000000000000000000000000000000) Nil!10156) Nil!10156)))))

(declare-fun d!80483 () Bool)

(declare-fun res!320435 () Bool)

(assert (=> d!80483 (=> res!320435 e!305023)))

(assert (=> d!80483 (= res!320435 (bvsge #b00000000000000000000000000000000 (size!16365 a!3235)))))

(assert (=> d!80483 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10156) e!305023)))

(declare-fun b!522989 () Bool)

(assert (=> b!522989 (= e!305024 e!305022)))

(assert (=> b!522989 (= c!61578 (validKeyInArray!0 (select (arr!16001 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522990 () Bool)

(assert (=> b!522990 (= e!305022 call!31827)))

(assert (= (and d!80483 (not res!320435)) b!522987))

(assert (= (and b!522987 res!320434) b!522988))

(assert (= (and b!522987 res!320436) b!522989))

(assert (= (and b!522989 c!61578) b!522990))

(assert (= (and b!522989 (not c!61578)) b!522986))

(assert (= (or b!522990 b!522986) bm!31824))

(assert (=> b!522987 m!503693))

(assert (=> b!522987 m!503693))

(assert (=> b!522987 m!503695))

(assert (=> b!522988 m!503693))

(assert (=> b!522988 m!503693))

(declare-fun m!503827 () Bool)

(assert (=> b!522988 m!503827))

(assert (=> bm!31824 m!503693))

(declare-fun m!503829 () Bool)

(assert (=> bm!31824 m!503829))

(assert (=> b!522989 m!503693))

(assert (=> b!522989 m!503693))

(assert (=> b!522989 m!503695))

(assert (=> b!522712 d!80483))

(declare-fun d!80487 () Bool)

(assert (=> d!80487 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522722 d!80487))

(declare-fun d!80489 () Bool)

(declare-fun lt!239903 () (_ BitVec 32))

(declare-fun lt!239902 () (_ BitVec 32))

(assert (=> d!80489 (= lt!239903 (bvmul (bvxor lt!239902 (bvlshr lt!239902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80489 (= lt!239902 ((_ extract 31 0) (bvand (bvxor lt!239781 (bvlshr lt!239781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80489 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320437 (let ((h!11080 ((_ extract 31 0) (bvand (bvxor lt!239781 (bvlshr lt!239781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49054 (bvmul (bvxor h!11080 (bvlshr h!11080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49054 (bvlshr x!49054 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320437 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320437 #b00000000000000000000000000000000))))))

(assert (=> d!80489 (= (toIndex!0 lt!239781 mask!3524) (bvand (bvxor lt!239903 (bvlshr lt!239903 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522716 d!80489))

(declare-fun d!80491 () Bool)

(declare-fun lt!239905 () (_ BitVec 32))

(declare-fun lt!239904 () (_ BitVec 32))

(assert (=> d!80491 (= lt!239905 (bvmul (bvxor lt!239904 (bvlshr lt!239904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80491 (= lt!239904 ((_ extract 31 0) (bvand (bvxor (select (arr!16001 a!3235) j!176) (bvlshr (select (arr!16001 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80491 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320437 (let ((h!11080 ((_ extract 31 0) (bvand (bvxor (select (arr!16001 a!3235) j!176) (bvlshr (select (arr!16001 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49054 (bvmul (bvxor h!11080 (bvlshr h!11080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49054 (bvlshr x!49054 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320437 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320437 #b00000000000000000000000000000000))))))

(assert (=> d!80491 (= (toIndex!0 (select (arr!16001 a!3235) j!176) mask!3524) (bvand (bvxor lt!239905 (bvlshr lt!239905 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522716 d!80491))

(declare-fun b!522991 () Bool)

(declare-fun e!305028 () SeekEntryResult!4468)

(assert (=> b!522991 (= e!305028 (Intermediate!4468 true lt!239779 #b00000000000000000000000000000000))))

(declare-fun d!80493 () Bool)

(declare-fun e!305026 () Bool)

(assert (=> d!80493 e!305026))

(declare-fun c!61579 () Bool)

(declare-fun lt!239907 () SeekEntryResult!4468)

(assert (=> d!80493 (= c!61579 (and (is-Intermediate!4468 lt!239907) (undefined!5280 lt!239907)))))

(assert (=> d!80493 (= lt!239907 e!305028)))

(declare-fun c!61580 () Bool)

(assert (=> d!80493 (= c!61580 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239906 () (_ BitVec 64))

(assert (=> d!80493 (= lt!239906 (select (arr!16001 a!3235) lt!239779))))

(assert (=> d!80493 (validMask!0 mask!3524)))

(assert (=> d!80493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239779 (select (arr!16001 a!3235) j!176) a!3235 mask!3524) lt!239907)))

(declare-fun b!522992 () Bool)

(declare-fun e!305029 () Bool)

(assert (=> b!522992 (= e!305026 e!305029)))

(declare-fun res!320440 () Bool)

(assert (=> b!522992 (= res!320440 (and (is-Intermediate!4468 lt!239907) (not (undefined!5280 lt!239907)) (bvslt (x!49046 lt!239907) #b01111111111111111111111111111110) (bvsge (x!49046 lt!239907) #b00000000000000000000000000000000) (bvsge (x!49046 lt!239907) #b00000000000000000000000000000000)))))

(assert (=> b!522992 (=> (not res!320440) (not e!305029))))

(declare-fun b!522993 () Bool)

(assert (=> b!522993 (and (bvsge (index!20077 lt!239907) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239907) (size!16365 a!3235)))))

(declare-fun res!320439 () Bool)

(assert (=> b!522993 (= res!320439 (= (select (arr!16001 a!3235) (index!20077 lt!239907)) (select (arr!16001 a!3235) j!176)))))

(declare-fun e!305030 () Bool)

(assert (=> b!522993 (=> res!320439 e!305030)))

(assert (=> b!522993 (= e!305029 e!305030)))

(declare-fun b!522994 () Bool)

(assert (=> b!522994 (= e!305026 (bvsge (x!49046 lt!239907) #b01111111111111111111111111111110))))

(declare-fun b!522995 () Bool)

(declare-fun e!305027 () SeekEntryResult!4468)

(assert (=> b!522995 (= e!305027 (Intermediate!4468 false lt!239779 #b00000000000000000000000000000000))))

(declare-fun b!522996 () Bool)

(assert (=> b!522996 (= e!305027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239779 #b00000000000000000000000000000000 mask!3524) (select (arr!16001 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522997 () Bool)

(assert (=> b!522997 (= e!305028 e!305027)))

(declare-fun c!61581 () Bool)

(assert (=> b!522997 (= c!61581 (or (= lt!239906 (select (arr!16001 a!3235) j!176)) (= (bvadd lt!239906 lt!239906) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522998 () Bool)

(assert (=> b!522998 (and (bvsge (index!20077 lt!239907) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239907) (size!16365 a!3235)))))

(assert (=> b!522998 (= e!305030 (= (select (arr!16001 a!3235) (index!20077 lt!239907)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522999 () Bool)

(assert (=> b!522999 (and (bvsge (index!20077 lt!239907) #b00000000000000000000000000000000) (bvslt (index!20077 lt!239907) (size!16365 a!3235)))))

(declare-fun res!320438 () Bool)

(assert (=> b!522999 (= res!320438 (= (select (arr!16001 a!3235) (index!20077 lt!239907)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522999 (=> res!320438 e!305030)))

(assert (= (and d!80493 c!61580) b!522991))

(assert (= (and d!80493 (not c!61580)) b!522997))

(assert (= (and b!522997 c!61581) b!522995))

(assert (= (and b!522997 (not c!61581)) b!522996))

(assert (= (and d!80493 c!61579) b!522994))

(assert (= (and d!80493 (not c!61579)) b!522992))

(assert (= (and b!522992 res!320440) b!522993))

(assert (= (and b!522993 (not res!320439)) b!522999))

(assert (= (and b!522999 (not res!320438)) b!522998))

(declare-fun m!503831 () Bool)

(assert (=> d!80493 m!503831))

(assert (=> d!80493 m!503659))

(declare-fun m!503833 () Bool)

(assert (=> b!522993 m!503833))

(assert (=> b!522998 m!503833))

(assert (=> b!522996 m!503761))

(assert (=> b!522996 m!503761))

(assert (=> b!522996 m!503633))

(declare-fun m!503835 () Bool)

(assert (=> b!522996 m!503835))

(assert (=> b!522999 m!503833))

(assert (=> b!522716 d!80493))

(declare-fun b!523002 () Bool)

(declare-fun e!305034 () Bool)

(declare-fun e!305035 () Bool)

(assert (=> b!523002 (= e!305034 e!305035)))

(declare-fun c!61582 () Bool)

(assert (=> b!523002 (= c!61582 (validKeyInArray!0 (select (arr!16001 a!3235) j!176)))))

(declare-fun b!523003 () Bool)

(declare-fun call!31828 () Bool)

(assert (=> b!523003 (= e!305035 call!31828)))

(declare-fun b!523004 () Bool)

(declare-fun e!305033 () Bool)

(assert (=> b!523004 (= e!305035 e!305033)))

(declare-fun lt!239912 () (_ BitVec 64))

(assert (=> b!523004 (= lt!239912 (select (arr!16001 a!3235) j!176))))

(declare-fun lt!239911 () Unit!16324)

(assert (=> b!523004 (= lt!239911 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239912 j!176))))

(assert (=> b!523004 (arrayContainsKey!0 a!3235 lt!239912 #b00000000000000000000000000000000)))

(declare-fun lt!239910 () Unit!16324)

(assert (=> b!523004 (= lt!239910 lt!239911)))

(declare-fun res!320443 () Bool)

(assert (=> b!523004 (= res!320443 (= (seekEntryOrOpen!0 (select (arr!16001 a!3235) j!176) a!3235 mask!3524) (Found!4468 j!176)))))

(assert (=> b!523004 (=> (not res!320443) (not e!305033))))

(declare-fun d!80495 () Bool)

(declare-fun res!320444 () Bool)

(assert (=> d!80495 (=> res!320444 e!305034)))

(assert (=> d!80495 (= res!320444 (bvsge j!176 (size!16365 a!3235)))))

(assert (=> d!80495 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305034)))

(declare-fun bm!31825 () Bool)

(assert (=> bm!31825 (= call!31828 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523005 () Bool)

(assert (=> b!523005 (= e!305033 call!31828)))

(assert (= (and d!80495 (not res!320444)) b!523002))

(assert (= (and b!523002 c!61582) b!523004))

(assert (= (and b!523002 (not c!61582)) b!523003))

(assert (= (and b!523004 res!320443) b!523005))

(assert (= (or b!523005 b!523003) bm!31825))

(assert (=> b!523002 m!503633))

(assert (=> b!523002 m!503633))

(assert (=> b!523002 m!503637))

(assert (=> b!523004 m!503633))

(declare-fun m!503837 () Bool)

(assert (=> b!523004 m!503837))

(declare-fun m!503839 () Bool)

(assert (=> b!523004 m!503839))

(assert (=> b!523004 m!503633))

(assert (=> b!523004 m!503663))

(declare-fun m!503841 () Bool)

(assert (=> bm!31825 m!503841))

(assert (=> b!522716 d!80495))

(declare-fun d!80497 () Bool)

(assert (=> d!80497 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!239921 () Unit!16324)

(declare-fun choose!38 (array!33290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16324)

(assert (=> d!80497 (= lt!239921 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80497 (validMask!0 mask!3524)))

(assert (=> d!80497 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!239921)))

(declare-fun bs!16440 () Bool)

(assert (= bs!16440 d!80497))

(assert (=> bs!16440 m!503653))

(declare-fun m!503867 () Bool)

(assert (=> bs!16440 m!503867))

(assert (=> bs!16440 m!503659))

(assert (=> b!522716 d!80497))

(declare-fun b!523022 () Bool)

(declare-fun e!305047 () SeekEntryResult!4468)

(assert (=> b!523022 (= e!305047 (Intermediate!4468 true lt!239782 #b00000000000000000000000000000000))))

(declare-fun d!80507 () Bool)

(declare-fun e!305045 () Bool)

(assert (=> d!80507 e!305045))

(declare-fun c!61589 () Bool)

(declare-fun lt!239923 () SeekEntryResult!4468)

(assert (=> d!80507 (= c!61589 (and (is-Intermediate!4468 lt!239923) (undefined!5280 lt!239923)))))

(assert (=> d!80507 (= lt!239923 e!305047)))

(declare-fun c!61590 () Bool)

(assert (=> d!80507 (= c!61590 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239922 () (_ BitVec 64))

(assert (=> d!80507 (= lt!239922 (select (arr!16001 lt!239785) lt!239782))))

(assert (=> d!80507 (validMask!0 mask!3524)))

(assert (=> d!80507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239782 lt!239781 lt!239785 mask!3524) lt!239923)))

(declare-fun b!523023 () Bool)

(declare-fun e!305048 () Bool)

(assert (=> b!523023 (= e!305045 e!305048)))

(declare-fun res!320451 () Bool)

(assert (=> b!523023 (= res!320451 (and (is-Intermediate!4468 lt!239923) (not (undefined!5280 lt!239923)) (bvslt (x!49046 lt!239923) #b01111111111111111111111111111110) (bvsge (x!49046 lt!239923) #b00000000000000000000000000000000) (bvsge (x!49046 lt!239923) #b00000000000000000000000000000000)))))

(assert (=> b!523023 (=> (not res!320451) (not e!305048))))

(declare-fun b!523024 () Bool)

