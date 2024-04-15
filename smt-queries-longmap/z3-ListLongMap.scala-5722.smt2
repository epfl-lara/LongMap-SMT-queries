; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74110 () Bool)

(assert start!74110)

(declare-fun b!871808 () Bool)

(declare-fun e!485411 () Bool)

(declare-fun tp_is_empty!17167 () Bool)

(assert (=> b!871808 (= e!485411 tp_is_empty!17167)))

(declare-fun b!871809 () Bool)

(declare-fun res!592621 () Bool)

(declare-fun e!485410 () Bool)

(assert (=> b!871809 (=> (not res!592621) (not e!485410))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871809 (= res!592621 (validMask!0 mask!1196))))

(declare-fun b!871810 () Bool)

(declare-fun res!592623 () Bool)

(assert (=> b!871810 (=> (not res!592623) (not e!485410))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50461 0))(
  ( (array!50462 (arr!24261 (Array (_ BitVec 32) (_ BitVec 64))) (size!24703 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50461)

(declare-datatypes ((V!27937 0))(
  ( (V!27938 (val!8631 Int)) )
))
(declare-datatypes ((ValueCell!8144 0))(
  ( (ValueCellFull!8144 (v!11050 V!27937)) (EmptyCell!8144) )
))
(declare-datatypes ((array!50463 0))(
  ( (array!50464 (arr!24262 (Array (_ BitVec 32) ValueCell!8144)) (size!24704 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50463)

(assert (=> b!871810 (= res!592623 (and (= (size!24704 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24703 _keys!868) (size!24704 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871811 () Bool)

(assert (=> b!871811 (= e!485410 false)))

(declare-fun lt!395330 () Bool)

(declare-datatypes ((List!17256 0))(
  ( (Nil!17253) (Cons!17252 (h!18383 (_ BitVec 64)) (t!24284 List!17256)) )
))
(declare-fun arrayNoDuplicates!0 (array!50461 (_ BitVec 32) List!17256) Bool)

(assert (=> b!871811 (= lt!395330 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17253))))

(declare-fun mapIsEmpty!27353 () Bool)

(declare-fun mapRes!27353 () Bool)

(assert (=> mapIsEmpty!27353 mapRes!27353))

(declare-fun b!871812 () Bool)

(declare-fun e!485409 () Bool)

(assert (=> b!871812 (= e!485409 tp_is_empty!17167)))

(declare-fun res!592622 () Bool)

(assert (=> start!74110 (=> (not res!592622) (not e!485410))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74110 (= res!592622 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24703 _keys!868))))))

(assert (=> start!74110 e!485410))

(assert (=> start!74110 true))

(declare-fun array_inv!19216 (array!50461) Bool)

(assert (=> start!74110 (array_inv!19216 _keys!868)))

(declare-fun e!485412 () Bool)

(declare-fun array_inv!19217 (array!50463) Bool)

(assert (=> start!74110 (and (array_inv!19217 _values!688) e!485412)))

(declare-fun mapNonEmpty!27353 () Bool)

(declare-fun tp!52553 () Bool)

(assert (=> mapNonEmpty!27353 (= mapRes!27353 (and tp!52553 e!485411))))

(declare-fun mapKey!27353 () (_ BitVec 32))

(declare-fun mapRest!27353 () (Array (_ BitVec 32) ValueCell!8144))

(declare-fun mapValue!27353 () ValueCell!8144)

(assert (=> mapNonEmpty!27353 (= (arr!24262 _values!688) (store mapRest!27353 mapKey!27353 mapValue!27353))))

(declare-fun b!871813 () Bool)

(declare-fun res!592620 () Bool)

(assert (=> b!871813 (=> (not res!592620) (not e!485410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50461 (_ BitVec 32)) Bool)

(assert (=> b!871813 (= res!592620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871814 () Bool)

(assert (=> b!871814 (= e!485412 (and e!485409 mapRes!27353))))

(declare-fun condMapEmpty!27353 () Bool)

(declare-fun mapDefault!27353 () ValueCell!8144)

(assert (=> b!871814 (= condMapEmpty!27353 (= (arr!24262 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8144)) mapDefault!27353)))))

(assert (= (and start!74110 res!592622) b!871809))

(assert (= (and b!871809 res!592621) b!871810))

(assert (= (and b!871810 res!592623) b!871813))

(assert (= (and b!871813 res!592620) b!871811))

(assert (= (and b!871814 condMapEmpty!27353) mapIsEmpty!27353))

(assert (= (and b!871814 (not condMapEmpty!27353)) mapNonEmpty!27353))

(get-info :version)

(assert (= (and mapNonEmpty!27353 ((_ is ValueCellFull!8144) mapValue!27353)) b!871808))

(assert (= (and b!871814 ((_ is ValueCellFull!8144) mapDefault!27353)) b!871812))

(assert (= start!74110 b!871814))

(declare-fun m!812277 () Bool)

(assert (=> b!871813 m!812277))

(declare-fun m!812279 () Bool)

(assert (=> start!74110 m!812279))

(declare-fun m!812281 () Bool)

(assert (=> start!74110 m!812281))

(declare-fun m!812283 () Bool)

(assert (=> b!871809 m!812283))

(declare-fun m!812285 () Bool)

(assert (=> b!871811 m!812285))

(declare-fun m!812287 () Bool)

(assert (=> mapNonEmpty!27353 m!812287))

(check-sat (not b!871813) (not mapNonEmpty!27353) tp_is_empty!17167 (not b!871811) (not start!74110) (not b!871809))
(check-sat)
