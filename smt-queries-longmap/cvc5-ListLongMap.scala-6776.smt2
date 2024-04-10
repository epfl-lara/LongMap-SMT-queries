; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85226 () Bool)

(assert start!85226)

(declare-fun res!663551 () Bool)

(declare-fun e!560142 () Bool)

(assert (=> start!85226 (=> (not res!663551) (not e!560142))))

(declare-datatypes ((List!20899 0))(
  ( (Nil!20896) (Cons!20895 (h!22057 (_ BitVec 64)) (t!29900 List!20899)) )
))
(declare-fun l!3519 () List!20899)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5760 (List!20899 (_ BitVec 64)) Bool)

(assert (=> start!85226 (= res!663551 (not (contains!5760 l!3519 e!29)))))

(assert (=> start!85226 e!560142))

(assert (=> start!85226 true))

(declare-fun b!992826 () Bool)

(declare-fun e!560141 () Bool)

(assert (=> b!992826 (= e!560142 e!560141)))

(declare-fun res!663552 () Bool)

(assert (=> b!992826 (=> (not res!663552) (not e!560141))))

(declare-datatypes ((tuple2!14982 0))(
  ( (tuple2!14983 (_1!7502 (_ BitVec 64)) (_2!7502 List!20899)) )
))
(declare-datatypes ((Option!546 0))(
  ( (Some!545 (v!14364 tuple2!14982)) (None!544) )
))
(declare-fun lt!440301 () Option!546)

(declare-fun isEmpty!753 (Option!546) Bool)

(assert (=> b!992826 (= res!663552 (not (isEmpty!753 lt!440301)))))

(declare-fun unapply!25 (List!20899) Option!546)

(assert (=> b!992826 (= lt!440301 (unapply!25 l!3519))))

(declare-fun b!992827 () Bool)

(assert (=> b!992827 (= e!560141 false)))

(declare-fun lt!440302 () Bool)

(declare-fun get!15706 (Option!546) tuple2!14982)

(assert (=> b!992827 (= lt!440302 (contains!5760 (_2!7502 (get!15706 lt!440301)) e!29))))

(assert (= (and start!85226 res!663551) b!992826))

(assert (= (and b!992826 res!663552) b!992827))

(declare-fun m!920521 () Bool)

(assert (=> start!85226 m!920521))

(declare-fun m!920523 () Bool)

(assert (=> b!992826 m!920523))

(declare-fun m!920525 () Bool)

(assert (=> b!992826 m!920525))

(declare-fun m!920527 () Bool)

(assert (=> b!992827 m!920527))

(declare-fun m!920529 () Bool)

(assert (=> b!992827 m!920529))

(push 1)

(assert (not start!85226))

