; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70350 () Bool)

(assert start!70350)

(declare-fun b_free!12727 () Bool)

(declare-fun b_next!12727 () Bool)

(assert (=> start!70350 (= b_free!12727 (not b_next!12727))))

(declare-fun tp!44908 () Bool)

(declare-fun b_and!21513 () Bool)

(assert (=> start!70350 (= tp!44908 b_and!21513)))

(declare-fun mapIsEmpty!23248 () Bool)

(declare-fun mapRes!23248 () Bool)

(assert (=> mapIsEmpty!23248 mapRes!23248))

(declare-fun mapNonEmpty!23248 () Bool)

(declare-fun tp!44907 () Bool)

(declare-fun e!453479 () Bool)

(assert (=> mapNonEmpty!23248 (= mapRes!23248 (and tp!44907 e!453479))))

(declare-fun mapKey!23248 () (_ BitVec 32))

(declare-datatypes ((V!24251 0))(
  ( (V!24252 (val!7266 Int)) )
))
(declare-datatypes ((ValueCell!6803 0))(
  ( (ValueCellFull!6803 (v!9689 V!24251)) (EmptyCell!6803) )
))
(declare-fun mapRest!23248 () (Array (_ BitVec 32) ValueCell!6803))

(declare-datatypes ((array!45051 0))(
  ( (array!45052 (arr!21582 (Array (_ BitVec 32) ValueCell!6803)) (size!22003 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45051)

(declare-fun mapValue!23248 () ValueCell!6803)

(assert (=> mapNonEmpty!23248 (= (arr!21582 _values!788) (store mapRest!23248 mapKey!23248 mapValue!23248))))

(declare-fun b!817242 () Bool)

(declare-fun e!453477 () Bool)

(declare-fun tp_is_empty!14437 () Bool)

(assert (=> b!817242 (= e!453477 tp_is_empty!14437)))

(declare-fun b!817243 () Bool)

(declare-fun e!453478 () Bool)

(assert (=> b!817243 (= e!453478 (and e!453477 mapRes!23248))))

(declare-fun condMapEmpty!23248 () Bool)

(declare-fun mapDefault!23248 () ValueCell!6803)

(assert (=> b!817243 (= condMapEmpty!23248 (= (arr!21582 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6803)) mapDefault!23248)))))

(declare-fun b!817244 () Bool)

(declare-fun res!557903 () Bool)

(declare-fun e!453480 () Bool)

(assert (=> b!817244 (=> (not res!557903) (not e!453480))))

(declare-datatypes ((array!45053 0))(
  ( (array!45054 (arr!21583 (Array (_ BitVec 32) (_ BitVec 64))) (size!22004 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45053)

(declare-datatypes ((List!15387 0))(
  ( (Nil!15384) (Cons!15383 (h!16512 (_ BitVec 64)) (t!21703 List!15387)) )
))
(declare-fun arrayNoDuplicates!0 (array!45053 (_ BitVec 32) List!15387) Bool)

(assert (=> b!817244 (= res!557903 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15384))))

(declare-fun b!817245 () Bool)

(declare-fun res!557901 () Bool)

(assert (=> b!817245 (=> (not res!557901) (not e!453480))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817245 (= res!557901 (and (= (size!22003 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22004 _keys!976) (size!22003 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557902 () Bool)

(assert (=> start!70350 (=> (not res!557902) (not e!453480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70350 (= res!557902 (validMask!0 mask!1312))))

(assert (=> start!70350 e!453480))

(assert (=> start!70350 tp_is_empty!14437))

(declare-fun array_inv!17333 (array!45053) Bool)

(assert (=> start!70350 (array_inv!17333 _keys!976)))

(assert (=> start!70350 true))

(declare-fun array_inv!17334 (array!45051) Bool)

(assert (=> start!70350 (and (array_inv!17334 _values!788) e!453478)))

(assert (=> start!70350 tp!44908))

(declare-fun b!817246 () Bool)

(declare-fun res!557904 () Bool)

(assert (=> b!817246 (=> (not res!557904) (not e!453480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45053 (_ BitVec 32)) Bool)

(assert (=> b!817246 (= res!557904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817247 () Bool)

(assert (=> b!817247 (= e!453480 (not true))))

(declare-datatypes ((tuple2!9566 0))(
  ( (tuple2!9567 (_1!4794 (_ BitVec 64)) (_2!4794 V!24251)) )
))
(declare-datatypes ((List!15388 0))(
  ( (Nil!15385) (Cons!15384 (h!16513 tuple2!9566) (t!21704 List!15388)) )
))
(declare-datatypes ((ListLongMap!8379 0))(
  ( (ListLongMap!8380 (toList!4205 List!15388)) )
))
(declare-fun lt!366029 () ListLongMap!8379)

(declare-fun lt!366030 () ListLongMap!8379)

(assert (=> b!817247 (= lt!366029 lt!366030)))

(declare-fun zeroValueBefore!34 () V!24251)

(declare-fun zeroValueAfter!34 () V!24251)

(declare-fun minValue!754 () V!24251)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27838 0))(
  ( (Unit!27839) )
))
(declare-fun lt!366028 () Unit!27838)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!358 (array!45053 array!45051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24251 V!24251 V!24251 V!24251 (_ BitVec 32) Int) Unit!27838)

(assert (=> b!817247 (= lt!366028 (lemmaNoChangeToArrayThenSameMapNoExtras!358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2265 (array!45053 array!45051 (_ BitVec 32) (_ BitVec 32) V!24251 V!24251 (_ BitVec 32) Int) ListLongMap!8379)

(assert (=> b!817247 (= lt!366030 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817247 (= lt!366029 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817248 () Bool)

(assert (=> b!817248 (= e!453479 tp_is_empty!14437)))

(assert (= (and start!70350 res!557902) b!817245))

(assert (= (and b!817245 res!557901) b!817246))

(assert (= (and b!817246 res!557904) b!817244))

(assert (= (and b!817244 res!557903) b!817247))

(assert (= (and b!817243 condMapEmpty!23248) mapIsEmpty!23248))

(assert (= (and b!817243 (not condMapEmpty!23248)) mapNonEmpty!23248))

(get-info :version)

(assert (= (and mapNonEmpty!23248 ((_ is ValueCellFull!6803) mapValue!23248)) b!817248))

(assert (= (and b!817243 ((_ is ValueCellFull!6803) mapDefault!23248)) b!817242))

(assert (= start!70350 b!817243))

(declare-fun m!758311 () Bool)

(assert (=> mapNonEmpty!23248 m!758311))

(declare-fun m!758313 () Bool)

(assert (=> start!70350 m!758313))

(declare-fun m!758315 () Bool)

(assert (=> start!70350 m!758315))

(declare-fun m!758317 () Bool)

(assert (=> start!70350 m!758317))

(declare-fun m!758319 () Bool)

(assert (=> b!817246 m!758319))

(declare-fun m!758321 () Bool)

(assert (=> b!817244 m!758321))

(declare-fun m!758323 () Bool)

(assert (=> b!817247 m!758323))

(declare-fun m!758325 () Bool)

(assert (=> b!817247 m!758325))

(declare-fun m!758327 () Bool)

(assert (=> b!817247 m!758327))

(check-sat (not b_next!12727) (not b!817246) (not mapNonEmpty!23248) tp_is_empty!14437 (not b!817244) b_and!21513 (not b!817247) (not start!70350))
(check-sat b_and!21513 (not b_next!12727))
