; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105394 () Bool)

(assert start!105394)

(declare-fun b_free!27053 () Bool)

(declare-fun b_next!27053 () Bool)

(assert (=> start!105394 (= b_free!27053 (not b_next!27053))))

(declare-fun tp!94672 () Bool)

(declare-fun b_and!44899 () Bool)

(assert (=> start!105394 (= tp!94672 b_and!44899)))

(declare-fun mapNonEmpty!49717 () Bool)

(declare-fun mapRes!49717 () Bool)

(declare-fun tp!94673 () Bool)

(declare-fun e!713652 () Bool)

(assert (=> mapNonEmpty!49717 (= mapRes!49717 (and tp!94673 e!713652))))

(declare-datatypes ((V!47971 0))(
  ( (V!47972 (val!16040 Int)) )
))
(declare-datatypes ((ValueCell!15214 0))(
  ( (ValueCellFull!15214 (v!18740 V!47971)) (EmptyCell!15214) )
))
(declare-fun mapValue!49717 () ValueCell!15214)

(declare-fun mapRest!49717 () (Array (_ BitVec 32) ValueCell!15214))

(declare-fun mapKey!49717 () (_ BitVec 32))

(declare-datatypes ((array!81554 0))(
  ( (array!81555 (arr!39336 (Array (_ BitVec 32) ValueCell!15214)) (size!39872 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81554)

(assert (=> mapNonEmpty!49717 (= (arr!39336 _values!914) (store mapRest!49717 mapKey!49717 mapValue!49717))))

(declare-fun b!1255633 () Bool)

(declare-fun e!713653 () Bool)

(declare-fun tp_is_empty!31955 () Bool)

(assert (=> b!1255633 (= e!713653 tp_is_empty!31955)))

(declare-fun b!1255634 () Bool)

(declare-fun e!713655 () Bool)

(assert (=> b!1255634 (= e!713655 (and e!713653 mapRes!49717))))

(declare-fun condMapEmpty!49717 () Bool)

(declare-fun mapDefault!49717 () ValueCell!15214)

