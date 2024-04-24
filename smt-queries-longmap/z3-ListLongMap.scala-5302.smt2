; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71182 () Bool)

(assert start!71182)

(declare-fun b_free!13219 () Bool)

(declare-fun b_next!13219 () Bool)

(assert (=> start!71182 (= b_free!13219 (not b_next!13219))))

(declare-fun tp!46411 () Bool)

(declare-fun b_and!22133 () Bool)

(assert (=> start!71182 (= tp!46411 b_and!22133)))

(declare-fun mapIsEmpty!24013 () Bool)

(declare-fun mapRes!24013 () Bool)

(assert (=> mapIsEmpty!24013 mapRes!24013))

(declare-fun b!825562 () Bool)

(declare-fun e!459436 () Bool)

(assert (=> b!825562 (= e!459436 true)))

(declare-datatypes ((V!24907 0))(
  ( (V!24908 (val!7512 Int)) )
))
(declare-datatypes ((tuple2!9864 0))(
  ( (tuple2!9865 (_1!4943 (_ BitVec 64)) (_2!4943 V!24907)) )
))
(declare-datatypes ((List!15649 0))(
  ( (Nil!15646) (Cons!15645 (h!16780 tuple2!9864) (t!21984 List!15649)) )
))
(declare-datatypes ((ListLongMap!8689 0))(
  ( (ListLongMap!8690 (toList!4360 List!15649)) )
))
(declare-fun lt!372296 () ListLongMap!8689)

(declare-fun zeroValueBefore!34 () V!24907)

