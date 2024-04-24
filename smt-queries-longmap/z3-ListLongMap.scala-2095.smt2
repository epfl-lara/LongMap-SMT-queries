; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35724 () Bool)

(assert start!35724)

(declare-fun b_free!7921 () Bool)

(declare-fun b_next!7921 () Bool)

(assert (=> start!35724 (= b_free!7921 (not b_next!7921))))

(declare-fun tp!27854 () Bool)

(declare-fun b_and!15177 () Bool)

(assert (=> start!35724 (= tp!27854 b_and!15177)))

(declare-fun b!358935 () Bool)

(declare-fun res!199533 () Bool)

(declare-fun e!219774 () Bool)

(assert (=> b!358935 (=> (not res!199533) (not e!219774))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358935 (= res!199533 (validKeyInArray!0 k0!1077))))

(declare-fun b!358936 () Bool)

(declare-fun res!199535 () Bool)

(assert (=> b!358936 (=> (not res!199535) (not e!219774))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19920 0))(
  ( (array!19921 (arr!9453 (Array (_ BitVec 32) (_ BitVec 64))) (size!9805 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19920)

(assert (=> b!358936 (= res!199535 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9805 _keys!1456))))))

(declare-fun b!358937 () Bool)

(declare-fun res!199536 () Bool)

(assert (=> b!358937 (=> (not res!199536) (not e!219774))))

(assert (=> b!358937 (= res!199536 (validKeyInArray!0 (select (arr!9453 _keys!1456) from!1805)))))

(declare-fun b!358939 () Bool)

(declare-fun res!199532 () Bool)

(assert (=> b!358939 (=> (not res!199532) (not e!219774))))

