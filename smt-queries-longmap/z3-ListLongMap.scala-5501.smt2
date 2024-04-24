; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72958 () Bool)

(assert start!72958)

(declare-fun res!574261 () Bool)

(declare-fun e!472128 () Bool)

(assert (=> start!72958 (=> (not res!574261) (not e!472128))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47951 0))(
  ( (array!47952 (arr!23002 (Array (_ BitVec 32) (_ BitVec 64))) (size!23443 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47951)

(assert (=> start!72958 (= res!574261 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23443 _keys!868))))))

(assert (=> start!72958 e!472128))

(assert (=> start!72958 true))

(declare-fun array_inv!18334 (array!47951) Bool)

(assert (=> start!72958 (array_inv!18334 _keys!868)))

(declare-datatypes ((V!26169 0))(
  ( (V!26170 (val!7968 Int)) )
))
(declare-datatypes ((ValueCell!7481 0))(
  ( (ValueCellFull!7481 (v!10393 V!26169)) (EmptyCell!7481) )
))
(declare-datatypes ((array!47953 0))(
  ( (array!47954 (arr!23003 (Array (_ BitVec 32) ValueCell!7481)) (size!23444 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47953)

(declare-fun e!472127 () Bool)

(declare-fun array_inv!18335 (array!47953) Bool)

(assert (=> start!72958 (and (array_inv!18335 _values!688) e!472127)))

(declare-fun b!845663 () Bool)

(declare-fun e!472125 () Bool)

(declare-fun mapRes!25361 () Bool)

(assert (=> b!845663 (= e!472127 (and e!472125 mapRes!25361))))

(declare-fun condMapEmpty!25361 () Bool)

(declare-fun mapDefault!25361 () ValueCell!7481)

(assert (=> b!845663 (= condMapEmpty!25361 (= (arr!23003 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7481)) mapDefault!25361)))))

(declare-fun mapIsEmpty!25361 () Bool)

(assert (=> mapIsEmpty!25361 mapRes!25361))

(declare-fun b!845664 () Bool)

(declare-fun res!574258 () Bool)

(assert (=> b!845664 (=> (not res!574258) (not e!472128))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845664 (= res!574258 (validMask!0 mask!1196))))

(declare-fun b!845665 () Bool)

(declare-fun res!574260 () Bool)

(assert (=> b!845665 (=> (not res!574260) (not e!472128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47951 (_ BitVec 32)) Bool)

(assert (=> b!845665 (= res!574260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845666 () Bool)

(declare-fun tp_is_empty!15841 () Bool)

(assert (=> b!845666 (= e!472125 tp_is_empty!15841)))

(declare-fun b!845667 () Bool)

(assert (=> b!845667 (= e!472128 false)))

(declare-fun lt!381689 () Bool)

(declare-datatypes ((List!16210 0))(
  ( (Nil!16207) (Cons!16206 (h!17343 (_ BitVec 64)) (t!22573 List!16210)) )
))
(declare-fun arrayNoDuplicates!0 (array!47951 (_ BitVec 32) List!16210) Bool)

(assert (=> b!845667 (= lt!381689 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16207))))

(declare-fun b!845668 () Bool)

(declare-fun res!574259 () Bool)

(assert (=> b!845668 (=> (not res!574259) (not e!472128))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845668 (= res!574259 (and (= (size!23444 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23443 _keys!868) (size!23444 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25361 () Bool)

(declare-fun tp!48680 () Bool)

(declare-fun e!472129 () Bool)

(assert (=> mapNonEmpty!25361 (= mapRes!25361 (and tp!48680 e!472129))))

(declare-fun mapRest!25361 () (Array (_ BitVec 32) ValueCell!7481))

(declare-fun mapValue!25361 () ValueCell!7481)

(declare-fun mapKey!25361 () (_ BitVec 32))

(assert (=> mapNonEmpty!25361 (= (arr!23003 _values!688) (store mapRest!25361 mapKey!25361 mapValue!25361))))

(declare-fun b!845669 () Bool)

(assert (=> b!845669 (= e!472129 tp_is_empty!15841)))

(assert (= (and start!72958 res!574261) b!845664))

(assert (= (and b!845664 res!574258) b!845668))

(assert (= (and b!845668 res!574259) b!845665))

(assert (= (and b!845665 res!574260) b!845667))

(assert (= (and b!845663 condMapEmpty!25361) mapIsEmpty!25361))

(assert (= (and b!845663 (not condMapEmpty!25361)) mapNonEmpty!25361))

(get-info :version)

(assert (= (and mapNonEmpty!25361 ((_ is ValueCellFull!7481) mapValue!25361)) b!845669))

(assert (= (and b!845663 ((_ is ValueCellFull!7481) mapDefault!25361)) b!845666))

(assert (= start!72958 b!845663))

(declare-fun m!788165 () Bool)

(assert (=> mapNonEmpty!25361 m!788165))

(declare-fun m!788167 () Bool)

(assert (=> b!845665 m!788167))

(declare-fun m!788169 () Bool)

(assert (=> start!72958 m!788169))

(declare-fun m!788171 () Bool)

(assert (=> start!72958 m!788171))

(declare-fun m!788173 () Bool)

(assert (=> b!845664 m!788173))

(declare-fun m!788175 () Bool)

(assert (=> b!845667 m!788175))

(check-sat (not start!72958) (not mapNonEmpty!25361) tp_is_empty!15841 (not b!845664) (not b!845665) (not b!845667))
(check-sat)
