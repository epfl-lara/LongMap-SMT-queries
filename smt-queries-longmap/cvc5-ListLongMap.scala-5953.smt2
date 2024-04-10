; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77544 () Bool)

(assert start!77544)

(declare-fun b_free!16129 () Bool)

(declare-fun b_next!16129 () Bool)

(assert (=> start!77544 (= b_free!16129 (not b_next!16129))))

(declare-fun tp!56649 () Bool)

(declare-fun b_and!26495 () Bool)

(assert (=> start!77544 (= tp!56649 b_and!26495)))

(declare-fun b!903488 () Bool)

(declare-fun e!506219 () Bool)

(declare-fun tp_is_empty!18547 () Bool)

(assert (=> b!903488 (= e!506219 tp_is_empty!18547)))

(declare-fun b!903489 () Bool)

(declare-fun res!609572 () Bool)

(declare-fun e!506218 () Bool)

(assert (=> b!903489 (=> (not res!609572) (not e!506218))))

(declare-datatypes ((V!29695 0))(
  ( (V!29696 (val!9324 Int)) )
))
(declare-datatypes ((ValueCell!8792 0))(
  ( (ValueCellFull!8792 (v!11829 V!29695)) (EmptyCell!8792) )
))
(declare-datatypes ((array!53150 0))(
  ( (array!53151 (arr!25534 (Array (_ BitVec 32) ValueCell!8792)) (size!25993 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53150)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53152 0))(
  ( (array!53153 (arr!25535 (Array (_ BitVec 32) (_ BitVec 64))) (size!25994 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53152)

(assert (=> b!903489 (= res!609572 (and (= (size!25993 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25994 _keys!1386) (size!25993 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29533 () Bool)

(declare-fun mapRes!29533 () Bool)

(declare-fun tp!56648 () Bool)

(declare-fun e!506220 () Bool)

(assert (=> mapNonEmpty!29533 (= mapRes!29533 (and tp!56648 e!506220))))

(declare-fun mapValue!29533 () ValueCell!8792)

(declare-fun mapRest!29533 () (Array (_ BitVec 32) ValueCell!8792))

(declare-fun mapKey!29533 () (_ BitVec 32))

(assert (=> mapNonEmpty!29533 (= (arr!25534 _values!1152) (store mapRest!29533 mapKey!29533 mapValue!29533))))

(declare-fun res!609570 () Bool)

(assert (=> start!77544 (=> (not res!609570) (not e!506218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77544 (= res!609570 (validMask!0 mask!1756))))

(assert (=> start!77544 e!506218))

(declare-fun e!506217 () Bool)

(declare-fun array_inv!20010 (array!53150) Bool)

(assert (=> start!77544 (and (array_inv!20010 _values!1152) e!506217)))

(assert (=> start!77544 tp!56649))

(assert (=> start!77544 true))

(assert (=> start!77544 tp_is_empty!18547))

(declare-fun array_inv!20011 (array!53152) Bool)

(assert (=> start!77544 (array_inv!20011 _keys!1386)))

(declare-fun b!903490 () Bool)

(assert (=> b!903490 (= e!506218 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29695)

(declare-fun lt!408015 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29695)

(declare-datatypes ((tuple2!12108 0))(
  ( (tuple2!12109 (_1!6065 (_ BitVec 64)) (_2!6065 V!29695)) )
))
(declare-datatypes ((List!17928 0))(
  ( (Nil!17925) (Cons!17924 (h!19070 tuple2!12108) (t!25311 List!17928)) )
))
(declare-datatypes ((ListLongMap!10805 0))(
  ( (ListLongMap!10806 (toList!5418 List!17928)) )
))
(declare-fun contains!4466 (ListLongMap!10805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2687 (array!53152 array!53150 (_ BitVec 32) (_ BitVec 32) V!29695 V!29695 (_ BitVec 32) Int) ListLongMap!10805)

(assert (=> b!903490 (= lt!408015 (contains!4466 (getCurrentListMap!2687 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903491 () Bool)

(declare-fun res!609569 () Bool)

(assert (=> b!903491 (=> (not res!609569) (not e!506218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53152 (_ BitVec 32)) Bool)

(assert (=> b!903491 (= res!609569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903492 () Bool)

(declare-fun res!609571 () Bool)

(assert (=> b!903492 (=> (not res!609571) (not e!506218))))

(declare-datatypes ((List!17929 0))(
  ( (Nil!17926) (Cons!17925 (h!19071 (_ BitVec 64)) (t!25312 List!17929)) )
))
(declare-fun arrayNoDuplicates!0 (array!53152 (_ BitVec 32) List!17929) Bool)

(assert (=> b!903492 (= res!609571 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17926))))

(declare-fun b!903493 () Bool)

(assert (=> b!903493 (= e!506220 tp_is_empty!18547)))

(declare-fun b!903494 () Bool)

(assert (=> b!903494 (= e!506217 (and e!506219 mapRes!29533))))

(declare-fun condMapEmpty!29533 () Bool)

(declare-fun mapDefault!29533 () ValueCell!8792)

