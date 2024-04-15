; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20770 () Bool)

(assert start!20770)

(declare-fun b_free!5425 () Bool)

(declare-fun b_next!5425 () Bool)

(assert (=> start!20770 (= b_free!5425 (not b_next!5425))))

(declare-fun tp!19306 () Bool)

(declare-fun b_and!12145 () Bool)

(assert (=> start!20770 (= tp!19306 b_and!12145)))

(declare-datatypes ((array!9755 0))(
  ( (array!9756 (arr!4627 (Array (_ BitVec 32) (_ BitVec 64))) (size!4953 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9755)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun lt!106489 () Bool)

(declare-datatypes ((V!6689 0))(
  ( (V!6690 (val!2685 Int)) )
))
(declare-datatypes ((tuple2!4058 0))(
  ( (tuple2!4059 (_1!2040 (_ BitVec 64)) (_2!2040 V!6689)) )
))
(declare-datatypes ((List!2961 0))(
  ( (Nil!2958) (Cons!2957 (h!3599 tuple2!4058) (t!7883 List!2961)) )
))
(declare-datatypes ((ListLongMap!2961 0))(
  ( (ListLongMap!2962 (toList!1496 List!2961)) )
))
(declare-fun lt!106485 () ListLongMap!2961)

(declare-fun b!207839 () Bool)

(declare-fun lt!106486 () ListLongMap!2961)

(declare-fun e!135599 () Bool)

(assert (=> b!207839 (= e!135599 (not (or (and (not lt!106489) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106489) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106489) (not (= lt!106486 lt!106485)) (bvsle #b00000000000000000000000000000000 (size!4953 _keys!825)))))))

(assert (=> b!207839 (= lt!106489 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!2297 0))(
  ( (ValueCellFull!2297 (v!4649 V!6689)) (EmptyCell!2297) )
))
(declare-datatypes ((array!9757 0))(
  ( (array!9758 (arr!4628 (Array (_ BitVec 32) ValueCell!2297)) (size!4954 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9757)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!106483 () ListLongMap!2961)

(declare-fun zeroValue!615 () V!6689)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6689)

(declare-fun getCurrentListMap!1037 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2961)

(assert (=> b!207839 (= lt!106483 (getCurrentListMap!1037 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106487 () array!9757)

(assert (=> b!207839 (= lt!106486 (getCurrentListMap!1037 _keys!825 lt!106487 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106490 () ListLongMap!2961)

(assert (=> b!207839 (and (= lt!106485 lt!106490) (= lt!106490 lt!106485))))

(declare-fun v!520 () V!6689)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!106484 () ListLongMap!2961)

(declare-fun +!545 (ListLongMap!2961 tuple2!4058) ListLongMap!2961)

(assert (=> b!207839 (= lt!106490 (+!545 lt!106484 (tuple2!4059 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6330 0))(
  ( (Unit!6331) )
))
(declare-fun lt!106488 () Unit!6330)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!196 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) (_ BitVec 64) V!6689 (_ BitVec 32) Int) Unit!6330)

(assert (=> b!207839 (= lt!106488 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!196 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!447 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2961)

(assert (=> b!207839 (= lt!106485 (getCurrentListMapNoExtraKeys!447 _keys!825 lt!106487 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207839 (= lt!106487 (array!9758 (store (arr!4628 _values!649) i!601 (ValueCellFull!2297 v!520)) (size!4954 _values!649)))))

(assert (=> b!207839 (= lt!106484 (getCurrentListMapNoExtraKeys!447 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207841 () Bool)

(declare-fun res!100995 () Bool)

(assert (=> b!207841 (=> (not res!100995) (not e!135599))))

(assert (=> b!207841 (= res!100995 (= (select (arr!4627 _keys!825) i!601) k0!843))))

(declare-fun b!207842 () Bool)

(declare-fun res!100996 () Bool)

(assert (=> b!207842 (=> (not res!100996) (not e!135599))))

(declare-datatypes ((List!2962 0))(
  ( (Nil!2959) (Cons!2958 (h!3600 (_ BitVec 64)) (t!7884 List!2962)) )
))
(declare-fun arrayNoDuplicates!0 (array!9755 (_ BitVec 32) List!2962) Bool)

(assert (=> b!207842 (= res!100996 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2959))))

(declare-fun b!207843 () Bool)

(declare-fun res!100998 () Bool)

(assert (=> b!207843 (=> (not res!100998) (not e!135599))))

(assert (=> b!207843 (= res!100998 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4953 _keys!825))))))

(declare-fun b!207844 () Bool)

(declare-fun e!135600 () Bool)

(declare-fun tp_is_empty!5281 () Bool)

(assert (=> b!207844 (= e!135600 tp_is_empty!5281)))

(declare-fun b!207845 () Bool)

(declare-fun e!135601 () Bool)

(declare-fun mapRes!8990 () Bool)

(assert (=> b!207845 (= e!135601 (and e!135600 mapRes!8990))))

(declare-fun condMapEmpty!8990 () Bool)

(declare-fun mapDefault!8990 () ValueCell!2297)

(assert (=> b!207845 (= condMapEmpty!8990 (= (arr!4628 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2297)) mapDefault!8990)))))

(declare-fun b!207846 () Bool)

(declare-fun res!100999 () Bool)

(assert (=> b!207846 (=> (not res!100999) (not e!135599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9755 (_ BitVec 32)) Bool)

(assert (=> b!207846 (= res!100999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8990 () Bool)

(assert (=> mapIsEmpty!8990 mapRes!8990))

(declare-fun b!207847 () Bool)

(declare-fun res!100997 () Bool)

(assert (=> b!207847 (=> (not res!100997) (not e!135599))))

(assert (=> b!207847 (= res!100997 (and (= (size!4954 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4953 _keys!825) (size!4954 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8990 () Bool)

(declare-fun tp!19307 () Bool)

(declare-fun e!135602 () Bool)

(assert (=> mapNonEmpty!8990 (= mapRes!8990 (and tp!19307 e!135602))))

(declare-fun mapKey!8990 () (_ BitVec 32))

(declare-fun mapRest!8990 () (Array (_ BitVec 32) ValueCell!2297))

(declare-fun mapValue!8990 () ValueCell!2297)

(assert (=> mapNonEmpty!8990 (= (arr!4628 _values!649) (store mapRest!8990 mapKey!8990 mapValue!8990))))

(declare-fun b!207848 () Bool)

(assert (=> b!207848 (= e!135602 tp_is_empty!5281)))

(declare-fun res!101000 () Bool)

(assert (=> start!20770 (=> (not res!101000) (not e!135599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20770 (= res!101000 (validMask!0 mask!1149))))

(assert (=> start!20770 e!135599))

(declare-fun array_inv!3041 (array!9757) Bool)

(assert (=> start!20770 (and (array_inv!3041 _values!649) e!135601)))

(assert (=> start!20770 true))

(assert (=> start!20770 tp_is_empty!5281))

(declare-fun array_inv!3042 (array!9755) Bool)

(assert (=> start!20770 (array_inv!3042 _keys!825)))

(assert (=> start!20770 tp!19306))

(declare-fun b!207840 () Bool)

(declare-fun res!100994 () Bool)

(assert (=> b!207840 (=> (not res!100994) (not e!135599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207840 (= res!100994 (validKeyInArray!0 k0!843))))

(assert (= (and start!20770 res!101000) b!207847))

(assert (= (and b!207847 res!100997) b!207846))

(assert (= (and b!207846 res!100999) b!207842))

(assert (= (and b!207842 res!100996) b!207843))

(assert (= (and b!207843 res!100998) b!207840))

(assert (= (and b!207840 res!100994) b!207841))

(assert (= (and b!207841 res!100995) b!207839))

(assert (= (and b!207845 condMapEmpty!8990) mapIsEmpty!8990))

(assert (= (and b!207845 (not condMapEmpty!8990)) mapNonEmpty!8990))

(get-info :version)

(assert (= (and mapNonEmpty!8990 ((_ is ValueCellFull!2297) mapValue!8990)) b!207848))

(assert (= (and b!207845 ((_ is ValueCellFull!2297) mapDefault!8990)) b!207844))

(assert (= start!20770 b!207845))

(declare-fun m!235113 () Bool)

(assert (=> b!207846 m!235113))

(declare-fun m!235115 () Bool)

(assert (=> b!207840 m!235115))

(declare-fun m!235117 () Bool)

(assert (=> b!207842 m!235117))

(declare-fun m!235119 () Bool)

(assert (=> b!207839 m!235119))

(declare-fun m!235121 () Bool)

(assert (=> b!207839 m!235121))

(declare-fun m!235123 () Bool)

(assert (=> b!207839 m!235123))

(declare-fun m!235125 () Bool)

(assert (=> b!207839 m!235125))

(declare-fun m!235127 () Bool)

(assert (=> b!207839 m!235127))

(declare-fun m!235129 () Bool)

(assert (=> b!207839 m!235129))

(declare-fun m!235131 () Bool)

(assert (=> b!207839 m!235131))

(declare-fun m!235133 () Bool)

(assert (=> b!207841 m!235133))

(declare-fun m!235135 () Bool)

(assert (=> mapNonEmpty!8990 m!235135))

(declare-fun m!235137 () Bool)

(assert (=> start!20770 m!235137))

(declare-fun m!235139 () Bool)

(assert (=> start!20770 m!235139))

(declare-fun m!235141 () Bool)

(assert (=> start!20770 m!235141))

(check-sat b_and!12145 (not start!20770) (not b!207846) tp_is_empty!5281 (not b_next!5425) (not b!207839) (not b!207842) (not b!207840) (not mapNonEmpty!8990))
(check-sat b_and!12145 (not b_next!5425))
