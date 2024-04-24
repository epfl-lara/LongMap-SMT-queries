; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7090 () Bool)

(assert start!7090)

(declare-fun res!26651 () Bool)

(declare-fun e!28911 () Bool)

(assert (=> start!7090 (=> (not res!26651) (not e!28911))))

(declare-datatypes ((V!2363 0))(
  ( (V!2364 (val!993 Int)) )
))
(declare-datatypes ((ValueCell!707 0))(
  ( (ValueCellFull!707 (v!2096 V!2363)) (EmptyCell!707) )
))
(declare-fun c!12 () ValueCell!707)

(declare-fun isFull!1 (ValueCell!707) Bool)

(assert (=> start!7090 (= res!26651 (isFull!1 c!12))))

(assert (=> start!7090 e!28911))

(declare-fun e!28912 () Bool)

(assert (=> start!7090 e!28912))

(declare-fun b!45422 () Bool)

(get-info :version)

(assert (=> b!45422 (= e!28911 (not ((_ is ValueCellFull!707) c!12)))))

(declare-fun b!45423 () Bool)

(declare-fun tp_is_empty!1909 () Bool)

(assert (=> b!45423 (= e!28912 tp_is_empty!1909)))

(assert (= (and start!7090 res!26651) b!45422))

(assert (= (and start!7090 ((_ is ValueCellFull!707) c!12)) b!45423))

(declare-fun m!39917 () Bool)

(assert (=> start!7090 m!39917))

(check-sat (not start!7090) tp_is_empty!1909)
(check-sat)
(get-model)

(declare-fun d!8853 () Bool)

(assert (=> d!8853 (= (isFull!1 c!12) ((_ is ValueCellFull!707) c!12))))

(assert (=> start!7090 d!8853))

(check-sat tp_is_empty!1909)
