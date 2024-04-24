; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81804 () Bool)

(assert start!81804)

(declare-fun res!638786 () Bool)

(declare-fun e!537512 () Bool)

(assert (=> start!81804 (=> (not res!638786) (not e!537512))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81804 (= res!638786 (validMask!0 mask!4034))))

(assert (=> start!81804 e!537512))

(assert (=> start!81804 true))

(declare-datatypes ((array!57748 0))(
  ( (array!57749 (arr!27757 (Array (_ BitVec 32) (_ BitVec 64))) (size!28237 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57748)

(declare-fun array_inv!21616 (array!57748) Bool)

(assert (=> start!81804 (array_inv!21616 a!3460)))

(declare-fun b!954162 () Bool)

(assert (=> b!954162 (= e!537512 (bvslt mask!4034 #b00000000000000000000000000000000))))

(declare-fun b!954161 () Bool)

(declare-fun res!638785 () Bool)

(assert (=> b!954161 (=> (not res!638785) (not e!537512))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954161 (= res!638785 (validKeyInArray!0 k0!2725))))

(declare-fun b!954159 () Bool)

(declare-fun res!638784 () Bool)

(assert (=> b!954159 (=> (not res!638784) (not e!537512))))

(assert (=> b!954159 (= res!638784 (= (size!28237 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954160 () Bool)

(declare-fun res!638787 () Bool)

(assert (=> b!954160 (=> (not res!638787) (not e!537512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57748 (_ BitVec 32)) Bool)

(assert (=> b!954160 (= res!638787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81804 res!638786) b!954159))

(assert (= (and b!954159 res!638784) b!954160))

(assert (= (and b!954160 res!638787) b!954161))

(assert (= (and b!954161 res!638785) b!954162))

(declare-fun m!886631 () Bool)

(assert (=> start!81804 m!886631))

(declare-fun m!886633 () Bool)

(assert (=> start!81804 m!886633))

(declare-fun m!886635 () Bool)

(assert (=> b!954161 m!886635))

(declare-fun m!886637 () Bool)

(assert (=> b!954160 m!886637))

(check-sat (not b!954161) (not b!954160) (not start!81804))
(check-sat)
(get-model)

(declare-fun d!115963 () Bool)

(assert (=> d!115963 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!954161 d!115963))

(declare-fun b!954211 () Bool)

(declare-fun e!537544 () Bool)

(declare-fun call!41700 () Bool)

(assert (=> b!954211 (= e!537544 call!41700)))

(declare-fun b!954212 () Bool)

(declare-fun e!537545 () Bool)

(assert (=> b!954212 (= e!537545 e!537544)))

(declare-fun c!100071 () Bool)

(assert (=> b!954212 (= c!100071 (validKeyInArray!0 (select (arr!27757 a!3460) #b00000000000000000000000000000000)))))

(declare-fun bm!41697 () Bool)

(assert (=> bm!41697 (= call!41700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun d!115965 () Bool)

(declare-fun res!638825 () Bool)

(assert (=> d!115965 (=> res!638825 e!537545)))

(assert (=> d!115965 (= res!638825 (bvsge #b00000000000000000000000000000000 (size!28237 a!3460)))))

(assert (=> d!115965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!537545)))

(declare-fun b!954213 () Bool)

(declare-fun e!537543 () Bool)

(assert (=> b!954213 (= e!537544 e!537543)))

(declare-fun lt!430030 () (_ BitVec 64))

(assert (=> b!954213 (= lt!430030 (select (arr!27757 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32052 0))(
  ( (Unit!32053) )
))
(declare-fun lt!430031 () Unit!32052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57748 (_ BitVec 64) (_ BitVec 32)) Unit!32052)

(assert (=> b!954213 (= lt!430031 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!430030 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954213 (arrayContainsKey!0 a!3460 lt!430030 #b00000000000000000000000000000000)))

(declare-fun lt!430029 () Unit!32052)

(assert (=> b!954213 (= lt!430029 lt!430031)))

(declare-fun res!638824 () Bool)

(declare-datatypes ((SeekEntryResult!9124 0))(
  ( (MissingZero!9124 (index!38867 (_ BitVec 32))) (Found!9124 (index!38868 (_ BitVec 32))) (Intermediate!9124 (undefined!9936 Bool) (index!38869 (_ BitVec 32)) (x!81994 (_ BitVec 32))) (Undefined!9124) (MissingVacant!9124 (index!38870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57748 (_ BitVec 32)) SeekEntryResult!9124)

(assert (=> b!954213 (= res!638824 (= (seekEntryOrOpen!0 (select (arr!27757 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9124 #b00000000000000000000000000000000)))))

(assert (=> b!954213 (=> (not res!638824) (not e!537543))))

(declare-fun b!954214 () Bool)

(assert (=> b!954214 (= e!537543 call!41700)))

(assert (= (and d!115965 (not res!638825)) b!954212))

(assert (= (and b!954212 c!100071) b!954213))

(assert (= (and b!954212 (not c!100071)) b!954211))

(assert (= (and b!954213 res!638824) b!954214))

(assert (= (or b!954214 b!954211) bm!41697))

(declare-fun m!886655 () Bool)

(assert (=> b!954212 m!886655))

(assert (=> b!954212 m!886655))

(declare-fun m!886657 () Bool)

(assert (=> b!954212 m!886657))

(declare-fun m!886659 () Bool)

(assert (=> bm!41697 m!886659))

(assert (=> b!954213 m!886655))

(declare-fun m!886661 () Bool)

(assert (=> b!954213 m!886661))

(declare-fun m!886663 () Bool)

(assert (=> b!954213 m!886663))

(assert (=> b!954213 m!886655))

(declare-fun m!886665 () Bool)

(assert (=> b!954213 m!886665))

(assert (=> b!954160 d!115965))

(declare-fun d!115973 () Bool)

(assert (=> d!115973 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81804 d!115973))

(declare-fun d!115979 () Bool)

(assert (=> d!115979 (= (array_inv!21616 a!3460) (bvsge (size!28237 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81804 d!115979))

(check-sat (not bm!41697) (not b!954213) (not b!954212))
(check-sat)
