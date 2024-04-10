; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72348 () Bool)

(assert start!72348)

(declare-fun b_free!13533 () Bool)

(declare-fun b_next!13533 () Bool)

(assert (=> start!72348 (= b_free!13533 (not b_next!13533))))

(declare-fun tp!47697 () Bool)

(declare-fun b_and!22619 () Bool)

(assert (=> start!72348 (= tp!47697 b_and!22619)))

(declare-fun b!838205 () Bool)

(declare-fun res!569992 () Bool)

(declare-fun e!467912 () Bool)

(assert (=> b!838205 (=> (not res!569992) (not e!467912))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47088 0))(
  ( (array!47089 (arr!22575 (Array (_ BitVec 32) (_ BitVec 64))) (size!23015 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47088)

(declare-datatypes ((V!25579 0))(
  ( (V!25580 (val!7747 Int)) )
))
(declare-datatypes ((ValueCell!7260 0))(
  ( (ValueCellFull!7260 (v!10172 V!25579)) (EmptyCell!7260) )
))
(declare-datatypes ((array!47090 0))(
  ( (array!47091 (arr!22576 (Array (_ BitVec 32) ValueCell!7260)) (size!23016 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47090)

(assert (=> b!838205 (= res!569992 (and (= (size!23016 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23015 _keys!868) (size!23016 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569987 () Bool)

(assert (=> start!72348 (=> (not res!569987) (not e!467912))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72348 (= res!569987 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23015 _keys!868))))))

(assert (=> start!72348 e!467912))

(declare-fun tp_is_empty!15399 () Bool)

(assert (=> start!72348 tp_is_empty!15399))

(assert (=> start!72348 true))

(assert (=> start!72348 tp!47697))

(declare-fun array_inv!17990 (array!47088) Bool)

(assert (=> start!72348 (array_inv!17990 _keys!868)))

(declare-fun e!467911 () Bool)

(declare-fun array_inv!17991 (array!47090) Bool)

(assert (=> start!72348 (and (array_inv!17991 _values!688) e!467911)))

(declare-fun b!838206 () Bool)

(declare-fun res!569986 () Bool)

(assert (=> b!838206 (=> (not res!569986) (not e!467912))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838206 (= res!569986 (validKeyInArray!0 k0!854))))

(declare-fun b!838207 () Bool)

(declare-fun e!467914 () Bool)

(declare-fun mapRes!24698 () Bool)

(assert (=> b!838207 (= e!467911 (and e!467914 mapRes!24698))))

(declare-fun condMapEmpty!24698 () Bool)

(declare-fun mapDefault!24698 () ValueCell!7260)

(assert (=> b!838207 (= condMapEmpty!24698 (= (arr!22576 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7260)) mapDefault!24698)))))

(declare-datatypes ((tuple2!10246 0))(
  ( (tuple2!10247 (_1!5134 (_ BitVec 64)) (_2!5134 V!25579)) )
))
(declare-datatypes ((List!16050 0))(
  ( (Nil!16047) (Cons!16046 (h!17177 tuple2!10246) (t!22421 List!16050)) )
))
(declare-datatypes ((ListLongMap!9015 0))(
  ( (ListLongMap!9016 (toList!4523 List!16050)) )
))
(declare-fun call!36832 () ListLongMap!9015)

(declare-fun v!557 () V!25579)

(declare-fun b!838208 () Bool)

(declare-fun call!36833 () ListLongMap!9015)

(declare-fun e!467913 () Bool)

(declare-fun +!1998 (ListLongMap!9015 tuple2!10246) ListLongMap!9015)

(assert (=> b!838208 (= e!467913 (= call!36833 (+!1998 call!36832 (tuple2!10247 k0!854 v!557))))))

(declare-fun mapNonEmpty!24698 () Bool)

(declare-fun tp!47698 () Bool)

(declare-fun e!467909 () Bool)

(assert (=> mapNonEmpty!24698 (= mapRes!24698 (and tp!47698 e!467909))))

(declare-fun mapValue!24698 () ValueCell!7260)

(declare-fun mapKey!24698 () (_ BitVec 32))

(declare-fun mapRest!24698 () (Array (_ BitVec 32) ValueCell!7260))

(assert (=> mapNonEmpty!24698 (= (arr!22576 _values!688) (store mapRest!24698 mapKey!24698 mapValue!24698))))

(declare-fun bm!36829 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25579)

(declare-fun zeroValue!654 () V!25579)

(declare-fun getCurrentListMapNoExtraKeys!2515 (array!47088 array!47090 (_ BitVec 32) (_ BitVec 32) V!25579 V!25579 (_ BitVec 32) Int) ListLongMap!9015)

(assert (=> bm!36829 (= call!36832 (getCurrentListMapNoExtraKeys!2515 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838209 () Bool)

(declare-fun res!569991 () Bool)

(assert (=> b!838209 (=> (not res!569991) (not e!467912))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838209 (= res!569991 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23015 _keys!868))))))

(declare-fun b!838210 () Bool)

(assert (=> b!838210 (= e!467912 (not true))))

(assert (=> b!838210 e!467913))

(declare-fun c!91159 () Bool)

(assert (=> b!838210 (= c!91159 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28787 0))(
  ( (Unit!28788) )
))
(declare-fun lt!380665 () Unit!28787)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!239 (array!47088 array!47090 (_ BitVec 32) (_ BitVec 32) V!25579 V!25579 (_ BitVec 32) (_ BitVec 64) V!25579 (_ BitVec 32) Int) Unit!28787)

(assert (=> b!838210 (= lt!380665 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!239 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24698 () Bool)

(assert (=> mapIsEmpty!24698 mapRes!24698))

(declare-fun b!838211 () Bool)

(declare-fun res!569990 () Bool)

(assert (=> b!838211 (=> (not res!569990) (not e!467912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838211 (= res!569990 (validMask!0 mask!1196))))

(declare-fun bm!36830 () Bool)

(assert (=> bm!36830 (= call!36833 (getCurrentListMapNoExtraKeys!2515 _keys!868 (array!47091 (store (arr!22576 _values!688) i!612 (ValueCellFull!7260 v!557)) (size!23016 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838212 () Bool)

(assert (=> b!838212 (= e!467914 tp_is_empty!15399)))

(declare-fun b!838213 () Bool)

(declare-fun res!569993 () Bool)

(assert (=> b!838213 (=> (not res!569993) (not e!467912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47088 (_ BitVec 32)) Bool)

(assert (=> b!838213 (= res!569993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838214 () Bool)

(assert (=> b!838214 (= e!467913 (= call!36833 call!36832))))

(declare-fun b!838215 () Bool)

(declare-fun res!569988 () Bool)

(assert (=> b!838215 (=> (not res!569988) (not e!467912))))

(declare-datatypes ((List!16051 0))(
  ( (Nil!16048) (Cons!16047 (h!17178 (_ BitVec 64)) (t!22422 List!16051)) )
))
(declare-fun arrayNoDuplicates!0 (array!47088 (_ BitVec 32) List!16051) Bool)

(assert (=> b!838215 (= res!569988 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16048))))

(declare-fun b!838216 () Bool)

(assert (=> b!838216 (= e!467909 tp_is_empty!15399)))

(declare-fun b!838217 () Bool)

(declare-fun res!569989 () Bool)

(assert (=> b!838217 (=> (not res!569989) (not e!467912))))

(assert (=> b!838217 (= res!569989 (and (= (select (arr!22575 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23015 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72348 res!569987) b!838211))

(assert (= (and b!838211 res!569990) b!838205))

(assert (= (and b!838205 res!569992) b!838213))

(assert (= (and b!838213 res!569993) b!838215))

(assert (= (and b!838215 res!569988) b!838209))

(assert (= (and b!838209 res!569991) b!838206))

(assert (= (and b!838206 res!569986) b!838217))

(assert (= (and b!838217 res!569989) b!838210))

(assert (= (and b!838210 c!91159) b!838208))

(assert (= (and b!838210 (not c!91159)) b!838214))

(assert (= (or b!838208 b!838214) bm!36830))

(assert (= (or b!838208 b!838214) bm!36829))

(assert (= (and b!838207 condMapEmpty!24698) mapIsEmpty!24698))

(assert (= (and b!838207 (not condMapEmpty!24698)) mapNonEmpty!24698))

(get-info :version)

(assert (= (and mapNonEmpty!24698 ((_ is ValueCellFull!7260) mapValue!24698)) b!838216))

(assert (= (and b!838207 ((_ is ValueCellFull!7260) mapDefault!24698)) b!838212))

(assert (= start!72348 b!838207))

(declare-fun m!782723 () Bool)

(assert (=> start!72348 m!782723))

(declare-fun m!782725 () Bool)

(assert (=> start!72348 m!782725))

(declare-fun m!782727 () Bool)

(assert (=> b!838210 m!782727))

(declare-fun m!782729 () Bool)

(assert (=> mapNonEmpty!24698 m!782729))

(declare-fun m!782731 () Bool)

(assert (=> b!838213 m!782731))

(declare-fun m!782733 () Bool)

(assert (=> b!838217 m!782733))

(declare-fun m!782735 () Bool)

(assert (=> b!838215 m!782735))

(declare-fun m!782737 () Bool)

(assert (=> bm!36830 m!782737))

(declare-fun m!782739 () Bool)

(assert (=> bm!36830 m!782739))

(declare-fun m!782741 () Bool)

(assert (=> b!838208 m!782741))

(declare-fun m!782743 () Bool)

(assert (=> b!838206 m!782743))

(declare-fun m!782745 () Bool)

(assert (=> bm!36829 m!782745))

(declare-fun m!782747 () Bool)

(assert (=> b!838211 m!782747))

(check-sat (not b!838206) (not bm!36829) (not b!838210) (not b!838211) tp_is_empty!15399 (not bm!36830) (not mapNonEmpty!24698) b_and!22619 (not b!838213) (not b_next!13533) (not b!838215) (not b!838208) (not start!72348))
(check-sat b_and!22619 (not b_next!13533))
