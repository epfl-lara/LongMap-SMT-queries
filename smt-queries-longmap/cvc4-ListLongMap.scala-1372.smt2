; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27034 () Bool)

(assert start!27034)

(declare-fun b!279629 () Bool)

(declare-fun res!142799 () Bool)

(declare-fun e!178242 () Bool)

(assert (=> b!279629 (=> (not res!142799) (not e!178242))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279629 (= res!142799 (not (= startIndex!26 i!1267)))))

(declare-fun b!279630 () Bool)

(declare-fun e!178243 () Bool)

(assert (=> b!279630 (= e!178243 e!178242)))

(declare-fun res!142790 () Bool)

(assert (=> b!279630 (=> (not res!142790) (not e!178242))))

(declare-datatypes ((SeekEntryResult!1753 0))(
  ( (MissingZero!1753 (index!9182 (_ BitVec 32))) (Found!1753 (index!9183 (_ BitVec 32))) (Intermediate!1753 (undefined!2565 Bool) (index!9184 (_ BitVec 32)) (x!27423 (_ BitVec 32))) (Undefined!1753) (MissingVacant!1753 (index!9185 (_ BitVec 32))) )
))
(declare-fun lt!138664 () SeekEntryResult!1753)

(assert (=> b!279630 (= res!142790 (or (= lt!138664 (MissingZero!1753 i!1267)) (= lt!138664 (MissingVacant!1753 i!1267))))))

