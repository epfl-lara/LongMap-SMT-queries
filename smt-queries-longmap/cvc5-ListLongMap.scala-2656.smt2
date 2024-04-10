; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39754 () Bool)

(assert start!39754)

(declare-fun b_free!10021 () Bool)

(declare-fun b_next!10021 () Bool)

(assert (=> start!39754 (= b_free!10021 (not b_next!10021))))

(declare-fun tp!35591 () Bool)

(declare-fun b_and!17701 () Bool)

(assert (=> start!39754 (= tp!35591 b_and!17701)))

(declare-fun res!251158 () Bool)

(declare-fun e!253696 () Bool)

(assert (=> start!39754 (=> (not res!251158) (not e!253696))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26183 0))(
  ( (array!26184 (arr!12541 (Array (_ BitVec 32) (_ BitVec 64))) (size!12893 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26183)

(assert (=> start!39754 (= res!251158 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12893 _keys!709))))))

(assert (=> start!39754 e!253696))

(declare-fun tp_is_empty!11173 () Bool)

(assert (=> start!39754 tp_is_empty!11173))

(assert (=> start!39754 tp!35591))

(assert (=> start!39754 true))

(declare-datatypes ((V!16003 0))(
  ( (V!16004 (val!5631 Int)) )
))
(declare-datatypes ((ValueCell!5243 0))(
  ( (ValueCellFull!5243 (v!7878 V!16003)) (EmptyCell!5243) )
))
(declare-datatypes ((array!26185 0))(
  ( (array!26186 (arr!12542 (Array (_ BitVec 32) ValueCell!5243)) (size!12894 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26185)

(declare-fun e!253699 () Bool)

(declare-fun array_inv!9142 (array!26185) Bool)

(assert (=> start!39754 (and (array_inv!9142 _values!549) e!253699)))

(declare-fun array_inv!9143 (array!26183) Bool)

(assert (=> start!39754 (array_inv!9143 _keys!709)))

(declare-fun b!427990 () Bool)

(declare-fun e!253700 () Bool)

(declare-fun e!253701 () Bool)

(assert (=> b!427990 (= e!253700 e!253701)))

(declare-fun res!251159 () Bool)

(assert (=> b!427990 (=> (not res!251159) (not e!253701))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427990 (= res!251159 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16003)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195538 () array!26185)

(declare-fun zeroValue!515 () V!16003)

(declare-fun lt!195543 () array!26183)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7406 0))(
  ( (tuple2!7407 (_1!3714 (_ BitVec 64)) (_2!3714 V!16003)) )
))
(declare-datatypes ((List!7420 0))(
  ( (Nil!7417) (Cons!7416 (h!8272 tuple2!7406) (t!12890 List!7420)) )
))
(declare-datatypes ((ListLongMap!6319 0))(
  ( (ListLongMap!6320 (toList!3175 List!7420)) )
))
(declare-fun lt!195544 () ListLongMap!6319)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1377 (array!26183 array!26185 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) Int) ListLongMap!6319)

(assert (=> b!427990 (= lt!195544 (getCurrentListMapNoExtraKeys!1377 lt!195543 lt!195538 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16003)

(assert (=> b!427990 (= lt!195538 (array!26186 (store (arr!12542 _values!549) i!563 (ValueCellFull!5243 v!412)) (size!12894 _values!549)))))

(declare-fun lt!195540 () ListLongMap!6319)

(assert (=> b!427990 (= lt!195540 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18381 () Bool)

(declare-fun mapRes!18381 () Bool)

(declare-fun tp!35592 () Bool)

(declare-fun e!253695 () Bool)

(assert (=> mapNonEmpty!18381 (= mapRes!18381 (and tp!35592 e!253695))))

(declare-fun mapRest!18381 () (Array (_ BitVec 32) ValueCell!5243))

(declare-fun mapKey!18381 () (_ BitVec 32))

(declare-fun mapValue!18381 () ValueCell!5243)

(assert (=> mapNonEmpty!18381 (= (arr!12542 _values!549) (store mapRest!18381 mapKey!18381 mapValue!18381))))

(declare-fun b!427991 () Bool)

(declare-fun res!251148 () Bool)

(assert (=> b!427991 (=> (not res!251148) (not e!253696))))

(declare-datatypes ((List!7421 0))(
  ( (Nil!7418) (Cons!7417 (h!8273 (_ BitVec 64)) (t!12891 List!7421)) )
))
(declare-fun arrayNoDuplicates!0 (array!26183 (_ BitVec 32) List!7421) Bool)

(assert (=> b!427991 (= res!251148 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7418))))

(declare-fun b!427992 () Bool)

(declare-fun e!253694 () Bool)

(assert (=> b!427992 (= e!253701 (not e!253694))))

(declare-fun res!251151 () Bool)

(assert (=> b!427992 (=> res!251151 e!253694)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427992 (= res!251151 (not (validKeyInArray!0 (select (arr!12541 _keys!709) from!863))))))

(declare-fun lt!195542 () ListLongMap!6319)

(declare-fun lt!195539 () ListLongMap!6319)

(assert (=> b!427992 (= lt!195542 lt!195539)))

(declare-fun lt!195545 () ListLongMap!6319)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1330 (ListLongMap!6319 tuple2!7406) ListLongMap!6319)

(assert (=> b!427992 (= lt!195539 (+!1330 lt!195545 (tuple2!7407 k!794 v!412)))))

(assert (=> b!427992 (= lt!195542 (getCurrentListMapNoExtraKeys!1377 lt!195543 lt!195538 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427992 (= lt!195545 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12556 0))(
  ( (Unit!12557) )
))
(declare-fun lt!195541 () Unit!12556)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!522 (array!26183 array!26185 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) (_ BitVec 64) V!16003 (_ BitVec 32) Int) Unit!12556)

(assert (=> b!427992 (= lt!195541 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!522 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427993 () Bool)

(assert (=> b!427993 (= e!253694 true)))

(declare-fun get!6213 (ValueCell!5243 V!16003) V!16003)

(declare-fun dynLambda!758 (Int (_ BitVec 64)) V!16003)

(assert (=> b!427993 (= lt!195544 (+!1330 lt!195539 (tuple2!7407 (select (arr!12541 _keys!709) from!863) (get!6213 (select (arr!12542 _values!549) from!863) (dynLambda!758 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427994 () Bool)

(declare-fun res!251155 () Bool)

(assert (=> b!427994 (=> (not res!251155) (not e!253696))))

(assert (=> b!427994 (= res!251155 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12893 _keys!709))))))

(declare-fun b!427995 () Bool)

(declare-fun res!251153 () Bool)

(assert (=> b!427995 (=> (not res!251153) (not e!253696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427995 (= res!251153 (validMask!0 mask!1025))))

(declare-fun b!427996 () Bool)

(declare-fun e!253698 () Bool)

(assert (=> b!427996 (= e!253698 tp_is_empty!11173)))

(declare-fun b!427997 () Bool)

(declare-fun res!251154 () Bool)

(assert (=> b!427997 (=> (not res!251154) (not e!253696))))

(declare-fun arrayContainsKey!0 (array!26183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427997 (= res!251154 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427998 () Bool)

(assert (=> b!427998 (= e!253699 (and e!253698 mapRes!18381))))

(declare-fun condMapEmpty!18381 () Bool)

(declare-fun mapDefault!18381 () ValueCell!5243)

