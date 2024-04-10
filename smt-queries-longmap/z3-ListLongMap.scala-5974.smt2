; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77672 () Bool)

(assert start!77672)

(declare-fun b_free!16257 () Bool)

(declare-fun b_next!16257 () Bool)

(assert (=> start!77672 (= b_free!16257 (not b_next!16257))))

(declare-fun tp!57033 () Bool)

(declare-fun b_and!26667 () Bool)

(assert (=> start!77672 (= tp!57033 b_and!26667)))

(declare-fun b!905779 () Bool)

(declare-fun e!507585 () Bool)

(declare-fun e!507579 () Bool)

(declare-fun mapRes!29725 () Bool)

(assert (=> b!905779 (= e!507585 (and e!507579 mapRes!29725))))

(declare-fun condMapEmpty!29725 () Bool)

(declare-datatypes ((V!29865 0))(
  ( (V!29866 (val!9388 Int)) )
))
(declare-datatypes ((ValueCell!8856 0))(
  ( (ValueCellFull!8856 (v!11893 V!29865)) (EmptyCell!8856) )
))
(declare-datatypes ((array!53392 0))(
  ( (array!53393 (arr!25655 (Array (_ BitVec 32) ValueCell!8856)) (size!26114 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53392)

(declare-fun mapDefault!29725 () ValueCell!8856)

(assert (=> b!905779 (= condMapEmpty!29725 (= (arr!25655 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8856)) mapDefault!29725)))))

(declare-fun b!905780 () Bool)

(declare-fun e!507584 () Bool)

(declare-fun tp_is_empty!18675 () Bool)

(assert (=> b!905780 (= e!507584 tp_is_empty!18675)))

(declare-fun b!905782 () Bool)

(declare-fun res!611241 () Bool)

(declare-fun e!507580 () Bool)

(assert (=> b!905782 (=> (not res!611241) (not e!507580))))

(declare-datatypes ((array!53394 0))(
  ( (array!53395 (arr!25656 (Array (_ BitVec 32) (_ BitVec 64))) (size!26115 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53394)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53394 (_ BitVec 32)) Bool)

(assert (=> b!905782 (= res!611241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905783 () Bool)

(declare-fun e!507582 () Bool)

(assert (=> b!905783 (= e!507582 true)))

(declare-datatypes ((tuple2!12214 0))(
  ( (tuple2!12215 (_1!6118 (_ BitVec 64)) (_2!6118 V!29865)) )
))
(declare-datatypes ((List!18024 0))(
  ( (Nil!18021) (Cons!18020 (h!19166 tuple2!12214) (t!25453 List!18024)) )
))
(declare-datatypes ((ListLongMap!10911 0))(
  ( (ListLongMap!10912 (toList!5471 List!18024)) )
))
(declare-fun lt!408680 () ListLongMap!10911)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408679 () V!29865)

(declare-fun apply!460 (ListLongMap!10911 (_ BitVec 64)) V!29865)

(assert (=> b!905783 (= (apply!460 lt!408680 k0!1033) lt!408679)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30734 0))(
  ( (Unit!30735) )
))
(declare-fun lt!408677 () Unit!30734)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29865)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29865)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!15 (array!53394 array!53392 (_ BitVec 32) (_ BitVec 32) V!29865 V!29865 (_ BitVec 64) V!29865 (_ BitVec 32) Int) Unit!30734)

(assert (=> b!905783 (= lt!408677 (lemmaListMapApplyFromThenApplyFromZero!15 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408679 i!717 defaultEntry!1160))))

(declare-fun b!905784 () Bool)

(declare-fun res!611240 () Bool)

(assert (=> b!905784 (=> (not res!611240) (not e!507580))))

(assert (=> b!905784 (= res!611240 (and (= (size!26114 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26115 _keys!1386) (size!26114 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29725 () Bool)

(assert (=> mapIsEmpty!29725 mapRes!29725))

(declare-fun b!905785 () Bool)

(declare-fun e!507581 () Bool)

(assert (=> b!905785 (= e!507580 e!507581)))

(declare-fun res!611246 () Bool)

(assert (=> b!905785 (=> (not res!611246) (not e!507581))))

(declare-fun contains!4516 (ListLongMap!10911 (_ BitVec 64)) Bool)

(assert (=> b!905785 (= res!611246 (contains!4516 lt!408680 k0!1033))))

(declare-fun getCurrentListMap!2737 (array!53394 array!53392 (_ BitVec 32) (_ BitVec 32) V!29865 V!29865 (_ BitVec 32) Int) ListLongMap!10911)

(assert (=> b!905785 (= lt!408680 (getCurrentListMap!2737 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905786 () Bool)

(declare-fun res!611244 () Bool)

(assert (=> b!905786 (=> (not res!611244) (not e!507581))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905786 (= res!611244 (inRange!0 i!717 mask!1756))))

(declare-fun b!905787 () Bool)

(declare-fun e!507578 () Bool)

(assert (=> b!905787 (= e!507581 (not e!507578))))

(declare-fun res!611245 () Bool)

(assert (=> b!905787 (=> res!611245 e!507578)))

(assert (=> b!905787 (= res!611245 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26115 _keys!1386))))))

(declare-fun get!13480 (ValueCell!8856 V!29865) V!29865)

(declare-fun dynLambda!1334 (Int (_ BitVec 64)) V!29865)

(assert (=> b!905787 (= lt!408679 (get!13480 (select (arr!25655 _values!1152) i!717) (dynLambda!1334 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905787 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408678 () Unit!30734)

(declare-fun lemmaKeyInListMapIsInArray!206 (array!53394 array!53392 (_ BitVec 32) (_ BitVec 32) V!29865 V!29865 (_ BitVec 64) Int) Unit!30734)

(assert (=> b!905787 (= lt!408678 (lemmaKeyInListMapIsInArray!206 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905788 () Bool)

(declare-fun res!611247 () Bool)

(assert (=> b!905788 (=> (not res!611247) (not e!507581))))

(assert (=> b!905788 (= res!611247 (and (= (select (arr!25656 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29725 () Bool)

(declare-fun tp!57032 () Bool)

(assert (=> mapNonEmpty!29725 (= mapRes!29725 (and tp!57032 e!507584))))

(declare-fun mapKey!29725 () (_ BitVec 32))

(declare-fun mapRest!29725 () (Array (_ BitVec 32) ValueCell!8856))

(declare-fun mapValue!29725 () ValueCell!8856)

(assert (=> mapNonEmpty!29725 (= (arr!25655 _values!1152) (store mapRest!29725 mapKey!29725 mapValue!29725))))

(declare-fun b!905789 () Bool)

(assert (=> b!905789 (= e!507578 e!507582)))

(declare-fun res!611248 () Bool)

(assert (=> b!905789 (=> res!611248 e!507582)))

(declare-fun lt!408681 () ListLongMap!10911)

(assert (=> b!905789 (= res!611248 (not (contains!4516 lt!408681 k0!1033)))))

(assert (=> b!905789 (= lt!408681 (getCurrentListMap!2737 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905790 () Bool)

(declare-fun res!611249 () Bool)

(assert (=> b!905790 (=> res!611249 e!507582)))

(assert (=> b!905790 (= res!611249 (not (= (apply!460 lt!408681 k0!1033) lt!408679)))))

(declare-fun b!905791 () Bool)

(assert (=> b!905791 (= e!507579 tp_is_empty!18675)))

(declare-fun b!905781 () Bool)

(declare-fun res!611242 () Bool)

(assert (=> b!905781 (=> (not res!611242) (not e!507580))))

(declare-datatypes ((List!18025 0))(
  ( (Nil!18022) (Cons!18021 (h!19167 (_ BitVec 64)) (t!25454 List!18025)) )
))
(declare-fun arrayNoDuplicates!0 (array!53394 (_ BitVec 32) List!18025) Bool)

(assert (=> b!905781 (= res!611242 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18022))))

(declare-fun res!611243 () Bool)

(assert (=> start!77672 (=> (not res!611243) (not e!507580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77672 (= res!611243 (validMask!0 mask!1756))))

(assert (=> start!77672 e!507580))

(declare-fun array_inv!20098 (array!53392) Bool)

(assert (=> start!77672 (and (array_inv!20098 _values!1152) e!507585)))

(assert (=> start!77672 tp!57033))

(assert (=> start!77672 true))

(assert (=> start!77672 tp_is_empty!18675))

(declare-fun array_inv!20099 (array!53394) Bool)

(assert (=> start!77672 (array_inv!20099 _keys!1386)))

(assert (= (and start!77672 res!611243) b!905784))

(assert (= (and b!905784 res!611240) b!905782))

(assert (= (and b!905782 res!611241) b!905781))

(assert (= (and b!905781 res!611242) b!905785))

(assert (= (and b!905785 res!611246) b!905786))

(assert (= (and b!905786 res!611244) b!905788))

(assert (= (and b!905788 res!611247) b!905787))

(assert (= (and b!905787 (not res!611245)) b!905789))

(assert (= (and b!905789 (not res!611248)) b!905790))

(assert (= (and b!905790 (not res!611249)) b!905783))

(assert (= (and b!905779 condMapEmpty!29725) mapIsEmpty!29725))

(assert (= (and b!905779 (not condMapEmpty!29725)) mapNonEmpty!29725))

(get-info :version)

(assert (= (and mapNonEmpty!29725 ((_ is ValueCellFull!8856) mapValue!29725)) b!905780))

(assert (= (and b!905779 ((_ is ValueCellFull!8856) mapDefault!29725)) b!905791))

(assert (= start!77672 b!905779))

(declare-fun b_lambda!13131 () Bool)

(assert (=> (not b_lambda!13131) (not b!905787)))

(declare-fun t!25452 () Bool)

(declare-fun tb!5279 () Bool)

(assert (=> (and start!77672 (= defaultEntry!1160 defaultEntry!1160) t!25452) tb!5279))

(declare-fun result!10353 () Bool)

(assert (=> tb!5279 (= result!10353 tp_is_empty!18675)))

(assert (=> b!905787 t!25452))

(declare-fun b_and!26669 () Bool)

(assert (= b_and!26667 (and (=> t!25452 result!10353) b_and!26669)))

(declare-fun m!841175 () Bool)

(assert (=> b!905785 m!841175))

(declare-fun m!841177 () Bool)

(assert (=> b!905785 m!841177))

(declare-fun m!841179 () Bool)

(assert (=> b!905782 m!841179))

(declare-fun m!841181 () Bool)

(assert (=> b!905781 m!841181))

(declare-fun m!841183 () Bool)

(assert (=> b!905788 m!841183))

(declare-fun m!841185 () Bool)

(assert (=> b!905790 m!841185))

(declare-fun m!841187 () Bool)

(assert (=> start!77672 m!841187))

(declare-fun m!841189 () Bool)

(assert (=> start!77672 m!841189))

(declare-fun m!841191 () Bool)

(assert (=> start!77672 m!841191))

(declare-fun m!841193 () Bool)

(assert (=> b!905783 m!841193))

(declare-fun m!841195 () Bool)

(assert (=> b!905783 m!841195))

(declare-fun m!841197 () Bool)

(assert (=> b!905789 m!841197))

(declare-fun m!841199 () Bool)

(assert (=> b!905789 m!841199))

(declare-fun m!841201 () Bool)

(assert (=> b!905786 m!841201))

(declare-fun m!841203 () Bool)

(assert (=> b!905787 m!841203))

(declare-fun m!841205 () Bool)

(assert (=> b!905787 m!841205))

(declare-fun m!841207 () Bool)

(assert (=> b!905787 m!841207))

(declare-fun m!841209 () Bool)

(assert (=> b!905787 m!841209))

(assert (=> b!905787 m!841203))

(assert (=> b!905787 m!841207))

(declare-fun m!841211 () Bool)

(assert (=> b!905787 m!841211))

(declare-fun m!841213 () Bool)

(assert (=> mapNonEmpty!29725 m!841213))

(check-sat (not b_next!16257) b_and!26669 (not b_lambda!13131) (not b!905789) (not start!77672) (not b!905781) (not b!905785) (not b!905782) tp_is_empty!18675 (not b!905786) (not b!905783) (not b!905787) (not mapNonEmpty!29725) (not b!905790))
(check-sat b_and!26669 (not b_next!16257))
