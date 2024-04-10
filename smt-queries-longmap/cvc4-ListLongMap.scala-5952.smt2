; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77542 () Bool)

(assert start!77542)

(declare-fun b_free!16127 () Bool)

(declare-fun b_next!16127 () Bool)

(assert (=> start!77542 (= b_free!16127 (not b_next!16127))))

(declare-fun tp!56643 () Bool)

(declare-fun b_and!26493 () Bool)

(assert (=> start!77542 (= tp!56643 b_and!26493)))

(declare-fun b!903467 () Bool)

(declare-fun res!609559 () Bool)

(declare-fun e!506204 () Bool)

(assert (=> b!903467 (=> (not res!609559) (not e!506204))))

(declare-datatypes ((array!53146 0))(
  ( (array!53147 (arr!25532 (Array (_ BitVec 32) (_ BitVec 64))) (size!25991 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53146)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53146 (_ BitVec 32)) Bool)

(assert (=> b!903467 (= res!609559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903468 () Bool)

(declare-fun res!609557 () Bool)

(assert (=> b!903468 (=> (not res!609557) (not e!506204))))

(declare-datatypes ((List!17927 0))(
  ( (Nil!17924) (Cons!17923 (h!19069 (_ BitVec 64)) (t!25310 List!17927)) )
))
(declare-fun arrayNoDuplicates!0 (array!53146 (_ BitVec 32) List!17927) Bool)

(assert (=> b!903468 (= res!609557 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17924))))

(declare-fun b!903469 () Bool)

(declare-fun res!609560 () Bool)

(assert (=> b!903469 (=> (not res!609560) (not e!506204))))

(declare-datatypes ((V!29691 0))(
  ( (V!29692 (val!9323 Int)) )
))
(declare-datatypes ((ValueCell!8791 0))(
  ( (ValueCellFull!8791 (v!11828 V!29691)) (EmptyCell!8791) )
))
(declare-datatypes ((array!53148 0))(
  ( (array!53149 (arr!25533 (Array (_ BitVec 32) ValueCell!8791)) (size!25992 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53148)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903469 (= res!609560 (and (= (size!25992 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25991 _keys!1386) (size!25992 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903470 () Bool)

(declare-fun e!506205 () Bool)

(declare-fun tp_is_empty!18545 () Bool)

(assert (=> b!903470 (= e!506205 tp_is_empty!18545)))

(declare-fun mapNonEmpty!29530 () Bool)

(declare-fun mapRes!29530 () Bool)

(declare-fun tp!56642 () Bool)

(declare-fun e!506201 () Bool)

(assert (=> mapNonEmpty!29530 (= mapRes!29530 (and tp!56642 e!506201))))

(declare-fun mapKey!29530 () (_ BitVec 32))

(declare-fun mapValue!29530 () ValueCell!8791)

(declare-fun mapRest!29530 () (Array (_ BitVec 32) ValueCell!8791))

(assert (=> mapNonEmpty!29530 (= (arr!25533 _values!1152) (store mapRest!29530 mapKey!29530 mapValue!29530))))

(declare-fun b!903471 () Bool)

(declare-fun e!506202 () Bool)

(assert (=> b!903471 (= e!506202 (and e!506205 mapRes!29530))))

(declare-fun condMapEmpty!29530 () Bool)

(declare-fun mapDefault!29530 () ValueCell!8791)

