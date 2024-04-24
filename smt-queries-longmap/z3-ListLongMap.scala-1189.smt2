; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25556 () Bool)

(assert start!25556)

(declare-fun b!265430 () Bool)

(declare-fun res!129772 () Bool)

(declare-fun e!171884 () Bool)

(assert (=> b!265430 (=> (not res!129772) (not e!171884))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265430 (= res!129772 (validKeyInArray!0 k0!2698))))

(declare-fun b!265431 () Bool)

(declare-fun e!171881 () Bool)

(assert (=> b!265431 (= e!171884 e!171881)))

(declare-fun res!129773 () Bool)

(assert (=> b!265431 (=> (not res!129773) (not e!171881))))

(declare-datatypes ((SeekEntryResult!1199 0))(
  ( (MissingZero!1199 (index!6966 (_ BitVec 32))) (Found!1199 (index!6967 (_ BitVec 32))) (Intermediate!1199 (undefined!2011 Bool) (index!6968 (_ BitVec 32)) (x!25396 (_ BitVec 32))) (Undefined!1199) (MissingVacant!1199 (index!6969 (_ BitVec 32))) )
))
(declare-fun lt!134145 () SeekEntryResult!1199)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265431 (= res!129773 (or (= lt!134145 (MissingZero!1199 i!1355)) (= lt!134145 (MissingVacant!1199 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((array!12775 0))(
  ( (array!12776 (arr!6043 (Array (_ BitVec 32) (_ BitVec 64))) (size!6395 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12775)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12775 (_ BitVec 32)) SeekEntryResult!1199)

(assert (=> b!265431 (= lt!134145 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265432 () Bool)

(declare-fun e!171883 () Bool)

(declare-datatypes ((List!3770 0))(
  ( (Nil!3767) (Cons!3766 (h!4433 (_ BitVec 64)) (t!8844 List!3770)) )
))
(declare-fun contains!1892 (List!3770 (_ BitVec 64)) Bool)

(assert (=> b!265432 (= e!171883 (contains!1892 Nil!3767 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!129777 () Bool)

(assert (=> start!25556 (=> (not res!129777) (not e!171884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25556 (= res!129777 (validMask!0 mask!4002))))

(assert (=> start!25556 e!171884))

(assert (=> start!25556 true))

(declare-fun array_inv!3993 (array!12775) Bool)

(assert (=> start!25556 (array_inv!3993 a!3436)))

(declare-fun b!265433 () Bool)

(declare-fun res!129780 () Bool)

(assert (=> b!265433 (=> (not res!129780) (not e!171884))))

(declare-fun arrayContainsKey!0 (array!12775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265433 (= res!129780 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265434 () Bool)

(declare-fun res!129778 () Bool)

(assert (=> b!265434 (=> (not res!129778) (not e!171881))))

(declare-fun noDuplicate!110 (List!3770) Bool)

(assert (=> b!265434 (= res!129778 (noDuplicate!110 Nil!3767))))

(declare-fun b!265435 () Bool)

(declare-fun res!129776 () Bool)

(assert (=> b!265435 (=> (not res!129776) (not e!171881))))

(assert (=> b!265435 (= res!129776 (and (bvsle #b00000000000000000000000000000000 (size!6395 a!3436)) (bvslt (size!6395 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!265436 () Bool)

(assert (=> b!265436 (= e!171881 e!171883)))

(declare-fun res!129779 () Bool)

(assert (=> b!265436 (=> res!129779 e!171883)))

(assert (=> b!265436 (= res!129779 (contains!1892 Nil!3767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265437 () Bool)

(declare-fun res!129775 () Bool)

(assert (=> b!265437 (=> (not res!129775) (not e!171881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12775 (_ BitVec 32)) Bool)

(assert (=> b!265437 (= res!129775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265438 () Bool)

(declare-fun res!129774 () Bool)

(assert (=> b!265438 (=> (not res!129774) (not e!171884))))

(assert (=> b!265438 (= res!129774 (and (= (size!6395 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6395 a!3436))))))

(assert (= (and start!25556 res!129777) b!265438))

(assert (= (and b!265438 res!129774) b!265430))

(assert (= (and b!265430 res!129772) b!265433))

(assert (= (and b!265433 res!129780) b!265431))

(assert (= (and b!265431 res!129773) b!265437))

(assert (= (and b!265437 res!129775) b!265435))

(assert (= (and b!265435 res!129776) b!265434))

(assert (= (and b!265434 res!129778) b!265436))

(assert (= (and b!265436 (not res!129779)) b!265432))

(declare-fun m!282401 () Bool)

(assert (=> b!265436 m!282401))

(declare-fun m!282403 () Bool)

(assert (=> start!25556 m!282403))

(declare-fun m!282405 () Bool)

(assert (=> start!25556 m!282405))

(declare-fun m!282407 () Bool)

(assert (=> b!265432 m!282407))

(declare-fun m!282409 () Bool)

(assert (=> b!265430 m!282409))

(declare-fun m!282411 () Bool)

(assert (=> b!265434 m!282411))

(declare-fun m!282413 () Bool)

(assert (=> b!265431 m!282413))

(declare-fun m!282415 () Bool)

(assert (=> b!265437 m!282415))

(declare-fun m!282417 () Bool)

(assert (=> b!265433 m!282417))

(check-sat (not b!265437) (not b!265434) (not b!265430) (not b!265436) (not b!265431) (not start!25556) (not b!265433) (not b!265432))
(check-sat)
(get-model)

(declare-fun d!64261 () Bool)

(declare-fun lt!134154 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!179 (List!3770) (InoxSet (_ BitVec 64)))

(assert (=> d!64261 (= lt!134154 (select (content!179 Nil!3767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171914 () Bool)

(assert (=> d!64261 (= lt!134154 e!171914)))

(declare-fun res!129839 () Bool)

(assert (=> d!64261 (=> (not res!129839) (not e!171914))))

(get-info :version)

(assert (=> d!64261 (= res!129839 ((_ is Cons!3766) Nil!3767))))

(assert (=> d!64261 (= (contains!1892 Nil!3767 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134154)))

(declare-fun b!265497 () Bool)

(declare-fun e!171913 () Bool)

(assert (=> b!265497 (= e!171914 e!171913)))

(declare-fun res!129840 () Bool)

(assert (=> b!265497 (=> res!129840 e!171913)))

(assert (=> b!265497 (= res!129840 (= (h!4433 Nil!3767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265498 () Bool)

(assert (=> b!265498 (= e!171913 (contains!1892 (t!8844 Nil!3767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64261 res!129839) b!265497))

(assert (= (and b!265497 (not res!129840)) b!265498))

(declare-fun m!282455 () Bool)

(assert (=> d!64261 m!282455))

(declare-fun m!282457 () Bool)

(assert (=> d!64261 m!282457))

(declare-fun m!282459 () Bool)

(assert (=> b!265498 m!282459))

(assert (=> b!265436 d!64261))

(declare-fun d!64263 () Bool)

(declare-fun lt!134176 () SeekEntryResult!1199)

(assert (=> d!64263 (and (or ((_ is Undefined!1199) lt!134176) (not ((_ is Found!1199) lt!134176)) (and (bvsge (index!6967 lt!134176) #b00000000000000000000000000000000) (bvslt (index!6967 lt!134176) (size!6395 a!3436)))) (or ((_ is Undefined!1199) lt!134176) ((_ is Found!1199) lt!134176) (not ((_ is MissingZero!1199) lt!134176)) (and (bvsge (index!6966 lt!134176) #b00000000000000000000000000000000) (bvslt (index!6966 lt!134176) (size!6395 a!3436)))) (or ((_ is Undefined!1199) lt!134176) ((_ is Found!1199) lt!134176) ((_ is MissingZero!1199) lt!134176) (not ((_ is MissingVacant!1199) lt!134176)) (and (bvsge (index!6969 lt!134176) #b00000000000000000000000000000000) (bvslt (index!6969 lt!134176) (size!6395 a!3436)))) (or ((_ is Undefined!1199) lt!134176) (ite ((_ is Found!1199) lt!134176) (= (select (arr!6043 a!3436) (index!6967 lt!134176)) k0!2698) (ite ((_ is MissingZero!1199) lt!134176) (= (select (arr!6043 a!3436) (index!6966 lt!134176)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1199) lt!134176) (= (select (arr!6043 a!3436) (index!6969 lt!134176)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171946 () SeekEntryResult!1199)

(assert (=> d!64263 (= lt!134176 e!171946)))

(declare-fun c!45390 () Bool)

(declare-fun lt!134174 () SeekEntryResult!1199)

(assert (=> d!64263 (= c!45390 (and ((_ is Intermediate!1199) lt!134174) (undefined!2011 lt!134174)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12775 (_ BitVec 32)) SeekEntryResult!1199)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64263 (= lt!134174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64263 (validMask!0 mask!4002)))

(assert (=> d!64263 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!134176)))

(declare-fun b!265537 () Bool)

(declare-fun e!171945 () SeekEntryResult!1199)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12775 (_ BitVec 32)) SeekEntryResult!1199)

(assert (=> b!265537 (= e!171945 (seekKeyOrZeroReturnVacant!0 (x!25396 lt!134174) (index!6968 lt!134174) (index!6968 lt!134174) k0!2698 a!3436 mask!4002))))

(declare-fun b!265538 () Bool)

(declare-fun e!171944 () SeekEntryResult!1199)

(assert (=> b!265538 (= e!171944 (Found!1199 (index!6968 lt!134174)))))

(declare-fun b!265539 () Bool)

(declare-fun c!45391 () Bool)

(declare-fun lt!134175 () (_ BitVec 64))

(assert (=> b!265539 (= c!45391 (= lt!134175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265539 (= e!171944 e!171945)))

(declare-fun b!265540 () Bool)

(assert (=> b!265540 (= e!171946 e!171944)))

(assert (=> b!265540 (= lt!134175 (select (arr!6043 a!3436) (index!6968 lt!134174)))))

(declare-fun c!45389 () Bool)

(assert (=> b!265540 (= c!45389 (= lt!134175 k0!2698))))

(declare-fun b!265541 () Bool)

(assert (=> b!265541 (= e!171945 (MissingZero!1199 (index!6968 lt!134174)))))

(declare-fun b!265542 () Bool)

(assert (=> b!265542 (= e!171946 Undefined!1199)))

(assert (= (and d!64263 c!45390) b!265542))

(assert (= (and d!64263 (not c!45390)) b!265540))

(assert (= (and b!265540 c!45389) b!265538))

(assert (= (and b!265540 (not c!45389)) b!265539))

(assert (= (and b!265539 c!45391) b!265541))

(assert (= (and b!265539 (not c!45391)) b!265537))

(declare-fun m!282487 () Bool)

(assert (=> d!64263 m!282487))

(declare-fun m!282489 () Bool)

(assert (=> d!64263 m!282489))

(assert (=> d!64263 m!282403))

(declare-fun m!282491 () Bool)

(assert (=> d!64263 m!282491))

(declare-fun m!282493 () Bool)

(assert (=> d!64263 m!282493))

(assert (=> d!64263 m!282493))

(declare-fun m!282495 () Bool)

(assert (=> d!64263 m!282495))

(declare-fun m!282497 () Bool)

(assert (=> b!265537 m!282497))

(declare-fun m!282499 () Bool)

(assert (=> b!265540 m!282499))

(assert (=> b!265431 d!64263))

(declare-fun d!64279 () Bool)

(assert (=> d!64279 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265430 d!64279))

(declare-fun d!64281 () Bool)

(assert (=> d!64281 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25556 d!64281))

(declare-fun d!64295 () Bool)

(assert (=> d!64295 (= (array_inv!3993 a!3436) (bvsge (size!6395 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25556 d!64295))

(declare-fun d!64297 () Bool)

(declare-fun res!129879 () Bool)

(declare-fun e!171968 () Bool)

(assert (=> d!64297 (=> res!129879 e!171968)))

(assert (=> d!64297 (= res!129879 (= (select (arr!6043 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64297 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171968)))

(declare-fun b!265567 () Bool)

(declare-fun e!171969 () Bool)

(assert (=> b!265567 (= e!171968 e!171969)))

(declare-fun res!129880 () Bool)

(assert (=> b!265567 (=> (not res!129880) (not e!171969))))

(assert (=> b!265567 (= res!129880 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6395 a!3436)))))

(declare-fun b!265568 () Bool)

(assert (=> b!265568 (= e!171969 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64297 (not res!129879)) b!265567))

(assert (= (and b!265567 res!129880) b!265568))

(declare-fun m!282521 () Bool)

(assert (=> d!64297 m!282521))

(declare-fun m!282523 () Bool)

(assert (=> b!265568 m!282523))

(assert (=> b!265433 d!64297))

(declare-fun d!64301 () Bool)

(declare-fun res!129885 () Bool)

(declare-fun e!171974 () Bool)

(assert (=> d!64301 (=> res!129885 e!171974)))

(assert (=> d!64301 (= res!129885 ((_ is Nil!3767) Nil!3767))))

(assert (=> d!64301 (= (noDuplicate!110 Nil!3767) e!171974)))

(declare-fun b!265573 () Bool)

(declare-fun e!171975 () Bool)

(assert (=> b!265573 (= e!171974 e!171975)))

(declare-fun res!129886 () Bool)

(assert (=> b!265573 (=> (not res!129886) (not e!171975))))

(assert (=> b!265573 (= res!129886 (not (contains!1892 (t!8844 Nil!3767) (h!4433 Nil!3767))))))

(declare-fun b!265574 () Bool)

(assert (=> b!265574 (= e!171975 (noDuplicate!110 (t!8844 Nil!3767)))))

(assert (= (and d!64301 (not res!129885)) b!265573))

(assert (= (and b!265573 res!129886) b!265574))

(declare-fun m!282525 () Bool)

(assert (=> b!265573 m!282525))

(declare-fun m!282527 () Bool)

(assert (=> b!265574 m!282527))

(assert (=> b!265434 d!64301))

(declare-fun b!265595 () Bool)

(declare-fun e!171989 () Bool)

(declare-fun call!25327 () Bool)

(assert (=> b!265595 (= e!171989 call!25327)))

(declare-fun bm!25324 () Bool)

(assert (=> bm!25324 (= call!25327 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun d!64303 () Bool)

(declare-fun res!129892 () Bool)

(declare-fun e!171990 () Bool)

(assert (=> d!64303 (=> res!129892 e!171990)))

(assert (=> d!64303 (= res!129892 (bvsge #b00000000000000000000000000000000 (size!6395 a!3436)))))

(assert (=> d!64303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171990)))

(declare-fun b!265596 () Bool)

(declare-fun e!171988 () Bool)

(assert (=> b!265596 (= e!171988 call!25327)))

(declare-fun b!265597 () Bool)

(assert (=> b!265597 (= e!171990 e!171988)))

(declare-fun c!45403 () Bool)

(assert (=> b!265597 (= c!45403 (validKeyInArray!0 (select (arr!6043 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265598 () Bool)

(assert (=> b!265598 (= e!171988 e!171989)))

(declare-fun lt!134202 () (_ BitVec 64))

(assert (=> b!265598 (= lt!134202 (select (arr!6043 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8245 0))(
  ( (Unit!8246) )
))
(declare-fun lt!134204 () Unit!8245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12775 (_ BitVec 64) (_ BitVec 32)) Unit!8245)

(assert (=> b!265598 (= lt!134204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134202 #b00000000000000000000000000000000))))

(assert (=> b!265598 (arrayContainsKey!0 a!3436 lt!134202 #b00000000000000000000000000000000)))

(declare-fun lt!134203 () Unit!8245)

(assert (=> b!265598 (= lt!134203 lt!134204)))

(declare-fun res!129891 () Bool)

(assert (=> b!265598 (= res!129891 (= (seekEntryOrOpen!0 (select (arr!6043 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1199 #b00000000000000000000000000000000)))))

(assert (=> b!265598 (=> (not res!129891) (not e!171989))))

(assert (= (and d!64303 (not res!129892)) b!265597))

(assert (= (and b!265597 c!45403) b!265598))

(assert (= (and b!265597 (not c!45403)) b!265596))

(assert (= (and b!265598 res!129891) b!265595))

(assert (= (or b!265595 b!265596) bm!25324))

(declare-fun m!282529 () Bool)

(assert (=> bm!25324 m!282529))

(assert (=> b!265597 m!282521))

(assert (=> b!265597 m!282521))

(declare-fun m!282531 () Bool)

(assert (=> b!265597 m!282531))

(assert (=> b!265598 m!282521))

(declare-fun m!282533 () Bool)

(assert (=> b!265598 m!282533))

(declare-fun m!282535 () Bool)

(assert (=> b!265598 m!282535))

(assert (=> b!265598 m!282521))

(declare-fun m!282537 () Bool)

(assert (=> b!265598 m!282537))

(assert (=> b!265437 d!64303))

(declare-fun d!64305 () Bool)

(declare-fun lt!134205 () Bool)

(assert (=> d!64305 (= lt!134205 (select (content!179 Nil!3767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171992 () Bool)

(assert (=> d!64305 (= lt!134205 e!171992)))

(declare-fun res!129893 () Bool)

(assert (=> d!64305 (=> (not res!129893) (not e!171992))))

(assert (=> d!64305 (= res!129893 ((_ is Cons!3766) Nil!3767))))

(assert (=> d!64305 (= (contains!1892 Nil!3767 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134205)))

(declare-fun b!265599 () Bool)

(declare-fun e!171991 () Bool)

(assert (=> b!265599 (= e!171992 e!171991)))

(declare-fun res!129894 () Bool)

(assert (=> b!265599 (=> res!129894 e!171991)))

(assert (=> b!265599 (= res!129894 (= (h!4433 Nil!3767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265600 () Bool)

(assert (=> b!265600 (= e!171991 (contains!1892 (t!8844 Nil!3767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64305 res!129893) b!265599))

(assert (= (and b!265599 (not res!129894)) b!265600))

(assert (=> d!64305 m!282455))

(declare-fun m!282539 () Bool)

(assert (=> d!64305 m!282539))

(declare-fun m!282541 () Bool)

(assert (=> b!265600 m!282541))

(assert (=> b!265432 d!64305))

(check-sat (not b!265568) (not b!265574) (not b!265573) (not bm!25324) (not d!64261) (not d!64305) (not b!265597) (not b!265537) (not d!64263) (not b!265598) (not b!265600) (not b!265498))
(check-sat)
