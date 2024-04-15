; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70004 () Bool)

(assert start!70004)

(declare-fun b_free!12445 () Bool)

(declare-fun b_next!12445 () Bool)

(assert (=> start!70004 (= b_free!12445 (not b_next!12445))))

(declare-fun tp!44050 () Bool)

(declare-fun b_and!21191 () Bool)

(assert (=> start!70004 (= tp!44050 b_and!21191)))

(declare-fun b!813581 () Bool)

(declare-fun e!450873 () Bool)

(declare-fun e!450869 () Bool)

(declare-fun mapRes!22813 () Bool)

(assert (=> b!813581 (= e!450873 (and e!450869 mapRes!22813))))

(declare-fun condMapEmpty!22813 () Bool)

(declare-datatypes ((V!23875 0))(
  ( (V!23876 (val!7125 Int)) )
))
(declare-datatypes ((ValueCell!6662 0))(
  ( (ValueCellFull!6662 (v!9546 V!23875)) (EmptyCell!6662) )
))
(declare-datatypes ((array!44515 0))(
  ( (array!44516 (arr!21318 (Array (_ BitVec 32) ValueCell!6662)) (size!21739 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44515)

(declare-fun mapDefault!22813 () ValueCell!6662)

(assert (=> b!813581 (= condMapEmpty!22813 (= (arr!21318 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6662)) mapDefault!22813)))))

(declare-fun b!813582 () Bool)

(declare-fun tp_is_empty!14155 () Bool)

(assert (=> b!813582 (= e!450869 tp_is_empty!14155)))

(declare-fun b!813584 () Bool)

(declare-fun e!450871 () Bool)

(assert (=> b!813584 (= e!450871 tp_is_empty!14155)))

(declare-fun mapNonEmpty!22813 () Bool)

(declare-fun tp!44049 () Bool)

(assert (=> mapNonEmpty!22813 (= mapRes!22813 (and tp!44049 e!450871))))

(declare-fun mapValue!22813 () ValueCell!6662)

(declare-fun mapRest!22813 () (Array (_ BitVec 32) ValueCell!6662))

(declare-fun mapKey!22813 () (_ BitVec 32))

(assert (=> mapNonEmpty!22813 (= (arr!21318 _values!788) (store mapRest!22813 mapKey!22813 mapValue!22813))))

(declare-fun b!813585 () Bool)

(declare-fun res!555822 () Bool)

(declare-fun e!450872 () Bool)

(assert (=> b!813585 (=> (not res!555822) (not e!450872))))

(declare-datatypes ((array!44517 0))(
  ( (array!44518 (arr!21319 (Array (_ BitVec 32) (_ BitVec 64))) (size!21740 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44517)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813585 (= res!555822 (and (= (size!21739 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21740 _keys!976) (size!21739 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813586 () Bool)

(assert (=> b!813586 (= e!450872 false)))

(declare-fun zeroValueAfter!34 () V!23875)

(declare-fun minValue!754 () V!23875)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9374 0))(
  ( (tuple2!9375 (_1!4698 (_ BitVec 64)) (_2!4698 V!23875)) )
))
(declare-datatypes ((List!15201 0))(
  ( (Nil!15198) (Cons!15197 (h!16326 tuple2!9374) (t!21509 List!15201)) )
))
(declare-datatypes ((ListLongMap!8187 0))(
  ( (ListLongMap!8188 (toList!4109 List!15201)) )
))
(declare-fun lt!364164 () ListLongMap!8187)

(declare-fun getCurrentListMapNoExtraKeys!2174 (array!44517 array!44515 (_ BitVec 32) (_ BitVec 32) V!23875 V!23875 (_ BitVec 32) Int) ListLongMap!8187)

(assert (=> b!813586 (= lt!364164 (getCurrentListMapNoExtraKeys!2174 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364163 () ListLongMap!8187)

(declare-fun zeroValueBefore!34 () V!23875)

(assert (=> b!813586 (= lt!364163 (getCurrentListMapNoExtraKeys!2174 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813583 () Bool)

(declare-fun res!555824 () Bool)

(assert (=> b!813583 (=> (not res!555824) (not e!450872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44517 (_ BitVec 32)) Bool)

(assert (=> b!813583 (= res!555824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555821 () Bool)

(assert (=> start!70004 (=> (not res!555821) (not e!450872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70004 (= res!555821 (validMask!0 mask!1312))))

(assert (=> start!70004 e!450872))

(assert (=> start!70004 tp_is_empty!14155))

(declare-fun array_inv!17151 (array!44517) Bool)

(assert (=> start!70004 (array_inv!17151 _keys!976)))

(assert (=> start!70004 true))

(declare-fun array_inv!17152 (array!44515) Bool)

(assert (=> start!70004 (and (array_inv!17152 _values!788) e!450873)))

(assert (=> start!70004 tp!44050))

(declare-fun b!813587 () Bool)

(declare-fun res!555823 () Bool)

(assert (=> b!813587 (=> (not res!555823) (not e!450872))))

(declare-datatypes ((List!15202 0))(
  ( (Nil!15199) (Cons!15198 (h!16327 (_ BitVec 64)) (t!21510 List!15202)) )
))
(declare-fun arrayNoDuplicates!0 (array!44517 (_ BitVec 32) List!15202) Bool)

(assert (=> b!813587 (= res!555823 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15199))))

(declare-fun mapIsEmpty!22813 () Bool)

(assert (=> mapIsEmpty!22813 mapRes!22813))

(assert (= (and start!70004 res!555821) b!813585))

(assert (= (and b!813585 res!555822) b!813583))

(assert (= (and b!813583 res!555824) b!813587))

(assert (= (and b!813587 res!555823) b!813586))

(assert (= (and b!813581 condMapEmpty!22813) mapIsEmpty!22813))

(assert (= (and b!813581 (not condMapEmpty!22813)) mapNonEmpty!22813))

(get-info :version)

(assert (= (and mapNonEmpty!22813 ((_ is ValueCellFull!6662) mapValue!22813)) b!813584))

(assert (= (and b!813581 ((_ is ValueCellFull!6662) mapDefault!22813)) b!813582))

(assert (= start!70004 b!813581))

(declare-fun m!755013 () Bool)

(assert (=> b!813586 m!755013))

(declare-fun m!755015 () Bool)

(assert (=> b!813586 m!755015))

(declare-fun m!755017 () Bool)

(assert (=> b!813587 m!755017))

(declare-fun m!755019 () Bool)

(assert (=> b!813583 m!755019))

(declare-fun m!755021 () Bool)

(assert (=> mapNonEmpty!22813 m!755021))

(declare-fun m!755023 () Bool)

(assert (=> start!70004 m!755023))

(declare-fun m!755025 () Bool)

(assert (=> start!70004 m!755025))

(declare-fun m!755027 () Bool)

(assert (=> start!70004 m!755027))

(check-sat (not b!813587) tp_is_empty!14155 (not start!70004) (not b_next!12445) (not b!813583) b_and!21191 (not b!813586) (not mapNonEmpty!22813))
(check-sat b_and!21191 (not b_next!12445))
