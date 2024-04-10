; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41646 () Bool)

(assert start!41646)

(declare-fun b_free!11299 () Bool)

(declare-fun b_next!11299 () Bool)

(assert (=> start!41646 (= b_free!11299 (not b_next!11299))))

(declare-fun tp!39898 () Bool)

(declare-fun b_and!19647 () Bool)

(assert (=> start!41646 (= tp!39898 b_and!19647)))

(declare-fun b!465071 () Bool)

(declare-fun res!278017 () Bool)

(declare-fun e!271746 () Bool)

(assert (=> b!465071 (=> (not res!278017) (not e!271746))))

(declare-datatypes ((array!29239 0))(
  ( (array!29240 (arr!14050 (Array (_ BitVec 32) (_ BitVec 64))) (size!14402 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29239)

(declare-datatypes ((List!8489 0))(
  ( (Nil!8486) (Cons!8485 (h!9341 (_ BitVec 64)) (t!14437 List!8489)) )
))
(declare-fun arrayNoDuplicates!0 (array!29239 (_ BitVec 32) List!8489) Bool)

(assert (=> b!465071 (= res!278017 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8486))))

(declare-fun b!465072 () Bool)

(declare-fun e!271747 () Bool)

(declare-fun tp_is_empty!12727 () Bool)

(assert (=> b!465072 (= e!271747 tp_is_empty!12727)))

(declare-fun b!465073 () Bool)

(declare-fun res!278016 () Bool)

(assert (=> b!465073 (=> (not res!278016) (not e!271746))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29239 (_ BitVec 32)) Bool)

(assert (=> b!465073 (= res!278016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20770 () Bool)

(declare-fun mapRes!20770 () Bool)

(assert (=> mapIsEmpty!20770 mapRes!20770))

(declare-fun res!278019 () Bool)

(assert (=> start!41646 (=> (not res!278019) (not e!271746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41646 (= res!278019 (validMask!0 mask!1365))))

(assert (=> start!41646 e!271746))

(assert (=> start!41646 tp_is_empty!12727))

(assert (=> start!41646 tp!39898))

(assert (=> start!41646 true))

(declare-fun array_inv!10152 (array!29239) Bool)

(assert (=> start!41646 (array_inv!10152 _keys!1025)))

(declare-datatypes ((V!18075 0))(
  ( (V!18076 (val!6408 Int)) )
))
(declare-datatypes ((ValueCell!6020 0))(
  ( (ValueCellFull!6020 (v!8695 V!18075)) (EmptyCell!6020) )
))
(declare-datatypes ((array!29241 0))(
  ( (array!29242 (arr!14051 (Array (_ BitVec 32) ValueCell!6020)) (size!14403 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29241)

(declare-fun e!271745 () Bool)

(declare-fun array_inv!10153 (array!29241) Bool)

(assert (=> start!41646 (and (array_inv!10153 _values!833) e!271745)))

(declare-fun mapNonEmpty!20770 () Bool)

(declare-fun tp!39897 () Bool)

(assert (=> mapNonEmpty!20770 (= mapRes!20770 (and tp!39897 e!271747))))

(declare-fun mapValue!20770 () ValueCell!6020)

(declare-fun mapRest!20770 () (Array (_ BitVec 32) ValueCell!6020))

(declare-fun mapKey!20770 () (_ BitVec 32))

(assert (=> mapNonEmpty!20770 (= (arr!14051 _values!833) (store mapRest!20770 mapKey!20770 mapValue!20770))))

(declare-fun b!465074 () Bool)

(declare-fun e!271744 () Bool)

(assert (=> b!465074 (= e!271744 tp_is_empty!12727)))

(declare-fun b!465075 () Bool)

(assert (=> b!465075 (= e!271745 (and e!271744 mapRes!20770))))

(declare-fun condMapEmpty!20770 () Bool)

(declare-fun mapDefault!20770 () ValueCell!6020)

