; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65144 () Bool)

(assert start!65144)

(declare-datatypes ((SeekEntryResult!7372 0))(
  ( (MissingZero!7372 (index!31856 (_ BitVec 32))) (Found!7372 (index!31857 (_ BitVec 32))) (Intermediate!7372 (undefined!8184 Bool) (index!31858 (_ BitVec 32)) (x!62858 (_ BitVec 32))) (Undefined!7372) (MissingVacant!7372 (index!31859 (_ BitVec 32))) )
))
(declare-fun lt!326324 () SeekEntryResult!7372)

(declare-datatypes ((array!41317 0))(
  ( (array!41318 (arr!19772 (Array (_ BitVec 32) (_ BitVec 64))) (size!20193 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41317)

(declare-fun b!735964 () Bool)

(declare-fun e!411738 () Bool)

(declare-fun lt!326321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!735964 (= e!411738 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326321 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326324)))))

(declare-fun b!735965 () Bool)

(declare-datatypes ((Unit!25084 0))(
  ( (Unit!25085) )
))
(declare-fun e!411743 () Unit!25084)

(declare-fun Unit!25086 () Unit!25084)

(assert (=> b!735965 (= e!411743 Unit!25086)))

(assert (=> b!735965 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326321 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326324)))

(declare-fun b!735966 () Bool)

(declare-fun res!494571 () Bool)

(declare-fun e!411744 () Bool)

(assert (=> b!735966 (=> (not res!494571) (not e!411744))))

(declare-fun e!411742 () Bool)

(assert (=> b!735966 (= res!494571 e!411742)))

(declare-fun c!81077 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735966 (= c!81077 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735967 () Bool)

(declare-fun res!494578 () Bool)

(declare-fun e!411737 () Bool)

(assert (=> b!735967 (=> (not res!494578) (not e!411737))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735967 (= res!494578 (validKeyInArray!0 k!2102))))

(declare-fun b!735968 () Bool)

(declare-fun e!411741 () Bool)

(declare-fun e!411746 () Bool)

(assert (=> b!735968 (= e!411741 e!411746)))

(declare-fun res!494583 () Bool)

(assert (=> b!735968 (=> (not res!494583) (not e!411746))))

(declare-fun lt!326333 () SeekEntryResult!7372)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!735968 (= res!494583 (= (seekEntryOrOpen!0 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326333))))

(assert (=> b!735968 (= lt!326333 (Found!7372 j!159))))

(declare-fun b!735969 () Bool)

(declare-fun res!494573 () Bool)

(assert (=> b!735969 (=> (not res!494573) (not e!411737))))

(declare-fun arrayContainsKey!0 (array!41317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735969 (= res!494573 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!735970 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!735970 (= e!411742 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) (Found!7372 j!159)))))

(declare-fun b!735971 () Bool)

(declare-fun e!411740 () Bool)

(assert (=> b!735971 (= e!411740 e!411744)))

(declare-fun res!494587 () Bool)

(assert (=> b!735971 (=> (not res!494587) (not e!411744))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735971 (= res!494587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19772 a!3186) j!159) mask!3328) (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326324))))

