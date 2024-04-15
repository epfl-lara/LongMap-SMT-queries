; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69914 () Bool)

(assert start!69914)

(declare-fun b_free!12367 () Bool)

(declare-fun b_next!12367 () Bool)

(assert (=> start!69914 (= b_free!12367 (not b_next!12367))))

(declare-fun tp!43813 () Bool)

(declare-fun b_and!21109 () Bool)

(assert (=> start!69914 (= tp!43813 b_and!21109)))

(declare-fun b!812689 () Bool)

(declare-fun e!450240 () Bool)

(declare-fun tp_is_empty!14077 () Bool)

(assert (=> b!812689 (= e!450240 tp_is_empty!14077)))

(declare-fun b!812690 () Bool)

(declare-fun res!555329 () Bool)

(declare-fun e!450236 () Bool)

(assert (=> b!812690 (=> (not res!555329) (not e!450236))))

(declare-datatypes ((array!44373 0))(
  ( (array!44374 (arr!21248 (Array (_ BitVec 32) (_ BitVec 64))) (size!21669 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44373)

(declare-datatypes ((List!15153 0))(
  ( (Nil!15150) (Cons!15149 (h!16278 (_ BitVec 64)) (t!21459 List!15153)) )
))
(declare-fun arrayNoDuplicates!0 (array!44373 (_ BitVec 32) List!15153) Bool)

(assert (=> b!812690 (= res!555329 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15150))))

(declare-fun res!555328 () Bool)

(assert (=> start!69914 (=> (not res!555328) (not e!450236))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69914 (= res!555328 (validMask!0 mask!1312))))

(assert (=> start!69914 e!450236))

(assert (=> start!69914 tp_is_empty!14077))

(declare-fun array_inv!17101 (array!44373) Bool)

(assert (=> start!69914 (array_inv!17101 _keys!976)))

(assert (=> start!69914 true))

(declare-datatypes ((V!23771 0))(
  ( (V!23772 (val!7086 Int)) )
))
(declare-datatypes ((ValueCell!6623 0))(
  ( (ValueCellFull!6623 (v!9507 V!23771)) (EmptyCell!6623) )
))
(declare-datatypes ((array!44375 0))(
  ( (array!44376 (arr!21249 (Array (_ BitVec 32) ValueCell!6623)) (size!21670 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44375)

(declare-fun e!450239 () Bool)

(declare-fun array_inv!17102 (array!44375) Bool)

(assert (=> start!69914 (and (array_inv!17102 _values!788) e!450239)))

(assert (=> start!69914 tp!43813))

(declare-fun mapNonEmpty!22693 () Bool)

(declare-fun mapRes!22693 () Bool)

(declare-fun tp!43812 () Bool)

(assert (=> mapNonEmpty!22693 (= mapRes!22693 (and tp!43812 e!450240))))

(declare-fun mapKey!22693 () (_ BitVec 32))

(declare-fun mapRest!22693 () (Array (_ BitVec 32) ValueCell!6623))

(declare-fun mapValue!22693 () ValueCell!6623)

(assert (=> mapNonEmpty!22693 (= (arr!21249 _values!788) (store mapRest!22693 mapKey!22693 mapValue!22693))))

(declare-fun b!812691 () Bool)

(declare-fun res!555326 () Bool)

(assert (=> b!812691 (=> (not res!555326) (not e!450236))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812691 (= res!555326 (and (= (size!21670 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21669 _keys!976) (size!21670 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812692 () Bool)

(declare-fun e!450237 () Bool)

(assert (=> b!812692 (= e!450239 (and e!450237 mapRes!22693))))

(declare-fun condMapEmpty!22693 () Bool)

(declare-fun mapDefault!22693 () ValueCell!6623)

(assert (=> b!812692 (= condMapEmpty!22693 (= (arr!21249 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6623)) mapDefault!22693)))))

(declare-fun mapIsEmpty!22693 () Bool)

(assert (=> mapIsEmpty!22693 mapRes!22693))

(declare-fun b!812693 () Bool)

(assert (=> b!812693 (= e!450236 false)))

(declare-fun zeroValueBefore!34 () V!23771)

(declare-fun minValue!754 () V!23771)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9330 0))(
  ( (tuple2!9331 (_1!4676 (_ BitVec 64)) (_2!4676 V!23771)) )
))
(declare-datatypes ((List!15154 0))(
  ( (Nil!15151) (Cons!15150 (h!16279 tuple2!9330) (t!21460 List!15154)) )
))
(declare-datatypes ((ListLongMap!8143 0))(
  ( (ListLongMap!8144 (toList!4087 List!15154)) )
))
(declare-fun lt!363969 () ListLongMap!8143)

(declare-fun getCurrentListMapNoExtraKeys!2152 (array!44373 array!44375 (_ BitVec 32) (_ BitVec 32) V!23771 V!23771 (_ BitVec 32) Int) ListLongMap!8143)

(assert (=> b!812693 (= lt!363969 (getCurrentListMapNoExtraKeys!2152 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812694 () Bool)

(assert (=> b!812694 (= e!450237 tp_is_empty!14077)))

(declare-fun b!812695 () Bool)

(declare-fun res!555327 () Bool)

(assert (=> b!812695 (=> (not res!555327) (not e!450236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44373 (_ BitVec 32)) Bool)

(assert (=> b!812695 (= res!555327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69914 res!555328) b!812691))

(assert (= (and b!812691 res!555326) b!812695))

(assert (= (and b!812695 res!555327) b!812690))

(assert (= (and b!812690 res!555329) b!812693))

(assert (= (and b!812692 condMapEmpty!22693) mapIsEmpty!22693))

(assert (= (and b!812692 (not condMapEmpty!22693)) mapNonEmpty!22693))

(get-info :version)

(assert (= (and mapNonEmpty!22693 ((_ is ValueCellFull!6623) mapValue!22693)) b!812689))

(assert (= (and b!812692 ((_ is ValueCellFull!6623) mapDefault!22693)) b!812694))

(assert (= start!69914 b!812692))

(declare-fun m!754393 () Bool)

(assert (=> b!812690 m!754393))

(declare-fun m!754395 () Bool)

(assert (=> b!812693 m!754395))

(declare-fun m!754397 () Bool)

(assert (=> b!812695 m!754397))

(declare-fun m!754399 () Bool)

(assert (=> mapNonEmpty!22693 m!754399))

(declare-fun m!754401 () Bool)

(assert (=> start!69914 m!754401))

(declare-fun m!754403 () Bool)

(assert (=> start!69914 m!754403))

(declare-fun m!754405 () Bool)

(assert (=> start!69914 m!754405))

(check-sat (not mapNonEmpty!22693) b_and!21109 (not b!812693) (not start!69914) (not b_next!12367) tp_is_empty!14077 (not b!812695) (not b!812690))
(check-sat b_and!21109 (not b_next!12367))
