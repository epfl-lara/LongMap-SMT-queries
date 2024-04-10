; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20352 () Bool)

(assert start!20352)

(declare-fun b_free!5011 () Bool)

(declare-fun b_next!5011 () Bool)

(assert (=> start!20352 (= b_free!5011 (not b_next!5011))))

(declare-fun tp!18065 () Bool)

(declare-fun b_and!11757 () Bool)

(assert (=> start!20352 (= tp!18065 b_and!11757)))

(declare-fun b!200826 () Bool)

(declare-fun e!131665 () Bool)

(declare-fun e!131663 () Bool)

(assert (=> b!200826 (= e!131665 (not e!131663))))

(declare-fun res!95795 () Bool)

(assert (=> b!200826 (=> res!95795 e!131663)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200826 (= res!95795 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6137 0))(
  ( (V!6138 (val!2478 Int)) )
))
(declare-datatypes ((tuple2!3748 0))(
  ( (tuple2!3749 (_1!1885 (_ BitVec 64)) (_2!1885 V!6137)) )
))
(declare-datatypes ((List!2664 0))(
  ( (Nil!2661) (Cons!2660 (h!3302 tuple2!3748) (t!7595 List!2664)) )
))
(declare-datatypes ((ListLongMap!2661 0))(
  ( (ListLongMap!2662 (toList!1346 List!2664)) )
))
(declare-fun lt!99560 () ListLongMap!2661)

(declare-fun zeroValue!615 () V!6137)

