; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70458 () Bool)

(assert start!70458)

(declare-fun b_free!12805 () Bool)

(declare-fun b_next!12805 () Bool)

(assert (=> start!70458 (= b_free!12805 (not b_next!12805))))

(declare-fun tp!45147 () Bool)

(declare-fun b_and!21609 () Bool)

(assert (=> start!70458 (= tp!45147 b_and!21609)))

(declare-fun b!818379 () Bool)

(declare-fun e!454301 () Bool)

(declare-fun tp_is_empty!14515 () Bool)

(assert (=> b!818379 (= e!454301 tp_is_empty!14515)))

(declare-fun b!818380 () Bool)

(declare-fun res!558543 () Bool)

(declare-fun e!454297 () Bool)

(assert (=> b!818380 (=> (not res!558543) (not e!454297))))

(declare-datatypes ((array!45205 0))(
  ( (array!45206 (arr!21657 (Array (_ BitVec 32) (_ BitVec 64))) (size!22078 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45205)

(declare-datatypes ((List!15447 0))(
  ( (Nil!15444) (Cons!15443 (h!16572 (_ BitVec 64)) (t!21767 List!15447)) )
))
(declare-fun arrayNoDuplicates!0 (array!45205 (_ BitVec 32) List!15447) Bool)

(assert (=> b!818380 (= res!558543 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15444))))

(declare-fun res!558544 () Bool)

(assert (=> start!70458 (=> (not res!558544) (not e!454297))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70458 (= res!558544 (validMask!0 mask!1312))))

(assert (=> start!70458 e!454297))

(assert (=> start!70458 tp_is_empty!14515))

(declare-fun array_inv!17387 (array!45205) Bool)

(assert (=> start!70458 (array_inv!17387 _keys!976)))

(assert (=> start!70458 true))

(declare-datatypes ((V!24355 0))(
  ( (V!24356 (val!7305 Int)) )
))
(declare-datatypes ((ValueCell!6842 0))(
  ( (ValueCellFull!6842 (v!9728 V!24355)) (EmptyCell!6842) )
))
(declare-datatypes ((array!45207 0))(
  ( (array!45208 (arr!21658 (Array (_ BitVec 32) ValueCell!6842)) (size!22079 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45207)

(declare-fun e!454299 () Bool)

(declare-fun array_inv!17388 (array!45207) Bool)

(assert (=> start!70458 (and (array_inv!17388 _values!788) e!454299)))

(assert (=> start!70458 tp!45147))

(declare-fun b!818381 () Bool)

(declare-fun res!558545 () Bool)

(assert (=> b!818381 (=> (not res!558545) (not e!454297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45205 (_ BitVec 32)) Bool)

(assert (=> b!818381 (= res!558545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818382 () Bool)

(declare-fun e!454296 () Bool)

(assert (=> b!818382 (= e!454297 (not e!454296))))

(declare-fun res!558546 () Bool)

(assert (=> b!818382 (=> res!558546 e!454296)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818382 (= res!558546 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9624 0))(
  ( (tuple2!9625 (_1!4823 (_ BitVec 64)) (_2!4823 V!24355)) )
))
(declare-datatypes ((List!15448 0))(
  ( (Nil!15445) (Cons!15444 (h!16573 tuple2!9624) (t!21768 List!15448)) )
))
(declare-datatypes ((ListLongMap!8437 0))(
  ( (ListLongMap!8438 (toList!4234 List!15448)) )
))
(declare-fun lt!366629 () ListLongMap!8437)

(declare-fun lt!366622 () ListLongMap!8437)

(assert (=> b!818382 (= lt!366629 lt!366622)))

(declare-fun zeroValueBefore!34 () V!24355)

(declare-fun zeroValueAfter!34 () V!24355)

(declare-fun minValue!754 () V!24355)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27893 0))(
  ( (Unit!27894) )
))
(declare-fun lt!366620 () Unit!27893)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!385 (array!45205 array!45207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 V!24355 V!24355 (_ BitVec 32) Int) Unit!27893)

(assert (=> b!818382 (= lt!366620 (lemmaNoChangeToArrayThenSameMapNoExtras!385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2292 (array!45205 array!45207 (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 (_ BitVec 32) Int) ListLongMap!8437)

(assert (=> b!818382 (= lt!366622 (getCurrentListMapNoExtraKeys!2292 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818382 (= lt!366629 (getCurrentListMapNoExtraKeys!2292 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818383 () Bool)

(assert (=> b!818383 (= e!454296 true)))

(declare-fun lt!366624 () tuple2!9624)

(declare-fun lt!366625 () ListLongMap!8437)

(declare-fun lt!366628 () tuple2!9624)

(declare-fun +!1856 (ListLongMap!8437 tuple2!9624) ListLongMap!8437)

(assert (=> b!818383 (= lt!366625 (+!1856 (+!1856 lt!366622 lt!366628) lt!366624))))

(declare-fun lt!366621 () ListLongMap!8437)

(assert (=> b!818383 (= (+!1856 lt!366629 lt!366624) (+!1856 lt!366621 lt!366624))))

(declare-fun lt!366627 () Unit!27893)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!171 (ListLongMap!8437 (_ BitVec 64) V!24355 V!24355) Unit!27893)

(assert (=> b!818383 (= lt!366627 (addSameAsAddTwiceSameKeyDiffValues!171 lt!366629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818383 (= lt!366624 (tuple2!9625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454298 () Bool)

(assert (=> b!818383 e!454298))

(declare-fun res!558548 () Bool)

(assert (=> b!818383 (=> (not res!558548) (not e!454298))))

(declare-fun lt!366623 () ListLongMap!8437)

(assert (=> b!818383 (= res!558548 (= lt!366623 lt!366621))))

(assert (=> b!818383 (= lt!366621 (+!1856 lt!366629 lt!366628))))

(assert (=> b!818383 (= lt!366628 (tuple2!9625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!366626 () ListLongMap!8437)

(declare-fun getCurrentListMap!2384 (array!45205 array!45207 (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 (_ BitVec 32) Int) ListLongMap!8437)

(assert (=> b!818383 (= lt!366626 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818383 (= lt!366623 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818384 () Bool)

(declare-fun mapRes!23371 () Bool)

(assert (=> b!818384 (= e!454299 (and e!454301 mapRes!23371))))

(declare-fun condMapEmpty!23371 () Bool)

(declare-fun mapDefault!23371 () ValueCell!6842)

(assert (=> b!818384 (= condMapEmpty!23371 (= (arr!21658 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6842)) mapDefault!23371)))))

(declare-fun b!818385 () Bool)

(assert (=> b!818385 (= e!454298 (= lt!366626 (+!1856 lt!366622 (tuple2!9625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23371 () Bool)

(assert (=> mapIsEmpty!23371 mapRes!23371))

(declare-fun b!818386 () Bool)

(declare-fun e!454295 () Bool)

(assert (=> b!818386 (= e!454295 tp_is_empty!14515)))

(declare-fun mapNonEmpty!23371 () Bool)

(declare-fun tp!45148 () Bool)

(assert (=> mapNonEmpty!23371 (= mapRes!23371 (and tp!45148 e!454295))))

(declare-fun mapValue!23371 () ValueCell!6842)

(declare-fun mapRest!23371 () (Array (_ BitVec 32) ValueCell!6842))

(declare-fun mapKey!23371 () (_ BitVec 32))

(assert (=> mapNonEmpty!23371 (= (arr!21658 _values!788) (store mapRest!23371 mapKey!23371 mapValue!23371))))

(declare-fun b!818387 () Bool)

(declare-fun res!558547 () Bool)

(assert (=> b!818387 (=> (not res!558547) (not e!454297))))

(assert (=> b!818387 (= res!558547 (and (= (size!22079 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22078 _keys!976) (size!22079 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70458 res!558544) b!818387))

(assert (= (and b!818387 res!558547) b!818381))

(assert (= (and b!818381 res!558545) b!818380))

(assert (= (and b!818380 res!558543) b!818382))

(assert (= (and b!818382 (not res!558546)) b!818383))

(assert (= (and b!818383 res!558548) b!818385))

(assert (= (and b!818384 condMapEmpty!23371) mapIsEmpty!23371))

(assert (= (and b!818384 (not condMapEmpty!23371)) mapNonEmpty!23371))

(get-info :version)

(assert (= (and mapNonEmpty!23371 ((_ is ValueCellFull!6842) mapValue!23371)) b!818386))

(assert (= (and b!818384 ((_ is ValueCellFull!6842) mapDefault!23371)) b!818379))

(assert (= start!70458 b!818384))

(declare-fun m!759245 () Bool)

(assert (=> b!818383 m!759245))

(declare-fun m!759247 () Bool)

(assert (=> b!818383 m!759247))

(declare-fun m!759249 () Bool)

(assert (=> b!818383 m!759249))

(declare-fun m!759251 () Bool)

(assert (=> b!818383 m!759251))

(declare-fun m!759253 () Bool)

(assert (=> b!818383 m!759253))

(declare-fun m!759255 () Bool)

(assert (=> b!818383 m!759255))

(declare-fun m!759257 () Bool)

(assert (=> b!818383 m!759257))

(assert (=> b!818383 m!759249))

(declare-fun m!759259 () Bool)

(assert (=> b!818383 m!759259))

(declare-fun m!759261 () Bool)

(assert (=> start!70458 m!759261))

(declare-fun m!759263 () Bool)

(assert (=> start!70458 m!759263))

(declare-fun m!759265 () Bool)

(assert (=> start!70458 m!759265))

(declare-fun m!759267 () Bool)

(assert (=> b!818381 m!759267))

(declare-fun m!759269 () Bool)

(assert (=> mapNonEmpty!23371 m!759269))

(declare-fun m!759271 () Bool)

(assert (=> b!818382 m!759271))

(declare-fun m!759273 () Bool)

(assert (=> b!818382 m!759273))

(declare-fun m!759275 () Bool)

(assert (=> b!818382 m!759275))

(declare-fun m!759277 () Bool)

(assert (=> b!818380 m!759277))

(declare-fun m!759279 () Bool)

(assert (=> b!818385 m!759279))

(check-sat (not b!818380) b_and!21609 (not b!818385) (not mapNonEmpty!23371) tp_is_empty!14515 (not b!818381) (not b_next!12805) (not start!70458) (not b!818383) (not b!818382))
(check-sat b_and!21609 (not b_next!12805))
