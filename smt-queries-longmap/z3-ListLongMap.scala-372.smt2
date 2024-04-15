; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7086 () Bool)

(assert start!7086)

(declare-fun res!26656 () Bool)

(declare-fun e!28905 () Bool)

(assert (=> start!7086 (=> (not res!26656) (not e!28905))))

(declare-datatypes ((V!2363 0))(
  ( (V!2364 (val!993 Int)) )
))
(declare-datatypes ((ValueCell!707 0))(
  ( (ValueCellFull!707 (v!2093 V!2363)) (EmptyCell!707) )
))
(declare-fun c!12 () ValueCell!707)

(declare-fun isFull!1 (ValueCell!707) Bool)

(assert (=> start!7086 (= res!26656 (isFull!1 c!12))))

(assert (=> start!7086 e!28905))

(declare-fun e!28906 () Bool)

(assert (=> start!7086 e!28906))

(declare-fun b!45413 () Bool)

(get-info :version)

(assert (=> b!45413 (= e!28905 (not ((_ is ValueCellFull!707) c!12)))))

(declare-fun b!45414 () Bool)

(declare-fun tp_is_empty!1909 () Bool)

(assert (=> b!45414 (= e!28906 tp_is_empty!1909)))

(assert (= (and start!7086 res!26656) b!45413))

(assert (= (and start!7086 ((_ is ValueCellFull!707) c!12)) b!45414))

(declare-fun m!39959 () Bool)

(assert (=> start!7086 m!39959))

(check-sat (not start!7086) tp_is_empty!1909)
(check-sat)
(get-model)

(declare-fun d!8839 () Bool)

(assert (=> d!8839 (= (isFull!1 c!12) ((_ is ValueCellFull!707) c!12))))

(assert (=> start!7086 d!8839))

(check-sat tp_is_empty!1909)
