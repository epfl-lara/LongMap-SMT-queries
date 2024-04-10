; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77574 () Bool)

(assert start!77574)

(declare-fun b_free!16159 () Bool)

(declare-fun b_next!16159 () Bool)

(assert (=> start!77574 (= b_free!16159 (not b_next!16159))))

(declare-fun tp!56738 () Bool)

(declare-fun b_and!26525 () Bool)

(assert (=> start!77574 (= tp!56738 b_and!26525)))

(declare-fun b!903903 () Bool)

(declare-fun res!609850 () Bool)

(declare-fun e!506486 () Bool)

(assert (=> b!903903 (=> (not res!609850) (not e!506486))))

(declare-datatypes ((array!53206 0))(
  ( (array!53207 (arr!25562 (Array (_ BitVec 32) (_ BitVec 64))) (size!26021 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53206)

(declare-datatypes ((List!17951 0))(
  ( (Nil!17948) (Cons!17947 (h!19093 (_ BitVec 64)) (t!25334 List!17951)) )
))
(declare-fun arrayNoDuplicates!0 (array!53206 (_ BitVec 32) List!17951) Bool)

(assert (=> b!903903 (= res!609850 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17948))))

(declare-fun res!609851 () Bool)

(assert (=> start!77574 (=> (not res!609851) (not e!506486))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77574 (= res!609851 (validMask!0 mask!1756))))

(assert (=> start!77574 e!506486))

(declare-datatypes ((V!29735 0))(
  ( (V!29736 (val!9339 Int)) )
))
(declare-datatypes ((ValueCell!8807 0))(
  ( (ValueCellFull!8807 (v!11844 V!29735)) (EmptyCell!8807) )
))
(declare-datatypes ((array!53208 0))(
  ( (array!53209 (arr!25563 (Array (_ BitVec 32) ValueCell!8807)) (size!26022 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53208)

(declare-fun e!506485 () Bool)

(declare-fun array_inv!20028 (array!53208) Bool)

(assert (=> start!77574 (and (array_inv!20028 _values!1152) e!506485)))

(assert (=> start!77574 tp!56738))

(assert (=> start!77574 true))

(declare-fun tp_is_empty!18577 () Bool)

(assert (=> start!77574 tp_is_empty!18577))

(declare-fun array_inv!20029 (array!53206) Bool)

(assert (=> start!77574 (array_inv!20029 _keys!1386)))

(declare-fun b!903904 () Bool)

(declare-fun res!609853 () Bool)

(assert (=> b!903904 (=> (not res!609853) (not e!506486))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29735)

(declare-fun zeroValue!1094 () V!29735)

(declare-datatypes ((tuple2!12132 0))(
  ( (tuple2!12133 (_1!6077 (_ BitVec 64)) (_2!6077 V!29735)) )
))
(declare-datatypes ((List!17952 0))(
  ( (Nil!17949) (Cons!17948 (h!19094 tuple2!12132) (t!25335 List!17952)) )
))
(declare-datatypes ((ListLongMap!10829 0))(
  ( (ListLongMap!10830 (toList!5430 List!17952)) )
))
(declare-fun contains!4478 (ListLongMap!10829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2699 (array!53206 array!53208 (_ BitVec 32) (_ BitVec 32) V!29735 V!29735 (_ BitVec 32) Int) ListLongMap!10829)

(assert (=> b!903904 (= res!609853 (contains!4478 (getCurrentListMap!2699 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903905 () Bool)

(declare-fun res!609849 () Bool)

(assert (=> b!903905 (=> (not res!609849) (not e!506486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53206 (_ BitVec 32)) Bool)

(assert (=> b!903905 (= res!609849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29578 () Bool)

(declare-fun mapRes!29578 () Bool)

(declare-fun tp!56739 () Bool)

(declare-fun e!506484 () Bool)

(assert (=> mapNonEmpty!29578 (= mapRes!29578 (and tp!56739 e!506484))))

(declare-fun mapKey!29578 () (_ BitVec 32))

(declare-fun mapRest!29578 () (Array (_ BitVec 32) ValueCell!8807))

(declare-fun mapValue!29578 () ValueCell!8807)

(assert (=> mapNonEmpty!29578 (= (arr!25563 _values!1152) (store mapRest!29578 mapKey!29578 mapValue!29578))))

(declare-fun b!903906 () Bool)

(declare-fun e!506487 () Bool)

(assert (=> b!903906 (= e!506485 (and e!506487 mapRes!29578))))

(declare-fun condMapEmpty!29578 () Bool)

(declare-fun mapDefault!29578 () ValueCell!8807)

