; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37112 () Bool)

(assert start!37112)

(declare-fun b_free!8239 () Bool)

(declare-fun b_next!8239 () Bool)

(assert (=> start!37112 (= b_free!8239 (not b_next!8239))))

(declare-fun tp!29433 () Bool)

(declare-fun b_and!15481 () Bool)

(assert (=> start!37112 (= tp!29433 b_and!15481)))

(declare-fun b!373812 () Bool)

(declare-fun e!227864 () Bool)

(declare-fun tp_is_empty!8887 () Bool)

(assert (=> b!373812 (= e!227864 tp_is_empty!8887)))

(declare-fun mapNonEmpty!14895 () Bool)

(declare-fun mapRes!14895 () Bool)

(declare-fun tp!29432 () Bool)

(declare-fun e!227866 () Bool)

(assert (=> mapNonEmpty!14895 (= mapRes!14895 (and tp!29432 e!227866))))

(declare-datatypes ((V!12955 0))(
  ( (V!12956 (val!4488 Int)) )
))
(declare-datatypes ((ValueCell!4100 0))(
  ( (ValueCellFull!4100 (v!6685 V!12955)) (EmptyCell!4100) )
))
(declare-fun mapValue!14895 () ValueCell!4100)

(declare-fun mapRest!14895 () (Array (_ BitVec 32) ValueCell!4100))

