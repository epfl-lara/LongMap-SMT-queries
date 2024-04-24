; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70754 () Bool)

(assert start!70754)

(declare-fun b_free!12895 () Bool)

(declare-fun b_next!12895 () Bool)

(assert (=> start!70754 (= b_free!12895 (not b_next!12895))))

(declare-fun tp!45421 () Bool)

(declare-fun b_and!21747 () Bool)

(assert (=> start!70754 (= tp!45421 b_and!21747)))

(declare-fun b!820928 () Bool)

(declare-fun e!456097 () Bool)

(declare-fun tp_is_empty!14605 () Bool)

(assert (=> b!820928 (= e!456097 tp_is_empty!14605)))

(declare-fun b!820929 () Bool)

(declare-fun e!456093 () Bool)

(declare-fun e!456096 () Bool)

(assert (=> b!820929 (= e!456093 (not e!456096))))

(declare-fun res!559897 () Bool)

(assert (=> b!820929 (=> res!559897 e!456096)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820929 (= res!559897 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24475 0))(
  ( (V!24476 (val!7350 Int)) )
))
(declare-datatypes ((tuple2!9592 0))(
  ( (tuple2!9593 (_1!4807 (_ BitVec 64)) (_2!4807 V!24475)) )
))
(declare-datatypes ((List!15392 0))(
  ( (Nil!15389) (Cons!15388 (h!16523 tuple2!9592) (t!21715 List!15392)) )
))
(declare-datatypes ((ListLongMap!8417 0))(
  ( (ListLongMap!8418 (toList!4224 List!15392)) )
))
(declare-fun lt!368722 () ListLongMap!8417)

(declare-fun lt!368728 () ListLongMap!8417)

(assert (=> b!820929 (= lt!368722 lt!368728)))

(declare-fun zeroValueBefore!34 () V!24475)

