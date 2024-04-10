; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38148 () Bool)

(assert start!38148)

(declare-fun b_free!9029 () Bool)

(declare-fun b_next!9029 () Bool)

(assert (=> start!38148 (= b_free!9029 (not b_next!9029))))

(declare-fun tp!31868 () Bool)

(declare-fun b_and!16391 () Bool)

(assert (=> start!38148 (= tp!31868 b_and!16391)))

(declare-fun b!393164 () Bool)

(declare-fun e!238064 () Bool)

(declare-fun e!238063 () Bool)

(assert (=> b!393164 (= e!238064 (not e!238063))))

(declare-fun res!225222 () Bool)

(assert (=> b!393164 (=> res!225222 e!238063)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393164 (= res!225222 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14039 0))(
  ( (V!14040 (val!4895 Int)) )
))
(declare-datatypes ((ValueCell!4507 0))(
  ( (ValueCellFull!4507 (v!7132 V!14039)) (EmptyCell!4507) )
))
(declare-datatypes ((array!23309 0))(
  ( (array!23310 (arr!11113 (Array (_ BitVec 32) ValueCell!4507)) (size!11465 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23309)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6604 0))(
  ( (tuple2!6605 (_1!3313 (_ BitVec 64)) (_2!3313 V!14039)) )
))
(declare-datatypes ((List!6457 0))(
  ( (Nil!6454) (Cons!6453 (h!7309 tuple2!6604) (t!11627 List!6457)) )
))
(declare-datatypes ((ListLongMap!5517 0))(
  ( (ListLongMap!5518 (toList!2774 List!6457)) )
))
(declare-fun lt!185996 () ListLongMap!5517)

(declare-fun zeroValue!472 () V!14039)

(declare-datatypes ((array!23311 0))(
  ( (array!23312 (arr!11114 (Array (_ BitVec 32) (_ BitVec 64))) (size!11466 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23311)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14039)

(declare-fun getCurrentListMap!2116 (array!23311 array!23309 (_ BitVec 32) (_ BitVec 32) V!14039 V!14039 (_ BitVec 32) Int) ListLongMap!5517)

(assert (=> b!393164 (= lt!185996 (getCurrentListMap!2116 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185992 () array!23309)

(declare-fun lt!185990 () array!23311)

(declare-fun lt!185988 () ListLongMap!5517)

(assert (=> b!393164 (= lt!185988 (getCurrentListMap!2116 lt!185990 lt!185992 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185991 () ListLongMap!5517)

(declare-fun lt!185998 () ListLongMap!5517)

(assert (=> b!393164 (and (= lt!185991 lt!185998) (= lt!185998 lt!185991))))

(declare-fun lt!185993 () ListLongMap!5517)

(declare-fun lt!185987 () tuple2!6604)

(declare-fun +!1069 (ListLongMap!5517 tuple2!6604) ListLongMap!5517)

(assert (=> b!393164 (= lt!185998 (+!1069 lt!185993 lt!185987))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!14039)

(assert (=> b!393164 (= lt!185987 (tuple2!6605 k!778 v!373))))

(declare-datatypes ((Unit!12026 0))(
  ( (Unit!12027) )
))
(declare-fun lt!185997 () Unit!12026)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 (array!23311 array!23309 (_ BitVec 32) (_ BitVec 32) V!14039 V!14039 (_ BitVec 32) (_ BitVec 64) V!14039 (_ BitVec 32) Int) Unit!12026)

(assert (=> b!393164 (= lt!185997 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!996 (array!23311 array!23309 (_ BitVec 32) (_ BitVec 32) V!14039 V!14039 (_ BitVec 32) Int) ListLongMap!5517)

(assert (=> b!393164 (= lt!185991 (getCurrentListMapNoExtraKeys!996 lt!185990 lt!185992 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393164 (= lt!185992 (array!23310 (store (arr!11113 _values!506) i!548 (ValueCellFull!4507 v!373)) (size!11465 _values!506)))))

(assert (=> b!393164 (= lt!185993 (getCurrentListMapNoExtraKeys!996 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393165 () Bool)

(declare-fun res!225221 () Bool)

(declare-fun e!238067 () Bool)

(assert (=> b!393165 (=> (not res!225221) (not e!238067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23311 (_ BitVec 32)) Bool)

(assert (=> b!393165 (= res!225221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!16146 () Bool)

(declare-fun mapRes!16146 () Bool)

(assert (=> mapIsEmpty!16146 mapRes!16146))

(declare-fun b!393166 () Bool)

(declare-fun res!225216 () Bool)

(assert (=> b!393166 (=> (not res!225216) (not e!238067))))

(declare-fun arrayContainsKey!0 (array!23311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393166 (= res!225216 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393167 () Bool)

(declare-fun res!225217 () Bool)

(assert (=> b!393167 (=> (not res!225217) (not e!238067))))

(assert (=> b!393167 (= res!225217 (or (= (select (arr!11114 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11114 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393168 () Bool)

(declare-fun res!225214 () Bool)

(assert (=> b!393168 (=> (not res!225214) (not e!238067))))

(declare-datatypes ((List!6458 0))(
  ( (Nil!6455) (Cons!6454 (h!7310 (_ BitVec 64)) (t!11628 List!6458)) )
))
(declare-fun arrayNoDuplicates!0 (array!23311 (_ BitVec 32) List!6458) Bool)

(assert (=> b!393168 (= res!225214 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6455))))

(declare-fun b!393170 () Bool)

(declare-fun res!225219 () Bool)

(assert (=> b!393170 (=> (not res!225219) (not e!238067))))

(assert (=> b!393170 (= res!225219 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _keys!658))))))

(declare-fun b!393171 () Bool)

(declare-fun res!225213 () Bool)

(assert (=> b!393171 (=> (not res!225213) (not e!238067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393171 (= res!225213 (validKeyInArray!0 k!778))))

(declare-fun b!393172 () Bool)

(declare-fun e!238069 () Bool)

(assert (=> b!393172 (= e!238069 (bvslt i!548 (size!11465 _values!506)))))

(declare-fun lt!185986 () ListLongMap!5517)

(declare-fun lt!185989 () ListLongMap!5517)

(assert (=> b!393172 (= lt!185986 (+!1069 lt!185989 lt!185987))))

(declare-fun lt!185995 () Unit!12026)

(declare-fun addCommutativeForDiffKeys!347 (ListLongMap!5517 (_ BitVec 64) V!14039 (_ BitVec 64) V!14039) Unit!12026)

(assert (=> b!393172 (= lt!185995 (addCommutativeForDiffKeys!347 lt!185993 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!16146 () Bool)

(declare-fun tp!31869 () Bool)

(declare-fun e!238068 () Bool)

(assert (=> mapNonEmpty!16146 (= mapRes!16146 (and tp!31869 e!238068))))

(declare-fun mapValue!16146 () ValueCell!4507)

(declare-fun mapKey!16146 () (_ BitVec 32))

(declare-fun mapRest!16146 () (Array (_ BitVec 32) ValueCell!4507))

(assert (=> mapNonEmpty!16146 (= (arr!11113 _values!506) (store mapRest!16146 mapKey!16146 mapValue!16146))))

(declare-fun b!393173 () Bool)

(declare-fun tp_is_empty!9701 () Bool)

(assert (=> b!393173 (= e!238068 tp_is_empty!9701)))

(declare-fun b!393174 () Bool)

(declare-fun e!238065 () Bool)

(declare-fun e!238062 () Bool)

(assert (=> b!393174 (= e!238065 (and e!238062 mapRes!16146))))

(declare-fun condMapEmpty!16146 () Bool)

(declare-fun mapDefault!16146 () ValueCell!4507)

