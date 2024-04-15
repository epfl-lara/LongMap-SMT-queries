; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93816 () Bool)

(assert start!93816)

(declare-fun b_free!21295 () Bool)

(declare-fun b_next!21295 () Bool)

(assert (=> start!93816 (= b_free!21295 (not b_next!21295))))

(declare-fun tp!75308 () Bool)

(declare-fun b_and!33983 () Bool)

(assert (=> start!93816 (= tp!75308 b_and!33983)))

(declare-fun b!1061006 () Bool)

(declare-fun res!708595 () Bool)

(declare-fun e!604155 () Bool)

(assert (=> b!1061006 (=> (not res!708595) (not e!604155))))

(declare-datatypes ((array!67160 0))(
  ( (array!67161 (arr!32288 (Array (_ BitVec 32) (_ BitVec 64))) (size!32826 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67160)

(declare-datatypes ((List!22552 0))(
  ( (Nil!22549) (Cons!22548 (h!23757 (_ BitVec 64)) (t!31852 List!22552)) )
))
(declare-fun arrayNoDuplicates!0 (array!67160 (_ BitVec 32) List!22552) Bool)

(assert (=> b!1061006 (= res!708595 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22549))))

(declare-fun res!708594 () Bool)

(assert (=> start!93816 (=> (not res!708594) (not e!604155))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93816 (= res!708594 (validMask!0 mask!1515))))

(assert (=> start!93816 e!604155))

(assert (=> start!93816 true))

(declare-fun tp_is_empty!25105 () Bool)

(assert (=> start!93816 tp_is_empty!25105))

(declare-datatypes ((V!38609 0))(
  ( (V!38610 (val!12603 Int)) )
))
(declare-datatypes ((ValueCell!11849 0))(
  ( (ValueCellFull!11849 (v!15212 V!38609)) (EmptyCell!11849) )
))
(declare-datatypes ((array!67162 0))(
  ( (array!67163 (arr!32289 (Array (_ BitVec 32) ValueCell!11849)) (size!32827 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67162)

(declare-fun e!604153 () Bool)

(declare-fun array_inv!25028 (array!67162) Bool)

(assert (=> start!93816 (and (array_inv!25028 _values!955) e!604153)))

(assert (=> start!93816 tp!75308))

(declare-fun array_inv!25029 (array!67160) Bool)

(assert (=> start!93816 (array_inv!25029 _keys!1163)))

(declare-fun b!1061007 () Bool)

(declare-fun res!708593 () Bool)

(assert (=> b!1061007 (=> (not res!708593) (not e!604155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67160 (_ BitVec 32)) Bool)

(assert (=> b!1061007 (= res!708593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39328 () Bool)

(declare-fun mapRes!39328 () Bool)

(assert (=> mapIsEmpty!39328 mapRes!39328))

(declare-fun b!1061008 () Bool)

(declare-fun e!604154 () Bool)

(assert (=> b!1061008 (= e!604154 tp_is_empty!25105)))

(declare-fun b!1061009 () Bool)

(assert (=> b!1061009 (= e!604155 false)))

(declare-datatypes ((tuple2!15998 0))(
  ( (tuple2!15999 (_1!8010 (_ BitVec 64)) (_2!8010 V!38609)) )
))
(declare-datatypes ((List!22553 0))(
  ( (Nil!22550) (Cons!22549 (h!23758 tuple2!15998) (t!31853 List!22553)) )
))
(declare-datatypes ((ListLongMap!13967 0))(
  ( (ListLongMap!13968 (toList!6999 List!22553)) )
))
(declare-fun lt!467284 () ListLongMap!13967)

(declare-fun minValue!907 () V!38609)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38609)

(declare-fun getCurrentListMapNoExtraKeys!3616 (array!67160 array!67162 (_ BitVec 32) (_ BitVec 32) V!38609 V!38609 (_ BitVec 32) Int) ListLongMap!13967)

(assert (=> b!1061009 (= lt!467284 (getCurrentListMapNoExtraKeys!3616 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38609)

(declare-fun lt!467285 () ListLongMap!13967)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061009 (= lt!467285 (getCurrentListMapNoExtraKeys!3616 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061010 () Bool)

(assert (=> b!1061010 (= e!604153 (and e!604154 mapRes!39328))))

(declare-fun condMapEmpty!39328 () Bool)

(declare-fun mapDefault!39328 () ValueCell!11849)

(assert (=> b!1061010 (= condMapEmpty!39328 (= (arr!32289 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11849)) mapDefault!39328)))))

(declare-fun b!1061011 () Bool)

(declare-fun res!708592 () Bool)

(assert (=> b!1061011 (=> (not res!708592) (not e!604155))))

(assert (=> b!1061011 (= res!708592 (and (= (size!32827 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32826 _keys!1163) (size!32827 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39328 () Bool)

(declare-fun tp!75307 () Bool)

(declare-fun e!604151 () Bool)

(assert (=> mapNonEmpty!39328 (= mapRes!39328 (and tp!75307 e!604151))))

(declare-fun mapKey!39328 () (_ BitVec 32))

(declare-fun mapRest!39328 () (Array (_ BitVec 32) ValueCell!11849))

(declare-fun mapValue!39328 () ValueCell!11849)

(assert (=> mapNonEmpty!39328 (= (arr!32289 _values!955) (store mapRest!39328 mapKey!39328 mapValue!39328))))

(declare-fun b!1061012 () Bool)

(assert (=> b!1061012 (= e!604151 tp_is_empty!25105)))

(assert (= (and start!93816 res!708594) b!1061011))

(assert (= (and b!1061011 res!708592) b!1061007))

(assert (= (and b!1061007 res!708593) b!1061006))

(assert (= (and b!1061006 res!708595) b!1061009))

(assert (= (and b!1061010 condMapEmpty!39328) mapIsEmpty!39328))

(assert (= (and b!1061010 (not condMapEmpty!39328)) mapNonEmpty!39328))

(get-info :version)

(assert (= (and mapNonEmpty!39328 ((_ is ValueCellFull!11849) mapValue!39328)) b!1061012))

(assert (= (and b!1061010 ((_ is ValueCellFull!11849) mapDefault!39328)) b!1061008))

(assert (= start!93816 b!1061010))

(declare-fun m!979429 () Bool)

(assert (=> start!93816 m!979429))

(declare-fun m!979431 () Bool)

(assert (=> start!93816 m!979431))

(declare-fun m!979433 () Bool)

(assert (=> start!93816 m!979433))

(declare-fun m!979435 () Bool)

(assert (=> b!1061007 m!979435))

(declare-fun m!979437 () Bool)

(assert (=> b!1061009 m!979437))

(declare-fun m!979439 () Bool)

(assert (=> b!1061009 m!979439))

(declare-fun m!979441 () Bool)

(assert (=> b!1061006 m!979441))

(declare-fun m!979443 () Bool)

(assert (=> mapNonEmpty!39328 m!979443))

(check-sat (not mapNonEmpty!39328) (not b!1061009) (not b!1061007) tp_is_empty!25105 (not b_next!21295) (not start!93816) b_and!33983 (not b!1061006))
(check-sat b_and!33983 (not b_next!21295))
