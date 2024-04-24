; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77904 () Bool)

(assert start!77904)

(declare-fun b_free!16321 () Bool)

(declare-fun b_next!16321 () Bool)

(assert (=> start!77904 (= b_free!16321 (not b_next!16321))))

(declare-fun tp!57225 () Bool)

(declare-fun b_and!26805 () Bool)

(assert (=> start!77904 (= tp!57225 b_and!26805)))

(declare-fun b!907994 () Bool)

(declare-fun res!612544 () Bool)

(declare-fun e!508935 () Bool)

(assert (=> b!907994 (=> (not res!612544) (not e!508935))))

(declare-datatypes ((array!53555 0))(
  ( (array!53556 (arr!25732 (Array (_ BitVec 32) (_ BitVec 64))) (size!26192 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53555)

(declare-datatypes ((List!18032 0))(
  ( (Nil!18029) (Cons!18028 (h!19180 (_ BitVec 64)) (t!25517 List!18032)) )
))
(declare-fun arrayNoDuplicates!0 (array!53555 (_ BitVec 32) List!18032) Bool)

(assert (=> b!907994 (= res!612544 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18029))))

(declare-fun mapIsEmpty!29821 () Bool)

(declare-fun mapRes!29821 () Bool)

(assert (=> mapIsEmpty!29821 mapRes!29821))

(declare-fun b!907995 () Bool)

(declare-fun e!508933 () Bool)

(declare-fun tp_is_empty!18739 () Bool)

(assert (=> b!907995 (= e!508933 tp_is_empty!18739)))

(declare-fun b!907996 () Bool)

(declare-fun e!508931 () Bool)

(declare-fun e!508928 () Bool)

(assert (=> b!907996 (= e!508931 (not e!508928))))

(declare-fun res!612546 () Bool)

(assert (=> b!907996 (=> res!612546 e!508928)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907996 (= res!612546 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26192 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((V!29951 0))(
  ( (V!29952 (val!9420 Int)) )
))
(declare-datatypes ((ValueCell!8888 0))(
  ( (ValueCellFull!8888 (v!11922 V!29951)) (EmptyCell!8888) )
))
(declare-datatypes ((array!53557 0))(
  ( (array!53558 (arr!25733 (Array (_ BitVec 32) ValueCell!8888)) (size!26193 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53557)

(declare-fun lt!409518 () V!29951)

(declare-fun get!13545 (ValueCell!8888 V!29951) V!29951)

(declare-fun dynLambda!1373 (Int (_ BitVec 64)) V!29951)

(assert (=> b!907996 (= lt!409518 (get!13545 (select (arr!25733 _values!1152) i!717) (dynLambda!1373 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907996 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29951)

(declare-datatypes ((Unit!30778 0))(
  ( (Unit!30779) )
))
(declare-fun lt!409522 () Unit!30778)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29951)

(declare-fun lemmaKeyInListMapIsInArray!232 (array!53555 array!53557 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 64) Int) Unit!30778)

(assert (=> b!907996 (= lt!409522 (lemmaKeyInListMapIsInArray!232 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907997 () Bool)

(declare-fun res!612545 () Bool)

(assert (=> b!907997 (=> (not res!612545) (not e!508931))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907997 (= res!612545 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29821 () Bool)

(declare-fun tp!57226 () Bool)

(declare-fun e!508934 () Bool)

(assert (=> mapNonEmpty!29821 (= mapRes!29821 (and tp!57226 e!508934))))

(declare-fun mapKey!29821 () (_ BitVec 32))

(declare-fun mapValue!29821 () ValueCell!8888)

(declare-fun mapRest!29821 () (Array (_ BitVec 32) ValueCell!8888))

(assert (=> mapNonEmpty!29821 (= (arr!25733 _values!1152) (store mapRest!29821 mapKey!29821 mapValue!29821))))

(declare-fun b!907998 () Bool)

(declare-fun res!612550 () Bool)

(assert (=> b!907998 (=> (not res!612550) (not e!508935))))

(assert (=> b!907998 (= res!612550 (and (= (size!26193 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26192 _keys!1386) (size!26193 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907999 () Bool)

(assert (=> b!907999 (= e!508935 e!508931)))

(declare-fun res!612548 () Bool)

(assert (=> b!907999 (=> (not res!612548) (not e!508931))))

(declare-datatypes ((tuple2!12198 0))(
  ( (tuple2!12199 (_1!6110 (_ BitVec 64)) (_2!6110 V!29951)) )
))
(declare-datatypes ((List!18033 0))(
  ( (Nil!18030) (Cons!18029 (h!19181 tuple2!12198) (t!25518 List!18033)) )
))
(declare-datatypes ((ListLongMap!10897 0))(
  ( (ListLongMap!10898 (toList!5464 List!18033)) )
))
(declare-fun lt!409520 () ListLongMap!10897)

(declare-fun contains!4518 (ListLongMap!10897 (_ BitVec 64)) Bool)

(assert (=> b!907999 (= res!612548 (contains!4518 lt!409520 k0!1033))))

(declare-fun getCurrentListMap!2729 (array!53555 array!53557 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 32) Int) ListLongMap!10897)

(assert (=> b!907999 (= lt!409520 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908000 () Bool)

(declare-fun e!508930 () Bool)

(assert (=> b!908000 (= e!508928 e!508930)))

(declare-fun res!612549 () Bool)

(assert (=> b!908000 (=> res!612549 e!508930)))

(declare-fun lt!409519 () ListLongMap!10897)

(assert (=> b!908000 (= res!612549 (not (contains!4518 lt!409519 k0!1033)))))

(assert (=> b!908000 (= lt!409519 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!612553 () Bool)

(assert (=> start!77904 (=> (not res!612553) (not e!508935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77904 (= res!612553 (validMask!0 mask!1756))))

(assert (=> start!77904 e!508935))

(declare-fun e!508932 () Bool)

(declare-fun array_inv!20208 (array!53557) Bool)

(assert (=> start!77904 (and (array_inv!20208 _values!1152) e!508932)))

(assert (=> start!77904 tp!57225))

(assert (=> start!77904 true))

(assert (=> start!77904 tp_is_empty!18739))

(declare-fun array_inv!20209 (array!53555) Bool)

(assert (=> start!77904 (array_inv!20209 _keys!1386)))

(declare-fun b!908001 () Bool)

(assert (=> b!908001 (= e!508934 tp_is_empty!18739)))

(declare-fun b!908002 () Bool)

(declare-fun res!612547 () Bool)

(assert (=> b!908002 (=> res!612547 e!508930)))

(declare-fun apply!483 (ListLongMap!10897 (_ BitVec 64)) V!29951)

(assert (=> b!908002 (= res!612547 (not (= (apply!483 lt!409519 k0!1033) lt!409518)))))

(declare-fun b!908003 () Bool)

(assert (=> b!908003 (= e!508932 (and e!508933 mapRes!29821))))

(declare-fun condMapEmpty!29821 () Bool)

(declare-fun mapDefault!29821 () ValueCell!8888)

(assert (=> b!908003 (= condMapEmpty!29821 (= (arr!25733 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8888)) mapDefault!29821)))))

(declare-fun b!908004 () Bool)

(declare-fun res!612552 () Bool)

(assert (=> b!908004 (=> (not res!612552) (not e!508931))))

(assert (=> b!908004 (= res!612552 (and (= (select (arr!25732 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908005 () Bool)

(declare-fun res!612551 () Bool)

(assert (=> b!908005 (=> (not res!612551) (not e!508935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53555 (_ BitVec 32)) Bool)

(assert (=> b!908005 (= res!612551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908006 () Bool)

(assert (=> b!908006 (= e!508930 true)))

(assert (=> b!908006 (= (apply!483 lt!409520 k0!1033) lt!409518)))

(declare-fun lt!409521 () Unit!30778)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!35 (array!53555 array!53557 (_ BitVec 32) (_ BitVec 32) V!29951 V!29951 (_ BitVec 64) V!29951 (_ BitVec 32) Int) Unit!30778)

(assert (=> b!908006 (= lt!409521 (lemmaListMapApplyFromThenApplyFromZero!35 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409518 i!717 defaultEntry!1160))))

(assert (= (and start!77904 res!612553) b!907998))

(assert (= (and b!907998 res!612550) b!908005))

(assert (= (and b!908005 res!612551) b!907994))

(assert (= (and b!907994 res!612544) b!907999))

(assert (= (and b!907999 res!612548) b!907997))

(assert (= (and b!907997 res!612545) b!908004))

(assert (= (and b!908004 res!612552) b!907996))

(assert (= (and b!907996 (not res!612546)) b!908000))

(assert (= (and b!908000 (not res!612549)) b!908002))

(assert (= (and b!908002 (not res!612547)) b!908006))

(assert (= (and b!908003 condMapEmpty!29821) mapIsEmpty!29821))

(assert (= (and b!908003 (not condMapEmpty!29821)) mapNonEmpty!29821))

(get-info :version)

(assert (= (and mapNonEmpty!29821 ((_ is ValueCellFull!8888) mapValue!29821)) b!908001))

(assert (= (and b!908003 ((_ is ValueCellFull!8888) mapDefault!29821)) b!907995))

(assert (= start!77904 b!908003))

(declare-fun b_lambda!13209 () Bool)

(assert (=> (not b_lambda!13209) (not b!907996)))

(declare-fun t!25516 () Bool)

(declare-fun tb!5335 () Bool)

(assert (=> (and start!77904 (= defaultEntry!1160 defaultEntry!1160) t!25516) tb!5335))

(declare-fun result!10473 () Bool)

(assert (=> tb!5335 (= result!10473 tp_is_empty!18739)))

(assert (=> b!907996 t!25516))

(declare-fun b_and!26807 () Bool)

(assert (= b_and!26805 (and (=> t!25516 result!10473) b_and!26807)))

(declare-fun m!843749 () Bool)

(assert (=> b!908004 m!843749))

(declare-fun m!843751 () Bool)

(assert (=> b!907994 m!843751))

(declare-fun m!843753 () Bool)

(assert (=> b!908006 m!843753))

(declare-fun m!843755 () Bool)

(assert (=> b!908006 m!843755))

(declare-fun m!843757 () Bool)

(assert (=> b!908002 m!843757))

(declare-fun m!843759 () Bool)

(assert (=> b!908005 m!843759))

(declare-fun m!843761 () Bool)

(assert (=> b!908000 m!843761))

(declare-fun m!843763 () Bool)

(assert (=> b!908000 m!843763))

(declare-fun m!843765 () Bool)

(assert (=> start!77904 m!843765))

(declare-fun m!843767 () Bool)

(assert (=> start!77904 m!843767))

(declare-fun m!843769 () Bool)

(assert (=> start!77904 m!843769))

(declare-fun m!843771 () Bool)

(assert (=> b!907999 m!843771))

(declare-fun m!843773 () Bool)

(assert (=> b!907999 m!843773))

(declare-fun m!843775 () Bool)

(assert (=> mapNonEmpty!29821 m!843775))

(declare-fun m!843777 () Bool)

(assert (=> b!907996 m!843777))

(declare-fun m!843779 () Bool)

(assert (=> b!907996 m!843779))

(declare-fun m!843781 () Bool)

(assert (=> b!907996 m!843781))

(declare-fun m!843783 () Bool)

(assert (=> b!907996 m!843783))

(assert (=> b!907996 m!843777))

(assert (=> b!907996 m!843781))

(declare-fun m!843785 () Bool)

(assert (=> b!907996 m!843785))

(declare-fun m!843787 () Bool)

(assert (=> b!907997 m!843787))

(check-sat (not b!908000) (not b_next!16321) (not b!907994) b_and!26807 (not start!77904) (not b!907996) (not b!908002) (not b_lambda!13209) (not b!908005) (not b!908006) (not b!907999) (not mapNonEmpty!29821) tp_is_empty!18739 (not b!907997))
(check-sat b_and!26807 (not b_next!16321))
