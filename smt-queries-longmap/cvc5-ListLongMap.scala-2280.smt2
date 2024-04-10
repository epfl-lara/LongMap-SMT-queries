; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37142 () Bool)

(assert start!37142)

(declare-fun b_free!8269 () Bool)

(declare-fun b_next!8269 () Bool)

(assert (=> start!37142 (= b_free!8269 (not b_next!8269))))

(declare-fun tp!29523 () Bool)

(declare-fun b_and!15511 () Bool)

(assert (=> start!37142 (= tp!29523 b_and!15511)))

(declare-fun b!374487 () Bool)

(declare-fun res!211186 () Bool)

(declare-fun e!228230 () Bool)

(assert (=> b!374487 (=> (not res!211186) (not e!228230))))

(declare-datatypes ((array!21773 0))(
  ( (array!21774 (arr!10355 (Array (_ BitVec 32) (_ BitVec 64))) (size!10707 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21773)

(declare-datatypes ((List!5832 0))(
  ( (Nil!5829) (Cons!5828 (h!6684 (_ BitVec 64)) (t!10982 List!5832)) )
))
(declare-fun arrayNoDuplicates!0 (array!21773 (_ BitVec 32) List!5832) Bool)

(assert (=> b!374487 (= res!211186 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5829))))

(declare-fun b!374488 () Bool)

(declare-fun res!211190 () Bool)

(assert (=> b!374488 (=> (not res!211190) (not e!228230))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21773 (_ BitVec 32)) Bool)

(assert (=> b!374488 (= res!211190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374489 () Bool)

(declare-fun res!211188 () Bool)

(assert (=> b!374489 (=> (not res!211188) (not e!228230))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374489 (= res!211188 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!374490 () Bool)

(declare-fun res!211191 () Bool)

(assert (=> b!374490 (=> (not res!211191) (not e!228230))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374490 (= res!211191 (or (= (select (arr!10355 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10355 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374491 () Bool)

(declare-fun e!228228 () Bool)

(declare-fun tp_is_empty!8917 () Bool)

(assert (=> b!374491 (= e!228228 tp_is_empty!8917)))

(declare-fun mapIsEmpty!14940 () Bool)

(declare-fun mapRes!14940 () Bool)

(assert (=> mapIsEmpty!14940 mapRes!14940))

(declare-fun b!374492 () Bool)

(declare-fun e!228225 () Bool)

(declare-fun e!228224 () Bool)

(assert (=> b!374492 (= e!228225 e!228224)))

(declare-fun res!211185 () Bool)

(assert (=> b!374492 (=> res!211185 e!228224)))

(assert (=> b!374492 (= res!211185 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12995 0))(
  ( (V!12996 (val!4503 Int)) )
))
(declare-datatypes ((tuple2!5988 0))(
  ( (tuple2!5989 (_1!3005 (_ BitVec 64)) (_2!3005 V!12995)) )
))
(declare-datatypes ((List!5833 0))(
  ( (Nil!5830) (Cons!5829 (h!6685 tuple2!5988) (t!10983 List!5833)) )
))
(declare-datatypes ((ListLongMap!4901 0))(
  ( (ListLongMap!4902 (toList!2466 List!5833)) )
))
(declare-fun lt!172672 () ListLongMap!4901)

(declare-fun lt!172679 () ListLongMap!4901)

(assert (=> b!374492 (= lt!172672 lt!172679)))

(declare-fun lt!172675 () ListLongMap!4901)

(declare-fun lt!172677 () tuple2!5988)

(declare-fun +!812 (ListLongMap!4901 tuple2!5988) ListLongMap!4901)

(assert (=> b!374492 (= lt!172679 (+!812 lt!172675 lt!172677))))

(declare-fun v!373 () V!12995)

(declare-fun lt!172666 () ListLongMap!4901)

(declare-datatypes ((Unit!11530 0))(
  ( (Unit!11531) )
))
(declare-fun lt!172668 () Unit!11530)

(declare-fun zeroValue!472 () V!12995)

(declare-fun addCommutativeForDiffKeys!235 (ListLongMap!4901 (_ BitVec 64) V!12995 (_ BitVec 64) V!12995) Unit!11530)

(assert (=> b!374492 (= lt!172668 (addCommutativeForDiffKeys!235 lt!172666 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172673 () ListLongMap!4901)

(declare-fun lt!172667 () tuple2!5988)

(assert (=> b!374492 (= lt!172673 (+!812 lt!172672 lt!172667))))

(declare-fun lt!172676 () ListLongMap!4901)

(declare-fun lt!172665 () tuple2!5988)

(assert (=> b!374492 (= lt!172672 (+!812 lt!172676 lt!172665))))

(declare-fun lt!172669 () ListLongMap!4901)

(declare-fun lt!172670 () ListLongMap!4901)

(assert (=> b!374492 (= lt!172669 lt!172670)))

(assert (=> b!374492 (= lt!172670 (+!812 lt!172675 lt!172667))))

(assert (=> b!374492 (= lt!172675 (+!812 lt!172666 lt!172665))))

(declare-fun lt!172678 () ListLongMap!4901)

(assert (=> b!374492 (= lt!172673 (+!812 (+!812 lt!172678 lt!172665) lt!172667))))

(declare-fun minValue!472 () V!12995)

(assert (=> b!374492 (= lt!172667 (tuple2!5989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374492 (= lt!172665 (tuple2!5989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374493 () Bool)

(declare-fun res!211187 () Bool)

(declare-fun e!228223 () Bool)

(assert (=> b!374493 (=> (not res!211187) (not e!228223))))

(declare-fun lt!172664 () array!21773)

(assert (=> b!374493 (= res!211187 (arrayNoDuplicates!0 lt!172664 #b00000000000000000000000000000000 Nil!5829))))

(declare-fun mapNonEmpty!14940 () Bool)

(declare-fun tp!29522 () Bool)

(assert (=> mapNonEmpty!14940 (= mapRes!14940 (and tp!29522 e!228228))))

(declare-datatypes ((ValueCell!4115 0))(
  ( (ValueCellFull!4115 (v!6700 V!12995)) (EmptyCell!4115) )
))
(declare-datatypes ((array!21775 0))(
  ( (array!21776 (arr!10356 (Array (_ BitVec 32) ValueCell!4115)) (size!10708 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21775)

(declare-fun mapValue!14940 () ValueCell!4115)

(declare-fun mapRest!14940 () (Array (_ BitVec 32) ValueCell!4115))

(declare-fun mapKey!14940 () (_ BitVec 32))

(assert (=> mapNonEmpty!14940 (= (arr!10356 _values!506) (store mapRest!14940 mapKey!14940 mapValue!14940))))

(declare-fun b!374494 () Bool)

(declare-fun res!211182 () Bool)

(assert (=> b!374494 (=> (not res!211182) (not e!228230))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374494 (= res!211182 (and (= (size!10708 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10707 _keys!658) (size!10708 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374495 () Bool)

(declare-fun res!211184 () Bool)

(assert (=> b!374495 (=> (not res!211184) (not e!228230))))

(assert (=> b!374495 (= res!211184 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10707 _keys!658))))))

(declare-fun b!374497 () Bool)

(declare-fun res!211189 () Bool)

(assert (=> b!374497 (=> (not res!211189) (not e!228230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374497 (= res!211189 (validKeyInArray!0 k!778))))

(declare-fun b!374498 () Bool)

(declare-fun e!228227 () Bool)

(assert (=> b!374498 (= e!228227 tp_is_empty!8917)))

(declare-fun b!374499 () Bool)

(assert (=> b!374499 (= e!228224 true)))

(assert (=> b!374499 (= (+!812 lt!172679 lt!172667) (+!812 lt!172670 lt!172677))))

(declare-fun lt!172674 () Unit!11530)

(assert (=> b!374499 (= lt!172674 (addCommutativeForDiffKeys!235 lt!172675 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!211193 () Bool)

(assert (=> start!37142 (=> (not res!211193) (not e!228230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37142 (= res!211193 (validMask!0 mask!970))))

(assert (=> start!37142 e!228230))

(declare-fun e!228226 () Bool)

(declare-fun array_inv!7638 (array!21775) Bool)

(assert (=> start!37142 (and (array_inv!7638 _values!506) e!228226)))

(assert (=> start!37142 tp!29523))

(assert (=> start!37142 true))

(assert (=> start!37142 tp_is_empty!8917))

(declare-fun array_inv!7639 (array!21773) Bool)

(assert (=> start!37142 (array_inv!7639 _keys!658)))

(declare-fun b!374496 () Bool)

(assert (=> b!374496 (= e!228226 (and e!228227 mapRes!14940))))

(declare-fun condMapEmpty!14940 () Bool)

(declare-fun mapDefault!14940 () ValueCell!4115)

