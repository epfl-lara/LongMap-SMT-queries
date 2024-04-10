; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47620 () Bool)

(assert start!47620)

(declare-fun b!523870 () Bool)

(declare-fun res!321021 () Bool)

(declare-fun e!305526 () Bool)

(assert (=> b!523870 (=> res!321021 e!305526)))

(declare-datatypes ((SeekEntryResult!4480 0))(
  ( (MissingZero!4480 (index!20129 (_ BitVec 32))) (Found!4480 (index!20130 (_ BitVec 32))) (Intermediate!4480 (undefined!5292 Bool) (index!20131 (_ BitVec 32)) (x!49108 (_ BitVec 32))) (Undefined!4480) (MissingVacant!4480 (index!20132 (_ BitVec 32))) )
))
(declare-fun lt!240389 () SeekEntryResult!4480)

(assert (=> b!523870 (= res!321021 (or (undefined!5292 lt!240389) (not (is-Intermediate!4480 lt!240389))))))

(declare-fun b!523871 () Bool)

(declare-fun res!321013 () Bool)

(declare-fun e!305529 () Bool)

(assert (=> b!523871 (=> (not res!321013) (not e!305529))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!33320 0))(
  ( (array!33321 (arr!16013 (Array (_ BitVec 32) (_ BitVec 64))) (size!16377 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33320)

(assert (=> b!523871 (= res!321013 (and (= (size!16377 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16377 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16377 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523872 () Bool)

(declare-fun res!321019 () Bool)

(assert (=> b!523872 (=> (not res!321019) (not e!305529))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523872 (= res!321019 (validKeyInArray!0 k!2280))))

(declare-fun b!523873 () Bool)

(declare-fun res!321022 () Bool)

(declare-fun e!305524 () Bool)

(assert (=> b!523873 (=> (not res!321022) (not e!305524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33320 (_ BitVec 32)) Bool)

(assert (=> b!523873 (= res!321022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523874 () Bool)

(assert (=> b!523874 (= e!305529 e!305524)))

(declare-fun res!321012 () Bool)

(assert (=> b!523874 (=> (not res!321012) (not e!305524))))

(declare-fun lt!240393 () SeekEntryResult!4480)

(assert (=> b!523874 (= res!321012 (or (= lt!240393 (MissingZero!4480 i!1204)) (= lt!240393 (MissingVacant!4480 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33320 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!523874 (= lt!240393 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523875 () Bool)

(declare-fun res!321018 () Bool)

(assert (=> b!523875 (=> (not res!321018) (not e!305524))))

(declare-datatypes ((List!10171 0))(
  ( (Nil!10168) (Cons!10167 (h!11095 (_ BitVec 64)) (t!16399 List!10171)) )
))
(declare-fun arrayNoDuplicates!0 (array!33320 (_ BitVec 32) List!10171) Bool)

(assert (=> b!523875 (= res!321018 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10168))))

(declare-fun lt!240392 () (_ BitVec 32))

(declare-fun b!523876 () Bool)

(assert (=> b!523876 (= e!305526 (or (bvsgt #b00000000000000000000000000000000 (x!49108 lt!240389)) (bvsgt (x!49108 lt!240389) #b01111111111111111111111111111110) (bvslt lt!240392 #b00000000000000000000000000000000) (bvsge lt!240392 (size!16377 a!3235)) (and (bvsge (index!20131 lt!240389) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240389) (size!16377 a!3235)))))))

(assert (=> b!523876 (and (or (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16372 0))(
  ( (Unit!16373) )
))
(declare-fun lt!240390 () Unit!16372)

(declare-fun e!305527 () Unit!16372)

(assert (=> b!523876 (= lt!240390 e!305527)))

(declare-fun c!61733 () Bool)

(assert (=> b!523876 (= c!61733 (= (select (arr!16013 a!3235) (index!20131 lt!240389)) (select (arr!16013 a!3235) j!176)))))

(assert (=> b!523876 (and (bvslt (x!49108 lt!240389) #b01111111111111111111111111111110) (or (= (select (arr!16013 a!3235) (index!20131 lt!240389)) (select (arr!16013 a!3235) j!176)) (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16013 a!3235) (index!20131 lt!240389)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523877 () Bool)

(declare-fun res!321017 () Bool)

(assert (=> b!523877 (=> (not res!321017) (not e!305529))))

(declare-fun arrayContainsKey!0 (array!33320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523877 (= res!321017 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523878 () Bool)

(declare-fun Unit!16374 () Unit!16372)

(assert (=> b!523878 (= e!305527 Unit!16374)))

(declare-fun lt!240397 () Unit!16372)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33320 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16372)

(assert (=> b!523878 (= lt!240397 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240392 #b00000000000000000000000000000000 (index!20131 lt!240389) (x!49108 lt!240389) mask!3524))))

(declare-fun res!321014 () Bool)

(declare-fun lt!240395 () array!33320)

(declare-fun lt!240391 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33320 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!523878 (= res!321014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240392 lt!240391 lt!240395 mask!3524) (Intermediate!4480 false (index!20131 lt!240389) (x!49108 lt!240389))))))

(declare-fun e!305523 () Bool)

(assert (=> b!523878 (=> (not res!321014) (not e!305523))))

(assert (=> b!523878 e!305523))

(declare-fun b!523879 () Bool)

(assert (=> b!523879 (= e!305524 (not e!305526))))

(declare-fun res!321015 () Bool)

(assert (=> b!523879 (=> res!321015 e!305526)))

(declare-fun lt!240396 () (_ BitVec 32))

(assert (=> b!523879 (= res!321015 (= lt!240389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240396 lt!240391 lt!240395 mask!3524)))))

(assert (=> b!523879 (= lt!240389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240392 (select (arr!16013 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523879 (= lt!240396 (toIndex!0 lt!240391 mask!3524))))

(assert (=> b!523879 (= lt!240391 (select (store (arr!16013 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523879 (= lt!240392 (toIndex!0 (select (arr!16013 a!3235) j!176) mask!3524))))

(assert (=> b!523879 (= lt!240395 (array!33321 (store (arr!16013 a!3235) i!1204 k!2280) (size!16377 a!3235)))))

(declare-fun e!305528 () Bool)

(assert (=> b!523879 e!305528))

(declare-fun res!321023 () Bool)

(assert (=> b!523879 (=> (not res!321023) (not e!305528))))

(assert (=> b!523879 (= res!321023 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240394 () Unit!16372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16372)

(assert (=> b!523879 (= lt!240394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!321020 () Bool)

(assert (=> start!47620 (=> (not res!321020) (not e!305529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47620 (= res!321020 (validMask!0 mask!3524))))

(assert (=> start!47620 e!305529))

(assert (=> start!47620 true))

(declare-fun array_inv!11809 (array!33320) Bool)

(assert (=> start!47620 (array_inv!11809 a!3235)))

(declare-fun b!523880 () Bool)

(assert (=> b!523880 (= e!305523 false)))

(declare-fun b!523881 () Bool)

(assert (=> b!523881 (= e!305528 (= (seekEntryOrOpen!0 (select (arr!16013 a!3235) j!176) a!3235 mask!3524) (Found!4480 j!176)))))

(declare-fun b!523882 () Bool)

(declare-fun res!321016 () Bool)

(assert (=> b!523882 (=> (not res!321016) (not e!305529))))

(assert (=> b!523882 (= res!321016 (validKeyInArray!0 (select (arr!16013 a!3235) j!176)))))

(declare-fun b!523883 () Bool)

(declare-fun Unit!16375 () Unit!16372)

(assert (=> b!523883 (= e!305527 Unit!16375)))

(assert (= (and start!47620 res!321020) b!523871))

(assert (= (and b!523871 res!321013) b!523882))

(assert (= (and b!523882 res!321016) b!523872))

(assert (= (and b!523872 res!321019) b!523877))

(assert (= (and b!523877 res!321017) b!523874))

(assert (= (and b!523874 res!321012) b!523873))

(assert (= (and b!523873 res!321022) b!523875))

(assert (= (and b!523875 res!321018) b!523879))

(assert (= (and b!523879 res!321023) b!523881))

(assert (= (and b!523879 (not res!321015)) b!523870))

(assert (= (and b!523870 (not res!321021)) b!523876))

(assert (= (and b!523876 c!61733) b!523878))

(assert (= (and b!523876 (not c!61733)) b!523883))

(assert (= (and b!523878 res!321014) b!523880))

(declare-fun m!504597 () Bool)

(assert (=> b!523876 m!504597))

(declare-fun m!504599 () Bool)

(assert (=> b!523876 m!504599))

(declare-fun m!504601 () Bool)

(assert (=> b!523872 m!504601))

(declare-fun m!504603 () Bool)

(assert (=> b!523875 m!504603))

(declare-fun m!504605 () Bool)

(assert (=> start!47620 m!504605))

(declare-fun m!504607 () Bool)

(assert (=> start!47620 m!504607))

(assert (=> b!523882 m!504599))

(assert (=> b!523882 m!504599))

(declare-fun m!504609 () Bool)

(assert (=> b!523882 m!504609))

(assert (=> b!523881 m!504599))

(assert (=> b!523881 m!504599))

(declare-fun m!504611 () Bool)

(assert (=> b!523881 m!504611))

(declare-fun m!504613 () Bool)

(assert (=> b!523878 m!504613))

(declare-fun m!504615 () Bool)

(assert (=> b!523878 m!504615))

(declare-fun m!504617 () Bool)

(assert (=> b!523879 m!504617))

(declare-fun m!504619 () Bool)

(assert (=> b!523879 m!504619))

(assert (=> b!523879 m!504599))

(declare-fun m!504621 () Bool)

(assert (=> b!523879 m!504621))

(assert (=> b!523879 m!504599))

(declare-fun m!504623 () Bool)

(assert (=> b!523879 m!504623))

(assert (=> b!523879 m!504599))

(declare-fun m!504625 () Bool)

(assert (=> b!523879 m!504625))

(declare-fun m!504627 () Bool)

(assert (=> b!523879 m!504627))

(declare-fun m!504629 () Bool)

(assert (=> b!523879 m!504629))

(declare-fun m!504631 () Bool)

(assert (=> b!523879 m!504631))

(declare-fun m!504633 () Bool)

(assert (=> b!523873 m!504633))

(declare-fun m!504635 () Bool)

(assert (=> b!523877 m!504635))

(declare-fun m!504637 () Bool)

(assert (=> b!523874 m!504637))

(push 1)

(assert (not b!523874))

(assert (not b!523875))

(assert (not b!523881))

(assert (not b!523877))

(assert (not start!47620))

(assert (not b!523882))

(assert (not b!523878))

(assert (not b!523873))

(assert (not b!523872))

(assert (not b!523879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80643 () Bool)

(declare-fun res!321055 () Bool)

(declare-fun e!305566 () Bool)

(assert (=> d!80643 (=> res!321055 e!305566)))

(assert (=> d!80643 (= res!321055 (= (select (arr!16013 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80643 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!305566)))

(declare-fun b!523925 () Bool)

(declare-fun e!305567 () Bool)

(assert (=> b!523925 (= e!305566 e!305567)))

(declare-fun res!321056 () Bool)

(assert (=> b!523925 (=> (not res!321056) (not e!305567))))

(assert (=> b!523925 (= res!321056 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16377 a!3235)))))

(declare-fun b!523926 () Bool)

(assert (=> b!523926 (= e!305567 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80643 (not res!321055)) b!523925))

(assert (= (and b!523925 res!321056) b!523926))

(declare-fun m!504661 () Bool)

(assert (=> d!80643 m!504661))

(declare-fun m!504663 () Bool)

(assert (=> b!523926 m!504663))

(assert (=> b!523877 d!80643))

(declare-fun d!80645 () Bool)

(assert (=> d!80645 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523872 d!80645))

(declare-fun d!80647 () Bool)

(declare-fun e!305589 () Bool)

(assert (=> d!80647 e!305589))

(declare-fun res!321071 () Bool)

(assert (=> d!80647 (=> (not res!321071) (not e!305589))))

(assert (=> d!80647 (= res!321071 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16377 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16377 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16377 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16377 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16377 a!3235))))))

(declare-fun lt!240418 () Unit!16372)

(declare-fun choose!47 (array!33320 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16372)

(assert (=> d!80647 (= lt!240418 (choose!47 a!3235 i!1204 k!2280 j!176 lt!240392 #b00000000000000000000000000000000 (index!20131 lt!240389) (x!49108 lt!240389) mask!3524))))

(assert (=> d!80647 (validMask!0 mask!3524)))

(assert (=> d!80647 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240392 #b00000000000000000000000000000000 (index!20131 lt!240389) (x!49108 lt!240389) mask!3524) lt!240418)))

(declare-fun b!523961 () Bool)

(assert (=> b!523961 (= e!305589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240392 (select (store (arr!16013 a!3235) i!1204 k!2280) j!176) (array!33321 (store (arr!16013 a!3235) i!1204 k!2280) (size!16377 a!3235)) mask!3524) (Intermediate!4480 false (index!20131 lt!240389) (x!49108 lt!240389))))))

(assert (= (and d!80647 res!321071) b!523961))

(declare-fun m!504679 () Bool)

(assert (=> d!80647 m!504679))

(assert (=> d!80647 m!504605))

(assert (=> b!523961 m!504631))

(assert (=> b!523961 m!504619))

(assert (=> b!523961 m!504619))

(declare-fun m!504681 () Bool)

(assert (=> b!523961 m!504681))

(assert (=> b!523878 d!80647))

(declare-fun b!524016 () Bool)

(declare-fun lt!240441 () SeekEntryResult!4480)

(assert (=> b!524016 (and (bvsge (index!20131 lt!240441) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240441) (size!16377 lt!240395)))))

(declare-fun e!305619 () Bool)

(assert (=> b!524016 (= e!305619 (= (select (arr!16013 lt!240395) (index!20131 lt!240441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!524017 () Bool)

(declare-fun e!305621 () Bool)

(declare-fun e!305618 () Bool)

(assert (=> b!524017 (= e!305621 e!305618)))

(declare-fun res!321078 () Bool)

(assert (=> b!524017 (= res!321078 (and (is-Intermediate!4480 lt!240441) (not (undefined!5292 lt!240441)) (bvslt (x!49108 lt!240441) #b01111111111111111111111111111110) (bvsge (x!49108 lt!240441) #b00000000000000000000000000000000) (bvsge (x!49108 lt!240441) #b00000000000000000000000000000000)))))

(assert (=> b!524017 (=> (not res!321078) (not e!305618))))

(declare-fun b!524018 () Bool)

(assert (=> b!524018 (= e!305621 (bvsge (x!49108 lt!240441) #b01111111111111111111111111111110))))

(declare-fun b!524019 () Bool)

(assert (=> b!524019 (and (bvsge (index!20131 lt!240441) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240441) (size!16377 lt!240395)))))

(declare-fun res!321080 () Bool)

(assert (=> b!524019 (= res!321080 (= (select (arr!16013 lt!240395) (index!20131 lt!240441)) lt!240391))))

(assert (=> b!524019 (=> res!321080 e!305619)))

(assert (=> b!524019 (= e!305618 e!305619)))

(declare-fun b!524020 () Bool)

(declare-fun e!305622 () SeekEntryResult!4480)

(assert (=> b!524020 (= e!305622 (Intermediate!4480 true lt!240392 #b00000000000000000000000000000000))))

(declare-fun b!524021 () Bool)

(declare-fun e!305620 () SeekEntryResult!4480)

(assert (=> b!524021 (= e!305622 e!305620)))

(declare-fun c!61773 () Bool)

(declare-fun lt!240442 () (_ BitVec 64))

(assert (=> b!524021 (= c!61773 (or (= lt!240442 lt!240391) (= (bvadd lt!240442 lt!240442) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524022 () Bool)

(assert (=> b!524022 (and (bvsge (index!20131 lt!240441) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240441) (size!16377 lt!240395)))))

(declare-fun res!321079 () Bool)

(assert (=> b!524022 (= res!321079 (= (select (arr!16013 lt!240395) (index!20131 lt!240441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524022 (=> res!321079 e!305619)))

(declare-fun b!524023 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524023 (= e!305620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240392 #b00000000000000000000000000000000 mask!3524) lt!240391 lt!240395 mask!3524))))

(declare-fun b!524024 () Bool)

(assert (=> b!524024 (= e!305620 (Intermediate!4480 false lt!240392 #b00000000000000000000000000000000))))

(declare-fun d!80655 () Bool)

(assert (=> d!80655 e!305621))

(declare-fun c!61774 () Bool)

(assert (=> d!80655 (= c!61774 (and (is-Intermediate!4480 lt!240441) (undefined!5292 lt!240441)))))

(assert (=> d!80655 (= lt!240441 e!305622)))

(declare-fun c!61775 () Bool)

(assert (=> d!80655 (= c!61775 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80655 (= lt!240442 (select (arr!16013 lt!240395) lt!240392))))

(assert (=> d!80655 (validMask!0 mask!3524)))

(assert (=> d!80655 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240392 lt!240391 lt!240395 mask!3524) lt!240441)))

(assert (= (and d!80655 c!61775) b!524020))

(assert (= (and d!80655 (not c!61775)) b!524021))

(assert (= (and b!524021 c!61773) b!524024))

(assert (= (and b!524021 (not c!61773)) b!524023))

(assert (= (and d!80655 c!61774) b!524018))

(assert (= (and d!80655 (not c!61774)) b!524017))

(assert (= (and b!524017 res!321078) b!524019))

(assert (= (and b!524019 (not res!321080)) b!524022))

(assert (= (and b!524022 (not res!321079)) b!524016))

(declare-fun m!504707 () Bool)

(assert (=> b!524023 m!504707))

(assert (=> b!524023 m!504707))

(declare-fun m!504709 () Bool)

(assert (=> b!524023 m!504709))

(declare-fun m!504711 () Bool)

(assert (=> d!80655 m!504711))

(assert (=> d!80655 m!504605))

(declare-fun m!504713 () Bool)

(assert (=> b!524019 m!504713))

(assert (=> b!524016 m!504713))

(assert (=> b!524022 m!504713))

(assert (=> b!523878 d!80655))

(declare-fun bm!31857 () Bool)

(declare-fun call!31860 () Bool)

(assert (=> bm!31857 (= call!31860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!524049 () Bool)

(declare-fun e!305641 () Bool)

(declare-fun e!305642 () Bool)

(assert (=> b!524049 (= e!305641 e!305642)))

(declare-fun c!61782 () Bool)

(assert (=> b!524049 (= c!61782 (validKeyInArray!0 (select (arr!16013 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524050 () Bool)

(assert (=> b!524050 (= e!305642 call!31860)))

(declare-fun b!524051 () Bool)

(declare-fun e!305640 () Bool)

(assert (=> b!524051 (= e!305642 e!305640)))

(declare-fun lt!240466 () (_ BitVec 64))

(assert (=> b!524051 (= lt!240466 (select (arr!16013 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240467 () Unit!16372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33320 (_ BitVec 64) (_ BitVec 32)) Unit!16372)

(assert (=> b!524051 (= lt!240467 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240466 #b00000000000000000000000000000000))))

(assert (=> b!524051 (arrayContainsKey!0 a!3235 lt!240466 #b00000000000000000000000000000000)))

(declare-fun lt!240465 () Unit!16372)

(assert (=> b!524051 (= lt!240465 lt!240467)))

(declare-fun res!321095 () Bool)

(assert (=> b!524051 (= res!321095 (= (seekEntryOrOpen!0 (select (arr!16013 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4480 #b00000000000000000000000000000000)))))

(assert (=> b!524051 (=> (not res!321095) (not e!305640))))

(declare-fun b!524052 () Bool)

(assert (=> b!524052 (= e!305640 call!31860)))

(declare-fun d!80661 () Bool)

(declare-fun res!321094 () Bool)

(assert (=> d!80661 (=> res!321094 e!305641)))

(assert (=> d!80661 (= res!321094 (bvsge #b00000000000000000000000000000000 (size!16377 a!3235)))))

(assert (=> d!80661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305641)))

(assert (= (and d!80661 (not res!321094)) b!524049))

(assert (= (and b!524049 c!61782) b!524051))

(assert (= (and b!524049 (not c!61782)) b!524050))

(assert (= (and b!524051 res!321095) b!524052))

(assert (= (or b!524052 b!524050) bm!31857))

(declare-fun m!504733 () Bool)

(assert (=> bm!31857 m!504733))

(assert (=> b!524049 m!504661))

(assert (=> b!524049 m!504661))

(declare-fun m!504735 () Bool)

(assert (=> b!524049 m!504735))

(assert (=> b!524051 m!504661))

(declare-fun m!504737 () Bool)

(assert (=> b!524051 m!504737))

(declare-fun m!504739 () Bool)

(assert (=> b!524051 m!504739))

(assert (=> b!524051 m!504661))

(declare-fun m!504741 () Bool)

(assert (=> b!524051 m!504741))

(assert (=> b!523873 d!80661))

(declare-fun d!80673 () Bool)

(declare-fun lt!240481 () (_ BitVec 32))

(declare-fun lt!240480 () (_ BitVec 32))

(assert (=> d!80673 (= lt!240481 (bvmul (bvxor lt!240480 (bvlshr lt!240480 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80673 (= lt!240480 ((_ extract 31 0) (bvand (bvxor (select (arr!16013 a!3235) j!176) (bvlshr (select (arr!16013 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80673 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321096 (let ((h!11097 ((_ extract 31 0) (bvand (bvxor (select (arr!16013 a!3235) j!176) (bvlshr (select (arr!16013 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49115 (bvmul (bvxor h!11097 (bvlshr h!11097 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49115 (bvlshr x!49115 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321096 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321096 #b00000000000000000000000000000000))))))

(assert (=> d!80673 (= (toIndex!0 (select (arr!16013 a!3235) j!176) mask!3524) (bvand (bvxor lt!240481 (bvlshr lt!240481 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523879 d!80673))

(declare-fun bm!31858 () Bool)

(declare-fun call!31861 () Bool)

(assert (=> bm!31858 (= call!31861 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!524068 () Bool)

(declare-fun e!305652 () Bool)

(declare-fun e!305653 () Bool)

(assert (=> b!524068 (= e!305652 e!305653)))

(declare-fun c!61789 () Bool)

(assert (=> b!524068 (= c!61789 (validKeyInArray!0 (select (arr!16013 a!3235) j!176)))))

(declare-fun b!524069 () Bool)

(assert (=> b!524069 (= e!305653 call!31861)))

(declare-fun b!524070 () Bool)

(declare-fun e!305651 () Bool)

(assert (=> b!524070 (= e!305653 e!305651)))

(declare-fun lt!240483 () (_ BitVec 64))

(assert (=> b!524070 (= lt!240483 (select (arr!16013 a!3235) j!176))))

(declare-fun lt!240484 () Unit!16372)

(assert (=> b!524070 (= lt!240484 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240483 j!176))))

(assert (=> b!524070 (arrayContainsKey!0 a!3235 lt!240483 #b00000000000000000000000000000000)))

(declare-fun lt!240482 () Unit!16372)

(assert (=> b!524070 (= lt!240482 lt!240484)))

(declare-fun res!321101 () Bool)

(assert (=> b!524070 (= res!321101 (= (seekEntryOrOpen!0 (select (arr!16013 a!3235) j!176) a!3235 mask!3524) (Found!4480 j!176)))))

(assert (=> b!524070 (=> (not res!321101) (not e!305651))))

(declare-fun b!524071 () Bool)

(assert (=> b!524071 (= e!305651 call!31861)))

(declare-fun d!80683 () Bool)

(declare-fun res!321100 () Bool)

(assert (=> d!80683 (=> res!321100 e!305652)))

(assert (=> d!80683 (= res!321100 (bvsge j!176 (size!16377 a!3235)))))

(assert (=> d!80683 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305652)))

(assert (= (and d!80683 (not res!321100)) b!524068))

(assert (= (and b!524068 c!61789) b!524070))

(assert (= (and b!524068 (not c!61789)) b!524069))

(assert (= (and b!524070 res!321101) b!524071))

(assert (= (or b!524071 b!524069) bm!31858))

(declare-fun m!504765 () Bool)

(assert (=> bm!31858 m!504765))

(assert (=> b!524068 m!504599))

(assert (=> b!524068 m!504599))

(assert (=> b!524068 m!504609))

(assert (=> b!524070 m!504599))

(declare-fun m!504767 () Bool)

(assert (=> b!524070 m!504767))

(declare-fun m!504769 () Bool)

(assert (=> b!524070 m!504769))

(assert (=> b!524070 m!504599))

(assert (=> b!524070 m!504611))

(assert (=> b!523879 d!80683))

(declare-fun d!80685 () Bool)

(declare-fun lt!240486 () (_ BitVec 32))

(declare-fun lt!240485 () (_ BitVec 32))

(assert (=> d!80685 (= lt!240486 (bvmul (bvxor lt!240485 (bvlshr lt!240485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80685 (= lt!240485 ((_ extract 31 0) (bvand (bvxor lt!240391 (bvlshr lt!240391 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80685 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321096 (let ((h!11097 ((_ extract 31 0) (bvand (bvxor lt!240391 (bvlshr lt!240391 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49115 (bvmul (bvxor h!11097 (bvlshr h!11097 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49115 (bvlshr x!49115 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321096 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321096 #b00000000000000000000000000000000))))))

(assert (=> d!80685 (= (toIndex!0 lt!240391 mask!3524) (bvand (bvxor lt!240486 (bvlshr lt!240486 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523879 d!80685))

(declare-fun d!80687 () Bool)

(assert (=> d!80687 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240493 () Unit!16372)

(declare-fun choose!38 (array!33320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16372)

(assert (=> d!80687 (= lt!240493 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80687 (validMask!0 mask!3524)))

(assert (=> d!80687 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240493)))

(declare-fun bs!16457 () Bool)

(assert (= bs!16457 d!80687))

(assert (=> bs!16457 m!504623))

(declare-fun m!504771 () Bool)

(assert (=> bs!16457 m!504771))

(assert (=> bs!16457 m!504605))

(assert (=> b!523879 d!80687))

(declare-fun b!524105 () Bool)

(declare-fun lt!240494 () SeekEntryResult!4480)

(assert (=> b!524105 (and (bvsge (index!20131 lt!240494) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240494) (size!16377 a!3235)))))

(declare-fun e!305677 () Bool)

(assert (=> b!524105 (= e!305677 (= (select (arr!16013 a!3235) (index!20131 lt!240494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!524106 () Bool)

(declare-fun e!305679 () Bool)

(declare-fun e!305676 () Bool)

(assert (=> b!524106 (= e!305679 e!305676)))

(declare-fun res!321117 () Bool)

(assert (=> b!524106 (= res!321117 (and (is-Intermediate!4480 lt!240494) (not (undefined!5292 lt!240494)) (bvslt (x!49108 lt!240494) #b01111111111111111111111111111110) (bvsge (x!49108 lt!240494) #b00000000000000000000000000000000) (bvsge (x!49108 lt!240494) #b00000000000000000000000000000000)))))

(assert (=> b!524106 (=> (not res!321117) (not e!305676))))

(declare-fun b!524107 () Bool)

(assert (=> b!524107 (= e!305679 (bvsge (x!49108 lt!240494) #b01111111111111111111111111111110))))

(declare-fun b!524108 () Bool)

(assert (=> b!524108 (and (bvsge (index!20131 lt!240494) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240494) (size!16377 a!3235)))))

(declare-fun res!321119 () Bool)

(assert (=> b!524108 (= res!321119 (= (select (arr!16013 a!3235) (index!20131 lt!240494)) (select (arr!16013 a!3235) j!176)))))

(assert (=> b!524108 (=> res!321119 e!305677)))

(assert (=> b!524108 (= e!305676 e!305677)))

(declare-fun b!524109 () Bool)

(declare-fun e!305680 () SeekEntryResult!4480)

(assert (=> b!524109 (= e!305680 (Intermediate!4480 true lt!240392 #b00000000000000000000000000000000))))

(declare-fun b!524110 () Bool)

(declare-fun e!305678 () SeekEntryResult!4480)

(assert (=> b!524110 (= e!305680 e!305678)))

(declare-fun lt!240495 () (_ BitVec 64))

(declare-fun c!61799 () Bool)

(assert (=> b!524110 (= c!61799 (or (= lt!240495 (select (arr!16013 a!3235) j!176)) (= (bvadd lt!240495 lt!240495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524111 () Bool)

(assert (=> b!524111 (and (bvsge (index!20131 lt!240494) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240494) (size!16377 a!3235)))))

(declare-fun res!321118 () Bool)

(assert (=> b!524111 (= res!321118 (= (select (arr!16013 a!3235) (index!20131 lt!240494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524111 (=> res!321118 e!305677)))

(declare-fun b!524112 () Bool)

(assert (=> b!524112 (= e!305678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240392 #b00000000000000000000000000000000 mask!3524) (select (arr!16013 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!524113 () Bool)

(assert (=> b!524113 (= e!305678 (Intermediate!4480 false lt!240392 #b00000000000000000000000000000000))))

(declare-fun d!80689 () Bool)

(assert (=> d!80689 e!305679))

(declare-fun c!61800 () Bool)

(assert (=> d!80689 (= c!61800 (and (is-Intermediate!4480 lt!240494) (undefined!5292 lt!240494)))))

(assert (=> d!80689 (= lt!240494 e!305680)))

(declare-fun c!61801 () Bool)

(assert (=> d!80689 (= c!61801 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80689 (= lt!240495 (select (arr!16013 a!3235) lt!240392))))

(assert (=> d!80689 (validMask!0 mask!3524)))

(assert (=> d!80689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240392 (select (arr!16013 a!3235) j!176) a!3235 mask!3524) lt!240494)))

(assert (= (and d!80689 c!61801) b!524109))

(assert (= (and d!80689 (not c!61801)) b!524110))

(assert (= (and b!524110 c!61799) b!524113))

(assert (= (and b!524110 (not c!61799)) b!524112))

(assert (= (and d!80689 c!61800) b!524107))

(assert (= (and d!80689 (not c!61800)) b!524106))

(assert (= (and b!524106 res!321117) b!524108))

(assert (= (and b!524108 (not res!321119)) b!524111))

(assert (= (and b!524111 (not res!321118)) b!524105))

(assert (=> b!524112 m!504707))

(assert (=> b!524112 m!504707))

(assert (=> b!524112 m!504599))

(declare-fun m!504777 () Bool)

(assert (=> b!524112 m!504777))

(declare-fun m!504779 () Bool)

(assert (=> d!80689 m!504779))

(assert (=> d!80689 m!504605))

(declare-fun m!504781 () Bool)

(assert (=> b!524108 m!504781))

(assert (=> b!524105 m!504781))

(assert (=> b!524111 m!504781))

(assert (=> b!523879 d!80689))

(declare-fun b!524114 () Bool)

(declare-fun lt!240496 () SeekEntryResult!4480)

(assert (=> b!524114 (and (bvsge (index!20131 lt!240496) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240496) (size!16377 lt!240395)))))

(declare-fun e!305682 () Bool)

(assert (=> b!524114 (= e!305682 (= (select (arr!16013 lt!240395) (index!20131 lt!240496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!524115 () Bool)

(declare-fun e!305684 () Bool)

(declare-fun e!305681 () Bool)

(assert (=> b!524115 (= e!305684 e!305681)))

(declare-fun res!321120 () Bool)

(assert (=> b!524115 (= res!321120 (and (is-Intermediate!4480 lt!240496) (not (undefined!5292 lt!240496)) (bvslt (x!49108 lt!240496) #b01111111111111111111111111111110) (bvsge (x!49108 lt!240496) #b00000000000000000000000000000000) (bvsge (x!49108 lt!240496) #b00000000000000000000000000000000)))))

(assert (=> b!524115 (=> (not res!321120) (not e!305681))))

(declare-fun b!524116 () Bool)

(assert (=> b!524116 (= e!305684 (bvsge (x!49108 lt!240496) #b01111111111111111111111111111110))))

(declare-fun b!524117 () Bool)

(assert (=> b!524117 (and (bvsge (index!20131 lt!240496) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240496) (size!16377 lt!240395)))))

(declare-fun res!321122 () Bool)

(assert (=> b!524117 (= res!321122 (= (select (arr!16013 lt!240395) (index!20131 lt!240496)) lt!240391))))

(assert (=> b!524117 (=> res!321122 e!305682)))

(assert (=> b!524117 (= e!305681 e!305682)))

(declare-fun b!524118 () Bool)

(declare-fun e!305685 () SeekEntryResult!4480)

(assert (=> b!524118 (= e!305685 (Intermediate!4480 true lt!240396 #b00000000000000000000000000000000))))

(declare-fun b!524119 () Bool)

(declare-fun e!305683 () SeekEntryResult!4480)

(assert (=> b!524119 (= e!305685 e!305683)))

(declare-fun c!61802 () Bool)

(declare-fun lt!240497 () (_ BitVec 64))

(assert (=> b!524119 (= c!61802 (or (= lt!240497 lt!240391) (= (bvadd lt!240497 lt!240497) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524120 () Bool)

(assert (=> b!524120 (and (bvsge (index!20131 lt!240496) #b00000000000000000000000000000000) (bvslt (index!20131 lt!240496) (size!16377 lt!240395)))))

(declare-fun res!321121 () Bool)

(assert (=> b!524120 (= res!321121 (= (select (arr!16013 lt!240395) (index!20131 lt!240496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524120 (=> res!321121 e!305682)))

(declare-fun b!524121 () Bool)

(assert (=> b!524121 (= e!305683 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240396 #b00000000000000000000000000000000 mask!3524) lt!240391 lt!240395 mask!3524))))

(declare-fun b!524122 () Bool)

(assert (=> b!524122 (= e!305683 (Intermediate!4480 false lt!240396 #b00000000000000000000000000000000))))

(declare-fun d!80691 () Bool)

(assert (=> d!80691 e!305684))

(declare-fun c!61803 () Bool)

(assert (=> d!80691 (= c!61803 (and (is-Intermediate!4480 lt!240496) (undefined!5292 lt!240496)))))

(assert (=> d!80691 (= lt!240496 e!305685)))

(declare-fun c!61804 () Bool)

(assert (=> d!80691 (= c!61804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80691 (= lt!240497 (select (arr!16013 lt!240395) lt!240396))))

(assert (=> d!80691 (validMask!0 mask!3524)))

(assert (=> d!80691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240396 lt!240391 lt!240395 mask!3524) lt!240496)))

(assert (= (and d!80691 c!61804) b!524118))

(assert (= (and d!80691 (not c!61804)) b!524119))

(assert (= (and b!524119 c!61802) b!524122))

(assert (= (and b!524119 (not c!61802)) b!524121))

(assert (= (and d!80691 c!61803) b!524116))

(assert (= (and d!80691 (not c!61803)) b!524115))

(assert (= (and b!524115 res!321120) b!524117))

(assert (= (and b!524117 (not res!321122)) b!524120))

(assert (= (and b!524120 (not res!321121)) b!524114))

(declare-fun m!504783 () Bool)

(assert (=> b!524121 m!504783))

(assert (=> b!524121 m!504783))

(declare-fun m!504785 () Bool)

(assert (=> b!524121 m!504785))

(declare-fun m!504787 () Bool)

(assert (=> d!80691 m!504787))

(assert (=> d!80691 m!504605))

(declare-fun m!504789 () Bool)

(assert (=> b!524117 m!504789))

(assert (=> b!524114 m!504789))

(assert (=> b!524120 m!504789))

(assert (=> b!523879 d!80691))

(declare-fun b!524178 () Bool)

(declare-fun c!61826 () Bool)

(declare-fun lt!240533 () (_ BitVec 64))

(assert (=> b!524178 (= c!61826 (= lt!240533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305719 () SeekEntryResult!4480)

(declare-fun e!305721 () SeekEntryResult!4480)

(assert (=> b!524178 (= e!305719 e!305721)))

(declare-fun b!524179 () Bool)

(declare-fun e!305720 () SeekEntryResult!4480)

(assert (=> b!524179 (= e!305720 e!305719)))

(declare-fun lt!240535 () SeekEntryResult!4480)

(assert (=> b!524179 (= lt!240533 (select (arr!16013 a!3235) (index!20131 lt!240535)))))

(declare-fun c!61825 () Bool)

(assert (=> b!524179 (= c!61825 (= lt!240533 k!2280))))

(declare-fun b!524180 () Bool)

(assert (=> b!524180 (= e!305720 Undefined!4480)))

(declare-fun d!80693 () Bool)

(declare-fun lt!240534 () SeekEntryResult!4480)

(assert (=> d!80693 (and (or (is-Undefined!4480 lt!240534) (not (is-Found!4480 lt!240534)) (and (bvsge (index!20130 lt!240534) #b00000000000000000000000000000000) (bvslt (index!20130 lt!240534) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240534) (is-Found!4480 lt!240534) (not (is-MissingZero!4480 lt!240534)) (and (bvsge (index!20129 lt!240534) #b00000000000000000000000000000000) (bvslt (index!20129 lt!240534) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240534) (is-Found!4480 lt!240534) (is-MissingZero!4480 lt!240534) (not (is-MissingVacant!4480 lt!240534)) (and (bvsge (index!20132 lt!240534) #b00000000000000000000000000000000) (bvslt (index!20132 lt!240534) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240534) (ite (is-Found!4480 lt!240534) (= (select (arr!16013 a!3235) (index!20130 lt!240534)) k!2280) (ite (is-MissingZero!4480 lt!240534) (= (select (arr!16013 a!3235) (index!20129 lt!240534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4480 lt!240534) (= (select (arr!16013 a!3235) (index!20132 lt!240534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80693 (= lt!240534 e!305720)))

(declare-fun c!61824 () Bool)

(assert (=> d!80693 (= c!61824 (and (is-Intermediate!4480 lt!240535) (undefined!5292 lt!240535)))))

(assert (=> d!80693 (= lt!240535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80693 (validMask!0 mask!3524)))

(assert (=> d!80693 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!240534)))

(declare-fun b!524181 () Bool)

(assert (=> b!524181 (= e!305719 (Found!4480 (index!20131 lt!240535)))))

(declare-fun b!524182 () Bool)

(assert (=> b!524182 (= e!305721 (MissingZero!4480 (index!20131 lt!240535)))))

(declare-fun b!524183 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33320 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!524183 (= e!305721 (seekKeyOrZeroReturnVacant!0 (x!49108 lt!240535) (index!20131 lt!240535) (index!20131 lt!240535) k!2280 a!3235 mask!3524))))

(assert (= (and d!80693 c!61824) b!524180))

(assert (= (and d!80693 (not c!61824)) b!524179))

(assert (= (and b!524179 c!61825) b!524181))

(assert (= (and b!524179 (not c!61825)) b!524178))

(assert (= (and b!524178 c!61826) b!524182))

(assert (= (and b!524178 (not c!61826)) b!524183))

(declare-fun m!504829 () Bool)

(assert (=> b!524179 m!504829))

(declare-fun m!504831 () Bool)

(assert (=> d!80693 m!504831))

(declare-fun m!504833 () Bool)

(assert (=> d!80693 m!504833))

(assert (=> d!80693 m!504605))

(declare-fun m!504835 () Bool)

(assert (=> d!80693 m!504835))

(assert (=> d!80693 m!504835))

(declare-fun m!504837 () Bool)

(assert (=> d!80693 m!504837))

(declare-fun m!504839 () Bool)

(assert (=> d!80693 m!504839))

(declare-fun m!504841 () Bool)

(assert (=> b!524183 m!504841))

(assert (=> b!523874 d!80693))

(declare-fun b!524194 () Bool)

(declare-fun e!305730 () Bool)

(declare-fun e!305732 () Bool)

(assert (=> b!524194 (= e!305730 e!305732)))

(declare-fun c!61829 () Bool)

(assert (=> b!524194 (= c!61829 (validKeyInArray!0 (select (arr!16013 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524195 () Bool)

(declare-fun e!305733 () Bool)

(assert (=> b!524195 (= e!305733 e!305730)))

(declare-fun res!321148 () Bool)

(assert (=> b!524195 (=> (not res!321148) (not e!305730))))

(declare-fun e!305731 () Bool)

(assert (=> b!524195 (= res!321148 (not e!305731))))

(declare-fun res!321149 () Bool)

(assert (=> b!524195 (=> (not res!321149) (not e!305731))))

(assert (=> b!524195 (= res!321149 (validKeyInArray!0 (select (arr!16013 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524196 () Bool)

(declare-fun call!31871 () Bool)

(assert (=> b!524196 (= e!305732 call!31871)))

(declare-fun d!80711 () Bool)

(declare-fun res!321147 () Bool)

(assert (=> d!80711 (=> res!321147 e!305733)))

(assert (=> d!80711 (= res!321147 (bvsge #b00000000000000000000000000000000 (size!16377 a!3235)))))

(assert (=> d!80711 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10168) e!305733)))

(declare-fun bm!31868 () Bool)

(assert (=> bm!31868 (= call!31871 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61829 (Cons!10167 (select (arr!16013 a!3235) #b00000000000000000000000000000000) Nil!10168) Nil!10168)))))

(declare-fun b!524197 () Bool)

(declare-fun contains!2772 (List!10171 (_ BitVec 64)) Bool)

(assert (=> b!524197 (= e!305731 (contains!2772 Nil!10168 (select (arr!16013 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524198 () Bool)

(assert (=> b!524198 (= e!305732 call!31871)))

(assert (= (and d!80711 (not res!321147)) b!524195))

(assert (= (and b!524195 res!321149) b!524197))

(assert (= (and b!524195 res!321148) b!524194))

(assert (= (and b!524194 c!61829) b!524196))

(assert (= (and b!524194 (not c!61829)) b!524198))

(assert (= (or b!524196 b!524198) bm!31868))

(assert (=> b!524194 m!504661))

(assert (=> b!524194 m!504661))

(assert (=> b!524194 m!504735))

(assert (=> b!524195 m!504661))

(assert (=> b!524195 m!504661))

(assert (=> b!524195 m!504735))

(assert (=> bm!31868 m!504661))

(declare-fun m!504843 () Bool)

(assert (=> bm!31868 m!504843))

(assert (=> b!524197 m!504661))

(assert (=> b!524197 m!504661))

(declare-fun m!504845 () Bool)

(assert (=> b!524197 m!504845))

(assert (=> b!523875 d!80711))

(declare-fun b!524199 () Bool)

(declare-fun c!61832 () Bool)

(declare-fun lt!240536 () (_ BitVec 64))

(assert (=> b!524199 (= c!61832 (= lt!240536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305734 () SeekEntryResult!4480)

(declare-fun e!305736 () SeekEntryResult!4480)

(assert (=> b!524199 (= e!305734 e!305736)))

(declare-fun b!524200 () Bool)

(declare-fun e!305735 () SeekEntryResult!4480)

(assert (=> b!524200 (= e!305735 e!305734)))

(declare-fun lt!240538 () SeekEntryResult!4480)

(assert (=> b!524200 (= lt!240536 (select (arr!16013 a!3235) (index!20131 lt!240538)))))

(declare-fun c!61831 () Bool)

(assert (=> b!524200 (= c!61831 (= lt!240536 (select (arr!16013 a!3235) j!176)))))

(declare-fun b!524201 () Bool)

(assert (=> b!524201 (= e!305735 Undefined!4480)))

(declare-fun d!80713 () Bool)

(declare-fun lt!240537 () SeekEntryResult!4480)

(assert (=> d!80713 (and (or (is-Undefined!4480 lt!240537) (not (is-Found!4480 lt!240537)) (and (bvsge (index!20130 lt!240537) #b00000000000000000000000000000000) (bvslt (index!20130 lt!240537) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240537) (is-Found!4480 lt!240537) (not (is-MissingZero!4480 lt!240537)) (and (bvsge (index!20129 lt!240537) #b00000000000000000000000000000000) (bvslt (index!20129 lt!240537) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240537) (is-Found!4480 lt!240537) (is-MissingZero!4480 lt!240537) (not (is-MissingVacant!4480 lt!240537)) (and (bvsge (index!20132 lt!240537) #b00000000000000000000000000000000) (bvslt (index!20132 lt!240537) (size!16377 a!3235)))) (or (is-Undefined!4480 lt!240537) (ite (is-Found!4480 lt!240537) (= (select (arr!16013 a!3235) (index!20130 lt!240537)) (select (arr!16013 a!3235) j!176)) (ite (is-MissingZero!4480 lt!240537) (= (select (arr!16013 a!3235) (index!20129 lt!240537)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4480 lt!240537) (= (select (arr!16013 a!3235) (index!20132 lt!240537)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80713 (= lt!240537 e!305735)))

(declare-fun c!61830 () Bool)

(assert (=> d!80713 (= c!61830 (and (is-Intermediate!4480 lt!240538) (undefined!5292 lt!240538)))))

(assert (=> d!80713 (= lt!240538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16013 a!3235) j!176) mask!3524) (select (arr!16013 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80713 (validMask!0 mask!3524)))

(assert (=> d!80713 (= (seekEntryOrOpen!0 (select (arr!16013 a!3235) j!176) a!3235 mask!3524) lt!240537)))

(declare-fun b!524202 () Bool)

(assert (=> b!524202 (= e!305734 (Found!4480 (index!20131 lt!240538)))))

(declare-fun b!524203 () Bool)

(assert (=> b!524203 (= e!305736 (MissingZero!4480 (index!20131 lt!240538)))))

(declare-fun b!524204 () Bool)

(assert (=> b!524204 (= e!305736 (seekKeyOrZeroReturnVacant!0 (x!49108 lt!240538) (index!20131 lt!240538) (index!20131 lt!240538) (select (arr!16013 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80713 c!61830) b!524201))

(assert (= (and d!80713 (not c!61830)) b!524200))

(assert (= (and b!524200 c!61831) b!524202))

(assert (= (and b!524200 (not c!61831)) b!524199))

(assert (= (and b!524199 c!61832) b!524203))

(assert (= (and b!524199 (not c!61832)) b!524204))

(declare-fun m!504847 () Bool)

(assert (=> b!524200 m!504847))

(declare-fun m!504849 () Bool)

(assert (=> d!80713 m!504849))

(declare-fun m!504851 () Bool)

(assert (=> d!80713 m!504851))

(assert (=> d!80713 m!504605))

(assert (=> d!80713 m!504599))

(assert (=> d!80713 m!504621))

(assert (=> d!80713 m!504621))

(assert (=> d!80713 m!504599))

(declare-fun m!504853 () Bool)

(assert (=> d!80713 m!504853))

(declare-fun m!504855 () Bool)

(assert (=> d!80713 m!504855))

(assert (=> b!524204 m!504599))

(declare-fun m!504857 () Bool)

(assert (=> b!524204 m!504857))

(assert (=> b!523881 d!80713))

(declare-fun d!80715 () Bool)

(assert (=> d!80715 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47620 d!80715))

(declare-fun d!80723 () Bool)

(assert (=> d!80723 (= (array_inv!11809 a!3235) (bvsge (size!16377 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47620 d!80723))

(declare-fun d!80725 () Bool)

(assert (=> d!80725 (= (validKeyInArray!0 (select (arr!16013 a!3235) j!176)) (and (not (= (select (arr!16013 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16013 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523882 d!80725))

(push 1)

(assert (not b!524121))

(assert (not b!524068))

(assert (not b!524194))

(assert (not b!524049))

(assert (not b!524023))

(assert (not bm!31857))

(assert (not b!524112))

(assert (not b!524197))

(assert (not b!524195))

(assert (not b!523961))

(assert (not b!524204))

(assert (not b!523926))

(assert (not bm!31858))

(assert (not d!80713))

(assert (not d!80689))

(assert (not b!524183))

(assert (not d!80655))

(assert (not d!80647))

(assert (not d!80687))

(assert (not d!80693))

(assert (not d!80691))

(assert (not bm!31868))

(assert (not b!524070))

(assert (not b!524051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

