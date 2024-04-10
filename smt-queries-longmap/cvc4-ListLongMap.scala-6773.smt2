; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85122 () Bool)

(assert start!85122)

(declare-fun res!663427 () Bool)

(declare-fun e!559998 () Bool)

(assert (=> start!85122 (=> (not res!663427) (not e!559998))))

(declare-datatypes ((List!20892 0))(
  ( (Nil!20889) (Cons!20888 (h!22050 (_ BitVec 64)) (t!29887 List!20892)) )
))
(declare-fun tail!21 () List!20892)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5753 (List!20892 (_ BitVec 64)) Bool)

(assert (=> start!85122 (= res!663427 (not (contains!5753 tail!21 head!726)))))

(assert (=> start!85122 e!559998))

(assert (=> start!85122 true))

(declare-fun b!992630 () Bool)

(declare-fun res!663429 () Bool)

(assert (=> b!992630 (=> (not res!663429) (not e!559998))))

(declare-fun content!447 (List!20892) (Set (_ BitVec 64)))

(assert (=> b!992630 (= res!663429 (not (member head!726 (content!447 tail!21))))))

(declare-fun b!992631 () Bool)

(declare-fun e!559997 () Bool)

(assert (=> b!992631 (= e!559998 e!559997)))

(declare-fun res!663428 () Bool)

(assert (=> b!992631 (=> (not res!663428) (not e!559997))))

(declare-fun lt!440242 () List!20892)

(declare-datatypes ((tuple2!14968 0))(
  ( (tuple2!14969 (_1!7495 (_ BitVec 64)) (_2!7495 List!20892)) )
))
(declare-datatypes ((Option!539 0))(
  ( (Some!538 (v!14348 tuple2!14968)) (None!537) )
))
(declare-fun isEmpty!746 (Option!539) Bool)

(declare-fun unapply!18 (List!20892) Option!539)

(assert (=> b!992631 (= res!663428 (isEmpty!746 (unapply!18 lt!440242)))))

(declare-fun $colon$colon!575 (List!20892 (_ BitVec 64)) List!20892)

(assert (=> b!992631 (= lt!440242 ($colon$colon!575 tail!21 head!726))))

(declare-fun b!992632 () Bool)

(assert (=> b!992632 (= e!559997 (not (is-Nil!20889 lt!440242)))))

(assert (= (and start!85122 res!663427) b!992630))

(assert (= (and b!992630 res!663429) b!992631))

(assert (= (and b!992631 res!663428) b!992632))

(declare-fun m!920353 () Bool)

(assert (=> start!85122 m!920353))

(declare-fun m!920355 () Bool)

(assert (=> b!992630 m!920355))

(declare-fun m!920357 () Bool)

(assert (=> b!992630 m!920357))

(declare-fun m!920359 () Bool)

(assert (=> b!992631 m!920359))

(assert (=> b!992631 m!920359))

(declare-fun m!920361 () Bool)

(assert (=> b!992631 m!920361))

(declare-fun m!920363 () Bool)

(assert (=> b!992631 m!920363))

(push 1)

(assert (not start!85122))

(assert (not b!992631))

(assert (not b!992630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118218 () Bool)

(declare-fun lt!440248 () Bool)

(assert (=> d!118218 (= lt!440248 (member head!726 (content!447 tail!21)))))

(declare-fun e!560013 () Bool)

(assert (=> d!118218 (= lt!440248 e!560013)))

(declare-fun res!663441 () Bool)

(assert (=> d!118218 (=> (not res!663441) (not e!560013))))

(assert (=> d!118218 (= res!663441 (is-Cons!20888 tail!21))))

(assert (=> d!118218 (= (contains!5753 tail!21 head!726) lt!440248)))

(declare-fun b!992649 () Bool)

(declare-fun e!560012 () Bool)

(assert (=> b!992649 (= e!560013 e!560012)))

(declare-fun res!663440 () Bool)

(assert (=> b!992649 (=> res!663440 e!560012)))

(assert (=> b!992649 (= res!663440 (= (h!22050 tail!21) head!726))))

(declare-fun b!992650 () Bool)

(assert (=> b!992650 (= e!560012 (contains!5753 (t!29887 tail!21) head!726))))

(assert (= (and d!118218 res!663441) b!992649))

(assert (= (and b!992649 (not res!663440)) b!992650))

(assert (=> d!118218 m!920355))

(assert (=> d!118218 m!920357))

(declare-fun m!920371 () Bool)

(assert (=> b!992650 m!920371))

(assert (=> start!85122 d!118218))

(declare-fun d!118227 () Bool)

(assert (=> d!118227 (= (isEmpty!746 (unapply!18 lt!440242)) (not (is-Some!538 (unapply!18 lt!440242))))))

(assert (=> b!992631 d!118227))

(declare-fun d!118229 () Bool)

(assert (=> d!118229 (= (unapply!18 lt!440242) (ite (is-Nil!20889 lt!440242) None!537 (Some!538 (tuple2!14969 (h!22050 lt!440242) (t!29887 lt!440242)))))))

(assert (=> b!992631 d!118229))

(declare-fun d!118231 () Bool)

(assert (=> d!118231 (= ($colon$colon!575 tail!21 head!726) (Cons!20888 head!726 tail!21))))

(assert (=> b!992631 d!118231))

(declare-fun d!118237 () Bool)

(declare-fun c!100747 () Bool)

(assert (=> d!118237 (= c!100747 (is-Nil!20889 tail!21))))

(declare-fun e!560025 () (Set (_ BitVec 64)))

(assert (=> d!118237 (= (content!447 tail!21) e!560025)))

(declare-fun b!992667 () Bool)

