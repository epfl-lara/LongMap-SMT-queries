; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70748 () Bool)

(assert start!70748)

(declare-fun b_free!12889 () Bool)

(declare-fun b_next!12889 () Bool)

(assert (=> start!70748 (= b_free!12889 (not b_next!12889))))

(declare-fun tp!45402 () Bool)

(declare-fun b_and!21741 () Bool)

(assert (=> start!70748 (= tp!45402 b_and!21741)))

(declare-fun b!820847 () Bool)

(declare-fun e!456035 () Bool)

(declare-fun e!456034 () Bool)

(declare-fun mapRes!23500 () Bool)

(assert (=> b!820847 (= e!456035 (and e!456034 mapRes!23500))))

(declare-fun condMapEmpty!23500 () Bool)

(declare-datatypes ((V!24467 0))(
  ( (V!24468 (val!7347 Int)) )
))
(declare-datatypes ((ValueCell!6884 0))(
  ( (ValueCellFull!6884 (v!9777 V!24467)) (EmptyCell!6884) )
))
(declare-datatypes ((array!45397 0))(
  ( (array!45398 (arr!21747 (Array (_ BitVec 32) ValueCell!6884)) (size!22167 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45397)

(declare-fun mapDefault!23500 () ValueCell!6884)

(assert (=> b!820847 (= condMapEmpty!23500 (= (arr!21747 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6884)) mapDefault!23500)))))

(declare-fun b!820848 () Bool)

(declare-fun e!456031 () Bool)

(declare-fun e!456033 () Bool)

(assert (=> b!820848 (= e!456031 (not e!456033))))

(declare-fun res!559846 () Bool)

(assert (=> b!820848 (=> res!559846 e!456033)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820848 (= res!559846 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9586 0))(
  ( (tuple2!9587 (_1!4804 (_ BitVec 64)) (_2!4804 V!24467)) )
))
(declare-datatypes ((List!15388 0))(
  ( (Nil!15385) (Cons!15384 (h!16519 tuple2!9586) (t!21711 List!15388)) )
))
(declare-datatypes ((ListLongMap!8411 0))(
  ( (ListLongMap!8412 (toList!4221 List!15388)) )
))
(declare-fun lt!368634 () ListLongMap!8411)

(declare-fun lt!368638 () ListLongMap!8411)

(assert (=> b!820848 (= lt!368634 lt!368638)))

(declare-fun zeroValueBefore!34 () V!24467)

(declare-datatypes ((array!45399 0))(
  ( (array!45400 (arr!21748 (Array (_ BitVec 32) (_ BitVec 64))) (size!22168 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45399)

(declare-fun zeroValueAfter!34 () V!24467)

(declare-fun minValue!754 () V!24467)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27992 0))(
  ( (Unit!27993) )
))
(declare-fun lt!368636 () Unit!27992)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!402 (array!45399 array!45397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 V!24467 V!24467 (_ BitVec 32) Int) Unit!27992)

(assert (=> b!820848 (= lt!368636 (lemmaNoChangeToArrayThenSameMapNoExtras!402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2314 (array!45399 array!45397 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8411)

(assert (=> b!820848 (= lt!368638 (getCurrentListMapNoExtraKeys!2314 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820848 (= lt!368634 (getCurrentListMapNoExtraKeys!2314 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820849 () Bool)

(declare-fun res!559847 () Bool)

(assert (=> b!820849 (=> (not res!559847) (not e!456031))))

(declare-datatypes ((List!15389 0))(
  ( (Nil!15386) (Cons!15385 (h!16520 (_ BitVec 64)) (t!21712 List!15389)) )
))
(declare-fun arrayNoDuplicates!0 (array!45399 (_ BitVec 32) List!15389) Bool)

(assert (=> b!820849 (= res!559847 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15386))))

(declare-fun b!820851 () Bool)

(declare-fun lt!368639 () ListLongMap!8411)

(declare-fun e!456032 () Bool)

(declare-fun +!1857 (ListLongMap!8411 tuple2!9586) ListLongMap!8411)

(assert (=> b!820851 (= e!456032 (= lt!368639 (+!1857 lt!368638 (tuple2!9587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820852 () Bool)

(declare-fun res!559843 () Bool)

(assert (=> b!820852 (=> (not res!559843) (not e!456031))))

(assert (=> b!820852 (= res!559843 (and (= (size!22167 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22168 _keys!976) (size!22167 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820853 () Bool)

(declare-fun tp_is_empty!14599 () Bool)

(assert (=> b!820853 (= e!456034 tp_is_empty!14599)))

(declare-fun mapIsEmpty!23500 () Bool)

(assert (=> mapIsEmpty!23500 mapRes!23500))

(declare-fun b!820854 () Bool)

(assert (=> b!820854 (= e!456033 true)))

(declare-fun lt!368637 () tuple2!9586)

(declare-fun lt!368631 () tuple2!9586)

(declare-fun lt!368635 () ListLongMap!8411)

(assert (=> b!820854 (= lt!368635 (+!1857 (+!1857 lt!368638 lt!368631) lt!368637))))

(declare-fun lt!368640 () ListLongMap!8411)

(assert (=> b!820854 (= (+!1857 lt!368634 lt!368637) (+!1857 lt!368640 lt!368637))))

(declare-fun lt!368633 () Unit!27992)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!194 (ListLongMap!8411 (_ BitVec 64) V!24467 V!24467) Unit!27992)

(assert (=> b!820854 (= lt!368633 (addSameAsAddTwiceSameKeyDiffValues!194 lt!368634 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820854 (= lt!368637 (tuple2!9587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820854 e!456032))

(declare-fun res!559848 () Bool)

(assert (=> b!820854 (=> (not res!559848) (not e!456032))))

(declare-fun lt!368632 () ListLongMap!8411)

(assert (=> b!820854 (= res!559848 (= lt!368632 lt!368640))))

(assert (=> b!820854 (= lt!368640 (+!1857 lt!368634 lt!368631))))

(assert (=> b!820854 (= lt!368631 (tuple2!9587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2407 (array!45399 array!45397 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8411)

(assert (=> b!820854 (= lt!368639 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820854 (= lt!368632 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23500 () Bool)

(declare-fun tp!45403 () Bool)

(declare-fun e!456029 () Bool)

(assert (=> mapNonEmpty!23500 (= mapRes!23500 (and tp!45403 e!456029))))

(declare-fun mapRest!23500 () (Array (_ BitVec 32) ValueCell!6884))

(declare-fun mapValue!23500 () ValueCell!6884)

(declare-fun mapKey!23500 () (_ BitVec 32))

(assert (=> mapNonEmpty!23500 (= (arr!21747 _values!788) (store mapRest!23500 mapKey!23500 mapValue!23500))))

(declare-fun b!820855 () Bool)

(declare-fun res!559844 () Bool)

(assert (=> b!820855 (=> (not res!559844) (not e!456031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45399 (_ BitVec 32)) Bool)

(assert (=> b!820855 (= res!559844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559845 () Bool)

(assert (=> start!70748 (=> (not res!559845) (not e!456031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70748 (= res!559845 (validMask!0 mask!1312))))

(assert (=> start!70748 e!456031))

(assert (=> start!70748 tp_is_empty!14599))

(declare-fun array_inv!17413 (array!45399) Bool)

(assert (=> start!70748 (array_inv!17413 _keys!976)))

(assert (=> start!70748 true))

(declare-fun array_inv!17414 (array!45397) Bool)

(assert (=> start!70748 (and (array_inv!17414 _values!788) e!456035)))

(assert (=> start!70748 tp!45402))

(declare-fun b!820850 () Bool)

(assert (=> b!820850 (= e!456029 tp_is_empty!14599)))

(assert (= (and start!70748 res!559845) b!820852))

(assert (= (and b!820852 res!559843) b!820855))

(assert (= (and b!820855 res!559844) b!820849))

(assert (= (and b!820849 res!559847) b!820848))

(assert (= (and b!820848 (not res!559846)) b!820854))

(assert (= (and b!820854 res!559848) b!820851))

(assert (= (and b!820847 condMapEmpty!23500) mapIsEmpty!23500))

(assert (= (and b!820847 (not condMapEmpty!23500)) mapNonEmpty!23500))

(get-info :version)

(assert (= (and mapNonEmpty!23500 ((_ is ValueCellFull!6884) mapValue!23500)) b!820850))

(assert (= (and b!820847 ((_ is ValueCellFull!6884) mapDefault!23500)) b!820853))

(assert (= start!70748 b!820847))

(declare-fun m!763029 () Bool)

(assert (=> start!70748 m!763029))

(declare-fun m!763031 () Bool)

(assert (=> start!70748 m!763031))

(declare-fun m!763033 () Bool)

(assert (=> start!70748 m!763033))

(declare-fun m!763035 () Bool)

(assert (=> b!820851 m!763035))

(declare-fun m!763037 () Bool)

(assert (=> b!820849 m!763037))

(declare-fun m!763039 () Bool)

(assert (=> mapNonEmpty!23500 m!763039))

(declare-fun m!763041 () Bool)

(assert (=> b!820854 m!763041))

(declare-fun m!763043 () Bool)

(assert (=> b!820854 m!763043))

(declare-fun m!763045 () Bool)

(assert (=> b!820854 m!763045))

(declare-fun m!763047 () Bool)

(assert (=> b!820854 m!763047))

(declare-fun m!763049 () Bool)

(assert (=> b!820854 m!763049))

(assert (=> b!820854 m!763043))

(declare-fun m!763051 () Bool)

(assert (=> b!820854 m!763051))

(declare-fun m!763053 () Bool)

(assert (=> b!820854 m!763053))

(declare-fun m!763055 () Bool)

(assert (=> b!820854 m!763055))

(declare-fun m!763057 () Bool)

(assert (=> b!820848 m!763057))

(declare-fun m!763059 () Bool)

(assert (=> b!820848 m!763059))

(declare-fun m!763061 () Bool)

(assert (=> b!820848 m!763061))

(declare-fun m!763063 () Bool)

(assert (=> b!820855 m!763063))

(check-sat tp_is_empty!14599 b_and!21741 (not b_next!12889) (not b!820851) (not b!820854) (not b!820848) (not b!820849) (not b!820855) (not start!70748) (not mapNonEmpty!23500))
(check-sat b_and!21741 (not b_next!12889))
