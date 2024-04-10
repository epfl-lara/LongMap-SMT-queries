; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28968 () Bool)

(assert start!28968)

(declare-fun b!294672 () Bool)

(declare-fun res!154903 () Bool)

(declare-fun e!186272 () Bool)

(assert (=> b!294672 (=> (not res!154903) (not e!186272))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294672 (= res!154903 (validKeyInArray!0 k0!2524))))

(declare-fun e!186274 () Bool)

(declare-fun b!294673 () Bool)

(declare-datatypes ((array!14906 0))(
  ( (array!14907 (arr!7068 (Array (_ BitVec 32) (_ BitVec 64))) (size!7420 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14906)

(declare-fun lt!146082 () Bool)

(declare-datatypes ((SeekEntryResult!2217 0))(
  ( (MissingZero!2217 (index!11038 (_ BitVec 32))) (Found!2217 (index!11039 (_ BitVec 32))) (Intermediate!2217 (undefined!3029 Bool) (index!11040 (_ BitVec 32)) (x!29243 (_ BitVec 32))) (Undefined!2217) (MissingVacant!2217 (index!11041 (_ BitVec 32))) )
))
(declare-fun lt!146085 () SeekEntryResult!2217)

(get-info :version)

(assert (=> b!294673 (= e!186274 (and lt!146082 (let ((bdg!6241 (not ((_ is Intermediate!2217) lt!146085)))) (and (or bdg!6241 (not (undefined!3029 lt!146085))) (or bdg!6241 (not (= (select (arr!7068 a!3312) (index!11040 lt!146085)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6241 (not (= (select (arr!7068 a!3312) (index!11040 lt!146085)) k0!2524))) (not bdg!6241) (or (bvslt (index!11040 lt!146085) #b00000000000000000000000000000000) (bvsge (index!11040 lt!146085) (size!7420 a!3312)))))))))

(declare-fun lt!146084 () SeekEntryResult!2217)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146081 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14906 (_ BitVec 32)) SeekEntryResult!2217)

(assert (=> b!294673 (= lt!146084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146081 k0!2524 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)) mask!3809))))

(assert (=> b!294673 (= lt!146085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146081 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294673 (= lt!146081 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294674 () Bool)

(assert (=> b!294674 (= e!186272 e!186274)))

(declare-fun res!154904 () Bool)

(assert (=> b!294674 (=> (not res!154904) (not e!186274))))

(declare-fun lt!146083 () SeekEntryResult!2217)

(assert (=> b!294674 (= res!154904 (or lt!146082 (= lt!146083 (MissingVacant!2217 i!1256))))))

(assert (=> b!294674 (= lt!146082 (= lt!146083 (MissingZero!2217 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14906 (_ BitVec 32)) SeekEntryResult!2217)

(assert (=> b!294674 (= lt!146083 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294675 () Bool)

(declare-fun res!154906 () Bool)

(assert (=> b!294675 (=> (not res!154906) (not e!186272))))

(assert (=> b!294675 (= res!154906 (and (= (size!7420 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7420 a!3312))))))

(declare-fun res!154908 () Bool)

(assert (=> start!28968 (=> (not res!154908) (not e!186272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28968 (= res!154908 (validMask!0 mask!3809))))

(assert (=> start!28968 e!186272))

(assert (=> start!28968 true))

(declare-fun array_inv!5031 (array!14906) Bool)

(assert (=> start!28968 (array_inv!5031 a!3312)))

(declare-fun b!294676 () Bool)

(declare-fun res!154907 () Bool)

(assert (=> b!294676 (=> (not res!154907) (not e!186272))))

(declare-fun arrayContainsKey!0 (array!14906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294676 (= res!154907 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294677 () Bool)

(declare-fun res!154905 () Bool)

(assert (=> b!294677 (=> (not res!154905) (not e!186274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14906 (_ BitVec 32)) Bool)

(assert (=> b!294677 (= res!154905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28968 res!154908) b!294675))

(assert (= (and b!294675 res!154906) b!294672))

(assert (= (and b!294672 res!154903) b!294676))

(assert (= (and b!294676 res!154907) b!294674))

(assert (= (and b!294674 res!154904) b!294677))

(assert (= (and b!294677 res!154905) b!294673))

(declare-fun m!308053 () Bool)

(assert (=> b!294672 m!308053))

(declare-fun m!308055 () Bool)

(assert (=> b!294673 m!308055))

(declare-fun m!308057 () Bool)

(assert (=> b!294673 m!308057))

(declare-fun m!308059 () Bool)

(assert (=> b!294673 m!308059))

(declare-fun m!308061 () Bool)

(assert (=> b!294673 m!308061))

(declare-fun m!308063 () Bool)

(assert (=> b!294673 m!308063))

(declare-fun m!308065 () Bool)

(assert (=> b!294674 m!308065))

(declare-fun m!308067 () Bool)

(assert (=> b!294676 m!308067))

(declare-fun m!308069 () Bool)

(assert (=> start!28968 m!308069))

(declare-fun m!308071 () Bool)

(assert (=> start!28968 m!308071))

(declare-fun m!308073 () Bool)

(assert (=> b!294677 m!308073))

(check-sat (not start!28968) (not b!294676) (not b!294673) (not b!294672) (not b!294674) (not b!294677))
(check-sat)
(get-model)

(declare-fun b!294708 () Bool)

(declare-fun e!186290 () SeekEntryResult!2217)

(declare-fun lt!146107 () SeekEntryResult!2217)

(assert (=> b!294708 (= e!186290 (Found!2217 (index!11040 lt!146107)))))

(declare-fun e!186291 () SeekEntryResult!2217)

(declare-fun b!294709 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14906 (_ BitVec 32)) SeekEntryResult!2217)

(assert (=> b!294709 (= e!186291 (seekKeyOrZeroReturnVacant!0 (x!29243 lt!146107) (index!11040 lt!146107) (index!11040 lt!146107) k0!2524 a!3312 mask!3809))))

(declare-fun d!66851 () Bool)

(declare-fun lt!146108 () SeekEntryResult!2217)

(assert (=> d!66851 (and (or ((_ is Undefined!2217) lt!146108) (not ((_ is Found!2217) lt!146108)) (and (bvsge (index!11039 lt!146108) #b00000000000000000000000000000000) (bvslt (index!11039 lt!146108) (size!7420 a!3312)))) (or ((_ is Undefined!2217) lt!146108) ((_ is Found!2217) lt!146108) (not ((_ is MissingZero!2217) lt!146108)) (and (bvsge (index!11038 lt!146108) #b00000000000000000000000000000000) (bvslt (index!11038 lt!146108) (size!7420 a!3312)))) (or ((_ is Undefined!2217) lt!146108) ((_ is Found!2217) lt!146108) ((_ is MissingZero!2217) lt!146108) (not ((_ is MissingVacant!2217) lt!146108)) (and (bvsge (index!11041 lt!146108) #b00000000000000000000000000000000) (bvslt (index!11041 lt!146108) (size!7420 a!3312)))) (or ((_ is Undefined!2217) lt!146108) (ite ((_ is Found!2217) lt!146108) (= (select (arr!7068 a!3312) (index!11039 lt!146108)) k0!2524) (ite ((_ is MissingZero!2217) lt!146108) (= (select (arr!7068 a!3312) (index!11038 lt!146108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2217) lt!146108) (= (select (arr!7068 a!3312) (index!11041 lt!146108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!186292 () SeekEntryResult!2217)

(assert (=> d!66851 (= lt!146108 e!186292)))

(declare-fun c!47466 () Bool)

(assert (=> d!66851 (= c!47466 (and ((_ is Intermediate!2217) lt!146107) (undefined!3029 lt!146107)))))

(assert (=> d!66851 (= lt!146107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66851 (validMask!0 mask!3809)))

(assert (=> d!66851 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146108)))

(declare-fun b!294710 () Bool)

(assert (=> b!294710 (= e!186292 Undefined!2217)))

(declare-fun b!294711 () Bool)

(assert (=> b!294711 (= e!186292 e!186290)))

(declare-fun lt!146109 () (_ BitVec 64))

(assert (=> b!294711 (= lt!146109 (select (arr!7068 a!3312) (index!11040 lt!146107)))))

(declare-fun c!47465 () Bool)

(assert (=> b!294711 (= c!47465 (= lt!146109 k0!2524))))

(declare-fun b!294712 () Bool)

(assert (=> b!294712 (= e!186291 (MissingZero!2217 (index!11040 lt!146107)))))

(declare-fun b!294713 () Bool)

(declare-fun c!47464 () Bool)

(assert (=> b!294713 (= c!47464 (= lt!146109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294713 (= e!186290 e!186291)))

(assert (= (and d!66851 c!47466) b!294710))

(assert (= (and d!66851 (not c!47466)) b!294711))

(assert (= (and b!294711 c!47465) b!294708))

(assert (= (and b!294711 (not c!47465)) b!294713))

(assert (= (and b!294713 c!47464) b!294712))

(assert (= (and b!294713 (not c!47464)) b!294709))

(declare-fun m!308097 () Bool)

(assert (=> b!294709 m!308097))

(assert (=> d!66851 m!308069))

(declare-fun m!308099 () Bool)

(assert (=> d!66851 m!308099))

(assert (=> d!66851 m!308059))

(declare-fun m!308101 () Bool)

(assert (=> d!66851 m!308101))

(assert (=> d!66851 m!308059))

(declare-fun m!308103 () Bool)

(assert (=> d!66851 m!308103))

(declare-fun m!308105 () Bool)

(assert (=> d!66851 m!308105))

(declare-fun m!308107 () Bool)

(assert (=> b!294711 m!308107))

(assert (=> b!294674 d!66851))

(declare-fun b!294762 () Bool)

(declare-fun e!186331 () SeekEntryResult!2217)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294762 (= e!186331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146081 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)) mask!3809))))

(declare-fun b!294763 () Bool)

(assert (=> b!294763 (= e!186331 (Intermediate!2217 false lt!146081 #b00000000000000000000000000000000))))

(declare-fun b!294764 () Bool)

(declare-fun e!186328 () SeekEntryResult!2217)

(assert (=> b!294764 (= e!186328 e!186331)))

(declare-fun c!47481 () Bool)

(declare-fun lt!146132 () (_ BitVec 64))

(assert (=> b!294764 (= c!47481 (or (= lt!146132 k0!2524) (= (bvadd lt!146132 lt!146132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294765 () Bool)

(declare-fun lt!146133 () SeekEntryResult!2217)

(assert (=> b!294765 (and (bvsge (index!11040 lt!146133) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146133) (size!7420 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)))))))

(declare-fun res!154952 () Bool)

(assert (=> b!294765 (= res!154952 (= (select (arr!7068 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312))) (index!11040 lt!146133)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186330 () Bool)

(assert (=> b!294765 (=> res!154952 e!186330)))

(declare-fun b!294766 () Bool)

(assert (=> b!294766 (and (bvsge (index!11040 lt!146133) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146133) (size!7420 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)))))))

(assert (=> b!294766 (= e!186330 (= (select (arr!7068 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312))) (index!11040 lt!146133)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294767 () Bool)

(declare-fun e!186327 () Bool)

(declare-fun e!186329 () Bool)

(assert (=> b!294767 (= e!186327 e!186329)))

(declare-fun res!154951 () Bool)

(assert (=> b!294767 (= res!154951 (and ((_ is Intermediate!2217) lt!146133) (not (undefined!3029 lt!146133)) (bvslt (x!29243 lt!146133) #b01111111111111111111111111111110) (bvsge (x!29243 lt!146133) #b00000000000000000000000000000000) (bvsge (x!29243 lt!146133) #b00000000000000000000000000000000)))))

(assert (=> b!294767 (=> (not res!154951) (not e!186329))))

(declare-fun b!294769 () Bool)

(assert (=> b!294769 (and (bvsge (index!11040 lt!146133) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146133) (size!7420 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)))))))

(declare-fun res!154953 () Bool)

(assert (=> b!294769 (= res!154953 (= (select (arr!7068 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312))) (index!11040 lt!146133)) k0!2524))))

(assert (=> b!294769 (=> res!154953 e!186330)))

(assert (=> b!294769 (= e!186329 e!186330)))

(declare-fun b!294770 () Bool)

(assert (=> b!294770 (= e!186328 (Intermediate!2217 true lt!146081 #b00000000000000000000000000000000))))

(declare-fun d!66853 () Bool)

(assert (=> d!66853 e!186327))

(declare-fun c!47480 () Bool)

(assert (=> d!66853 (= c!47480 (and ((_ is Intermediate!2217) lt!146133) (undefined!3029 lt!146133)))))

(assert (=> d!66853 (= lt!146133 e!186328)))

(declare-fun c!47479 () Bool)

(assert (=> d!66853 (= c!47479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66853 (= lt!146132 (select (arr!7068 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312))) lt!146081))))

(assert (=> d!66853 (validMask!0 mask!3809)))

(assert (=> d!66853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146081 k0!2524 (array!14907 (store (arr!7068 a!3312) i!1256 k0!2524) (size!7420 a!3312)) mask!3809) lt!146133)))

(declare-fun b!294768 () Bool)

(assert (=> b!294768 (= e!186327 (bvsge (x!29243 lt!146133) #b01111111111111111111111111111110))))

(assert (= (and d!66853 c!47479) b!294770))

(assert (= (and d!66853 (not c!47479)) b!294764))

(assert (= (and b!294764 c!47481) b!294763))

(assert (= (and b!294764 (not c!47481)) b!294762))

(assert (= (and d!66853 c!47480) b!294768))

(assert (= (and d!66853 (not c!47480)) b!294767))

(assert (= (and b!294767 res!154951) b!294769))

(assert (= (and b!294769 (not res!154953)) b!294765))

(assert (= (and b!294765 (not res!154952)) b!294766))

(declare-fun m!308135 () Bool)

(assert (=> b!294766 m!308135))

(assert (=> b!294769 m!308135))

(declare-fun m!308137 () Bool)

(assert (=> d!66853 m!308137))

(assert (=> d!66853 m!308069))

(declare-fun m!308139 () Bool)

(assert (=> b!294762 m!308139))

(assert (=> b!294762 m!308139))

(declare-fun m!308141 () Bool)

(assert (=> b!294762 m!308141))

(assert (=> b!294765 m!308135))

(assert (=> b!294673 d!66853))

(declare-fun b!294771 () Bool)

(declare-fun e!186336 () SeekEntryResult!2217)

(assert (=> b!294771 (= e!186336 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146081 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294772 () Bool)

(assert (=> b!294772 (= e!186336 (Intermediate!2217 false lt!146081 #b00000000000000000000000000000000))))

(declare-fun b!294773 () Bool)

(declare-fun e!186333 () SeekEntryResult!2217)

(assert (=> b!294773 (= e!186333 e!186336)))

(declare-fun c!47484 () Bool)

(declare-fun lt!146134 () (_ BitVec 64))

(assert (=> b!294773 (= c!47484 (or (= lt!146134 k0!2524) (= (bvadd lt!146134 lt!146134) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294774 () Bool)

(declare-fun lt!146135 () SeekEntryResult!2217)

(assert (=> b!294774 (and (bvsge (index!11040 lt!146135) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146135) (size!7420 a!3312)))))

(declare-fun res!154955 () Bool)

(assert (=> b!294774 (= res!154955 (= (select (arr!7068 a!3312) (index!11040 lt!146135)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186335 () Bool)

(assert (=> b!294774 (=> res!154955 e!186335)))

(declare-fun b!294775 () Bool)

(assert (=> b!294775 (and (bvsge (index!11040 lt!146135) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146135) (size!7420 a!3312)))))

(assert (=> b!294775 (= e!186335 (= (select (arr!7068 a!3312) (index!11040 lt!146135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294776 () Bool)

(declare-fun e!186332 () Bool)

(declare-fun e!186334 () Bool)

(assert (=> b!294776 (= e!186332 e!186334)))

(declare-fun res!154954 () Bool)

(assert (=> b!294776 (= res!154954 (and ((_ is Intermediate!2217) lt!146135) (not (undefined!3029 lt!146135)) (bvslt (x!29243 lt!146135) #b01111111111111111111111111111110) (bvsge (x!29243 lt!146135) #b00000000000000000000000000000000) (bvsge (x!29243 lt!146135) #b00000000000000000000000000000000)))))

(assert (=> b!294776 (=> (not res!154954) (not e!186334))))

(declare-fun b!294778 () Bool)

(assert (=> b!294778 (and (bvsge (index!11040 lt!146135) #b00000000000000000000000000000000) (bvslt (index!11040 lt!146135) (size!7420 a!3312)))))

(declare-fun res!154956 () Bool)

(assert (=> b!294778 (= res!154956 (= (select (arr!7068 a!3312) (index!11040 lt!146135)) k0!2524))))

(assert (=> b!294778 (=> res!154956 e!186335)))

(assert (=> b!294778 (= e!186334 e!186335)))

(declare-fun b!294779 () Bool)

(assert (=> b!294779 (= e!186333 (Intermediate!2217 true lt!146081 #b00000000000000000000000000000000))))

(declare-fun d!66869 () Bool)

(assert (=> d!66869 e!186332))

(declare-fun c!47483 () Bool)

(assert (=> d!66869 (= c!47483 (and ((_ is Intermediate!2217) lt!146135) (undefined!3029 lt!146135)))))

(assert (=> d!66869 (= lt!146135 e!186333)))

(declare-fun c!47482 () Bool)

(assert (=> d!66869 (= c!47482 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66869 (= lt!146134 (select (arr!7068 a!3312) lt!146081))))

(assert (=> d!66869 (validMask!0 mask!3809)))

(assert (=> d!66869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146081 k0!2524 a!3312 mask!3809) lt!146135)))

(declare-fun b!294777 () Bool)

(assert (=> b!294777 (= e!186332 (bvsge (x!29243 lt!146135) #b01111111111111111111111111111110))))

(assert (= (and d!66869 c!47482) b!294779))

(assert (= (and d!66869 (not c!47482)) b!294773))

(assert (= (and b!294773 c!47484) b!294772))

(assert (= (and b!294773 (not c!47484)) b!294771))

(assert (= (and d!66869 c!47483) b!294777))

(assert (= (and d!66869 (not c!47483)) b!294776))

(assert (= (and b!294776 res!154954) b!294778))

(assert (= (and b!294778 (not res!154956)) b!294774))

(assert (= (and b!294774 (not res!154955)) b!294775))

(declare-fun m!308143 () Bool)

(assert (=> b!294775 m!308143))

(assert (=> b!294778 m!308143))

(declare-fun m!308145 () Bool)

(assert (=> d!66869 m!308145))

(assert (=> d!66869 m!308069))

(assert (=> b!294771 m!308139))

(assert (=> b!294771 m!308139))

(declare-fun m!308147 () Bool)

(assert (=> b!294771 m!308147))

(assert (=> b!294774 m!308143))

(assert (=> b!294673 d!66869))

(declare-fun d!66871 () Bool)

(declare-fun lt!146141 () (_ BitVec 32))

(declare-fun lt!146140 () (_ BitVec 32))

(assert (=> d!66871 (= lt!146141 (bvmul (bvxor lt!146140 (bvlshr lt!146140 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66871 (= lt!146140 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66871 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154957 (let ((h!5283 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29246 (bvmul (bvxor h!5283 (bvlshr h!5283 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29246 (bvlshr x!29246 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154957 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154957 #b00000000000000000000000000000000))))))

(assert (=> d!66871 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146141 (bvlshr lt!146141 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294673 d!66871))

(declare-fun d!66873 () Bool)

(assert (=> d!66873 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294672 d!66873))

(declare-fun bm!25714 () Bool)

(declare-fun call!25717 () Bool)

(assert (=> bm!25714 (= call!25717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294842 () Bool)

(declare-fun e!186372 () Bool)

(declare-fun e!186374 () Bool)

(assert (=> b!294842 (= e!186372 e!186374)))

(declare-fun lt!146166 () (_ BitVec 64))

(assert (=> b!294842 (= lt!146166 (select (arr!7068 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9212 0))(
  ( (Unit!9213) )
))
(declare-fun lt!146165 () Unit!9212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14906 (_ BitVec 64) (_ BitVec 32)) Unit!9212)

(assert (=> b!294842 (= lt!146165 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146166 #b00000000000000000000000000000000))))

(assert (=> b!294842 (arrayContainsKey!0 a!3312 lt!146166 #b00000000000000000000000000000000)))

(declare-fun lt!146167 () Unit!9212)

(assert (=> b!294842 (= lt!146167 lt!146165)))

(declare-fun res!154975 () Bool)

(assert (=> b!294842 (= res!154975 (= (seekEntryOrOpen!0 (select (arr!7068 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2217 #b00000000000000000000000000000000)))))

(assert (=> b!294842 (=> (not res!154975) (not e!186374))))

(declare-fun b!294843 () Bool)

(assert (=> b!294843 (= e!186374 call!25717)))

(declare-fun d!66875 () Bool)

(declare-fun res!154976 () Bool)

(declare-fun e!186373 () Bool)

(assert (=> d!66875 (=> res!154976 e!186373)))

(assert (=> d!66875 (= res!154976 (bvsge #b00000000000000000000000000000000 (size!7420 a!3312)))))

(assert (=> d!66875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186373)))

(declare-fun b!294844 () Bool)

(assert (=> b!294844 (= e!186373 e!186372)))

(declare-fun c!47508 () Bool)

(assert (=> b!294844 (= c!47508 (validKeyInArray!0 (select (arr!7068 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294845 () Bool)

(assert (=> b!294845 (= e!186372 call!25717)))

(assert (= (and d!66875 (not res!154976)) b!294844))

(assert (= (and b!294844 c!47508) b!294842))

(assert (= (and b!294844 (not c!47508)) b!294845))

(assert (= (and b!294842 res!154975) b!294843))

(assert (= (or b!294843 b!294845) bm!25714))

(declare-fun m!308175 () Bool)

(assert (=> bm!25714 m!308175))

(declare-fun m!308177 () Bool)

(assert (=> b!294842 m!308177))

(declare-fun m!308179 () Bool)

(assert (=> b!294842 m!308179))

(declare-fun m!308181 () Bool)

(assert (=> b!294842 m!308181))

(assert (=> b!294842 m!308177))

(declare-fun m!308183 () Bool)

(assert (=> b!294842 m!308183))

(assert (=> b!294844 m!308177))

(assert (=> b!294844 m!308177))

(declare-fun m!308185 () Bool)

(assert (=> b!294844 m!308185))

(assert (=> b!294677 d!66875))

(declare-fun d!66883 () Bool)

(declare-fun res!154981 () Bool)

(declare-fun e!186379 () Bool)

(assert (=> d!66883 (=> res!154981 e!186379)))

(assert (=> d!66883 (= res!154981 (= (select (arr!7068 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66883 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186379)))

(declare-fun b!294850 () Bool)

(declare-fun e!186380 () Bool)

(assert (=> b!294850 (= e!186379 e!186380)))

(declare-fun res!154982 () Bool)

(assert (=> b!294850 (=> (not res!154982) (not e!186380))))

(assert (=> b!294850 (= res!154982 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7420 a!3312)))))

(declare-fun b!294851 () Bool)

(assert (=> b!294851 (= e!186380 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66883 (not res!154981)) b!294850))

(assert (= (and b!294850 res!154982) b!294851))

(assert (=> d!66883 m!308177))

(declare-fun m!308187 () Bool)

(assert (=> b!294851 m!308187))

(assert (=> b!294676 d!66883))

(declare-fun d!66885 () Bool)

(assert (=> d!66885 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28968 d!66885))

(declare-fun d!66891 () Bool)

(assert (=> d!66891 (= (array_inv!5031 a!3312) (bvsge (size!7420 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28968 d!66891))

(check-sat (not b!294844) (not b!294762) (not d!66853) (not b!294709) (not bm!25714) (not d!66851) (not b!294771) (not b!294851) (not d!66869) (not b!294842))
(check-sat)
