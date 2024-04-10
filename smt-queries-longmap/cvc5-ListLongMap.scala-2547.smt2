; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39100 () Bool)

(assert start!39100)

(declare-fun b_free!9367 () Bool)

(declare-fun b_next!9367 () Bool)

(assert (=> start!39100 (= b_free!9367 (not b_next!9367))))

(declare-fun tp!33630 () Bool)

(declare-fun b_and!16753 () Bool)

(assert (=> start!39100 (= tp!33630 b_and!16753)))

(declare-fun b!410862 () Bool)

(declare-fun e!246179 () Bool)

(assert (=> b!410862 (= e!246179 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15131 0))(
  ( (V!15132 (val!5304 Int)) )
))
(declare-fun minValue!515 () V!15131)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4916 0))(
  ( (ValueCellFull!4916 (v!7551 V!15131)) (EmptyCell!4916) )
))
(declare-datatypes ((array!24899 0))(
  ( (array!24900 (arr!11899 (Array (_ BitVec 32) ValueCell!4916)) (size!12251 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24899)

(declare-fun zeroValue!515 () V!15131)

(declare-datatypes ((array!24901 0))(
  ( (array!24902 (arr!11900 (Array (_ BitVec 32) (_ BitVec 64))) (size!12252 (_ BitVec 32))) )
))
(declare-fun lt!189167 () array!24901)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15131)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6876 0))(
  ( (tuple2!6877 (_1!3449 (_ BitVec 64)) (_2!3449 V!15131)) )
))
(declare-datatypes ((List!6901 0))(
  ( (Nil!6898) (Cons!6897 (h!7753 tuple2!6876) (t!12075 List!6901)) )
))
(declare-datatypes ((ListLongMap!5789 0))(
  ( (ListLongMap!5790 (toList!2910 List!6901)) )
))
(declare-fun lt!189165 () ListLongMap!5789)

(declare-fun getCurrentListMapNoExtraKeys!1118 (array!24901 array!24899 (_ BitVec 32) (_ BitVec 32) V!15131 V!15131 (_ BitVec 32) Int) ListLongMap!5789)

(assert (=> b!410862 (= lt!189165 (getCurrentListMapNoExtraKeys!1118 lt!189167 (array!24900 (store (arr!11899 _values!549) i!563 (ValueCellFull!4916 v!412)) (size!12251 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189166 () ListLongMap!5789)

(declare-fun _keys!709 () array!24901)

(assert (=> b!410862 (= lt!189166 (getCurrentListMapNoExtraKeys!1118 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410863 () Bool)

(declare-fun res!238228 () Bool)

(declare-fun e!246175 () Bool)

(assert (=> b!410863 (=> (not res!238228) (not e!246175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410863 (= res!238228 (validMask!0 mask!1025))))

(declare-fun b!410864 () Bool)

(declare-fun res!238235 () Bool)

(assert (=> b!410864 (=> (not res!238235) (not e!246175))))

(assert (=> b!410864 (= res!238235 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12252 _keys!709))))))

(declare-fun b!410865 () Bool)

(declare-fun res!238234 () Bool)

(assert (=> b!410865 (=> (not res!238234) (not e!246175))))

(assert (=> b!410865 (= res!238234 (or (= (select (arr!11900 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11900 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410866 () Bool)

(declare-fun res!238229 () Bool)

(assert (=> b!410866 (=> (not res!238229) (not e!246175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24901 (_ BitVec 32)) Bool)

(assert (=> b!410866 (= res!238229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410867 () Bool)

(assert (=> b!410867 (= e!246175 e!246179)))

(declare-fun res!238231 () Bool)

(assert (=> b!410867 (=> (not res!238231) (not e!246179))))

(assert (=> b!410867 (= res!238231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189167 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!410867 (= lt!189167 (array!24902 (store (arr!11900 _keys!709) i!563 k!794) (size!12252 _keys!709)))))

(declare-fun b!410868 () Bool)

(declare-fun e!246176 () Bool)

(declare-fun tp_is_empty!10519 () Bool)

(assert (=> b!410868 (= e!246176 tp_is_empty!10519)))

(declare-fun b!410869 () Bool)

(declare-fun res!238233 () Bool)

(assert (=> b!410869 (=> (not res!238233) (not e!246175))))

(declare-fun arrayContainsKey!0 (array!24901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410869 (= res!238233 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17400 () Bool)

(declare-fun mapRes!17400 () Bool)

(declare-fun tp!33629 () Bool)

(declare-fun e!246180 () Bool)

(assert (=> mapNonEmpty!17400 (= mapRes!17400 (and tp!33629 e!246180))))

(declare-fun mapValue!17400 () ValueCell!4916)

(declare-fun mapRest!17400 () (Array (_ BitVec 32) ValueCell!4916))

(declare-fun mapKey!17400 () (_ BitVec 32))

(assert (=> mapNonEmpty!17400 (= (arr!11899 _values!549) (store mapRest!17400 mapKey!17400 mapValue!17400))))

(declare-fun b!410870 () Bool)

(declare-fun res!238236 () Bool)

(assert (=> b!410870 (=> (not res!238236) (not e!246175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410870 (= res!238236 (validKeyInArray!0 k!794))))

(declare-fun b!410871 () Bool)

(declare-fun res!238238 () Bool)

(assert (=> b!410871 (=> (not res!238238) (not e!246175))))

(assert (=> b!410871 (= res!238238 (and (= (size!12251 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12252 _keys!709) (size!12251 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410873 () Bool)

(declare-fun res!238232 () Bool)

(assert (=> b!410873 (=> (not res!238232) (not e!246179))))

(assert (=> b!410873 (= res!238232 (bvsle from!863 i!563))))

(declare-fun b!410874 () Bool)

(declare-fun res!238230 () Bool)

(assert (=> b!410874 (=> (not res!238230) (not e!246175))))

(declare-datatypes ((List!6902 0))(
  ( (Nil!6899) (Cons!6898 (h!7754 (_ BitVec 64)) (t!12076 List!6902)) )
))
(declare-fun arrayNoDuplicates!0 (array!24901 (_ BitVec 32) List!6902) Bool)

(assert (=> b!410874 (= res!238230 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6899))))

(declare-fun mapIsEmpty!17400 () Bool)

(assert (=> mapIsEmpty!17400 mapRes!17400))

(declare-fun b!410875 () Bool)

(declare-fun e!246177 () Bool)

(assert (=> b!410875 (= e!246177 (and e!246176 mapRes!17400))))

(declare-fun condMapEmpty!17400 () Bool)

(declare-fun mapDefault!17400 () ValueCell!4916)

