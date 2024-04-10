; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39742 () Bool)

(assert start!39742)

(declare-fun b_free!10009 () Bool)

(declare-fun b_next!10009 () Bool)

(assert (=> start!39742 (= b_free!10009 (not b_next!10009))))

(declare-fun tp!35555 () Bool)

(declare-fun b_and!17677 () Bool)

(assert (=> start!39742 (= tp!35555 b_and!17677)))

(declare-fun b!427672 () Bool)

(declare-fun res!250896 () Bool)

(declare-fun e!253554 () Bool)

(assert (=> b!427672 (=> (not res!250896) (not e!253554))))

(declare-datatypes ((array!26159 0))(
  ( (array!26160 (arr!12529 (Array (_ BitVec 32) (_ BitVec 64))) (size!12881 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26159)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15987 0))(
  ( (V!15988 (val!5625 Int)) )
))
(declare-datatypes ((ValueCell!5237 0))(
  ( (ValueCellFull!5237 (v!7872 V!15987)) (EmptyCell!5237) )
))
(declare-datatypes ((array!26161 0))(
  ( (array!26162 (arr!12530 (Array (_ BitVec 32) ValueCell!5237)) (size!12882 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26161)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!427672 (= res!250896 (and (= (size!12882 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12881 _keys!709) (size!12882 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18363 () Bool)

(declare-fun mapRes!18363 () Bool)

(declare-fun tp!35556 () Bool)

(declare-fun e!253553 () Bool)

(assert (=> mapNonEmpty!18363 (= mapRes!18363 (and tp!35556 e!253553))))

(declare-fun mapValue!18363 () ValueCell!5237)

(declare-fun mapRest!18363 () (Array (_ BitVec 32) ValueCell!5237))

(declare-fun mapKey!18363 () (_ BitVec 32))

(assert (=> mapNonEmpty!18363 (= (arr!12530 _values!549) (store mapRest!18363 mapKey!18363 mapValue!18363))))

(declare-fun mapIsEmpty!18363 () Bool)

(assert (=> mapIsEmpty!18363 mapRes!18363))

(declare-fun b!427673 () Bool)

(declare-fun e!253557 () Bool)

(declare-fun e!253551 () Bool)

(assert (=> b!427673 (= e!253557 (not e!253551))))

(declare-fun res!250905 () Bool)

(assert (=> b!427673 (=> res!250905 e!253551)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427673 (= res!250905 (not (validKeyInArray!0 (select (arr!12529 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7396 0))(
  ( (tuple2!7397 (_1!3709 (_ BitVec 64)) (_2!3709 V!15987)) )
))
(declare-datatypes ((List!7409 0))(
  ( (Nil!7406) (Cons!7405 (h!8261 tuple2!7396) (t!12867 List!7409)) )
))
(declare-datatypes ((ListLongMap!6309 0))(
  ( (ListLongMap!6310 (toList!3170 List!7409)) )
))
(declare-fun lt!195395 () ListLongMap!6309)

(declare-fun lt!195400 () ListLongMap!6309)

(assert (=> b!427673 (= lt!195395 lt!195400)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15987)

(declare-fun lt!195397 () ListLongMap!6309)

(declare-fun +!1325 (ListLongMap!6309 tuple2!7396) ListLongMap!6309)

(assert (=> b!427673 (= lt!195400 (+!1325 lt!195397 (tuple2!7397 k!794 v!412)))))

(declare-fun minValue!515 () V!15987)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15987)

(declare-fun lt!195396 () array!26161)

(declare-fun lt!195401 () array!26159)

(declare-fun getCurrentListMapNoExtraKeys!1372 (array!26159 array!26161 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) Int) ListLongMap!6309)

(assert (=> b!427673 (= lt!195395 (getCurrentListMapNoExtraKeys!1372 lt!195401 lt!195396 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427673 (= lt!195397 (getCurrentListMapNoExtraKeys!1372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12548 0))(
  ( (Unit!12549) )
))
(declare-fun lt!195398 () Unit!12548)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!518 (array!26159 array!26161 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) (_ BitVec 64) V!15987 (_ BitVec 32) Int) Unit!12548)

(assert (=> b!427673 (= lt!195398 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427674 () Bool)

(declare-fun res!250897 () Bool)

(declare-fun e!253552 () Bool)

(assert (=> b!427674 (=> (not res!250897) (not e!253552))))

(declare-datatypes ((List!7410 0))(
  ( (Nil!7407) (Cons!7406 (h!8262 (_ BitVec 64)) (t!12868 List!7410)) )
))
(declare-fun arrayNoDuplicates!0 (array!26159 (_ BitVec 32) List!7410) Bool)

(assert (=> b!427674 (= res!250897 (arrayNoDuplicates!0 lt!195401 #b00000000000000000000000000000000 Nil!7407))))

(declare-fun b!427675 () Bool)

(declare-fun res!250902 () Bool)

(assert (=> b!427675 (=> (not res!250902) (not e!253554))))

(assert (=> b!427675 (= res!250902 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12881 _keys!709))))))

(declare-fun b!427676 () Bool)

(assert (=> b!427676 (= e!253551 true)))

(declare-fun lt!195394 () ListLongMap!6309)

(declare-fun get!6204 (ValueCell!5237 V!15987) V!15987)

(declare-fun dynLambda!753 (Int (_ BitVec 64)) V!15987)

(assert (=> b!427676 (= lt!195394 (+!1325 lt!195400 (tuple2!7397 (select (arr!12529 _keys!709) from!863) (get!6204 (select (arr!12530 _values!549) from!863) (dynLambda!753 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427677 () Bool)

(declare-fun res!250906 () Bool)

(assert (=> b!427677 (=> (not res!250906) (not e!253554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26159 (_ BitVec 32)) Bool)

(assert (=> b!427677 (= res!250906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427678 () Bool)

(declare-fun res!250903 () Bool)

(assert (=> b!427678 (=> (not res!250903) (not e!253552))))

(assert (=> b!427678 (= res!250903 (bvsle from!863 i!563))))

(declare-fun b!427679 () Bool)

(declare-fun res!250907 () Bool)

(assert (=> b!427679 (=> (not res!250907) (not e!253554))))

(assert (=> b!427679 (= res!250907 (validKeyInArray!0 k!794))))

(declare-fun b!427681 () Bool)

(declare-fun res!250895 () Bool)

(assert (=> b!427681 (=> (not res!250895) (not e!253554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427681 (= res!250895 (validMask!0 mask!1025))))

(declare-fun b!427682 () Bool)

(declare-fun res!250899 () Bool)

(assert (=> b!427682 (=> (not res!250899) (not e!253554))))

(assert (=> b!427682 (= res!250899 (or (= (select (arr!12529 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12529 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427683 () Bool)

(declare-fun res!250900 () Bool)

(assert (=> b!427683 (=> (not res!250900) (not e!253554))))

(declare-fun arrayContainsKey!0 (array!26159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427683 (= res!250900 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427684 () Bool)

(assert (=> b!427684 (= e!253554 e!253552)))

(declare-fun res!250908 () Bool)

(assert (=> b!427684 (=> (not res!250908) (not e!253552))))

(assert (=> b!427684 (= res!250908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195401 mask!1025))))

(assert (=> b!427684 (= lt!195401 (array!26160 (store (arr!12529 _keys!709) i!563 k!794) (size!12881 _keys!709)))))

(declare-fun b!427685 () Bool)

(declare-fun tp_is_empty!11161 () Bool)

(assert (=> b!427685 (= e!253553 tp_is_empty!11161)))

(declare-fun b!427686 () Bool)

(assert (=> b!427686 (= e!253552 e!253557)))

(declare-fun res!250901 () Bool)

(assert (=> b!427686 (=> (not res!250901) (not e!253557))))

(assert (=> b!427686 (= res!250901 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!427686 (= lt!195394 (getCurrentListMapNoExtraKeys!1372 lt!195401 lt!195396 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427686 (= lt!195396 (array!26162 (store (arr!12530 _values!549) i!563 (ValueCellFull!5237 v!412)) (size!12882 _values!549)))))

(declare-fun lt!195399 () ListLongMap!6309)

(assert (=> b!427686 (= lt!195399 (getCurrentListMapNoExtraKeys!1372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427680 () Bool)

(declare-fun res!250898 () Bool)

(assert (=> b!427680 (=> (not res!250898) (not e!253554))))

(assert (=> b!427680 (= res!250898 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7407))))

(declare-fun res!250904 () Bool)

(assert (=> start!39742 (=> (not res!250904) (not e!253554))))

(assert (=> start!39742 (= res!250904 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12881 _keys!709))))))

(assert (=> start!39742 e!253554))

(assert (=> start!39742 tp_is_empty!11161))

(assert (=> start!39742 tp!35555))

(assert (=> start!39742 true))

(declare-fun e!253550 () Bool)

(declare-fun array_inv!9132 (array!26161) Bool)

(assert (=> start!39742 (and (array_inv!9132 _values!549) e!253550)))

(declare-fun array_inv!9133 (array!26159) Bool)

(assert (=> start!39742 (array_inv!9133 _keys!709)))

(declare-fun b!427687 () Bool)

(declare-fun e!253555 () Bool)

(assert (=> b!427687 (= e!253550 (and e!253555 mapRes!18363))))

(declare-fun condMapEmpty!18363 () Bool)

(declare-fun mapDefault!18363 () ValueCell!5237)

