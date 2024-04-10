; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28858 () Bool)

(assert start!28858)

(declare-fun b!294114 () Bool)

(declare-fun res!154629 () Bool)

(declare-fun e!185947 () Bool)

(assert (=> b!294114 (=> (not res!154629) (not e!185947))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14886 0))(
  ( (array!14887 (arr!7061 (Array (_ BitVec 32) (_ BitVec 64))) (size!7413 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14886)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!294114 (= res!154629 (and (= (size!7413 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7413 a!3312))))))

(declare-fun b!294115 () Bool)

(declare-fun res!154631 () Bool)

(assert (=> b!294115 (=> (not res!154631) (not e!185947))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294115 (= res!154631 (validKeyInArray!0 k!2524))))

(declare-fun b!294116 () Bool)

(declare-fun e!185945 () Bool)

(assert (=> b!294116 (= e!185947 e!185945)))

(declare-fun res!154630 () Bool)

(assert (=> b!294116 (=> (not res!154630) (not e!185945))))

(declare-fun lt!145787 () Bool)

(declare-datatypes ((SeekEntryResult!2210 0))(
  ( (MissingZero!2210 (index!11010 (_ BitVec 32))) (Found!2210 (index!11011 (_ BitVec 32))) (Intermediate!2210 (undefined!3022 Bool) (index!11012 (_ BitVec 32)) (x!29208 (_ BitVec 32))) (Undefined!2210) (MissingVacant!2210 (index!11013 (_ BitVec 32))) )
))
(declare-fun lt!145785 () SeekEntryResult!2210)

(assert (=> b!294116 (= res!154630 (or lt!145787 (= lt!145785 (MissingVacant!2210 i!1256))))))

(assert (=> b!294116 (= lt!145787 (= lt!145785 (MissingZero!2210 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14886 (_ BitVec 32)) SeekEntryResult!2210)

(assert (=> b!294116 (= lt!145785 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!294117 () Bool)

(declare-fun res!154632 () Bool)

(assert (=> b!294117 (=> (not res!154632) (not e!185947))))

(declare-fun arrayContainsKey!0 (array!14886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294117 (= res!154632 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun lt!145784 () SeekEntryResult!2210)

(declare-fun b!294118 () Bool)

(assert (=> b!294118 (= e!185945 (and lt!145787 (let ((bdg!6229 (not (is-Intermediate!2210 lt!145784)))) (and (or bdg!6229 (not (undefined!3022 lt!145784))) (or bdg!6229 (not (= (select (arr!7061 a!3312) (index!11012 lt!145784)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6229) (or (bvslt (index!11012 lt!145784) #b00000000000000000000000000000000) (bvsge (index!11012 lt!145784) (size!7413 a!3312)))))))))

(declare-fun lt!145786 () SeekEntryResult!2210)

(declare-fun lt!145788 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14886 (_ BitVec 32)) SeekEntryResult!2210)

(assert (=> b!294118 (= lt!145786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145788 k!2524 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)) mask!3809))))

(assert (=> b!294118 (= lt!145784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145788 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294118 (= lt!145788 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294119 () Bool)

(declare-fun res!154628 () Bool)

(assert (=> b!294119 (=> (not res!154628) (not e!185945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14886 (_ BitVec 32)) Bool)

(assert (=> b!294119 (= res!154628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!154627 () Bool)

(assert (=> start!28858 (=> (not res!154627) (not e!185947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28858 (= res!154627 (validMask!0 mask!3809))))

(assert (=> start!28858 e!185947))

(assert (=> start!28858 true))

(declare-fun array_inv!5024 (array!14886) Bool)

(assert (=> start!28858 (array_inv!5024 a!3312)))

(assert (= (and start!28858 res!154627) b!294114))

(assert (= (and b!294114 res!154629) b!294115))

(assert (= (and b!294115 res!154631) b!294117))

(assert (= (and b!294117 res!154632) b!294116))

(assert (= (and b!294116 res!154630) b!294119))

(assert (= (and b!294119 res!154628) b!294118))

(declare-fun m!307659 () Bool)

(assert (=> b!294116 m!307659))

(declare-fun m!307661 () Bool)

(assert (=> start!28858 m!307661))

(declare-fun m!307663 () Bool)

(assert (=> start!28858 m!307663))

(declare-fun m!307665 () Bool)

(assert (=> b!294118 m!307665))

(declare-fun m!307667 () Bool)

(assert (=> b!294118 m!307667))

(declare-fun m!307669 () Bool)

(assert (=> b!294118 m!307669))

(declare-fun m!307671 () Bool)

(assert (=> b!294118 m!307671))

(declare-fun m!307673 () Bool)

(assert (=> b!294118 m!307673))

(declare-fun m!307675 () Bool)

(assert (=> b!294119 m!307675))

(declare-fun m!307677 () Bool)

(assert (=> b!294117 m!307677))

(declare-fun m!307679 () Bool)

(assert (=> b!294115 m!307679))

(push 1)

(assert (not b!294117))

(assert (not b!294119))

(assert (not start!28858))

(assert (not b!294115))

(assert (not b!294118))

(assert (not b!294116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66743 () Bool)

(assert (=> d!66743 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294115 d!66743))

(declare-fun b!294204 () Bool)

(declare-fun e!185992 () SeekEntryResult!2210)

(declare-fun lt!145845 () SeekEntryResult!2210)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14886 (_ BitVec 32)) SeekEntryResult!2210)

(assert (=> b!294204 (= e!185992 (seekKeyOrZeroReturnVacant!0 (x!29208 lt!145845) (index!11012 lt!145845) (index!11012 lt!145845) k!2524 a!3312 mask!3809))))

(declare-fun d!66745 () Bool)

(declare-fun lt!145843 () SeekEntryResult!2210)

(assert (=> d!66745 (and (or (is-Undefined!2210 lt!145843) (not (is-Found!2210 lt!145843)) (and (bvsge (index!11011 lt!145843) #b00000000000000000000000000000000) (bvslt (index!11011 lt!145843) (size!7413 a!3312)))) (or (is-Undefined!2210 lt!145843) (is-Found!2210 lt!145843) (not (is-MissingZero!2210 lt!145843)) (and (bvsge (index!11010 lt!145843) #b00000000000000000000000000000000) (bvslt (index!11010 lt!145843) (size!7413 a!3312)))) (or (is-Undefined!2210 lt!145843) (is-Found!2210 lt!145843) (is-MissingZero!2210 lt!145843) (not (is-MissingVacant!2210 lt!145843)) (and (bvsge (index!11013 lt!145843) #b00000000000000000000000000000000) (bvslt (index!11013 lt!145843) (size!7413 a!3312)))) (or (is-Undefined!2210 lt!145843) (ite (is-Found!2210 lt!145843) (= (select (arr!7061 a!3312) (index!11011 lt!145843)) k!2524) (ite (is-MissingZero!2210 lt!145843) (= (select (arr!7061 a!3312) (index!11010 lt!145843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2210 lt!145843) (= (select (arr!7061 a!3312) (index!11013 lt!145843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185991 () SeekEntryResult!2210)

(assert (=> d!66745 (= lt!145843 e!185991)))

(declare-fun c!47339 () Bool)

(assert (=> d!66745 (= c!47339 (and (is-Intermediate!2210 lt!145845) (undefined!3022 lt!145845)))))

(assert (=> d!66745 (= lt!145845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66745 (validMask!0 mask!3809)))

(assert (=> d!66745 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145843)))

(declare-fun b!294205 () Bool)

(assert (=> b!294205 (= e!185992 (MissingZero!2210 (index!11012 lt!145845)))))

(declare-fun b!294206 () Bool)

(assert (=> b!294206 (= e!185991 Undefined!2210)))

(declare-fun b!294207 () Bool)

(declare-fun c!47340 () Bool)

(declare-fun lt!145844 () (_ BitVec 64))

(assert (=> b!294207 (= c!47340 (= lt!145844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185990 () SeekEntryResult!2210)

(assert (=> b!294207 (= e!185990 e!185992)))

(declare-fun b!294208 () Bool)

(assert (=> b!294208 (= e!185991 e!185990)))

(assert (=> b!294208 (= lt!145844 (select (arr!7061 a!3312) (index!11012 lt!145845)))))

(declare-fun c!47338 () Bool)

(assert (=> b!294208 (= c!47338 (= lt!145844 k!2524))))

(declare-fun b!294209 () Bool)

(assert (=> b!294209 (= e!185990 (Found!2210 (index!11012 lt!145845)))))

(assert (= (and d!66745 c!47339) b!294206))

(assert (= (and d!66745 (not c!47339)) b!294208))

(assert (= (and b!294208 c!47338) b!294209))

(assert (= (and b!294208 (not c!47338)) b!294207))

(assert (= (and b!294207 c!47340) b!294205))

(assert (= (and b!294207 (not c!47340)) b!294204))

(declare-fun m!307749 () Bool)

(assert (=> b!294204 m!307749))

(declare-fun m!307751 () Bool)

(assert (=> d!66745 m!307751))

(assert (=> d!66745 m!307661))

(assert (=> d!66745 m!307673))

(declare-fun m!307753 () Bool)

(assert (=> d!66745 m!307753))

(assert (=> d!66745 m!307673))

(declare-fun m!307755 () Bool)

(assert (=> d!66745 m!307755))

(declare-fun m!307757 () Bool)

(assert (=> d!66745 m!307757))

(declare-fun m!307759 () Bool)

(assert (=> b!294208 m!307759))

(assert (=> b!294116 d!66745))

(declare-fun d!66759 () Bool)

(declare-fun res!154673 () Bool)

(declare-fun e!185997 () Bool)

(assert (=> d!66759 (=> res!154673 e!185997)))

(assert (=> d!66759 (= res!154673 (= (select (arr!7061 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66759 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185997)))

(declare-fun b!294214 () Bool)

(declare-fun e!185998 () Bool)

(assert (=> b!294214 (= e!185997 e!185998)))

(declare-fun res!154674 () Bool)

(assert (=> b!294214 (=> (not res!154674) (not e!185998))))

(assert (=> b!294214 (= res!154674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7413 a!3312)))))

(declare-fun b!294215 () Bool)

(assert (=> b!294215 (= e!185998 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66759 (not res!154673)) b!294214))

(assert (= (and b!294214 res!154674) b!294215))

(declare-fun m!307761 () Bool)

(assert (=> d!66759 m!307761))

(declare-fun m!307763 () Bool)

(assert (=> b!294215 m!307763))

(assert (=> b!294117 d!66759))

(declare-fun d!66761 () Bool)

(assert (=> d!66761 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28858 d!66761))

(declare-fun d!66769 () Bool)

(assert (=> d!66769 (= (array_inv!5024 a!3312) (bvsge (size!7413 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28858 d!66769))

(declare-fun b!294314 () Bool)

(declare-fun e!186060 () Bool)

(declare-fun lt!145883 () SeekEntryResult!2210)

(assert (=> b!294314 (= e!186060 (bvsge (x!29208 lt!145883) #b01111111111111111111111111111110))))

(declare-fun b!294315 () Bool)

(declare-fun e!186063 () SeekEntryResult!2210)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294315 (= e!186063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145788 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)) mask!3809))))

(declare-fun b!294316 () Bool)

(declare-fun e!186061 () SeekEntryResult!2210)

(assert (=> b!294316 (= e!186061 (Intermediate!2210 true lt!145788 #b00000000000000000000000000000000))))

(declare-fun b!294317 () Bool)

(declare-fun e!186062 () Bool)

(assert (=> b!294317 (= e!186060 e!186062)))

(declare-fun res!154716 () Bool)

(assert (=> b!294317 (= res!154716 (and (is-Intermediate!2210 lt!145883) (not (undefined!3022 lt!145883)) (bvslt (x!29208 lt!145883) #b01111111111111111111111111111110) (bvsge (x!29208 lt!145883) #b00000000000000000000000000000000) (bvsge (x!29208 lt!145883) #b00000000000000000000000000000000)))))

(assert (=> b!294317 (=> (not res!154716) (not e!186062))))

(declare-fun b!294318 () Bool)

(assert (=> b!294318 (and (bvsge (index!11012 lt!145883) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145883) (size!7413 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)))))))

(declare-fun res!154718 () Bool)

(assert (=> b!294318 (= res!154718 (= (select (arr!7061 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312))) (index!11012 lt!145883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186064 () Bool)

(assert (=> b!294318 (=> res!154718 e!186064)))

(declare-fun b!294319 () Bool)

(assert (=> b!294319 (= e!186061 e!186063)))

(declare-fun c!47372 () Bool)

(declare-fun lt!145884 () (_ BitVec 64))

(assert (=> b!294319 (= c!47372 (or (= lt!145884 k!2524) (= (bvadd lt!145884 lt!145884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294320 () Bool)

(assert (=> b!294320 (and (bvsge (index!11012 lt!145883) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145883) (size!7413 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)))))))

(declare-fun res!154717 () Bool)

(assert (=> b!294320 (= res!154717 (= (select (arr!7061 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312))) (index!11012 lt!145883)) k!2524))))

(assert (=> b!294320 (=> res!154717 e!186064)))

(assert (=> b!294320 (= e!186062 e!186064)))

(declare-fun b!294321 () Bool)

(assert (=> b!294321 (= e!186063 (Intermediate!2210 false lt!145788 #b00000000000000000000000000000000))))

(declare-fun d!66771 () Bool)

(assert (=> d!66771 e!186060))

(declare-fun c!47370 () Bool)

(assert (=> d!66771 (= c!47370 (and (is-Intermediate!2210 lt!145883) (undefined!3022 lt!145883)))))

(assert (=> d!66771 (= lt!145883 e!186061)))

(declare-fun c!47371 () Bool)

(assert (=> d!66771 (= c!47371 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66771 (= lt!145884 (select (arr!7061 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312))) lt!145788))))

(assert (=> d!66771 (validMask!0 mask!3809)))

(assert (=> d!66771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145788 k!2524 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)) mask!3809) lt!145883)))

(declare-fun b!294322 () Bool)

(assert (=> b!294322 (and (bvsge (index!11012 lt!145883) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145883) (size!7413 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312)))))))

(assert (=> b!294322 (= e!186064 (= (select (arr!7061 (array!14887 (store (arr!7061 a!3312) i!1256 k!2524) (size!7413 a!3312))) (index!11012 lt!145883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66771 c!47371) b!294316))

(assert (= (and d!66771 (not c!47371)) b!294319))

(assert (= (and b!294319 c!47372) b!294321))

(assert (= (and b!294319 (not c!47372)) b!294315))

(assert (= (and d!66771 c!47370) b!294314))

(assert (= (and d!66771 (not c!47370)) b!294317))

(assert (= (and b!294317 res!154716) b!294320))

(assert (= (and b!294320 (not res!154717)) b!294318))

(assert (= (and b!294318 (not res!154718)) b!294322))

(declare-fun m!307805 () Bool)

(assert (=> b!294315 m!307805))

(assert (=> b!294315 m!307805))

(declare-fun m!307807 () Bool)

(assert (=> b!294315 m!307807))

(declare-fun m!307809 () Bool)

(assert (=> b!294320 m!307809))

(declare-fun m!307811 () Bool)

(assert (=> d!66771 m!307811))

(assert (=> d!66771 m!307661))

(assert (=> b!294318 m!307809))

(assert (=> b!294322 m!307809))

(assert (=> b!294118 d!66771))

(declare-fun b!294327 () Bool)

(declare-fun e!186068 () Bool)

(declare-fun lt!145888 () SeekEntryResult!2210)

(assert (=> b!294327 (= e!186068 (bvsge (x!29208 lt!145888) #b01111111111111111111111111111110))))

(declare-fun e!186071 () SeekEntryResult!2210)

(declare-fun b!294328 () Bool)

(assert (=> b!294328 (= e!186071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145788 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294329 () Bool)

(declare-fun e!186069 () SeekEntryResult!2210)

(assert (=> b!294329 (= e!186069 (Intermediate!2210 true lt!145788 #b00000000000000000000000000000000))))

(declare-fun b!294330 () Bool)

(declare-fun e!186070 () Bool)

(assert (=> b!294330 (= e!186068 e!186070)))

(declare-fun res!154721 () Bool)

(assert (=> b!294330 (= res!154721 (and (is-Intermediate!2210 lt!145888) (not (undefined!3022 lt!145888)) (bvslt (x!29208 lt!145888) #b01111111111111111111111111111110) (bvsge (x!29208 lt!145888) #b00000000000000000000000000000000) (bvsge (x!29208 lt!145888) #b00000000000000000000000000000000)))))

(assert (=> b!294330 (=> (not res!154721) (not e!186070))))

(declare-fun b!294331 () Bool)

(assert (=> b!294331 (and (bvsge (index!11012 lt!145888) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145888) (size!7413 a!3312)))))

(declare-fun res!154723 () Bool)

(assert (=> b!294331 (= res!154723 (= (select (arr!7061 a!3312) (index!11012 lt!145888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186072 () Bool)

(assert (=> b!294331 (=> res!154723 e!186072)))

(declare-fun b!294332 () Bool)

(assert (=> b!294332 (= e!186069 e!186071)))

(declare-fun c!47376 () Bool)

(declare-fun lt!145889 () (_ BitVec 64))

(assert (=> b!294332 (= c!47376 (or (= lt!145889 k!2524) (= (bvadd lt!145889 lt!145889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294333 () Bool)

(assert (=> b!294333 (and (bvsge (index!11012 lt!145888) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145888) (size!7413 a!3312)))))

(declare-fun res!154722 () Bool)

(assert (=> b!294333 (= res!154722 (= (select (arr!7061 a!3312) (index!11012 lt!145888)) k!2524))))

(assert (=> b!294333 (=> res!154722 e!186072)))

(assert (=> b!294333 (= e!186070 e!186072)))

(declare-fun b!294334 () Bool)

(assert (=> b!294334 (= e!186071 (Intermediate!2210 false lt!145788 #b00000000000000000000000000000000))))

(declare-fun d!66783 () Bool)

(assert (=> d!66783 e!186068))

(declare-fun c!47374 () Bool)

(assert (=> d!66783 (= c!47374 (and (is-Intermediate!2210 lt!145888) (undefined!3022 lt!145888)))))

(assert (=> d!66783 (= lt!145888 e!186069)))

(declare-fun c!47375 () Bool)

(assert (=> d!66783 (= c!47375 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66783 (= lt!145889 (select (arr!7061 a!3312) lt!145788))))

(assert (=> d!66783 (validMask!0 mask!3809)))

(assert (=> d!66783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145788 k!2524 a!3312 mask!3809) lt!145888)))

(declare-fun b!294335 () Bool)

(assert (=> b!294335 (and (bvsge (index!11012 lt!145888) #b00000000000000000000000000000000) (bvslt (index!11012 lt!145888) (size!7413 a!3312)))))

(assert (=> b!294335 (= e!186072 (= (select (arr!7061 a!3312) (index!11012 lt!145888)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66783 c!47375) b!294329))

(assert (= (and d!66783 (not c!47375)) b!294332))

(assert (= (and b!294332 c!47376) b!294334))

(assert (= (and b!294332 (not c!47376)) b!294328))

(assert (= (and d!66783 c!47374) b!294327))

(assert (= (and d!66783 (not c!47374)) b!294330))

(assert (= (and b!294330 res!154721) b!294333))

(assert (= (and b!294333 (not res!154722)) b!294331))

(assert (= (and b!294331 (not res!154723)) b!294335))

(assert (=> b!294328 m!307805))

(assert (=> b!294328 m!307805))

(declare-fun m!307813 () Bool)

(assert (=> b!294328 m!307813))

(declare-fun m!307815 () Bool)

(assert (=> b!294333 m!307815))

(declare-fun m!307817 () Bool)

(assert (=> d!66783 m!307817))

(assert (=> d!66783 m!307661))

(assert (=> b!294331 m!307815))

(assert (=> b!294335 m!307815))

(assert (=> b!294118 d!66783))

(declare-fun d!66785 () Bool)

(declare-fun lt!145899 () (_ BitVec 32))

(declare-fun lt!145898 () (_ BitVec 32))

(assert (=> d!66785 (= lt!145899 (bvmul (bvxor lt!145898 (bvlshr lt!145898 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66785 (= lt!145898 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66785 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154728 (let ((h!5278 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29215 (bvmul (bvxor h!5278 (bvlshr h!5278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29215 (bvlshr x!29215 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154728 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154728 #b00000000000000000000000000000000))))))

(assert (=> d!66785 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145899 (bvlshr lt!145899 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294118 d!66785))

(declare-fun d!66791 () Bool)

(declare-fun res!154743 () Bool)

(declare-fun e!186096 () Bool)

(assert (=> d!66791 (=> res!154743 e!186096)))

(assert (=> d!66791 (= res!154743 (bvsge #b00000000000000000000000000000000 (size!7413 a!3312)))))

(assert (=> d!66791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186096)))

(declare-fun b!294368 () Bool)

(declare-fun e!186095 () Bool)

(assert (=> b!294368 (= e!186096 e!186095)))

(declare-fun c!47385 () Bool)

(assert (=> b!294368 (= c!47385 (validKeyInArray!0 (select (arr!7061 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294369 () Bool)

(declare-fun e!186097 () Bool)

(assert (=> b!294369 (= e!186095 e!186097)))

(declare-fun lt!145913 () (_ BitVec 64))

(assert (=> b!294369 (= lt!145913 (select (arr!7061 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9200 0))(
  ( (Unit!9201) )
))
(declare-fun lt!145912 () Unit!9200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14886 (_ BitVec 64) (_ BitVec 32)) Unit!9200)

(assert (=> b!294369 (= lt!145912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145913 #b00000000000000000000000000000000))))

(assert (=> b!294369 (arrayContainsKey!0 a!3312 lt!145913 #b00000000000000000000000000000000)))

(declare-fun lt!145914 () Unit!9200)

(assert (=> b!294369 (= lt!145914 lt!145912)))

(declare-fun res!154742 () Bool)

(assert (=> b!294369 (= res!154742 (= (seekEntryOrOpen!0 (select (arr!7061 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2210 #b00000000000000000000000000000000)))))

(assert (=> b!294369 (=> (not res!154742) (not e!186097))))

(declare-fun bm!25696 () Bool)

(declare-fun call!25699 () Bool)

(assert (=> bm!25696 (= call!25699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294370 () Bool)

(assert (=> b!294370 (= e!186095 call!25699)))

(declare-fun b!294371 () Bool)

(assert (=> b!294371 (= e!186097 call!25699)))

(assert (= (and d!66791 (not res!154743)) b!294368))

(assert (= (and b!294368 c!47385) b!294369))

(assert (= (and b!294368 (not c!47385)) b!294370))

(assert (= (and b!294369 res!154742) b!294371))

(assert (= (or b!294371 b!294370) bm!25696))

(assert (=> b!294368 m!307761))

(assert (=> b!294368 m!307761))

(declare-fun m!307835 () Bool)

(assert (=> b!294368 m!307835))

(assert (=> b!294369 m!307761))

(declare-fun m!307837 () Bool)

(assert (=> b!294369 m!307837))

(declare-fun m!307839 () Bool)

(assert (=> b!294369 m!307839))

(assert (=> b!294369 m!307761))

(declare-fun m!307841 () Bool)

(assert (=> b!294369 m!307841))

(declare-fun m!307843 () Bool)

(assert (=> bm!25696 m!307843))

(assert (=> b!294119 d!66791))

(push 1)

(assert (not b!294315))

(assert (not d!66745))

(assert (not b!294368))

(assert (not b!294215))

(assert (not d!66771))

(assert (not bm!25696))

(assert (not b!294369))

(assert (not b!294204))

(assert (not b!294328))

(assert (not d!66783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