(declare-datatypes ((array!8965 0))(
  ( (array!8966 (arr!4233 (Array (_ BitVec 32) (_ BitVec 64))) (size!4558 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8965)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6137)

(declare-datatypes ((ValueCell!2090 0))(
  ( (ValueCellFull!2090 (v!4448 V!6137)) (EmptyCell!2090) )
))
(declare-datatypes ((array!8967 0))(
  ( (array!8968 (arr!4234 (Array (_ BitVec 32) ValueCell!2090)) (size!4559 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8967)

(declare-fun getCurrentListMap!935 (array!8965 array!8967 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2661)

(assert (=> b!200826 (= lt!99560 (getCurrentListMap!935 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99555 () array!8967)

(declare-fun lt!99565 () ListLongMap!2661)

(assert (=> b!200826 (= lt!99565 (getCurrentListMap!935 _keys!825 lt!99555 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99557 () ListLongMap!2661)

(declare-fun lt!99563 () ListLongMap!2661)

(assert (=> b!200826 (and (= lt!99557 lt!99563) (= lt!99563 lt!99557))))

(declare-fun lt!99559 () ListLongMap!2661)

(declare-fun lt!99561 () tuple2!3748)

(declare-fun +!373 (ListLongMap!2661 tuple2!3748) ListLongMap!2661)

(assert (=> b!200826 (= lt!99563 (+!373 lt!99559 lt!99561))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6137)

(assert (=> b!200826 (= lt!99561 (tuple2!3749 k!843 v!520))))

(declare-datatypes ((Unit!6046 0))(
  ( (Unit!6047) )
))
(declare-fun lt!99566 () Unit!6046)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!48 (array!8965 array!8967 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) (_ BitVec 64) V!6137 (_ BitVec 32) Int) Unit!6046)

(assert (=> b!200826 (= lt!99566 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!48 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!309 (array!8965 array!8967 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2661)

(assert (=> b!200826 (= lt!99557 (getCurrentListMapNoExtraKeys!309 _keys!825 lt!99555 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200826 (= lt!99555 (array!8968 (store (arr!4234 _values!649) i!601 (ValueCellFull!2090 v!520)) (size!4559 _values!649)))))

(assert (=> b!200826 (= lt!99559 (getCurrentListMapNoExtraKeys!309 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200827 () Bool)

(declare-fun res!95794 () Bool)

(assert (=> b!200827 (=> (not res!95794) (not e!131665))))

(assert (=> b!200827 (= res!95794 (and (= (size!4559 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4558 _keys!825) (size!4559 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200828 () Bool)

(declare-fun res!95796 () Bool)

(assert (=> b!200828 (=> (not res!95796) (not e!131665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8965 (_ BitVec 32)) Bool)

(assert (=> b!200828 (= res!95796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200829 () Bool)

(declare-fun res!95793 () Bool)

(assert (=> b!200829 (=> (not res!95793) (not e!131665))))

(declare-datatypes ((List!2665 0))(
  ( (Nil!2662) (Cons!2661 (h!3303 (_ BitVec 64)) (t!7596 List!2665)) )
))
(declare-fun arrayNoDuplicates!0 (array!8965 (_ BitVec 32) List!2665) Bool)

(assert (=> b!200829 (= res!95793 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2662))))

(declare-fun b!200831 () Bool)

(declare-fun res!95800 () Bool)

(assert (=> b!200831 (=> (not res!95800) (not e!131665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200831 (= res!95800 (validKeyInArray!0 k!843))))

(declare-fun b!200832 () Bool)

(declare-fun e!131668 () Bool)

(assert (=> b!200832 (= e!131663 e!131668)))

(declare-fun res!95797 () Bool)

(assert (=> b!200832 (=> res!95797 e!131668)))

(assert (=> b!200832 (= res!95797 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99556 () ListLongMap!2661)

(declare-fun lt!99552 () ListLongMap!2661)

(assert (=> b!200832 (= lt!99556 lt!99552)))

(declare-fun lt!99567 () ListLongMap!2661)

(assert (=> b!200832 (= lt!99552 (+!373 lt!99567 lt!99561))))

(declare-fun lt!99558 () Unit!6046)

(declare-fun addCommutativeForDiffKeys!94 (ListLongMap!2661 (_ BitVec 64) V!6137 (_ BitVec 64) V!6137) Unit!6046)

(assert (=> b!200832 (= lt!99558 (addCommutativeForDiffKeys!94 lt!99559 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99562 () tuple2!3748)

(assert (=> b!200832 (= lt!99565 (+!373 lt!99556 lt!99562))))

(declare-fun lt!99554 () tuple2!3748)

(assert (=> b!200832 (= lt!99556 (+!373 lt!99563 lt!99554))))

(declare-fun lt!99564 () ListLongMap!2661)

(assert (=> b!200832 (= lt!99560 lt!99564)))

(assert (=> b!200832 (= lt!99564 (+!373 lt!99567 lt!99562))))

(assert (=> b!200832 (= lt!99567 (+!373 lt!99559 lt!99554))))

(assert (=> b!200832 (= lt!99565 (+!373 (+!373 lt!99557 lt!99554) lt!99562))))

(assert (=> b!200832 (= lt!99562 (tuple2!3749 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200832 (= lt!99554 (tuple2!3749 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200833 () Bool)

(declare-fun res!95799 () Bool)

(assert (=> b!200833 (=> (not res!95799) (not e!131665))))

(assert (=> b!200833 (= res!95799 (= (select (arr!4233 _keys!825) i!601) k!843))))

(declare-fun b!200834 () Bool)

(declare-fun res!95798 () Bool)

(assert (=> b!200834 (=> (not res!95798) (not e!131665))))

(assert (=> b!200834 (= res!95798 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4558 _keys!825))))))

(declare-fun res!95792 () Bool)

(assert (=> start!20352 (=> (not res!95792) (not e!131665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20352 (= res!95792 (validMask!0 mask!1149))))

(assert (=> start!20352 e!131665))

(declare-fun e!131666 () Bool)

(declare-fun array_inv!2785 (array!8967) Bool)

(assert (=> start!20352 (and (array_inv!2785 _values!649) e!131666)))

(assert (=> start!20352 true))

(declare-fun tp_is_empty!4867 () Bool)

(assert (=> start!20352 tp_is_empty!4867))

(declare-fun array_inv!2786 (array!8965) Bool)

(assert (=> start!20352 (array_inv!2786 _keys!825)))

(assert (=> start!20352 tp!18065))

(declare-fun b!200830 () Bool)

(assert (=> b!200830 (= e!131668 true)))

(assert (=> b!200830 (= (+!373 lt!99552 lt!99562) (+!373 lt!99564 lt!99561))))

(declare-fun lt!99553 () Unit!6046)

(assert (=> b!200830 (= lt!99553 (addCommutativeForDiffKeys!94 lt!99567 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8369 () Bool)

(declare-fun mapRes!8369 () Bool)

(declare-fun tp!18064 () Bool)

(declare-fun e!131664 () Bool)

(assert (=> mapNonEmpty!8369 (= mapRes!8369 (and tp!18064 e!131664))))

(declare-fun mapValue!8369 () ValueCell!2090)

(declare-fun mapRest!8369 () (Array (_ BitVec 32) ValueCell!2090))

(declare-fun mapKey!8369 () (_ BitVec 32))

(assert (=> mapNonEmpty!8369 (= (arr!4234 _values!649) (store mapRest!8369 mapKey!8369 mapValue!8369))))

(declare-fun b!200835 () Bool)

(declare-fun e!131667 () Bool)

(assert (=> b!200835 (= e!131666 (and e!131667 mapRes!8369))))

(declare-fun condMapEmpty!8369 () Bool)

(declare-fun mapDefault!8369 () ValueCell!2090)

