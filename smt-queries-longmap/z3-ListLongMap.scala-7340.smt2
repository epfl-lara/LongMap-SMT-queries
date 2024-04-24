; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93968 () Bool)

(assert start!93968)

(declare-fun b_free!21217 () Bool)

(declare-fun b_next!21217 () Bool)

(assert (=> start!93968 (= b_free!21217 (not b_next!21217))))

(declare-fun tp!75071 () Bool)

(declare-fun b_and!33937 () Bool)

(assert (=> start!93968 (= tp!75071 b_and!33937)))

(declare-fun b!1061594 () Bool)

(declare-fun res!708691 () Bool)

(declare-fun e!604469 () Bool)

(assert (=> b!1061594 (=> (not res!708691) (not e!604469))))

(declare-datatypes ((array!67119 0))(
  ( (array!67120 (arr!32262 (Array (_ BitVec 32) (_ BitVec 64))) (size!32799 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67119)

(declare-datatypes ((List!22452 0))(
  ( (Nil!22449) (Cons!22448 (h!23666 (_ BitVec 64)) (t!31751 List!22452)) )
))
(declare-fun arrayNoDuplicates!0 (array!67119 (_ BitVec 32) List!22452) Bool)

(assert (=> b!1061594 (= res!708691 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22449))))

(declare-fun mapNonEmpty!39208 () Bool)

(declare-fun mapRes!39208 () Bool)

(declare-fun tp!75070 () Bool)

(declare-fun e!604470 () Bool)

(assert (=> mapNonEmpty!39208 (= mapRes!39208 (and tp!75070 e!604470))))

(declare-datatypes ((V!38505 0))(
  ( (V!38506 (val!12564 Int)) )
))
(declare-datatypes ((ValueCell!11810 0))(
  ( (ValueCellFull!11810 (v!15170 V!38505)) (EmptyCell!11810) )
))
(declare-fun mapValue!39208 () ValueCell!11810)

(declare-fun mapKey!39208 () (_ BitVec 32))

(declare-fun mapRest!39208 () (Array (_ BitVec 32) ValueCell!11810))

(declare-datatypes ((array!67121 0))(
  ( (array!67122 (arr!32263 (Array (_ BitVec 32) ValueCell!11810)) (size!32800 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67121)

(assert (=> mapNonEmpty!39208 (= (arr!32263 _values!955) (store mapRest!39208 mapKey!39208 mapValue!39208))))

(declare-fun b!1061595 () Bool)

(declare-fun e!604466 () Bool)

(declare-fun tp_is_empty!25027 () Bool)

(assert (=> b!1061595 (= e!604466 tp_is_empty!25027)))

(declare-fun mapIsEmpty!39208 () Bool)

(assert (=> mapIsEmpty!39208 mapRes!39208))

(declare-fun b!1061596 () Bool)

(declare-fun res!708688 () Bool)

(assert (=> b!1061596 (=> (not res!708688) (not e!604469))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67119 (_ BitVec 32)) Bool)

(assert (=> b!1061596 (= res!708688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061597 () Bool)

(declare-fun e!604467 () Bool)

(assert (=> b!1061597 (= e!604467 (and e!604466 mapRes!39208))))

(declare-fun condMapEmpty!39208 () Bool)

(declare-fun mapDefault!39208 () ValueCell!11810)

(assert (=> b!1061597 (= condMapEmpty!39208 (= (arr!32263 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11810)) mapDefault!39208)))))

(declare-fun res!708689 () Bool)

(assert (=> start!93968 (=> (not res!708689) (not e!604469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93968 (= res!708689 (validMask!0 mask!1515))))

(assert (=> start!93968 e!604469))

(assert (=> start!93968 true))

(assert (=> start!93968 tp_is_empty!25027))

(declare-fun array_inv!25016 (array!67121) Bool)

(assert (=> start!93968 (and (array_inv!25016 _values!955) e!604467)))

(assert (=> start!93968 tp!75071))

(declare-fun array_inv!25017 (array!67119) Bool)

(assert (=> start!93968 (array_inv!25017 _keys!1163)))

(declare-fun b!1061598 () Bool)

(assert (=> b!1061598 (= e!604470 tp_is_empty!25027)))

(declare-fun b!1061599 () Bool)

(declare-fun res!708690 () Bool)

(assert (=> b!1061599 (=> (not res!708690) (not e!604469))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061599 (= res!708690 (and (= (size!32800 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32799 _keys!1163) (size!32800 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061600 () Bool)

(assert (=> b!1061600 (= e!604469 false)))

(declare-fun zeroValueBefore!47 () V!38505)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38505)

(declare-datatypes ((tuple2!15868 0))(
  ( (tuple2!15869 (_1!7945 (_ BitVec 64)) (_2!7945 V!38505)) )
))
(declare-datatypes ((List!22453 0))(
  ( (Nil!22450) (Cons!22449 (h!23667 tuple2!15868) (t!31752 List!22453)) )
))
(declare-datatypes ((ListLongMap!13845 0))(
  ( (ListLongMap!13846 (toList!6938 List!22453)) )
))
(declare-fun lt!467760 () ListLongMap!13845)

(declare-fun getCurrentListMapNoExtraKeys!3586 (array!67119 array!67121 (_ BitVec 32) (_ BitVec 32) V!38505 V!38505 (_ BitVec 32) Int) ListLongMap!13845)

(assert (=> b!1061600 (= lt!467760 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93968 res!708689) b!1061599))

(assert (= (and b!1061599 res!708690) b!1061596))

(assert (= (and b!1061596 res!708688) b!1061594))

(assert (= (and b!1061594 res!708691) b!1061600))

(assert (= (and b!1061597 condMapEmpty!39208) mapIsEmpty!39208))

(assert (= (and b!1061597 (not condMapEmpty!39208)) mapNonEmpty!39208))

(get-info :version)

(assert (= (and mapNonEmpty!39208 ((_ is ValueCellFull!11810) mapValue!39208)) b!1061598))

(assert (= (and b!1061597 ((_ is ValueCellFull!11810) mapDefault!39208)) b!1061595))

(assert (= start!93968 b!1061597))

(declare-fun m!981077 () Bool)

(assert (=> mapNonEmpty!39208 m!981077))

(declare-fun m!981079 () Bool)

(assert (=> b!1061596 m!981079))

(declare-fun m!981081 () Bool)

(assert (=> b!1061594 m!981081))

(declare-fun m!981083 () Bool)

(assert (=> start!93968 m!981083))

(declare-fun m!981085 () Bool)

(assert (=> start!93968 m!981085))

(declare-fun m!981087 () Bool)

(assert (=> start!93968 m!981087))

(declare-fun m!981089 () Bool)

(assert (=> b!1061600 m!981089))

(check-sat tp_is_empty!25027 (not mapNonEmpty!39208) (not b!1061596) b_and!33937 (not b!1061600) (not b_next!21217) (not b!1061594) (not start!93968))
(check-sat b_and!33937 (not b_next!21217))
