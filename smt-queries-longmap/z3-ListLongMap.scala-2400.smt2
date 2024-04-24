; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37982 () Bool)

(assert start!37982)

(declare-fun b_free!8965 () Bool)

(declare-fun b_next!8965 () Bool)

(assert (=> start!37982 (= b_free!8965 (not b_next!8965))))

(declare-fun tp!31665 () Bool)

(declare-fun b_and!16293 () Bool)

(assert (=> start!37982 (= tp!31665 b_and!16293)))

(declare-fun b!390859 () Bool)

(declare-datatypes ((V!13955 0))(
  ( (V!13956 (val!4863 Int)) )
))
(declare-datatypes ((tuple2!6412 0))(
  ( (tuple2!6413 (_1!3217 (_ BitVec 64)) (_2!3217 V!13955)) )
))
(declare-datatypes ((List!6261 0))(
  ( (Nil!6258) (Cons!6257 (h!7113 tuple2!6412) (t!11415 List!6261)) )
))
(declare-datatypes ((ListLongMap!5327 0))(
  ( (ListLongMap!5328 (toList!2679 List!6261)) )
))
(declare-fun lt!184366 () ListLongMap!5327)

(declare-fun lt!184365 () ListLongMap!5327)

(declare-fun lt!184364 () tuple2!6412)

(declare-fun e!236761 () Bool)

(declare-fun +!1033 (ListLongMap!5327 tuple2!6412) ListLongMap!5327)

(assert (=> b!390859 (= e!236761 (= lt!184365 (+!1033 lt!184366 lt!184364)))))

(declare-fun e!236759 () Bool)

(assert (=> b!390859 e!236759))

(declare-fun res!223698 () Bool)

(assert (=> b!390859 (=> (not res!223698) (not e!236759))))

(declare-fun lt!184368 () ListLongMap!5327)

(assert (=> b!390859 (= res!223698 (= lt!184365 (+!1033 lt!184368 lt!184364)))))

(declare-fun zeroValue!472 () V!13955)

