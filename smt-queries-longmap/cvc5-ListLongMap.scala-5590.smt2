; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73324 () Bool)

(assert start!73324)

(declare-fun b_free!14239 () Bool)

(declare-fun b_next!14239 () Bool)

(assert (=> start!73324 (= b_free!14239 (not b_next!14239))))

(declare-fun tp!50220 () Bool)

(declare-fun b_and!23595 () Bool)

(assert (=> start!73324 (= tp!50220 b_and!23595)))

(declare-fun res!580984 () Bool)

(declare-fun e!476936 () Bool)

(assert (=> start!73324 (=> (not res!580984) (not e!476936))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48946 0))(
  ( (array!48947 (arr!23504 (Array (_ BitVec 32) (_ BitVec 64))) (size!23944 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48946)

(assert (=> start!73324 (= res!580984 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23944 _keys!868))))))

(assert (=> start!73324 e!476936))

(declare-fun tp_is_empty!16375 () Bool)

(assert (=> start!73324 tp_is_empty!16375))

(assert (=> start!73324 true))

(assert (=> start!73324 tp!50220))

(declare-fun array_inv!18622 (array!48946) Bool)

(assert (=> start!73324 (array_inv!18622 _keys!868)))

(declare-datatypes ((V!26881 0))(
  ( (V!26882 (val!8235 Int)) )
))
(declare-datatypes ((ValueCell!7748 0))(
  ( (ValueCellFull!7748 (v!10660 V!26881)) (EmptyCell!7748) )
))
(declare-datatypes ((array!48948 0))(
  ( (array!48949 (arr!23505 (Array (_ BitVec 32) ValueCell!7748)) (size!23945 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48948)

(declare-fun e!476935 () Bool)

(declare-fun array_inv!18623 (array!48948) Bool)

(assert (=> start!73324 (and (array_inv!18623 _values!688) e!476935)))

(declare-fun b!855469 () Bool)

(declare-fun res!580981 () Bool)

(assert (=> b!855469 (=> (not res!580981) (not e!476936))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855469 (= res!580981 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23944 _keys!868))))))

(declare-fun b!855470 () Bool)

(declare-fun res!580980 () Bool)

(assert (=> b!855470 (=> (not res!580980) (not e!476936))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855470 (= res!580980 (validKeyInArray!0 k!854))))

(declare-fun b!855471 () Bool)

(declare-fun e!476934 () Bool)

(assert (=> b!855471 (= e!476934 tp_is_empty!16375)))

(declare-fun mapNonEmpty!26162 () Bool)

(declare-fun mapRes!26162 () Bool)

(declare-fun tp!50221 () Bool)

(assert (=> mapNonEmpty!26162 (= mapRes!26162 (and tp!50221 e!476934))))

(declare-fun mapValue!26162 () ValueCell!7748)

(declare-fun mapRest!26162 () (Array (_ BitVec 32) ValueCell!7748))

(declare-fun mapKey!26162 () (_ BitVec 32))

(assert (=> mapNonEmpty!26162 (= (arr!23505 _values!688) (store mapRest!26162 mapKey!26162 mapValue!26162))))

(declare-fun b!855472 () Bool)

(declare-fun res!580983 () Bool)

(assert (=> b!855472 (=> (not res!580983) (not e!476936))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48946 (_ BitVec 32)) Bool)

(assert (=> b!855472 (= res!580983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855473 () Bool)

(declare-fun res!580985 () Bool)

(assert (=> b!855473 (=> (not res!580985) (not e!476936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855473 (= res!580985 (validMask!0 mask!1196))))

(declare-fun b!855474 () Bool)

(declare-fun res!580982 () Bool)

(assert (=> b!855474 (=> (not res!580982) (not e!476936))))

(declare-datatypes ((List!16664 0))(
  ( (Nil!16661) (Cons!16660 (h!17791 (_ BitVec 64)) (t!23305 List!16664)) )
))
(declare-fun arrayNoDuplicates!0 (array!48946 (_ BitVec 32) List!16664) Bool)

(assert (=> b!855474 (= res!580982 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16661))))

(declare-fun b!855475 () Bool)

(declare-fun res!580979 () Bool)

(assert (=> b!855475 (=> (not res!580979) (not e!476936))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855475 (= res!580979 (and (= (size!23945 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23944 _keys!868) (size!23945 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855476 () Bool)

(assert (=> b!855476 (= e!476936 false)))

(declare-fun v!557 () V!26881)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26881)

(declare-fun zeroValue!654 () V!26881)

(declare-datatypes ((tuple2!10852 0))(
  ( (tuple2!10853 (_1!5437 (_ BitVec 64)) (_2!5437 V!26881)) )
))
(declare-datatypes ((List!16665 0))(
  ( (Nil!16662) (Cons!16661 (h!17792 tuple2!10852) (t!23306 List!16665)) )
))
(declare-datatypes ((ListLongMap!9621 0))(
  ( (ListLongMap!9622 (toList!4826 List!16665)) )
))
(declare-fun lt!385705 () ListLongMap!9621)

(declare-fun getCurrentListMapNoExtraKeys!2807 (array!48946 array!48948 (_ BitVec 32) (_ BitVec 32) V!26881 V!26881 (_ BitVec 32) Int) ListLongMap!9621)

(assert (=> b!855476 (= lt!385705 (getCurrentListMapNoExtraKeys!2807 _keys!868 (array!48949 (store (arr!23505 _values!688) i!612 (ValueCellFull!7748 v!557)) (size!23945 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385704 () ListLongMap!9621)

(assert (=> b!855476 (= lt!385704 (getCurrentListMapNoExtraKeys!2807 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855477 () Bool)

(declare-fun e!476938 () Bool)

(assert (=> b!855477 (= e!476938 tp_is_empty!16375)))

(declare-fun b!855478 () Bool)

(assert (=> b!855478 (= e!476935 (and e!476938 mapRes!26162))))

(declare-fun condMapEmpty!26162 () Bool)

(declare-fun mapDefault!26162 () ValueCell!7748)

