; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41244 () Bool)

(assert start!41244)

(declare-fun b_free!11087 () Bool)

(declare-fun b_next!11087 () Bool)

(assert (=> start!41244 (= b_free!11087 (not b_next!11087))))

(declare-fun tp!39100 () Bool)

(declare-fun b_and!19407 () Bool)

(assert (=> start!41244 (= tp!39100 b_and!19407)))

(declare-fun b!461485 () Bool)

(declare-fun res!276057 () Bool)

(declare-fun e!269133 () Bool)

(assert (=> b!461485 (=> (not res!276057) (not e!269133))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461485 (= res!276057 (bvsle from!863 i!563))))

(declare-fun b!461486 () Bool)

(declare-fun res!276054 () Bool)

(declare-fun e!269132 () Bool)

(assert (=> b!461486 (=> (not res!276054) (not e!269132))))

(declare-datatypes ((array!28649 0))(
  ( (array!28650 (arr!13764 (Array (_ BitVec 32) (_ BitVec 64))) (size!14116 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28649)

(assert (=> b!461486 (= res!276054 (or (= (select (arr!13764 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13764 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!276056 () Bool)

(assert (=> start!41244 (=> (not res!276056) (not e!269132))))

(assert (=> start!41244 (= res!276056 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14116 _keys!709))))))

(assert (=> start!41244 e!269132))

(declare-fun tp_is_empty!12425 () Bool)

(assert (=> start!41244 tp_is_empty!12425))

(assert (=> start!41244 tp!39100))

(assert (=> start!41244 true))

(declare-datatypes ((V!17671 0))(
  ( (V!17672 (val!6257 Int)) )
))
(declare-datatypes ((ValueCell!5869 0))(
  ( (ValueCellFull!5869 (v!8539 V!17671)) (EmptyCell!5869) )
))
(declare-datatypes ((array!28651 0))(
  ( (array!28652 (arr!13765 (Array (_ BitVec 32) ValueCell!5869)) (size!14117 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28651)

(declare-fun e!269136 () Bool)

(declare-fun array_inv!9958 (array!28651) Bool)

(assert (=> start!41244 (and (array_inv!9958 _values!549) e!269136)))

(declare-fun array_inv!9959 (array!28649) Bool)

(assert (=> start!41244 (array_inv!9959 _keys!709)))

(declare-fun b!461487 () Bool)

(declare-fun e!269134 () Bool)

(assert (=> b!461487 (= e!269134 tp_is_empty!12425)))

(declare-fun b!461488 () Bool)

(declare-fun res!276053 () Bool)

(assert (=> b!461488 (=> (not res!276053) (not e!269132))))

(assert (=> b!461488 (= res!276053 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _keys!709))))))

(declare-fun b!461489 () Bool)

(declare-fun e!269137 () Bool)

(assert (=> b!461489 (= e!269137 tp_is_empty!12425)))

(declare-fun b!461490 () Bool)

(assert (=> b!461490 (= e!269132 e!269133)))

(declare-fun res!276058 () Bool)

(assert (=> b!461490 (=> (not res!276058) (not e!269133))))

(declare-fun lt!209005 () array!28649)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28649 (_ BitVec 32)) Bool)

(assert (=> b!461490 (= res!276058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!209005 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!461490 (= lt!209005 (array!28650 (store (arr!13764 _keys!709) i!563 k!794) (size!14116 _keys!709)))))

(declare-fun b!461491 () Bool)

(declare-fun res!276055 () Bool)

(assert (=> b!461491 (=> (not res!276055) (not e!269132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461491 (= res!276055 (validKeyInArray!0 k!794))))

(declare-fun b!461492 () Bool)

(declare-fun e!269135 () Bool)

(assert (=> b!461492 (= e!269133 e!269135)))

(declare-fun res!276064 () Bool)

(assert (=> b!461492 (=> (not res!276064) (not e!269135))))

(assert (=> b!461492 (= res!276064 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17671)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17671)

(declare-fun lt!209003 () array!28651)

(declare-datatypes ((tuple2!8256 0))(
  ( (tuple2!8257 (_1!4139 (_ BitVec 64)) (_2!4139 V!17671)) )
))
(declare-datatypes ((List!8328 0))(
  ( (Nil!8325) (Cons!8324 (h!9180 tuple2!8256) (t!14270 List!8328)) )
))
(declare-datatypes ((ListLongMap!7169 0))(
  ( (ListLongMap!7170 (toList!3600 List!8328)) )
))
(declare-fun lt!209007 () ListLongMap!7169)

(declare-fun getCurrentListMapNoExtraKeys!1780 (array!28649 array!28651 (_ BitVec 32) (_ BitVec 32) V!17671 V!17671 (_ BitVec 32) Int) ListLongMap!7169)

(assert (=> b!461492 (= lt!209007 (getCurrentListMapNoExtraKeys!1780 lt!209005 lt!209003 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17671)

(assert (=> b!461492 (= lt!209003 (array!28652 (store (arr!13765 _values!549) i!563 (ValueCellFull!5869 v!412)) (size!14117 _values!549)))))

(declare-fun lt!209006 () ListLongMap!7169)

(assert (=> b!461492 (= lt!209006 (getCurrentListMapNoExtraKeys!1780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461493 () Bool)

(declare-fun res!276060 () Bool)

(assert (=> b!461493 (=> (not res!276060) (not e!269132))))

(assert (=> b!461493 (= res!276060 (and (= (size!14117 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14116 _keys!709) (size!14117 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461494 () Bool)

(declare-fun res!276063 () Bool)

(assert (=> b!461494 (=> (not res!276063) (not e!269132))))

(assert (=> b!461494 (= res!276063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20290 () Bool)

(declare-fun mapRes!20290 () Bool)

(declare-fun tp!39099 () Bool)

(assert (=> mapNonEmpty!20290 (= mapRes!20290 (and tp!39099 e!269137))))

(declare-fun mapValue!20290 () ValueCell!5869)

(declare-fun mapKey!20290 () (_ BitVec 32))

(declare-fun mapRest!20290 () (Array (_ BitVec 32) ValueCell!5869))

(assert (=> mapNonEmpty!20290 (= (arr!13765 _values!549) (store mapRest!20290 mapKey!20290 mapValue!20290))))

(declare-fun b!461495 () Bool)

(declare-fun res!276065 () Bool)

(assert (=> b!461495 (=> (not res!276065) (not e!269133))))

(declare-datatypes ((List!8329 0))(
  ( (Nil!8326) (Cons!8325 (h!9181 (_ BitVec 64)) (t!14271 List!8329)) )
))
(declare-fun arrayNoDuplicates!0 (array!28649 (_ BitVec 32) List!8329) Bool)

(assert (=> b!461495 (= res!276065 (arrayNoDuplicates!0 lt!209005 #b00000000000000000000000000000000 Nil!8326))))

(declare-fun b!461496 () Bool)

(declare-fun res!276059 () Bool)

(assert (=> b!461496 (=> (not res!276059) (not e!269132))))

(declare-fun arrayContainsKey!0 (array!28649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461496 (= res!276059 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!461497 () Bool)

(declare-fun res!276061 () Bool)

(assert (=> b!461497 (=> (not res!276061) (not e!269132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461497 (= res!276061 (validMask!0 mask!1025))))

(declare-fun b!461498 () Bool)

(declare-fun res!276062 () Bool)

(assert (=> b!461498 (=> (not res!276062) (not e!269132))))

(assert (=> b!461498 (= res!276062 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8326))))

(declare-fun mapIsEmpty!20290 () Bool)

(assert (=> mapIsEmpty!20290 mapRes!20290))

(declare-fun b!461499 () Bool)

(assert (=> b!461499 (= e!269135 (not true))))

(declare-fun +!1634 (ListLongMap!7169 tuple2!8256) ListLongMap!7169)

(assert (=> b!461499 (= (getCurrentListMapNoExtraKeys!1780 lt!209005 lt!209003 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1634 (getCurrentListMapNoExtraKeys!1780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8257 k!794 v!412)))))

(declare-datatypes ((Unit!13434 0))(
  ( (Unit!13435) )
))
(declare-fun lt!209004 () Unit!13434)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!790 (array!28649 array!28651 (_ BitVec 32) (_ BitVec 32) V!17671 V!17671 (_ BitVec 32) (_ BitVec 64) V!17671 (_ BitVec 32) Int) Unit!13434)

(assert (=> b!461499 (= lt!209004 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461500 () Bool)

(assert (=> b!461500 (= e!269136 (and e!269134 mapRes!20290))))

(declare-fun condMapEmpty!20290 () Bool)

(declare-fun mapDefault!20290 () ValueCell!5869)

