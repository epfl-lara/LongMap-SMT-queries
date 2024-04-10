; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104788 () Bool)

(assert start!104788)

(declare-fun b_free!26593 () Bool)

(declare-fun b_next!26593 () Bool)

(assert (=> start!104788 (= b_free!26593 (not b_next!26593))))

(declare-fun tp!93268 () Bool)

(declare-fun b_and!44361 () Bool)

(assert (=> start!104788 (= tp!93268 b_and!44361)))

(declare-fun res!833282 () Bool)

(declare-fun e!708906 () Bool)

(assert (=> start!104788 (=> (not res!833282) (not e!708906))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104788 (= res!833282 (validMask!0 mask!1466))))

(assert (=> start!104788 e!708906))

(assert (=> start!104788 true))

(assert (=> start!104788 tp!93268))

(declare-fun tp_is_empty!31495 () Bool)

(assert (=> start!104788 tp_is_empty!31495))

(declare-datatypes ((array!80674 0))(
  ( (array!80675 (arr!38904 (Array (_ BitVec 32) (_ BitVec 64))) (size!39440 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80674)

(declare-fun array_inv!29691 (array!80674) Bool)

(assert (=> start!104788 (array_inv!29691 _keys!1118)))

(declare-datatypes ((V!47359 0))(
  ( (V!47360 (val!15810 Int)) )
))
(declare-datatypes ((ValueCell!14984 0))(
  ( (ValueCellFull!14984 (v!18506 V!47359)) (EmptyCell!14984) )
))
(declare-datatypes ((array!80676 0))(
  ( (array!80677 (arr!38905 (Array (_ BitVec 32) ValueCell!14984)) (size!39441 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80676)

(declare-fun e!708907 () Bool)

(declare-fun array_inv!29692 (array!80676) Bool)

(assert (=> start!104788 (and (array_inv!29692 _values!914) e!708907)))

(declare-fun b!1249116 () Bool)

(assert (=> b!1249116 (= e!708906 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47359)

(declare-fun minValueAfter!43 () V!47359)

(declare-datatypes ((tuple2!20366 0))(
  ( (tuple2!20367 (_1!10194 (_ BitVec 64)) (_2!10194 V!47359)) )
))
(declare-datatypes ((List!27613 0))(
  ( (Nil!27610) (Cons!27609 (h!28818 tuple2!20366) (t!41084 List!27613)) )
))
(declare-datatypes ((ListLongMap!18239 0))(
  ( (ListLongMap!18240 (toList!9135 List!27613)) )
))
(declare-fun lt!563608 () ListLongMap!18239)

(declare-fun getCurrentListMapNoExtraKeys!5542 (array!80674 array!80676 (_ BitVec 32) (_ BitVec 32) V!47359 V!47359 (_ BitVec 32) Int) ListLongMap!18239)

(assert (=> b!1249116 (= lt!563608 (getCurrentListMapNoExtraKeys!5542 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563607 () ListLongMap!18239)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47359)

(assert (=> b!1249116 (= lt!563607 (getCurrentListMapNoExtraKeys!5542 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249117 () Bool)

(declare-fun res!833281 () Bool)

(assert (=> b!1249117 (=> (not res!833281) (not e!708906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80674 (_ BitVec 32)) Bool)

(assert (=> b!1249117 (= res!833281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249118 () Bool)

(declare-fun e!708905 () Bool)

(assert (=> b!1249118 (= e!708905 tp_is_empty!31495)))

(declare-fun mapIsEmpty!49003 () Bool)

(declare-fun mapRes!49003 () Bool)

(assert (=> mapIsEmpty!49003 mapRes!49003))

(declare-fun b!1249119 () Bool)

(declare-fun e!708904 () Bool)

(assert (=> b!1249119 (= e!708904 tp_is_empty!31495)))

(declare-fun mapNonEmpty!49003 () Bool)

(declare-fun tp!93269 () Bool)

(assert (=> mapNonEmpty!49003 (= mapRes!49003 (and tp!93269 e!708905))))

(declare-fun mapRest!49003 () (Array (_ BitVec 32) ValueCell!14984))

(declare-fun mapKey!49003 () (_ BitVec 32))

(declare-fun mapValue!49003 () ValueCell!14984)

(assert (=> mapNonEmpty!49003 (= (arr!38905 _values!914) (store mapRest!49003 mapKey!49003 mapValue!49003))))

(declare-fun b!1249120 () Bool)

(assert (=> b!1249120 (= e!708907 (and e!708904 mapRes!49003))))

(declare-fun condMapEmpty!49003 () Bool)

(declare-fun mapDefault!49003 () ValueCell!14984)

