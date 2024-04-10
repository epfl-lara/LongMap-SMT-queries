; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69792 () Bool)

(assert start!69792)

(declare-datatypes ((array!44198 0))(
  ( (array!44199 (arr!21166 (Array (_ BitVec 32) (_ BitVec 64))) (size!21587 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44198)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun e!449606 () Bool)

(declare-datatypes ((V!23653 0))(
  ( (V!23654 (val!7042 Int)) )
))
(declare-datatypes ((ValueCell!6579 0))(
  ( (ValueCellFull!6579 (v!9468 V!23653)) (EmptyCell!6579) )
))
(declare-datatypes ((array!44200 0))(
  ( (array!44201 (arr!21167 (Array (_ BitVec 32) ValueCell!6579)) (size!21588 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44200)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!811952 () Bool)

(assert (=> b!811952 (= e!449606 (and (= (size!21588 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21587 _keys!976) (size!21588 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (size!21587 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)) (bvsgt #b00000000000000000000000000000000 (size!21587 _keys!976))))))

(declare-fun b!811953 () Bool)

(declare-fun e!449604 () Bool)

(declare-fun tp_is_empty!13989 () Bool)

(assert (=> b!811953 (= e!449604 tp_is_empty!13989)))

(declare-fun mapIsEmpty!22543 () Bool)

(declare-fun mapRes!22543 () Bool)

(assert (=> mapIsEmpty!22543 mapRes!22543))

(declare-fun mapNonEmpty!22543 () Bool)

(declare-fun tp!43651 () Bool)

(assert (=> mapNonEmpty!22543 (= mapRes!22543 (and tp!43651 e!449604))))

(declare-fun mapKey!22543 () (_ BitVec 32))

(declare-fun mapValue!22543 () ValueCell!6579)

(declare-fun mapRest!22543 () (Array (_ BitVec 32) ValueCell!6579))

(assert (=> mapNonEmpty!22543 (= (arr!21167 _values!788) (store mapRest!22543 mapKey!22543 mapValue!22543))))

(declare-fun res!554929 () Bool)

(assert (=> start!69792 (=> (not res!554929) (not e!449606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69792 (= res!554929 (validMask!0 mask!1312))))

(assert (=> start!69792 e!449606))

(declare-fun array_inv!16961 (array!44198) Bool)

(assert (=> start!69792 (array_inv!16961 _keys!976)))

(assert (=> start!69792 true))

(declare-fun e!449608 () Bool)

(declare-fun array_inv!16962 (array!44200) Bool)

(assert (=> start!69792 (and (array_inv!16962 _values!788) e!449608)))

(declare-fun b!811954 () Bool)

(declare-fun e!449607 () Bool)

(assert (=> b!811954 (= e!449608 (and e!449607 mapRes!22543))))

(declare-fun condMapEmpty!22543 () Bool)

(declare-fun mapDefault!22543 () ValueCell!6579)

(assert (=> b!811954 (= condMapEmpty!22543 (= (arr!21167 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6579)) mapDefault!22543)))))

(declare-fun b!811955 () Bool)

(assert (=> b!811955 (= e!449607 tp_is_empty!13989)))

(assert (= (and start!69792 res!554929) b!811952))

(assert (= (and b!811954 condMapEmpty!22543) mapIsEmpty!22543))

(assert (= (and b!811954 (not condMapEmpty!22543)) mapNonEmpty!22543))

(get-info :version)

(assert (= (and mapNonEmpty!22543 ((_ is ValueCellFull!6579) mapValue!22543)) b!811953))

(assert (= (and b!811954 ((_ is ValueCellFull!6579) mapDefault!22543)) b!811955))

(assert (= start!69792 b!811954))

(declare-fun m!754525 () Bool)

(assert (=> mapNonEmpty!22543 m!754525))

(declare-fun m!754527 () Bool)

(assert (=> start!69792 m!754527))

(declare-fun m!754529 () Bool)

(assert (=> start!69792 m!754529))

(declare-fun m!754531 () Bool)

(assert (=> start!69792 m!754531))

(check-sat (not start!69792) (not mapNonEmpty!22543) tp_is_empty!13989)
(check-sat)
(get-model)

(declare-fun d!104283 () Bool)

(assert (=> d!104283 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69792 d!104283))

(declare-fun d!104285 () Bool)

(assert (=> d!104285 (= (array_inv!16961 _keys!976) (bvsge (size!21587 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69792 d!104285))

(declare-fun d!104287 () Bool)

(assert (=> d!104287 (= (array_inv!16962 _values!788) (bvsge (size!21588 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69792 d!104287))

(declare-fun mapIsEmpty!22549 () Bool)

(declare-fun mapRes!22549 () Bool)

(assert (=> mapIsEmpty!22549 mapRes!22549))

(declare-fun condMapEmpty!22549 () Bool)

(declare-fun mapDefault!22549 () ValueCell!6579)

(assert (=> mapNonEmpty!22543 (= condMapEmpty!22549 (= mapRest!22543 ((as const (Array (_ BitVec 32) ValueCell!6579)) mapDefault!22549)))))

(declare-fun e!449629 () Bool)

(assert (=> mapNonEmpty!22543 (= tp!43651 (and e!449629 mapRes!22549))))

(declare-fun b!811975 () Bool)

(assert (=> b!811975 (= e!449629 tp_is_empty!13989)))

(declare-fun b!811974 () Bool)

(declare-fun e!449628 () Bool)

(assert (=> b!811974 (= e!449628 tp_is_empty!13989)))

(declare-fun mapNonEmpty!22549 () Bool)

(declare-fun tp!43657 () Bool)

(assert (=> mapNonEmpty!22549 (= mapRes!22549 (and tp!43657 e!449628))))

(declare-fun mapRest!22549 () (Array (_ BitVec 32) ValueCell!6579))

(declare-fun mapValue!22549 () ValueCell!6579)

(declare-fun mapKey!22549 () (_ BitVec 32))

(assert (=> mapNonEmpty!22549 (= mapRest!22543 (store mapRest!22549 mapKey!22549 mapValue!22549))))

(assert (= (and mapNonEmpty!22543 condMapEmpty!22549) mapIsEmpty!22549))

(assert (= (and mapNonEmpty!22543 (not condMapEmpty!22549)) mapNonEmpty!22549))

(assert (= (and mapNonEmpty!22549 ((_ is ValueCellFull!6579) mapValue!22549)) b!811974))

(assert (= (and mapNonEmpty!22543 ((_ is ValueCellFull!6579) mapDefault!22549)) b!811975))

(declare-fun m!754541 () Bool)

(assert (=> mapNonEmpty!22549 m!754541))

(check-sat (not mapNonEmpty!22549) tp_is_empty!13989)
(check-sat)
