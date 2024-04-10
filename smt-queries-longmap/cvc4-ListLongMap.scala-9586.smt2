; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113382 () Bool)

(assert start!113382)

(declare-fun b_free!31433 () Bool)

(declare-fun b_next!31433 () Bool)

(assert (=> start!113382 (= b_free!31433 (not b_next!31433))))

(declare-fun tp!110103 () Bool)

(declare-fun b_and!50719 () Bool)

(assert (=> start!113382 (= tp!110103 b_and!50719)))

(declare-fun mapNonEmpty!57856 () Bool)

(declare-fun mapRes!57856 () Bool)

(declare-fun tp!110104 () Bool)

(declare-fun e!765808 () Bool)

(assert (=> mapNonEmpty!57856 (= mapRes!57856 (and tp!110104 e!765808))))

(declare-fun mapKey!57856 () (_ BitVec 32))

(declare-datatypes ((V!55013 0))(
  ( (V!55014 (val!18791 Int)) )
))
(declare-datatypes ((ValueCell!17818 0))(
  ( (ValueCellFull!17818 (v!21439 V!55013)) (EmptyCell!17818) )
))
(declare-datatypes ((array!91706 0))(
  ( (array!91707 (arr!44309 (Array (_ BitVec 32) ValueCell!17818)) (size!44859 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91706)

(declare-fun mapValue!57856 () ValueCell!17818)

(declare-fun mapRest!57856 () (Array (_ BitVec 32) ValueCell!17818))

(assert (=> mapNonEmpty!57856 (= (arr!44309 _values!1303) (store mapRest!57856 mapKey!57856 mapValue!57856))))

(declare-fun res!893114 () Bool)

(declare-fun e!765805 () Bool)

(assert (=> start!113382 (=> (not res!893114) (not e!765805))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113382 (= res!893114 (validMask!0 mask!1977))))

(assert (=> start!113382 e!765805))

(declare-fun tp_is_empty!37433 () Bool)

(assert (=> start!113382 tp_is_empty!37433))

(assert (=> start!113382 true))

(declare-datatypes ((array!91708 0))(
  ( (array!91709 (arr!44310 (Array (_ BitVec 32) (_ BitVec 64))) (size!44860 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91708)

(declare-fun array_inv!33389 (array!91708) Bool)

(assert (=> start!113382 (array_inv!33389 _keys!1571)))

(declare-fun e!765809 () Bool)

(declare-fun array_inv!33390 (array!91706) Bool)

(assert (=> start!113382 (and (array_inv!33390 _values!1303) e!765809)))

(assert (=> start!113382 tp!110103))

(declare-fun b!1345930 () Bool)

(declare-fun e!765807 () Bool)

(assert (=> b!1345930 (= e!765809 (and e!765807 mapRes!57856))))

(declare-fun condMapEmpty!57856 () Bool)

(declare-fun mapDefault!57856 () ValueCell!17818)

