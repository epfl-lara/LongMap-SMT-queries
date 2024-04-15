; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106416 () Bool)

(assert start!106416)

(declare-fun res!842555 () Bool)

(declare-fun e!720652 () Bool)

(assert (=> start!106416 (=> (not res!842555) (not e!720652))))

(declare-datatypes ((B!1970 0))(
  ( (B!1971 (val!16320 Int)) )
))
(declare-datatypes ((tuple2!21240 0))(
  ( (tuple2!21241 (_1!10631 (_ BitVec 64)) (_2!10631 B!1970)) )
))
(declare-datatypes ((List!28396 0))(
  ( (Nil!28393) (Cons!28392 (h!29601 tuple2!21240) (t!41908 List!28396)) )
))
(declare-fun l!706 () List!28396)

(declare-fun isStrictlySorted!783 (List!28396) Bool)

(assert (=> start!106416 (= res!842555 (isStrictlySorted!783 l!706))))

(assert (=> start!106416 e!720652))

(declare-fun e!720653 () Bool)

(assert (=> start!106416 e!720653))

(assert (=> start!106416 true))

(declare-fun b!1265434 () Bool)

(declare-fun res!842556 () Bool)

(assert (=> b!1265434 (=> (not res!842556) (not e!720652))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!644 (List!28396 (_ BitVec 64)) Bool)

(assert (=> b!1265434 (= res!842556 (not (containsKey!644 l!706 key1!31)))))

(declare-fun b!1265435 () Bool)

(declare-fun ListPrimitiveSize!151 (List!28396) Int)

(assert (=> b!1265435 (= e!720652 (< (ListPrimitiveSize!151 l!706) 0))))

(declare-fun b!1265436 () Bool)

(declare-fun tp_is_empty!32503 () Bool)

(declare-fun tp!96338 () Bool)

(assert (=> b!1265436 (= e!720653 (and tp_is_empty!32503 tp!96338))))

(assert (= (and start!106416 res!842555) b!1265434))

(assert (= (and b!1265434 res!842556) b!1265435))

(get-info :version)

(assert (= (and start!106416 ((_ is Cons!28392) l!706)) b!1265436))

(declare-fun m!1165127 () Bool)

(assert (=> start!106416 m!1165127))

(declare-fun m!1165129 () Bool)

(assert (=> b!1265434 m!1165129))

(declare-fun m!1165131 () Bool)

(assert (=> b!1265435 m!1165131))

(check-sat tp_is_empty!32503 (not b!1265434) (not start!106416) (not b!1265436) (not b!1265435))
(check-sat)
(get-model)

(declare-fun d!138795 () Bool)

(declare-fun res!842583 () Bool)

(declare-fun e!720680 () Bool)

(assert (=> d!138795 (=> res!842583 e!720680)))

(assert (=> d!138795 (= res!842583 (and ((_ is Cons!28392) l!706) (= (_1!10631 (h!29601 l!706)) key1!31)))))

(assert (=> d!138795 (= (containsKey!644 l!706 key1!31) e!720680)))

(declare-fun b!1265469 () Bool)

(declare-fun e!720681 () Bool)

(assert (=> b!1265469 (= e!720680 e!720681)))

(declare-fun res!842584 () Bool)

(assert (=> b!1265469 (=> (not res!842584) (not e!720681))))

(assert (=> b!1265469 (= res!842584 (and (or (not ((_ is Cons!28392) l!706)) (bvsle (_1!10631 (h!29601 l!706)) key1!31)) ((_ is Cons!28392) l!706) (bvslt (_1!10631 (h!29601 l!706)) key1!31)))))

(declare-fun b!1265470 () Bool)

(assert (=> b!1265470 (= e!720681 (containsKey!644 (t!41908 l!706) key1!31))))

(assert (= (and d!138795 (not res!842583)) b!1265469))

(assert (= (and b!1265469 res!842584) b!1265470))

(declare-fun m!1165147 () Bool)

(assert (=> b!1265470 m!1165147))

(assert (=> b!1265434 d!138795))

(declare-fun d!138803 () Bool)

(declare-fun lt!573879 () Int)

(assert (=> d!138803 (>= lt!573879 0)))

(declare-fun e!720691 () Int)

(assert (=> d!138803 (= lt!573879 e!720691)))

(declare-fun c!123309 () Bool)

(assert (=> d!138803 (= c!123309 ((_ is Nil!28393) l!706))))

(assert (=> d!138803 (= (ListPrimitiveSize!151 l!706) lt!573879)))

(declare-fun b!1265487 () Bool)

(assert (=> b!1265487 (= e!720691 0)))

(declare-fun b!1265488 () Bool)

(assert (=> b!1265488 (= e!720691 (+ 1 (ListPrimitiveSize!151 (t!41908 l!706))))))

(assert (= (and d!138803 c!123309) b!1265487))

(assert (= (and d!138803 (not c!123309)) b!1265488))

(declare-fun m!1165153 () Bool)

(assert (=> b!1265488 m!1165153))

(assert (=> b!1265435 d!138803))

(declare-fun d!138809 () Bool)

(declare-fun res!842599 () Bool)

(declare-fun e!720705 () Bool)

(assert (=> d!138809 (=> res!842599 e!720705)))

(assert (=> d!138809 (= res!842599 (or ((_ is Nil!28393) l!706) ((_ is Nil!28393) (t!41908 l!706))))))

(assert (=> d!138809 (= (isStrictlySorted!783 l!706) e!720705)))

(declare-fun b!1265503 () Bool)

(declare-fun e!720706 () Bool)

(assert (=> b!1265503 (= e!720705 e!720706)))

(declare-fun res!842600 () Bool)

(assert (=> b!1265503 (=> (not res!842600) (not e!720706))))

(assert (=> b!1265503 (= res!842600 (bvslt (_1!10631 (h!29601 l!706)) (_1!10631 (h!29601 (t!41908 l!706)))))))

(declare-fun b!1265504 () Bool)

(assert (=> b!1265504 (= e!720706 (isStrictlySorted!783 (t!41908 l!706)))))

(assert (= (and d!138809 (not res!842599)) b!1265503))

(assert (= (and b!1265503 res!842600) b!1265504))

(declare-fun m!1165157 () Bool)

(assert (=> b!1265504 m!1165157))

(assert (=> start!106416 d!138809))

(declare-fun b!1265513 () Bool)

(declare-fun e!720713 () Bool)

(declare-fun tp!96347 () Bool)

(assert (=> b!1265513 (= e!720713 (and tp_is_empty!32503 tp!96347))))

(assert (=> b!1265436 (= tp!96338 e!720713)))

(assert (= (and b!1265436 ((_ is Cons!28392) (t!41908 l!706))) b!1265513))

(check-sat (not b!1265513) (not b!1265488) (not b!1265504) (not b!1265470) tp_is_empty!32503)
(check-sat)
