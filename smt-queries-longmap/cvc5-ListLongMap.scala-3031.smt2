; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42560 () Bool)

(assert start!42560)

(declare-fun b_free!11995 () Bool)

(declare-fun b_next!11995 () Bool)

(assert (=> start!42560 (= b_free!11995 (not b_next!11995))))

(declare-fun tp!42025 () Bool)

(declare-fun b_and!20475 () Bool)

(assert (=> start!42560 (= tp!42025 b_and!20475)))

(declare-fun b!474836 () Bool)

(declare-fun res!283590 () Bool)

(declare-fun e!278747 () Bool)

(assert (=> b!474836 (=> (not res!283590) (not e!278747))))

(declare-datatypes ((array!30591 0))(
  ( (array!30592 (arr!14713 (Array (_ BitVec 32) (_ BitVec 64))) (size!15065 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30591)

(declare-datatypes ((List!8987 0))(
  ( (Nil!8984) (Cons!8983 (h!9839 (_ BitVec 64)) (t!14961 List!8987)) )
))
(declare-fun arrayNoDuplicates!0 (array!30591 (_ BitVec 32) List!8987) Bool)

(assert (=> b!474836 (= res!283590 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8984))))

(declare-fun b!474837 () Bool)

(assert (=> b!474837 (= e!278747 false)))

(declare-datatypes ((V!19003 0))(
  ( (V!19004 (val!6756 Int)) )
))
(declare-fun zeroValue!794 () V!19003)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8912 0))(
  ( (tuple2!8913 (_1!4467 (_ BitVec 64)) (_2!4467 V!19003)) )
))
(declare-datatypes ((List!8988 0))(
  ( (Nil!8985) (Cons!8984 (h!9840 tuple2!8912) (t!14962 List!8988)) )
))
(declare-datatypes ((ListLongMap!7825 0))(
  ( (ListLongMap!7826 (toList!3928 List!8988)) )
))
(declare-fun lt!216304 () ListLongMap!7825)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6368 0))(
  ( (ValueCellFull!6368 (v!9049 V!19003)) (EmptyCell!6368) )
))
(declare-datatypes ((array!30593 0))(
  ( (array!30594 (arr!14714 (Array (_ BitVec 32) ValueCell!6368)) (size!15066 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30593)

(declare-fun minValueAfter!38 () V!19003)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2085 (array!30591 array!30593 (_ BitVec 32) (_ BitVec 32) V!19003 V!19003 (_ BitVec 32) Int) ListLongMap!7825)

(assert (=> b!474837 (= lt!216304 (getCurrentListMapNoExtraKeys!2085 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19003)

(declare-fun lt!216305 () ListLongMap!7825)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474837 (= lt!216305 (getCurrentListMapNoExtraKeys!2085 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474838 () Bool)

(declare-fun e!278744 () Bool)

(declare-fun tp_is_empty!13423 () Bool)

(assert (=> b!474838 (= e!278744 tp_is_empty!13423)))

(declare-fun b!474839 () Bool)

(declare-fun e!278746 () Bool)

(assert (=> b!474839 (= e!278746 tp_is_empty!13423)))

(declare-fun b!474840 () Bool)

(declare-fun res!283587 () Bool)

(assert (=> b!474840 (=> (not res!283587) (not e!278747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30591 (_ BitVec 32)) Bool)

(assert (=> b!474840 (= res!283587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21853 () Bool)

(declare-fun mapRes!21853 () Bool)

(assert (=> mapIsEmpty!21853 mapRes!21853))

(declare-fun mapNonEmpty!21853 () Bool)

(declare-fun tp!42024 () Bool)

(assert (=> mapNonEmpty!21853 (= mapRes!21853 (and tp!42024 e!278746))))

(declare-fun mapValue!21853 () ValueCell!6368)

(declare-fun mapRest!21853 () (Array (_ BitVec 32) ValueCell!6368))

(declare-fun mapKey!21853 () (_ BitVec 32))

(assert (=> mapNonEmpty!21853 (= (arr!14714 _values!833) (store mapRest!21853 mapKey!21853 mapValue!21853))))

(declare-fun b!474842 () Bool)

(declare-fun res!283589 () Bool)

(assert (=> b!474842 (=> (not res!283589) (not e!278747))))

(assert (=> b!474842 (= res!283589 (and (= (size!15066 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15065 _keys!1025) (size!15066 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283588 () Bool)

(assert (=> start!42560 (=> (not res!283588) (not e!278747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42560 (= res!283588 (validMask!0 mask!1365))))

(assert (=> start!42560 e!278747))

(assert (=> start!42560 tp_is_empty!13423))

(assert (=> start!42560 tp!42025))

(assert (=> start!42560 true))

(declare-fun array_inv!10616 (array!30591) Bool)

(assert (=> start!42560 (array_inv!10616 _keys!1025)))

(declare-fun e!278745 () Bool)

(declare-fun array_inv!10617 (array!30593) Bool)

(assert (=> start!42560 (and (array_inv!10617 _values!833) e!278745)))

(declare-fun b!474841 () Bool)

(assert (=> b!474841 (= e!278745 (and e!278744 mapRes!21853))))

(declare-fun condMapEmpty!21853 () Bool)

(declare-fun mapDefault!21853 () ValueCell!6368)

