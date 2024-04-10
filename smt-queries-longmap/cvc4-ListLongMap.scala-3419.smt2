; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47440 () Bool)

(assert start!47440)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!304601 () Bool)

(declare-datatypes ((array!33266 0))(
  ( (array!33267 (arr!15989 (Array (_ BitVec 32) (_ BitVec 64))) (size!16353 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33266)

(declare-fun b!522208 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4456 0))(
  ( (MissingZero!4456 (index!20027 (_ BitVec 32))) (Found!4456 (index!20028 (_ BitVec 32))) (Intermediate!4456 (undefined!5268 Bool) (index!20029 (_ BitVec 32)) (x!49002 (_ BitVec 32))) (Undefined!4456) (MissingVacant!4456 (index!20030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33266 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!522208 (= e!304601 (= (seekEntryOrOpen!0 (select (arr!15989 a!3235) j!176) a!3235 mask!3524) (Found!4456 j!176)))))

(declare-fun b!522209 () Bool)

(declare-fun res!319905 () Bool)

(declare-fun e!304604 () Bool)

(assert (=> b!522209 (=> (not res!319905) (not e!304604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522209 (= res!319905 (validKeyInArray!0 (select (arr!15989 a!3235) j!176)))))

(declare-fun b!522210 () Bool)

(declare-fun res!319898 () Bool)

(assert (=> b!522210 (=> (not res!319898) (not e!304604))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522210 (= res!319898 (and (= (size!16353 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16353 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16353 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522211 () Bool)

(declare-fun res!319900 () Bool)

(assert (=> b!522211 (=> (not res!319900) (not e!304604))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522211 (= res!319900 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522212 () Bool)

(declare-fun res!319904 () Bool)

(declare-fun e!304605 () Bool)

(assert (=> b!522212 (=> (not res!319904) (not e!304605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33266 (_ BitVec 32)) Bool)

(assert (=> b!522212 (= res!319904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522214 () Bool)

(declare-fun e!304603 () Bool)

(assert (=> b!522214 (= e!304605 (not e!304603))))

(declare-fun res!319906 () Bool)

(assert (=> b!522214 (=> res!319906 e!304603)))

(declare-fun lt!239455 () (_ BitVec 64))

(declare-fun lt!239458 () SeekEntryResult!4456)

(declare-fun lt!239459 () array!33266)

(declare-fun lt!239461 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33266 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!522214 (= res!319906 (= lt!239458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239461 lt!239455 lt!239459 mask!3524)))))

(declare-fun lt!239453 () (_ BitVec 32))

(assert (=> b!522214 (= lt!239458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239453 (select (arr!15989 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522214 (= lt!239461 (toIndex!0 lt!239455 mask!3524))))

(assert (=> b!522214 (= lt!239455 (select (store (arr!15989 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522214 (= lt!239453 (toIndex!0 (select (arr!15989 a!3235) j!176) mask!3524))))

(assert (=> b!522214 (= lt!239459 (array!33267 (store (arr!15989 a!3235) i!1204 k!2280) (size!16353 a!3235)))))

(assert (=> b!522214 e!304601))

(declare-fun res!319896 () Bool)

(assert (=> b!522214 (=> (not res!319896) (not e!304601))))

(assert (=> b!522214 (= res!319896 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16276 0))(
  ( (Unit!16277) )
))
(declare-fun lt!239456 () Unit!16276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16276)

(assert (=> b!522214 (= lt!239456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522215 () Bool)

(declare-fun e!304600 () Bool)

(assert (=> b!522215 (= e!304600 false)))

(declare-fun b!522216 () Bool)

(declare-fun res!319902 () Bool)

(assert (=> b!522216 (=> (not res!319902) (not e!304605))))

(declare-datatypes ((List!10147 0))(
  ( (Nil!10144) (Cons!10143 (h!11065 (_ BitVec 64)) (t!16375 List!10147)) )
))
(declare-fun arrayNoDuplicates!0 (array!33266 (_ BitVec 32) List!10147) Bool)

(assert (=> b!522216 (= res!319902 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10144))))

(declare-fun b!522217 () Bool)

(declare-fun e!304602 () Unit!16276)

(declare-fun Unit!16278 () Unit!16276)

(assert (=> b!522217 (= e!304602 Unit!16278)))

(declare-fun b!522218 () Bool)

(assert (=> b!522218 (= e!304604 e!304605)))

(declare-fun res!319903 () Bool)

(assert (=> b!522218 (=> (not res!319903) (not e!304605))))

(declare-fun lt!239457 () SeekEntryResult!4456)

(assert (=> b!522218 (= res!319903 (or (= lt!239457 (MissingZero!4456 i!1204)) (= lt!239457 (MissingVacant!4456 i!1204))))))

(assert (=> b!522218 (= lt!239457 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522219 () Bool)

(assert (=> b!522219 (= e!304603 true)))

(assert (=> b!522219 (and (or (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239454 () Unit!16276)

(assert (=> b!522219 (= lt!239454 e!304602)))

(declare-fun c!61457 () Bool)

(assert (=> b!522219 (= c!61457 (= (select (arr!15989 a!3235) (index!20029 lt!239458)) (select (arr!15989 a!3235) j!176)))))

(assert (=> b!522219 (and (bvslt (x!49002 lt!239458) #b01111111111111111111111111111110) (or (= (select (arr!15989 a!3235) (index!20029 lt!239458)) (select (arr!15989 a!3235) j!176)) (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15989 a!3235) (index!20029 lt!239458)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!319897 () Bool)

(assert (=> start!47440 (=> (not res!319897) (not e!304604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47440 (= res!319897 (validMask!0 mask!3524))))

(assert (=> start!47440 e!304604))

(assert (=> start!47440 true))

(declare-fun array_inv!11785 (array!33266) Bool)

(assert (=> start!47440 (array_inv!11785 a!3235)))

(declare-fun b!522213 () Bool)

(declare-fun res!319901 () Bool)

(assert (=> b!522213 (=> res!319901 e!304603)))

(assert (=> b!522213 (= res!319901 (or (undefined!5268 lt!239458) (not (is-Intermediate!4456 lt!239458))))))

(declare-fun b!522220 () Bool)

(declare-fun Unit!16279 () Unit!16276)

(assert (=> b!522220 (= e!304602 Unit!16279)))

(declare-fun lt!239460 () Unit!16276)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16276)

(assert (=> b!522220 (= lt!239460 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239453 #b00000000000000000000000000000000 (index!20029 lt!239458) (x!49002 lt!239458) mask!3524))))

(declare-fun res!319899 () Bool)

(assert (=> b!522220 (= res!319899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239453 lt!239455 lt!239459 mask!3524) (Intermediate!4456 false (index!20029 lt!239458) (x!49002 lt!239458))))))

(assert (=> b!522220 (=> (not res!319899) (not e!304600))))

(assert (=> b!522220 e!304600))

(declare-fun b!522221 () Bool)

(declare-fun res!319907 () Bool)

(assert (=> b!522221 (=> (not res!319907) (not e!304604))))

(assert (=> b!522221 (= res!319907 (validKeyInArray!0 k!2280))))

(assert (= (and start!47440 res!319897) b!522210))

(assert (= (and b!522210 res!319898) b!522209))

(assert (= (and b!522209 res!319905) b!522221))

(assert (= (and b!522221 res!319907) b!522211))

(assert (= (and b!522211 res!319900) b!522218))

(assert (= (and b!522218 res!319903) b!522212))

(assert (= (and b!522212 res!319904) b!522216))

(assert (= (and b!522216 res!319902) b!522214))

(assert (= (and b!522214 res!319896) b!522208))

(assert (= (and b!522214 (not res!319906)) b!522213))

(assert (= (and b!522213 (not res!319901)) b!522219))

(assert (= (and b!522219 c!61457) b!522220))

(assert (= (and b!522219 (not c!61457)) b!522217))

(assert (= (and b!522220 res!319899) b!522215))

(declare-fun m!503121 () Bool)

(assert (=> b!522211 m!503121))

(declare-fun m!503123 () Bool)

(assert (=> b!522219 m!503123))

(declare-fun m!503125 () Bool)

(assert (=> b!522219 m!503125))

(declare-fun m!503127 () Bool)

(assert (=> b!522221 m!503127))

(declare-fun m!503129 () Bool)

(assert (=> b!522218 m!503129))

(declare-fun m!503131 () Bool)

(assert (=> start!47440 m!503131))

(declare-fun m!503133 () Bool)

(assert (=> start!47440 m!503133))

(declare-fun m!503135 () Bool)

(assert (=> b!522212 m!503135))

(assert (=> b!522209 m!503125))

(assert (=> b!522209 m!503125))

(declare-fun m!503137 () Bool)

(assert (=> b!522209 m!503137))

(declare-fun m!503139 () Bool)

(assert (=> b!522214 m!503139))

(declare-fun m!503141 () Bool)

(assert (=> b!522214 m!503141))

(assert (=> b!522214 m!503125))

(declare-fun m!503143 () Bool)

(assert (=> b!522214 m!503143))

(assert (=> b!522214 m!503125))

(declare-fun m!503145 () Bool)

(assert (=> b!522214 m!503145))

(declare-fun m!503147 () Bool)

(assert (=> b!522214 m!503147))

(declare-fun m!503149 () Bool)

(assert (=> b!522214 m!503149))

(declare-fun m!503151 () Bool)

(assert (=> b!522214 m!503151))

(assert (=> b!522214 m!503125))

(declare-fun m!503153 () Bool)

(assert (=> b!522214 m!503153))

(assert (=> b!522208 m!503125))

(assert (=> b!522208 m!503125))

(declare-fun m!503155 () Bool)

(assert (=> b!522208 m!503155))

(declare-fun m!503157 () Bool)

(assert (=> b!522220 m!503157))

(declare-fun m!503159 () Bool)

(assert (=> b!522220 m!503159))

(declare-fun m!503161 () Bool)

(assert (=> b!522216 m!503161))

(push 1)

