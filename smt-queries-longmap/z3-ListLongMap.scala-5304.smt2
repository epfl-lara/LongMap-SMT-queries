; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71194 () Bool)

(assert start!71194)

(declare-fun b_free!13231 () Bool)

(declare-fun b_next!13231 () Bool)

(assert (=> start!71194 (= b_free!13231 (not b_next!13231))))

(declare-fun tp!46446 () Bool)

(declare-fun b_and!22145 () Bool)

(assert (=> start!71194 (= tp!46446 b_and!22145)))

(declare-fun b!825706 () Bool)

(declare-fun e!459543 () Bool)

(declare-fun e!459544 () Bool)

(assert (=> b!825706 (= e!459543 (not e!459544))))

(declare-fun res!562659 () Bool)

(assert (=> b!825706 (=> res!562659 e!459544)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825706 (= res!562659 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24923 0))(
  ( (V!24924 (val!7518 Int)) )
))
(declare-datatypes ((tuple2!9870 0))(
  ( (tuple2!9871 (_1!4946 (_ BitVec 64)) (_2!4946 V!24923)) )
))
(declare-datatypes ((List!15654 0))(
  ( (Nil!15651) (Cons!15650 (h!16785 tuple2!9870) (t!21989 List!15654)) )
))
(declare-datatypes ((ListLongMap!8695 0))(
  ( (ListLongMap!8696 (toList!4363 List!15654)) )
))
(declare-fun lt!372366 () ListLongMap!8695)

(declare-fun lt!372368 () ListLongMap!8695)

(assert (=> b!825706 (= lt!372366 lt!372368)))

(declare-fun zeroValueBefore!34 () V!24923)

