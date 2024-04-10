; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41374 () Bool)

(assert start!41374)

(declare-fun b!462437 () Bool)

(declare-fun e!269843 () Bool)

(declare-fun tp_is_empty!12491 () Bool)

(assert (=> b!462437 (= e!269843 tp_is_empty!12491)))

(declare-fun mapNonEmpty!20407 () Bool)

(declare-fun mapRes!20407 () Bool)

(declare-fun tp!39226 () Bool)

(assert (=> mapNonEmpty!20407 (= mapRes!20407 (and tp!39226 e!269843))))

(declare-datatypes ((V!17759 0))(
  ( (V!17760 (val!6290 Int)) )
))
(declare-datatypes ((ValueCell!5902 0))(
  ( (ValueCellFull!5902 (v!8577 V!17759)) (EmptyCell!5902) )
))
(declare-datatypes ((array!28783 0))(
  ( (array!28784 (arr!13825 (Array (_ BitVec 32) ValueCell!5902)) (size!14177 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28783)

(declare-fun mapRest!20407 () (Array (_ BitVec 32) ValueCell!5902))

(declare-fun mapKey!20407 () (_ BitVec 32))

(declare-fun mapValue!20407 () ValueCell!5902)

(assert (=> mapNonEmpty!20407 (= (arr!13825 _values!833) (store mapRest!20407 mapKey!20407 mapValue!20407))))

(declare-fun b!462438 () Bool)

(declare-fun e!269845 () Bool)

(declare-fun e!269847 () Bool)

(assert (=> b!462438 (= e!269845 (and e!269847 mapRes!20407))))

(declare-fun condMapEmpty!20407 () Bool)

(declare-fun mapDefault!20407 () ValueCell!5902)

