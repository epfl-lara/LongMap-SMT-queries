; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77532 () Bool)

(assert start!77532)

(declare-fun b_free!16117 () Bool)

(declare-fun b_next!16117 () Bool)

(assert (=> start!77532 (= b_free!16117 (not b_next!16117))))

(declare-fun tp!56613 () Bool)

(declare-fun b_and!26483 () Bool)

(assert (=> start!77532 (= tp!56613 b_and!26483)))

(declare-fun b!903362 () Bool)

(declare-fun e!506129 () Bool)

(declare-fun tp_is_empty!18535 () Bool)

(assert (=> b!903362 (= e!506129 tp_is_empty!18535)))

(declare-fun b!903364 () Bool)

(declare-fun res!609499 () Bool)

(declare-fun e!506130 () Bool)

(assert (=> b!903364 (=> (not res!609499) (not e!506130))))

(declare-datatypes ((array!53126 0))(
  ( (array!53127 (arr!25522 (Array (_ BitVec 32) (_ BitVec 64))) (size!25981 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53126)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53126 (_ BitVec 32)) Bool)

(assert (=> b!903364 (= res!609499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903365 () Bool)

(declare-fun e!506126 () Bool)

(assert (=> b!903365 (= e!506126 tp_is_empty!18535)))

(declare-fun b!903366 () Bool)

(assert (=> b!903366 (= e!506130 false)))

(declare-datatypes ((V!29679 0))(
  ( (V!29680 (val!9318 Int)) )
))
(declare-datatypes ((ValueCell!8786 0))(
  ( (ValueCellFull!8786 (v!11823 V!29679)) (EmptyCell!8786) )
))
(declare-datatypes ((array!53128 0))(
  ( (array!53129 (arr!25523 (Array (_ BitVec 32) ValueCell!8786)) (size!25982 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53128)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!407997 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29679)

(declare-fun zeroValue!1094 () V!29679)

(declare-datatypes ((tuple2!12100 0))(
  ( (tuple2!12101 (_1!6061 (_ BitVec 64)) (_2!6061 V!29679)) )
))
(declare-datatypes ((List!17920 0))(
  ( (Nil!17917) (Cons!17916 (h!19062 tuple2!12100) (t!25303 List!17920)) )
))
(declare-datatypes ((ListLongMap!10797 0))(
  ( (ListLongMap!10798 (toList!5414 List!17920)) )
))
(declare-fun contains!4462 (ListLongMap!10797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2683 (array!53126 array!53128 (_ BitVec 32) (_ BitVec 32) V!29679 V!29679 (_ BitVec 32) Int) ListLongMap!10797)

(assert (=> b!903366 (= lt!407997 (contains!4462 (getCurrentListMap!2683 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!29515 () Bool)

(declare-fun mapRes!29515 () Bool)

(declare-fun tp!56612 () Bool)

(assert (=> mapNonEmpty!29515 (= mapRes!29515 (and tp!56612 e!506126))))

(declare-fun mapKey!29515 () (_ BitVec 32))

(declare-fun mapRest!29515 () (Array (_ BitVec 32) ValueCell!8786))

(declare-fun mapValue!29515 () ValueCell!8786)

(assert (=> mapNonEmpty!29515 (= (arr!25523 _values!1152) (store mapRest!29515 mapKey!29515 mapValue!29515))))

(declare-fun b!903367 () Bool)

(declare-fun res!609500 () Bool)

(assert (=> b!903367 (=> (not res!609500) (not e!506130))))

(declare-datatypes ((List!17921 0))(
  ( (Nil!17918) (Cons!17917 (h!19063 (_ BitVec 64)) (t!25304 List!17921)) )
))
(declare-fun arrayNoDuplicates!0 (array!53126 (_ BitVec 32) List!17921) Bool)

(assert (=> b!903367 (= res!609500 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17918))))

(declare-fun mapIsEmpty!29515 () Bool)

(assert (=> mapIsEmpty!29515 mapRes!29515))

(declare-fun b!903368 () Bool)

(declare-fun e!506128 () Bool)

(assert (=> b!903368 (= e!506128 (and e!506129 mapRes!29515))))

(declare-fun condMapEmpty!29515 () Bool)

(declare-fun mapDefault!29515 () ValueCell!8786)

