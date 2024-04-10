; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130440 () Bool)

(assert start!130440)

(declare-fun b!1530888 () Bool)

(declare-fun res!1048234 () Bool)

(declare-fun e!853048 () Bool)

(assert (=> b!1530888 (=> (not res!1048234) (not e!853048))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101676 0))(
  ( (array!101677 (arr!49060 (Array (_ BitVec 32) (_ BitVec 64))) (size!49610 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101676)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13225 0))(
  ( (MissingZero!13225 (index!55295 (_ BitVec 32))) (Found!13225 (index!55296 (_ BitVec 32))) (Intermediate!13225 (undefined!14037 Bool) (index!55297 (_ BitVec 32)) (x!136986 (_ BitVec 32))) (Undefined!13225) (MissingVacant!13225 (index!55298 (_ BitVec 32))) )
))
(declare-fun lt!663017 () SeekEntryResult!13225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101676 (_ BitVec 32)) SeekEntryResult!13225)

(assert (=> b!1530888 (= res!1048234 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) lt!663017))))

(declare-fun b!1530889 () Bool)

(declare-fun res!1048237 () Bool)

(declare-fun e!853047 () Bool)

(assert (=> b!1530889 (=> (not res!1048237) (not e!853047))))

(declare-datatypes ((List!35543 0))(
  ( (Nil!35540) (Cons!35539 (h!36981 (_ BitVec 64)) (t!50237 List!35543)) )
))
(declare-fun arrayNoDuplicates!0 (array!101676 (_ BitVec 32) List!35543) Bool)

(assert (=> b!1530889 (= res!1048237 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35540))))

(declare-fun b!1530890 () Bool)

(declare-fun e!853049 () Bool)

(assert (=> b!1530890 (= e!853049 true)))

(declare-fun lt!663019 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530890 (= lt!663019 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530891 () Bool)

(declare-fun e!853050 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101676 (_ BitVec 32)) SeekEntryResult!13225)

(assert (=> b!1530891 (= e!853050 (= (seekEntry!0 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) (Found!13225 j!70)))))

(declare-fun b!1530892 () Bool)

(declare-fun res!1048229 () Bool)

(assert (=> b!1530892 (=> (not res!1048229) (not e!853047))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530892 (= res!1048229 (validKeyInArray!0 (select (arr!49060 a!2804) i!961)))))

(declare-fun b!1530893 () Bool)

(declare-fun res!1048239 () Bool)

(assert (=> b!1530893 (=> (not res!1048239) (not e!853047))))

