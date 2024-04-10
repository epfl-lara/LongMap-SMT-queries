; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53084 () Bool)

(assert start!53084)

(declare-fun b!577705 () Bool)

(declare-fun res!365671 () Bool)

(declare-fun e!332262 () Bool)

(assert (=> b!577705 (=> (not res!365671) (not e!332262))))

(declare-datatypes ((array!36069 0))(
  ( (array!36070 (arr!17312 (Array (_ BitVec 32) (_ BitVec 64))) (size!17676 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36069)

(assert (=> b!577705 (= res!365671 (and (bvsle #b00000000000000000000000000000000 (size!17676 a!2986)) (bvslt (size!17676 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577706 () Bool)

(declare-fun res!365665 () Bool)

(declare-fun e!332261 () Bool)

(assert (=> b!577706 (=> (not res!365665) (not e!332261))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577706 (= res!365665 (validKeyInArray!0 k!1786))))

(declare-fun b!577707 () Bool)

(declare-fun res!365667 () Bool)

(assert (=> b!577707 (=> (not res!365667) (not e!332261))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577707 (= res!365667 (and (= (size!17676 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17676 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17676 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577708 () Bool)

(declare-fun res!365669 () Bool)

(assert (=> b!577708 (=> (not res!365669) (not e!332261))))

(declare-fun arrayContainsKey!0 (array!36069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577708 (= res!365669 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577709 () Bool)

(assert (=> b!577709 (= e!332261 e!332262)))

(declare-fun res!365666 () Bool)

(assert (=> b!577709 (=> (not res!365666) (not e!332262))))

(declare-datatypes ((SeekEntryResult!5752 0))(
  ( (MissingZero!5752 (index!25235 (_ BitVec 32))) (Found!5752 (index!25236 (_ BitVec 32))) (Intermediate!5752 (undefined!6564 Bool) (index!25237 (_ BitVec 32)) (x!54141 (_ BitVec 32))) (Undefined!5752) (MissingVacant!5752 (index!25238 (_ BitVec 32))) )
))
(declare-fun lt!264040 () SeekEntryResult!5752)

(assert (=> b!577709 (= res!365666 (or (= lt!264040 (MissingZero!5752 i!1108)) (= lt!264040 (MissingVacant!5752 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36069 (_ BitVec 32)) SeekEntryResult!5752)

(assert (=> b!577709 (= lt!264040 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577710 () Bool)

(declare-fun res!365670 () Bool)

(assert (=> b!577710 (=> (not res!365670) (not e!332262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36069 (_ BitVec 32)) Bool)

(assert (=> b!577710 (= res!365670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577711 () Bool)

(declare-fun res!365672 () Bool)

(assert (=> b!577711 (=> (not res!365672) (not e!332261))))

(assert (=> b!577711 (= res!365672 (validKeyInArray!0 (select (arr!17312 a!2986) j!136)))))

(declare-fun res!365668 () Bool)

(assert (=> start!53084 (=> (not res!365668) (not e!332261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53084 (= res!365668 (validMask!0 mask!3053))))

(assert (=> start!53084 e!332261))

(assert (=> start!53084 true))

(declare-fun array_inv!13108 (array!36069) Bool)

(assert (=> start!53084 (array_inv!13108 a!2986)))

(declare-fun b!577712 () Bool)

(declare-datatypes ((List!11353 0))(
  ( (Nil!11350) (Cons!11349 (h!12394 (_ BitVec 64)) (t!17581 List!11353)) )
))
(declare-fun noDuplicate!227 (List!11353) Bool)

(assert (=> b!577712 (= e!332262 (not (noDuplicate!227 Nil!11350)))))

(assert (= (and start!53084 res!365668) b!577707))

(assert (= (and b!577707 res!365667) b!577711))

(assert (= (and b!577711 res!365672) b!577706))

(assert (= (and b!577706 res!365665) b!577708))

(assert (= (and b!577708 res!365669) b!577709))

(assert (= (and b!577709 res!365666) b!577710))

(assert (= (and b!577710 res!365670) b!577705))

(assert (= (and b!577705 res!365671) b!577712))

(declare-fun m!556513 () Bool)

(assert (=> b!577711 m!556513))

(assert (=> b!577711 m!556513))

(declare-fun m!556515 () Bool)

(assert (=> b!577711 m!556515))

(declare-fun m!556517 () Bool)

(assert (=> b!577708 m!556517))

(declare-fun m!556519 () Bool)

(assert (=> b!577706 m!556519))

(declare-fun m!556521 () Bool)

(assert (=> start!53084 m!556521))

(declare-fun m!556523 () Bool)

(assert (=> start!53084 m!556523))

(declare-fun m!556525 () Bool)

(assert (=> b!577712 m!556525))

(declare-fun m!556527 () Bool)

(assert (=> b!577710 m!556527))

(declare-fun m!556529 () Bool)

(assert (=> b!577709 m!556529))

(push 1)

(assert (not b!577712))

(assert (not b!577711))

(assert (not start!53084))

(assert (not b!577706))

(assert (not b!577710))

(assert (not b!577709))

(assert (not b!577708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!577767 () Bool)

(declare-fun e!332307 () SeekEntryResult!5752)

(declare-fun lt!264066 () SeekEntryResult!5752)

(assert (=> b!577767 (= e!332307 (Found!5752 (index!25237 lt!264066)))))

(declare-fun d!85591 () Bool)

(declare-fun lt!264065 () SeekEntryResult!5752)

(assert (=> d!85591 (and (or (is-Undefined!5752 lt!264065) (not (is-Found!5752 lt!264065)) (and (bvsge (index!25236 lt!264065) #b00000000000000000000000000000000) (bvslt (index!25236 lt!264065) (size!17676 a!2986)))) (or (is-Undefined!5752 lt!264065) (is-Found!5752 lt!264065) (not (is-MissingZero!5752 lt!264065)) (and (bvsge (index!25235 lt!264065) #b00000000000000000000000000000000) (bvslt (index!25235 lt!264065) (size!17676 a!2986)))) (or (is-Undefined!5752 lt!264065) (is-Found!5752 lt!264065) (is-MissingZero!5752 lt!264065) (not (is-MissingVacant!5752 lt!264065)) (and (bvsge (index!25238 lt!264065) #b00000000000000000000000000000000) (bvslt (index!25238 lt!264065) (size!17676 a!2986)))) (or (is-Undefined!5752 lt!264065) (ite (is-Found!5752 lt!264065) (= (select (arr!17312 a!2986) (index!25236 lt!264065)) k!1786) (ite (is-MissingZero!5752 lt!264065) (= (select (arr!17312 a!2986) (index!25235 lt!264065)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5752 lt!264065) (= (select (arr!17312 a!2986) (index!25238 lt!264065)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!332305 () SeekEntryResult!5752)

(assert (=> d!85591 (= lt!264065 e!332305)))

(declare-fun c!66400 () Bool)

(assert (=> d!85591 (= c!66400 (and (is-Intermediate!5752 lt!264066) (undefined!6564 lt!264066)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36069 (_ BitVec 32)) SeekEntryResult!5752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85591 (= lt!264066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!85591 (validMask!0 mask!3053)))

(assert (=> d!85591 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!264065)))

(declare-fun b!577768 () Bool)

(assert (=> b!577768 (= e!332305 Undefined!5752)))

(declare-fun b!577769 () Bool)

(assert (=> b!577769 (= e!332305 e!332307)))

(declare-fun lt!264067 () (_ BitVec 64))

(assert (=> b!577769 (= lt!264067 (select (arr!17312 a!2986) (index!25237 lt!264066)))))

(declare-fun c!66401 () Bool)

(assert (=> b!577769 (= c!66401 (= lt!264067 k!1786))))

(declare-fun b!577770 () Bool)

(declare-fun c!66399 () Bool)

(assert (=> b!577770 (= c!66399 (= lt!264067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332306 () SeekEntryResult!5752)

(assert (=> b!577770 (= e!332307 e!332306)))

(declare-fun b!577771 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36069 (_ BitVec 32)) SeekEntryResult!5752)

(assert (=> b!577771 (= e!332306 (seekKeyOrZeroReturnVacant!0 (x!54141 lt!264066) (index!25237 lt!264066) (index!25237 lt!264066) k!1786 a!2986 mask!3053))))

(declare-fun b!577772 () Bool)

(assert (=> b!577772 (= e!332306 (MissingZero!5752 (index!25237 lt!264066)))))

(assert (= (and d!85591 c!66400) b!577768))

(assert (= (and d!85591 (not c!66400)) b!577769))

(assert (= (and b!577769 c!66401) b!577767))

(assert (= (and b!577769 (not c!66401)) b!577770))

(assert (= (and b!577770 c!66399) b!577772))

(assert (= (and b!577770 (not c!66399)) b!577771))

(assert (=> d!85591 m!556521))

(declare-fun m!556565 () Bool)

(assert (=> d!85591 m!556565))

(declare-fun m!556567 () Bool)

(assert (=> d!85591 m!556567))

(declare-fun m!556569 () Bool)

(assert (=> d!85591 m!556569))

(assert (=> d!85591 m!556567))

(declare-fun m!556571 () Bool)

(assert (=> d!85591 m!556571))

(declare-fun m!556573 () Bool)

(assert (=> d!85591 m!556573))

(declare-fun m!556575 () Bool)

(assert (=> b!577769 m!556575))

(declare-fun m!556577 () Bool)

(assert (=> b!577771 m!556577))

(assert (=> b!577709 d!85591))

(declare-fun d!85611 () Bool)

(declare-fun res!365707 () Bool)

(declare-fun e!332312 () Bool)

(assert (=> d!85611 (=> res!365707 e!332312)))

(assert (=> d!85611 (= res!365707 (= (select (arr!17312 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!85611 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!332312)))

(declare-fun b!577777 () Bool)

(declare-fun e!332313 () Bool)

(assert (=> b!577777 (= e!332312 e!332313)))

(declare-fun res!365708 () Bool)

(assert (=> b!577777 (=> (not res!365708) (not e!332313))))

(assert (=> b!577777 (= res!365708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17676 a!2986)))))

(declare-fun b!577778 () Bool)

(assert (=> b!577778 (= e!332313 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85611 (not res!365707)) b!577777))

(assert (= (and b!577777 res!365708) b!577778))

(declare-fun m!556579 () Bool)

(assert (=> d!85611 m!556579))

(declare-fun m!556581 () Bool)

(assert (=> b!577778 m!556581))

(assert (=> b!577708 d!85611))

(declare-fun d!85613 () Bool)

(assert (=> d!85613 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577706 d!85613))

(declare-fun d!85615 () Bool)

(declare-fun res!365713 () Bool)

(declare-fun e!332324 () Bool)

(assert (=> d!85615 (=> res!365713 e!332324)))

(assert (=> d!85615 (= res!365713 (is-Nil!11350 Nil!11350))))

(assert (=> d!85615 (= (noDuplicate!227 Nil!11350) e!332324)))

(declare-fun b!577795 () Bool)

(declare-fun e!332325 () Bool)

(assert (=> b!577795 (= e!332324 e!332325)))

(declare-fun res!365714 () Bool)

(assert (=> b!577795 (=> (not res!365714) (not e!332325))))

(declare-fun contains!2901 (List!11353 (_ BitVec 64)) Bool)

(assert (=> b!577795 (= res!365714 (not (contains!2901 (t!17581 Nil!11350) (h!12394 Nil!11350))))))

(declare-fun b!577796 () Bool)

(assert (=> b!577796 (= e!332325 (noDuplicate!227 (t!17581 Nil!11350)))))

(assert (= (and d!85615 (not res!365713)) b!577795))

(assert (= (and b!577795 res!365714) b!577796))

(declare-fun m!556583 () Bool)

(assert (=> b!577795 m!556583))

(declare-fun m!556585 () Bool)

(assert (=> b!577796 m!556585))

(assert (=> b!577712 d!85615))

(declare-fun b!577823 () Bool)

(declare-fun e!332341 () Bool)

(declare-fun e!332343 () Bool)

(assert (=> b!577823 (= e!332341 e!332343)))

