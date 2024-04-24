; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77886 () Bool)

(assert start!77886)

(declare-fun b_free!16303 () Bool)

(declare-fun b_next!16303 () Bool)

(assert (=> start!77886 (= b_free!16303 (not b_next!16303))))

(declare-fun tp!57172 () Bool)

(declare-fun b_and!26769 () Bool)

(assert (=> start!77886 (= tp!57172 b_and!26769)))

(declare-fun b!907625 () Bool)

(declare-fun res!612276 () Bool)

(declare-fun e!508715 () Bool)

(assert (=> b!907625 (=> res!612276 e!508715)))

(declare-datatypes ((V!29927 0))(
  ( (V!29928 (val!9411 Int)) )
))
(declare-fun lt!409383 () V!29927)

(declare-datatypes ((tuple2!12186 0))(
  ( (tuple2!12187 (_1!6104 (_ BitVec 64)) (_2!6104 V!29927)) )
))
(declare-datatypes ((List!18020 0))(
  ( (Nil!18017) (Cons!18016 (h!19168 tuple2!12186) (t!25487 List!18020)) )
))
(declare-datatypes ((ListLongMap!10885 0))(
  ( (ListLongMap!10886 (toList!5458 List!18020)) )
))
(declare-fun lt!409386 () ListLongMap!10885)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!477 (ListLongMap!10885 (_ BitVec 64)) V!29927)

(assert (=> b!907625 (= res!612276 (not (= (apply!477 lt!409386 k0!1033) lt!409383)))))

(declare-fun b!907626 () Bool)

(declare-fun e!508714 () Bool)

(declare-fun e!508716 () Bool)

(declare-fun mapRes!29794 () Bool)

(assert (=> b!907626 (= e!508714 (and e!508716 mapRes!29794))))

(declare-fun condMapEmpty!29794 () Bool)

