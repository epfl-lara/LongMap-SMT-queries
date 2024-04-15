; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70780 () Bool)

(assert start!70780)

(declare-fun b_free!13057 () Bool)

(declare-fun b_next!13057 () Bool)

(assert (=> start!70780 (= b_free!13057 (not b_next!13057))))

(declare-fun tp!45915 () Bool)

(declare-fun b_and!21903 () Bool)

(assert (=> start!70780 (= tp!45915 b_and!21903)))

(declare-fun b!822112 () Bool)

(declare-fun e!457052 () Bool)

(declare-fun e!457053 () Bool)

(assert (=> b!822112 (= e!457052 (not e!457053))))

(declare-fun res!560794 () Bool)

(assert (=> b!822112 (=> res!560794 e!457053)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822112 (= res!560794 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24691 0))(
  ( (V!24692 (val!7431 Int)) )
))
(declare-datatypes ((tuple2!9816 0))(
  ( (tuple2!9817 (_1!4919 (_ BitVec 64)) (_2!4919 V!24691)) )
))
(declare-datatypes ((List!15628 0))(
  ( (Nil!15625) (Cons!15624 (h!16753 tuple2!9816) (t!21956 List!15628)) )
))
(declare-datatypes ((ListLongMap!8629 0))(
  ( (ListLongMap!8630 (toList!4330 List!15628)) )
))
(declare-fun lt!369774 () ListLongMap!8629)

(declare-fun lt!369766 () ListLongMap!8629)

(assert (=> b!822112 (= lt!369774 lt!369766)))

(declare-fun zeroValueBefore!34 () V!24691)

