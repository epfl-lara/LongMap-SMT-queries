; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40452 () Bool)

(assert start!40452)

(declare-fun b_free!10537 () Bool)

(declare-fun b_next!10537 () Bool)

(assert (=> start!40452 (= b_free!10537 (not b_next!10537))))

(declare-fun tp!37388 () Bool)

(declare-fun b_and!18495 () Bool)

(assert (=> start!40452 (= tp!37388 b_and!18495)))

(declare-fun res!264194 () Bool)

(declare-fun e!261660 () Bool)

(assert (=> start!40452 (=> (not res!264194) (not e!261660))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27513 0))(
  ( (array!27514 (arr!13204 (Array (_ BitVec 32) (_ BitVec 64))) (size!13557 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27513)

(assert (=> start!40452 (= res!264194 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13557 _keys!709))))))

(assert (=> start!40452 e!261660))

(declare-fun tp_is_empty!11851 () Bool)

(assert (=> start!40452 tp_is_empty!11851))

(assert (=> start!40452 tp!37388))

(assert (=> start!40452 true))

(declare-datatypes ((V!16907 0))(
  ( (V!16908 (val!5970 Int)) )
))
(declare-datatypes ((ValueCell!5582 0))(
  ( (ValueCellFull!5582 (v!8215 V!16907)) (EmptyCell!5582) )
))
(declare-datatypes ((array!27515 0))(
  ( (array!27516 (arr!13205 (Array (_ BitVec 32) ValueCell!5582)) (size!13558 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27515)

(declare-fun e!261659 () Bool)

(declare-fun array_inv!9624 (array!27515) Bool)

(assert (=> start!40452 (and (array_inv!9624 _values!549) e!261659)))

(declare-fun array_inv!9625 (array!27513) Bool)

(assert (=> start!40452 (array_inv!9625 _keys!709)))

(declare-fun b!445179 () Bool)

(declare-fun res!264189 () Bool)

(assert (=> b!445179 (=> (not res!264189) (not e!261660))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445179 (= res!264189 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13557 _keys!709))))))

(declare-fun b!445180 () Bool)

(declare-fun e!261665 () Bool)

(assert (=> b!445180 (= e!261665 tp_is_empty!11851)))

(declare-fun b!445181 () Bool)

(declare-fun mapRes!19404 () Bool)

(assert (=> b!445181 (= e!261659 (and e!261665 mapRes!19404))))

(declare-fun condMapEmpty!19404 () Bool)

(declare-fun mapDefault!19404 () ValueCell!5582)

(assert (=> b!445181 (= condMapEmpty!19404 (= (arr!13205 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5582)) mapDefault!19404)))))

(declare-fun b!445182 () Bool)

(declare-fun res!264192 () Bool)

(assert (=> b!445182 (=> (not res!264192) (not e!261660))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445182 (= res!264192 (validMask!0 mask!1025))))

(declare-fun b!445183 () Bool)

(declare-fun res!264188 () Bool)

(assert (=> b!445183 (=> (not res!264188) (not e!261660))))

(declare-datatypes ((List!7897 0))(
  ( (Nil!7894) (Cons!7893 (h!8749 (_ BitVec 64)) (t!13646 List!7897)) )
))
(declare-fun arrayNoDuplicates!0 (array!27513 (_ BitVec 32) List!7897) Bool)

(assert (=> b!445183 (= res!264188 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7894))))

(declare-fun b!445184 () Bool)

(declare-fun res!264191 () Bool)

