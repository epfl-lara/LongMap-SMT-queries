; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42704 () Bool)

(assert start!42704)

(declare-fun b_free!12071 () Bool)

(declare-fun b_next!12071 () Bool)

(assert (=> start!42704 (= b_free!12071 (not b_next!12071))))

(declare-fun tp!42265 () Bool)

(declare-fun b_and!20595 () Bool)

(assert (=> start!42704 (= tp!42265 b_and!20595)))

(declare-fun b!476294 () Bool)

(declare-fun res!284345 () Bool)

(declare-fun e!279749 () Bool)

(assert (=> b!476294 (=> (not res!284345) (not e!279749))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30739 0))(
  ( (array!30740 (arr!14783 (Array (_ BitVec 32) (_ BitVec 64))) (size!15135 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30739)

(declare-datatypes ((V!19103 0))(
  ( (V!19104 (val!6794 Int)) )
))
(declare-datatypes ((ValueCell!6406 0))(
  ( (ValueCellFull!6406 (v!9090 V!19103)) (EmptyCell!6406) )
))
(declare-datatypes ((array!30741 0))(
  ( (array!30742 (arr!14784 (Array (_ BitVec 32) ValueCell!6406)) (size!15136 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30741)

(assert (=> b!476294 (= res!284345 (and (= (size!15136 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15135 _keys!1025) (size!15136 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21979 () Bool)

(declare-fun mapRes!21979 () Bool)

(declare-fun tp!42264 () Bool)

(declare-fun e!279746 () Bool)

(assert (=> mapNonEmpty!21979 (= mapRes!21979 (and tp!42264 e!279746))))

(declare-fun mapValue!21979 () ValueCell!6406)

(declare-fun mapKey!21979 () (_ BitVec 32))

(declare-fun mapRest!21979 () (Array (_ BitVec 32) ValueCell!6406))

(assert (=> mapNonEmpty!21979 (= (arr!14784 _values!833) (store mapRest!21979 mapKey!21979 mapValue!21979))))

(declare-fun b!476295 () Bool)

(declare-fun res!284343 () Bool)

(assert (=> b!476295 (=> (not res!284343) (not e!279749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30739 (_ BitVec 32)) Bool)

(assert (=> b!476295 (= res!284343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!284344 () Bool)

(assert (=> start!42704 (=> (not res!284344) (not e!279749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42704 (= res!284344 (validMask!0 mask!1365))))

(assert (=> start!42704 e!279749))

(declare-fun tp_is_empty!13499 () Bool)

(assert (=> start!42704 tp_is_empty!13499))

(assert (=> start!42704 tp!42265))

(assert (=> start!42704 true))

(declare-fun array_inv!10668 (array!30739) Bool)

(assert (=> start!42704 (array_inv!10668 _keys!1025)))

(declare-fun e!279747 () Bool)

(declare-fun array_inv!10669 (array!30741) Bool)

(assert (=> start!42704 (and (array_inv!10669 _values!833) e!279747)))

(declare-datatypes ((tuple2!8960 0))(
  ( (tuple2!8961 (_1!4491 (_ BitVec 64)) (_2!4491 V!19103)) )
))
(declare-fun lt!217127 () tuple2!8960)

(declare-fun e!279748 () Bool)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((List!9037 0))(
  ( (Nil!9034) (Cons!9033 (h!9889 tuple2!8960) (t!15019 List!9037)) )
))
(declare-datatypes ((ListLongMap!7873 0))(
  ( (ListLongMap!7874 (toList!3952 List!9037)) )
))
(declare-fun lt!217129 () ListLongMap!7873)

(declare-fun zeroValue!794 () V!19103)

(declare-fun b!476296 () Bool)

(declare-fun minValueAfter!38 () V!19103)

(declare-fun +!1764 (ListLongMap!7873 tuple2!8960) ListLongMap!7873)

(declare-fun getCurrentListMap!2292 (array!30739 array!30741 (_ BitVec 32) (_ BitVec 32) V!19103 V!19103 (_ BitVec 32) Int) ListLongMap!7873)

(assert (=> b!476296 (= e!279748 (= (+!1764 lt!217129 lt!217127) (getCurrentListMap!2292 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun lt!217130 () ListLongMap!7873)

(declare-fun minValueBefore!38 () V!19103)

(assert (=> b!476296 (= (+!1764 lt!217130 lt!217127) (+!1764 (+!1764 lt!217130 (tuple2!8961 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!217127))))

(assert (=> b!476296 (= lt!217127 (tuple2!8961 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!14030 0))(
  ( (Unit!14031) )
))
(declare-fun lt!217128 () Unit!14030)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!165 (ListLongMap!7873 (_ BitVec 64) V!19103 V!19103) Unit!14030)

(assert (=> b!476296 (= lt!217128 (addSameAsAddTwiceSameKeyDiffValues!165 lt!217130 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!217126 () ListLongMap!7873)

(assert (=> b!476296 (= lt!217130 (+!1764 lt!217126 (tuple2!8961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (=> b!476296 (= lt!217129 (getCurrentListMap!2292 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476297 () Bool)

(assert (=> b!476297 (= e!279746 tp_is_empty!13499)))

(declare-fun b!476298 () Bool)

(declare-fun e!279751 () Bool)

(assert (=> b!476298 (= e!279747 (and e!279751 mapRes!21979))))

(declare-fun condMapEmpty!21979 () Bool)

(declare-fun mapDefault!21979 () ValueCell!6406)