(declare-datatypes ((array!45695 0))(
  ( (array!45696 (arr!21898 (Array (_ BitVec 32) (_ BitVec 64))) (size!22319 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45695)

(declare-fun zeroValueAfter!34 () V!24691)

(declare-datatypes ((ValueCell!6968 0))(
  ( (ValueCellFull!6968 (v!9856 V!24691)) (EmptyCell!6968) )
))
(declare-datatypes ((array!45697 0))(
  ( (array!45698 (arr!21899 (Array (_ BitVec 32) ValueCell!6968)) (size!22320 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45697)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28080 0))(
  ( (Unit!28081) )
))
(declare-fun lt!369767 () Unit!28080)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!470 (array!45695 array!45697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 V!24691 V!24691 (_ BitVec 32) Int) Unit!28080)

(assert (=> b!822112 (= lt!369767 (lemmaNoChangeToArrayThenSameMapNoExtras!470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2377 (array!45695 array!45697 (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 (_ BitVec 32) Int) ListLongMap!8629)

(assert (=> b!822112 (= lt!369766 (getCurrentListMapNoExtraKeys!2377 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822112 (= lt!369774 (getCurrentListMapNoExtraKeys!2377 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560795 () Bool)

(assert (=> start!70780 (=> (not res!560795) (not e!457052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70780 (= res!560795 (validMask!0 mask!1312))))

(assert (=> start!70780 e!457052))

(declare-fun tp_is_empty!14767 () Bool)

(assert (=> start!70780 tp_is_empty!14767))

(declare-fun array_inv!17557 (array!45695) Bool)

(assert (=> start!70780 (array_inv!17557 _keys!976)))

(assert (=> start!70780 true))

(declare-fun e!457048 () Bool)

(declare-fun array_inv!17558 (array!45697) Bool)

(assert (=> start!70780 (and (array_inv!17558 _values!788) e!457048)))

(assert (=> start!70780 tp!45915))

(declare-fun b!822113 () Bool)

(declare-fun res!560796 () Bool)

(assert (=> b!822113 (=> (not res!560796) (not e!457052))))

(assert (=> b!822113 (= res!560796 (and (= (size!22320 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22319 _keys!976) (size!22320 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23761 () Bool)

(declare-fun mapRes!23761 () Bool)

(assert (=> mapIsEmpty!23761 mapRes!23761))

(declare-fun mapNonEmpty!23761 () Bool)

(declare-fun tp!45916 () Bool)

(declare-fun e!457050 () Bool)

(assert (=> mapNonEmpty!23761 (= mapRes!23761 (and tp!45916 e!457050))))

(declare-fun mapRest!23761 () (Array (_ BitVec 32) ValueCell!6968))

(declare-fun mapKey!23761 () (_ BitVec 32))

(declare-fun mapValue!23761 () ValueCell!6968)

(assert (=> mapNonEmpty!23761 (= (arr!21899 _values!788) (store mapRest!23761 mapKey!23761 mapValue!23761))))

(declare-fun b!822114 () Bool)

(declare-fun e!457051 () Bool)

(assert (=> b!822114 (= e!457048 (and e!457051 mapRes!23761))))

(declare-fun condMapEmpty!23761 () Bool)

(declare-fun mapDefault!23761 () ValueCell!6968)

(assert (=> b!822114 (= condMapEmpty!23761 (= (arr!21899 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6968)) mapDefault!23761)))))

(declare-fun b!822115 () Bool)

(assert (=> b!822115 (= e!457053 true)))

(declare-fun lt!369771 () ListLongMap!8629)

(declare-fun lt!369765 () ListLongMap!8629)

(declare-fun lt!369769 () tuple2!9816)

(declare-fun +!1910 (ListLongMap!8629 tuple2!9816) ListLongMap!8629)

(assert (=> b!822115 (= lt!369771 (+!1910 lt!369765 lt!369769))))

(declare-fun lt!369768 () Unit!28080)

(declare-fun addCommutativeForDiffKeys!441 (ListLongMap!8629 (_ BitVec 64) V!24691 (_ BitVec 64) V!24691) Unit!28080)

(assert (=> b!822115 (= lt!369768 (addCommutativeForDiffKeys!441 lt!369774 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369772 () ListLongMap!8629)

(assert (=> b!822115 (= lt!369772 lt!369771)))

(declare-fun lt!369773 () tuple2!9816)

(assert (=> b!822115 (= lt!369771 (+!1910 (+!1910 lt!369774 lt!369769) lt!369773))))

(assert (=> b!822115 (= lt!369769 (tuple2!9817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369770 () ListLongMap!8629)

(assert (=> b!822115 (= lt!369770 lt!369765)))

(assert (=> b!822115 (= lt!369765 (+!1910 lt!369774 lt!369773))))

(assert (=> b!822115 (= lt!369773 (tuple2!9817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2452 (array!45695 array!45697 (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 (_ BitVec 32) Int) ListLongMap!8629)

(assert (=> b!822115 (= lt!369772 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822115 (= lt!369770 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822116 () Bool)

(assert (=> b!822116 (= e!457051 tp_is_empty!14767)))

(declare-fun b!822117 () Bool)

(declare-fun res!560798 () Bool)

(assert (=> b!822117 (=> (not res!560798) (not e!457052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45695 (_ BitVec 32)) Bool)

(assert (=> b!822117 (= res!560798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822118 () Bool)

(declare-fun res!560797 () Bool)

(assert (=> b!822118 (=> (not res!560797) (not e!457052))))

(declare-datatypes ((List!15629 0))(
  ( (Nil!15626) (Cons!15625 (h!16754 (_ BitVec 64)) (t!21957 List!15629)) )
))
(declare-fun arrayNoDuplicates!0 (array!45695 (_ BitVec 32) List!15629) Bool)

(assert (=> b!822118 (= res!560797 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15626))))

(declare-fun b!822119 () Bool)

(assert (=> b!822119 (= e!457050 tp_is_empty!14767)))

(assert (= (and start!70780 res!560795) b!822113))

(assert (= (and b!822113 res!560796) b!822117))

(assert (= (and b!822117 res!560798) b!822118))

(assert (= (and b!822118 res!560797) b!822112))

(assert (= (and b!822112 (not res!560794)) b!822115))

(assert (= (and b!822114 condMapEmpty!23761) mapIsEmpty!23761))

(assert (= (and b!822114 (not condMapEmpty!23761)) mapNonEmpty!23761))

(get-info :version)

(assert (= (and mapNonEmpty!23761 ((_ is ValueCellFull!6968) mapValue!23761)) b!822119))

(assert (= (and b!822114 ((_ is ValueCellFull!6968) mapDefault!23761)) b!822116))

(assert (= start!70780 b!822114))

(declare-fun m!763433 () Bool)

(assert (=> b!822112 m!763433))

(declare-fun m!763435 () Bool)

(assert (=> b!822112 m!763435))

(declare-fun m!763437 () Bool)

(assert (=> b!822112 m!763437))

(declare-fun m!763439 () Bool)

(assert (=> start!70780 m!763439))

(declare-fun m!763441 () Bool)

(assert (=> start!70780 m!763441))

(declare-fun m!763443 () Bool)

(assert (=> start!70780 m!763443))

(declare-fun m!763445 () Bool)

(assert (=> b!822117 m!763445))

(declare-fun m!763447 () Bool)

(assert (=> b!822115 m!763447))

(declare-fun m!763449 () Bool)

(assert (=> b!822115 m!763449))

(declare-fun m!763451 () Bool)

(assert (=> b!822115 m!763451))

(declare-fun m!763453 () Bool)

(assert (=> b!822115 m!763453))

(declare-fun m!763455 () Bool)

(assert (=> b!822115 m!763455))

(declare-fun m!763457 () Bool)

(assert (=> b!822115 m!763457))

(assert (=> b!822115 m!763447))

(declare-fun m!763459 () Bool)

(assert (=> b!822115 m!763459))

(declare-fun m!763461 () Bool)

(assert (=> mapNonEmpty!23761 m!763461))

(declare-fun m!763463 () Bool)

(assert (=> b!822118 m!763463))

(check-sat (not mapNonEmpty!23761) (not b_next!13057) (not b!822112) (not b!822117) tp_is_empty!14767 (not b!822118) b_and!21903 (not b!822115) (not start!70780))
(check-sat b_and!21903 (not b_next!13057))