(assert (=> b!1530893 (= res!1048239 (and (= (size!49610 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49610 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49610 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530894 () Bool)

(assert (=> b!1530894 (= e!853048 (not e!853049))))

(declare-fun res!1048238 () Bool)

(assert (=> b!1530894 (=> res!1048238 e!853049)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530894 (= res!1048238 (or (not (= (select (arr!49060 a!2804) j!70) (select (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530894 e!853050))

(declare-fun res!1048235 () Bool)

(assert (=> b!1530894 (=> (not res!1048235) (not e!853050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101676 (_ BitVec 32)) Bool)

(assert (=> b!1530894 (= res!1048235 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51234 0))(
  ( (Unit!51235) )
))
(declare-fun lt!663016 () Unit!51234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51234)

(assert (=> b!1530894 (= lt!663016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530896 () Bool)

(declare-fun res!1048231 () Bool)

(assert (=> b!1530896 (=> (not res!1048231) (not e!853047))))

(assert (=> b!1530896 (= res!1048231 (validKeyInArray!0 (select (arr!49060 a!2804) j!70)))))

(declare-fun b!1530897 () Bool)

(declare-fun res!1048236 () Bool)

(assert (=> b!1530897 (=> (not res!1048236) (not e!853047))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530897 (= res!1048236 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49610 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49610 a!2804))))))

(declare-fun b!1530898 () Bool)

(declare-fun res!1048233 () Bool)

(assert (=> b!1530898 (=> (not res!1048233) (not e!853048))))

(declare-fun lt!663018 () SeekEntryResult!13225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530898 (= res!1048233 (= lt!663018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101677 (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49610 a!2804)) mask!2512)))))

(declare-fun b!1530899 () Bool)

(assert (=> b!1530899 (= e!853047 e!853048)))

(declare-fun res!1048240 () Bool)

(assert (=> b!1530899 (=> (not res!1048240) (not e!853048))))

(assert (=> b!1530899 (= res!1048240 (= lt!663018 lt!663017))))

(assert (=> b!1530899 (= lt!663017 (Intermediate!13225 false resIndex!21 resX!21))))

(assert (=> b!1530899 (= lt!663018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49060 a!2804) j!70) mask!2512) (select (arr!49060 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530895 () Bool)

(declare-fun res!1048232 () Bool)

(assert (=> b!1530895 (=> (not res!1048232) (not e!853047))))

(assert (=> b!1530895 (= res!1048232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1048230 () Bool)

(assert (=> start!130440 (=> (not res!1048230) (not e!853047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130440 (= res!1048230 (validMask!0 mask!2512))))

(assert (=> start!130440 e!853047))

(assert (=> start!130440 true))

(declare-fun array_inv!38088 (array!101676) Bool)

(assert (=> start!130440 (array_inv!38088 a!2804)))

(assert (= (and start!130440 res!1048230) b!1530893))

(assert (= (and b!1530893 res!1048239) b!1530892))

(assert (= (and b!1530892 res!1048229) b!1530896))

(assert (= (and b!1530896 res!1048231) b!1530895))

(assert (= (and b!1530895 res!1048232) b!1530889))

(assert (= (and b!1530889 res!1048237) b!1530897))

(assert (= (and b!1530897 res!1048236) b!1530899))

(assert (= (and b!1530899 res!1048240) b!1530888))

(assert (= (and b!1530888 res!1048234) b!1530898))

(assert (= (and b!1530898 res!1048233) b!1530894))

(assert (= (and b!1530894 res!1048235) b!1530891))

(assert (= (and b!1530894 (not res!1048238)) b!1530890))

(declare-fun m!1413655 () Bool)

(assert (=> b!1530888 m!1413655))

(assert (=> b!1530888 m!1413655))

(declare-fun m!1413657 () Bool)

(assert (=> b!1530888 m!1413657))

(assert (=> b!1530894 m!1413655))

(declare-fun m!1413659 () Bool)

(assert (=> b!1530894 m!1413659))

(declare-fun m!1413661 () Bool)

(assert (=> b!1530894 m!1413661))

(declare-fun m!1413663 () Bool)

(assert (=> b!1530894 m!1413663))

(declare-fun m!1413665 () Bool)

(assert (=> b!1530894 m!1413665))

(declare-fun m!1413667 () Bool)

(assert (=> b!1530895 m!1413667))

(assert (=> b!1530898 m!1413661))

(assert (=> b!1530898 m!1413663))

(assert (=> b!1530898 m!1413663))

(declare-fun m!1413669 () Bool)

(assert (=> b!1530898 m!1413669))

(assert (=> b!1530898 m!1413669))

(assert (=> b!1530898 m!1413663))

(declare-fun m!1413671 () Bool)

(assert (=> b!1530898 m!1413671))

(declare-fun m!1413673 () Bool)

(assert (=> start!130440 m!1413673))

(declare-fun m!1413675 () Bool)

(assert (=> start!130440 m!1413675))

(assert (=> b!1530891 m!1413655))

(assert (=> b!1530891 m!1413655))

(declare-fun m!1413677 () Bool)

(assert (=> b!1530891 m!1413677))

(declare-fun m!1413679 () Bool)

(assert (=> b!1530892 m!1413679))

(assert (=> b!1530892 m!1413679))

(declare-fun m!1413681 () Bool)

(assert (=> b!1530892 m!1413681))

(assert (=> b!1530896 m!1413655))

(assert (=> b!1530896 m!1413655))

(declare-fun m!1413683 () Bool)

(assert (=> b!1530896 m!1413683))

(declare-fun m!1413685 () Bool)

(assert (=> b!1530889 m!1413685))

(assert (=> b!1530899 m!1413655))

(assert (=> b!1530899 m!1413655))

(declare-fun m!1413687 () Bool)

(assert (=> b!1530899 m!1413687))

(assert (=> b!1530899 m!1413687))

(assert (=> b!1530899 m!1413655))

(declare-fun m!1413689 () Bool)

(assert (=> b!1530899 m!1413689))

(declare-fun m!1413691 () Bool)

(assert (=> b!1530890 m!1413691))

(push 1)

(assert (not b!1530891))

(assert (not start!130440))

(assert (not b!1530898))

(assert (not b!1530899))

(assert (not b!1530892))

(assert (not b!1530888))

(assert (not b!1530889))

(assert (not b!1530894))

(assert (not b!1530896))

(assert (not b!1530890))

(assert (not b!1530895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

