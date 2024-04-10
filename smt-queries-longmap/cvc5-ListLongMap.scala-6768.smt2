; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84956 () Bool)

(assert start!84956)

(declare-fun res!663169 () Bool)

(declare-fun e!559703 () Bool)

(assert (=> start!84956 (=> (not res!663169) (not e!559703))))

(declare-datatypes ((List!20875 0))(
  ( (Nil!20872) (Cons!20871 (h!22033 (_ BitVec 64)) (t!29861 List!20875)) )
))
(declare-fun tail!21 () List!20875)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5736 (List!20875 (_ BitVec 64)) Bool)

(assert (=> start!84956 (= res!663169 (not (contains!5736 tail!21 head!726)))))

(assert (=> start!84956 e!559703))

(assert (=> start!84956 true))

(declare-fun b!992216 () Bool)

(declare-fun res!663171 () Bool)

(assert (=> b!992216 (=> (not res!663171) (not e!559703))))

(declare-fun content!430 (List!20875) (Set (_ BitVec 64)))

(assert (=> b!992216 (= res!663171 (not (set.member head!726 (content!430 tail!21))))))

(declare-fun b!992217 () Bool)

(declare-fun e!559704 () Bool)

(assert (=> b!992217 (= e!559703 e!559704)))

(declare-fun res!663170 () Bool)

(assert (=> b!992217 (=> (not res!663170) (not e!559704))))

(declare-datatypes ((tuple2!14940 0))(
  ( (tuple2!14941 (_1!7481 (_ BitVec 64)) (_2!7481 List!20875)) )
))
(declare-datatypes ((Option!525 0))(
  ( (Some!524 (v!14322 tuple2!14940)) (None!523) )
))
(declare-fun lt!440095 () Option!525)

(declare-fun isEmpty!732 (Option!525) Bool)

(assert (=> b!992217 (= res!663170 (not (isEmpty!732 lt!440095)))))

(declare-fun unapply!4 (List!20875) Option!525)

(declare-fun $colon$colon!561 (List!20875 (_ BitVec 64)) List!20875)

(assert (=> b!992217 (= lt!440095 (unapply!4 ($colon$colon!561 tail!21 head!726)))))

(declare-fun b!992218 () Bool)

(assert (=> b!992218 (= e!559704 false)))

(declare-fun lt!440094 () Bool)

(declare-fun get!15681 (Option!525) tuple2!14940)

(assert (=> b!992218 (= lt!440094 (contains!5736 (_2!7481 (get!15681 lt!440095)) head!726))))

(assert (= (and start!84956 res!663169) b!992216))

(assert (= (and b!992216 res!663171) b!992217))

(assert (= (and b!992217 res!663170) b!992218))

(declare-fun m!919897 () Bool)

(assert (=> start!84956 m!919897))

(declare-fun m!919899 () Bool)

(assert (=> b!992216 m!919899))

(declare-fun m!919901 () Bool)

(assert (=> b!992216 m!919901))

(declare-fun m!919903 () Bool)

(assert (=> b!992217 m!919903))

(declare-fun m!919905 () Bool)

(assert (=> b!992217 m!919905))

(assert (=> b!992217 m!919905))

(declare-fun m!919907 () Bool)

(assert (=> b!992217 m!919907))

(declare-fun m!919909 () Bool)

(assert (=> b!992218 m!919909))

(declare-fun m!919911 () Bool)

(assert (=> b!992218 m!919911))

(push 1)

