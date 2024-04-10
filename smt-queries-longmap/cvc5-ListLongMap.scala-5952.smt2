; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77538 () Bool)

(assert start!77538)

(declare-fun b_free!16123 () Bool)

(declare-fun b_next!16123 () Bool)

(assert (=> start!77538 (= b_free!16123 (not b_next!16123))))

(declare-fun tp!56631 () Bool)

(declare-fun b_and!26489 () Bool)

(assert (=> start!77538 (= tp!56631 b_and!26489)))

(declare-fun b!903425 () Bool)

(declare-fun res!609534 () Bool)

(declare-fun e!506174 () Bool)

(assert (=> b!903425 (=> (not res!609534) (not e!506174))))

(declare-datatypes ((array!53138 0))(
  ( (array!53139 (arr!25528 (Array (_ BitVec 32) (_ BitVec 64))) (size!25987 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53138)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53138 (_ BitVec 32)) Bool)

(assert (=> b!903425 (= res!609534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609536 () Bool)

(assert (=> start!77538 (=> (not res!609536) (not e!506174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77538 (= res!609536 (validMask!0 mask!1756))))

(assert (=> start!77538 e!506174))

(declare-datatypes ((V!29687 0))(
  ( (V!29688 (val!9321 Int)) )
))
(declare-datatypes ((ValueCell!8789 0))(
  ( (ValueCellFull!8789 (v!11826 V!29687)) (EmptyCell!8789) )
))
(declare-datatypes ((array!53140 0))(
  ( (array!53141 (arr!25529 (Array (_ BitVec 32) ValueCell!8789)) (size!25988 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53140)

(declare-fun e!506175 () Bool)

(declare-fun array_inv!20006 (array!53140) Bool)

(assert (=> start!77538 (and (array_inv!20006 _values!1152) e!506175)))

(assert (=> start!77538 tp!56631))

(assert (=> start!77538 true))

(declare-fun tp_is_empty!18541 () Bool)

(assert (=> start!77538 tp_is_empty!18541))

(declare-fun array_inv!20007 (array!53138) Bool)

(assert (=> start!77538 (array_inv!20007 _keys!1386)))

(declare-fun b!903426 () Bool)

(declare-fun res!609535 () Bool)

(assert (=> b!903426 (=> (not res!609535) (not e!506174))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903426 (= res!609535 (and (= (size!25988 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25987 _keys!1386) (size!25988 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29524 () Bool)

(declare-fun mapRes!29524 () Bool)

(declare-fun tp!56630 () Bool)

(declare-fun e!506173 () Bool)

(assert (=> mapNonEmpty!29524 (= mapRes!29524 (and tp!56630 e!506173))))

(declare-fun mapValue!29524 () ValueCell!8789)

(declare-fun mapKey!29524 () (_ BitVec 32))

(declare-fun mapRest!29524 () (Array (_ BitVec 32) ValueCell!8789))

(assert (=> mapNonEmpty!29524 (= (arr!25529 _values!1152) (store mapRest!29524 mapKey!29524 mapValue!29524))))

(declare-fun mapIsEmpty!29524 () Bool)

(assert (=> mapIsEmpty!29524 mapRes!29524))

(declare-fun b!903427 () Bool)

(assert (=> b!903427 (= e!506174 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408006 () Bool)

(declare-fun zeroValue!1094 () V!29687)

(declare-fun minValue!1094 () V!29687)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12104 0))(
  ( (tuple2!12105 (_1!6063 (_ BitVec 64)) (_2!6063 V!29687)) )
))
(declare-datatypes ((List!17924 0))(
  ( (Nil!17921) (Cons!17920 (h!19066 tuple2!12104) (t!25307 List!17924)) )
))
(declare-datatypes ((ListLongMap!10801 0))(
  ( (ListLongMap!10802 (toList!5416 List!17924)) )
))
(declare-fun contains!4464 (ListLongMap!10801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2685 (array!53138 array!53140 (_ BitVec 32) (_ BitVec 32) V!29687 V!29687 (_ BitVec 32) Int) ListLongMap!10801)

(assert (=> b!903427 (= lt!408006 (contains!4464 (getCurrentListMap!2685 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903428 () Bool)

(declare-fun e!506171 () Bool)

(assert (=> b!903428 (= e!506175 (and e!506171 mapRes!29524))))

(declare-fun condMapEmpty!29524 () Bool)

(declare-fun mapDefault!29524 () ValueCell!8789)