(declare-datatypes ((ValueCell!8879 0))(
  ( (ValueCellFull!8879 (v!11913 V!29927)) (EmptyCell!8879) )
))
(declare-datatypes ((array!53523 0))(
  ( (array!53524 (arr!25716 (Array (_ BitVec 32) ValueCell!8879)) (size!26176 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53523)

(declare-fun mapDefault!29794 () ValueCell!8879)

(assert (=> b!907626 (= condMapEmpty!29794 (= (arr!25716 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8879)) mapDefault!29794)))))

(declare-fun b!907627 () Bool)

(declare-fun res!612274 () Bool)

(declare-fun e!508713 () Bool)

(assert (=> b!907627 (=> (not res!612274) (not e!508713))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907627 (= res!612274 (inRange!0 i!717 mask!1756))))

(declare-fun b!907628 () Bool)

(declare-fun tp_is_empty!18721 () Bool)

(assert (=> b!907628 (= e!508716 tp_is_empty!18721)))

(declare-fun mapIsEmpty!29794 () Bool)

(assert (=> mapIsEmpty!29794 mapRes!29794))

(declare-fun b!907629 () Bool)

(declare-fun res!612278 () Bool)

(declare-fun e!508718 () Bool)

(assert (=> b!907629 (=> (not res!612278) (not e!508718))))

(declare-datatypes ((array!53525 0))(
  ( (array!53526 (arr!25717 (Array (_ BitVec 32) (_ BitVec 64))) (size!26177 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53525)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53525 (_ BitVec 32)) Bool)

(assert (=> b!907629 (= res!612278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907630 () Bool)

(declare-fun e!508719 () Bool)

(assert (=> b!907630 (= e!508719 tp_is_empty!18721)))

(declare-fun mapNonEmpty!29794 () Bool)

(declare-fun tp!57171 () Bool)

(assert (=> mapNonEmpty!29794 (= mapRes!29794 (and tp!57171 e!508719))))

(declare-fun mapRest!29794 () (Array (_ BitVec 32) ValueCell!8879))

(declare-fun mapKey!29794 () (_ BitVec 32))

(declare-fun mapValue!29794 () ValueCell!8879)

(assert (=> mapNonEmpty!29794 (= (arr!25716 _values!1152) (store mapRest!29794 mapKey!29794 mapValue!29794))))

(declare-fun res!612277 () Bool)

(assert (=> start!77886 (=> (not res!612277) (not e!508718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77886 (= res!612277 (validMask!0 mask!1756))))

(assert (=> start!77886 e!508718))

(declare-fun array_inv!20194 (array!53523) Bool)

(assert (=> start!77886 (and (array_inv!20194 _values!1152) e!508714)))

(assert (=> start!77886 tp!57172))

(assert (=> start!77886 true))

(assert (=> start!77886 tp_is_empty!18721))

(declare-fun array_inv!20195 (array!53525) Bool)

(assert (=> start!77886 (array_inv!20195 _keys!1386)))

(declare-fun b!907631 () Bool)

(assert (=> b!907631 (= e!508718 e!508713)))

(declare-fun res!612283 () Bool)

(assert (=> b!907631 (=> (not res!612283) (not e!508713))))

(declare-fun lt!409384 () ListLongMap!10885)

(declare-fun contains!4512 (ListLongMap!10885 (_ BitVec 64)) Bool)

(assert (=> b!907631 (= res!612283 (contains!4512 lt!409384 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29927)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29927)

(declare-fun getCurrentListMap!2723 (array!53525 array!53523 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 32) Int) ListLongMap!10885)

(assert (=> b!907631 (= lt!409384 (getCurrentListMap!2723 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907632 () Bool)

(declare-fun res!612279 () Bool)

(assert (=> b!907632 (=> (not res!612279) (not e!508718))))

(assert (=> b!907632 (= res!612279 (and (= (size!26176 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26177 _keys!1386) (size!26176 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907633 () Bool)

(declare-fun res!612281 () Bool)

(assert (=> b!907633 (=> (not res!612281) (not e!508713))))

(assert (=> b!907633 (= res!612281 (and (= (select (arr!25717 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907634 () Bool)

(declare-fun e!508712 () Bool)

(assert (=> b!907634 (= e!508713 (not e!508712))))

(declare-fun res!612280 () Bool)

(assert (=> b!907634 (=> res!612280 e!508712)))

(assert (=> b!907634 (= res!612280 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26177 _keys!1386))))))

(declare-fun get!13534 (ValueCell!8879 V!29927) V!29927)

(declare-fun dynLambda!1368 (Int (_ BitVec 64)) V!29927)

(assert (=> b!907634 (= lt!409383 (get!13534 (select (arr!25716 _values!1152) i!717) (dynLambda!1368 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907634 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30766 0))(
  ( (Unit!30767) )
))
(declare-fun lt!409387 () Unit!30766)

(declare-fun lemmaKeyInListMapIsInArray!227 (array!53525 array!53523 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) Int) Unit!30766)

(assert (=> b!907634 (= lt!409387 (lemmaKeyInListMapIsInArray!227 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907635 () Bool)

(assert (=> b!907635 (= e!508712 e!508715)))

(declare-fun res!612282 () Bool)

(assert (=> b!907635 (=> res!612282 e!508715)))

(assert (=> b!907635 (= res!612282 (not (contains!4512 lt!409386 k0!1033)))))

(assert (=> b!907635 (= lt!409386 (getCurrentListMap!2723 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907636 () Bool)

(assert (=> b!907636 (= e!508715 true)))

(assert (=> b!907636 (= (apply!477 lt!409384 k0!1033) lt!409383)))

(declare-fun lt!409385 () Unit!30766)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!29 (array!53525 array!53523 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) V!29927 (_ BitVec 32) Int) Unit!30766)

(assert (=> b!907636 (= lt!409385 (lemmaListMapApplyFromThenApplyFromZero!29 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409383 i!717 defaultEntry!1160))))

(declare-fun b!907637 () Bool)

(declare-fun res!612275 () Bool)

(assert (=> b!907637 (=> (not res!612275) (not e!508718))))

(declare-datatypes ((List!18021 0))(
  ( (Nil!18018) (Cons!18017 (h!19169 (_ BitVec 64)) (t!25488 List!18021)) )
))
(declare-fun arrayNoDuplicates!0 (array!53525 (_ BitVec 32) List!18021) Bool)

(assert (=> b!907637 (= res!612275 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18018))))

(assert (= (and start!77886 res!612277) b!907632))

(assert (= (and b!907632 res!612279) b!907629))

(assert (= (and b!907629 res!612278) b!907637))

(assert (= (and b!907637 res!612275) b!907631))

(assert (= (and b!907631 res!612283) b!907627))

(assert (= (and b!907627 res!612274) b!907633))

(assert (= (and b!907633 res!612281) b!907634))

(assert (= (and b!907634 (not res!612280)) b!907635))

(assert (= (and b!907635 (not res!612282)) b!907625))

(assert (= (and b!907625 (not res!612276)) b!907636))

(assert (= (and b!907626 condMapEmpty!29794) mapIsEmpty!29794))

(assert (= (and b!907626 (not condMapEmpty!29794)) mapNonEmpty!29794))

(get-info :version)

(assert (= (and mapNonEmpty!29794 ((_ is ValueCellFull!8879) mapValue!29794)) b!907630))

(assert (= (and b!907626 ((_ is ValueCellFull!8879) mapDefault!29794)) b!907628))

(assert (= start!77886 b!907626))

(declare-fun b_lambda!13191 () Bool)

(assert (=> (not b_lambda!13191) (not b!907634)))

(declare-fun t!25486 () Bool)

(declare-fun tb!5317 () Bool)

(assert (=> (and start!77886 (= defaultEntry!1160 defaultEntry!1160) t!25486) tb!5317))

(declare-fun result!10437 () Bool)

(assert (=> tb!5317 (= result!10437 tp_is_empty!18721)))

(assert (=> b!907634 t!25486))

(declare-fun b_and!26771 () Bool)

(assert (= b_and!26769 (and (=> t!25486 result!10437) b_and!26771)))

(declare-fun m!843389 () Bool)

(assert (=> b!907629 m!843389))

(declare-fun m!843391 () Bool)

(assert (=> mapNonEmpty!29794 m!843391))

(declare-fun m!843393 () Bool)

(assert (=> b!907635 m!843393))

(declare-fun m!843395 () Bool)

(assert (=> b!907635 m!843395))

(declare-fun m!843397 () Bool)

(assert (=> b!907633 m!843397))

(declare-fun m!843399 () Bool)

(assert (=> b!907634 m!843399))

(declare-fun m!843401 () Bool)

(assert (=> b!907634 m!843401))

(declare-fun m!843403 () Bool)

(assert (=> b!907634 m!843403))

(declare-fun m!843405 () Bool)

(assert (=> b!907634 m!843405))

(assert (=> b!907634 m!843399))

(assert (=> b!907634 m!843403))

(declare-fun m!843407 () Bool)

(assert (=> b!907634 m!843407))

(declare-fun m!843409 () Bool)

(assert (=> b!907627 m!843409))

(declare-fun m!843411 () Bool)

(assert (=> b!907637 m!843411))

(declare-fun m!843413 () Bool)

(assert (=> start!77886 m!843413))

(declare-fun m!843415 () Bool)

(assert (=> start!77886 m!843415))

(declare-fun m!843417 () Bool)

(assert (=> start!77886 m!843417))

(declare-fun m!843419 () Bool)

(assert (=> b!907631 m!843419))

(declare-fun m!843421 () Bool)

(assert (=> b!907631 m!843421))

(declare-fun m!843423 () Bool)

(assert (=> b!907625 m!843423))

(declare-fun m!843425 () Bool)

(assert (=> b!907636 m!843425))

(declare-fun m!843427 () Bool)

(assert (=> b!907636 m!843427))

(check-sat (not b_next!16303) (not b!907637) tp_is_empty!18721 (not mapNonEmpty!29794) (not b!907635) (not b_lambda!13191) (not start!77886) (not b!907634) (not b!907629) (not b!907636) (not b!907631) (not b!907625) b_and!26771 (not b!907627))
(check-sat b_and!26771 (not b_next!16303))
