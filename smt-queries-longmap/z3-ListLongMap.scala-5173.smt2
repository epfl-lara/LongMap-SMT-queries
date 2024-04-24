; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70190 () Bool)

(assert start!70190)

(declare-fun b_free!12445 () Bool)

(declare-fun b_next!12445 () Bool)

(assert (=> start!70190 (= b_free!12445 (not b_next!12445))))

(declare-fun tp!44049 () Bool)

(declare-fun b_and!21227 () Bool)

(assert (=> start!70190 (= tp!44049 b_and!21227)))

(declare-fun b!814721 () Bool)

(declare-fun res!556275 () Bool)

(declare-fun e!451598 () Bool)

(assert (=> b!814721 (=> (not res!556275) (not e!451598))))

(declare-datatypes ((array!44523 0))(
  ( (array!44524 (arr!21317 (Array (_ BitVec 32) (_ BitVec 64))) (size!21737 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44523)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44523 (_ BitVec 32)) Bool)

(assert (=> b!814721 (= res!556275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814723 () Bool)

(declare-fun e!451600 () Bool)

(declare-fun tp_is_empty!14155 () Bool)

(assert (=> b!814723 (= e!451600 tp_is_empty!14155)))

(declare-fun b!814724 () Bool)

(declare-fun e!451601 () Bool)

(assert (=> b!814724 (= e!451601 tp_is_empty!14155)))

(declare-fun b!814725 () Bool)

(declare-fun res!556273 () Bool)

(assert (=> b!814725 (=> (not res!556273) (not e!451598))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23875 0))(
  ( (V!23876 (val!7125 Int)) )
))
(declare-datatypes ((ValueCell!6662 0))(
  ( (ValueCellFull!6662 (v!9552 V!23875)) (EmptyCell!6662) )
))
(declare-datatypes ((array!44525 0))(
  ( (array!44526 (arr!21318 (Array (_ BitVec 32) ValueCell!6662)) (size!21738 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44525)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814725 (= res!556273 (and (= (size!21738 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21737 _keys!976) (size!21738 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814726 () Bool)

(assert (=> b!814726 (= e!451598 false)))

(declare-fun zeroValueAfter!34 () V!23875)

(declare-fun minValue!754 () V!23875)

(declare-datatypes ((tuple2!9252 0))(
  ( (tuple2!9253 (_1!4637 (_ BitVec 64)) (_2!4637 V!23875)) )
))
(declare-datatypes ((List!15071 0))(
  ( (Nil!15068) (Cons!15067 (h!16202 tuple2!9252) (t!21380 List!15071)) )
))
(declare-datatypes ((ListLongMap!8077 0))(
  ( (ListLongMap!8078 (toList!4054 List!15071)) )
))
(declare-fun lt!364760 () ListLongMap!8077)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2161 (array!44523 array!44525 (_ BitVec 32) (_ BitVec 32) V!23875 V!23875 (_ BitVec 32) Int) ListLongMap!8077)

(assert (=> b!814726 (= lt!364760 (getCurrentListMapNoExtraKeys!2161 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23875)

(declare-fun lt!364761 () ListLongMap!8077)

(assert (=> b!814726 (= lt!364761 (getCurrentListMapNoExtraKeys!2161 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22813 () Bool)

(declare-fun mapRes!22813 () Bool)

(assert (=> mapIsEmpty!22813 mapRes!22813))

(declare-fun res!556274 () Bool)

(assert (=> start!70190 (=> (not res!556274) (not e!451598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70190 (= res!556274 (validMask!0 mask!1312))))

(assert (=> start!70190 e!451598))

(assert (=> start!70190 tp_is_empty!14155))

(declare-fun array_inv!17119 (array!44523) Bool)

(assert (=> start!70190 (array_inv!17119 _keys!976)))

(assert (=> start!70190 true))

(declare-fun e!451597 () Bool)

(declare-fun array_inv!17120 (array!44525) Bool)

(assert (=> start!70190 (and (array_inv!17120 _values!788) e!451597)))

(assert (=> start!70190 tp!44049))

(declare-fun b!814722 () Bool)

(assert (=> b!814722 (= e!451597 (and e!451600 mapRes!22813))))

(declare-fun condMapEmpty!22813 () Bool)

(declare-fun mapDefault!22813 () ValueCell!6662)

(assert (=> b!814722 (= condMapEmpty!22813 (= (arr!21318 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6662)) mapDefault!22813)))))

(declare-fun b!814727 () Bool)

(declare-fun res!556276 () Bool)

(assert (=> b!814727 (=> (not res!556276) (not e!451598))))

(declare-datatypes ((List!15072 0))(
  ( (Nil!15069) (Cons!15068 (h!16203 (_ BitVec 64)) (t!21381 List!15072)) )
))
(declare-fun arrayNoDuplicates!0 (array!44523 (_ BitVec 32) List!15072) Bool)

(assert (=> b!814727 (= res!556276 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15069))))

(declare-fun mapNonEmpty!22813 () Bool)

(declare-fun tp!44050 () Bool)

(assert (=> mapNonEmpty!22813 (= mapRes!22813 (and tp!44050 e!451601))))

(declare-fun mapRest!22813 () (Array (_ BitVec 32) ValueCell!6662))

(declare-fun mapKey!22813 () (_ BitVec 32))

(declare-fun mapValue!22813 () ValueCell!6662)

(assert (=> mapNonEmpty!22813 (= (arr!21318 _values!788) (store mapRest!22813 mapKey!22813 mapValue!22813))))

(assert (= (and start!70190 res!556274) b!814725))

(assert (= (and b!814725 res!556273) b!814721))

(assert (= (and b!814721 res!556275) b!814727))

(assert (= (and b!814727 res!556276) b!814726))

(assert (= (and b!814722 condMapEmpty!22813) mapIsEmpty!22813))

(assert (= (and b!814722 (not condMapEmpty!22813)) mapNonEmpty!22813))

(get-info :version)

(assert (= (and mapNonEmpty!22813 ((_ is ValueCellFull!6662) mapValue!22813)) b!814724))

(assert (= (and b!814722 ((_ is ValueCellFull!6662) mapDefault!22813)) b!814723))

(assert (= start!70190 b!814722))

(declare-fun m!757047 () Bool)

(assert (=> b!814721 m!757047))

(declare-fun m!757049 () Bool)

(assert (=> b!814726 m!757049))

(declare-fun m!757051 () Bool)

(assert (=> b!814726 m!757051))

(declare-fun m!757053 () Bool)

(assert (=> mapNonEmpty!22813 m!757053))

(declare-fun m!757055 () Bool)

(assert (=> start!70190 m!757055))

(declare-fun m!757057 () Bool)

(assert (=> start!70190 m!757057))

(declare-fun m!757059 () Bool)

(assert (=> start!70190 m!757059))

(declare-fun m!757061 () Bool)

(assert (=> b!814727 m!757061))

(check-sat (not b!814726) (not mapNonEmpty!22813) (not start!70190) (not b!814727) (not b_next!12445) (not b!814721) b_and!21227 tp_is_empty!14155)
(check-sat b_and!21227 (not b_next!12445))
