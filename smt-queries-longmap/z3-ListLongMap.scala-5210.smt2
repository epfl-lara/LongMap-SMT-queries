; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70458 () Bool)

(assert start!70458)

(declare-fun b_free!12667 () Bool)

(declare-fun b_next!12667 () Bool)

(assert (=> start!70458 (= b_free!12667 (not b_next!12667))))

(declare-fun tp!44725 () Bool)

(declare-fun b_and!21477 () Bool)

(assert (=> start!70458 (= tp!44725 b_and!21477)))

(declare-fun res!557869 () Bool)

(declare-fun e!453604 () Bool)

(assert (=> start!70458 (=> (not res!557869) (not e!453604))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70458 (= res!557869 (validMask!0 mask!1312))))

(assert (=> start!70458 e!453604))

(declare-fun tp_is_empty!14377 () Bool)

(assert (=> start!70458 tp_is_empty!14377))

(declare-datatypes ((array!44955 0))(
  ( (array!44956 (arr!21530 (Array (_ BitVec 32) (_ BitVec 64))) (size!21950 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44955)

(declare-fun array_inv!17259 (array!44955) Bool)

(assert (=> start!70458 (array_inv!17259 _keys!976)))

(assert (=> start!70458 true))

(declare-datatypes ((V!24171 0))(
  ( (V!24172 (val!7236 Int)) )
))
(declare-datatypes ((ValueCell!6773 0))(
  ( (ValueCellFull!6773 (v!9664 V!24171)) (EmptyCell!6773) )
))
(declare-datatypes ((array!44957 0))(
  ( (array!44958 (arr!21531 (Array (_ BitVec 32) ValueCell!6773)) (size!21951 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44957)

(declare-fun e!453602 () Bool)

(declare-fun array_inv!17260 (array!44957) Bool)

(assert (=> start!70458 (and (array_inv!17260 _values!788) e!453602)))

(assert (=> start!70458 tp!44725))

(declare-fun b!817525 () Bool)

(declare-fun res!557870 () Bool)

(assert (=> b!817525 (=> (not res!557870) (not e!453604))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817525 (= res!557870 (and (= (size!21951 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21950 _keys!976) (size!21951 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817526 () Bool)

(declare-fun e!453603 () Bool)

(assert (=> b!817526 (= e!453603 tp_is_empty!14377)))

(declare-fun b!817527 () Bool)

(declare-fun e!453606 () Bool)

(assert (=> b!817527 (= e!453604 (not e!453606))))

(declare-fun res!557872 () Bool)

(assert (=> b!817527 (=> res!557872 e!453606)))

(assert (=> b!817527 (= res!557872 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9416 0))(
  ( (tuple2!9417 (_1!4719 (_ BitVec 64)) (_2!4719 V!24171)) )
))
(declare-datatypes ((List!15229 0))(
  ( (Nil!15226) (Cons!15225 (h!16360 tuple2!9416) (t!21544 List!15229)) )
))
(declare-datatypes ((ListLongMap!8241 0))(
  ( (ListLongMap!8242 (toList!4136 List!15229)) )
))
(declare-fun lt!366149 () ListLongMap!8241)

(declare-fun lt!366150 () ListLongMap!8241)

(assert (=> b!817527 (= lt!366149 lt!366150)))

(declare-datatypes ((Unit!27831 0))(
  ( (Unit!27832) )
))
(declare-fun lt!366147 () Unit!27831)

(declare-fun zeroValueBefore!34 () V!24171)

(declare-fun zeroValueAfter!34 () V!24171)

(declare-fun minValue!754 () V!24171)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!326 (array!44955 array!44957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 V!24171 V!24171 (_ BitVec 32) Int) Unit!27831)

(assert (=> b!817527 (= lt!366147 (lemmaNoChangeToArrayThenSameMapNoExtras!326 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2238 (array!44955 array!44957 (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 (_ BitVec 32) Int) ListLongMap!8241)

(assert (=> b!817527 (= lt!366150 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817527 (= lt!366149 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23155 () Bool)

(declare-fun mapRes!23155 () Bool)

(assert (=> mapIsEmpty!23155 mapRes!23155))

(declare-fun b!817528 () Bool)

(declare-fun e!453605 () Bool)

(assert (=> b!817528 (= e!453602 (and e!453605 mapRes!23155))))

(declare-fun condMapEmpty!23155 () Bool)

(declare-fun mapDefault!23155 () ValueCell!6773)

(assert (=> b!817528 (= condMapEmpty!23155 (= (arr!21531 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6773)) mapDefault!23155)))))

(declare-fun b!817529 () Bool)

(declare-fun res!557868 () Bool)

(assert (=> b!817529 (=> (not res!557868) (not e!453604))))

(declare-datatypes ((List!15230 0))(
  ( (Nil!15227) (Cons!15226 (h!16361 (_ BitVec 64)) (t!21545 List!15230)) )
))
(declare-fun arrayNoDuplicates!0 (array!44955 (_ BitVec 32) List!15230) Bool)

(assert (=> b!817529 (= res!557868 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15227))))

(declare-fun b!817530 () Bool)

(declare-fun res!557871 () Bool)

(assert (=> b!817530 (=> (not res!557871) (not e!453604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44955 (_ BitVec 32)) Bool)

(assert (=> b!817530 (= res!557871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817531 () Bool)

(assert (=> b!817531 (= e!453606 true)))

(declare-fun lt!366148 () ListLongMap!8241)

(declare-fun getCurrentListMap!2354 (array!44955 array!44957 (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 (_ BitVec 32) Int) ListLongMap!8241)

(assert (=> b!817531 (= lt!366148 (getCurrentListMap!2354 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366151 () ListLongMap!8241)

(declare-fun +!1814 (ListLongMap!8241 tuple2!9416) ListLongMap!8241)

(assert (=> b!817531 (= lt!366151 (+!1814 (getCurrentListMap!2354 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9417 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!817532 () Bool)

(assert (=> b!817532 (= e!453605 tp_is_empty!14377)))

(declare-fun mapNonEmpty!23155 () Bool)

(declare-fun tp!44724 () Bool)

(assert (=> mapNonEmpty!23155 (= mapRes!23155 (and tp!44724 e!453603))))

(declare-fun mapRest!23155 () (Array (_ BitVec 32) ValueCell!6773))

(declare-fun mapKey!23155 () (_ BitVec 32))

(declare-fun mapValue!23155 () ValueCell!6773)

(assert (=> mapNonEmpty!23155 (= (arr!21531 _values!788) (store mapRest!23155 mapKey!23155 mapValue!23155))))

(assert (= (and start!70458 res!557869) b!817525))

(assert (= (and b!817525 res!557870) b!817530))

(assert (= (and b!817530 res!557871) b!817529))

(assert (= (and b!817529 res!557868) b!817527))

(assert (= (and b!817527 (not res!557872)) b!817531))

(assert (= (and b!817528 condMapEmpty!23155) mapIsEmpty!23155))

(assert (= (and b!817528 (not condMapEmpty!23155)) mapNonEmpty!23155))

(get-info :version)

(assert (= (and mapNonEmpty!23155 ((_ is ValueCellFull!6773) mapValue!23155)) b!817526))

(assert (= (and b!817528 ((_ is ValueCellFull!6773) mapDefault!23155)) b!817532))

(assert (= start!70458 b!817528))

(declare-fun m!759545 () Bool)

(assert (=> mapNonEmpty!23155 m!759545))

(declare-fun m!759547 () Bool)

(assert (=> b!817527 m!759547))

(declare-fun m!759549 () Bool)

(assert (=> b!817527 m!759549))

(declare-fun m!759551 () Bool)

(assert (=> b!817527 m!759551))

(declare-fun m!759553 () Bool)

(assert (=> b!817529 m!759553))

(declare-fun m!759555 () Bool)

(assert (=> start!70458 m!759555))

(declare-fun m!759557 () Bool)

(assert (=> start!70458 m!759557))

(declare-fun m!759559 () Bool)

(assert (=> start!70458 m!759559))

(declare-fun m!759561 () Bool)

(assert (=> b!817531 m!759561))

(declare-fun m!759563 () Bool)

(assert (=> b!817531 m!759563))

(assert (=> b!817531 m!759563))

(declare-fun m!759565 () Bool)

(assert (=> b!817531 m!759565))

(declare-fun m!759567 () Bool)

(assert (=> b!817530 m!759567))

(check-sat b_and!21477 (not b_next!12667) tp_is_empty!14377 (not start!70458) (not mapNonEmpty!23155) (not b!817530) (not b!817527) (not b!817529) (not b!817531))
(check-sat b_and!21477 (not b_next!12667))
