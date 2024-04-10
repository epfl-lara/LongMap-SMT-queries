; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37082 () Bool)

(assert start!37082)

(declare-fun b_free!8209 () Bool)

(declare-fun b_next!8209 () Bool)

(assert (=> start!37082 (= b_free!8209 (not b_next!8209))))

(declare-fun tp!29342 () Bool)

(declare-fun b_and!15451 () Bool)

(assert (=> start!37082 (= tp!29342 b_and!15451)))

(declare-fun mapNonEmpty!14850 () Bool)

(declare-fun mapRes!14850 () Bool)

(declare-fun tp!29343 () Bool)

(declare-fun e!227511 () Bool)

(assert (=> mapNonEmpty!14850 (= mapRes!14850 (and tp!29343 e!227511))))

(declare-datatypes ((V!12915 0))(
  ( (V!12916 (val!4473 Int)) )
))
(declare-datatypes ((ValueCell!4085 0))(
  ( (ValueCellFull!4085 (v!6670 V!12915)) (EmptyCell!4085) )
))
(declare-fun mapRest!14850 () (Array (_ BitVec 32) ValueCell!4085))

(declare-datatypes ((array!21655 0))(
  ( (array!21656 (arr!10296 (Array (_ BitVec 32) ValueCell!4085)) (size!10648 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21655)

(declare-fun mapValue!14850 () ValueCell!4085)

(declare-fun mapKey!14850 () (_ BitVec 32))

(assert (=> mapNonEmpty!14850 (= (arr!10296 _values!506) (store mapRest!14850 mapKey!14850 mapValue!14850))))

(declare-fun b!373144 () Bool)

(declare-fun res!210113 () Bool)

(declare-fun e!227512 () Bool)

(assert (=> b!373144 (=> (not res!210113) (not e!227512))))

(declare-datatypes ((array!21657 0))(
  ( (array!21658 (arr!10297 (Array (_ BitVec 32) (_ BitVec 64))) (size!10649 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21657)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373144 (= res!210113 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14850 () Bool)

(assert (=> mapIsEmpty!14850 mapRes!14850))

(declare-fun b!373146 () Bool)

(declare-fun e!227515 () Bool)

(declare-fun tp_is_empty!8857 () Bool)

(assert (=> b!373146 (= e!227515 tp_is_empty!8857)))

(declare-fun b!373147 () Bool)

(declare-fun res!210118 () Bool)

(assert (=> b!373147 (=> (not res!210118) (not e!227512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373147 (= res!210118 (validKeyInArray!0 k!778))))

(declare-fun b!373148 () Bool)

(declare-fun res!210109 () Bool)

(declare-fun e!227510 () Bool)

(assert (=> b!373148 (=> (not res!210109) (not e!227510))))

(declare-fun lt!171168 () array!21657)

(declare-datatypes ((List!5780 0))(
  ( (Nil!5777) (Cons!5776 (h!6632 (_ BitVec 64)) (t!10930 List!5780)) )
))
(declare-fun arrayNoDuplicates!0 (array!21657 (_ BitVec 32) List!5780) Bool)

(assert (=> b!373148 (= res!210109 (arrayNoDuplicates!0 lt!171168 #b00000000000000000000000000000000 Nil!5777))))

(declare-fun b!373149 () Bool)

(assert (=> b!373149 (= e!227512 e!227510)))

(declare-fun res!210117 () Bool)

(assert (=> b!373149 (=> (not res!210117) (not e!227510))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21657 (_ BitVec 32)) Bool)

(assert (=> b!373149 (= res!210117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171168 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373149 (= lt!171168 (array!21658 (store (arr!10297 _keys!658) i!548 k!778) (size!10649 _keys!658)))))

(declare-fun b!373150 () Bool)

(declare-fun e!227513 () Bool)

(assert (=> b!373150 (= e!227510 (not e!227513))))

(declare-fun res!210119 () Bool)

(assert (=> b!373150 (=> res!210119 e!227513)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373150 (= res!210119 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5934 0))(
  ( (tuple2!5935 (_1!2978 (_ BitVec 64)) (_2!2978 V!12915)) )
))
(declare-datatypes ((List!5781 0))(
  ( (Nil!5778) (Cons!5777 (h!6633 tuple2!5934) (t!10931 List!5781)) )
))
(declare-datatypes ((ListLongMap!4847 0))(
  ( (ListLongMap!4848 (toList!2439 List!5781)) )
))
(declare-fun lt!171166 () ListLongMap!4847)

(declare-fun zeroValue!472 () V!12915)

(declare-fun minValue!472 () V!12915)

(declare-fun getCurrentListMap!1882 (array!21657 array!21655 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4847)

(assert (=> b!373150 (= lt!171166 (getCurrentListMap!1882 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171165 () array!21655)

(declare-fun lt!171163 () ListLongMap!4847)

(assert (=> b!373150 (= lt!171163 (getCurrentListMap!1882 lt!171168 lt!171165 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171159 () ListLongMap!4847)

(declare-fun lt!171157 () ListLongMap!4847)

(assert (=> b!373150 (and (= lt!171159 lt!171157) (= lt!171157 lt!171159))))

(declare-fun lt!171162 () ListLongMap!4847)

(declare-fun lt!171161 () tuple2!5934)

(declare-fun +!785 (ListLongMap!4847 tuple2!5934) ListLongMap!4847)

(assert (=> b!373150 (= lt!171157 (+!785 lt!171162 lt!171161))))

(declare-fun v!373 () V!12915)

(assert (=> b!373150 (= lt!171161 (tuple2!5935 k!778 v!373))))

(declare-datatypes ((Unit!11476 0))(
  ( (Unit!11477) )
))
(declare-fun lt!171160 () Unit!11476)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 (array!21657 array!21655 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) (_ BitVec 64) V!12915 (_ BitVec 32) Int) Unit!11476)

(assert (=> b!373150 (= lt!171160 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!716 (array!21657 array!21655 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4847)

(assert (=> b!373150 (= lt!171159 (getCurrentListMapNoExtraKeys!716 lt!171168 lt!171165 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373150 (= lt!171165 (array!21656 (store (arr!10296 _values!506) i!548 (ValueCellFull!4085 v!373)) (size!10648 _values!506)))))

(assert (=> b!373150 (= lt!171162 (getCurrentListMapNoExtraKeys!716 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373151 () Bool)

(declare-fun e!227514 () Bool)

(assert (=> b!373151 (= e!227514 (and e!227515 mapRes!14850))))

(declare-fun condMapEmpty!14850 () Bool)

(declare-fun mapDefault!14850 () ValueCell!4085)

