; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78900 () Bool)

(assert start!78900)

(declare-fun b_free!16945 () Bool)

(declare-fun b_next!16945 () Bool)

(assert (=> start!78900 (= b_free!16945 (not b_next!16945))))

(declare-fun tp!59277 () Bool)

(declare-fun b_and!27637 () Bool)

(assert (=> start!78900 (= tp!59277 b_and!27637)))

(declare-fun b!919355 () Bool)

(declare-fun res!619592 () Bool)

(declare-fun e!516166 () Bool)

(assert (=> b!919355 (=> (not res!619592) (not e!516166))))

(declare-datatypes ((array!54935 0))(
  ( (array!54936 (arr!26408 (Array (_ BitVec 32) (_ BitVec 64))) (size!26868 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54935)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54935 (_ BitVec 32)) Bool)

(assert (=> b!919355 (= res!619592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919356 () Bool)

(declare-fun e!516164 () Bool)

(assert (=> b!919356 (= e!516164 (not true))))

(declare-datatypes ((V!30903 0))(
  ( (V!30904 (val!9777 Int)) )
))
(declare-datatypes ((tuple2!12672 0))(
  ( (tuple2!12673 (_1!6347 (_ BitVec 64)) (_2!6347 V!30903)) )
))
(declare-datatypes ((List!18492 0))(
  ( (Nil!18489) (Cons!18488 (h!19640 tuple2!12672) (t!26159 List!18492)) )
))
(declare-datatypes ((ListLongMap!11371 0))(
  ( (ListLongMap!11372 (toList!5701 List!18492)) )
))
(declare-fun lt!412604 () ListLongMap!11371)

(declare-fun lt!412606 () tuple2!12672)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4755 (ListLongMap!11371 (_ BitVec 64)) Bool)

(declare-fun +!2643 (ListLongMap!11371 tuple2!12672) ListLongMap!11371)

(assert (=> b!919356 (contains!4755 (+!2643 lt!412604 lt!412606) k0!1099)))

(declare-fun lt!412603 () V!30903)

(declare-datatypes ((Unit!30998 0))(
  ( (Unit!30999) )
))
(declare-fun lt!412602 () Unit!30998)

(declare-fun lt!412607 () (_ BitVec 64))

(declare-fun addStillContains!352 (ListLongMap!11371 (_ BitVec 64) V!30903 (_ BitVec 64)) Unit!30998)

(assert (=> b!919356 (= lt!412602 (addStillContains!352 lt!412604 lt!412607 lt!412603 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9245 0))(
  ( (ValueCellFull!9245 (v!12292 V!30903)) (EmptyCell!9245) )
))
(declare-datatypes ((array!54937 0))(
  ( (array!54938 (arr!26409 (Array (_ BitVec 32) ValueCell!9245)) (size!26869 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54937)

(declare-fun zeroValue!1173 () V!30903)

(declare-fun minValue!1173 () V!30903)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2955 (array!54935 array!54937 (_ BitVec 32) (_ BitVec 32) V!30903 V!30903 (_ BitVec 32) Int) ListLongMap!11371)

(assert (=> b!919356 (= (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2643 (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412606))))

(assert (=> b!919356 (= lt!412606 (tuple2!12673 lt!412607 lt!412603))))

(declare-fun get!13860 (ValueCell!9245 V!30903) V!30903)

(declare-fun dynLambda!1440 (Int (_ BitVec 64)) V!30903)

(assert (=> b!919356 (= lt!412603 (get!13860 (select (arr!26409 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1440 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412605 () Unit!30998)

(declare-fun lemmaListMapRecursiveValidKeyArray!23 (array!54935 array!54937 (_ BitVec 32) (_ BitVec 32) V!30903 V!30903 (_ BitVec 32) Int) Unit!30998)

(assert (=> b!919356 (= lt!412605 (lemmaListMapRecursiveValidKeyArray!23 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30936 () Bool)

(declare-fun mapRes!30936 () Bool)

(assert (=> mapIsEmpty!30936 mapRes!30936))

(declare-fun b!919357 () Bool)

(declare-fun e!516163 () Bool)

(assert (=> b!919357 (= e!516163 e!516164)))

(declare-fun res!619585 () Bool)

(assert (=> b!919357 (=> (not res!619585) (not e!516164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919357 (= res!619585 (validKeyInArray!0 lt!412607))))

(assert (=> b!919357 (= lt!412607 (select (arr!26408 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!619588 () Bool)

(assert (=> start!78900 (=> (not res!619588) (not e!516166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78900 (= res!619588 (validMask!0 mask!1881))))

(assert (=> start!78900 e!516166))

(assert (=> start!78900 true))

(declare-fun tp_is_empty!19453 () Bool)

(assert (=> start!78900 tp_is_empty!19453))

(declare-fun e!516165 () Bool)

(declare-fun array_inv!20682 (array!54937) Bool)

(assert (=> start!78900 (and (array_inv!20682 _values!1231) e!516165)))

(assert (=> start!78900 tp!59277))

(declare-fun array_inv!20683 (array!54935) Bool)

(assert (=> start!78900 (array_inv!20683 _keys!1487)))

(declare-fun b!919358 () Bool)

(declare-fun res!619590 () Bool)

(assert (=> b!919358 (=> (not res!619590) (not e!516166))))

(declare-datatypes ((List!18493 0))(
  ( (Nil!18490) (Cons!18489 (h!19641 (_ BitVec 64)) (t!26160 List!18493)) )
))
(declare-fun arrayNoDuplicates!0 (array!54935 (_ BitVec 32) List!18493) Bool)

(assert (=> b!919358 (= res!619590 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18490))))

(declare-fun b!919359 () Bool)

(declare-fun res!619587 () Bool)

(assert (=> b!919359 (=> (not res!619587) (not e!516163))))

(declare-fun v!791 () V!30903)

(declare-fun apply!576 (ListLongMap!11371 (_ BitVec 64)) V!30903)

(assert (=> b!919359 (= res!619587 (= (apply!576 lt!412604 k0!1099) v!791))))

(declare-fun b!919360 () Bool)

(declare-fun res!619589 () Bool)

(assert (=> b!919360 (=> (not res!619589) (not e!516163))))

(assert (=> b!919360 (= res!619589 (validKeyInArray!0 k0!1099))))

(declare-fun b!919361 () Bool)

(assert (=> b!919361 (= e!516166 e!516163)))

(declare-fun res!619584 () Bool)

(assert (=> b!919361 (=> (not res!619584) (not e!516163))))

(assert (=> b!919361 (= res!619584 (contains!4755 lt!412604 k0!1099))))

(assert (=> b!919361 (= lt!412604 (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919362 () Bool)

(declare-fun e!516169 () Bool)

(assert (=> b!919362 (= e!516165 (and e!516169 mapRes!30936))))

(declare-fun condMapEmpty!30936 () Bool)

(declare-fun mapDefault!30936 () ValueCell!9245)

(assert (=> b!919362 (= condMapEmpty!30936 (= (arr!26409 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9245)) mapDefault!30936)))))

(declare-fun b!919363 () Bool)

(declare-fun res!619593 () Bool)

(assert (=> b!919363 (=> (not res!619593) (not e!516166))))

(assert (=> b!919363 (= res!619593 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26868 _keys!1487))))))

(declare-fun b!919364 () Bool)

(declare-fun res!619586 () Bool)

(assert (=> b!919364 (=> (not res!619586) (not e!516166))))

(assert (=> b!919364 (= res!619586 (and (= (size!26869 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26868 _keys!1487) (size!26869 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30936 () Bool)

(declare-fun tp!59276 () Bool)

(declare-fun e!516167 () Bool)

(assert (=> mapNonEmpty!30936 (= mapRes!30936 (and tp!59276 e!516167))))

(declare-fun mapValue!30936 () ValueCell!9245)

(declare-fun mapKey!30936 () (_ BitVec 32))

(declare-fun mapRest!30936 () (Array (_ BitVec 32) ValueCell!9245))

(assert (=> mapNonEmpty!30936 (= (arr!26409 _values!1231) (store mapRest!30936 mapKey!30936 mapValue!30936))))

(declare-fun b!919365 () Bool)

(declare-fun res!619591 () Bool)

(assert (=> b!919365 (=> (not res!619591) (not e!516163))))

(assert (=> b!919365 (= res!619591 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919366 () Bool)

(assert (=> b!919366 (= e!516169 tp_is_empty!19453)))

(declare-fun b!919367 () Bool)

(assert (=> b!919367 (= e!516167 tp_is_empty!19453)))

(assert (= (and start!78900 res!619588) b!919364))

(assert (= (and b!919364 res!619586) b!919355))

(assert (= (and b!919355 res!619592) b!919358))

(assert (= (and b!919358 res!619590) b!919363))

(assert (= (and b!919363 res!619593) b!919361))

(assert (= (and b!919361 res!619584) b!919359))

(assert (= (and b!919359 res!619587) b!919365))

(assert (= (and b!919365 res!619591) b!919360))

(assert (= (and b!919360 res!619589) b!919357))

(assert (= (and b!919357 res!619585) b!919356))

(assert (= (and b!919362 condMapEmpty!30936) mapIsEmpty!30936))

(assert (= (and b!919362 (not condMapEmpty!30936)) mapNonEmpty!30936))

(get-info :version)

(assert (= (and mapNonEmpty!30936 ((_ is ValueCellFull!9245) mapValue!30936)) b!919367))

(assert (= (and b!919362 ((_ is ValueCellFull!9245) mapDefault!30936)) b!919366))

(assert (= start!78900 b!919362))

(declare-fun b_lambda!13461 () Bool)

(assert (=> (not b_lambda!13461) (not b!919356)))

(declare-fun t!26158 () Bool)

(declare-fun tb!5517 () Bool)

(assert (=> (and start!78900 (= defaultEntry!1235 defaultEntry!1235) t!26158) tb!5517))

(declare-fun result!10865 () Bool)

(assert (=> tb!5517 (= result!10865 tp_is_empty!19453)))

(assert (=> b!919356 t!26158))

(declare-fun b_and!27639 () Bool)

(assert (= b_and!27637 (and (=> t!26158 result!10865) b_and!27639)))

(declare-fun m!853417 () Bool)

(assert (=> b!919358 m!853417))

(declare-fun m!853419 () Bool)

(assert (=> b!919355 m!853419))

(declare-fun m!853421 () Bool)

(assert (=> b!919357 m!853421))

(declare-fun m!853423 () Bool)

(assert (=> b!919357 m!853423))

(declare-fun m!853425 () Bool)

(assert (=> b!919360 m!853425))

(declare-fun m!853427 () Bool)

(assert (=> b!919359 m!853427))

(declare-fun m!853429 () Bool)

(assert (=> start!78900 m!853429))

(declare-fun m!853431 () Bool)

(assert (=> start!78900 m!853431))

(declare-fun m!853433 () Bool)

(assert (=> start!78900 m!853433))

(declare-fun m!853435 () Bool)

(assert (=> b!919356 m!853435))

(declare-fun m!853437 () Bool)

(assert (=> b!919356 m!853437))

(declare-fun m!853439 () Bool)

(assert (=> b!919356 m!853439))

(declare-fun m!853441 () Bool)

(assert (=> b!919356 m!853441))

(declare-fun m!853443 () Bool)

(assert (=> b!919356 m!853443))

(declare-fun m!853445 () Bool)

(assert (=> b!919356 m!853445))

(declare-fun m!853447 () Bool)

(assert (=> b!919356 m!853447))

(declare-fun m!853449 () Bool)

(assert (=> b!919356 m!853449))

(declare-fun m!853451 () Bool)

(assert (=> b!919356 m!853451))

(assert (=> b!919356 m!853449))

(declare-fun m!853453 () Bool)

(assert (=> b!919356 m!853453))

(assert (=> b!919356 m!853441))

(assert (=> b!919356 m!853443))

(assert (=> b!919356 m!853435))

(declare-fun m!853455 () Bool)

(assert (=> b!919361 m!853455))

(declare-fun m!853457 () Bool)

(assert (=> b!919361 m!853457))

(declare-fun m!853459 () Bool)

(assert (=> mapNonEmpty!30936 m!853459))

(check-sat (not b_next!16945) (not b_lambda!13461) (not b!919360) (not b!919359) (not b!919357) (not start!78900) (not mapNonEmpty!30936) b_and!27639 (not b!919361) tp_is_empty!19453 (not b!919358) (not b!919355) (not b!919356))
(check-sat b_and!27639 (not b_next!16945))