(declare-datatypes ((array!46051 0))(
  ( (array!46052 (arr!22068 (Array (_ BitVec 32) (_ BitVec 64))) (size!22488 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46051)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24907)

(declare-datatypes ((ValueCell!7049 0))(
  ( (ValueCellFull!7049 (v!9945 V!24907)) (EmptyCell!7049) )
))
(declare-datatypes ((array!46053 0))(
  ( (array!46054 (arr!22069 (Array (_ BitVec 32) ValueCell!7049)) (size!22489 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46053)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2487 (array!46051 array!46053 (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 (_ BitVec 32) Int) ListLongMap!8689)

(assert (=> b!825562 (= lt!372296 (getCurrentListMap!2487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825563 () Bool)

(declare-fun e!459434 () Bool)

(assert (=> b!825563 (= e!459434 (not e!459436))))

(declare-fun res!562570 () Bool)

(assert (=> b!825563 (=> res!562570 e!459436)))

(assert (=> b!825563 (= res!562570 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372294 () ListLongMap!8689)

(declare-fun lt!372295 () ListLongMap!8689)

(assert (=> b!825563 (= lt!372294 lt!372295)))

(declare-datatypes ((Unit!28271 0))(
  ( (Unit!28272) )
))
(declare-fun lt!372293 () Unit!28271)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24907)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!530 (array!46051 array!46053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 V!24907 V!24907 (_ BitVec 32) Int) Unit!28271)

(assert (=> b!825563 (= lt!372293 (lemmaNoChangeToArrayThenSameMapNoExtras!530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2442 (array!46051 array!46053 (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 (_ BitVec 32) Int) ListLongMap!8689)

(assert (=> b!825563 (= lt!372295 (getCurrentListMapNoExtraKeys!2442 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825563 (= lt!372294 (getCurrentListMapNoExtraKeys!2442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24013 () Bool)

(declare-fun tp!46410 () Bool)

(declare-fun e!459439 () Bool)

(assert (=> mapNonEmpty!24013 (= mapRes!24013 (and tp!46410 e!459439))))

(declare-fun mapRest!24013 () (Array (_ BitVec 32) ValueCell!7049))

(declare-fun mapValue!24013 () ValueCell!7049)

(declare-fun mapKey!24013 () (_ BitVec 32))

(assert (=> mapNonEmpty!24013 (= (arr!22069 _values!788) (store mapRest!24013 mapKey!24013 mapValue!24013))))

(declare-fun b!825564 () Bool)

(declare-fun e!459437 () Bool)

(declare-fun tp_is_empty!14929 () Bool)

(assert (=> b!825564 (= e!459437 tp_is_empty!14929)))

(declare-fun res!562569 () Bool)

(assert (=> start!71182 (=> (not res!562569) (not e!459434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71182 (= res!562569 (validMask!0 mask!1312))))

(assert (=> start!71182 e!459434))

(assert (=> start!71182 tp_is_empty!14929))

(declare-fun array_inv!17641 (array!46051) Bool)

(assert (=> start!71182 (array_inv!17641 _keys!976)))

(assert (=> start!71182 true))

(declare-fun e!459438 () Bool)

(declare-fun array_inv!17642 (array!46053) Bool)

(assert (=> start!71182 (and (array_inv!17642 _values!788) e!459438)))

(assert (=> start!71182 tp!46411))

(declare-fun b!825565 () Bool)

(declare-fun res!562573 () Bool)

(assert (=> b!825565 (=> (not res!562573) (not e!459434))))

(declare-datatypes ((List!15650 0))(
  ( (Nil!15647) (Cons!15646 (h!16781 (_ BitVec 64)) (t!21985 List!15650)) )
))
(declare-fun arrayNoDuplicates!0 (array!46051 (_ BitVec 32) List!15650) Bool)

(assert (=> b!825565 (= res!562573 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15647))))

(declare-fun b!825566 () Bool)

(assert (=> b!825566 (= e!459439 tp_is_empty!14929)))

(declare-fun b!825567 () Bool)

(assert (=> b!825567 (= e!459438 (and e!459437 mapRes!24013))))

(declare-fun condMapEmpty!24013 () Bool)

(declare-fun mapDefault!24013 () ValueCell!7049)

(assert (=> b!825567 (= condMapEmpty!24013 (= (arr!22069 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7049)) mapDefault!24013)))))

(declare-fun b!825568 () Bool)

(declare-fun res!562572 () Bool)

(assert (=> b!825568 (=> (not res!562572) (not e!459434))))

(assert (=> b!825568 (= res!562572 (and (= (size!22489 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22488 _keys!976) (size!22489 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825569 () Bool)

(declare-fun res!562571 () Bool)

(assert (=> b!825569 (=> (not res!562571) (not e!459434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46051 (_ BitVec 32)) Bool)

(assert (=> b!825569 (= res!562571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71182 res!562569) b!825568))

(assert (= (and b!825568 res!562572) b!825569))

(assert (= (and b!825569 res!562571) b!825565))

(assert (= (and b!825565 res!562573) b!825563))

(assert (= (and b!825563 (not res!562570)) b!825562))

(assert (= (and b!825567 condMapEmpty!24013) mapIsEmpty!24013))

(assert (= (and b!825567 (not condMapEmpty!24013)) mapNonEmpty!24013))

(get-info :version)

(assert (= (and mapNonEmpty!24013 ((_ is ValueCellFull!7049) mapValue!24013)) b!825566))

(assert (= (and b!825567 ((_ is ValueCellFull!7049) mapDefault!24013)) b!825564))

(assert (= start!71182 b!825567))

(declare-fun m!767999 () Bool)

(assert (=> b!825562 m!767999))

(declare-fun m!768001 () Bool)

(assert (=> b!825569 m!768001))

(declare-fun m!768003 () Bool)

(assert (=> start!71182 m!768003))

(declare-fun m!768005 () Bool)

(assert (=> start!71182 m!768005))

(declare-fun m!768007 () Bool)

(assert (=> start!71182 m!768007))

(declare-fun m!768009 () Bool)

(assert (=> b!825565 m!768009))

(declare-fun m!768011 () Bool)

(assert (=> mapNonEmpty!24013 m!768011))

(declare-fun m!768013 () Bool)

(assert (=> b!825563 m!768013))

(declare-fun m!768015 () Bool)

(assert (=> b!825563 m!768015))

(declare-fun m!768017 () Bool)

(assert (=> b!825563 m!768017))

(check-sat b_and!22133 (not b_next!13219) (not b!825562) (not b!825563) (not b!825569) (not mapNonEmpty!24013) (not b!825565) (not start!71182) tp_is_empty!14929)
(check-sat b_and!22133 (not b_next!13219))
