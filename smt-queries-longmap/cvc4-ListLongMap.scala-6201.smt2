; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79318 () Bool)

(assert start!79318)

(declare-fun b_free!17531 () Bool)

(declare-fun b_next!17531 () Bool)

(assert (=> start!79318 (= b_free!17531 (not b_next!17531))))

(declare-fun tp!61033 () Bool)

(declare-fun b_and!28613 () Bool)

(assert (=> start!79318 (= tp!61033 b_and!28613)))

(declare-fun mapNonEmpty!31815 () Bool)

(declare-fun mapRes!31815 () Bool)

(declare-fun tp!61034 () Bool)

(declare-fun e!523234 () Bool)

(assert (=> mapNonEmpty!31815 (= mapRes!31815 (and tp!61034 e!523234))))

(declare-datatypes ((V!31683 0))(
  ( (V!31684 (val!10070 Int)) )
))
(declare-datatypes ((ValueCell!9538 0))(
  ( (ValueCellFull!9538 (v!12588 V!31683)) (EmptyCell!9538) )
))
(declare-fun mapValue!31815 () ValueCell!9538)

(declare-fun mapKey!31815 () (_ BitVec 32))

(declare-datatypes ((array!56018 0))(
  ( (array!56019 (arr!26954 (Array (_ BitVec 32) ValueCell!9538)) (size!27413 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56018)

(declare-fun mapRest!31815 () (Array (_ BitVec 32) ValueCell!9538))

(assert (=> mapNonEmpty!31815 (= (arr!26954 _values!1231) (store mapRest!31815 mapKey!31815 mapValue!31815))))

(declare-fun b!931701 () Bool)

(declare-fun e!523230 () Bool)

(declare-fun tp_is_empty!20039 () Bool)

(assert (=> b!931701 (= e!523230 tp_is_empty!20039)))

(declare-fun b!931702 () Bool)

(declare-fun e!523231 () Bool)

(assert (=> b!931702 (= e!523231 (and e!523230 mapRes!31815))))

(declare-fun condMapEmpty!31815 () Bool)

(declare-fun mapDefault!31815 () ValueCell!9538)

