; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38002 () Bool)

(assert start!38002)

(declare-fun b_free!8971 () Bool)

(declare-fun b_next!8971 () Bool)

(assert (=> start!38002 (= b_free!8971 (not b_next!8971))))

(declare-fun tp!31683 () Bool)

(declare-fun b_and!16285 () Bool)

(assert (=> start!38002 (= tp!31683 b_and!16285)))

(declare-fun b!391045 () Bool)

(declare-fun e!236862 () Bool)

(declare-fun tp_is_empty!9643 () Bool)

(assert (=> b!391045 (= e!236862 tp_is_empty!9643)))

(declare-fun b!391046 () Bool)

(declare-fun e!236863 () Bool)

(declare-fun e!236865 () Bool)

(assert (=> b!391046 (= e!236863 e!236865)))

(declare-fun res!223802 () Bool)

(assert (=> b!391046 (=> (not res!223802) (not e!236865))))

(declare-datatypes ((array!23187 0))(
  ( (array!23188 (arr!11056 (Array (_ BitVec 32) (_ BitVec 64))) (size!11408 (_ BitVec 32))) )
))
(declare-fun lt!184430 () array!23187)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23187 (_ BitVec 32)) Bool)

(assert (=> b!391046 (= res!223802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184430 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23187)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391046 (= lt!184430 (array!23188 (store (arr!11056 _keys!658) i!548 k!778) (size!11408 _keys!658)))))

(declare-fun b!391047 () Bool)

(declare-fun res!223811 () Bool)

(assert (=> b!391047 (=> (not res!223811) (not e!236865))))

(declare-datatypes ((List!6407 0))(
  ( (Nil!6404) (Cons!6403 (h!7259 (_ BitVec 64)) (t!11569 List!6407)) )
))
(declare-fun arrayNoDuplicates!0 (array!23187 (_ BitVec 32) List!6407) Bool)

(assert (=> b!391047 (= res!223811 (arrayNoDuplicates!0 lt!184430 #b00000000000000000000000000000000 Nil!6404))))

(declare-fun b!391048 () Bool)

(declare-datatypes ((V!13963 0))(
  ( (V!13964 (val!4866 Int)) )
))
(declare-datatypes ((tuple2!6552 0))(
  ( (tuple2!6553 (_1!3287 (_ BitVec 64)) (_2!3287 V!13963)) )
))
(declare-fun lt!184427 () tuple2!6552)

(declare-datatypes ((List!6408 0))(
  ( (Nil!6405) (Cons!6404 (h!7260 tuple2!6552) (t!11570 List!6408)) )
))
(declare-datatypes ((ListLongMap!5465 0))(
  ( (ListLongMap!5466 (toList!2748 List!6408)) )
))
(declare-fun lt!184428 () ListLongMap!5465)

(declare-fun lt!184425 () ListLongMap!5465)

(declare-fun e!236858 () Bool)

(declare-fun +!1043 (ListLongMap!5465 tuple2!6552) ListLongMap!5465)

(assert (=> b!391048 (= e!236858 (= lt!184428 (+!1043 lt!184425 lt!184427)))))

(declare-fun b!391049 () Bool)

(declare-fun res!223813 () Bool)

(assert (=> b!391049 (=> (not res!223813) (not e!236863))))

(assert (=> b!391049 (= res!223813 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6404))))

(declare-fun b!391050 () Bool)

(declare-fun res!223807 () Bool)

(assert (=> b!391050 (=> (not res!223807) (not e!236863))))

(assert (=> b!391050 (= res!223807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391051 () Bool)

(declare-fun e!236859 () Bool)

(assert (=> b!391051 (= e!236865 (not e!236859))))

(declare-fun res!223810 () Bool)

(assert (=> b!391051 (=> res!223810 e!236859)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391051 (= res!223810 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4478 0))(
  ( (ValueCellFull!4478 (v!7087 V!13963)) (EmptyCell!4478) )
))
(declare-datatypes ((array!23189 0))(
  ( (array!23190 (arr!11057 (Array (_ BitVec 32) ValueCell!4478)) (size!11409 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23189)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13963)

(declare-fun lt!184426 () ListLongMap!5465)

(declare-fun minValue!472 () V!13963)

(declare-fun getCurrentListMap!2093 (array!23187 array!23189 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5465)

(assert (=> b!391051 (= lt!184426 (getCurrentListMap!2093 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184431 () array!23189)

(assert (=> b!391051 (= lt!184428 (getCurrentListMap!2093 lt!184430 lt!184431 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184432 () ListLongMap!5465)

(assert (=> b!391051 (and (= lt!184432 lt!184425) (= lt!184425 lt!184432))))

(declare-fun v!373 () V!13963)

(declare-fun lt!184429 () ListLongMap!5465)

(assert (=> b!391051 (= lt!184425 (+!1043 lt!184429 (tuple2!6553 k!778 v!373)))))

(declare-datatypes ((Unit!11968 0))(
  ( (Unit!11969) )
))
(declare-fun lt!184424 () Unit!11968)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 (array!23187 array!23189 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) (_ BitVec 64) V!13963 (_ BitVec 32) Int) Unit!11968)

(assert (=> b!391051 (= lt!184424 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!973 (array!23187 array!23189 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5465)

(assert (=> b!391051 (= lt!184432 (getCurrentListMapNoExtraKeys!973 lt!184430 lt!184431 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391051 (= lt!184431 (array!23190 (store (arr!11057 _values!506) i!548 (ValueCellFull!4478 v!373)) (size!11409 _values!506)))))

(assert (=> b!391051 (= lt!184429 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391052 () Bool)

(declare-fun res!223809 () Bool)

(assert (=> b!391052 (=> (not res!223809) (not e!236863))))

(assert (=> b!391052 (= res!223809 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11408 _keys!658))))))

(declare-fun b!391053 () Bool)

(declare-fun res!223804 () Bool)

(assert (=> b!391053 (=> (not res!223804) (not e!236858))))

(assert (=> b!391053 (= res!223804 (= lt!184426 (+!1043 lt!184429 lt!184427)))))

(declare-fun b!391054 () Bool)

(declare-fun e!236861 () Bool)

(declare-fun e!236860 () Bool)

(declare-fun mapRes!16047 () Bool)

(assert (=> b!391054 (= e!236861 (and e!236860 mapRes!16047))))

(declare-fun condMapEmpty!16047 () Bool)

(declare-fun mapDefault!16047 () ValueCell!4478)

