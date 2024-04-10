; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129968 () Bool)

(assert start!129968)

(declare-fun b!1525174 () Bool)

(declare-fun e!850167 () Bool)

(declare-fun e!850166 () Bool)

(assert (=> b!1525174 (= e!850167 e!850166)))

(declare-fun res!1043548 () Bool)

(assert (=> b!1525174 (=> (not res!1043548) (not e!850166))))

(declare-datatypes ((SeekEntryResult!13115 0))(
  ( (MissingZero!13115 (index!54855 (_ BitVec 32))) (Found!13115 (index!54856 (_ BitVec 32))) (Intermediate!13115 (undefined!13927 Bool) (index!54857 (_ BitVec 32)) (x!136552 (_ BitVec 32))) (Undefined!13115) (MissingVacant!13115 (index!54858 (_ BitVec 32))) )
))
(declare-fun lt!660583 () SeekEntryResult!13115)

(declare-fun lt!660582 () SeekEntryResult!13115)

(assert (=> b!1525174 (= res!1043548 (= lt!660583 lt!660582))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525174 (= lt!660582 (Intermediate!13115 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101444 0))(
  ( (array!101445 (arr!48950 (Array (_ BitVec 32) (_ BitVec 64))) (size!49500 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101444)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101444 (_ BitVec 32)) SeekEntryResult!13115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525174 (= lt!660583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48950 a!2804) j!70) mask!2512) (select (arr!48950 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1043537 () Bool)

(assert (=> start!129968 (=> (not res!1043537) (not e!850167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129968 (= res!1043537 (validMask!0 mask!2512))))

(assert (=> start!129968 e!850167))

(assert (=> start!129968 true))

(declare-fun array_inv!37978 (array!101444) Bool)

(assert (=> start!129968 (array_inv!37978 a!2804)))

(declare-fun b!1525175 () Bool)

(declare-fun res!1043535 () Bool)

(assert (=> b!1525175 (=> (not res!1043535) (not e!850167))))

(declare-datatypes ((List!35433 0))(
  ( (Nil!35430) (Cons!35429 (h!36859 (_ BitVec 64)) (t!50127 List!35433)) )
))
(declare-fun arrayNoDuplicates!0 (array!101444 (_ BitVec 32) List!35433) Bool)

(assert (=> b!1525175 (= res!1043535 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35430))))

(declare-fun b!1525176 () Bool)

(declare-fun res!1043545 () Bool)

(assert (=> b!1525176 (=> (not res!1043545) (not e!850167))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525176 (= res!1043545 (and (= (size!49500 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49500 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49500 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525177 () Bool)

(declare-fun e!850170 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!660580 () array!101444)

(declare-fun lt!660579 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101444 (_ BitVec 32)) SeekEntryResult!13115)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101444 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1525177 (= e!850170 (= (seekEntryOrOpen!0 lt!660579 lt!660580 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660579 lt!660580 mask!2512)))))

(declare-fun b!1525178 () Bool)

(declare-fun e!850165 () Bool)

(assert (=> b!1525178 (= e!850165 (not e!850170))))

(declare-fun res!1043544 () Bool)

(assert (=> b!1525178 (=> res!1043544 e!850170)))

(assert (=> b!1525178 (= res!1043544 (or (not (= (select (arr!48950 a!2804) j!70) lt!660579)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48950 a!2804) index!487) (select (arr!48950 a!2804) j!70)) (not (= (select (arr!48950 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!850171 () Bool)

(assert (=> b!1525178 e!850171))

(declare-fun res!1043541 () Bool)

(assert (=> b!1525178 (=> (not res!1043541) (not e!850171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101444 (_ BitVec 32)) Bool)

(assert (=> b!1525178 (= res!1043541 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51014 0))(
  ( (Unit!51015) )
))
(declare-fun lt!660581 () Unit!51014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51014)

(assert (=> b!1525178 (= lt!660581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525179 () Bool)

(declare-fun e!850168 () Bool)

(assert (=> b!1525179 (= e!850168 (= (seekEntryOrOpen!0 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48950 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525180 () Bool)

(declare-fun res!1043540 () Bool)

(assert (=> b!1525180 (=> (not res!1043540) (not e!850167))))

(assert (=> b!1525180 (= res!1043540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525181 () Bool)

(assert (=> b!1525181 (= e!850166 e!850165)))

(declare-fun res!1043542 () Bool)

(assert (=> b!1525181 (=> (not res!1043542) (not e!850165))))

(assert (=> b!1525181 (= res!1043542 (= lt!660583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660579 mask!2512) lt!660579 lt!660580 mask!2512)))))

(assert (=> b!1525181 (= lt!660579 (select (store (arr!48950 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525181 (= lt!660580 (array!101445 (store (arr!48950 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49500 a!2804)))))

(declare-fun b!1525182 () Bool)

(assert (=> b!1525182 (= e!850171 e!850168)))

(declare-fun res!1043547 () Bool)

(assert (=> b!1525182 (=> res!1043547 e!850168)))

(assert (=> b!1525182 (= res!1043547 (or (not (= (select (arr!48950 a!2804) j!70) lt!660579)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48950 a!2804) index!487) (select (arr!48950 a!2804) j!70)) (not (= (select (arr!48950 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525183 () Bool)

(declare-fun res!1043539 () Bool)

(assert (=> b!1525183 (=> (not res!1043539) (not e!850167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525183 (= res!1043539 (validKeyInArray!0 (select (arr!48950 a!2804) i!961)))))

(declare-fun b!1525184 () Bool)

(declare-fun res!1043536 () Bool)

(assert (=> b!1525184 (=> (not res!1043536) (not e!850171))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101444 (_ BitVec 32)) SeekEntryResult!13115)

(assert (=> b!1525184 (= res!1043536 (= (seekEntry!0 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) (Found!13115 j!70)))))

(declare-fun b!1525185 () Bool)

(declare-fun res!1043546 () Bool)

(assert (=> b!1525185 (=> (not res!1043546) (not e!850166))))

(assert (=> b!1525185 (= res!1043546 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) lt!660582))))

(declare-fun b!1525186 () Bool)

(declare-fun res!1043538 () Bool)

(assert (=> b!1525186 (=> (not res!1043538) (not e!850167))))

(assert (=> b!1525186 (= res!1043538 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49500 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49500 a!2804))))))

(declare-fun b!1525187 () Bool)

(declare-fun res!1043543 () Bool)

(assert (=> b!1525187 (=> (not res!1043543) (not e!850167))))

(assert (=> b!1525187 (= res!1043543 (validKeyInArray!0 (select (arr!48950 a!2804) j!70)))))

(assert (= (and start!129968 res!1043537) b!1525176))

(assert (= (and b!1525176 res!1043545) b!1525183))

(assert (= (and b!1525183 res!1043539) b!1525187))

(assert (= (and b!1525187 res!1043543) b!1525180))

(assert (= (and b!1525180 res!1043540) b!1525175))

(assert (= (and b!1525175 res!1043535) b!1525186))

(assert (= (and b!1525186 res!1043538) b!1525174))

(assert (= (and b!1525174 res!1043548) b!1525185))

(assert (= (and b!1525185 res!1043546) b!1525181))

(assert (= (and b!1525181 res!1043542) b!1525178))

(assert (= (and b!1525178 res!1043541) b!1525184))

(assert (= (and b!1525184 res!1043536) b!1525182))

(assert (= (and b!1525182 (not res!1043547)) b!1525179))

(assert (= (and b!1525178 (not res!1043544)) b!1525177))

(declare-fun m!1408065 () Bool)

(assert (=> b!1525187 m!1408065))

(assert (=> b!1525187 m!1408065))

(declare-fun m!1408067 () Bool)

(assert (=> b!1525187 m!1408067))

(assert (=> b!1525178 m!1408065))

(declare-fun m!1408069 () Bool)

(assert (=> b!1525178 m!1408069))

(declare-fun m!1408071 () Bool)

(assert (=> b!1525178 m!1408071))

(declare-fun m!1408073 () Bool)

(assert (=> b!1525178 m!1408073))

(declare-fun m!1408075 () Bool)

(assert (=> b!1525181 m!1408075))

(assert (=> b!1525181 m!1408075))

(declare-fun m!1408077 () Bool)

(assert (=> b!1525181 m!1408077))

(declare-fun m!1408079 () Bool)

(assert (=> b!1525181 m!1408079))

(declare-fun m!1408081 () Bool)

(assert (=> b!1525181 m!1408081))

(assert (=> b!1525182 m!1408065))

(assert (=> b!1525182 m!1408069))

(assert (=> b!1525179 m!1408065))

(assert (=> b!1525179 m!1408065))

(declare-fun m!1408083 () Bool)

(assert (=> b!1525179 m!1408083))

(assert (=> b!1525179 m!1408065))

(declare-fun m!1408085 () Bool)

(assert (=> b!1525179 m!1408085))

(assert (=> b!1525185 m!1408065))

(assert (=> b!1525185 m!1408065))

(declare-fun m!1408087 () Bool)

(assert (=> b!1525185 m!1408087))

(assert (=> b!1525184 m!1408065))

(assert (=> b!1525184 m!1408065))

(declare-fun m!1408089 () Bool)

(assert (=> b!1525184 m!1408089))

(declare-fun m!1408091 () Bool)

(assert (=> b!1525177 m!1408091))

(declare-fun m!1408093 () Bool)

(assert (=> b!1525177 m!1408093))

(declare-fun m!1408095 () Bool)

(assert (=> b!1525180 m!1408095))

(assert (=> b!1525174 m!1408065))

(assert (=> b!1525174 m!1408065))

(declare-fun m!1408097 () Bool)

(assert (=> b!1525174 m!1408097))

(assert (=> b!1525174 m!1408097))

(assert (=> b!1525174 m!1408065))

(declare-fun m!1408099 () Bool)

(assert (=> b!1525174 m!1408099))

(declare-fun m!1408101 () Bool)

(assert (=> b!1525183 m!1408101))

(assert (=> b!1525183 m!1408101))

(declare-fun m!1408103 () Bool)

(assert (=> b!1525183 m!1408103))

(declare-fun m!1408105 () Bool)

(assert (=> b!1525175 m!1408105))

(declare-fun m!1408107 () Bool)

(assert (=> start!129968 m!1408107))

(declare-fun m!1408109 () Bool)

(assert (=> start!129968 m!1408109))

(push 1)

(assert (not b!1525187))

(assert (not b!1525179))

(assert (not b!1525178))

(assert (not b!1525181))

(assert (not start!129968))

(assert (not b!1525180))

(assert (not b!1525185))

(assert (not b!1525174))

(assert (not b!1525177))

(assert (not b!1525183))

(assert (not b!1525175))

(assert (not b!1525184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1525430 () Bool)

(declare-fun e!850308 () SeekEntryResult!13115)

(assert (=> b!1525430 (= e!850308 Undefined!13115)))

(declare-fun b!1525431 () Bool)

(declare-fun e!850310 () SeekEntryResult!13115)

(declare-fun lt!660696 () SeekEntryResult!13115)

(assert (=> b!1525431 (= e!850310 (MissingZero!13115 (index!54857 lt!660696)))))

(declare-fun b!1525432 () Bool)

(declare-fun c!140431 () Bool)

(declare-fun lt!660695 () (_ BitVec 64))

(assert (=> b!1525432 (= c!140431 (= lt!660695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850309 () SeekEntryResult!13115)

(assert (=> b!1525432 (= e!850309 e!850310)))

(declare-fun b!1525433 () Bool)

(assert (=> b!1525433 (= e!850308 e!850309)))

(assert (=> b!1525433 (= lt!660695 (select (arr!48950 lt!660580) (index!54857 lt!660696)))))

(declare-fun c!140430 () Bool)

(assert (=> b!1525433 (= c!140430 (= lt!660695 lt!660579))))

(declare-fun b!1525434 () Bool)

(assert (=> b!1525434 (= e!850309 (Found!13115 (index!54857 lt!660696)))))

(declare-fun b!1525435 () Bool)

(assert (=> b!1525435 (= e!850310 (seekKeyOrZeroReturnVacant!0 (x!136552 lt!660696) (index!54857 lt!660696) (index!54857 lt!660696) lt!660579 lt!660580 mask!2512))))

(declare-fun d!159477 () Bool)

(declare-fun lt!660697 () SeekEntryResult!13115)

(assert (=> d!159477 (and (or (is-Undefined!13115 lt!660697) (not (is-Found!13115 lt!660697)) (and (bvsge (index!54856 lt!660697) #b00000000000000000000000000000000) (bvslt (index!54856 lt!660697) (size!49500 lt!660580)))) (or (is-Undefined!13115 lt!660697) (is-Found!13115 lt!660697) (not (is-MissingZero!13115 lt!660697)) (and (bvsge (index!54855 lt!660697) #b00000000000000000000000000000000) (bvslt (index!54855 lt!660697) (size!49500 lt!660580)))) (or (is-Undefined!13115 lt!660697) (is-Found!13115 lt!660697) (is-MissingZero!13115 lt!660697) (not (is-MissingVacant!13115 lt!660697)) (and (bvsge (index!54858 lt!660697) #b00000000000000000000000000000000) (bvslt (index!54858 lt!660697) (size!49500 lt!660580)))) (or (is-Undefined!13115 lt!660697) (ite (is-Found!13115 lt!660697) (= (select (arr!48950 lt!660580) (index!54856 lt!660697)) lt!660579) (ite (is-MissingZero!13115 lt!660697) (= (select (arr!48950 lt!660580) (index!54855 lt!660697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13115 lt!660697) (= (select (arr!48950 lt!660580) (index!54858 lt!660697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159477 (= lt!660697 e!850308)))

(declare-fun c!140429 () Bool)

(assert (=> d!159477 (= c!140429 (and (is-Intermediate!13115 lt!660696) (undefined!13927 lt!660696)))))

(assert (=> d!159477 (= lt!660696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660579 mask!2512) lt!660579 lt!660580 mask!2512))))

(assert (=> d!159477 (validMask!0 mask!2512)))

(assert (=> d!159477 (= (seekEntryOrOpen!0 lt!660579 lt!660580 mask!2512) lt!660697)))

(assert (= (and d!159477 c!140429) b!1525430))

(assert (= (and d!159477 (not c!140429)) b!1525433))

(assert (= (and b!1525433 c!140430) b!1525434))

(assert (= (and b!1525433 (not c!140430)) b!1525432))

(assert (= (and b!1525432 c!140431) b!1525431))

(assert (= (and b!1525432 (not c!140431)) b!1525435))

(declare-fun m!1408293 () Bool)

(assert (=> b!1525433 m!1408293))

(declare-fun m!1408295 () Bool)

(assert (=> b!1525435 m!1408295))

(declare-fun m!1408297 () Bool)

(assert (=> d!159477 m!1408297))

(declare-fun m!1408299 () Bool)

(assert (=> d!159477 m!1408299))

(assert (=> d!159477 m!1408107))

(declare-fun m!1408301 () Bool)

(assert (=> d!159477 m!1408301))

(assert (=> d!159477 m!1408075))

(assert (=> d!159477 m!1408075))

(assert (=> d!159477 m!1408077))

(assert (=> b!1525177 d!159477))

(declare-fun b!1525487 () Bool)

(declare-fun c!140455 () Bool)

(declare-fun lt!660719 () (_ BitVec 64))

(assert (=> b!1525487 (= c!140455 (= lt!660719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850340 () SeekEntryResult!13115)

(declare-fun e!850338 () SeekEntryResult!13115)

(assert (=> b!1525487 (= e!850340 e!850338)))

(declare-fun b!1525488 () Bool)

(assert (=> b!1525488 (= e!850338 (MissingVacant!13115 index!487))))

(declare-fun b!1525489 () Bool)

(declare-fun e!850339 () SeekEntryResult!13115)

(assert (=> b!1525489 (= e!850339 e!850340)))

(declare-fun c!140453 () Bool)

(assert (=> b!1525489 (= c!140453 (= lt!660719 lt!660579))))

(declare-fun d!159495 () Bool)

(declare-fun lt!660720 () SeekEntryResult!13115)

(assert (=> d!159495 (and (or (is-Undefined!13115 lt!660720) (not (is-Found!13115 lt!660720)) (and (bvsge (index!54856 lt!660720) #b00000000000000000000000000000000) (bvslt (index!54856 lt!660720) (size!49500 lt!660580)))) (or (is-Undefined!13115 lt!660720) (is-Found!13115 lt!660720) (not (is-MissingVacant!13115 lt!660720)) (not (= (index!54858 lt!660720) index!487)) (and (bvsge (index!54858 lt!660720) #b00000000000000000000000000000000) (bvslt (index!54858 lt!660720) (size!49500 lt!660580)))) (or (is-Undefined!13115 lt!660720) (ite (is-Found!13115 lt!660720) (= (select (arr!48950 lt!660580) (index!54856 lt!660720)) lt!660579) (and (is-MissingVacant!13115 lt!660720) (= (index!54858 lt!660720) index!487) (= (select (arr!48950 lt!660580) (index!54858 lt!660720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159495 (= lt!660720 e!850339)))

(declare-fun c!140454 () Bool)

(assert (=> d!159495 (= c!140454 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159495 (= lt!660719 (select (arr!48950 lt!660580) index!487))))

(assert (=> d!159495 (validMask!0 mask!2512)))

(assert (=> d!159495 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660579 lt!660580 mask!2512) lt!660720)))

(declare-fun b!1525490 () Bool)

(assert (=> b!1525490 (= e!850339 Undefined!13115)))

(declare-fun b!1525491 () Bool)

(assert (=> b!1525491 (= e!850340 (Found!13115 index!487))))

(declare-fun b!1525492 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525492 (= e!850338 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!660579 lt!660580 mask!2512))))

(assert (= (and d!159495 c!140454) b!1525490))

(assert (= (and d!159495 (not c!140454)) b!1525489))

(assert (= (and b!1525489 c!140453) b!1525491))

(assert (= (and b!1525489 (not c!140453)) b!1525487))

(assert (= (and b!1525487 c!140455) b!1525488))

(assert (= (and b!1525487 (not c!140455)) b!1525492))

(declare-fun m!1408327 () Bool)

(assert (=> d!159495 m!1408327))

(declare-fun m!1408329 () Bool)

(assert (=> d!159495 m!1408329))

(declare-fun m!1408331 () Bool)

(assert (=> d!159495 m!1408331))

(assert (=> d!159495 m!1408107))

(declare-fun m!1408333 () Bool)

(assert (=> b!1525492 m!1408333))

(assert (=> b!1525492 m!1408333))

(declare-fun m!1408335 () Bool)

(assert (=> b!1525492 m!1408335))

(assert (=> b!1525177 d!159495))

(declare-fun d!159507 () Bool)

(assert (=> d!159507 (= (validKeyInArray!0 (select (arr!48950 a!2804) j!70)) (and (not (= (select (arr!48950 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48950 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525187 d!159507))

(declare-fun b!1525503 () Bool)

(declare-fun e!850351 () Bool)

(declare-fun call!68462 () Bool)

(assert (=> b!1525503 (= e!850351 call!68462)))

(declare-fun b!1525504 () Bool)

(declare-fun e!850349 () Bool)

(declare-fun contains!9993 (List!35433 (_ BitVec 64)) Bool)

(assert (=> b!1525504 (= e!850349 (contains!9993 Nil!35430 (select (arr!48950 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525505 () Bool)

(declare-fun e!850350 () Bool)

(declare-fun e!850352 () Bool)

(assert (=> b!1525505 (= e!850350 e!850352)))

(declare-fun res!1043692 () Bool)

(assert (=> b!1525505 (=> (not res!1043692) (not e!850352))))

(assert (=> b!1525505 (= res!1043692 (not e!850349))))

(declare-fun res!1043691 () Bool)

(assert (=> b!1525505 (=> (not res!1043691) (not e!850349))))

(assert (=> b!1525505 (= res!1043691 (validKeyInArray!0 (select (arr!48950 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525506 () Bool)

(assert (=> b!1525506 (= e!850351 call!68462)))

(declare-fun b!1525507 () Bool)

(assert (=> b!1525507 (= e!850352 e!850351)))

(declare-fun c!140458 () Bool)

(assert (=> b!1525507 (= c!140458 (validKeyInArray!0 (select (arr!48950 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159511 () Bool)

(declare-fun res!1043690 () Bool)

(assert (=> d!159511 (=> res!1043690 e!850350)))

(assert (=> d!159511 (= res!1043690 (bvsge #b00000000000000000000000000000000 (size!49500 a!2804)))))

(assert (=> d!159511 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35430) e!850350)))

(declare-fun bm!68459 () Bool)

(assert (=> bm!68459 (= call!68462 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140458 (Cons!35429 (select (arr!48950 a!2804) #b00000000000000000000000000000000) Nil!35430) Nil!35430)))))

(assert (= (and d!159511 (not res!1043690)) b!1525505))

(assert (= (and b!1525505 res!1043691) b!1525504))

(assert (= (and b!1525505 res!1043692) b!1525507))

(assert (= (and b!1525507 c!140458) b!1525506))

(assert (= (and b!1525507 (not c!140458)) b!1525503))

(assert (= (or b!1525506 b!1525503) bm!68459))

(declare-fun m!1408337 () Bool)

(assert (=> b!1525504 m!1408337))

(assert (=> b!1525504 m!1408337))

(declare-fun m!1408339 () Bool)

(assert (=> b!1525504 m!1408339))

(assert (=> b!1525505 m!1408337))

(assert (=> b!1525505 m!1408337))

(declare-fun m!1408341 () Bool)

(assert (=> b!1525505 m!1408341))

(assert (=> b!1525507 m!1408337))

(assert (=> b!1525507 m!1408337))

(assert (=> b!1525507 m!1408341))

(assert (=> bm!68459 m!1408337))

(declare-fun m!1408343 () Bool)

(assert (=> bm!68459 m!1408343))

(assert (=> b!1525175 d!159511))

(declare-fun b!1525543 () Bool)

(declare-fun e!850375 () Bool)

(declare-fun call!68465 () Bool)

(assert (=> b!1525543 (= e!850375 call!68465)))

(declare-fun b!1525544 () Bool)

(declare-fun e!850373 () Bool)

(assert (=> b!1525544 (= e!850373 call!68465)))

(declare-fun b!1525545 () Bool)

(assert (=> b!1525545 (= e!850373 e!850375)))

(declare-fun lt!660744 () (_ BitVec 64))

(assert (=> b!1525545 (= lt!660744 (select (arr!48950 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660743 () Unit!51014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101444 (_ BitVec 64) (_ BitVec 32)) Unit!51014)

(assert (=> b!1525545 (= lt!660743 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660744 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1525545 (arrayContainsKey!0 a!2804 lt!660744 #b00000000000000000000000000000000)))

(declare-fun lt!660745 () Unit!51014)

(assert (=> b!1525545 (= lt!660745 lt!660743)))

(declare-fun res!1043700 () Bool)

(assert (=> b!1525545 (= res!1043700 (= (seekEntryOrOpen!0 (select (arr!48950 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13115 #b00000000000000000000000000000000)))))

(assert (=> b!1525545 (=> (not res!1043700) (not e!850375))))

(declare-fun b!1525546 () Bool)

(declare-fun e!850374 () Bool)

(assert (=> b!1525546 (= e!850374 e!850373)))

(declare-fun c!140473 () Bool)

(assert (=> b!1525546 (= c!140473 (validKeyInArray!0 (select (arr!48950 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159513 () Bool)

(declare-fun res!1043701 () Bool)

(assert (=> d!159513 (=> res!1043701 e!850374)))

(assert (=> d!159513 (= res!1043701 (bvsge #b00000000000000000000000000000000 (size!49500 a!2804)))))

(assert (=> d!159513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!850374)))

(declare-fun bm!68462 () Bool)

(assert (=> bm!68462 (= call!68465 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159513 (not res!1043701)) b!1525546))

(assert (= (and b!1525546 c!140473) b!1525545))

(assert (= (and b!1525546 (not c!140473)) b!1525544))

(assert (= (and b!1525545 res!1043700) b!1525543))

(assert (= (or b!1525543 b!1525544) bm!68462))

(assert (=> b!1525545 m!1408337))

(declare-fun m!1408359 () Bool)

(assert (=> b!1525545 m!1408359))

(declare-fun m!1408361 () Bool)

(assert (=> b!1525545 m!1408361))

(assert (=> b!1525545 m!1408337))

(declare-fun m!1408363 () Bool)

(assert (=> b!1525545 m!1408363))

(assert (=> b!1525546 m!1408337))

(assert (=> b!1525546 m!1408337))

(assert (=> b!1525546 m!1408341))

(declare-fun m!1408365 () Bool)

(assert (=> bm!68462 m!1408365))

(assert (=> b!1525180 d!159513))

(declare-fun b!1525547 () Bool)

(declare-fun e!850376 () SeekEntryResult!13115)

(assert (=> b!1525547 (= e!850376 Undefined!13115)))

(declare-fun b!1525548 () Bool)

(declare-fun e!850378 () SeekEntryResult!13115)

(declare-fun lt!660747 () SeekEntryResult!13115)

(assert (=> b!1525548 (= e!850378 (MissingZero!13115 (index!54857 lt!660747)))))

(declare-fun b!1525549 () Bool)

(declare-fun c!140476 () Bool)

(declare-fun lt!660746 () (_ BitVec 64))

(assert (=> b!1525549 (= c!140476 (= lt!660746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850377 () SeekEntryResult!13115)

(assert (=> b!1525549 (= e!850377 e!850378)))

(declare-fun b!1525550 () Bool)

(assert (=> b!1525550 (= e!850376 e!850377)))

(assert (=> b!1525550 (= lt!660746 (select (arr!48950 a!2804) (index!54857 lt!660747)))))

(declare-fun c!140475 () Bool)

(assert (=> b!1525550 (= c!140475 (= lt!660746 (select (arr!48950 a!2804) j!70)))))

(declare-fun b!1525551 () Bool)

(assert (=> b!1525551 (= e!850377 (Found!13115 (index!54857 lt!660747)))))

(declare-fun b!1525552 () Bool)

(assert (=> b!1525552 (= e!850378 (seekKeyOrZeroReturnVacant!0 (x!136552 lt!660747) (index!54857 lt!660747) (index!54857 lt!660747) (select (arr!48950 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159521 () Bool)

(declare-fun lt!660748 () SeekEntryResult!13115)

(assert (=> d!159521 (and (or (is-Undefined!13115 lt!660748) (not (is-Found!13115 lt!660748)) (and (bvsge (index!54856 lt!660748) #b00000000000000000000000000000000) (bvslt (index!54856 lt!660748) (size!49500 a!2804)))) (or (is-Undefined!13115 lt!660748) (is-Found!13115 lt!660748) (not (is-MissingZero!13115 lt!660748)) (and (bvsge (index!54855 lt!660748) #b00000000000000000000000000000000) (bvslt (index!54855 lt!660748) (size!49500 a!2804)))) (or (is-Undefined!13115 lt!660748) (is-Found!13115 lt!660748) (is-MissingZero!13115 lt!660748) (not (is-MissingVacant!13115 lt!660748)) (and (bvsge (index!54858 lt!660748) #b00000000000000000000000000000000) (bvslt (index!54858 lt!660748) (size!49500 a!2804)))) (or (is-Undefined!13115 lt!660748) (ite (is-Found!13115 lt!660748) (= (select (arr!48950 a!2804) (index!54856 lt!660748)) (select (arr!48950 a!2804) j!70)) (ite (is-MissingZero!13115 lt!660748) (= (select (arr!48950 a!2804) (index!54855 lt!660748)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13115 lt!660748) (= (select (arr!48950 a!2804) (index!54858 lt!660748)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159521 (= lt!660748 e!850376)))

(declare-fun c!140474 () Bool)

(assert (=> d!159521 (= c!140474 (and (is-Intermediate!13115 lt!660747) (undefined!13927 lt!660747)))))

(assert (=> d!159521 (= lt!660747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48950 a!2804) j!70) mask!2512) (select (arr!48950 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159521 (validMask!0 mask!2512)))

(assert (=> d!159521 (= (seekEntryOrOpen!0 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) lt!660748)))

(assert (= (and d!159521 c!140474) b!1525547))

(assert (= (and d!159521 (not c!140474)) b!1525550))

(assert (= (and b!1525550 c!140475) b!1525551))

(assert (= (and b!1525550 (not c!140475)) b!1525549))

(assert (= (and b!1525549 c!140476) b!1525548))

(assert (= (and b!1525549 (not c!140476)) b!1525552))

(declare-fun m!1408367 () Bool)

(assert (=> b!1525550 m!1408367))

(assert (=> b!1525552 m!1408065))

(declare-fun m!1408369 () Bool)

(assert (=> b!1525552 m!1408369))

(declare-fun m!1408371 () Bool)

(assert (=> d!159521 m!1408371))

(declare-fun m!1408373 () Bool)

(assert (=> d!159521 m!1408373))

(assert (=> d!159521 m!1408107))

(declare-fun m!1408375 () Bool)

(assert (=> d!159521 m!1408375))

(assert (=> d!159521 m!1408065))

(assert (=> d!159521 m!1408097))

(assert (=> d!159521 m!1408097))

(assert (=> d!159521 m!1408065))

(assert (=> d!159521 m!1408099))

(assert (=> b!1525179 d!159521))

(declare-fun b!1525553 () Bool)

(declare-fun c!140479 () Bool)

(declare-fun lt!660749 () (_ BitVec 64))

(assert (=> b!1525553 (= c!140479 (= lt!660749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850381 () SeekEntryResult!13115)

(declare-fun e!850379 () SeekEntryResult!13115)

(assert (=> b!1525553 (= e!850381 e!850379)))

(declare-fun b!1525554 () Bool)

(assert (=> b!1525554 (= e!850379 (MissingVacant!13115 index!487))))

(declare-fun b!1525555 () Bool)

(declare-fun e!850380 () SeekEntryResult!13115)

(assert (=> b!1525555 (= e!850380 e!850381)))

(declare-fun c!140477 () Bool)

(assert (=> b!1525555 (= c!140477 (= lt!660749 (select (arr!48950 a!2804) j!70)))))

(declare-fun lt!660750 () SeekEntryResult!13115)

(declare-fun d!159523 () Bool)

(assert (=> d!159523 (and (or (is-Undefined!13115 lt!660750) (not (is-Found!13115 lt!660750)) (and (bvsge (index!54856 lt!660750) #b00000000000000000000000000000000) (bvslt (index!54856 lt!660750) (size!49500 a!2804)))) (or (is-Undefined!13115 lt!660750) (is-Found!13115 lt!660750) (not (is-MissingVacant!13115 lt!660750)) (not (= (index!54858 lt!660750) index!487)) (and (bvsge (index!54858 lt!660750) #b00000000000000000000000000000000) (bvslt (index!54858 lt!660750) (size!49500 a!2804)))) (or (is-Undefined!13115 lt!660750) (ite (is-Found!13115 lt!660750) (= (select (arr!48950 a!2804) (index!54856 lt!660750)) (select (arr!48950 a!2804) j!70)) (and (is-MissingVacant!13115 lt!660750) (= (index!54858 lt!660750) index!487) (= (select (arr!48950 a!2804) (index!54858 lt!660750)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159523 (= lt!660750 e!850380)))

(declare-fun c!140478 () Bool)

(assert (=> d!159523 (= c!140478 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159523 (= lt!660749 (select (arr!48950 a!2804) index!487))))

(assert (=> d!159523 (validMask!0 mask!2512)))

(assert (=> d!159523 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) lt!660750)))

(declare-fun b!1525556 () Bool)

(assert (=> b!1525556 (= e!850380 Undefined!13115)))

(declare-fun b!1525557 () Bool)

(assert (=> b!1525557 (= e!850381 (Found!13115 index!487))))

(declare-fun b!1525558 () Bool)

(assert (=> b!1525558 (= e!850379 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48950 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159523 c!140478) b!1525556))

(assert (= (and d!159523 (not c!140478)) b!1525555))

(assert (= (and b!1525555 c!140477) b!1525557))

(assert (= (and b!1525555 (not c!140477)) b!1525553))

(assert (= (and b!1525553 c!140479) b!1525554))

(assert (= (and b!1525553 (not c!140479)) b!1525558))

(declare-fun m!1408377 () Bool)

(assert (=> d!159523 m!1408377))

(declare-fun m!1408379 () Bool)

(assert (=> d!159523 m!1408379))

(assert (=> d!159523 m!1408069))

(assert (=> d!159523 m!1408107))

(assert (=> b!1525558 m!1408333))

(assert (=> b!1525558 m!1408333))

(assert (=> b!1525558 m!1408065))

(declare-fun m!1408381 () Bool)

(assert (=> b!1525558 m!1408381))

(assert (=> b!1525179 d!159523))

(declare-fun b!1525559 () Bool)

(declare-fun e!850384 () Bool)

(declare-fun call!68466 () Bool)

(assert (=> b!1525559 (= e!850384 call!68466)))

(declare-fun b!1525560 () Bool)

(declare-fun e!850382 () Bool)

(assert (=> b!1525560 (= e!850382 call!68466)))

(declare-fun b!1525561 () Bool)

(assert (=> b!1525561 (= e!850382 e!850384)))

(declare-fun lt!660752 () (_ BitVec 64))

(assert (=> b!1525561 (= lt!660752 (select (arr!48950 a!2804) j!70))))

(declare-fun lt!660751 () Unit!51014)

(assert (=> b!1525561 (= lt!660751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660752 j!70))))

(assert (=> b!1525561 (arrayContainsKey!0 a!2804 lt!660752 #b00000000000000000000000000000000)))

(declare-fun lt!660753 () Unit!51014)

(assert (=> b!1525561 (= lt!660753 lt!660751)))

(declare-fun res!1043702 () Bool)

(assert (=> b!1525561 (= res!1043702 (= (seekEntryOrOpen!0 (select (arr!48950 a!2804) j!70) a!2804 mask!2512) (Found!13115 j!70)))))

(assert (=> b!1525561 (=> (not res!1043702) (not e!850384))))

(declare-fun b!1525562 () Bool)

(declare-fun e!850383 () Bool)

(assert (=> b!1525562 (= e!850383 e!850382)))

(declare-fun c!140480 () Bool)

(assert (=> b!1525562 (= c!140480 (validKeyInArray!0 (select (arr!48950 a!2804) j!70)))))

(declare-fun d!159525 () Bool)

(declare-fun res!1043703 () Bool)

(assert (=> d!159525 (=> res!1043703 e!850383)))

(assert (=> d!159525 (= res!1043703 (bvsge j!70 (size!49500 a!2804)))))

(assert (=> d!159525 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850383)))

(declare-fun bm!68463 () Bool)

(assert (=> bm!68463 (= call!68466 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159525 (not res!1043703)) b!1525562))

(assert (= (and b!1525562 c!140480) b!1525561))

(assert (= (and b!1525562 (not c!140480)) b!1525560))

(assert (= (and b!1525561 res!1043702) b!1525559))

(assert (= (or b!1525559 b!1525560) bm!68463))

(assert (=> b!1525561 m!1408065))

(declare-fun m!1408383 () Bool)

(assert (=> b!1525561 m!1408383))

(declare-fun m!1408385 () Bool)

(assert (=> b!1525561 m!1408385))

(assert (=> b!1525561 m!1408065))

(assert (=> b!1525561 m!1408083))

(assert (=> b!1525562 m!1408065))

(assert (=> b!1525562 m!1408065))

(assert (=> b!1525562 m!1408067))

(declare-fun m!1408387 () Bool)

(assert (=> bm!68463 m!1408387))

(assert (=> b!1525178 d!159525))

(declare-fun d!159527 () Bool)

(assert (=> d!159527 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660756 () Unit!51014)

(declare-fun choose!38 (array!101444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51014)

(assert (=> d!159527 (= lt!660756 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159527 (validMask!0 mask!2512)))

(assert (=> d!159527 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660756)))

(declare-fun bs!43770 () Bool)

(assert (= bs!43770 d!159527))

(assert (=> bs!43770 m!1408071))

(declare-fun m!1408389 () Bool)

(assert (=> bs!43770 m!1408389))

(assert (=> bs!43770 m!1408107))

(assert (=> b!1525178 d!159527))

(declare-fun b!1525599 () Bool)

(declare-fun lt!660770 () SeekEntryResult!13115)

(assert (=> b!1525599 (and (bvsge (index!54857 lt!660770) #b00000000000000000000000000000000) (bvslt (index!54857 lt!660770) (size!49500 lt!660580)))))

(declare-fun res!1043711 () Bool)

(assert (=> b!1525599 (= res!1043711 (= (select (arr!48950 lt!660580) (index!54857 lt!660770)) lt!660579))))

(declare-fun e!850407 () Bool)

(assert (=> b!1525599 (=> res!1043711 e!850407)))

(declare-fun e!850406 () Bool)

(assert (=> b!1525599 (= e!850406 e!850407)))

(declare-fun b!1525600 () Bool)

(declare-fun e!850405 () SeekEntryResult!13115)

(declare-fun e!850404 () SeekEntryResult!13115)

(assert (=> b!1525600 (= e!850405 e!850404)))

(declare-fun c!140496 () Bool)

(declare-fun lt!660771 () (_ BitVec 64))

(assert (=> b!1525600 (= c!140496 (or (= lt!660771 lt!660579) (= (bvadd lt!660771 lt!660771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525601 () Bool)

(assert (=> b!1525601 (and (bvsge (index!54857 lt!660770) #b00000000000000000000000000000000) (bvslt (index!54857 lt!660770) (size!49500 lt!660580)))))

(assert (=> b!1525601 (= e!850407 (= (select (arr!48950 lt!660580) (index!54857 lt!660770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1525602 () Bool)

(declare-fun e!850408 () Bool)

(assert (=> b!1525602 (= e!850408 (bvsge (x!136552 lt!660770) #b01111111111111111111111111111110))))

(declare-fun b!1525603 () Bool)

(assert (=> b!1525603 (= e!850408 e!850406)))

(declare-fun res!1043712 () Bool)

(assert (=> b!1525603 (= res!1043712 (and (is-Intermediate!13115 lt!660770) (not (undefined!13927 lt!660770)) (bvslt (x!136552 lt!660770) #b01111111111111111111111111111110) (bvsge (x!136552 lt!660770) #b00000000000000000000000000000000) (bvsge (x!136552 lt!660770) #b00000000000000000000000000000000)))))

(assert (=> b!1525603 (=> (not res!1043712) (not e!850406))))

(declare-fun b!1525605 () Bool)

(assert (=> b!1525605 (and (bvsge (index!54857 lt!660770) #b00000000000000000000000000000000) (bvslt (index!54857 lt!660770) (size!49500 lt!660580)))))

(declare-fun res!1043710 () Bool)

(assert (=> b!1525605 (= res!1043710 (= (select (arr!48950 lt!660580) (index!54857 lt!660770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525605 (=> res!1043710 e!850407)))

(declare-fun b!1525606 () Bool)

(assert (=> b!1525606 (= e!850404 (Intermediate!13115 false (toIndex!0 lt!660579 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525607 () Bool)

(assert (=> b!1525607 (= e!850404 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660579 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660579 lt!660580 mask!2512))))

(declare-fun d!159529 () Bool)

(assert (=> d!159529 e!850408))

(declare-fun c!140497 () Bool)

(assert (=> d!159529 (= c!140497 (and (is-Intermediate!13115 lt!660770) (undefined!13927 lt!660770)))))

(assert (=> d!159529 (= lt!660770 e!850405)))

(declare-fun c!140498 () Bool)

(assert (=> d!159529 (= c!140498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159529 (= lt!660771 (select (arr!48950 lt!660580) (toIndex!0 lt!660579 mask!2512)))))

(assert (=> d!159529 (validMask!0 mask!2512)))

(assert (=> d!159529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660579 mask!2512) lt!660579 lt!660580 mask!2512) lt!660770)))

(declare-fun b!1525604 () Bool)

(assert (=> b!1525604 (= e!850405 (Intermediate!13115 true (toIndex!0 lt!660579 mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159529 c!140498) b!1525604))

(assert (= (and d!159529 (not c!140498)) b!1525600))

(assert (= (and b!1525600 c!140496) b!1525606))

(assert (= (and b!1525600 (not c!140496)) b!1525607))

(assert (= (and d!159529 c!140497) b!1525602))

(assert (= (and d!159529 (not c!140497)) b!1525603))

