; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105370 () Bool)

(assert start!105370)

(declare-fun b_free!27043 () Bool)

(declare-fun b_next!27043 () Bool)

(assert (=> start!105370 (= b_free!27043 (not b_next!27043))))

(declare-fun tp!94640 () Bool)

(declare-fun b_and!44881 () Bool)

(assert (=> start!105370 (= tp!94640 b_and!44881)))

(declare-fun mapNonEmpty!49699 () Bool)

(declare-fun mapRes!49699 () Bool)

(declare-fun tp!94639 () Bool)

(declare-fun e!713517 () Bool)

(assert (=> mapNonEmpty!49699 (= mapRes!49699 (and tp!94639 e!713517))))

(declare-datatypes ((V!47959 0))(
  ( (V!47960 (val!16035 Int)) )
))
(declare-datatypes ((ValueCell!15209 0))(
  ( (ValueCellFull!15209 (v!18735 V!47959)) (EmptyCell!15209) )
))
(declare-fun mapValue!49699 () ValueCell!15209)

(declare-datatypes ((array!81536 0))(
  ( (array!81537 (arr!39328 (Array (_ BitVec 32) ValueCell!15209)) (size!39864 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81536)

(declare-fun mapRest!49699 () (Array (_ BitVec 32) ValueCell!15209))

(declare-fun mapKey!49699 () (_ BitVec 32))

(assert (=> mapNonEmpty!49699 (= (arr!39328 _values!914) (store mapRest!49699 mapKey!49699 mapValue!49699))))

(declare-fun b!1255435 () Bool)

(declare-fun e!713514 () Bool)

(declare-fun e!713516 () Bool)

(assert (=> b!1255435 (= e!713514 (and e!713516 mapRes!49699))))

(declare-fun condMapEmpty!49699 () Bool)

(declare-fun mapDefault!49699 () ValueCell!15209)

