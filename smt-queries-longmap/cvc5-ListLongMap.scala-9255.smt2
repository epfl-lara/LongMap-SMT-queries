; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110878 () Bool)

(assert start!110878)

(declare-fun b_free!29713 () Bool)

(declare-fun b_next!29713 () Bool)

(assert (=> start!110878 (= b_free!29713 (not b_next!29713))))

(declare-fun tp!104461 () Bool)

(declare-fun b_and!47921 () Bool)

(assert (=> start!110878 (= tp!104461 b_and!47921)))

(declare-fun b!1312667 () Bool)

(declare-fun e!748709 () Bool)

(assert (=> b!1312667 (= e!748709 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87868 0))(
  ( (array!87869 (arr!42414 (Array (_ BitVec 32) (_ BitVec 64))) (size!42964 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87868)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52361 0))(
  ( (V!52362 (val!17796 Int)) )
))
(declare-fun minValue!1296 () V!52361)

(declare-datatypes ((ValueCell!16823 0))(
  ( (ValueCellFull!16823 (v!20423 V!52361)) (EmptyCell!16823) )
))
(declare-datatypes ((array!87870 0))(
  ( (array!87871 (arr!42415 (Array (_ BitVec 32) ValueCell!16823)) (size!42965 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87870)

(declare-fun lt!585588 () Bool)

(declare-fun zeroValue!1296 () V!52361)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22938 0))(
  ( (tuple2!22939 (_1!11480 (_ BitVec 64)) (_2!11480 V!52361)) )
))
(declare-datatypes ((List!30076 0))(
  ( (Nil!30073) (Cons!30072 (h!31281 tuple2!22938) (t!43682 List!30076)) )
))
(declare-datatypes ((ListLongMap!20595 0))(
  ( (ListLongMap!20596 (toList!10313 List!30076)) )
))
(declare-fun contains!8463 (ListLongMap!20595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5326 (array!87868 array!87870 (_ BitVec 32) (_ BitVec 32) V!52361 V!52361 (_ BitVec 32) Int) ListLongMap!20595)

(assert (=> b!1312667 (= lt!585588 (contains!8463 (getCurrentListMap!5326 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312668 () Bool)

(declare-fun res!871506 () Bool)

(assert (=> b!1312668 (=> (not res!871506) (not e!748709))))

(assert (=> b!1312668 (= res!871506 (and (= (size!42965 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42964 _keys!1628) (size!42965 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54793 () Bool)

(declare-fun mapRes!54793 () Bool)

(declare-fun tp!104460 () Bool)

(declare-fun e!748711 () Bool)

(assert (=> mapNonEmpty!54793 (= mapRes!54793 (and tp!104460 e!748711))))

(declare-fun mapRest!54793 () (Array (_ BitVec 32) ValueCell!16823))

(declare-fun mapValue!54793 () ValueCell!16823)

(declare-fun mapKey!54793 () (_ BitVec 32))

(assert (=> mapNonEmpty!54793 (= (arr!42415 _values!1354) (store mapRest!54793 mapKey!54793 mapValue!54793))))

(declare-fun b!1312669 () Bool)

(declare-fun res!871505 () Bool)

(assert (=> b!1312669 (=> (not res!871505) (not e!748709))))

(assert (=> b!1312669 (= res!871505 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42964 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312670 () Bool)

(declare-fun tp_is_empty!35443 () Bool)

(assert (=> b!1312670 (= e!748711 tp_is_empty!35443)))

(declare-fun b!1312671 () Bool)

(declare-fun res!871502 () Bool)

(assert (=> b!1312671 (=> (not res!871502) (not e!748709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87868 (_ BitVec 32)) Bool)

(assert (=> b!1312671 (= res!871502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312672 () Bool)

(declare-fun res!871503 () Bool)

(assert (=> b!1312672 (=> (not res!871503) (not e!748709))))

(declare-datatypes ((List!30077 0))(
  ( (Nil!30074) (Cons!30073 (h!31282 (_ BitVec 64)) (t!43683 List!30077)) )
))
(declare-fun arrayNoDuplicates!0 (array!87868 (_ BitVec 32) List!30077) Bool)

(assert (=> b!1312672 (= res!871503 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30074))))

(declare-fun b!1312673 () Bool)

(declare-fun e!748712 () Bool)

(declare-fun e!748708 () Bool)

(assert (=> b!1312673 (= e!748712 (and e!748708 mapRes!54793))))

(declare-fun condMapEmpty!54793 () Bool)

(declare-fun mapDefault!54793 () ValueCell!16823)

