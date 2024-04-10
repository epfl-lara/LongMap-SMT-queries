; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72838 () Bool)

(assert start!72838)

(declare-fun b_free!13753 () Bool)

(declare-fun b_next!13753 () Bool)

(assert (=> start!72838 (= b_free!13753 (not b_next!13753))))

(declare-fun tp!48762 () Bool)

(declare-fun b_and!22839 () Bool)

(assert (=> start!72838 (= tp!48762 b_and!22839)))

(declare-fun b!845308 () Bool)

(declare-fun e!471906 () Bool)

(declare-fun tp_is_empty!15889 () Bool)

(assert (=> b!845308 (= e!471906 tp_is_empty!15889)))

(declare-fun b!845309 () Bool)

(declare-fun res!574252 () Bool)

(declare-fun e!471907 () Bool)

(assert (=> b!845309 (=> (not res!574252) (not e!471907))))

(declare-datatypes ((array!47998 0))(
  ( (array!47999 (arr!23030 (Array (_ BitVec 32) (_ BitVec 64))) (size!23470 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47998)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47998 (_ BitVec 32)) Bool)

(assert (=> b!845309 (= res!574252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845310 () Bool)

(declare-fun res!574251 () Bool)

(assert (=> b!845310 (=> (not res!574251) (not e!471907))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845310 (= res!574251 (and (= (select (arr!23030 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845311 () Bool)

(declare-fun res!574247 () Bool)

(assert (=> b!845311 (=> (not res!574247) (not e!471907))))

(assert (=> b!845311 (= res!574247 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23470 _keys!868))))))

(declare-fun b!845312 () Bool)

(declare-fun res!574248 () Bool)

(assert (=> b!845312 (=> (not res!574248) (not e!471907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845312 (= res!574248 (validMask!0 mask!1196))))

(declare-fun b!845313 () Bool)

(declare-fun res!574246 () Bool)

(assert (=> b!845313 (=> (not res!574246) (not e!471907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845313 (= res!574246 (validKeyInArray!0 k!854))))

(declare-fun res!574249 () Bool)

(assert (=> start!72838 (=> (not res!574249) (not e!471907))))

(assert (=> start!72838 (= res!574249 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23470 _keys!868))))))

(assert (=> start!72838 e!471907))

(assert (=> start!72838 true))

(assert (=> start!72838 tp!48762))

(declare-fun array_inv!18302 (array!47998) Bool)

(assert (=> start!72838 (array_inv!18302 _keys!868)))

(declare-datatypes ((V!26233 0))(
  ( (V!26234 (val!7992 Int)) )
))
(declare-datatypes ((ValueCell!7505 0))(
  ( (ValueCellFull!7505 (v!10417 V!26233)) (EmptyCell!7505) )
))
(declare-datatypes ((array!48000 0))(
  ( (array!48001 (arr!23031 (Array (_ BitVec 32) ValueCell!7505)) (size!23471 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48000)

(declare-fun e!471905 () Bool)

(declare-fun array_inv!18303 (array!48000) Bool)

(assert (=> start!72838 (and (array_inv!18303 _values!688) e!471905)))

(assert (=> start!72838 tp_is_empty!15889))

(declare-fun b!845314 () Bool)

(declare-fun e!471904 () Bool)

(assert (=> b!845314 (= e!471904 tp_is_empty!15889)))

(declare-fun mapNonEmpty!25433 () Bool)

(declare-fun mapRes!25433 () Bool)

(declare-fun tp!48763 () Bool)

(assert (=> mapNonEmpty!25433 (= mapRes!25433 (and tp!48763 e!471904))))

(declare-fun mapValue!25433 () ValueCell!7505)

(declare-fun mapKey!25433 () (_ BitVec 32))

(declare-fun mapRest!25433 () (Array (_ BitVec 32) ValueCell!7505))

(assert (=> mapNonEmpty!25433 (= (arr!23031 _values!688) (store mapRest!25433 mapKey!25433 mapValue!25433))))

(declare-fun b!845315 () Bool)

(declare-fun res!574250 () Bool)

(assert (=> b!845315 (=> (not res!574250) (not e!471907))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845315 (= res!574250 (and (= (size!23471 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23470 _keys!868) (size!23471 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845316 () Bool)

(assert (=> b!845316 (= e!471905 (and e!471906 mapRes!25433))))

(declare-fun condMapEmpty!25433 () Bool)

(declare-fun mapDefault!25433 () ValueCell!7505)

