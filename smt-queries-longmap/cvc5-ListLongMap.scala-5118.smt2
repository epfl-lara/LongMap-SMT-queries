; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69422 () Bool)

(assert start!69422)

(declare-fun b!809545 () Bool)

(declare-fun e!448099 () Bool)

(declare-fun e!448100 () Bool)

(assert (=> b!809545 (= e!448099 e!448100)))

(declare-fun res!553275 () Bool)

(assert (=> b!809545 (=> (not res!553275) (not e!448100))))

(declare-datatypes ((SeekEntryResult!8675 0))(
  ( (MissingZero!8675 (index!37068 (_ BitVec 32))) (Found!8675 (index!37069 (_ BitVec 32))) (Intermediate!8675 (undefined!9487 Bool) (index!37070 (_ BitVec 32)) (x!67875 (_ BitVec 32))) (Undefined!8675) (MissingVacant!8675 (index!37071 (_ BitVec 32))) )
))
(declare-fun lt!362807 () SeekEntryResult!8675)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809545 (= res!553275 (or (= lt!362807 (MissingZero!8675 i!1163)) (= lt!362807 (MissingVacant!8675 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!44020 0))(
  ( (array!44021 (arr!21084 (Array (_ BitVec 32) (_ BitVec 64))) (size!21505 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44020)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8675)

(assert (=> b!809545 (= lt!362807 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809546 () Bool)

(declare-fun res!553274 () Bool)

(assert (=> b!809546 (=> (not res!553274) (not e!448099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809546 (= res!553274 (validKeyInArray!0 k!2044))))

(declare-fun b!809547 () Bool)

(declare-fun res!553278 () Bool)

(assert (=> b!809547 (=> (not res!553278) (not e!448099))))

(declare-fun arrayContainsKey!0 (array!44020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809547 (= res!553278 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809548 () Bool)

(declare-fun res!553280 () Bool)

(assert (=> b!809548 (=> (not res!553280) (not e!448099))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809548 (= res!553280 (and (= (size!21505 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21505 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21505 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809549 () Bool)

(declare-fun res!553281 () Bool)

(assert (=> b!809549 (=> (not res!553281) (not e!448100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44020 (_ BitVec 32)) Bool)

(assert (=> b!809549 (= res!553281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun lt!362808 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun e!448098 () Bool)

(declare-fun b!809550 () Bool)

(declare-fun lt!362804 () SeekEntryResult!8675)

(declare-fun lt!362805 () array!44020)

(declare-fun lt!362806 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8675)

(assert (=> b!809550 (= e!448098 (not (= lt!362804 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362806 vacantAfter!23 lt!362808 lt!362805 mask!3266))))))

(declare-fun res!553273 () Bool)

(assert (=> start!69422 (=> (not res!553273) (not e!448099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69422 (= res!553273 (validMask!0 mask!3266))))

(assert (=> start!69422 e!448099))

(assert (=> start!69422 true))

(declare-fun array_inv!16880 (array!44020) Bool)

(assert (=> start!69422 (array_inv!16880 a!3170)))

(declare-fun b!809551 () Bool)

(declare-fun res!553279 () Bool)

(assert (=> b!809551 (=> (not res!553279) (not e!448100))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809551 (= res!553279 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21505 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21084 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21505 a!3170)) (= (select (arr!21084 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809552 () Bool)

(declare-fun e!448095 () Bool)

(assert (=> b!809552 (= e!448095 e!448098)))

(declare-fun res!553282 () Bool)

(assert (=> b!809552 (=> (not res!553282) (not e!448098))))

(assert (=> b!809552 (= res!553282 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362806 #b00000000000000000000000000000000) (bvslt lt!362806 (size!21505 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809552 (= lt!362806 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809553 () Bool)

(declare-fun res!553276 () Bool)

(assert (=> b!809553 (=> (not res!553276) (not e!448099))))

(assert (=> b!809553 (= res!553276 (validKeyInArray!0 (select (arr!21084 a!3170) j!153)))))

(declare-fun b!809554 () Bool)

(declare-fun e!448097 () Bool)

(assert (=> b!809554 (= e!448100 e!448097)))

(declare-fun res!553272 () Bool)

(assert (=> b!809554 (=> (not res!553272) (not e!448097))))

(assert (=> b!809554 (= res!553272 (= lt!362804 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362808 lt!362805 mask!3266)))))

(assert (=> b!809554 (= lt!362804 (seekEntryOrOpen!0 lt!362808 lt!362805 mask!3266))))

(assert (=> b!809554 (= lt!362808 (select (store (arr!21084 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809554 (= lt!362805 (array!44021 (store (arr!21084 a!3170) i!1163 k!2044) (size!21505 a!3170)))))

(declare-fun b!809555 () Bool)

(declare-fun res!553277 () Bool)

(assert (=> b!809555 (=> (not res!553277) (not e!448100))))

(declare-datatypes ((List!15047 0))(
  ( (Nil!15044) (Cons!15043 (h!16172 (_ BitVec 64)) (t!21362 List!15047)) )
))
(declare-fun arrayNoDuplicates!0 (array!44020 (_ BitVec 32) List!15047) Bool)

(assert (=> b!809555 (= res!553277 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15044))))

(declare-fun b!809556 () Bool)

(assert (=> b!809556 (= e!448097 e!448095)))

(declare-fun res!553283 () Bool)

(assert (=> b!809556 (=> (not res!553283) (not e!448095))))

(declare-fun lt!362810 () SeekEntryResult!8675)

(declare-fun lt!362809 () SeekEntryResult!8675)

(assert (=> b!809556 (= res!553283 (and (= lt!362810 lt!362809) (= lt!362809 (Found!8675 j!153)) (not (= (select (arr!21084 a!3170) index!1236) (select (arr!21084 a!3170) j!153)))))))

(assert (=> b!809556 (= lt!362809 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21084 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809556 (= lt!362810 (seekEntryOrOpen!0 (select (arr!21084 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69422 res!553273) b!809548))

(assert (= (and b!809548 res!553280) b!809553))

(assert (= (and b!809553 res!553276) b!809546))

(assert (= (and b!809546 res!553274) b!809547))

(assert (= (and b!809547 res!553278) b!809545))

(assert (= (and b!809545 res!553275) b!809549))

(assert (= (and b!809549 res!553281) b!809555))

(assert (= (and b!809555 res!553277) b!809551))

(assert (= (and b!809551 res!553279) b!809554))

(assert (= (and b!809554 res!553272) b!809556))

(assert (= (and b!809556 res!553283) b!809552))

(assert (= (and b!809552 res!553282) b!809550))

(declare-fun m!751751 () Bool)

(assert (=> b!809550 m!751751))

(declare-fun m!751753 () Bool)

(assert (=> b!809555 m!751753))

(declare-fun m!751755 () Bool)

(assert (=> b!809551 m!751755))

(declare-fun m!751757 () Bool)

(assert (=> b!809551 m!751757))

(declare-fun m!751759 () Bool)

(assert (=> b!809549 m!751759))

(declare-fun m!751761 () Bool)

(assert (=> b!809546 m!751761))

(declare-fun m!751763 () Bool)

(assert (=> start!69422 m!751763))

(declare-fun m!751765 () Bool)

(assert (=> start!69422 m!751765))

(declare-fun m!751767 () Bool)

(assert (=> b!809553 m!751767))

(assert (=> b!809553 m!751767))

(declare-fun m!751769 () Bool)

(assert (=> b!809553 m!751769))

(declare-fun m!751771 () Bool)

(assert (=> b!809554 m!751771))

(declare-fun m!751773 () Bool)

(assert (=> b!809554 m!751773))

(declare-fun m!751775 () Bool)

(assert (=> b!809554 m!751775))

(declare-fun m!751777 () Bool)

(assert (=> b!809554 m!751777))

(declare-fun m!751779 () Bool)

(assert (=> b!809545 m!751779))

(declare-fun m!751781 () Bool)

(assert (=> b!809556 m!751781))

(assert (=> b!809556 m!751767))

(assert (=> b!809556 m!751767))

(declare-fun m!751783 () Bool)

(assert (=> b!809556 m!751783))

(assert (=> b!809556 m!751767))

(declare-fun m!751785 () Bool)

(assert (=> b!809556 m!751785))

(declare-fun m!751787 () Bool)

(assert (=> b!809547 m!751787))

(declare-fun m!751789 () Bool)

(assert (=> b!809552 m!751789))

(push 1)

(assert (not b!809552))

(assert (not b!809556))

(assert (not b!809549))

(assert (not b!809554))

(assert (not start!69422))

(assert (not b!809547))

(assert (not b!809550))

(assert (not b!809555))

(assert (not b!809546))

(assert (not b!809545))

(assert (not b!809553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103919 () Bool)

(declare-fun res!553375 () Bool)

(declare-fun e!448171 () Bool)

(assert (=> d!103919 (=> res!553375 e!448171)))

(assert (=> d!103919 (= res!553375 (= (select (arr!21084 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103919 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448171)))

(declare-fun b!809678 () Bool)

(declare-fun e!448172 () Bool)

(assert (=> b!809678 (= e!448171 e!448172)))

(declare-fun res!553376 () Bool)

(assert (=> b!809678 (=> (not res!553376) (not e!448172))))

(assert (=> b!809678 (= res!553376 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21505 a!3170)))))

(declare-fun b!809679 () Bool)

(assert (=> b!809679 (= e!448172 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103919 (not res!553375)) b!809678))

(assert (= (and b!809678 res!553376) b!809679))

(declare-fun m!751897 () Bool)

(assert (=> d!103919 m!751897))

(declare-fun m!751899 () Bool)

(assert (=> b!809679 m!751899))

(assert (=> b!809547 d!103919))

(declare-fun d!103923 () Bool)

(assert (=> d!103923 (= (validKeyInArray!0 (select (arr!21084 a!3170) j!153)) (and (not (= (select (arr!21084 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21084 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809553 d!103923))

(declare-fun b!809698 () Bool)

(declare-fun e!448183 () SeekEntryResult!8675)

(assert (=> b!809698 (= e!448183 (Found!8675 index!1236))))

(declare-fun b!809699 () Bool)

(declare-fun e!448184 () SeekEntryResult!8675)

(assert (=> b!809699 (= e!448184 (MissingVacant!8675 vacantAfter!23))))

(declare-fun b!809700 () Bool)

(declare-fun e!448182 () SeekEntryResult!8675)

(assert (=> b!809700 (= e!448182 Undefined!8675)))

(declare-fun b!809701 () Bool)

(assert (=> b!809701 (= e!448184 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362808 lt!362805 mask!3266))))

(declare-fun b!809703 () Bool)

(declare-fun c!88572 () Bool)

(declare-fun lt!362878 () (_ BitVec 64))

(assert (=> b!809703 (= c!88572 (= lt!362878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809703 (= e!448183 e!448184)))

(declare-fun lt!362877 () SeekEntryResult!8675)

(declare-fun d!103925 () Bool)

(assert (=> d!103925 (and (or (is-Undefined!8675 lt!362877) (not (is-Found!8675 lt!362877)) (and (bvsge (index!37069 lt!362877) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362877) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362877) (is-Found!8675 lt!362877) (not (is-MissingVacant!8675 lt!362877)) (not (= (index!37071 lt!362877) vacantAfter!23)) (and (bvsge (index!37071 lt!362877) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362877) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362877) (ite (is-Found!8675 lt!362877) (= (select (arr!21084 lt!362805) (index!37069 lt!362877)) lt!362808) (and (is-MissingVacant!8675 lt!362877) (= (index!37071 lt!362877) vacantAfter!23) (= (select (arr!21084 lt!362805) (index!37071 lt!362877)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103925 (= lt!362877 e!448182)))

(declare-fun c!88573 () Bool)

(assert (=> d!103925 (= c!88573 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103925 (= lt!362878 (select (arr!21084 lt!362805) index!1236))))

(assert (=> d!103925 (validMask!0 mask!3266)))

(assert (=> d!103925 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362808 lt!362805 mask!3266) lt!362877)))

(declare-fun b!809702 () Bool)

(assert (=> b!809702 (= e!448182 e!448183)))

(declare-fun c!88571 () Bool)

(assert (=> b!809702 (= c!88571 (= lt!362878 lt!362808))))

(assert (= (and d!103925 c!88573) b!809700))

(assert (= (and d!103925 (not c!88573)) b!809702))

(assert (= (and b!809702 c!88571) b!809698))

(assert (= (and b!809702 (not c!88571)) b!809703))

(assert (= (and b!809703 c!88572) b!809699))

(assert (= (and b!809703 (not c!88572)) b!809701))

(assert (=> b!809701 m!751789))

(assert (=> b!809701 m!751789))

(declare-fun m!751909 () Bool)

(assert (=> b!809701 m!751909))

(declare-fun m!751911 () Bool)

(assert (=> d!103925 m!751911))

(declare-fun m!751913 () Bool)

(assert (=> d!103925 m!751913))

(declare-fun m!751915 () Bool)

(assert (=> d!103925 m!751915))

(assert (=> d!103925 m!751763))

(assert (=> b!809554 d!103925))

(declare-fun b!809764 () Bool)

(declare-fun e!448222 () SeekEntryResult!8675)

(declare-fun lt!362909 () SeekEntryResult!8675)

(assert (=> b!809764 (= e!448222 (MissingZero!8675 (index!37070 lt!362909)))))

(declare-fun b!809765 () Bool)

(declare-fun e!448223 () SeekEntryResult!8675)

(assert (=> b!809765 (= e!448223 (Found!8675 (index!37070 lt!362909)))))

(declare-fun d!103935 () Bool)

(declare-fun lt!362910 () SeekEntryResult!8675)

(assert (=> d!103935 (and (or (is-Undefined!8675 lt!362910) (not (is-Found!8675 lt!362910)) (and (bvsge (index!37069 lt!362910) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362910) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362910) (is-Found!8675 lt!362910) (not (is-MissingZero!8675 lt!362910)) (and (bvsge (index!37068 lt!362910) #b00000000000000000000000000000000) (bvslt (index!37068 lt!362910) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362910) (is-Found!8675 lt!362910) (is-MissingZero!8675 lt!362910) (not (is-MissingVacant!8675 lt!362910)) (and (bvsge (index!37071 lt!362910) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362910) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362910) (ite (is-Found!8675 lt!362910) (= (select (arr!21084 lt!362805) (index!37069 lt!362910)) lt!362808) (ite (is-MissingZero!8675 lt!362910) (= (select (arr!21084 lt!362805) (index!37068 lt!362910)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8675 lt!362910) (= (select (arr!21084 lt!362805) (index!37071 lt!362910)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448221 () SeekEntryResult!8675)

(assert (=> d!103935 (= lt!362910 e!448221)))

(declare-fun c!88599 () Bool)

(assert (=> d!103935 (= c!88599 (and (is-Intermediate!8675 lt!362909) (undefined!9487 lt!362909)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103935 (= lt!362909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362808 mask!3266) lt!362808 lt!362805 mask!3266))))

(assert (=> d!103935 (validMask!0 mask!3266)))

(assert (=> d!103935 (= (seekEntryOrOpen!0 lt!362808 lt!362805 mask!3266) lt!362910)))

(declare-fun b!809766 () Bool)

(assert (=> b!809766 (= e!448221 Undefined!8675)))

(declare-fun b!809767 () Bool)

(declare-fun c!88600 () Bool)

(declare-fun lt!362908 () (_ BitVec 64))

(assert (=> b!809767 (= c!88600 (= lt!362908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809767 (= e!448223 e!448222)))

(declare-fun b!809768 () Bool)

(assert (=> b!809768 (= e!448221 e!448223)))

(assert (=> b!809768 (= lt!362908 (select (arr!21084 lt!362805) (index!37070 lt!362909)))))

(declare-fun c!88598 () Bool)

(assert (=> b!809768 (= c!88598 (= lt!362908 lt!362808))))

(declare-fun b!809769 () Bool)

(assert (=> b!809769 (= e!448222 (seekKeyOrZeroReturnVacant!0 (x!67875 lt!362909) (index!37070 lt!362909) (index!37070 lt!362909) lt!362808 lt!362805 mask!3266))))

(assert (= (and d!103935 c!88599) b!809766))

(assert (= (and d!103935 (not c!88599)) b!809768))

(assert (= (and b!809768 c!88598) b!809765))

(assert (= (and b!809768 (not c!88598)) b!809767))

(assert (= (and b!809767 c!88600) b!809764))

(assert (= (and b!809767 (not c!88600)) b!809769))

(declare-fun m!751967 () Bool)

(assert (=> d!103935 m!751967))

(declare-fun m!751969 () Bool)

(assert (=> d!103935 m!751969))

(declare-fun m!751971 () Bool)

(assert (=> d!103935 m!751971))

(assert (=> d!103935 m!751763))

(declare-fun m!751973 () Bool)

(assert (=> d!103935 m!751973))

(declare-fun m!751975 () Bool)

(assert (=> d!103935 m!751975))

(assert (=> d!103935 m!751969))

(declare-fun m!751977 () Bool)

(assert (=> b!809768 m!751977))

(declare-fun m!751979 () Bool)

(assert (=> b!809769 m!751979))

(assert (=> b!809554 d!103935))

(declare-fun d!103953 () Bool)

(declare-fun res!553400 () Bool)

(declare-fun e!448249 () Bool)

(assert (=> d!103953 (=> res!553400 e!448249)))

(assert (=> d!103953 (= res!553400 (bvsge #b00000000000000000000000000000000 (size!21505 a!3170)))))

(assert (=> d!103953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448249)))

(declare-fun b!809808 () Bool)

(declare-fun e!448248 () Bool)

(declare-fun call!35430 () Bool)

(assert (=> b!809808 (= e!448248 call!35430)))

(declare-fun b!809809 () Bool)

(declare-fun e!448250 () Bool)

(assert (=> b!809809 (= e!448249 e!448250)))

(declare-fun c!88615 () Bool)

(assert (=> b!809809 (= c!88615 (validKeyInArray!0 (select (arr!21084 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35427 () Bool)

(assert (=> bm!35427 (= call!35430 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!809810 () Bool)

(assert (=> b!809810 (= e!448250 e!448248)))

(declare-fun lt!362927 () (_ BitVec 64))

(assert (=> b!809810 (= lt!362927 (select (arr!21084 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27626 0))(
  ( (Unit!27627) )
))
(declare-fun lt!362928 () Unit!27626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44020 (_ BitVec 64) (_ BitVec 32)) Unit!27626)

(assert (=> b!809810 (= lt!362928 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362927 #b00000000000000000000000000000000))))

(assert (=> b!809810 (arrayContainsKey!0 a!3170 lt!362927 #b00000000000000000000000000000000)))

(declare-fun lt!362926 () Unit!27626)

(assert (=> b!809810 (= lt!362926 lt!362928)))

(declare-fun res!553399 () Bool)

(assert (=> b!809810 (= res!553399 (= (seekEntryOrOpen!0 (select (arr!21084 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8675 #b00000000000000000000000000000000)))))

(assert (=> b!809810 (=> (not res!553399) (not e!448248))))

(declare-fun b!809811 () Bool)

(assert (=> b!809811 (= e!448250 call!35430)))

(assert (= (and d!103953 (not res!553400)) b!809809))

(assert (= (and b!809809 c!88615) b!809810))

(assert (= (and b!809809 (not c!88615)) b!809811))

(assert (= (and b!809810 res!553399) b!809808))

(assert (= (or b!809808 b!809811) bm!35427))

(assert (=> b!809809 m!751897))

(assert (=> b!809809 m!751897))

(declare-fun m!752005 () Bool)

(assert (=> b!809809 m!752005))

(declare-fun m!752007 () Bool)

(assert (=> bm!35427 m!752007))

(assert (=> b!809810 m!751897))

(declare-fun m!752009 () Bool)

(assert (=> b!809810 m!752009))

(declare-fun m!752011 () Bool)

(assert (=> b!809810 m!752011))

(assert (=> b!809810 m!751897))

(declare-fun m!752013 () Bool)

(assert (=> b!809810 m!752013))

(assert (=> b!809549 d!103953))

(declare-fun b!809812 () Bool)

(declare-fun e!448252 () SeekEntryResult!8675)

(assert (=> b!809812 (= e!448252 (Found!8675 lt!362806))))

(declare-fun b!809813 () Bool)

(declare-fun e!448253 () SeekEntryResult!8675)

(assert (=> b!809813 (= e!448253 (MissingVacant!8675 vacantAfter!23))))

(declare-fun b!809814 () Bool)

(declare-fun e!448251 () SeekEntryResult!8675)

(assert (=> b!809814 (= e!448251 Undefined!8675)))

(declare-fun b!809815 () Bool)

(assert (=> b!809815 (= e!448253 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362806 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362808 lt!362805 mask!3266))))

(declare-fun b!809817 () Bool)

(declare-fun c!88617 () Bool)

(declare-fun lt!362930 () (_ BitVec 64))

(assert (=> b!809817 (= c!88617 (= lt!362930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809817 (= e!448252 e!448253)))

(declare-fun lt!362929 () SeekEntryResult!8675)

(declare-fun d!103961 () Bool)

(assert (=> d!103961 (and (or (is-Undefined!8675 lt!362929) (not (is-Found!8675 lt!362929)) (and (bvsge (index!37069 lt!362929) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362929) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362929) (is-Found!8675 lt!362929) (not (is-MissingVacant!8675 lt!362929)) (not (= (index!37071 lt!362929) vacantAfter!23)) (and (bvsge (index!37071 lt!362929) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362929) (size!21505 lt!362805)))) (or (is-Undefined!8675 lt!362929) (ite (is-Found!8675 lt!362929) (= (select (arr!21084 lt!362805) (index!37069 lt!362929)) lt!362808) (and (is-MissingVacant!8675 lt!362929) (= (index!37071 lt!362929) vacantAfter!23) (= (select (arr!21084 lt!362805) (index!37071 lt!362929)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103961 (= lt!362929 e!448251)))

(declare-fun c!88618 () Bool)

(assert (=> d!103961 (= c!88618 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!103961 (= lt!362930 (select (arr!21084 lt!362805) lt!362806))))

(assert (=> d!103961 (validMask!0 mask!3266)))

(assert (=> d!103961 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362806 vacantAfter!23 lt!362808 lt!362805 mask!3266) lt!362929)))

(declare-fun b!809816 () Bool)

(assert (=> b!809816 (= e!448251 e!448252)))

(declare-fun c!88616 () Bool)

(assert (=> b!809816 (= c!88616 (= lt!362930 lt!362808))))

(assert (= (and d!103961 c!88618) b!809814))

(assert (= (and d!103961 (not c!88618)) b!809816))

(assert (= (and b!809816 c!88616) b!809812))

(assert (= (and b!809816 (not c!88616)) b!809817))

(assert (= (and b!809817 c!88617) b!809813))

(assert (= (and b!809817 (not c!88617)) b!809815))

(declare-fun m!752015 () Bool)

(assert (=> b!809815 m!752015))

(assert (=> b!809815 m!752015))

(declare-fun m!752017 () Bool)

(assert (=> b!809815 m!752017))

(declare-fun m!752019 () Bool)

(assert (=> d!103961 m!752019))

(declare-fun m!752021 () Bool)

(assert (=> d!103961 m!752021))

(declare-fun m!752023 () Bool)

(assert (=> d!103961 m!752023))

(assert (=> d!103961 m!751763))

(assert (=> b!809550 d!103961))

(declare-fun d!103963 () Bool)

(declare-fun res!553408 () Bool)

(declare-fun e!448264 () Bool)

(assert (=> d!103963 (=> res!553408 e!448264)))

(assert (=> d!103963 (= res!553408 (bvsge #b00000000000000000000000000000000 (size!21505 a!3170)))))

(assert (=> d!103963 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15044) e!448264)))

(declare-fun bm!35430 () Bool)

(declare-fun call!35433 () Bool)

(declare-fun c!88621 () Bool)

(assert (=> bm!35430 (= call!35433 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88621 (Cons!15043 (select (arr!21084 a!3170) #b00000000000000000000000000000000) Nil!15044) Nil!15044)))))

(declare-fun b!809828 () Bool)

(declare-fun e!448263 () Bool)

(assert (=> b!809828 (= e!448263 call!35433)))

(declare-fun b!809829 () Bool)

(declare-fun e!448265 () Bool)

(assert (=> b!809829 (= e!448264 e!448265)))

(declare-fun res!553407 () Bool)

(assert (=> b!809829 (=> (not res!553407) (not e!448265))))

(declare-fun e!448262 () Bool)

(assert (=> b!809829 (= res!553407 (not e!448262))))

(declare-fun res!553409 () Bool)

(assert (=> b!809829 (=> (not res!553409) (not e!448262))))

(assert (=> b!809829 (= res!553409 (validKeyInArray!0 (select (arr!21084 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809830 () Bool)

(assert (=> b!809830 (= e!448263 call!35433)))

(declare-fun b!809831 () Bool)

(declare-fun contains!4132 (List!15047 (_ BitVec 64)) Bool)

(assert (=> b!809831 (= e!448262 (contains!4132 Nil!15044 (select (arr!21084 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809832 () Bool)

(assert (=> b!809832 (= e!448265 e!448263)))

(assert (=> b!809832 (= c!88621 (validKeyInArray!0 (select (arr!21084 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103963 (not res!553408)) b!809829))

(assert (= (and b!809829 res!553409) b!809831))

(assert (= (and b!809829 res!553407) b!809832))

(assert (= (and b!809832 c!88621) b!809828))

(assert (= (and b!809832 (not c!88621)) b!809830))

(assert (= (or b!809828 b!809830) bm!35430))

(assert (=> bm!35430 m!751897))

(declare-fun m!752025 () Bool)

(assert (=> bm!35430 m!752025))

(assert (=> b!809829 m!751897))

(assert (=> b!809829 m!751897))

(assert (=> b!809829 m!752005))

(assert (=> b!809831 m!751897))

(assert (=> b!809831 m!751897))

(declare-fun m!752027 () Bool)

(assert (=> b!809831 m!752027))

(assert (=> b!809832 m!751897))

(assert (=> b!809832 m!751897))

(assert (=> b!809832 m!752005))

(assert (=> b!809555 d!103963))

(declare-fun b!809833 () Bool)

(declare-fun e!448267 () SeekEntryResult!8675)

(assert (=> b!809833 (= e!448267 (Found!8675 index!1236))))

(declare-fun b!809834 () Bool)

(declare-fun e!448268 () SeekEntryResult!8675)

(assert (=> b!809834 (= e!448268 (MissingVacant!8675 vacantBefore!23))))

(declare-fun b!809835 () Bool)

(declare-fun e!448266 () SeekEntryResult!8675)

(assert (=> b!809835 (= e!448266 Undefined!8675)))

(declare-fun b!809836 () Bool)

(assert (=> b!809836 (= e!448268 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21084 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809838 () Bool)

(declare-fun c!88623 () Bool)

(declare-fun lt!362932 () (_ BitVec 64))

(assert (=> b!809838 (= c!88623 (= lt!362932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809838 (= e!448267 e!448268)))

(declare-fun lt!362931 () SeekEntryResult!8675)

(declare-fun d!103965 () Bool)

(assert (=> d!103965 (and (or (is-Undefined!8675 lt!362931) (not (is-Found!8675 lt!362931)) (and (bvsge (index!37069 lt!362931) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362931) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362931) (is-Found!8675 lt!362931) (not (is-MissingVacant!8675 lt!362931)) (not (= (index!37071 lt!362931) vacantBefore!23)) (and (bvsge (index!37071 lt!362931) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362931) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362931) (ite (is-Found!8675 lt!362931) (= (select (arr!21084 a!3170) (index!37069 lt!362931)) (select (arr!21084 a!3170) j!153)) (and (is-MissingVacant!8675 lt!362931) (= (index!37071 lt!362931) vacantBefore!23) (= (select (arr!21084 a!3170) (index!37071 lt!362931)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103965 (= lt!362931 e!448266)))

(declare-fun c!88624 () Bool)

(assert (=> d!103965 (= c!88624 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103965 (= lt!362932 (select (arr!21084 a!3170) index!1236))))

(assert (=> d!103965 (validMask!0 mask!3266)))

(assert (=> d!103965 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21084 a!3170) j!153) a!3170 mask!3266) lt!362931)))

(declare-fun b!809837 () Bool)

(assert (=> b!809837 (= e!448266 e!448267)))

(declare-fun c!88622 () Bool)

(assert (=> b!809837 (= c!88622 (= lt!362932 (select (arr!21084 a!3170) j!153)))))

(assert (= (and d!103965 c!88624) b!809835))

(assert (= (and d!103965 (not c!88624)) b!809837))

(assert (= (and b!809837 c!88622) b!809833))

(assert (= (and b!809837 (not c!88622)) b!809838))

(assert (= (and b!809838 c!88623) b!809834))

(assert (= (and b!809838 (not c!88623)) b!809836))

(assert (=> b!809836 m!751789))

(assert (=> b!809836 m!751789))

(assert (=> b!809836 m!751767))

(declare-fun m!752029 () Bool)

(assert (=> b!809836 m!752029))

(declare-fun m!752031 () Bool)

(assert (=> d!103965 m!752031))

(declare-fun m!752033 () Bool)

(assert (=> d!103965 m!752033))

(assert (=> d!103965 m!751781))

(assert (=> d!103965 m!751763))

(assert (=> b!809556 d!103965))

(declare-fun b!809839 () Bool)

(declare-fun e!448270 () SeekEntryResult!8675)

(declare-fun lt!362934 () SeekEntryResult!8675)

(assert (=> b!809839 (= e!448270 (MissingZero!8675 (index!37070 lt!362934)))))

(declare-fun b!809840 () Bool)

(declare-fun e!448271 () SeekEntryResult!8675)

(assert (=> b!809840 (= e!448271 (Found!8675 (index!37070 lt!362934)))))

(declare-fun d!103967 () Bool)

(declare-fun lt!362935 () SeekEntryResult!8675)

(assert (=> d!103967 (and (or (is-Undefined!8675 lt!362935) (not (is-Found!8675 lt!362935)) (and (bvsge (index!37069 lt!362935) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362935) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362935) (is-Found!8675 lt!362935) (not (is-MissingZero!8675 lt!362935)) (and (bvsge (index!37068 lt!362935) #b00000000000000000000000000000000) (bvslt (index!37068 lt!362935) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362935) (is-Found!8675 lt!362935) (is-MissingZero!8675 lt!362935) (not (is-MissingVacant!8675 lt!362935)) (and (bvsge (index!37071 lt!362935) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362935) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362935) (ite (is-Found!8675 lt!362935) (= (select (arr!21084 a!3170) (index!37069 lt!362935)) (select (arr!21084 a!3170) j!153)) (ite (is-MissingZero!8675 lt!362935) (= (select (arr!21084 a!3170) (index!37068 lt!362935)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8675 lt!362935) (= (select (arr!21084 a!3170) (index!37071 lt!362935)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448269 () SeekEntryResult!8675)

(assert (=> d!103967 (= lt!362935 e!448269)))

(declare-fun c!88626 () Bool)

(assert (=> d!103967 (= c!88626 (and (is-Intermediate!8675 lt!362934) (undefined!9487 lt!362934)))))

(assert (=> d!103967 (= lt!362934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21084 a!3170) j!153) mask!3266) (select (arr!21084 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103967 (validMask!0 mask!3266)))

(assert (=> d!103967 (= (seekEntryOrOpen!0 (select (arr!21084 a!3170) j!153) a!3170 mask!3266) lt!362935)))

(declare-fun b!809841 () Bool)

(assert (=> b!809841 (= e!448269 Undefined!8675)))

(declare-fun b!809842 () Bool)

(declare-fun c!88627 () Bool)

(declare-fun lt!362933 () (_ BitVec 64))

(assert (=> b!809842 (= c!88627 (= lt!362933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809842 (= e!448271 e!448270)))

(declare-fun b!809843 () Bool)

(assert (=> b!809843 (= e!448269 e!448271)))

(assert (=> b!809843 (= lt!362933 (select (arr!21084 a!3170) (index!37070 lt!362934)))))

(declare-fun c!88625 () Bool)

(assert (=> b!809843 (= c!88625 (= lt!362933 (select (arr!21084 a!3170) j!153)))))

(declare-fun b!809844 () Bool)

(assert (=> b!809844 (= e!448270 (seekKeyOrZeroReturnVacant!0 (x!67875 lt!362934) (index!37070 lt!362934) (index!37070 lt!362934) (select (arr!21084 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103967 c!88626) b!809841))

(assert (= (and d!103967 (not c!88626)) b!809843))

(assert (= (and b!809843 c!88625) b!809840))

(assert (= (and b!809843 (not c!88625)) b!809842))

(assert (= (and b!809842 c!88627) b!809839))

(assert (= (and b!809842 (not c!88627)) b!809844))

(declare-fun m!752035 () Bool)

(assert (=> d!103967 m!752035))

(declare-fun m!752037 () Bool)

(assert (=> d!103967 m!752037))

(assert (=> d!103967 m!751767))

(declare-fun m!752039 () Bool)

(assert (=> d!103967 m!752039))

(assert (=> d!103967 m!751763))

(declare-fun m!752041 () Bool)

(assert (=> d!103967 m!752041))

(declare-fun m!752043 () Bool)

(assert (=> d!103967 m!752043))

(assert (=> d!103967 m!751767))

(assert (=> d!103967 m!752037))

(declare-fun m!752045 () Bool)

(assert (=> b!809843 m!752045))

(assert (=> b!809844 m!751767))

(declare-fun m!752047 () Bool)

(assert (=> b!809844 m!752047))

(assert (=> b!809556 d!103967))

(declare-fun b!809845 () Bool)

(declare-fun e!448273 () SeekEntryResult!8675)

(declare-fun lt!362937 () SeekEntryResult!8675)

(assert (=> b!809845 (= e!448273 (MissingZero!8675 (index!37070 lt!362937)))))

(declare-fun b!809846 () Bool)

(declare-fun e!448274 () SeekEntryResult!8675)

(assert (=> b!809846 (= e!448274 (Found!8675 (index!37070 lt!362937)))))

(declare-fun d!103969 () Bool)

(declare-fun lt!362938 () SeekEntryResult!8675)

(assert (=> d!103969 (and (or (is-Undefined!8675 lt!362938) (not (is-Found!8675 lt!362938)) (and (bvsge (index!37069 lt!362938) #b00000000000000000000000000000000) (bvslt (index!37069 lt!362938) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362938) (is-Found!8675 lt!362938) (not (is-MissingZero!8675 lt!362938)) (and (bvsge (index!37068 lt!362938) #b00000000000000000000000000000000) (bvslt (index!37068 lt!362938) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362938) (is-Found!8675 lt!362938) (is-MissingZero!8675 lt!362938) (not (is-MissingVacant!8675 lt!362938)) (and (bvsge (index!37071 lt!362938) #b00000000000000000000000000000000) (bvslt (index!37071 lt!362938) (size!21505 a!3170)))) (or (is-Undefined!8675 lt!362938) (ite (is-Found!8675 lt!362938) (= (select (arr!21084 a!3170) (index!37069 lt!362938)) k!2044) (ite (is-MissingZero!8675 lt!362938) (= (select (arr!21084 a!3170) (index!37068 lt!362938)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8675 lt!362938) (= (select (arr!21084 a!3170) (index!37071 lt!362938)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448272 () SeekEntryResult!8675)

(assert (=> d!103969 (= lt!362938 e!448272)))

(declare-fun c!88629 () Bool)

(assert (=> d!103969 (= c!88629 (and (is-Intermediate!8675 lt!362937) (undefined!9487 lt!362937)))))

(assert (=> d!103969 (= lt!362937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103969 (validMask!0 mask!3266)))

(assert (=> d!103969 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362938)))

(declare-fun b!809847 () Bool)

(assert (=> b!809847 (= e!448272 Undefined!8675)))

(declare-fun b!809848 () Bool)

(declare-fun c!88630 () Bool)

(declare-fun lt!362936 () (_ BitVec 64))

(assert (=> b!809848 (= c!88630 (= lt!362936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809848 (= e!448274 e!448273)))

(declare-fun b!809849 () Bool)

(assert (=> b!809849 (= e!448272 e!448274)))

(assert (=> b!809849 (= lt!362936 (select (arr!21084 a!3170) (index!37070 lt!362937)))))

(declare-fun c!88628 () Bool)

(assert (=> b!809849 (= c!88628 (= lt!362936 k!2044))))

(declare-fun b!809850 () Bool)

(assert (=> b!809850 (= e!448273 (seekKeyOrZeroReturnVacant!0 (x!67875 lt!362937) (index!37070 lt!362937) (index!37070 lt!362937) k!2044 a!3170 mask!3266))))

(assert (= (and d!103969 c!88629) b!809847))

(assert (= (and d!103969 (not c!88629)) b!809849))

(assert (= (and b!809849 c!88628) b!809846))

(assert (= (and b!809849 (not c!88628)) b!809848))

(assert (= (and b!809848 c!88630) b!809845))

(assert (= (and b!809848 (not c!88630)) b!809850))

(declare-fun m!752049 () Bool)

(assert (=> d!103969 m!752049))

(declare-fun m!752051 () Bool)

(assert (=> d!103969 m!752051))

(declare-fun m!752053 () Bool)

(assert (=> d!103969 m!752053))

(assert (=> d!103969 m!751763))

(declare-fun m!752055 () Bool)

(assert (=> d!103969 m!752055))

(declare-fun m!752057 () Bool)

(assert (=> d!103969 m!752057))

(assert (=> d!103969 m!752051))

(declare-fun m!752059 () Bool)

(assert (=> b!809849 m!752059))

(declare-fun m!752061 () Bool)

(assert (=> b!809850 m!752061))

(assert (=> b!809545 d!103969))

(declare-fun d!103971 () Bool)

(assert (=> d!103971 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809546 d!103971))

(declare-fun d!103973 () Bool)

(declare-fun lt!362941 () (_ BitVec 32))

(assert (=> d!103973 (and (bvsge lt!362941 #b00000000000000000000000000000000) (bvslt lt!362941 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103973 (= lt!362941 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103973 (validMask!0 mask!3266)))

(assert (=> d!103973 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362941)))

(declare-fun bs!22424 () Bool)

(assert (= bs!22424 d!103973))

(declare-fun m!752063 () Bool)

(assert (=> bs!22424 m!752063))

(assert (=> bs!22424 m!751763))

(assert (=> b!809552 d!103973))

(declare-fun d!103975 () Bool)

(assert (=> d!103975 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69422 d!103975))

(declare-fun d!103983 () Bool)

(assert (=> d!103983 (= (array_inv!16880 a!3170) (bvsge (size!21505 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69422 d!103983))

(push 1)

(assert (not d!103935))

(assert (not d!103965))

(assert (not bm!35430))

(assert (not b!809809))

(assert (not b!809832))

(assert (not b!809701))

(assert (not b!809679))

(assert (not b!809831))

(assert (not d!103961))

(assert (not b!809829))

(assert (not b!809810))

(assert (not b!809769))

(assert (not d!103925))

(assert (not b!809836))

(assert (not b!809850))

(assert (not d!103967))

(assert (not d!103973))

(assert (not b!809844))

(assert (not bm!35427))

(assert (not d!103969))

(assert (not b!809815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

