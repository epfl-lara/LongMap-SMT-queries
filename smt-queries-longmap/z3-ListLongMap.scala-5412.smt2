; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72208 () Bool)

(assert start!72208)

(declare-fun res!569231 () Bool)

(declare-fun e!466992 () Bool)

(assert (=> start!72208 (=> (not res!569231) (not e!466992))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46877 0))(
  ( (array!46878 (arr!22473 (Array (_ BitVec 32) (_ BitVec 64))) (size!22915 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46877)

(assert (=> start!72208 (= res!569231 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22915 _keys!868))))))

(assert (=> start!72208 e!466992))

(assert (=> start!72208 true))

(declare-fun array_inv!17978 (array!46877) Bool)

(assert (=> start!72208 (array_inv!17978 _keys!868)))

(declare-datatypes ((V!25457 0))(
  ( (V!25458 (val!7701 Int)) )
))
(declare-datatypes ((ValueCell!7214 0))(
  ( (ValueCellFull!7214 (v!10119 V!25457)) (EmptyCell!7214) )
))
(declare-datatypes ((array!46879 0))(
  ( (array!46880 (arr!22474 (Array (_ BitVec 32) ValueCell!7214)) (size!22916 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46879)

(declare-fun e!466994 () Bool)

(declare-fun array_inv!17979 (array!46879) Bool)

(assert (=> start!72208 (and (array_inv!17979 _values!688) e!466994)))

(declare-fun mapIsEmpty!24551 () Bool)

(declare-fun mapRes!24551 () Bool)

(assert (=> mapIsEmpty!24551 mapRes!24551))

(declare-fun b!836854 () Bool)

(declare-fun e!466996 () Bool)

(declare-fun tp_is_empty!15307 () Bool)

(assert (=> b!836854 (= e!466996 tp_is_empty!15307)))

(declare-fun b!836855 () Bool)

(declare-fun res!569232 () Bool)

(assert (=> b!836855 (=> (not res!569232) (not e!466992))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46877 (_ BitVec 32)) Bool)

(assert (=> b!836855 (= res!569232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!836856 () Bool)

(assert (=> b!836856 (= e!466992 (and (bvsle #b00000000000000000000000000000000 (size!22915 _keys!868)) (bvsge (size!22915 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!24551 () Bool)

(declare-fun tp!47546 () Bool)

(assert (=> mapNonEmpty!24551 (= mapRes!24551 (and tp!47546 e!466996))))

(declare-fun mapKey!24551 () (_ BitVec 32))

(declare-fun mapRest!24551 () (Array (_ BitVec 32) ValueCell!7214))

(declare-fun mapValue!24551 () ValueCell!7214)

(assert (=> mapNonEmpty!24551 (= (arr!22474 _values!688) (store mapRest!24551 mapKey!24551 mapValue!24551))))

(declare-fun b!836857 () Bool)

(declare-fun e!466993 () Bool)

(assert (=> b!836857 (= e!466994 (and e!466993 mapRes!24551))))

(declare-fun condMapEmpty!24551 () Bool)

(declare-fun mapDefault!24551 () ValueCell!7214)

(assert (=> b!836857 (= condMapEmpty!24551 (= (arr!22474 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7214)) mapDefault!24551)))))

(declare-fun b!836858 () Bool)

(assert (=> b!836858 (= e!466993 tp_is_empty!15307)))

(declare-fun b!836859 () Bool)

(declare-fun res!569230 () Bool)

(assert (=> b!836859 (=> (not res!569230) (not e!466992))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!836859 (= res!569230 (and (= (size!22916 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22915 _keys!868) (size!22916 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!836860 () Bool)

(declare-fun res!569233 () Bool)

(assert (=> b!836860 (=> (not res!569233) (not e!466992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836860 (= res!569233 (validMask!0 mask!1196))))

(assert (= (and start!72208 res!569231) b!836860))

(assert (= (and b!836860 res!569233) b!836859))

(assert (= (and b!836859 res!569230) b!836855))

(assert (= (and b!836855 res!569232) b!836856))

(assert (= (and b!836857 condMapEmpty!24551) mapIsEmpty!24551))

(assert (= (and b!836857 (not condMapEmpty!24551)) mapNonEmpty!24551))

(get-info :version)

(assert (= (and mapNonEmpty!24551 ((_ is ValueCellFull!7214) mapValue!24551)) b!836854))

(assert (= (and b!836857 ((_ is ValueCellFull!7214) mapDefault!24551)) b!836858))

(assert (= start!72208 b!836857))

(declare-fun m!781337 () Bool)

(assert (=> start!72208 m!781337))

(declare-fun m!781339 () Bool)

(assert (=> start!72208 m!781339))

(declare-fun m!781341 () Bool)

(assert (=> b!836855 m!781341))

(declare-fun m!781343 () Bool)

(assert (=> mapNonEmpty!24551 m!781343))

(declare-fun m!781345 () Bool)

(assert (=> b!836860 m!781345))

(check-sat (not b!836860) tp_is_empty!15307 (not mapNonEmpty!24551) (not b!836855) (not start!72208))
(check-sat)
(get-model)

(declare-fun d!107603 () Bool)

(assert (=> d!107603 (= (array_inv!17978 _keys!868) (bvsge (size!22915 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72208 d!107603))

(declare-fun d!107605 () Bool)

(assert (=> d!107605 (= (array_inv!17979 _values!688) (bvsge (size!22916 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72208 d!107605))

(declare-fun b!836911 () Bool)

(declare-fun e!467034 () Bool)

(declare-fun e!467035 () Bool)

(assert (=> b!836911 (= e!467034 e!467035)))

(declare-fun c!91082 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836911 (= c!91082 (validKeyInArray!0 (select (arr!22473 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!36786 () Bool)

(declare-fun call!36789 () Bool)

(assert (=> bm!36786 (= call!36789 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!107607 () Bool)

(declare-fun res!569263 () Bool)

(assert (=> d!107607 (=> res!569263 e!467034)))

(assert (=> d!107607 (= res!569263 (bvsge #b00000000000000000000000000000000 (size!22915 _keys!868)))))

(assert (=> d!107607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467034)))

(declare-fun b!836912 () Bool)

(declare-fun e!467033 () Bool)

(assert (=> b!836912 (= e!467035 e!467033)))

(declare-fun lt!380291 () (_ BitVec 64))

(assert (=> b!836912 (= lt!380291 (select (arr!22473 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28727 0))(
  ( (Unit!28728) )
))
(declare-fun lt!380293 () Unit!28727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46877 (_ BitVec 64) (_ BitVec 32)) Unit!28727)

(assert (=> b!836912 (= lt!380293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380291 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!836912 (arrayContainsKey!0 _keys!868 lt!380291 #b00000000000000000000000000000000)))

(declare-fun lt!380292 () Unit!28727)

(assert (=> b!836912 (= lt!380292 lt!380293)))

(declare-fun res!569262 () Bool)

(declare-datatypes ((SeekEntryResult!8742 0))(
  ( (MissingZero!8742 (index!37339 (_ BitVec 32))) (Found!8742 (index!37340 (_ BitVec 32))) (Intermediate!8742 (undefined!9554 Bool) (index!37341 (_ BitVec 32)) (x!70702 (_ BitVec 32))) (Undefined!8742) (MissingVacant!8742 (index!37342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46877 (_ BitVec 32)) SeekEntryResult!8742)

(assert (=> b!836912 (= res!569262 (= (seekEntryOrOpen!0 (select (arr!22473 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8742 #b00000000000000000000000000000000)))))

(assert (=> b!836912 (=> (not res!569262) (not e!467033))))

(declare-fun b!836913 () Bool)

(assert (=> b!836913 (= e!467035 call!36789)))

(declare-fun b!836914 () Bool)

(assert (=> b!836914 (= e!467033 call!36789)))

(assert (= (and d!107607 (not res!569263)) b!836911))

(assert (= (and b!836911 c!91082) b!836912))

(assert (= (and b!836911 (not c!91082)) b!836913))

(assert (= (and b!836912 res!569262) b!836914))

(assert (= (or b!836914 b!836913) bm!36786))

(declare-fun m!781367 () Bool)

(assert (=> b!836911 m!781367))

(assert (=> b!836911 m!781367))

(declare-fun m!781369 () Bool)

(assert (=> b!836911 m!781369))

(declare-fun m!781371 () Bool)

(assert (=> bm!36786 m!781371))

(assert (=> b!836912 m!781367))

(declare-fun m!781373 () Bool)

(assert (=> b!836912 m!781373))

(declare-fun m!781375 () Bool)

(assert (=> b!836912 m!781375))

(assert (=> b!836912 m!781367))

(declare-fun m!781377 () Bool)

(assert (=> b!836912 m!781377))

(assert (=> b!836855 d!107607))

(declare-fun d!107609 () Bool)

(assert (=> d!107609 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!836860 d!107609))

(declare-fun mapNonEmpty!24560 () Bool)

(declare-fun mapRes!24560 () Bool)

(declare-fun tp!47555 () Bool)

(declare-fun e!467041 () Bool)

(assert (=> mapNonEmpty!24560 (= mapRes!24560 (and tp!47555 e!467041))))

(declare-fun mapKey!24560 () (_ BitVec 32))

(declare-fun mapValue!24560 () ValueCell!7214)

(declare-fun mapRest!24560 () (Array (_ BitVec 32) ValueCell!7214))

(assert (=> mapNonEmpty!24560 (= mapRest!24551 (store mapRest!24560 mapKey!24560 mapValue!24560))))

(declare-fun b!836921 () Bool)

(assert (=> b!836921 (= e!467041 tp_is_empty!15307)))

(declare-fun b!836922 () Bool)

(declare-fun e!467040 () Bool)

(assert (=> b!836922 (= e!467040 tp_is_empty!15307)))

(declare-fun condMapEmpty!24560 () Bool)

(declare-fun mapDefault!24560 () ValueCell!7214)

(assert (=> mapNonEmpty!24551 (= condMapEmpty!24560 (= mapRest!24551 ((as const (Array (_ BitVec 32) ValueCell!7214)) mapDefault!24560)))))

(assert (=> mapNonEmpty!24551 (= tp!47546 (and e!467040 mapRes!24560))))

(declare-fun mapIsEmpty!24560 () Bool)

(assert (=> mapIsEmpty!24560 mapRes!24560))

(assert (= (and mapNonEmpty!24551 condMapEmpty!24560) mapIsEmpty!24560))

(assert (= (and mapNonEmpty!24551 (not condMapEmpty!24560)) mapNonEmpty!24560))

(assert (= (and mapNonEmpty!24560 ((_ is ValueCellFull!7214) mapValue!24560)) b!836921))

(assert (= (and mapNonEmpty!24551 ((_ is ValueCellFull!7214) mapDefault!24560)) b!836922))

(declare-fun m!781379 () Bool)

(assert (=> mapNonEmpty!24560 m!781379))

(check-sat (not bm!36786) (not mapNonEmpty!24560) (not b!836911) (not b!836912) tp_is_empty!15307)
(check-sat)
