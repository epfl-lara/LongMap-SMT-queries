; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93560 () Bool)

(assert start!93560)

(declare-fun b!1058969 () Bool)

(declare-fun e!602604 () Bool)

(declare-fun tp_is_empty!24909 () Bool)

(assert (=> b!1058969 (= e!602604 tp_is_empty!24909)))

(declare-fun b!1058970 () Bool)

(declare-fun e!602608 () Bool)

(assert (=> b!1058970 (= e!602608 tp_is_empty!24909)))

(declare-fun mapIsEmpty!39013 () Bool)

(declare-fun mapRes!39013 () Bool)

(assert (=> mapIsEmpty!39013 mapRes!39013))

(declare-fun mapNonEmpty!39013 () Bool)

(declare-fun tp!74819 () Bool)

(assert (=> mapNonEmpty!39013 (= mapRes!39013 (and tp!74819 e!602604))))

(declare-datatypes ((V!38347 0))(
  ( (V!38348 (val!12505 Int)) )
))
(declare-datatypes ((ValueCell!11751 0))(
  ( (ValueCellFull!11751 (v!15114 V!38347)) (EmptyCell!11751) )
))
(declare-fun mapValue!39013 () ValueCell!11751)

(declare-fun mapRest!39013 () (Array (_ BitVec 32) ValueCell!11751))

(declare-fun mapKey!39013 () (_ BitVec 32))

(declare-datatypes ((array!66843 0))(
  ( (array!66844 (arr!32136 (Array (_ BitVec 32) ValueCell!11751)) (size!32672 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66843)

(assert (=> mapNonEmpty!39013 (= (arr!32136 _values!955) (store mapRest!39013 mapKey!39013 mapValue!39013))))

(declare-fun res!707483 () Bool)

(declare-fun e!602606 () Bool)

(assert (=> start!93560 (=> (not res!707483) (not e!602606))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93560 (= res!707483 (validMask!0 mask!1515))))

(assert (=> start!93560 e!602606))

(assert (=> start!93560 true))

(declare-fun e!602605 () Bool)

(declare-fun array_inv!24916 (array!66843) Bool)

(assert (=> start!93560 (and (array_inv!24916 _values!955) e!602605)))

(declare-datatypes ((array!66845 0))(
  ( (array!66846 (arr!32137 (Array (_ BitVec 32) (_ BitVec 64))) (size!32673 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66845)

(declare-fun array_inv!24917 (array!66845) Bool)

(assert (=> start!93560 (array_inv!24917 _keys!1163)))

(declare-fun b!1058971 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1058971 (= e!602606 (and (= (size!32672 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32673 _keys!1163) (size!32672 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (size!32673 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)) (bvsgt #b00000000000000000000000000000000 (size!32673 _keys!1163))))))

(declare-fun b!1058972 () Bool)

(assert (=> b!1058972 (= e!602605 (and e!602608 mapRes!39013))))

(declare-fun condMapEmpty!39013 () Bool)

(declare-fun mapDefault!39013 () ValueCell!11751)

(assert (=> b!1058972 (= condMapEmpty!39013 (= (arr!32136 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11751)) mapDefault!39013)))))

(assert (= (and start!93560 res!707483) b!1058971))

(assert (= (and b!1058972 condMapEmpty!39013) mapIsEmpty!39013))

(assert (= (and b!1058972 (not condMapEmpty!39013)) mapNonEmpty!39013))

(get-info :version)

(assert (= (and mapNonEmpty!39013 ((_ is ValueCellFull!11751) mapValue!39013)) b!1058969))

(assert (= (and b!1058972 ((_ is ValueCellFull!11751) mapDefault!39013)) b!1058970))

(assert (= start!93560 b!1058972))

(declare-fun m!978575 () Bool)

(assert (=> mapNonEmpty!39013 m!978575))

(declare-fun m!978577 () Bool)

(assert (=> start!93560 m!978577))

(declare-fun m!978579 () Bool)

(assert (=> start!93560 m!978579))

(declare-fun m!978581 () Bool)

(assert (=> start!93560 m!978581))

(check-sat (not start!93560) (not mapNonEmpty!39013) tp_is_empty!24909)
(check-sat)
(get-model)

(declare-fun d!128675 () Bool)

(assert (=> d!128675 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93560 d!128675))

(declare-fun d!128677 () Bool)

(assert (=> d!128677 (= (array_inv!24916 _values!955) (bvsge (size!32672 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93560 d!128677))

(declare-fun d!128679 () Bool)

(assert (=> d!128679 (= (array_inv!24917 _keys!1163) (bvsge (size!32673 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93560 d!128679))

(declare-fun b!1058992 () Bool)

(declare-fun e!602628 () Bool)

(assert (=> b!1058992 (= e!602628 tp_is_empty!24909)))

(declare-fun b!1058991 () Bool)

(declare-fun e!602629 () Bool)

(assert (=> b!1058991 (= e!602629 tp_is_empty!24909)))

(declare-fun condMapEmpty!39019 () Bool)

(declare-fun mapDefault!39019 () ValueCell!11751)

(assert (=> mapNonEmpty!39013 (= condMapEmpty!39019 (= mapRest!39013 ((as const (Array (_ BitVec 32) ValueCell!11751)) mapDefault!39019)))))

(declare-fun mapRes!39019 () Bool)

(assert (=> mapNonEmpty!39013 (= tp!74819 (and e!602628 mapRes!39019))))

(declare-fun mapNonEmpty!39019 () Bool)

(declare-fun tp!74825 () Bool)

(assert (=> mapNonEmpty!39019 (= mapRes!39019 (and tp!74825 e!602629))))

(declare-fun mapValue!39019 () ValueCell!11751)

(declare-fun mapRest!39019 () (Array (_ BitVec 32) ValueCell!11751))

(declare-fun mapKey!39019 () (_ BitVec 32))

(assert (=> mapNonEmpty!39019 (= mapRest!39013 (store mapRest!39019 mapKey!39019 mapValue!39019))))

(declare-fun mapIsEmpty!39019 () Bool)

(assert (=> mapIsEmpty!39019 mapRes!39019))

(assert (= (and mapNonEmpty!39013 condMapEmpty!39019) mapIsEmpty!39019))

(assert (= (and mapNonEmpty!39013 (not condMapEmpty!39019)) mapNonEmpty!39019))

(assert (= (and mapNonEmpty!39019 ((_ is ValueCellFull!11751) mapValue!39019)) b!1058991))

(assert (= (and mapNonEmpty!39013 ((_ is ValueCellFull!11751) mapDefault!39019)) b!1058992))

(declare-fun m!978591 () Bool)

(assert (=> mapNonEmpty!39019 m!978591))

(check-sat (not mapNonEmpty!39019) tp_is_empty!24909)
(check-sat)
