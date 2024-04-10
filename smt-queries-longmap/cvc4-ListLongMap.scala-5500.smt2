; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72788 () Bool)

(assert start!72788)

(declare-fun b!844739 () Bool)

(declare-fun res!573902 () Bool)

(declare-fun e!471530 () Bool)

(assert (=> b!844739 (=> (not res!573902) (not e!471530))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844739 (= res!573902 (validMask!0 mask!1196))))

(declare-fun b!844740 () Bool)

(declare-fun e!471529 () Bool)

(declare-fun tp_is_empty!15839 () Bool)

(assert (=> b!844740 (= e!471529 tp_is_empty!15839)))

(declare-fun b!844741 () Bool)

(declare-fun res!573903 () Bool)

(assert (=> b!844741 (=> (not res!573903) (not e!471530))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47904 0))(
  ( (array!47905 (arr!22983 (Array (_ BitVec 32) (_ BitVec 64))) (size!23423 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47904)

(declare-datatypes ((V!26165 0))(
  ( (V!26166 (val!7967 Int)) )
))
(declare-datatypes ((ValueCell!7480 0))(
  ( (ValueCellFull!7480 (v!10392 V!26165)) (EmptyCell!7480) )
))
(declare-datatypes ((array!47906 0))(
  ( (array!47907 (arr!22984 (Array (_ BitVec 32) ValueCell!7480)) (size!23424 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47906)

(assert (=> b!844741 (= res!573903 (and (= (size!23424 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23423 _keys!868) (size!23424 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844742 () Bool)

(declare-fun res!573905 () Bool)

(assert (=> b!844742 (=> (not res!573905) (not e!471530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47904 (_ BitVec 32)) Bool)

(assert (=> b!844742 (= res!573905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844743 () Bool)

(declare-fun e!471528 () Bool)

(assert (=> b!844743 (= e!471528 tp_is_empty!15839)))

(declare-fun res!573904 () Bool)

(assert (=> start!72788 (=> (not res!573904) (not e!471530))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72788 (= res!573904 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23423 _keys!868))))))

(assert (=> start!72788 e!471530))

(assert (=> start!72788 true))

(declare-fun array_inv!18272 (array!47904) Bool)

(assert (=> start!72788 (array_inv!18272 _keys!868)))

(declare-fun e!471532 () Bool)

(declare-fun array_inv!18273 (array!47906) Bool)

(assert (=> start!72788 (and (array_inv!18273 _values!688) e!471532)))

(declare-fun b!844744 () Bool)

(assert (=> b!844744 (= e!471530 false)))

(declare-fun lt!381325 () Bool)

(declare-datatypes ((List!16282 0))(
  ( (Nil!16279) (Cons!16278 (h!17409 (_ BitVec 64)) (t!22653 List!16282)) )
))
(declare-fun arrayNoDuplicates!0 (array!47904 (_ BitVec 32) List!16282) Bool)

(assert (=> b!844744 (= lt!381325 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16279))))

(declare-fun mapNonEmpty!25358 () Bool)

(declare-fun mapRes!25358 () Bool)

(declare-fun tp!48676 () Bool)

(assert (=> mapNonEmpty!25358 (= mapRes!25358 (and tp!48676 e!471528))))

(declare-fun mapKey!25358 () (_ BitVec 32))

(declare-fun mapRest!25358 () (Array (_ BitVec 32) ValueCell!7480))

(declare-fun mapValue!25358 () ValueCell!7480)

(assert (=> mapNonEmpty!25358 (= (arr!22984 _values!688) (store mapRest!25358 mapKey!25358 mapValue!25358))))

(declare-fun b!844745 () Bool)

(assert (=> b!844745 (= e!471532 (and e!471529 mapRes!25358))))

(declare-fun condMapEmpty!25358 () Bool)

(declare-fun mapDefault!25358 () ValueCell!7480)

