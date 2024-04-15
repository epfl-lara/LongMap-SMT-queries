; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70568 () Bool)

(assert start!70568)

(declare-fun b_free!12895 () Bool)

(declare-fun b_next!12895 () Bool)

(assert (=> start!70568 (= b_free!12895 (not b_next!12895))))

(declare-fun tp!45421 () Bool)

(declare-fun b_and!21711 () Bool)

(assert (=> start!70568 (= tp!45421 b_and!21711)))

(declare-fun b!819788 () Bool)

(declare-fun res!559449 () Bool)

(declare-fun e!455366 () Bool)

(assert (=> b!819788 (=> (not res!559449) (not e!455366))))

(declare-datatypes ((array!45381 0))(
  ( (array!45382 (arr!21744 (Array (_ BitVec 32) (_ BitVec 64))) (size!22165 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45381)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45381 (_ BitVec 32)) Bool)

(assert (=> b!819788 (= res!559449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819789 () Bool)

(declare-fun e!455369 () Bool)

(assert (=> b!819789 (= e!455366 (not e!455369))))

(declare-fun res!559447 () Bool)

(assert (=> b!819789 (=> res!559447 e!455369)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819789 (= res!559447 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24475 0))(
  ( (V!24476 (val!7350 Int)) )
))
(declare-datatypes ((tuple2!9698 0))(
  ( (tuple2!9699 (_1!4860 (_ BitVec 64)) (_2!4860 V!24475)) )
))
(declare-datatypes ((List!15516 0))(
  ( (Nil!15513) (Cons!15512 (h!16641 tuple2!9698) (t!21838 List!15516)) )
))
(declare-datatypes ((ListLongMap!8511 0))(
  ( (ListLongMap!8512 (toList!4271 List!15516)) )
))
(declare-fun lt!368130 () ListLongMap!8511)

(declare-fun lt!368129 () ListLongMap!8511)

(assert (=> b!819789 (= lt!368130 lt!368129)))

(declare-fun zeroValueBefore!34 () V!24475)

(declare-fun zeroValueAfter!34 () V!24475)

(declare-fun minValue!754 () V!24475)

(declare-datatypes ((ValueCell!6887 0))(
  ( (ValueCellFull!6887 (v!9774 V!24475)) (EmptyCell!6887) )
))
(declare-datatypes ((array!45383 0))(
  ( (array!45384 (arr!21745 (Array (_ BitVec 32) ValueCell!6887)) (size!22166 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45383)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27969 0))(
  ( (Unit!27970) )
))
(declare-fun lt!368127 () Unit!27969)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!417 (array!45381 array!45383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 V!24475 V!24475 (_ BitVec 32) Int) Unit!27969)

(assert (=> b!819789 (= lt!368127 (lemmaNoChangeToArrayThenSameMapNoExtras!417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2324 (array!45381 array!45383 (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 (_ BitVec 32) Int) ListLongMap!8511)

(assert (=> b!819789 (= lt!368129 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819789 (= lt!368130 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819790 () Bool)

(declare-fun e!455367 () Bool)

(declare-fun tp_is_empty!14605 () Bool)

(assert (=> b!819790 (= e!455367 tp_is_empty!14605)))

(declare-fun b!819791 () Bool)

(declare-fun e!455370 () Bool)

(assert (=> b!819791 (= e!455370 tp_is_empty!14605)))

(declare-fun lt!368128 () ListLongMap!8511)

(declare-fun e!455368 () Bool)

(declare-fun b!819792 () Bool)

(declare-fun +!1892 (ListLongMap!8511 tuple2!9698) ListLongMap!8511)

(assert (=> b!819792 (= e!455368 (= lt!368128 (+!1892 lt!368129 (tuple2!9699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!559446 () Bool)

(assert (=> start!70568 (=> (not res!559446) (not e!455366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70568 (= res!559446 (validMask!0 mask!1312))))

(assert (=> start!70568 e!455366))

(assert (=> start!70568 tp_is_empty!14605))

(declare-fun array_inv!17445 (array!45381) Bool)

(assert (=> start!70568 (array_inv!17445 _keys!976)))

(assert (=> start!70568 true))

(declare-fun e!455365 () Bool)

(declare-fun array_inv!17446 (array!45383) Bool)

(assert (=> start!70568 (and (array_inv!17446 _values!788) e!455365)))

(assert (=> start!70568 tp!45421))

(declare-fun mapNonEmpty!23509 () Bool)

(declare-fun mapRes!23509 () Bool)

(declare-fun tp!45420 () Bool)

(assert (=> mapNonEmpty!23509 (= mapRes!23509 (and tp!45420 e!455370))))

(declare-fun mapKey!23509 () (_ BitVec 32))

(declare-fun mapValue!23509 () ValueCell!6887)

(declare-fun mapRest!23509 () (Array (_ BitVec 32) ValueCell!6887))

(assert (=> mapNonEmpty!23509 (= (arr!21745 _values!788) (store mapRest!23509 mapKey!23509 mapValue!23509))))

(declare-fun b!819793 () Bool)

(assert (=> b!819793 (= e!455369 true)))

(declare-fun lt!368125 () tuple2!9698)

(declare-fun lt!368132 () tuple2!9698)

(declare-fun lt!368133 () ListLongMap!8511)

(assert (=> b!819793 (= lt!368133 (+!1892 (+!1892 lt!368129 lt!368125) lt!368132))))

(declare-fun lt!368131 () ListLongMap!8511)

(assert (=> b!819793 (= (+!1892 lt!368130 lt!368132) (+!1892 lt!368131 lt!368132))))

(declare-fun lt!368126 () Unit!27969)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!206 (ListLongMap!8511 (_ BitVec 64) V!24475 V!24475) Unit!27969)

(assert (=> b!819793 (= lt!368126 (addSameAsAddTwiceSameKeyDiffValues!206 lt!368130 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819793 (= lt!368132 (tuple2!9699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819793 e!455368))

(declare-fun res!559445 () Bool)

(assert (=> b!819793 (=> (not res!559445) (not e!455368))))

(declare-fun lt!368124 () ListLongMap!8511)

(assert (=> b!819793 (= res!559445 (= lt!368124 lt!368131))))

(assert (=> b!819793 (= lt!368131 (+!1892 lt!368130 lt!368125))))

(assert (=> b!819793 (= lt!368125 (tuple2!9699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2419 (array!45381 array!45383 (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 (_ BitVec 32) Int) ListLongMap!8511)

(assert (=> b!819793 (= lt!368128 (getCurrentListMap!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819793 (= lt!368124 (getCurrentListMap!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819794 () Bool)

(declare-fun res!559448 () Bool)

(assert (=> b!819794 (=> (not res!559448) (not e!455366))))

(declare-datatypes ((List!15517 0))(
  ( (Nil!15514) (Cons!15513 (h!16642 (_ BitVec 64)) (t!21839 List!15517)) )
))
(declare-fun arrayNoDuplicates!0 (array!45381 (_ BitVec 32) List!15517) Bool)

(assert (=> b!819794 (= res!559448 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15514))))

(declare-fun b!819795 () Bool)

(declare-fun res!559450 () Bool)

(assert (=> b!819795 (=> (not res!559450) (not e!455366))))

(assert (=> b!819795 (= res!559450 (and (= (size!22166 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22165 _keys!976) (size!22166 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23509 () Bool)

(assert (=> mapIsEmpty!23509 mapRes!23509))

(declare-fun b!819796 () Bool)

(assert (=> b!819796 (= e!455365 (and e!455367 mapRes!23509))))

(declare-fun condMapEmpty!23509 () Bool)

(declare-fun mapDefault!23509 () ValueCell!6887)

(assert (=> b!819796 (= condMapEmpty!23509 (= (arr!21745 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6887)) mapDefault!23509)))))

(assert (= (and start!70568 res!559446) b!819795))

(assert (= (and b!819795 res!559450) b!819788))

(assert (= (and b!819788 res!559449) b!819794))

(assert (= (and b!819794 res!559448) b!819789))

(assert (= (and b!819789 (not res!559447)) b!819793))

(assert (= (and b!819793 res!559445) b!819792))

(assert (= (and b!819796 condMapEmpty!23509) mapIsEmpty!23509))

(assert (= (and b!819796 (not condMapEmpty!23509)) mapNonEmpty!23509))

(get-info :version)

(assert (= (and mapNonEmpty!23509 ((_ is ValueCellFull!6887) mapValue!23509)) b!819791))

(assert (= (and b!819796 ((_ is ValueCellFull!6887) mapDefault!23509)) b!819790))

(assert (= start!70568 b!819796))

(declare-fun m!761103 () Bool)

(assert (=> b!819794 m!761103))

(declare-fun m!761105 () Bool)

(assert (=> b!819793 m!761105))

(declare-fun m!761107 () Bool)

(assert (=> b!819793 m!761107))

(declare-fun m!761109 () Bool)

(assert (=> b!819793 m!761109))

(declare-fun m!761111 () Bool)

(assert (=> b!819793 m!761111))

(declare-fun m!761113 () Bool)

(assert (=> b!819793 m!761113))

(assert (=> b!819793 m!761107))

(declare-fun m!761115 () Bool)

(assert (=> b!819793 m!761115))

(declare-fun m!761117 () Bool)

(assert (=> b!819793 m!761117))

(declare-fun m!761119 () Bool)

(assert (=> b!819793 m!761119))

(declare-fun m!761121 () Bool)

(assert (=> b!819789 m!761121))

(declare-fun m!761123 () Bool)

(assert (=> b!819789 m!761123))

(declare-fun m!761125 () Bool)

(assert (=> b!819789 m!761125))

(declare-fun m!761127 () Bool)

(assert (=> b!819792 m!761127))

(declare-fun m!761129 () Bool)

(assert (=> start!70568 m!761129))

(declare-fun m!761131 () Bool)

(assert (=> start!70568 m!761131))

(declare-fun m!761133 () Bool)

(assert (=> start!70568 m!761133))

(declare-fun m!761135 () Bool)

(assert (=> b!819788 m!761135))

(declare-fun m!761137 () Bool)

(assert (=> mapNonEmpty!23509 m!761137))

(check-sat b_and!21711 (not start!70568) (not b!819788) (not b!819792) (not b!819794) (not mapNonEmpty!23509) (not b_next!12895) (not b!819789) tp_is_empty!14605 (not b!819793))
(check-sat b_and!21711 (not b_next!12895))
