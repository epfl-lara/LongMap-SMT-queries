; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71184 () Bool)

(assert start!71184)

(declare-fun b_free!13351 () Bool)

(declare-fun b_next!13351 () Bool)

(assert (=> start!71184 (= b_free!13351 (not b_next!13351))))

(declare-fun tp!46815 () Bool)

(declare-fun b_and!22263 () Bool)

(assert (=> start!71184 (= tp!46815 b_and!22263)))

(declare-fun mapNonEmpty!24220 () Bool)

(declare-fun mapRes!24220 () Bool)

(declare-fun tp!46816 () Bool)

(declare-fun e!460571 () Bool)

(assert (=> mapNonEmpty!24220 (= mapRes!24220 (and tp!46816 e!460571))))

(declare-datatypes ((V!25083 0))(
  ( (V!25084 (val!7578 Int)) )
))
(declare-datatypes ((ValueCell!7115 0))(
  ( (ValueCellFull!7115 (v!10007 V!25083)) (EmptyCell!7115) )
))
(declare-fun mapValue!24220 () ValueCell!7115)

(declare-datatypes ((array!46265 0))(
  ( (array!46266 (arr!22177 (Array (_ BitVec 32) ValueCell!7115)) (size!22598 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46265)

(declare-fun mapRest!24220 () (Array (_ BitVec 32) ValueCell!7115))

(declare-fun mapKey!24220 () (_ BitVec 32))

(assert (=> mapNonEmpty!24220 (= (arr!22177 _values!788) (store mapRest!24220 mapKey!24220 mapValue!24220))))

(declare-fun mapIsEmpty!24220 () Bool)

(assert (=> mapIsEmpty!24220 mapRes!24220))

(declare-fun res!563698 () Bool)

(declare-fun e!460570 () Bool)

(assert (=> start!71184 (=> (not res!563698) (not e!460570))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71184 (= res!563698 (validMask!0 mask!1312))))

(assert (=> start!71184 e!460570))

(declare-fun tp_is_empty!15061 () Bool)

(assert (=> start!71184 tp_is_empty!15061))

(declare-datatypes ((array!46267 0))(
  ( (array!46268 (arr!22178 (Array (_ BitVec 32) (_ BitVec 64))) (size!22599 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46267)

(declare-fun array_inv!17741 (array!46267) Bool)

(assert (=> start!71184 (array_inv!17741 _keys!976)))

(assert (=> start!71184 true))

(declare-fun e!460573 () Bool)

(declare-fun array_inv!17742 (array!46265) Bool)

(assert (=> start!71184 (and (array_inv!17742 _values!788) e!460573)))

(assert (=> start!71184 tp!46815))

(declare-fun b!826888 () Bool)

(assert (=> b!826888 (= e!460571 tp_is_empty!15061)))

(declare-fun b!826889 () Bool)

(declare-fun res!563697 () Bool)

(assert (=> b!826889 (=> (not res!563697) (not e!460570))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826889 (= res!563697 (and (= (size!22598 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22599 _keys!976) (size!22598 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826890 () Bool)

(declare-fun e!460572 () Bool)

(assert (=> b!826890 (= e!460572 tp_is_empty!15061)))

(declare-fun b!826891 () Bool)

(declare-fun res!563695 () Bool)

(assert (=> b!826891 (=> (not res!563695) (not e!460570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46267 (_ BitVec 32)) Bool)

(assert (=> b!826891 (= res!563695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826892 () Bool)

(assert (=> b!826892 (= e!460573 (and e!460572 mapRes!24220))))

(declare-fun condMapEmpty!24220 () Bool)

(declare-fun mapDefault!24220 () ValueCell!7115)

(assert (=> b!826892 (= condMapEmpty!24220 (= (arr!22177 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7115)) mapDefault!24220)))))

(declare-fun b!826893 () Bool)

(assert (=> b!826893 (= e!460570 (not true))))

(declare-datatypes ((tuple2!10054 0))(
  ( (tuple2!10055 (_1!5038 (_ BitVec 64)) (_2!5038 V!25083)) )
))
(declare-datatypes ((List!15841 0))(
  ( (Nil!15838) (Cons!15837 (h!16966 tuple2!10054) (t!22181 List!15841)) )
))
(declare-datatypes ((ListLongMap!8867 0))(
  ( (ListLongMap!8868 (toList!4449 List!15841)) )
))
(declare-fun lt!374568 () ListLongMap!8867)

(declare-fun lt!374570 () ListLongMap!8867)

(assert (=> b!826893 (= lt!374568 lt!374570)))

(declare-fun zeroValueBefore!34 () V!25083)

(declare-fun zeroValueAfter!34 () V!25083)

(declare-fun minValue!754 () V!25083)

(declare-datatypes ((Unit!28313 0))(
  ( (Unit!28314) )
))
(declare-fun lt!374569 () Unit!28313)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!574 (array!46267 array!46265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 V!25083 V!25083 (_ BitVec 32) Int) Unit!28313)

(assert (=> b!826893 (= lt!374569 (lemmaNoChangeToArrayThenSameMapNoExtras!574 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2481 (array!46267 array!46265 (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 (_ BitVec 32) Int) ListLongMap!8867)

(assert (=> b!826893 (= lt!374570 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826893 (= lt!374568 (getCurrentListMapNoExtraKeys!2481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826894 () Bool)

(declare-fun res!563696 () Bool)

(assert (=> b!826894 (=> (not res!563696) (not e!460570))))

(declare-datatypes ((List!15842 0))(
  ( (Nil!15839) (Cons!15838 (h!16967 (_ BitVec 64)) (t!22182 List!15842)) )
))
(declare-fun arrayNoDuplicates!0 (array!46267 (_ BitVec 32) List!15842) Bool)

(assert (=> b!826894 (= res!563696 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15839))))

(assert (= (and start!71184 res!563698) b!826889))

(assert (= (and b!826889 res!563697) b!826891))

(assert (= (and b!826891 res!563695) b!826894))

(assert (= (and b!826894 res!563696) b!826893))

(assert (= (and b!826892 condMapEmpty!24220) mapIsEmpty!24220))

(assert (= (and b!826892 (not condMapEmpty!24220)) mapNonEmpty!24220))

(get-info :version)

(assert (= (and mapNonEmpty!24220 ((_ is ValueCellFull!7115) mapValue!24220)) b!826888))

(assert (= (and b!826892 ((_ is ValueCellFull!7115) mapDefault!24220)) b!826890))

(assert (= start!71184 b!826892))

(declare-fun m!769529 () Bool)

(assert (=> b!826894 m!769529))

(declare-fun m!769531 () Bool)

(assert (=> start!71184 m!769531))

(declare-fun m!769533 () Bool)

(assert (=> start!71184 m!769533))

(declare-fun m!769535 () Bool)

(assert (=> start!71184 m!769535))

(declare-fun m!769537 () Bool)

(assert (=> mapNonEmpty!24220 m!769537))

(declare-fun m!769539 () Bool)

(assert (=> b!826893 m!769539))

(declare-fun m!769541 () Bool)

(assert (=> b!826893 m!769541))

(declare-fun m!769543 () Bool)

(assert (=> b!826893 m!769543))

(declare-fun m!769545 () Bool)

(assert (=> b!826891 m!769545))

(check-sat (not b!826894) (not mapNonEmpty!24220) (not start!71184) b_and!22263 (not b!826893) (not b!826891) (not b_next!13351) tp_is_empty!15061)
(check-sat b_and!22263 (not b_next!13351))
