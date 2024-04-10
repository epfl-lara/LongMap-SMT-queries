; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37126 () Bool)

(assert start!37126)

(declare-fun b_free!8253 () Bool)

(declare-fun b_next!8253 () Bool)

(assert (=> start!37126 (= b_free!8253 (not b_next!8253))))

(declare-fun tp!29474 () Bool)

(declare-fun b_and!15495 () Bool)

(assert (=> start!37126 (= tp!29474 b_and!15495)))

(declare-fun b!374127 () Bool)

(declare-fun res!210902 () Bool)

(declare-fun e!228038 () Bool)

(assert (=> b!374127 (=> (not res!210902) (not e!228038))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21741 0))(
  ( (array!21742 (arr!10339 (Array (_ BitVec 32) (_ BitVec 64))) (size!10691 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21741)

(assert (=> b!374127 (= res!210902 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10691 _keys!658))))))

(declare-fun b!374128 () Bool)

(declare-fun e!228031 () Bool)

(declare-fun e!228034 () Bool)

(declare-fun mapRes!14916 () Bool)

(assert (=> b!374128 (= e!228031 (and e!228034 mapRes!14916))))

(declare-fun condMapEmpty!14916 () Bool)

(declare-datatypes ((V!12973 0))(
  ( (V!12974 (val!4495 Int)) )
))
(declare-datatypes ((ValueCell!4107 0))(
  ( (ValueCellFull!4107 (v!6692 V!12973)) (EmptyCell!4107) )
))
(declare-datatypes ((array!21743 0))(
  ( (array!21744 (arr!10340 (Array (_ BitVec 32) ValueCell!4107)) (size!10692 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21743)

(declare-fun mapDefault!14916 () ValueCell!4107)

(assert (=> b!374128 (= condMapEmpty!14916 (= (arr!10340 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4107)) mapDefault!14916)))))

(declare-fun mapNonEmpty!14916 () Bool)

(declare-fun tp!29475 () Bool)

(declare-fun e!228036 () Bool)

(assert (=> mapNonEmpty!14916 (= mapRes!14916 (and tp!29475 e!228036))))

(declare-fun mapValue!14916 () ValueCell!4107)

(declare-fun mapKey!14916 () (_ BitVec 32))

(declare-fun mapRest!14916 () (Array (_ BitVec 32) ValueCell!4107))

(assert (=> mapNonEmpty!14916 (= (arr!10340 _values!506) (store mapRest!14916 mapKey!14916 mapValue!14916))))

(declare-fun mapIsEmpty!14916 () Bool)

(assert (=> mapIsEmpty!14916 mapRes!14916))

(declare-fun res!210901 () Bool)

(assert (=> start!37126 (=> (not res!210901) (not e!228038))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37126 (= res!210901 (validMask!0 mask!970))))

(assert (=> start!37126 e!228038))

(declare-fun array_inv!7624 (array!21743) Bool)

(assert (=> start!37126 (and (array_inv!7624 _values!506) e!228031)))

(assert (=> start!37126 tp!29474))

(assert (=> start!37126 true))

(declare-fun tp_is_empty!8901 () Bool)

(assert (=> start!37126 tp_is_empty!8901))

(declare-fun array_inv!7625 (array!21741) Bool)

(assert (=> start!37126 (array_inv!7625 _keys!658)))

(declare-fun b!374129 () Bool)

(declare-fun e!228037 () Bool)

(declare-fun e!228032 () Bool)

(assert (=> b!374129 (= e!228037 (not e!228032))))

(declare-fun res!210899 () Bool)

(assert (=> b!374129 (=> res!210899 e!228032)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374129 (= res!210899 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5974 0))(
  ( (tuple2!5975 (_1!2998 (_ BitVec 64)) (_2!2998 V!12973)) )
))
(declare-datatypes ((List!5819 0))(
  ( (Nil!5816) (Cons!5815 (h!6671 tuple2!5974) (t!10969 List!5819)) )
))
(declare-datatypes ((ListLongMap!4887 0))(
  ( (ListLongMap!4888 (toList!2459 List!5819)) )
))
(declare-fun lt!172261 () ListLongMap!4887)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12973)

(declare-fun minValue!472 () V!12973)

(declare-fun getCurrentListMap!1898 (array!21741 array!21743 (_ BitVec 32) (_ BitVec 32) V!12973 V!12973 (_ BitVec 32) Int) ListLongMap!4887)

(assert (=> b!374129 (= lt!172261 (getCurrentListMap!1898 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172264 () array!21741)

(declare-fun lt!172263 () array!21743)

(declare-fun lt!172262 () ListLongMap!4887)

(assert (=> b!374129 (= lt!172262 (getCurrentListMap!1898 lt!172264 lt!172263 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172258 () ListLongMap!4887)

(declare-fun lt!172269 () ListLongMap!4887)

(assert (=> b!374129 (and (= lt!172258 lt!172269) (= lt!172269 lt!172258))))

(declare-fun lt!172259 () ListLongMap!4887)

(declare-fun lt!172265 () tuple2!5974)

(declare-fun +!805 (ListLongMap!4887 tuple2!5974) ListLongMap!4887)

(assert (=> b!374129 (= lt!172269 (+!805 lt!172259 lt!172265))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12973)

(assert (=> b!374129 (= lt!172265 (tuple2!5975 k0!778 v!373))))

(declare-datatypes ((Unit!11516 0))(
  ( (Unit!11517) )
))
(declare-fun lt!172257 () Unit!11516)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!56 (array!21741 array!21743 (_ BitVec 32) (_ BitVec 32) V!12973 V!12973 (_ BitVec 32) (_ BitVec 64) V!12973 (_ BitVec 32) Int) Unit!11516)

(assert (=> b!374129 (= lt!172257 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!56 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!732 (array!21741 array!21743 (_ BitVec 32) (_ BitVec 32) V!12973 V!12973 (_ BitVec 32) Int) ListLongMap!4887)

(assert (=> b!374129 (= lt!172258 (getCurrentListMapNoExtraKeys!732 lt!172264 lt!172263 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374129 (= lt!172263 (array!21744 (store (arr!10340 _values!506) i!548 (ValueCellFull!4107 v!373)) (size!10692 _values!506)))))

(assert (=> b!374129 (= lt!172259 (getCurrentListMapNoExtraKeys!732 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374130 () Bool)

(declare-fun e!228035 () Bool)

(assert (=> b!374130 (= e!228035 true)))

(declare-fun lt!172256 () tuple2!5974)

(declare-fun lt!172271 () ListLongMap!4887)

(declare-fun lt!172267 () ListLongMap!4887)

(assert (=> b!374130 (= (+!805 lt!172271 lt!172256) (+!805 lt!172267 lt!172265))))

(declare-fun lt!172260 () Unit!11516)

(declare-fun lt!172272 () ListLongMap!4887)

(declare-fun addCommutativeForDiffKeys!229 (ListLongMap!4887 (_ BitVec 64) V!12973 (_ BitVec 64) V!12973) Unit!11516)

(assert (=> b!374130 (= lt!172260 (addCommutativeForDiffKeys!229 lt!172272 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374131 () Bool)

(declare-fun res!210895 () Bool)

(assert (=> b!374131 (=> (not res!210895) (not e!228038))))

(assert (=> b!374131 (= res!210895 (and (= (size!10692 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10691 _keys!658) (size!10692 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374132 () Bool)

(assert (=> b!374132 (= e!228032 e!228035)))

(declare-fun res!210900 () Bool)

(assert (=> b!374132 (=> res!210900 e!228035)))

(assert (=> b!374132 (= res!210900 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172270 () ListLongMap!4887)

(assert (=> b!374132 (= lt!172270 lt!172271)))

(assert (=> b!374132 (= lt!172271 (+!805 lt!172272 lt!172265))))

(declare-fun lt!172268 () Unit!11516)

(assert (=> b!374132 (= lt!172268 (addCommutativeForDiffKeys!229 lt!172259 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374132 (= lt!172262 (+!805 lt!172270 lt!172256))))

(declare-fun lt!172266 () tuple2!5974)

(assert (=> b!374132 (= lt!172270 (+!805 lt!172269 lt!172266))))

(assert (=> b!374132 (= lt!172261 lt!172267)))

(assert (=> b!374132 (= lt!172267 (+!805 lt!172272 lt!172256))))

(assert (=> b!374132 (= lt!172272 (+!805 lt!172259 lt!172266))))

(assert (=> b!374132 (= lt!172262 (+!805 (+!805 lt!172258 lt!172266) lt!172256))))

(assert (=> b!374132 (= lt!172256 (tuple2!5975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374132 (= lt!172266 (tuple2!5975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374133 () Bool)

(assert (=> b!374133 (= e!228034 tp_is_empty!8901)))

(declare-fun b!374134 () Bool)

(declare-fun res!210898 () Bool)

(assert (=> b!374134 (=> (not res!210898) (not e!228038))))

(declare-fun arrayContainsKey!0 (array!21741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374134 (= res!210898 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374135 () Bool)

(declare-fun res!210905 () Bool)

(assert (=> b!374135 (=> (not res!210905) (not e!228038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374135 (= res!210905 (validKeyInArray!0 k0!778))))

(declare-fun b!374136 () Bool)

(declare-fun res!210904 () Bool)

(assert (=> b!374136 (=> (not res!210904) (not e!228038))))

(declare-datatypes ((List!5820 0))(
  ( (Nil!5817) (Cons!5816 (h!6672 (_ BitVec 64)) (t!10970 List!5820)) )
))
(declare-fun arrayNoDuplicates!0 (array!21741 (_ BitVec 32) List!5820) Bool)

(assert (=> b!374136 (= res!210904 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5817))))

(declare-fun b!374137 () Bool)

(declare-fun res!210896 () Bool)

(assert (=> b!374137 (=> (not res!210896) (not e!228038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21741 (_ BitVec 32)) Bool)

(assert (=> b!374137 (= res!210896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374138 () Bool)

(declare-fun res!210897 () Bool)

(assert (=> b!374138 (=> (not res!210897) (not e!228037))))

(assert (=> b!374138 (= res!210897 (arrayNoDuplicates!0 lt!172264 #b00000000000000000000000000000000 Nil!5817))))

(declare-fun b!374139 () Bool)

(assert (=> b!374139 (= e!228036 tp_is_empty!8901)))

(declare-fun b!374140 () Bool)

(declare-fun res!210894 () Bool)

(assert (=> b!374140 (=> (not res!210894) (not e!228038))))

(assert (=> b!374140 (= res!210894 (or (= (select (arr!10339 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10339 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374141 () Bool)

(assert (=> b!374141 (= e!228038 e!228037)))

(declare-fun res!210903 () Bool)

(assert (=> b!374141 (=> (not res!210903) (not e!228037))))

(assert (=> b!374141 (= res!210903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172264 mask!970))))

(assert (=> b!374141 (= lt!172264 (array!21742 (store (arr!10339 _keys!658) i!548 k0!778) (size!10691 _keys!658)))))

(assert (= (and start!37126 res!210901) b!374131))

(assert (= (and b!374131 res!210895) b!374137))

(assert (= (and b!374137 res!210896) b!374136))

(assert (= (and b!374136 res!210904) b!374127))

(assert (= (and b!374127 res!210902) b!374135))

(assert (= (and b!374135 res!210905) b!374140))

(assert (= (and b!374140 res!210894) b!374134))

(assert (= (and b!374134 res!210898) b!374141))

(assert (= (and b!374141 res!210903) b!374138))

(assert (= (and b!374138 res!210897) b!374129))

(assert (= (and b!374129 (not res!210899)) b!374132))

(assert (= (and b!374132 (not res!210900)) b!374130))

(assert (= (and b!374128 condMapEmpty!14916) mapIsEmpty!14916))

(assert (= (and b!374128 (not condMapEmpty!14916)) mapNonEmpty!14916))

(get-info :version)

(assert (= (and mapNonEmpty!14916 ((_ is ValueCellFull!4107) mapValue!14916)) b!374139))

(assert (= (and b!374128 ((_ is ValueCellFull!4107) mapDefault!14916)) b!374133))

(assert (= start!37126 b!374128))

(declare-fun m!370275 () Bool)

(assert (=> b!374135 m!370275))

(declare-fun m!370277 () Bool)

(assert (=> b!374130 m!370277))

(declare-fun m!370279 () Bool)

(assert (=> b!374130 m!370279))

(declare-fun m!370281 () Bool)

(assert (=> b!374130 m!370281))

(declare-fun m!370283 () Bool)

(assert (=> b!374134 m!370283))

(declare-fun m!370285 () Bool)

(assert (=> b!374141 m!370285))

(declare-fun m!370287 () Bool)

(assert (=> b!374141 m!370287))

(declare-fun m!370289 () Bool)

(assert (=> b!374136 m!370289))

(declare-fun m!370291 () Bool)

(assert (=> mapNonEmpty!14916 m!370291))

(declare-fun m!370293 () Bool)

(assert (=> b!374140 m!370293))

(declare-fun m!370295 () Bool)

(assert (=> b!374138 m!370295))

(declare-fun m!370297 () Bool)

(assert (=> start!37126 m!370297))

(declare-fun m!370299 () Bool)

(assert (=> start!37126 m!370299))

(declare-fun m!370301 () Bool)

(assert (=> start!37126 m!370301))

(declare-fun m!370303 () Bool)

(assert (=> b!374129 m!370303))

(declare-fun m!370305 () Bool)

(assert (=> b!374129 m!370305))

(declare-fun m!370307 () Bool)

(assert (=> b!374129 m!370307))

(declare-fun m!370309 () Bool)

(assert (=> b!374129 m!370309))

(declare-fun m!370311 () Bool)

(assert (=> b!374129 m!370311))

(declare-fun m!370313 () Bool)

(assert (=> b!374129 m!370313))

(declare-fun m!370315 () Bool)

(assert (=> b!374129 m!370315))

(declare-fun m!370317 () Bool)

(assert (=> b!374137 m!370317))

(declare-fun m!370319 () Bool)

(assert (=> b!374132 m!370319))

(declare-fun m!370321 () Bool)

(assert (=> b!374132 m!370321))

(declare-fun m!370323 () Bool)

(assert (=> b!374132 m!370323))

(declare-fun m!370325 () Bool)

(assert (=> b!374132 m!370325))

(declare-fun m!370327 () Bool)

(assert (=> b!374132 m!370327))

(assert (=> b!374132 m!370325))

(declare-fun m!370329 () Bool)

(assert (=> b!374132 m!370329))

(declare-fun m!370331 () Bool)

(assert (=> b!374132 m!370331))

(declare-fun m!370333 () Bool)

(assert (=> b!374132 m!370333))

(check-sat (not b!374129) (not b!374137) (not b_next!8253) (not mapNonEmpty!14916) tp_is_empty!8901 (not b!374134) b_and!15495 (not b!374130) (not b!374132) (not b!374138) (not b!374135) (not b!374136) (not b!374141) (not start!37126))
(check-sat b_and!15495 (not b_next!8253))
