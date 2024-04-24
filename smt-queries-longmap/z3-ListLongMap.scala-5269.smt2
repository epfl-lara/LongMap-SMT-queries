; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70930 () Bool)

(assert start!70930)

(declare-fun b_free!13021 () Bool)

(declare-fun b_next!13021 () Bool)

(assert (=> start!70930 (= b_free!13021 (not b_next!13021))))

(declare-fun tp!45808 () Bool)

(declare-fun b_and!21903 () Bool)

(assert (=> start!70930 (= tp!45808 b_and!21903)))

(declare-fun b!822813 () Bool)

(declare-fun e!457451 () Bool)

(assert (=> b!822813 (= e!457451 true)))

(declare-fun e!457446 () Bool)

(assert (=> b!822813 e!457446))

(declare-fun res!560972 () Bool)

(assert (=> b!822813 (=> (not res!560972) (not e!457446))))

(declare-datatypes ((V!24643 0))(
  ( (V!24644 (val!7413 Int)) )
))
(declare-datatypes ((tuple2!9702 0))(
  ( (tuple2!9703 (_1!4862 (_ BitVec 64)) (_2!4862 V!24643)) )
))
(declare-datatypes ((List!15492 0))(
  ( (Nil!15489) (Cons!15488 (h!16623 tuple2!9702) (t!21821 List!15492)) )
))
(declare-datatypes ((ListLongMap!8527 0))(
  ( (ListLongMap!8528 (toList!4279 List!15492)) )
))
(declare-fun lt!369851 () ListLongMap!8527)

(declare-fun lt!369850 () tuple2!9702)

(declare-fun lt!369852 () ListLongMap!8527)

(declare-fun +!1870 (ListLongMap!8527 tuple2!9702) ListLongMap!8527)

(assert (=> b!822813 (= res!560972 (= lt!369851 (+!1870 lt!369852 lt!369850)))))

(declare-fun minValue!754 () V!24643)

