; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44796 () Bool)

(assert start!44796)

(declare-fun b!491867 () Bool)

(declare-fun res!294812 () Bool)

(declare-fun e!288956 () Bool)

(assert (=> b!491867 (=> (not res!294812) (not e!288956))))

(declare-datatypes ((array!31855 0))(
  ( (array!31856 (arr!15315 (Array (_ BitVec 32) (_ BitVec 64))) (size!15679 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31855)

(declare-datatypes ((List!9473 0))(
  ( (Nil!9470) (Cons!9469 (h!10331 (_ BitVec 64)) (t!15701 List!9473)) )
))
(declare-fun arrayNoDuplicates!0 (array!31855 (_ BitVec 32) List!9473) Bool)

(assert (=> b!491867 (= res!294812 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9470))))

(declare-fun b!491868 () Bool)

(declare-fun res!294806 () Bool)

(assert (=> b!491868 (=> (not res!294806) (not e!288956))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31855 (_ BitVec 32)) Bool)

(assert (=> b!491868 (= res!294806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!294807 () Bool)

(declare-fun e!288960 () Bool)

(assert (=> start!44796 (=> (not res!294807) (not e!288960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44796 (= res!294807 (validMask!0 mask!3524))))

(assert (=> start!44796 e!288960))

(assert (=> start!44796 true))

(declare-fun array_inv!11111 (array!31855) Bool)

(assert (=> start!44796 (array_inv!11111 a!3235)))

(declare-fun e!288958 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!491869 () Bool)

(declare-datatypes ((SeekEntryResult!3782 0))(
  ( (MissingZero!3782 (index!17307 (_ BitVec 32))) (Found!3782 (index!17308 (_ BitVec 32))) (Intermediate!3782 (undefined!4594 Bool) (index!17309 (_ BitVec 32)) (x!46392 (_ BitVec 32))) (Undefined!3782) (MissingVacant!3782 (index!17310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31855 (_ BitVec 32)) SeekEntryResult!3782)

(assert (=> b!491869 (= e!288958 (= (seekEntryOrOpen!0 (select (arr!15315 a!3235) j!176) a!3235 mask!3524) (Found!3782 j!176)))))

(declare-fun b!491870 () Bool)

(declare-fun e!288959 () Bool)

(assert (=> b!491870 (= e!288956 (not e!288959))))

(declare-fun res!294811 () Bool)

(assert (=> b!491870 (=> res!294811 e!288959)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31855 (_ BitVec 32)) SeekEntryResult!3782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491870 (= res!294811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) (select (arr!15315 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) (array!31856 (store (arr!15315 a!3235) i!1204 k!2280) (size!15679 a!3235)) mask!3524)))))

(assert (=> b!491870 e!288958))

(declare-fun res!294803 () Bool)

(assert (=> b!491870 (=> (not res!294803) (not e!288958))))

(assert (=> b!491870 (= res!294803 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14510 0))(
  ( (Unit!14511) )
))
(declare-fun lt!222381 () Unit!14510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14510)

(assert (=> b!491870 (= lt!222381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491871 () Bool)

(assert (=> b!491871 (= e!288960 e!288956)))

(declare-fun res!294808 () Bool)

(assert (=> b!491871 (=> (not res!294808) (not e!288956))))

(declare-fun lt!222382 () SeekEntryResult!3782)

(assert (=> b!491871 (= res!294808 (or (= lt!222382 (MissingZero!3782 i!1204)) (= lt!222382 (MissingVacant!3782 i!1204))))))

(assert (=> b!491871 (= lt!222382 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491872 () Bool)

(declare-fun res!294809 () Bool)

(assert (=> b!491872 (=> (not res!294809) (not e!288960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491872 (= res!294809 (validKeyInArray!0 k!2280))))

(declare-fun b!491873 () Bool)

(declare-fun res!294804 () Bool)

(assert (=> b!491873 (=> (not res!294804) (not e!288960))))

(declare-fun arrayContainsKey!0 (array!31855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491873 (= res!294804 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491874 () Bool)

(declare-fun res!294805 () Bool)

(assert (=> b!491874 (=> (not res!294805) (not e!288960))))

(assert (=> b!491874 (= res!294805 (and (= (size!15679 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15679 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15679 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491875 () Bool)

(declare-fun res!294810 () Bool)

(assert (=> b!491875 (=> (not res!294810) (not e!288960))))

(assert (=> b!491875 (= res!294810 (validKeyInArray!0 (select (arr!15315 a!3235) j!176)))))

(declare-fun b!491876 () Bool)

(assert (=> b!491876 (= e!288959 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (= (and start!44796 res!294807) b!491874))

(assert (= (and b!491874 res!294805) b!491875))

(assert (= (and b!491875 res!294810) b!491872))

(assert (= (and b!491872 res!294809) b!491873))

(assert (= (and b!491873 res!294804) b!491871))

(assert (= (and b!491871 res!294808) b!491868))

(assert (= (and b!491868 res!294806) b!491867))

(assert (= (and b!491867 res!294812) b!491870))

(assert (= (and b!491870 res!294803) b!491869))

(assert (= (and b!491870 (not res!294811)) b!491876))

(declare-fun m!472617 () Bool)

(assert (=> b!491867 m!472617))

(declare-fun m!472619 () Bool)

(assert (=> start!44796 m!472619))

(declare-fun m!472621 () Bool)

(assert (=> start!44796 m!472621))

(declare-fun m!472623 () Bool)

(assert (=> b!491873 m!472623))

(declare-fun m!472625 () Bool)

(assert (=> b!491872 m!472625))

(declare-fun m!472627 () Bool)

(assert (=> b!491870 m!472627))

(declare-fun m!472629 () Bool)

(assert (=> b!491870 m!472629))

(declare-fun m!472631 () Bool)

(assert (=> b!491870 m!472631))

(declare-fun m!472633 () Bool)

(assert (=> b!491870 m!472633))

(declare-fun m!472635 () Bool)

(assert (=> b!491870 m!472635))

(declare-fun m!472637 () Bool)

(assert (=> b!491870 m!472637))

(assert (=> b!491870 m!472635))

(assert (=> b!491870 m!472633))

(declare-fun m!472639 () Bool)

(assert (=> b!491870 m!472639))

(assert (=> b!491870 m!472631))

(declare-fun m!472641 () Bool)

(assert (=> b!491870 m!472641))

(assert (=> b!491870 m!472635))

(declare-fun m!472643 () Bool)

(assert (=> b!491870 m!472643))

(assert (=> b!491870 m!472631))

(assert (=> b!491870 m!472639))

(assert (=> b!491869 m!472635))

(assert (=> b!491869 m!472635))

(declare-fun m!472645 () Bool)

(assert (=> b!491869 m!472645))

(declare-fun m!472647 () Bool)

(assert (=> b!491868 m!472647))

(assert (=> b!491875 m!472635))

(assert (=> b!491875 m!472635))

(declare-fun m!472649 () Bool)

(assert (=> b!491875 m!472649))

(declare-fun m!472651 () Bool)

(assert (=> b!491871 m!472651))

(push 1)

(assert (not b!491873))

(assert (not start!44796))

(assert (not b!491869))

(assert (not b!491868))

(assert (not b!491872))

(assert (not b!491870))

(assert (not b!491875))

(assert (not b!491871))

(assert (not b!491867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78013 () Bool)

(assert (=> d!78013 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491872 d!78013))

(declare-fun b!492079 () Bool)

(declare-fun e!289083 () SeekEntryResult!3782)

(declare-fun e!289081 () SeekEntryResult!3782)

(assert (=> b!492079 (= e!289083 e!289081)))

(declare-fun lt!222462 () (_ BitVec 64))

(declare-fun lt!222461 () SeekEntryResult!3782)

(assert (=> b!492079 (= lt!222462 (select (arr!15315 a!3235) (index!17309 lt!222461)))))

(declare-fun c!58849 () Bool)

(assert (=> b!492079 (= c!58849 (= lt!222462 k!2280))))

(declare-fun b!492080 () Bool)

(assert (=> b!492080 (= e!289083 Undefined!3782)))

(declare-fun b!492081 () Bool)

(declare-fun c!58851 () Bool)

(assert (=> b!492081 (= c!58851 (= lt!222462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289082 () SeekEntryResult!3782)

(assert (=> b!492081 (= e!289081 e!289082)))

(declare-fun b!492082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31855 (_ BitVec 32)) SeekEntryResult!3782)

(assert (=> b!492082 (= e!289082 (seekKeyOrZeroReturnVacant!0 (x!46392 lt!222461) (index!17309 lt!222461) (index!17309 lt!222461) k!2280 a!3235 mask!3524))))

(declare-fun d!78017 () Bool)

(declare-fun lt!222460 () SeekEntryResult!3782)

(assert (=> d!78017 (and (or (is-Undefined!3782 lt!222460) (not (is-Found!3782 lt!222460)) (and (bvsge (index!17308 lt!222460) #b00000000000000000000000000000000) (bvslt (index!17308 lt!222460) (size!15679 a!3235)))) (or (is-Undefined!3782 lt!222460) (is-Found!3782 lt!222460) (not (is-MissingZero!3782 lt!222460)) (and (bvsge (index!17307 lt!222460) #b00000000000000000000000000000000) (bvslt (index!17307 lt!222460) (size!15679 a!3235)))) (or (is-Undefined!3782 lt!222460) (is-Found!3782 lt!222460) (is-MissingZero!3782 lt!222460) (not (is-MissingVacant!3782 lt!222460)) (and (bvsge (index!17310 lt!222460) #b00000000000000000000000000000000) (bvslt (index!17310 lt!222460) (size!15679 a!3235)))) (or (is-Undefined!3782 lt!222460) (ite (is-Found!3782 lt!222460) (= (select (arr!15315 a!3235) (index!17308 lt!222460)) k!2280) (ite (is-MissingZero!3782 lt!222460) (= (select (arr!15315 a!3235) (index!17307 lt!222460)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3782 lt!222460) (= (select (arr!15315 a!3235) (index!17310 lt!222460)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78017 (= lt!222460 e!289083)))

(declare-fun c!58850 () Bool)

(assert (=> d!78017 (= c!58850 (and (is-Intermediate!3782 lt!222461) (undefined!4594 lt!222461)))))

(assert (=> d!78017 (= lt!222461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78017 (validMask!0 mask!3524)))

(assert (=> d!78017 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!222460)))

(declare-fun b!492083 () Bool)

(assert (=> b!492083 (= e!289082 (MissingZero!3782 (index!17309 lt!222461)))))

(declare-fun b!492084 () Bool)

(assert (=> b!492084 (= e!289081 (Found!3782 (index!17309 lt!222461)))))

(assert (= (and d!78017 c!58850) b!492080))

(assert (= (and d!78017 (not c!58850)) b!492079))

(assert (= (and b!492079 c!58849) b!492084))

(assert (= (and b!492079 (not c!58849)) b!492081))

(assert (= (and b!492081 c!58851) b!492083))

(assert (= (and b!492081 (not c!58851)) b!492082))

(declare-fun m!472789 () Bool)

(assert (=> b!492079 m!472789))

(declare-fun m!472791 () Bool)

(assert (=> b!492082 m!472791))

(declare-fun m!472793 () Bool)

(assert (=> d!78017 m!472793))

(declare-fun m!472795 () Bool)

(assert (=> d!78017 m!472795))

(assert (=> d!78017 m!472619))

(declare-fun m!472797 () Bool)

(assert (=> d!78017 m!472797))

(declare-fun m!472799 () Bool)

(assert (=> d!78017 m!472799))

(declare-fun m!472801 () Bool)

(assert (=> d!78017 m!472801))

(assert (=> d!78017 m!472799))

(assert (=> b!491871 d!78017))

(declare-fun b!492155 () Bool)

(declare-fun e!289129 () SeekEntryResult!3782)

(assert (=> b!492155 (= e!289129 (Intermediate!3782 false (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492156 () Bool)

(declare-fun e!289128 () Bool)

(declare-fun lt!222491 () SeekEntryResult!3782)

(assert (=> b!492156 (= e!289128 (bvsge (x!46392 lt!222491) #b01111111111111111111111111111110))))

(declare-fun b!492157 () Bool)

(assert (=> b!492157 (and (bvsge (index!17309 lt!222491) #b00000000000000000000000000000000) (bvslt (index!17309 lt!222491) (size!15679 a!3235)))))

(declare-fun e!289127 () Bool)

(assert (=> b!492157 (= e!289127 (= (select (arr!15315 a!3235) (index!17309 lt!222491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289126 () SeekEntryResult!3782)

(declare-fun b!492158 () Bool)

(assert (=> b!492158 (= e!289126 (Intermediate!3782 true (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun d!78035 () Bool)

(assert (=> d!78035 e!289128))

(declare-fun c!58879 () Bool)

(assert (=> d!78035 (= c!58879 (and (is-Intermediate!3782 lt!222491) (undefined!4594 lt!222491)))))

(assert (=> d!78035 (= lt!222491 e!289126)))

(declare-fun c!58877 () Bool)

(assert (=> d!78035 (= c!58877 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222492 () (_ BitVec 64))

(assert (=> d!78035 (= lt!222492 (select (arr!15315 a!3235) (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524)))))

(assert (=> d!78035 (validMask!0 mask!3524)))

(assert (=> d!78035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) (select (arr!15315 a!3235) j!176) a!3235 mask!3524) lt!222491)))

(declare-fun b!492159 () Bool)

(assert (=> b!492159 (and (bvsge (index!17309 lt!222491) #b00000000000000000000000000000000) (bvslt (index!17309 lt!222491) (size!15679 a!3235)))))

(declare-fun res!294947 () Bool)

(assert (=> b!492159 (= res!294947 (= (select (arr!15315 a!3235) (index!17309 lt!222491)) (select (arr!15315 a!3235) j!176)))))

(assert (=> b!492159 (=> res!294947 e!289127)))

(declare-fun e!289125 () Bool)

(assert (=> b!492159 (= e!289125 e!289127)))

(declare-fun b!492160 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492160 (= e!289129 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (arr!15315 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492161 () Bool)

(assert (=> b!492161 (and (bvsge (index!17309 lt!222491) #b00000000000000000000000000000000) (bvslt (index!17309 lt!222491) (size!15679 a!3235)))))

(declare-fun res!294945 () Bool)

(assert (=> b!492161 (= res!294945 (= (select (arr!15315 a!3235) (index!17309 lt!222491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492161 (=> res!294945 e!289127)))

(declare-fun b!492162 () Bool)

(assert (=> b!492162 (= e!289128 e!289125)))

(declare-fun res!294946 () Bool)

(assert (=> b!492162 (= res!294946 (and (is-Intermediate!3782 lt!222491) (not (undefined!4594 lt!222491)) (bvslt (x!46392 lt!222491) #b01111111111111111111111111111110) (bvsge (x!46392 lt!222491) #b00000000000000000000000000000000) (bvsge (x!46392 lt!222491) #b00000000000000000000000000000000)))))

(assert (=> b!492162 (=> (not res!294946) (not e!289125))))

(declare-fun b!492163 () Bool)

(assert (=> b!492163 (= e!289126 e!289129)))

(declare-fun c!58878 () Bool)

(assert (=> b!492163 (= c!58878 (or (= lt!222492 (select (arr!15315 a!3235) j!176)) (= (bvadd lt!222492 lt!222492) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!78035 c!58877) b!492158))

(assert (= (and d!78035 (not c!58877)) b!492163))

(assert (= (and b!492163 c!58878) b!492155))

(assert (= (and b!492163 (not c!58878)) b!492160))

(assert (= (and d!78035 c!58879) b!492156))

(assert (= (and d!78035 (not c!58879)) b!492162))

(assert (= (and b!492162 res!294946) b!492159))

(assert (= (and b!492159 (not res!294947)) b!492161))

(assert (= (and b!492161 (not res!294945)) b!492157))

(assert (=> d!78035 m!472633))

(declare-fun m!472855 () Bool)

(assert (=> d!78035 m!472855))

(assert (=> d!78035 m!472619))

(assert (=> b!492160 m!472633))

(declare-fun m!472857 () Bool)

(assert (=> b!492160 m!472857))

(assert (=> b!492160 m!472857))

(assert (=> b!492160 m!472635))

(declare-fun m!472859 () Bool)

(assert (=> b!492160 m!472859))

(declare-fun m!472861 () Bool)

(assert (=> b!492161 m!472861))

(assert (=> b!492159 m!472861))

(assert (=> b!492157 m!472861))

(assert (=> b!491870 d!78035))

(declare-fun d!78057 () Bool)

(declare-fun lt!222501 () (_ BitVec 32))

(declare-fun lt!222500 () (_ BitVec 32))

(assert (=> d!78057 (= lt!222501 (bvmul (bvxor lt!222500 (bvlshr lt!222500 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78057 (= lt!222500 ((_ extract 31 0) (bvand (bvxor (select (arr!15315 a!3235) j!176) (bvlshr (select (arr!15315 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78057 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294948 (let ((h!10336 ((_ extract 31 0) (bvand (bvxor (select (arr!15315 a!3235) j!176) (bvlshr (select (arr!15315 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46400 (bvmul (bvxor h!10336 (bvlshr h!10336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46400 (bvlshr x!46400 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294948 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294948 #b00000000000000000000000000000000))))))

(assert (=> d!78057 (= (toIndex!0 (select (arr!15315 a!3235) j!176) mask!3524) (bvand (bvxor lt!222501 (bvlshr lt!222501 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491870 d!78057))

(declare-fun b!492184 () Bool)

(declare-fun e!289147 () Bool)

(declare-fun call!31384 () Bool)

(assert (=> b!492184 (= e!289147 call!31384)))

(declare-fun d!78065 () Bool)

(declare-fun res!294959 () Bool)

(declare-fun e!289146 () Bool)

(assert (=> d!78065 (=> res!294959 e!289146)))

(assert (=> d!78065 (= res!294959 (bvsge j!176 (size!15679 a!3235)))))

(assert (=> d!78065 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289146)))

(declare-fun b!492185 () Bool)

(assert (=> b!492185 (= e!289146 e!289147)))

(declare-fun c!58885 () Bool)

(assert (=> b!492185 (= c!58885 (validKeyInArray!0 (select (arr!15315 a!3235) j!176)))))

(declare-fun b!492186 () Bool)

(declare-fun e!289145 () Bool)

(assert (=> b!492186 (= e!289147 e!289145)))

(declare-fun lt!222508 () (_ BitVec 64))

(assert (=> b!492186 (= lt!222508 (select (arr!15315 a!3235) j!176))))

(declare-fun lt!222510 () Unit!14510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31855 (_ BitVec 64) (_ BitVec 32)) Unit!14510)

(assert (=> b!492186 (= lt!222510 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222508 j!176))))

(assert (=> b!492186 (arrayContainsKey!0 a!3235 lt!222508 #b00000000000000000000000000000000)))

(declare-fun lt!222509 () Unit!14510)

(assert (=> b!492186 (= lt!222509 lt!222510)))

(declare-fun res!294960 () Bool)

(assert (=> b!492186 (= res!294960 (= (seekEntryOrOpen!0 (select (arr!15315 a!3235) j!176) a!3235 mask!3524) (Found!3782 j!176)))))

(assert (=> b!492186 (=> (not res!294960) (not e!289145))))

(declare-fun b!492187 () Bool)

(assert (=> b!492187 (= e!289145 call!31384)))

(declare-fun bm!31381 () Bool)

(assert (=> bm!31381 (= call!31384 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78065 (not res!294959)) b!492185))

(assert (= (and b!492185 c!58885) b!492186))

(assert (= (and b!492185 (not c!58885)) b!492184))

(assert (= (and b!492186 res!294960) b!492187))

(assert (= (or b!492187 b!492184) bm!31381))

(assert (=> b!492185 m!472635))

(assert (=> b!492185 m!472635))

(assert (=> b!492185 m!472649))

(assert (=> b!492186 m!472635))

(declare-fun m!472879 () Bool)

(assert (=> b!492186 m!472879))

(declare-fun m!472881 () Bool)

(assert (=> b!492186 m!472881))

(assert (=> b!492186 m!472635))

(assert (=> b!492186 m!472645))

(declare-fun m!472883 () Bool)

(assert (=> bm!31381 m!472883))

(assert (=> b!491870 d!78065))

(declare-fun d!78071 () Bool)

(assert (=> d!78071 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222513 () Unit!14510)

(declare-fun choose!38 (array!31855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14510)

(assert (=> d!78071 (= lt!222513 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78071 (validMask!0 mask!3524)))

(assert (=> d!78071 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222513)))

(declare-fun bs!15690 () Bool)

(assert (= bs!15690 d!78071))

(assert (=> bs!15690 m!472643))

(declare-fun m!472885 () Bool)

(assert (=> bs!15690 m!472885))

(assert (=> bs!15690 m!472619))

(assert (=> b!491870 d!78071))

(declare-fun d!78073 () Bool)

(declare-fun lt!222515 () (_ BitVec 32))

(declare-fun lt!222514 () (_ BitVec 32))

(assert (=> d!78073 (= lt!222515 (bvmul (bvxor lt!222514 (bvlshr lt!222514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78073 (= lt!222514 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78073 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294948 (let ((h!10336 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46400 (bvmul (bvxor h!10336 (bvlshr h!10336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46400 (bvlshr x!46400 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294948 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294948 #b00000000000000000000000000000000))))))

(assert (=> d!78073 (= (toIndex!0 (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!222515 (bvlshr lt!222515 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491870 d!78073))

(declare-fun e!289152 () SeekEntryResult!3782)

(declare-fun b!492188 () Bool)

(assert (=> b!492188 (= e!289152 (Intermediate!3782 false (toIndex!0 (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492189 () Bool)

(declare-fun e!289151 () Bool)

(declare-fun lt!222516 () SeekEntryResult!3782)

(assert (=> b!492189 (= e!289151 (bvsge (x!46392 lt!222516) #b01111111111111111111111111111110))))

(declare-fun b!492190 () Bool)

(assert (=> b!492190 (and (bvsge (index!17309 lt!222516) #b00000000000000000000000000000000) (bvslt (index!17309 lt!222516) (size!15679 (array!31856 (store (arr!15315 a!3235) i!1204 k!2280) (size!15679 a!3235)))))))

(declare-fun e!289150 () Bool)

(assert (=> b!492190 (= e!289150 (= (select (arr!15315 (array!31856 (store (arr!15315 a!3235) i!1204 k!2280) (size!15679 a!3235))) (index!17309 lt!222516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289149 () SeekEntryResult!3782)

(declare-fun b!492191 () Bool)

(assert (=> b!492191 (= e!289149 (Intermediate!3782 true (toIndex!0 (select (store (arr!15315 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun d!78075 () Bool)

(assert (=> d!78075 e!289151))

(declare-fun c!58888 () Bool)

(assert (=> d!78075 (= c!58888 (and (is-Intermediate!3782 lt!222516) (undefined!4594 lt!222516)))))

(assert (=> d!78075 (= lt!222516 e!289149)))

(declare-fun c!58886 () Bool)

(assert (=> d!78075 (= c!58886 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

