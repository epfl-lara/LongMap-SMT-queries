; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94358 () Bool)

(assert start!94358)

(declare-fun b_free!21523 () Bool)

(declare-fun b_next!21523 () Bool)

(assert (=> start!94358 (= b_free!21523 (not b_next!21523))))

(declare-fun tp!76004 () Bool)

(declare-fun b_and!34283 () Bool)

(assert (=> start!94358 (= tp!76004 b_and!34283)))

(declare-fun b!1065699 () Bool)

(declare-fun res!711073 () Bool)

(declare-fun e!607457 () Bool)

(assert (=> b!1065699 (=> (not res!711073) (not e!607457))))

(declare-datatypes ((array!67711 0))(
  ( (array!67712 (arr!32553 (Array (_ BitVec 32) (_ BitVec 64))) (size!33090 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67711)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67711 (_ BitVec 32)) Bool)

(assert (=> b!1065699 (= res!711073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39682 () Bool)

(declare-fun mapRes!39682 () Bool)

(assert (=> mapIsEmpty!39682 mapRes!39682))

(declare-fun b!1065700 () Bool)

(declare-fun e!607455 () Bool)

(declare-fun tp_is_empty!25333 () Bool)

(assert (=> b!1065700 (= e!607455 tp_is_empty!25333)))

(declare-fun b!1065701 () Bool)

(declare-fun e!607458 () Bool)

(assert (=> b!1065701 (= e!607458 tp_is_empty!25333)))

(declare-fun b!1065702 () Bool)

(declare-fun e!607459 () Bool)

(assert (=> b!1065702 (= e!607459 true)))

(declare-datatypes ((V!38913 0))(
  ( (V!38914 (val!12717 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38913)

(declare-datatypes ((ValueCell!11963 0))(
  ( (ValueCellFull!11963 (v!15325 V!38913)) (EmptyCell!11963) )
))
(declare-datatypes ((array!67713 0))(
  ( (array!67714 (arr!32554 (Array (_ BitVec 32) ValueCell!11963)) (size!33091 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67713)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38913)

(declare-datatypes ((tuple2!16094 0))(
  ( (tuple2!16095 (_1!8058 (_ BitVec 64)) (_2!8058 V!38913)) )
))
(declare-datatypes ((List!22668 0))(
  ( (Nil!22665) (Cons!22664 (h!23882 tuple2!16094) (t!31977 List!22668)) )
))
(declare-datatypes ((ListLongMap!14071 0))(
  ( (ListLongMap!14072 (toList!7051 List!22668)) )
))
(declare-fun lt!469683 () ListLongMap!14071)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4007 (array!67711 array!67713 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14071)

(assert (=> b!1065702 (= lt!469683 (getCurrentListMap!4007 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065703 () Bool)

(declare-fun res!711070 () Bool)

(assert (=> b!1065703 (=> (not res!711070) (not e!607457))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1065703 (= res!711070 (and (= (size!33091 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33090 _keys!1163) (size!33091 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065704 () Bool)

(declare-fun res!711074 () Bool)

(assert (=> b!1065704 (=> (not res!711074) (not e!607457))))

(declare-datatypes ((List!22669 0))(
  ( (Nil!22666) (Cons!22665 (h!23883 (_ BitVec 64)) (t!31978 List!22669)) )
))
(declare-fun arrayNoDuplicates!0 (array!67711 (_ BitVec 32) List!22669) Bool)

(assert (=> b!1065704 (= res!711074 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22666))))

(declare-fun b!1065705 () Bool)

(declare-fun e!607456 () Bool)

(assert (=> b!1065705 (= e!607456 (and e!607455 mapRes!39682))))

(declare-fun condMapEmpty!39682 () Bool)

(declare-fun mapDefault!39682 () ValueCell!11963)

(assert (=> b!1065705 (= condMapEmpty!39682 (= (arr!32554 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11963)) mapDefault!39682)))))

(declare-fun res!711072 () Bool)

(assert (=> start!94358 (=> (not res!711072) (not e!607457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94358 (= res!711072 (validMask!0 mask!1515))))

(assert (=> start!94358 e!607457))

(assert (=> start!94358 true))

(assert (=> start!94358 tp_is_empty!25333))

(declare-fun array_inv!25230 (array!67713) Bool)

(assert (=> start!94358 (and (array_inv!25230 _values!955) e!607456)))

(assert (=> start!94358 tp!76004))

(declare-fun array_inv!25231 (array!67711) Bool)

(assert (=> start!94358 (array_inv!25231 _keys!1163)))

(declare-fun b!1065706 () Bool)

(assert (=> b!1065706 (= e!607457 (not e!607459))))

(declare-fun res!711071 () Bool)

(assert (=> b!1065706 (=> res!711071 e!607459)))

(assert (=> b!1065706 (= res!711071 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469682 () ListLongMap!14071)

(declare-fun lt!469684 () ListLongMap!14071)

(assert (=> b!1065706 (= lt!469682 lt!469684)))

(declare-datatypes ((Unit!34905 0))(
  ( (Unit!34906) )
))
(declare-fun lt!469681 () Unit!34905)

(declare-fun zeroValueAfter!47 () V!38913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!688 (array!67711 array!67713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 V!38913 V!38913 (_ BitVec 32) Int) Unit!34905)

(assert (=> b!1065706 (= lt!469681 (lemmaNoChangeToArrayThenSameMapNoExtras!688 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3685 (array!67711 array!67713 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14071)

(assert (=> b!1065706 (= lt!469684 (getCurrentListMapNoExtraKeys!3685 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065706 (= lt!469682 (getCurrentListMapNoExtraKeys!3685 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39682 () Bool)

(declare-fun tp!76003 () Bool)

(assert (=> mapNonEmpty!39682 (= mapRes!39682 (and tp!76003 e!607458))))

(declare-fun mapKey!39682 () (_ BitVec 32))

(declare-fun mapRest!39682 () (Array (_ BitVec 32) ValueCell!11963))

(declare-fun mapValue!39682 () ValueCell!11963)

(assert (=> mapNonEmpty!39682 (= (arr!32554 _values!955) (store mapRest!39682 mapKey!39682 mapValue!39682))))

(assert (= (and start!94358 res!711072) b!1065703))

(assert (= (and b!1065703 res!711070) b!1065699))

(assert (= (and b!1065699 res!711073) b!1065704))

(assert (= (and b!1065704 res!711074) b!1065706))

(assert (= (and b!1065706 (not res!711071)) b!1065702))

(assert (= (and b!1065705 condMapEmpty!39682) mapIsEmpty!39682))

(assert (= (and b!1065705 (not condMapEmpty!39682)) mapNonEmpty!39682))

(get-info :version)

(assert (= (and mapNonEmpty!39682 ((_ is ValueCellFull!11963) mapValue!39682)) b!1065701))

(assert (= (and b!1065705 ((_ is ValueCellFull!11963) mapDefault!39682)) b!1065700))

(assert (= start!94358 b!1065705))

(declare-fun m!984601 () Bool)

(assert (=> b!1065704 m!984601))

(declare-fun m!984603 () Bool)

(assert (=> start!94358 m!984603))

(declare-fun m!984605 () Bool)

(assert (=> start!94358 m!984605))

(declare-fun m!984607 () Bool)

(assert (=> start!94358 m!984607))

(declare-fun m!984609 () Bool)

(assert (=> mapNonEmpty!39682 m!984609))

(declare-fun m!984611 () Bool)

(assert (=> b!1065706 m!984611))

(declare-fun m!984613 () Bool)

(assert (=> b!1065706 m!984613))

(declare-fun m!984615 () Bool)

(assert (=> b!1065706 m!984615))

(declare-fun m!984617 () Bool)

(assert (=> b!1065702 m!984617))

(declare-fun m!984619 () Bool)

(assert (=> b!1065699 m!984619))

(check-sat (not b!1065704) (not b!1065702) tp_is_empty!25333 b_and!34283 (not mapNonEmpty!39682) (not b_next!21523) (not start!94358) (not b!1065706) (not b!1065699))
(check-sat b_and!34283 (not b_next!21523))
