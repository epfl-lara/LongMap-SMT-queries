; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37194 () Bool)

(assert start!37194)

(declare-fun b_free!8321 () Bool)

(declare-fun b_next!8321 () Bool)

(assert (=> start!37194 (= b_free!8321 (not b_next!8321))))

(declare-fun tp!29678 () Bool)

(declare-fun b_and!15563 () Bool)

(assert (=> start!37194 (= tp!29678 b_and!15563)))

(declare-fun b!375657 () Bool)

(declare-fun res!212127 () Bool)

(declare-fun e!228850 () Bool)

(assert (=> b!375657 (=> (not res!212127) (not e!228850))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13063 0))(
  ( (V!13064 (val!4529 Int)) )
))
(declare-datatypes ((ValueCell!4141 0))(
  ( (ValueCellFull!4141 (v!6726 V!13063)) (EmptyCell!4141) )
))
(declare-datatypes ((array!21873 0))(
  ( (array!21874 (arr!10405 (Array (_ BitVec 32) ValueCell!4141)) (size!10757 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21873)

(declare-datatypes ((array!21875 0))(
  ( (array!21876 (arr!10406 (Array (_ BitVec 32) (_ BitVec 64))) (size!10758 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21875)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375657 (= res!212127 (and (= (size!10757 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10758 _keys!658) (size!10757 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375658 () Bool)

(declare-fun res!212129 () Bool)

(assert (=> b!375658 (=> (not res!212129) (not e!228850))))

(declare-datatypes ((List!5870 0))(
  ( (Nil!5867) (Cons!5866 (h!6722 (_ BitVec 64)) (t!11020 List!5870)) )
))
(declare-fun arrayNoDuplicates!0 (array!21875 (_ BitVec 32) List!5870) Bool)

(assert (=> b!375658 (= res!212129 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5867))))

(declare-fun b!375659 () Bool)

(declare-fun e!228847 () Bool)

(assert (=> b!375659 (= e!228850 e!228847)))

(declare-fun res!212122 () Bool)

(assert (=> b!375659 (=> (not res!212122) (not e!228847))))

(declare-fun lt!173995 () array!21875)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21875 (_ BitVec 32)) Bool)

(assert (=> b!375659 (= res!212122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173995 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375659 (= lt!173995 (array!21876 (store (arr!10406 _keys!658) i!548 k!778) (size!10758 _keys!658)))))

(declare-fun b!375660 () Bool)

(declare-fun e!228854 () Bool)

(assert (=> b!375660 (= e!228847 (not e!228854))))

(declare-fun res!212126 () Bool)

(assert (=> b!375660 (=> res!212126 e!228854)))

(assert (=> b!375660 (= res!212126 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6028 0))(
  ( (tuple2!6029 (_1!3025 (_ BitVec 64)) (_2!3025 V!13063)) )
))
(declare-datatypes ((List!5871 0))(
  ( (Nil!5868) (Cons!5867 (h!6723 tuple2!6028) (t!11021 List!5871)) )
))
(declare-datatypes ((ListLongMap!4941 0))(
  ( (ListLongMap!4942 (toList!2486 List!5871)) )
))
(declare-fun lt!174004 () ListLongMap!4941)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13063)

(declare-fun minValue!472 () V!13063)

(declare-fun getCurrentListMap!1921 (array!21875 array!21873 (_ BitVec 32) (_ BitVec 32) V!13063 V!13063 (_ BitVec 32) Int) ListLongMap!4941)

(assert (=> b!375660 (= lt!174004 (getCurrentListMap!1921 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173991 () array!21873)

(declare-fun lt!174003 () ListLongMap!4941)

(assert (=> b!375660 (= lt!174003 (getCurrentListMap!1921 lt!173995 lt!173991 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174000 () ListLongMap!4941)

(declare-fun lt!173996 () ListLongMap!4941)

(assert (=> b!375660 (and (= lt!174000 lt!173996) (= lt!173996 lt!174000))))

(declare-fun lt!173993 () ListLongMap!4941)

(declare-fun lt!173998 () tuple2!6028)

(declare-fun +!832 (ListLongMap!4941 tuple2!6028) ListLongMap!4941)

(assert (=> b!375660 (= lt!173996 (+!832 lt!173993 lt!173998))))

(declare-fun v!373 () V!13063)

(assert (=> b!375660 (= lt!173998 (tuple2!6029 k!778 v!373))))

(declare-datatypes ((Unit!11570 0))(
  ( (Unit!11571) )
))
(declare-fun lt!173990 () Unit!11570)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!79 (array!21875 array!21873 (_ BitVec 32) (_ BitVec 32) V!13063 V!13063 (_ BitVec 32) (_ BitVec 64) V!13063 (_ BitVec 32) Int) Unit!11570)

(assert (=> b!375660 (= lt!173990 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!79 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!755 (array!21875 array!21873 (_ BitVec 32) (_ BitVec 32) V!13063 V!13063 (_ BitVec 32) Int) ListLongMap!4941)

(assert (=> b!375660 (= lt!174000 (getCurrentListMapNoExtraKeys!755 lt!173995 lt!173991 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375660 (= lt!173991 (array!21874 (store (arr!10405 _values!506) i!548 (ValueCellFull!4141 v!373)) (size!10757 _values!506)))))

(assert (=> b!375660 (= lt!173993 (getCurrentListMapNoExtraKeys!755 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15018 () Bool)

(declare-fun mapRes!15018 () Bool)

(declare-fun tp!29679 () Bool)

(declare-fun e!228853 () Bool)

(assert (=> mapNonEmpty!15018 (= mapRes!15018 (and tp!29679 e!228853))))

(declare-fun mapValue!15018 () ValueCell!4141)

(declare-fun mapRest!15018 () (Array (_ BitVec 32) ValueCell!4141))

(declare-fun mapKey!15018 () (_ BitVec 32))

(assert (=> mapNonEmpty!15018 (= (arr!10405 _values!506) (store mapRest!15018 mapKey!15018 mapValue!15018))))

(declare-fun b!375661 () Bool)

(declare-fun e!228848 () Bool)

(declare-fun e!228849 () Bool)

(assert (=> b!375661 (= e!228848 (and e!228849 mapRes!15018))))

(declare-fun condMapEmpty!15018 () Bool)

(declare-fun mapDefault!15018 () ValueCell!4141)