(declare-datatypes ((array!13903 0))(
  ( (array!13904 (arr!6595 (Array (_ BitVec 32) (_ BitVec 64))) (size!6947 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13903)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13903 (_ BitVec 32)) SeekEntryResult!1753)

(assert (=> b!279630 (= lt!138664 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279631 () Bool)

(declare-fun res!142793 () Bool)

(assert (=> b!279631 (=> (not res!142793) (not e!178243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279631 (= res!142793 (validKeyInArray!0 k!2581))))

(declare-fun b!279632 () Bool)

(declare-fun res!142789 () Bool)

(assert (=> b!279632 (=> (not res!142789) (not e!178242))))

(declare-datatypes ((List!4403 0))(
  ( (Nil!4400) (Cons!4399 (h!5069 (_ BitVec 64)) (t!9485 List!4403)) )
))
(declare-fun noDuplicate!157 (List!4403) Bool)

(assert (=> b!279632 (= res!142789 (noDuplicate!157 Nil!4400))))

(declare-fun b!279633 () Bool)

(declare-fun res!142795 () Bool)

(assert (=> b!279633 (=> (not res!142795) (not e!178242))))

(declare-fun contains!1975 (List!4403 (_ BitVec 64)) Bool)

(assert (=> b!279633 (= res!142795 (not (contains!1975 Nil!4400 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279634 () Bool)

(declare-fun res!142788 () Bool)

(assert (=> b!279634 (=> (not res!142788) (not e!178243))))

(declare-fun arrayNoDuplicates!0 (array!13903 (_ BitVec 32) List!4403) Bool)

(assert (=> b!279634 (= res!142788 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4400))))

(declare-fun res!142791 () Bool)

(assert (=> start!27034 (=> (not res!142791) (not e!178243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27034 (= res!142791 (validMask!0 mask!3868))))

(assert (=> start!27034 e!178243))

(declare-fun array_inv!4558 (array!13903) Bool)

(assert (=> start!27034 (array_inv!4558 a!3325)))

(assert (=> start!27034 true))

(declare-fun b!279635 () Bool)

(declare-fun res!142794 () Bool)

(assert (=> b!279635 (=> (not res!142794) (not e!178243))))

(assert (=> b!279635 (= res!142794 (and (= (size!6947 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6947 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6947 a!3325))))))

(declare-fun b!279636 () Bool)

(assert (=> b!279636 (= e!178242 (contains!1975 Nil!4400 k!2581))))

(declare-fun b!279637 () Bool)

(declare-fun res!142798 () Bool)

(assert (=> b!279637 (=> (not res!142798) (not e!178242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13903 (_ BitVec 32)) Bool)

(assert (=> b!279637 (= res!142798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279638 () Bool)

(declare-fun res!142800 () Bool)

(assert (=> b!279638 (=> (not res!142800) (not e!178242))))

(assert (=> b!279638 (= res!142800 (not (contains!1975 Nil!4400 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279639 () Bool)

(declare-fun res!142797 () Bool)

(assert (=> b!279639 (=> (not res!142797) (not e!178242))))

(assert (=> b!279639 (= res!142797 (and (bvslt (size!6947 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6947 a!3325))))))

(declare-fun b!279640 () Bool)

(declare-fun res!142792 () Bool)

(assert (=> b!279640 (=> (not res!142792) (not e!178243))))

(declare-fun arrayContainsKey!0 (array!13903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279640 (= res!142792 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279641 () Bool)

(declare-fun res!142796 () Bool)

(assert (=> b!279641 (=> (not res!142796) (not e!178242))))

(assert (=> b!279641 (= res!142796 (validKeyInArray!0 (select (arr!6595 a!3325) startIndex!26)))))

(assert (= (and start!27034 res!142791) b!279635))

(assert (= (and b!279635 res!142794) b!279631))

(assert (= (and b!279631 res!142793) b!279634))

(assert (= (and b!279634 res!142788) b!279640))

(assert (= (and b!279640 res!142792) b!279630))

(assert (= (and b!279630 res!142790) b!279637))

(assert (= (and b!279637 res!142798) b!279629))

(assert (= (and b!279629 res!142799) b!279641))

(assert (= (and b!279641 res!142796) b!279639))

(assert (= (and b!279639 res!142797) b!279632))

(assert (= (and b!279632 res!142789) b!279633))

(assert (= (and b!279633 res!142795) b!279638))

(assert (= (and b!279638 res!142800) b!279636))

(declare-fun m!294313 () Bool)

(assert (=> b!279638 m!294313))

(declare-fun m!294315 () Bool)

(assert (=> b!279631 m!294315))

(declare-fun m!294317 () Bool)

(assert (=> b!279632 m!294317))

(declare-fun m!294319 () Bool)

(assert (=> b!279630 m!294319))

(declare-fun m!294321 () Bool)

(assert (=> b!279633 m!294321))

(declare-fun m!294323 () Bool)

(assert (=> b!279637 m!294323))

(declare-fun m!294325 () Bool)

(assert (=> start!27034 m!294325))

(declare-fun m!294327 () Bool)

(assert (=> start!27034 m!294327))

(declare-fun m!294329 () Bool)

(assert (=> b!279640 m!294329))

(declare-fun m!294331 () Bool)

(assert (=> b!279641 m!294331))

(assert (=> b!279641 m!294331))

(declare-fun m!294333 () Bool)

(assert (=> b!279641 m!294333))

(declare-fun m!294335 () Bool)

(assert (=> b!279634 m!294335))

(declare-fun m!294337 () Bool)

(assert (=> b!279636 m!294337))

(push 1)

(assert (not b!279640))

(assert (not b!279638))

(assert (not b!279633))

(assert (not b!279636))

(assert (not b!279631))

(assert (not start!27034))

(assert (not b!279634))

(assert (not b!279637))

(assert (not b!279632))

(assert (not b!279630))

(assert (not b!279641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279704 () Bool)

(declare-fun e!178289 () SeekEntryResult!1753)

(declare-fun lt!138692 () SeekEntryResult!1753)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13903 (_ BitVec 32)) SeekEntryResult!1753)

(assert (=> b!279704 (= e!178289 (seekKeyOrZeroReturnVacant!0 (x!27423 lt!138692) (index!9184 lt!138692) (index!9184 lt!138692) k!2581 a!3325 mask!3868))))

(declare-fun b!279705 () Bool)

(declare-fun e!178290 () SeekEntryResult!1753)

(assert (=> b!279705 (= e!178290 Undefined!1753)))

(declare-fun d!65109 () Bool)

(declare-fun lt!138691 () SeekEntryResult!1753)

(assert (=> d!65109 (and (or (is-Undefined!1753 lt!138691) (not (is-Found!1753 lt!138691)) (and (bvsge (index!9183 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9183 lt!138691) (size!6947 a!3325)))) (or (is-Undefined!1753 lt!138691) (is-Found!1753 lt!138691) (not (is-MissingZero!1753 lt!138691)) (and (bvsge (index!9182 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9182 lt!138691) (size!6947 a!3325)))) (or (is-Undefined!1753 lt!138691) (is-Found!1753 lt!138691) (is-MissingZero!1753 lt!138691) (not (is-MissingVacant!1753 lt!138691)) (and (bvsge (index!9185 lt!138691) #b00000000000000000000000000000000) (bvslt (index!9185 lt!138691) (size!6947 a!3325)))) (or (is-Undefined!1753 lt!138691) (ite (is-Found!1753 lt!138691) (= (select (arr!6595 a!3325) (index!9183 lt!138691)) k!2581) (ite (is-MissingZero!1753 lt!138691) (= (select (arr!6595 a!3325) (index!9182 lt!138691)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1753 lt!138691) (= (select (arr!6595 a!3325) (index!9185 lt!138691)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65109 (= lt!138691 e!178290)))

(declare-fun c!45993 () Bool)

(assert (=> d!65109 (= c!45993 (and (is-Intermediate!1753 lt!138692) (undefined!2565 lt!138692)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13903 (_ BitVec 32)) SeekEntryResult!1753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65109 (= lt!138692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65109 (validMask!0 mask!3868)))

(assert (=> d!65109 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138691)))

(declare-fun b!279706 () Bool)

(declare-fun e!178288 () SeekEntryResult!1753)

(assert (=> b!279706 (= e!178290 e!178288)))

(declare-fun lt!138690 () (_ BitVec 64))

(assert (=> b!279706 (= lt!138690 (select (arr!6595 a!3325) (index!9184 lt!138692)))))

(declare-fun c!45994 () Bool)

(assert (=> b!279706 (= c!45994 (= lt!138690 k!2581))))

(declare-fun b!279707 () Bool)

(assert (=> b!279707 (= e!178289 (MissingZero!1753 (index!9184 lt!138692)))))

(declare-fun b!279708 () Bool)

(declare-fun c!45992 () Bool)

(assert (=> b!279708 (= c!45992 (= lt!138690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279708 (= e!178288 e!178289)))

(declare-fun b!279709 () Bool)

(assert (=> b!279709 (= e!178288 (Found!1753 (index!9184 lt!138692)))))

(assert (= (and d!65109 c!45993) b!279705))

(assert (= (and d!65109 (not c!45993)) b!279706))

(assert (= (and b!279706 c!45994) b!279709))

(assert (= (and b!279706 (not c!45994)) b!279708))

(assert (= (and b!279708 c!45992) b!279707))

(assert (= (and b!279708 (not c!45992)) b!279704))

(declare-fun m!294373 () Bool)

(assert (=> b!279704 m!294373))

(declare-fun m!294377 () Bool)

(assert (=> d!65109 m!294377))

(declare-fun m!294381 () Bool)

(assert (=> d!65109 m!294381))

(declare-fun m!294385 () Bool)

(assert (=> d!65109 m!294385))

(assert (=> d!65109 m!294377))

(declare-fun m!294387 () Bool)

(assert (=> d!65109 m!294387))

(declare-fun m!294389 () Bool)

(assert (=> d!65109 m!294389))

(assert (=> d!65109 m!294325))

(declare-fun m!294391 () Bool)

(assert (=> b!279706 m!294391))

(assert (=> b!279630 d!65109))

(declare-fun d!65127 () Bool)

(declare-fun res!142834 () Bool)

(declare-fun e!178302 () Bool)

(assert (=> d!65127 (=> res!142834 e!178302)))

(assert (=> d!65127 (= res!142834 (= (select (arr!6595 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65127 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!178302)))

(declare-fun b!279723 () Bool)

(declare-fun e!178303 () Bool)

(assert (=> b!279723 (= e!178302 e!178303)))

(declare-fun res!142835 () Bool)

(assert (=> b!279723 (=> (not res!142835) (not e!178303))))

(assert (=> b!279723 (= res!142835 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6947 a!3325)))))

(declare-fun b!279724 () Bool)

(assert (=> b!279724 (= e!178303 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65127 (not res!142834)) b!279723))

(assert (= (and b!279723 res!142835) b!279724))

(declare-fun m!294399 () Bool)

(assert (=> d!65127 m!294399))

(declare-fun m!294401 () Bool)

(assert (=> b!279724 m!294401))

(assert (=> b!279640 d!65127))

(declare-fun b!279744 () Bool)

(declare-fun e!178319 () Bool)

(assert (=> b!279744 (= e!178319 (contains!1975 Nil!4400 (select (arr!6595 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279745 () Bool)

(declare-fun e!178320 () Bool)

(declare-fun call!25452 () Bool)

(assert (=> b!279745 (= e!178320 call!25452)))

(declare-fun b!279746 () Bool)

(declare-fun e!178321 () Bool)

(assert (=> b!279746 (= e!178321 e!178320)))

(declare-fun c!46001 () Bool)

(assert (=> b!279746 (= c!46001 (validKeyInArray!0 (select (arr!6595 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25449 () Bool)

(assert (=> bm!25449 (= call!25452 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46001 (Cons!4399 (select (arr!6595 a!3325) #b00000000000000000000000000000000) Nil!4400) Nil!4400)))))

(declare-fun b!279747 () Bool)

(assert (=> b!279747 (= e!178320 call!25452)))

(declare-fun d!65131 () Bool)

(declare-fun res!142848 () Bool)

(declare-fun e!178318 () Bool)

(assert (=> d!65131 (=> res!142848 e!178318)))

(assert (=> d!65131 (= res!142848 (bvsge #b00000000000000000000000000000000 (size!6947 a!3325)))))

(assert (=> d!65131 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4400) e!178318)))

(declare-fun b!279743 () Bool)

(assert (=> b!279743 (= e!178318 e!178321)))

(declare-fun res!142846 () Bool)

(assert (=> b!279743 (=> (not res!142846) (not e!178321))))

(assert (=> b!279743 (= res!142846 (not e!178319))))

(declare-fun res!142847 () Bool)

(assert (=> b!279743 (=> (not res!142847) (not e!178319))))

(assert (=> b!279743 (= res!142847 (validKeyInArray!0 (select (arr!6595 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65131 (not res!142848)) b!279743))

(assert (= (and b!279743 res!142847) b!279744))

(assert (= (and b!279743 res!142846) b!279746))

(assert (= (and b!279746 c!46001) b!279747))

(assert (= (and b!279746 (not c!46001)) b!279745))

(assert (= (or b!279747 b!279745) bm!25449))

(assert (=> b!279744 m!294399))

(assert (=> b!279744 m!294399))

(declare-fun m!294403 () Bool)

(assert (=> b!279744 m!294403))

(assert (=> b!279746 m!294399))

(assert (=> b!279746 m!294399))

(declare-fun m!294405 () Bool)

(assert (=> b!279746 m!294405))

(assert (=> bm!25449 m!294399))

(declare-fun m!294407 () Bool)

(assert (=> bm!25449 m!294407))

(assert (=> b!279743 m!294399))

(assert (=> b!279743 m!294399))

(assert (=> b!279743 m!294405))

