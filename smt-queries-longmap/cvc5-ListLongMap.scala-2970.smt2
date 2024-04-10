; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42076 () Bool)

(assert start!42076)

(declare-fun b_free!11629 () Bool)

(declare-fun b_next!11629 () Bool)

(assert (=> start!42076 (= b_free!11629 (not b_next!11629))))

(declare-fun tp!40905 () Bool)

(declare-fun b_and!20039 () Bool)

(assert (=> start!42076 (= tp!40905 b_and!20039)))

(declare-fun b!469781 () Bool)

(declare-fun e!275134 () Bool)

(declare-fun tp_is_empty!13057 () Bool)

(assert (=> b!469781 (= e!275134 tp_is_empty!13057)))

(declare-fun res!280740 () Bool)

(declare-fun e!275139 () Bool)

(assert (=> start!42076 (=> (not res!280740) (not e!275139))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42076 (= res!280740 (validMask!0 mask!1365))))

(assert (=> start!42076 e!275139))

(assert (=> start!42076 tp_is_empty!13057))

(assert (=> start!42076 tp!40905))

(assert (=> start!42076 true))

(declare-datatypes ((array!29885 0))(
  ( (array!29886 (arr!14367 (Array (_ BitVec 32) (_ BitVec 64))) (size!14719 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29885)

(declare-fun array_inv!10366 (array!29885) Bool)

(assert (=> start!42076 (array_inv!10366 _keys!1025)))

(declare-datatypes ((V!18515 0))(
  ( (V!18516 (val!6573 Int)) )
))
(declare-datatypes ((ValueCell!6185 0))(
  ( (ValueCellFull!6185 (v!8863 V!18515)) (EmptyCell!6185) )
))
(declare-datatypes ((array!29887 0))(
  ( (array!29888 (arr!14368 (Array (_ BitVec 32) ValueCell!6185)) (size!14720 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29887)

(declare-fun e!275135 () Bool)

(declare-fun array_inv!10367 (array!29887) Bool)

(assert (=> start!42076 (and (array_inv!10367 _values!833) e!275135)))

(declare-fun mapIsEmpty!21283 () Bool)

(declare-fun mapRes!21283 () Bool)

(assert (=> mapIsEmpty!21283 mapRes!21283))

(declare-fun b!469782 () Bool)

(declare-fun res!280738 () Bool)

(assert (=> b!469782 (=> (not res!280738) (not e!275139))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469782 (= res!280738 (and (= (size!14720 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14719 _keys!1025) (size!14720 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469783 () Bool)

(declare-fun e!275138 () Bool)

(assert (=> b!469783 (= e!275138 true)))

(declare-datatypes ((tuple2!8652 0))(
  ( (tuple2!8653 (_1!4337 (_ BitVec 64)) (_2!4337 V!18515)) )
))
(declare-datatypes ((List!8731 0))(
  ( (Nil!8728) (Cons!8727 (h!9583 tuple2!8652) (t!14691 List!8731)) )
))
(declare-datatypes ((ListLongMap!7565 0))(
  ( (ListLongMap!7566 (toList!3798 List!8731)) )
))
(declare-fun lt!213008 () ListLongMap!7565)

(declare-fun lt!213011 () tuple2!8652)

(declare-fun minValueBefore!38 () V!18515)

(declare-fun +!1706 (ListLongMap!7565 tuple2!8652) ListLongMap!7565)

(assert (=> b!469783 (= (+!1706 lt!213008 lt!213011) (+!1706 (+!1706 lt!213008 (tuple2!8653 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213011))))

(declare-fun minValueAfter!38 () V!18515)

(assert (=> b!469783 (= lt!213011 (tuple2!8653 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13753 0))(
  ( (Unit!13754) )
))
(declare-fun lt!213013 () Unit!13753)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!119 (ListLongMap!7565 (_ BitVec 64) V!18515 V!18515) Unit!13753)

(assert (=> b!469783 (= lt!213013 (addSameAsAddTwiceSameKeyDiffValues!119 lt!213008 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18515)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213009 () ListLongMap!7565)

(declare-fun getCurrentListMap!2220 (array!29885 array!29887 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7565)

(assert (=> b!469783 (= lt!213009 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213012 () ListLongMap!7565)

(assert (=> b!469783 (= lt!213012 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469784 () Bool)

(declare-fun res!280737 () Bool)

(assert (=> b!469784 (=> (not res!280737) (not e!275139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29885 (_ BitVec 32)) Bool)

(assert (=> b!469784 (= res!280737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469785 () Bool)

(assert (=> b!469785 (= e!275139 (not e!275138))))

(declare-fun res!280739 () Bool)

(assert (=> b!469785 (=> res!280739 e!275138)))

(assert (=> b!469785 (= res!280739 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213014 () ListLongMap!7565)

(assert (=> b!469785 (= lt!213008 lt!213014)))

(declare-fun lt!213010 () Unit!13753)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!144 (array!29885 array!29887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 V!18515 V!18515 (_ BitVec 32) Int) Unit!13753)

(assert (=> b!469785 (= lt!213010 (lemmaNoChangeToArrayThenSameMapNoExtras!144 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1964 (array!29885 array!29887 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7565)

(assert (=> b!469785 (= lt!213014 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469785 (= lt!213008 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469786 () Bool)

(declare-fun res!280741 () Bool)

(assert (=> b!469786 (=> (not res!280741) (not e!275139))))

(declare-datatypes ((List!8732 0))(
  ( (Nil!8729) (Cons!8728 (h!9584 (_ BitVec 64)) (t!14692 List!8732)) )
))
(declare-fun arrayNoDuplicates!0 (array!29885 (_ BitVec 32) List!8732) Bool)

(assert (=> b!469786 (= res!280741 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8729))))

(declare-fun b!469787 () Bool)

(declare-fun e!275136 () Bool)

(assert (=> b!469787 (= e!275135 (and e!275136 mapRes!21283))))

(declare-fun condMapEmpty!21283 () Bool)

(declare-fun mapDefault!21283 () ValueCell!6185)

