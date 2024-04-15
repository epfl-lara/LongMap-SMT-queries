; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93914 () Bool)

(assert start!93914)

(declare-fun b_free!21379 () Bool)

(declare-fun b_next!21379 () Bool)

(assert (=> start!93914 (= b_free!21379 (not b_next!21379))))

(declare-fun tp!75563 () Bool)

(declare-fun b_and!34075 () Bool)

(assert (=> start!93914 (= tp!75563 b_and!34075)))

(declare-fun res!709199 () Bool)

(declare-fun e!604909 () Bool)

(assert (=> start!93914 (=> (not res!709199) (not e!604909))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93914 (= res!709199 (validMask!0 mask!1515))))

(assert (=> start!93914 e!604909))

(assert (=> start!93914 true))

(declare-fun tp_is_empty!25189 () Bool)

(assert (=> start!93914 tp_is_empty!25189))

(declare-datatypes ((V!38721 0))(
  ( (V!38722 (val!12645 Int)) )
))
(declare-datatypes ((ValueCell!11891 0))(
  ( (ValueCellFull!11891 (v!15254 V!38721)) (EmptyCell!11891) )
))
(declare-datatypes ((array!67328 0))(
  ( (array!67329 (arr!32371 (Array (_ BitVec 32) ValueCell!11891)) (size!32909 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67328)

(declare-fun e!604907 () Bool)

(declare-fun array_inv!25080 (array!67328) Bool)

(assert (=> start!93914 (and (array_inv!25080 _values!955) e!604907)))

(assert (=> start!93914 tp!75563))

(declare-datatypes ((array!67330 0))(
  ( (array!67331 (arr!32372 (Array (_ BitVec 32) (_ BitVec 64))) (size!32910 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67330)

(declare-fun array_inv!25081 (array!67330) Bool)

(assert (=> start!93914 (array_inv!25081 _keys!1163)))

(declare-fun mapNonEmpty!39457 () Bool)

(declare-fun mapRes!39457 () Bool)

(declare-fun tp!75562 () Bool)

(declare-fun e!604905 () Bool)

(assert (=> mapNonEmpty!39457 (= mapRes!39457 (and tp!75562 e!604905))))

(declare-fun mapValue!39457 () ValueCell!11891)

(declare-fun mapKey!39457 () (_ BitVec 32))

(declare-fun mapRest!39457 () (Array (_ BitVec 32) ValueCell!11891))

(assert (=> mapNonEmpty!39457 (= (arr!32371 _values!955) (store mapRest!39457 mapKey!39457 mapValue!39457))))

(declare-fun b!1062040 () Bool)

(declare-fun e!604903 () Bool)

(assert (=> b!1062040 (= e!604909 (not e!604903))))

(declare-fun res!709194 () Bool)

(assert (=> b!1062040 (=> res!709194 e!604903)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062040 (= res!709194 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16062 0))(
  ( (tuple2!16063 (_1!8042 (_ BitVec 64)) (_2!8042 V!38721)) )
))
(declare-datatypes ((List!22615 0))(
  ( (Nil!22612) (Cons!22611 (h!23820 tuple2!16062) (t!31917 List!22615)) )
))
(declare-datatypes ((ListLongMap!14031 0))(
  ( (ListLongMap!14032 (toList!7031 List!22615)) )
))
(declare-fun lt!467762 () ListLongMap!14031)

(declare-fun lt!467766 () ListLongMap!14031)

(assert (=> b!1062040 (= lt!467762 lt!467766)))

(declare-fun zeroValueBefore!47 () V!38721)

(declare-datatypes ((Unit!34653 0))(
  ( (Unit!34654) )
))
(declare-fun lt!467763 () Unit!34653)

(declare-fun minValue!907 () V!38721)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38721)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!638 (array!67330 array!67328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 V!38721 V!38721 (_ BitVec 32) Int) Unit!34653)

(assert (=> b!1062040 (= lt!467763 (lemmaNoChangeToArrayThenSameMapNoExtras!638 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3644 (array!67330 array!67328 (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 (_ BitVec 32) Int) ListLongMap!14031)

(assert (=> b!1062040 (= lt!467766 (getCurrentListMapNoExtraKeys!3644 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062040 (= lt!467762 (getCurrentListMapNoExtraKeys!3644 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062041 () Bool)

(declare-fun e!604908 () Bool)

(assert (=> b!1062041 (= e!604908 tp_is_empty!25189)))

(declare-fun b!1062042 () Bool)

(declare-fun res!709198 () Bool)

(assert (=> b!1062042 (=> (not res!709198) (not e!604909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67330 (_ BitVec 32)) Bool)

(assert (=> b!1062042 (= res!709198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39457 () Bool)

(assert (=> mapIsEmpty!39457 mapRes!39457))

(declare-fun b!1062043 () Bool)

(assert (=> b!1062043 (= e!604905 tp_is_empty!25189)))

(declare-fun b!1062044 () Bool)

(declare-fun res!709197 () Bool)

(assert (=> b!1062044 (=> (not res!709197) (not e!604909))))

(assert (=> b!1062044 (= res!709197 (and (= (size!32909 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32910 _keys!1163) (size!32909 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062045 () Bool)

(assert (=> b!1062045 (= e!604907 (and e!604908 mapRes!39457))))

(declare-fun condMapEmpty!39457 () Bool)

(declare-fun mapDefault!39457 () ValueCell!11891)

(assert (=> b!1062045 (= condMapEmpty!39457 (= (arr!32371 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11891)) mapDefault!39457)))))

(declare-fun b!1062046 () Bool)

(declare-fun e!604904 () Bool)

(assert (=> b!1062046 (= e!604903 e!604904)))

(declare-fun res!709195 () Bool)

(assert (=> b!1062046 (=> res!709195 e!604904)))

(declare-fun lt!467764 () ListLongMap!14031)

(declare-fun contains!6201 (ListLongMap!14031 (_ BitVec 64)) Bool)

(assert (=> b!1062046 (= res!709195 (contains!6201 lt!467764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3933 (array!67330 array!67328 (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 (_ BitVec 32) Int) ListLongMap!14031)

(assert (=> b!1062046 (= lt!467764 (getCurrentListMap!3933 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062047 () Bool)

(declare-fun res!709196 () Bool)

(assert (=> b!1062047 (=> (not res!709196) (not e!604909))))

(declare-datatypes ((List!22616 0))(
  ( (Nil!22613) (Cons!22612 (h!23821 (_ BitVec 64)) (t!31918 List!22616)) )
))
(declare-fun arrayNoDuplicates!0 (array!67330 (_ BitVec 32) List!22616) Bool)

(assert (=> b!1062047 (= res!709196 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22613))))

(declare-fun b!1062048 () Bool)

(assert (=> b!1062048 (= e!604904 true)))

(declare-fun -!553 (ListLongMap!14031 (_ BitVec 64)) ListLongMap!14031)

(assert (=> b!1062048 (= (-!553 lt!467764 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467764)))

(declare-fun lt!467765 () Unit!34653)

(declare-fun removeNotPresentStillSame!5 (ListLongMap!14031 (_ BitVec 64)) Unit!34653)

(assert (=> b!1062048 (= lt!467765 (removeNotPresentStillSame!5 lt!467764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!93914 res!709199) b!1062044))

(assert (= (and b!1062044 res!709197) b!1062042))

(assert (= (and b!1062042 res!709198) b!1062047))

(assert (= (and b!1062047 res!709196) b!1062040))

(assert (= (and b!1062040 (not res!709194)) b!1062046))

(assert (= (and b!1062046 (not res!709195)) b!1062048))

(assert (= (and b!1062045 condMapEmpty!39457) mapIsEmpty!39457))

(assert (= (and b!1062045 (not condMapEmpty!39457)) mapNonEmpty!39457))

(get-info :version)

(assert (= (and mapNonEmpty!39457 ((_ is ValueCellFull!11891) mapValue!39457)) b!1062043))

(assert (= (and b!1062045 ((_ is ValueCellFull!11891) mapDefault!39457)) b!1062041))

(assert (= start!93914 b!1062045))

(declare-fun m!980329 () Bool)

(assert (=> mapNonEmpty!39457 m!980329))

(declare-fun m!980331 () Bool)

(assert (=> b!1062047 m!980331))

(declare-fun m!980333 () Bool)

(assert (=> start!93914 m!980333))

(declare-fun m!980335 () Bool)

(assert (=> start!93914 m!980335))

(declare-fun m!980337 () Bool)

(assert (=> start!93914 m!980337))

(declare-fun m!980339 () Bool)

(assert (=> b!1062046 m!980339))

(declare-fun m!980341 () Bool)

(assert (=> b!1062046 m!980341))

(declare-fun m!980343 () Bool)

(assert (=> b!1062042 m!980343))

(declare-fun m!980345 () Bool)

(assert (=> b!1062048 m!980345))

(declare-fun m!980347 () Bool)

(assert (=> b!1062048 m!980347))

(declare-fun m!980349 () Bool)

(assert (=> b!1062040 m!980349))

(declare-fun m!980351 () Bool)

(assert (=> b!1062040 m!980351))

(declare-fun m!980353 () Bool)

(assert (=> b!1062040 m!980353))

(check-sat tp_is_empty!25189 (not b!1062046) (not b!1062047) (not mapNonEmpty!39457) b_and!34075 (not b!1062048) (not b!1062040) (not b_next!21379) (not start!93914) (not b!1062042))
(check-sat b_and!34075 (not b_next!21379))
