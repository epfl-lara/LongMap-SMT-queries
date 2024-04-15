; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70082 () Bool)

(assert start!70082)

(declare-fun b_free!12523 () Bool)

(declare-fun b_next!12523 () Bool)

(assert (=> start!70082 (= b_free!12523 (not b_next!12523))))

(declare-fun tp!44284 () Bool)

(declare-fun b_and!21269 () Bool)

(assert (=> start!70082 (= tp!44284 b_and!21269)))

(declare-fun res!556290 () Bool)

(declare-fun e!451454 () Bool)

(assert (=> start!70082 (=> (not res!556290) (not e!451454))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70082 (= res!556290 (validMask!0 mask!1312))))

(assert (=> start!70082 e!451454))

(declare-fun tp_is_empty!14233 () Bool)

(assert (=> start!70082 tp_is_empty!14233))

(declare-datatypes ((array!44661 0))(
  ( (array!44662 (arr!21391 (Array (_ BitVec 32) (_ BitVec 64))) (size!21812 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44661)

(declare-fun array_inv!17199 (array!44661) Bool)

(assert (=> start!70082 (array_inv!17199 _keys!976)))

(assert (=> start!70082 true))

(declare-datatypes ((V!23979 0))(
  ( (V!23980 (val!7164 Int)) )
))
(declare-datatypes ((ValueCell!6701 0))(
  ( (ValueCellFull!6701 (v!9585 V!23979)) (EmptyCell!6701) )
))
(declare-datatypes ((array!44663 0))(
  ( (array!44664 (arr!21392 (Array (_ BitVec 32) ValueCell!6701)) (size!21813 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44663)

(declare-fun e!451457 () Bool)

(declare-fun array_inv!17200 (array!44663) Bool)

(assert (=> start!70082 (and (array_inv!17200 _values!788) e!451457)))

(assert (=> start!70082 tp!44284))

(declare-fun b!814400 () Bool)

(assert (=> b!814400 (= e!451454 (not true))))

(declare-datatypes ((tuple2!9422 0))(
  ( (tuple2!9423 (_1!4722 (_ BitVec 64)) (_2!4722 V!23979)) )
))
(declare-datatypes ((List!15250 0))(
  ( (Nil!15247) (Cons!15246 (h!16375 tuple2!9422) (t!21558 List!15250)) )
))
(declare-datatypes ((ListLongMap!8235 0))(
  ( (ListLongMap!8236 (toList!4133 List!15250)) )
))
(declare-fun lt!364464 () ListLongMap!8235)

(declare-fun lt!364462 () ListLongMap!8235)

(assert (=> b!814400 (= lt!364464 lt!364462)))

(declare-fun zeroValueBefore!34 () V!23979)

(declare-fun zeroValueAfter!34 () V!23979)

(declare-fun minValue!754 () V!23979)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27700 0))(
  ( (Unit!27701) )
))
(declare-fun lt!364463 () Unit!27700)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!291 (array!44661 array!44663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23979 V!23979 V!23979 V!23979 (_ BitVec 32) Int) Unit!27700)

(assert (=> b!814400 (= lt!364463 (lemmaNoChangeToArrayThenSameMapNoExtras!291 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2198 (array!44661 array!44663 (_ BitVec 32) (_ BitVec 32) V!23979 V!23979 (_ BitVec 32) Int) ListLongMap!8235)

(assert (=> b!814400 (= lt!364462 (getCurrentListMapNoExtraKeys!2198 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814400 (= lt!364464 (getCurrentListMapNoExtraKeys!2198 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22930 () Bool)

(declare-fun mapRes!22930 () Bool)

(assert (=> mapIsEmpty!22930 mapRes!22930))

(declare-fun b!814401 () Bool)

(declare-fun e!451456 () Bool)

(assert (=> b!814401 (= e!451457 (and e!451456 mapRes!22930))))

(declare-fun condMapEmpty!22930 () Bool)

(declare-fun mapDefault!22930 () ValueCell!6701)

(assert (=> b!814401 (= condMapEmpty!22930 (= (arr!21392 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6701)) mapDefault!22930)))))

(declare-fun b!814402 () Bool)

(declare-fun res!556292 () Bool)

(assert (=> b!814402 (=> (not res!556292) (not e!451454))))

(assert (=> b!814402 (= res!556292 (and (= (size!21813 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21812 _keys!976) (size!21813 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814403 () Bool)

(declare-fun res!556291 () Bool)

(assert (=> b!814403 (=> (not res!556291) (not e!451454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44661 (_ BitVec 32)) Bool)

(assert (=> b!814403 (= res!556291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814404 () Bool)

(declare-fun res!556289 () Bool)

(assert (=> b!814404 (=> (not res!556289) (not e!451454))))

(declare-datatypes ((List!15251 0))(
  ( (Nil!15248) (Cons!15247 (h!16376 (_ BitVec 64)) (t!21559 List!15251)) )
))
(declare-fun arrayNoDuplicates!0 (array!44661 (_ BitVec 32) List!15251) Bool)

(assert (=> b!814404 (= res!556289 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15248))))

(declare-fun b!814405 () Bool)

(assert (=> b!814405 (= e!451456 tp_is_empty!14233)))

(declare-fun b!814406 () Bool)

(declare-fun e!451455 () Bool)

(assert (=> b!814406 (= e!451455 tp_is_empty!14233)))

(declare-fun mapNonEmpty!22930 () Bool)

(declare-fun tp!44283 () Bool)

(assert (=> mapNonEmpty!22930 (= mapRes!22930 (and tp!44283 e!451455))))

(declare-fun mapKey!22930 () (_ BitVec 32))

(declare-fun mapRest!22930 () (Array (_ BitVec 32) ValueCell!6701))

(declare-fun mapValue!22930 () ValueCell!6701)

(assert (=> mapNonEmpty!22930 (= (arr!21392 _values!788) (store mapRest!22930 mapKey!22930 mapValue!22930))))

(assert (= (and start!70082 res!556290) b!814402))

(assert (= (and b!814402 res!556292) b!814403))

(assert (= (and b!814403 res!556291) b!814404))

(assert (= (and b!814404 res!556289) b!814400))

(assert (= (and b!814401 condMapEmpty!22930) mapIsEmpty!22930))

(assert (= (and b!814401 (not condMapEmpty!22930)) mapNonEmpty!22930))

(get-info :version)

(assert (= (and mapNonEmpty!22930 ((_ is ValueCellFull!6701) mapValue!22930)) b!814406))

(assert (= (and b!814401 ((_ is ValueCellFull!6701) mapDefault!22930)) b!814405))

(assert (= start!70082 b!814401))

(declare-fun m!755679 () Bool)

(assert (=> b!814403 m!755679))

(declare-fun m!755681 () Bool)

(assert (=> b!814400 m!755681))

(declare-fun m!755683 () Bool)

(assert (=> b!814400 m!755683))

(declare-fun m!755685 () Bool)

(assert (=> b!814400 m!755685))

(declare-fun m!755687 () Bool)

(assert (=> start!70082 m!755687))

(declare-fun m!755689 () Bool)

(assert (=> start!70082 m!755689))

(declare-fun m!755691 () Bool)

(assert (=> start!70082 m!755691))

(declare-fun m!755693 () Bool)

(assert (=> b!814404 m!755693))

(declare-fun m!755695 () Bool)

(assert (=> mapNonEmpty!22930 m!755695))

(check-sat (not b_next!12523) (not b!814404) (not mapNonEmpty!22930) (not b!814403) tp_is_empty!14233 (not b!814400) b_and!21269 (not start!70082))
(check-sat b_and!21269 (not b_next!12523))
