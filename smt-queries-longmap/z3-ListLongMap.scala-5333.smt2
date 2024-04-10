; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71260 () Bool)

(assert start!71260)

(declare-fun b_free!13407 () Bool)

(declare-fun b_next!13407 () Bool)

(assert (=> start!71260 (= b_free!13407 (not b_next!13407))))

(declare-fun tp!46984 () Bool)

(declare-fun b_and!22345 () Bool)

(assert (=> start!71260 (= tp!46984 b_and!22345)))

(declare-fun b!827722 () Bool)

(declare-fun e!461142 () Bool)

(declare-fun tp_is_empty!15117 () Bool)

(assert (=> b!827722 (= e!461142 tp_is_empty!15117)))

(declare-fun mapNonEmpty!24304 () Bool)

(declare-fun mapRes!24304 () Bool)

(declare-fun tp!46983 () Bool)

(assert (=> mapNonEmpty!24304 (= mapRes!24304 (and tp!46983 e!461142))))

(declare-datatypes ((V!25157 0))(
  ( (V!25158 (val!7606 Int)) )
))
(declare-datatypes ((ValueCell!7143 0))(
  ( (ValueCellFull!7143 (v!10041 V!25157)) (EmptyCell!7143) )
))
(declare-fun mapValue!24304 () ValueCell!7143)

(declare-fun mapKey!24304 () (_ BitVec 32))

(declare-datatypes ((array!46400 0))(
  ( (array!46401 (arr!22244 (Array (_ BitVec 32) ValueCell!7143)) (size!22665 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46400)

(declare-fun mapRest!24304 () (Array (_ BitVec 32) ValueCell!7143))

(assert (=> mapNonEmpty!24304 (= (arr!22244 _values!788) (store mapRest!24304 mapKey!24304 mapValue!24304))))

(declare-fun res!564139 () Bool)

(declare-fun e!461140 () Bool)

(assert (=> start!71260 (=> (not res!564139) (not e!461140))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71260 (= res!564139 (validMask!0 mask!1312))))

(assert (=> start!71260 e!461140))

(assert (=> start!71260 tp_is_empty!15117))

(declare-datatypes ((array!46402 0))(
  ( (array!46403 (arr!22245 (Array (_ BitVec 32) (_ BitVec 64))) (size!22666 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46402)

(declare-fun array_inv!17723 (array!46402) Bool)

(assert (=> start!71260 (array_inv!17723 _keys!976)))

(assert (=> start!71260 true))

(declare-fun e!461141 () Bool)

(declare-fun array_inv!17724 (array!46400) Bool)

(assert (=> start!71260 (and (array_inv!17724 _values!788) e!461141)))

(assert (=> start!71260 tp!46984))

(declare-fun b!827723 () Bool)

(declare-fun e!461143 () Bool)

(assert (=> b!827723 (= e!461143 tp_is_empty!15117)))

(declare-fun b!827724 () Bool)

(declare-fun res!564138 () Bool)

(assert (=> b!827724 (=> (not res!564138) (not e!461140))))

(declare-datatypes ((List!15876 0))(
  ( (Nil!15873) (Cons!15872 (h!17001 (_ BitVec 64)) (t!22225 List!15876)) )
))
(declare-fun arrayNoDuplicates!0 (array!46402 (_ BitVec 32) List!15876) Bool)

(assert (=> b!827724 (= res!564138 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15873))))

(declare-fun b!827725 () Bool)

(assert (=> b!827725 (= e!461141 (and e!461143 mapRes!24304))))

(declare-fun condMapEmpty!24304 () Bool)

(declare-fun mapDefault!24304 () ValueCell!7143)

(assert (=> b!827725 (= condMapEmpty!24304 (= (arr!22244 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7143)) mapDefault!24304)))))

(declare-fun b!827726 () Bool)

(assert (=> b!827726 (= e!461140 false)))

(declare-datatypes ((tuple2!10082 0))(
  ( (tuple2!10083 (_1!5052 (_ BitVec 64)) (_2!5052 V!25157)) )
))
(declare-datatypes ((List!15877 0))(
  ( (Nil!15874) (Cons!15873 (h!17002 tuple2!10082) (t!22226 List!15877)) )
))
(declare-datatypes ((ListLongMap!8905 0))(
  ( (ListLongMap!8906 (toList!4468 List!15877)) )
))
(declare-fun lt!374986 () ListLongMap!8905)

(declare-fun zeroValueAfter!34 () V!25157)

(declare-fun minValue!754 () V!25157)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2470 (array!46402 array!46400 (_ BitVec 32) (_ BitVec 32) V!25157 V!25157 (_ BitVec 32) Int) ListLongMap!8905)

(assert (=> b!827726 (= lt!374986 (getCurrentListMapNoExtraKeys!2470 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374987 () ListLongMap!8905)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueBefore!34 () V!25157)

(assert (=> b!827726 (= lt!374987 (getCurrentListMapNoExtraKeys!2470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24304 () Bool)

(assert (=> mapIsEmpty!24304 mapRes!24304))

(declare-fun b!827727 () Bool)

(declare-fun res!564140 () Bool)

(assert (=> b!827727 (=> (not res!564140) (not e!461140))))

(assert (=> b!827727 (= res!564140 (and (= (size!22665 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22666 _keys!976) (size!22665 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827728 () Bool)

(declare-fun res!564137 () Bool)

(assert (=> b!827728 (=> (not res!564137) (not e!461140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46402 (_ BitVec 32)) Bool)

(assert (=> b!827728 (= res!564137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71260 res!564139) b!827727))

(assert (= (and b!827727 res!564140) b!827728))

(assert (= (and b!827728 res!564137) b!827724))

(assert (= (and b!827724 res!564138) b!827726))

(assert (= (and b!827725 condMapEmpty!24304) mapIsEmpty!24304))

(assert (= (and b!827725 (not condMapEmpty!24304)) mapNonEmpty!24304))

(get-info :version)

(assert (= (and mapNonEmpty!24304 ((_ is ValueCellFull!7143) mapValue!24304)) b!827722))

(assert (= (and b!827725 ((_ is ValueCellFull!7143) mapDefault!24304)) b!827723))

(assert (= start!71260 b!827725))

(declare-fun m!770735 () Bool)

(assert (=> b!827726 m!770735))

(declare-fun m!770737 () Bool)

(assert (=> b!827726 m!770737))

(declare-fun m!770739 () Bool)

(assert (=> b!827728 m!770739))

(declare-fun m!770741 () Bool)

(assert (=> mapNonEmpty!24304 m!770741))

(declare-fun m!770743 () Bool)

(assert (=> b!827724 m!770743))

(declare-fun m!770745 () Bool)

(assert (=> start!71260 m!770745))

(declare-fun m!770747 () Bool)

(assert (=> start!71260 m!770747))

(declare-fun m!770749 () Bool)

(assert (=> start!71260 m!770749))

(check-sat b_and!22345 (not start!71260) (not b!827728) (not b_next!13407) (not b!827726) (not b!827724) tp_is_empty!15117 (not mapNonEmpty!24304))
(check-sat b_and!22345 (not b_next!13407))