(assert (=> b!822813 (= lt!369850 (tuple2!9703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45661 0))(
  ( (array!45662 (arr!21876 (Array (_ BitVec 32) (_ BitVec 64))) (size!22296 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45661)

(declare-fun zeroValueAfter!34 () V!24643)

(declare-datatypes ((ValueCell!6950 0))(
  ( (ValueCellFull!6950 (v!9844 V!24643)) (EmptyCell!6950) )
))
(declare-datatypes ((array!45663 0))(
  ( (array!45664 (arr!21877 (Array (_ BitVec 32) ValueCell!6950)) (size!22297 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45663)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!369853 () ListLongMap!8527)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2434 (array!45661 array!45663 (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 (_ BitVec 32) Int) ListLongMap!8527)

(assert (=> b!822813 (= lt!369853 (getCurrentListMap!2434 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24643)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822813 (= lt!369851 (getCurrentListMap!2434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822814 () Bool)

(declare-fun e!457448 () Bool)

(declare-fun tp_is_empty!14731 () Bool)

(assert (=> b!822814 (= e!457448 tp_is_empty!14731)))

(declare-fun mapIsEmpty!23707 () Bool)

(declare-fun mapRes!23707 () Bool)

(assert (=> mapIsEmpty!23707 mapRes!23707))

(declare-fun mapNonEmpty!23707 () Bool)

(declare-fun tp!45807 () Bool)

(declare-fun e!457450 () Bool)

(assert (=> mapNonEmpty!23707 (= mapRes!23707 (and tp!45807 e!457450))))

(declare-fun mapValue!23707 () ValueCell!6950)

(declare-fun mapRest!23707 () (Array (_ BitVec 32) ValueCell!6950))

(declare-fun mapKey!23707 () (_ BitVec 32))

(assert (=> mapNonEmpty!23707 (= (arr!21877 _values!788) (store mapRest!23707 mapKey!23707 mapValue!23707))))

(declare-fun b!822816 () Bool)

(declare-fun e!457445 () Bool)

(assert (=> b!822816 (= e!457445 (not e!457451))))

(declare-fun res!560974 () Bool)

(assert (=> b!822816 (=> res!560974 e!457451)))

(assert (=> b!822816 (= res!560974 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369854 () ListLongMap!8527)

(assert (=> b!822816 (= lt!369852 lt!369854)))

(declare-datatypes ((Unit!28107 0))(
  ( (Unit!28108) )
))
(declare-fun lt!369855 () Unit!28107)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!456 (array!45661 array!45663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 V!24643 V!24643 (_ BitVec 32) Int) Unit!28107)

(assert (=> b!822816 (= lt!369855 (lemmaNoChangeToArrayThenSameMapNoExtras!456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2368 (array!45661 array!45663 (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 (_ BitVec 32) Int) ListLongMap!8527)

(assert (=> b!822816 (= lt!369854 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822816 (= lt!369852 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822817 () Bool)

(assert (=> b!822817 (= e!457446 (= lt!369853 (+!1870 (+!1870 lt!369852 (tuple2!9703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!369850)))))

(declare-fun b!822818 () Bool)

(declare-fun e!457447 () Bool)

(assert (=> b!822818 (= e!457447 (and e!457448 mapRes!23707))))

(declare-fun condMapEmpty!23707 () Bool)

(declare-fun mapDefault!23707 () ValueCell!6950)

(assert (=> b!822818 (= condMapEmpty!23707 (= (arr!21877 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6950)) mapDefault!23707)))))

(declare-fun b!822819 () Bool)

(declare-fun res!560969 () Bool)

(assert (=> b!822819 (=> (not res!560969) (not e!457445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45661 (_ BitVec 32)) Bool)

(assert (=> b!822819 (= res!560969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822820 () Bool)

(declare-fun res!560973 () Bool)

(assert (=> b!822820 (=> (not res!560973) (not e!457445))))

(assert (=> b!822820 (= res!560973 (and (= (size!22297 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22296 _keys!976) (size!22297 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822821 () Bool)

(assert (=> b!822821 (= e!457450 tp_is_empty!14731)))

(declare-fun res!560971 () Bool)

(assert (=> start!70930 (=> (not res!560971) (not e!457445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70930 (= res!560971 (validMask!0 mask!1312))))

(assert (=> start!70930 e!457445))

(assert (=> start!70930 tp_is_empty!14731))

(declare-fun array_inv!17505 (array!45661) Bool)

(assert (=> start!70930 (array_inv!17505 _keys!976)))

(assert (=> start!70930 true))

(declare-fun array_inv!17506 (array!45663) Bool)

(assert (=> start!70930 (and (array_inv!17506 _values!788) e!457447)))

(assert (=> start!70930 tp!45808))

(declare-fun b!822815 () Bool)

(declare-fun res!560970 () Bool)

(assert (=> b!822815 (=> (not res!560970) (not e!457445))))

(declare-datatypes ((List!15493 0))(
  ( (Nil!15490) (Cons!15489 (h!16624 (_ BitVec 64)) (t!21822 List!15493)) )
))
(declare-fun arrayNoDuplicates!0 (array!45661 (_ BitVec 32) List!15493) Bool)

(assert (=> b!822815 (= res!560970 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15490))))

(assert (= (and start!70930 res!560971) b!822820))

(assert (= (and b!822820 res!560973) b!822819))

(assert (= (and b!822819 res!560969) b!822815))

(assert (= (and b!822815 res!560970) b!822816))

(assert (= (and b!822816 (not res!560974)) b!822813))

(assert (= (and b!822813 res!560972) b!822817))

(assert (= (and b!822818 condMapEmpty!23707) mapIsEmpty!23707))

(assert (= (and b!822818 (not condMapEmpty!23707)) mapNonEmpty!23707))

(get-info :version)

(assert (= (and mapNonEmpty!23707 ((_ is ValueCellFull!6950) mapValue!23707)) b!822821))

(assert (= (and b!822818 ((_ is ValueCellFull!6950) mapDefault!23707)) b!822814))

(assert (= start!70930 b!822818))

(declare-fun m!764903 () Bool)

(assert (=> start!70930 m!764903))

(declare-fun m!764905 () Bool)

(assert (=> start!70930 m!764905))

(declare-fun m!764907 () Bool)

(assert (=> start!70930 m!764907))

(declare-fun m!764909 () Bool)

(assert (=> b!822815 m!764909))

(declare-fun m!764911 () Bool)

(assert (=> b!822817 m!764911))

(assert (=> b!822817 m!764911))

(declare-fun m!764913 () Bool)

(assert (=> b!822817 m!764913))

(declare-fun m!764915 () Bool)

(assert (=> mapNonEmpty!23707 m!764915))

(declare-fun m!764917 () Bool)

(assert (=> b!822816 m!764917))

(declare-fun m!764919 () Bool)

(assert (=> b!822816 m!764919))

(declare-fun m!764921 () Bool)

(assert (=> b!822816 m!764921))

(declare-fun m!764923 () Bool)

(assert (=> b!822819 m!764923))

(declare-fun m!764925 () Bool)

(assert (=> b!822813 m!764925))

(declare-fun m!764927 () Bool)

(assert (=> b!822813 m!764927))

(declare-fun m!764929 () Bool)

(assert (=> b!822813 m!764929))

(check-sat (not b!822817) (not b!822815) (not b_next!13021) (not b!822819) (not b!822813) (not b!822816) (not mapNonEmpty!23707) b_and!21903 (not start!70930) tp_is_empty!14731)
(check-sat b_and!21903 (not b_next!13021))
