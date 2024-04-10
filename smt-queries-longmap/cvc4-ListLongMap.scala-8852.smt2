; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107354 () Bool)

(assert start!107354)

(declare-fun b_free!27659 () Bool)

(declare-fun b_next!27659 () Bool)

(assert (=> start!107354 (= b_free!27659 (not b_next!27659))))

(declare-fun tp!97486 () Bool)

(declare-fun b_and!45707 () Bool)

(assert (=> start!107354 (= tp!97486 b_and!45707)))

(declare-fun mapIsEmpty!51127 () Bool)

(declare-fun mapRes!51127 () Bool)

(assert (=> mapIsEmpty!51127 mapRes!51127))

(declare-datatypes ((V!49231 0))(
  ( (V!49232 (val!16589 Int)) )
))
(declare-datatypes ((ValueCell!15661 0))(
  ( (ValueCellFull!15661 (v!19226 V!49231)) (EmptyCell!15661) )
))
(declare-datatypes ((array!83308 0))(
  ( (array!83309 (arr!40190 (Array (_ BitVec 32) ValueCell!15661)) (size!40726 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83308)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun b!1272244 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83310 0))(
  ( (array!83311 (arr!40191 (Array (_ BitVec 32) (_ BitVec 64))) (size!40727 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83310)

(declare-fun minValueAfter!52 () V!49231)

(declare-fun e!725621 () Bool)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49231)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49231)

(declare-fun zeroValueBefore!52 () V!49231)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21374 0))(
  ( (tuple2!21375 (_1!10698 (_ BitVec 64)) (_2!10698 V!49231)) )
))
(declare-datatypes ((List!28557 0))(
  ( (Nil!28554) (Cons!28553 (h!29762 tuple2!21374) (t!42088 List!28557)) )
))
(declare-datatypes ((ListLongMap!19103 0))(
  ( (ListLongMap!19104 (toList!9567 List!28557)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5899 (array!83310 array!83308 (_ BitVec 32) (_ BitVec 32) V!49231 V!49231 (_ BitVec 32) Int) ListLongMap!19103)

(assert (=> b!1272244 (= e!725621 (not (= (getCurrentListMapNoExtraKeys!5899 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5899 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(declare-fun b!1272245 () Bool)

(declare-fun e!725619 () Bool)

(declare-fun e!725622 () Bool)

(assert (=> b!1272245 (= e!725619 (and e!725622 mapRes!51127))))

(declare-fun condMapEmpty!51127 () Bool)

(declare-fun mapDefault!51127 () ValueCell!15661)

