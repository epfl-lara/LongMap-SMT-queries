; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31494 () Bool)

(assert start!31494)

(declare-fun res!170762 () Bool)

(declare-fun e!196256 () Bool)

(assert (=> start!31494 (=> (not res!170762) (not e!196256))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31494 (= res!170762 (validMask!0 mask!3709))))

(assert (=> start!31494 e!196256))

(declare-datatypes ((array!16082 0))(
  ( (array!16083 (arr!7612 (Array (_ BitVec 32) (_ BitVec 64))) (size!7964 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16082)

(declare-fun array_inv!5562 (array!16082) Bool)

(assert (=> start!31494 (array_inv!5562 a!3293)))

(assert (=> start!31494 true))

(declare-fun b!315259 () Bool)

(declare-fun res!170764 () Bool)

(assert (=> b!315259 (=> (not res!170764) (not e!196256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16082 (_ BitVec 32)) Bool)

(assert (=> b!315259 (= res!170764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315260 () Bool)

(declare-fun res!170758 () Bool)

(assert (=> b!315260 (=> (not res!170758) (not e!196256))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2717 0))(
  ( (MissingZero!2717 (index!13044 (_ BitVec 32))) (Found!2717 (index!13045 (_ BitVec 32))) (Intermediate!2717 (undefined!3529 Bool) (index!13046 (_ BitVec 32)) (x!31391 (_ BitVec 32))) (Undefined!2717) (MissingVacant!2717 (index!13047 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16082 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!315260 (= res!170758 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2717 i!1240)))))

(declare-fun b!315261 () Bool)

(declare-fun res!170760 () Bool)

(assert (=> b!315261 (=> (not res!170760) (not e!196256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315261 (= res!170760 (validKeyInArray!0 k0!2441))))

(declare-fun b!315262 () Bool)

(declare-fun e!196257 () Bool)

(assert (=> b!315262 (= e!196256 e!196257)))

(declare-fun res!170759 () Bool)

(assert (=> b!315262 (=> (not res!170759) (not e!196257))))

(declare-fun lt!154228 () SeekEntryResult!2717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16082 (_ BitVec 32)) SeekEntryResult!2717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315262 (= res!170759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154228))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315262 (= lt!154228 (Intermediate!2717 false resIndex!52 resX!52))))

(declare-fun b!315263 () Bool)

(declare-fun e!196255 () Bool)

(assert (=> b!315263 (= e!196257 e!196255)))

(declare-fun res!170766 () Bool)

(assert (=> b!315263 (=> (not res!170766) (not e!196255))))

(declare-fun lt!154229 () SeekEntryResult!2717)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315263 (= res!170766 (and (= lt!154229 lt!154228) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7612 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7612 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7612 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315263 (= lt!154229 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!315264 () Bool)

(assert (=> b!315264 (= e!196255 (not false))))

(declare-fun lt!154230 () SeekEntryResult!2717)

(get-info :version)

(assert (=> b!315264 (and (= lt!154229 lt!154230) ((_ is Intermediate!2717) lt!154230))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315264 (= lt!154230 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315265 () Bool)

(declare-fun res!170763 () Bool)

(assert (=> b!315265 (=> (not res!170763) (not e!196257))))

(assert (=> b!315265 (= res!170763 (and (= (select (arr!7612 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7964 a!3293))))))

(declare-fun b!315266 () Bool)

(declare-fun res!170761 () Bool)

(assert (=> b!315266 (=> (not res!170761) (not e!196256))))

(declare-fun arrayContainsKey!0 (array!16082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315266 (= res!170761 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315267 () Bool)

(declare-fun res!170765 () Bool)

(assert (=> b!315267 (=> (not res!170765) (not e!196256))))

(assert (=> b!315267 (= res!170765 (and (= (size!7964 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7964 a!3293))))))

(assert (= (and start!31494 res!170762) b!315267))

(assert (= (and b!315267 res!170765) b!315261))

(assert (= (and b!315261 res!170760) b!315266))

(assert (= (and b!315266 res!170761) b!315260))

(assert (= (and b!315260 res!170758) b!315259))

(assert (= (and b!315259 res!170764) b!315262))

(assert (= (and b!315262 res!170759) b!315265))

(assert (= (and b!315265 res!170763) b!315263))

(assert (= (and b!315263 res!170766) b!315264))

(declare-fun m!324763 () Bool)

(assert (=> b!315265 m!324763))

(declare-fun m!324765 () Bool)

(assert (=> b!315262 m!324765))

(assert (=> b!315262 m!324765))

(declare-fun m!324767 () Bool)

(assert (=> b!315262 m!324767))

(declare-fun m!324769 () Bool)

(assert (=> b!315260 m!324769))

(declare-fun m!324771 () Bool)

(assert (=> b!315261 m!324771))

(declare-fun m!324773 () Bool)

(assert (=> b!315264 m!324773))

(assert (=> b!315264 m!324773))

(declare-fun m!324775 () Bool)

(assert (=> b!315264 m!324775))

(declare-fun m!324777 () Bool)

(assert (=> b!315263 m!324777))

(declare-fun m!324779 () Bool)

(assert (=> b!315263 m!324779))

(declare-fun m!324781 () Bool)

(assert (=> b!315266 m!324781))

(declare-fun m!324783 () Bool)

(assert (=> start!31494 m!324783))

(declare-fun m!324785 () Bool)

(assert (=> start!31494 m!324785))

(declare-fun m!324787 () Bool)

(assert (=> b!315259 m!324787))

(check-sat (not start!31494) (not b!315261) (not b!315266) (not b!315264) (not b!315259) (not b!315263) (not b!315260) (not b!315262))
(check-sat)
(get-model)

(declare-fun d!68927 () Bool)

(assert (=> d!68927 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31494 d!68927))

(declare-fun d!68931 () Bool)

(assert (=> d!68931 (= (array_inv!5562 a!3293) (bvsge (size!7964 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31494 d!68931))

(declare-fun d!68933 () Bool)

(declare-fun res!170825 () Bool)

(declare-fun e!196286 () Bool)

(assert (=> d!68933 (=> res!170825 e!196286)))

(assert (=> d!68933 (= res!170825 (= (select (arr!7612 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68933 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196286)))

(declare-fun b!315326 () Bool)

(declare-fun e!196287 () Bool)

(assert (=> b!315326 (= e!196286 e!196287)))

(declare-fun res!170826 () Bool)

(assert (=> b!315326 (=> (not res!170826) (not e!196287))))

(assert (=> b!315326 (= res!170826 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7964 a!3293)))))

(declare-fun b!315327 () Bool)

(assert (=> b!315327 (= e!196287 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68933 (not res!170825)) b!315326))

(assert (= (and b!315326 res!170826) b!315327))

(declare-fun m!324841 () Bool)

(assert (=> d!68933 m!324841))

(declare-fun m!324843 () Bool)

(assert (=> b!315327 m!324843))

(assert (=> b!315266 d!68933))

(declare-fun b!315360 () Bool)

(declare-fun e!196308 () SeekEntryResult!2717)

(declare-fun e!196309 () SeekEntryResult!2717)

(assert (=> b!315360 (= e!196308 e!196309)))

(declare-fun lt!154268 () (_ BitVec 64))

(declare-fun lt!154269 () SeekEntryResult!2717)

(assert (=> b!315360 (= lt!154268 (select (arr!7612 a!3293) (index!13046 lt!154269)))))

(declare-fun c!49881 () Bool)

(assert (=> b!315360 (= c!49881 (= lt!154268 k0!2441))))

(declare-fun b!315361 () Bool)

(declare-fun c!49879 () Bool)

(assert (=> b!315361 (= c!49879 (= lt!154268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196307 () SeekEntryResult!2717)

(assert (=> b!315361 (= e!196309 e!196307)))

(declare-fun b!315362 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16082 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!315362 (= e!196307 (seekKeyOrZeroReturnVacant!0 (x!31391 lt!154269) (index!13046 lt!154269) (index!13046 lt!154269) k0!2441 a!3293 mask!3709))))

(declare-fun b!315363 () Bool)

(assert (=> b!315363 (= e!196308 Undefined!2717)))

(declare-fun d!68935 () Bool)

(declare-fun lt!154270 () SeekEntryResult!2717)

(assert (=> d!68935 (and (or ((_ is Undefined!2717) lt!154270) (not ((_ is Found!2717) lt!154270)) (and (bvsge (index!13045 lt!154270) #b00000000000000000000000000000000) (bvslt (index!13045 lt!154270) (size!7964 a!3293)))) (or ((_ is Undefined!2717) lt!154270) ((_ is Found!2717) lt!154270) (not ((_ is MissingZero!2717) lt!154270)) (and (bvsge (index!13044 lt!154270) #b00000000000000000000000000000000) (bvslt (index!13044 lt!154270) (size!7964 a!3293)))) (or ((_ is Undefined!2717) lt!154270) ((_ is Found!2717) lt!154270) ((_ is MissingZero!2717) lt!154270) (not ((_ is MissingVacant!2717) lt!154270)) (and (bvsge (index!13047 lt!154270) #b00000000000000000000000000000000) (bvslt (index!13047 lt!154270) (size!7964 a!3293)))) (or ((_ is Undefined!2717) lt!154270) (ite ((_ is Found!2717) lt!154270) (= (select (arr!7612 a!3293) (index!13045 lt!154270)) k0!2441) (ite ((_ is MissingZero!2717) lt!154270) (= (select (arr!7612 a!3293) (index!13044 lt!154270)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2717) lt!154270) (= (select (arr!7612 a!3293) (index!13047 lt!154270)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68935 (= lt!154270 e!196308)))

(declare-fun c!49880 () Bool)

(assert (=> d!68935 (= c!49880 (and ((_ is Intermediate!2717) lt!154269) (undefined!3529 lt!154269)))))

(assert (=> d!68935 (= lt!154269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68935 (validMask!0 mask!3709)))

(assert (=> d!68935 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154270)))

(declare-fun b!315364 () Bool)

(assert (=> b!315364 (= e!196309 (Found!2717 (index!13046 lt!154269)))))

(declare-fun b!315365 () Bool)

(assert (=> b!315365 (= e!196307 (MissingZero!2717 (index!13046 lt!154269)))))

(assert (= (and d!68935 c!49880) b!315363))

(assert (= (and d!68935 (not c!49880)) b!315360))

(assert (= (and b!315360 c!49881) b!315364))

(assert (= (and b!315360 (not c!49881)) b!315361))

(assert (= (and b!315361 c!49879) b!315365))

(assert (= (and b!315361 (not c!49879)) b!315362))

(declare-fun m!324857 () Bool)

(assert (=> b!315360 m!324857))

(declare-fun m!324859 () Bool)

(assert (=> b!315362 m!324859))

(assert (=> d!68935 m!324783))

(declare-fun m!324861 () Bool)

(assert (=> d!68935 m!324861))

(declare-fun m!324863 () Bool)

(assert (=> d!68935 m!324863))

(assert (=> d!68935 m!324765))

(assert (=> d!68935 m!324767))

(declare-fun m!324865 () Bool)

(assert (=> d!68935 m!324865))

(assert (=> d!68935 m!324765))

(assert (=> b!315260 d!68935))

(declare-fun b!315445 () Bool)

(declare-fun e!196359 () Bool)

(declare-fun e!196361 () Bool)

(assert (=> b!315445 (= e!196359 e!196361)))

(declare-fun res!170868 () Bool)

(declare-fun lt!154289 () SeekEntryResult!2717)

(assert (=> b!315445 (= res!170868 (and ((_ is Intermediate!2717) lt!154289) (not (undefined!3529 lt!154289)) (bvslt (x!31391 lt!154289) #b01111111111111111111111111111110) (bvsge (x!31391 lt!154289) #b00000000000000000000000000000000) (bvsge (x!31391 lt!154289) #b00000000000000000000000000000000)))))

(assert (=> b!315445 (=> (not res!170868) (not e!196361))))

(declare-fun b!315446 () Bool)

(assert (=> b!315446 (and (bvsge (index!13046 lt!154289) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154289) (size!7964 a!3293)))))

(declare-fun e!196360 () Bool)

(assert (=> b!315446 (= e!196360 (= (select (arr!7612 a!3293) (index!13046 lt!154289)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315447 () Bool)

(declare-fun e!196358 () SeekEntryResult!2717)

(declare-fun e!196357 () SeekEntryResult!2717)

(assert (=> b!315447 (= e!196358 e!196357)))

(declare-fun c!49907 () Bool)

(declare-fun lt!154288 () (_ BitVec 64))

(assert (=> b!315447 (= c!49907 (or (= lt!154288 k0!2441) (= (bvadd lt!154288 lt!154288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315448 () Bool)

(assert (=> b!315448 (= e!196359 (bvsge (x!31391 lt!154289) #b01111111111111111111111111111110))))

(declare-fun d!68941 () Bool)

(assert (=> d!68941 e!196359))

(declare-fun c!49906 () Bool)

(assert (=> d!68941 (= c!49906 (and ((_ is Intermediate!2717) lt!154289) (undefined!3529 lt!154289)))))

(assert (=> d!68941 (= lt!154289 e!196358)))

(declare-fun c!49905 () Bool)

(assert (=> d!68941 (= c!49905 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68941 (= lt!154288 (select (arr!7612 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68941 (validMask!0 mask!3709)))

(assert (=> d!68941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154289)))

(declare-fun b!315449 () Bool)

(assert (=> b!315449 (= e!196357 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315450 () Bool)

(assert (=> b!315450 (= e!196357 (Intermediate!2717 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315451 () Bool)

(assert (=> b!315451 (= e!196358 (Intermediate!2717 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315452 () Bool)

(assert (=> b!315452 (and (bvsge (index!13046 lt!154289) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154289) (size!7964 a!3293)))))

(declare-fun res!170867 () Bool)

(assert (=> b!315452 (= res!170867 (= (select (arr!7612 a!3293) (index!13046 lt!154289)) k0!2441))))

(assert (=> b!315452 (=> res!170867 e!196360)))

(assert (=> b!315452 (= e!196361 e!196360)))

(declare-fun b!315453 () Bool)

(assert (=> b!315453 (and (bvsge (index!13046 lt!154289) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154289) (size!7964 a!3293)))))

(declare-fun res!170866 () Bool)

(assert (=> b!315453 (= res!170866 (= (select (arr!7612 a!3293) (index!13046 lt!154289)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315453 (=> res!170866 e!196360)))

(assert (= (and d!68941 c!49905) b!315451))

(assert (= (and d!68941 (not c!49905)) b!315447))

(assert (= (and b!315447 c!49907) b!315450))

(assert (= (and b!315447 (not c!49907)) b!315449))

(assert (= (and d!68941 c!49906) b!315448))

(assert (= (and d!68941 (not c!49906)) b!315445))

(assert (= (and b!315445 res!170868) b!315452))

(assert (= (and b!315452 (not res!170867)) b!315453))

(assert (= (and b!315453 (not res!170866)) b!315446))

(declare-fun m!324891 () Bool)

(assert (=> b!315446 m!324891))

(assert (=> d!68941 m!324765))

(declare-fun m!324893 () Bool)

(assert (=> d!68941 m!324893))

(assert (=> d!68941 m!324783))

(assert (=> b!315452 m!324891))

(assert (=> b!315449 m!324765))

(declare-fun m!324895 () Bool)

(assert (=> b!315449 m!324895))

(assert (=> b!315449 m!324895))

(declare-fun m!324897 () Bool)

(assert (=> b!315449 m!324897))

(assert (=> b!315453 m!324891))

(assert (=> b!315262 d!68941))

(declare-fun d!68957 () Bool)

(declare-fun lt!154308 () (_ BitVec 32))

(declare-fun lt!154307 () (_ BitVec 32))

(assert (=> d!68957 (= lt!154308 (bvmul (bvxor lt!154307 (bvlshr lt!154307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68957 (= lt!154307 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68957 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170871 (let ((h!5279 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31398 (bvmul (bvxor h!5279 (bvlshr h!5279 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31398 (bvlshr x!31398 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170871 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170871 #b00000000000000000000000000000000))))))

(assert (=> d!68957 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154308 (bvlshr lt!154308 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!315262 d!68957))

(declare-fun d!68969 () Bool)

(assert (=> d!68969 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315261 d!68969))

(declare-fun b!315484 () Bool)

(declare-fun e!196383 () Bool)

(declare-fun e!196385 () Bool)

(assert (=> b!315484 (= e!196383 e!196385)))

(declare-fun res!170885 () Bool)

(declare-fun lt!154310 () SeekEntryResult!2717)

(assert (=> b!315484 (= res!170885 (and ((_ is Intermediate!2717) lt!154310) (not (undefined!3529 lt!154310)) (bvslt (x!31391 lt!154310) #b01111111111111111111111111111110) (bvsge (x!31391 lt!154310) #b00000000000000000000000000000000) (bvsge (x!31391 lt!154310) x!1427)))))

(assert (=> b!315484 (=> (not res!170885) (not e!196385))))

(declare-fun b!315485 () Bool)

(assert (=> b!315485 (and (bvsge (index!13046 lt!154310) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154310) (size!7964 a!3293)))))

(declare-fun e!196384 () Bool)

(assert (=> b!315485 (= e!196384 (= (select (arr!7612 a!3293) (index!13046 lt!154310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315486 () Bool)

(declare-fun e!196382 () SeekEntryResult!2717)

(declare-fun e!196381 () SeekEntryResult!2717)

(assert (=> b!315486 (= e!196382 e!196381)))

(declare-fun c!49919 () Bool)

(declare-fun lt!154309 () (_ BitVec 64))

(assert (=> b!315486 (= c!49919 (or (= lt!154309 k0!2441) (= (bvadd lt!154309 lt!154309) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315487 () Bool)

(assert (=> b!315487 (= e!196383 (bvsge (x!31391 lt!154310) #b01111111111111111111111111111110))))

(declare-fun d!68973 () Bool)

(assert (=> d!68973 e!196383))

(declare-fun c!49918 () Bool)

(assert (=> d!68973 (= c!49918 (and ((_ is Intermediate!2717) lt!154310) (undefined!3529 lt!154310)))))

(assert (=> d!68973 (= lt!154310 e!196382)))

(declare-fun c!49917 () Bool)

(assert (=> d!68973 (= c!49917 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68973 (= lt!154309 (select (arr!7612 a!3293) index!1781))))

(assert (=> d!68973 (validMask!0 mask!3709)))

(assert (=> d!68973 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154310)))

(declare-fun b!315488 () Bool)

(assert (=> b!315488 (= e!196381 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315489 () Bool)

(assert (=> b!315489 (= e!196381 (Intermediate!2717 false index!1781 x!1427))))

(declare-fun b!315490 () Bool)

(assert (=> b!315490 (= e!196382 (Intermediate!2717 true index!1781 x!1427))))

(declare-fun b!315491 () Bool)

(assert (=> b!315491 (and (bvsge (index!13046 lt!154310) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154310) (size!7964 a!3293)))))

(declare-fun res!170884 () Bool)

(assert (=> b!315491 (= res!170884 (= (select (arr!7612 a!3293) (index!13046 lt!154310)) k0!2441))))

(assert (=> b!315491 (=> res!170884 e!196384)))

(assert (=> b!315491 (= e!196385 e!196384)))

(declare-fun b!315492 () Bool)

(assert (=> b!315492 (and (bvsge (index!13046 lt!154310) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154310) (size!7964 a!3293)))))

(declare-fun res!170883 () Bool)

(assert (=> b!315492 (= res!170883 (= (select (arr!7612 a!3293) (index!13046 lt!154310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315492 (=> res!170883 e!196384)))

(assert (= (and d!68973 c!49917) b!315490))

(assert (= (and d!68973 (not c!49917)) b!315486))

(assert (= (and b!315486 c!49919) b!315489))

(assert (= (and b!315486 (not c!49919)) b!315488))

(assert (= (and d!68973 c!49918) b!315487))

(assert (= (and d!68973 (not c!49918)) b!315484))

(assert (= (and b!315484 res!170885) b!315491))

(assert (= (and b!315491 (not res!170884)) b!315492))

(assert (= (and b!315492 (not res!170883)) b!315485))

(declare-fun m!324927 () Bool)

(assert (=> b!315485 m!324927))

(assert (=> d!68973 m!324777))

(assert (=> d!68973 m!324783))

(assert (=> b!315491 m!324927))

(declare-fun m!324929 () Bool)

(assert (=> b!315488 m!324929))

(assert (=> b!315488 m!324929))

(declare-fun m!324931 () Bool)

(assert (=> b!315488 m!324931))

(assert (=> b!315492 m!324927))

(assert (=> b!315263 d!68973))

(declare-fun b!315501 () Bool)

(declare-fun e!196394 () Bool)

(declare-fun call!25985 () Bool)

(assert (=> b!315501 (= e!196394 call!25985)))

(declare-fun b!315502 () Bool)

(declare-fun e!196393 () Bool)

(assert (=> b!315502 (= e!196393 e!196394)))

(declare-fun lt!154328 () (_ BitVec 64))

(assert (=> b!315502 (= lt!154328 (select (arr!7612 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9667 0))(
  ( (Unit!9668) )
))
(declare-fun lt!154327 () Unit!9667)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16082 (_ BitVec 64) (_ BitVec 32)) Unit!9667)

(assert (=> b!315502 (= lt!154327 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154328 #b00000000000000000000000000000000))))

(assert (=> b!315502 (arrayContainsKey!0 a!3293 lt!154328 #b00000000000000000000000000000000)))

(declare-fun lt!154326 () Unit!9667)

(assert (=> b!315502 (= lt!154326 lt!154327)))

(declare-fun res!170890 () Bool)

(assert (=> b!315502 (= res!170890 (= (seekEntryOrOpen!0 (select (arr!7612 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2717 #b00000000000000000000000000000000)))))

(assert (=> b!315502 (=> (not res!170890) (not e!196394))))

(declare-fun b!315503 () Bool)

(assert (=> b!315503 (= e!196393 call!25985)))

(declare-fun d!68975 () Bool)

(declare-fun res!170891 () Bool)

(declare-fun e!196392 () Bool)

(assert (=> d!68975 (=> res!170891 e!196392)))

(assert (=> d!68975 (= res!170891 (bvsge #b00000000000000000000000000000000 (size!7964 a!3293)))))

(assert (=> d!68975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196392)))

(declare-fun bm!25982 () Bool)

(assert (=> bm!25982 (= call!25985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!315504 () Bool)

(assert (=> b!315504 (= e!196392 e!196393)))

(declare-fun c!49922 () Bool)

(assert (=> b!315504 (= c!49922 (validKeyInArray!0 (select (arr!7612 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68975 (not res!170891)) b!315504))

(assert (= (and b!315504 c!49922) b!315502))

(assert (= (and b!315504 (not c!49922)) b!315503))

(assert (= (and b!315502 res!170890) b!315501))

(assert (= (or b!315501 b!315503) bm!25982))

(assert (=> b!315502 m!324841))

(declare-fun m!324935 () Bool)

(assert (=> b!315502 m!324935))

(declare-fun m!324937 () Bool)

(assert (=> b!315502 m!324937))

(assert (=> b!315502 m!324841))

(declare-fun m!324939 () Bool)

(assert (=> b!315502 m!324939))

(declare-fun m!324941 () Bool)

(assert (=> bm!25982 m!324941))

(assert (=> b!315504 m!324841))

(assert (=> b!315504 m!324841))

(declare-fun m!324943 () Bool)

(assert (=> b!315504 m!324943))

(assert (=> b!315259 d!68975))

(declare-fun b!315505 () Bool)

(declare-fun e!196397 () Bool)

(declare-fun e!196399 () Bool)

(assert (=> b!315505 (= e!196397 e!196399)))

(declare-fun res!170894 () Bool)

(declare-fun lt!154330 () SeekEntryResult!2717)

(assert (=> b!315505 (= res!170894 (and ((_ is Intermediate!2717) lt!154330) (not (undefined!3529 lt!154330)) (bvslt (x!31391 lt!154330) #b01111111111111111111111111111110) (bvsge (x!31391 lt!154330) #b00000000000000000000000000000000) (bvsge (x!31391 lt!154330) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315505 (=> (not res!170894) (not e!196399))))

(declare-fun b!315506 () Bool)

(assert (=> b!315506 (and (bvsge (index!13046 lt!154330) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154330) (size!7964 a!3293)))))

(declare-fun e!196398 () Bool)

(assert (=> b!315506 (= e!196398 (= (select (arr!7612 a!3293) (index!13046 lt!154330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315507 () Bool)

(declare-fun e!196396 () SeekEntryResult!2717)

(declare-fun e!196395 () SeekEntryResult!2717)

(assert (=> b!315507 (= e!196396 e!196395)))

(declare-fun c!49925 () Bool)

(declare-fun lt!154329 () (_ BitVec 64))

(assert (=> b!315507 (= c!49925 (or (= lt!154329 k0!2441) (= (bvadd lt!154329 lt!154329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315508 () Bool)

(assert (=> b!315508 (= e!196397 (bvsge (x!31391 lt!154330) #b01111111111111111111111111111110))))

(declare-fun d!68981 () Bool)

(assert (=> d!68981 e!196397))

(declare-fun c!49924 () Bool)

(assert (=> d!68981 (= c!49924 (and ((_ is Intermediate!2717) lt!154330) (undefined!3529 lt!154330)))))

(assert (=> d!68981 (= lt!154330 e!196396)))

(declare-fun c!49923 () Bool)

(assert (=> d!68981 (= c!49923 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68981 (= lt!154329 (select (arr!7612 a!3293) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709)))))

(assert (=> d!68981 (validMask!0 mask!3709)))

(assert (=> d!68981 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709) lt!154330)))

(declare-fun b!315509 () Bool)

(assert (=> b!315509 (= e!196395 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315510 () Bool)

(assert (=> b!315510 (= e!196395 (Intermediate!2717 false (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315511 () Bool)

(assert (=> b!315511 (= e!196396 (Intermediate!2717 true (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315512 () Bool)

(assert (=> b!315512 (and (bvsge (index!13046 lt!154330) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154330) (size!7964 a!3293)))))

(declare-fun res!170893 () Bool)

(assert (=> b!315512 (= res!170893 (= (select (arr!7612 a!3293) (index!13046 lt!154330)) k0!2441))))

(assert (=> b!315512 (=> res!170893 e!196398)))

(assert (=> b!315512 (= e!196399 e!196398)))

(declare-fun b!315513 () Bool)

(assert (=> b!315513 (and (bvsge (index!13046 lt!154330) #b00000000000000000000000000000000) (bvslt (index!13046 lt!154330) (size!7964 a!3293)))))

(declare-fun res!170892 () Bool)

(assert (=> b!315513 (= res!170892 (= (select (arr!7612 a!3293) (index!13046 lt!154330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315513 (=> res!170892 e!196398)))

(assert (= (and d!68981 c!49923) b!315511))

(assert (= (and d!68981 (not c!49923)) b!315507))

(assert (= (and b!315507 c!49925) b!315510))

(assert (= (and b!315507 (not c!49925)) b!315509))

(assert (= (and d!68981 c!49924) b!315508))

(assert (= (and d!68981 (not c!49924)) b!315505))

(assert (= (and b!315505 res!170894) b!315512))

(assert (= (and b!315512 (not res!170893)) b!315513))

(assert (= (and b!315513 (not res!170892)) b!315506))

(declare-fun m!324945 () Bool)

(assert (=> b!315506 m!324945))

(assert (=> d!68981 m!324773))

(declare-fun m!324947 () Bool)

(assert (=> d!68981 m!324947))

(assert (=> d!68981 m!324783))

(assert (=> b!315512 m!324945))

(assert (=> b!315509 m!324773))

(declare-fun m!324949 () Bool)

(assert (=> b!315509 m!324949))

(assert (=> b!315509 m!324949))

(declare-fun m!324951 () Bool)

(assert (=> b!315509 m!324951))

(assert (=> b!315513 m!324945))

(assert (=> b!315264 d!68981))

(declare-fun d!68983 () Bool)

(declare-fun lt!154333 () (_ BitVec 32))

(assert (=> d!68983 (and (bvsge lt!154333 #b00000000000000000000000000000000) (bvslt lt!154333 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68983 (= lt!154333 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68983 (validMask!0 mask!3709)))

(assert (=> d!68983 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!154333)))

(declare-fun bs!11045 () Bool)

(assert (= bs!11045 d!68983))

(declare-fun m!324953 () Bool)

(assert (=> bs!11045 m!324953))

(assert (=> bs!11045 m!324783))

(assert (=> b!315264 d!68983))

(check-sat (not d!68973) (not d!68935) (not b!315327) (not b!315504) (not d!68983) (not b!315488) (not b!315509) (not bm!25982) (not b!315362) (not b!315449) (not d!68941) (not b!315502) (not d!68981))
(check-sat)
