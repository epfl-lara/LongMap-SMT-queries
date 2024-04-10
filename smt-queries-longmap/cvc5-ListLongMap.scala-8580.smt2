; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104698 () Bool)

(assert start!104698)

(declare-fun b_free!26515 () Bool)

(declare-fun b_next!26515 () Bool)

(assert (=> start!104698 (= b_free!26515 (not b_next!26515))))

(declare-fun tp!93031 () Bool)

(declare-fun b_and!44279 () Bool)

(assert (=> start!104698 (= tp!93031 b_and!44279)))

(declare-fun res!832785 () Bool)

(declare-fun e!708270 () Bool)

(assert (=> start!104698 (=> (not res!832785) (not e!708270))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104698 (= res!832785 (validMask!0 mask!1466))))

(assert (=> start!104698 e!708270))

(assert (=> start!104698 true))

(assert (=> start!104698 tp!93031))

(declare-fun tp_is_empty!31417 () Bool)

(assert (=> start!104698 tp_is_empty!31417))

(declare-datatypes ((array!80526 0))(
  ( (array!80527 (arr!38831 (Array (_ BitVec 32) (_ BitVec 64))) (size!39367 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80526)

(declare-fun array_inv!29639 (array!80526) Bool)

(assert (=> start!104698 (array_inv!29639 _keys!1118)))

(declare-datatypes ((V!47255 0))(
  ( (V!47256 (val!15771 Int)) )
))
(declare-datatypes ((ValueCell!14945 0))(
  ( (ValueCellFull!14945 (v!18467 V!47255)) (EmptyCell!14945) )
))
(declare-datatypes ((array!80528 0))(
  ( (array!80529 (arr!38832 (Array (_ BitVec 32) ValueCell!14945)) (size!39368 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80528)

(declare-fun e!708274 () Bool)

(declare-fun array_inv!29640 (array!80528) Bool)

(assert (=> start!104698 (and (array_inv!29640 _values!914) e!708274)))

(declare-fun b!1248224 () Bool)

(declare-fun e!708271 () Bool)

(assert (=> b!1248224 (= e!708271 tp_is_empty!31417)))

(declare-fun mapNonEmpty!48883 () Bool)

(declare-fun mapRes!48883 () Bool)

(declare-fun tp!93032 () Bool)

(declare-fun e!708273 () Bool)

(assert (=> mapNonEmpty!48883 (= mapRes!48883 (and tp!93032 e!708273))))

(declare-fun mapKey!48883 () (_ BitVec 32))

(declare-fun mapValue!48883 () ValueCell!14945)

(declare-fun mapRest!48883 () (Array (_ BitVec 32) ValueCell!14945))

(assert (=> mapNonEmpty!48883 (= (arr!38832 _values!914) (store mapRest!48883 mapKey!48883 mapValue!48883))))

(declare-fun b!1248225 () Bool)

(assert (=> b!1248225 (= e!708270 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47255)

(declare-datatypes ((tuple2!20314 0))(
  ( (tuple2!20315 (_1!10168 (_ BitVec 64)) (_2!10168 V!47255)) )
))
(declare-datatypes ((List!27562 0))(
  ( (Nil!27559) (Cons!27558 (h!28767 tuple2!20314) (t!41031 List!27562)) )
))
(declare-datatypes ((ListLongMap!18187 0))(
  ( (ListLongMap!18188 (toList!9109 List!27562)) )
))
(declare-fun lt!563377 () ListLongMap!18187)

(declare-fun minValueBefore!43 () V!47255)

(declare-fun getCurrentListMapNoExtraKeys!5516 (array!80526 array!80528 (_ BitVec 32) (_ BitVec 32) V!47255 V!47255 (_ BitVec 32) Int) ListLongMap!18187)

(assert (=> b!1248225 (= lt!563377 (getCurrentListMapNoExtraKeys!5516 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248226 () Bool)

(declare-fun res!832788 () Bool)

(assert (=> b!1248226 (=> (not res!832788) (not e!708270))))

(declare-datatypes ((List!27563 0))(
  ( (Nil!27560) (Cons!27559 (h!28768 (_ BitVec 64)) (t!41032 List!27563)) )
))
(declare-fun arrayNoDuplicates!0 (array!80526 (_ BitVec 32) List!27563) Bool)

(assert (=> b!1248226 (= res!832788 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27560))))

(declare-fun b!1248227 () Bool)

(assert (=> b!1248227 (= e!708274 (and e!708271 mapRes!48883))))

(declare-fun condMapEmpty!48883 () Bool)

(declare-fun mapDefault!48883 () ValueCell!14945)

