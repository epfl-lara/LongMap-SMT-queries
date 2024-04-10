; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111044 () Bool)

(assert start!111044)

(declare-fun b_free!29879 () Bool)

(declare-fun b_next!29879 () Bool)

(assert (=> start!111044 (= b_free!29879 (not b_next!29879))))

(declare-fun tp!104959 () Bool)

(declare-fun b_and!48087 () Bool)

(assert (=> start!111044 (= tp!104959 b_and!48087)))

(declare-fun b!1314722 () Bool)

(declare-fun res!872814 () Bool)

(declare-fun e!749956 () Bool)

(assert (=> b!1314722 (=> (not res!872814) (not e!749956))))

(declare-datatypes ((array!88186 0))(
  ( (array!88187 (arr!42573 (Array (_ BitVec 32) (_ BitVec 64))) (size!43123 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88186)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88186 (_ BitVec 32)) Bool)

(assert (=> b!1314722 (= res!872814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314723 () Bool)

(declare-fun res!872811 () Bool)

(assert (=> b!1314723 (=> (not res!872811) (not e!749956))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314723 (= res!872811 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43123 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55042 () Bool)

(declare-fun mapRes!55042 () Bool)

(declare-fun tp!104958 () Bool)

(declare-fun e!749957 () Bool)

(assert (=> mapNonEmpty!55042 (= mapRes!55042 (and tp!104958 e!749957))))

(declare-datatypes ((V!52581 0))(
  ( (V!52582 (val!17879 Int)) )
))
(declare-datatypes ((ValueCell!16906 0))(
  ( (ValueCellFull!16906 (v!20506 V!52581)) (EmptyCell!16906) )
))
(declare-fun mapValue!55042 () ValueCell!16906)

(declare-fun mapRest!55042 () (Array (_ BitVec 32) ValueCell!16906))

(declare-datatypes ((array!88188 0))(
  ( (array!88189 (arr!42574 (Array (_ BitVec 32) ValueCell!16906)) (size!43124 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88188)

(declare-fun mapKey!55042 () (_ BitVec 32))

(assert (=> mapNonEmpty!55042 (= (arr!42574 _values!1354) (store mapRest!55042 mapKey!55042 mapValue!55042))))

(declare-fun b!1314724 () Bool)

(declare-fun e!749955 () Bool)

(declare-fun tp_is_empty!35609 () Bool)

(assert (=> b!1314724 (= e!749955 tp_is_empty!35609)))

(declare-fun mapIsEmpty!55042 () Bool)

(assert (=> mapIsEmpty!55042 mapRes!55042))

(declare-fun b!1314726 () Bool)

(assert (=> b!1314726 (= e!749956 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585828 () Bool)

(declare-fun minValue!1296 () V!52581)

(declare-fun zeroValue!1296 () V!52581)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23058 0))(
  ( (tuple2!23059 (_1!11540 (_ BitVec 64)) (_2!11540 V!52581)) )
))
(declare-datatypes ((List!30195 0))(
  ( (Nil!30192) (Cons!30191 (h!31400 tuple2!23058) (t!43801 List!30195)) )
))
(declare-datatypes ((ListLongMap!20715 0))(
  ( (ListLongMap!20716 (toList!10373 List!30195)) )
))
(declare-fun contains!8523 (ListLongMap!20715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5386 (array!88186 array!88188 (_ BitVec 32) (_ BitVec 32) V!52581 V!52581 (_ BitVec 32) Int) ListLongMap!20715)

(assert (=> b!1314726 (= lt!585828 (contains!8523 (getCurrentListMap!5386 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314727 () Bool)

(declare-fun e!749954 () Bool)

(assert (=> b!1314727 (= e!749954 (and e!749955 mapRes!55042))))

(declare-fun condMapEmpty!55042 () Bool)

(declare-fun mapDefault!55042 () ValueCell!16906)