(assert (=> b!735971 (= lt!326324 (Intermediate!7372 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735972 () Bool)

(declare-fun e!411745 () Bool)

(assert (=> b!735972 (= e!411745 true)))

(declare-fun lt!326323 () SeekEntryResult!7372)

(declare-fun lt!326322 () (_ BitVec 64))

(declare-fun lt!326325 () array!41317)

(assert (=> b!735972 (= lt!326323 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326321 lt!326322 lt!326325 mask!3328))))

(declare-fun b!735973 () Bool)

(declare-fun res!494577 () Bool)

(assert (=> b!735973 (=> (not res!494577) (not e!411740))))

(declare-datatypes ((List!13774 0))(
  ( (Nil!13771) (Cons!13770 (h!14842 (_ BitVec 64)) (t!20089 List!13774)) )
))
(declare-fun arrayNoDuplicates!0 (array!41317 (_ BitVec 32) List!13774) Bool)

(assert (=> b!735973 (= res!494577 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13771))))

(declare-fun b!735974 () Bool)

(declare-fun res!494584 () Bool)

(assert (=> b!735974 (=> (not res!494584) (not e!411740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41317 (_ BitVec 32)) Bool)

(assert (=> b!735974 (= res!494584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735975 () Bool)

(declare-fun res!494576 () Bool)

(assert (=> b!735975 (=> (not res!494576) (not e!411737))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735975 (= res!494576 (and (= (size!20193 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20193 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20193 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735976 () Bool)

(declare-fun res!494580 () Bool)

(assert (=> b!735976 (=> (not res!494580) (not e!411740))))

(assert (=> b!735976 (= res!494580 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20193 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20193 a!3186))))))

(declare-fun b!735977 () Bool)

(declare-fun e!411739 () Bool)

(declare-fun e!411735 () Bool)

(assert (=> b!735977 (= e!411739 (not e!411735))))

(declare-fun res!494572 () Bool)

(assert (=> b!735977 (=> res!494572 e!411735)))

(declare-fun lt!326328 () SeekEntryResult!7372)

(assert (=> b!735977 (= res!494572 (or (not (is-Intermediate!7372 lt!326328)) (bvsge x!1131 (x!62858 lt!326328))))))

(declare-fun lt!326331 () SeekEntryResult!7372)

(assert (=> b!735977 (= lt!326331 (Found!7372 j!159))))

(assert (=> b!735977 e!411741))

(declare-fun res!494579 () Bool)

(assert (=> b!735977 (=> (not res!494579) (not e!411741))))

(assert (=> b!735977 (= res!494579 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326330 () Unit!25084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25084)

(assert (=> b!735977 (= lt!326330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735978 () Bool)

(assert (=> b!735978 (= e!411746 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326333))))

(declare-fun b!735979 () Bool)

(assert (=> b!735979 (= e!411735 e!411745)))

(declare-fun res!494585 () Bool)

(assert (=> b!735979 (=> res!494585 e!411745)))

(assert (=> b!735979 (= res!494585 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326321 #b00000000000000000000000000000000) (bvsge lt!326321 (size!20193 a!3186))))))

(declare-fun lt!326329 () Unit!25084)

(assert (=> b!735979 (= lt!326329 e!411743)))

(declare-fun c!81078 () Bool)

(declare-fun lt!326326 () Bool)

(assert (=> b!735979 (= c!81078 lt!326326)))

(assert (=> b!735979 (= lt!326326 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735979 (= lt!326321 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735980 () Bool)

(declare-fun res!494575 () Bool)

(assert (=> b!735980 (=> res!494575 e!411745)))

(assert (=> b!735980 (= res!494575 e!411738)))

(declare-fun c!81079 () Bool)

(assert (=> b!735980 (= c!81079 lt!326326)))

(declare-fun res!494586 () Bool)

(assert (=> start!65144 (=> (not res!494586) (not e!411737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65144 (= res!494586 (validMask!0 mask!3328))))

(assert (=> start!65144 e!411737))

(assert (=> start!65144 true))

(declare-fun array_inv!15568 (array!41317) Bool)

(assert (=> start!65144 (array_inv!15568 a!3186)))

(declare-fun b!735981 () Bool)

(declare-fun Unit!25087 () Unit!25084)

(assert (=> b!735981 (= e!411743 Unit!25087)))

(declare-fun lt!326320 () SeekEntryResult!7372)

(assert (=> b!735981 (= lt!326320 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735981 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326331)))

(declare-fun b!735982 () Bool)

(declare-fun res!494588 () Bool)

(assert (=> b!735982 (=> (not res!494588) (not e!411744))))

(assert (=> b!735982 (= res!494588 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19772 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735983 () Bool)

(declare-fun res!494574 () Bool)

(assert (=> b!735983 (=> (not res!494574) (not e!411737))))

(assert (=> b!735983 (= res!494574 (validKeyInArray!0 (select (arr!19772 a!3186) j!159)))))

(declare-fun b!735984 () Bool)

(assert (=> b!735984 (= e!411738 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326331)))))

(declare-fun b!735985 () Bool)

(assert (=> b!735985 (= e!411742 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326324))))

(declare-fun b!735986 () Bool)

(assert (=> b!735986 (= e!411744 e!411739)))

(declare-fun res!494581 () Bool)

(assert (=> b!735986 (=> (not res!494581) (not e!411739))))

(declare-fun lt!326327 () SeekEntryResult!7372)

(assert (=> b!735986 (= res!494581 (= lt!326327 lt!326328))))

(assert (=> b!735986 (= lt!326328 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326322 lt!326325 mask!3328))))

(assert (=> b!735986 (= lt!326327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326322 mask!3328) lt!326322 lt!326325 mask!3328))))

(assert (=> b!735986 (= lt!326322 (select (store (arr!19772 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735986 (= lt!326325 (array!41318 (store (arr!19772 a!3186) i!1173 k!2102) (size!20193 a!3186)))))

(declare-fun b!735987 () Bool)

(assert (=> b!735987 (= e!411737 e!411740)))

(declare-fun res!494582 () Bool)

(assert (=> b!735987 (=> (not res!494582) (not e!411740))))

(declare-fun lt!326332 () SeekEntryResult!7372)

(assert (=> b!735987 (= res!494582 (or (= lt!326332 (MissingZero!7372 i!1173)) (= lt!326332 (MissingVacant!7372 i!1173))))))

(assert (=> b!735987 (= lt!326332 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65144 res!494586) b!735975))

(assert (= (and b!735975 res!494576) b!735983))

(assert (= (and b!735983 res!494574) b!735967))

(assert (= (and b!735967 res!494578) b!735969))

(assert (= (and b!735969 res!494573) b!735987))

(assert (= (and b!735987 res!494582) b!735974))

(assert (= (and b!735974 res!494584) b!735973))

(assert (= (and b!735973 res!494577) b!735976))

(assert (= (and b!735976 res!494580) b!735971))

(assert (= (and b!735971 res!494587) b!735982))

(assert (= (and b!735982 res!494588) b!735966))

(assert (= (and b!735966 c!81077) b!735985))

(assert (= (and b!735966 (not c!81077)) b!735970))

(assert (= (and b!735966 res!494571) b!735986))

(assert (= (and b!735986 res!494581) b!735977))

(assert (= (and b!735977 res!494579) b!735968))

(assert (= (and b!735968 res!494583) b!735978))

(assert (= (and b!735977 (not res!494572)) b!735979))

(assert (= (and b!735979 c!81078) b!735965))

(assert (= (and b!735979 (not c!81078)) b!735981))

(assert (= (and b!735979 (not res!494585)) b!735980))

(assert (= (and b!735980 c!81079) b!735964))

(assert (= (and b!735980 (not c!81079)) b!735984))

(assert (= (and b!735980 (not res!494575)) b!735972))

(declare-fun m!688213 () Bool)

(assert (=> b!735987 m!688213))

(declare-fun m!688215 () Bool)

(assert (=> b!735971 m!688215))

(assert (=> b!735971 m!688215))

(declare-fun m!688217 () Bool)

(assert (=> b!735971 m!688217))

(assert (=> b!735971 m!688217))

(assert (=> b!735971 m!688215))

(declare-fun m!688219 () Bool)

(assert (=> b!735971 m!688219))

(declare-fun m!688221 () Bool)

(assert (=> b!735982 m!688221))

(declare-fun m!688223 () Bool)

(assert (=> b!735974 m!688223))

(assert (=> b!735984 m!688215))

(assert (=> b!735984 m!688215))

(declare-fun m!688225 () Bool)

(assert (=> b!735984 m!688225))

(declare-fun m!688227 () Bool)

(assert (=> b!735986 m!688227))

(declare-fun m!688229 () Bool)

(assert (=> b!735986 m!688229))

(declare-fun m!688231 () Bool)

(assert (=> b!735986 m!688231))

(declare-fun m!688233 () Bool)

(assert (=> b!735986 m!688233))

(declare-fun m!688235 () Bool)

(assert (=> b!735986 m!688235))

(assert (=> b!735986 m!688227))

(assert (=> b!735983 m!688215))

(assert (=> b!735983 m!688215))

(declare-fun m!688237 () Bool)

(assert (=> b!735983 m!688237))

(declare-fun m!688239 () Bool)

(assert (=> b!735979 m!688239))

(declare-fun m!688241 () Bool)

(assert (=> b!735977 m!688241))

(declare-fun m!688243 () Bool)

(assert (=> b!735977 m!688243))

(assert (=> b!735968 m!688215))

(assert (=> b!735968 m!688215))

(declare-fun m!688245 () Bool)

(assert (=> b!735968 m!688245))

(declare-fun m!688247 () Bool)

(assert (=> b!735973 m!688247))

(assert (=> b!735981 m!688215))

(assert (=> b!735981 m!688215))

(declare-fun m!688249 () Bool)

(assert (=> b!735981 m!688249))

(assert (=> b!735981 m!688215))

(assert (=> b!735981 m!688225))

(assert (=> b!735985 m!688215))

(assert (=> b!735985 m!688215))

(declare-fun m!688251 () Bool)

(assert (=> b!735985 m!688251))

(assert (=> b!735978 m!688215))

(assert (=> b!735978 m!688215))

(declare-fun m!688253 () Bool)

(assert (=> b!735978 m!688253))

(assert (=> b!735965 m!688215))

(assert (=> b!735965 m!688215))

(declare-fun m!688255 () Bool)

(assert (=> b!735965 m!688255))

(declare-fun m!688257 () Bool)

(assert (=> b!735972 m!688257))

(declare-fun m!688259 () Bool)

(assert (=> b!735969 m!688259))

(assert (=> b!735964 m!688215))

(assert (=> b!735964 m!688215))

(assert (=> b!735964 m!688255))

(declare-fun m!688261 () Bool)

(assert (=> b!735967 m!688261))

(assert (=> b!735970 m!688215))

(assert (=> b!735970 m!688215))

(assert (=> b!735970 m!688249))

(declare-fun m!688263 () Bool)

(assert (=> start!65144 m!688263))

(declare-fun m!688265 () Bool)

(assert (=> start!65144 m!688265))

(push 1)

