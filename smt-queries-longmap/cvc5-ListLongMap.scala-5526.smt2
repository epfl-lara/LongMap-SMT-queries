; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72940 () Bool)

(assert start!72940)

(declare-fun b_free!13855 () Bool)

(declare-fun b_next!13855 () Bool)

(assert (=> start!72940 (= b_free!13855 (not b_next!13855))))

(declare-fun tp!49069 () Bool)

(declare-fun b_and!22941 () Bool)

(assert (=> start!72940 (= tp!49069 b_and!22941)))

(declare-fun b!846992 () Bool)

(declare-fun res!575471 () Bool)

(declare-fun e!472672 () Bool)

(assert (=> b!846992 (=> (not res!575471) (not e!472672))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846992 (= res!575471 (validKeyInArray!0 k!854))))

(declare-fun b!846993 () Bool)

(declare-fun res!575472 () Bool)

(assert (=> b!846993 (=> (not res!575472) (not e!472672))))

(declare-datatypes ((array!48194 0))(
  ( (array!48195 (arr!23128 (Array (_ BitVec 32) (_ BitVec 64))) (size!23568 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48194)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48194 (_ BitVec 32)) Bool)

(assert (=> b!846993 (= res!575472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25586 () Bool)

(declare-fun mapRes!25586 () Bool)

(assert (=> mapIsEmpty!25586 mapRes!25586))

(declare-fun b!846994 () Bool)

(declare-fun res!575476 () Bool)

(assert (=> b!846994 (=> (not res!575476) (not e!472672))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26369 0))(
  ( (V!26370 (val!8043 Int)) )
))
(declare-datatypes ((ValueCell!7556 0))(
  ( (ValueCellFull!7556 (v!10468 V!26369)) (EmptyCell!7556) )
))
(declare-datatypes ((array!48196 0))(
  ( (array!48197 (arr!23129 (Array (_ BitVec 32) ValueCell!7556)) (size!23569 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48196)

(assert (=> b!846994 (= res!575476 (and (= (size!23569 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23568 _keys!868) (size!23569 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846995 () Bool)

(assert (=> b!846995 (= e!472672 false)))

(declare-datatypes ((tuple2!10502 0))(
  ( (tuple2!10503 (_1!5262 (_ BitVec 64)) (_2!5262 V!26369)) )
))
(declare-datatypes ((List!16364 0))(
  ( (Nil!16361) (Cons!16360 (h!17491 tuple2!10502) (t!22735 List!16364)) )
))
(declare-datatypes ((ListLongMap!9271 0))(
  ( (ListLongMap!9272 (toList!4651 List!16364)) )
))
(declare-fun lt!381636 () ListLongMap!9271)

(declare-fun v!557 () V!26369)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26369)

(declare-fun zeroValue!654 () V!26369)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2636 (array!48194 array!48196 (_ BitVec 32) (_ BitVec 32) V!26369 V!26369 (_ BitVec 32) Int) ListLongMap!9271)

(assert (=> b!846995 (= lt!381636 (getCurrentListMapNoExtraKeys!2636 _keys!868 (array!48197 (store (arr!23129 _values!688) i!612 (ValueCellFull!7556 v!557)) (size!23569 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381637 () ListLongMap!9271)

(assert (=> b!846995 (= lt!381637 (getCurrentListMapNoExtraKeys!2636 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846996 () Bool)

(declare-fun res!575474 () Bool)

(assert (=> b!846996 (=> (not res!575474) (not e!472672))))

(assert (=> b!846996 (= res!575474 (and (= (select (arr!23128 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846991 () Bool)

(declare-fun res!575477 () Bool)

(assert (=> b!846991 (=> (not res!575477) (not e!472672))))

(assert (=> b!846991 (= res!575477 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23568 _keys!868))))))

(declare-fun res!575475 () Bool)

(assert (=> start!72940 (=> (not res!575475) (not e!472672))))

(assert (=> start!72940 (= res!575475 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23568 _keys!868))))))

(assert (=> start!72940 e!472672))

(declare-fun tp_is_empty!15991 () Bool)

(assert (=> start!72940 tp_is_empty!15991))

(assert (=> start!72940 true))

(assert (=> start!72940 tp!49069))

(declare-fun array_inv!18368 (array!48194) Bool)

(assert (=> start!72940 (array_inv!18368 _keys!868)))

(declare-fun e!472668 () Bool)

(declare-fun array_inv!18369 (array!48196) Bool)

(assert (=> start!72940 (and (array_inv!18369 _values!688) e!472668)))

(declare-fun b!846997 () Bool)

(declare-fun res!575470 () Bool)

(assert (=> b!846997 (=> (not res!575470) (not e!472672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846997 (= res!575470 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25586 () Bool)

(declare-fun tp!49068 () Bool)

(declare-fun e!472670 () Bool)

(assert (=> mapNonEmpty!25586 (= mapRes!25586 (and tp!49068 e!472670))))

(declare-fun mapValue!25586 () ValueCell!7556)

(declare-fun mapRest!25586 () (Array (_ BitVec 32) ValueCell!7556))

(declare-fun mapKey!25586 () (_ BitVec 32))

(assert (=> mapNonEmpty!25586 (= (arr!23129 _values!688) (store mapRest!25586 mapKey!25586 mapValue!25586))))

(declare-fun b!846998 () Bool)

(declare-fun e!472669 () Bool)

(assert (=> b!846998 (= e!472669 tp_is_empty!15991)))

(declare-fun b!846999 () Bool)

(assert (=> b!846999 (= e!472668 (and e!472669 mapRes!25586))))

(declare-fun condMapEmpty!25586 () Bool)

(declare-fun mapDefault!25586 () ValueCell!7556)

