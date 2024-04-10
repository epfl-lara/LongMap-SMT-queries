; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72826 () Bool)

(assert start!72826)

(declare-fun b!845138 () Bool)

(declare-fun res!574131 () Bool)

(declare-fun e!471815 () Bool)

(assert (=> b!845138 (=> (not res!574131) (not e!471815))))

(declare-datatypes ((array!47974 0))(
  ( (array!47975 (arr!23018 (Array (_ BitVec 32) (_ BitVec 64))) (size!23458 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47974)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47974 (_ BitVec 32)) Bool)

(assert (=> b!845138 (= res!574131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845139 () Bool)

(assert (=> b!845139 (= e!471815 false)))

(declare-fun lt!381382 () Bool)

(declare-datatypes ((List!16294 0))(
  ( (Nil!16291) (Cons!16290 (h!17421 (_ BitVec 64)) (t!22665 List!16294)) )
))
(declare-fun arrayNoDuplicates!0 (array!47974 (_ BitVec 32) List!16294) Bool)

(assert (=> b!845139 (= lt!381382 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16291))))

(declare-fun b!845140 () Bool)

(declare-fun res!574133 () Bool)

(assert (=> b!845140 (=> (not res!574133) (not e!471815))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26217 0))(
  ( (V!26218 (val!7986 Int)) )
))
(declare-datatypes ((ValueCell!7499 0))(
  ( (ValueCellFull!7499 (v!10411 V!26217)) (EmptyCell!7499) )
))
(declare-datatypes ((array!47976 0))(
  ( (array!47977 (arr!23019 (Array (_ BitVec 32) ValueCell!7499)) (size!23459 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47976)

(assert (=> b!845140 (= res!574133 (and (= (size!23459 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23458 _keys!868) (size!23459 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25415 () Bool)

(declare-fun mapRes!25415 () Bool)

(assert (=> mapIsEmpty!25415 mapRes!25415))

(declare-fun b!845141 () Bool)

(declare-fun e!471817 () Bool)

(declare-fun tp_is_empty!15877 () Bool)

(assert (=> b!845141 (= e!471817 tp_is_empty!15877)))

(declare-fun res!574132 () Bool)

(assert (=> start!72826 (=> (not res!574132) (not e!471815))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72826 (= res!574132 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23458 _keys!868))))))

(assert (=> start!72826 e!471815))

(assert (=> start!72826 true))

(declare-fun array_inv!18294 (array!47974) Bool)

(assert (=> start!72826 (array_inv!18294 _keys!868)))

(declare-fun e!471816 () Bool)

(declare-fun array_inv!18295 (array!47976) Bool)

(assert (=> start!72826 (and (array_inv!18295 _values!688) e!471816)))

(declare-fun b!845142 () Bool)

(declare-fun e!471814 () Bool)

(assert (=> b!845142 (= e!471814 tp_is_empty!15877)))

(declare-fun mapNonEmpty!25415 () Bool)

(declare-fun tp!48733 () Bool)

(assert (=> mapNonEmpty!25415 (= mapRes!25415 (and tp!48733 e!471817))))

(declare-fun mapKey!25415 () (_ BitVec 32))

(declare-fun mapValue!25415 () ValueCell!7499)

(declare-fun mapRest!25415 () (Array (_ BitVec 32) ValueCell!7499))

(assert (=> mapNonEmpty!25415 (= (arr!23019 _values!688) (store mapRest!25415 mapKey!25415 mapValue!25415))))

(declare-fun b!845143 () Bool)

(declare-fun res!574130 () Bool)

(assert (=> b!845143 (=> (not res!574130) (not e!471815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845143 (= res!574130 (validMask!0 mask!1196))))

(declare-fun b!845144 () Bool)

(assert (=> b!845144 (= e!471816 (and e!471814 mapRes!25415))))

(declare-fun condMapEmpty!25415 () Bool)

(declare-fun mapDefault!25415 () ValueCell!7499)

