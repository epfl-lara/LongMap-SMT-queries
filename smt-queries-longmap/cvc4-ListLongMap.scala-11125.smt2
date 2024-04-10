; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130050 () Bool)

(assert start!130050)

(declare-fun b!1525936 () Bool)

(declare-fun res!1043983 () Bool)

(declare-fun e!850583 () Bool)

(assert (=> b!1525936 (=> (not res!1043983) (not e!850583))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101463 0))(
  ( (array!101464 (arr!48958 (Array (_ BitVec 32) (_ BitVec 64))) (size!49508 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101463)

(assert (=> b!1525936 (= res!1043983 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49508 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49508 a!2804))))))

(declare-fun b!1525937 () Bool)

(declare-fun res!1043977 () Bool)

(declare-fun e!850581 () Bool)

(assert (=> b!1525937 (=> (not res!1043977) (not e!850581))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13123 0))(
  ( (MissingZero!13123 (index!54887 (_ BitVec 32))) (Found!13123 (index!54888 (_ BitVec 32))) (Intermediate!13123 (undefined!13935 Bool) (index!54889 (_ BitVec 32)) (x!136585 (_ BitVec 32))) (Undefined!13123) (MissingVacant!13123 (index!54890 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101463 (_ BitVec 32)) SeekEntryResult!13123)

(assert (=> b!1525937 (= res!1043977 (= (seekEntry!0 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) (Found!13123 j!70)))))

(declare-fun b!1525938 () Bool)

(declare-fun e!850582 () Bool)

(assert (=> b!1525938 (= e!850583 e!850582)))

(declare-fun res!1043976 () Bool)

(assert (=> b!1525938 (=> (not res!1043976) (not e!850582))))

(declare-fun lt!660896 () SeekEntryResult!13123)

(declare-fun lt!660894 () SeekEntryResult!13123)

(assert (=> b!1525938 (= res!1043976 (= lt!660896 lt!660894))))

(assert (=> b!1525938 (= lt!660894 (Intermediate!13123 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101463 (_ BitVec 32)) SeekEntryResult!13123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525938 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48958 a!2804) j!70) mask!2512) (select (arr!48958 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525939 () Bool)

(declare-fun res!1043978 () Bool)

(assert (=> b!1525939 (=> (not res!1043978) (not e!850582))))

(assert (=> b!1525939 (= res!1043978 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) lt!660894))))

(declare-fun lt!660895 () array!101463)

(declare-fun e!850584 () Bool)

(declare-fun b!1525940 () Bool)

(declare-fun lt!660898 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101463 (_ BitVec 32)) SeekEntryResult!13123)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101463 (_ BitVec 32)) SeekEntryResult!13123)

(assert (=> b!1525940 (= e!850584 (= (seekEntryOrOpen!0 lt!660898 lt!660895 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660898 lt!660895 mask!2512)))))

(declare-fun b!1525942 () Bool)

(declare-fun e!850579 () Bool)

(assert (=> b!1525942 (= e!850579 e!850584)))

(declare-fun res!1043974 () Bool)

(assert (=> b!1525942 (=> (not res!1043974) (not e!850584))))

