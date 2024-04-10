; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37260 () Bool)

(assert start!37260)

(declare-fun b_free!8387 () Bool)

(declare-fun b_next!8387 () Bool)

(assert (=> start!37260 (= b_free!8387 (not b_next!8387))))

(declare-fun tp!29877 () Bool)

(declare-fun b_and!15629 () Bool)

(assert (=> start!37260 (= tp!29877 b_and!15629)))

(declare-fun res!213326 () Bool)

(declare-fun e!229646 () Bool)

(assert (=> start!37260 (=> (not res!213326) (not e!229646))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37260 (= res!213326 (validMask!0 mask!970))))

(assert (=> start!37260 e!229646))

(declare-datatypes ((V!13151 0))(
  ( (V!13152 (val!4562 Int)) )
))
(declare-datatypes ((ValueCell!4174 0))(
  ( (ValueCellFull!4174 (v!6759 V!13151)) (EmptyCell!4174) )
))
(declare-datatypes ((array!21999 0))(
  ( (array!22000 (arr!10468 (Array (_ BitVec 32) ValueCell!4174)) (size!10820 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21999)

(declare-fun e!229640 () Bool)

(declare-fun array_inv!7714 (array!21999) Bool)

(assert (=> start!37260 (and (array_inv!7714 _values!506) e!229640)))

(assert (=> start!37260 tp!29877))

(assert (=> start!37260 true))

(declare-fun tp_is_empty!9035 () Bool)

(assert (=> start!37260 tp_is_empty!9035))

(declare-datatypes ((array!22001 0))(
  ( (array!22002 (arr!10469 (Array (_ BitVec 32) (_ BitVec 64))) (size!10821 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22001)

(declare-fun array_inv!7715 (array!22001) Bool)

(assert (=> start!37260 (array_inv!7715 _keys!658)))

(declare-fun b!377151 () Bool)

(declare-fun e!229639 () Bool)

(assert (=> b!377151 (= e!229639 tp_is_empty!9035)))

(declare-fun b!377152 () Bool)

(declare-fun e!229641 () Bool)

(assert (=> b!377152 (= e!229641 true)))

(declare-datatypes ((tuple2!6078 0))(
  ( (tuple2!6079 (_1!3050 (_ BitVec 64)) (_2!3050 V!13151)) )
))
(declare-datatypes ((List!5920 0))(
  ( (Nil!5917) (Cons!5916 (h!6772 tuple2!6078) (t!11070 List!5920)) )
))
(declare-datatypes ((ListLongMap!4991 0))(
  ( (ListLongMap!4992 (toList!2511 List!5920)) )
))
(declare-fun lt!175257 () ListLongMap!4991)

(declare-fun lt!175248 () ListLongMap!4991)

(declare-fun lt!175249 () tuple2!6078)

(declare-fun +!857 (ListLongMap!4991 tuple2!6078) ListLongMap!4991)

(assert (=> b!377152 (= lt!175257 (+!857 lt!175248 lt!175249))))

(declare-fun v!373 () V!13151)

(declare-datatypes ((Unit!11618 0))(
  ( (Unit!11619) )
))
(declare-fun lt!175250 () Unit!11618)

(declare-fun lt!175256 () ListLongMap!4991)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13151)

(declare-fun addCommutativeForDiffKeys!267 (ListLongMap!4991 (_ BitVec 64) V!13151 (_ BitVec 64) V!13151) Unit!11618)

(assert (=> b!377152 (= lt!175250 (addCommutativeForDiffKeys!267 lt!175256 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377153 () Bool)

(declare-fun e!229644 () Bool)

(assert (=> b!377153 (= e!229644 tp_is_empty!9035)))

(declare-fun b!377154 () Bool)

(declare-fun res!213324 () Bool)

(assert (=> b!377154 (=> (not res!213324) (not e!229646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22001 (_ BitVec 32)) Bool)

(assert (=> b!377154 (= res!213324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377155 () Bool)

(declare-fun e!229645 () Bool)

(declare-fun e!229643 () Bool)

(assert (=> b!377155 (= e!229645 (not e!229643))))

(declare-fun res!213322 () Bool)

(assert (=> b!377155 (=> res!213322 e!229643)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377155 (= res!213322 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!175245 () ListLongMap!4991)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13151)

(declare-fun getCurrentListMap!1943 (array!22001 array!21999 (_ BitVec 32) (_ BitVec 32) V!13151 V!13151 (_ BitVec 32) Int) ListLongMap!4991)

(assert (=> b!377155 (= lt!175245 (getCurrentListMap!1943 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175252 () array!22001)

(declare-fun lt!175255 () ListLongMap!4991)

(declare-fun lt!175251 () array!21999)

(assert (=> b!377155 (= lt!175255 (getCurrentListMap!1943 lt!175252 lt!175251 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175247 () ListLongMap!4991)

(declare-fun lt!175246 () ListLongMap!4991)

(assert (=> b!377155 (and (= lt!175247 lt!175246) (= lt!175246 lt!175247))))

(assert (=> b!377155 (= lt!175246 (+!857 lt!175256 lt!175249))))

(assert (=> b!377155 (= lt!175249 (tuple2!6079 k!778 v!373))))

(declare-fun lt!175254 () Unit!11618)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 (array!22001 array!21999 (_ BitVec 32) (_ BitVec 32) V!13151 V!13151 (_ BitVec 32) (_ BitVec 64) V!13151 (_ BitVec 32) Int) Unit!11618)

(assert (=> b!377155 (= lt!175254 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!777 (array!22001 array!21999 (_ BitVec 32) (_ BitVec 32) V!13151 V!13151 (_ BitVec 32) Int) ListLongMap!4991)

(assert (=> b!377155 (= lt!175247 (getCurrentListMapNoExtraKeys!777 lt!175252 lt!175251 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377155 (= lt!175251 (array!22000 (store (arr!10468 _values!506) i!548 (ValueCellFull!4174 v!373)) (size!10820 _values!506)))))

(assert (=> b!377155 (= lt!175256 (getCurrentListMapNoExtraKeys!777 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377156 () Bool)

(declare-fun res!213321 () Bool)

(assert (=> b!377156 (=> (not res!213321) (not e!229646))))

(assert (=> b!377156 (= res!213321 (and (= (size!10820 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10821 _keys!658) (size!10820 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377157 () Bool)

(assert (=> b!377157 (= e!229643 e!229641)))

(declare-fun res!213315 () Bool)

(assert (=> b!377157 (=> res!213315 e!229641)))

(assert (=> b!377157 (= res!213315 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377157 (= lt!175255 lt!175257)))

(declare-fun lt!175253 () tuple2!6078)

(assert (=> b!377157 (= lt!175257 (+!857 lt!175246 lt!175253))))

(assert (=> b!377157 (= lt!175245 lt!175248)))

(assert (=> b!377157 (= lt!175248 (+!857 lt!175256 lt!175253))))

(assert (=> b!377157 (= lt!175255 (+!857 lt!175247 lt!175253))))

(assert (=> b!377157 (= lt!175253 (tuple2!6079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377158 () Bool)

(declare-fun res!213325 () Bool)

(assert (=> b!377158 (=> (not res!213325) (not e!229646))))

(assert (=> b!377158 (= res!213325 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10821 _keys!658))))))

(declare-fun mapIsEmpty!15117 () Bool)

(declare-fun mapRes!15117 () Bool)

(assert (=> mapIsEmpty!15117 mapRes!15117))

(declare-fun b!377159 () Bool)

(assert (=> b!377159 (= e!229640 (and e!229644 mapRes!15117))))

(declare-fun condMapEmpty!15117 () Bool)

(declare-fun mapDefault!15117 () ValueCell!4174)

