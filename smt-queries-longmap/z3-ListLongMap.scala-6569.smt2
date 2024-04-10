; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83300 () Bool)

(assert start!83300)

(declare-fun b_free!19293 () Bool)

(declare-fun b_next!19293 () Bool)

(assert (=> start!83300 (= b_free!19293 (not b_next!19293))))

(declare-fun tp!67158 () Bool)

(declare-fun b_and!30807 () Bool)

(assert (=> start!83300 (= tp!67158 b_and!30807)))

(declare-fun b!972267 () Bool)

(declare-fun e!548036 () Bool)

(assert (=> b!972267 (= e!548036 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34571 0))(
  ( (V!34572 (val!11146 Int)) )
))
(declare-datatypes ((ValueCell!10614 0))(
  ( (ValueCellFull!10614 (v!13705 V!34571)) (EmptyCell!10614) )
))
(declare-datatypes ((array!60429 0))(
  ( (array!60430 (arr!29078 (Array (_ BitVec 32) ValueCell!10614)) (size!29557 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60429)

(declare-fun zeroValue!1367 () V!34571)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun lt!431991 () (_ BitVec 64))

(declare-fun minValue!1367 () V!34571)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60431 0))(
  ( (array!60432 (arr!29079 (Array (_ BitVec 32) (_ BitVec 64))) (size!29558 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60431)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14294 0))(
  ( (tuple2!14295 (_1!7158 (_ BitVec 64)) (_2!7158 V!34571)) )
))
(declare-datatypes ((List!20158 0))(
  ( (Nil!20155) (Cons!20154 (h!21316 tuple2!14294) (t!28549 List!20158)) )
))
(declare-datatypes ((ListLongMap!12991 0))(
  ( (ListLongMap!12992 (toList!6511 List!20158)) )
))
(declare-fun lt!431993 () ListLongMap!12991)

(declare-fun +!2885 (ListLongMap!12991 tuple2!14294) ListLongMap!12991)

(declare-fun getCurrentListMap!3744 (array!60431 array!60429 (_ BitVec 32) (_ BitVec 32) V!34571 V!34571 (_ BitVec 32) Int) ListLongMap!12991)

(declare-fun get!15062 (ValueCell!10614 V!34571) V!34571)

(declare-fun dynLambda!1674 (Int (_ BitVec 64)) V!34571)

(assert (=> b!972267 (= lt!431993 (+!2885 (getCurrentListMap!3744 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14295 lt!431991 (get!15062 (select (arr!29078 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1674 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32391 0))(
  ( (Unit!32392) )
))
(declare-fun lt!431992 () Unit!32391)

(declare-fun lemmaListMapRecursiveValidKeyArray!251 (array!60431 array!60429 (_ BitVec 32) (_ BitVec 32) V!34571 V!34571 (_ BitVec 32) Int) Unit!32391)

(assert (=> b!972267 (= lt!431992 (lemmaListMapRecursiveValidKeyArray!251 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972268 () Bool)

(declare-fun res!650795 () Bool)

(declare-fun e!548038 () Bool)

(assert (=> b!972268 (=> (not res!650795) (not e!548038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60431 (_ BitVec 32)) Bool)

(assert (=> b!972268 (= res!650795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35296 () Bool)

(declare-fun mapRes!35296 () Bool)

(declare-fun tp!67157 () Bool)

(declare-fun e!548041 () Bool)

(assert (=> mapNonEmpty!35296 (= mapRes!35296 (and tp!67157 e!548041))))

(declare-fun mapRest!35296 () (Array (_ BitVec 32) ValueCell!10614))

(declare-fun mapValue!35296 () ValueCell!10614)

(declare-fun mapKey!35296 () (_ BitVec 32))

(assert (=> mapNonEmpty!35296 (= (arr!29078 _values!1425) (store mapRest!35296 mapKey!35296 mapValue!35296))))

(declare-fun b!972269 () Bool)

(assert (=> b!972269 (= e!548038 e!548036)))

(declare-fun res!650793 () Bool)

(assert (=> b!972269 (=> (not res!650793) (not e!548036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972269 (= res!650793 (validKeyInArray!0 lt!431991))))

(assert (=> b!972269 (= lt!431991 (select (arr!29079 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972269 (= lt!431993 (getCurrentListMap!3744 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972270 () Bool)

(declare-fun res!650791 () Bool)

(assert (=> b!972270 (=> (not res!650791) (not e!548038))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972270 (= res!650791 (validKeyInArray!0 (select (arr!29079 _keys!1717) i!822)))))

(declare-fun b!972271 () Bool)

(declare-fun res!650794 () Bool)

(assert (=> b!972271 (=> (not res!650794) (not e!548038))))

(declare-datatypes ((List!20159 0))(
  ( (Nil!20156) (Cons!20155 (h!21317 (_ BitVec 64)) (t!28550 List!20159)) )
))
(declare-fun arrayNoDuplicates!0 (array!60431 (_ BitVec 32) List!20159) Bool)

(assert (=> b!972271 (= res!650794 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20156))))

(declare-fun b!972272 () Bool)

(declare-fun e!548039 () Bool)

(declare-fun e!548037 () Bool)

(assert (=> b!972272 (= e!548039 (and e!548037 mapRes!35296))))

(declare-fun condMapEmpty!35296 () Bool)

(declare-fun mapDefault!35296 () ValueCell!10614)

(assert (=> b!972272 (= condMapEmpty!35296 (= (arr!29078 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10614)) mapDefault!35296)))))

(declare-fun b!972273 () Bool)

(declare-fun tp_is_empty!22191 () Bool)

(assert (=> b!972273 (= e!548037 tp_is_empty!22191)))

(declare-fun b!972274 () Bool)

(declare-fun res!650789 () Bool)

(assert (=> b!972274 (=> (not res!650789) (not e!548038))))

(assert (=> b!972274 (= res!650789 (and (= (size!29557 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29558 _keys!1717) (size!29557 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972275 () Bool)

(assert (=> b!972275 (= e!548041 tp_is_empty!22191)))

(declare-fun b!972266 () Bool)

(declare-fun res!650796 () Bool)

(assert (=> b!972266 (=> (not res!650796) (not e!548038))))

(declare-fun contains!5606 (ListLongMap!12991 (_ BitVec 64)) Bool)

(assert (=> b!972266 (= res!650796 (contains!5606 (getCurrentListMap!3744 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29079 _keys!1717) i!822)))))

(declare-fun res!650790 () Bool)

(assert (=> start!83300 (=> (not res!650790) (not e!548038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83300 (= res!650790 (validMask!0 mask!2147))))

(assert (=> start!83300 e!548038))

(assert (=> start!83300 true))

(declare-fun array_inv!22491 (array!60429) Bool)

(assert (=> start!83300 (and (array_inv!22491 _values!1425) e!548039)))

(assert (=> start!83300 tp_is_empty!22191))

(assert (=> start!83300 tp!67158))

(declare-fun array_inv!22492 (array!60431) Bool)

(assert (=> start!83300 (array_inv!22492 _keys!1717)))

(declare-fun b!972276 () Bool)

(declare-fun res!650792 () Bool)

(assert (=> b!972276 (=> (not res!650792) (not e!548038))))

(assert (=> b!972276 (= res!650792 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29558 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29558 _keys!1717))))))

(declare-fun mapIsEmpty!35296 () Bool)

(assert (=> mapIsEmpty!35296 mapRes!35296))

(assert (= (and start!83300 res!650790) b!972274))

(assert (= (and b!972274 res!650789) b!972268))

(assert (= (and b!972268 res!650795) b!972271))

(assert (= (and b!972271 res!650794) b!972276))

(assert (= (and b!972276 res!650792) b!972270))

(assert (= (and b!972270 res!650791) b!972266))

(assert (= (and b!972266 res!650796) b!972269))

(assert (= (and b!972269 res!650793) b!972267))

(assert (= (and b!972272 condMapEmpty!35296) mapIsEmpty!35296))

(assert (= (and b!972272 (not condMapEmpty!35296)) mapNonEmpty!35296))

(get-info :version)

(assert (= (and mapNonEmpty!35296 ((_ is ValueCellFull!10614) mapValue!35296)) b!972275))

(assert (= (and b!972272 ((_ is ValueCellFull!10614) mapDefault!35296)) b!972273))

(assert (= start!83300 b!972272))

(declare-fun b_lambda!14457 () Bool)

(assert (=> (not b_lambda!14457) (not b!972267)))

(declare-fun t!28548 () Bool)

(declare-fun tb!6241 () Bool)

(assert (=> (and start!83300 (= defaultEntry!1428 defaultEntry!1428) t!28548) tb!6241))

(declare-fun result!12459 () Bool)

(assert (=> tb!6241 (= result!12459 tp_is_empty!22191)))

(assert (=> b!972267 t!28548))

(declare-fun b_and!30809 () Bool)

(assert (= b_and!30807 (and (=> t!28548 result!12459) b_and!30809)))

(declare-fun m!899661 () Bool)

(assert (=> b!972269 m!899661))

(declare-fun m!899663 () Bool)

(assert (=> b!972269 m!899663))

(declare-fun m!899665 () Bool)

(assert (=> b!972269 m!899665))

(declare-fun m!899667 () Bool)

(assert (=> b!972266 m!899667))

(declare-fun m!899669 () Bool)

(assert (=> b!972266 m!899669))

(assert (=> b!972266 m!899667))

(assert (=> b!972266 m!899669))

(declare-fun m!899671 () Bool)

(assert (=> b!972266 m!899671))

(declare-fun m!899673 () Bool)

(assert (=> mapNonEmpty!35296 m!899673))

(assert (=> b!972270 m!899669))

(assert (=> b!972270 m!899669))

(declare-fun m!899675 () Bool)

(assert (=> b!972270 m!899675))

(declare-fun m!899677 () Bool)

(assert (=> start!83300 m!899677))

(declare-fun m!899679 () Bool)

(assert (=> start!83300 m!899679))

(declare-fun m!899681 () Bool)

(assert (=> start!83300 m!899681))

(declare-fun m!899683 () Bool)

(assert (=> b!972271 m!899683))

(declare-fun m!899685 () Bool)

(assert (=> b!972268 m!899685))

(declare-fun m!899687 () Bool)

(assert (=> b!972267 m!899687))

(declare-fun m!899689 () Bool)

(assert (=> b!972267 m!899689))

(assert (=> b!972267 m!899687))

(assert (=> b!972267 m!899689))

(declare-fun m!899691 () Bool)

(assert (=> b!972267 m!899691))

(declare-fun m!899693 () Bool)

(assert (=> b!972267 m!899693))

(declare-fun m!899695 () Bool)

(assert (=> b!972267 m!899695))

(assert (=> b!972267 m!899695))

(declare-fun m!899697 () Bool)

(assert (=> b!972267 m!899697))

(check-sat (not b_next!19293) (not start!83300) b_and!30809 tp_is_empty!22191 (not b!972267) (not b!972270) (not mapNonEmpty!35296) (not b!972269) (not b!972268) (not b!972266) (not b_lambda!14457) (not b!972271))
(check-sat b_and!30809 (not b_next!19293))