(assert (=> b!1525942 (= res!1043974 (= (seekEntryOrOpen!0 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48958 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525943 () Bool)

(assert (=> b!1525943 (= e!850581 e!850579)))

(declare-fun res!1043979 () Bool)

(assert (=> b!1525943 (=> res!1043979 e!850579)))

(assert (=> b!1525943 (= res!1043979 (or (not (= (select (arr!48958 a!2804) j!70) lt!660898)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48958 a!2804) index!487) (select (arr!48958 a!2804) j!70)) (not (= (select (arr!48958 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525944 () Bool)

(declare-fun res!1043975 () Bool)

(assert (=> b!1525944 (=> (not res!1043975) (not e!850583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525944 (= res!1043975 (validKeyInArray!0 (select (arr!48958 a!2804) j!70)))))

(declare-fun b!1525945 () Bool)

(declare-fun res!1043980 () Bool)

(assert (=> b!1525945 (=> (not res!1043980) (not e!850583))))

(declare-datatypes ((List!35441 0))(
  ( (Nil!35438) (Cons!35437 (h!36870 (_ BitVec 64)) (t!50135 List!35441)) )
))
(declare-fun arrayNoDuplicates!0 (array!101463 (_ BitVec 32) List!35441) Bool)

(assert (=> b!1525945 (= res!1043980 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35438))))

(declare-fun b!1525946 () Bool)

(declare-fun e!850585 () Bool)

(assert (=> b!1525946 (= e!850582 e!850585)))

(declare-fun res!1043970 () Bool)

(assert (=> b!1525946 (=> (not res!1043970) (not e!850585))))

(assert (=> b!1525946 (= res!1043970 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660898 mask!2512) lt!660898 lt!660895 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525946 (= lt!660898 (select (store (arr!48958 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525946 (= lt!660895 (array!101464 (store (arr!48958 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49508 a!2804)))))

(declare-fun b!1525947 () Bool)

(declare-fun res!1043972 () Bool)

(assert (=> b!1525947 (=> (not res!1043972) (not e!850583))))

(assert (=> b!1525947 (= res!1043972 (and (= (size!49508 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49508 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49508 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525941 () Bool)

(declare-fun res!1043971 () Bool)

(assert (=> b!1525941 (=> (not res!1043971) (not e!850583))))

(assert (=> b!1525941 (= res!1043971 (validKeyInArray!0 (select (arr!48958 a!2804) i!961)))))

(declare-fun res!1043982 () Bool)

(assert (=> start!130050 (=> (not res!1043982) (not e!850583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130050 (= res!1043982 (validMask!0 mask!2512))))

(assert (=> start!130050 e!850583))

(assert (=> start!130050 true))

(declare-fun array_inv!37986 (array!101463) Bool)

(assert (=> start!130050 (array_inv!37986 a!2804)))

(declare-fun b!1525948 () Bool)

(assert (=> b!1525948 (= e!850585 (not true))))

(assert (=> b!1525948 e!850581))

(declare-fun res!1043981 () Bool)

(assert (=> b!1525948 (=> (not res!1043981) (not e!850581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101463 (_ BitVec 32)) Bool)

(assert (=> b!1525948 (= res!1043981 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51030 0))(
  ( (Unit!51031) )
))
(declare-fun lt!660897 () Unit!51030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51030)

(assert (=> b!1525948 (= lt!660897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525949 () Bool)

(declare-fun res!1043973 () Bool)

(assert (=> b!1525949 (=> (not res!1043973) (not e!850583))))

(assert (=> b!1525949 (= res!1043973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130050 res!1043982) b!1525947))

(assert (= (and b!1525947 res!1043972) b!1525941))

(assert (= (and b!1525941 res!1043971) b!1525944))

(assert (= (and b!1525944 res!1043975) b!1525949))

(assert (= (and b!1525949 res!1043973) b!1525945))

(assert (= (and b!1525945 res!1043980) b!1525936))

(assert (= (and b!1525936 res!1043983) b!1525938))

(assert (= (and b!1525938 res!1043976) b!1525939))

(assert (= (and b!1525939 res!1043978) b!1525946))

(assert (= (and b!1525946 res!1043970) b!1525948))

(assert (= (and b!1525948 res!1043981) b!1525937))

(assert (= (and b!1525937 res!1043977) b!1525943))

(assert (= (and b!1525943 (not res!1043979)) b!1525942))

(assert (= (and b!1525942 res!1043974) b!1525940))

(declare-fun m!1408691 () Bool)

(assert (=> b!1525945 m!1408691))

(declare-fun m!1408693 () Bool)

(assert (=> b!1525937 m!1408693))

(assert (=> b!1525937 m!1408693))

(declare-fun m!1408695 () Bool)

(assert (=> b!1525937 m!1408695))

(declare-fun m!1408697 () Bool)

(assert (=> b!1525948 m!1408697))

(declare-fun m!1408699 () Bool)

(assert (=> b!1525948 m!1408699))

(declare-fun m!1408701 () Bool)

(assert (=> b!1525940 m!1408701))

(declare-fun m!1408703 () Bool)

(assert (=> b!1525940 m!1408703))

(declare-fun m!1408705 () Bool)

(assert (=> b!1525946 m!1408705))

(assert (=> b!1525946 m!1408705))

(declare-fun m!1408707 () Bool)

(assert (=> b!1525946 m!1408707))

(declare-fun m!1408709 () Bool)

(assert (=> b!1525946 m!1408709))

(declare-fun m!1408711 () Bool)

(assert (=> b!1525946 m!1408711))

(assert (=> b!1525942 m!1408693))

(assert (=> b!1525942 m!1408693))

(declare-fun m!1408713 () Bool)

(assert (=> b!1525942 m!1408713))

(assert (=> b!1525942 m!1408693))

(declare-fun m!1408715 () Bool)

(assert (=> b!1525942 m!1408715))

(declare-fun m!1408717 () Bool)

(assert (=> b!1525941 m!1408717))

(assert (=> b!1525941 m!1408717))

(declare-fun m!1408719 () Bool)

(assert (=> b!1525941 m!1408719))

(assert (=> b!1525943 m!1408693))

(declare-fun m!1408721 () Bool)

(assert (=> b!1525943 m!1408721))

(declare-fun m!1408723 () Bool)

(assert (=> start!130050 m!1408723))

(declare-fun m!1408725 () Bool)

(assert (=> start!130050 m!1408725))

(assert (=> b!1525938 m!1408693))

(assert (=> b!1525938 m!1408693))

(declare-fun m!1408727 () Bool)

(assert (=> b!1525938 m!1408727))

(assert (=> b!1525938 m!1408727))

(assert (=> b!1525938 m!1408693))

(declare-fun m!1408729 () Bool)

(assert (=> b!1525938 m!1408729))

(assert (=> b!1525944 m!1408693))

(assert (=> b!1525944 m!1408693))

(declare-fun m!1408731 () Bool)

(assert (=> b!1525944 m!1408731))

(declare-fun m!1408733 () Bool)

(assert (=> b!1525949 m!1408733))

(assert (=> b!1525939 m!1408693))

(assert (=> b!1525939 m!1408693))

(declare-fun m!1408735 () Bool)

(assert (=> b!1525939 m!1408735))

(push 1)

