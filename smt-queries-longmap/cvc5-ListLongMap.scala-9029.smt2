; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108958 () Bool)

(assert start!108958)

(declare-fun b_free!28447 () Bool)

(declare-fun b_next!28447 () Bool)

(assert (=> start!108958 (= b_free!28447 (not b_next!28447))))

(declare-fun tp!100460 () Bool)

(declare-fun b_and!46537 () Bool)

(assert (=> start!108958 (= tp!100460 b_and!46537)))

(declare-fun b!1287399 () Bool)

(declare-fun e!735233 () Bool)

(declare-fun tp_is_empty!34087 () Bool)

(assert (=> b!1287399 (= e!735233 tp_is_empty!34087)))

(declare-fun b!1287401 () Bool)

(declare-fun res!855011 () Bool)

(declare-fun e!735230 () Bool)

(assert (=> b!1287401 (=> (not res!855011) (not e!735230))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85224 0))(
  ( (array!85225 (arr!41113 (Array (_ BitVec 32) (_ BitVec 64))) (size!41663 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85224)

(assert (=> b!1287401 (= res!855011 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41663 _keys!1741))))))

(declare-fun b!1287402 () Bool)

(declare-fun res!855005 () Bool)

(assert (=> b!1287402 (=> (not res!855005) (not e!735230))))

(declare-datatypes ((V!50553 0))(
  ( (V!50554 (val!17118 Int)) )
))
(declare-datatypes ((ValueCell!16145 0))(
  ( (ValueCellFull!16145 (v!19721 V!50553)) (EmptyCell!16145) )
))
(declare-datatypes ((array!85226 0))(
  ( (array!85227 (arr!41114 (Array (_ BitVec 32) ValueCell!16145)) (size!41664 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85226)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1287402 (= res!855005 (and (= (size!41664 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41663 _keys!1741) (size!41664 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287403 () Bool)

(declare-fun res!855007 () Bool)

(assert (=> b!1287403 (=> (not res!855007) (not e!735230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85224 (_ BitVec 32)) Bool)

(assert (=> b!1287403 (= res!855007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52691 () Bool)

(declare-fun mapRes!52691 () Bool)

(declare-fun tp!100459 () Bool)

(assert (=> mapNonEmpty!52691 (= mapRes!52691 (and tp!100459 e!735233))))

(declare-fun mapValue!52691 () ValueCell!16145)

(declare-fun mapRest!52691 () (Array (_ BitVec 32) ValueCell!16145))

(declare-fun mapKey!52691 () (_ BitVec 32))

(assert (=> mapNonEmpty!52691 (= (arr!41114 _values!1445) (store mapRest!52691 mapKey!52691 mapValue!52691))))

(declare-fun b!1287404 () Bool)

(declare-fun res!855008 () Bool)

(assert (=> b!1287404 (=> (not res!855008) (not e!735230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287404 (= res!855008 (not (validKeyInArray!0 (select (arr!41113 _keys!1741) from!2144))))))

(declare-fun b!1287405 () Bool)

(declare-fun e!735232 () Bool)

(assert (=> b!1287405 (= e!735232 tp_is_empty!34087)))

(declare-fun b!1287406 () Bool)

(declare-fun res!855006 () Bool)

(assert (=> b!1287406 (=> (not res!855006) (not e!735230))))

(declare-fun minValue!1387 () V!50553)

(declare-fun zeroValue!1387 () V!50553)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21960 0))(
  ( (tuple2!21961 (_1!10991 (_ BitVec 64)) (_2!10991 V!50553)) )
))
(declare-datatypes ((List!29141 0))(
  ( (Nil!29138) (Cons!29137 (h!30346 tuple2!21960) (t!42705 List!29141)) )
))
(declare-datatypes ((ListLongMap!19617 0))(
  ( (ListLongMap!19618 (toList!9824 List!29141)) )
))
(declare-fun contains!7942 (ListLongMap!19617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4898 (array!85224 array!85226 (_ BitVec 32) (_ BitVec 32) V!50553 V!50553 (_ BitVec 32) Int) ListLongMap!19617)

(assert (=> b!1287406 (= res!855006 (contains!7942 (getCurrentListMap!4898 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287400 () Bool)

(declare-fun res!855009 () Bool)

(assert (=> b!1287400 (=> (not res!855009) (not e!735230))))

(assert (=> b!1287400 (= res!855009 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41663 _keys!1741))))))

(declare-fun res!855012 () Bool)

(assert (=> start!108958 (=> (not res!855012) (not e!735230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108958 (= res!855012 (validMask!0 mask!2175))))

(assert (=> start!108958 e!735230))

(assert (=> start!108958 tp_is_empty!34087))

(assert (=> start!108958 true))

(declare-fun e!735231 () Bool)

(declare-fun array_inv!31177 (array!85226) Bool)

(assert (=> start!108958 (and (array_inv!31177 _values!1445) e!735231)))

(declare-fun array_inv!31178 (array!85224) Bool)

(assert (=> start!108958 (array_inv!31178 _keys!1741)))

(assert (=> start!108958 tp!100460))

(declare-fun b!1287407 () Bool)

(assert (=> b!1287407 (= e!735231 (and e!735232 mapRes!52691))))

(declare-fun condMapEmpty!52691 () Bool)

(declare-fun mapDefault!52691 () ValueCell!16145)

