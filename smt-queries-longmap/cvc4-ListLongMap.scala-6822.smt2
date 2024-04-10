; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85794 () Bool)

(assert start!85794)

(declare-fun b!995150 () Bool)

(declare-fun e!561535 () Bool)

(declare-fun e!561533 () Bool)

(assert (=> b!995150 (= e!561535 e!561533)))

(declare-fun res!665591 () Bool)

(assert (=> b!995150 (=> (not res!665591) (not e!561533))))

(declare-datatypes ((SeekEntryResult!9253 0))(
  ( (MissingZero!9253 (index!39383 (_ BitVec 32))) (Found!9253 (index!39384 (_ BitVec 32))) (Intermediate!9253 (undefined!10065 Bool) (index!39385 (_ BitVec 32)) (x!86822 (_ BitVec 32))) (Undefined!9253) (MissingVacant!9253 (index!39386 (_ BitVec 32))) )
))
(declare-fun lt!440858 () SeekEntryResult!9253)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995150 (= res!665591 (or (= lt!440858 (MissingVacant!9253 i!1194)) (= lt!440858 (MissingZero!9253 i!1194))))))

(declare-datatypes ((array!62967 0))(
  ( (array!62968 (arr!30321 (Array (_ BitVec 32) (_ BitVec 64))) (size!30823 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62967)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62967 (_ BitVec 32)) SeekEntryResult!9253)

(assert (=> b!995150 (= lt!440858 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995151 () Bool)

(declare-fun res!665588 () Bool)

(assert (=> b!995151 (=> (not res!665588) (not e!561533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62967 (_ BitVec 32)) Bool)

(assert (=> b!995151 (= res!665588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995152 () Bool)

(declare-fun res!665586 () Bool)

(assert (=> b!995152 (=> (not res!665586) (not e!561535))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995152 (= res!665586 (and (= (size!30823 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30823 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30823 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995153 () Bool)

(declare-fun res!665590 () Bool)

(assert (=> b!995153 (=> (not res!665590) (not e!561535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995153 (= res!665590 (validKeyInArray!0 (select (arr!30321 a!3219) j!170)))))

(declare-fun b!995155 () Bool)

(declare-fun res!665587 () Bool)

(assert (=> b!995155 (=> (not res!665587) (not e!561535))))

(assert (=> b!995155 (= res!665587 (validKeyInArray!0 k!2224))))

(declare-fun b!995156 () Bool)

(declare-datatypes ((List!20997 0))(
  ( (Nil!20994) (Cons!20993 (h!22155 (_ BitVec 64)) (t!29998 List!20997)) )
))
(declare-fun noDuplicate!1456 (List!20997) Bool)

(assert (=> b!995156 (= e!561533 (not (noDuplicate!1456 Nil!20994)))))

(declare-fun b!995157 () Bool)

(declare-fun res!665592 () Bool)

(assert (=> b!995157 (=> (not res!665592) (not e!561533))))

(assert (=> b!995157 (= res!665592 (and (bvsle #b00000000000000000000000000000000 (size!30823 a!3219)) (bvslt (size!30823 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!995154 () Bool)

(declare-fun res!665585 () Bool)

(assert (=> b!995154 (=> (not res!665585) (not e!561535))))

(declare-fun arrayContainsKey!0 (array!62967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995154 (= res!665585 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665589 () Bool)

(assert (=> start!85794 (=> (not res!665589) (not e!561535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85794 (= res!665589 (validMask!0 mask!3464))))

(assert (=> start!85794 e!561535))

(declare-fun array_inv!23445 (array!62967) Bool)

(assert (=> start!85794 (array_inv!23445 a!3219)))

(assert (=> start!85794 true))

(assert (= (and start!85794 res!665589) b!995152))

(assert (= (and b!995152 res!665586) b!995153))

(assert (= (and b!995153 res!665590) b!995155))

(assert (= (and b!995155 res!665587) b!995154))

(assert (= (and b!995154 res!665585) b!995150))

(assert (= (and b!995150 res!665591) b!995151))

(assert (= (and b!995151 res!665588) b!995157))

(assert (= (and b!995157 res!665592) b!995156))

(declare-fun m!922619 () Bool)

(assert (=> b!995155 m!922619))

(declare-fun m!922621 () Bool)

(assert (=> b!995156 m!922621))

(declare-fun m!922623 () Bool)

(assert (=> b!995154 m!922623))

(declare-fun m!922625 () Bool)

(assert (=> start!85794 m!922625))

(declare-fun m!922627 () Bool)

(assert (=> start!85794 m!922627))

(declare-fun m!922629 () Bool)

(assert (=> b!995153 m!922629))

(assert (=> b!995153 m!922629))

(declare-fun m!922631 () Bool)

(assert (=> b!995153 m!922631))

(declare-fun m!922633 () Bool)

(assert (=> b!995151 m!922633))

(declare-fun m!922635 () Bool)

(assert (=> b!995150 m!922635))

(push 1)

(assert (not b!995150))

(assert (not b!995151))

(assert (not b!995155))

(assert (not b!995154))

(assert (not b!995153))

(assert (not b!995156))

(assert (not start!85794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118803 () Bool)

(assert (=> d!118803 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85794 d!118803))

(declare-fun d!118815 () Bool)

(assert (=> d!118815 (= (array_inv!23445 a!3219) (bvsge (size!30823 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85794 d!118815))

(declare-fun d!118817 () Bool)

(declare-fun res!665625 () Bool)

(declare-fun e!561570 () Bool)

(assert (=> d!118817 (=> res!665625 e!561570)))

(assert (=> d!118817 (= res!665625 (is-Nil!20994 Nil!20994))))

(assert (=> d!118817 (= (noDuplicate!1456 Nil!20994) e!561570)))

(declare-fun b!995194 () Bool)

(declare-fun e!561571 () Bool)

(assert (=> b!995194 (= e!561570 e!561571)))

(declare-fun res!665626 () Bool)

(assert (=> b!995194 (=> (not res!665626) (not e!561571))))

(declare-fun contains!5858 (List!20997 (_ BitVec 64)) Bool)

(assert (=> b!995194 (= res!665626 (not (contains!5858 (t!29998 Nil!20994) (h!22155 Nil!20994))))))

(declare-fun b!995195 () Bool)

(assert (=> b!995195 (= e!561571 (noDuplicate!1456 (t!29998 Nil!20994)))))

(assert (= (and d!118817 (not res!665625)) b!995194))

(assert (= (and b!995194 res!665626) b!995195))

(declare-fun m!922653 () Bool)

(assert (=> b!995194 m!922653))

(declare-fun m!922655 () Bool)

(assert (=> b!995195 m!922655))

(assert (=> b!995156 d!118817))

(declare-fun d!118819 () Bool)

(declare-fun res!665639 () Bool)

(declare-fun e!561591 () Bool)

(assert (=> d!118819 (=> res!665639 e!561591)))

(assert (=> d!118819 (= res!665639 (bvsge #b00000000000000000000000000000000 (size!30823 a!3219)))))

(assert (=> d!118819 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561591)))

(declare-fun b!995220 () Bool)

(declare-fun e!561590 () Bool)

(declare-fun call!42194 () Bool)

(assert (=> b!995220 (= e!561590 call!42194)))

(declare-fun b!995221 () Bool)

(assert (=> b!995221 (= e!561591 e!561590)))

(declare-fun c!100931 () Bool)

(assert (=> b!995221 (= c!100931 (validKeyInArray!0 (select (arr!30321 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995222 () Bool)

(declare-fun e!561592 () Bool)

(assert (=> b!995222 (= e!561590 e!561592)))

(declare-fun lt!440884 () (_ BitVec 64))

(assert (=> b!995222 (= lt!440884 (select (arr!30321 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32954 0))(
  ( (Unit!32955) )
))
(declare-fun lt!440883 () Unit!32954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62967 (_ BitVec 64) (_ BitVec 32)) Unit!32954)

(assert (=> b!995222 (= lt!440883 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440884 #b00000000000000000000000000000000))))

(assert (=> b!995222 (arrayContainsKey!0 a!3219 lt!440884 #b00000000000000000000000000000000)))

(declare-fun lt!440885 () Unit!32954)

(assert (=> b!995222 (= lt!440885 lt!440883)))

(declare-fun res!665640 () Bool)

(assert (=> b!995222 (= res!665640 (= (seekEntryOrOpen!0 (select (arr!30321 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9253 #b00000000000000000000000000000000)))))

(assert (=> b!995222 (=> (not res!665640) (not e!561592))))

(declare-fun bm!42191 () Bool)

(assert (=> bm!42191 (= call!42194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995223 () Bool)

(assert (=> b!995223 (= e!561592 call!42194)))

(assert (= (and d!118819 (not res!665639)) b!995221))

(assert (= (and b!995221 c!100931) b!995222))

(assert (= (and b!995221 (not c!100931)) b!995220))

(assert (= (and b!995222 res!665640) b!995223))

(assert (= (or b!995223 b!995220) bm!42191))

(declare-fun m!922677 () Bool)

(assert (=> b!995221 m!922677))

(assert (=> b!995221 m!922677))

(declare-fun m!922679 () Bool)

