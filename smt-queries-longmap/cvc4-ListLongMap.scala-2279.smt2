; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37140 () Bool)

(assert start!37140)

(declare-fun b_free!8267 () Bool)

(declare-fun b_next!8267 () Bool)

(assert (=> start!37140 (= b_free!8267 (not b_next!8267))))

(declare-fun tp!29516 () Bool)

(declare-fun b_and!15509 () Bool)

(assert (=> start!37140 (= tp!29516 b_and!15509)))

(declare-fun b!374442 () Bool)

(declare-fun res!211147 () Bool)

(declare-fun e!228202 () Bool)

(assert (=> b!374442 (=> (not res!211147) (not e!228202))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374442 (= res!211147 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!14937 () Bool)

(declare-fun mapRes!14937 () Bool)

(assert (=> mapIsEmpty!14937 mapRes!14937))

(declare-fun b!374443 () Bool)

(declare-fun res!211152 () Bool)

(assert (=> b!374443 (=> (not res!211152) (not e!228202))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21769 0))(
  ( (array!21770 (arr!10353 (Array (_ BitVec 32) (_ BitVec 64))) (size!10705 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21769)

(assert (=> b!374443 (= res!211152 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10705 _keys!658))))))

(declare-fun res!211153 () Bool)

(assert (=> start!37140 (=> (not res!211153) (not e!228202))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37140 (= res!211153 (validMask!0 mask!970))))

(assert (=> start!37140 e!228202))

(declare-datatypes ((V!12991 0))(
  ( (V!12992 (val!4502 Int)) )
))
(declare-datatypes ((ValueCell!4114 0))(
  ( (ValueCellFull!4114 (v!6699 V!12991)) (EmptyCell!4114) )
))
(declare-datatypes ((array!21771 0))(
  ( (array!21772 (arr!10354 (Array (_ BitVec 32) ValueCell!4114)) (size!10706 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21771)

(declare-fun e!228201 () Bool)

(declare-fun array_inv!7636 (array!21771) Bool)

(assert (=> start!37140 (and (array_inv!7636 _values!506) e!228201)))

(assert (=> start!37140 tp!29516))

(assert (=> start!37140 true))

(declare-fun tp_is_empty!8915 () Bool)

(assert (=> start!37140 tp_is_empty!8915))

(declare-fun array_inv!7637 (array!21769) Bool)

(assert (=> start!37140 (array_inv!7637 _keys!658)))

(declare-fun b!374444 () Bool)

(declare-fun res!211151 () Bool)

(assert (=> b!374444 (=> (not res!211151) (not e!228202))))

(assert (=> b!374444 (= res!211151 (or (= (select (arr!10353 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10353 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374445 () Bool)

(declare-fun e!228204 () Bool)

(assert (=> b!374445 (= e!228204 tp_is_empty!8915)))

(declare-fun b!374446 () Bool)

(declare-fun e!228206 () Bool)

(declare-fun e!228200 () Bool)

(assert (=> b!374446 (= e!228206 (not e!228200))))

(declare-fun res!211155 () Bool)

(assert (=> b!374446 (=> res!211155 e!228200)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374446 (= res!211155 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5986 0))(
  ( (tuple2!5987 (_1!3004 (_ BitVec 64)) (_2!3004 V!12991)) )
))
(declare-datatypes ((List!5831 0))(
  ( (Nil!5828) (Cons!5827 (h!6683 tuple2!5986) (t!10981 List!5831)) )
))
(declare-datatypes ((ListLongMap!4899 0))(
  ( (ListLongMap!4900 (toList!2465 List!5831)) )
))
(declare-fun lt!172620 () ListLongMap!4899)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12991)

(declare-fun minValue!472 () V!12991)

(declare-fun getCurrentListMap!1903 (array!21769 array!21771 (_ BitVec 32) (_ BitVec 32) V!12991 V!12991 (_ BitVec 32) Int) ListLongMap!4899)

(assert (=> b!374446 (= lt!172620 (getCurrentListMap!1903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172621 () array!21769)

(declare-fun lt!172616 () array!21771)

(declare-fun lt!172629 () ListLongMap!4899)

(assert (=> b!374446 (= lt!172629 (getCurrentListMap!1903 lt!172621 lt!172616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172617 () ListLongMap!4899)

(declare-fun lt!172623 () ListLongMap!4899)

(assert (=> b!374446 (and (= lt!172617 lt!172623) (= lt!172623 lt!172617))))

(declare-fun lt!172613 () ListLongMap!4899)

(declare-fun lt!172627 () tuple2!5986)

(declare-fun +!811 (ListLongMap!4899 tuple2!5986) ListLongMap!4899)

(assert (=> b!374446 (= lt!172623 (+!811 lt!172613 lt!172627))))

(declare-fun v!373 () V!12991)

(assert (=> b!374446 (= lt!172627 (tuple2!5987 k!778 v!373))))

(declare-datatypes ((Unit!11528 0))(
  ( (Unit!11529) )
))
(declare-fun lt!172619 () Unit!11528)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!61 (array!21769 array!21771 (_ BitVec 32) (_ BitVec 32) V!12991 V!12991 (_ BitVec 32) (_ BitVec 64) V!12991 (_ BitVec 32) Int) Unit!11528)

(assert (=> b!374446 (= lt!172619 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!61 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!737 (array!21769 array!21771 (_ BitVec 32) (_ BitVec 32) V!12991 V!12991 (_ BitVec 32) Int) ListLongMap!4899)

(assert (=> b!374446 (= lt!172617 (getCurrentListMapNoExtraKeys!737 lt!172621 lt!172616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374446 (= lt!172616 (array!21772 (store (arr!10354 _values!506) i!548 (ValueCellFull!4114 v!373)) (size!10706 _values!506)))))

(assert (=> b!374446 (= lt!172613 (getCurrentListMapNoExtraKeys!737 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374447 () Bool)

(declare-fun e!228199 () Bool)

(assert (=> b!374447 (= e!228199 (bvsle #b00000000000000000000000000000000 (size!10705 _keys!658)))))

(declare-fun lt!172626 () ListLongMap!4899)

(declare-fun lt!172624 () tuple2!5986)

(declare-fun lt!172625 () ListLongMap!4899)

(assert (=> b!374447 (= (+!811 lt!172626 lt!172624) (+!811 lt!172625 lt!172627))))

(declare-fun lt!172622 () ListLongMap!4899)

(declare-fun lt!172618 () Unit!11528)

(declare-fun addCommutativeForDiffKeys!234 (ListLongMap!4899 (_ BitVec 64) V!12991 (_ BitVec 64) V!12991) Unit!11528)

(assert (=> b!374447 (= lt!172618 (addCommutativeForDiffKeys!234 lt!172622 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374448 () Bool)

(declare-fun e!228205 () Bool)

(assert (=> b!374448 (= e!228201 (and e!228205 mapRes!14937))))

(declare-fun condMapEmpty!14937 () Bool)

(declare-fun mapDefault!14937 () ValueCell!4114)

