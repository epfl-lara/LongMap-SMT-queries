; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73504 () Bool)

(assert start!73504)

(declare-fun b_free!14419 () Bool)

(declare-fun b_next!14419 () Bool)

(assert (=> start!73504 (= b_free!14419 (not b_next!14419))))

(declare-fun tp!50761 () Bool)

(declare-fun b_and!23817 () Bool)

(assert (=> start!73504 (= tp!50761 b_and!23817)))

(declare-fun b!858802 () Bool)

(declare-fun res!583463 () Bool)

(declare-fun e!478607 () Bool)

(assert (=> b!858802 (=> (not res!583463) (not e!478607))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49294 0))(
  ( (array!49295 (arr!23678 (Array (_ BitVec 32) (_ BitVec 64))) (size!24118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49294)

(assert (=> b!858802 (= res!583463 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24118 _keys!868))))))

(declare-fun b!858804 () Bool)

(declare-fun e!478606 () Bool)

(assert (=> b!858804 (= e!478606 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16800 0))(
  ( (Nil!16797) (Cons!16796 (h!17927 (_ BitVec 64)) (t!23485 List!16800)) )
))
(declare-fun arrayNoDuplicates!0 (array!49294 (_ BitVec 32) List!16800) Bool)

(assert (=> b!858804 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16797)))

(declare-datatypes ((Unit!29281 0))(
  ( (Unit!29282) )
))
(declare-fun lt!386917 () Unit!29281)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49294 (_ BitVec 32) (_ BitVec 32)) Unit!29281)

(assert (=> b!858804 (= lt!386917 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858805 () Bool)

(declare-fun e!478608 () Bool)

(declare-fun tp_is_empty!16555 () Bool)

(assert (=> b!858805 (= e!478608 tp_is_empty!16555)))

(declare-fun b!858806 () Bool)

(declare-fun res!583469 () Bool)

(assert (=> b!858806 (=> (not res!583469) (not e!478607))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49294 (_ BitVec 32)) Bool)

(assert (=> b!858806 (= res!583469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858807 () Bool)

(declare-fun e!478610 () Bool)

(assert (=> b!858807 (= e!478610 tp_is_empty!16555)))

(declare-fun b!858808 () Bool)

(declare-fun res!583464 () Bool)

(assert (=> b!858808 (=> (not res!583464) (not e!478607))))

(assert (=> b!858808 (= res!583464 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16797))))

(declare-fun b!858809 () Bool)

(declare-fun res!583465 () Bool)

(assert (=> b!858809 (=> (not res!583465) (not e!478607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858809 (= res!583465 (validMask!0 mask!1196))))

(declare-fun b!858810 () Bool)

(declare-fun res!583461 () Bool)

(assert (=> b!858810 (=> (not res!583461) (not e!478607))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!858810 (= res!583461 (and (= (select (arr!23678 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26432 () Bool)

(declare-fun mapRes!26432 () Bool)

(assert (=> mapIsEmpty!26432 mapRes!26432))

(declare-fun b!858811 () Bool)

(declare-fun res!583459 () Bool)

(assert (=> b!858811 (=> (not res!583459) (not e!478607))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27121 0))(
  ( (V!27122 (val!8325 Int)) )
))
(declare-datatypes ((ValueCell!7838 0))(
  ( (ValueCellFull!7838 (v!10750 V!27121)) (EmptyCell!7838) )
))
(declare-datatypes ((array!49296 0))(
  ( (array!49297 (arr!23679 (Array (_ BitVec 32) ValueCell!7838)) (size!24119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49296)

(assert (=> b!858811 (= res!583459 (and (= (size!24119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24118 _keys!868) (size!24119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858812 () Bool)

(declare-fun e!478612 () Bool)

(assert (=> b!858812 (= e!478612 (and e!478610 mapRes!26432))))

(declare-fun condMapEmpty!26432 () Bool)

(declare-fun mapDefault!26432 () ValueCell!7838)

