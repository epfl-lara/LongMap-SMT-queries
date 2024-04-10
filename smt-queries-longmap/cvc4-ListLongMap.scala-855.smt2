; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20230 () Bool)

(assert start!20230)

(declare-fun b_free!4889 () Bool)

(declare-fun b_next!4889 () Bool)

(assert (=> start!20230 (= b_free!4889 (not b_next!4889))))

(declare-fun tp!17698 () Bool)

(declare-fun b_and!11635 () Bool)

(assert (=> start!20230 (= tp!17698 b_and!11635)))

(declare-fun b!198884 () Bool)

(declare-fun res!94402 () Bool)

(declare-fun e!130649 () Bool)

(assert (=> b!198884 (=> (not res!94402) (not e!130649))))

(declare-datatypes ((array!8731 0))(
  ( (array!8732 (arr!4116 (Array (_ BitVec 32) (_ BitVec 64))) (size!4441 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8731)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5973 0))(
  ( (V!5974 (val!2417 Int)) )
))
(declare-datatypes ((ValueCell!2029 0))(
  ( (ValueCellFull!2029 (v!4387 V!5973)) (EmptyCell!2029) )
))
(declare-datatypes ((array!8733 0))(
  ( (array!8734 (arr!4117 (Array (_ BitVec 32) ValueCell!2029)) (size!4442 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8733)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198884 (= res!94402 (and (= (size!4442 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4441 _keys!825) (size!4442 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198885 () Bool)

(declare-fun res!94404 () Bool)

(assert (=> b!198885 (=> (not res!94404) (not e!130649))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198885 (= res!94404 (= (select (arr!4116 _keys!825) i!601) k!843))))

(declare-fun b!198886 () Bool)

(declare-fun res!94403 () Bool)

(assert (=> b!198886 (=> (not res!94403) (not e!130649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8731 (_ BitVec 32)) Bool)

(assert (=> b!198886 (= res!94403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198887 () Bool)

(assert (=> b!198887 (= e!130649 (not true))))

(declare-datatypes ((tuple2!3662 0))(
  ( (tuple2!3663 (_1!1842 (_ BitVec 64)) (_2!1842 V!5973)) )
))
(declare-datatypes ((List!2577 0))(
  ( (Nil!2574) (Cons!2573 (h!3215 tuple2!3662) (t!7508 List!2577)) )
))
(declare-datatypes ((ListLongMap!2575 0))(
  ( (ListLongMap!2576 (toList!1303 List!2577)) )
))
(declare-fun lt!98079 () ListLongMap!2575)

(declare-fun lt!98078 () ListLongMap!2575)

(assert (=> b!198887 (and (= lt!98079 lt!98078) (= lt!98078 lt!98079))))

(declare-fun lt!98076 () ListLongMap!2575)

(declare-fun v!520 () V!5973)

(declare-fun +!330 (ListLongMap!2575 tuple2!3662) ListLongMap!2575)

(assert (=> b!198887 (= lt!98078 (+!330 lt!98076 (tuple2!3663 k!843 v!520)))))

(declare-datatypes ((Unit!5962 0))(
  ( (Unit!5963) )
))
(declare-fun lt!98077 () Unit!5962)

(declare-fun zeroValue!615 () V!5973)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5973)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 (array!8731 array!8733 (_ BitVec 32) (_ BitVec 32) V!5973 V!5973 (_ BitVec 32) (_ BitVec 64) V!5973 (_ BitVec 32) Int) Unit!5962)

(assert (=> b!198887 (= lt!98077 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!268 (array!8731 array!8733 (_ BitVec 32) (_ BitVec 32) V!5973 V!5973 (_ BitVec 32) Int) ListLongMap!2575)

(assert (=> b!198887 (= lt!98079 (getCurrentListMapNoExtraKeys!268 _keys!825 (array!8734 (store (arr!4117 _values!649) i!601 (ValueCellFull!2029 v!520)) (size!4442 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198887 (= lt!98076 (getCurrentListMapNoExtraKeys!268 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198888 () Bool)

(declare-fun res!94405 () Bool)

(assert (=> b!198888 (=> (not res!94405) (not e!130649))))

(declare-datatypes ((List!2578 0))(
  ( (Nil!2575) (Cons!2574 (h!3216 (_ BitVec 64)) (t!7509 List!2578)) )
))
(declare-fun arrayNoDuplicates!0 (array!8731 (_ BitVec 32) List!2578) Bool)

(assert (=> b!198888 (= res!94405 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2575))))

(declare-fun b!198889 () Bool)

(declare-fun res!94400 () Bool)

(assert (=> b!198889 (=> (not res!94400) (not e!130649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198889 (= res!94400 (validKeyInArray!0 k!843))))

(declare-fun b!198890 () Bool)

(declare-fun res!94399 () Bool)

(assert (=> b!198890 (=> (not res!94399) (not e!130649))))

(assert (=> b!198890 (= res!94399 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4441 _keys!825))))))

(declare-fun b!198891 () Bool)

(declare-fun e!130647 () Bool)

(declare-fun e!130648 () Bool)

(declare-fun mapRes!8186 () Bool)

(assert (=> b!198891 (= e!130647 (and e!130648 mapRes!8186))))

(declare-fun condMapEmpty!8186 () Bool)

(declare-fun mapDefault!8186 () ValueCell!2029)

