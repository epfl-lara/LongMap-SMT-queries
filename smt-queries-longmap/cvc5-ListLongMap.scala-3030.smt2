; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42554 () Bool)

(assert start!42554)

(declare-fun b_free!11989 () Bool)

(declare-fun b_next!11989 () Bool)

(assert (=> start!42554 (= b_free!11989 (not b_next!11989))))

(declare-fun tp!42007 () Bool)

(declare-fun b_and!20469 () Bool)

(assert (=> start!42554 (= tp!42007 b_and!20469)))

(declare-fun b!474773 () Bool)

(declare-fun e!278699 () Bool)

(assert (=> b!474773 (= e!278699 false)))

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((V!18995 0))(
  ( (V!18996 (val!6753 Int)) )
))
(declare-datatypes ((tuple2!8908 0))(
  ( (tuple2!8909 (_1!4465 (_ BitVec 64)) (_2!4465 V!18995)) )
))
(declare-datatypes ((List!8983 0))(
  ( (Nil!8980) (Cons!8979 (h!9835 tuple2!8908) (t!14957 List!8983)) )
))
(declare-datatypes ((ListLongMap!7821 0))(
  ( (ListLongMap!7822 (toList!3926 List!8983)) )
))
(declare-fun lt!216286 () ListLongMap!7821)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30579 0))(
  ( (array!30580 (arr!14707 (Array (_ BitVec 32) (_ BitVec 64))) (size!15059 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30579)

(declare-datatypes ((ValueCell!6365 0))(
  ( (ValueCellFull!6365 (v!9046 V!18995)) (EmptyCell!6365) )
))
(declare-datatypes ((array!30581 0))(
  ( (array!30582 (arr!14708 (Array (_ BitVec 32) ValueCell!6365)) (size!15060 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30581)

(declare-fun zeroValue!794 () V!18995)

(declare-fun minValueAfter!38 () V!18995)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2083 (array!30579 array!30581 (_ BitVec 32) (_ BitVec 32) V!18995 V!18995 (_ BitVec 32) Int) ListLongMap!7821)

(assert (=> b!474773 (= lt!216286 (getCurrentListMapNoExtraKeys!2083 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18995)

(declare-fun lt!216287 () ListLongMap!7821)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474773 (= lt!216287 (getCurrentListMapNoExtraKeys!2083 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21844 () Bool)

(declare-fun mapRes!21844 () Bool)

(assert (=> mapIsEmpty!21844 mapRes!21844))

(declare-fun mapNonEmpty!21844 () Bool)

(declare-fun tp!42006 () Bool)

(declare-fun e!278703 () Bool)

(assert (=> mapNonEmpty!21844 (= mapRes!21844 (and tp!42006 e!278703))))

(declare-fun mapRest!21844 () (Array (_ BitVec 32) ValueCell!6365))

(declare-fun mapKey!21844 () (_ BitVec 32))

(declare-fun mapValue!21844 () ValueCell!6365)

(assert (=> mapNonEmpty!21844 (= (arr!14708 _values!833) (store mapRest!21844 mapKey!21844 mapValue!21844))))

(declare-fun b!474774 () Bool)

(declare-fun res!283551 () Bool)

(assert (=> b!474774 (=> (not res!283551) (not e!278699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30579 (_ BitVec 32)) Bool)

(assert (=> b!474774 (= res!283551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474775 () Bool)

(declare-fun tp_is_empty!13417 () Bool)

(assert (=> b!474775 (= e!278703 tp_is_empty!13417)))

(declare-fun b!474777 () Bool)

(declare-fun res!283554 () Bool)

(assert (=> b!474777 (=> (not res!283554) (not e!278699))))

(declare-datatypes ((List!8984 0))(
  ( (Nil!8981) (Cons!8980 (h!9836 (_ BitVec 64)) (t!14958 List!8984)) )
))
(declare-fun arrayNoDuplicates!0 (array!30579 (_ BitVec 32) List!8984) Bool)

(assert (=> b!474777 (= res!283554 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8981))))

(declare-fun res!283553 () Bool)

(assert (=> start!42554 (=> (not res!283553) (not e!278699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42554 (= res!283553 (validMask!0 mask!1365))))

(assert (=> start!42554 e!278699))

(assert (=> start!42554 tp_is_empty!13417))

(assert (=> start!42554 tp!42007))

(assert (=> start!42554 true))

(declare-fun array_inv!10610 (array!30579) Bool)

(assert (=> start!42554 (array_inv!10610 _keys!1025)))

(declare-fun e!278701 () Bool)

(declare-fun array_inv!10611 (array!30581) Bool)

(assert (=> start!42554 (and (array_inv!10611 _values!833) e!278701)))

(declare-fun b!474776 () Bool)

(declare-fun res!283552 () Bool)

(assert (=> b!474776 (=> (not res!283552) (not e!278699))))

(assert (=> b!474776 (= res!283552 (and (= (size!15060 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15059 _keys!1025) (size!15060 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474778 () Bool)

(declare-fun e!278702 () Bool)

(assert (=> b!474778 (= e!278701 (and e!278702 mapRes!21844))))

(declare-fun condMapEmpty!21844 () Bool)

(declare-fun mapDefault!21844 () ValueCell!6365)

