; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70262 () Bool)

(assert start!70262)

(declare-fun b_free!12517 () Bool)

(declare-fun b_next!12517 () Bool)

(assert (=> start!70262 (= b_free!12517 (not b_next!12517))))

(declare-fun tp!44266 () Bool)

(declare-fun b_and!21299 () Bool)

(assert (=> start!70262 (= tp!44266 b_and!21299)))

(declare-fun res!556707 () Bool)

(declare-fun e!452139 () Bool)

(assert (=> start!70262 (=> (not res!556707) (not e!452139))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70262 (= res!556707 (validMask!0 mask!1312))))

(assert (=> start!70262 e!452139))

(declare-fun tp_is_empty!14227 () Bool)

(assert (=> start!70262 tp_is_empty!14227))

(declare-datatypes ((array!44655 0))(
  ( (array!44656 (arr!21383 (Array (_ BitVec 32) (_ BitVec 64))) (size!21803 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44655)

(declare-fun array_inv!17161 (array!44655) Bool)

(assert (=> start!70262 (array_inv!17161 _keys!976)))

(assert (=> start!70262 true))

(declare-datatypes ((V!23971 0))(
  ( (V!23972 (val!7161 Int)) )
))
(declare-datatypes ((ValueCell!6698 0))(
  ( (ValueCellFull!6698 (v!9588 V!23971)) (EmptyCell!6698) )
))
(declare-datatypes ((array!44657 0))(
  ( (array!44658 (arr!21384 (Array (_ BitVec 32) ValueCell!6698)) (size!21804 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44657)

(declare-fun e!452137 () Bool)

(declare-fun array_inv!17162 (array!44657) Bool)

(assert (=> start!70262 (and (array_inv!17162 _values!788) e!452137)))

(assert (=> start!70262 tp!44266))

(declare-fun b!815477 () Bool)

(declare-fun res!556705 () Bool)

(assert (=> b!815477 (=> (not res!556705) (not e!452139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44655 (_ BitVec 32)) Bool)

(assert (=> b!815477 (= res!556705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22921 () Bool)

(declare-fun mapRes!22921 () Bool)

(assert (=> mapIsEmpty!22921 mapRes!22921))

(declare-fun mapNonEmpty!22921 () Bool)

(declare-fun tp!44265 () Bool)

(declare-fun e!452141 () Bool)

(assert (=> mapNonEmpty!22921 (= mapRes!22921 (and tp!44265 e!452141))))

(declare-fun mapRest!22921 () (Array (_ BitVec 32) ValueCell!6698))

(declare-fun mapValue!22921 () ValueCell!6698)

(declare-fun mapKey!22921 () (_ BitVec 32))

(assert (=> mapNonEmpty!22921 (= (arr!21384 _values!788) (store mapRest!22921 mapKey!22921 mapValue!22921))))

(declare-fun b!815478 () Bool)

(assert (=> b!815478 (= e!452141 tp_is_empty!14227)))

(declare-fun b!815479 () Bool)

(assert (=> b!815479 (= e!452139 (not true))))

(declare-datatypes ((tuple2!9302 0))(
  ( (tuple2!9303 (_1!4662 (_ BitVec 64)) (_2!4662 V!23971)) )
))
(declare-datatypes ((List!15120 0))(
  ( (Nil!15117) (Cons!15116 (h!16251 tuple2!9302) (t!21429 List!15120)) )
))
(declare-datatypes ((ListLongMap!8127 0))(
  ( (ListLongMap!8128 (toList!4079 List!15120)) )
))
(declare-fun lt!365033 () ListLongMap!8127)

(declare-fun lt!365032 () ListLongMap!8127)

(assert (=> b!815479 (= lt!365033 lt!365032)))

(declare-fun zeroValueBefore!34 () V!23971)

(declare-datatypes ((Unit!27725 0))(
  ( (Unit!27726) )
))
(declare-fun lt!365034 () Unit!27725)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23971)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!23971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!274 (array!44655 array!44657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23971 V!23971 V!23971 V!23971 (_ BitVec 32) Int) Unit!27725)

(assert (=> b!815479 (= lt!365034 (lemmaNoChangeToArrayThenSameMapNoExtras!274 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2186 (array!44655 array!44657 (_ BitVec 32) (_ BitVec 32) V!23971 V!23971 (_ BitVec 32) Int) ListLongMap!8127)

(assert (=> b!815479 (= lt!365032 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815479 (= lt!365033 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815480 () Bool)

(declare-fun res!556708 () Bool)

(assert (=> b!815480 (=> (not res!556708) (not e!452139))))

(declare-datatypes ((List!15121 0))(
  ( (Nil!15118) (Cons!15117 (h!16252 (_ BitVec 64)) (t!21430 List!15121)) )
))
(declare-fun arrayNoDuplicates!0 (array!44655 (_ BitVec 32) List!15121) Bool)

(assert (=> b!815480 (= res!556708 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15118))))

(declare-fun b!815481 () Bool)

(declare-fun e!452140 () Bool)

(assert (=> b!815481 (= e!452140 tp_is_empty!14227)))

(declare-fun b!815482 () Bool)

(assert (=> b!815482 (= e!452137 (and e!452140 mapRes!22921))))

(declare-fun condMapEmpty!22921 () Bool)

(declare-fun mapDefault!22921 () ValueCell!6698)

(assert (=> b!815482 (= condMapEmpty!22921 (= (arr!21384 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6698)) mapDefault!22921)))))

(declare-fun b!815483 () Bool)

(declare-fun res!556706 () Bool)

(assert (=> b!815483 (=> (not res!556706) (not e!452139))))

(assert (=> b!815483 (= res!556706 (and (= (size!21804 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21803 _keys!976) (size!21804 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70262 res!556707) b!815483))

(assert (= (and b!815483 res!556706) b!815477))

(assert (= (and b!815477 res!556705) b!815480))

(assert (= (and b!815480 res!556708) b!815479))

(assert (= (and b!815482 condMapEmpty!22921) mapIsEmpty!22921))

(assert (= (and b!815482 (not condMapEmpty!22921)) mapNonEmpty!22921))

(get-info :version)

(assert (= (and mapNonEmpty!22921 ((_ is ValueCellFull!6698) mapValue!22921)) b!815478))

(assert (= (and b!815482 ((_ is ValueCellFull!6698) mapDefault!22921)) b!815481))

(assert (= start!70262 b!815482))

(declare-fun m!757659 () Bool)

(assert (=> b!815480 m!757659))

(declare-fun m!757661 () Bool)

(assert (=> b!815479 m!757661))

(declare-fun m!757663 () Bool)

(assert (=> b!815479 m!757663))

(declare-fun m!757665 () Bool)

(assert (=> b!815479 m!757665))

(declare-fun m!757667 () Bool)

(assert (=> start!70262 m!757667))

(declare-fun m!757669 () Bool)

(assert (=> start!70262 m!757669))

(declare-fun m!757671 () Bool)

(assert (=> start!70262 m!757671))

(declare-fun m!757673 () Bool)

(assert (=> b!815477 m!757673))

(declare-fun m!757675 () Bool)

(assert (=> mapNonEmpty!22921 m!757675))

(check-sat (not start!70262) (not b!815479) tp_is_empty!14227 (not mapNonEmpty!22921) (not b_next!12517) (not b!815477) b_and!21299 (not b!815480))
(check-sat b_and!21299 (not b_next!12517))
