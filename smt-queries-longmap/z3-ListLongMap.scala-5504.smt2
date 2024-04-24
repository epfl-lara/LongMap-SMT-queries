; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72976 () Bool)

(assert start!72976)

(declare-fun mapIsEmpty!25388 () Bool)

(declare-fun mapRes!25388 () Bool)

(assert (=> mapIsEmpty!25388 mapRes!25388))

(declare-fun mapNonEmpty!25388 () Bool)

(declare-fun tp!48707 () Bool)

(declare-fun e!472264 () Bool)

(assert (=> mapNonEmpty!25388 (= mapRes!25388 (and tp!48707 e!472264))))

(declare-fun mapKey!25388 () (_ BitVec 32))

(declare-datatypes ((V!26193 0))(
  ( (V!26194 (val!7977 Int)) )
))
(declare-datatypes ((ValueCell!7490 0))(
  ( (ValueCellFull!7490 (v!10402 V!26193)) (EmptyCell!7490) )
))
(declare-fun mapRest!25388 () (Array (_ BitVec 32) ValueCell!7490))

(declare-fun mapValue!25388 () ValueCell!7490)

(declare-datatypes ((array!47985 0))(
  ( (array!47986 (arr!23019 (Array (_ BitVec 32) ValueCell!7490)) (size!23460 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47985)

(assert (=> mapNonEmpty!25388 (= (arr!23019 _values!688) (store mapRest!25388 mapKey!25388 mapValue!25388))))

(declare-fun res!574367 () Bool)

(declare-fun e!472260 () Bool)

(assert (=> start!72976 (=> (not res!574367) (not e!472260))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47987 0))(
  ( (array!47988 (arr!23020 (Array (_ BitVec 32) (_ BitVec 64))) (size!23461 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47987)

(assert (=> start!72976 (= res!574367 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23461 _keys!868))))))

(assert (=> start!72976 e!472260))

(assert (=> start!72976 true))

(declare-fun array_inv!18348 (array!47987) Bool)

(assert (=> start!72976 (array_inv!18348 _keys!868)))

(declare-fun e!472263 () Bool)

(declare-fun array_inv!18349 (array!47985) Bool)

(assert (=> start!72976 (and (array_inv!18349 _values!688) e!472263)))

(declare-fun b!845852 () Bool)

(declare-fun tp_is_empty!15859 () Bool)

(assert (=> b!845852 (= e!472264 tp_is_empty!15859)))

(declare-fun b!845853 () Bool)

(declare-fun res!574369 () Bool)

(assert (=> b!845853 (=> (not res!574369) (not e!472260))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845853 (= res!574369 (validMask!0 mask!1196))))

(declare-fun b!845854 () Bool)

(declare-fun res!574368 () Bool)

(assert (=> b!845854 (=> (not res!574368) (not e!472260))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845854 (= res!574368 (and (= (size!23460 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23461 _keys!868) (size!23460 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845855 () Bool)

(declare-fun res!574366 () Bool)

(assert (=> b!845855 (=> (not res!574366) (not e!472260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47987 (_ BitVec 32)) Bool)

(assert (=> b!845855 (= res!574366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845856 () Bool)

(declare-fun e!472261 () Bool)

(assert (=> b!845856 (= e!472261 tp_is_empty!15859)))

(declare-fun b!845857 () Bool)

(assert (=> b!845857 (= e!472263 (and e!472261 mapRes!25388))))

(declare-fun condMapEmpty!25388 () Bool)

(declare-fun mapDefault!25388 () ValueCell!7490)

(assert (=> b!845857 (= condMapEmpty!25388 (= (arr!23019 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7490)) mapDefault!25388)))))

(declare-fun b!845858 () Bool)

(assert (=> b!845858 (= e!472260 false)))

(declare-fun lt!381716 () Bool)

(declare-datatypes ((List!16218 0))(
  ( (Nil!16215) (Cons!16214 (h!17351 (_ BitVec 64)) (t!22581 List!16218)) )
))
(declare-fun arrayNoDuplicates!0 (array!47987 (_ BitVec 32) List!16218) Bool)

(assert (=> b!845858 (= lt!381716 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16215))))

(assert (= (and start!72976 res!574367) b!845853))

(assert (= (and b!845853 res!574369) b!845854))

(assert (= (and b!845854 res!574368) b!845855))

(assert (= (and b!845855 res!574366) b!845858))

(assert (= (and b!845857 condMapEmpty!25388) mapIsEmpty!25388))

(assert (= (and b!845857 (not condMapEmpty!25388)) mapNonEmpty!25388))

(get-info :version)

(assert (= (and mapNonEmpty!25388 ((_ is ValueCellFull!7490) mapValue!25388)) b!845852))

(assert (= (and b!845857 ((_ is ValueCellFull!7490) mapDefault!25388)) b!845856))

(assert (= start!72976 b!845857))

(declare-fun m!788273 () Bool)

(assert (=> b!845853 m!788273))

(declare-fun m!788275 () Bool)

(assert (=> mapNonEmpty!25388 m!788275))

(declare-fun m!788277 () Bool)

(assert (=> b!845858 m!788277))

(declare-fun m!788279 () Bool)

(assert (=> b!845855 m!788279))

(declare-fun m!788281 () Bool)

(assert (=> start!72976 m!788281))

(declare-fun m!788283 () Bool)

(assert (=> start!72976 m!788283))

(check-sat (not mapNonEmpty!25388) (not start!72976) (not b!845855) (not b!845858) (not b!845853) tp_is_empty!15859)
(check-sat)
