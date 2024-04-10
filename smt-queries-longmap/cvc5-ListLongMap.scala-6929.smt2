; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87126 () Bool)

(assert start!87126)

(declare-datatypes ((array!63644 0))(
  ( (array!63645 (arr!30640 (Array (_ BitVec 32) (_ BitVec 64))) (size!31142 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63644)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun e!568403 () Bool)

(declare-fun b!1010373 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9572 0))(
  ( (MissingZero!9572 (index!40659 (_ BitVec 32))) (Found!9572 (index!40660 (_ BitVec 32))) (Intermediate!9572 (undefined!10384 Bool) (index!40661 (_ BitVec 32)) (x!88064 (_ BitVec 32))) (Undefined!9572) (MissingVacant!9572 (index!40662 (_ BitVec 32))) )
))
(declare-fun lt!446573 () SeekEntryResult!9572)

(declare-fun lt!446571 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63644 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1010373 (= e!568403 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446571 (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446573)))))

(declare-fun b!1010374 () Bool)

(declare-fun res!678772 () Bool)

(declare-fun e!568404 () Bool)

(assert (=> b!1010374 (=> (not res!678772) (not e!568404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63644 (_ BitVec 32)) Bool)

(assert (=> b!1010374 (= res!678772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010375 () Bool)

(declare-fun res!678778 () Bool)

(declare-fun e!568406 () Bool)

(assert (=> b!1010375 (=> (not res!678778) (not e!568406))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010375 (= res!678778 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010376 () Bool)

(declare-fun res!678773 () Bool)

(assert (=> b!1010376 (=> (not res!678773) (not e!568406))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010376 (= res!678773 (and (= (size!31142 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31142 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31142 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010377 () Bool)

(declare-fun e!568407 () Bool)

(declare-fun e!568408 () Bool)

(assert (=> b!1010377 (= e!568407 e!568408)))

(declare-fun res!678776 () Bool)

(assert (=> b!1010377 (=> (not res!678776) (not e!568408))))

(declare-fun lt!446576 () SeekEntryResult!9572)

(declare-fun lt!446574 () array!63644)

(declare-fun lt!446575 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010377 (= res!678776 (not (= lt!446576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446575 mask!3464) lt!446575 lt!446574 mask!3464))))))

(assert (=> b!1010377 (= lt!446575 (select (store (arr!30640 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010377 (= lt!446574 (array!63645 (store (arr!30640 a!3219) i!1194 k!2224) (size!31142 a!3219)))))

(declare-fun b!1010378 () Bool)

(declare-fun res!678777 () Bool)

(assert (=> b!1010378 (=> (not res!678777) (not e!568404))))

(declare-datatypes ((List!21316 0))(
  ( (Nil!21313) (Cons!21312 (h!22504 (_ BitVec 64)) (t!30317 List!21316)) )
))
(declare-fun arrayNoDuplicates!0 (array!63644 (_ BitVec 32) List!21316) Bool)

(assert (=> b!1010378 (= res!678777 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21313))))

(declare-fun b!1010380 () Bool)

(declare-fun e!568402 () Bool)

(assert (=> b!1010380 (= e!568402 e!568407)))

(declare-fun res!678779 () Bool)

(assert (=> b!1010380 (=> (not res!678779) (not e!568407))))

(declare-fun lt!446577 () SeekEntryResult!9572)

(assert (=> b!1010380 (= res!678779 (= lt!446577 lt!446573))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1010380 (= lt!446577 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010381 () Bool)

(declare-fun res!678768 () Bool)

(assert (=> b!1010381 (=> (not res!678768) (not e!568408))))

(assert (=> b!1010381 (= res!678768 (not (= lt!446577 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446575 lt!446574 mask!3464))))))

(declare-fun b!1010382 () Bool)

(declare-fun res!678767 () Bool)

(assert (=> b!1010382 (=> (not res!678767) (not e!568408))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010382 (= res!678767 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010383 () Bool)

(declare-fun res!678775 () Bool)

(assert (=> b!1010383 (=> (not res!678775) (not e!568406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010383 (= res!678775 (validKeyInArray!0 k!2224))))

(declare-fun b!1010384 () Bool)

(assert (=> b!1010384 (= e!568406 e!568404)))

(declare-fun res!678770 () Bool)

(assert (=> b!1010384 (=> (not res!678770) (not e!568404))))

(declare-fun lt!446572 () SeekEntryResult!9572)

(assert (=> b!1010384 (= res!678770 (or (= lt!446572 (MissingVacant!9572 i!1194)) (= lt!446572 (MissingZero!9572 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63644 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1010384 (= lt!446572 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010385 () Bool)

(declare-fun res!678771 () Bool)

(assert (=> b!1010385 (=> (not res!678771) (not e!568406))))

(assert (=> b!1010385 (= res!678771 (validKeyInArray!0 (select (arr!30640 a!3219) j!170)))))

(declare-fun b!1010386 () Bool)

(assert (=> b!1010386 (= e!568408 e!568403)))

(declare-fun res!678774 () Bool)

(assert (=> b!1010386 (=> (not res!678774) (not e!568403))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010386 (= res!678774 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446571 #b00000000000000000000000000000000) (bvslt lt!446571 (size!31142 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010386 (= lt!446571 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010387 () Bool)

(assert (=> b!1010387 (= e!568404 e!568402)))

(declare-fun res!678780 () Bool)

(assert (=> b!1010387 (=> (not res!678780) (not e!568402))))

(assert (=> b!1010387 (= res!678780 (= lt!446576 lt!446573))))

(assert (=> b!1010387 (= lt!446573 (Intermediate!9572 false resIndex!38 resX!38))))

(assert (=> b!1010387 (= lt!446576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!678769 () Bool)

(assert (=> start!87126 (=> (not res!678769) (not e!568406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87126 (= res!678769 (validMask!0 mask!3464))))

(assert (=> start!87126 e!568406))

(declare-fun array_inv!23764 (array!63644) Bool)

(assert (=> start!87126 (array_inv!23764 a!3219)))

(assert (=> start!87126 true))

(declare-fun b!1010379 () Bool)

(declare-fun res!678766 () Bool)

(assert (=> b!1010379 (=> (not res!678766) (not e!568404))))

(assert (=> b!1010379 (= res!678766 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31142 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31142 a!3219))))))

(assert (= (and start!87126 res!678769) b!1010376))

(assert (= (and b!1010376 res!678773) b!1010385))

(assert (= (and b!1010385 res!678771) b!1010383))

(assert (= (and b!1010383 res!678775) b!1010375))

(assert (= (and b!1010375 res!678778) b!1010384))

(assert (= (and b!1010384 res!678770) b!1010374))

(assert (= (and b!1010374 res!678772) b!1010378))

(assert (= (and b!1010378 res!678777) b!1010379))

(assert (= (and b!1010379 res!678766) b!1010387))

(assert (= (and b!1010387 res!678780) b!1010380))

(assert (= (and b!1010380 res!678779) b!1010377))

(assert (= (and b!1010377 res!678776) b!1010381))

(assert (= (and b!1010381 res!678768) b!1010382))

(assert (= (and b!1010382 res!678767) b!1010386))

(assert (= (and b!1010386 res!678774) b!1010373))

(declare-fun m!934707 () Bool)

(assert (=> b!1010386 m!934707))

(declare-fun m!934709 () Bool)

(assert (=> b!1010374 m!934709))

(declare-fun m!934711 () Bool)

(assert (=> b!1010380 m!934711))

(assert (=> b!1010380 m!934711))

(declare-fun m!934713 () Bool)

(assert (=> b!1010380 m!934713))

(assert (=> b!1010387 m!934711))

(assert (=> b!1010387 m!934711))

(declare-fun m!934715 () Bool)

(assert (=> b!1010387 m!934715))

(assert (=> b!1010387 m!934715))

(assert (=> b!1010387 m!934711))

(declare-fun m!934717 () Bool)

(assert (=> b!1010387 m!934717))

(declare-fun m!934719 () Bool)

(assert (=> b!1010377 m!934719))

(assert (=> b!1010377 m!934719))

(declare-fun m!934721 () Bool)

(assert (=> b!1010377 m!934721))

(declare-fun m!934723 () Bool)

(assert (=> b!1010377 m!934723))

(declare-fun m!934725 () Bool)

(assert (=> b!1010377 m!934725))

(declare-fun m!934727 () Bool)

(assert (=> b!1010375 m!934727))

(assert (=> b!1010385 m!934711))

(assert (=> b!1010385 m!934711))

(declare-fun m!934729 () Bool)

(assert (=> b!1010385 m!934729))

(declare-fun m!934731 () Bool)

(assert (=> b!1010384 m!934731))

(declare-fun m!934733 () Bool)

(assert (=> b!1010383 m!934733))

(declare-fun m!934735 () Bool)

(assert (=> start!87126 m!934735))

(declare-fun m!934737 () Bool)

(assert (=> start!87126 m!934737))

(declare-fun m!934739 () Bool)

(assert (=> b!1010381 m!934739))

(declare-fun m!934741 () Bool)

(assert (=> b!1010378 m!934741))

(assert (=> b!1010373 m!934711))

(assert (=> b!1010373 m!934711))

(declare-fun m!934743 () Bool)

(assert (=> b!1010373 m!934743))

(push 1)

(assert (not start!87126))

(assert (not b!1010374))

(assert (not b!1010386))

(assert (not b!1010373))

(assert (not b!1010383))

(assert (not b!1010384))

(assert (not b!1010378))

(assert (not b!1010381))

(assert (not b!1010375))

(assert (not b!1010385))

(assert (not b!1010387))

(assert (not b!1010380))

(assert (not b!1010377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1010588 () Bool)

(declare-fun e!568513 () Bool)

(declare-fun e!568514 () Bool)

(assert (=> b!1010588 (= e!568513 e!568514)))

(declare-fun res!678906 () Bool)

(declare-fun lt!446659 () SeekEntryResult!9572)

(assert (=> b!1010588 (= res!678906 (and (is-Intermediate!9572 lt!446659) (not (undefined!10384 lt!446659)) (bvslt (x!88064 lt!446659) #b01111111111111111111111111111110) (bvsge (x!88064 lt!446659) #b00000000000000000000000000000000) (bvsge (x!88064 lt!446659) #b00000000000000000000000000000000)))))

(assert (=> b!1010588 (=> (not res!678906) (not e!568514))))

(declare-fun b!1010589 () Bool)

(assert (=> b!1010589 (and (bvsge (index!40661 lt!446659) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446659) (size!31142 a!3219)))))

(declare-fun e!568516 () Bool)

(assert (=> b!1010589 (= e!568516 (= (select (arr!30640 a!3219) (index!40661 lt!446659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010590 () Bool)

(assert (=> b!1010590 (and (bvsge (index!40661 lt!446659) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446659) (size!31142 a!3219)))))

(declare-fun res!678904 () Bool)

(assert (=> b!1010590 (= res!678904 (= (select (arr!30640 a!3219) (index!40661 lt!446659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010590 (=> res!678904 e!568516)))

(declare-fun d!119999 () Bool)

(assert (=> d!119999 e!568513))

(declare-fun c!102003 () Bool)

(assert (=> d!119999 (= c!102003 (and (is-Intermediate!9572 lt!446659) (undefined!10384 lt!446659)))))

(declare-fun e!568512 () SeekEntryResult!9572)

(assert (=> d!119999 (= lt!446659 e!568512)))

(declare-fun c!102001 () Bool)

(assert (=> d!119999 (= c!102001 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446658 () (_ BitVec 64))

(assert (=> d!119999 (= lt!446658 (select (arr!30640 a!3219) (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464)))))

(assert (=> d!119999 (validMask!0 mask!3464)))

(assert (=> d!119999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446659)))

(declare-fun b!1010591 () Bool)

(assert (=> b!1010591 (= e!568512 (Intermediate!9572 true (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010592 () Bool)

(declare-fun e!568515 () SeekEntryResult!9572)

(assert (=> b!1010592 (= e!568515 (Intermediate!9572 false (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010593 () Bool)

(assert (=> b!1010593 (= e!568512 e!568515)))

(declare-fun c!102002 () Bool)

(assert (=> b!1010593 (= c!102002 (or (= lt!446658 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446658 lt!446658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010594 () Bool)

(assert (=> b!1010594 (= e!568513 (bvsge (x!88064 lt!446659) #b01111111111111111111111111111110))))

(declare-fun b!1010595 () Bool)

(assert (=> b!1010595 (and (bvsge (index!40661 lt!446659) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446659) (size!31142 a!3219)))))

(declare-fun res!678905 () Bool)

(assert (=> b!1010595 (= res!678905 (= (select (arr!30640 a!3219) (index!40661 lt!446659)) (select (arr!30640 a!3219) j!170)))))

(assert (=> b!1010595 (=> res!678905 e!568516)))

(assert (=> b!1010595 (= e!568514 e!568516)))

(declare-fun b!1010596 () Bool)

(assert (=> b!1010596 (= e!568515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119999 c!102001) b!1010591))

(assert (= (and d!119999 (not c!102001)) b!1010593))

(assert (= (and b!1010593 c!102002) b!1010592))

(assert (= (and b!1010593 (not c!102002)) b!1010596))

(assert (= (and d!119999 c!102003) b!1010594))

(assert (= (and d!119999 (not c!102003)) b!1010588))

(assert (= (and b!1010588 res!678906) b!1010595))

(assert (= (and b!1010595 (not res!678905)) b!1010590))

(assert (= (and b!1010590 (not res!678904)) b!1010589))

(assert (=> b!1010596 m!934715))

(declare-fun m!934867 () Bool)

(assert (=> b!1010596 m!934867))

(assert (=> b!1010596 m!934867))

(assert (=> b!1010596 m!934711))

(declare-fun m!934869 () Bool)

(assert (=> b!1010596 m!934869))

(assert (=> d!119999 m!934715))

(declare-fun m!934871 () Bool)

(assert (=> d!119999 m!934871))

(assert (=> d!119999 m!934735))

(declare-fun m!934873 () Bool)

(assert (=> b!1010589 m!934873))

(assert (=> b!1010590 m!934873))

(assert (=> b!1010595 m!934873))

(assert (=> b!1010387 d!119999))

(declare-fun d!120009 () Bool)

(declare-fun lt!446665 () (_ BitVec 32))

(declare-fun lt!446664 () (_ BitVec 32))

(assert (=> d!120009 (= lt!446665 (bvmul (bvxor lt!446664 (bvlshr lt!446664 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120009 (= lt!446664 ((_ extract 31 0) (bvand (bvxor (select (arr!30640 a!3219) j!170) (bvlshr (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120009 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678911 (let ((h!22508 ((_ extract 31 0) (bvand (bvxor (select (arr!30640 a!3219) j!170) (bvlshr (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88072 (bvmul (bvxor h!22508 (bvlshr h!22508 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88072 (bvlshr x!88072 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678911 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678911 #b00000000000000000000000000000000))))))

(assert (=> d!120009 (= (toIndex!0 (select (arr!30640 a!3219) j!170) mask!3464) (bvand (bvxor lt!446665 (bvlshr lt!446665 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010387 d!120009))

(declare-fun d!120013 () Bool)

(assert (=> d!120013 (= (validKeyInArray!0 (select (arr!30640 a!3219) j!170)) (and (not (= (select (arr!30640 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30640 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010385 d!120013))

(declare-fun d!120017 () Bool)

(declare-fun lt!446672 () (_ BitVec 32))

(assert (=> d!120017 (and (bvsge lt!446672 #b00000000000000000000000000000000) (bvslt lt!446672 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120017 (= lt!446672 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120017 (validMask!0 mask!3464)))

(assert (=> d!120017 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446672)))

(declare-fun bs!28726 () Bool)

(assert (= bs!28726 d!120017))

(declare-fun m!934897 () Bool)

(assert (=> bs!28726 m!934897))

(assert (=> bs!28726 m!934735))

(assert (=> b!1010386 d!120017))

(declare-fun d!120031 () Bool)

(declare-fun res!678931 () Bool)

(declare-fun e!568547 () Bool)

(assert (=> d!120031 (=> res!678931 e!568547)))

(assert (=> d!120031 (= res!678931 (= (select (arr!30640 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!120031 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568547)))

(declare-fun b!1010638 () Bool)

(declare-fun e!568548 () Bool)

(assert (=> b!1010638 (= e!568547 e!568548)))

(declare-fun res!678932 () Bool)

(assert (=> b!1010638 (=> (not res!678932) (not e!568548))))

(assert (=> b!1010638 (= res!678932 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31142 a!3219)))))

(declare-fun b!1010639 () Bool)

(assert (=> b!1010639 (= e!568548 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120031 (not res!678931)) b!1010638))

(assert (= (and b!1010638 res!678932) b!1010639))

(declare-fun m!934899 () Bool)

(assert (=> d!120031 m!934899))

(declare-fun m!934901 () Bool)

(assert (=> b!1010639 m!934901))

(assert (=> b!1010375 d!120031))

(declare-fun b!1010640 () Bool)

(declare-fun e!568550 () Bool)

(declare-fun e!568551 () Bool)

(assert (=> b!1010640 (= e!568550 e!568551)))

(declare-fun res!678935 () Bool)

(declare-fun lt!446674 () SeekEntryResult!9572)

(assert (=> b!1010640 (= res!678935 (and (is-Intermediate!9572 lt!446674) (not (undefined!10384 lt!446674)) (bvslt (x!88064 lt!446674) #b01111111111111111111111111111110) (bvsge (x!88064 lt!446674) #b00000000000000000000000000000000) (bvsge (x!88064 lt!446674) #b00000000000000000000000000000000)))))

(assert (=> b!1010640 (=> (not res!678935) (not e!568551))))

(declare-fun b!1010641 () Bool)

(assert (=> b!1010641 (and (bvsge (index!40661 lt!446674) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446674) (size!31142 lt!446574)))))

(declare-fun e!568553 () Bool)

(assert (=> b!1010641 (= e!568553 (= (select (arr!30640 lt!446574) (index!40661 lt!446674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010642 () Bool)

(assert (=> b!1010642 (and (bvsge (index!40661 lt!446674) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446674) (size!31142 lt!446574)))))

(declare-fun res!678933 () Bool)

(assert (=> b!1010642 (= res!678933 (= (select (arr!30640 lt!446574) (index!40661 lt!446674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010642 (=> res!678933 e!568553)))

(declare-fun d!120033 () Bool)

(assert (=> d!120033 e!568550))

(declare-fun c!102015 () Bool)

(assert (=> d!120033 (= c!102015 (and (is-Intermediate!9572 lt!446674) (undefined!10384 lt!446674)))))

(declare-fun e!568549 () SeekEntryResult!9572)

(assert (=> d!120033 (= lt!446674 e!568549)))

(declare-fun c!102013 () Bool)

(assert (=> d!120033 (= c!102013 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446673 () (_ BitVec 64))

(assert (=> d!120033 (= lt!446673 (select (arr!30640 lt!446574) (toIndex!0 lt!446575 mask!3464)))))

(assert (=> d!120033 (validMask!0 mask!3464)))

(assert (=> d!120033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446575 mask!3464) lt!446575 lt!446574 mask!3464) lt!446674)))

(declare-fun b!1010643 () Bool)

(assert (=> b!1010643 (= e!568549 (Intermediate!9572 true (toIndex!0 lt!446575 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010644 () Bool)

(declare-fun e!568552 () SeekEntryResult!9572)

(assert (=> b!1010644 (= e!568552 (Intermediate!9572 false (toIndex!0 lt!446575 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010645 () Bool)

(assert (=> b!1010645 (= e!568549 e!568552)))

(declare-fun c!102014 () Bool)

(assert (=> b!1010645 (= c!102014 (or (= lt!446673 lt!446575) (= (bvadd lt!446673 lt!446673) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010646 () Bool)

(assert (=> b!1010646 (= e!568550 (bvsge (x!88064 lt!446674) #b01111111111111111111111111111110))))

(declare-fun b!1010647 () Bool)

(assert (=> b!1010647 (and (bvsge (index!40661 lt!446674) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446674) (size!31142 lt!446574)))))

(declare-fun res!678934 () Bool)

(assert (=> b!1010647 (= res!678934 (= (select (arr!30640 lt!446574) (index!40661 lt!446674)) lt!446575))))

(assert (=> b!1010647 (=> res!678934 e!568553)))

(assert (=> b!1010647 (= e!568551 e!568553)))

(declare-fun b!1010648 () Bool)

(assert (=> b!1010648 (= e!568552 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446575 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446575 lt!446574 mask!3464))))

(assert (= (and d!120033 c!102013) b!1010643))

(assert (= (and d!120033 (not c!102013)) b!1010645))

(assert (= (and b!1010645 c!102014) b!1010644))

(assert (= (and b!1010645 (not c!102014)) b!1010648))

(assert (= (and d!120033 c!102015) b!1010646))

(assert (= (and d!120033 (not c!102015)) b!1010640))

(assert (= (and b!1010640 res!678935) b!1010647))

(assert (= (and b!1010647 (not res!678934)) b!1010642))

(assert (= (and b!1010642 (not res!678933)) b!1010641))

(assert (=> b!1010648 m!934719))

(declare-fun m!934903 () Bool)

(assert (=> b!1010648 m!934903))

(assert (=> b!1010648 m!934903))

(declare-fun m!934905 () Bool)

(assert (=> b!1010648 m!934905))

(assert (=> d!120033 m!934719))

(declare-fun m!934907 () Bool)

(assert (=> d!120033 m!934907))

(assert (=> d!120033 m!934735))

(declare-fun m!934909 () Bool)

(assert (=> b!1010641 m!934909))

(assert (=> b!1010642 m!934909))

(assert (=> b!1010647 m!934909))

(assert (=> b!1010377 d!120033))

(declare-fun d!120035 () Bool)

(declare-fun lt!446676 () (_ BitVec 32))

(declare-fun lt!446675 () (_ BitVec 32))

(assert (=> d!120035 (= lt!446676 (bvmul (bvxor lt!446675 (bvlshr lt!446675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120035 (= lt!446675 ((_ extract 31 0) (bvand (bvxor lt!446575 (bvlshr lt!446575 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120035 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678911 (let ((h!22508 ((_ extract 31 0) (bvand (bvxor lt!446575 (bvlshr lt!446575 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88072 (bvmul (bvxor h!22508 (bvlshr h!22508 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88072 (bvlshr x!88072 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678911 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678911 #b00000000000000000000000000000000))))))

(assert (=> d!120035 (= (toIndex!0 lt!446575 mask!3464) (bvand (bvxor lt!446676 (bvlshr lt!446676 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010377 d!120035))

(declare-fun b!1010680 () Bool)

(declare-fun e!568578 () Bool)

(declare-fun e!568576 () Bool)

(assert (=> b!1010680 (= e!568578 e!568576)))

(declare-fun res!678953 () Bool)

(assert (=> b!1010680 (=> (not res!678953) (not e!568576))))

(declare-fun e!568579 () Bool)

(assert (=> b!1010680 (= res!678953 (not e!568579))))

(declare-fun res!678952 () Bool)

(assert (=> b!1010680 (=> (not res!678952) (not e!568579))))

(assert (=> b!1010680 (= res!678952 (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010681 () Bool)

(declare-fun e!568577 () Bool)

(assert (=> b!1010681 (= e!568576 e!568577)))

(declare-fun c!102024 () Bool)

(assert (=> b!1010681 (= c!102024 (validKeyInArray!0 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010682 () Bool)

(declare-fun call!42414 () Bool)

(assert (=> b!1010682 (= e!568577 call!42414)))

(declare-fun b!1010683 () Bool)

(declare-fun contains!5895 (List!21316 (_ BitVec 64)) Bool)

(assert (=> b!1010683 (= e!568579 (contains!5895 Nil!21313 (select (arr!30640 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010684 () Bool)

(assert (=> b!1010684 (= e!568577 call!42414)))

(declare-fun bm!42411 () Bool)

(assert (=> bm!42411 (= call!42414 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102024 (Cons!21312 (select (arr!30640 a!3219) #b00000000000000000000000000000000) Nil!21313) Nil!21313)))))

(declare-fun d!120037 () Bool)

(declare-fun res!678951 () Bool)

(assert (=> d!120037 (=> res!678951 e!568578)))

(assert (=> d!120037 (= res!678951 (bvsge #b00000000000000000000000000000000 (size!31142 a!3219)))))

(assert (=> d!120037 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21313) e!568578)))

(assert (= (and d!120037 (not res!678951)) b!1010680))

(assert (= (and b!1010680 res!678952) b!1010683))

(assert (= (and b!1010680 res!678953) b!1010681))

(assert (= (and b!1010681 c!102024) b!1010682))

(assert (= (and b!1010681 (not c!102024)) b!1010684))

(assert (= (or b!1010682 b!1010684) bm!42411))

(assert (=> b!1010680 m!934899))

(assert (=> b!1010680 m!934899))

(declare-fun m!934927 () Bool)

(assert (=> b!1010680 m!934927))

(assert (=> b!1010681 m!934899))

(assert (=> b!1010681 m!934899))

(assert (=> b!1010681 m!934927))

(assert (=> b!1010683 m!934899))

(assert (=> b!1010683 m!934899))

(declare-fun m!934929 () Bool)

(assert (=> b!1010683 m!934929))

(assert (=> bm!42411 m!934899))

(declare-fun m!934931 () Bool)

(assert (=> bm!42411 m!934931))

(assert (=> b!1010378 d!120037))

(declare-fun b!1010685 () Bool)

(declare-fun e!568581 () Bool)

(declare-fun e!568582 () Bool)

(assert (=> b!1010685 (= e!568581 e!568582)))

(declare-fun res!678956 () Bool)

(declare-fun lt!446691 () SeekEntryResult!9572)

(assert (=> b!1010685 (= res!678956 (and (is-Intermediate!9572 lt!446691) (not (undefined!10384 lt!446691)) (bvslt (x!88064 lt!446691) #b01111111111111111111111111111110) (bvsge (x!88064 lt!446691) #b00000000000000000000000000000000) (bvsge (x!88064 lt!446691) x!1245)))))

(assert (=> b!1010685 (=> (not res!678956) (not e!568582))))

(declare-fun b!1010686 () Bool)

(assert (=> b!1010686 (and (bvsge (index!40661 lt!446691) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446691) (size!31142 lt!446574)))))

(declare-fun e!568584 () Bool)

(assert (=> b!1010686 (= e!568584 (= (select (arr!30640 lt!446574) (index!40661 lt!446691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010687 () Bool)

(assert (=> b!1010687 (and (bvsge (index!40661 lt!446691) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446691) (size!31142 lt!446574)))))

(declare-fun res!678954 () Bool)

(assert (=> b!1010687 (= res!678954 (= (select (arr!30640 lt!446574) (index!40661 lt!446691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010687 (=> res!678954 e!568584)))

(declare-fun d!120043 () Bool)

(assert (=> d!120043 e!568581))

(declare-fun c!102027 () Bool)

(assert (=> d!120043 (= c!102027 (and (is-Intermediate!9572 lt!446691) (undefined!10384 lt!446691)))))

(declare-fun e!568580 () SeekEntryResult!9572)

(assert (=> d!120043 (= lt!446691 e!568580)))

(declare-fun c!102025 () Bool)

(assert (=> d!120043 (= c!102025 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446690 () (_ BitVec 64))

(assert (=> d!120043 (= lt!446690 (select (arr!30640 lt!446574) index!1507))))

(assert (=> d!120043 (validMask!0 mask!3464)))

(assert (=> d!120043 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446575 lt!446574 mask!3464) lt!446691)))

(declare-fun b!1010688 () Bool)

(assert (=> b!1010688 (= e!568580 (Intermediate!9572 true index!1507 x!1245))))

(declare-fun b!1010689 () Bool)

(declare-fun e!568583 () SeekEntryResult!9572)

(assert (=> b!1010689 (= e!568583 (Intermediate!9572 false index!1507 x!1245))))

(declare-fun b!1010690 () Bool)

(assert (=> b!1010690 (= e!568580 e!568583)))

(declare-fun c!102026 () Bool)

(assert (=> b!1010690 (= c!102026 (or (= lt!446690 lt!446575) (= (bvadd lt!446690 lt!446690) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010691 () Bool)

(assert (=> b!1010691 (= e!568581 (bvsge (x!88064 lt!446691) #b01111111111111111111111111111110))))

(declare-fun b!1010692 () Bool)

(assert (=> b!1010692 (and (bvsge (index!40661 lt!446691) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446691) (size!31142 lt!446574)))))

(declare-fun res!678955 () Bool)

(assert (=> b!1010692 (= res!678955 (= (select (arr!30640 lt!446574) (index!40661 lt!446691)) lt!446575))))

(assert (=> b!1010692 (=> res!678955 e!568584)))

(assert (=> b!1010692 (= e!568582 e!568584)))

(declare-fun b!1010693 () Bool)

(assert (=> b!1010693 (= e!568583 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446575 lt!446574 mask!3464))))

(assert (= (and d!120043 c!102025) b!1010688))

(assert (= (and d!120043 (not c!102025)) b!1010690))

(assert (= (and b!1010690 c!102026) b!1010689))

(assert (= (and b!1010690 (not c!102026)) b!1010693))

(assert (= (and d!120043 c!102027) b!1010691))

(assert (= (and d!120043 (not c!102027)) b!1010685))

(assert (= (and b!1010685 res!678956) b!1010692))

(assert (= (and b!1010692 (not res!678955)) b!1010687))

(assert (= (and b!1010687 (not res!678954)) b!1010686))

(assert (=> b!1010693 m!934707))

(assert (=> b!1010693 m!934707))

(declare-fun m!934933 () Bool)

(assert (=> b!1010693 m!934933))

(declare-fun m!934935 () Bool)

(assert (=> d!120043 m!934935))

(assert (=> d!120043 m!934735))

(declare-fun m!934937 () Bool)

(assert (=> b!1010686 m!934937))

(assert (=> b!1010687 m!934937))

(assert (=> b!1010692 m!934937))

(assert (=> b!1010381 d!120043))

(declare-fun b!1010694 () Bool)

(declare-fun e!568586 () Bool)

(declare-fun e!568587 () Bool)

(assert (=> b!1010694 (= e!568586 e!568587)))

(declare-fun res!678959 () Bool)

(declare-fun lt!446693 () SeekEntryResult!9572)

(assert (=> b!1010694 (= res!678959 (and (is-Intermediate!9572 lt!446693) (not (undefined!10384 lt!446693)) (bvslt (x!88064 lt!446693) #b01111111111111111111111111111110) (bvsge (x!88064 lt!446693) #b00000000000000000000000000000000) (bvsge (x!88064 lt!446693) x!1245)))))

(assert (=> b!1010694 (=> (not res!678959) (not e!568587))))

(declare-fun b!1010695 () Bool)

(assert (=> b!1010695 (and (bvsge (index!40661 lt!446693) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446693) (size!31142 a!3219)))))

(declare-fun e!568589 () Bool)

(assert (=> b!1010695 (= e!568589 (= (select (arr!30640 a!3219) (index!40661 lt!446693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010696 () Bool)

(assert (=> b!1010696 (and (bvsge (index!40661 lt!446693) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446693) (size!31142 a!3219)))))

(declare-fun res!678957 () Bool)

(assert (=> b!1010696 (= res!678957 (= (select (arr!30640 a!3219) (index!40661 lt!446693)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010696 (=> res!678957 e!568589)))

(declare-fun d!120045 () Bool)

(assert (=> d!120045 e!568586))

(declare-fun c!102030 () Bool)

(assert (=> d!120045 (= c!102030 (and (is-Intermediate!9572 lt!446693) (undefined!10384 lt!446693)))))

(declare-fun e!568585 () SeekEntryResult!9572)

(assert (=> d!120045 (= lt!446693 e!568585)))

(declare-fun c!102028 () Bool)

(assert (=> d!120045 (= c!102028 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446692 () (_ BitVec 64))

(assert (=> d!120045 (= lt!446692 (select (arr!30640 a!3219) index!1507))))

(assert (=> d!120045 (validMask!0 mask!3464)))

(assert (=> d!120045 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30640 a!3219) j!170) a!3219 mask!3464) lt!446693)))

(declare-fun b!1010697 () Bool)

(assert (=> b!1010697 (= e!568585 (Intermediate!9572 true index!1507 x!1245))))

(declare-fun b!1010698 () Bool)

(declare-fun e!568588 () SeekEntryResult!9572)

(assert (=> b!1010698 (= e!568588 (Intermediate!9572 false index!1507 x!1245))))

(declare-fun b!1010699 () Bool)

(assert (=> b!1010699 (= e!568585 e!568588)))

(declare-fun c!102029 () Bool)

(assert (=> b!1010699 (= c!102029 (or (= lt!446692 (select (arr!30640 a!3219) j!170)) (= (bvadd lt!446692 lt!446692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010700 () Bool)

(assert (=> b!1010700 (= e!568586 (bvsge (x!88064 lt!446693) #b01111111111111111111111111111110))))

(declare-fun b!1010701 () Bool)

(assert (=> b!1010701 (and (bvsge (index!40661 lt!446693) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446693) (size!31142 a!3219)))))

(declare-fun res!678958 () Bool)

(assert (=> b!1010701 (= res!678958 (= (select (arr!30640 a!3219) (index!40661 lt!446693)) (select (arr!30640 a!3219) j!170)))))

(assert (=> b!1010701 (=> res!678958 e!568589)))

(assert (=> b!1010701 (= e!568587 e!568589)))

(declare-fun b!1010702 () Bool)

(assert (=> b!1010702 (= e!568588 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30640 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!120045 c!102028) b!1010697))

(assert (= (and d!120045 (not c!102028)) b!1010699))

(assert (= (and b!1010699 c!102029) b!1010698))

(assert (= (and b!1010699 (not c!102029)) b!1010702))

(assert (= (and d!120045 c!102030) b!1010700))

(assert (= (and d!120045 (not c!102030)) b!1010694))

(assert (= (and b!1010694 res!678959) b!1010701))

(assert (= (and b!1010701 (not res!678958)) b!1010696))

(assert (= (and b!1010696 (not res!678957)) b!1010695))

(assert (=> b!1010702 m!934707))

(assert (=> b!1010702 m!934707))

(assert (=> b!1010702 m!934711))

(declare-fun m!934939 () Bool)

(assert (=> b!1010702 m!934939))

(declare-fun m!934941 () Bool)

(assert (=> d!120045 m!934941))

(assert (=> d!120045 m!934735))

(declare-fun m!934943 () Bool)

(assert (=> b!1010695 m!934943))

(assert (=> b!1010696 m!934943))

(assert (=> b!1010701 m!934943))

(assert (=> b!1010380 d!120045))

(declare-fun b!1010763 () Bool)

(declare-fun e!568629 () SeekEntryResult!9572)

(declare-fun lt!446720 () SeekEntryResult!9572)

(assert (=> b!1010763 (= e!568629 (Found!9572 (index!40661 lt!446720)))))

(declare-fun b!1010765 () Bool)

(declare-fun e!568630 () SeekEntryResult!9572)

(assert (=> b!1010765 (= e!568630 (MissingZero!9572 (index!40661 lt!446720)))))

(declare-fun b!1010766 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63644 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1010766 (= e!568630 (seekKeyOrZeroReturnVacant!0 (x!88064 lt!446720) (index!40661 lt!446720) (index!40661 lt!446720) k!2224 a!3219 mask!3464))))

(declare-fun b!1010767 () Bool)

(declare-fun c!102054 () Bool)

(declare-fun lt!446721 () (_ BitVec 64))

(assert (=> b!1010767 (= c!102054 (= lt!446721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010767 (= e!568629 e!568630)))

(declare-fun b!1010768 () Bool)

(declare-fun e!568628 () SeekEntryResult!9572)

(assert (=> b!1010768 (= e!568628 Undefined!9572)))

(declare-fun d!120047 () Bool)

(declare-fun lt!446722 () SeekEntryResult!9572)

(assert (=> d!120047 (and (or (is-Undefined!9572 lt!446722) (not (is-Found!9572 lt!446722)) (and (bvsge (index!40660 lt!446722) #b00000000000000000000000000000000) (bvslt (index!40660 lt!446722) (size!31142 a!3219)))) (or (is-Undefined!9572 lt!446722) (is-Found!9572 lt!446722) (not (is-MissingZero!9572 lt!446722)) (and (bvsge (index!40659 lt!446722) #b00000000000000000000000000000000) (bvslt (index!40659 lt!446722) (size!31142 a!3219)))) (or (is-Undefined!9572 lt!446722) (is-Found!9572 lt!446722) (is-MissingZero!9572 lt!446722) (not (is-MissingVacant!9572 lt!446722)) (and (bvsge (index!40662 lt!446722) #b00000000000000000000000000000000) (bvslt (index!40662 lt!446722) (size!31142 a!3219)))) (or (is-Undefined!9572 lt!446722) (ite (is-Found!9572 lt!446722) (= (select (arr!30640 a!3219) (index!40660 lt!446722)) k!2224) (ite (is-MissingZero!9572 lt!446722) (= (select (arr!30640 a!3219) (index!40659 lt!446722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9572 lt!446722) (= (select (arr!30640 a!3219) (index!40662 lt!446722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120047 (= lt!446722 e!568628)))

(declare-fun c!102053 () Bool)

(assert (=> d!120047 (= c!102053 (and (is-Intermediate!9572 lt!446720) (undefined!10384 lt!446720)))))

(assert (=> d!120047 (= lt!446720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!120047 (validMask!0 mask!3464)))

(assert (=> d!120047 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446722)))

(declare-fun b!1010764 () Bool)

(assert (=> b!1010764 (= e!568628 e!568629)))

(assert (=> b!1010764 (= lt!446721 (select (arr!30640 a!3219) (index!40661 lt!446720)))))

(declare-fun c!102052 () Bool)

(assert (=> b!1010764 (= c!102052 (= lt!446721 k!2224))))

(assert (= (and d!120047 c!102053) b!1010768))

(assert (= (and d!120047 (not c!102053)) b!1010764))

(assert (= (and b!1010764 c!102052) b!1010763))

(assert (= (and b!1010764 (not c!102052)) b!1010767))

(assert (= (and b!1010767 c!102054) b!1010765))

(assert (= (and b!1010767 (not c!102054)) b!1010766))

(declare-fun m!934979 () Bool)

(assert (=> b!1010766 m!934979))

(declare-fun m!934981 () Bool)

(assert (=> d!120047 m!934981))

(assert (=> d!120047 m!934735))

(declare-fun m!934983 () Bool)

(assert (=> d!120047 m!934983))

(declare-fun m!934985 () Bool)

(assert (=> d!120047 m!934985))

(declare-fun m!934987 () Bool)

(assert (=> d!120047 m!934987))

(assert (=> d!120047 m!934981))

(declare-fun m!934989 () Bool)

(assert (=> d!120047 m!934989))

(declare-fun m!934991 () Bool)

(assert (=> b!1010764 m!934991))

(assert (=> b!1010384 d!120047))

(declare-fun b!1010769 () Bool)

(declare-fun e!568632 () Bool)

(declare-fun e!568633 () Bool)

(assert (=> b!1010769 (= e!568632 e!568633)))

(declare-fun res!678981 () Bool)

(declare-fun lt!446724 () SeekEntryResult!9572)

(assert (=> b!1010769 (= res!678981 (and (is-Intermediate!9572 lt!446724) (not (undefined!10384 lt!446724)) (bvslt (x!88064 lt!446724) #b01111111111111111111111111111110) (bvsge (x!88064 lt!446724) #b00000000000000000000000000000000) (bvsge (x!88064 lt!446724) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1010769 (=> (not res!678981) (not e!568633))))

