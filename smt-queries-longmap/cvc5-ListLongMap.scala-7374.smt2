; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93984 () Bool)

(assert start!93984)

(declare-fun b_free!21421 () Bool)

(declare-fun b_next!21421 () Bool)

(assert (=> start!93984 (= b_free!21421 (not b_next!21421))))

(declare-fun tp!75692 () Bool)

(declare-fun b_and!34153 () Bool)

(assert (=> start!93984 (= tp!75692 b_and!34153)))

(declare-fun b!1062917 () Bool)

(declare-fun e!605540 () Bool)

(declare-fun tp_is_empty!25231 () Bool)

(assert (=> b!1062917 (= e!605540 tp_is_empty!25231)))

(declare-fun b!1062918 () Bool)

(declare-fun e!605543 () Bool)

(assert (=> b!1062918 (= e!605543 tp_is_empty!25231)))

(declare-fun mapIsEmpty!39523 () Bool)

(declare-fun mapRes!39523 () Bool)

(assert (=> mapIsEmpty!39523 mapRes!39523))

(declare-fun mapNonEmpty!39523 () Bool)

(declare-fun tp!75691 () Bool)

(assert (=> mapNonEmpty!39523 (= mapRes!39523 (and tp!75691 e!605540))))

(declare-fun mapKey!39523 () (_ BitVec 32))

(declare-datatypes ((V!38777 0))(
  ( (V!38778 (val!12666 Int)) )
))
(declare-datatypes ((ValueCell!11912 0))(
  ( (ValueCellFull!11912 (v!15277 V!38777)) (EmptyCell!11912) )
))
(declare-datatypes ((array!67467 0))(
  ( (array!67468 (arr!32439 (Array (_ BitVec 32) ValueCell!11912)) (size!32975 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67467)

(declare-fun mapValue!39523 () ValueCell!11912)

(declare-fun mapRest!39523 () (Array (_ BitVec 32) ValueCell!11912))

(assert (=> mapNonEmpty!39523 (= (arr!32439 _values!955) (store mapRest!39523 mapKey!39523 mapValue!39523))))

(declare-fun b!1062919 () Bool)

(declare-fun e!605537 () Bool)

(assert (=> b!1062919 (= e!605537 (and e!605543 mapRes!39523))))

(declare-fun condMapEmpty!39523 () Bool)

(declare-fun mapDefault!39523 () ValueCell!11912)

