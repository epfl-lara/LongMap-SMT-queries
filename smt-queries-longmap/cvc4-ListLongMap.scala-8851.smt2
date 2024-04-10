; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107334 () Bool)

(assert start!107334)

(declare-fun b_free!27653 () Bool)

(declare-fun b_next!27653 () Bool)

(assert (=> start!107334 (= b_free!27653 (not b_next!27653))))

(declare-fun tp!97464 () Bool)

(declare-fun b_and!45685 () Bool)

(assert (=> start!107334 (= tp!97464 b_and!45685)))

(declare-fun mapIsEmpty!51115 () Bool)

(declare-fun mapRes!51115 () Bool)

(assert (=> mapIsEmpty!51115 mapRes!51115))

(declare-datatypes ((V!49223 0))(
  ( (V!49224 (val!16586 Int)) )
))
(declare-datatypes ((ValueCell!15658 0))(
  ( (ValueCellFull!15658 (v!19223 V!49223)) (EmptyCell!15658) )
))
(declare-datatypes ((array!83294 0))(
  ( (array!83295 (arr!40184 (Array (_ BitVec 32) ValueCell!15658)) (size!40720 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83294)

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!83296 0))(
  ( (array!83297 (arr!40185 (Array (_ BitVec 32) (_ BitVec 64))) (size!40721 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83296)

(declare-fun e!725504 () Bool)

(declare-fun minValueAfter!52 () V!49223)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49223)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49223)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun b!1272063 () Bool)

(declare-fun zeroValueBefore!52 () V!49223)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21368 0))(
  ( (tuple2!21369 (_1!10695 (_ BitVec 64)) (_2!10695 V!49223)) )
))
(declare-datatypes ((List!28552 0))(
  ( (Nil!28549) (Cons!28548 (h!29757 tuple2!21368) (t!42081 List!28552)) )
))
(declare-datatypes ((ListLongMap!19097 0))(
  ( (ListLongMap!19098 (toList!9564 List!28552)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5896 (array!83296 array!83294 (_ BitVec 32) (_ BitVec 32) V!49223 V!49223 (_ BitVec 32) Int) ListLongMap!19097)

(assert (=> b!1272063 (= e!725504 (not (= (getCurrentListMapNoExtraKeys!5896 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5896 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(assert (=> b!1272063 (= (getCurrentListMapNoExtraKeys!5896 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5896 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42314 0))(
  ( (Unit!42315) )
))
(declare-fun lt!574953 () Unit!42314)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1238 (array!83296 array!83294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49223 V!49223 V!49223 V!49223 (_ BitVec 32) Int) Unit!42314)

(assert (=> b!1272063 (= lt!574953 (lemmaNoChangeToArrayThenSameMapNoExtras!1238 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!51115 () Bool)

(declare-fun tp!97465 () Bool)

(declare-fun e!725508 () Bool)

(assert (=> mapNonEmpty!51115 (= mapRes!51115 (and tp!97465 e!725508))))

(declare-fun mapKey!51115 () (_ BitVec 32))

(declare-fun mapRest!51115 () (Array (_ BitVec 32) ValueCell!15658))

(declare-fun mapValue!51115 () ValueCell!15658)

(assert (=> mapNonEmpty!51115 (= (arr!40184 _values!1134) (store mapRest!51115 mapKey!51115 mapValue!51115))))

(declare-fun b!1272065 () Bool)

(declare-fun res!846242 () Bool)

(assert (=> b!1272065 (=> (not res!846242) (not e!725504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83296 (_ BitVec 32)) Bool)

(assert (=> b!1272065 (= res!846242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272066 () Bool)

(declare-fun e!725506 () Bool)

(declare-fun e!725507 () Bool)

(assert (=> b!1272066 (= e!725506 (and e!725507 mapRes!51115))))

(declare-fun condMapEmpty!51115 () Bool)

(declare-fun mapDefault!51115 () ValueCell!15658)

