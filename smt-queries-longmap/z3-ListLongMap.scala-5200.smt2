; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70380 () Bool)

(assert start!70380)

(declare-fun b_free!12607 () Bool)

(declare-fun b_next!12607 () Bool)

(assert (=> start!70380 (= b_free!12607 (not b_next!12607))))

(declare-fun tp!44541 () Bool)

(declare-fun b_and!21405 () Bool)

(assert (=> start!70380 (= tp!44541 b_and!21405)))

(declare-fun b!816621 () Bool)

(declare-fun res!557337 () Bool)

(declare-fun e!452952 () Bool)

(assert (=> b!816621 (=> (not res!557337) (not e!452952))))

(declare-datatypes ((array!44835 0))(
  ( (array!44836 (arr!21471 (Array (_ BitVec 32) (_ BitVec 64))) (size!21891 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44835)

(declare-datatypes ((V!24091 0))(
  ( (V!24092 (val!7206 Int)) )
))
(declare-datatypes ((ValueCell!6743 0))(
  ( (ValueCellFull!6743 (v!9633 V!24091)) (EmptyCell!6743) )
))
(declare-datatypes ((array!44837 0))(
  ( (array!44838 (arr!21472 (Array (_ BitVec 32) ValueCell!6743)) (size!21892 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44837)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816621 (= res!557337 (and (= (size!21892 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21891 _keys!976) (size!21892 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816622 () Bool)

(declare-fun e!452956 () Bool)

(declare-fun tp_is_empty!14317 () Bool)

(assert (=> b!816622 (= e!452956 tp_is_empty!14317)))

(declare-fun b!816623 () Bool)

(declare-fun e!452955 () Bool)

(declare-fun e!452951 () Bool)

(declare-fun mapRes!23062 () Bool)

(assert (=> b!816623 (= e!452955 (and e!452951 mapRes!23062))))

(declare-fun condMapEmpty!23062 () Bool)

(declare-fun mapDefault!23062 () ValueCell!6743)

(assert (=> b!816623 (= condMapEmpty!23062 (= (arr!21472 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6743)) mapDefault!23062)))))

(declare-fun res!557340 () Bool)

(assert (=> start!70380 (=> (not res!557340) (not e!452952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70380 (= res!557340 (validMask!0 mask!1312))))

(assert (=> start!70380 e!452952))

(assert (=> start!70380 tp_is_empty!14317))

(declare-fun array_inv!17219 (array!44835) Bool)

(assert (=> start!70380 (array_inv!17219 _keys!976)))

(assert (=> start!70380 true))

(declare-fun array_inv!17220 (array!44837) Bool)

(assert (=> start!70380 (and (array_inv!17220 _values!788) e!452955)))

(assert (=> start!70380 tp!44541))

(declare-fun mapNonEmpty!23062 () Bool)

(declare-fun tp!44542 () Bool)

(assert (=> mapNonEmpty!23062 (= mapRes!23062 (and tp!44542 e!452956))))

(declare-fun mapValue!23062 () ValueCell!6743)

(declare-fun mapRest!23062 () (Array (_ BitVec 32) ValueCell!6743))

(declare-fun mapKey!23062 () (_ BitVec 32))

(assert (=> mapNonEmpty!23062 (= (arr!21472 _values!788) (store mapRest!23062 mapKey!23062 mapValue!23062))))

(declare-fun mapIsEmpty!23062 () Bool)

(assert (=> mapIsEmpty!23062 mapRes!23062))

(declare-fun b!816624 () Bool)

(declare-fun res!557338 () Bool)

(assert (=> b!816624 (=> (not res!557338) (not e!452952))))

(declare-datatypes ((List!15187 0))(
  ( (Nil!15184) (Cons!15183 (h!16318 (_ BitVec 64)) (t!21500 List!15187)) )
))
(declare-fun arrayNoDuplicates!0 (array!44835 (_ BitVec 32) List!15187) Bool)

(assert (=> b!816624 (= res!557338 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15184))))

(declare-fun b!816625 () Bool)

(assert (=> b!816625 (= e!452951 tp_is_empty!14317)))

(declare-fun b!816626 () Bool)

(declare-fun e!452954 () Bool)

(assert (=> b!816626 (= e!452952 (not e!452954))))

(declare-fun res!557339 () Bool)

(assert (=> b!816626 (=> res!557339 e!452954)))

(assert (=> b!816626 (= res!557339 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9374 0))(
  ( (tuple2!9375 (_1!4698 (_ BitVec 64)) (_2!4698 V!24091)) )
))
(declare-datatypes ((List!15188 0))(
  ( (Nil!15185) (Cons!15184 (h!16319 tuple2!9374) (t!21501 List!15188)) )
))
(declare-datatypes ((ListLongMap!8199 0))(
  ( (ListLongMap!8200 (toList!4115 List!15188)) )
))
(declare-fun lt!365579 () ListLongMap!8199)

(declare-fun lt!365578 () ListLongMap!8199)

(assert (=> b!816626 (= lt!365579 lt!365578)))

(declare-fun zeroValueBefore!34 () V!24091)

(declare-fun zeroValueAfter!34 () V!24091)

(declare-fun minValue!754 () V!24091)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27797 0))(
  ( (Unit!27798) )
))
(declare-fun lt!365576 () Unit!27797)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!310 (array!44835 array!44837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 V!24091 V!24091 (_ BitVec 32) Int) Unit!27797)

(assert (=> b!816626 (= lt!365576 (lemmaNoChangeToArrayThenSameMapNoExtras!310 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2222 (array!44835 array!44837 (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 (_ BitVec 32) Int) ListLongMap!8199)

(assert (=> b!816626 (= lt!365578 (getCurrentListMapNoExtraKeys!2222 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816626 (= lt!365579 (getCurrentListMapNoExtraKeys!2222 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816627 () Bool)

(declare-fun res!557336 () Bool)

(assert (=> b!816627 (=> (not res!557336) (not e!452952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44835 (_ BitVec 32)) Bool)

(assert (=> b!816627 (= res!557336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816628 () Bool)

(assert (=> b!816628 (= e!452954 true)))

(declare-fun lt!365577 () ListLongMap!8199)

(declare-fun getCurrentListMap!2335 (array!44835 array!44837 (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 (_ BitVec 32) Int) ListLongMap!8199)

(assert (=> b!816628 (= lt!365577 (getCurrentListMap!2335 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365575 () ListLongMap!8199)

(declare-fun +!1795 (ListLongMap!8199 tuple2!9374) ListLongMap!8199)

(assert (=> b!816628 (= lt!365575 (+!1795 (getCurrentListMap!2335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70380 res!557340) b!816621))

(assert (= (and b!816621 res!557337) b!816627))

(assert (= (and b!816627 res!557336) b!816624))

(assert (= (and b!816624 res!557338) b!816626))

(assert (= (and b!816626 (not res!557339)) b!816628))

(assert (= (and b!816623 condMapEmpty!23062) mapIsEmpty!23062))

(assert (= (and b!816623 (not condMapEmpty!23062)) mapNonEmpty!23062))

(get-info :version)

(assert (= (and mapNonEmpty!23062 ((_ is ValueCellFull!6743) mapValue!23062)) b!816622))

(assert (= (and b!816623 ((_ is ValueCellFull!6743) mapDefault!23062)) b!816625))

(assert (= start!70380 b!816623))

(declare-fun m!758655 () Bool)

(assert (=> b!816626 m!758655))

(declare-fun m!758657 () Bool)

(assert (=> b!816626 m!758657))

(declare-fun m!758659 () Bool)

(assert (=> b!816626 m!758659))

(declare-fun m!758661 () Bool)

(assert (=> b!816628 m!758661))

(declare-fun m!758663 () Bool)

(assert (=> b!816628 m!758663))

(assert (=> b!816628 m!758663))

(declare-fun m!758665 () Bool)

(assert (=> b!816628 m!758665))

(declare-fun m!758667 () Bool)

(assert (=> b!816627 m!758667))

(declare-fun m!758669 () Bool)

(assert (=> b!816624 m!758669))

(declare-fun m!758671 () Bool)

(assert (=> mapNonEmpty!23062 m!758671))

(declare-fun m!758673 () Bool)

(assert (=> start!70380 m!758673))

(declare-fun m!758675 () Bool)

(assert (=> start!70380 m!758675))

(declare-fun m!758677 () Bool)

(assert (=> start!70380 m!758677))

(check-sat (not b!816628) (not b!816624) (not mapNonEmpty!23062) (not b!816627) tp_is_empty!14317 (not b_next!12607) (not b!816626) (not start!70380) b_and!21405)
(check-sat b_and!21405 (not b_next!12607))
