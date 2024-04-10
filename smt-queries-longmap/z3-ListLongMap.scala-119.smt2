; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2042 () Bool)

(assert start!2042)

(declare-fun b!13805 () Bool)

(assert (=> b!13805 true))

(declare-fun b!13801 () Bool)

(declare-fun e!8234 () Bool)

(declare-fun tp_is_empty!693 () Bool)

(declare-fun tp!2240 () Bool)

(assert (=> b!13801 (= e!8234 (and tp_is_empty!693 tp!2240))))

(declare-fun b!13802 () Bool)

(declare-fun e!8232 () Bool)

(declare-fun tp!2239 () Bool)

(assert (=> b!13802 (= e!8232 (and tp_is_empty!693 tp!2239))))

(declare-fun b!13803 () Bool)

(declare-fun res!10825 () Bool)

(declare-fun e!8231 () Bool)

(assert (=> b!13803 (=> (not res!10825) (not e!8231))))

(declare-datatypes ((B!514 0))(
  ( (B!515 (val!355 Int)) )
))
(declare-datatypes ((tuple2!510 0))(
  ( (tuple2!511 (_1!255 (_ BitVec 64)) (_2!255 B!514)) )
))
(declare-datatypes ((List!410 0))(
  ( (Nil!407) (Cons!406 (h!972 tuple2!510) (t!2806 List!410)) )
))
(declare-fun lt!3540 () List!410)

(declare-fun isEmpty!94 (List!410) Bool)

(assert (=> b!13803 (= res!10825 (not (isEmpty!94 lt!3540)))))

(declare-fun b!13804 () Bool)

(assert (=> b!13804 (= e!8231 (= lt!3540 Nil!407))))

(declare-fun res!10826 () Bool)

(assert (=> b!13805 (=> (not res!10826) (not e!8231))))

(declare-fun lambda!119 () Int)

(declare-fun forall!87 (List!410 Int) Bool)

(assert (=> b!13805 (= res!10826 (forall!87 lt!3540 lambda!119))))

(declare-fun b!13806 () Bool)

(declare-fun res!10827 () Bool)

(declare-fun e!8233 () Bool)

(assert (=> b!13806 (=> (not res!10827) (not e!8233))))

(declare-fun l!522 () List!410)

(declare-fun value!159 () B!514)

(get-info :version)

(assert (=> b!13806 (= res!10827 (and (or (not ((_ is Cons!406) l!522)) (not (= (_2!255 (h!972 l!522)) value!159))) (or (not ((_ is Cons!406) l!522)) (= (_2!255 (h!972 l!522)) value!159)) (not ((_ is Nil!407) l!522))))))

(declare-fun b!13807 () Bool)

(declare-fun res!10823 () Bool)

(assert (=> b!13807 (=> (not res!10823) (not e!8231))))

(assert (=> b!13807 (= res!10823 (not (isEmpty!94 l!522)))))

(declare-fun res!10824 () Bool)

(assert (=> start!2042 (=> (not res!10824) (not e!8233))))

(declare-fun isStrictlySorted!97 (List!410) Bool)

(assert (=> start!2042 (= res!10824 (isStrictlySorted!97 l!522))))

(assert (=> start!2042 e!8233))

(assert (=> start!2042 e!8232))

(assert (=> start!2042 tp_is_empty!693))

(declare-fun b!13800 () Bool)

(assert (=> b!13800 (= e!8233 e!8231)))

(declare-fun res!10828 () Bool)

(assert (=> b!13800 (=> (not res!10828) (not e!8231))))

(assert (=> b!13800 (= res!10828 (isStrictlySorted!97 lt!3540))))

(declare-fun err!7 () List!410)

(assert (=> b!13800 (= lt!3540 err!7)))

(assert (=> b!13800 true))

(assert (=> b!13800 e!8234))

(assert (= (and start!2042 res!10824) b!13806))

(assert (= (and b!13806 res!10827) b!13800))

(assert (= (and b!13800 ((_ is Cons!406) err!7)) b!13801))

(assert (= (and b!13800 res!10828) b!13805))

(assert (= (and b!13805 res!10826) b!13807))

(assert (= (and b!13807 res!10823) b!13803))

(assert (= (and b!13803 res!10825) b!13804))

(assert (= (and start!2042 ((_ is Cons!406) l!522)) b!13802))

(declare-fun m!9291 () Bool)

(assert (=> start!2042 m!9291))

(declare-fun m!9293 () Bool)

(assert (=> b!13800 m!9293))

(declare-fun m!9295 () Bool)

(assert (=> b!13803 m!9295))

(declare-fun m!9297 () Bool)

(assert (=> b!13805 m!9297))

(declare-fun m!9299 () Bool)

(assert (=> b!13807 m!9299))

(check-sat (not b!13805) (not b!13807) (not start!2042) (not b!13802) (not b!13801) (not b!13800) tp_is_empty!693 (not b!13803))
(check-sat)