(assert (=> b!390859 (= lt!184364 (tuple2!6413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390860 () Bool)

(declare-fun e!236760 () Bool)

(assert (=> b!390860 (= e!236760 (not e!236761))))

(declare-fun res!223699 () Bool)

(assert (=> b!390860 (=> res!223699 e!236761)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390860 (= res!223699 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4475 0))(
  ( (ValueCellFull!4475 (v!7085 V!13955)) (EmptyCell!4475) )
))
(declare-datatypes ((array!23160 0))(
  ( (array!23161 (arr!11042 (Array (_ BitVec 32) ValueCell!4475)) (size!11394 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23160)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!184370 () ListLongMap!5327)

(declare-datatypes ((array!23162 0))(
  ( (array!23163 (arr!11043 (Array (_ BitVec 32) (_ BitVec 64))) (size!11395 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23162)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13955)

(declare-fun getCurrentListMap!2061 (array!23162 array!23160 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) Int) ListLongMap!5327)

(assert (=> b!390860 (= lt!184370 (getCurrentListMap!2061 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184362 () array!23162)

(declare-fun lt!184367 () array!23160)

(assert (=> b!390860 (= lt!184365 (getCurrentListMap!2061 lt!184362 lt!184367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390860 (and (= lt!184368 lt!184366) (= lt!184366 lt!184368))))

(declare-fun v!373 () V!13955)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!184363 () ListLongMap!5327)

(assert (=> b!390860 (= lt!184366 (+!1033 lt!184363 (tuple2!6413 k0!778 v!373)))))

(declare-datatypes ((Unit!11941 0))(
  ( (Unit!11942) )
))
(declare-fun lt!184369 () Unit!11941)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!252 (array!23162 array!23160 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) (_ BitVec 64) V!13955 (_ BitVec 32) Int) Unit!11941)

(assert (=> b!390860 (= lt!184369 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!252 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!950 (array!23162 array!23160 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) Int) ListLongMap!5327)

(assert (=> b!390860 (= lt!184368 (getCurrentListMapNoExtraKeys!950 lt!184362 lt!184367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390860 (= lt!184367 (array!23161 (store (arr!11042 _values!506) i!548 (ValueCellFull!4475 v!373)) (size!11394 _values!506)))))

(assert (=> b!390860 (= lt!184363 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390861 () Bool)

(declare-fun res!223694 () Bool)

(declare-fun e!236754 () Bool)

(assert (=> b!390861 (=> (not res!223694) (not e!236754))))

(assert (=> b!390861 (= res!223694 (and (= (size!11394 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11395 _keys!658) (size!11394 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390862 () Bool)

(assert (=> b!390862 (= e!236759 (= lt!184370 (+!1033 lt!184363 lt!184364)))))

(declare-fun b!390863 () Bool)

(declare-fun res!223695 () Bool)

(assert (=> b!390863 (=> (not res!223695) (not e!236760))))

(declare-datatypes ((List!6262 0))(
  ( (Nil!6259) (Cons!6258 (h!7114 (_ BitVec 64)) (t!11416 List!6262)) )
))
(declare-fun arrayNoDuplicates!0 (array!23162 (_ BitVec 32) List!6262) Bool)

(assert (=> b!390863 (= res!223695 (arrayNoDuplicates!0 lt!184362 #b00000000000000000000000000000000 Nil!6259))))

(declare-fun mapIsEmpty!16038 () Bool)

(declare-fun mapRes!16038 () Bool)

(assert (=> mapIsEmpty!16038 mapRes!16038))

(declare-fun b!390864 () Bool)

(declare-fun res!223690 () Bool)

(assert (=> b!390864 (=> (not res!223690) (not e!236754))))

(assert (=> b!390864 (= res!223690 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6259))))

(declare-fun b!390865 () Bool)

(declare-fun e!236758 () Bool)

(declare-fun e!236756 () Bool)

(assert (=> b!390865 (= e!236758 (and e!236756 mapRes!16038))))

(declare-fun condMapEmpty!16038 () Bool)

(declare-fun mapDefault!16038 () ValueCell!4475)

(assert (=> b!390865 (= condMapEmpty!16038 (= (arr!11042 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4475)) mapDefault!16038)))))

(declare-fun b!390866 () Bool)

(declare-fun res!223689 () Bool)

(assert (=> b!390866 (=> (not res!223689) (not e!236754))))

(assert (=> b!390866 (= res!223689 (or (= (select (arr!11043 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11043 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390867 () Bool)

(declare-fun res!223691 () Bool)

(assert (=> b!390867 (=> (not res!223691) (not e!236754))))

(assert (=> b!390867 (= res!223691 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11395 _keys!658))))))

(declare-fun b!390868 () Bool)

(declare-fun res!223692 () Bool)

(assert (=> b!390868 (=> (not res!223692) (not e!236754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390868 (= res!223692 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16038 () Bool)

(declare-fun tp!31664 () Bool)

(declare-fun e!236755 () Bool)

(assert (=> mapNonEmpty!16038 (= mapRes!16038 (and tp!31664 e!236755))))

(declare-fun mapRest!16038 () (Array (_ BitVec 32) ValueCell!4475))

(declare-fun mapKey!16038 () (_ BitVec 32))

(declare-fun mapValue!16038 () ValueCell!4475)

(assert (=> mapNonEmpty!16038 (= (arr!11042 _values!506) (store mapRest!16038 mapKey!16038 mapValue!16038))))

(declare-fun b!390869 () Bool)

(declare-fun res!223688 () Bool)

(assert (=> b!390869 (=> (not res!223688) (not e!236754))))

(declare-fun arrayContainsKey!0 (array!23162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390869 (= res!223688 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390870 () Bool)

(declare-fun tp_is_empty!9637 () Bool)

(assert (=> b!390870 (= e!236755 tp_is_empty!9637)))

(declare-fun b!390871 () Bool)

(assert (=> b!390871 (= e!236754 e!236760)))

(declare-fun res!223697 () Bool)

(assert (=> b!390871 (=> (not res!223697) (not e!236760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23162 (_ BitVec 32)) Bool)

(assert (=> b!390871 (= res!223697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184362 mask!970))))

(assert (=> b!390871 (= lt!184362 (array!23163 (store (arr!11043 _keys!658) i!548 k0!778) (size!11395 _keys!658)))))

(declare-fun res!223696 () Bool)

(assert (=> start!37982 (=> (not res!223696) (not e!236754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37982 (= res!223696 (validMask!0 mask!970))))

(assert (=> start!37982 e!236754))

(declare-fun array_inv!8164 (array!23160) Bool)

(assert (=> start!37982 (and (array_inv!8164 _values!506) e!236758)))

(assert (=> start!37982 tp!31665))

(assert (=> start!37982 true))

(assert (=> start!37982 tp_is_empty!9637))

(declare-fun array_inv!8165 (array!23162) Bool)

(assert (=> start!37982 (array_inv!8165 _keys!658)))

(declare-fun b!390872 () Bool)

(assert (=> b!390872 (= e!236756 tp_is_empty!9637)))

(declare-fun b!390873 () Bool)

(declare-fun res!223693 () Bool)

(assert (=> b!390873 (=> (not res!223693) (not e!236754))))

(assert (=> b!390873 (= res!223693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37982 res!223696) b!390861))

(assert (= (and b!390861 res!223694) b!390873))

(assert (= (and b!390873 res!223693) b!390864))

(assert (= (and b!390864 res!223690) b!390867))

(assert (= (and b!390867 res!223691) b!390868))

(assert (= (and b!390868 res!223692) b!390866))

(assert (= (and b!390866 res!223689) b!390869))

(assert (= (and b!390869 res!223688) b!390871))

(assert (= (and b!390871 res!223697) b!390863))

(assert (= (and b!390863 res!223695) b!390860))

(assert (= (and b!390860 (not res!223699)) b!390859))

(assert (= (and b!390859 res!223698) b!390862))

(assert (= (and b!390865 condMapEmpty!16038) mapIsEmpty!16038))

(assert (= (and b!390865 (not condMapEmpty!16038)) mapNonEmpty!16038))

(get-info :version)

(assert (= (and mapNonEmpty!16038 ((_ is ValueCellFull!4475) mapValue!16038)) b!390870))

(assert (= (and b!390865 ((_ is ValueCellFull!4475) mapDefault!16038)) b!390872))

(assert (= start!37982 b!390865))

(declare-fun m!387489 () Bool)

(assert (=> b!390871 m!387489))

(declare-fun m!387491 () Bool)

(assert (=> b!390871 m!387491))

(declare-fun m!387493 () Bool)

(assert (=> b!390860 m!387493))

(declare-fun m!387495 () Bool)

(assert (=> b!390860 m!387495))

(declare-fun m!387497 () Bool)

(assert (=> b!390860 m!387497))

(declare-fun m!387499 () Bool)

(assert (=> b!390860 m!387499))

(declare-fun m!387501 () Bool)

(assert (=> b!390860 m!387501))

(declare-fun m!387503 () Bool)

(assert (=> b!390860 m!387503))

(declare-fun m!387505 () Bool)

(assert (=> b!390860 m!387505))

(declare-fun m!387507 () Bool)

(assert (=> b!390869 m!387507))

(declare-fun m!387509 () Bool)

(assert (=> start!37982 m!387509))

(declare-fun m!387511 () Bool)

(assert (=> start!37982 m!387511))

(declare-fun m!387513 () Bool)

(assert (=> start!37982 m!387513))

(declare-fun m!387515 () Bool)

(assert (=> b!390862 m!387515))

(declare-fun m!387517 () Bool)

(assert (=> b!390873 m!387517))

(declare-fun m!387519 () Bool)

(assert (=> b!390864 m!387519))

(declare-fun m!387521 () Bool)

(assert (=> b!390863 m!387521))

(declare-fun m!387523 () Bool)

(assert (=> mapNonEmpty!16038 m!387523))

(declare-fun m!387525 () Bool)

(assert (=> b!390859 m!387525))

(declare-fun m!387527 () Bool)

(assert (=> b!390859 m!387527))

(declare-fun m!387529 () Bool)

(assert (=> b!390866 m!387529))

(declare-fun m!387531 () Bool)

(assert (=> b!390868 m!387531))

(check-sat (not b_next!8965) (not b!390862) tp_is_empty!9637 (not b!390860) (not b!390863) b_and!16293 (not b!390868) (not b!390869) (not mapNonEmpty!16038) (not b!390859) (not b!390873) (not b!390871) (not b!390864) (not start!37982))
(check-sat b_and!16293 (not b_next!8965))
