; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47726 () Bool)

(assert start!47726)

(declare-fun b!525046 () Bool)

(declare-fun e!306168 () Bool)

(assert (=> b!525046 (= e!306168 false)))

(declare-fun b!525047 () Bool)

(declare-fun res!321867 () Bool)

(declare-fun e!306167 () Bool)

(assert (=> b!525047 (=> (not res!321867) (not e!306167))))

(declare-datatypes ((array!33363 0))(
  ( (array!33364 (arr!16033 (Array (_ BitVec 32) (_ BitVec 64))) (size!16397 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33363)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525047 (= res!321867 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525048 () Bool)

(declare-fun res!321873 () Bool)

(assert (=> b!525048 (=> (not res!321873) (not e!306167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525048 (= res!321873 (validKeyInArray!0 k0!2280))))

(declare-fun b!525049 () Bool)

(declare-fun res!321876 () Bool)

(assert (=> b!525049 (=> (not res!321876) (not e!306167))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525049 (= res!321876 (validKeyInArray!0 (select (arr!16033 a!3235) j!176)))))

(declare-fun b!525050 () Bool)

(declare-datatypes ((Unit!16452 0))(
  ( (Unit!16453) )
))
(declare-fun e!306164 () Unit!16452)

(declare-fun Unit!16454 () Unit!16452)

(assert (=> b!525050 (= e!306164 Unit!16454)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4500 0))(
  ( (MissingZero!4500 (index!20212 (_ BitVec 32))) (Found!4500 (index!20213 (_ BitVec 32))) (Intermediate!4500 (undefined!5312 Bool) (index!20214 (_ BitVec 32)) (x!49193 (_ BitVec 32))) (Undefined!4500) (MissingVacant!4500 (index!20215 (_ BitVec 32))) )
))
(declare-fun lt!241116 () SeekEntryResult!4500)

(declare-fun lt!241121 () (_ BitVec 32))

(declare-fun lt!241114 () Unit!16452)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16452)

(assert (=> b!525050 (= lt!241114 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241121 #b00000000000000000000000000000000 (index!20214 lt!241116) (x!49193 lt!241116) mask!3524))))

(declare-fun lt!241117 () array!33363)

(declare-fun res!321871 () Bool)

(declare-fun lt!241123 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33363 (_ BitVec 32)) SeekEntryResult!4500)

(assert (=> b!525050 (= res!321871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241121 lt!241123 lt!241117 mask!3524) (Intermediate!4500 false (index!20214 lt!241116) (x!49193 lt!241116))))))

(assert (=> b!525050 (=> (not res!321871) (not e!306168))))

(assert (=> b!525050 e!306168))

(declare-fun b!525052 () Bool)

(declare-fun res!321878 () Bool)

(assert (=> b!525052 (=> (not res!321878) (not e!306167))))

(assert (=> b!525052 (= res!321878 (and (= (size!16397 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16397 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16397 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525053 () Bool)

(declare-fun e!306166 () Bool)

(assert (=> b!525053 (= e!306167 e!306166)))

(declare-fun res!321874 () Bool)

(assert (=> b!525053 (=> (not res!321874) (not e!306166))))

(declare-fun lt!241120 () SeekEntryResult!4500)

(assert (=> b!525053 (= res!321874 (or (= lt!241120 (MissingZero!4500 i!1204)) (= lt!241120 (MissingVacant!4500 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33363 (_ BitVec 32)) SeekEntryResult!4500)

(assert (=> b!525053 (= lt!241120 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525054 () Bool)

(declare-fun res!321868 () Bool)

(declare-fun e!306162 () Bool)

(assert (=> b!525054 (=> res!321868 e!306162)))

(get-info :version)

(assert (=> b!525054 (= res!321868 (or (undefined!5312 lt!241116) (not ((_ is Intermediate!4500) lt!241116))))))

(declare-fun e!306163 () Bool)

(declare-fun b!525055 () Bool)

(assert (=> b!525055 (= e!306163 (= (seekEntryOrOpen!0 (select (arr!16033 a!3235) j!176) a!3235 mask!3524) (Found!4500 j!176)))))

(declare-fun b!525056 () Bool)

(declare-fun res!321875 () Bool)

(assert (=> b!525056 (=> (not res!321875) (not e!306166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33363 (_ BitVec 32)) Bool)

(assert (=> b!525056 (= res!321875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525057 () Bool)

(assert (=> b!525057 (= e!306162 true)))

(assert (=> b!525057 (= (index!20214 lt!241116) i!1204)))

(declare-fun lt!241118 () Unit!16452)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16452)

(assert (=> b!525057 (= lt!241118 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241121 #b00000000000000000000000000000000 (index!20214 lt!241116) (x!49193 lt!241116) mask!3524))))

(assert (=> b!525057 (and (or (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241115 () Unit!16452)

(assert (=> b!525057 (= lt!241115 e!306164)))

(declare-fun c!61895 () Bool)

(assert (=> b!525057 (= c!61895 (= (select (arr!16033 a!3235) (index!20214 lt!241116)) (select (arr!16033 a!3235) j!176)))))

(assert (=> b!525057 (and (bvslt (x!49193 lt!241116) #b01111111111111111111111111111110) (or (= (select (arr!16033 a!3235) (index!20214 lt!241116)) (select (arr!16033 a!3235) j!176)) (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16033 a!3235) (index!20214 lt!241116)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525058 () Bool)

(declare-fun res!321872 () Bool)

(assert (=> b!525058 (=> (not res!321872) (not e!306166))))

(declare-datatypes ((List!10191 0))(
  ( (Nil!10188) (Cons!10187 (h!11118 (_ BitVec 64)) (t!16419 List!10191)) )
))
(declare-fun arrayNoDuplicates!0 (array!33363 (_ BitVec 32) List!10191) Bool)

(assert (=> b!525058 (= res!321872 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10188))))

(declare-fun b!525059 () Bool)

(assert (=> b!525059 (= e!306166 (not e!306162))))

(declare-fun res!321869 () Bool)

(assert (=> b!525059 (=> res!321869 e!306162)))

(declare-fun lt!241119 () (_ BitVec 32))

(assert (=> b!525059 (= res!321869 (= lt!241116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241119 lt!241123 lt!241117 mask!3524)))))

(assert (=> b!525059 (= lt!241116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241121 (select (arr!16033 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525059 (= lt!241119 (toIndex!0 lt!241123 mask!3524))))

(assert (=> b!525059 (= lt!241123 (select (store (arr!16033 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525059 (= lt!241121 (toIndex!0 (select (arr!16033 a!3235) j!176) mask!3524))))

(assert (=> b!525059 (= lt!241117 (array!33364 (store (arr!16033 a!3235) i!1204 k0!2280) (size!16397 a!3235)))))

(assert (=> b!525059 e!306163))

(declare-fun res!321877 () Bool)

(assert (=> b!525059 (=> (not res!321877) (not e!306163))))

(assert (=> b!525059 (= res!321877 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241122 () Unit!16452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16452)

(assert (=> b!525059 (= lt!241122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525051 () Bool)

(declare-fun Unit!16455 () Unit!16452)

(assert (=> b!525051 (= e!306164 Unit!16455)))

(declare-fun res!321870 () Bool)

(assert (=> start!47726 (=> (not res!321870) (not e!306167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47726 (= res!321870 (validMask!0 mask!3524))))

(assert (=> start!47726 e!306167))

(assert (=> start!47726 true))

(declare-fun array_inv!11829 (array!33363) Bool)

(assert (=> start!47726 (array_inv!11829 a!3235)))

(assert (= (and start!47726 res!321870) b!525052))

(assert (= (and b!525052 res!321878) b!525049))

(assert (= (and b!525049 res!321876) b!525048))

(assert (= (and b!525048 res!321873) b!525047))

(assert (= (and b!525047 res!321867) b!525053))

(assert (= (and b!525053 res!321874) b!525056))

(assert (= (and b!525056 res!321875) b!525058))

(assert (= (and b!525058 res!321872) b!525059))

(assert (= (and b!525059 res!321877) b!525055))

(assert (= (and b!525059 (not res!321869)) b!525054))

(assert (= (and b!525054 (not res!321868)) b!525057))

(assert (= (and b!525057 c!61895) b!525050))

(assert (= (and b!525057 (not c!61895)) b!525051))

(assert (= (and b!525050 res!321871) b!525046))

(declare-fun m!505685 () Bool)

(assert (=> start!47726 m!505685))

(declare-fun m!505687 () Bool)

(assert (=> start!47726 m!505687))

(declare-fun m!505689 () Bool)

(assert (=> b!525055 m!505689))

(assert (=> b!525055 m!505689))

(declare-fun m!505691 () Bool)

(assert (=> b!525055 m!505691))

(declare-fun m!505693 () Bool)

(assert (=> b!525056 m!505693))

(declare-fun m!505695 () Bool)

(assert (=> b!525050 m!505695))

(declare-fun m!505697 () Bool)

(assert (=> b!525050 m!505697))

(declare-fun m!505699 () Bool)

(assert (=> b!525059 m!505699))

(declare-fun m!505701 () Bool)

(assert (=> b!525059 m!505701))

(declare-fun m!505703 () Bool)

(assert (=> b!525059 m!505703))

(assert (=> b!525059 m!505689))

(declare-fun m!505705 () Bool)

(assert (=> b!525059 m!505705))

(assert (=> b!525059 m!505689))

(declare-fun m!505707 () Bool)

(assert (=> b!525059 m!505707))

(assert (=> b!525059 m!505689))

(declare-fun m!505709 () Bool)

(assert (=> b!525059 m!505709))

(declare-fun m!505711 () Bool)

(assert (=> b!525059 m!505711))

(declare-fun m!505713 () Bool)

(assert (=> b!525059 m!505713))

(declare-fun m!505715 () Bool)

(assert (=> b!525057 m!505715))

(declare-fun m!505717 () Bool)

(assert (=> b!525057 m!505717))

(assert (=> b!525057 m!505689))

(assert (=> b!525049 m!505689))

(assert (=> b!525049 m!505689))

(declare-fun m!505719 () Bool)

(assert (=> b!525049 m!505719))

(declare-fun m!505721 () Bool)

(assert (=> b!525053 m!505721))

(declare-fun m!505723 () Bool)

(assert (=> b!525047 m!505723))

(declare-fun m!505725 () Bool)

(assert (=> b!525048 m!505725))

(declare-fun m!505727 () Bool)

(assert (=> b!525058 m!505727))

(check-sat (not start!47726) (not b!525058) (not b!525048) (not b!525057) (not b!525056) (not b!525049) (not b!525050) (not b!525047) (not b!525055) (not b!525053) (not b!525059))
(check-sat)
