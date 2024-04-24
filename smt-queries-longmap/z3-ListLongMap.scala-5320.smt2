; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71326 () Bool)

(assert start!71326)

(declare-fun b_free!13327 () Bool)

(declare-fun b_next!13327 () Bool)

(assert (=> start!71326 (= b_free!13327 (not b_next!13327))))

(declare-fun tp!46741 () Bool)

(declare-fun b_and!22263 () Bool)

(assert (=> start!71326 (= tp!46741 b_and!22263)))

(declare-fun b!827468 () Bool)

(declare-fun res!563797 () Bool)

(declare-fun e!460892 () Bool)

(assert (=> b!827468 (=> (not res!563797) (not e!460892))))

(declare-datatypes ((array!46253 0))(
  ( (array!46254 (arr!22167 (Array (_ BitVec 32) (_ BitVec 64))) (size!22587 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46253)

(declare-datatypes ((List!15725 0))(
  ( (Nil!15722) (Cons!15721 (h!16856 (_ BitVec 64)) (t!22064 List!15725)) )
))
(declare-fun arrayNoDuplicates!0 (array!46253 (_ BitVec 32) List!15725) Bool)

(assert (=> b!827468 (= res!563797 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15722))))

(declare-fun b!827469 () Bool)

(declare-fun res!563798 () Bool)

(assert (=> b!827469 (=> (not res!563798) (not e!460892))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46253 (_ BitVec 32)) Bool)

(assert (=> b!827469 (= res!563798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24181 () Bool)

(declare-fun mapRes!24181 () Bool)

(declare-fun tp!46740 () Bool)

(declare-fun e!460893 () Bool)

(assert (=> mapNonEmpty!24181 (= mapRes!24181 (and tp!46740 e!460893))))

(declare-datatypes ((V!25051 0))(
  ( (V!25052 (val!7566 Int)) )
))
(declare-datatypes ((ValueCell!7103 0))(
  ( (ValueCellFull!7103 (v!10000 V!25051)) (EmptyCell!7103) )
))
(declare-datatypes ((array!46255 0))(
  ( (array!46256 (arr!22168 (Array (_ BitVec 32) ValueCell!7103)) (size!22588 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46255)

(declare-fun mapKey!24181 () (_ BitVec 32))

(declare-fun mapValue!24181 () ValueCell!7103)

(declare-fun mapRest!24181 () (Array (_ BitVec 32) ValueCell!7103))

(assert (=> mapNonEmpty!24181 (= (arr!22168 _values!788) (store mapRest!24181 mapKey!24181 mapValue!24181))))

(declare-fun b!827470 () Bool)

(declare-fun e!460889 () Bool)

(assert (=> b!827470 (= e!460889 true)))

(declare-datatypes ((tuple2!9948 0))(
  ( (tuple2!9949 (_1!4985 (_ BitVec 64)) (_2!4985 V!25051)) )
))
(declare-fun lt!374518 () tuple2!9948)

(declare-datatypes ((List!15726 0))(
  ( (Nil!15723) (Cons!15722 (h!16857 tuple2!9948) (t!22065 List!15726)) )
))
(declare-datatypes ((ListLongMap!8773 0))(
  ( (ListLongMap!8774 (toList!4402 List!15726)) )
))
(declare-fun lt!374511 () ListLongMap!8773)

(declare-fun lt!374515 () ListLongMap!8773)

(declare-fun lt!374505 () tuple2!9948)

(declare-fun +!1948 (ListLongMap!8773 tuple2!9948) ListLongMap!8773)

(assert (=> b!827470 (= lt!374515 (+!1948 (+!1948 lt!374511 lt!374505) lt!374518))))

(declare-fun lt!374512 () ListLongMap!8773)

(declare-fun lt!374516 () ListLongMap!8773)

(declare-fun lt!374517 () ListLongMap!8773)

(assert (=> b!827470 (and (= lt!374512 lt!374516) (= lt!374517 lt!374516) (= lt!374517 lt!374512))))

(declare-fun lt!374509 () ListLongMap!8773)

(assert (=> b!827470 (= lt!374516 (+!1948 lt!374509 lt!374505))))

(declare-fun lt!374514 () ListLongMap!8773)

(assert (=> b!827470 (= lt!374512 (+!1948 lt!374514 lt!374505))))

(declare-fun zeroValueBefore!34 () V!25051)

(declare-fun zeroValueAfter!34 () V!25051)

(declare-datatypes ((Unit!28356 0))(
  ( (Unit!28357) )
))
(declare-fun lt!374507 () Unit!28356)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!232 (ListLongMap!8773 (_ BitVec 64) V!25051 V!25051) Unit!28356)

(assert (=> b!827470 (= lt!374507 (addSameAsAddTwiceSameKeyDiffValues!232 lt!374514 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460890 () Bool)

(assert (=> b!827470 e!460890))

(declare-fun res!563800 () Bool)

(assert (=> b!827470 (=> (not res!563800) (not e!460890))))

(declare-fun lt!374513 () ListLongMap!8773)

(assert (=> b!827470 (= res!563800 (= lt!374513 lt!374509))))

(declare-fun lt!374508 () tuple2!9948)

(assert (=> b!827470 (= lt!374509 (+!1948 lt!374514 lt!374508))))

(assert (=> b!827470 (= lt!374514 (+!1948 lt!374511 lt!374518))))

(assert (=> b!827470 (= lt!374505 (tuple2!9949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460888 () Bool)

(assert (=> b!827470 e!460888))

(declare-fun res!563799 () Bool)

(assert (=> b!827470 (=> (not res!563799) (not e!460888))))

(assert (=> b!827470 (= res!563799 (= lt!374513 (+!1948 (+!1948 lt!374511 lt!374508) lt!374518)))))

(declare-fun minValue!754 () V!25051)

(assert (=> b!827470 (= lt!374518 (tuple2!9949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827470 (= lt!374508 (tuple2!9949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2523 (array!46253 array!46255 (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!827470 (= lt!374517 (getCurrentListMap!2523 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827470 (= lt!374513 (getCurrentListMap!2523 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827472 () Bool)

(declare-fun lt!374506 () ListLongMap!8773)

(assert (=> b!827472 (= e!460890 (= lt!374517 (+!1948 (+!1948 lt!374506 lt!374518) lt!374505)))))

(declare-fun b!827473 () Bool)

(declare-fun e!460886 () Bool)

(declare-fun tp_is_empty!15037 () Bool)

(assert (=> b!827473 (= e!460886 tp_is_empty!15037)))

(declare-fun b!827474 () Bool)

(assert (=> b!827474 (= e!460888 (= lt!374517 (+!1948 (+!1948 lt!374506 (tuple2!9949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374518)))))

(declare-fun b!827475 () Bool)

(assert (=> b!827475 (= e!460892 (not e!460889))))

(declare-fun res!563802 () Bool)

(assert (=> b!827475 (=> res!563802 e!460889)))

(assert (=> b!827475 (= res!563802 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827475 (= lt!374511 lt!374506)))

(declare-fun lt!374510 () Unit!28356)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!568 (array!46253 array!46255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 V!25051 V!25051 (_ BitVec 32) Int) Unit!28356)

(assert (=> b!827475 (= lt!374510 (lemmaNoChangeToArrayThenSameMapNoExtras!568 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2480 (array!46253 array!46255 (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!827475 (= lt!374506 (getCurrentListMapNoExtraKeys!2480 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827475 (= lt!374511 (getCurrentListMapNoExtraKeys!2480 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24181 () Bool)

(assert (=> mapIsEmpty!24181 mapRes!24181))

(declare-fun res!563803 () Bool)

(assert (=> start!71326 (=> (not res!563803) (not e!460892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71326 (= res!563803 (validMask!0 mask!1312))))

(assert (=> start!71326 e!460892))

(assert (=> start!71326 tp_is_empty!15037))

(declare-fun array_inv!17709 (array!46253) Bool)

(assert (=> start!71326 (array_inv!17709 _keys!976)))

(assert (=> start!71326 true))

(declare-fun e!460887 () Bool)

(declare-fun array_inv!17710 (array!46255) Bool)

(assert (=> start!71326 (and (array_inv!17710 _values!788) e!460887)))

(assert (=> start!71326 tp!46741))

(declare-fun b!827471 () Bool)

(assert (=> b!827471 (= e!460887 (and e!460886 mapRes!24181))))

(declare-fun condMapEmpty!24181 () Bool)

(declare-fun mapDefault!24181 () ValueCell!7103)

(assert (=> b!827471 (= condMapEmpty!24181 (= (arr!22168 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7103)) mapDefault!24181)))))

(declare-fun b!827476 () Bool)

(assert (=> b!827476 (= e!460893 tp_is_empty!15037)))

(declare-fun b!827477 () Bool)

(declare-fun res!563801 () Bool)

(assert (=> b!827477 (=> (not res!563801) (not e!460892))))

(assert (=> b!827477 (= res!563801 (and (= (size!22588 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22587 _keys!976) (size!22588 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71326 res!563803) b!827477))

(assert (= (and b!827477 res!563801) b!827469))

(assert (= (and b!827469 res!563798) b!827468))

(assert (= (and b!827468 res!563797) b!827475))

(assert (= (and b!827475 (not res!563802)) b!827470))

(assert (= (and b!827470 res!563799) b!827474))

(assert (= (and b!827470 res!563800) b!827472))

(assert (= (and b!827471 condMapEmpty!24181) mapIsEmpty!24181))

(assert (= (and b!827471 (not condMapEmpty!24181)) mapNonEmpty!24181))

(get-info :version)

(assert (= (and mapNonEmpty!24181 ((_ is ValueCellFull!7103) mapValue!24181)) b!827476))

(assert (= (and b!827471 ((_ is ValueCellFull!7103) mapDefault!24181)) b!827473))

(assert (= start!71326 b!827471))

(declare-fun m!770677 () Bool)

(assert (=> b!827470 m!770677))

(declare-fun m!770679 () Bool)

(assert (=> b!827470 m!770679))

(assert (=> b!827470 m!770677))

(declare-fun m!770681 () Bool)

(assert (=> b!827470 m!770681))

(declare-fun m!770683 () Bool)

(assert (=> b!827470 m!770683))

(declare-fun m!770685 () Bool)

(assert (=> b!827470 m!770685))

(declare-fun m!770687 () Bool)

(assert (=> b!827470 m!770687))

(declare-fun m!770689 () Bool)

(assert (=> b!827470 m!770689))

(declare-fun m!770691 () Bool)

(assert (=> b!827470 m!770691))

(declare-fun m!770693 () Bool)

(assert (=> b!827470 m!770693))

(assert (=> b!827470 m!770691))

(declare-fun m!770695 () Bool)

(assert (=> b!827470 m!770695))

(declare-fun m!770697 () Bool)

(assert (=> b!827470 m!770697))

(declare-fun m!770699 () Bool)

(assert (=> b!827472 m!770699))

(assert (=> b!827472 m!770699))

(declare-fun m!770701 () Bool)

(assert (=> b!827472 m!770701))

(declare-fun m!770703 () Bool)

(assert (=> b!827469 m!770703))

(declare-fun m!770705 () Bool)

(assert (=> b!827474 m!770705))

(assert (=> b!827474 m!770705))

(declare-fun m!770707 () Bool)

(assert (=> b!827474 m!770707))

(declare-fun m!770709 () Bool)

(assert (=> b!827468 m!770709))

(declare-fun m!770711 () Bool)

(assert (=> b!827475 m!770711))

(declare-fun m!770713 () Bool)

(assert (=> b!827475 m!770713))

(declare-fun m!770715 () Bool)

(assert (=> b!827475 m!770715))

(declare-fun m!770717 () Bool)

(assert (=> mapNonEmpty!24181 m!770717))

(declare-fun m!770719 () Bool)

(assert (=> start!71326 m!770719))

(declare-fun m!770721 () Bool)

(assert (=> start!71326 m!770721))

(declare-fun m!770723 () Bool)

(assert (=> start!71326 m!770723))

(check-sat (not b!827469) (not mapNonEmpty!24181) (not b!827468) (not b!827472) tp_is_empty!15037 (not b!827474) (not start!71326) (not b_next!13327) b_and!22263 (not b!827470) (not b!827475))
(check-sat b_and!22263 (not b_next!13327))
