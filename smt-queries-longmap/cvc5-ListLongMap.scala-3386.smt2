; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46728 () Bool)

(assert start!46728)

(declare-fun b!515875 () Bool)

(declare-fun res!315439 () Bool)

(declare-fun e!301147 () Bool)

(assert (=> b!515875 (=> (not res!315439) (not e!301147))))

(declare-datatypes ((array!33040 0))(
  ( (array!33041 (arr!15888 (Array (_ BitVec 32) (_ BitVec 64))) (size!16252 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33040)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515875 (= res!315439 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515876 () Bool)

(declare-fun res!315440 () Bool)

(assert (=> b!515876 (=> (not res!315440) (not e!301147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515876 (= res!315440 (validKeyInArray!0 k!2280))))

(declare-fun b!515877 () Bool)

(declare-fun res!315441 () Bool)

(declare-fun e!301145 () Bool)

(assert (=> b!515877 (=> (not res!315441) (not e!301145))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33040 (_ BitVec 32)) Bool)

(assert (=> b!515877 (= res!315441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!301149 () Bool)

(declare-fun b!515878 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4355 0))(
  ( (MissingZero!4355 (index!19608 (_ BitVec 32))) (Found!4355 (index!19609 (_ BitVec 32))) (Intermediate!4355 (undefined!5167 Bool) (index!19610 (_ BitVec 32)) (x!48574 (_ BitVec 32))) (Undefined!4355) (MissingVacant!4355 (index!19611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33040 (_ BitVec 32)) SeekEntryResult!4355)

(assert (=> b!515878 (= e!301149 (= (seekEntryOrOpen!0 (select (arr!15888 a!3235) j!176) a!3235 mask!3524) (Found!4355 j!176)))))

(declare-fun b!515879 () Bool)

(declare-fun res!315444 () Bool)

(assert (=> b!515879 (=> (not res!315444) (not e!301145))))

(declare-datatypes ((List!10046 0))(
  ( (Nil!10043) (Cons!10042 (h!10940 (_ BitVec 64)) (t!16274 List!10046)) )
))
(declare-fun arrayNoDuplicates!0 (array!33040 (_ BitVec 32) List!10046) Bool)

(assert (=> b!515879 (= res!315444 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10043))))

(declare-fun res!315447 () Bool)

(assert (=> start!46728 (=> (not res!315447) (not e!301147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46728 (= res!315447 (validMask!0 mask!3524))))

(assert (=> start!46728 e!301147))

(assert (=> start!46728 true))

(declare-fun array_inv!11684 (array!33040) Bool)

(assert (=> start!46728 (array_inv!11684 a!3235)))

(declare-fun b!515880 () Bool)

(assert (=> b!515880 (= e!301147 e!301145)))

(declare-fun res!315449 () Bool)

(assert (=> b!515880 (=> (not res!315449) (not e!301145))))

(declare-fun lt!236164 () SeekEntryResult!4355)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515880 (= res!315449 (or (= lt!236164 (MissingZero!4355 i!1204)) (= lt!236164 (MissingVacant!4355 i!1204))))))

(assert (=> b!515880 (= lt!236164 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515881 () Bool)

(declare-fun res!315442 () Bool)

(declare-fun e!301146 () Bool)

(assert (=> b!515881 (=> res!315442 e!301146)))

(declare-fun lt!236160 () SeekEntryResult!4355)

(assert (=> b!515881 (= res!315442 (or (undefined!5167 lt!236160) (not (is-Intermediate!4355 lt!236160))))))

(declare-fun b!515882 () Bool)

(declare-fun res!315446 () Bool)

(assert (=> b!515882 (=> (not res!315446) (not e!301147))))

(assert (=> b!515882 (= res!315446 (validKeyInArray!0 (select (arr!15888 a!3235) j!176)))))

(declare-fun b!515883 () Bool)

(declare-fun res!315445 () Bool)

(assert (=> b!515883 (=> (not res!315445) (not e!301147))))

(assert (=> b!515883 (= res!315445 (and (= (size!16252 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16252 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16252 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515884 () Bool)

(assert (=> b!515884 (= e!301146 true)))

(assert (=> b!515884 (and (bvslt (x!48574 lt!236160) #b01111111111111111111111111111110) (or (= (select (arr!15888 a!3235) (index!19610 lt!236160)) (select (arr!15888 a!3235) j!176)) (= (select (arr!15888 a!3235) (index!19610 lt!236160)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15888 a!3235) (index!19610 lt!236160)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515885 () Bool)

(assert (=> b!515885 (= e!301145 (not e!301146))))

(declare-fun res!315448 () Bool)

(assert (=> b!515885 (=> res!315448 e!301146)))

(declare-fun lt!236163 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33040 (_ BitVec 32)) SeekEntryResult!4355)

(assert (=> b!515885 (= res!315448 (= lt!236160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236163 (select (store (arr!15888 a!3235) i!1204 k!2280) j!176) (array!33041 (store (arr!15888 a!3235) i!1204 k!2280) (size!16252 a!3235)) mask!3524)))))

(declare-fun lt!236162 () (_ BitVec 32))

(assert (=> b!515885 (= lt!236160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236162 (select (arr!15888 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515885 (= lt!236163 (toIndex!0 (select (store (arr!15888 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515885 (= lt!236162 (toIndex!0 (select (arr!15888 a!3235) j!176) mask!3524))))

(assert (=> b!515885 e!301149))

(declare-fun res!315443 () Bool)

(assert (=> b!515885 (=> (not res!315443) (not e!301149))))

(assert (=> b!515885 (= res!315443 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15968 0))(
  ( (Unit!15969) )
))
(declare-fun lt!236161 () Unit!15968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15968)

(assert (=> b!515885 (= lt!236161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46728 res!315447) b!515883))

(assert (= (and b!515883 res!315445) b!515882))

(assert (= (and b!515882 res!315446) b!515876))

(assert (= (and b!515876 res!315440) b!515875))

(assert (= (and b!515875 res!315439) b!515880))

(assert (= (and b!515880 res!315449) b!515877))

(assert (= (and b!515877 res!315441) b!515879))

(assert (= (and b!515879 res!315444) b!515885))

(assert (= (and b!515885 res!315443) b!515878))

(assert (= (and b!515885 (not res!315448)) b!515881))

(assert (= (and b!515881 (not res!315442)) b!515884))

(declare-fun m!497277 () Bool)

(assert (=> b!515875 m!497277))

(declare-fun m!497279 () Bool)

(assert (=> b!515879 m!497279))

(declare-fun m!497281 () Bool)

(assert (=> b!515885 m!497281))

(declare-fun m!497283 () Bool)

(assert (=> b!515885 m!497283))

(declare-fun m!497285 () Bool)

(assert (=> b!515885 m!497285))

(declare-fun m!497287 () Bool)

(assert (=> b!515885 m!497287))

(declare-fun m!497289 () Bool)

(assert (=> b!515885 m!497289))

(assert (=> b!515885 m!497281))

(declare-fun m!497291 () Bool)

(assert (=> b!515885 m!497291))

(assert (=> b!515885 m!497281))

(declare-fun m!497293 () Bool)

(assert (=> b!515885 m!497293))

(assert (=> b!515885 m!497289))

(declare-fun m!497295 () Bool)

(assert (=> b!515885 m!497295))

(assert (=> b!515885 m!497289))

(declare-fun m!497297 () Bool)

(assert (=> b!515885 m!497297))

(assert (=> b!515882 m!497281))

(assert (=> b!515882 m!497281))

(declare-fun m!497299 () Bool)

(assert (=> b!515882 m!497299))

(declare-fun m!497301 () Bool)

(assert (=> b!515877 m!497301))

(declare-fun m!497303 () Bool)

(assert (=> b!515880 m!497303))

(declare-fun m!497305 () Bool)

(assert (=> b!515884 m!497305))

(assert (=> b!515884 m!497281))

(declare-fun m!497307 () Bool)

(assert (=> start!46728 m!497307))

(declare-fun m!497309 () Bool)

(assert (=> start!46728 m!497309))

(assert (=> b!515878 m!497281))

(assert (=> b!515878 m!497281))

(declare-fun m!497311 () Bool)

(assert (=> b!515878 m!497311))

(declare-fun m!497313 () Bool)

(assert (=> b!515876 m!497313))

(push 1)

