; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93798 () Bool)

(assert start!93798)

(declare-fun b_free!21277 () Bool)

(declare-fun b_next!21277 () Bool)

(assert (=> start!93798 (= b_free!21277 (not b_next!21277))))

(declare-fun tp!75253 () Bool)

(declare-fun b_and!33965 () Bool)

(assert (=> start!93798 (= tp!75253 b_and!33965)))

(declare-fun b!1060817 () Bool)

(declare-fun res!708487 () Bool)

(declare-fun e!604016 () Bool)

(assert (=> b!1060817 (=> (not res!708487) (not e!604016))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38585 0))(
  ( (V!38586 (val!12594 Int)) )
))
(declare-datatypes ((ValueCell!11840 0))(
  ( (ValueCellFull!11840 (v!15203 V!38585)) (EmptyCell!11840) )
))
(declare-datatypes ((array!67128 0))(
  ( (array!67129 (arr!32272 (Array (_ BitVec 32) ValueCell!11840)) (size!32810 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67128)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67130 0))(
  ( (array!67131 (arr!32273 (Array (_ BitVec 32) (_ BitVec 64))) (size!32811 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67130)

(assert (=> b!1060817 (= res!708487 (and (= (size!32810 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32811 _keys!1163) (size!32810 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39301 () Bool)

(declare-fun mapRes!39301 () Bool)

(assert (=> mapIsEmpty!39301 mapRes!39301))

(declare-fun b!1060818 () Bool)

(declare-fun res!708484 () Bool)

(assert (=> b!1060818 (=> (not res!708484) (not e!604016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67130 (_ BitVec 32)) Bool)

(assert (=> b!1060818 (= res!708484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060819 () Bool)

(declare-fun res!708486 () Bool)

(assert (=> b!1060819 (=> (not res!708486) (not e!604016))))

(declare-datatypes ((List!22540 0))(
  ( (Nil!22537) (Cons!22536 (h!23745 (_ BitVec 64)) (t!31840 List!22540)) )
))
(declare-fun arrayNoDuplicates!0 (array!67130 (_ BitVec 32) List!22540) Bool)

(assert (=> b!1060819 (= res!708486 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22537))))

(declare-fun res!708485 () Bool)

(assert (=> start!93798 (=> (not res!708485) (not e!604016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93798 (= res!708485 (validMask!0 mask!1515))))

(assert (=> start!93798 e!604016))

(assert (=> start!93798 true))

(declare-fun tp_is_empty!25087 () Bool)

(assert (=> start!93798 tp_is_empty!25087))

(declare-fun e!604018 () Bool)

(declare-fun array_inv!25014 (array!67128) Bool)

(assert (=> start!93798 (and (array_inv!25014 _values!955) e!604018)))

(assert (=> start!93798 tp!75253))

(declare-fun array_inv!25015 (array!67130) Bool)

(assert (=> start!93798 (array_inv!25015 _keys!1163)))

(declare-fun b!1060820 () Bool)

(declare-fun e!604017 () Bool)

(assert (=> b!1060820 (= e!604017 tp_is_empty!25087)))

(declare-fun mapNonEmpty!39301 () Bool)

(declare-fun tp!75254 () Bool)

(declare-fun e!604019 () Bool)

(assert (=> mapNonEmpty!39301 (= mapRes!39301 (and tp!75254 e!604019))))

(declare-fun mapValue!39301 () ValueCell!11840)

(declare-fun mapKey!39301 () (_ BitVec 32))

(declare-fun mapRest!39301 () (Array (_ BitVec 32) ValueCell!11840))

(assert (=> mapNonEmpty!39301 (= (arr!32272 _values!955) (store mapRest!39301 mapKey!39301 mapValue!39301))))

(declare-fun b!1060821 () Bool)

(assert (=> b!1060821 (= e!604016 false)))

(declare-datatypes ((tuple2!15986 0))(
  ( (tuple2!15987 (_1!8004 (_ BitVec 64)) (_2!8004 V!38585)) )
))
(declare-datatypes ((List!22541 0))(
  ( (Nil!22538) (Cons!22537 (h!23746 tuple2!15986) (t!31841 List!22541)) )
))
(declare-datatypes ((ListLongMap!13955 0))(
  ( (ListLongMap!13956 (toList!6993 List!22541)) )
))
(declare-fun lt!467230 () ListLongMap!13955)

(declare-fun minValue!907 () V!38585)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38585)

(declare-fun getCurrentListMapNoExtraKeys!3610 (array!67130 array!67128 (_ BitVec 32) (_ BitVec 32) V!38585 V!38585 (_ BitVec 32) Int) ListLongMap!13955)

(assert (=> b!1060821 (= lt!467230 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38585)

(declare-fun lt!467231 () ListLongMap!13955)

(assert (=> b!1060821 (= lt!467231 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060822 () Bool)

(assert (=> b!1060822 (= e!604019 tp_is_empty!25087)))

(declare-fun b!1060823 () Bool)

(assert (=> b!1060823 (= e!604018 (and e!604017 mapRes!39301))))

(declare-fun condMapEmpty!39301 () Bool)

(declare-fun mapDefault!39301 () ValueCell!11840)

(assert (=> b!1060823 (= condMapEmpty!39301 (= (arr!32272 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11840)) mapDefault!39301)))))

(assert (= (and start!93798 res!708485) b!1060817))

(assert (= (and b!1060817 res!708487) b!1060818))

(assert (= (and b!1060818 res!708484) b!1060819))

(assert (= (and b!1060819 res!708486) b!1060821))

(assert (= (and b!1060823 condMapEmpty!39301) mapIsEmpty!39301))

(assert (= (and b!1060823 (not condMapEmpty!39301)) mapNonEmpty!39301))

(get-info :version)

(assert (= (and mapNonEmpty!39301 ((_ is ValueCellFull!11840) mapValue!39301)) b!1060822))

(assert (= (and b!1060823 ((_ is ValueCellFull!11840) mapDefault!39301)) b!1060820))

(assert (= start!93798 b!1060823))

(declare-fun m!979285 () Bool)

(assert (=> mapNonEmpty!39301 m!979285))

(declare-fun m!979287 () Bool)

(assert (=> b!1060818 m!979287))

(declare-fun m!979289 () Bool)

(assert (=> b!1060821 m!979289))

(declare-fun m!979291 () Bool)

(assert (=> b!1060821 m!979291))

(declare-fun m!979293 () Bool)

(assert (=> start!93798 m!979293))

(declare-fun m!979295 () Bool)

(assert (=> start!93798 m!979295))

(declare-fun m!979297 () Bool)

(assert (=> start!93798 m!979297))

(declare-fun m!979299 () Bool)

(assert (=> b!1060819 m!979299))

(check-sat (not b!1060821) b_and!33965 (not b_next!21277) (not mapNonEmpty!39301) (not b!1060819) (not start!93798) tp_is_empty!25087 (not b!1060818))
(check-sat b_and!33965 (not b_next!21277))
