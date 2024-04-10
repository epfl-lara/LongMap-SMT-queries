; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45400 () Bool)

(assert start!45400)

(declare-fun b!498963 () Bool)

(declare-fun res!300993 () Bool)

(declare-fun e!292421 () Bool)

(assert (=> b!498963 (=> (not res!300993) (not e!292421))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498963 (= res!300993 (validKeyInArray!0 k!2280))))

(declare-fun b!498964 () Bool)

(declare-fun e!292417 () Bool)

(assert (=> b!498964 (= e!292417 false)))

(declare-fun b!498965 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32225 0))(
  ( (array!32226 (arr!15494 (Array (_ BitVec 32) (_ BitVec 64))) (size!15858 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32225)

(declare-fun e!292418 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3961 0))(
  ( (MissingZero!3961 (index!18026 (_ BitVec 32))) (Found!3961 (index!18027 (_ BitVec 32))) (Intermediate!3961 (undefined!4773 Bool) (index!18028 (_ BitVec 32)) (x!47070 (_ BitVec 32))) (Undefined!3961) (MissingVacant!3961 (index!18029 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32225 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!498965 (= e!292418 (= (seekEntryOrOpen!0 (select (arr!15494 a!3235) j!176) a!3235 mask!3524) (Found!3961 j!176)))))

(declare-fun b!498966 () Bool)

(declare-fun e!292422 () Bool)

(assert (=> b!498966 (= e!292421 e!292422)))

(declare-fun res!300997 () Bool)

(assert (=> b!498966 (=> (not res!300997) (not e!292422))))

(declare-fun lt!226136 () SeekEntryResult!3961)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498966 (= res!300997 (or (= lt!226136 (MissingZero!3961 i!1204)) (= lt!226136 (MissingVacant!3961 i!1204))))))

(assert (=> b!498966 (= lt!226136 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!300994 () Bool)

(assert (=> start!45400 (=> (not res!300994) (not e!292421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45400 (= res!300994 (validMask!0 mask!3524))))

(assert (=> start!45400 e!292421))

(assert (=> start!45400 true))

(declare-fun array_inv!11290 (array!32225) Bool)

(assert (=> start!45400 (array_inv!11290 a!3235)))

(declare-fun b!498967 () Bool)

(declare-fun res!300992 () Bool)

(assert (=> b!498967 (=> (not res!300992) (not e!292422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32225 (_ BitVec 32)) Bool)

(assert (=> b!498967 (= res!300992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498968 () Bool)

(declare-fun res!300999 () Bool)

(assert (=> b!498968 (=> (not res!300999) (not e!292422))))

(declare-datatypes ((List!9652 0))(
  ( (Nil!9649) (Cons!9648 (h!10522 (_ BitVec 64)) (t!15880 List!9652)) )
))
(declare-fun arrayNoDuplicates!0 (array!32225 (_ BitVec 32) List!9652) Bool)

(assert (=> b!498968 (= res!300999 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9649))))

(declare-fun b!498969 () Bool)

(declare-fun res!300989 () Bool)

(assert (=> b!498969 (=> (not res!300989) (not e!292421))))

(declare-fun arrayContainsKey!0 (array!32225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498969 (= res!300989 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498970 () Bool)

(declare-datatypes ((Unit!14920 0))(
  ( (Unit!14921) )
))
(declare-fun e!292419 () Unit!14920)

(declare-fun Unit!14922 () Unit!14920)

(assert (=> b!498970 (= e!292419 Unit!14922)))

(declare-fun lt!226129 () (_ BitVec 32))

(declare-fun lt!226135 () SeekEntryResult!3961)

(declare-fun lt!226132 () Unit!14920)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14920)

(assert (=> b!498970 (= lt!226132 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226129 #b00000000000000000000000000000000 (index!18028 lt!226135) (x!47070 lt!226135) mask!3524))))

(declare-fun lt!226131 () array!32225)

(declare-fun res!300995 () Bool)

(declare-fun lt!226134 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32225 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!498970 (= res!300995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226129 lt!226134 lt!226131 mask!3524) (Intermediate!3961 false (index!18028 lt!226135) (x!47070 lt!226135))))))

(assert (=> b!498970 (=> (not res!300995) (not e!292417))))

(assert (=> b!498970 e!292417))

(declare-fun b!498971 () Bool)

(declare-fun res!300996 () Bool)

(assert (=> b!498971 (=> (not res!300996) (not e!292421))))

(assert (=> b!498971 (= res!300996 (validKeyInArray!0 (select (arr!15494 a!3235) j!176)))))

(declare-fun b!498972 () Bool)

(declare-fun e!292420 () Bool)

(declare-fun e!292415 () Bool)

(assert (=> b!498972 (= e!292420 e!292415)))

(declare-fun res!300991 () Bool)

(assert (=> b!498972 (=> res!300991 e!292415)))

(assert (=> b!498972 (= res!300991 (or (bvsgt #b00000000000000000000000000000000 (x!47070 lt!226135)) (bvsgt (x!47070 lt!226135) #b01111111111111111111111111111110) (bvslt lt!226129 #b00000000000000000000000000000000) (bvsge lt!226129 (size!15858 a!3235)) (bvslt (index!18028 lt!226135) #b00000000000000000000000000000000) (bvsge (index!18028 lt!226135) (size!15858 a!3235)) (not (= lt!226135 (Intermediate!3961 false (index!18028 lt!226135) (x!47070 lt!226135))))))))

(assert (=> b!498972 (and (or (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226130 () Unit!14920)

(assert (=> b!498972 (= lt!226130 e!292419)))

(declare-fun c!59264 () Bool)

(assert (=> b!498972 (= c!59264 (= (select (arr!15494 a!3235) (index!18028 lt!226135)) (select (arr!15494 a!3235) j!176)))))

(assert (=> b!498972 (and (bvslt (x!47070 lt!226135) #b01111111111111111111111111111110) (or (= (select (arr!15494 a!3235) (index!18028 lt!226135)) (select (arr!15494 a!3235) j!176)) (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15494 a!3235) (index!18028 lt!226135)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498973 () Bool)

(assert (=> b!498973 (= e!292422 (not e!292420))))

(declare-fun res!300990 () Bool)

(assert (=> b!498973 (=> res!300990 e!292420)))

(declare-fun lt!226137 () (_ BitVec 32))

(assert (=> b!498973 (= res!300990 (= lt!226135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226137 lt!226134 lt!226131 mask!3524)))))

(assert (=> b!498973 (= lt!226135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226129 (select (arr!15494 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498973 (= lt!226137 (toIndex!0 lt!226134 mask!3524))))

(assert (=> b!498973 (= lt!226134 (select (store (arr!15494 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498973 (= lt!226129 (toIndex!0 (select (arr!15494 a!3235) j!176) mask!3524))))

(assert (=> b!498973 (= lt!226131 (array!32226 (store (arr!15494 a!3235) i!1204 k!2280) (size!15858 a!3235)))))

(assert (=> b!498973 e!292418))

(declare-fun res!300998 () Bool)

(assert (=> b!498973 (=> (not res!300998) (not e!292418))))

(assert (=> b!498973 (= res!300998 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226138 () Unit!14920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14920)

(assert (=> b!498973 (= lt!226138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498974 () Bool)

(declare-fun res!301001 () Bool)

(assert (=> b!498974 (=> (not res!301001) (not e!292421))))

(assert (=> b!498974 (= res!301001 (and (= (size!15858 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15858 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15858 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498975 () Bool)

(declare-fun Unit!14923 () Unit!14920)

(assert (=> b!498975 (= e!292419 Unit!14923)))

(declare-fun b!498976 () Bool)

(declare-fun res!301000 () Bool)

(assert (=> b!498976 (=> res!301000 e!292420)))

(assert (=> b!498976 (= res!301000 (or (undefined!4773 lt!226135) (not (is-Intermediate!3961 lt!226135))))))

(declare-fun b!498977 () Bool)

(assert (=> b!498977 (= e!292415 true)))

(declare-fun lt!226133 () SeekEntryResult!3961)

(assert (=> b!498977 (= lt!226133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226129 lt!226134 lt!226131 mask!3524))))

(assert (= (and start!45400 res!300994) b!498974))

(assert (= (and b!498974 res!301001) b!498971))

(assert (= (and b!498971 res!300996) b!498963))

(assert (= (and b!498963 res!300993) b!498969))

(assert (= (and b!498969 res!300989) b!498966))

(assert (= (and b!498966 res!300997) b!498967))

(assert (= (and b!498967 res!300992) b!498968))

(assert (= (and b!498968 res!300999) b!498973))

(assert (= (and b!498973 res!300998) b!498965))

(assert (= (and b!498973 (not res!300990)) b!498976))

(assert (= (and b!498976 (not res!301000)) b!498972))

(assert (= (and b!498972 c!59264) b!498970))

(assert (= (and b!498972 (not c!59264)) b!498975))

(assert (= (and b!498970 res!300995) b!498964))

(assert (= (and b!498972 (not res!300991)) b!498977))

(declare-fun m!480195 () Bool)

(assert (=> start!45400 m!480195))

(declare-fun m!480197 () Bool)

(assert (=> start!45400 m!480197))

(declare-fun m!480199 () Bool)

(assert (=> b!498969 m!480199))

(declare-fun m!480201 () Bool)

(assert (=> b!498965 m!480201))

(assert (=> b!498965 m!480201))

(declare-fun m!480203 () Bool)

(assert (=> b!498965 m!480203))

(declare-fun m!480205 () Bool)

(assert (=> b!498967 m!480205))

(declare-fun m!480207 () Bool)

(assert (=> b!498963 m!480207))

(assert (=> b!498971 m!480201))

(assert (=> b!498971 m!480201))

(declare-fun m!480209 () Bool)

(assert (=> b!498971 m!480209))

(declare-fun m!480211 () Bool)

(assert (=> b!498966 m!480211))

(declare-fun m!480213 () Bool)

(assert (=> b!498968 m!480213))

(declare-fun m!480215 () Bool)

(assert (=> b!498972 m!480215))

(assert (=> b!498972 m!480201))

(declare-fun m!480217 () Bool)

(assert (=> b!498970 m!480217))

(declare-fun m!480219 () Bool)

(assert (=> b!498970 m!480219))

(assert (=> b!498973 m!480201))

(declare-fun m!480221 () Bool)

(assert (=> b!498973 m!480221))

(declare-fun m!480223 () Bool)

(assert (=> b!498973 m!480223))

(declare-fun m!480225 () Bool)

(assert (=> b!498973 m!480225))

(declare-fun m!480227 () Bool)

(assert (=> b!498973 m!480227))

(declare-fun m!480229 () Bool)

(assert (=> b!498973 m!480229))

(declare-fun m!480231 () Bool)

(assert (=> b!498973 m!480231))

(assert (=> b!498973 m!480201))

(declare-fun m!480233 () Bool)

(assert (=> b!498973 m!480233))

(assert (=> b!498973 m!480201))

(declare-fun m!480235 () Bool)

(assert (=> b!498973 m!480235))

(assert (=> b!498977 m!480219))

(push 1)

