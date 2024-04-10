; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37146 () Bool)

(assert start!37146)

(declare-fun b_free!8273 () Bool)

(declare-fun b_next!8273 () Bool)

(assert (=> start!37146 (= b_free!8273 (not b_next!8273))))

(declare-fun tp!29534 () Bool)

(declare-fun b_and!15515 () Bool)

(assert (=> start!37146 (= tp!29534 b_and!15515)))

(declare-fun res!211256 () Bool)

(declare-fun e!228273 () Bool)

(assert (=> start!37146 (=> (not res!211256) (not e!228273))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37146 (= res!211256 (validMask!0 mask!970))))

(assert (=> start!37146 e!228273))

(declare-datatypes ((V!12999 0))(
  ( (V!13000 (val!4505 Int)) )
))
(declare-datatypes ((ValueCell!4117 0))(
  ( (ValueCellFull!4117 (v!6702 V!12999)) (EmptyCell!4117) )
))
(declare-datatypes ((array!21781 0))(
  ( (array!21782 (arr!10359 (Array (_ BitVec 32) ValueCell!4117)) (size!10711 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21781)

(declare-fun e!228278 () Bool)

(declare-fun array_inv!7642 (array!21781) Bool)

(assert (=> start!37146 (and (array_inv!7642 _values!506) e!228278)))

(assert (=> start!37146 tp!29534))

(assert (=> start!37146 true))

(declare-fun tp_is_empty!8921 () Bool)

(assert (=> start!37146 tp_is_empty!8921))

(declare-datatypes ((array!21783 0))(
  ( (array!21784 (arr!10360 (Array (_ BitVec 32) (_ BitVec 64))) (size!10712 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21783)

(declare-fun array_inv!7643 (array!21783) Bool)

(assert (=> start!37146 (array_inv!7643 _keys!658)))

(declare-fun b!374577 () Bool)

(declare-fun res!211257 () Bool)

(assert (=> b!374577 (=> (not res!211257) (not e!228273))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374577 (= res!211257 (or (= (select (arr!10360 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10360 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374578 () Bool)

(declare-fun e!228272 () Bool)

(assert (=> b!374578 (= e!228272 tp_is_empty!8921)))

(declare-fun b!374579 () Bool)

(declare-fun res!211259 () Bool)

(assert (=> b!374579 (=> (not res!211259) (not e!228273))))

(declare-datatypes ((List!5836 0))(
  ( (Nil!5833) (Cons!5832 (h!6688 (_ BitVec 64)) (t!10986 List!5836)) )
))
(declare-fun arrayNoDuplicates!0 (array!21783 (_ BitVec 32) List!5836) Bool)

(assert (=> b!374579 (= res!211259 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5833))))

(declare-fun b!374580 () Bool)

(declare-fun e!228274 () Bool)

(declare-fun e!228276 () Bool)

(assert (=> b!374580 (= e!228274 (not e!228276))))

(declare-fun res!211264 () Bool)

(assert (=> b!374580 (=> res!211264 e!228276)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374580 (= res!211264 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12999)

(declare-datatypes ((tuple2!5992 0))(
  ( (tuple2!5993 (_1!3007 (_ BitVec 64)) (_2!3007 V!12999)) )
))
(declare-datatypes ((List!5837 0))(
  ( (Nil!5834) (Cons!5833 (h!6689 tuple2!5992) (t!10987 List!5837)) )
))
(declare-datatypes ((ListLongMap!4905 0))(
  ( (ListLongMap!4906 (toList!2468 List!5837)) )
))
(declare-fun lt!172776 () ListLongMap!4905)

(declare-fun minValue!472 () V!12999)

(declare-fun getCurrentListMap!1905 (array!21783 array!21781 (_ BitVec 32) (_ BitVec 32) V!12999 V!12999 (_ BitVec 32) Int) ListLongMap!4905)

(assert (=> b!374580 (= lt!172776 (getCurrentListMap!1905 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172768 () array!21781)

(declare-fun lt!172769 () ListLongMap!4905)

(declare-fun lt!172770 () array!21783)

(assert (=> b!374580 (= lt!172769 (getCurrentListMap!1905 lt!172770 lt!172768 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172781 () ListLongMap!4905)

(declare-fun lt!172775 () ListLongMap!4905)

(assert (=> b!374580 (and (= lt!172781 lt!172775) (= lt!172775 lt!172781))))

(declare-fun lt!172777 () ListLongMap!4905)

(declare-fun lt!172782 () tuple2!5992)

(declare-fun +!814 (ListLongMap!4905 tuple2!5992) ListLongMap!4905)

(assert (=> b!374580 (= lt!172775 (+!814 lt!172777 lt!172782))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12999)

(assert (=> b!374580 (= lt!172782 (tuple2!5993 k!778 v!373))))

(declare-datatypes ((Unit!11534 0))(
  ( (Unit!11535) )
))
(declare-fun lt!172767 () Unit!11534)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!63 (array!21783 array!21781 (_ BitVec 32) (_ BitVec 32) V!12999 V!12999 (_ BitVec 32) (_ BitVec 64) V!12999 (_ BitVec 32) Int) Unit!11534)

(assert (=> b!374580 (= lt!172767 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!63 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!739 (array!21783 array!21781 (_ BitVec 32) (_ BitVec 32) V!12999 V!12999 (_ BitVec 32) Int) ListLongMap!4905)

(assert (=> b!374580 (= lt!172781 (getCurrentListMapNoExtraKeys!739 lt!172770 lt!172768 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374580 (= lt!172768 (array!21782 (store (arr!10359 _values!506) i!548 (ValueCellFull!4117 v!373)) (size!10711 _values!506)))))

(assert (=> b!374580 (= lt!172777 (getCurrentListMapNoExtraKeys!739 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374581 () Bool)

(declare-fun res!211261 () Bool)

(assert (=> b!374581 (=> (not res!211261) (not e!228273))))

(assert (=> b!374581 (= res!211261 (and (= (size!10711 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10712 _keys!658) (size!10711 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374582 () Bool)

(declare-fun e!228275 () Bool)

(assert (=> b!374582 (= e!228275 tp_is_empty!8921)))

(declare-fun b!374583 () Bool)

(declare-fun res!211255 () Bool)

(assert (=> b!374583 (=> (not res!211255) (not e!228273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21783 (_ BitVec 32)) Bool)

(assert (=> b!374583 (= res!211255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374584 () Bool)

(declare-fun res!211265 () Bool)

(assert (=> b!374584 (=> (not res!211265) (not e!228274))))

(assert (=> b!374584 (= res!211265 (arrayNoDuplicates!0 lt!172770 #b00000000000000000000000000000000 Nil!5833))))

(declare-fun b!374585 () Bool)

(declare-fun e!228277 () Bool)

(assert (=> b!374585 (= e!228276 e!228277)))

(declare-fun res!211262 () Bool)

(assert (=> b!374585 (=> res!211262 e!228277)))

(assert (=> b!374585 (= res!211262 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172772 () ListLongMap!4905)

(declare-fun lt!172773 () ListLongMap!4905)

(assert (=> b!374585 (= lt!172772 lt!172773)))

(declare-fun lt!172774 () ListLongMap!4905)

(assert (=> b!374585 (= lt!172773 (+!814 lt!172774 lt!172782))))

(declare-fun lt!172779 () Unit!11534)

(declare-fun addCommutativeForDiffKeys!237 (ListLongMap!4905 (_ BitVec 64) V!12999 (_ BitVec 64) V!12999) Unit!11534)

(assert (=> b!374585 (= lt!172779 (addCommutativeForDiffKeys!237 lt!172777 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172766 () tuple2!5992)

(assert (=> b!374585 (= lt!172769 (+!814 lt!172772 lt!172766))))

(declare-fun lt!172780 () tuple2!5992)

(assert (=> b!374585 (= lt!172772 (+!814 lt!172775 lt!172780))))

(declare-fun lt!172778 () ListLongMap!4905)

(assert (=> b!374585 (= lt!172776 lt!172778)))

(assert (=> b!374585 (= lt!172778 (+!814 lt!172774 lt!172766))))

(assert (=> b!374585 (= lt!172774 (+!814 lt!172777 lt!172780))))

(assert (=> b!374585 (= lt!172769 (+!814 (+!814 lt!172781 lt!172780) lt!172766))))

(assert (=> b!374585 (= lt!172766 (tuple2!5993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374585 (= lt!172780 (tuple2!5993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14946 () Bool)

(declare-fun mapRes!14946 () Bool)

(declare-fun tp!29535 () Bool)

(assert (=> mapNonEmpty!14946 (= mapRes!14946 (and tp!29535 e!228272))))

(declare-fun mapValue!14946 () ValueCell!4117)

(declare-fun mapRest!14946 () (Array (_ BitVec 32) ValueCell!4117))

(declare-fun mapKey!14946 () (_ BitVec 32))

(assert (=> mapNonEmpty!14946 (= (arr!10359 _values!506) (store mapRest!14946 mapKey!14946 mapValue!14946))))

(declare-fun mapIsEmpty!14946 () Bool)

(assert (=> mapIsEmpty!14946 mapRes!14946))

(declare-fun b!374586 () Bool)

(assert (=> b!374586 (= e!228278 (and e!228275 mapRes!14946))))

(declare-fun condMapEmpty!14946 () Bool)

(declare-fun mapDefault!14946 () ValueCell!4117)

