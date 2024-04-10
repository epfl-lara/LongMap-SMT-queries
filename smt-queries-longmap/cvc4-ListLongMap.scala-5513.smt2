; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72866 () Bool)

(assert start!72866)

(declare-fun b_free!13781 () Bool)

(declare-fun b_next!13781 () Bool)

(assert (=> start!72866 (= b_free!13781 (not b_next!13781))))

(declare-fun tp!48847 () Bool)

(declare-fun b_and!22867 () Bool)

(assert (=> start!72866 (= tp!48847 b_and!22867)))

(declare-fun b!845770 () Bool)

(declare-fun e!472114 () Bool)

(declare-fun tp_is_empty!15917 () Bool)

(assert (=> b!845770 (= e!472114 tp_is_empty!15917)))

(declare-fun b!845771 () Bool)

(declare-fun res!574584 () Bool)

(declare-fun e!472116 () Bool)

(assert (=> b!845771 (=> (not res!574584) (not e!472116))))

(declare-datatypes ((array!48052 0))(
  ( (array!48053 (arr!23057 (Array (_ BitVec 32) (_ BitVec 64))) (size!23497 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48052)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48052 (_ BitVec 32)) Bool)

(assert (=> b!845771 (= res!574584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845772 () Bool)

(declare-fun res!574587 () Bool)

(assert (=> b!845772 (=> (not res!574587) (not e!472116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845772 (= res!574587 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25475 () Bool)

(declare-fun mapRes!25475 () Bool)

(declare-fun tp!48846 () Bool)

(declare-fun e!472115 () Bool)

(assert (=> mapNonEmpty!25475 (= mapRes!25475 (and tp!48846 e!472115))))

(declare-datatypes ((V!26269 0))(
  ( (V!26270 (val!8006 Int)) )
))
(declare-datatypes ((ValueCell!7519 0))(
  ( (ValueCellFull!7519 (v!10431 V!26269)) (EmptyCell!7519) )
))
(declare-fun mapRest!25475 () (Array (_ BitVec 32) ValueCell!7519))

(declare-fun mapKey!25475 () (_ BitVec 32))

(declare-fun mapValue!25475 () ValueCell!7519)

(declare-datatypes ((array!48054 0))(
  ( (array!48055 (arr!23058 (Array (_ BitVec 32) ValueCell!7519)) (size!23498 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48054)

(assert (=> mapNonEmpty!25475 (= (arr!23058 _values!688) (store mapRest!25475 mapKey!25475 mapValue!25475))))

(declare-fun b!845773 () Bool)

(declare-fun res!574582 () Bool)

(assert (=> b!845773 (=> (not res!574582) (not e!472116))))

(declare-datatypes ((List!16318 0))(
  ( (Nil!16315) (Cons!16314 (h!17445 (_ BitVec 64)) (t!22689 List!16318)) )
))
(declare-fun arrayNoDuplicates!0 (array!48052 (_ BitVec 32) List!16318) Bool)

(assert (=> b!845773 (= res!574582 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16315))))

(declare-fun b!845774 () Bool)

(declare-fun res!574586 () Bool)

(assert (=> b!845774 (=> (not res!574586) (not e!472116))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845774 (= res!574586 (validKeyInArray!0 k!854))))

(declare-fun res!574585 () Bool)

(assert (=> start!72866 (=> (not res!574585) (not e!472116))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72866 (= res!574585 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23497 _keys!868))))))

(assert (=> start!72866 e!472116))

(assert (=> start!72866 true))

(assert (=> start!72866 tp!48847))

(declare-fun array_inv!18322 (array!48052) Bool)

(assert (=> start!72866 (array_inv!18322 _keys!868)))

(declare-fun e!472117 () Bool)

(declare-fun array_inv!18323 (array!48054) Bool)

(assert (=> start!72866 (and (array_inv!18323 _values!688) e!472117)))

(assert (=> start!72866 tp_is_empty!15917))

(declare-fun b!845775 () Bool)

(assert (=> b!845775 (= e!472116 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10456 0))(
  ( (tuple2!10457 (_1!5239 (_ BitVec 64)) (_2!5239 V!26269)) )
))
(declare-datatypes ((List!16319 0))(
  ( (Nil!16316) (Cons!16315 (h!17446 tuple2!10456) (t!22690 List!16319)) )
))
(declare-datatypes ((ListLongMap!9225 0))(
  ( (ListLongMap!9226 (toList!4628 List!16319)) )
))
(declare-fun lt!381442 () ListLongMap!9225)

(declare-fun minValue!654 () V!26269)

(declare-fun zeroValue!654 () V!26269)

(declare-fun getCurrentListMapNoExtraKeys!2613 (array!48052 array!48054 (_ BitVec 32) (_ BitVec 32) V!26269 V!26269 (_ BitVec 32) Int) ListLongMap!9225)

(assert (=> b!845775 (= lt!381442 (getCurrentListMapNoExtraKeys!2613 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845776 () Bool)

(declare-fun res!574588 () Bool)

(assert (=> b!845776 (=> (not res!574588) (not e!472116))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845776 (= res!574588 (and (= (select (arr!23057 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845777 () Bool)

(declare-fun res!574583 () Bool)

(assert (=> b!845777 (=> (not res!574583) (not e!472116))))

(assert (=> b!845777 (= res!574583 (and (= (size!23498 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23497 _keys!868) (size!23498 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845778 () Bool)

(declare-fun res!574589 () Bool)

(assert (=> b!845778 (=> (not res!574589) (not e!472116))))

(assert (=> b!845778 (= res!574589 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23497 _keys!868))))))

(declare-fun mapIsEmpty!25475 () Bool)

(assert (=> mapIsEmpty!25475 mapRes!25475))

(declare-fun b!845779 () Bool)

(assert (=> b!845779 (= e!472115 tp_is_empty!15917)))

(declare-fun b!845780 () Bool)

(assert (=> b!845780 (= e!472117 (and e!472114 mapRes!25475))))

(declare-fun condMapEmpty!25475 () Bool)

(declare-fun mapDefault!25475 () ValueCell!7519)