(declare-datatypes ((array!45409 0))(
  ( (array!45410 (arr!21753 (Array (_ BitVec 32) (_ BitVec 64))) (size!22173 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45409)

(declare-fun zeroValueAfter!34 () V!24475)

(declare-fun minValue!754 () V!24475)

(declare-datatypes ((ValueCell!6887 0))(
  ( (ValueCellFull!6887 (v!9780 V!24475)) (EmptyCell!6887) )
))
(declare-datatypes ((array!45411 0))(
  ( (array!45412 (arr!21754 (Array (_ BitVec 32) ValueCell!6887)) (size!22174 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45411)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27998 0))(
  ( (Unit!27999) )
))
(declare-fun lt!368727 () Unit!27998)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!404 (array!45409 array!45411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 V!24475 V!24475 (_ BitVec 32) Int) Unit!27998)

(assert (=> b!820929 (= lt!368727 (lemmaNoChangeToArrayThenSameMapNoExtras!404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2316 (array!45409 array!45411 (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 (_ BitVec 32) Int) ListLongMap!8417)

(assert (=> b!820929 (= lt!368728 (getCurrentListMapNoExtraKeys!2316 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820929 (= lt!368722 (getCurrentListMapNoExtraKeys!2316 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23509 () Bool)

(declare-fun mapRes!23509 () Bool)

(assert (=> mapIsEmpty!23509 mapRes!23509))

(declare-fun b!820930 () Bool)

(assert (=> b!820930 (= e!456096 true)))

(declare-fun lt!368729 () tuple2!9592)

(declare-fun lt!368724 () ListLongMap!8417)

(declare-fun lt!368725 () tuple2!9592)

(declare-fun +!1860 (ListLongMap!8417 tuple2!9592) ListLongMap!8417)

(assert (=> b!820930 (= lt!368724 (+!1860 (+!1860 lt!368728 lt!368729) lt!368725))))

(declare-fun lt!368723 () ListLongMap!8417)

(assert (=> b!820930 (= (+!1860 lt!368722 lt!368725) (+!1860 lt!368723 lt!368725))))

(declare-fun lt!368721 () Unit!27998)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!196 (ListLongMap!8417 (_ BitVec 64) V!24475 V!24475) Unit!27998)

(assert (=> b!820930 (= lt!368721 (addSameAsAddTwiceSameKeyDiffValues!196 lt!368722 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820930 (= lt!368725 (tuple2!9593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!456092 () Bool)

(assert (=> b!820930 e!456092))

(declare-fun res!559902 () Bool)

(assert (=> b!820930 (=> (not res!559902) (not e!456092))))

(declare-fun lt!368730 () ListLongMap!8417)

(assert (=> b!820930 (= res!559902 (= lt!368730 lt!368723))))

(assert (=> b!820930 (= lt!368723 (+!1860 lt!368722 lt!368729))))

(assert (=> b!820930 (= lt!368729 (tuple2!9593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!368726 () ListLongMap!8417)

(declare-fun getCurrentListMap!2409 (array!45409 array!45411 (_ BitVec 32) (_ BitVec 32) V!24475 V!24475 (_ BitVec 32) Int) ListLongMap!8417)

(assert (=> b!820930 (= lt!368726 (getCurrentListMap!2409 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820930 (= lt!368730 (getCurrentListMap!2409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559901 () Bool)

(assert (=> start!70754 (=> (not res!559901) (not e!456093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70754 (= res!559901 (validMask!0 mask!1312))))

(assert (=> start!70754 e!456093))

(assert (=> start!70754 tp_is_empty!14605))

(declare-fun array_inv!17415 (array!45409) Bool)

(assert (=> start!70754 (array_inv!17415 _keys!976)))

(assert (=> start!70754 true))

(declare-fun e!456098 () Bool)

(declare-fun array_inv!17416 (array!45411) Bool)

(assert (=> start!70754 (and (array_inv!17416 _values!788) e!456098)))

(assert (=> start!70754 tp!45421))

(declare-fun b!820931 () Bool)

(assert (=> b!820931 (= e!456098 (and e!456097 mapRes!23509))))

(declare-fun condMapEmpty!23509 () Bool)

(declare-fun mapDefault!23509 () ValueCell!6887)

(assert (=> b!820931 (= condMapEmpty!23509 (= (arr!21754 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6887)) mapDefault!23509)))))

(declare-fun b!820932 () Bool)

(declare-fun e!456094 () Bool)

(assert (=> b!820932 (= e!456094 tp_is_empty!14605)))

(declare-fun b!820933 () Bool)

(declare-fun res!559900 () Bool)

(assert (=> b!820933 (=> (not res!559900) (not e!456093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45409 (_ BitVec 32)) Bool)

(assert (=> b!820933 (= res!559900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820934 () Bool)

(declare-fun res!559898 () Bool)

(assert (=> b!820934 (=> (not res!559898) (not e!456093))))

(assert (=> b!820934 (= res!559898 (and (= (size!22174 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22173 _keys!976) (size!22174 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23509 () Bool)

(declare-fun tp!45420 () Bool)

(assert (=> mapNonEmpty!23509 (= mapRes!23509 (and tp!45420 e!456094))))

(declare-fun mapRest!23509 () (Array (_ BitVec 32) ValueCell!6887))

(declare-fun mapValue!23509 () ValueCell!6887)

(declare-fun mapKey!23509 () (_ BitVec 32))

(assert (=> mapNonEmpty!23509 (= (arr!21754 _values!788) (store mapRest!23509 mapKey!23509 mapValue!23509))))

(declare-fun b!820935 () Bool)

(declare-fun res!559899 () Bool)

(assert (=> b!820935 (=> (not res!559899) (not e!456093))))

(declare-datatypes ((List!15393 0))(
  ( (Nil!15390) (Cons!15389 (h!16524 (_ BitVec 64)) (t!21716 List!15393)) )
))
(declare-fun arrayNoDuplicates!0 (array!45409 (_ BitVec 32) List!15393) Bool)

(assert (=> b!820935 (= res!559899 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15390))))

(declare-fun b!820936 () Bool)

(assert (=> b!820936 (= e!456092 (= lt!368726 (+!1860 lt!368728 (tuple2!9593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70754 res!559901) b!820934))

(assert (= (and b!820934 res!559898) b!820933))

(assert (= (and b!820933 res!559900) b!820935))

(assert (= (and b!820935 res!559899) b!820929))

(assert (= (and b!820929 (not res!559897)) b!820930))

(assert (= (and b!820930 res!559902) b!820936))

(assert (= (and b!820931 condMapEmpty!23509) mapIsEmpty!23509))

(assert (= (and b!820931 (not condMapEmpty!23509)) mapNonEmpty!23509))

(get-info :version)

(assert (= (and mapNonEmpty!23509 ((_ is ValueCellFull!6887) mapValue!23509)) b!820932))

(assert (= (and b!820931 ((_ is ValueCellFull!6887) mapDefault!23509)) b!820928))

(assert (= start!70754 b!820931))

(declare-fun m!763137 () Bool)

(assert (=> mapNonEmpty!23509 m!763137))

(declare-fun m!763139 () Bool)

(assert (=> b!820929 m!763139))

(declare-fun m!763141 () Bool)

(assert (=> b!820929 m!763141))

(declare-fun m!763143 () Bool)

(assert (=> b!820929 m!763143))

(declare-fun m!763145 () Bool)

(assert (=> start!70754 m!763145))

(declare-fun m!763147 () Bool)

(assert (=> start!70754 m!763147))

(declare-fun m!763149 () Bool)

(assert (=> start!70754 m!763149))

(declare-fun m!763151 () Bool)

(assert (=> b!820936 m!763151))

(declare-fun m!763153 () Bool)

(assert (=> b!820933 m!763153))

(declare-fun m!763155 () Bool)

(assert (=> b!820930 m!763155))

(declare-fun m!763157 () Bool)

(assert (=> b!820930 m!763157))

(declare-fun m!763159 () Bool)

(assert (=> b!820930 m!763159))

(assert (=> b!820930 m!763155))

(declare-fun m!763161 () Bool)

(assert (=> b!820930 m!763161))

(declare-fun m!763163 () Bool)

(assert (=> b!820930 m!763163))

(declare-fun m!763165 () Bool)

(assert (=> b!820930 m!763165))

(declare-fun m!763167 () Bool)

(assert (=> b!820930 m!763167))

(declare-fun m!763169 () Bool)

(assert (=> b!820930 m!763169))

(declare-fun m!763171 () Bool)

(assert (=> b!820935 m!763171))

(check-sat (not b_next!12895) (not mapNonEmpty!23509) (not b!820933) (not start!70754) b_and!21747 (not b!820929) (not b!820930) tp_is_empty!14605 (not b!820936) (not b!820935))
(check-sat b_and!21747 (not b_next!12895))
