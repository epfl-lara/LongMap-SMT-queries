; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70888 () Bool)

(assert start!70888)

(declare-fun b_free!13125 () Bool)

(declare-fun b_next!13125 () Bool)

(assert (=> start!70888 (= b_free!13125 (not b_next!13125))))

(declare-fun tp!46122 () Bool)

(declare-fun b_and!22009 () Bool)

(assert (=> start!70888 (= tp!46122 b_and!22009)))

(declare-fun b!823355 () Bool)

(declare-fun res!561493 () Bool)

(declare-fun e!457924 () Bool)

(assert (=> b!823355 (=> (not res!561493) (not e!457924))))

(declare-datatypes ((array!45860 0))(
  ( (array!45861 (arr!21979 (Array (_ BitVec 32) (_ BitVec 64))) (size!22400 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45860)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24781 0))(
  ( (V!24782 (val!7465 Int)) )
))
(declare-datatypes ((ValueCell!7002 0))(
  ( (ValueCellFull!7002 (v!9897 V!24781)) (EmptyCell!7002) )
))
(declare-datatypes ((array!45862 0))(
  ( (array!45863 (arr!21980 (Array (_ BitVec 32) ValueCell!7002)) (size!22401 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45862)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823355 (= res!561493 (and (= (size!22401 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22400 _keys!976) (size!22401 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23866 () Bool)

(declare-fun mapRes!23866 () Bool)

(assert (=> mapIsEmpty!23866 mapRes!23866))

(declare-fun b!823356 () Bool)

(declare-fun e!457925 () Bool)

(declare-fun e!457926 () Bool)

(assert (=> b!823356 (= e!457925 (and e!457926 mapRes!23866))))

(declare-fun condMapEmpty!23866 () Bool)

(declare-fun mapDefault!23866 () ValueCell!7002)

(assert (=> b!823356 (= condMapEmpty!23866 (= (arr!21980 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7002)) mapDefault!23866)))))

(declare-fun b!823357 () Bool)

(declare-fun e!457923 () Bool)

(declare-fun tp_is_empty!14835 () Bool)

(assert (=> b!823357 (= e!457923 tp_is_empty!14835)))

(declare-fun mapNonEmpty!23866 () Bool)

(declare-fun tp!46123 () Bool)

(assert (=> mapNonEmpty!23866 (= mapRes!23866 (and tp!46123 e!457923))))

(declare-fun mapKey!23866 () (_ BitVec 32))

(declare-fun mapValue!23866 () ValueCell!7002)

(declare-fun mapRest!23866 () (Array (_ BitVec 32) ValueCell!7002))

(assert (=> mapNonEmpty!23866 (= (arr!21980 _values!788) (store mapRest!23866 mapKey!23866 mapValue!23866))))

(declare-fun b!823359 () Bool)

(declare-fun e!457928 () Bool)

(assert (=> b!823359 (= e!457924 (not e!457928))))

(declare-fun res!561490 () Bool)

(assert (=> b!823359 (=> res!561490 e!457928)))

(assert (=> b!823359 (= res!561490 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9872 0))(
  ( (tuple2!9873 (_1!4947 (_ BitVec 64)) (_2!4947 V!24781)) )
))
(declare-datatypes ((List!15684 0))(
  ( (Nil!15681) (Cons!15680 (h!16809 tuple2!9872) (t!22023 List!15684)) )
))
(declare-datatypes ((ListLongMap!8695 0))(
  ( (ListLongMap!8696 (toList!4363 List!15684)) )
))
(declare-fun lt!371192 () ListLongMap!8695)

(declare-fun lt!371187 () ListLongMap!8695)

(assert (=> b!823359 (= lt!371192 lt!371187)))

(declare-fun zeroValueBefore!34 () V!24781)

(declare-datatypes ((Unit!28192 0))(
  ( (Unit!28193) )
))
(declare-fun lt!371190 () Unit!28192)

(declare-fun zeroValueAfter!34 () V!24781)

(declare-fun minValue!754 () V!24781)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!488 (array!45860 array!45862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24781 V!24781 V!24781 V!24781 (_ BitVec 32) Int) Unit!28192)

(assert (=> b!823359 (= lt!371190 (lemmaNoChangeToArrayThenSameMapNoExtras!488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2378 (array!45860 array!45862 (_ BitVec 32) (_ BitVec 32) V!24781 V!24781 (_ BitVec 32) Int) ListLongMap!8695)

(assert (=> b!823359 (= lt!371187 (getCurrentListMapNoExtraKeys!2378 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823359 (= lt!371192 (getCurrentListMapNoExtraKeys!2378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823360 () Bool)

(assert (=> b!823360 (= e!457926 tp_is_empty!14835)))

(declare-fun b!823361 () Bool)

(declare-fun res!561491 () Bool)

(assert (=> b!823361 (=> (not res!561491) (not e!457924))))

(declare-datatypes ((List!15685 0))(
  ( (Nil!15682) (Cons!15681 (h!16810 (_ BitVec 64)) (t!22024 List!15685)) )
))
(declare-fun arrayNoDuplicates!0 (array!45860 (_ BitVec 32) List!15685) Bool)

(assert (=> b!823361 (= res!561491 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15682))))

(declare-fun b!823362 () Bool)

(declare-fun res!561489 () Bool)

(assert (=> b!823362 (=> (not res!561489) (not e!457924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45860 (_ BitVec 32)) Bool)

(assert (=> b!823362 (= res!561489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823358 () Bool)

(assert (=> b!823358 (= e!457928 true)))

(declare-fun lt!371183 () ListLongMap!8695)

(declare-fun lt!371191 () ListLongMap!8695)

(declare-fun lt!371185 () tuple2!9872)

(declare-fun +!1912 (ListLongMap!8695 tuple2!9872) ListLongMap!8695)

(assert (=> b!823358 (= lt!371183 (+!1912 lt!371191 lt!371185))))

(declare-fun lt!371189 () Unit!28192)

(declare-fun addCommutativeForDiffKeys!475 (ListLongMap!8695 (_ BitVec 64) V!24781 (_ BitVec 64) V!24781) Unit!28192)

(assert (=> b!823358 (= lt!371189 (addCommutativeForDiffKeys!475 lt!371192 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371186 () ListLongMap!8695)

(assert (=> b!823358 (= lt!371186 lt!371183)))

(declare-fun lt!371184 () tuple2!9872)

(assert (=> b!823358 (= lt!371183 (+!1912 (+!1912 lt!371192 lt!371185) lt!371184))))

(assert (=> b!823358 (= lt!371185 (tuple2!9873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371188 () ListLongMap!8695)

(assert (=> b!823358 (= lt!371188 lt!371191)))

(assert (=> b!823358 (= lt!371191 (+!1912 lt!371192 lt!371184))))

(assert (=> b!823358 (= lt!371184 (tuple2!9873 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2526 (array!45860 array!45862 (_ BitVec 32) (_ BitVec 32) V!24781 V!24781 (_ BitVec 32) Int) ListLongMap!8695)

(assert (=> b!823358 (= lt!371186 (getCurrentListMap!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823358 (= lt!371188 (getCurrentListMap!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561492 () Bool)

(assert (=> start!70888 (=> (not res!561492) (not e!457924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70888 (= res!561492 (validMask!0 mask!1312))))

(assert (=> start!70888 e!457924))

(assert (=> start!70888 tp_is_empty!14835))

(declare-fun array_inv!17549 (array!45860) Bool)

(assert (=> start!70888 (array_inv!17549 _keys!976)))

(assert (=> start!70888 true))

(declare-fun array_inv!17550 (array!45862) Bool)

(assert (=> start!70888 (and (array_inv!17550 _values!788) e!457925)))

(assert (=> start!70888 tp!46122))

(assert (= (and start!70888 res!561492) b!823355))

(assert (= (and b!823355 res!561493) b!823362))

(assert (= (and b!823362 res!561489) b!823361))

(assert (= (and b!823361 res!561491) b!823359))

(assert (= (and b!823359 (not res!561490)) b!823358))

(assert (= (and b!823356 condMapEmpty!23866) mapIsEmpty!23866))

(assert (= (and b!823356 (not condMapEmpty!23866)) mapNonEmpty!23866))

(get-info :version)

(assert (= (and mapNonEmpty!23866 ((_ is ValueCellFull!7002) mapValue!23866)) b!823357))

(assert (= (and b!823356 ((_ is ValueCellFull!7002) mapDefault!23866)) b!823360))

(assert (= start!70888 b!823356))

(declare-fun m!765489 () Bool)

(assert (=> mapNonEmpty!23866 m!765489))

(declare-fun m!765491 () Bool)

(assert (=> b!823362 m!765491))

(declare-fun m!765493 () Bool)

(assert (=> start!70888 m!765493))

(declare-fun m!765495 () Bool)

(assert (=> start!70888 m!765495))

(declare-fun m!765497 () Bool)

(assert (=> start!70888 m!765497))

(declare-fun m!765499 () Bool)

(assert (=> b!823359 m!765499))

(declare-fun m!765501 () Bool)

(assert (=> b!823359 m!765501))

(declare-fun m!765503 () Bool)

(assert (=> b!823359 m!765503))

(declare-fun m!765505 () Bool)

(assert (=> b!823358 m!765505))

(declare-fun m!765507 () Bool)

(assert (=> b!823358 m!765507))

(declare-fun m!765509 () Bool)

(assert (=> b!823358 m!765509))

(declare-fun m!765511 () Bool)

(assert (=> b!823358 m!765511))

(declare-fun m!765513 () Bool)

(assert (=> b!823358 m!765513))

(declare-fun m!765515 () Bool)

(assert (=> b!823358 m!765515))

(declare-fun m!765517 () Bool)

(assert (=> b!823358 m!765517))

(assert (=> b!823358 m!765509))

(declare-fun m!765519 () Bool)

(assert (=> b!823361 m!765519))

(check-sat (not b!823362) (not start!70888) (not b_next!13125) b_and!22009 (not mapNonEmpty!23866) (not b!823358) (not b!823361) tp_is_empty!14835 (not b!823359))
(check-sat b_and!22009 (not b_next!13125))
