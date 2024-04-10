; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125248 () Bool)

(assert start!125248)

(declare-fun b!1461657 () Bool)

(declare-fun res!991239 () Bool)

(declare-fun e!821716 () Bool)

(assert (=> b!1461657 (=> (not res!991239) (not e!821716))))

(declare-datatypes ((array!98696 0))(
  ( (array!98697 (arr!47636 (Array (_ BitVec 32) (_ BitVec 64))) (size!48186 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98696)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11888 0))(
  ( (MissingZero!11888 (index!49944 (_ BitVec 32))) (Found!11888 (index!49945 (_ BitVec 32))) (Intermediate!11888 (undefined!12700 Bool) (index!49946 (_ BitVec 32)) (x!131545 (_ BitVec 32))) (Undefined!11888) (MissingVacant!11888 (index!49947 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98696 (_ BitVec 32)) SeekEntryResult!11888)

(assert (=> b!1461657 (= res!991239 (= (seekEntryOrOpen!0 (select (arr!47636 a!2862) j!93) a!2862 mask!2687) (Found!11888 j!93)))))

(declare-fun b!1461658 () Bool)

(declare-fun e!821713 () Bool)

(declare-fun e!821712 () Bool)

(assert (=> b!1461658 (= e!821713 e!821712)))

(declare-fun res!991249 () Bool)

(assert (=> b!1461658 (=> (not res!991249) (not e!821712))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!640203 () SeekEntryResult!11888)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461658 (= res!991249 (= lt!640203 (Intermediate!11888 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640201 () (_ BitVec 64))

(declare-fun lt!640202 () array!98696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98696 (_ BitVec 32)) SeekEntryResult!11888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461658 (= lt!640203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640201 mask!2687) lt!640201 lt!640202 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461658 (= lt!640201 (select (store (arr!47636 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461659 () Bool)

(declare-fun res!991232 () Bool)

(declare-fun e!821718 () Bool)

(assert (=> b!1461659 (=> (not res!991232) (not e!821718))))

(assert (=> b!1461659 (= res!991232 (and (= (size!48186 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48186 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48186 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461660 () Bool)

(declare-fun res!991245 () Bool)

(assert (=> b!1461660 (=> (not res!991245) (not e!821718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461660 (= res!991245 (validKeyInArray!0 (select (arr!47636 a!2862) j!93)))))

(declare-fun b!1461661 () Bool)

(declare-fun res!991247 () Bool)

(assert (=> b!1461661 (=> (not res!991247) (not e!821713))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640200 () SeekEntryResult!11888)

(assert (=> b!1461661 (= res!991247 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47636 a!2862) j!93) a!2862 mask!2687) lt!640200))))

(declare-fun b!1461662 () Bool)

(declare-fun e!821719 () Bool)

(declare-fun e!821714 () Bool)

(assert (=> b!1461662 (= e!821719 e!821714)))

(declare-fun res!991240 () Bool)

(assert (=> b!1461662 (=> res!991240 e!821714)))

(declare-fun lt!640206 () (_ BitVec 32))

(assert (=> b!1461662 (= res!991240 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640206 #b00000000000000000000000000000000) (bvsge lt!640206 (size!48186 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461662 (= lt!640206 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461663 () Bool)

(declare-fun res!991236 () Bool)

(assert (=> b!1461663 (=> (not res!991236) (not e!821712))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461663 (= res!991236 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!991235 () Bool)

(assert (=> start!125248 (=> (not res!991235) (not e!821718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125248 (= res!991235 (validMask!0 mask!2687))))

(assert (=> start!125248 e!821718))

(assert (=> start!125248 true))

(declare-fun array_inv!36664 (array!98696) Bool)

(assert (=> start!125248 (array_inv!36664 a!2862)))

(declare-fun b!1461664 () Bool)

(declare-fun e!821711 () Bool)

(assert (=> b!1461664 (= e!821718 e!821711)))

(declare-fun res!991243 () Bool)

(assert (=> b!1461664 (=> (not res!991243) (not e!821711))))

(assert (=> b!1461664 (= res!991243 (= (select (store (arr!47636 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461664 (= lt!640202 (array!98697 (store (arr!47636 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48186 a!2862)))))

(declare-fun b!1461665 () Bool)

(declare-fun res!991237 () Bool)

(assert (=> b!1461665 (=> (not res!991237) (not e!821718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98696 (_ BitVec 32)) Bool)

(assert (=> b!1461665 (= res!991237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461666 () Bool)

(assert (=> b!1461666 (= e!821714 true)))

(declare-fun lt!640205 () Bool)

(declare-fun e!821720 () Bool)

(assert (=> b!1461666 (= lt!640205 e!821720)))

(declare-fun c!134723 () Bool)

(assert (=> b!1461666 (= c!134723 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461667 () Bool)

(declare-fun res!991238 () Bool)

(assert (=> b!1461667 (=> (not res!991238) (not e!821718))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461667 (= res!991238 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48186 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48186 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48186 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461668 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98696 (_ BitVec 32)) SeekEntryResult!11888)

(assert (=> b!1461668 (= e!821720 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640206 intermediateAfterIndex!19 lt!640201 lt!640202 mask!2687) (seekEntryOrOpen!0 lt!640201 lt!640202 mask!2687))))))

(declare-fun b!1461669 () Bool)

(declare-fun res!991248 () Bool)

(assert (=> b!1461669 (=> (not res!991248) (not e!821718))))

(assert (=> b!1461669 (= res!991248 (validKeyInArray!0 (select (arr!47636 a!2862) i!1006)))))

(declare-fun b!1461670 () Bool)

(declare-fun res!991234 () Bool)

(assert (=> b!1461670 (=> (not res!991234) (not e!821718))))

(declare-datatypes ((List!34137 0))(
  ( (Nil!34134) (Cons!34133 (h!35483 (_ BitVec 64)) (t!48831 List!34137)) )
))
(declare-fun arrayNoDuplicates!0 (array!98696 (_ BitVec 32) List!34137) Bool)

(assert (=> b!1461670 (= res!991234 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34134))))

(declare-fun b!1461671 () Bool)

(declare-fun res!991244 () Bool)

(assert (=> b!1461671 (=> res!991244 e!821714)))

(assert (=> b!1461671 (= res!991244 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640206 (select (arr!47636 a!2862) j!93) a!2862 mask!2687) lt!640200)))))

(declare-fun b!1461672 () Bool)

(declare-fun e!821715 () Bool)

(assert (=> b!1461672 (= e!821715 (= lt!640203 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640201 lt!640202 mask!2687)))))

(declare-fun b!1461673 () Bool)

(assert (=> b!1461673 (= e!821720 (not (= lt!640203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640206 lt!640201 lt!640202 mask!2687))))))

(declare-fun b!1461674 () Bool)

(assert (=> b!1461674 (= e!821715 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640201 lt!640202 mask!2687) (seekEntryOrOpen!0 lt!640201 lt!640202 mask!2687)))))

(declare-fun b!1461675 () Bool)

(assert (=> b!1461675 (= e!821711 e!821713)))

(declare-fun res!991246 () Bool)

(assert (=> b!1461675 (=> (not res!991246) (not e!821713))))

(assert (=> b!1461675 (= res!991246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47636 a!2862) j!93) mask!2687) (select (arr!47636 a!2862) j!93) a!2862 mask!2687) lt!640200))))

(assert (=> b!1461675 (= lt!640200 (Intermediate!11888 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461676 () Bool)

(assert (=> b!1461676 (= e!821716 (or (= (select (arr!47636 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47636 a!2862) intermediateBeforeIndex!19) (select (arr!47636 a!2862) j!93))))))

(declare-fun b!1461677 () Bool)

(assert (=> b!1461677 (= e!821712 (not e!821719))))

(declare-fun res!991241 () Bool)

(assert (=> b!1461677 (=> res!991241 e!821719)))

(assert (=> b!1461677 (= res!991241 (or (and (= (select (arr!47636 a!2862) index!646) (select (store (arr!47636 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47636 a!2862) index!646) (select (arr!47636 a!2862) j!93))) (= (select (arr!47636 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461677 e!821716))

(declare-fun res!991233 () Bool)

(assert (=> b!1461677 (=> (not res!991233) (not e!821716))))

(assert (=> b!1461677 (= res!991233 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49272 0))(
  ( (Unit!49273) )
))
(declare-fun lt!640204 () Unit!49272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49272)

(assert (=> b!1461677 (= lt!640204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461678 () Bool)

(declare-fun res!991242 () Bool)

(assert (=> b!1461678 (=> (not res!991242) (not e!821712))))

(assert (=> b!1461678 (= res!991242 e!821715)))

(declare-fun c!134724 () Bool)

(assert (=> b!1461678 (= c!134724 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125248 res!991235) b!1461659))

(assert (= (and b!1461659 res!991232) b!1461669))

(assert (= (and b!1461669 res!991248) b!1461660))

(assert (= (and b!1461660 res!991245) b!1461665))

(assert (= (and b!1461665 res!991237) b!1461670))

(assert (= (and b!1461670 res!991234) b!1461667))

(assert (= (and b!1461667 res!991238) b!1461664))

(assert (= (and b!1461664 res!991243) b!1461675))

(assert (= (and b!1461675 res!991246) b!1461661))

(assert (= (and b!1461661 res!991247) b!1461658))

(assert (= (and b!1461658 res!991249) b!1461678))

(assert (= (and b!1461678 c!134724) b!1461672))

(assert (= (and b!1461678 (not c!134724)) b!1461674))

(assert (= (and b!1461678 res!991242) b!1461663))

(assert (= (and b!1461663 res!991236) b!1461677))

(assert (= (and b!1461677 res!991233) b!1461657))

(assert (= (and b!1461657 res!991239) b!1461676))

(assert (= (and b!1461677 (not res!991241)) b!1461662))

(assert (= (and b!1461662 (not res!991240)) b!1461671))

(assert (= (and b!1461671 (not res!991244)) b!1461666))

(assert (= (and b!1461666 c!134723) b!1461673))

(assert (= (and b!1461666 (not c!134723)) b!1461668))

(declare-fun m!1349209 () Bool)

(assert (=> b!1461661 m!1349209))

(assert (=> b!1461661 m!1349209))

(declare-fun m!1349211 () Bool)

(assert (=> b!1461661 m!1349211))

(declare-fun m!1349213 () Bool)

(assert (=> b!1461668 m!1349213))

(declare-fun m!1349215 () Bool)

(assert (=> b!1461668 m!1349215))

(declare-fun m!1349217 () Bool)

(assert (=> b!1461674 m!1349217))

(assert (=> b!1461674 m!1349215))

(assert (=> b!1461671 m!1349209))

(assert (=> b!1461671 m!1349209))

(declare-fun m!1349219 () Bool)

(assert (=> b!1461671 m!1349219))

(declare-fun m!1349221 () Bool)

(assert (=> b!1461670 m!1349221))

(declare-fun m!1349223 () Bool)

(assert (=> start!125248 m!1349223))

(declare-fun m!1349225 () Bool)

(assert (=> start!125248 m!1349225))

(declare-fun m!1349227 () Bool)

(assert (=> b!1461673 m!1349227))

(assert (=> b!1461657 m!1349209))

(assert (=> b!1461657 m!1349209))

(declare-fun m!1349229 () Bool)

(assert (=> b!1461657 m!1349229))

(declare-fun m!1349231 () Bool)

(assert (=> b!1461658 m!1349231))

(assert (=> b!1461658 m!1349231))

(declare-fun m!1349233 () Bool)

(assert (=> b!1461658 m!1349233))

(declare-fun m!1349235 () Bool)

(assert (=> b!1461658 m!1349235))

(declare-fun m!1349237 () Bool)

(assert (=> b!1461658 m!1349237))

(declare-fun m!1349239 () Bool)

(assert (=> b!1461662 m!1349239))

(assert (=> b!1461675 m!1349209))

(assert (=> b!1461675 m!1349209))

(declare-fun m!1349241 () Bool)

(assert (=> b!1461675 m!1349241))

(assert (=> b!1461675 m!1349241))

(assert (=> b!1461675 m!1349209))

(declare-fun m!1349243 () Bool)

(assert (=> b!1461675 m!1349243))

(declare-fun m!1349245 () Bool)

(assert (=> b!1461677 m!1349245))

(assert (=> b!1461677 m!1349235))

(declare-fun m!1349247 () Bool)

(assert (=> b!1461677 m!1349247))

(declare-fun m!1349249 () Bool)

(assert (=> b!1461677 m!1349249))

(declare-fun m!1349251 () Bool)

(assert (=> b!1461677 m!1349251))

(assert (=> b!1461677 m!1349209))

(declare-fun m!1349253 () Bool)

(assert (=> b!1461669 m!1349253))

(assert (=> b!1461669 m!1349253))

(declare-fun m!1349255 () Bool)

(assert (=> b!1461669 m!1349255))

(declare-fun m!1349257 () Bool)

(assert (=> b!1461665 m!1349257))

(assert (=> b!1461664 m!1349235))

(declare-fun m!1349259 () Bool)

(assert (=> b!1461664 m!1349259))

(declare-fun m!1349261 () Bool)

(assert (=> b!1461672 m!1349261))

(assert (=> b!1461660 m!1349209))

(assert (=> b!1461660 m!1349209))

(declare-fun m!1349263 () Bool)

(assert (=> b!1461660 m!1349263))

(declare-fun m!1349265 () Bool)

(assert (=> b!1461676 m!1349265))

(assert (=> b!1461676 m!1349209))

(push 1)

