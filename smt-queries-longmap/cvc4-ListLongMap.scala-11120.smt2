; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129888 () Bool)

(assert start!129888)

(declare-fun b!1524510 () Bool)

(declare-fun e!849828 () Bool)

(declare-fun e!849832 () Bool)

(assert (=> b!1524510 (= e!849828 e!849832)))

(declare-fun res!1043168 () Bool)

(assert (=> b!1524510 (=> (not res!1043168) (not e!849832))))

(declare-datatypes ((SeekEntryResult!13108 0))(
  ( (MissingZero!13108 (index!54827 (_ BitVec 32))) (Found!13108 (index!54828 (_ BitVec 32))) (Intermediate!13108 (undefined!13920 Bool) (index!54829 (_ BitVec 32)) (x!136512 (_ BitVec 32))) (Undefined!13108) (MissingVacant!13108 (index!54830 (_ BitVec 32))) )
))
(declare-fun lt!660332 () SeekEntryResult!13108)

(declare-fun lt!660333 () SeekEntryResult!13108)

(assert (=> b!1524510 (= res!1043168 (= lt!660332 lt!660333))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524510 (= lt!660333 (Intermediate!13108 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101427 0))(
  ( (array!101428 (arr!48943 (Array (_ BitVec 32) (_ BitVec 64))) (size!49493 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101427 (_ BitVec 32)) SeekEntryResult!13108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524510 (= lt!660332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524511 () Bool)

(declare-fun e!849829 () Bool)

(assert (=> b!1524511 (= e!849832 (not e!849829))))

(declare-fun res!1043167 () Bool)

(assert (=> b!1524511 (=> res!1043167 e!849829)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524511 (= res!1043167 (or (not (= (select (arr!48943 a!2804) j!70) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48943 a!2804) index!487) (select (arr!48943 a!2804) j!70)) (not (= (select (arr!48943 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!849830 () Bool)

(assert (=> b!1524511 e!849830))

(declare-fun res!1043169 () Bool)

(assert (=> b!1524511 (=> (not res!1043169) (not e!849830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101427 (_ BitVec 32)) Bool)

(assert (=> b!1524511 (= res!1043169 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51000 0))(
  ( (Unit!51001) )
))
(declare-fun lt!660334 () Unit!51000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51000)

(assert (=> b!1524511 (= lt!660334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524512 () Bool)

(declare-fun res!1043171 () Bool)

(assert (=> b!1524512 (=> (not res!1043171) (not e!849828))))

(declare-datatypes ((List!35426 0))(
  ( (Nil!35423) (Cons!35422 (h!36849 (_ BitVec 64)) (t!50120 List!35426)) )
))
(declare-fun arrayNoDuplicates!0 (array!101427 (_ BitVec 32) List!35426) Bool)

(assert (=> b!1524512 (= res!1043171 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35423))))

(declare-fun b!1524513 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101427 (_ BitVec 32)) SeekEntryResult!13108)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101427 (_ BitVec 32)) SeekEntryResult!13108)

(assert (=> b!1524513 (= e!849829 (= (seekEntryOrOpen!0 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524514 () Bool)

(declare-fun res!1043165 () Bool)

(assert (=> b!1524514 (=> (not res!1043165) (not e!849832))))

(assert (=> b!1524514 (= res!1043165 (= lt!660332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)) mask!2512)))))

(declare-fun b!1524515 () Bool)

(declare-fun res!1043173 () Bool)

(assert (=> b!1524515 (=> (not res!1043173) (not e!849828))))

(assert (=> b!1524515 (= res!1043173 (and (= (size!49493 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49493 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49493 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524516 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101427 (_ BitVec 32)) SeekEntryResult!13108)

(assert (=> b!1524516 (= e!849830 (= (seekEntry!0 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) (Found!13108 j!70)))))

(declare-fun b!1524517 () Bool)

(declare-fun res!1043166 () Bool)

(assert (=> b!1524517 (=> (not res!1043166) (not e!849828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524517 (= res!1043166 (validKeyInArray!0 (select (arr!48943 a!2804) j!70)))))

(declare-fun res!1043162 () Bool)

(assert (=> start!129888 (=> (not res!1043162) (not e!849828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129888 (= res!1043162 (validMask!0 mask!2512))))

(assert (=> start!129888 e!849828))

(assert (=> start!129888 true))

(declare-fun array_inv!37971 (array!101427) Bool)

(assert (=> start!129888 (array_inv!37971 a!2804)))

(declare-fun b!1524518 () Bool)

(declare-fun res!1043170 () Bool)

(assert (=> b!1524518 (=> (not res!1043170) (not e!849828))))

(assert (=> b!1524518 (= res!1043170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524519 () Bool)

(declare-fun res!1043164 () Bool)

(assert (=> b!1524519 (=> (not res!1043164) (not e!849828))))

(assert (=> b!1524519 (= res!1043164 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49493 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49493 a!2804))))))

(declare-fun b!1524520 () Bool)

(declare-fun res!1043163 () Bool)

(assert (=> b!1524520 (=> (not res!1043163) (not e!849828))))

(assert (=> b!1524520 (= res!1043163 (validKeyInArray!0 (select (arr!48943 a!2804) i!961)))))

(declare-fun b!1524521 () Bool)

(declare-fun res!1043172 () Bool)

(assert (=> b!1524521 (=> (not res!1043172) (not e!849832))))

(assert (=> b!1524521 (= res!1043172 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660333))))

(assert (= (and start!129888 res!1043162) b!1524515))

(assert (= (and b!1524515 res!1043173) b!1524520))

(assert (= (and b!1524520 res!1043163) b!1524517))

(assert (= (and b!1524517 res!1043166) b!1524518))

(assert (= (and b!1524518 res!1043170) b!1524512))

(assert (= (and b!1524512 res!1043171) b!1524519))

(assert (= (and b!1524519 res!1043164) b!1524510))

(assert (= (and b!1524510 res!1043168) b!1524521))

(assert (= (and b!1524521 res!1043172) b!1524514))

(assert (= (and b!1524514 res!1043165) b!1524511))

(assert (= (and b!1524511 res!1043169) b!1524516))

(assert (= (and b!1524511 (not res!1043167)) b!1524513))

(declare-fun m!1407567 () Bool)

(assert (=> b!1524510 m!1407567))

(assert (=> b!1524510 m!1407567))

(declare-fun m!1407569 () Bool)

(assert (=> b!1524510 m!1407569))

(assert (=> b!1524510 m!1407569))

(assert (=> b!1524510 m!1407567))

(declare-fun m!1407571 () Bool)

(assert (=> b!1524510 m!1407571))

(declare-fun m!1407573 () Bool)

(assert (=> b!1524512 m!1407573))

(assert (=> b!1524513 m!1407567))

(assert (=> b!1524513 m!1407567))

(declare-fun m!1407575 () Bool)

(assert (=> b!1524513 m!1407575))

(assert (=> b!1524513 m!1407567))

(declare-fun m!1407577 () Bool)

(assert (=> b!1524513 m!1407577))

(assert (=> b!1524516 m!1407567))

(assert (=> b!1524516 m!1407567))

(declare-fun m!1407579 () Bool)

(assert (=> b!1524516 m!1407579))

(assert (=> b!1524511 m!1407567))

(declare-fun m!1407581 () Bool)

(assert (=> b!1524511 m!1407581))

(declare-fun m!1407583 () Bool)

(assert (=> b!1524511 m!1407583))

(declare-fun m!1407585 () Bool)

(assert (=> b!1524511 m!1407585))

(declare-fun m!1407587 () Bool)

(assert (=> b!1524511 m!1407587))

(declare-fun m!1407589 () Bool)

(assert (=> b!1524511 m!1407589))

(declare-fun m!1407591 () Bool)

(assert (=> b!1524520 m!1407591))

(assert (=> b!1524520 m!1407591))

(declare-fun m!1407593 () Bool)

(assert (=> b!1524520 m!1407593))

(declare-fun m!1407595 () Bool)

(assert (=> b!1524518 m!1407595))

(assert (=> b!1524517 m!1407567))

(assert (=> b!1524517 m!1407567))

(declare-fun m!1407597 () Bool)

(assert (=> b!1524517 m!1407597))

(assert (=> b!1524521 m!1407567))

(assert (=> b!1524521 m!1407567))

(declare-fun m!1407599 () Bool)

(assert (=> b!1524521 m!1407599))

(declare-fun m!1407601 () Bool)

(assert (=> start!129888 m!1407601))

(declare-fun m!1407603 () Bool)

(assert (=> start!129888 m!1407603))

(assert (=> b!1524514 m!1407583))

(assert (=> b!1524514 m!1407587))

(assert (=> b!1524514 m!1407587))

(declare-fun m!1407605 () Bool)

(assert (=> b!1524514 m!1407605))

(assert (=> b!1524514 m!1407605))

(assert (=> b!1524514 m!1407587))

(declare-fun m!1407607 () Bool)

(assert (=> b!1524514 m!1407607))

(push 1)

(assert (not b!1524517))

(assert (not b!1524510))

(assert (not b!1524512))

(assert (not b!1524513))

(assert (not b!1524511))

(assert (not b!1524521))

(assert (not start!129888))

(assert (not b!1524520))

(assert (not b!1524516))

(assert (not b!1524518))

(assert (not b!1524514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1524624 () Bool)

(declare-fun e!849897 () SeekEntryResult!13108)

(declare-fun lt!660379 () SeekEntryResult!13108)

(assert (=> b!1524624 (= e!849897 (MissingZero!13108 (index!54829 lt!660379)))))

(declare-fun b!1524625 () Bool)

(assert (=> b!1524625 (= e!849897 (seekKeyOrZeroReturnVacant!0 (x!136512 lt!660379) (index!54829 lt!660379) (index!54829 lt!660379) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524626 () Bool)

(declare-fun e!849896 () SeekEntryResult!13108)

(assert (=> b!1524626 (= e!849896 (Found!13108 (index!54829 lt!660379)))))

(declare-fun d!159369 () Bool)

(declare-fun lt!660380 () SeekEntryResult!13108)

(assert (=> d!159369 (and (or (is-Undefined!13108 lt!660380) (not (is-Found!13108 lt!660380)) (and (bvsge (index!54828 lt!660380) #b00000000000000000000000000000000) (bvslt (index!54828 lt!660380) (size!49493 a!2804)))) (or (is-Undefined!13108 lt!660380) (is-Found!13108 lt!660380) (not (is-MissingZero!13108 lt!660380)) (and (bvsge (index!54827 lt!660380) #b00000000000000000000000000000000) (bvslt (index!54827 lt!660380) (size!49493 a!2804)))) (or (is-Undefined!13108 lt!660380) (is-Found!13108 lt!660380) (is-MissingZero!13108 lt!660380) (not (is-MissingVacant!13108 lt!660380)) (and (bvsge (index!54830 lt!660380) #b00000000000000000000000000000000) (bvslt (index!54830 lt!660380) (size!49493 a!2804)))) (or (is-Undefined!13108 lt!660380) (ite (is-Found!13108 lt!660380) (= (select (arr!48943 a!2804) (index!54828 lt!660380)) (select (arr!48943 a!2804) j!70)) (ite (is-MissingZero!13108 lt!660380) (= (select (arr!48943 a!2804) (index!54827 lt!660380)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13108 lt!660380) (= (select (arr!48943 a!2804) (index!54830 lt!660380)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849895 () SeekEntryResult!13108)

(assert (=> d!159369 (= lt!660380 e!849895)))

(declare-fun c!140258 () Bool)

(assert (=> d!159369 (= c!140258 (and (is-Intermediate!13108 lt!660379) (undefined!13920 lt!660379)))))

(assert (=> d!159369 (= lt!660379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159369 (validMask!0 mask!2512)))

(assert (=> d!159369 (= (seekEntryOrOpen!0 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660380)))

(declare-fun b!1524627 () Bool)

(assert (=> b!1524627 (= e!849895 e!849896)))

(declare-fun lt!660378 () (_ BitVec 64))

(assert (=> b!1524627 (= lt!660378 (select (arr!48943 a!2804) (index!54829 lt!660379)))))

(declare-fun c!140256 () Bool)

(assert (=> b!1524627 (= c!140256 (= lt!660378 (select (arr!48943 a!2804) j!70)))))

(declare-fun b!1524628 () Bool)

(assert (=> b!1524628 (= e!849895 Undefined!13108)))

(declare-fun b!1524629 () Bool)

(declare-fun c!140257 () Bool)

(assert (=> b!1524629 (= c!140257 (= lt!660378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524629 (= e!849896 e!849897)))

(assert (= (and d!159369 c!140258) b!1524628))

(assert (= (and d!159369 (not c!140258)) b!1524627))

(assert (= (and b!1524627 c!140256) b!1524626))

(assert (= (and b!1524627 (not c!140256)) b!1524629))

(assert (= (and b!1524629 c!140257) b!1524624))

(assert (= (and b!1524629 (not c!140257)) b!1524625))

(assert (=> b!1524625 m!1407567))

(declare-fun m!1407649 () Bool)

(assert (=> b!1524625 m!1407649))

(assert (=> d!159369 m!1407601))

(assert (=> d!159369 m!1407569))

(assert (=> d!159369 m!1407567))

(assert (=> d!159369 m!1407571))

(declare-fun m!1407651 () Bool)

(assert (=> d!159369 m!1407651))

(declare-fun m!1407653 () Bool)

(assert (=> d!159369 m!1407653))

(assert (=> d!159369 m!1407567))

(assert (=> d!159369 m!1407569))

(declare-fun m!1407655 () Bool)

(assert (=> d!159369 m!1407655))

(declare-fun m!1407657 () Bool)

(assert (=> b!1524627 m!1407657))

(assert (=> b!1524513 d!159369))

(declare-fun b!1524690 () Bool)

(declare-fun e!849930 () SeekEntryResult!13108)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524690 (= e!849930 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524691 () Bool)

(declare-fun c!140289 () Bool)

(declare-fun lt!660415 () (_ BitVec 64))

(assert (=> b!1524691 (= c!140289 (= lt!660415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849928 () SeekEntryResult!13108)

(assert (=> b!1524691 (= e!849928 e!849930)))

(declare-fun b!1524692 () Bool)

(assert (=> b!1524692 (= e!849928 (Found!13108 index!487))))

(declare-fun b!1524693 () Bool)

(declare-fun e!849929 () SeekEntryResult!13108)

(assert (=> b!1524693 (= e!849929 Undefined!13108)))

(declare-fun b!1524694 () Bool)

(assert (=> b!1524694 (= e!849930 (MissingVacant!13108 index!487))))

(declare-fun lt!660416 () SeekEntryResult!13108)

(declare-fun d!159383 () Bool)

(assert (=> d!159383 (and (or (is-Undefined!13108 lt!660416) (not (is-Found!13108 lt!660416)) (and (bvsge (index!54828 lt!660416) #b00000000000000000000000000000000) (bvslt (index!54828 lt!660416) (size!49493 a!2804)))) (or (is-Undefined!13108 lt!660416) (is-Found!13108 lt!660416) (not (is-MissingVacant!13108 lt!660416)) (not (= (index!54830 lt!660416) index!487)) (and (bvsge (index!54830 lt!660416) #b00000000000000000000000000000000) (bvslt (index!54830 lt!660416) (size!49493 a!2804)))) (or (is-Undefined!13108 lt!660416) (ite (is-Found!13108 lt!660416) (= (select (arr!48943 a!2804) (index!54828 lt!660416)) (select (arr!48943 a!2804) j!70)) (and (is-MissingVacant!13108 lt!660416) (= (index!54830 lt!660416) index!487) (= (select (arr!48943 a!2804) (index!54830 lt!660416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159383 (= lt!660416 e!849929)))

(declare-fun c!140290 () Bool)

(assert (=> d!159383 (= c!140290 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159383 (= lt!660415 (select (arr!48943 a!2804) index!487))))

(assert (=> d!159383 (validMask!0 mask!2512)))

(assert (=> d!159383 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660416)))

(declare-fun b!1524695 () Bool)

(assert (=> b!1524695 (= e!849929 e!849928)))

(declare-fun c!140291 () Bool)

(assert (=> b!1524695 (= c!140291 (= lt!660415 (select (arr!48943 a!2804) j!70)))))

(assert (= (and d!159383 c!140290) b!1524693))

(assert (= (and d!159383 (not c!140290)) b!1524695))

(assert (= (and b!1524695 c!140291) b!1524692))

(assert (= (and b!1524695 (not c!140291)) b!1524691))

(assert (= (and b!1524691 c!140289) b!1524694))

(assert (= (and b!1524691 (not c!140289)) b!1524690))

(declare-fun m!1407671 () Bool)

(assert (=> b!1524690 m!1407671))

(assert (=> b!1524690 m!1407671))

(assert (=> b!1524690 m!1407567))

(declare-fun m!1407673 () Bool)

(assert (=> b!1524690 m!1407673))

(declare-fun m!1407675 () Bool)

(assert (=> d!159383 m!1407675))

(declare-fun m!1407677 () Bool)

(assert (=> d!159383 m!1407677))

(assert (=> d!159383 m!1407585))

(assert (=> d!159383 m!1407601))

(assert (=> b!1524513 d!159383))

(declare-fun e!849976 () SeekEntryResult!13108)

(declare-fun b!1524777 () Bool)

(assert (=> b!1524777 (= e!849976 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)) mask!2512))))

(declare-fun b!1524778 () Bool)

(declare-fun e!849977 () SeekEntryResult!13108)

(assert (=> b!1524778 (= e!849977 e!849976)))

(declare-fun lt!660452 () (_ BitVec 64))

(declare-fun c!140325 () Bool)

(assert (=> b!1524778 (= c!140325 (or (= lt!660452 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660452 lt!660452) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524779 () Bool)

(assert (=> b!1524779 (= e!849977 (Intermediate!13108 true (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524780 () Bool)

(declare-fun e!849979 () Bool)

(declare-fun lt!660453 () SeekEntryResult!13108)

(assert (=> b!1524780 (= e!849979 (bvsge (x!136512 lt!660453) #b01111111111111111111111111111110))))

(declare-fun b!1524781 () Bool)

(assert (=> b!1524781 (= e!849976 (Intermediate!13108 false (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524782 () Bool)

(assert (=> b!1524782 (and (bvsge (index!54829 lt!660453) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660453) (size!49493 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)))))))

(declare-fun res!1043227 () Bool)

(assert (=> b!1524782 (= res!1043227 (= (select (arr!48943 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804))) (index!54829 lt!660453)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849978 () Bool)

(assert (=> b!1524782 (=> res!1043227 e!849978)))

(declare-fun b!1524783 () Bool)

(assert (=> b!1524783 (and (bvsge (index!54829 lt!660453) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660453) (size!49493 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)))))))

(declare-fun res!1043228 () Bool)

(assert (=> b!1524783 (= res!1043228 (= (select (arr!48943 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804))) (index!54829 lt!660453)) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524783 (=> res!1043228 e!849978)))

(declare-fun e!849980 () Bool)

(assert (=> b!1524783 (= e!849980 e!849978)))

(declare-fun d!159391 () Bool)

(assert (=> d!159391 e!849979))

(declare-fun c!140327 () Bool)

(assert (=> d!159391 (= c!140327 (and (is-Intermediate!13108 lt!660453) (undefined!13920 lt!660453)))))

(assert (=> d!159391 (= lt!660453 e!849977)))

(declare-fun c!140326 () Bool)

(assert (=> d!159391 (= c!140326 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159391 (= lt!660452 (select (arr!48943 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804))) (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159391 (validMask!0 mask!2512)))

(assert (=> d!159391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)) mask!2512) lt!660453)))

(declare-fun b!1524784 () Bool)

(assert (=> b!1524784 (= e!849979 e!849980)))

(declare-fun res!1043229 () Bool)

(assert (=> b!1524784 (= res!1043229 (and (is-Intermediate!13108 lt!660453) (not (undefined!13920 lt!660453)) (bvslt (x!136512 lt!660453) #b01111111111111111111111111111110) (bvsge (x!136512 lt!660453) #b00000000000000000000000000000000) (bvsge (x!136512 lt!660453) #b00000000000000000000000000000000)))))

(assert (=> b!1524784 (=> (not res!1043229) (not e!849980))))

(declare-fun b!1524785 () Bool)

(assert (=> b!1524785 (and (bvsge (index!54829 lt!660453) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660453) (size!49493 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804)))))))

(assert (=> b!1524785 (= e!849978 (= (select (arr!48943 (array!101428 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49493 a!2804))) (index!54829 lt!660453)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159391 c!140326) b!1524779))

(assert (= (and d!159391 (not c!140326)) b!1524778))

(assert (= (and b!1524778 c!140325) b!1524781))

(assert (= (and b!1524778 (not c!140325)) b!1524777))

(assert (= (and d!159391 c!140327) b!1524780))

(assert (= (and d!159391 (not c!140327)) b!1524784))

(assert (= (and b!1524784 res!1043229) b!1524783))

(assert (= (and b!1524783 (not res!1043228)) b!1524782))

(assert (= (and b!1524782 (not res!1043227)) b!1524785))

(declare-fun m!1407723 () Bool)

(assert (=> b!1524783 m!1407723))

(assert (=> b!1524777 m!1407605))

(declare-fun m!1407731 () Bool)

(assert (=> b!1524777 m!1407731))

(assert (=> b!1524777 m!1407731))

(assert (=> b!1524777 m!1407587))

(declare-fun m!1407735 () Bool)

(assert (=> b!1524777 m!1407735))

(assert (=> b!1524782 m!1407723))

(assert (=> b!1524785 m!1407723))

(assert (=> d!159391 m!1407605))

(declare-fun m!1407737 () Bool)

(assert (=> d!159391 m!1407737))

(assert (=> d!159391 m!1407601))

(assert (=> b!1524514 d!159391))

(declare-fun d!159407 () Bool)

(declare-fun lt!660471 () (_ BitVec 32))

(declare-fun lt!660470 () (_ BitVec 32))

(assert (=> d!159407 (= lt!660471 (bvmul (bvxor lt!660470 (bvlshr lt!660470 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159407 (= lt!660470 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159407 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043232 (let ((h!36852 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136521 (bvmul (bvxor h!36852 (bvlshr h!36852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136521 (bvlshr x!136521 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043232 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043232 #b00000000000000000000000000000000))))))

(assert (=> d!159407 (= (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660471 (bvlshr lt!660471 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524514 d!159407))

(declare-fun d!159413 () Bool)

(assert (=> d!159413 (= (validKeyInArray!0 (select (arr!48943 a!2804) i!961)) (and (not (= (select (arr!48943 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48943 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524520 d!159413))

(declare-fun e!850015 () SeekEntryResult!13108)

(declare-fun b!1524841 () Bool)

(assert (=> b!1524841 (= e!850015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524842 () Bool)

(declare-fun e!850016 () SeekEntryResult!13108)

(assert (=> b!1524842 (= e!850016 e!850015)))

(declare-fun lt!660476 () (_ BitVec 64))

(declare-fun c!140347 () Bool)

(assert (=> b!1524842 (= c!140347 (or (= lt!660476 (select (arr!48943 a!2804) j!70)) (= (bvadd lt!660476 lt!660476) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524843 () Bool)

(assert (=> b!1524843 (= e!850016 (Intermediate!13108 true (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524844 () Bool)

(declare-fun e!850018 () Bool)

(declare-fun lt!660477 () SeekEntryResult!13108)

(assert (=> b!1524844 (= e!850018 (bvsge (x!136512 lt!660477) #b01111111111111111111111111111110))))

(declare-fun b!1524845 () Bool)

(assert (=> b!1524845 (= e!850015 (Intermediate!13108 false (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524846 () Bool)

(assert (=> b!1524846 (and (bvsge (index!54829 lt!660477) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660477) (size!49493 a!2804)))))

(declare-fun res!1043248 () Bool)

(assert (=> b!1524846 (= res!1043248 (= (select (arr!48943 a!2804) (index!54829 lt!660477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850017 () Bool)

(assert (=> b!1524846 (=> res!1043248 e!850017)))

(declare-fun b!1524847 () Bool)

(assert (=> b!1524847 (and (bvsge (index!54829 lt!660477) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660477) (size!49493 a!2804)))))

(declare-fun res!1043249 () Bool)

(assert (=> b!1524847 (= res!1043249 (= (select (arr!48943 a!2804) (index!54829 lt!660477)) (select (arr!48943 a!2804) j!70)))))

(assert (=> b!1524847 (=> res!1043249 e!850017)))

(declare-fun e!850019 () Bool)

(assert (=> b!1524847 (= e!850019 e!850017)))

(declare-fun d!159417 () Bool)

(assert (=> d!159417 e!850018))

(declare-fun c!140349 () Bool)

(assert (=> d!159417 (= c!140349 (and (is-Intermediate!13108 lt!660477) (undefined!13920 lt!660477)))))

(assert (=> d!159417 (= lt!660477 e!850016)))

(declare-fun c!140348 () Bool)

(assert (=> d!159417 (= c!140348 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159417 (= lt!660476 (select (arr!48943 a!2804) (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512)))))

(assert (=> d!159417 (validMask!0 mask!2512)))

(assert (=> d!159417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660477)))

(declare-fun b!1524848 () Bool)

(assert (=> b!1524848 (= e!850018 e!850019)))

(declare-fun res!1043250 () Bool)

(assert (=> b!1524848 (= res!1043250 (and (is-Intermediate!13108 lt!660477) (not (undefined!13920 lt!660477)) (bvslt (x!136512 lt!660477) #b01111111111111111111111111111110) (bvsge (x!136512 lt!660477) #b00000000000000000000000000000000) (bvsge (x!136512 lt!660477) #b00000000000000000000000000000000)))))

(assert (=> b!1524848 (=> (not res!1043250) (not e!850019))))

(declare-fun b!1524849 () Bool)

(assert (=> b!1524849 (and (bvsge (index!54829 lt!660477) #b00000000000000000000000000000000) (bvslt (index!54829 lt!660477) (size!49493 a!2804)))))

(assert (=> b!1524849 (= e!850017 (= (select (arr!48943 a!2804) (index!54829 lt!660477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159417 c!140348) b!1524843))

(assert (= (and d!159417 (not c!140348)) b!1524842))

(assert (= (and b!1524842 c!140347) b!1524845))

(assert (= (and b!1524842 (not c!140347)) b!1524841))

(assert (= (and d!159417 c!140349) b!1524844))

(assert (= (and d!159417 (not c!140349)) b!1524848))

(assert (= (and b!1524848 res!1043250) b!1524847))

(assert (= (and b!1524847 (not res!1043249)) b!1524846))

(assert (= (and b!1524846 (not res!1043248)) b!1524849))

(declare-fun m!1407763 () Bool)

(assert (=> b!1524847 m!1407763))

(assert (=> b!1524841 m!1407569))

(declare-fun m!1407767 () Bool)

(assert (=> b!1524841 m!1407767))

(assert (=> b!1524841 m!1407767))

(assert (=> b!1524841 m!1407567))

(declare-fun m!1407773 () Bool)

(assert (=> b!1524841 m!1407773))

(assert (=> b!1524846 m!1407763))

(assert (=> b!1524849 m!1407763))

(assert (=> d!159417 m!1407569))

(declare-fun m!1407775 () Bool)

(assert (=> d!159417 m!1407775))

(assert (=> d!159417 m!1407601))

(assert (=> b!1524510 d!159417))

(declare-fun d!159425 () Bool)

(declare-fun lt!660482 () (_ BitVec 32))

(declare-fun lt!660481 () (_ BitVec 32))

(assert (=> d!159425 (= lt!660482 (bvmul (bvxor lt!660481 (bvlshr lt!660481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159425 (= lt!660481 ((_ extract 31 0) (bvand (bvxor (select (arr!48943 a!2804) j!70) (bvlshr (select (arr!48943 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159425 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043232 (let ((h!36852 ((_ extract 31 0) (bvand (bvxor (select (arr!48943 a!2804) j!70) (bvlshr (select (arr!48943 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136521 (bvmul (bvxor h!36852 (bvlshr h!36852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136521 (bvlshr x!136521 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043232 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043232 #b00000000000000000000000000000000))))))

(assert (=> d!159425 (= (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (bvand (bvxor lt!660482 (bvlshr lt!660482 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524510 d!159425))

(declare-fun b!1524866 () Bool)

(declare-fun e!850031 () SeekEntryResult!13108)

(declare-fun e!850029 () SeekEntryResult!13108)

(assert (=> b!1524866 (= e!850031 e!850029)))

(declare-fun lt!660495 () (_ BitVec 64))

(declare-fun lt!660497 () SeekEntryResult!13108)

(assert (=> b!1524866 (= lt!660495 (select (arr!48943 a!2804) (index!54829 lt!660497)))))

(declare-fun c!140358 () Bool)

