; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39986 () Bool)

(assert start!39986)

(declare-fun b_free!10253 () Bool)

(declare-fun b_next!10253 () Bool)

(assert (=> start!39986 (= b_free!10253 (not b_next!10253))))

(declare-fun tp!36288 () Bool)

(declare-fun b_and!18165 () Bool)

(assert (=> start!39986 (= tp!36288 b_and!18165)))

(declare-fun b!435044 () Bool)

(declare-fun res!256265 () Bool)

(declare-fun e!257057 () Bool)

(assert (=> b!435044 (=> (not res!256265) (not e!257057))))

(declare-datatypes ((array!26641 0))(
  ( (array!26642 (arr!12770 (Array (_ BitVec 32) (_ BitVec 64))) (size!13122 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26641)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435044 (= res!256265 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!435045 () Bool)

(declare-fun res!256273 () Bool)

(declare-fun e!257056 () Bool)

(assert (=> b!435045 (=> (not res!256273) (not e!257056))))

(declare-fun lt!200203 () array!26641)

(declare-datatypes ((List!7611 0))(
  ( (Nil!7608) (Cons!7607 (h!8463 (_ BitVec 64)) (t!13313 List!7611)) )
))
(declare-fun arrayNoDuplicates!0 (array!26641 (_ BitVec 32) List!7611) Bool)

(assert (=> b!435045 (= res!256273 (arrayNoDuplicates!0 lt!200203 #b00000000000000000000000000000000 Nil!7608))))

(declare-fun b!435046 () Bool)

(declare-fun res!256262 () Bool)

(assert (=> b!435046 (=> (not res!256262) (not e!257057))))

(assert (=> b!435046 (= res!256262 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7608))))

(declare-fun b!435047 () Bool)

(declare-fun e!257052 () Bool)

(assert (=> b!435047 (= e!257052 true)))

(declare-datatypes ((V!16311 0))(
  ( (V!16312 (val!5747 Int)) )
))
(declare-datatypes ((tuple2!7608 0))(
  ( (tuple2!7609 (_1!3815 (_ BitVec 64)) (_2!3815 V!16311)) )
))
(declare-fun lt!200199 () tuple2!7608)

(declare-datatypes ((List!7612 0))(
  ( (Nil!7609) (Cons!7608 (h!8464 tuple2!7608) (t!13314 List!7612)) )
))
(declare-datatypes ((ListLongMap!6521 0))(
  ( (ListLongMap!6522 (toList!3276 List!7612)) )
))
(declare-fun lt!200197 () ListLongMap!6521)

(declare-fun lt!200204 () ListLongMap!6521)

(declare-fun lt!200206 () tuple2!7608)

(declare-fun +!1424 (ListLongMap!6521 tuple2!7608) ListLongMap!6521)

(assert (=> b!435047 (= lt!200204 (+!1424 (+!1424 lt!200197 lt!200199) lt!200206))))

(declare-fun lt!200198 () V!16311)

(declare-datatypes ((Unit!12911 0))(
  ( (Unit!12912) )
))
(declare-fun lt!200201 () Unit!12911)

(declare-fun v!412 () V!16311)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!408 (ListLongMap!6521 (_ BitVec 64) V!16311 (_ BitVec 64) V!16311) Unit!12911)

(assert (=> b!435047 (= lt!200201 (addCommutativeForDiffKeys!408 lt!200197 k!794 v!412 (select (arr!12770 _keys!709) from!863) lt!200198))))

(declare-fun b!435048 () Bool)

(declare-fun e!257055 () Bool)

(assert (=> b!435048 (= e!257056 e!257055)))

(declare-fun res!256268 () Bool)

(assert (=> b!435048 (=> (not res!256268) (not e!257055))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435048 (= res!256268 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16311)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5359 0))(
  ( (ValueCellFull!5359 (v!7994 V!16311)) (EmptyCell!5359) )
))
(declare-datatypes ((array!26643 0))(
  ( (array!26644 (arr!12771 (Array (_ BitVec 32) ValueCell!5359)) (size!13123 (_ BitVec 32))) )
))
(declare-fun lt!200208 () array!26643)

(declare-fun zeroValue!515 () V!16311)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200205 () ListLongMap!6521)

(declare-fun getCurrentListMapNoExtraKeys!1467 (array!26641 array!26643 (_ BitVec 32) (_ BitVec 32) V!16311 V!16311 (_ BitVec 32) Int) ListLongMap!6521)

(assert (=> b!435048 (= lt!200205 (getCurrentListMapNoExtraKeys!1467 lt!200203 lt!200208 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26643)

(assert (=> b!435048 (= lt!200208 (array!26644 (store (arr!12771 _values!549) i!563 (ValueCellFull!5359 v!412)) (size!13123 _values!549)))))

(declare-fun lt!200209 () ListLongMap!6521)

(assert (=> b!435048 (= lt!200209 (getCurrentListMapNoExtraKeys!1467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435049 () Bool)

(declare-fun e!257053 () Bool)

(declare-fun tp_is_empty!11405 () Bool)

(assert (=> b!435049 (= e!257053 tp_is_empty!11405)))

(declare-fun res!256274 () Bool)

(assert (=> start!39986 (=> (not res!256274) (not e!257057))))

(assert (=> start!39986 (= res!256274 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13122 _keys!709))))))

(assert (=> start!39986 e!257057))

(assert (=> start!39986 tp_is_empty!11405))

(assert (=> start!39986 tp!36288))

(assert (=> start!39986 true))

(declare-fun e!257059 () Bool)

(declare-fun array_inv!9284 (array!26643) Bool)

(assert (=> start!39986 (and (array_inv!9284 _values!549) e!257059)))

(declare-fun array_inv!9285 (array!26641) Bool)

(assert (=> start!39986 (array_inv!9285 _keys!709)))

(declare-fun b!435050 () Bool)

(declare-fun e!257060 () Bool)

(assert (=> b!435050 (= e!257060 tp_is_empty!11405)))

(declare-fun b!435051 () Bool)

(declare-fun res!256272 () Bool)

(assert (=> b!435051 (=> (not res!256272) (not e!257057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26641 (_ BitVec 32)) Bool)

(assert (=> b!435051 (= res!256272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435052 () Bool)

(assert (=> b!435052 (= e!257057 e!257056)))

(declare-fun res!256271 () Bool)

(assert (=> b!435052 (=> (not res!256271) (not e!257056))))

(assert (=> b!435052 (= res!256271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200203 mask!1025))))

(assert (=> b!435052 (= lt!200203 (array!26642 (store (arr!12770 _keys!709) i!563 k!794) (size!13122 _keys!709)))))

(declare-fun b!435053 () Bool)

(declare-fun res!256267 () Bool)

(assert (=> b!435053 (=> (not res!256267) (not e!257057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435053 (= res!256267 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18729 () Bool)

(declare-fun mapRes!18729 () Bool)

(assert (=> mapIsEmpty!18729 mapRes!18729))

(declare-fun b!435054 () Bool)

(declare-fun e!257058 () Unit!12911)

(declare-fun Unit!12913 () Unit!12911)

(assert (=> b!435054 (= e!257058 Unit!12913)))

(declare-fun lt!200196 () Unit!12911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12911)

(assert (=> b!435054 (= lt!200196 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435054 false))

(declare-fun b!435055 () Bool)

(declare-fun res!256261 () Bool)

(assert (=> b!435055 (=> (not res!256261) (not e!257057))))

(assert (=> b!435055 (= res!256261 (or (= (select (arr!12770 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12770 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435056 () Bool)

(declare-fun res!256275 () Bool)

(assert (=> b!435056 (=> (not res!256275) (not e!257057))))

(assert (=> b!435056 (= res!256275 (and (= (size!13123 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13122 _keys!709) (size!13123 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435057 () Bool)

(declare-fun e!257061 () Bool)

(assert (=> b!435057 (= e!257055 (not e!257061))))

(declare-fun res!256269 () Bool)

(assert (=> b!435057 (=> res!256269 e!257061)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435057 (= res!256269 (not (validKeyInArray!0 (select (arr!12770 _keys!709) from!863))))))

(declare-fun lt!200207 () ListLongMap!6521)

(declare-fun lt!200210 () ListLongMap!6521)

(assert (=> b!435057 (= lt!200207 lt!200210)))

(assert (=> b!435057 (= lt!200210 (+!1424 lt!200197 lt!200206))))

(assert (=> b!435057 (= lt!200207 (getCurrentListMapNoExtraKeys!1467 lt!200203 lt!200208 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435057 (= lt!200206 (tuple2!7609 k!794 v!412))))

(assert (=> b!435057 (= lt!200197 (getCurrentListMapNoExtraKeys!1467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200200 () Unit!12911)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!597 (array!26641 array!26643 (_ BitVec 32) (_ BitVec 32) V!16311 V!16311 (_ BitVec 32) (_ BitVec 64) V!16311 (_ BitVec 32) Int) Unit!12911)

(assert (=> b!435057 (= lt!200200 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!597 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435058 () Bool)

(declare-fun res!256263 () Bool)

(assert (=> b!435058 (=> (not res!256263) (not e!257057))))

(assert (=> b!435058 (= res!256263 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13122 _keys!709))))))

(declare-fun b!435059 () Bool)

(assert (=> b!435059 (= e!257059 (and e!257060 mapRes!18729))))

(declare-fun condMapEmpty!18729 () Bool)

(declare-fun mapDefault!18729 () ValueCell!5359)

