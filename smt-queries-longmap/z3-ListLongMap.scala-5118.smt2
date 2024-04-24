; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69590 () Bool)

(assert start!69590)

(declare-fun b!810433 () Bool)

(declare-fun e!448670 () Bool)

(declare-fun e!448671 () Bool)

(assert (=> b!810433 (= e!448670 e!448671)))

(declare-fun res!553619 () Bool)

(assert (=> b!810433 (=> (not res!553619) (not e!448671))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44020 0))(
  ( (array!44021 (arr!21079 (Array (_ BitVec 32) (_ BitVec 64))) (size!21499 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44020)

(declare-fun lt!363162 () (_ BitVec 32))

(assert (=> b!810433 (= res!553619 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363162 #b00000000000000000000000000000000) (bvslt lt!363162 (size!21499 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810433 (= lt!363162 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun res!553614 () Bool)

(declare-fun e!448672 () Bool)

(assert (=> start!69590 (=> (not res!553614) (not e!448672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69590 (= res!553614 (validMask!0 mask!3266))))

(assert (=> start!69590 e!448672))

(assert (=> start!69590 true))

(declare-fun array_inv!16938 (array!44020) Bool)

(assert (=> start!69590 (array_inv!16938 a!3170)))

(declare-fun b!810434 () Bool)

(declare-fun e!448667 () Bool)

(assert (=> b!810434 (= e!448667 e!448670)))

(declare-fun res!553617 () Bool)

(assert (=> b!810434 (=> (not res!553617) (not e!448670))))

(declare-datatypes ((SeekEntryResult!8626 0))(
  ( (MissingZero!8626 (index!36872 (_ BitVec 32))) (Found!8626 (index!36873 (_ BitVec 32))) (Intermediate!8626 (undefined!9438 Bool) (index!36874 (_ BitVec 32)) (x!67840 (_ BitVec 32))) (Undefined!8626) (MissingVacant!8626 (index!36875 (_ BitVec 32))) )
))
(declare-fun lt!363167 () SeekEntryResult!8626)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363163 () SeekEntryResult!8626)

(assert (=> b!810434 (= res!553617 (and (= lt!363163 lt!363167) (= lt!363167 (Found!8626 j!153)) (not (= (select (arr!21079 a!3170) index!1236) (select (arr!21079 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8626)

(assert (=> b!810434 (= lt!363167 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8626)

(assert (=> b!810434 (= lt!363163 (seekEntryOrOpen!0 (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810435 () Bool)

(declare-fun res!553618 () Bool)

(declare-fun e!448669 () Bool)

(assert (=> b!810435 (=> (not res!553618) (not e!448669))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810435 (= res!553618 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21499 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21079 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21499 a!3170)) (= (select (arr!21079 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810436 () Bool)

(assert (=> b!810436 (= e!448672 e!448669)))

(declare-fun res!553615 () Bool)

(assert (=> b!810436 (=> (not res!553615) (not e!448669))))

(declare-fun lt!363164 () SeekEntryResult!8626)

(assert (=> b!810436 (= res!553615 (or (= lt!363164 (MissingZero!8626 i!1163)) (= lt!363164 (MissingVacant!8626 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810436 (= lt!363164 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810437 () Bool)

(declare-fun res!553621 () Bool)

(assert (=> b!810437 (=> (not res!553621) (not e!448669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44020 (_ BitVec 32)) Bool)

(assert (=> b!810437 (= res!553621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810438 () Bool)

(declare-fun res!553622 () Bool)

(assert (=> b!810438 (=> (not res!553622) (not e!448672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810438 (= res!553622 (validKeyInArray!0 k0!2044))))

(declare-fun b!810439 () Bool)

(declare-fun res!553613 () Bool)

(assert (=> b!810439 (=> (not res!553613) (not e!448672))))

(declare-fun arrayContainsKey!0 (array!44020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810439 (= res!553613 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!363161 () (_ BitVec 64))

(declare-fun lt!363166 () array!44020)

(declare-fun b!810440 () Bool)

(declare-fun lt!363165 () SeekEntryResult!8626)

(assert (=> b!810440 (= e!448671 (not (= lt!363165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363162 vacantAfter!23 lt!363161 lt!363166 mask!3266))))))

(declare-fun b!810441 () Bool)

(declare-fun res!553620 () Bool)

(assert (=> b!810441 (=> (not res!553620) (not e!448669))))

(declare-datatypes ((List!14949 0))(
  ( (Nil!14946) (Cons!14945 (h!16080 (_ BitVec 64)) (t!21256 List!14949)) )
))
(declare-fun arrayNoDuplicates!0 (array!44020 (_ BitVec 32) List!14949) Bool)

(assert (=> b!810441 (= res!553620 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14946))))

(declare-fun b!810442 () Bool)

(declare-fun res!553612 () Bool)

(assert (=> b!810442 (=> (not res!553612) (not e!448672))))

(assert (=> b!810442 (= res!553612 (validKeyInArray!0 (select (arr!21079 a!3170) j!153)))))

(declare-fun b!810443 () Bool)

(assert (=> b!810443 (= e!448669 e!448667)))

(declare-fun res!553616 () Bool)

(assert (=> b!810443 (=> (not res!553616) (not e!448667))))

(assert (=> b!810443 (= res!553616 (= lt!363165 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363161 lt!363166 mask!3266)))))

(assert (=> b!810443 (= lt!363165 (seekEntryOrOpen!0 lt!363161 lt!363166 mask!3266))))

(assert (=> b!810443 (= lt!363161 (select (store (arr!21079 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810443 (= lt!363166 (array!44021 (store (arr!21079 a!3170) i!1163 k0!2044) (size!21499 a!3170)))))

(declare-fun b!810444 () Bool)

(declare-fun res!553623 () Bool)

(assert (=> b!810444 (=> (not res!553623) (not e!448672))))

(assert (=> b!810444 (= res!553623 (and (= (size!21499 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21499 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21499 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69590 res!553614) b!810444))

(assert (= (and b!810444 res!553623) b!810442))

(assert (= (and b!810442 res!553612) b!810438))

(assert (= (and b!810438 res!553622) b!810439))

(assert (= (and b!810439 res!553613) b!810436))

(assert (= (and b!810436 res!553615) b!810437))

(assert (= (and b!810437 res!553621) b!810441))

(assert (= (and b!810441 res!553620) b!810435))

(assert (= (and b!810435 res!553618) b!810443))

(assert (= (and b!810443 res!553616) b!810434))

(assert (= (and b!810434 res!553617) b!810433))

(assert (= (and b!810433 res!553619) b!810440))

(declare-fun m!753019 () Bool)

(assert (=> b!810442 m!753019))

(assert (=> b!810442 m!753019))

(declare-fun m!753021 () Bool)

(assert (=> b!810442 m!753021))

(declare-fun m!753023 () Bool)

(assert (=> b!810440 m!753023))

(declare-fun m!753025 () Bool)

(assert (=> b!810438 m!753025))

(declare-fun m!753027 () Bool)

(assert (=> b!810433 m!753027))

(declare-fun m!753029 () Bool)

(assert (=> b!810434 m!753029))

(assert (=> b!810434 m!753019))

(assert (=> b!810434 m!753019))

(declare-fun m!753031 () Bool)

(assert (=> b!810434 m!753031))

(assert (=> b!810434 m!753019))

(declare-fun m!753033 () Bool)

(assert (=> b!810434 m!753033))

(declare-fun m!753035 () Bool)

(assert (=> b!810443 m!753035))

(declare-fun m!753037 () Bool)

(assert (=> b!810443 m!753037))

(declare-fun m!753039 () Bool)

(assert (=> b!810443 m!753039))

(declare-fun m!753041 () Bool)

(assert (=> b!810443 m!753041))

(declare-fun m!753043 () Bool)

(assert (=> b!810435 m!753043))

(declare-fun m!753045 () Bool)

(assert (=> b!810435 m!753045))

(declare-fun m!753047 () Bool)

(assert (=> b!810436 m!753047))

(declare-fun m!753049 () Bool)

(assert (=> start!69590 m!753049))

(declare-fun m!753051 () Bool)

(assert (=> start!69590 m!753051))

(declare-fun m!753053 () Bool)

(assert (=> b!810439 m!753053))

(declare-fun m!753055 () Bool)

(assert (=> b!810441 m!753055))

(declare-fun m!753057 () Bool)

(assert (=> b!810437 m!753057))

(check-sat (not b!810443) (not start!69590) (not b!810437) (not b!810436) (not b!810439) (not b!810440) (not b!810433) (not b!810434) (not b!810438) (not b!810441) (not b!810442))
(check-sat)
(get-model)

(declare-fun d!104235 () Bool)

(declare-fun res!553700 () Bool)

(declare-fun e!448713 () Bool)

(assert (=> d!104235 (=> res!553700 e!448713)))

(assert (=> d!104235 (= res!553700 (= (select (arr!21079 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104235 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448713)))

(declare-fun b!810521 () Bool)

(declare-fun e!448714 () Bool)

(assert (=> b!810521 (= e!448713 e!448714)))

(declare-fun res!553701 () Bool)

(assert (=> b!810521 (=> (not res!553701) (not e!448714))))

(assert (=> b!810521 (= res!553701 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21499 a!3170)))))

(declare-fun b!810522 () Bool)

(assert (=> b!810522 (= e!448714 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104235 (not res!553700)) b!810521))

(assert (= (and b!810521 res!553701) b!810522))

(declare-fun m!753139 () Bool)

(assert (=> d!104235 m!753139))

(declare-fun m!753141 () Bool)

(assert (=> b!810522 m!753141))

(assert (=> b!810439 d!104235))

(declare-fun e!448723 () SeekEntryResult!8626)

(declare-fun b!810535 () Bool)

(assert (=> b!810535 (= e!448723 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!104237 () Bool)

(declare-fun lt!363214 () SeekEntryResult!8626)

(get-info :version)

(assert (=> d!104237 (and (or ((_ is Undefined!8626) lt!363214) (not ((_ is Found!8626) lt!363214)) (and (bvsge (index!36873 lt!363214) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363214) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363214) ((_ is Found!8626) lt!363214) (not ((_ is MissingVacant!8626) lt!363214)) (not (= (index!36875 lt!363214) vacantBefore!23)) (and (bvsge (index!36875 lt!363214) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363214) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363214) (ite ((_ is Found!8626) lt!363214) (= (select (arr!21079 a!3170) (index!36873 lt!363214)) (select (arr!21079 a!3170) j!153)) (and ((_ is MissingVacant!8626) lt!363214) (= (index!36875 lt!363214) vacantBefore!23) (= (select (arr!21079 a!3170) (index!36875 lt!363214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448722 () SeekEntryResult!8626)

(assert (=> d!104237 (= lt!363214 e!448722)))

(declare-fun c!88831 () Bool)

(assert (=> d!104237 (= c!88831 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363215 () (_ BitVec 64))

(assert (=> d!104237 (= lt!363215 (select (arr!21079 a!3170) index!1236))))

(assert (=> d!104237 (validMask!0 mask!3266)))

(assert (=> d!104237 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21079 a!3170) j!153) a!3170 mask!3266) lt!363214)))

(declare-fun b!810536 () Bool)

(declare-fun e!448721 () SeekEntryResult!8626)

(assert (=> b!810536 (= e!448721 (Found!8626 index!1236))))

(declare-fun b!810537 () Bool)

(assert (=> b!810537 (= e!448723 (MissingVacant!8626 vacantBefore!23))))

(declare-fun b!810538 () Bool)

(declare-fun c!88832 () Bool)

(assert (=> b!810538 (= c!88832 (= lt!363215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810538 (= e!448721 e!448723)))

(declare-fun b!810539 () Bool)

(assert (=> b!810539 (= e!448722 Undefined!8626)))

(declare-fun b!810540 () Bool)

(assert (=> b!810540 (= e!448722 e!448721)))

(declare-fun c!88830 () Bool)

(assert (=> b!810540 (= c!88830 (= lt!363215 (select (arr!21079 a!3170) j!153)))))

(assert (= (and d!104237 c!88831) b!810539))

(assert (= (and d!104237 (not c!88831)) b!810540))

(assert (= (and b!810540 c!88830) b!810536))

(assert (= (and b!810540 (not c!88830)) b!810538))

(assert (= (and b!810538 c!88832) b!810537))

(assert (= (and b!810538 (not c!88832)) b!810535))

(declare-fun m!753143 () Bool)

(assert (=> b!810535 m!753143))

(assert (=> b!810535 m!753143))

(assert (=> b!810535 m!753019))

(declare-fun m!753145 () Bool)

(assert (=> b!810535 m!753145))

(declare-fun m!753147 () Bool)

(assert (=> d!104237 m!753147))

(declare-fun m!753149 () Bool)

(assert (=> d!104237 m!753149))

(assert (=> d!104237 m!753029))

(assert (=> d!104237 m!753049))

(assert (=> b!810434 d!104237))

(declare-fun b!810568 () Bool)

(declare-fun e!448742 () SeekEntryResult!8626)

(declare-fun e!448743 () SeekEntryResult!8626)

(assert (=> b!810568 (= e!448742 e!448743)))

(declare-fun lt!363224 () (_ BitVec 64))

(declare-fun lt!363223 () SeekEntryResult!8626)

(assert (=> b!810568 (= lt!363224 (select (arr!21079 a!3170) (index!36874 lt!363223)))))

(declare-fun c!88844 () Bool)

(assert (=> b!810568 (= c!88844 (= lt!363224 (select (arr!21079 a!3170) j!153)))))

(declare-fun b!810569 () Bool)

(declare-fun c!88842 () Bool)

(assert (=> b!810569 (= c!88842 (= lt!363224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448744 () SeekEntryResult!8626)

(assert (=> b!810569 (= e!448743 e!448744)))

(declare-fun b!810571 () Bool)

(assert (=> b!810571 (= e!448744 (seekKeyOrZeroReturnVacant!0 (x!67840 lt!363223) (index!36874 lt!363223) (index!36874 lt!363223) (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810572 () Bool)

(assert (=> b!810572 (= e!448742 Undefined!8626)))

(declare-fun b!810573 () Bool)

(assert (=> b!810573 (= e!448743 (Found!8626 (index!36874 lt!363223)))))

(declare-fun d!104239 () Bool)

(declare-fun lt!363222 () SeekEntryResult!8626)

(assert (=> d!104239 (and (or ((_ is Undefined!8626) lt!363222) (not ((_ is Found!8626) lt!363222)) (and (bvsge (index!36873 lt!363222) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363222) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363222) ((_ is Found!8626) lt!363222) (not ((_ is MissingZero!8626) lt!363222)) (and (bvsge (index!36872 lt!363222) #b00000000000000000000000000000000) (bvslt (index!36872 lt!363222) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363222) ((_ is Found!8626) lt!363222) ((_ is MissingZero!8626) lt!363222) (not ((_ is MissingVacant!8626) lt!363222)) (and (bvsge (index!36875 lt!363222) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363222) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363222) (ite ((_ is Found!8626) lt!363222) (= (select (arr!21079 a!3170) (index!36873 lt!363222)) (select (arr!21079 a!3170) j!153)) (ite ((_ is MissingZero!8626) lt!363222) (= (select (arr!21079 a!3170) (index!36872 lt!363222)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8626) lt!363222) (= (select (arr!21079 a!3170) (index!36875 lt!363222)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104239 (= lt!363222 e!448742)))

(declare-fun c!88843 () Bool)

(assert (=> d!104239 (= c!88843 (and ((_ is Intermediate!8626) lt!363223) (undefined!9438 lt!363223)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44020 (_ BitVec 32)) SeekEntryResult!8626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104239 (= lt!363223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21079 a!3170) j!153) mask!3266) (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104239 (validMask!0 mask!3266)))

(assert (=> d!104239 (= (seekEntryOrOpen!0 (select (arr!21079 a!3170) j!153) a!3170 mask!3266) lt!363222)))

(declare-fun b!810570 () Bool)

(assert (=> b!810570 (= e!448744 (MissingZero!8626 (index!36874 lt!363223)))))

(assert (= (and d!104239 c!88843) b!810572))

(assert (= (and d!104239 (not c!88843)) b!810568))

(assert (= (and b!810568 c!88844) b!810573))

(assert (= (and b!810568 (not c!88844)) b!810569))

(assert (= (and b!810569 c!88842) b!810570))

(assert (= (and b!810569 (not c!88842)) b!810571))

(declare-fun m!753159 () Bool)

(assert (=> b!810568 m!753159))

(assert (=> b!810571 m!753019))

(declare-fun m!753161 () Bool)

(assert (=> b!810571 m!753161))

(assert (=> d!104239 m!753019))

(declare-fun m!753163 () Bool)

(assert (=> d!104239 m!753163))

(assert (=> d!104239 m!753049))

(assert (=> d!104239 m!753163))

(assert (=> d!104239 m!753019))

(declare-fun m!753165 () Bool)

(assert (=> d!104239 m!753165))

(declare-fun m!753167 () Bool)

(assert (=> d!104239 m!753167))

(declare-fun m!753169 () Bool)

(assert (=> d!104239 m!753169))

(declare-fun m!753171 () Bool)

(assert (=> d!104239 m!753171))

(assert (=> b!810434 d!104239))

(declare-fun d!104251 () Bool)

(declare-fun lt!363227 () (_ BitVec 32))

(assert (=> d!104251 (and (bvsge lt!363227 #b00000000000000000000000000000000) (bvslt lt!363227 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104251 (= lt!363227 (choose!52 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (=> d!104251 (validMask!0 mask!3266)))

(assert (=> d!104251 (= (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) lt!363227)))

(declare-fun bs!22439 () Bool)

(assert (= bs!22439 d!104251))

(declare-fun m!753173 () Bool)

(assert (=> bs!22439 m!753173))

(assert (=> bs!22439 m!753049))

(assert (=> b!810433 d!104251))

(declare-fun e!448747 () SeekEntryResult!8626)

(declare-fun b!810574 () Bool)

(assert (=> b!810574 (= e!448747 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363161 lt!363166 mask!3266))))

(declare-fun lt!363228 () SeekEntryResult!8626)

(declare-fun d!104253 () Bool)

(assert (=> d!104253 (and (or ((_ is Undefined!8626) lt!363228) (not ((_ is Found!8626) lt!363228)) (and (bvsge (index!36873 lt!363228) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363228) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363228) ((_ is Found!8626) lt!363228) (not ((_ is MissingVacant!8626) lt!363228)) (not (= (index!36875 lt!363228) vacantAfter!23)) (and (bvsge (index!36875 lt!363228) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363228) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363228) (ite ((_ is Found!8626) lt!363228) (= (select (arr!21079 lt!363166) (index!36873 lt!363228)) lt!363161) (and ((_ is MissingVacant!8626) lt!363228) (= (index!36875 lt!363228) vacantAfter!23) (= (select (arr!21079 lt!363166) (index!36875 lt!363228)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448746 () SeekEntryResult!8626)

(assert (=> d!104253 (= lt!363228 e!448746)))

(declare-fun c!88846 () Bool)

(assert (=> d!104253 (= c!88846 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363229 () (_ BitVec 64))

(assert (=> d!104253 (= lt!363229 (select (arr!21079 lt!363166) index!1236))))

(assert (=> d!104253 (validMask!0 mask!3266)))

(assert (=> d!104253 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363161 lt!363166 mask!3266) lt!363228)))

(declare-fun b!810575 () Bool)

(declare-fun e!448745 () SeekEntryResult!8626)

(assert (=> b!810575 (= e!448745 (Found!8626 index!1236))))

(declare-fun b!810576 () Bool)

(assert (=> b!810576 (= e!448747 (MissingVacant!8626 vacantAfter!23))))

(declare-fun b!810577 () Bool)

(declare-fun c!88847 () Bool)

(assert (=> b!810577 (= c!88847 (= lt!363229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810577 (= e!448745 e!448747)))

(declare-fun b!810578 () Bool)

(assert (=> b!810578 (= e!448746 Undefined!8626)))

(declare-fun b!810579 () Bool)

(assert (=> b!810579 (= e!448746 e!448745)))

(declare-fun c!88845 () Bool)

(assert (=> b!810579 (= c!88845 (= lt!363229 lt!363161))))

(assert (= (and d!104253 c!88846) b!810578))

(assert (= (and d!104253 (not c!88846)) b!810579))

(assert (= (and b!810579 c!88845) b!810575))

(assert (= (and b!810579 (not c!88845)) b!810577))

(assert (= (and b!810577 c!88847) b!810576))

(assert (= (and b!810577 (not c!88847)) b!810574))

(assert (=> b!810574 m!753143))

(assert (=> b!810574 m!753143))

(declare-fun m!753175 () Bool)

(assert (=> b!810574 m!753175))

(declare-fun m!753177 () Bool)

(assert (=> d!104253 m!753177))

(declare-fun m!753179 () Bool)

(assert (=> d!104253 m!753179))

(declare-fun m!753181 () Bool)

(assert (=> d!104253 m!753181))

(assert (=> d!104253 m!753049))

(assert (=> b!810443 d!104253))

(declare-fun b!810580 () Bool)

(declare-fun e!448748 () SeekEntryResult!8626)

(declare-fun e!448749 () SeekEntryResult!8626)

(assert (=> b!810580 (= e!448748 e!448749)))

(declare-fun lt!363232 () (_ BitVec 64))

(declare-fun lt!363231 () SeekEntryResult!8626)

(assert (=> b!810580 (= lt!363232 (select (arr!21079 lt!363166) (index!36874 lt!363231)))))

(declare-fun c!88850 () Bool)

(assert (=> b!810580 (= c!88850 (= lt!363232 lt!363161))))

(declare-fun b!810581 () Bool)

(declare-fun c!88848 () Bool)

(assert (=> b!810581 (= c!88848 (= lt!363232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448750 () SeekEntryResult!8626)

(assert (=> b!810581 (= e!448749 e!448750)))

(declare-fun b!810583 () Bool)

(assert (=> b!810583 (= e!448750 (seekKeyOrZeroReturnVacant!0 (x!67840 lt!363231) (index!36874 lt!363231) (index!36874 lt!363231) lt!363161 lt!363166 mask!3266))))

(declare-fun b!810584 () Bool)

(assert (=> b!810584 (= e!448748 Undefined!8626)))

(declare-fun b!810585 () Bool)

(assert (=> b!810585 (= e!448749 (Found!8626 (index!36874 lt!363231)))))

(declare-fun d!104259 () Bool)

(declare-fun lt!363230 () SeekEntryResult!8626)

(assert (=> d!104259 (and (or ((_ is Undefined!8626) lt!363230) (not ((_ is Found!8626) lt!363230)) (and (bvsge (index!36873 lt!363230) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363230) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363230) ((_ is Found!8626) lt!363230) (not ((_ is MissingZero!8626) lt!363230)) (and (bvsge (index!36872 lt!363230) #b00000000000000000000000000000000) (bvslt (index!36872 lt!363230) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363230) ((_ is Found!8626) lt!363230) ((_ is MissingZero!8626) lt!363230) (not ((_ is MissingVacant!8626) lt!363230)) (and (bvsge (index!36875 lt!363230) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363230) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363230) (ite ((_ is Found!8626) lt!363230) (= (select (arr!21079 lt!363166) (index!36873 lt!363230)) lt!363161) (ite ((_ is MissingZero!8626) lt!363230) (= (select (arr!21079 lt!363166) (index!36872 lt!363230)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8626) lt!363230) (= (select (arr!21079 lt!363166) (index!36875 lt!363230)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104259 (= lt!363230 e!448748)))

(declare-fun c!88849 () Bool)

(assert (=> d!104259 (= c!88849 (and ((_ is Intermediate!8626) lt!363231) (undefined!9438 lt!363231)))))

(assert (=> d!104259 (= lt!363231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363161 mask!3266) lt!363161 lt!363166 mask!3266))))

(assert (=> d!104259 (validMask!0 mask!3266)))

(assert (=> d!104259 (= (seekEntryOrOpen!0 lt!363161 lt!363166 mask!3266) lt!363230)))

(declare-fun b!810582 () Bool)

(assert (=> b!810582 (= e!448750 (MissingZero!8626 (index!36874 lt!363231)))))

(assert (= (and d!104259 c!88849) b!810584))

(assert (= (and d!104259 (not c!88849)) b!810580))

(assert (= (and b!810580 c!88850) b!810585))

(assert (= (and b!810580 (not c!88850)) b!810581))

(assert (= (and b!810581 c!88848) b!810582))

(assert (= (and b!810581 (not c!88848)) b!810583))

(declare-fun m!753183 () Bool)

(assert (=> b!810580 m!753183))

(declare-fun m!753185 () Bool)

(assert (=> b!810583 m!753185))

(declare-fun m!753187 () Bool)

(assert (=> d!104259 m!753187))

(assert (=> d!104259 m!753049))

(assert (=> d!104259 m!753187))

(declare-fun m!753189 () Bool)

(assert (=> d!104259 m!753189))

(declare-fun m!753191 () Bool)

(assert (=> d!104259 m!753191))

(declare-fun m!753193 () Bool)

(assert (=> d!104259 m!753193))

(declare-fun m!753195 () Bool)

(assert (=> d!104259 m!753195))

(assert (=> b!810443 d!104259))

(declare-fun d!104261 () Bool)

(assert (=> d!104261 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810438 d!104261))

(declare-fun b!810594 () Bool)

(declare-fun e!448757 () Bool)

(declare-fun e!448758 () Bool)

(assert (=> b!810594 (= e!448757 e!448758)))

(declare-fun lt!363240 () (_ BitVec 64))

(assert (=> b!810594 (= lt!363240 (select (arr!21079 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27609 0))(
  ( (Unit!27610) )
))
(declare-fun lt!363239 () Unit!27609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44020 (_ BitVec 64) (_ BitVec 32)) Unit!27609)

(assert (=> b!810594 (= lt!363239 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363240 #b00000000000000000000000000000000))))

(assert (=> b!810594 (arrayContainsKey!0 a!3170 lt!363240 #b00000000000000000000000000000000)))

(declare-fun lt!363241 () Unit!27609)

(assert (=> b!810594 (= lt!363241 lt!363239)))

(declare-fun res!553715 () Bool)

(assert (=> b!810594 (= res!553715 (= (seekEntryOrOpen!0 (select (arr!21079 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8626 #b00000000000000000000000000000000)))))

(assert (=> b!810594 (=> (not res!553715) (not e!448758))))

(declare-fun d!104263 () Bool)

(declare-fun res!553716 () Bool)

(declare-fun e!448759 () Bool)

(assert (=> d!104263 (=> res!553716 e!448759)))

(assert (=> d!104263 (= res!553716 (bvsge #b00000000000000000000000000000000 (size!21499 a!3170)))))

(assert (=> d!104263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448759)))

(declare-fun b!810595 () Bool)

(assert (=> b!810595 (= e!448759 e!448757)))

(declare-fun c!88853 () Bool)

(assert (=> b!810595 (= c!88853 (validKeyInArray!0 (select (arr!21079 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810596 () Bool)

(declare-fun call!35469 () Bool)

(assert (=> b!810596 (= e!448757 call!35469)))

(declare-fun bm!35466 () Bool)

(assert (=> bm!35466 (= call!35469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!810597 () Bool)

(assert (=> b!810597 (= e!448758 call!35469)))

(assert (= (and d!104263 (not res!553716)) b!810595))

(assert (= (and b!810595 c!88853) b!810594))

(assert (= (and b!810595 (not c!88853)) b!810596))

(assert (= (and b!810594 res!553715) b!810597))

(assert (= (or b!810597 b!810596) bm!35466))

(assert (=> b!810594 m!753139))

(declare-fun m!753197 () Bool)

(assert (=> b!810594 m!753197))

(declare-fun m!753199 () Bool)

(assert (=> b!810594 m!753199))

(assert (=> b!810594 m!753139))

(declare-fun m!753201 () Bool)

(assert (=> b!810594 m!753201))

(assert (=> b!810595 m!753139))

(assert (=> b!810595 m!753139))

(declare-fun m!753203 () Bool)

(assert (=> b!810595 m!753203))

(declare-fun m!753205 () Bool)

(assert (=> bm!35466 m!753205))

(assert (=> b!810437 d!104263))

(declare-fun d!104269 () Bool)

(assert (=> d!104269 (= (validKeyInArray!0 (select (arr!21079 a!3170) j!153)) (and (not (= (select (arr!21079 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21079 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810442 d!104269))

(declare-fun b!810626 () Bool)

(declare-fun e!448780 () Bool)

(declare-fun e!448778 () Bool)

(assert (=> b!810626 (= e!448780 e!448778)))

(declare-fun res!553724 () Bool)

(assert (=> b!810626 (=> (not res!553724) (not e!448778))))

(declare-fun e!448777 () Bool)

(assert (=> b!810626 (= res!553724 (not e!448777))))

(declare-fun res!553723 () Bool)

(assert (=> b!810626 (=> (not res!553723) (not e!448777))))

(assert (=> b!810626 (= res!553723 (validKeyInArray!0 (select (arr!21079 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810627 () Bool)

(declare-fun e!448779 () Bool)

(assert (=> b!810627 (= e!448778 e!448779)))

(declare-fun c!88865 () Bool)

(assert (=> b!810627 (= c!88865 (validKeyInArray!0 (select (arr!21079 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810628 () Bool)

(declare-fun call!35472 () Bool)

(assert (=> b!810628 (= e!448779 call!35472)))

(declare-fun b!810629 () Bool)

(assert (=> b!810629 (= e!448779 call!35472)))

(declare-fun d!104271 () Bool)

(declare-fun res!553725 () Bool)

(assert (=> d!104271 (=> res!553725 e!448780)))

(assert (=> d!104271 (= res!553725 (bvsge #b00000000000000000000000000000000 (size!21499 a!3170)))))

(assert (=> d!104271 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14946) e!448780)))

(declare-fun b!810630 () Bool)

(declare-fun contains!4110 (List!14949 (_ BitVec 64)) Bool)

(assert (=> b!810630 (= e!448777 (contains!4110 Nil!14946 (select (arr!21079 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35469 () Bool)

(assert (=> bm!35469 (= call!35472 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88865 (Cons!14945 (select (arr!21079 a!3170) #b00000000000000000000000000000000) Nil!14946) Nil!14946)))))

(assert (= (and d!104271 (not res!553725)) b!810626))

(assert (= (and b!810626 res!553723) b!810630))

(assert (= (and b!810626 res!553724) b!810627))

(assert (= (and b!810627 c!88865) b!810629))

(assert (= (and b!810627 (not c!88865)) b!810628))

(assert (= (or b!810629 b!810628) bm!35469))

(assert (=> b!810626 m!753139))

(assert (=> b!810626 m!753139))

(assert (=> b!810626 m!753203))

(assert (=> b!810627 m!753139))

(assert (=> b!810627 m!753139))

(assert (=> b!810627 m!753203))

(assert (=> b!810630 m!753139))

(assert (=> b!810630 m!753139))

(declare-fun m!753217 () Bool)

(assert (=> b!810630 m!753217))

(assert (=> bm!35469 m!753139))

(declare-fun m!753219 () Bool)

(assert (=> bm!35469 m!753219))

(assert (=> b!810441 d!104271))

(declare-fun b!810631 () Bool)

(declare-fun e!448781 () SeekEntryResult!8626)

(declare-fun e!448782 () SeekEntryResult!8626)

(assert (=> b!810631 (= e!448781 e!448782)))

(declare-fun lt!363250 () (_ BitVec 64))

(declare-fun lt!363249 () SeekEntryResult!8626)

(assert (=> b!810631 (= lt!363250 (select (arr!21079 a!3170) (index!36874 lt!363249)))))

(declare-fun c!88868 () Bool)

(assert (=> b!810631 (= c!88868 (= lt!363250 k0!2044))))

(declare-fun b!810632 () Bool)

(declare-fun c!88866 () Bool)

(assert (=> b!810632 (= c!88866 (= lt!363250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448783 () SeekEntryResult!8626)

(assert (=> b!810632 (= e!448782 e!448783)))

(declare-fun b!810634 () Bool)

(assert (=> b!810634 (= e!448783 (seekKeyOrZeroReturnVacant!0 (x!67840 lt!363249) (index!36874 lt!363249) (index!36874 lt!363249) k0!2044 a!3170 mask!3266))))

(declare-fun b!810635 () Bool)

(assert (=> b!810635 (= e!448781 Undefined!8626)))

(declare-fun b!810636 () Bool)

(assert (=> b!810636 (= e!448782 (Found!8626 (index!36874 lt!363249)))))

(declare-fun d!104275 () Bool)

(declare-fun lt!363248 () SeekEntryResult!8626)

(assert (=> d!104275 (and (or ((_ is Undefined!8626) lt!363248) (not ((_ is Found!8626) lt!363248)) (and (bvsge (index!36873 lt!363248) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363248) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363248) ((_ is Found!8626) lt!363248) (not ((_ is MissingZero!8626) lt!363248)) (and (bvsge (index!36872 lt!363248) #b00000000000000000000000000000000) (bvslt (index!36872 lt!363248) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363248) ((_ is Found!8626) lt!363248) ((_ is MissingZero!8626) lt!363248) (not ((_ is MissingVacant!8626) lt!363248)) (and (bvsge (index!36875 lt!363248) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363248) (size!21499 a!3170)))) (or ((_ is Undefined!8626) lt!363248) (ite ((_ is Found!8626) lt!363248) (= (select (arr!21079 a!3170) (index!36873 lt!363248)) k0!2044) (ite ((_ is MissingZero!8626) lt!363248) (= (select (arr!21079 a!3170) (index!36872 lt!363248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8626) lt!363248) (= (select (arr!21079 a!3170) (index!36875 lt!363248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104275 (= lt!363248 e!448781)))

(declare-fun c!88867 () Bool)

(assert (=> d!104275 (= c!88867 (and ((_ is Intermediate!8626) lt!363249) (undefined!9438 lt!363249)))))

(assert (=> d!104275 (= lt!363249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104275 (validMask!0 mask!3266)))

(assert (=> d!104275 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363248)))

(declare-fun b!810633 () Bool)

(assert (=> b!810633 (= e!448783 (MissingZero!8626 (index!36874 lt!363249)))))

(assert (= (and d!104275 c!88867) b!810635))

(assert (= (and d!104275 (not c!88867)) b!810631))

(assert (= (and b!810631 c!88868) b!810636))

(assert (= (and b!810631 (not c!88868)) b!810632))

(assert (= (and b!810632 c!88866) b!810633))

(assert (= (and b!810632 (not c!88866)) b!810634))

(declare-fun m!753221 () Bool)

(assert (=> b!810631 m!753221))

(declare-fun m!753223 () Bool)

(assert (=> b!810634 m!753223))

(declare-fun m!753225 () Bool)

(assert (=> d!104275 m!753225))

(assert (=> d!104275 m!753049))

(assert (=> d!104275 m!753225))

(declare-fun m!753227 () Bool)

(assert (=> d!104275 m!753227))

(declare-fun m!753229 () Bool)

(assert (=> d!104275 m!753229))

(declare-fun m!753231 () Bool)

(assert (=> d!104275 m!753231))

(declare-fun m!753233 () Bool)

(assert (=> d!104275 m!753233))

(assert (=> b!810436 d!104275))

(declare-fun d!104277 () Bool)

(assert (=> d!104277 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69590 d!104277))

(declare-fun d!104287 () Bool)

(assert (=> d!104287 (= (array_inv!16938 a!3170) (bvsge (size!21499 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69590 d!104287))

(declare-fun b!810676 () Bool)

(declare-fun e!448810 () SeekEntryResult!8626)

(assert (=> b!810676 (= e!448810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363162 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363161 lt!363166 mask!3266))))

(declare-fun d!104289 () Bool)

(declare-fun lt!363265 () SeekEntryResult!8626)

(assert (=> d!104289 (and (or ((_ is Undefined!8626) lt!363265) (not ((_ is Found!8626) lt!363265)) (and (bvsge (index!36873 lt!363265) #b00000000000000000000000000000000) (bvslt (index!36873 lt!363265) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363265) ((_ is Found!8626) lt!363265) (not ((_ is MissingVacant!8626) lt!363265)) (not (= (index!36875 lt!363265) vacantAfter!23)) (and (bvsge (index!36875 lt!363265) #b00000000000000000000000000000000) (bvslt (index!36875 lt!363265) (size!21499 lt!363166)))) (or ((_ is Undefined!8626) lt!363265) (ite ((_ is Found!8626) lt!363265) (= (select (arr!21079 lt!363166) (index!36873 lt!363265)) lt!363161) (and ((_ is MissingVacant!8626) lt!363265) (= (index!36875 lt!363265) vacantAfter!23) (= (select (arr!21079 lt!363166) (index!36875 lt!363265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448809 () SeekEntryResult!8626)

(assert (=> d!104289 (= lt!363265 e!448809)))

(declare-fun c!88885 () Bool)

(assert (=> d!104289 (= c!88885 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363266 () (_ BitVec 64))

(assert (=> d!104289 (= lt!363266 (select (arr!21079 lt!363166) lt!363162))))

(assert (=> d!104289 (validMask!0 mask!3266)))

(assert (=> d!104289 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363162 vacantAfter!23 lt!363161 lt!363166 mask!3266) lt!363265)))

(declare-fun b!810677 () Bool)

(declare-fun e!448808 () SeekEntryResult!8626)

(assert (=> b!810677 (= e!448808 (Found!8626 lt!363162))))

(declare-fun b!810678 () Bool)

(assert (=> b!810678 (= e!448810 (MissingVacant!8626 vacantAfter!23))))

(declare-fun b!810679 () Bool)

(declare-fun c!88886 () Bool)

(assert (=> b!810679 (= c!88886 (= lt!363266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810679 (= e!448808 e!448810)))

(declare-fun b!810680 () Bool)

(assert (=> b!810680 (= e!448809 Undefined!8626)))

(declare-fun b!810681 () Bool)

(assert (=> b!810681 (= e!448809 e!448808)))

(declare-fun c!88884 () Bool)

(assert (=> b!810681 (= c!88884 (= lt!363266 lt!363161))))

(assert (= (and d!104289 c!88885) b!810680))

(assert (= (and d!104289 (not c!88885)) b!810681))

(assert (= (and b!810681 c!88884) b!810677))

(assert (= (and b!810681 (not c!88884)) b!810679))

(assert (= (and b!810679 c!88886) b!810678))

(assert (= (and b!810679 (not c!88886)) b!810676))

(declare-fun m!753269 () Bool)

(assert (=> b!810676 m!753269))

(assert (=> b!810676 m!753269))

(declare-fun m!753271 () Bool)

(assert (=> b!810676 m!753271))

(declare-fun m!753273 () Bool)

(assert (=> d!104289 m!753273))

(declare-fun m!753275 () Bool)

(assert (=> d!104289 m!753275))

(declare-fun m!753277 () Bool)

(assert (=> d!104289 m!753277))

(assert (=> d!104289 m!753049))

(assert (=> b!810440 d!104289))

(check-sat (not bm!35466) (not b!810630) (not b!810634) (not b!810627) (not b!810594) (not b!810626) (not b!810571) (not d!104251) (not b!810522) (not d!104239) (not d!104253) (not b!810595) (not d!104289) (not b!810535) (not bm!35469) (not d!104259) (not b!810676) (not d!104237) (not b!810574) (not d!104275) (not b!810583))
(check-sat)
