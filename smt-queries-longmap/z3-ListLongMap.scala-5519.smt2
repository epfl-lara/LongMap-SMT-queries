; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73066 () Bool)

(assert start!73066)

(declare-fun b_free!13813 () Bool)

(declare-fun b_next!13813 () Bool)

(assert (=> start!73066 (= b_free!13813 (not b_next!13813))))

(declare-fun tp!48944 () Bool)

(declare-fun b_and!22909 () Bool)

(assert (=> start!73066 (= tp!48944 b_and!22909)))

(declare-fun b!847201 () Bool)

(declare-fun e!472937 () Bool)

(declare-fun tp_is_empty!15949 () Bool)

(assert (=> b!847201 (= e!472937 tp_is_empty!15949)))

(declare-fun b!847202 () Bool)

(declare-fun res!575316 () Bool)

(declare-fun e!472938 () Bool)

(assert (=> b!847202 (=> (not res!575316) (not e!472938))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847202 (= res!575316 (validKeyInArray!0 k0!854))))

(declare-fun b!847203 () Bool)

(declare-fun res!575310 () Bool)

(assert (=> b!847203 (=> (not res!575310) (not e!472938))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847203 (= res!575310 (validMask!0 mask!1196))))

(declare-fun b!847204 () Bool)

(declare-fun res!575315 () Bool)

(assert (=> b!847204 (=> (not res!575315) (not e!472938))))

