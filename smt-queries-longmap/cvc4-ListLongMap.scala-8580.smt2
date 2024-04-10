; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104702 () Bool)

(assert start!104702)

(declare-fun b_free!26519 () Bool)

(declare-fun b_next!26519 () Bool)

(assert (=> start!104702 (= b_free!26519 (not b_next!26519))))

(declare-fun tp!93044 () Bool)

(declare-fun b_and!44283 () Bool)

(assert (=> start!104702 (= tp!93044 b_and!44283)))

(declare-fun b!1248266 () Bool)

(declare-fun e!708301 () Bool)

(assert (=> b!1248266 (= e!708301 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47259 0))(
  ( (V!47260 (val!15773 Int)) )
))
(declare-fun zeroValue!871 () V!47259)

(declare-datatypes ((array!80534 0))(
  ( (array!80535 (arr!38835 (Array (_ BitVec 32) (_ BitVec 64))) (size!39371 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80534)

(declare-datatypes ((ValueCell!14947 0))(
  ( (ValueCellFull!14947 (v!18469 V!47259)) (EmptyCell!14947) )
))
(declare-datatypes ((array!80536 0))(
  ( (array!80537 (arr!38836 (Array (_ BitVec 32) ValueCell!14947)) (size!39372 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80536)

(declare-fun minValueBefore!43 () V!47259)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20318 0))(
  ( (tuple2!20319 (_1!10170 (_ BitVec 64)) (_2!10170 V!47259)) )
))
(declare-datatypes ((List!27566 0))(
  ( (Nil!27563) (Cons!27562 (h!28771 tuple2!20318) (t!41035 List!27566)) )
))
(declare-datatypes ((ListLongMap!18191 0))(
  ( (ListLongMap!18192 (toList!9111 List!27566)) )
))
(declare-fun lt!563383 () ListLongMap!18191)

(declare-fun getCurrentListMapNoExtraKeys!5518 (array!80534 array!80536 (_ BitVec 32) (_ BitVec 32) V!47259 V!47259 (_ BitVec 32) Int) ListLongMap!18191)

(assert (=> b!1248266 (= lt!563383 (getCurrentListMapNoExtraKeys!5518 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48889 () Bool)

(declare-fun mapRes!48889 () Bool)

(assert (=> mapIsEmpty!48889 mapRes!48889))

(declare-fun b!1248267 () Bool)

(declare-fun e!708302 () Bool)

(declare-fun tp_is_empty!31421 () Bool)

(assert (=> b!1248267 (= e!708302 tp_is_empty!31421)))

(declare-fun b!1248268 () Bool)

(declare-fun e!708304 () Bool)

(assert (=> b!1248268 (= e!708304 (and e!708302 mapRes!48889))))

(declare-fun condMapEmpty!48889 () Bool)

(declare-fun mapDefault!48889 () ValueCell!14947)

