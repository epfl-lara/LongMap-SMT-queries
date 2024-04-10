; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70378 () Bool)

(assert start!70378)

(declare-fun b_free!12735 () Bool)

(declare-fun b_next!12735 () Bool)

(assert (=> start!70378 (= b_free!12735 (not b_next!12735))))

(declare-fun tp!44931 () Bool)

(declare-fun b_and!21547 () Bool)

(assert (=> start!70378 (= tp!44931 b_and!21547)))

(declare-fun b!817572 () Bool)

(declare-fun e!453688 () Bool)

(assert (=> b!817572 (= e!453688 (not true))))

(declare-datatypes ((V!24261 0))(
  ( (V!24262 (val!7270 Int)) )
))
(declare-datatypes ((tuple2!9552 0))(
  ( (tuple2!9553 (_1!4787 (_ BitVec 64)) (_2!4787 V!24261)) )
))
(declare-datatypes ((List!15383 0))(
  ( (Nil!15380) (Cons!15379 (h!16508 tuple2!9552) (t!21708 List!15383)) )
))
(declare-datatypes ((ListLongMap!8375 0))(
  ( (ListLongMap!8376 (toList!4203 List!15383)) )
))
(declare-fun lt!366309 () ListLongMap!8375)

(declare-fun lt!366308 () ListLongMap!8375)

(assert (=> b!817572 (= lt!366309 lt!366308)))

(declare-fun zeroValueBefore!34 () V!24261)

(declare-datatypes ((array!45088 0))(
  ( (array!45089 (arr!21600 (Array (_ BitVec 32) (_ BitVec 64))) (size!22021 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45088)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24261)

(declare-fun minValue!754 () V!24261)

(declare-datatypes ((ValueCell!6807 0))(
  ( (ValueCellFull!6807 (v!9699 V!24261)) (EmptyCell!6807) )
))
(declare-datatypes ((array!45090 0))(
  ( (array!45091 (arr!21601 (Array (_ BitVec 32) ValueCell!6807)) (size!22022 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45090)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27890 0))(
  ( (Unit!27891) )
))
(declare-fun lt!366307 () Unit!27890)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!354 (array!45088 array!45090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24261 V!24261 V!24261 V!24261 (_ BitVec 32) Int) Unit!27890)

(assert (=> b!817572 (= lt!366307 (lemmaNoChangeToArrayThenSameMapNoExtras!354 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2244 (array!45088 array!45090 (_ BitVec 32) (_ BitVec 32) V!24261 V!24261 (_ BitVec 32) Int) ListLongMap!8375)

(assert (=> b!817572 (= lt!366308 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817572 (= lt!366309 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817573 () Bool)

(declare-fun res!558055 () Bool)

(assert (=> b!817573 (=> (not res!558055) (not e!453688))))

(assert (=> b!817573 (= res!558055 (and (= (size!22022 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22021 _keys!976) (size!22022 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23260 () Bool)

(declare-fun mapRes!23260 () Bool)

(assert (=> mapIsEmpty!23260 mapRes!23260))

(declare-fun mapNonEmpty!23260 () Bool)

(declare-fun tp!44932 () Bool)

(declare-fun e!453690 () Bool)

(assert (=> mapNonEmpty!23260 (= mapRes!23260 (and tp!44932 e!453690))))

(declare-fun mapRest!23260 () (Array (_ BitVec 32) ValueCell!6807))

(declare-fun mapValue!23260 () ValueCell!6807)

(declare-fun mapKey!23260 () (_ BitVec 32))

(assert (=> mapNonEmpty!23260 (= (arr!21601 _values!788) (store mapRest!23260 mapKey!23260 mapValue!23260))))

(declare-fun b!817574 () Bool)

(declare-fun res!558056 () Bool)

(assert (=> b!817574 (=> (not res!558056) (not e!453688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45088 (_ BitVec 32)) Bool)

(assert (=> b!817574 (= res!558056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817575 () Bool)

(declare-fun e!453689 () Bool)

(declare-fun e!453687 () Bool)

(assert (=> b!817575 (= e!453689 (and e!453687 mapRes!23260))))

(declare-fun condMapEmpty!23260 () Bool)

(declare-fun mapDefault!23260 () ValueCell!6807)

(assert (=> b!817575 (= condMapEmpty!23260 (= (arr!21601 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6807)) mapDefault!23260)))))

(declare-fun res!558057 () Bool)

(assert (=> start!70378 (=> (not res!558057) (not e!453688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70378 (= res!558057 (validMask!0 mask!1312))))

(assert (=> start!70378 e!453688))

(declare-fun tp_is_empty!14445 () Bool)

(assert (=> start!70378 tp_is_empty!14445))

(declare-fun array_inv!17279 (array!45088) Bool)

(assert (=> start!70378 (array_inv!17279 _keys!976)))

(assert (=> start!70378 true))

(declare-fun array_inv!17280 (array!45090) Bool)

(assert (=> start!70378 (and (array_inv!17280 _values!788) e!453689)))

(assert (=> start!70378 tp!44931))

(declare-fun b!817576 () Bool)

(assert (=> b!817576 (= e!453687 tp_is_empty!14445)))

(declare-fun b!817577 () Bool)

(assert (=> b!817577 (= e!453690 tp_is_empty!14445)))

(declare-fun b!817578 () Bool)

(declare-fun res!558058 () Bool)

(assert (=> b!817578 (=> (not res!558058) (not e!453688))))

(declare-datatypes ((List!15384 0))(
  ( (Nil!15381) (Cons!15380 (h!16509 (_ BitVec 64)) (t!21709 List!15384)) )
))
(declare-fun arrayNoDuplicates!0 (array!45088 (_ BitVec 32) List!15384) Bool)

(assert (=> b!817578 (= res!558058 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15381))))

(assert (= (and start!70378 res!558057) b!817573))

(assert (= (and b!817573 res!558055) b!817574))

(assert (= (and b!817574 res!558056) b!817578))

(assert (= (and b!817578 res!558058) b!817572))

(assert (= (and b!817575 condMapEmpty!23260) mapIsEmpty!23260))

(assert (= (and b!817575 (not condMapEmpty!23260)) mapNonEmpty!23260))

(get-info :version)

(assert (= (and mapNonEmpty!23260 ((_ is ValueCellFull!6807) mapValue!23260)) b!817577))

(assert (= (and b!817575 ((_ is ValueCellFull!6807) mapDefault!23260)) b!817576))

(assert (= start!70378 b!817575))

(declare-fun m!759135 () Bool)

(assert (=> b!817574 m!759135))

(declare-fun m!759137 () Bool)

(assert (=> b!817572 m!759137))

(declare-fun m!759139 () Bool)

(assert (=> b!817572 m!759139))

(declare-fun m!759141 () Bool)

(assert (=> b!817572 m!759141))

(declare-fun m!759143 () Bool)

(assert (=> b!817578 m!759143))

(declare-fun m!759145 () Bool)

(assert (=> start!70378 m!759145))

(declare-fun m!759147 () Bool)

(assert (=> start!70378 m!759147))

(declare-fun m!759149 () Bool)

(assert (=> start!70378 m!759149))

(declare-fun m!759151 () Bool)

(assert (=> mapNonEmpty!23260 m!759151))

(check-sat (not b!817578) (not b!817574) (not start!70378) b_and!21547 tp_is_empty!14445 (not mapNonEmpty!23260) (not b!817572) (not b_next!12735))
(check-sat b_and!21547 (not b_next!12735))