(declare-datatypes ((array!21713 0))(
  ( (array!21714 (arr!10325 (Array (_ BitVec 32) ValueCell!4100)) (size!10677 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21713)

(declare-fun mapKey!14895 () (_ BitVec 32))

(assert (=> mapNonEmpty!14895 (= (arr!10325 _values!506) (store mapRest!14895 mapKey!14895 mapValue!14895))))

(declare-fun b!373813 () Bool)

(declare-fun res!210644 () Bool)

(declare-fun e!227868 () Bool)

(assert (=> b!373813 (=> (not res!210644) (not e!227868))))

(declare-datatypes ((array!21715 0))(
  ( (array!21716 (arr!10326 (Array (_ BitVec 32) (_ BitVec 64))) (size!10678 (_ BitVec 32))) )
))
(declare-fun lt!171910 () array!21715)

(declare-datatypes ((List!5807 0))(
  ( (Nil!5804) (Cons!5803 (h!6659 (_ BitVec 64)) (t!10957 List!5807)) )
))
(declare-fun arrayNoDuplicates!0 (array!21715 (_ BitVec 32) List!5807) Bool)

(assert (=> b!373813 (= res!210644 (arrayNoDuplicates!0 lt!171910 #b00000000000000000000000000000000 Nil!5804))))

(declare-fun b!373814 () Bool)

(declare-fun res!210648 () Bool)

(declare-fun e!227869 () Bool)

(assert (=> b!373814 (=> (not res!210648) (not e!227869))))

(declare-fun _keys!658 () array!21715)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373814 (= res!210648 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!210646 () Bool)

(assert (=> start!37112 (=> (not res!210646) (not e!227869))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37112 (= res!210646 (validMask!0 mask!970))))

(assert (=> start!37112 e!227869))

(declare-fun e!227863 () Bool)

(declare-fun array_inv!7610 (array!21713) Bool)

(assert (=> start!37112 (and (array_inv!7610 _values!506) e!227863)))

(assert (=> start!37112 tp!29433))

(assert (=> start!37112 true))

(assert (=> start!37112 tp_is_empty!8887))

(declare-fun array_inv!7611 (array!21715) Bool)

(assert (=> start!37112 (array_inv!7611 _keys!658)))

(declare-fun b!373815 () Bool)

(declare-fun e!227870 () Bool)

(declare-fun e!227867 () Bool)

(assert (=> b!373815 (= e!227870 e!227867)))

(declare-fun res!210647 () Bool)

(assert (=> b!373815 (=> res!210647 e!227867)))

(assert (=> b!373815 (= res!210647 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5962 0))(
  ( (tuple2!5963 (_1!2992 (_ BitVec 64)) (_2!2992 V!12955)) )
))
(declare-datatypes ((List!5808 0))(
  ( (Nil!5805) (Cons!5804 (h!6660 tuple2!5962) (t!10958 List!5808)) )
))
(declare-datatypes ((ListLongMap!4875 0))(
  ( (ListLongMap!4876 (toList!2453 List!5808)) )
))
(declare-fun lt!171900 () ListLongMap!4875)

(declare-fun lt!171906 () ListLongMap!4875)

(assert (=> b!373815 (= lt!171900 lt!171906)))

(declare-fun lt!171913 () ListLongMap!4875)

(declare-fun lt!171904 () tuple2!5962)

(declare-fun +!799 (ListLongMap!4875 tuple2!5962) ListLongMap!4875)

(assert (=> b!373815 (= lt!171906 (+!799 lt!171913 lt!171904))))

(declare-fun lt!171911 () ListLongMap!4875)

(declare-fun zeroValue!472 () V!12955)

(declare-fun v!373 () V!12955)

(declare-datatypes ((Unit!11504 0))(
  ( (Unit!11505) )
))
(declare-fun lt!171914 () Unit!11504)

(declare-fun addCommutativeForDiffKeys!223 (ListLongMap!4875 (_ BitVec 64) V!12955 (_ BitVec 64) V!12955) Unit!11504)

(assert (=> b!373815 (= lt!171914 (addCommutativeForDiffKeys!223 lt!171911 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171908 () ListLongMap!4875)

(declare-fun lt!171907 () tuple2!5962)

(assert (=> b!373815 (= lt!171908 (+!799 lt!171900 lt!171907))))

(declare-fun lt!171912 () ListLongMap!4875)

(declare-fun lt!171901 () tuple2!5962)

(assert (=> b!373815 (= lt!171900 (+!799 lt!171912 lt!171901))))

(declare-fun lt!171902 () ListLongMap!4875)

(declare-fun lt!171905 () ListLongMap!4875)

(assert (=> b!373815 (= lt!171902 lt!171905)))

(assert (=> b!373815 (= lt!171905 (+!799 lt!171913 lt!171907))))

(assert (=> b!373815 (= lt!171913 (+!799 lt!171911 lt!171901))))

(declare-fun lt!171899 () ListLongMap!4875)

(assert (=> b!373815 (= lt!171908 (+!799 (+!799 lt!171899 lt!171901) lt!171907))))

(declare-fun minValue!472 () V!12955)

(assert (=> b!373815 (= lt!171907 (tuple2!5963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373815 (= lt!171901 (tuple2!5963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373816 () Bool)

(declare-fun res!210653 () Bool)

(assert (=> b!373816 (=> (not res!210653) (not e!227869))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373816 (= res!210653 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10678 _keys!658))))))

(declare-fun b!373817 () Bool)

(assert (=> b!373817 (= e!227867 true)))

(assert (=> b!373817 (= (+!799 lt!171906 lt!171907) (+!799 lt!171905 lt!171904))))

(declare-fun lt!171915 () Unit!11504)

(assert (=> b!373817 (= lt!171915 (addCommutativeForDiffKeys!223 lt!171913 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373818 () Bool)

(declare-fun res!210652 () Bool)

(assert (=> b!373818 (=> (not res!210652) (not e!227869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373818 (= res!210652 (validKeyInArray!0 k!778))))

(declare-fun b!373819 () Bool)

(assert (=> b!373819 (= e!227869 e!227868)))

(declare-fun res!210645 () Bool)

(assert (=> b!373819 (=> (not res!210645) (not e!227868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21715 (_ BitVec 32)) Bool)

(assert (=> b!373819 (= res!210645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171910 mask!970))))

(assert (=> b!373819 (= lt!171910 (array!21716 (store (arr!10326 _keys!658) i!548 k!778) (size!10678 _keys!658)))))

(declare-fun b!373820 () Bool)

(assert (=> b!373820 (= e!227863 (and e!227864 mapRes!14895))))

(declare-fun condMapEmpty!14895 () Bool)

(declare-fun mapDefault!14895 () ValueCell!4100)

