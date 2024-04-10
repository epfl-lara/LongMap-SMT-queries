; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81640 () Bool)

(assert start!81640)

(declare-fun b!953281 () Bool)

(declare-fun res!638464 () Bool)

(declare-fun e!536942 () Bool)

(assert (=> b!953281 (=> (not res!638464) (not e!536942))))

(declare-datatypes ((array!57701 0))(
  ( (array!57702 (arr!27738 (Array (_ BitVec 32) (_ BitVec 64))) (size!28217 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57701)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57701 (_ BitVec 32)) Bool)

(assert (=> b!953281 (= res!638464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953280 () Bool)

(declare-fun res!638467 () Bool)

(assert (=> b!953280 (=> (not res!638467) (not e!536942))))

(assert (=> b!953280 (= res!638467 (= (size!28217 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953283 () Bool)

(assert (=> b!953283 (= e!536942 (bvslt mask!4034 #b00000000000000000000000000000000))))

(declare-fun b!953282 () Bool)

(declare-fun res!638465 () Bool)

(assert (=> b!953282 (=> (not res!638465) (not e!536942))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953282 (= res!638465 (validKeyInArray!0 k!2725))))

(declare-fun res!638466 () Bool)

(assert (=> start!81640 (=> (not res!638466) (not e!536942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81640 (= res!638466 (validMask!0 mask!4034))))

(assert (=> start!81640 e!536942))

(assert (=> start!81640 true))

(declare-fun array_inv!21528 (array!57701) Bool)

(assert (=> start!81640 (array_inv!21528 a!3460)))

(assert (= (and start!81640 res!638466) b!953280))

(assert (= (and b!953280 res!638467) b!953281))

(assert (= (and b!953281 res!638464) b!953282))

(assert (= (and b!953282 res!638465) b!953283))

(declare-fun m!885353 () Bool)

(assert (=> b!953281 m!885353))

(declare-fun m!885355 () Bool)

(assert (=> b!953282 m!885355))

(declare-fun m!885357 () Bool)

(assert (=> start!81640 m!885357))

(declare-fun m!885359 () Bool)

(assert (=> start!81640 m!885359))

(push 1)

(assert (not start!81640))

(assert (not b!953281))

(assert (not b!953282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!115647 () Bool)

(assert (=> d!115647 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81640 d!115647))

(declare-fun d!115655 () Bool)

(assert (=> d!115655 (= (array_inv!21528 a!3460) (bvsge (size!28217 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81640 d!115655))

(declare-fun d!115659 () Bool)

(declare-fun res!638484 () Bool)

(declare-fun e!536967 () Bool)

(assert (=> d!115659 (=> res!638484 e!536967)))

(assert (=> d!115659 (= res!638484 (bvsge #b00000000000000000000000000000000 (size!28217 a!3460)))))

(assert (=> d!115659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!536967)))

(declare-fun b!953316 () Bool)

(declare-fun e!536969 () Bool)

(assert (=> b!953316 (= e!536967 e!536969)))

(declare-fun c!99791 () Bool)

(assert (=> b!953316 (= c!99791 (validKeyInArray!0 (select (arr!27738 a!3460) #b00000000000000000000000000000000)))))

(declare-fun b!953317 () Bool)

(declare-fun e!536968 () Bool)

(declare-fun call!41657 () Bool)

(assert (=> b!953317 (= e!536968 call!41657)))

(declare-fun b!953318 () Bool)

(assert (=> b!953318 (= e!536969 call!41657)))

(declare-fun b!953319 () Bool)

(assert (=> b!953319 (= e!536969 e!536968)))

(declare-fun lt!429674 () (_ BitVec 64))

(assert (=> b!953319 (= lt!429674 (select (arr!27738 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32077 0))(
  ( (Unit!32078) )
))
(declare-fun lt!429675 () Unit!32077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57701 (_ BitVec 64) (_ BitVec 32)) Unit!32077)

(assert (=> b!953319 (= lt!429675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429674 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953319 (arrayContainsKey!0 a!3460 lt!429674 #b00000000000000000000000000000000)))

(declare-fun lt!429676 () Unit!32077)

(assert (=> b!953319 (= lt!429676 lt!429675)))

(declare-fun res!638485 () Bool)

(declare-datatypes ((SeekEntryResult!9171 0))(
  ( (MissingZero!9171 (index!39055 (_ BitVec 32))) (Found!9171 (index!39056 (_ BitVec 32))) (Intermediate!9171 (undefined!9983 Bool) (index!39057 (_ BitVec 32)) (x!82027 (_ BitVec 32))) (Undefined!9171) (MissingVacant!9171 (index!39058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57701 (_ BitVec 32)) SeekEntryResult!9171)

(assert (=> b!953319 (= res!638485 (= (seekEntryOrOpen!0 (select (arr!27738 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9171 #b00000000000000000000000000000000)))))

(assert (=> b!953319 (=> (not res!638485) (not e!536968))))

(declare-fun bm!41654 () Bool)

(assert (=> bm!41654 (= call!41657 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(assert (= (and d!115659 (not res!638484)) b!953316))

(assert (= (and b!953316 c!99791) b!953319))

(assert (= (and b!953316 (not c!99791)) b!953318))

(assert (= (and b!953319 res!638485) b!953317))

(assert (= (or b!953317 b!953318) bm!41654))

(declare-fun m!885381 () Bool)

(assert (=> b!953316 m!885381))

(assert (=> b!953316 m!885381))

(declare-fun m!885385 () Bool)

(assert (=> b!953316 m!885385))

(assert (=> b!953319 m!885381))

(declare-fun m!885389 () Bool)

(assert (=> b!953319 m!885389))

(declare-fun m!885391 () Bool)

(assert (=> b!953319 m!885391))

(assert (=> b!953319 m!885381))

(declare-fun m!885393 () Bool)

(assert (=> b!953319 m!885393))

(declare-fun m!885395 () Bool)

(assert (=> bm!41654 m!885395))

(assert (=> b!953281 d!115659))

(declare-fun d!115663 () Bool)

(assert (=> d!115663 (= (validKeyInArray!0 k!2725) (and (not (= k!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953282 d!115663))

(push 1)

