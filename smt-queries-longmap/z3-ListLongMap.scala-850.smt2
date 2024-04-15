; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20200 () Bool)

(assert start!20200)

(declare-fun b_free!4855 () Bool)

(declare-fun b_next!4855 () Bool)

(assert (=> start!20200 (= b_free!4855 (not b_next!4855))))

(declare-fun tp!17597 () Bool)

(declare-fun b_and!11575 () Bool)

(assert (=> start!20200 (= tp!17597 b_and!11575)))

(declare-fun mapNonEmpty!8135 () Bool)

(declare-fun mapRes!8135 () Bool)

(declare-fun tp!17596 () Bool)

(declare-fun e!130293 () Bool)

(assert (=> mapNonEmpty!8135 (= mapRes!8135 (and tp!17596 e!130293))))

(declare-datatypes ((V!5929 0))(
  ( (V!5930 (val!2400 Int)) )
))
(declare-datatypes ((ValueCell!2012 0))(
  ( (ValueCellFull!2012 (v!4364 V!5929)) (EmptyCell!2012) )
))
(declare-fun mapValue!8135 () ValueCell!2012)

(declare-fun mapRest!8135 () (Array (_ BitVec 32) ValueCell!2012))

(declare-datatypes ((array!8647 0))(
  ( (array!8648 (arr!4073 (Array (_ BitVec 32) ValueCell!2012)) (size!4399 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8647)

(declare-fun mapKey!8135 () (_ BitVec 32))

(assert (=> mapNonEmpty!8135 (= (arr!4073 _values!649) (store mapRest!8135 mapKey!8135 mapValue!8135))))

(declare-fun b!198227 () Bool)

(declare-fun res!93953 () Bool)

(declare-fun e!130289 () Bool)

(assert (=> b!198227 (=> (not res!93953) (not e!130289))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8649 0))(
  ( (array!8650 (arr!4074 (Array (_ BitVec 32) (_ BitVec 64))) (size!4400 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8649)

(assert (=> b!198227 (= res!93953 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4400 _keys!825))))))

(declare-fun b!198228 () Bool)

(declare-fun e!130292 () Bool)

(declare-fun tp_is_empty!4711 () Bool)

(assert (=> b!198228 (= e!130292 tp_is_empty!4711)))

(declare-fun b!198229 () Bool)

(declare-fun res!93951 () Bool)

(assert (=> b!198229 (=> (not res!93951) (not e!130289))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8649 (_ BitVec 32)) Bool)

(assert (=> b!198229 (= res!93951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198230 () Bool)

(assert (=> b!198230 (= e!130289 false)))

(declare-fun v!520 () V!5929)

(declare-fun zeroValue!615 () V!5929)

(declare-datatypes ((tuple2!3600 0))(
  ( (tuple2!3601 (_1!1811 (_ BitVec 64)) (_2!1811 V!5929)) )
))
(declare-datatypes ((List!2532 0))(
  ( (Nil!2529) (Cons!2528 (h!3170 tuple2!3600) (t!7454 List!2532)) )
))
(declare-datatypes ((ListLongMap!2503 0))(
  ( (ListLongMap!2504 (toList!1267 List!2532)) )
))
(declare-fun lt!97723 () ListLongMap!2503)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5929)

(declare-fun getCurrentListMapNoExtraKeys!247 (array!8649 array!8647 (_ BitVec 32) (_ BitVec 32) V!5929 V!5929 (_ BitVec 32) Int) ListLongMap!2503)

(assert (=> b!198230 (= lt!97723 (getCurrentListMapNoExtraKeys!247 _keys!825 (array!8648 (store (arr!4073 _values!649) i!601 (ValueCellFull!2012 v!520)) (size!4399 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97724 () ListLongMap!2503)

(assert (=> b!198230 (= lt!97724 (getCurrentListMapNoExtraKeys!247 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198232 () Bool)

(declare-fun e!130291 () Bool)

(assert (=> b!198232 (= e!130291 (and e!130292 mapRes!8135))))

(declare-fun condMapEmpty!8135 () Bool)

(declare-fun mapDefault!8135 () ValueCell!2012)

(assert (=> b!198232 (= condMapEmpty!8135 (= (arr!4073 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2012)) mapDefault!8135)))))

(declare-fun mapIsEmpty!8135 () Bool)

(assert (=> mapIsEmpty!8135 mapRes!8135))

(declare-fun b!198233 () Bool)

(declare-fun res!93949 () Bool)

(assert (=> b!198233 (=> (not res!93949) (not e!130289))))

(assert (=> b!198233 (= res!93949 (and (= (size!4399 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4400 _keys!825) (size!4399 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198234 () Bool)

(assert (=> b!198234 (= e!130293 tp_is_empty!4711)))

(declare-fun b!198235 () Bool)

(declare-fun res!93950 () Bool)

(assert (=> b!198235 (=> (not res!93950) (not e!130289))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198235 (= res!93950 (validKeyInArray!0 k0!843))))

(declare-fun b!198236 () Bool)

(declare-fun res!93948 () Bool)

(assert (=> b!198236 (=> (not res!93948) (not e!130289))))

(assert (=> b!198236 (= res!93948 (= (select (arr!4074 _keys!825) i!601) k0!843))))

(declare-fun res!93947 () Bool)

(assert (=> start!20200 (=> (not res!93947) (not e!130289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20200 (= res!93947 (validMask!0 mask!1149))))

(assert (=> start!20200 e!130289))

(declare-fun array_inv!2651 (array!8647) Bool)

(assert (=> start!20200 (and (array_inv!2651 _values!649) e!130291)))

(assert (=> start!20200 true))

(assert (=> start!20200 tp_is_empty!4711))

(declare-fun array_inv!2652 (array!8649) Bool)

(assert (=> start!20200 (array_inv!2652 _keys!825)))

(assert (=> start!20200 tp!17597))

(declare-fun b!198231 () Bool)

(declare-fun res!93952 () Bool)

(assert (=> b!198231 (=> (not res!93952) (not e!130289))))

(declare-datatypes ((List!2533 0))(
  ( (Nil!2530) (Cons!2529 (h!3171 (_ BitVec 64)) (t!7455 List!2533)) )
))
(declare-fun arrayNoDuplicates!0 (array!8649 (_ BitVec 32) List!2533) Bool)

(assert (=> b!198231 (= res!93952 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2530))))

(assert (= (and start!20200 res!93947) b!198233))

(assert (= (and b!198233 res!93949) b!198229))

(assert (= (and b!198229 res!93951) b!198231))

(assert (= (and b!198231 res!93952) b!198227))

(assert (= (and b!198227 res!93953) b!198235))

(assert (= (and b!198235 res!93950) b!198236))

(assert (= (and b!198236 res!93948) b!198230))

(assert (= (and b!198232 condMapEmpty!8135) mapIsEmpty!8135))

(assert (= (and b!198232 (not condMapEmpty!8135)) mapNonEmpty!8135))

(get-info :version)

(assert (= (and mapNonEmpty!8135 ((_ is ValueCellFull!2012) mapValue!8135)) b!198234))

(assert (= (and b!198232 ((_ is ValueCellFull!2012) mapDefault!8135)) b!198228))

(assert (= start!20200 b!198232))

(declare-fun m!224385 () Bool)

(assert (=> b!198231 m!224385))

(declare-fun m!224387 () Bool)

(assert (=> b!198236 m!224387))

(declare-fun m!224389 () Bool)

(assert (=> b!198230 m!224389))

(declare-fun m!224391 () Bool)

(assert (=> b!198230 m!224391))

(declare-fun m!224393 () Bool)

(assert (=> b!198230 m!224393))

(declare-fun m!224395 () Bool)

(assert (=> start!20200 m!224395))

(declare-fun m!224397 () Bool)

(assert (=> start!20200 m!224397))

(declare-fun m!224399 () Bool)

(assert (=> start!20200 m!224399))

(declare-fun m!224401 () Bool)

(assert (=> b!198235 m!224401))

(declare-fun m!224403 () Bool)

(assert (=> b!198229 m!224403))

(declare-fun m!224405 () Bool)

(assert (=> mapNonEmpty!8135 m!224405))

(check-sat (not start!20200) tp_is_empty!4711 (not b!198229) (not b_next!4855) (not b!198231) (not b!198235) (not b!198230) (not mapNonEmpty!8135) b_and!11575)
(check-sat b_and!11575 (not b_next!4855))