(declare-fun arrayContainsKey!0 (array!19920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358939 (= res!199532 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358940 () Bool)

(declare-fun e!219776 () Bool)

(declare-fun tp_is_empty!8191 () Bool)

(assert (=> b!358940 (= e!219776 tp_is_empty!8191)))

(declare-fun b!358941 () Bool)

(declare-fun res!199530 () Bool)

(assert (=> b!358941 (=> (not res!199530) (not e!219774))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19920 (_ BitVec 32)) Bool)

(assert (=> b!358941 (= res!199530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358942 () Bool)

(declare-fun res!199529 () Bool)

(assert (=> b!358942 (=> (not res!199529) (not e!219774))))

(declare-datatypes ((List!5360 0))(
  ( (Nil!5357) (Cons!5356 (h!6212 (_ BitVec 64)) (t!10502 List!5360)) )
))
(declare-fun arrayNoDuplicates!0 (array!19920 (_ BitVec 32) List!5360) Bool)

(assert (=> b!358942 (= res!199529 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5357))))

(declare-fun b!358943 () Bool)

(declare-fun res!199534 () Bool)

(assert (=> b!358943 (=> (not res!199534) (not e!219774))))

(assert (=> b!358943 (= res!199534 (= (select (arr!9453 _keys!1456) from!1805) k0!1077))))

(declare-fun mapNonEmpty!13794 () Bool)

(declare-fun mapRes!13794 () Bool)

(declare-fun tp!27855 () Bool)

(assert (=> mapNonEmpty!13794 (= mapRes!13794 (and tp!27855 e!219776))))

(declare-datatypes ((V!11899 0))(
  ( (V!11900 (val!4140 Int)) )
))
(declare-datatypes ((ValueCell!3752 0))(
  ( (ValueCellFull!3752 (v!6335 V!11899)) (EmptyCell!3752) )
))
(declare-fun mapValue!13794 () ValueCell!3752)

(declare-datatypes ((array!19922 0))(
  ( (array!19923 (arr!9454 (Array (_ BitVec 32) ValueCell!3752)) (size!9806 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19922)

(declare-fun mapRest!13794 () (Array (_ BitVec 32) ValueCell!3752))

(declare-fun mapKey!13794 () (_ BitVec 32))

(assert (=> mapNonEmpty!13794 (= (arr!9454 _values!1208) (store mapRest!13794 mapKey!13794 mapValue!13794))))

(declare-fun mapIsEmpty!13794 () Bool)

(assert (=> mapIsEmpty!13794 mapRes!13794))

(declare-fun b!358944 () Bool)

(declare-fun e!219778 () Bool)

(declare-fun e!219777 () Bool)

(assert (=> b!358944 (= e!219778 (and e!219777 mapRes!13794))))

(declare-fun condMapEmpty!13794 () Bool)

(declare-fun mapDefault!13794 () ValueCell!3752)

(assert (=> b!358944 (= condMapEmpty!13794 (= (arr!9454 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3752)) mapDefault!13794)))))

(declare-fun b!358945 () Bool)

(declare-datatypes ((tuple2!5652 0))(
  ( (tuple2!5653 (_1!2837 (_ BitVec 64)) (_2!2837 V!11899)) )
))
(declare-datatypes ((List!5361 0))(
  ( (Nil!5358) (Cons!5357 (h!6213 tuple2!5652) (t!10503 List!5361)) )
))
(declare-datatypes ((ListLongMap!4567 0))(
  ( (ListLongMap!4568 (toList!2299 List!5361)) )
))
(declare-fun lt!166286 () ListLongMap!4567)

(declare-fun contains!2398 (ListLongMap!4567 (_ BitVec 64)) Bool)

(assert (=> b!358945 (= e!219774 (not (contains!2398 lt!166286 k0!1077)))))

(assert (=> b!358945 (contains!2398 lt!166286 (select (arr!9453 _keys!1456) from!1805))))

(declare-fun minValue!1150 () V!11899)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11899)

(declare-fun getCurrentListMap!1827 (array!19920 array!19922 (_ BitVec 32) (_ BitVec 32) V!11899 V!11899 (_ BitVec 32) Int) ListLongMap!4567)

(assert (=> b!358945 (= lt!166286 (getCurrentListMap!1827 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216))))

(declare-datatypes ((Unit!11035 0))(
  ( (Unit!11036) )
))
(declare-fun lt!166285 () Unit!11035)

(declare-fun lemmaValidKeyInArrayIsInListMap!198 (array!19920 array!19922 (_ BitVec 32) (_ BitVec 32) V!11899 V!11899 (_ BitVec 32) Int) Unit!11035)

(assert (=> b!358945 (= lt!166285 (lemmaValidKeyInArrayIsInListMap!198 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!358946 () Bool)

(assert (=> b!358946 (= e!219777 tp_is_empty!8191)))

(declare-fun b!358938 () Bool)

(declare-fun res!199531 () Bool)

(assert (=> b!358938 (=> (not res!199531) (not e!219774))))

(assert (=> b!358938 (= res!199531 (and (= (size!9806 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9805 _keys!1456) (size!9806 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199537 () Bool)

(assert (=> start!35724 (=> (not res!199537) (not e!219774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35724 (= res!199537 (validMask!0 mask!1842))))

(assert (=> start!35724 e!219774))

(assert (=> start!35724 tp_is_empty!8191))

(assert (=> start!35724 true))

(assert (=> start!35724 tp!27854))

(declare-fun array_inv!6988 (array!19920) Bool)

(assert (=> start!35724 (array_inv!6988 _keys!1456)))

(declare-fun array_inv!6989 (array!19922) Bool)

(assert (=> start!35724 (and (array_inv!6989 _values!1208) e!219778)))

(assert (= (and start!35724 res!199537) b!358938))

(assert (= (and b!358938 res!199531) b!358941))

(assert (= (and b!358941 res!199530) b!358942))

(assert (= (and b!358942 res!199529) b!358935))

(assert (= (and b!358935 res!199533) b!358936))

(assert (= (and b!358936 res!199535) b!358939))

(assert (= (and b!358939 res!199532) b!358943))

(assert (= (and b!358943 res!199534) b!358937))

(assert (= (and b!358937 res!199536) b!358945))

(assert (= (and b!358944 condMapEmpty!13794) mapIsEmpty!13794))

(assert (= (and b!358944 (not condMapEmpty!13794)) mapNonEmpty!13794))

(get-info :version)

(assert (= (and mapNonEmpty!13794 ((_ is ValueCellFull!3752) mapValue!13794)) b!358940))

(assert (= (and b!358944 ((_ is ValueCellFull!3752) mapDefault!13794)) b!358946))

(assert (= start!35724 b!358944))

(declare-fun m!356847 () Bool)

(assert (=> b!358937 m!356847))

(assert (=> b!358937 m!356847))

(declare-fun m!356849 () Bool)

(assert (=> b!358937 m!356849))

(declare-fun m!356851 () Bool)

(assert (=> b!358935 m!356851))

(declare-fun m!356853 () Bool)

(assert (=> start!35724 m!356853))

(declare-fun m!356855 () Bool)

(assert (=> start!35724 m!356855))

(declare-fun m!356857 () Bool)

(assert (=> start!35724 m!356857))

(declare-fun m!356859 () Bool)

(assert (=> mapNonEmpty!13794 m!356859))

(assert (=> b!358945 m!356847))

(declare-fun m!356861 () Bool)

(assert (=> b!358945 m!356861))

(declare-fun m!356863 () Bool)

(assert (=> b!358945 m!356863))

(assert (=> b!358945 m!356847))

(declare-fun m!356865 () Bool)

(assert (=> b!358945 m!356865))

(declare-fun m!356867 () Bool)

(assert (=> b!358945 m!356867))

(declare-fun m!356869 () Bool)

(assert (=> b!358941 m!356869))

(assert (=> b!358943 m!356847))

(declare-fun m!356871 () Bool)

(assert (=> b!358942 m!356871))

(declare-fun m!356873 () Bool)

(assert (=> b!358939 m!356873))

(check-sat (not start!35724) b_and!15177 (not b!358942) (not b!358941) (not b_next!7921) (not b!358945) (not mapNonEmpty!13794) tp_is_empty!8191 (not b!358937) (not b!358939) (not b!358935))
(check-sat b_and!15177 (not b_next!7921))