(declare-datatypes ((array!48161 0))(
  ( (array!48162 (arr!23107 (Array (_ BitVec 32) (_ BitVec 64))) (size!23548 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48161)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48161 (_ BitVec 32)) Bool)

(assert (=> b!847204 (= res!575315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847205 () Bool)

(declare-fun e!472935 () Bool)

(declare-fun e!472936 () Bool)

(declare-fun mapRes!25523 () Bool)

(assert (=> b!847205 (= e!472935 (and e!472936 mapRes!25523))))

(declare-fun condMapEmpty!25523 () Bool)

(declare-datatypes ((V!26313 0))(
  ( (V!26314 (val!8022 Int)) )
))
(declare-datatypes ((ValueCell!7535 0))(
  ( (ValueCellFull!7535 (v!10447 V!26313)) (EmptyCell!7535) )
))
(declare-datatypes ((array!48163 0))(
  ( (array!48164 (arr!23108 (Array (_ BitVec 32) ValueCell!7535)) (size!23549 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48163)

(declare-fun mapDefault!25523 () ValueCell!7535)

(assert (=> b!847205 (= condMapEmpty!25523 (= (arr!23108 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7535)) mapDefault!25523)))))

(declare-fun b!847206 () Bool)

(assert (=> b!847206 (= e!472938 false)))

(declare-datatypes ((tuple2!10400 0))(
  ( (tuple2!10401 (_1!5211 (_ BitVec 64)) (_2!5211 V!26313)) )
))
(declare-datatypes ((List!16270 0))(
  ( (Nil!16267) (Cons!16266 (h!17403 tuple2!10400) (t!22633 List!16270)) )
))
(declare-datatypes ((ListLongMap!9171 0))(
  ( (ListLongMap!9172 (toList!4601 List!16270)) )
))
(declare-fun lt!381871 () ListLongMap!9171)

(declare-fun v!557 () V!26313)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26313)

(declare-fun zeroValue!654 () V!26313)

(declare-fun getCurrentListMapNoExtraKeys!2659 (array!48161 array!48163 (_ BitVec 32) (_ BitVec 32) V!26313 V!26313 (_ BitVec 32) Int) ListLongMap!9171)

(assert (=> b!847206 (= lt!381871 (getCurrentListMapNoExtraKeys!2659 _keys!868 (array!48164 (store (arr!23108 _values!688) i!612 (ValueCellFull!7535 v!557)) (size!23549 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381872 () ListLongMap!9171)

(assert (=> b!847206 (= lt!381872 (getCurrentListMapNoExtraKeys!2659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847207 () Bool)

(declare-fun res!575311 () Bool)

(assert (=> b!847207 (=> (not res!575311) (not e!472938))))

(declare-datatypes ((List!16271 0))(
  ( (Nil!16268) (Cons!16267 (h!17404 (_ BitVec 64)) (t!22634 List!16271)) )
))
(declare-fun arrayNoDuplicates!0 (array!48161 (_ BitVec 32) List!16271) Bool)

(assert (=> b!847207 (= res!575311 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16268))))

(declare-fun b!847208 () Bool)

(declare-fun res!575312 () Bool)

(assert (=> b!847208 (=> (not res!575312) (not e!472938))))

(assert (=> b!847208 (= res!575312 (and (= (size!23549 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23548 _keys!868) (size!23549 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!575314 () Bool)

(assert (=> start!73066 (=> (not res!575314) (not e!472938))))

(assert (=> start!73066 (= res!575314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23548 _keys!868))))))

(assert (=> start!73066 e!472938))

(assert (=> start!73066 tp_is_empty!15949))

(assert (=> start!73066 true))

(assert (=> start!73066 tp!48944))

(declare-fun array_inv!18410 (array!48161) Bool)

(assert (=> start!73066 (array_inv!18410 _keys!868)))

(declare-fun array_inv!18411 (array!48163) Bool)

(assert (=> start!73066 (and (array_inv!18411 _values!688) e!472935)))

(declare-fun b!847209 () Bool)

(declare-fun res!575313 () Bool)

(assert (=> b!847209 (=> (not res!575313) (not e!472938))))

(assert (=> b!847209 (= res!575313 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23548 _keys!868))))))

(declare-fun b!847210 () Bool)

(assert (=> b!847210 (= e!472936 tp_is_empty!15949)))

(declare-fun mapIsEmpty!25523 () Bool)

(assert (=> mapIsEmpty!25523 mapRes!25523))

(declare-fun mapNonEmpty!25523 () Bool)

(declare-fun tp!48943 () Bool)

(assert (=> mapNonEmpty!25523 (= mapRes!25523 (and tp!48943 e!472937))))

(declare-fun mapRest!25523 () (Array (_ BitVec 32) ValueCell!7535))

(declare-fun mapValue!25523 () ValueCell!7535)

(declare-fun mapKey!25523 () (_ BitVec 32))

(assert (=> mapNonEmpty!25523 (= (arr!23108 _values!688) (store mapRest!25523 mapKey!25523 mapValue!25523))))

(declare-fun b!847211 () Bool)

(declare-fun res!575317 () Bool)

(assert (=> b!847211 (=> (not res!575317) (not e!472938))))

(assert (=> b!847211 (= res!575317 (and (= (select (arr!23107 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73066 res!575314) b!847203))

(assert (= (and b!847203 res!575310) b!847208))

(assert (= (and b!847208 res!575312) b!847204))

(assert (= (and b!847204 res!575315) b!847207))

(assert (= (and b!847207 res!575311) b!847209))

(assert (= (and b!847209 res!575313) b!847202))

(assert (= (and b!847202 res!575316) b!847211))

(assert (= (and b!847211 res!575317) b!847206))

(assert (= (and b!847205 condMapEmpty!25523) mapIsEmpty!25523))

(assert (= (and b!847205 (not condMapEmpty!25523)) mapNonEmpty!25523))

(get-info :version)

(assert (= (and mapNonEmpty!25523 ((_ is ValueCellFull!7535) mapValue!25523)) b!847201))

(assert (= (and b!847205 ((_ is ValueCellFull!7535) mapDefault!25523)) b!847210))

(assert (= start!73066 b!847205))

(declare-fun m!789035 () Bool)

(assert (=> b!847203 m!789035))

(declare-fun m!789037 () Bool)

(assert (=> mapNonEmpty!25523 m!789037))

(declare-fun m!789039 () Bool)

(assert (=> b!847211 m!789039))

(declare-fun m!789041 () Bool)

(assert (=> b!847204 m!789041))

(declare-fun m!789043 () Bool)

(assert (=> start!73066 m!789043))

(declare-fun m!789045 () Bool)

(assert (=> start!73066 m!789045))

(declare-fun m!789047 () Bool)

(assert (=> b!847202 m!789047))

(declare-fun m!789049 () Bool)

(assert (=> b!847206 m!789049))

(declare-fun m!789051 () Bool)

(assert (=> b!847206 m!789051))

(declare-fun m!789053 () Bool)

(assert (=> b!847206 m!789053))

(declare-fun m!789055 () Bool)

(assert (=> b!847207 m!789055))

(check-sat (not b_next!13813) (not b!847207) (not start!73066) tp_is_empty!15949 (not b!847203) (not b!847206) b_and!22909 (not b!847204) (not mapNonEmpty!25523) (not b!847202))
(check-sat b_and!22909 (not b_next!13813))
