; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110608 () Bool)

(assert start!110608)

(declare-fun b_free!29443 () Bool)

(declare-fun b_next!29443 () Bool)

(assert (=> start!110608 (= b_free!29443 (not b_next!29443))))

(declare-fun tp!103651 () Bool)

(declare-fun b_and!47651 () Bool)

(assert (=> start!110608 (= tp!103651 b_and!47651)))

(declare-fun mapIsEmpty!54388 () Bool)

(declare-fun mapRes!54388 () Bool)

(assert (=> mapIsEmpty!54388 mapRes!54388))

(declare-fun b!1308752 () Bool)

(declare-fun e!746685 () Bool)

(declare-fun tp_is_empty!35173 () Bool)

(assert (=> b!1308752 (= e!746685 tp_is_empty!35173)))

(declare-fun mapNonEmpty!54388 () Bool)

(declare-fun tp!103650 () Bool)

(declare-fun e!746687 () Bool)

(assert (=> mapNonEmpty!54388 (= mapRes!54388 (and tp!103650 e!746687))))

(declare-datatypes ((V!52001 0))(
  ( (V!52002 (val!17661 Int)) )
))
(declare-datatypes ((ValueCell!16688 0))(
  ( (ValueCellFull!16688 (v!20288 V!52001)) (EmptyCell!16688) )
))
(declare-fun mapRest!54388 () (Array (_ BitVec 32) ValueCell!16688))

(declare-fun mapValue!54388 () ValueCell!16688)

(declare-fun mapKey!54388 () (_ BitVec 32))

(declare-datatypes ((array!87344 0))(
  ( (array!87345 (arr!42152 (Array (_ BitVec 32) ValueCell!16688)) (size!42702 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87344)

(assert (=> mapNonEmpty!54388 (= (arr!42152 _values!1354) (store mapRest!54388 mapKey!54388 mapValue!54388))))

(declare-fun b!1308753 () Bool)

(declare-fun e!746684 () Bool)

(assert (=> b!1308753 (= e!746684 (and e!746685 mapRes!54388))))

(declare-fun condMapEmpty!54388 () Bool)

(declare-fun mapDefault!54388 () ValueCell!16688)

