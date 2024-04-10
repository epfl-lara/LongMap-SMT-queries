; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7086 () Bool)

(assert start!7086)

(declare-fun res!26679 () Bool)

(declare-fun e!28954 () Bool)

(assert (=> start!7086 (=> (not res!26679) (not e!28954))))

(declare-datatypes ((V!2365 0))(
  ( (V!2366 (val!994 Int)) )
))
(declare-datatypes ((ValueCell!708 0))(
  ( (ValueCellFull!708 (v!2096 V!2365)) (EmptyCell!708) )
))
(declare-fun c!12 () ValueCell!708)

(declare-fun isFull!2 (ValueCell!708) Bool)

(assert (=> start!7086 (= res!26679 (isFull!2 c!12))))

(assert (=> start!7086 e!28954))

(declare-fun e!28955 () Bool)

(assert (=> start!7086 e!28955))

(declare-fun b!45485 () Bool)

(get-info :version)

(assert (=> b!45485 (= e!28954 (not ((_ is ValueCellFull!708) c!12)))))

(declare-fun b!45486 () Bool)

(declare-fun tp_is_empty!1911 () Bool)

(assert (=> b!45486 (= e!28955 tp_is_empty!1911)))

(assert (= (and start!7086 res!26679) b!45485))

(assert (= (and start!7086 ((_ is ValueCellFull!708) c!12)) b!45486))

(declare-fun m!40043 () Bool)

(assert (=> start!7086 m!40043))

(check-sat (not start!7086) tp_is_empty!1911)
(check-sat)
(get-model)