(declare-datatypes ((array!46069 0))(
  ( (array!46070 (arr!22077 (Array (_ BitVec 32) (_ BitVec 64))) (size!22497 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46069)

(declare-fun zeroValueAfter!34 () V!24923)

(declare-fun minValue!754 () V!24923)

(declare-datatypes ((ValueCell!7055 0))(
  ( (ValueCellFull!7055 (v!9951 V!24923)) (EmptyCell!7055) )
))
(declare-datatypes ((array!46071 0))(
  ( (array!46072 (arr!22078 (Array (_ BitVec 32) ValueCell!7055)) (size!22498 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46071)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28277 0))(
  ( (Unit!28278) )
))
(declare-fun lt!372365 () Unit!28277)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!533 (array!46069 array!46071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 V!24923 V!24923 (_ BitVec 32) Int) Unit!28277)

(assert (=> b!825706 (= lt!372365 (lemmaNoChangeToArrayThenSameMapNoExtras!533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2445 (array!46069 array!46071 (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 (_ BitVec 32) Int) ListLongMap!8695)

(assert (=> b!825706 (= lt!372368 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825706 (= lt!372366 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825707 () Bool)

(declare-fun res!562660 () Bool)

(assert (=> b!825707 (=> (not res!562660) (not e!459543))))

(declare-datatypes ((List!15655 0))(
  ( (Nil!15652) (Cons!15651 (h!16786 (_ BitVec 64)) (t!21990 List!15655)) )
))
(declare-fun arrayNoDuplicates!0 (array!46069 (_ BitVec 32) List!15655) Bool)

(assert (=> b!825707 (= res!562660 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15652))))

(declare-fun mapIsEmpty!24031 () Bool)

(declare-fun mapRes!24031 () Bool)

(assert (=> mapIsEmpty!24031 mapRes!24031))

(declare-fun b!825708 () Bool)

(declare-fun e!459547 () Bool)

(declare-fun e!459546 () Bool)

(assert (=> b!825708 (= e!459547 (and e!459546 mapRes!24031))))

(declare-fun condMapEmpty!24031 () Bool)

(declare-fun mapDefault!24031 () ValueCell!7055)

(assert (=> b!825708 (= condMapEmpty!24031 (= (arr!22078 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7055)) mapDefault!24031)))))

(declare-fun b!825709 () Bool)

(assert (=> b!825709 (= e!459544 true)))

(declare-fun lt!372367 () ListLongMap!8695)

(declare-fun getCurrentListMap!2490 (array!46069 array!46071 (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 (_ BitVec 32) Int) ListLongMap!8695)

(assert (=> b!825709 (= lt!372367 (getCurrentListMap!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562663 () Bool)

(assert (=> start!71194 (=> (not res!562663) (not e!459543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71194 (= res!562663 (validMask!0 mask!1312))))

(assert (=> start!71194 e!459543))

(declare-fun tp_is_empty!14941 () Bool)

(assert (=> start!71194 tp_is_empty!14941))

(declare-fun array_inv!17647 (array!46069) Bool)

(assert (=> start!71194 (array_inv!17647 _keys!976)))

(assert (=> start!71194 true))

(declare-fun array_inv!17648 (array!46071) Bool)

(assert (=> start!71194 (and (array_inv!17648 _values!788) e!459547)))

(assert (=> start!71194 tp!46446))

(declare-fun mapNonEmpty!24031 () Bool)

(declare-fun tp!46447 () Bool)

(declare-fun e!459542 () Bool)

(assert (=> mapNonEmpty!24031 (= mapRes!24031 (and tp!46447 e!459542))))

(declare-fun mapValue!24031 () ValueCell!7055)

(declare-fun mapKey!24031 () (_ BitVec 32))

(declare-fun mapRest!24031 () (Array (_ BitVec 32) ValueCell!7055))

(assert (=> mapNonEmpty!24031 (= (arr!22078 _values!788) (store mapRest!24031 mapKey!24031 mapValue!24031))))

(declare-fun b!825710 () Bool)

(assert (=> b!825710 (= e!459542 tp_is_empty!14941)))

(declare-fun b!825711 () Bool)

(declare-fun res!562662 () Bool)

(assert (=> b!825711 (=> (not res!562662) (not e!459543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46069 (_ BitVec 32)) Bool)

(assert (=> b!825711 (= res!562662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825712 () Bool)

(assert (=> b!825712 (= e!459546 tp_is_empty!14941)))

(declare-fun b!825713 () Bool)

(declare-fun res!562661 () Bool)

(assert (=> b!825713 (=> (not res!562661) (not e!459543))))

(assert (=> b!825713 (= res!562661 (and (= (size!22498 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22497 _keys!976) (size!22498 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71194 res!562663) b!825713))

(assert (= (and b!825713 res!562661) b!825711))

(assert (= (and b!825711 res!562662) b!825707))

(assert (= (and b!825707 res!562660) b!825706))

(assert (= (and b!825706 (not res!562659)) b!825709))

(assert (= (and b!825708 condMapEmpty!24031) mapIsEmpty!24031))

(assert (= (and b!825708 (not condMapEmpty!24031)) mapNonEmpty!24031))

(get-info :version)

(assert (= (and mapNonEmpty!24031 ((_ is ValueCellFull!7055) mapValue!24031)) b!825710))

(assert (= (and b!825708 ((_ is ValueCellFull!7055) mapDefault!24031)) b!825712))

(assert (= start!71194 b!825708))

(declare-fun m!768119 () Bool)

(assert (=> b!825709 m!768119))

(declare-fun m!768121 () Bool)

(assert (=> b!825706 m!768121))

(declare-fun m!768123 () Bool)

(assert (=> b!825706 m!768123))

(declare-fun m!768125 () Bool)

(assert (=> b!825706 m!768125))

(declare-fun m!768127 () Bool)

(assert (=> start!71194 m!768127))

(declare-fun m!768129 () Bool)

(assert (=> start!71194 m!768129))

(declare-fun m!768131 () Bool)

(assert (=> start!71194 m!768131))

(declare-fun m!768133 () Bool)

(assert (=> mapNonEmpty!24031 m!768133))

(declare-fun m!768135 () Bool)

(assert (=> b!825707 m!768135))

(declare-fun m!768137 () Bool)

(assert (=> b!825711 m!768137))

(check-sat (not b_next!13231) (not start!71194) (not mapNonEmpty!24031) (not b!825706) tp_is_empty!14941 (not b!825709) (not b!825711) (not b!825707) b_and!22145)
(check-sat b_and!22145 (not b_next!13231))
