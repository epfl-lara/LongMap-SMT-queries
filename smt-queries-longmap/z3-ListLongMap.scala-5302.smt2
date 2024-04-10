; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71018 () Bool)

(assert start!71018)

(declare-fun b_free!13221 () Bool)

(declare-fun b_next!13221 () Bool)

(assert (=> start!71018 (= b_free!13221 (not b_next!13221))))

(declare-fun tp!46417 () Bool)

(declare-fun b_and!22125 () Bool)

(assert (=> start!71018 (= tp!46417 b_and!22125)))

(declare-fun b!824692 () Bool)

(declare-fun e!458874 () Bool)

(declare-fun e!458879 () Bool)

(declare-fun mapRes!24016 () Bool)

(assert (=> b!824692 (= e!458874 (and e!458879 mapRes!24016))))

(declare-fun condMapEmpty!24016 () Bool)

(declare-datatypes ((V!24909 0))(
  ( (V!24910 (val!7513 Int)) )
))
(declare-datatypes ((ValueCell!7050 0))(
  ( (ValueCellFull!7050 (v!9946 V!24909)) (EmptyCell!7050) )
))
(declare-datatypes ((array!46050 0))(
  ( (array!46051 (arr!22072 (Array (_ BitVec 32) ValueCell!7050)) (size!22493 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46050)

(declare-fun mapDefault!24016 () ValueCell!7050)

(assert (=> b!824692 (= condMapEmpty!24016 (= (arr!22072 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7050)) mapDefault!24016)))))

(declare-fun b!824693 () Bool)

(declare-fun tp_is_empty!14931 () Bool)

(assert (=> b!824693 (= e!458879 tp_is_empty!14931)))

(declare-fun mapIsEmpty!24016 () Bool)

(assert (=> mapIsEmpty!24016 mapRes!24016))

(declare-fun b!824694 () Bool)

(declare-fun res!562242 () Bool)

(declare-fun e!458876 () Bool)

(assert (=> b!824694 (=> (not res!562242) (not e!458876))))

(declare-datatypes ((array!46052 0))(
  ( (array!46053 (arr!22073 (Array (_ BitVec 32) (_ BitVec 64))) (size!22494 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46052)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46052 (_ BitVec 32)) Bool)

(assert (=> b!824694 (= res!562242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562238 () Bool)

(assert (=> start!71018 (=> (not res!562238) (not e!458876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71018 (= res!562238 (validMask!0 mask!1312))))

(assert (=> start!71018 e!458876))

(assert (=> start!71018 tp_is_empty!14931))

(declare-fun array_inv!17609 (array!46052) Bool)

(assert (=> start!71018 (array_inv!17609 _keys!976)))

(assert (=> start!71018 true))

(declare-fun array_inv!17610 (array!46050) Bool)

(assert (=> start!71018 (and (array_inv!17610 _values!788) e!458874)))

(assert (=> start!71018 tp!46417))

(declare-fun b!824695 () Bool)

(declare-fun e!458877 () Bool)

(assert (=> b!824695 (= e!458877 true)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24909)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24909)

(declare-datatypes ((tuple2!9944 0))(
  ( (tuple2!9945 (_1!4983 (_ BitVec 64)) (_2!4983 V!24909)) )
))
(declare-datatypes ((List!15753 0))(
  ( (Nil!15750) (Cons!15749 (h!16878 tuple2!9944) (t!22096 List!15753)) )
))
(declare-datatypes ((ListLongMap!8767 0))(
  ( (ListLongMap!8768 (toList!4399 List!15753)) )
))
(declare-fun lt!371951 () ListLongMap!8767)

(declare-fun getCurrentListMap!2538 (array!46052 array!46050 (_ BitVec 32) (_ BitVec 32) V!24909 V!24909 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!824695 (= lt!371951 (getCurrentListMap!2538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24016 () Bool)

(declare-fun tp!46416 () Bool)

(declare-fun e!458878 () Bool)

(assert (=> mapNonEmpty!24016 (= mapRes!24016 (and tp!46416 e!458878))))

(declare-fun mapRest!24016 () (Array (_ BitVec 32) ValueCell!7050))

(declare-fun mapKey!24016 () (_ BitVec 32))

(declare-fun mapValue!24016 () ValueCell!7050)

(assert (=> mapNonEmpty!24016 (= (arr!22072 _values!788) (store mapRest!24016 mapKey!24016 mapValue!24016))))

(declare-fun b!824696 () Bool)

(assert (=> b!824696 (= e!458878 tp_is_empty!14931)))

(declare-fun b!824697 () Bool)

(assert (=> b!824697 (= e!458876 (not e!458877))))

(declare-fun res!562241 () Bool)

(assert (=> b!824697 (=> res!562241 e!458877)))

(assert (=> b!824697 (= res!562241 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371954 () ListLongMap!8767)

(declare-fun lt!371952 () ListLongMap!8767)

(assert (=> b!824697 (= lt!371954 lt!371952)))

(declare-fun zeroValueAfter!34 () V!24909)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28262 0))(
  ( (Unit!28263) )
))
(declare-fun lt!371953 () Unit!28262)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!522 (array!46052 array!46050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24909 V!24909 V!24909 V!24909 (_ BitVec 32) Int) Unit!28262)

(assert (=> b!824697 (= lt!371953 (lemmaNoChangeToArrayThenSameMapNoExtras!522 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2412 (array!46052 array!46050 (_ BitVec 32) (_ BitVec 32) V!24909 V!24909 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!824697 (= lt!371952 (getCurrentListMapNoExtraKeys!2412 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824697 (= lt!371954 (getCurrentListMapNoExtraKeys!2412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824698 () Bool)

(declare-fun res!562240 () Bool)

(assert (=> b!824698 (=> (not res!562240) (not e!458876))))

(declare-datatypes ((List!15754 0))(
  ( (Nil!15751) (Cons!15750 (h!16879 (_ BitVec 64)) (t!22097 List!15754)) )
))
(declare-fun arrayNoDuplicates!0 (array!46052 (_ BitVec 32) List!15754) Bool)

(assert (=> b!824698 (= res!562240 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15751))))

(declare-fun b!824699 () Bool)

(declare-fun res!562239 () Bool)

(assert (=> b!824699 (=> (not res!562239) (not e!458876))))

(assert (=> b!824699 (= res!562239 (and (= (size!22493 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22494 _keys!976) (size!22493 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71018 res!562238) b!824699))

(assert (= (and b!824699 res!562239) b!824694))

(assert (= (and b!824694 res!562242) b!824698))

(assert (= (and b!824698 res!562240) b!824697))

(assert (= (and b!824697 (not res!562241)) b!824695))

(assert (= (and b!824692 condMapEmpty!24016) mapIsEmpty!24016))

(assert (= (and b!824692 (not condMapEmpty!24016)) mapNonEmpty!24016))

(get-info :version)

(assert (= (and mapNonEmpty!24016 ((_ is ValueCellFull!7050) mapValue!24016)) b!824696))

(assert (= (and b!824692 ((_ is ValueCellFull!7050) mapDefault!24016)) b!824693))

(assert (= start!71018 b!824692))

(declare-fun m!766737 () Bool)

(assert (=> b!824695 m!766737))

(declare-fun m!766739 () Bool)

(assert (=> mapNonEmpty!24016 m!766739))

(declare-fun m!766741 () Bool)

(assert (=> b!824698 m!766741))

(declare-fun m!766743 () Bool)

(assert (=> b!824694 m!766743))

(declare-fun m!766745 () Bool)

(assert (=> b!824697 m!766745))

(declare-fun m!766747 () Bool)

(assert (=> b!824697 m!766747))

(declare-fun m!766749 () Bool)

(assert (=> b!824697 m!766749))

(declare-fun m!766751 () Bool)

(assert (=> start!71018 m!766751))

(declare-fun m!766753 () Bool)

(assert (=> start!71018 m!766753))

(declare-fun m!766755 () Bool)

(assert (=> start!71018 m!766755))

(check-sat tp_is_empty!14931 (not b_next!13221) (not b!824695) (not b!824697) (not mapNonEmpty!24016) (not start!71018) (not b!824698) (not b!824694) b_and!22125)
(check-sat b_and!22125 (not b_next!13221))
