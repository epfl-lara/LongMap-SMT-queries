; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85230 () Bool)

(assert start!85230)

(declare-fun res!663563 () Bool)

(declare-fun e!560153 () Bool)

(assert (=> start!85230 (=> (not res!663563) (not e!560153))))

(declare-datatypes ((List!20901 0))(
  ( (Nil!20898) (Cons!20897 (h!22059 (_ BitVec 64)) (t!29902 List!20901)) )
))
(declare-fun l!3519 () List!20901)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5762 (List!20901 (_ BitVec 64)) Bool)

(assert (=> start!85230 (= res!663563 (not (contains!5762 l!3519 e!29)))))

(assert (=> start!85230 e!560153))

(assert (=> start!85230 true))

(declare-fun b!992838 () Bool)

(declare-fun e!560154 () Bool)

(assert (=> b!992838 (= e!560153 e!560154)))

(declare-fun res!663564 () Bool)

(assert (=> b!992838 (=> (not res!663564) (not e!560154))))

(declare-datatypes ((tuple2!14986 0))(
  ( (tuple2!14987 (_1!7504 (_ BitVec 64)) (_2!7504 List!20901)) )
))
(declare-datatypes ((Option!548 0))(
  ( (Some!547 (v!14366 tuple2!14986)) (None!546) )
))
(declare-fun lt!440313 () Option!548)

(declare-fun isEmpty!755 (Option!548) Bool)

(assert (=> b!992838 (= res!663564 (not (isEmpty!755 lt!440313)))))

(declare-fun unapply!27 (List!20901) Option!548)

(assert (=> b!992838 (= lt!440313 (unapply!27 l!3519))))

(declare-fun b!992839 () Bool)

(assert (=> b!992839 (= e!560154 false)))

(declare-fun lt!440314 () Bool)

(declare-fun get!15708 (Option!548) tuple2!14986)

(assert (=> b!992839 (= lt!440314 (contains!5762 (_2!7504 (get!15708 lt!440313)) e!29))))

(assert (= (and start!85230 res!663563) b!992838))

(assert (= (and b!992838 res!663564) b!992839))

(declare-fun m!920541 () Bool)

(assert (=> start!85230 m!920541))

(declare-fun m!920543 () Bool)

(assert (=> b!992838 m!920543))

(declare-fun m!920545 () Bool)

(assert (=> b!992838 m!920545))

(declare-fun m!920547 () Bool)

(assert (=> b!992839 m!920547))

(declare-fun m!920549 () Bool)

(assert (=> b!992839 m!920549))

(push 1)

(assert (not start!85230))

(assert (not b!992838))

(assert (not b!992839))