(assert (=> b!445184 (=> (not res!264191) (not e!261660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27513 (_ BitVec 32)) Bool)

(assert (=> b!445184 (= res!264191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445185 () Bool)

(declare-fun e!261661 () Bool)

(assert (=> b!445185 (= e!261660 e!261661)))

(declare-fun res!264187 () Bool)

(assert (=> b!445185 (=> (not res!264187) (not e!261661))))

(declare-fun lt!203401 () array!27513)

(assert (=> b!445185 (= res!264187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203401 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!445185 (= lt!203401 (array!27514 (store (arr!13204 _keys!709) i!563 k0!794) (size!13557 _keys!709)))))

(declare-fun minValue!515 () V!16907)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29539 () Bool)

(declare-fun c!55780 () Bool)

(declare-fun v!412 () V!16907)

(declare-fun zeroValue!515 () V!16907)

(declare-datatypes ((tuple2!7848 0))(
  ( (tuple2!7849 (_1!3935 (_ BitVec 64)) (_2!3935 V!16907)) )
))
(declare-datatypes ((List!7898 0))(
  ( (Nil!7895) (Cons!7894 (h!8750 tuple2!7848) (t!13647 List!7898)) )
))
(declare-datatypes ((ListLongMap!6751 0))(
  ( (ListLongMap!6752 (toList!3391 List!7898)) )
))
(declare-fun call!29543 () ListLongMap!6751)

(declare-fun getCurrentListMapNoExtraKeys!1590 (array!27513 array!27515 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) Int) ListLongMap!6751)

(assert (=> bm!29539 (= call!29543 (getCurrentListMapNoExtraKeys!1590 (ite c!55780 _keys!709 lt!203401) (ite c!55780 _values!549 (array!27516 (store (arr!13205 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13558 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29542 () ListLongMap!6751)

(declare-fun e!261662 () Bool)

(declare-fun b!445186 () Bool)

(declare-fun +!1549 (ListLongMap!6751 tuple2!7848) ListLongMap!6751)

(assert (=> b!445186 (= e!261662 (= call!29542 (+!1549 call!29543 (tuple2!7849 k0!794 v!412))))))

(declare-fun b!445187 () Bool)

(declare-fun res!264196 () Bool)

(assert (=> b!445187 (=> (not res!264196) (not e!261660))))

(declare-fun arrayContainsKey!0 (array!27513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445187 (= res!264196 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445188 () Bool)

(declare-fun e!261664 () Bool)

(assert (=> b!445188 (= e!261664 tp_is_empty!11851)))

(declare-fun b!445189 () Bool)

(declare-fun res!264195 () Bool)

(assert (=> b!445189 (=> (not res!264195) (not e!261660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445189 (= res!264195 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19404 () Bool)

(declare-fun tp!37389 () Bool)

(assert (=> mapNonEmpty!19404 (= mapRes!19404 (and tp!37389 e!261664))))

(declare-fun mapKey!19404 () (_ BitVec 32))

(declare-fun mapValue!19404 () ValueCell!5582)

(declare-fun mapRest!19404 () (Array (_ BitVec 32) ValueCell!5582))

(assert (=> mapNonEmpty!19404 (= (arr!13205 _values!549) (store mapRest!19404 mapKey!19404 mapValue!19404))))

(declare-fun b!445190 () Bool)

(declare-fun res!264190 () Bool)

(assert (=> b!445190 (=> (not res!264190) (not e!261660))))

(assert (=> b!445190 (= res!264190 (and (= (size!13558 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13557 _keys!709) (size!13558 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29540 () Bool)

(assert (=> bm!29540 (= call!29542 (getCurrentListMapNoExtraKeys!1590 (ite c!55780 lt!203401 _keys!709) (ite c!55780 (array!27516 (store (arr!13205 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13558 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19404 () Bool)

(assert (=> mapIsEmpty!19404 mapRes!19404))

(declare-fun b!445191 () Bool)

(assert (=> b!445191 (= e!261661 (not true))))

(assert (=> b!445191 e!261662))

(assert (=> b!445191 (= c!55780 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13117 0))(
  ( (Unit!13118) )
))
(declare-fun lt!203402 () Unit!13117)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 (array!27513 array!27515 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) (_ BitVec 64) V!16907 (_ BitVec 32) Int) Unit!13117)

(assert (=> b!445191 (= lt!203402 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445192 () Bool)

(assert (=> b!445192 (= e!261662 (= call!29543 call!29542))))

(declare-fun b!445193 () Bool)

(declare-fun res!264186 () Bool)

(assert (=> b!445193 (=> (not res!264186) (not e!261661))))

(assert (=> b!445193 (= res!264186 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13557 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445194 () Bool)

(declare-fun res!264193 () Bool)

(assert (=> b!445194 (=> (not res!264193) (not e!261660))))

(assert (=> b!445194 (= res!264193 (or (= (select (arr!13204 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13204 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445195 () Bool)

(declare-fun res!264185 () Bool)

(assert (=> b!445195 (=> (not res!264185) (not e!261661))))

(assert (=> b!445195 (= res!264185 (arrayNoDuplicates!0 lt!203401 #b00000000000000000000000000000000 Nil!7894))))

(assert (= (and start!40452 res!264194) b!445182))

(assert (= (and b!445182 res!264192) b!445190))

(assert (= (and b!445190 res!264190) b!445184))

(assert (= (and b!445184 res!264191) b!445183))

(assert (= (and b!445183 res!264188) b!445179))

(assert (= (and b!445179 res!264189) b!445189))

(assert (= (and b!445189 res!264195) b!445194))

(assert (= (and b!445194 res!264193) b!445187))

(assert (= (and b!445187 res!264196) b!445185))

(assert (= (and b!445185 res!264187) b!445195))

(assert (= (and b!445195 res!264185) b!445193))

(assert (= (and b!445193 res!264186) b!445191))

(assert (= (and b!445191 c!55780) b!445186))

(assert (= (and b!445191 (not c!55780)) b!445192))

(assert (= (or b!445186 b!445192) bm!29540))

(assert (= (or b!445186 b!445192) bm!29539))

(assert (= (and b!445181 condMapEmpty!19404) mapIsEmpty!19404))

(assert (= (and b!445181 (not condMapEmpty!19404)) mapNonEmpty!19404))

(get-info :version)

(assert (= (and mapNonEmpty!19404 ((_ is ValueCellFull!5582) mapValue!19404)) b!445188))

(assert (= (and b!445181 ((_ is ValueCellFull!5582) mapDefault!19404)) b!445180))

(assert (= start!40452 b!445181))

(declare-fun m!430201 () Bool)

(assert (=> bm!29540 m!430201))

(declare-fun m!430203 () Bool)

(assert (=> bm!29540 m!430203))

(declare-fun m!430205 () Bool)

(assert (=> mapNonEmpty!19404 m!430205))

(declare-fun m!430207 () Bool)

(assert (=> b!445183 m!430207))

(declare-fun m!430209 () Bool)

(assert (=> b!445191 m!430209))

(declare-fun m!430211 () Bool)

(assert (=> b!445184 m!430211))

(declare-fun m!430213 () Bool)

(assert (=> b!445185 m!430213))

(declare-fun m!430215 () Bool)

(assert (=> b!445185 m!430215))

(declare-fun m!430217 () Bool)

(assert (=> b!445194 m!430217))

(declare-fun m!430219 () Bool)

(assert (=> b!445187 m!430219))

(declare-fun m!430221 () Bool)

(assert (=> b!445195 m!430221))

(declare-fun m!430223 () Bool)

(assert (=> b!445182 m!430223))

(assert (=> bm!29539 m!430201))

(declare-fun m!430225 () Bool)

(assert (=> bm!29539 m!430225))

(declare-fun m!430227 () Bool)

(assert (=> start!40452 m!430227))

(declare-fun m!430229 () Bool)

(assert (=> start!40452 m!430229))

(declare-fun m!430231 () Bool)

(assert (=> b!445186 m!430231))

(declare-fun m!430233 () Bool)

(assert (=> b!445189 m!430233))

(check-sat b_and!18495 (not bm!29540) (not b!445186) (not start!40452) (not b!445184) (not b!445182) (not bm!29539) (not mapNonEmpty!19404) (not b_next!10537) tp_is_empty!11851 (not b!445189) (not b!445183) (not b!445191) (not b!445187) (not b!445195) (not b!445185))
(check-sat b_and!18495 (not b_next!10537))
